@implementation EBRow

+ (void)readCellRow:(void *)a3 edRowBlock:(id)a4 edRowBlocks:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  char v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (a3)
  {
    if (v9)
    {
      v12 = *((_QWORD *)a3 + 1);
      v13 = *(unsigned __int16 *)(v12 + 8);
      v14 = *(_WORD *)(v12 + 10);
      v20 = *(__int16 *)(v12 + 12);
      v15 = *(_BYTE *)(v12 + 18);
      v16 = *(unsigned __int8 *)(v12 + 22);
      v17 = *(unsigned __int8 *)(v12 + 23);
      v18 = *(unsigned __int8 *)(v12 + 24);
      v19 = objc_msgSend(v9, "rowInfoWithRowNumber:", v13);
      v21 = v19;
      if (v19
        || (v19 = objc_msgSend(v9, "addRowInfoWithRowNumber:cellCountHint:", v13, (unsigned __int16)((*((_DWORD *)a3 + 6) - *((_DWORD *)a3 + 4)) >> 3)), (v21 = v19) != 0))
      {
        *(_WORD *)(v19 + 20) = v14;
        *(_BYTE *)(v19 + 23) = (v17 != 0) | (2 * (v16 != 0)) | *(_BYTE *)(v19 + 23) & 0xFC;
        *(_BYTE *)(v19 + 22) = v15;
        if (v18)
          setStyleIndexForEDRowInfo((_DWORD *)v19, v20);
        while (*((_DWORD *)a3 + 10) < ((*((_QWORD *)a3 + 3) - *((_QWORD *)a3 + 2)) >> 3))
          +[EBCell readXlCell:edRowInfo:edRowBlock:edRowBlocks:state:](EBCell, "readXlCell:edRowInfo:edRowBlock:edRowBlocks:state:", XlCellRow::getNextCell((XlCellRow *)a3), &v21, v9, v10, v11);
      }
    }
  }

}

@end
