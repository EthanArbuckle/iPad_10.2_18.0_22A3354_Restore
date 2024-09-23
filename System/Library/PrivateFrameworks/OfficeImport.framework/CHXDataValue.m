@implementation CHXDataValue

+ (id)chdNumberValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  CXNamespace *v8;
  void *v9;
  EDValue *v10;
  double v11;
  void *v12;
  EDValue v14;

  v6 = a4;
  objc_msgSend(v6, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", OCXFindRequiredChild(a3, v8, (xmlChar *)"v"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (EDValue *)objc_msgSend(v9, "doubleValue");
  EDValue::makeWithNumber(v10, v11, (uint64_t)&v14);
  objc_msgSend(a1, "chdDataValueFromXmlDataValueElement:state:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:", &v14);
  EDValue::~EDValue(&v14);

  return v12;
}

+ (id)chdDataValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v5 = a4;
  +[CHDDataValue dataValue](CHDDataValue, "dataValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndex:", (int)CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx"));
  v13 = 0;
  v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v13);
  v8 = v13;
  if (v7)
  {
    +[EDString edStringWithString:](EDString, "edStringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentFormatWithResources:resources:", v10, v11);

  }
  return v6;
}

+ (id)chdStringValueFromXmlDataValueElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  CXNamespace *v8;
  EDValue *v9;
  void *v10;
  EDValue v12;

  v6 = a4;
  objc_msgSend(v6, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", OCXFindRequiredChild(a3, v8, (xmlChar *)"v"));
  v9 = (EDValue *)objc_claimAutoreleasedReturnValue();

  EDValue::makeWithNSString(v9, (uint64_t)&v12);
  objc_msgSend(a1, "chdDataValueFromXmlDataValueElement:state:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:", &v12);
  EDValue::~EDValue(&v12);

  return v10;
}

@end
