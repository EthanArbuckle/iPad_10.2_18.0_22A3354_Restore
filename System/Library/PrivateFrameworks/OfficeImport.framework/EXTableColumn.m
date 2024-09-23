@implementation EXTableColumn

+ (id)edTableColumnFromXmlTableColumnElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDTableColumn *v6;
  void *v7;
  EDTableColumn *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;

  v5 = a4;
  if (a3)
  {
    v6 = [EDTableColumn alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EDTableColumn initWithResources:](v6, "initWithResources:", v7);

    v25 = 0;
    v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v25);
    v10 = v25;
    if (v9)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v10);
      +[EXString replaceEscapeAsciiCodes:](EXString, "replaceEscapeAsciiCodes:", v11);
      +[EDString edStringWithString:](EDString, "edStringWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDTableColumn setName:](v8, "setName:", v12);

    }
    v24 = 0;
    v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"uniqueName", &v24);
    v14 = v24;
    if (v13)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDTableColumn setUniqueName:](v8, "setUniqueName:", v15);

    }
    v23 = 0;
    v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"totalsRowLabel", &v23);
    v17 = v23;
    if (v16)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDTableColumn setTotalsRowLabel:](v8, "setTotalsRowLabel:", v18);

    }
    v22 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowDxfId", &v22))
      -[EDTableColumn setHeaderRowDxfIndex:](v8, "setHeaderRowDxfIndex:", v22);
    v21 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataDxfId", &v21))
      -[EDTableColumn setDataAreaDxfIndex:](v8, "setDataAreaDxfIndex:", v21);
    v20 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowDxfId", &v20))
      -[EDTableColumn setTotalsRowDxfIndex:](v8, "setTotalsRowDxfIndex:", v20);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
