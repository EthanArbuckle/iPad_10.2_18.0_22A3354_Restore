@implementation PMTextRunMapper

- (PMTextRunMapper)initWithOadTextRun:(id)a3 parent:(id)a4
{
  id v7;
  PMTextRunMapper *v8;
  PMTextRunMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMTextRunMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mTextRun, a3);

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  void *v21;
  void *v22;
  CMStyle *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;

  v6 = a3;
  v30 = a4;
  -[OADTextRun properties](self->mTextRun, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clickHyperlink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v8;
  if (v8)
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3E6C38, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:", v12);

  }
  else
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v8;
  v29 = -[PMTextRunMapper copyCharacterStyleWithState:](self, "copyCharacterStyleWithState:", v30);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[OADTextRun text](self->mTextRun, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v28 = v6;
      v32 = 0;
      v33 = 0;
      v15 = objc_msgSend(v14, "tc_languageTypeAtIndex:effectiveRange:", 0, &v32);
      v16 = v32;
      v17 = v33;
      v18 = objc_msgSend(v14, "length");
      if (v16)
        v19 = 0;
      else
        v19 = v17 == v18;
      v20 = v19;
      if (v19)
      {
        -[PMTextRunMapper addFontForLanguageType:toCharacterStyle:](self, "addFontForLanguageType:toCharacterStyle:", v15, v29);
        +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addChild:", v21);

      }
      -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v9, v29);
      if ((v20 & 1) == 0)
      {
        do
        {
          +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addChild:", v22);
          v23 = objc_alloc_init(CMStyle);
          -[PMTextRunMapper addFontForLanguageType:toCharacterStyle:](self, "addFontForLanguageType:toCharacterStyle:", v15, v23);
          -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v22, v23);
          objc_msgSend(v14, "substringWithRange:", v32, v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addChild:", v25);

          v32 += v33;
          v26 = v32;
          if (v26 >= objc_msgSend(v14, "length"))
            break;
          v15 = objc_msgSend(v14, "tc_languageTypeAtIndex:effectiveRange:", v32, &v32);
        }
        while ((v15 & 0x80000000) == 0);
      }

      v6 = v28;
      v13 = v31;
      goto LABEL_23;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStringValue:", v27);
      -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v9, v29);

LABEL_23:
      objc_msgSend(v6, "addChild:", v9);
    }
  }

}

- (id)copyCharacterStyleWithState:(id)a3
{
  CMStyle *v4;
  void *v5;
  float v6;
  const __CFString *v7;
  int v8;
  void *v9;
  float v10;
  float v11;
  CMLengthProperty *v12;
  double v13;
  CMLengthProperty *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  const __CFString *v27;
  const __CFString *v28;
  __CFString **v29;
  float v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v4 = objc_alloc_init(CMStyle);
  -[OADTextRun properties](self->mTextRun, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasBaseline") && (objc_msgSend(v5, "baseline"), (uint64_t)v6))
  {
    if ((uint64_t)v6 <= 0)
      v7 = CFSTR("sub");
    else
      v7 = CFSTR("super");
    -[CMStyle appendPropertyForName:stringValue:](v4, "appendPropertyForName:stringValue:", 0x24F3E6698, v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v33, "currentRowStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasSize"))
  {
    objc_msgSend(v5, "size");
    v11 = v10;
    v12 = [CMLengthProperty alloc];
    v13 = v11;
    if (v8)
      v13 = v11 * 0.666666667;
    v14 = -[CMLengthProperty initWithNumber:unit:](v12, "initWithNumber:unit:", 1, v13);
    -[CMStyle addProperty:forKey:](v4, "addProperty:forKey:", v14, 0x24F3D6298);

  }
  objc_msgSend(v5, "fill");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v9 || !-[PMTextRunMapper _isDefaultFill:](self, "_isDefaultFill:", v15))
    {
      +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v15, v33);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithString:", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[CMStyle appendPropertyForName:stringWithColons:](v4, "appendPropertyForName:stringWithColons:", 0x24F3E6678, v16);
      }
      else
      {
        v16 = 0;
      }
LABEL_22:

      goto LABEL_23;
    }
LABEL_17:
    objc_msgSend(v32, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v16, v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[CMStyle appendPropertyForName:stringWithColons:](v4, "appendPropertyForName:stringWithColons:", 0x24F3E6678, v20);
    }
    goto LABEL_22;
  }
  if (v9)
    goto LABEL_17;
LABEL_23:
  if (objc_msgSend(v5, "hasIsBold") && (objc_msgSend(v5, "isBold") & 1) != 0
    || v32 && !objc_msgSend(v32, "bold"))
  {
    -[CMStyle appendPropertyForName:stringValue:](v4, "appendPropertyForName:stringValue:", 0x24F3D62D8, CFSTR("bold"));
  }
  if (objc_msgSend(v5, "isItalic"))
    -[CMStyle appendPropertyForName:stringValue:](v4, "appendPropertyForName:stringValue:", 0x24F3D6318, CFSTR("italic"));
  objc_msgSend(v5, "effects");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v23);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "type") == 6)
          -[CMStyle appendPropertyForName:stringValue:](v4, "appendPropertyForName:stringValue:", 0x24F3E7138, CFSTR("2px 2px 2px #000"));
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v5, "underlineType"))
  {
    v27 = CFSTR("underline");
LABEL_41:
    -[CMStyle appendPropertyForName:stringValue:](v4, "appendPropertyForName:stringValue:", 0x24F3D6338, v27);
    goto LABEL_45;
  }
  if (objc_msgSend(v5, "hasStrikeThroughType") && objc_msgSend(v5, "strikeThroughType"))
  {
    v27 = CFSTR("line-through");
    goto LABEL_41;
  }
LABEL_45:
  if (objc_msgSend(v5, "hasCaps") && objc_msgSend(v5, "caps") == 1)
  {
    v28 = CFSTR(":small-caps;");
    v29 = HUPropNmFontVariant;
LABEL_51:
    -[CMStyle appendPropertyForName:stringWithColons:](v4, "appendPropertyForName:stringWithColons:", *v29, v28);
    goto LABEL_52;
  }
  if (objc_msgSend(v5, "hasCaps") && objc_msgSend(v5, "caps") == 2)
  {
    v28 = CFSTR(":uppercase;");
    v29 = HUPropNmTextTransform;
    goto LABEL_51;
  }
LABEL_52:
  if (objc_msgSend(v5, "hasSpacing"))
  {
    objc_msgSend(v5, "spacing");
    if (v30 != 0.0)
      -[CMStyle appendPropertyForName:length:unit:](v4, "appendPropertyForName:length:unit:", 0x24F3E6F38, 1, v30);
  }

  return v4;
}

- (id)fontScheme
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CMMapper parent](self, "parent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "parent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
      if (!v4)
        goto LABEL_5;
    }
    objc_msgSend(v3, "defaultTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "fontScheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "baseStyles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fontScheme");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isDefaultFill:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "schemeColorIndex") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addFontForLanguageType:(int)a3 toCharacterStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  OADSchemeFontReference *v13;
  NSString *v14;
  OADSchemeFontReference *v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  CMStringProperty *v21;
  id v22;

  v6 = a4;
  -[OADTextRun properties](self->mTextRun, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case -1:
    case 0:
    case 4:
      objc_msgSend(v7, "latinFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(v7, "eastAsianFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(v7, "bidiFont");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(v7, "symbolFont");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      if (!v9)
        goto LABEL_7;
      goto LABEL_9;
    default:
LABEL_7:
      objc_msgSend(v8, "latinFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v8, "symbolFont");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
      -[PMTextRunMapper fontScheme](self, "fontScheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v6;
      v12 = v11;
      v13 = v10;
      v15 = v13;
      if (v13)
      {
        v16 = OADSchemeFontReference::schemeFontReferenceWithString(v13, v14);
        v17 = HIDWORD(v16);
        v18 = (_DWORD)v16 == -1 || HIDWORD(v16) == -1;
        v19 = v15;
        if (!v18)
        {
          objc_msgSend(v12, "fontForId:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "baseFontForId:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v21 = -[CMStringProperty initWithString:]([CMStringProperty alloc], "initWithString:", v19);
        objc_msgSend(v22, "addProperty:forKey:", v21, 0x24F3D6278);

      }
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextRun, 0);
}

@end
