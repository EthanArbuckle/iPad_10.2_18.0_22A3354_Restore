@implementation WBSection

+ (void)readFrom:(id)a3 textRun:(WrdSectionTextRun *)a4 document:(id)a5 index:(int)a6 section:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  WrdSectionProperties *var5;
  WrdSectionProperties *var4;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v8 = *(_QWORD *)&a6;
  v23 = a3;
  v12 = a5;
  v13 = a7;
  var4 = a4->var4;
  var5 = a4->var5;
  objc_msgSend(v23, "setReportProgress:", 1);
  objc_msgSend(v13, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v23, v16, a4);

  objc_msgSend(v23, "setReportProgress:", 0);
  objc_msgSend(v13, "oddPageHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 7, v8, v17);

  objc_msgSend(v13, "evenPageHeader");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 6, v8, v18);

  objc_msgSend(v13, "firstPageHeader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 10, v8, v19);

  objc_msgSend(v13, "oddPageFooter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 9, v8, v20);

  objc_msgSend(v13, "evenPageFooter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 8, v8, v21);

  objc_msgSend(v13, "firstPageFooter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readHeaderFrom:type:index:header:", v23, 11, v8, v22);

  if (!(_DWORD)v8)
    objc_msgSend(a1, "mapPrinterSettings:toSection:", var4, v13);
  objc_msgSend(v13, "setResolveMode:", 0);
  objc_msgSend(a1, "mapSectionProperties:toSection:", var4, v13);
  objc_msgSend(v13, "setResolveMode:", 1);
  objc_msgSend(a1, "mapSectionProperties:toSection:", var5, v13);
  objc_msgSend(v13, "setResolveMode:", 2);

}

+ (void)readHeaderFrom:(id)a3 type:(int)a4 index:(int)a5 header:(id)a6
{
  unsigned __int16 v7;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[3];

  v7 = a5;
  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "tableHeaders");
  if (((*(_DWORD *)(v11 + 16) - *(_DWORD *)(v11 + 8)) & 0x3FFFC) != 0)
  {
    v12[0] = &off_24F3B1BC0;
    WrdCPTableHeaders::getTextRun(v11, v12, a4, v7);
    +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v9, v10, v12);
    if ((unint64_t)objc_msgSend(v10, "blockCount") >= 2)
      objc_msgSend(v10, "removeLastBlock");
  }

}

+ (void)mapPrinterSettings:(void *)a3 toSection:(id)a4
{
  unsigned int v5;
  void *v6;
  float v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v5 = *((_DWORD *)a3 + 74);
  if (v5 < 0x7B)
  {
    if (v5 == 120)
    {
      objc_msgSend(v9, "setPageScale:", *(unsigned __int8 *)(*((_QWORD *)a3 + 38) + 56));
    }
    else if (v5 >= 0x3D)
    {
      v8 = *((_QWORD *)a3 + 38);
      if ((*(_BYTE *)(v8 + 40) & 0x10) != 0)
        objc_msgSend(v9, "setPageScale:", *(__int16 *)(v8 + 52));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *((_QWORD *)a3 + 38) + 122, v5 - 122);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXSection scaleFromPrinterSettings:](WXSection, "scaleFromPrinterSettings:", v6);
    if (v7 != 1.0)
      objc_msgSend(v9, "setPageScale:", (float)(v7 * 100.0));

  }
}

+ (void)mapSectionProperties:(void *)a3 toSection:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int16 v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;

  v27 = a4;
  v5 = *((_QWORD *)a3 + 2);
  if ((v5 & 1) != 0)
  {
    *((_QWORD *)a3 + 2) = v5 | 1;
    v6 = *((_QWORD *)a3 + 3);
    objc_msgSend(v27, "mutableTopBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", v6, v7);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = v5 | 2;
    v8 = *((_QWORD *)a3 + 4);
    objc_msgSend(v27, "mutableLeftBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", v8, v9);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 4) != 0)
  {
    *((_QWORD *)a3 + 2) = v5 | 4;
    v10 = *((_QWORD *)a3 + 5);
    objc_msgSend(v27, "mutableBottomBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", v10, v11);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 8) != 0)
  {
    *((_QWORD *)a3 + 2) = v5 | 8;
    v12 = *((_QWORD *)a3 + 6);
    objc_msgSend(v27, "mutableRightBorder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBBorder readFrom:to:](WBBorder, "readFrom:to:", v12, v13);

    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_msgSend(v27, "setBreakType:", *((unsigned int *)a3 + 18));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x400000) != 0)
  {
    objc_msgSend(v27, "setPageWidth:", *((unsigned int *)a3 + 34));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x800000) != 0)
  {
    objc_msgSend(v27, "setPageHeight:", *((unsigned int *)a3 + 35));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x4000) != 0)
  {
    objc_msgSend(v27, "setPageOrientation:", *((unsigned int *)a3 + 26));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x1000000) != 0)
  {
    objc_msgSend(v27, "setLeftMargin:", *((unsigned int *)a3 + 36));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x2000000) != 0)
  {
    objc_msgSend(v27, "setRightMargin:", *((unsigned int *)a3 + 37));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x80000) != 0)
  {
    objc_msgSend(v27, "setTopMargin:", *((int *)a3 + 31));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x100000) != 0)
  {
    objc_msgSend(v27, "setBottomMargin:", *((int *)a3 + 32));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x8000000) != 0)
  {
    objc_msgSend(v27, "setHeaderMargin:", *((unsigned int *)a3 + 39));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x10000000) != 0)
  {
    objc_msgSend(v27, "setFooterMargin:", *((unsigned int *)a3 + 40));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x4000000) != 0)
  {
    objc_msgSend(v27, "setGutterMargin:", *((unsigned int *)a3 + 38));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x10000000000000) != 0)
  {
    objc_msgSend(v27, "setRtlGutter:", *((_BYTE *)a3 + 248) != 0);
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x800) != 0)
  {
    objc_msgSend(v27, "setBorderDepth:", *((unsigned int *)a3 + 23));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x400) != 0)
  {
    objc_msgSend(v27, "setBorderDisplay:", *((unsigned int *)a3 + 22));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x1000) != 0)
  {
    objc_msgSend(v27, "setBorderOffset:", *((unsigned int *)a3 + 24));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x10000000000) != 0)
  {
    objc_msgSend(v27, "setLineNumberStart:", *((__int16 *)a3 + 117));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x80000000) != 0)
  {
    objc_msgSend(v27, "setLineNumberIncrement:", *((unsigned __int16 *)a3 + 108));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x10000) != 0)
  {
    objc_msgSend(v27, "setLineNumberDistance:", *((__int16 *)a3 + 56));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x80) != 0)
  {
    objc_msgSend(v27, "setLineNumberRestart:", *((unsigned int *)a3 + 19));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x100) != 0)
  {
    objc_msgSend(v27, "setPageNumberFormat:", *((unsigned int *)a3 + 20));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x800000000) != 0)
  {
    objc_msgSend(v27, "setPageNumberStart:", *((unsigned __int16 *)a3 + 112));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x400000000000) != 0)
  {
    objc_msgSend(v27, "setPageNumberRestart:", *((_BYTE *)a3 + 242) != 0);
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x200000000000) != 0)
  {
    objc_msgSend(v27, "setChapterNumberSeparator:", *((unsigned __int8 *)a3 + 241));
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x2000000000000) != 0)
  {
    objc_msgSend(v27, "setColumnsEqualWidth:", *((_BYTE *)a3 + 245) != 0);
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x4000000000000) != 0)
  {
    objc_msgSend(v27, "setBidi:", *((_BYTE *)a3 + 246) != 0);
    v5 = *((_QWORD *)a3 + 2);
  }
  if ((v5 & 0x20000000000) == 0 || (v14 = *((_WORD *)a3 + 118) + 1, objc_msgSend(v27, "setColumnCount:", v14), !v14))
  {
    v15 = objc_msgSend(v27, "resolveMode");
    objc_msgSend(v27, "setResolveMode:", 2);
    if (objc_msgSend(v27, "isColumnCountOverridden"))
      v14 = objc_msgSend(v27, "columnCount");
    else
      v14 = 0;
    objc_msgSend(v27, "setResolveMode:", v15);
  }
  v16 = v14;
  if (v14 >= 2u)
  {
    v17 = 0;
LABEL_67:
    v18 = *((_QWORD *)a3 + 2);
    if ((v18 & 0x40000000) == 0 || (v19 = (uint64_t *)*((_QWORD *)a3 + 25)) == 0)
    {
LABEL_73:
      if ((v18 & 0x20000000) == 0)
        goto LABEL_83;
LABEL_74:
      v21 = (uint64_t *)*((_QWORD *)a3 + 22);
      if (!v21)
        goto LABEL_83;
      while (1)
      {
        v22 = *((_DWORD *)v21 + 7);
        if (v22 <= v17)
        {
          if (v22 >= v17)
          {
            objc_msgSend(v27, "appendColumnSpace:", WrdSectionProperties::getColumnGap((WrdSectionProperties *)a3, v17));
            goto LABEL_83;
          }
          ++v21;
        }
        v21 = (uint64_t *)*v21;
        if (!v21)
          goto LABEL_83;
      }
    }
    while (1)
    {
      v20 = *((_DWORD *)v19 + 7);
      if (v20 <= v17)
      {
        if (v20 >= v17)
        {
          objc_msgSend(v27, "appendColumnWidth:", WrdSectionProperties::getColumnWidthSpacing((WrdSectionProperties *)a3, v17));
          if ((*((_QWORD *)a3 + 2) & 0x20000000) != 0)
            goto LABEL_74;
LABEL_83:
          if (++v17 == v16)
            break;
          goto LABEL_67;
        }
        ++v19;
      }
      v19 = (uint64_t *)*v19;
      if (!v19)
        goto LABEL_73;
    }
  }
  v23 = *((_QWORD *)a3 + 2);
  if ((v23 & 0x200000) != 0)
  {
    objc_msgSend(v27, "setColumnSpace:", *((int *)a3 + 33));
    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x200) != 0)
  {
    objc_msgSend(v27, "setVerticalJustification:", *((unsigned int *)a3 + 21));
    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x80000000000) != 0)
  {
    objc_msgSend(v27, "setTitlePage:", *((_BYTE *)a3 + 239) != 0);
    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x4000000000) != 0)
  {
    objc_msgSend(v27, "setFormattingChanged:", *((_WORD *)a3 + 115) != 0);
    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x8000000000) != 0)
  {
    objc_msgSend(v27, "setIndexToAuthorIDOfFormattingChange:", *((unsigned __int16 *)a3 + 116));
    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", *((_QWORD *)a3 + 7));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFormattingChangeDate:", v24);

    v23 = *((_QWORD *)a3 + 2);
  }
  if ((v23 & 0x8000) != 0)
  {
    v25 = *((_DWORD *)a3 + 27) - 1;
    if (v25 > 4)
      v26 = 1;
    else
      v26 = dword_22A4D2258[v25];
    objc_msgSend(v27, "setTextDirection:", v26);
  }

}

+ (void)mapSection:(id)a3 toSectionProperties:(void *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  unsigned int *v21;

  v5 = a3;
  if (objc_msgSend(v5, "isTopBorderOverridden"))
  {
    objc_msgSend(v5, "topBorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *((_QWORD *)a4 + 3);
    *((_QWORD *)a4 + 2) |= 1uLL;
    +[WBBorder write:to:](WBBorder, "write:to:", v6, v7);

  }
  if (objc_msgSend(v5, "isLeftBorderOverridden"))
  {
    objc_msgSend(v5, "leftBorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)a4 + 2) |= 2uLL;
    +[WBBorder write:to:](WBBorder, "write:to:", v8, *((_QWORD *)a4 + 4));

  }
  if (objc_msgSend(v5, "isBottomBorderOverridden"))
  {
    objc_msgSend(v5, "bottomBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)a4 + 2) |= 4uLL;
    +[WBBorder write:to:](WBBorder, "write:to:", v9, *((_QWORD *)a4 + 5));

  }
  if (objc_msgSend(v5, "isRightBorderOverridden"))
  {
    objc_msgSend(v5, "rightBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)a4 + 2) |= 8uLL;
    +[WBBorder write:to:](WBBorder, "write:to:", v10, *((_QWORD *)a4 + 6));

  }
  if (objc_msgSend(v5, "isBreakTypeOverridden"))
  {
    *((_DWORD *)a4 + 18) = objc_msgSend(v5, "breakType");
    *((_QWORD *)a4 + 2) |= 0x40uLL;
  }
  if (objc_msgSend(v5, "isPageWidthOverridden"))
  {
    *((_DWORD *)a4 + 34) = objc_msgSend(v5, "pageWidth");
    *((_QWORD *)a4 + 2) |= 0x400000uLL;
  }
  if (objc_msgSend(v5, "isPageHeightOverridden"))
  {
    *((_DWORD *)a4 + 35) = objc_msgSend(v5, "pageHeight");
    *((_QWORD *)a4 + 2) |= 0x800000uLL;
  }
  if (objc_msgSend(v5, "isPageOrientationOverridden"))
  {
    *((_DWORD *)a4 + 26) = objc_msgSend(v5, "pageOrientation");
    *((_QWORD *)a4 + 2) |= 0x4000uLL;
  }
  if (objc_msgSend(v5, "isLeftMarginOverridden"))
  {
    *((_DWORD *)a4 + 36) = objc_msgSend(v5, "leftMargin");
    *((_QWORD *)a4 + 2) |= 0x1000000uLL;
  }
  if (objc_msgSend(v5, "isRightMarginOverridden"))
  {
    *((_DWORD *)a4 + 37) = objc_msgSend(v5, "rightMargin");
    *((_QWORD *)a4 + 2) |= 0x2000000uLL;
  }
  if (objc_msgSend(v5, "isTopMarginOverridden"))
  {
    *((_DWORD *)a4 + 31) = objc_msgSend(v5, "topMargin");
    *((_QWORD *)a4 + 2) |= 0x80000uLL;
  }
  if (objc_msgSend(v5, "isBottomMarginOverridden"))
  {
    *((_DWORD *)a4 + 32) = objc_msgSend(v5, "bottomMargin");
    *((_QWORD *)a4 + 2) |= 0x100000uLL;
  }
  if (objc_msgSend(v5, "isHeaderMarginOverridden"))
  {
    *((_DWORD *)a4 + 39) = objc_msgSend(v5, "headerMargin");
    *((_QWORD *)a4 + 2) |= 0x8000000uLL;
  }
  if (objc_msgSend(v5, "isFooterMarginOverridden"))
  {
    *((_DWORD *)a4 + 40) = objc_msgSend(v5, "footerMargin");
    *((_QWORD *)a4 + 2) |= 0x10000000uLL;
  }
  if (objc_msgSend(v5, "isGutterMarginOverridden"))
  {
    *((_DWORD *)a4 + 38) = objc_msgSend(v5, "gutterMargin");
    *((_QWORD *)a4 + 2) |= 0x4000000uLL;
  }
  if (objc_msgSend(v5, "isRtlGutterOverridden"))
  {
    *((_BYTE *)a4 + 248) = objc_msgSend(v5, "rtlGutter");
    *((_QWORD *)a4 + 2) |= 0x10000000000000uLL;
  }
  if (objc_msgSend(v5, "isBorderDepthOverridden"))
  {
    *((_DWORD *)a4 + 23) = objc_msgSend(v5, "borderDepth");
    *((_QWORD *)a4 + 2) |= 0x800uLL;
  }
  if (objc_msgSend(v5, "isBorderDisplayOverridden"))
  {
    *((_DWORD *)a4 + 22) = objc_msgSend(v5, "borderDisplay");
    *((_QWORD *)a4 + 2) |= 0x400uLL;
  }
  if (objc_msgSend(v5, "isBorderOffsetOverridden"))
  {
    *((_DWORD *)a4 + 24) = objc_msgSend(v5, "borderOffset");
    *((_QWORD *)a4 + 2) |= 0x1000uLL;
  }
  if (objc_msgSend(v5, "isLineNumberStartOverridden"))
  {
    *((_WORD *)a4 + 117) = objc_msgSend(v5, "lineNumberStart");
    *((_QWORD *)a4 + 2) |= 0x10000000000uLL;
  }
  if (objc_msgSend(v5, "isLineNumberIncrementOverridden"))
  {
    *((_WORD *)a4 + 108) = objc_msgSend(v5, "lineNumberIncrement");
    *((_QWORD *)a4 + 2) |= 0x80000000uLL;
  }
  if (objc_msgSend(v5, "isLineNumberDistanceOverridden"))
  {
    *((_DWORD *)a4 + 28) = objc_msgSend(v5, "lineNumberDistance");
    *((_QWORD *)a4 + 2) |= 0x10000uLL;
  }
  if (objc_msgSend(v5, "isLineNumberRestartOverridden"))
  {
    *((_DWORD *)a4 + 19) = objc_msgSend(v5, "lineNumberRestart");
    *((_QWORD *)a4 + 2) |= 0x80uLL;
  }
  if (objc_msgSend(v5, "isPageNumberFormatOverridden"))
  {
    *((_DWORD *)a4 + 20) = +[WBListLevel numberFormatEnumFor:](WBListLevel, "numberFormatEnumFor:", objc_msgSend(v5, "pageNumberFormat"));
    *((_QWORD *)a4 + 2) |= 0x100uLL;
  }
  if (objc_msgSend(v5, "isPageNumberStartOverridden"))
  {
    *((_WORD *)a4 + 112) = objc_msgSend(v5, "pageNumberStart");
    *((_QWORD *)a4 + 2) |= 0x800000000uLL;
  }
  if (objc_msgSend(v5, "isPageNumberRestartOverridden"))
  {
    *((_BYTE *)a4 + 242) = objc_msgSend(v5, "pageNumberRestart");
    *((_QWORD *)a4 + 2) |= 0x400000000000uLL;
  }
  if (objc_msgSend(v5, "isChapterNumberSeparatorOverridden"))
  {
    *((_BYTE *)a4 + 241) = objc_msgSend(v5, "chapterNumberSeparator");
    *((_QWORD *)a4 + 2) |= 0x200000000000uLL;
  }
  if (objc_msgSend(v5, "isColumnCountOverridden"))
  {
    *((_WORD *)a4 + 118) = objc_msgSend(v5, "columnCount") - 1;
    *((_QWORD *)a4 + 2) |= 0x20000000000uLL;
  }
  if (objc_msgSend(v5, "isColumnsEqualWidthOverridden"))
  {
    *((_BYTE *)a4 + 245) = objc_msgSend(v5, "columnsEqualWidth");
    *((_QWORD *)a4 + 2) |= 0x2000000000000uLL;
  }
  if (objc_msgSend(v5, "isColumnCountOverridden"))
  {
    if (objc_msgSend(v5, "isColumnsEqualWidthOverridden"))
    {
      if ((objc_msgSend(v5, "columnsEqualWidth") & 1) == 0)
      {
        v11 = objc_msgSend(v5, "columnCount");
        v12 = v11;
        if (v11)
        {
          v13 = 0;
          v14 = v11 - 1;
          do
          {
            v15 = objc_msgSend(v5, "columnWidthAt:", v13);
            *((_QWORD *)a4 + 2) |= 0x40000000uLL;
            v20 = v13;
            v21 = &v20;
            *((_DWORD *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,CsLess<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a4 + 24, &v20, (uint64_t)&std::piecewise_construct, &v21)+ 8) = v15;
            if ((int)v13 < v14)
            {
              v16 = objc_msgSend(v5, "columnSpaceAt:", v13);
              *((_QWORD *)a4 + 2) |= 0x20000000uLL;
              v20 = v13;
              v21 = &v20;
              *((_DWORD *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,CsLess<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a4 + 21, &v20, (uint64_t)&std::piecewise_construct, &v21)+ 8) = v16;
            }
            v13 = (v13 + 1);
          }
          while (v12 != (_DWORD)v13);
        }
      }
    }
  }
  if (objc_msgSend(v5, "isColumnSpaceOverridden"))
  {
    *((_DWORD *)a4 + 33) = objc_msgSend(v5, "columnSpace");
    *((_QWORD *)a4 + 2) |= 0x200000uLL;
  }
  if (objc_msgSend(v5, "isVerticalJustificationOverridden"))
  {
    *((_DWORD *)a4 + 21) = objc_msgSend(v5, "verticalJustification");
    *((_QWORD *)a4 + 2) |= 0x200uLL;
  }
  if (objc_msgSend(v5, "isTitlePageOverridden"))
  {
    *((_BYTE *)a4 + 239) = objc_msgSend(v5, "titlePage");
    *((_QWORD *)a4 + 2) |= 0x80000000000uLL;
  }
  if (objc_msgSend(v5, "isBidiOverridden"))
  {
    *((_BYTE *)a4 + 246) = objc_msgSend(v5, "bidi");
    *((_QWORD *)a4 + 2) |= 0x4000000000000uLL;
  }
  if (objc_msgSend(v5, "isFormattingChangedOverridden"))
  {
    *((_WORD *)a4 + 115) = objc_msgSend(v5, "formattingChanged");
    *((_QWORD *)a4 + 2) |= 0x4000000000uLL;
  }
  if (objc_msgSend(v5, "isIndexToAuthorIDOfFormattingChangeOverridden"))
  {
    *((_WORD *)a4 + 116) = objc_msgSend(v5, "indexToAuthorIDOfFormattingChange");
    *((_QWORD *)a4 + 2) |= 0x8000000000uLL;
  }
  if (objc_msgSend(v5, "isFormattingChangeDateOverridden"))
  {
    objc_msgSend(v5, "formattingChangeDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)a4 + 2) |= 0x10uLL;
    objc_msgSend(v17, "tc_copyToWordDate:", *((_QWORD *)a4 + 7));

  }
  if (objc_msgSend(v5, "isTextDirectionOverridden"))
  {
    v18 = objc_msgSend(v5, "textDirection");
    if (v18 >= 6)
      v19 = 0;
    else
      v19 = dword_22A4D226C[v18];
    *((_DWORD *)a4 + 27) = v19;
    *((_QWORD *)a4 + 2) |= 0x8000uLL;
  }

}

@end
