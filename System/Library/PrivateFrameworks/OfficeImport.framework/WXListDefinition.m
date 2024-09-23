@implementation WXListDefinition

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  CXNamespace *v13;
  _xmlAttr *v14;
  id v15;
  void *v16;
  CXNamespace *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  CXNamespace *v20;
  void *v21;
  unsigned int v22;

  v8 = a4;
  v9 = a5;
  v22 = 1;
  objc_msgSend(a1, "listTypeEnumMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  readEnumProperty<WDListType>(a3, "multiLevelType", (const xmlChar *)"val", v10, &v22, v9);

  objc_msgSend(v8, "setType:", v22);
  objc_msgSend(v9, "WXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v11, "lvl");

  while (Child)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = CXRequiredLongAttribute(Child, v13, (xmlChar *)"ilvl");

    if ((int)v14 <= 8)
    {
      while ((int)objc_msgSend(v8, "levelCount") <= (int)v14)
        v15 = (id)objc_msgSend(v8, "addLevel");
      objc_msgSend(v8, "levelAt:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXListLevel readFrom:to:state:](WXListLevel, "readFrom:to:state:", Child, v16, v9);
      objc_msgSend(v9, "WXMainNamespace");
      v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v17, (xmlChar *)"lvl");

    }
  }
  objc_msgSend(v9, "WXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "numStyleLink");

  if (v19)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(v19, v20, (xmlChar *)"val", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setStyleRefId:", v21);
  }

}

+ (id)listTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_35, 0, &dword_22A0CC000);
  }
  if (+[WXListDefinition listTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXListDefinition listTypeEnumMap]::onceToken, &__block_literal_global_86);
  return (id)+[WXListDefinition listTypeEnumMap]::sListTypeEnumMap;
}

void __35__WXListDefinition_listTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXListDefinition listTypeEnumMap]::sListTypeEnumStructs, 3, 1);
  v1 = (void *)+[WXListDefinition listTypeEnumMap]::sListTypeEnumMap;
  +[WXListDefinition listTypeEnumMap]::sListTypeEnumMap = (uint64_t)v0;

}

@end
