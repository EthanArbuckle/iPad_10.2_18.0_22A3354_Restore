@implementation WBTableCellBodyProperties

+ (void)readFrom:(void *)a3 tracked:(void *)a4 properties:(id)a5 index:(unint64_t)a6
{
  __int16 PositionOfCell;
  __int16 v11;
  id v12;

  v12 = a5;
  if (a3 && v12)
  {
    objc_msgSend(v12, "setResolveMode:", 0);
    objc_msgSend(a1, "mapWordProperties:toProperties:index:", a3, v12, a6);
    PositionOfCell = WrdTableProperties::getPositionOfCell((WrdTableProperties *)a3, (a6 + 1));
    objc_msgSend(v12, "setWidth:", (__int16)(PositionOfCell- WrdTableProperties::getPositionOfCell((WrdTableProperties *)a3, a6)));
    if (a4)
    {
      objc_msgSend(v12, "setResolveMode:", 1);
      objc_msgSend(a1, "mapWordProperties:toProperties:index:", a4, v12, a6);
      if ((*((_QWORD *)a4 + 2) & 0x4000000000000000) != 0)
      {
        v11 = WrdTableProperties::getPositionOfCell((WrdTableProperties *)a4, (a6 + 1));
        objc_msgSend(v12, "setWidth:", (__int16)(v11- WrdTableProperties::getPositionOfCell((WrdTableProperties *)a4, a6)));
      }
    }
    objc_msgSend(v12, "setResolveMode:", 2);
  }

}

+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4 index:(unint64_t)a5
{
  __int16 v5;
  uint64_t TableCellDescriptorReference;
  uint64_t v9;
  unint64_t v10;
  uint64_t TopBorderReference;
  void *v12;
  uint64_t LeftBorderReference;
  void *v14;
  uint64_t BottomBorderReference;
  void *v16;
  uint64_t RightBorderReference;
  void *v18;
  uint64_t ShadingReference;
  void *v20;
  uint64_t DiagonalUpBorderReference;
  void *v22;
  uint64_t DiagonalDownBorderReference;
  void *v24;
  void *v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v5 = a5;
  v34 = a4;
  TableCellDescriptorReference = WrdTableProperties::getTableCellDescriptorReference((WrdTableProperties *)a3, v5);
  objc_msgSend(v34, "setPosition:", v5);
  v9 = *(unsigned int *)(TableCellDescriptorReference + 8);
  v10 = v9 | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  if ((v9 & 2) != 0)
  {
    TopBorderReference = WrdTableCellDescriptor::getTopBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableTopBorder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", TopBorderReference, v12);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 4) != 0)
  {
    LeftBorderReference = WrdTableCellDescriptor::getLeftBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableLeftBorder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", LeftBorderReference, v14);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 8) != 0)
  {
    BottomBorderReference = WrdTableCellDescriptor::getBottomBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableBottomBorder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", BottomBorderReference, v16);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x10) != 0)
  {
    RightBorderReference = WrdTableCellDescriptor::getRightBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableRightBorder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", RightBorderReference, v18);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 1) != 0)
  {
    ShadingReference = WrdTableCellDescriptor::getShadingReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableShading");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBShading readFrom:to:](WBShading, "readFrom:to:", ShadingReference, v20);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x40) != 0)
  {
    DiagonalUpBorderReference = WrdTableCellDescriptor::getDiagonalUpBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableDiagonalUpBorder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", DiagonalUpBorderReference, v22);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x20) != 0)
  {
    DiagonalDownBorderReference = WrdTableCellDescriptor::getDiagonalDownBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    objc_msgSend(v34, "mutableDiagonalDownBorder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", DiagonalDownBorderReference, v24);

    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x2000) != 0)
  {
    objc_msgSend(v34, "setWidthType:", *(unsigned int *)(TableCellDescriptorReference + 76));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  v25 = v34;
  if ((v10 & 0x1000000) != 0)
  {
    objc_msgSend(v34, "setTopMargin:", *(__int16 *)(TableCellDescriptorReference + 116));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x8000) != 0)
  {
    objc_msgSend(v25, "setTopMarginType:", *(unsigned int *)(TableCellDescriptorReference + 84));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x2000000) != 0)
  {
    objc_msgSend(v25, "setBottomMargin:", *(__int16 *)(TableCellDescriptorReference + 118));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x10000) != 0)
  {
    objc_msgSend(v25, "setBottomMarginType:", *(unsigned int *)(TableCellDescriptorReference + 88));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x800000) != 0)
  {
    objc_msgSend(v25, "setLeftMargin:", *(__int16 *)(TableCellDescriptorReference + 114));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x4000) != 0)
  {
    objc_msgSend(v25, "setLeftMarginType:", *(unsigned int *)(TableCellDescriptorReference + 80));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x4000000) != 0)
  {
    objc_msgSend(v25, "setRightMargin:", *(__int16 *)(TableCellDescriptorReference + 120));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x20000) != 0)
  {
    objc_msgSend(v25, "setRightMarginType:", *(unsigned int *)(TableCellDescriptorReference + 92));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x1000) != 0)
  {
    objc_msgSend(v34, "setVerticalAlignment:", *(unsigned int *)(TableCellDescriptorReference + 72));
    v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0xE00000000) != 0)
  {
    v26 = *(unsigned __int16 *)(TableCellDescriptorReference + 130);
    if ((~v26 & 0xC) != 0)
    {
      if ((v26 & 0x10) != 0)
        v27 = 2;
      else
        v27 = 1;
      if ((v26 & 0x10) != 0)
        v28 = 5;
      else
        v28 = 4;
      if ((v26 & 4) != 0)
        v29 = v28;
      else
        v29 = v27;
      objc_msgSend(v34, "setTextDirection:", v29);
    }
    else
    {
      objc_msgSend(v34, "setTextDirection:", 0);
    }
  }
  v30 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  if ((v30 & 0x1000000000) != 0)
  {
    objc_msgSend(v34, "setVerticallyMergedCell:", (*(unsigned __int16 *)(TableCellDescriptorReference + 130) >> 5) & 1);
    v30 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v30 & 0x2000000000) != 0)
    objc_msgSend(v34, "setFirstInSetOfVerticallyMergedCells:", (*(unsigned __int16 *)(TableCellDescriptorReference + 130) >> 6) & 1);
  if (WrdTableProperties::doRevisionsExist((WrdTableProperties *)a3))
  {
    if ((*((_QWORD *)a3 + 2) & 2) != 0)
      objc_msgSend(v34, "setIndexToAuthorIDOfFormattingChange:", *((unsigned __int16 *)a3 + 166));
    objc_msgSend(v34, "setFormattingChanged:", 1);
    if ((*((_QWORD *)a3 + 2) & 4) != 0)
    {
      objc_msgSend(a1, "formattingChangeDate:", *((_QWORD *)a3 + 15));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFormattingChangeDate:", v31);

    }
    if (objc_msgSend(v34, "isFormattingChangeDateOverridden")
      && objc_msgSend(v34, "isIndexToAuthorIDOfFormattingChangeOverridden"))
    {
      objc_msgSend(v34, "document");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "formattingChangeDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addChangeTrackingEditAtDate:authorIndex:", v33, objc_msgSend(v34, "indexToAuthorIDOfFormattingChange"));

    }
  }

}

+ (void)write:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 index:(unint64_t)a6
{
  id v10;

  v10 = a3;
  if (v10 && a4)
  {
    objc_msgSend(v10, "setResolveMode:", 0);
    objc_msgSend(a1, "mapProperties:toWordProperties:index:", v10, a4, a6);
    if (a5)
    {
      objc_msgSend(v10, "setResolveMode:", 1);
      objc_msgSend(a1, "mapProperties:toWordProperties:index:", v10, a5, a6);
    }
    objc_msgSend(v10, "setResolveMode:", 2);
  }

}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", a3);
}

+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4 index:(unint64_t)a5
{
  unsigned __int8 v5;
  WrdTableCellDescriptor *TableCellDescriptorReference;
  uint64_t ShadingReference;
  void *v9;
  uint64_t TopBorderReference;
  void *v11;
  uint64_t LeftBorderReference;
  void *v13;
  uint64_t BottomBorderReference;
  void *v15;
  uint64_t RightBorderReference;
  void *v17;
  uint64_t DiagonalDownBorderReference;
  void *v19;
  uint64_t DiagonalUpBorderReference;
  void *v21;
  void *v22;
  id v23;

  v5 = a5;
  v23 = a3;
  WrdTableProperties::setPositionOfCell((WrdTableProperties *)a4, (v5 + 1), objc_msgSend(v23, "position"));
  TableCellDescriptorReference = (WrdTableCellDescriptor *)WrdTableProperties::getTableCellDescriptorReference((WrdTableProperties *)a4, v5);
  if (objc_msgSend(v23, "isShadingOverridden"))
  {
    ShadingReference = WrdTableCellDescriptor::getShadingReference(TableCellDescriptorReference);
    objc_msgSend(v23, "shading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBShading write:to:](WBShading, "write:to:", v9, ShadingReference);

  }
  if (objc_msgSend(v23, "isTopBorderOverridden"))
  {
    TopBorderReference = WrdTableCellDescriptor::getTopBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "topBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v11, TopBorderReference);

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x80u;
  }
  if (objc_msgSend(v23, "isLeftBorderOverridden"))
  {
    LeftBorderReference = WrdTableCellDescriptor::getLeftBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "leftBorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v13, LeftBorderReference);

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x100u;
  }
  if (objc_msgSend(v23, "isBottomBorderOverridden"))
  {
    BottomBorderReference = WrdTableCellDescriptor::getBottomBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "bottomBorder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v15, BottomBorderReference);

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x200u;
  }
  if (objc_msgSend(v23, "isRightBorderOverridden"))
  {
    RightBorderReference = WrdTableCellDescriptor::getRightBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "rightBorder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v17, RightBorderReference);

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x400u;
  }
  if (objc_msgSend(v23, "isDiagonalDownBorderOverridden"))
  {
    DiagonalDownBorderReference = WrdTableCellDescriptor::getDiagonalDownBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "diagonalDownBorder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v19, DiagonalDownBorderReference);

  }
  if (objc_msgSend(v23, "isDiagonalUpBorderOverridden"))
  {
    DiagonalUpBorderReference = WrdTableCellDescriptor::getDiagonalUpBorderReference(TableCellDescriptorReference);
    objc_msgSend(v23, "diagonalUpBorder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder write:to:](WBBorder, "write:to:", v21, DiagonalUpBorderReference);

  }
  WrdTableCellDescriptor::setWidth(TableCellDescriptorReference, objc_msgSend(v23, "width"));
  if (objc_msgSend(v23, "isWidthTypeOverridden"))
    WrdTableCellDescriptor::setWidthUnit((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "widthType"));
  if (objc_msgSend(v23, "isTopMarginOverridden"))
    WrdTableCellDescriptor::setTopPadding(TableCellDescriptorReference, objc_msgSend(v23, "topMargin"));
  if (objc_msgSend(v23, "isTopMarginTypeOverridden"))
    WrdTableCellDescriptor::setTopPaddingUnit((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "topMarginType"));
  if (objc_msgSend(v23, "isLeftMarginOverridden"))
    WrdTableCellDescriptor::setLeftPadding(TableCellDescriptorReference, objc_msgSend(v23, "leftMargin"));
  if (objc_msgSend(v23, "isLeftMarginTypeOverridden"))
    WrdTableCellDescriptor::setLeftPaddingUnit((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "leftMarginType"));
  if (objc_msgSend(v23, "isBottomMarginOverridden"))
    WrdTableCellDescriptor::setBottomPadding(TableCellDescriptorReference, objc_msgSend(v23, "bottomMargin"));
  if (objc_msgSend(v23, "isBottomMarginTypeOverridden"))
    WrdTableCellDescriptor::setBottomPaddingUnit((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "bottomMarginType"));
  if (objc_msgSend(v23, "isRightMarginOverridden"))
    WrdTableCellDescriptor::setRightPadding(TableCellDescriptorReference, objc_msgSend(v23, "rightMargin"));
  if (objc_msgSend(v23, "isRightMarginTypeOverridden"))
    WrdTableCellDescriptor::setRightPaddingUnit((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "rightMarginType"));
  if (objc_msgSend(v23, "isVerticalAlignmentOverridden"))
    WrdTableCellDescriptor::setVerticalCellAlignment((uint64_t)TableCellDescriptorReference, objc_msgSend(v23, "verticalAlignment"));
  if (objc_msgSend(v23, "isVerticallyMergedCellOverridden"))
    WrdTableCellDescriptor::setIsVerticallyMergedCell(TableCellDescriptorReference, objc_msgSend(v23, "verticallyMergedCell"));
  if (objc_msgSend(v23, "isFirstInSetOfVerticallyMergedCellsOverridden"))
    WrdTableCellDescriptor::setIsFirstInSetOfVerticallyMergedCells(TableCellDescriptorReference, objc_msgSend(v23, "firstInSetOfVerticallyMergedCells"));
  if (objc_msgSend(v23, "isFormattingChangedOverridden"))
    WrdTableProperties::setRevisionMark((WrdTableProperties *)a4, objc_msgSend(v23, "formattingChanged"));
  if (objc_msgSend(v23, "isIndexToAuthorIDOfFormattingChangeOverridden"))
    WrdTableProperties::setAuthorIDForRevision((WrdTableProperties *)a4, objc_msgSend(v23, "indexToAuthorIDOfFormattingChange"));
  if (objc_msgSend(v23, "isFormattingChangeDateOverridden"))
  {
    objc_msgSend(v23, "formattingChangeDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tc_copyToWordDate:", WrdTableProperties::getDttmRevisionMarkReference((WrdTableProperties *)a4));

  }
  if (objc_msgSend(v23, "isTextDirectionOverridden"))
  {
    switch(objc_msgSend(v23, "textDirection"))
    {
      case 0u:
        WrdTableCellDescriptor::setBottomToTopTextFlow(TableCellDescriptorReference, 1);
        goto LABEL_50;
      case 2u:
        WrdTableCellDescriptor::setRotateFont(TableCellDescriptorReference, 1);
        break;
      case 4u:
        goto LABEL_50;
      case 5u:
        WrdTableCellDescriptor::setRotateFont(TableCellDescriptorReference, 1);
LABEL_50:
        WrdTableCellDescriptor::setVerticalTextFlow(TableCellDescriptorReference, 1);
        break;
      default:
        break;
    }
  }

}

@end
