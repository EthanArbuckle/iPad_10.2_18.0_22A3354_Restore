@implementation PMBulletMapper

- (PMBulletMapper)initWithOadProperties:(id)a3 fontSize:(int)a4 parent:(id)a5
{
  id v9;
  id v10;
  PMBulletMapper *v11;
  PMBulletMapper *v12;
  CMStyle *v13;
  CMStyle *mStyle;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PMBulletMapper;
  v11 = -[CMMapper initWithParent:](&v16, sel_initWithParent_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mProperties, a3);
    v13 = objc_alloc_init(CMStyle);
    mStyle = v12->mStyle;
    v12->mStyle = v13;

    v12->mFontSize = a4;
  }

  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  double v15;
  double v16;
  float v17;
  float v18;
  int v19;
  double v20;
  CMStyle *mStyle;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unsigned int v26;
  __int16 v27;

  v6 = a3;
  v7 = a4;
  -[OADParagraphProperties bulletProperties](self->mProperties, "bulletProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "listState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMBulletMapper makeBulletWithListState:](self, "makeBulletWithListState:", v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = -[PMBulletMapper bulletSize](self, "bulletSize");
          -[PMBulletMapper bulletFontName](self, "bulletFontName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v11;
          if (+[WMSymbolMapper isSymbolFontName:](WMSymbolMapper, "isSymbolFontName:", v12))
          {
            v13 = +[WMSymbolMapper mapCharacter:withFontName:](WMSymbolMapper, "mapCharacter:withFontName:", -[__CFString characterAtIndex:](v10, "characterAtIndex:", 0), v12);
            v27 = v13;
            if (v13)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v27, 1);
              v14 = objc_claimAutoreleasedReturnValue();

              v10 = (__CFString *)v14;
            }
            else
            {

              v10 = CFSTR("•");
            }

            v12 = 0;
            v11 = v26;
          }
          -[__CFString oi_sizeWithFontName:size:](v10, "oi_sizeWithFontName:size:", v12, v11);
          v16 = v15;
          -[OADParagraphProperties indent](self->mProperties, "indent");
          v18 = v17;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = (int)(float)((float)-(int)v16 - v18) + 20;
          else
            v19 = (int)(float)((float)-(int)v16 - v18);
          -[OADParagraphProperties nonOveridenLeftMargin](self->mProperties, "nonOveridenLeftMargin");
          if (v20 != 0.0)
          {
            mStyle = self->mStyle;
            -[OADParagraphProperties nonOveridenLeftMargin](self->mProperties, "nonOveridenLeftMargin");
            -[CMStyle appendPropertyForName:length:unit:](mStyle, "appendPropertyForName:length:unit:", 0x24F3D5678, 1, -v22);
            -[OADParagraphProperties nonOveridenLeftMargin](self->mProperties, "nonOveridenLeftMargin");
            v19 = (int)(v23 + (double)v19);
          }
          if (v19 >= 1)
            -[CMStyle appendPropertyForName:length:unit:](self->mStyle, "appendPropertyForName:length:unit:", 0x24F3E7098, 1, (double)v19);
          +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[OIXMLTextNode textNodeWithStringValue:](OIXMLTextNode, "textNodeWithStringValue:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addChild:", v25);

          -[CMStyle appendPropertyForName:intValue:](self->mStyle, "appendPropertyForName:intValue:", 0x24F3D6298, v26);
          -[PMBulletMapper mapBulletColorWithState:](self, "mapBulletColorWithState:", v7);
          -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v24, self->mStyle);
          objc_msgSend(v6, "addChild:", v24);

        }
      }
    }
  }

}

- (id)makeBulletWithListState:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  __CFString *v7;

  v4 = a3;
  -[OADParagraphProperties bulletProperties](self->mProperties, "bulletProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[OADParagraphProperties level](self->mProperties, "level");
    +[PMBulletMapper stringForIndex:withFormat:](PMBulletMapper, "stringForIndex:withFormat:", objc_msgSend(v4, "counterAtLevel:", v6) + 1, objc_msgSend(v5, "autoNumberSchemeType"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "increaseCounterAtLevel:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "bullet");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = CFSTR("•");
      else
        v7 = 0;
    }
  }

  return v7;
}

- (int)bulletSize
{
  void *v3;
  int v4;
  int mFontSize;
  float v6;
  float v7;
  float v8;
  int v9;
  float v10;

  if (-[OADParagraphProperties hasBulletSize](self->mProperties, "hasBulletSize"))
  {
    -[OADParagraphProperties bulletSize](self->mProperties, "bulletSize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "points");
LABEL_16:

      return v4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mFontSize = self->mFontSize;
      if (mFontSize)
        v6 = (float)mFontSize;
      else
        -[OADCharacterProperties size](self->mProperties, "size");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v4 = 18;
        goto LABEL_16;
      }
      objc_msgSend(v3, "percent");
      v8 = v7;
      v9 = self->mFontSize;
      if (v9)
        v10 = (float)v9;
      else
        -[OADCharacterProperties size](self->mProperties, "size");
      v6 = (float)(v8 / 100.0) * v10;
    }
    v4 = (int)v6;
    goto LABEL_16;
  }
  return 18;
}

- (id)bulletFontName
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[OADParagraphProperties hasBulletFont](self->mProperties, "hasBulletFont"))
  {
    -[OADParagraphProperties bulletFont](self->mProperties, "bulletFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "font");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_9;
      }
      -[OADCharacterProperties latinFont](self->mProperties, "latinFont");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
LABEL_9:

    return v5;
  }
  v5 = 0;
  return v5;
}

- (void)mapBulletColorWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[OADParagraphProperties hasBulletColor](self->mProperties, "hasBulletColor"))
  {
    -[OADParagraphProperties bulletColor](self->mProperties, "bulletColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "color");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      -[OADCharacterProperties fill](self->mProperties, "fill");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v6, "color");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

      if (!v5)
        goto LABEL_12;
    }
    +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v5, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMStyle appendPropertyForName:stringWithColons:](self->mStyle, "appendPropertyForName:stringWithColons:", 0x24F3E6678, v10);
LABEL_12:

  }
}

+ (id)stringForIndex:(unint64_t)a3 withFormat:(int)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if ((a4 - 1) > 0x14)
    v6 = 0;
  else
    v6 = dword_22A4D5610[a4 - 1];
  +[CMNumberFormatter formatterForNumberFormat:language:](CMNumberFormatter, "formatterForNumberFormat:language:", v6, 1033);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForNumber:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 - 3) >= 0x13)
    v9 = CFSTR("(%@)");
  else
    v9 = off_24F3BFA70[a4 - 3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
