@implementation WBTableProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6
{
  id v10;
  id v11;

  v11 = a3;
  v10 = a6;
  objc_msgSend(v10, "setResolveMode:", 0);
  objc_msgSend(a1, "mapWordProperties:reader:toProperties:", a4, v11, v10);
  if (a5)
  {
    objc_msgSend(v10, "setResolveMode:", 1);
    objc_msgSend(a1, "mapWordProperties:reader:toProperties:", a5, v11, v10);
  }
  objc_msgSend(v10, "setResolveMode:", 2);

}

+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t TopBorderReference;
  void *v11;
  int v12;
  uint64_t LeftBorderReference;
  void *v14;
  uint64_t BottomBorderReference;
  void *v16;
  uint64_t RightBorderReference;
  void *v18;
  uint64_t InnerHorizontalBorderReference;
  void *v20;
  uint64_t InnerVerticalBorderReference;
  void *v22;
  uint64_t ShadingReference;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v8 = a5;
  v9 = *((_QWORD *)a3 + 2);
  if ((v9 & 0x20) != 0)
  {
    TopBorderReference = WrdTableProperties::getTopBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableTopBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", TopBorderReference, v11);

    v9 = *((_QWORD *)a3 + 2);
  }
  v12 = *((_DWORD *)a3 + 6);
  if ((v9 & 0x40) != 0)
  {
    LeftBorderReference = WrdTableProperties::getLeftBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableLeftBorder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", LeftBorderReference, v14);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x80) != 0)
  {
    BottomBorderReference = WrdTableProperties::getBottomBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableBottomBorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BottomBorderReference, v16);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x100) != 0)
  {
    RightBorderReference = WrdTableProperties::getRightBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableRightBorder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", RightBorderReference, v18);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200) != 0)
  {
    InnerHorizontalBorderReference = WrdTableProperties::getInnerHorizontalBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableInsideHorizontalBorder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", InnerHorizontalBorderReference, v20);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400) != 0)
  {
    InnerVerticalBorderReference = WrdTableProperties::getInnerVerticalBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableInsideVerticalBorder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", InnerVerticalBorderReference, v22);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10) != 0)
  {
    ShadingReference = WrdTableProperties::getShadingReference((WrdTableProperties *)a3);
    objc_msgSend(v8, "mutableShading");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBShading readFrom:to:](WBShading, "readFrom:to:", ShadingReference, v24);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x10000000) != 0)
  {
    objc_msgSend(v30, "styleAtIndex:expectedType:", *((unsigned __int16 *)a3 + 164), 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend(v8, "setBaseStyle:", v25);

    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x4000) != 0)
  {
    objc_msgSend(v8, "setJustification:", *((unsigned int *)a3 + 32));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x40000000000) != 0)
  {
    objc_msgSend(v8, "setAlignment:", *((unsigned int *)a3 + 60));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200000000000000) != 0)
  {
    objc_msgSend(v8, "setWidth:", *((__int16 *)a3 + 168));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000) != 0)
  {
    objc_msgSend(v8, "setWidthType:", *((unsigned int *)a3 + 33));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400000000000000) != 0)
  {
    objc_msgSend(v8, "setIndent:", *((__int16 *)a3 + 169));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10000) != 0)
  {
    objc_msgSend(v8, "setIndentType:", *((unsigned int *)a3 + 34));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x80) != 0)
  {
    objc_msgSend(v8, "setCellSpacing:", *((__int16 *)a3 + 181));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000000) != 0)
  {
    objc_msgSend(v8, "setCellSpacing:", *((__int16 *)a3 + 90));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000000000) != 0)
  {
    objc_msgSend(v8, "setVerticalAnchor:", *((unsigned int *)a3 + 57));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10000000000) != 0)
  {
    objc_msgSend(v8, "setHorizontalAnchor:", *((unsigned int *)a3 + 58));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400000000000) != 0)
  {
    objc_msgSend(v8, "setVerticalPosition:", *((int *)a3 + 77));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200000000000) != 0)
  {
    objc_msgSend(v8, "setHorizontalPosition:", *((int *)a3 + 76));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x800000000000) != 0)
  {
    objc_msgSend(v8, "setLeftDistanceFromText:", *((int *)a3 + 78));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x1000000000000) != 0)
  {
    objc_msgSend(v8, "setTopDistanceFromText:", *((int *)a3 + 79));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x2000000000000) != 0)
  {
    objc_msgSend(v8, "setRightDistanceFromText:", *((int *)a3 + 80));
    v9 = *((_QWORD *)a3 + 2);
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x4000000000000) != 0)
  {
    objc_msgSend(v8, "setBottomDistanceFromText:", *((int *)a3 + 81));
    v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x200000) != 0)
    objc_msgSend(v8, "setBiDirectional:", *((_BYTE *)a3 + 388) != 0);
  if (WrdTableProperties::doRevisionsExist((WrdTableProperties *)a3))
  {
    v26 = *((_QWORD *)a3 + 2);
    if ((v26 & 2) != 0)
    {
      objc_msgSend(v8, "setIndexToAuthorIDOfFormattingChange:", *((unsigned __int16 *)a3 + 166));
      v26 = *((_QWORD *)a3 + 2);
    }
    if ((v26 & 4) != 0)
    {
      objc_msgSend(a1, "formattingChangeDate:", *((_QWORD *)a3 + 15));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFormattingChangeDate:", v27);

    }
    if (objc_msgSend(v8, "isFormattingChangeDateOverridden")
      && objc_msgSend(v8, "isIndexToAuthorIDOfFormattingChangeOverridden"))
    {
      objc_msgSend(v8, "document");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formattingChangeDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addChangeTrackingEditAtDate:authorIndex:", v29, objc_msgSend(v8, "indexToAuthorIDOfFormattingChange"));

    }
  }

}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", a3);
}

@end
