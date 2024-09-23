@implementation WMCharacterRunMapper

- (WMCharacterRunMapper)initWithWDCharacterRun:(id)a3 parent:(id)a4
{
  id v7;
  id v8;
  WMCharacterRunMapper *v9;
  WMCharacterRunMapper *v10;
  uint64_t v11;
  WMStyle *mStyle;
  WMStyle *v13;
  void *v14;
  uint64_t v15;
  NSString *mText;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WMCharacterRunMapper;
  v9 = -[CMMapper initWithParent:](&v18, sel_initWithParent_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->wdCharacterRun, a3);
    v11 = -[WMCharacterRunMapper copyCharacterStyle](v10, "copyCharacterStyle");
    mStyle = v10->mStyle;
    v10->mStyle = (WMStyle *)v11;

    v13 = v10->mStyle;
    objc_msgSend(v7, "properties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WMStyle addCharacterProperties:](v13, "addCharacterProperties:", v14);

    objc_msgSend(v7, "string");
    v15 = objc_claimAutoreleasedReturnValue();
    mText = v10->mText;
    v10->mText = (NSString *)v15;

  }
  return v10;
}

- (id)copyCharacterStyle
{
  void *v3;
  void *v4;
  void *v5;
  WMStyle *v6;
  void *v7;
  void *v8;
  WMStyle *v9;

  -[WDRun paragraph](self->wdCharacterRun, "paragraph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBaseStyleOverridden"))
  {
    objc_msgSend(v4, "baseStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WMStyle initWithWDStyle:]([WMStyle alloc], "initWithWDStyle:", v5);

  }
  else
  {
    v6 = objc_alloc_init(WMStyle);
  }
  -[WDRunWithCharacterProperties properties](self->wdCharacterRun, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isBaseStyleOverridden"))
  {
    objc_msgSend(v7, "baseStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WMStyle initWithWDStyle:]([WMStyle alloc], "initWithWDStyle:", v8);
    -[WMStyle cascadeWithStyle:](v6, "cascadeWithStyle:", v9);

  }
  return v6;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  NSString *mText;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  float v16;
  int v18;
  float v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  -[WDRunWithCharacterProperties properties](self->wdCharacterRun, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDeletedOverridden") && (objc_msgSend(v7, "deleted") & 0xFFFFFF7F) == 1)
  {
    self->mIsDeleted = 1;
    goto LABEL_53;
  }
  if (!objc_msgSend(v7, "isHiddenOverridden") || objc_msgSend(v7, "hidden") != 1)
  {
    mText = self->mText;
    if (mText)
    {
      if (-[NSString length](mText, "length"))
      {
        v9 = -[NSString length](self->mText, "length");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v9)
          {
            for (i = 0; i != v9; ++i)
            {
              if (-[NSString characterAtIndex:](self->mText, "characterAtIndex:", i) == 12)
                objc_msgSend(v6, "setCurrentPage:", objc_msgSend(v6, "currentPage") + 1);
            }
          }
          if (!objc_msgSend(v6, "isOnPhone") || objc_msgSend(v6, "textLevel") > 0)
            goto LABEL_32;
          -[CMStyle propertyForName:](self->mStyle, "propertyForName:", 0x24F3D6298);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "value");
            v14 = v13;
            v15 = objc_msgSend(v12, "unitType");
            v16 = v14;
            if (v15 == 1 || v15 == 4)
            {
LABEL_23:
              if (v16 < 18.0)
              {
                if (v16 >= 8.0)
                  v18 = 17;
                else
                  v18 = 20;
                self->mFontSizeBumpFactor = v18;
                v19 = 1.7;
                if (v16 < 8.0)
                  v19 = 2.0;
                if ((float)(v16 * v19) > 18.0)
                  self->mFontSizeBumpFactor = 15;
              }
              goto LABEL_31;
            }
            if (v15 == 6)
            {
              v16 = v16 * 0.5;
              goto LABEL_23;
            }
          }
LABEL_31:

LABEL_32:
          if (v9)
          {
            v20 = 0;
            v21 = 0;
            v22 = v9;
            while (1)
            {
              v23 = -[NSString rangeOfString:options:range:](self->mText, "rangeOfString:options:range:", 0x24F3C6E38, 2, v20, v22);
              if (!v24)
                break;
              v25 = v23;
              if (v23 <= v20)
              {

                v21 = 0;
              }
              else
              {
                -[NSString substringWithRange:](self->mText, "substringWithRange:", v20, v23 - v20);
                v26 = objc_claimAutoreleasedReturnValue();

                v21 = (void *)v26;
                -[WMCharacterRunMapper mapSubstring:at:](self, "mapSubstring:at:", v26, v33);
                v20 = v25;
              }
              v27 = v20 + 1;
              if (v20 + 1 >= v9)
              {
                v29 = 1;
              }
              else
              {
                v28 = (v9 - v20);
                v29 = 1;
                while (-[NSString characterAtIndex:](self->mText, "characterAtIndex:", v27) == 9)
                {
                  v29 = (v29 + 1);
                  if (v9 == ++v27)
                  {
                    v29 = v28;
                    v20 = v9;
                    goto LABEL_45;
                  }
                }
              }
              v20 = v27;
LABEL_45:
              -[WMCharacterRunMapper mapTabs:at:afterText:](self, "mapTabs:at:afterText:", v29, v33, v21);
              v22 = v9 - v20;
              if (v9 == v20)
                goto LABEL_52;
            }
            v30 = self->mText;
            if (v20)
            {
              -[NSString substringWithRange:](v30, "substringWithRange:", v20, v22);
              v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v31 = v30;
            }
            v32 = v31;

            v21 = v32;
            -[WMCharacterRunMapper mapSubstring:at:](self, "mapSubstring:at:", v32, v33);
          }
          else
          {
            v21 = 0;
          }
LABEL_52:

        }
      }
    }
  }
LABEL_53:

}

- (BOOL)isDeleted
{
  return self->mIsDeleted;
}

+ (void)addNonCollapsableSpanAt:(id)a3 withState:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 160);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);
  objc_msgSend(v6, "addChild:", v5);

}

- (void)mapSubstring:(id)a3 at:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int mFontSizeBumpFactor;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->mFontSizeBumpFactor < 11)
  {
    +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 16, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addChild:", v7);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v7, self->mStyle);
  }
  else
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addChild:", v7);
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v7, self->mStyle);
    +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 16, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    mFontSizeBumpFactor = self->mFontSizeBumpFactor;
    if (mFontSizeBumpFactor == 17)
    {
      +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3C7218, CFSTR("bumpedFont17"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:", v10);
    }
    else
    {
      if (mFontSizeBumpFactor == 15)
        +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3C7218, CFSTR("bumpedFont15"));
      else
        +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3C7218, CFSTR("bumpedFont20"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAttribute:", v10);
    }

    objc_msgSend(v7, "addChild:", v8);
  }

}

- (void)mapTabs:(unsigned int)a3 at:(id)a4 afterText:(id)a5
{
  id v8;
  int v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v8 = a5;
  v9 = -[WMCharacterRunMapper defaultTabWidth](self, "defaultTabWidth");
  v10 = v9;
  if (v8)
  {
    v29 = v8;
    -[CMStyle properties](self->mStyle, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", 0x24F3D6298);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v12;
    if (v12)
    {
      objc_msgSend(v12, "value");
      v14 = (int)v13;
    }
    else
    {
      v14 = 10;
    }
    -[CMStyle properties](self->mStyle, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", 0x24F3D6278);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "value");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = CFSTR("Arial");
    }
    -[CMStyle properties](self->mStyle, "properties");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v19, "objectForKey:", 0x24F3D62D8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v19) = objc_msgSend(v20, "value");
    -[CMStyle properties](self->mStyle, "properties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", 0x24F3D6318);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "oi_sizeWithFontName:size:bold:italic:", v18, v14, v19 & 1, objc_msgSend(v22, "value") & 1);
    v15 = (int)v23 / v10 * v10 - (int)v23 + v10 * a3;

    v8 = v29;
  }
  else
  {
    v15 = v9 * a3;
  }
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addChild:", v24);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("padding-left:%d;"), v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3C9458, v24, v25);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8203);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addChild:", v27);
}

- (int)defaultTabWidth
{
  id WeakRetained;
  void *v4;
  int v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);

  if (!WeakRetained)
    return 36;
  -[CMMapper root](self, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (int)((double)(int)objc_msgSend(v4, "defaultTabWidth") / 20.0);
    if (v5)
      v6 = v5;
    else
      v6 = 36;
  }
  else
  {
    v6 = 36;
  }

  return v6;
}

- (WMCharacterRunMapper)initWithText:(id)a3
{
  id v5;
  WMCharacterRunMapper *v6;
  WMCharacterRunMapper *v7;
  WDCharacterRun *wdCharacterRun;
  WMStyle *v9;
  WMStyle *mStyle;
  WMCharacterRunMapper *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WMCharacterRunMapper;
  v6 = -[CMMapper init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    wdCharacterRun = v6->wdCharacterRun;
    v6->wdCharacterRun = 0;

    objc_storeWeak((id *)&v7->super.mParent, 0);
    objc_storeStrong((id *)&v7->mText, a3);
    v9 = objc_alloc_init(WMStyle);
    mStyle = v7->mStyle;
    v7->mStyle = v9;

    v11 = v7;
  }

  return v7;
}

- (void)map1At:(id)a3 withState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  CMLengthProperty *v13;
  id v14;

  v14 = a3;
  -[WDCharacterRun string](self->wdCharacterRun, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChild:", v7);
    v8 = -[WMCharacterRunMapper countAndStripLeadingTabs](self, "countAndStripLeadingTabs");
    +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChild:", v9);
    v10 = -[WMCharacterRunMapper copyCharacterStyle](self, "copyCharacterStyle");
    -[WDRunWithCharacterProperties properties](self->wdCharacterRun, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCharacterProperties:", v11);
    if (v8)
    {
      -[CMMapper root](self, "root");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_8;
      }
      v13 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)(objc_msgSend(v12, "defaultTabWidth") * v8));
      objc_msgSend(v10, "addProperty:forKey:", v13, 0x24F3E7078);

    }
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v7, v10);
LABEL_8:

  }
}

- (unsigned)countAndStripLeadingTabs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  WDCharacterRun *wdCharacterRun;
  void *v9;
  WDCharacterRun *v10;

  -[WDCharacterRun string](self->wdCharacterRun, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(v3, "characterAtIndex:", v5);
      if (v7 != 9 && v7 != 32)
        break;
      if (v7 == 9)
        ++v6;
      if (v4 == ++v5)
      {
        if (!v6)
          goto LABEL_15;
LABEL_9:
        wdCharacterRun = self->wdCharacterRun;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8203);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterRun setString:](wdCharacterRun, "setString:", v9);
        goto LABEL_14;
      }
    }
    if (!v6)
      goto LABEL_15;
    if (!v5)
      goto LABEL_9;
    v10 = self->wdCharacterRun;
    objc_msgSend(v3, "substringWithRange:", v5, v4 - v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterRun setString:](v10, "setString:", v9);
LABEL_14:

  }
  else
  {
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->wdCharacterRun, 0);
}

- (id)boldStyle
{
  WMStyle *v2;
  CMToggleProperty *v3;

  v2 = objc_alloc_init(WMStyle);
  v3 = -[CMToggleProperty initWithCMTogglePropertyValue:]([CMToggleProperty alloc], "initWithCMTogglePropertyValue:", 1);
  -[CMStyle addProperty:forKey:](v2, "addProperty:forKey:", v3, 0x24F3D62D8);

  return v2;
}

- (id)baseStyle
{
  void *v3;
  void *v4;
  WMStyle *v5;
  void *v6;
  void *v7;

  -[WDRunWithCharacterProperties properties](self->wdCharacterRun, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBaseStyleOverridden"))
  {
    objc_msgSend(v3, "baseStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WMStyle initWithWDStyle:]([WMStyle alloc], "initWithWDStyle:", v4);
  }
  else
  {
    -[WDRun paragraph](self->wdCharacterRun, "paragraph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isBaseStyleOverridden"))
    {
      objc_msgSend(v6, "baseStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[WMStyle initWithWDStyle:]([WMStyle alloc], "initWithWDStyle:", v7);

    }
    else
    {
      -[WMCharacterRunMapper boldStyle](self, "boldStyle");
      v5 = (WMStyle *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

@end
