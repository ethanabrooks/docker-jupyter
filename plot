#! /usr/bin/env bash
volume_paths=()
other_args=()
port=8888
while getopts ":p:v:a:" opt; do
  case ${opt} in
    v )
      volume_paths+=("$OPTARG")
      ;;
    a )
      other_args+=($OPTARG)
      ;;
    p )
      port=$OPTARG
      ;;
    \? )
      other_args+=($OPTARG)
      ;;
  esac
done
shift $((OPTIND -1))

existing=$(docker ps -f name=plot$port -q)
if [[ $existing != "" ]]
then
  echo docker kill $existing 
  docker kill $existing 
fi

volume_args=()
if [[ ${#volume_paths[@]} -eq 0 ]]
then
  recent=$(docker ps -q -n 1)
  volume_paths=$(docker inspect --format='{{range .Mounts}}{{.Name}}{{end}}' $recent)
fi
volume_args=()
for v in ${volume_paths[@]}; do
  volume_args+=("-v $v:/log/")
done
my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
cmd="docker run --rm -it --name plot$port ${volume_args[@]}
${other_args[@]} -p $my_ip:$port:8888 ethanabrooks/plot"
echo $cmd
exec $cmd
