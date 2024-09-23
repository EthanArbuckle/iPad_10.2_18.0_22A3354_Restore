@implementation PXVmlClient

+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  _xmlNode *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _xmlNode *v18;
  _xmlNode *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _xmlNode *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  OADImageRecolorInfo *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;

  v34 = a4;
  v7 = a5;
  if (OCXFindChild(a3, (CXNamespace *)PXVmlNamespace, "iscomment"))
  {
    objc_msgSend(v34, "ensureClientDataOfClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsComment:", 1);

  }
  v9 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)PXVmlNamespace, "textdata");
  if (v9)
  {
    CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "packagePart");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "package");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "relationshipForIdentifier:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "targetLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "partForLocation:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_opt_class();
        v33 = v7;
        v16 = v34;
        objc_opt_class();
        +[PXLegacyText readLegacyTextFromData:toShape:state:](PXLegacyText, "readLegacyTextFromData:toShape:state:", v15, v16, v33);

        v7 = v33;
      }
      objc_msgSend(v12, "targetLocation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resetPartForLocation:", v17);

    }
  }
  v18 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)CXNoNamespace, "recolorinfo");
  v19 = v18;
  if (v18 && CXDefaultBoolAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"recolorstate", 1))
  {
    v20 = CXDefaultLongAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"numcolors", 0);
    if (v20 < 1)
      v36 = 0;
    else
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v20);
    v21 = CXDefaultLongAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"numfills", 0);
    if (v21 < 1)
    {
      if (v20 < 1)
      {
LABEL_28:

        goto LABEL_29;
      }
      v22 = 0;
    }
    else
    {
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v21);
    }
    objc_msgSend(v34, "ensureClientDataOfClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v22;
    v30 = -[OADImageRecolorInfo initWithColors:fills:]([OADImageRecolorInfo alloc], "initWithColors:fills:", v36, v22);
    objc_msgSend(v31, "setImageRecolorInfo:", v30);
    for (i = (_xmlNode *)OCXFindChild(v19, (CXNamespace *)CXNoNamespace, "recolorinfoentry");
          i;
          i = OCXFindNextChild(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"recolorinfoentry"))
    {
      CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"fromcolor", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXVmlClient colorWithRecolorInfoColorString:](PXVmlClient, "colorWithRecolorInfoColorString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[OADColor tsuColorWithRgbColor:](OADColor, "tsuColorWithRgbColor:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"tocolor", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXVmlClient colorWithRecolorInfoColorString:](PXVmlClient, "colorWithRecolorInfoColorString:", v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v26)
      {
        if (v28)
          objc_msgSend(v36, "setObject:forKey:", v28, v26);
      }

    }
    goto LABEL_28;
  }
LABEL_29:

}

+ (int)vmlSupportLevel
{
  return 2;
}

+ (id)colorWithRecolorInfoColorString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  OADRgbColor *v12;
  double v13;
  double v14;
  double v15;
  OADSchemeColor *v16;
  unsigned __int8 v17;
  void *v18;
  TCEnumerationMap *v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("rgb("))
    || !objc_msgSend(v4, "hasSuffix:", CFSTR(")")))
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("scheme")))
    {
      if ((v17 & 1) == 0
      {
        __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_53, 0, &dword_22A0CC000);
      }
      v18 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
      if (!+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap)
      {
        v19 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumStructs, 8, 1);
        v20 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
        +[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap = (uint64_t)v19;

        v18 = (void *)+[PXVmlClient(Private) colorWithRecolorInfoColorString:]::schemeColorEnumMap;
      }
      v21 = objc_msgSend(v18, "valueForString:", v4);
      if ((_DWORD)v21 != -130883970)
      {
        v16 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", v21);
        goto LABEL_12;
      }
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "substringWithRange:", objc_msgSend(CFSTR("rgb("), "length"), objc_msgSend(v4, "length") - (objc_msgSend(CFSTR("rgb("), "length") + objc_msgSend(CFSTR(")"), "length")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 3)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    objc_msgSend(v6, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v9, "intValue");

    objc_msgSend(v6, "objectAtIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    v12 = [OADRgbColor alloc];
    *(float *)&v13 = (float)v8;
    *(float *)&v14 = (float)(int)v7;
    *(float *)&v15 = (float)v11;
    v16 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v12, "initWithRedByte:greenByte:blueByte:", v13, v14, v15);
  }
  else
  {
    v16 = 0;
  }

LABEL_12:
  return v16;
}

@end
