@implementation WXTableStyleOverride

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a4;
  v7 = a5;
  objc_msgSend(v23, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "pPr");

  if (v10)
  {
    objc_msgSend(v23, "mutableParagraphProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v10, v11, 0, v7);

    if (v8)
    {
      objc_msgSend(v23, "paragraphProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBaseStyle:", v8);

    }
  }
  objc_msgSend(v7, "WXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "rPr");

  if (v14)
  {
    objc_msgSend(v23, "mutableCharacterProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v14, v15, v7);

    if (v8)
    {
      objc_msgSend(v23, "characterProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBaseStyle:", v8);

    }
  }
  objc_msgSend(v7, "WXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "trPr");

  if (v18)
  {
    objc_msgSend(v23, "mutableTableRowProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXTableRowProperties readFrom:to:state:](WXTableRowProperties, "readFrom:to:state:", v18, v19, v7);

  }
  objc_msgSend(v7, "WXMainNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = OCXFindChild(a3, v20, "tcPr");

  if (v21)
  {
    objc_msgSend(v23, "mutableTableCellStyleProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXTableCellProperties readFrom:to:state:](WXTableCellProperties, "readFrom:to:state:", v21, v22, v7);

  }
}

@end
