#!/bin/bash
# 导出: bash export.sh 2
DIR="$(cd "$(dirname "$0")" && pwd)"
N="$1"

# Read name and student ID from student_info.py
eval "$("$DIR/.venv/Scripts/python.exe" -c "
import sys
sys.path.insert(0, '$DIR')
from student_info import NAME, STUDENT_ID
print(f'NAME={NAME!r}')
print(f'STUDENT_ID={STUDENT_ID!r}')
")"

OUTPUT="商务数据分析理论与方法_${STUDENT_ID}_${NAME}_实验${N}.html"

"$DIR/.venv/Scripts/python.exe" -m jupyter nbconvert \
    --to html \
    --TagRemovePreprocessor.remove_input_tags='hide-input' \
    --output "$OUTPUT" \
    "$DIR/exp/exp${N}.ipynb"
