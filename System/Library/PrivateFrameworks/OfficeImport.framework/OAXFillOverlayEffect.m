@implementation OAXFillOverlayEffect

+ (id)readFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  OADFillOverlayEffect *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _xmlNode *i;
  void *v15;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(OADFillOverlayEffect);
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"blend");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blendModeEnumMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "valueForString:", v11);

  -[OADFillOverlayEffect setBlendMode:](v10, "setBlendMode:", v13);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[OADFillOverlayEffect setFill:](v10, "setFill:", v15);

      break;
    }
  }

  return v10;
}

+ (id)blendModeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
  if (!+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_8, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumStructs, 5, 1);
    v5 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
    +[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXFillOverlayEffect blendModeEnumMap]::blendModeEnumMap;
  }
  return v2;
}

@end
