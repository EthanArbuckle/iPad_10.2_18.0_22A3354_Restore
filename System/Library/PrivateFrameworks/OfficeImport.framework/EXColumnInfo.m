@implementation EXColumnInfo

+ (id)edColumnInfoFromXmlColumnInfoElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  EDColumnInfo *v8;
  void *v9;
  EDColumnInfo *v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  BOOL v18;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "currentSheet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [EDColumnInfo alloc];
    objc_msgSend(v6, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EDColumnInfo initWithResources:worksheet:](v8, "initWithResources:worksheet:", v9, v7);

    v18 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", &v18))
      -[EDColumnInfo setHidden:](v10, "setHidden:", v18);
    v17 = 0.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"width", &v17))
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultWidth", &v17);
    v11 = v17;
    if (v17 < 0.0)
    {
      v17 = 1300.0;
      v11 = 1300.0;
    }
    -[EDColumnInfo setWidth:](v10, "setWidth:", v11);
    v15 = -1;
    v16 = -1;
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"min", &v16);
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"max", &v15);
    -[EDColumnInfo setRangeWithFirstColumn:lastColumn:](v10, "setRangeWithFirstColumn:lastColumn:", (v16 - 1), (v15 - 1));
    v14 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", &v14))
      -[EDColumnInfo setStyleIndex:](v10, "setStyleIndex:", v14);
    v13 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevel", &v13))
      -[EDColumnInfo setOutlineLevel:](v10, "setOutlineLevel:", v13);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
