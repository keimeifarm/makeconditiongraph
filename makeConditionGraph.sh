#!/bin/bash
. `dirname $0`/bin/setting.conf

# 時間出力
putNow () {
  printf `date +%Y/%m/%d_%H:%M:%S`
}

# ログを標準出力
putLog () {
  case $1 in
    "make_horse_start" ) echo   `putNow`[inf]MakeConditionGraph start $2. ;;
    "complete"         ) printf `putNow`"[inf]Complete.\n\n" ;;
  esac
}

# 初期化
initialize () {
  cd ${HOME_DIR}
}

# 馬グラフ生成
makeHorseJS () {
  HORSE_ID=$1
  putLog make_horse_start ${HORSE_ID}
  cp ${TEMPLATE_FILE} ${TARGET_DIR}/${HORSE_ID}.js
  _DATE=`awk 'BEGIN{printf "\047"} {printf "%s\047,\047", $1} END{printf "\047"}' ${BIN_DIR}/${HORSE_ID}.dat`
  _WEIGHT=`awk '{printf "%s,", $2}' ${BIN_DIR}/${HORSE_ID}.dat`
  _TEMPERATURE=`awk '{printf "%s, ", $3}' ${BIN_DIR}/${HORSE_ID}.dat`
  sed -ie "s/__id__/${HORSE_ID}/g" ${TARGET_DIR}/${HORSE_ID}.js
  sed -ie "s/__date__/${_DATE//\//.}/g" ${TARGET_DIR}/${HORSE_ID}.js
  sed -ie "s/__weight__/${_WEIGHT}/g" ${TARGET_DIR}/${HORSE_ID}.js
  sed -ie "s/__temperature__/${_TEMPERATURE}/g" ${TARGET_DIR}/${HORSE_ID}.js
  rm ${TARGET_DIR}/${HORSE_ID}.jse  # 何故か置き換え時のゴミが残るので削除
}

# main
initialize
makeHorseJS ${HORSE_0001}
makeHorseJS ${HORSE_0002}
putLog complete
exit 0
