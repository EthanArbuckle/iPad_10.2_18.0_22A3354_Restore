@implementation EXFill

+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 state:(id)a4
{
  objc_msgSend(a1, "edFillFromXmlFillElement:differentialFill:state:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)edFillFromXmlFillElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  _xmlNode *v12;
  CXNamespace *v13;
  uint64_t v14;
  CXNamespace *v16;
  EDFill *v17;
  void *v18;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = OCXFindChild(a3, v10, "patternFill");

    if (v11)
    {
      objc_msgSend(a1, "edPatternFillFromXmlElement:differentialFill:state:", v11, v5, v9);
      v12 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      a3 = v12;
      goto LABEL_7;
    }
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = OCXFindChild(a3, v13, "gradientFill");

    if (v14)
    {
      objc_msgSend(a1, "edGradientFillFromXmlElement:state:", v14, v9);
      v12 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(v9, "EXSpreadsheetMLNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    a3 = (_xmlNode *)OCXFindChild(a3, v16, "imageFill");

    if (a3)
    {
      v17 = [EDFill alloc];
      objc_msgSend(v9, "resources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = -[EDFill initWithResources:](v17, "initWithResources:", v18);

    }
  }
LABEL_7:

  return a3;
}

+ (id)edPatternFillFromXmlElement:(_xmlNode *)a3 differentialFill:(BOOL)a4 state:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  v8 = a5;
  if (a3)
  {
    v23 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"patternType", &v23);
    v9 = v23;
    v10 = objc_msgSend(a1, "edPatternTypeFromXmlPatternTypeString:", v9);
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v11, "fgColor");

    if (v12)
    {
      +[EXColorReference edColorReferenceFromXmlColorElement:callerClass:state:](EXColorReference, "edColorReferenceFromXmlColorElement:callerClass:state:", v12, objc_opt_class(), v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v8, "resources");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", 11, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = OCXFindChild(a3, v16, "bgColor");

    if (v17)
    {
      +[EXColorReference edColorReferenceFromXmlColorElement:callerClass:state:](EXColorReference, "edColorReferenceFromXmlColorElement:callerClass:state:", v17, objc_opt_class(), v8);
      v18 = objc_claimAutoreleasedReturnValue();
      if (a4 && v9 == 0)
        v10 = 1;
      else
        v10 = v10;
      v19 = (void *)v18;
    }
    else if (a4)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v8, "resources");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", 7, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "resources");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDPatternFill patternFillWithType:foreColorReference:backColorReference:resources:](EDPatternFill, "patternFillWithType:foreColorReference:backColorReference:resources:", v10, v13, v19, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (int)edPatternTypeFromXmlPatternTypeString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "patternFillTypeEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == -130883970)
      v7 = 0;
    else
      v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)patternFillTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_23, 0, &dword_22A0CC000);
  }
  if (+[EXFill patternFillTypeEnumMap]::once != -1)
    dispatch_once(&+[EXFill patternFillTypeEnumMap]::once, &__block_literal_global_74);
  return (id)+[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap;
}

void __32__EXFill_patternFillTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXFill patternFillTypeEnumMap]::sPatternFillTypeStructs, 19, 1);
  v1 = (void *)+[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap;
  +[EXFill patternFillTypeEnumMap]::sPatternFillTypeEnumMap = (uint64_t)v0;

}

+ (id)gradientFillTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_42_0, 0, &dword_22A0CC000);
  }
  if (+[EXFill gradientFillTypeEnumMap]::once != -1)
    dispatch_once(&+[EXFill gradientFillTypeEnumMap]::once, &__block_literal_global_43);
  return (id)+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap;
}

void __33__EXFill_gradientFillTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeStructs, 2, 1);
  v1 = (void *)+[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap;
  +[EXFill gradientFillTypeEnumMap]::sGradientFillTypeEnumMap = (uint64_t)v0;

}

+ (id)edGradientFillFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;

  v6 = a4;
  if (a3)
  {
    v23 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v23);
    v7 = v23;
    v8 = objc_msgSend(a1, "edGradientTypeFromXmlGradientTypeString:state:", v7, v6);
    v22 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v22);
    v21 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bottom", &v21);
    v20 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"right", &v20);
    v19 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"left", &v19);
    v18 = 0.0;
    CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"degree", &v18);
    objc_msgSend(a1, "edStopFromXmlGradientElement:state:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    v11 = v19;
    v13 = v21;
    v12 = v22;
    v14 = v20;
    objc_msgSend(v6, "resources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDGradientFill gradientWithType:degree:top:bottom:right:left:stops:resources:](EDGradientFill, "gradientWithType:degree:top:bottom:right:left:stops:resources:", v8, v9, v15, v10, v12, v13, v14, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (int)edGradientTypeFromXmlGradientTypeString:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a1, "gradientFillTypeEnumMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "valueForString:", v5);

    if (v7 == -130883970)
      v8 = 0;
    else
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)edStopFromXmlGradientElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *Child;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  double v16;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "EXSpreadsheetMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v7, "stop");

  while (Child)
  {
    v16 = 0.0;
    CXOptionalDoubleAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"position", &v16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = OCXFindChild(Child, v10, "color");

    +[EXColorReference edColorReferenceFromXmlColorElement:callerClass:state:](EXColorReference, "edColorReferenceFromXmlColorElement:callerClass:state:", v11, objc_opt_class(), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v13, v9);
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v14, (xmlChar *)"stop");

  }
  return v6;
}

@end
