@implementation ODXColorTransformStyleLabel

+ (void)readNode:(_xmlNode *)a3 label:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *v8;
  CXNamespace *v9;
  _BOOL4 HasName;
  ODDFillColorList *v11;
  CXNamespace *v12;
  _BOOL4 v13;
  ODDFillColorList *v14;
  CXNamespace *v15;
  _BOOL4 v16;
  ODDFillColorList *v17;
  CXNamespace *v18;
  _BOOL4 v19;
  ODDFillColorList *v20;
  CXNamespace *v21;
  _BOOL4 v22;
  ODDFillColorList *v23;
  CXNamespace *v24;
  _BOOL4 v25;
  ODDFillColorList *v26;
  id v27;

  v27 = a4;
  v7 = a5;
  v8 = OCXFirstChild(a3);
  objc_msgSend(v7, "ODXDiagramNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(v8, v9, (xmlChar *)"fillClrLst");

  if (HasName)
  {
    v11 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v11);
    objc_msgSend(v27, "setFillColors:", v11);
    v8 = OCXNextSibling(v8);

  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = CXNodeHasName(v8, v12, (xmlChar *)"linClrLst");

  if (v13)
  {
    v14 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v14);
    objc_msgSend(v27, "setLineColors:", v14);
    v8 = OCXNextSibling(v8);

  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = CXNodeHasName(v8, v15, (xmlChar *)"effectClrLst");

  if (v16)
  {
    v17 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v17);
    objc_msgSend(v27, "setEffectColors:", v17);
    v8 = OCXNextSibling(v8);

  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = CXNodeHasName(v8, v18, (xmlChar *)"txLinClrLst");

  if (v19)
  {
    v20 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v20);
    objc_msgSend(v27, "setTextLineColors:", v20);
    v8 = OCXNextSibling(v8);

  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = CXNodeHasName(v8, v21, (xmlChar *)"txFillClrLst");

  if (v22)
  {
    v23 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v23);
    objc_msgSend(v27, "setTextFillColors:", v23);
    v8 = OCXNextSibling(v8);

  }
  objc_msgSend(v7, "ODXDiagramNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = CXNodeHasName(v8, v24, (xmlChar *)"txEffectClrLst");

  if (v25)
  {
    v26 = objc_alloc_init(ODDFillColorList);
    +[ODXFillColorList readNode:list:](ODXFillColorList, "readNode:list:", v8, v26);
    objc_msgSend(v27, "setTextEffectColors:", v26);

  }
}

@end
