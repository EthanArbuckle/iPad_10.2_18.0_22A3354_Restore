@implementation WXFieldMarker

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4
{
  xmlChar *Prop;
  void *v7;
  void *v8;
  uint64_t v9;
  _xmlNode *v10;
  _xmlNode *v11;
  NSString *v12;
  void *v13;
  id v14;

  v14 = a4;
  Prop = xmlGetProp(a3, (const xmlChar *)"fldCharType");
  objc_msgSend(a1, "fieldMarkerTypeEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:", Prop);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "valueForString:", v8);

  if (v9 != -130883970)
  {
    objc_msgSend(v14, "setFieldMarkerType:", v9);
    if (v9 == 19)
    {
      v10 = OCXFirstChild(a3);
      v11 = v10;
      if (v10)
      {
        if (xmlStrEqual(v10->name, (const xmlChar *)"fldData"))
        {
          v12 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v11);
          decodeBase64(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setData:", v13);

        }
      }
    }
  }
  ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);

}

+ (id)fieldMarkerTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_33, 0, &dword_22A0CC000);
  }
  if (+[WXFieldMarker fieldMarkerTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXFieldMarker fieldMarkerTypeEnumMap]::onceToken, &__block_literal_global_84);
  return (id)+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap;
}

void __39__WXFieldMarker_fieldMarkerTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeStructs, 3, 1);
  v1 = (void *)+[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap;
  +[WXFieldMarker fieldMarkerTypeEnumMap]::sFieldMarkerTypeEnumMap = (uint64_t)v0;

}

@end
