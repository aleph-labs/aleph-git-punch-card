#!/bin/sh

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -d|--directory)
    DIRECTORY="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--prefix)
    PREFIX="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--since)
    SINCE="$2"
    shift # past argument
    shift # past value
    ;;
    -u|--until)
    UNTIL="$2"
    shift # past argument
    shift # past value
    ;;
    -t|--timezone)
    TIMEZONE="$2"
    shift # past argument
    shift # past value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

SLASH=/
HYPHEN=-
SINCE_SLASH=${SINCE//./$SLASH}
SINCE_HYPHEN=${SINCE//./$HYPHEN}
UNTIL_SLASH=${UNTIL//./$SLASH}
UNTIL_HYPHEN=${UNTIL//./$HYPHEN}

# Used for debugging
# echo "DIRECTORY     = ${DIRECTORY}"       # ~/AlephProjects/Savvy/*/.git
# echo "PREFIX        = ${PREFIX}"          # Savvy
# echo "SINCE         = ${SINCE}"           # 21.09.2020
# echo "SINCE_SLASH   = ${SINCE_SLASH}"
# echo "SINCE_HYPHEN  = ${SINCE_HYPHEN}"
# echo "UNTIL         = ${UNTIL}"           # 21.09.2020
# echo "UNTIL_SLASH   = ${UNTIL_SLASH}"
# echo "UNTIL_HYPHEN  = ${UNTIL_HYPHEN}"
# echo "TIMEZONE      = ${TIMEZONE}"        # UTC+08:00

git punchcard $DIRECTORY -o "$PREFIX-$SINCE_HYPHEN-$UNTIL_HYPHEN.png" --title "$PREFIX - $SINCE_SLASH - $UNTIL_SLASH" --since $SINCE --until=$UNTIL --timezone $TIMEZONE
