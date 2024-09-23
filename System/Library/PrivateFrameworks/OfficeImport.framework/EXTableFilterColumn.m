@implementation EXTableFilterColumn

+ (id)edTableFilterColumnFromXmlTableFilterColumnElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  EDTableFilterColumn *v7;
  CXNamespace *v8;
  uint64_t v9;
  _xmlNode *v10;
  CXNamespace *v11;
  _BOOL4 v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  _xmlNode *v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *Child;
  CXNamespace *v20;
  _xmlNode *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  CXNamespace *v25;
  _xmlNode *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  double v35;
  uint64_t v36;

  v6 = a4;
  if (a3)
  {
    v31 = a1;
    v7 = objc_alloc_init(EDTableFilterColumn);
    v36 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colId", &v36))
      -[EDTableFilterColumn setColumnIndex:](v7, "setColumnIndex:", v36);
    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v9 = OCXFindChild(a3, v8, "filters");

    v10 = (_xmlNode *)v9;
    if (v9
      || (objc_msgSend(v6, "EXSpreadsheetMLNamespace"),
          v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v10 = (_xmlNode *)OCXFindChild(a3, v11, "customFilters"),
          v11,
          v10))
    {
      v35 = 0.0;
      v12 = !CXOptionalLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"and", (uint64_t *)&v35);
      v13 = *(_QWORD *)&v35 != 1 || (unint64_t)v12;
      -[EDTableFilterColumn setFiltersRelation:](v7, "setFiltersRelation:", v13);
      objc_msgSend(v6, "EXSpreadsheetMLNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v15 = v9 ? OCXFindChild(v10, v14, "filter") : OCXFindChild(v10, v14, "customFilter");
      v16 = (_xmlNode *)v15;

      while (v16)
      {
        +[EXTableFilter edTableFilterFromXmlTableFilterElement:state:](EXTableFilter, "edTableFilterFromXmlTableFilterElement:state:", v16, v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDTableFilterColumn addFilter:](v7, "addFilter:", v17);

        objc_msgSend(v6, "EXSpreadsheetMLNamespace");
        v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        if (v9)
          Child = OCXFindNextChild(v16, v18, (xmlChar *)"filter");
        else
          Child = OCXFindNextChild(v16, v18, (xmlChar *)"customFilter");
        v16 = Child;

      }
    }
    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = (_xmlNode *)OCXFindChild(a3, v20, "top10");

    if (v21)
    {
      +[EDTableFilter edTableFilter](EDTableFilter, "edTableFilter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v23 = CXOptionalBoolAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v34);
      if (v23 && !v34)
        v24 = 9;
      else
        v24 = 8;
      objc_msgSend(v22, "setOperatorType:", v24);
      v33 = 0;
      if (CXOptionalBoolAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"percent", &v33))
        objc_msgSend(v22, "setScale:", v33);
      v35 = 0.0;
      if (CXOptionalDoubleAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35))
        objc_msgSend(v22, "setValue:", v35);
      if (CXOptionalDoubleAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"filterVal", &v35))
        objc_msgSend(v22, "setFilterValue:", v35);
      -[EDTableFilterColumn addFilter:](v7, "addFilter:", v22);

    }
    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v26 = (_xmlNode *)OCXFindChild(a3, v25, "dynamicFilter");

    if (v26)
    {
      +[EDTableFilter edTableFilter](EDTableFilter, "edTableFilter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v28 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"type", &v32);
      v29 = v32;
      if (v28)
        objc_msgSend(v27, "setOperatorType:", objc_msgSend(v31, "edFilterOperatorFromXmlTypeString:", v29));
      v35 = 0.0;
      if (CXOptionalDoubleAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35))
        objc_msgSend(v27, "setValue:", v35);
      -[EDTableFilterColumn addFilter:](v7, "addFilter:", v27);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)edFilterOperatorFromXmlTypeString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aboveAverage")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("belowAverage")) & 1) != 0)
    {
      v5 = 11;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = 10;
LABEL_7:

  return v5;
}

@end
