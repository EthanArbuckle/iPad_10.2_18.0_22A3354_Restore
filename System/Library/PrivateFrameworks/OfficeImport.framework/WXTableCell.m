@implementation WXTableCell

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  int v19;
  unsigned int v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = CXOptionalStringAttribute(a3, v9, (xmlChar *)"id", &v35);
  v11 = v35;

  if (v10)
    objc_msgSend(v7, "setIdentifier:", v11);
  objc_msgSend(v8, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "tcPr");

  if (v13)
  {
    objc_msgSend(v7, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXTableCellProperties readFrom:to:state:](WXTableCellProperties, "readFrom:to:state:", v13, v14, v8);

  }
  objc_msgSend(v7, "row");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "table");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "properties");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v8, "currentCellCNFStyle");
  v18 = objc_msgSend(v8, "currentRowCNFStyle");
  v19 = objc_msgSend(v34, "isBaseStyleOverridden");
  v20 = (unsigned __int16)(v18 | v17);
  if (v18 | v17)
    v21 = v19;
  else
    v21 = 0;
  if (v21 == 1)
  {
    v33 = v11;
    objc_msgSend(v34, "baseStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    do
    {
      if (((v20 >> v23) & 1) != 0)
      {
        objc_msgSend(v22, "tableStyleOverrideForPart:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24 && objc_msgSend(v24, "isTableCellStylePropertiesOverridden"))
        {
          objc_msgSend(v7, "properties");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "tableCellStyleProperties");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addProperties:", v27);

        }
      }
      v23 = (v23 + 1);
    }
    while ((_DWORD)v23 != 12);

    v11 = v33;
  }
  objc_msgSend(v16, "properties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isBaseStyleOverridden");

  if (v29)
  {
    objc_msgSend(v16, "properties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "baseStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v7, "text");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", a3, v31, v32, v8);

}

@end
