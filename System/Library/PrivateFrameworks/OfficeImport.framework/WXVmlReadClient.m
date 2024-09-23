@implementation WXVmlReadClient

+ (void)initialize
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  TCEnumerationMap *v9;
  void *v10;
  TCEnumerationMap *v11;
  void *v12;
  TCEnumerationMap *v13;
  void *v14;
  TCEnumerationMap *v15;
  void *v16;
  TCEnumerationMap *v17;
  void *v18;
  TCEnumerationMap *v19;
  void *v20;
  objc_super v21;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_45, 0, &dword_22A0CC000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_76_1, 0, &dword_22A0CC000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_83_0, 0, &dword_22A0CC000);
  }
  if ((v6 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_100_0, 0, &dword_22A0CC000);
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_105, 0, &dword_22A0CC000);
  }
  if ((v8 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_112_0, 0, &dword_22A0CC000);
  }
  if (!sTextWrappingModeEnumMap)
  {
    v9 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sTextWrappingModeStructs, 5, 1);
    v10 = (void *)sTextWrappingModeEnumMap;
    sTextWrappingModeEnumMap = (uint64_t)v9;

    v11 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sTextWrappingSideStructs, 4, 1);
    v12 = (void *)sTextWrappingSideEnumMap;
    sTextWrappingSideEnumMap = (uint64_t)v11;

    v13 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sHorizontalPositionStructs, 6, 1);
    v14 = (void *)sHorizontalPositionEnumMap;
    sHorizontalPositionEnumMap = (uint64_t)v13;

    v15 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sRelativeHorizontalPositionStructs, 8, 1);
    v16 = (void *)sRelativeHorizontalPositionEnumMap;
    sRelativeHorizontalPositionEnumMap = (uint64_t)v15;

    v17 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sVerticalPositionStructs, 6, 1);
    v18 = (void *)sVerticalPositionEnumMap;
    sVerticalPositionEnumMap = (uint64_t)v17;

    v19 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &WXCreateEnumMaps(void)::sRelativeVerticalPositionStructs, 8, 1);
    v20 = (void *)sRelativeVerticalPositionEnumMap;
    sRelativeVerticalPositionEnumMap = (uint64_t)v19;

  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___WXVmlReadClient;
  objc_msgSendSuper2(&v21, sel_initialize);
}

+ (void)copyFromDrawable:(id)a3 toContent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "drawableProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orientedBounds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setBounds:");

}

+ (int)horizontalPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
    v4 = objc_msgSend((id)sHorizontalPositionEnumMap, "valueForString:", v3);
  else
    v4 = 0;

  return v4;
}

+ (int)relativeHorizontalPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
    v4 = objc_msgSend((id)sRelativeHorizontalPositionEnumMap, "valueForString:", v3);
  else
    v4 = 2;

  return v4;
}

+ (int)verticalPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
    v4 = objc_msgSend((id)sVerticalPositionEnumMap, "valueForString:", v3);
  else
    v4 = 0;

  return v4;
}

+ (int)relativeVerticalPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3)
    v4 = objc_msgSend((id)sRelativeVerticalPositionEnumMap, "valueForString:", v3);
  else
    v4 = 2;

  return v4;
}

+ (double)wrapDistanceLeft:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;

  v3 = (NSString *)a3;
  v4 = v3;
  if (v3)
    v5 = OAVReadLength(v3);
  else
    v5 = 9.0;

  return v5;
}

+ (double)wrapDistanceTop:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;

  v3 = (NSString *)a3;
  v4 = v3;
  if (v3)
    v5 = OAVReadLength(v3);
  else
    v5 = 0.0;

  return v5;
}

+ (double)wrapDistanceRight:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;

  v3 = (NSString *)a3;
  v4 = v3;
  if (v3)
    v5 = OAVReadLength(v3);
  else
    v5 = 9.0;

  return v5;
}

+ (double)wrapDistanceBottom:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;

  v3 = (NSString *)a3;
  v4 = v3;
  if (v3)
    v5 = OAVReadLength(v3);
  else
    v5 = 0.0;

  return v5;
}

+ (BOOL)floating:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("absolute"));
}

+ (int)zIndex:(id)a3
{
  return objc_msgSend(a3, "intValue");
}

+ (void)readFromDrawable:(_xmlNode *)a3 toContent:(id)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadComposite(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("position"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "floating:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v23, "createAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("mso-position-horizontal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHorizontalPosition:", objc_msgSend(a1, "horizontalPosition:", v11));

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-position-horizontal-relative"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRelativeHorizontalPosition:", objc_msgSend(a1, "relativeHorizontalPosition:", v12));

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-position-vertical"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVerticalPosition:", objc_msgSend(a1, "verticalPosition:", v13));

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-position-vertical-relative"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRelativeVerticalPosition:", objc_msgSend(a1, "relativeVerticalPosition:", v14));

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-wrap-distance-left"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "wrapDistanceLeft:", v15);
    objc_msgSend(v10, "setWrapDistanceLeft:");

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-wrap-distance-top"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "wrapDistanceTop:", v16);
    objc_msgSend(v10, "setWrapDistanceTop:");

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-wrap-distance-right"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "wrapDistanceRight:", v17);
    objc_msgSend(v10, "setWrapDistanceRight:");

    objc_msgSend(v7, "objectForKey:", CFSTR("mso-wrap-distance-bottom"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "wrapDistanceBottom:", v18);
    objc_msgSend(v10, "setWrapDistanceBottom:");

    objc_msgSend(v23, "drawable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "drawableProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "orientedBounds");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v10, "setBounds:");

    objc_msgSend(v7, "objectForKey:", CFSTR("z-index"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setZIndex:", (int)objc_msgSend(a1, "zIndex:", v22));

    objc_msgSend(a1, "readTextWrappingFromParent:toAnchor:", a3, v10);
  }

}

+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  WDAContent *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;

  v39 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v39, "textBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "hasTextWarp"))
    {
      objc_msgSend(v10, "textWarp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 != 0;

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v10, "setIsUpright:", !v12);

  }
  v13 = objc_alloc_init(WDAContent);
  -[WDAContent setDrawable:](v13, "setDrawable:", v39);
  objc_msgSend(v39, "setClientData:", v13);
  objc_msgSend(v8, "wxReadState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAContent setTextType:](v13, "setTextType:", objc_msgSend(v14, "currentOfficeArtTextType"));

  if (CXDefaultBoolAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"hr", 0))
  {
    v15 = (double)CXDefaultLongAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"hrpct", 1000)
        / 1000.0;
    if (v15 != 0.0)
    {
      objc_msgSend(v39, "graphicProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orientedBounds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v18;
      objc_msgSend(v8, "wxReadState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "document");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastSection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v22, "isPageWidthOverridden"))
        v23 = (float)objc_msgSend(v22, "pageWidth") / 20.0;
      else
        v23 = 612.0;
      if (objc_msgSend(v22, "isLeftMarginOverridden"))
        v24 = (float)objc_msgSend(v22, "leftMargin") / 20.0;
      else
        v24 = 72.0;
      if (objc_msgSend(v22, "isRightMarginOverridden"))
        v25 = (float)objc_msgSend(v22, "rightMargin") / 20.0;
      else
        v25 = 72.0;
      if (objc_msgSend(v22, "isColumnCountOverridden"))
        v26 = objc_msgSend(v22, "columnCount");
      else
        v26 = 1;
      v27 = objc_msgSend(v22, "isColumnSpaceOverridden");
      LODWORD(v28) = 0;
      if (v27)
        *(float *)&v28 = (float)objc_msgSend(v22, "columnSpace", v28) / 20.0;
      v29 = v19;
      v30 = v23;
      v31 = v24;
      v32 = v25;
      +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0, (float)((float)((float)((float)(v30 - (float)(v31 + v32)) - (float)((float)(v26 - 1) * *(float *)&v28))/ (float)v26)* v15), v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setOrientedBounds:", v33);
    }
  }
  objc_msgSend(a1, "readFromDrawable:toContent:", a3, v13);
  v34 = OCXFindChild(a3, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
  if (v34)
  {
    +[WXTextBox readFrom:parent:state:](WXTextBox, "readFrom:parent:state:", v34, v13, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wxReadState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "document");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAContent setTextBox:document:](v13, "setTextBox:document:", v35, v37);

    v38 = objc_msgSend(v35, "nextTextBoxId");
    if (v38 == objc_msgSend(v39, "id"))
      objc_msgSend(v35, "setNextTextBoxId:", 0);

  }
}

+ (void)readClientDataFromGroup:(_xmlNode *)a3 toGroup:(id)a4 state:(id)a5
{
  id v8;
  WDAContent *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  v9 = objc_alloc_init(WDAContent);
  -[WDAContent setDrawable:](v9, "setDrawable:", v11);
  objc_msgSend(v11, "setClientData:", v9);
  objc_msgSend(v8, "wxReadState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAContent setTextType:](v9, "setTextType:", objc_msgSend(v10, "currentOfficeArtTextType"));

  objc_msgSend(a1, "readFromDrawable:toContent:", a3, v9);
}

+ (int)vmlSupportLevel
{
  return 1;
}

+ (void)readTextWrappingFromParent:(_xmlNode *)a3 toAnchor:(id)a4
{
  id v5;
  const xmlNode *v6;
  const xmlNode *v7;
  unsigned int v8;
  int v9;

  v5 = a4;
  v6 = (const xmlNode *)OCXFindChild(a3, (CXNamespace *)WXVmlNamespace, "wrap");
  v7 = v6;
  v8 = 0;
  v9 = 3;
  if (v6)
  {
    readEnumProperty<WDATextWrappingMode>(v6, (const xmlChar *)"type", (void *)sTextWrappingModeEnumMap, &v9);
    readEnumProperty<WDATextWrappingModeType>(v7, (const xmlChar *)"side", (void *)sTextWrappingSideEnumMap, &v8);
  }
  objc_msgSend(v5, "setTextWrappingMode:");
  objc_msgSend(v5, "setTextWrappingModeType:", v8);

}

@end
