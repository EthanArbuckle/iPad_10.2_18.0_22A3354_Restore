@implementation EBRowBlocks

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t NextRow;
  unint64_t v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  int v19;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 v23;
  _BYTE v24[12];
  int v25;

  v3 = a3;
  XlSheetInfo::XlSheetInfo((XlSheetInfo *)v24);
  v4 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 528))(v4, v24);
  v5 = v25;
  LOBYTE(v6) = v25 > 0;
  if (v25 >= 1)
    +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", (double)v25, 1.0);
  v17 = v5;
  objc_msgSend(v3, "edSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v9 = 0;
  v10 = 0;
  while (XlBinaryReader::hasMoreRows((XlBinaryReader *)objc_msgSend(v3, "xlReader")))
  {
    XlRowBlock::XlRowBlock((XlRowBlock *)v20);
    v11 = objc_msgSend(v3, "xlReader");
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v11 + 408))(v11, v20);
    v18 = v6;
    v6 = v6 & (v19 < v17);
    if (v6 == 1)
      +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", (double)(unsigned __int16)((v22 - v21) >> 3), 1.0);
    while (((unint64_t)(v22 - v21) >> 3) > v23)
    {
      v12 = v9;
      NextRow = XlRowBlock::getNextRow((XlRowBlock *)v20);
      objc_msgSend(v8, "rowBlockForRowNumber:currentRowBlock:createIfNil:", *(unsigned __int16 *)(*(_QWORD *)(NextRow + 8) + 8), v9, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[EBRow readCellRow:edRowBlock:edRowBlocks:state:](EBRow, "readCellRow:edRowBlock:edRowBlocks:state:", NextRow, v9, v8, v3);
      if (v6)
        +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
      ++v10;
      HIDWORD(v14) = -1030792151 * v10 + 85899344;
      LODWORD(v14) = HIDWORD(v14);
      if ((v14 >> 1) <= 0x51EB850)
      {
        objc_msgSend(v3, "readerState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isCancelled");

        if (v16)
          +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
      }
    }
    if (v6)
      +[TCProgressContext endStage](TCProgressContext, "endStage");
    v19 += v18 & 1;
    XlRowBlock::~XlRowBlock((XlRowBlock *)v20);
  }
  objc_msgSend(v8, "unlock");
  if (v17 >= 1)
    +[TCProgressContext endStage](TCProgressContext, "endStage");

}

@end
