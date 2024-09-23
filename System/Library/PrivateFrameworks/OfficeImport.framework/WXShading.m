@implementation WXShading

+ (id)getColorFromString:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(a1, "getColorFromCString:", objc_msgSend(v4, "UTF8String"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getColorFromCString:(const char *)a3
{
  void *v4;
  int v6;
  uint64_t v7;

  if (!a3 || !strcmp(a3, "auto"))
  {
    +[OITSUColor clearColor](OITSUColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v6 = 0;
    if (sscanf(a3, "%02x%02x%02x", (char *)&v7 + 4, &v7, &v6) == 3)
    {
      +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", (double)SHIDWORD(v7) / 255.0, (double)(int)v7 / 255.0, (double)v6 / 255.0, 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (id)shadingStylesEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_40, 0, &dword_22A0CC000);
  }
  if (+[WXShading shadingStylesEnumMap]::onceToken != -1)
    dispatch_once(&+[WXShading shadingStylesEnumMap]::onceToken, &__block_literal_global_91);
  return (id)+[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap;
}

void __33__WXShading_shadingStylesEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXShading shadingStylesEnumMap]::sShadingStylesEnumStructs, 38, 1);
  v1 = (void *)+[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap;
  +[WXShading shadingStylesEnumMap]::sShadingStylesEnumMap = (uint64_t)v0;

}

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  CXNamespace *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  CXNamespace *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  unsigned int v24;

  v8 = a4;
  v9 = a5;
  v24 = 0;
  objc_msgSend(a1, "shadingStylesEnumMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  readEnumProperty<WDShadingStyle>(a3, (const xmlChar *)"val", v10, &v24);

  v11 = v24;
  if (v24 == -130883970)
  {
    v11 = 0;
    v24 = 0;
  }
  objc_msgSend(v8, "setStyle:", v11);
  objc_msgSend(v9, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, v12, (xmlChar *)"color", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[WXShading getColorFromString:](WXShading, "getColorFromString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
    +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  objc_msgSend(v8, "setForeground:", v14);
  objc_msgSend(v9, "WXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, v18, (xmlChar *)"fill", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[WXShading getColorFromString:](WXShading, "getColorFromString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if (v22)
  {
    +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }
  objc_msgSend(v8, "setBackground:", v20);

}

+ (id)getStringFromColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __CFString *v14;

  v3 = a3;
  if (!v3)
    goto LABEL_8;
  +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4 == v3)
    goto LABEL_7;
  +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v3)
  {

    v5 = v4;
LABEL_7:

    goto LABEL_8;
  }
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
LABEL_8:
    v14 = CFSTR("auto");
    goto LABEL_9;
  }
  objc_msgSend(v3, "redComponent");
  v10 = v9;
  objc_msgSend(v3, "greenComponent");
  v12 = v11;
  objc_msgSend(v3, "blueComponent");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x%02x%02x"), (int)(v10 * 255.0), (int)(v12 * 255.0), (int)(v13 * 255.0));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v14;
}

@end
