@implementation PXSlideLayout

+ (void)initialize
{
  unsigned __int8 v2;
  TCEnumerationMap *v3;
  void *v4;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_51, 0, &dword_22A0CC000);
  }
  if (!slideLayoutTypeEnumMap)
  {
    v3 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXSlideLayout initialize]::slideLayoutTypeEnumStructs, 36, 1);
    v4 = (void *)slideLayoutTypeEnumMap;
    slideLayoutTypeEnumMap = (uint64_t)v3;

  }
}

+ (void)readFromPackagePart:(id)a3 toSlideLayout:(id)a4 presentationState:(id)a5
{
  id v7;
  id v8;
  _xmlDoc *v9;
  _xmlNode *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (_xmlDoc *)objc_msgSend(v15, "xmlDocument");
  if (!v9)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v10 = OCXGetRootElement(v9);
  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  CXDefaultStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend((id)slideLayoutTypeEnumMap, "valueForString:", v11);
    if (v12 == -130883970)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(v7, "setSlideLayoutType:", v13);
  }
  objc_msgSend(v7, "setShowMasterPlaceholderAnimations:", CXDefaultBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterPhAnim", 1));
  objc_msgSend(v7, "setShowMasterShapes:", CXDefaultBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterSp", 1));
  +[PXSlideChild readFromPackagePart:toSlideChild:presentationState:](PXSlideChild, "readFromPackagePart:toSlideChild:presentationState:", v15, v7, v8);
  objc_msgSend(v15, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setModelObject:forLocation:", v7, v14);

}

+ (id)stringForSlideLayoutType:(int)a3
{
  return (id)objc_msgSend((id)slideLayoutTypeEnumMap, "stringForValue:", *(_QWORD *)&a3);
}

@end
