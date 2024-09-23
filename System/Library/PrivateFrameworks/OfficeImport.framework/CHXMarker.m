@implementation CHXMarker

+ (id)chdMarkerFromXmlMarkerElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDMarker *v7;
  OADGraphicProperties *v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;

  v6 = a4;
  v7 = objc_alloc_init(CHDMarker);
  v8 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v8, a3, v6);
  -[CHDMarker setGraphicProperties:](v7, "setGraphicProperties:", v8);
  if (!a3)
    goto LABEL_16;
  objc_msgSend(v6, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "symbol");

  if (v11)
    v12 = objc_msgSend(a1, "chdMarkerStyleFromXmlMarkerStyleElement:", v11);
  else
    v12 = 2;
  if (-[OADGraphicProperties hasFill](v8, "hasFill"))
  {
    -[OADGraphicProperties fill](v8, "fill");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[OADGraphicProperties hasStroke](v8, "hasStroke"))
    {
      -[OADGraphicProperties stroke](v8, "stroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isFillOverridden") & 1) != 0)
      {
        -[OADGraphicProperties stroke](v8, "stroke");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fill");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          v12 = 0;
        else
          v12 = v12;
        goto LABEL_14;
      }

    }
  }
LABEL_14:
  -[CHDMarker setStyle:](v7, "setStyle:", v12);
  objc_msgSend(v6, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "size");

  if (v20)
    -[CHDMarker setSize:](v7, "setSize:", CXRequiredUnsignedLongAttribute(v20, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
LABEL_16:

  return v7;
}

+ (int)chdMarkerStyleFromXmlMarkerStyleElement:(_xmlNode *)a3
{
  void *v3;
  int v4;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("circle")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dash")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("diamond")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dot")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("plus")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("square")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("star")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("triangle")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("x")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromMarkerStyle:(int)a3
{
  if ((a3 + 1) > 0xB)
    return CFSTR("dot");
  else
    return off_24F3A7998[a3 + 1];
}

@end
