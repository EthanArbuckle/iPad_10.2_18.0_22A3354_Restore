@implementation EXNameTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *Child;
  void *v11;
  CXNamespace *v12;
  id v13;

  v6 = a4;
  if (a3)
  {
    v13 = v6;
    objc_msgSend(v6, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "names");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "EXSpreadsheetMLNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v9, "definedName");

    while (Child)
    {
      objc_msgSend(a1, "edNameFromXmlNameElement:state:", Child, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      objc_msgSend(v13, "EXSpreadsheetMLNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v12, (xmlChar *)"definedName");

    }
    v6 = v13;
  }

}

+ (id)edNameFromXmlNameElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDName *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;

  v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(EDName);
    v15 = 0;
    v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v15);
    v8 = v15;
    if (v7)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDName setNameString:](v6, "setNameString:", v9);

    }
    v14 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"localSheetId", &v14))
      -[EDName setSheetIndex:](v6, "setSheetIndex:", v14);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", a3);
    objc_msgSend(CFSTR("="), "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workbook");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDName setFormulaString:workbook:](v6, "setFormulaString:workbook:", v11, v12);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
