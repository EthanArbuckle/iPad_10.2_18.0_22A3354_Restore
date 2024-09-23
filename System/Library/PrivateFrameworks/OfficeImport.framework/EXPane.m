@implementation EXPane

+ (id)edPaneFromXMLPaneElement:(_xmlNode *)a3
{
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;

  +[EDPane pane](EDPane, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"topLeftCell", &v20);
  v7 = v20;
  if (v6)
  {
    +[EXReference edReferenceFromXmlReference:](EXReference, "edReferenceFromXmlReference:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTopLeftCell:", v8);

  }
  v19 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xSplit", &v19))
    objc_msgSend(v5, "setXSplitPosition:", v19);
  v18 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"ySplit", &v18))
    objc_msgSend(v5, "setYSplitPosition:", v18);
  v17 = 0;
  v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"activePane", &v17);
  v10 = v17;
  if (v9)
    v11 = objc_msgSend(a1, "edActivePaneEnumFromString:", v10);
  else
    v11 = 3;
  objc_msgSend(v5, "setActivePane:", v11);
  v16 = 0;
  v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"state", &v16);
  v13 = v16;
  if (v12)
  {
    objc_msgSend(a1, "paneStateEnumMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaneState:", objc_msgSend(v14, "valueForString:", v13));

  }
  else
  {
    objc_msgSend(v5, "setPaneState:", 0);
  }

  return v5;
}

+ (int)edActivePaneEnumFromString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("bottomRight")))
    {
      v5 = 0;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("topRight")))
    {
      v5 = 1;
      goto LABEL_10;
    }
    if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("bottomLeft")))
    {
      v5 = 2;
      goto LABEL_10;
    }
    objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("topLeft"));
  }
  v5 = 3;
LABEL_10:

  return v5;
}

+ (id)activePaneTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26, 0, &dword_22A0CC000);
  }
  if (+[EXPane activePaneTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[EXPane activePaneTypeEnumMap]::onceToken, &__block_literal_global_77);
  return (id)+[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap;
}

void __31__EXPane_activePaneTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXPane activePaneTypeEnumMap]::sActivePaneTypeStructs, 4, 1);
  v1 = (void *)+[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap;
  +[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap = (uint64_t)v0;

}

+ (id)paneStateEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_14, 0, &dword_22A0CC000);
  }
  if (+[EXPane paneStateEnumMap]::onceToken != -1)
    dispatch_once(&+[EXPane paneStateEnumMap]::onceToken, &__block_literal_global_15_1);
  return (id)+[EXPane paneStateEnumMap]::sPaneStateEnumMap;
}

void __26__EXPane_paneStateEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXPane paneStateEnumMap]::sPaneStateStructs, 3, 1);
  v1 = (void *)+[EXPane paneStateEnumMap]::sPaneStateEnumMap;
  +[EXPane paneStateEnumMap]::sPaneStateEnumMap = (uint64_t)v0;

}

@end
