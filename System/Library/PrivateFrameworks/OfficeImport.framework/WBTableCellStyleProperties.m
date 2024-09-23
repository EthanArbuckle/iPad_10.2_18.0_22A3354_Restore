@implementation WBTableCellStyleProperties

+ (void)readFrom:(void *)a3 properties:(id)a4
{
  uint64_t v5;
  uint64_t TopBorderReference;
  void *v7;
  uint64_t LeftBorderReference;
  void *v9;
  uint64_t BottomBorderReference;
  void *v11;
  uint64_t RightBorderReference;
  void *v13;
  uint64_t ShadingReference;
  void *v15;
  uint64_t DiagonalUpBorderReference;
  void *v17;
  uint64_t DiagonalDownBorderReference;
  void *v19;
  uint64_t InnerHorizontalBorderReference;
  void *v21;
  uint64_t InnerVerticalBorderReference;
  void *v23;
  id v24;

  v24 = a4;
  objc_msgSend(v24, "setResolveMode:", 0);
  v5 = *((_QWORD *)a3 + 2);
  if ((v5 & 0x20) != 0)
  {
    TopBorderReference = WrdTableProperties::getTopBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableTopBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", TopBorderReference, v7);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x40) != 0)
  {
    LeftBorderReference = WrdTableProperties::getLeftBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableLeftBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", LeftBorderReference, v9);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x80) != 0)
  {
    BottomBorderReference = WrdTableProperties::getBottomBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableBottomBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BottomBorderReference, v11);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x100) != 0)
  {
    RightBorderReference = WrdTableProperties::getRightBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableRightBorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", RightBorderReference, v13);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x10) != 0)
  {
    ShadingReference = WrdTableProperties::getShadingReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableShading");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBShading readFrom:to:](WBShading, "readFrom:to:", ShadingReference, v15);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x1000) != 0)
  {
    DiagonalUpBorderReference = WrdTableProperties::getDiagonalUpBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableDiagonalUpBorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", DiagonalUpBorderReference, v17);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x800) != 0)
  {
    DiagonalDownBorderReference = WrdTableProperties::getDiagonalDownBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableDiagonalDownBorder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", DiagonalDownBorderReference, v19);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x200) != 0)
  {
    InnerHorizontalBorderReference = WrdTableProperties::getInnerHorizontalBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableInsideHorizontalBorder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", InnerHorizontalBorderReference, v21);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x400) != 0)
  {
    InnerVerticalBorderReference = WrdTableProperties::getInnerVerticalBorderReference((WrdTableProperties *)a3);
    objc_msgSend(v24, "mutableInsideVerticalBorder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", InnerVerticalBorderReference, v23);

  }
  objc_msgSend(v24, "setResolveMode:", 2);

}

+ (void)write:(id)a3 to:(void *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "isTopBorderOverridden"))
  {
    objc_msgSend(v14, "topBorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v5, WrdTableProperties::getTopBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isLeftBorderOverridden"))
  {
    objc_msgSend(v14, "leftBorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v6, WrdTableProperties::getLeftBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isBottomBorderOverridden"))
  {
    objc_msgSend(v14, "bottomBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v7, WrdTableProperties::getBottomBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isRightBorderOverridden"))
  {
    objc_msgSend(v14, "rightBorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v8, WrdTableProperties::getRightBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isShadingOverridden"))
  {
    objc_msgSend(v14, "shading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBShading write:to:](WBShading, "write:to:", v9, WrdTableProperties::getShadingReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isDiagonalUpBorderOverridden"))
  {
    objc_msgSend(v14, "diagonalUpBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v10, WrdTableProperties::getDiagonalUpBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isDiagonalDownBorderOverridden"))
  {
    objc_msgSend(v14, "diagonalDownBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v11, WrdTableProperties::getDiagonalDownBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isInsideHorizontalBorderOverridden"))
  {
    objc_msgSend(v14, "insideHorizontalBorder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v12, WrdTableProperties::getInnerHorizontalBorderReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v14, "isInsideVerticalBorderOverridden"))
  {
    objc_msgSend(v14, "insideVerticalBorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v13, WrdTableProperties::getInnerVerticalBorderReference((WrdTableProperties *)a4));

  }
}

@end
