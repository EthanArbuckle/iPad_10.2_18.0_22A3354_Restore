@implementation WXListLevelOverride

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  CXNamespace *v9;
  _xmlNode *v10;
  CXNamespace *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = a4;
  v8 = a5;
  v15 = 0;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "startOverride");

  objc_msgSend(v8, "WXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = CXOptionalLongAttribute(v10, v11, (xmlChar *)"val", &v15);

  if ((_DWORD)v10)
    objc_msgSend(v7, "setStartNumber:", v15);
  objc_msgSend(v8, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "lvl");

  if (v13)
  {
    objc_msgSend(v7, "mutableListLevel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXListLevel readFrom:to:state:](WXListLevel, "readFrom:to:state:", v13, v14, v8);

  }
}

@end
