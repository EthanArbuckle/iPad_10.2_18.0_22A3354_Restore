@implementation PFXTableCell

- (id)mapStrokeProperty:(const char *)a3 propertySet:(id)a4 readerState:(id)a5
{
  return +[PFXGraphicStyle mapCssStroke:fromStyleProperties:contentState:](PFXGraphicStyle, "mapCssStroke:fromStyleProperties:contentState:", a3, a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXTableCell;
  -[PFXTableCell dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  PFXBody *v8;

  v5 = objc_msgSend(a3, "currentTableReader");
  if (v5)
  {
    v6 = objc_msgSend(a3, "currentHtmlDocMediaState");
    v7 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
    objc_msgSend(a3, "setInTable:", 1);
    objc_msgSend(v7, "setOverriddenStorage:", objc_msgSend(v6, "temporaryTableCellStorage"));
    v8 = (PFXBody *)objc_alloc_init((Class)objc_msgSend(a3, "textBodyClass"));
    self->mBodyMapper = v8;
    -[PFXBody mapStartElementWithState:](v8, "mapStartElementWithState:", a3);
  }
  return v5 != 0;
}

- (void)mapEndElementWithState:(id)a3
{
  PFXTableCell *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  unsigned int v27;
  double v28;
  double v29;
  double v30;
  id v31;
  _BOOL8 v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  char *v41;
  int i;
  int j;
  int k;
  id v45;
  int m;
  id v47;
  int n;
  int ii;
  int jj;
  int kk;
  id v52;
  unsigned __int16 v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  id v63;
  unsigned __int16 v64;
  unint64_t v65;
  unsigned int v66;
  id v67;
  __int16 v68;
  double v69;
  double v70;
  double v71;
  double v72[2];

  -[PFXBody mapEndElementWithState:](self->mBodyMapper, "mapEndElementWithState:");

  v5 = self;
  self->mBodyMapper = 0;
  v6 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v7 = objc_msgSend(a3, "currentHtmlStackEntry");
  v8 = objc_msgSend(v7, "currentEntryMediaState");
  v67 = objc_msgSend(v8, "propertySet");
  v9 = objc_msgSend(a3, "currentTableReader");
  v56 = objc_msgSend(v8, "storage");
  v10 = objc_msgSend(v56, "copyWithContext:", objc_msgSend(v56, "context"));
  v55 = v6;
  objc_msgSend(v6, "clearIDsForTemporaryTableCellStorage");
  objc_msgSend(v10, "setParentInfo:", objc_msgSend(v9, "tableInfo"));
  v61 = objc_alloc_init((Class)TSTCell);
  if ((uint64_t)objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "colspan"), "integerValue") < 2)
    v11 = &dword_0 + 1;
  else
    v11 = objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "colspan"), "integerValue");
  if ((uint64_t)objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "rowspan"), "integerValue") < 2)
    v12 = &dword_0 + 1;
  else
    v12 = objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "rowspan"), "integerValue");
  v65 = (unint64_t)v11;
  v13 = objc_msgSend(v9, "addCellWithSize:", ((_DWORD)v12 << 16) | (unint64_t)(unsigned __int16)v11);
  v62 = BYTE2(v13);
  v14 = (unsigned __int16)v12;
  if ((unsigned __int16)v12 >= 2u)
    +[PFXTableRow ensureMinimumNumberOfRows:withState:](PFXTableRow, "ensureMinimumNumberOfRows:withState:", (unsigned __int16)(v13 + (_WORD)v12), a3);
  v58 = v12;
  TSTCellClearValue(v61);
  v61[OBJC_IVAR___TSTCell_mPrivate + 1] = 9;
  v15 = objc_msgSend(objc_alloc((Class)TSTRichTextPayload), "initWithContext:storage:", objc_msgSend(v10, "context"), v10);
  TSTCellSetRichTextPayloadClearingIDConvertToPlaintext(v61, v15, 1, 0);

  v60 = (unsigned __int16)v13;
  objc_msgSend(a3, "setUniqueIdForTableCellStorage:withInfoId:", v10, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu-%lu"), objc_msgSend(a3, "uniqueIdForInfo:", objc_msgSend(v9, "tableInfo")), v60, BYTE2(v13)));
  objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v10, v7);
  v16 = objc_msgSend(v10, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0);
  v17 = *(id *)&v61[OBJC_IVAR___TSTCell_mPrivate + 48];
  if (v17 != v16)
  {
    v18 = v16;

    v19 = v18;
    *(_QWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 48] = v19;
    *(_DWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 40] = 0;
  }
  v54 = (void *)TSTTableDefaultCellStyleForCellID(objc_msgSend(v9, "tableModel"));
  v20 = objc_alloc_init((Class)TSSPropertyMap);
  v21 = objc_msgSend(v9, "verticalStrokeToTheLeftOfColumn:inRow:", BYTE2(v13), v60);
  v63 = objc_msgSend(v9, "horizontalStrokeAboveRow:inColumn:", v60, BYTE2(v13));
  v57 = -[PFXTableCell mapStrokeProperty:propertySet:readerState:](v5, "mapStrokeProperty:propertySet:readerState:", "border-left", v67, a3);
  v22 = -[PFXTableCell mapStrokeProperty:propertySet:readerState:](v5, "mapStrokeProperty:propertySet:readerState:", "border-right", v67, a3);
  v52 = -[PFXTableCell mapStrokeProperty:propertySet:readerState:](v5, "mapStrokeProperty:propertySet:readerState:", "border-top", v67, a3);
  v59 = a3;
  v23 = -[PFXTableCell mapStrokeProperty:propertySet:readerState:](v5, "mapStrokeProperty:propertySet:readerState:", "border-bottom", v67, a3);
  if (!BYTE2(v13) || (v24 = qword_5437C8, v21 == (id)qword_5437C8))
  {
    objc_msgSend(v9, "setVerticalStroke:toTheLeftOfColumn:inRow:", v57, BYTE2(v13), (unsigned __int16)v13);
    v24 = qword_5437C8;
  }
  else
  {
    v57 = v21;
  }
  v25 = v22;
  v26 = v63;
  if (!(_DWORD)v60 || v63 == (id)v24)
  {
    v26 = v52;
    objc_msgSend(v9, "setHorizontalStroke:aboveRow:inColumn:", v52, (unsigned __int16)v13, BYTE2(v13));
  }
  v27 = (unsigned __int16)v65;
  v64 = BYTE2(v13) + (_WORD)v65;
  objc_msgSend(v9, "setVerticalStroke:toTheLeftOfColumn:inRow:", v25, v64, (unsigned __int16)v13);
  v53 = v13 + (_WORD)v58;
  objc_msgSend(v9, "setHorizontalStroke:aboveRow:inColumn:", v23, (unsigned __int16)(v13 + (_WORD)v58), BYTE2(v13));
  objc_msgSend(v20, "setObject:forProperty:", v57, 901);
  objc_msgSend(v20, "setObject:forProperty:", v26, 899);
  if ((unsigned __int16)v65 == 1)
    objc_msgSend(v20, "setObject:forProperty:", v25, 902);
  if (v14 == 1)
    objc_msgSend(v20, "setObject:forProperty:", v23, 900);
  objc_msgSend(v20, "setObject:forProperty:", +[PFXGraphicStyle mapCssBackgroundFromStyleProperties:contentState:](PFXGraphicStyle, "mapCssBackgroundFromStyleProperties:contentState:", v67, v59), 898);
  v71 = -65536.0;
  v72[0] = -65536.0;
  v69 = -65536.0;
  v70 = -65536.0;
  objc_msgSend(v8, "parentFontSize");
  v29 = v28;
  objc_msgSend(v8, "blockWidth");
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", v67, +[PFXMargins paddingPropertyNames](PFXMargins, "paddingPropertyNames"), &v71, v72, &v69, &v70, v29, v30);
  objc_msgSend(v20, "setObject:forProperty:", +[TSWPPadding paddingWithTopInset:leftInset:bottomInset:rightInset:](TSWPPadding, "paddingWithTopInset:leftInset:bottomInset:rightInset:", v72[0], v71, v70, v69), 904);
  v31 = objc_msgSend(objc_msgSend(objc_msgSend(v67, "valueForProperty:", "white-space"), "lastObject"), "value");
  v32 = (objc_msgSend(v31, "isEqualToString:", CFSTR("pre")) & 1) == 0
     && !objc_msgSend(v31, "isEqualToString:", CFSTR("nowrap"));
  objc_msgSend(v20, "setBoolValue:forProperty:", v32, 896);
  objc_msgSend(v20, "setIntValue:forProperty:", +[PFXColumnStyle mapVerticalAlignmentWithPropertySet:](PFXColumnStyle, "mapVerticalAlignmentWithPropertySet:", v67), 903);
  objc_msgSend(v20, "minusPropertyMap:", objc_msgSend(v54, "propertyMap"));
  v33 = objc_msgSend(objc_msgSend(v55, "stylesheet"), "variationOfStyle:propertyMap:", v54, v20);

  v34 = *(id *)&v61[OBJC_IVAR___TSTCell_mPrivate + 32];
  if (v34 != v33)
  {

    v35 = v33;
    *(_QWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 32] = v35;
    *(_DWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 24] = 0;
  }
  TSTTableSetCellAtCellID(objc_msgSend(v9, "tableModel"), v61, v13);
  v36 = v65;
  if (((v58 | v65) & 0xFFFE) != 0)
  {
    TSTTableMerge(objc_msgSend(v9, "tableModel"), ((unint64_t)(unsigned __int16)v65 << 32) | ((_QWORD)v58 << 48) | v13);
    if (v14)
    {
      v37 = 0;
      v66 = HIWORD(v13) << 16;
      v68 = v13;
      do
      {
        if (v27)
        {
          v38 = 0;
          v39 = (unsigned __int16)(v37 + v13);
          v40 = v66;
          do
          {
            if ((unsigned __int16)v38 | (unsigned __int16)v37)
            {
              v41 = (char *)objc_alloc_init((Class)TSTCell);
              TSTCellClearValue(v41);
              *(_DWORD *)&v41[OBJC_IVAR___TSTCell_mPrivate] &= 0xFFFF00FF;
              v36 = v36 & 0xFFFFFFFF00000000 | v40 & 0xFF0000 | v39;
              TSTTableSetCellAtCellID(objc_msgSend(v9, "tableModel"), v41, v36);

            }
            ++v38;
            v40 += 0x10000;
          }
          while (v27 != v38);
        }
        ++v37;
        LOWORD(v13) = v68;
      }
      while (v37 != v14);
    }
    if (v27 >= 2)
    {
      for (i = 1; i != v27; ++i)
      {
        objc_msgSend(v9, "horizontalStrokeAboveRow:inColumn:", (unsigned __int16)v13, (unsigned __int16)(i + v62));
        if (!(_DWORD)v60)
          objc_msgSend(v9, "setHorizontalStroke:aboveRow:inColumn:", qword_5437C8, 0, (unsigned __int16)(i + v62));
      }
      for (j = 1; j != v27; ++j)
      {
        objc_msgSend(v9, "horizontalStrokeAboveRow:inColumn:", v53, (unsigned __int16)(j + v62));
        objc_msgSend(v9, "setHorizontalStroke:aboveRow:inColumn:", qword_5437C8, v53, (unsigned __int16)(j + v62));
      }
    }
    if (v14 >= 2)
    {
      for (k = 1; k != v14; ++k)
      {
        v45 = objc_msgSend(v9, "verticalStrokeToTheLeftOfColumn:inRow:", v62, (unsigned __int16)(k + v13));
        if (v45 == (id)qword_5437C0)
          objc_msgSend(v9, "setVerticalStroke:toTheLeftOfColumn:inRow:", qword_5437C8, v62, (unsigned __int16)(k + v13));
      }
      for (m = 1; m != v14; ++m)
      {
        v47 = objc_msgSend(v9, "verticalStrokeToTheLeftOfColumn:inRow:", v64, (unsigned __int16)(m + v13));
        if (v47 == (id)qword_5437C0)
          objc_msgSend(v9, "setVerticalStroke:toTheLeftOfColumn:inRow:", qword_5437C8, v64, (unsigned __int16)(m + v13));
      }
      for (n = 1; n != v14; ++n)
      {
        if (v27)
        {
          for (ii = 0; ii != v27; ++ii)
            objc_msgSend(v9, "setHorizontalStroke:aboveRow:inColumn:", qword_5437D0, (unsigned __int16)(n + v13), (unsigned __int16)(ii + v62));
        }
      }
    }
    if (v27 >= 2)
    {
      for (jj = 1; jj != v27; ++jj)
      {
        if (v14)
        {
          for (kk = 0; kk != v14; ++kk)
            objc_msgSend(v9, "setVerticalStroke:toTheLeftOfColumn:inRow:", qword_5437D0, (unsigned __int16)(jj + v62), (unsigned __int16)(kk + v13));
        }
      }
    }
  }

  objc_msgSend(v56, "deleteRange:undoTransaction:", 0, objc_msgSend(v56, "length"), 0);
  objc_msgSend(v8, "setOverriddenStorage:", 0);
  objc_msgSend(v59, "setInTable:", 0);
}

@end
