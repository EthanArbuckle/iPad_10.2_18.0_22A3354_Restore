@implementation OAXColorTransform

+ (id)readColorTransformsFromXmlNode:(_xmlNode *)a3
{
  id v5;
  _xmlNode *i;
  void *v7;
  void *v8;
  uint64_t v9;
  OADColorTransform *p_super;
  int v11;
  OADValueColorTransform *v12;
  double v13;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE && i->name)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "colorTransformTypeEnumMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "valueForString:", v7);

      p_super = 0;
      if (v9 <= 0x1C)
      {
        v11 = 1 << v9;
        if (((1 << v9) & 0x7FFF9F0) != 0)
        {
          v12 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", v9);
          +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", i, "val");
          -[OADValueColorTransform setValue:](v12, "setValue:");
          goto LABEL_8;
        }
        if ((v11 & 0x1800000E) != 0)
        {
          p_super = -[OADColorTransform initWithType:]([OADColorTransform alloc], "initWithType:", v9);
          if (!p_super)
            goto LABEL_10;
LABEL_9:
          objc_msgSend(v5, "addObject:", p_super);
        }
        else if ((v11 & 0x600) != 0)
        {
          v12 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", v9);
          +[OAXBaseTypes readRequiredAngleFromXmlNode:name:](OAXBaseTypes, "readRequiredAngleFromXmlNode:name:", i, "val");
          *(float *)&v13 = v13;
          -[OADValueColorTransform setValue:](v12, "setValue:", v13);
LABEL_8:
          p_super = &v12->super;
          if (v12)
            goto LABEL_9;
        }
      }
LABEL_10:

      continue;
    }
  }
  return v5;
}

+ (id)colorTransformTypeEnumMap
{
  if (+[OAXColorTransform(Private) colorTransformTypeEnumMap]::once != -1)
    dispatch_once(&+[OAXColorTransform(Private) colorTransformTypeEnumMap]::once, &__block_literal_global_46);
  return (id)+[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap;
}

+ (void)write:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  id v16;
  float v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        objc_msgSend(a1, "colorTransformTypeEnumMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringForValue:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "startOAElement:", v14);
        objc_opt_class();
        v15 = 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v16 = v11;
          objc_msgSend(v16, "value");
          v15 = v17;

        }
        v18 = 0.0;
        if ((v12 - 4) <= 0x16)
          v18 = dbl_22A4BE0E8[(int)v12 - 4];
        v19 = v18 * v15;
        *(float *)&v19 = v19;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "longValue");

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("val"), v22);

        objc_msgSend(v7, "endElement");
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

void __55__OAXColorTransform_Private__colorTransformTypeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_5, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ55__OAXColorTransform_Private__colorTransformTypeEnumMap_EUb_E29colorTransformTypeEnumStructs, 28, 1);
  v2 = (void *)+[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap;
  +[OAXColorTransform(Private) colorTransformTypeEnumMap]::colorTransformTypeEnumMap = (uint64_t)v1;

}

@end
