@implementation WXCharacterRun

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4
{
  __CFString *v5;
  xmlChar *Prop;
  id v7;

  v7 = a4;
  if (!xmlStrEqual(a3->name, (const xmlChar *)"t")
    && !xmlStrEqual(a3->name, (const xmlChar *)"instrText")
    && !xmlStrEqual(a3->name, (const xmlChar *)"delText"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"tab") || xmlStrEqual(a3->name, (const xmlChar *)"ptab"))
    {
      v5 = CFSTR("\t");
    }
    else if (xmlStrEqual(a3->name, (const xmlChar *)"br"))
    {
      Prop = xmlGetProp(a3, (const xmlChar *)"type");
      if (xmlStrEqual(Prop, (const xmlChar *)"page"))
      {
        v5 = CFSTR("\f");
      }
      else if (xmlStrEqual(Prop, (const xmlChar *)"column"))
      {
        v5 = CFSTR("\x0E");
      }
      else
      {
        xmlStrEqual(Prop, (const xmlChar *)"textWrapping");
        v5 = CFSTR("\v");
      }
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Prop);
    }
    else
    {
      if (!xmlStrEqual(a3->name, (const xmlChar *)"softHyphen"))
      {
        v5 = 0;
        goto LABEL_6;
      }
      v5 = CFSTR("\x1F");
    }
    goto LABEL_5;
  }
  v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", a3);
  if (v5)
LABEL_5:
    +[WXCharacterRun readFromString:source:to:](WXCharacterRun, "readFromString:source:to:", v5, a3, v7);
LABEL_6:

}

+ (void)readFromString:(id)a3 source:(_xmlNode *)a4 to:(id)a5
{
  objc_msgSend(a5, "appendString:", a3, a4);
}

+ (id)fontForRun:(id)a3 fontType:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFontOverriddenForFontType:", v4))
  {
    objc_msgSend(v6, "fontForFontType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "paragraph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isBaseStyleOverridden")
      && (objc_msgSend(v9, "baseStyle"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      while (1)
      {
        objc_msgSend(v10, "characterProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isFontOverriddenForFontType:", v4))
          break;
        objc_msgSend(v10, "baseStyle");
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
        v6 = v11;
        if (!v12)
          goto LABEL_9;
      }
      objc_msgSend(v11, "fontForFontType:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
LABEL_9:
      objc_msgSend(v8, "document");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "styleSheet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultCharacterProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isFontOverriddenForFontType:", v4))
      {
        objc_msgSend(v15, "fontForFontType:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v11 = v15;
    }

    v6 = v11;
  }

  return v7;
}

+ (BOOL)isSpecialCharacter:(unsigned __int16)a3
{
  BOOL v3;

  if ((a3 - 9) < 0x17 && ((0x40003Du >> (a3 - 9)) & 1) != 0)
    return 1;
  v3 = (unsigned __int16)(a3 - 14) < 0x12u || (unsigned __int16)(a3 + 4064) < 0xE0u;
  return a3 < 9u || v3;
}

@end
