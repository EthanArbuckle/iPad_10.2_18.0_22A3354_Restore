@implementation WXTableRow

+ (void)readFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 state:(id)a6
{
  id v8;
  id v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  _xmlNode *v23;
  CXNamespace *v24;
  void *v25;
  void *v28;
  void *v29;
  uint64_t v30;

  v8 = a5;
  v9 = a6;
  objc_msgSend(v8, "properties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "WXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "tblPrEx");

  if (v11)
  {
    objc_msgSend(v29, "tableProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXTableProperties readFrom:to:state:](WXTableProperties, "readFrom:to:state:", v11, v12, v9);

  }
  objc_msgSend(v9, "WXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "trPr");

  if (v14)
    +[WXTableRowProperties readFrom:to:state:](WXTableRowProperties, "readFrom:to:state:", v14, v29, v9);
  objc_msgSend(v8, "table");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isBaseStyleOverridden") && objc_msgSend(v9, "currentRowCNFStyle"))
  {
    v25 = v15;
    objc_msgSend(v15, "baseStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    do
    {
      if ((objc_msgSend(v9, "currentRowCNFStyle") & (1 << v17)) != 0)
      {
        objc_msgSend(v16, "tableStyleOverrideForPart:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 && objc_msgSend(v18, "isTableRowPropertiesOverridden"))
        {
          objc_msgSend(v8, "properties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "tableRowProperties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addProperties:", v21);

        }
      }
      v17 = (v17 + 1);
    }
    while ((_DWORD)v17 != 12);

    v15 = v25;
  }
  v30 = 0;
  if (v14)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = (_xmlNode *)OCXFindChild(v14, v22, "gridBefore");

    if (v23)
    {
      objc_msgSend(v9, "WXMainNamespace");
      v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v30 = CXDefaultLongAttribute(v23, v24, (xmlChar *)"val", 0);

    }
  }
  objc_msgSend(a1, "readCellsFrom:tableGrid:to:gridIndex:state:", a3, a4, v8, &v30, v9);
  objc_msgSend(v9, "setCurrentRowCNFStyle:", 0);

}

+ (void)readCellsFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 gridIndex:(int64_t *)a6 state:(id)a7
{
  id v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  CXNamespace *v16;
  _xmlNode *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  CXNamespace *v20;
  uint64_t v21;
  CXNamespace *v22;
  _xmlNode *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  char v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  void *v34;
  char v35;
  id v37;
  id v38;

  v37 = a5;
  v11 = a7;
  v12 = OCXFirstChild(a3);
  v13 = 0;
  v35 = 0;
  while (v12)
  {
    if (xmlStrEqual(v12->name, (const xmlChar *)"sdt"))
    {
      +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", WXFormsNotSupported);
      objc_msgSend(v11, "WXMainNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v15 = OCXFindChild(v12, v14, "sdtContent");

      if (v15)
        objc_msgSend(a1, "readCellsFrom:tableGrid:to:gridIndex:state:", v15, a4, v37, a6, v11);
      goto LABEL_30;
    }
    if (xmlStrEqual(v12->name, (const xmlChar *)"commentRangeStart"))
    {
      objc_msgSend(v11, "addPendingComment:", v12);
      goto LABEL_30;
    }
    if (xmlStrEqual(v12->name, (const xmlChar *)"tc"))
    {
      objc_msgSend(v11, "WXMainNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = (_xmlNode *)OCXFindChild(v12, v16, "tcPr");

      if (v17)
      {
        objc_msgSend(v11, "WXMainNamespace");
        v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v19 = (_xmlNode *)OCXFindChild(v17, v18, "gridSpan");

        if (v19)
        {
          objc_msgSend(v11, "WXMainNamespace");
          v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v21 = CXDefaultLongAttribute(v19, v20, (xmlChar *)"val", 1);

        }
        else
        {
          v21 = 1;
        }
        objc_msgSend(v11, "WXMainNamespace");
        v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v23 = (_xmlNode *)OCXFindChild(v17, v22, "hMerge");

        if (v23)
        {
          objc_msgSend(v11, "WXMainNamespace");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0;
          v25 = CXOptionalStringAttribute(v23, v24, (xmlChar *)"val", &v38);
          v26 = v38;

          if (v25)
            v27 = objc_msgSend(CFSTR("restart"), "isEqualToString:", v26);
          else
            v27 = 0;

          if ((v35 & 1) != 0 && (v27 & 1) == 0)
          {
            objc_msgSend(v13, "properties");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "width");

LABEL_24:
            if (v21 >= 1)
            {
              v31 = *a6;
              v32 = *(_QWORD *)a4;
              v33 = ((*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
              if (*a6 > v33)
                v33 = *a6;
              do
              {
                if (v33 == v31)
                  break;
                v29 += *(_QWORD *)(v32 + 8 * v31++);
                *a6 = v31;
                --v21;
              }
              while (v21);
            }
            objc_msgSend(v13, "properties");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setWidth:", v29);

            goto LABEL_30;
          }
          v35 = v27;
        }
        else
        {
          v35 = 0;
        }
      }
      else
      {
        v35 = 0;
        v21 = 1;
      }
      objc_msgSend(v37, "addCell");
      v30 = objc_claimAutoreleasedReturnValue();

      +[WXTableCell readFrom:to:state:](WXTableCell, "readFrom:to:state:", v12, v30, v11);
      v29 = 0;
      v13 = (void *)v30;
      goto LABEL_24;
    }
LABEL_30:
    v12 = OCXNextSibling(v12);
  }

}

@end
