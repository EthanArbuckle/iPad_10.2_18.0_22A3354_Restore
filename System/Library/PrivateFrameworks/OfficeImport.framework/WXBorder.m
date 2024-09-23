@implementation WXBorder

+ (id)borderStylesEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_29, 0, &dword_22A0CC000);
  }
  if (+[WXBorder borderStylesEnumMap]::onceToken != -1)
    dispatch_once(&+[WXBorder borderStylesEnumMap]::onceToken, &__block_literal_global_80);
  return (id)+[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap;
}

void __31__WXBorder_borderStylesEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXBorder borderStylesEnumMap]::sBorderStyleEnumStructs, 200, 1);
  v1 = (void *)+[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap;
  +[WXBorder borderStylesEnumMap]::sBorderStylesEnumMap = (uint64_t)v0;

}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CXNamespace *v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  _BOOL4 v15;
  CXNamespace *v16;
  _BOOL4 v17;
  CXNamespace *v18;
  _BOOL4 v19;
  CXNamespace *v20;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  unsigned int v24;

  v8 = a4;
  v9 = a5;
  v24 = 0;
  objc_msgSend(a1, "borderStylesEnumMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  readEnumProperty<WDBorderStyle>(a3, (const xmlChar *)"val", v10, &v24);

  objc_msgSend(v8, "setStyle:", v24);
  if (objc_msgSend(v8, "style") != 253)
  {
    objc_msgSend(v9, "WXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(a3, v11, (xmlChar *)"color", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[WXShading getColorFromString:](WXShading, "getColorFromString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[OITSUColor blackColor](OITSUColor, "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setColor:", v13);
    v23 = 0;
    objc_msgSend(v9, "WXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = CXOptionalLongAttribute(a3, v14, (xmlChar *)"sz", &v23);

    if (v15)
      objc_msgSend(v8, "setWidth:", v23);
    objc_msgSend(v9, "WXMainNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = CXOptionalLongAttribute(a3, v16, (xmlChar *)"space", &v23);

    if (v17)
      objc_msgSend(v8, "setSpace:", v23);
    v22 = 0;
    objc_msgSend(v9, "WXMainNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = CXOptionalBoolAttribute(a3, v18, (xmlChar *)"shadow", &v22);

    if (v19)
      objc_msgSend(v8, "setShadow:", v22);
    objc_msgSend(v9, "WXMainNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = CXOptionalBoolAttribute(a3, v20, (xmlChar *)"frame", &v22);

    if (v21)
      objc_msgSend(v8, "setFrame:", v22);

  }
}

@end
