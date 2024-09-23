@implementation OADCharacterProperties

+ (void)initialize
{
  OADEffect *v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[OADEffect initWithType:]([OADEffect alloc], "initWithType:", 6);
    v3 = (void *)kOADAutoTextShadowEffect;
    kOADAutoTextShadowEffect = (uint64_t)v2;

  }
}

- (OADCharacterProperties)initWithDefaults
{
  OADCharacterProperties *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  OADCharacterProperties *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OADCharacterProperties;
  v2 = -[OADProperties initWithDefaults](&v12, sel_initWithDefaults);
  if (v2)
  {
    +[OADSolidFill blackFill](OADSolidFill, "blackFill");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setFill:](v2, "setFill:", v3);

    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setStroke:](v2, "setStroke:", v4);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setEffects:](v2, "setEffects:", v5);

    -[OADCharacterProperties setHighlight:](v2, "setHighlight:", 0);
    -[OADCharacterProperties setUnderlineFill:](v2, "setUnderlineFill:", 0);
    -[OADCharacterProperties setUnderlineStroke:](v2, "setUnderlineStroke:", 0);
    LODWORD(v6) = 1.0;
    -[OADCharacterProperties setOpacity:](v2, "setOpacity:", v6);
    -[OADCharacterProperties setIsBold:](v2, "setIsBold:", 0);
    -[OADCharacterProperties setIsItalic:](v2, "setIsItalic:", 0);
    -[OADCharacterProperties setUnderlineType:](v2, "setUnderlineType:", 0);
    -[OADCharacterProperties setFormatType:](v2, "setFormatType:", 0);
    -[OADCharacterProperties setFormatKerningType:](v2, "setFormatKerningType:", 0);
    -[OADCharacterProperties setStrikeThroughType:](v2, "setStrikeThroughType:", 0);
    LODWORD(v7) = 18.0;
    -[OADCharacterProperties setSize:](v2, "setSize:", v7);
    LODWORD(v8) = 0;
    -[OADCharacterProperties setSpacing:](v2, "setSpacing:", v8);
    -[OADCharacterProperties setIsVerticalText:](v2, "setIsVerticalText:", 0);
    LODWORD(v9) = 0;
    -[OADCharacterProperties setBaseline:](v2, "setBaseline:", v9);
    -[OADCharacterProperties setIsHorizontalNormalized:](v2, "setIsHorizontalNormalized:", 0);
    -[OADCharacterProperties setCaps:](v2, "setCaps:", 0);
    -[OADCharacterProperties setLanguage:](v2, "setLanguage:", 0);
    -[OADCharacterProperties setLatinFont:](v2, "setLatinFont:", &stru_24F3BFFF8);
    -[OADCharacterProperties setEastAsianFont:](v2, "setEastAsianFont:", &stru_24F3BFFF8);
    -[OADCharacterProperties setBidiFont:](v2, "setBidiFont:", &stru_24F3BFFF8);
    -[OADCharacterProperties setHAnsiFont:](v2, "setHAnsiFont:", &stru_24F3BFFF8);
    -[OADCharacterProperties setSymbolFont:](v2, "setSymbolFont:", &stru_24F3BFFF8);
    v10 = v2;
  }

  return v2;
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setOpacity:(float)a3
{
  self->mOpacity = a3;
  *((_BYTE *)self + 156) |= 8u;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->mHighlight, a3);
  *((_BYTE *)self + 156) |= 4u;
}

- (void)setIsBold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 156) = *((_BYTE *)self + 156) & 0xDF | v3;
  *((_BYTE *)self + 156) |= 0x10u;
}

- (void)setIsItalic:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 156) = v3 & 0x80 | *((_BYTE *)self + 156) & 0x7F;
  *((_BYTE *)self + 156) |= 0x40u;
}

- (void)setFormatType:(unsigned __int8)a3
{
  self->mFormatType = a3;
  *((_BYTE *)self + 157) |= 2u;
}

- (void)setFormatKerningType:(unsigned __int8)a3
{
  self->mFormatKerningType = a3;
  *((_BYTE *)self + 157) |= 4u;
}

- (void)setStrikeThroughType:(unsigned __int8)a3
{
  self->mStrikeThroughType = a3;
  *((_BYTE *)self + 157) |= 8u;
}

- (void)setSize:(float)a3
{
  self->mSize = a3;
  *((_BYTE *)self + 157) |= 0x10u;
}

- (void)setSpacing:(float)a3
{
  self->mSpacing = a3;
  *((_BYTE *)self + 157) |= 0x20u;
}

- (void)setIsVerticalText:(BOOL)a3
{
  *((_BYTE *)self + 158) = *((_BYTE *)self + 158) & 0xFE | a3;
  *((_BYTE *)self + 157) |= 0x80u;
}

- (void)setBaseline:(float)a3
{
  self->mBaseline = a3;
  *((_BYTE *)self + 158) |= 8u;
}

- (void)setIsHorizontalNormalized:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 158) = *((_BYTE *)self + 158) & 0xDF | v3;
  *((_BYTE *)self + 158) |= 0x10u;
}

- (void)setCaps:(unsigned __int8)a3
{
  *((_BYTE *)self + 158) |= 0x40u;
  self->mCaps = a3;
}

- (void)setLatinFont:(id)a3
{
  NSString *v4;
  NSString *mLatinFont;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mLatinFont = self->mLatinFont;
  self->mLatinFont = v4;

}

- (void)setEastAsianFont:(id)a3
{
  NSString *v4;
  NSString *mEastAsianFont;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mEastAsianFont = self->mEastAsianFont;
  self->mEastAsianFont = v4;

}

- (void)setBidiFont:(id)a3
{
  NSString *v4;
  NSString *mBidiFont;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mBidiFont = self->mBidiFont;
  self->mBidiFont = v4;

}

- (void)setHAnsiFont:(id)a3
{
  NSString *v4;
  NSString *mHAnsiFont;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mHAnsiFont = self->mHAnsiFont;
  self->mHAnsiFont = v4;

}

- (void)setSymbolFont:(id)a3
{
  NSString *v4;
  NSString *mSymbolFont;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  mSymbolFont = self->mSymbolFont;
  self->mSymbolFont = v4;

}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->mEffects, a3);
}

- (BOOL)hasStroke
{
  return self->mStroke || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasFill
{
  return self->mFill || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)fill
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFill);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[10];

  return v3;
}

- (BOOL)hasOpacity
{
  return (*((_BYTE *)self + 156) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasHighlight
{
  return (*((_BYTE *)self + 156) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasIsBold
{
  return (*((_BYTE *)self + 156) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isBold
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsBold);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[156] >> 5) & 1;

  return v3;
}

- (BOOL)hasIsItalic
{
  return (*((_BYTE *)self + 156) & 0x40) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isItalic
{
  unsigned __int8 *v2;
  unsigned int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsItalic);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = v2[156];

  return v3 >> 7;
}

- (BOOL)hasEffects
{
  return self->mEffects || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)effects
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasEffects);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (BOOL)hasFormatType
{
  return (*((_BYTE *)self + 157) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)formatType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFormatType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[145];

  return v3;
}

- (BOOL)hasFormatKerningType
{
  return (*((_BYTE *)self + 157) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasStrikeThroughType
{
  return (*((_BYTE *)self + 157) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)strikeThroughType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasStrikeThroughType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[147];

  return v3;
}

- (BOOL)hasSize
{
  return (*((_BYTE *)self + 157) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)size
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasSize);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[33];

  return v3;
}

- (BOOL)hasSpacing
{
  return (*((_BYTE *)self + 157) & 0x20) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasIsVerticalText
{
  return *((char *)self + 157) < 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasBaseline
{
  return (*((_BYTE *)self + 158) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)baseline
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBaseline);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[35];

  return v3;
}

- (BOOL)hasIsHorizontalNormalized
{
  return (*((_BYTE *)self + 158) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasCaps
{
  return (*((_BYTE *)self + 158) & 0x40) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasLatinFont
{
  NSString *mLatinFont;

  mLatinFont = self->mLatinFont;
  return mLatinFont && -[NSString length](mLatinFont, "length")
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)latinFont
{
  id *v2;
  id v3;
  void *v4;
  id v5;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLatinFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)hasEastAsianFont
{
  NSString *mEastAsianFont;

  mEastAsianFont = self->mEastAsianFont;
  return mEastAsianFont && -[NSString length](mEastAsianFont, "length")
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasBidiFont
{
  NSString *mBidiFont;

  mBidiFont = self->mBidiFont;
  return mBidiFont && -[NSString length](mBidiFont, "length")
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasHAnsiFont
{
  NSString *mHAnsiFont;

  mHAnsiFont = self->mHAnsiFont;
  return mHAnsiFont && -[NSString length](mHAnsiFont, "length")
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasSymbolFont
{
  NSString *mSymbolFont;

  mSymbolFont = self->mSymbolFont;
  return mSymbolFont && -[NSString length](mSymbolFont, "length")
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)clickHyperlink
{
  return self->mClickHyperlink;
}

- (id)hoverHyperlink
{
  return self->mHoverHyperlink;
}

- (id)eastAsianFont
{
  id *v2;
  id v3;
  void *v4;
  id v5;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasEastAsianFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)symbolFont
{
  id *v2;
  id v3;
  void *v4;
  id v5;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasSymbolFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  OADStroke *mStroke;
  objc_object *v8;
  OADStroke *v9;
  OADFill *mFill;
  objc_object *v11;
  OADFill *v12;
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  NSArray *mEffects;
  void *v20;
  float v21;
  float v22;
  double v23;
  void *v24;
  objc_object *v25;
  objc_object *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  OADColor *mHighlight;
  void *v31;
  objc_object *v32;
  objc_object *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  OADFill *mUnderlineFill;
  void *v38;
  objc_object *v39;
  objc_object *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  OADStroke *mUnderlineStroke;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  float v58;
  float v59;
  double v60;
  void *v61;
  float v62;
  float v63;
  double v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  void *v69;
  float v70;
  float v71;
  double v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  void *v79;
  objc_object *v80;
  objc_object *v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  NSString *mLatinFont;
  void *v86;
  objc_object *v87;
  objc_object *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  NSString *mEastAsianFont;
  void *v93;
  objc_object *v94;
  objc_object *v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  NSString *mBidiFont;
  void *v100;
  objc_object *v101;
  objc_object *v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  NSString *mHAnsiFont;
  void *v107;
  objc_object *v108;
  objc_object *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  NSString *mSymbolFont;
  OADHyperlink *mClickHyperlink;
  void *v115;
  void *v116;
  OADHyperlink *v117;
  OADHyperlink *mHoverHyperlink;
  void *v119;
  void *v120;
  OADHyperlink *v121;
  objc_super v122;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  -[OADProperties parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mStroke = self->mStroke;
  objc_msgSend(v6, "stroke");
  v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
  LODWORD(mStroke) = TCObjectEqual((objc_object *)mStroke, v8);

  if ((_DWORD)mStroke)
  {
    v9 = self->mStroke;
    self->mStroke = 0;

  }
  mFill = self->mFill;
  objc_msgSend(v6, "fill");
  v11 = (objc_object *)objc_claimAutoreleasedReturnValue();
  LODWORD(mFill) = TCObjectEqual((objc_object *)mFill, v11);

  if ((_DWORD)mFill)
  {
    v12 = self->mFill;
    self->mFill = 0;

  }
  if (-[OADCharacterProperties hasEffects](self, "hasEffects"))
  {
    -[OADProperties parent](self, "parent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties effects](self, "effects");
    v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effects");
    v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v14, "removeUnnecessaryOverrides");
      v16 = objc_opt_class();
      if (v16 != objc_opt_class())
        goto LABEL_13;
      v17 = -[objc_object isMergedWithParent](v14, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", 0);
      v18 = -[objc_object isAnythingOverridden](v14, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", v17);
      if ((v18 & 1) != 0)
        goto LABEL_13;
    }
    else if (!TCObjectEqual(v14, v15))
    {
LABEL_13:

      goto LABEL_14;
    }
    mEffects = self->mEffects;
    self->mEffects = 0;

    goto LABEL_13;
  }
LABEL_14:
  if (-[OADCharacterProperties hasOpacity](self, "hasOpacity"))
  {
    -[OADProperties parent](self, "parent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties opacity](self, "opacity");
    v22 = v21;
    objc_msgSend(v20, "opacity");
    if (v22 == *(float *)&v23)
    {
      LODWORD(v23) = 1.0;
      -[OADCharacterProperties setOpacity:](self, "setOpacity:", v23);
      *((_BYTE *)self + 156) &= ~8u;
    }

  }
  if (-[OADCharacterProperties hasHighlight](self, "hasHighlight"))
  {
    -[OADProperties parent](self, "parent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties highlight](self, "highlight");
    v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "highlight");
    v26 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v25, "removeUnnecessaryOverrides");
      v27 = objc_opt_class();
      if (v27 != objc_opt_class())
        goto LABEL_25;
      v28 = -[objc_object isMergedWithParent](v25, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v25, "setMergedWithParent:", 0);
      v29 = -[objc_object isAnythingOverridden](v25, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v25, "setMergedWithParent:", v28);
      if ((v29 & 1) != 0)
        goto LABEL_25;
    }
    else if (!TCObjectEqual(v25, v26))
    {
LABEL_25:

      goto LABEL_26;
    }
    mHighlight = self->mHighlight;
    self->mHighlight = 0;

    *((_BYTE *)self + 156) &= ~4u;
    goto LABEL_25;
  }
LABEL_26:
  if (!-[OADCharacterProperties hasUnderlineFill](self, "hasUnderlineFill"))
    goto LABEL_34;
  -[OADProperties parent](self, "parent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADCharacterProperties underlineFill](self, "underlineFill");
  v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "underlineFill");
  v33 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v32, "removeUnnecessaryOverrides");
    v34 = objc_opt_class();
    if (v34 != objc_opt_class())
      goto LABEL_33;
    v35 = -[objc_object isMergedWithParent](v32, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v32, "setMergedWithParent:", 0);
    v36 = -[objc_object isAnythingOverridden](v32, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v32, "setMergedWithParent:", v35);
    if ((v36 & 1) != 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (TCObjectEqual(v32, v33))
  {
LABEL_32:
    mUnderlineFill = self->mUnderlineFill;
    self->mUnderlineFill = 0;

    *((_BYTE *)self + 156) &= ~1u;
  }
LABEL_33:

LABEL_34:
  if (!-[OADCharacterProperties hasUnderlineStroke](self, "hasUnderlineStroke"))
    goto LABEL_42;
  -[OADProperties parent](self, "parent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADCharacterProperties underlineStroke](self, "underlineStroke");
  v39 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "underlineStroke");
  v40 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v39, "removeUnnecessaryOverrides");
    v41 = objc_opt_class();
    if (v41 != objc_opt_class())
      goto LABEL_41;
    v42 = -[objc_object isMergedWithParent](v39, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v39, "setMergedWithParent:", 0);
    v43 = -[objc_object isAnythingOverridden](v39, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v39, "setMergedWithParent:", v42);
    if ((v43 & 1) != 0)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (TCObjectEqual(v39, v40))
  {
LABEL_40:
    mUnderlineStroke = self->mUnderlineStroke;
    self->mUnderlineStroke = 0;

    *((_BYTE *)self + 156) &= ~2u;
  }
LABEL_41:

LABEL_42:
  if (-[OADCharacterProperties hasIsBold](self, "hasIsBold"))
  {
    -[OADProperties parent](self, "parent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[OADCharacterProperties isBold](self, "isBold");
    if (v46 == objc_msgSend(v45, "isBold"))
    {
      -[OADCharacterProperties setIsBold:](self, "setIsBold:", 0);
      *((_BYTE *)self + 156) &= ~0x10u;
    }

  }
  if (-[OADCharacterProperties hasIsItalic](self, "hasIsItalic"))
  {
    -[OADProperties parent](self, "parent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[OADCharacterProperties isItalic](self, "isItalic");
    if (v48 == objc_msgSend(v47, "isItalic"))
    {
      -[OADCharacterProperties setIsItalic:](self, "setIsItalic:", 0);
      *((_BYTE *)self + 156) &= ~0x40u;
    }

  }
  if (-[OADCharacterProperties hasUnderlineType](self, "hasUnderlineType"))
  {
    -[OADProperties parent](self, "parent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[OADCharacterProperties underlineType](self, "underlineType");
    if (v50 == objc_msgSend(v49, "underlineType"))
    {
      -[OADCharacterProperties setUnderlineType:](self, "setUnderlineType:", 0);
      *((_BYTE *)self + 157) &= ~1u;
    }

  }
  if (-[OADCharacterProperties hasFormatType](self, "hasFormatType"))
  {
    -[OADProperties parent](self, "parent");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[OADCharacterProperties formatType](self, "formatType");
    if (v52 == objc_msgSend(v51, "formatType"))
    {
      -[OADCharacterProperties setFormatType:](self, "setFormatType:", 0);
      *((_BYTE *)self + 157) &= ~2u;
    }

  }
  if (-[OADCharacterProperties hasFormatKerningType](self, "hasFormatKerningType"))
  {
    -[OADProperties parent](self, "parent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[OADCharacterProperties formatKerningType](self, "formatKerningType");
    if (v54 == objc_msgSend(v53, "formatKerningType"))
    {
      -[OADCharacterProperties setFormatKerningType:](self, "setFormatKerningType:", 0);
      *((_BYTE *)self + 157) &= ~4u;
    }

  }
  if (-[OADCharacterProperties hasStrikeThroughType](self, "hasStrikeThroughType"))
  {
    -[OADProperties parent](self, "parent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[OADCharacterProperties strikeThroughType](self, "strikeThroughType");
    if (v56 == objc_msgSend(v55, "strikeThroughType"))
    {
      -[OADCharacterProperties setStrikeThroughType:](self, "setStrikeThroughType:", 0);
      *((_BYTE *)self + 157) &= ~8u;
    }

  }
  if (-[OADCharacterProperties hasSize](self, "hasSize"))
  {
    -[OADProperties parent](self, "parent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties size](self, "size");
    v59 = v58;
    objc_msgSend(v57, "size");
    if (v59 == *(float *)&v60)
    {
      LODWORD(v60) = 18.0;
      -[OADCharacterProperties setSize:](self, "setSize:", v60);
      *((_BYTE *)self + 157) &= ~0x10u;
    }

  }
  if (-[OADCharacterProperties hasSpacing](self, "hasSpacing"))
  {
    -[OADProperties parent](self, "parent");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties spacing](self, "spacing");
    v63 = v62;
    objc_msgSend(v61, "spacing");
    if (v63 == *(float *)&v64)
    {
      LODWORD(v64) = 0;
      -[OADCharacterProperties setSpacing:](self, "setSpacing:", v64);
      *((_BYTE *)self + 157) &= ~0x20u;
    }

  }
  if (-[OADCharacterProperties hasIsVerticalText](self, "hasIsVerticalText"))
  {
    -[OADProperties parent](self, "parent");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[OADCharacterProperties isVerticalText](self, "isVerticalText");
    if (v66 == objc_msgSend(v65, "isVerticalText"))
    {
      -[OADCharacterProperties setIsVerticalText:](self, "setIsVerticalText:", 0);
      *((_BYTE *)self + 157) &= ~0x80u;
    }

  }
  if (-[OADCharacterProperties hasIsRightToLeft](self, "hasIsRightToLeft"))
  {
    -[OADProperties parent](self, "parent");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[OADCharacterProperties isRightToLeft](self, "isRightToLeft");
    if (v68 == objc_msgSend(v67, "isRightToLeft"))
    {
      -[OADCharacterProperties setIsRightToLeft:](self, "setIsRightToLeft:", 0);
      *((_BYTE *)self + 158) &= ~2u;
    }

  }
  if (-[OADCharacterProperties hasBaseline](self, "hasBaseline"))
  {
    -[OADProperties parent](self, "parent");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties baseline](self, "baseline");
    v71 = v70;
    objc_msgSend(v69, "baseline");
    if (v71 == *(float *)&v72)
    {
      LODWORD(v72) = 0;
      -[OADCharacterProperties setBaseline:](self, "setBaseline:", v72);
      *((_BYTE *)self + 158) &= ~8u;
    }

  }
  if (-[OADCharacterProperties hasIsHorizontalNormalized](self, "hasIsHorizontalNormalized"))
  {
    -[OADProperties parent](self, "parent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = -[OADCharacterProperties isHorizontalNormalized](self, "isHorizontalNormalized");
    if (v74 == objc_msgSend(v73, "isHorizontalNormalized"))
    {
      -[OADCharacterProperties setIsHorizontalNormalized:](self, "setIsHorizontalNormalized:", 0);
      *((_BYTE *)self + 158) &= ~0x10u;
    }

  }
  if (-[OADCharacterProperties hasCaps](self, "hasCaps"))
  {
    -[OADProperties parent](self, "parent");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = -[OADCharacterProperties caps](self, "caps");
    if (v76 == objc_msgSend(v75, "caps"))
    {
      -[OADCharacterProperties setCaps:](self, "setCaps:", 0);
      *((_BYTE *)self + 158) &= ~0x40u;
    }

  }
  if (-[OADCharacterProperties hasLanguage](self, "hasLanguage"))
  {
    -[OADProperties parent](self, "parent");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[OADCharacterProperties language](self, "language");
    if (v78 == objc_msgSend(v77, "language"))
    {
      -[OADCharacterProperties setLanguage:](self, "setLanguage:", 0);
      *((_BYTE *)self + 158) &= ~0x80u;
    }

  }
  if (-[OADCharacterProperties hasLatinFont](self, "hasLatinFont"))
  {
    -[OADProperties parent](self, "parent");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties latinFont](self, "latinFont");
    v80 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "latinFont");
    v81 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v80, "removeUnnecessaryOverrides");
      v82 = objc_opt_class();
      if (v82 != objc_opt_class())
        goto LABEL_105;
      v83 = -[objc_object isMergedWithParent](v80, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v80, "setMergedWithParent:", 0);
      v84 = -[objc_object isAnythingOverridden](v80, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v80, "setMergedWithParent:", v83);
      if ((v84 & 1) != 0)
        goto LABEL_105;
    }
    else if (!TCObjectEqual(v80, v81))
    {
LABEL_105:

      goto LABEL_106;
    }
    mLatinFont = self->mLatinFont;
    self->mLatinFont = 0;

    goto LABEL_105;
  }
LABEL_106:
  if (!-[OADCharacterProperties hasEastAsianFont](self, "hasEastAsianFont"))
    goto LABEL_114;
  -[OADProperties parent](self, "parent");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADCharacterProperties eastAsianFont](self, "eastAsianFont");
  v87 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "eastAsianFont");
  v88 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v87, "removeUnnecessaryOverrides");
    v89 = objc_opt_class();
    if (v89 != objc_opt_class())
      goto LABEL_113;
    v90 = -[objc_object isMergedWithParent](v87, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v87, "setMergedWithParent:", 0);
    v91 = -[objc_object isAnythingOverridden](v87, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v87, "setMergedWithParent:", v90);
    if ((v91 & 1) != 0)
      goto LABEL_113;
    goto LABEL_112;
  }
  if (TCObjectEqual(v87, v88))
  {
LABEL_112:
    mEastAsianFont = self->mEastAsianFont;
    self->mEastAsianFont = 0;

  }
LABEL_113:

LABEL_114:
  if (!-[OADCharacterProperties hasBidiFont](self, "hasBidiFont"))
    goto LABEL_122;
  -[OADProperties parent](self, "parent");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADCharacterProperties bidiFont](self, "bidiFont");
  v94 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "bidiFont");
  v95 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v94, "removeUnnecessaryOverrides");
    v96 = objc_opt_class();
    if (v96 != objc_opt_class())
      goto LABEL_121;
    v97 = -[objc_object isMergedWithParent](v94, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v94, "setMergedWithParent:", 0);
    v98 = -[objc_object isAnythingOverridden](v94, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v94, "setMergedWithParent:", v97);
    if ((v98 & 1) != 0)
      goto LABEL_121;
    goto LABEL_120;
  }
  if (TCObjectEqual(v94, v95))
  {
LABEL_120:
    mBidiFont = self->mBidiFont;
    self->mBidiFont = 0;

  }
LABEL_121:

LABEL_122:
  if (!-[OADCharacterProperties hasHAnsiFont](self, "hasHAnsiFont"))
    goto LABEL_130;
  -[OADProperties parent](self, "parent");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADCharacterProperties hansiFont](self, "hansiFont");
  v101 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "hansiFont");
  v102 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v101, "removeUnnecessaryOverrides");
    v103 = objc_opt_class();
    if (v103 != objc_opt_class())
      goto LABEL_129;
    v104 = -[objc_object isMergedWithParent](v101, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v101, "setMergedWithParent:", 0);
    v105 = -[objc_object isAnythingOverridden](v101, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v101, "setMergedWithParent:", v104);
    if ((v105 & 1) != 0)
      goto LABEL_129;
    goto LABEL_128;
  }
  if (TCObjectEqual(v101, v102))
  {
LABEL_128:
    mHAnsiFont = self->mHAnsiFont;
    self->mHAnsiFont = 0;

  }
LABEL_129:

LABEL_130:
  if (-[OADCharacterProperties hasSymbolFont](self, "hasSymbolFont"))
  {
    -[OADProperties parent](self, "parent");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties symbolFont](self, "symbolFont");
    v108 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "symbolFont");
    v109 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v108, "removeUnnecessaryOverrides");
      v110 = objc_opt_class();
      if (v110 != objc_opt_class())
        goto LABEL_137;
      v111 = -[objc_object isMergedWithParent](v108, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v108, "setMergedWithParent:", 0);
      v112 = -[objc_object isAnythingOverridden](v108, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v108, "setMergedWithParent:", v111);
      if ((v112 & 1) != 0)
        goto LABEL_137;
    }
    else if (!TCObjectEqual(v108, v109))
    {
LABEL_137:

      goto LABEL_138;
    }
    mSymbolFont = self->mSymbolFont;
    self->mSymbolFont = 0;

    goto LABEL_137;
  }
LABEL_138:
  mClickHyperlink = self->mClickHyperlink;
  -[OADProperties parent](self, "parent");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "clickHyperlink");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(mClickHyperlink) = -[OADHyperlink isEqual:](mClickHyperlink, "isEqual:", v116);

  if ((_DWORD)mClickHyperlink)
  {
    v117 = self->mClickHyperlink;
    self->mClickHyperlink = 0;

  }
  mHoverHyperlink = self->mHoverHyperlink;
  -[OADProperties parent](self, "parent");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "hoverHyperlink");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(mHoverHyperlink) = -[OADHyperlink isEqual:](mHoverHyperlink, "isEqual:", v120);

  if ((_DWORD)mHoverHyperlink)
  {
    v121 = self->mHoverHyperlink;
    self->mHoverHyperlink = 0;

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v122.receiver = self;
  v122.super_class = (Class)OADCharacterProperties;
  -[OADProperties removeUnnecessaryOverrides](&v122, sel_removeUnnecessaryOverrides);

}

- (unsigned)caps
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasCaps);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[148];

  return v3;
}

- (float)spacing
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasSpacing);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[34];

  return v3;
}

- (unsigned)formatKerningType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFormatKerningType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[146];

  return v3;
}

- (id)hansiFont
{
  id *v2;
  id v3;
  void *v4;
  id v5;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasHAnsiFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[6];

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setStroke:(id)a3
{
  objc_storeStrong((id *)&self->mStroke, a3);
}

- (void)setClickHyperlink:(id)a3
{
  objc_storeStrong((id *)&self->mClickHyperlink, a3);
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  uint64_t v17;
  NSUInteger v19;
  NSUInteger v20;
  objc_super v21;

  v20 = -[NSString hash](self->mLatinFont, "hash");
  v19 = -[NSString hash](self->mEastAsianFont, "hash");
  v3 = -[NSString hash](self->mBidiFont, "hash");
  v4 = -[NSString hash](self->mHAnsiFont, "hash");
  v5 = -[NSString hash](self->mSymbolFont, "hash");
  v6 = -[OADHyperlink hash](self->mClickHyperlink, "hash");
  v7 = -[OADHyperlink hash](self->mHoverHyperlink, "hash");
  v8 = -[OADStroke hash](self->mStroke, "hash");
  v9 = -[OADFill hash](self->mFill, "hash");
  v10 = -[OADColor hash](self->mHighlight, "hash");
  v11 = -[OADFill hash](self->mUnderlineFill, "hash");
  v12 = v19 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[OADStroke hash](self->mUnderlineStroke, "hash");
  if (-[NSArray count](self->mEffects, "count"))
  {
    v13 = 0;
    v14 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->mEffects, "objectAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 ^= objc_msgSend(v15, "hash");

      v13 = v14;
    }
    while (-[NSArray count](self->mEffects, "count") > v14++);
  }
  v17 = ((int)self->mSize ^ (int)self->mOpacity ^ (int)self->mSpacing ^ (int)self->mBaseline ^ self->mFormatType ^ self->mFormatKerningType ^ self->mStrikeThroughType ^ self->mCaps ^ ((*((_BYTE *)self + 156) & 0x20) != 0) ^ (*((_BYTE *)self + 156) >> 7) ^ self->mUnderlineType ^ *((_BYTE *)self + 158) & 1 ^ ((*((_BYTE *)self + 158) & 0x20) != 0));
  v21.receiver = self;
  v21.super_class = (Class)OADCharacterProperties;
  return v12 ^ -[OADProperties hash](&v21, sel_hash) ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  float v12;
  float v13;
  float v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  float v30;
  float v31;
  float v32;
  int v33;
  float v34;
  float v35;
  float v36;
  int v37;
  int v38;
  int v39;
  float v40;
  float v41;
  float v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  BOOL v49;
  objc_super v51;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_object **)v4;
    v6 = -[OADProperties isMerged](self, "isMerged");
    v7 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    v8 = objc_msgSend(v5, "isMerged");
    v9 = objc_msgSend(v5, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    objc_msgSend(v5, "setMerged:", 0);
    objc_msgSend(v5, "setMergedWithParent:", 0);
    v10 = -[OADCharacterProperties hash](self, "hash");
    if (v10 != objc_msgSend(v5, "hash"))
      goto LABEL_70;
    if (!TCObjectEqual((objc_object *)self->mFill, v5[10]))
      goto LABEL_70;
    if (!TCObjectEqual((objc_object *)self->mStroke, v5[11]))
      goto LABEL_70;
    if (!TCObjectEqual((objc_object *)self->mEffects, v5[12]))
      goto LABEL_70;
    if (!TCObjectEqual((objc_object *)self->mHighlight, v5[15]))
      goto LABEL_70;
    v11 = objc_msgSend(v5, "hasOpacity");
    if (v11 != -[OADCharacterProperties hasOpacity](self, "hasOpacity"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasOpacity"))
    {
      objc_msgSend(v5, "opacity");
      v13 = v12;
      -[OADCharacterProperties opacity](self, "opacity");
      if (v13 != v14)
        goto LABEL_70;
    }
    if ((*((_BYTE *)self + 157) & 1) != (*((_BYTE *)v5 + 157) & 1)
      || (*((_BYTE *)self + 157) & 1) != 0 && self->mUnderlineType != *((unsigned __int8 *)v5 + 144))
    {
      goto LABEL_70;
    }
    if ((*((_BYTE *)self + 156) & 1) != (*((_BYTE *)v5 + 156) & 1)
      || (*((_BYTE *)self + 156) & 1) != 0 && !TCObjectEqual((objc_object *)self->mUnderlineFill, v5[13]))
    {
      goto LABEL_70;
    }
    if (((*((unsigned __int8 *)v5 + 156) >> 1) & 1) != (*((_BYTE *)self + 156) & 2) >> 1
      || (*((_BYTE *)self + 156) & 2) != 0
      && !TCObjectEqual((objc_object *)self->mUnderlineStroke, v5[14]))
    {
      goto LABEL_70;
    }
    if (((*((unsigned __int8 *)v5 + 156) >> 2) & 1) != (*((_BYTE *)self + 156) & 4) >> 2
      || (*((_BYTE *)self + 156) & 4) != 0 && !TCObjectEqual((objc_object *)self->mHighlight, v5[15]))
    {
      goto LABEL_70;
    }
    v15 = objc_msgSend(v5, "hasIsBold");
    if (v15 != -[OADCharacterProperties hasIsBold](self, "hasIsBold"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasIsBold"))
    {
      v16 = objc_msgSend(v5, "isBold");
      if (v16 != -[OADCharacterProperties isBold](self, "isBold"))
        goto LABEL_70;
    }
    v17 = objc_msgSend(v5, "hasIsItalic");
    if (v17 != -[OADCharacterProperties hasIsItalic](self, "hasIsItalic"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasIsItalic"))
    {
      v18 = objc_msgSend(v5, "isItalic");
      if (v18 != -[OADCharacterProperties isItalic](self, "isItalic"))
        goto LABEL_70;
    }
    v19 = objc_msgSend(v5, "hasEffects");
    if (v19 != -[OADCharacterProperties hasEffects](self, "hasEffects"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasEffects"))
    {
      objc_msgSend(v5, "effects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADCharacterProperties effects](self, "effects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToArray:", v21);

      if ((v22 & 1) == 0)
        goto LABEL_70;
    }
    v23 = objc_msgSend(v5, "hasFormatType");
    if (v23 != -[OADCharacterProperties hasFormatType](self, "hasFormatType"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasFormatType"))
    {
      v24 = objc_msgSend(v5, "formatType");
      if (v24 != -[OADCharacterProperties formatType](self, "formatType"))
        goto LABEL_70;
    }
    v25 = objc_msgSend(v5, "hasFormatKerningType");
    if (v25 != -[OADCharacterProperties hasFormatKerningType](self, "hasFormatKerningType"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasFormatKerningType"))
    {
      v26 = objc_msgSend(v5, "formatKerningType");
      if (v26 != -[OADCharacterProperties formatKerningType](self, "formatKerningType"))
        goto LABEL_70;
    }
    v27 = objc_msgSend(v5, "hasStrikeThroughType");
    if (v27 != -[OADCharacterProperties hasStrikeThroughType](self, "hasStrikeThroughType"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasStrikeThroughType"))
    {
      v28 = objc_msgSend(v5, "strikeThroughType");
      if (v28 != -[OADCharacterProperties strikeThroughType](self, "strikeThroughType"))
        goto LABEL_70;
    }
    v29 = objc_msgSend(v5, "hasSize");
    if (v29 != -[OADCharacterProperties hasSize](self, "hasSize"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasSize"))
    {
      objc_msgSend(v5, "size");
      v31 = v30;
      -[OADCharacterProperties size](self, "size");
      if (v31 != v32)
        goto LABEL_70;
    }
    v33 = objc_msgSend(v5, "hasSpacing");
    if (v33 != -[OADCharacterProperties hasSpacing](self, "hasSpacing"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasSpacing"))
    {
      objc_msgSend(v5, "spacing");
      v35 = v34;
      -[OADCharacterProperties spacing](self, "spacing");
      if (v35 != v36)
        goto LABEL_70;
    }
    v37 = objc_msgSend(v5, "hasIsVerticalText");
    if (v37 != -[OADCharacterProperties hasIsVerticalText](self, "hasIsVerticalText"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasIsVerticalText"))
    {
      v38 = objc_msgSend(v5, "isVerticalText");
      if (v38 != -[OADCharacterProperties isVerticalText](self, "isVerticalText"))
        goto LABEL_70;
    }
    v39 = objc_msgSend(v5, "hasBaseline");
    if (v39 != -[OADCharacterProperties hasBaseline](self, "hasBaseline"))
      goto LABEL_70;
    if (objc_msgSend(v5, "hasBaseline"))
    {
      objc_msgSend(v5, "baseline");
      v41 = v40;
      -[OADCharacterProperties baseline](self, "baseline");
      if (v41 != v42)
        goto LABEL_70;
    }
    if ((v43 = objc_msgSend(v5, "hasIsHorizontalNormalized"),
          v43 == -[OADCharacterProperties hasIsHorizontalNormalized](self, "hasIsHorizontalNormalized"))
      && (!objc_msgSend(v5, "hasIsHorizontalNormalized")
       || (v44 = objc_msgSend(v5, "isHorizontalNormalized"),
           v44 == -[OADCharacterProperties isHorizontalNormalized](self, "isHorizontalNormalized")))
      && (v45 = objc_msgSend(v5, "hasCaps"), v45 == -[OADCharacterProperties hasCaps](self, "hasCaps"))
      && (!objc_msgSend(v5, "hasCaps")
       || (v46 = objc_msgSend(v5, "caps"), v46 == -[OADCharacterProperties caps](self, "caps")))
      && (v47 = objc_msgSend(v5, "hasLanguage"), v47 == -[OADCharacterProperties hasLanguage](self, "hasLanguage"))
      && (!objc_msgSend(v5, "hasLanguage")
       || (v48 = objc_msgSend(v5, "language"), v48 == -[OADCharacterProperties language](self, "language")))
      && TCObjectEqual((objc_object *)self->mHoverHyperlink, v5[9])
      && TCObjectEqual((objc_object *)self->mClickHyperlink, v5[8])
      && TCObjectEqual((objc_object *)self->mLatinFont, v5[3])
      && TCObjectEqual((objc_object *)self->mEastAsianFont, v5[4])
      && TCObjectEqual((objc_object *)self->mBidiFont, v5[5])
      && TCObjectEqual((objc_object *)self->mHAnsiFont, v5[6])
      && TCObjectEqual((objc_object *)self->mSymbolFont, v5[7]))
    {
      v51.receiver = self;
      v51.super_class = (Class)OADCharacterProperties;
      v49 = -[OADProperties isEqual:](&v51, sel_isEqual_, v5);
    }
    else
    {
LABEL_70:
      v49 = 0;
    }
    -[OADProperties setMerged:](self, "setMerged:", v6);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v7);
    objc_msgSend(v5, "setMerged:", v8);
    objc_msgSend(v5, "setMergedWithParent:", v9);

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (float)opacity
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasOpacity);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[32];

  return v3;
}

- (void)setHoverHyperlink:(id)a3
{
  objc_storeStrong((id *)&self->mHoverHyperlink, a3);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADCharacterProperties;
  -[OADProperties description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)stroke
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasStroke);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (BOOL)hasUnderlineType
{
  return (*((_BYTE *)self + 157) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)underlineType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasUnderlineType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[144];

  return v3;
}

- (void)setUnderlineType:(unsigned __int8)a3
{
  self->mUnderlineType = a3;
  *((_BYTE *)self + 157) |= 1u;
}

- (id)highlight
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasHighlight);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[15];

  return v3;
}

- (BOOL)hasUnderlineFill
{
  return (*((_BYTE *)self + 156) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)underlineFill
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasUnderlineFill);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[13];

  return v3;
}

- (void)setUnderlineFill:(id)a3
{
  objc_storeStrong((id *)&self->mUnderlineFill, a3);
  *((_BYTE *)self + 156) |= 1u;
}

- (BOOL)hasUnderlineStroke
{
  return (*((_BYTE *)self + 156) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)underlineStroke
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasUnderlineStroke);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[14];

  return v3;
}

- (void)setUnderlineStroke:(id)a3
{
  objc_storeStrong((id *)&self->mUnderlineStroke, a3);
  *((_BYTE *)self + 156) |= 2u;
}

- (BOOL)isVerticalText
{
  _BYTE *v2;
  BOOL v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsVerticalText);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[158] & 1;

  return v3;
}

- (BOOL)hasIsRightToLeft
{
  return (*((_BYTE *)self + 158) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isRightToLeft
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsRightToLeft);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[158] >> 2) & 1;

  return v3;
}

- (void)setIsRightToLeft:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 158) = *((_BYTE *)self + 158) & 0xFB | v3;
  *((_BYTE *)self + 158) |= 2u;
}

- (BOOL)isHorizontalNormalized
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsHorizontalNormalized);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[158] >> 5) & 1;

  return v3;
}

- (BOOL)hasLanguage
{
  return *((char *)self + 158) < 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)language
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLanguage);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[38];

  return v3;
}

- (void)setLanguage:(int)a3
{
  *((_BYTE *)self + 158) |= 0x80u;
  self->mLanguage = a3;
}

- (id)bidiFont
{
  id *v2;
  id v3;
  void *v4;
  id v5;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBidiFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  int v10;
  NSString *mLatinFont;
  id v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  int v17;
  NSString *mEastAsianFont;
  id v19;
  void *v20;
  objc_object *v21;
  void *v22;
  objc_object *v23;
  int v24;
  NSString *mBidiFont;
  id v26;
  void *v27;
  objc_object *v28;
  void *v29;
  objc_object *v30;
  int v31;
  NSString *mHAnsiFont;
  id v33;
  void *v34;
  objc_object *v35;
  void *v36;
  objc_object *v37;
  int v38;
  NSString *mSymbolFont;
  id v40;
  void *v41;
  objc_object *v42;
  void *v43;
  objc_object *v44;
  int v45;
  OADFill *mFill;
  id v47;
  void *v48;
  objc_object *v49;
  void *v50;
  objc_object *v51;
  int v52;
  OADStroke *mStroke;
  id v54;
  void *v55;
  objc_object *v56;
  void *v57;
  objc_object *v58;
  int v59;
  NSArray *mEffects;
  id v61;
  void *v62;
  id v63;
  void *v64;
  OADFill **p_mUnderlineFill;
  OADFill *v66;
  char isKindOfClass;
  uint64_t v68;
  OADFill *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  OADStroke **p_mUnderlineStroke;
  OADStroke *v75;
  char v76;
  uint64_t v77;
  OADStroke *v78;
  id v79;
  void *v80;
  objc_object *v81;
  void *v82;
  objc_object *v83;
  OADColor *mHighlight;
  id v85;
  float v86;
  float v87;
  float v88;
  id v89;
  float v90;
  float v91;
  float v92;
  id v93;
  float v94;
  float v95;
  float v96;
  id v97;
  float v98;
  float v99;
  float v100;
  id v101;
  int v102;
  id v103;
  int v104;
  id v105;
  int v106;
  id v107;
  int v108;
  id v109;
  int v110;
  id v111;
  int v112;
  id v113;
  int v114;
  id v115;
  int v116;
  int v117;
  int v118;
  id v119;
  int v120;
  id v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  objc_super v127;

  v4 = a3;
  v127.receiver = self;
  v127.super_class = (Class)OADCharacterProperties;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v127, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADCharacterProperties hasLatinFont](self, "hasLatinFont")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasLatinFont);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADCharacterProperties latinFont](self, "latinFont");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasLatinFont);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "latinFont");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mLatinFont = self->mLatinFont;
    if (v10)
    {
      self->mLatinFont = 0;

    }
    else if (!mLatinFont && v6)
    {
      -[OADCharacterProperties setLatinFont:](self, "setLatinFont:", v7);
    }

  }
  if (-[OADCharacterProperties hasEastAsianFont](self, "hasEastAsianFont")
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasEastAsianFont);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADCharacterProperties eastAsianFont](self, "eastAsianFont");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasEastAsianFont);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "eastAsianFont");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = TCObjectEqual(v14, v16);
    mEastAsianFont = self->mEastAsianFont;
    if (v17)
    {
      self->mEastAsianFont = 0;

    }
    else if (!mEastAsianFont && v13)
    {
      -[OADCharacterProperties setEastAsianFont:](self, "setEastAsianFont:", v14);
    }

  }
  if (-[OADCharacterProperties hasBidiFont](self, "hasBidiFont")
    || (-[OADProperties parent](self, "parent"),
        v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBidiFont);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[OADCharacterProperties bidiFont](self, "bidiFont");
      v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBidiFont);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "bidiFont");
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v24 = TCObjectEqual(v21, v23);
    mBidiFont = self->mBidiFont;
    if (v24)
    {
      self->mBidiFont = 0;

    }
    else if (!mBidiFont && v20)
    {
      -[OADCharacterProperties setBidiFont:](self, "setBidiFont:", v21);
    }

  }
  if (-[OADCharacterProperties hasHAnsiFont](self, "hasHAnsiFont")
    || (-[OADProperties parent](self, "parent"),
        v26 = (id)objc_claimAutoreleasedReturnValue(),
        v26,
        v26 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasHAnsiFont);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[OADCharacterProperties hansiFont](self, "hansiFont");
      v28 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasHAnsiFont);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "hansiFont");
      v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v31 = TCObjectEqual(v28, v30);
    mHAnsiFont = self->mHAnsiFont;
    if (v31)
    {
      self->mHAnsiFont = 0;

    }
    else if (!mHAnsiFont && v27)
    {
      -[OADCharacterProperties setHAnsiFont:](self, "setHAnsiFont:", v28);
    }

  }
  if (-[OADCharacterProperties hasSymbolFont](self, "hasSymbolFont")
    || (-[OADProperties parent](self, "parent"),
        v33 = (id)objc_claimAutoreleasedReturnValue(),
        v33,
        v33 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasSymbolFont);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[OADCharacterProperties symbolFont](self, "symbolFont");
      v35 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasSymbolFont);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "symbolFont");
      v37 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    v38 = TCObjectEqual(v35, v37);
    mSymbolFont = self->mSymbolFont;
    if (v38)
    {
      self->mSymbolFont = 0;

    }
    else if (!mSymbolFont && v34)
    {
      -[OADCharacterProperties setSymbolFont:](self, "setSymbolFont:", v35);
    }

  }
  if (-[OADCharacterProperties hasFill](self, "hasFill")
    || (-[OADProperties parent](self, "parent"),
        v40 = (id)objc_claimAutoreleasedReturnValue(),
        v40,
        v40 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasFill);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[OADCharacterProperties fill](self, "fill");
      v42 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasFill);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "fill");
      v44 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }
    v45 = TCObjectEqual(v42, v44);
    mFill = self->mFill;
    if (v45)
    {
      self->mFill = 0;

    }
    else if (!mFill && v41)
    {
      -[OADCharacterProperties setFill:](self, "setFill:", v42);
    }

  }
  if (-[OADCharacterProperties hasStroke](self, "hasStroke")
    || (-[OADProperties parent](self, "parent"),
        v47 = (id)objc_claimAutoreleasedReturnValue(),
        v47,
        v47 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasStroke);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      -[OADCharacterProperties stroke](self, "stroke");
      v49 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasStroke);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v4, "stroke");
      v51 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    v52 = TCObjectEqual(v49, v51);
    mStroke = self->mStroke;
    if (v52)
    {
      self->mStroke = 0;

    }
    else if (!mStroke && v48)
    {
      -[OADCharacterProperties setStroke:](self, "setStroke:", v49);
    }

  }
  if (-[OADCharacterProperties hasEffects](self, "hasEffects")
    || (-[OADProperties parent](self, "parent"),
        v54 = (id)objc_claimAutoreleasedReturnValue(),
        v54,
        v54 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasEffects);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      -[OADCharacterProperties effects](self, "effects");
      v56 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasEffects);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v4, "effects");
      v58 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
    v59 = TCObjectEqual(v56, v58);
    mEffects = self->mEffects;
    if (v59)
    {
      self->mEffects = 0;

    }
    else if (!mEffects && v55)
    {
      -[OADCharacterProperties setEffects:](self, "setEffects:", v56);
    }

  }
  if ((*((_BYTE *)self + 156) & 1) == 0)
  {
    -[OADProperties parent](self, "parent");
    v61 = (id)objc_claimAutoreleasedReturnValue();

    if (v61 == v4)
      goto LABEL_128;
LABEL_117:
    -[OADCharacterProperties underlineFill](self, "underlineFill");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_alloc_init((Class)objc_opt_class());

    -[OADCharacterProperties underlineFill](self, "underlineFill");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setParent:", v64);

    p_mUnderlineFill = &self->mUnderlineFill;
    objc_storeStrong((id *)&self->mUnderlineFill, v63);
    *((_BYTE *)self + 156) |= 1u;
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasUnderlineFill);
    v66 = (OADFill *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v4, "underlineFill");
      v66 = (OADFill *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mUnderlineFill == v66)
    {
      v69 = v66;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v68 = objc_claimAutoreleasedReturnValue();

        v66 = (OADFill *)v68;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mUnderlineFill, "changeParentPreservingEffectiveValues:", v66);
      if ((isKindOfClass & 1) == 0 || -[OADProperties isAnythingOverridden](*p_mUnderlineFill, "isAnythingOverridden"))
        goto LABEL_127;
      v69 = *p_mUnderlineFill;
    }
    *p_mUnderlineFill = 0;

    *((_BYTE *)self + 156) &= ~1u;
LABEL_127:

    goto LABEL_128;
  }
  if (self->mUnderlineFill)
    goto LABEL_117;
  objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasUnderlineFill);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v123
    || (objc_msgSend(v4, "underlineFill"),
        v124 = (void *)objc_claimAutoreleasedReturnValue(),
        v124,
        v123,
        !v124))
  {
    *((_BYTE *)self + 156) &= ~1u;
  }
LABEL_128:
  if ((*((_BYTE *)self + 156) & 2) == 0)
  {
    -[OADProperties parent](self, "parent");
    v70 = (id)objc_claimAutoreleasedReturnValue();

    if (v70 == v4)
      goto LABEL_143;
LABEL_132:
    -[OADCharacterProperties underlineStroke](self, "underlineStroke");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_alloc_init((Class)objc_opt_class());

    -[OADCharacterProperties underlineStroke](self, "underlineStroke");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setParent:", v73);

    p_mUnderlineStroke = &self->mUnderlineStroke;
    objc_storeStrong((id *)&self->mUnderlineStroke, v72);
    *((_BYTE *)self + 156) |= 2u;
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasUnderlineStroke);
    v75 = (OADStroke *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      objc_msgSend(v4, "underlineStroke");
      v75 = (OADStroke *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mUnderlineStroke == v75)
    {
      v78 = v75;
    }
    else
    {
      objc_opt_class();
      v76 = objc_opt_isKindOfClass();
      if ((v76 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v77 = objc_claimAutoreleasedReturnValue();

        v75 = (OADStroke *)v77;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mUnderlineStroke, "changeParentPreservingEffectiveValues:", v75);
      if ((v76 & 1) == 0 || -[OADStroke isAnythingOverridden](*p_mUnderlineStroke, "isAnythingOverridden"))
        goto LABEL_142;
      v78 = *p_mUnderlineStroke;
    }
    *p_mUnderlineStroke = 0;

    *((_BYTE *)self + 156) &= ~2u;
LABEL_142:

    goto LABEL_143;
  }
  if (self->mUnderlineStroke)
    goto LABEL_132;
  objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasUnderlineStroke);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v125
    || (objc_msgSend(v4, "underlineStroke"),
        v126 = (void *)objc_claimAutoreleasedReturnValue(),
        v126,
        v125,
        !v126))
  {
    *((_BYTE *)self + 156) &= ~2u;
  }
LABEL_143:
  if ((*((_BYTE *)self + 156) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v79 = (id)objc_claimAutoreleasedReturnValue(),
        v79,
        v79 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasHighlight);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      -[OADCharacterProperties highlight](self, "highlight");
      v81 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v81 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasHighlight);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      objc_msgSend(v4, "highlight");
      v83 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v83 = 0;
    }
    if (TCObjectEqual(v81, v83))
    {
      mHighlight = self->mHighlight;
      self->mHighlight = 0;

      *((_BYTE *)self + 156) &= ~4u;
    }
    else if ((*((_BYTE *)self + 156) & 4) == 0 && v80)
    {
      -[OADCharacterProperties setHighlight:](self, "setHighlight:", v81);
    }

  }
  if ((*((_BYTE *)self + 156) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v85 = (id)objc_claimAutoreleasedReturnValue(),
        v85,
        v85 != v4))
  {
    -[OADCharacterProperties opacity](self, "opacity");
    v87 = v86;
    objc_msgSend(v4, "opacity");
    if (v87 == v88)
    {
      *((_BYTE *)self + 156) &= ~8u;
    }
    else if ((*((_BYTE *)self + 156) & 8) == 0)
    {
      -[OADCharacterProperties opacity](self, "opacity");
      -[OADCharacterProperties setOpacity:](self, "setOpacity:");
    }
  }
  if ((*((_BYTE *)self + 157) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v89 = (id)objc_claimAutoreleasedReturnValue(),
        v89,
        v89 != v4))
  {
    -[OADCharacterProperties size](self, "size");
    v91 = v90;
    objc_msgSend(v4, "size");
    if (v91 == v92)
    {
      *((_BYTE *)self + 157) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 157) & 0x10) == 0)
    {
      -[OADCharacterProperties size](self, "size");
      -[OADCharacterProperties setSize:](self, "setSize:");
    }
  }
  if ((*((_BYTE *)self + 157) & 0x20) != 0
    || (-[OADProperties parent](self, "parent"),
        v93 = (id)objc_claimAutoreleasedReturnValue(),
        v93,
        v93 != v4))
  {
    -[OADCharacterProperties spacing](self, "spacing");
    v95 = v94;
    objc_msgSend(v4, "spacing");
    if (v95 == v96)
    {
      *((_BYTE *)self + 157) &= ~0x20u;
    }
    else if ((*((_BYTE *)self + 157) & 0x20) == 0)
    {
      -[OADCharacterProperties spacing](self, "spacing");
      -[OADCharacterProperties setSpacing:](self, "setSpacing:");
    }
  }
  if ((*((_BYTE *)self + 158) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v97 = (id)objc_claimAutoreleasedReturnValue(),
        v97,
        v97 != v4))
  {
    -[OADCharacterProperties baseline](self, "baseline");
    v99 = v98;
    objc_msgSend(v4, "baseline");
    if (v99 == v100)
    {
      *((_BYTE *)self + 158) &= ~8u;
    }
    else if ((*((_BYTE *)self + 158) & 8) == 0)
    {
      -[OADCharacterProperties baseline](self, "baseline");
      -[OADCharacterProperties setBaseline:](self, "setBaseline:");
    }
  }
  if ((*((_BYTE *)self + 157) & 1) != 0
    || (-[OADProperties parent](self, "parent"),
        v101 = (id)objc_claimAutoreleasedReturnValue(),
        v101,
        v101 != v4))
  {
    v102 = -[OADCharacterProperties underlineType](self, "underlineType");
    if (v102 == objc_msgSend(v4, "underlineType"))
    {
      *((_BYTE *)self + 157) &= ~1u;
    }
    else if ((*((_BYTE *)self + 157) & 1) == 0)
    {
      -[OADCharacterProperties setUnderlineType:](self, "setUnderlineType:", -[OADCharacterProperties underlineType](self, "underlineType"));
    }
  }
  if ((*((_BYTE *)self + 157) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v103 = (id)objc_claimAutoreleasedReturnValue(),
        v103,
        v103 != v4))
  {
    v104 = -[OADCharacterProperties formatType](self, "formatType");
    if (v104 == objc_msgSend(v4, "formatType"))
    {
      *((_BYTE *)self + 157) &= ~2u;
    }
    else if ((*((_BYTE *)self + 157) & 2) == 0)
    {
      -[OADCharacterProperties setFormatType:](self, "setFormatType:", -[OADCharacterProperties formatType](self, "formatType"));
    }
  }
  if ((*((_BYTE *)self + 157) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v105 = (id)objc_claimAutoreleasedReturnValue(),
        v105,
        v105 != v4))
  {
    v106 = -[OADCharacterProperties formatKerningType](self, "formatKerningType");
    if (v106 == objc_msgSend(v4, "formatKerningType"))
    {
      *((_BYTE *)self + 157) &= ~4u;
    }
    else if ((*((_BYTE *)self + 157) & 4) == 0)
    {
      -[OADCharacterProperties setFormatKerningType:](self, "setFormatKerningType:", -[OADCharacterProperties formatKerningType](self, "formatKerningType"));
    }
  }
  if ((*((_BYTE *)self + 157) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v107 = (id)objc_claimAutoreleasedReturnValue(),
        v107,
        v107 != v4))
  {
    v108 = -[OADCharacterProperties strikeThroughType](self, "strikeThroughType");
    if (v108 == objc_msgSend(v4, "strikeThroughType"))
    {
      *((_BYTE *)self + 157) &= ~8u;
    }
    else if ((*((_BYTE *)self + 157) & 8) == 0)
    {
      -[OADCharacterProperties setStrikeThroughType:](self, "setStrikeThroughType:", -[OADCharacterProperties strikeThroughType](self, "strikeThroughType"));
    }
  }
  if ((*((_BYTE *)self + 158) & 0x40) != 0
    || (-[OADProperties parent](self, "parent"),
        v109 = (id)objc_claimAutoreleasedReturnValue(),
        v109,
        v109 != v4))
  {
    v110 = -[OADCharacterProperties caps](self, "caps");
    if (v110 == objc_msgSend(v4, "caps"))
    {
      *((_BYTE *)self + 158) &= ~0x40u;
    }
    else if ((*((_BYTE *)self + 158) & 0x40) == 0)
    {
      -[OADCharacterProperties setCaps:](self, "setCaps:", -[OADCharacterProperties caps](self, "caps"));
    }
  }
  if ((*((_BYTE *)self + 156) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v111 = (id)objc_claimAutoreleasedReturnValue(),
        v111,
        v111 != v4))
  {
    v112 = -[OADCharacterProperties isBold](self, "isBold");
    if (v112 == objc_msgSend(v4, "isBold"))
    {
      *((_BYTE *)self + 156) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 156) & 0x10) == 0)
    {
      -[OADCharacterProperties setIsBold:](self, "setIsBold:", -[OADCharacterProperties isBold](self, "isBold"));
    }
  }
  if ((*((_BYTE *)self + 156) & 0x40) != 0
    || (-[OADProperties parent](self, "parent"),
        v113 = (id)objc_claimAutoreleasedReturnValue(),
        v113,
        v113 != v4))
  {
    v114 = -[OADCharacterProperties isItalic](self, "isItalic");
    if (v114 == objc_msgSend(v4, "isItalic"))
    {
      *((_BYTE *)self + 156) &= ~0x40u;
    }
    else if ((*((_BYTE *)self + 156) & 0x40) == 0)
    {
      -[OADCharacterProperties setIsItalic:](self, "setIsItalic:", -[OADCharacterProperties isItalic](self, "isItalic"));
    }
  }
  if (*((char *)self + 157) < 0
    || (-[OADProperties parent](self, "parent"),
        v115 = (id)objc_claimAutoreleasedReturnValue(),
        v115,
        v115 != v4))
  {
    v116 = -[OADCharacterProperties isVerticalText](self, "isVerticalText");
    v117 = objc_msgSend(v4, "isVerticalText");
    v118 = *((char *)self + 157);
    if (v116 == v117)
    {
      *((_BYTE *)self + 157) = v118 & 0x7F;
    }
    else if ((v118 & 0x80000000) == 0)
    {
      -[OADCharacterProperties setIsVerticalText:](self, "setIsVerticalText:", -[OADCharacterProperties isVerticalText](self, "isVerticalText"));
    }
  }
  if ((*((_BYTE *)self + 158) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v119 = (id)objc_claimAutoreleasedReturnValue(),
        v119,
        v119 != v4))
  {
    v120 = -[OADCharacterProperties isRightToLeft](self, "isRightToLeft");
    if (v120 == objc_msgSend(v4, "isRightToLeft"))
    {
      *((_BYTE *)self + 158) &= ~2u;
    }
    else if ((*((_BYTE *)self + 158) & 2) == 0)
    {
      -[OADCharacterProperties setIsRightToLeft:](self, "setIsRightToLeft:", -[OADCharacterProperties isRightToLeft](self, "isRightToLeft"));
    }
  }
  if ((*((_BYTE *)self + 158) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v121 = (id)objc_claimAutoreleasedReturnValue(),
        v121,
        v121 != v4))
  {
    v122 = -[OADCharacterProperties isHorizontalNormalized](self, "isHorizontalNormalized");
    if (v122 == objc_msgSend(v4, "isHorizontalNormalized"))
    {
      *((_BYTE *)self + 158) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 158) & 0x10) == 0)
    {
      -[OADCharacterProperties setIsHorizontalNormalized:](self, "setIsHorizontalNormalized:", -[OADCharacterProperties isHorizontalNormalized](self, "isHorizontalNormalized"));
    }
  }

}

- (void)overrideWithCharacterProperties:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v21;

  v21 = a3;
  v4 = objc_msgSend(v21, "isMerged");
  v5 = objc_msgSend(v21, "isMergedWithParent");
  objc_msgSend(v21, "setMerged:", 0);
  objc_msgSend(v21, "setMergedWithParent:", 0);
  if (objc_msgSend(v21, "hasStroke"))
  {
    objc_msgSend(v21, "stroke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setStroke:](self, "setStroke:", v6);

  }
  if (objc_msgSend(v21, "hasFill"))
  {
    objc_msgSend(v21, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setFill:](self, "setFill:", v7);

  }
  if (objc_msgSend(v21, "hasOpacity"))
  {
    objc_msgSend(v21, "opacity");
    -[OADCharacterProperties setOpacity:](self, "setOpacity:");
  }
  if (objc_msgSend(v21, "hasUnderlineType"))
    -[OADCharacterProperties setUnderlineType:](self, "setUnderlineType:", objc_msgSend(v21, "underlineType"));
  if (objc_msgSend(v21, "hasUnderlineFill"))
  {
    objc_msgSend(v21, "underlineFill");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setUnderlineFill:](self, "setUnderlineFill:", v8);

  }
  if (objc_msgSend(v21, "hasUnderlineStroke"))
  {
    objc_msgSend(v21, "underlineStroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setUnderlineStroke:](self, "setUnderlineStroke:", v9);

  }
  if (objc_msgSend(v21, "hasHighlight"))
  {
    objc_msgSend(v21, "highlight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setHighlight:](self, "setHighlight:", v10);

  }
  if (objc_msgSend(v21, "hasIsBold"))
    -[OADCharacterProperties setIsBold:](self, "setIsBold:", objc_msgSend(v21, "isBold"));
  if (objc_msgSend(v21, "hasIsItalic"))
    -[OADCharacterProperties setIsItalic:](self, "setIsItalic:", objc_msgSend(v21, "isItalic"));
  if (objc_msgSend(v21, "hasEffects"))
  {
    objc_msgSend(v21, "effects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setEffects:](self, "setEffects:", v11);

  }
  if (objc_msgSend(v21, "hasFormatType"))
    -[OADCharacterProperties setFormatType:](self, "setFormatType:", objc_msgSend(v21, "formatType"));
  if (objc_msgSend(v21, "hasFormatKerningType"))
    -[OADCharacterProperties setFormatKerningType:](self, "setFormatKerningType:", objc_msgSend(v21, "formatKerningType"));
  if (objc_msgSend(v21, "hasStrikeThroughType"))
    -[OADCharacterProperties setStrikeThroughType:](self, "setStrikeThroughType:", objc_msgSend(v21, "strikeThroughType"));
  if (objc_msgSend(v21, "hasSize"))
  {
    objc_msgSend(v21, "size");
    -[OADCharacterProperties setSize:](self, "setSize:");
  }
  if (objc_msgSend(v21, "hasSpacing"))
  {
    objc_msgSend(v21, "spacing");
    -[OADCharacterProperties setSpacing:](self, "setSpacing:");
  }
  if (objc_msgSend(v21, "hasIsVerticalText"))
    -[OADCharacterProperties setIsVerticalText:](self, "setIsVerticalText:", objc_msgSend(v21, "isVerticalText"));
  if (objc_msgSend(v21, "hasBaseline"))
  {
    objc_msgSend(v21, "baseline");
    -[OADCharacterProperties setBaseline:](self, "setBaseline:");
  }
  if (objc_msgSend(v21, "hasIsHorizontalNormalized"))
    -[OADCharacterProperties setIsHorizontalNormalized:](self, "setIsHorizontalNormalized:", objc_msgSend(v21, "isHorizontalNormalized"));
  if (objc_msgSend(v21, "hasCaps"))
    -[OADCharacterProperties setCaps:](self, "setCaps:", objc_msgSend(v21, "caps"));
  if (objc_msgSend(v21, "hasLanguage"))
    -[OADCharacterProperties setLanguage:](self, "setLanguage:", objc_msgSend(v21, "language"));
  if (objc_msgSend(v21, "hasLatinFont"))
  {
    objc_msgSend(v21, "latinFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setLatinFont:](self, "setLatinFont:", v12);

  }
  if (objc_msgSend(v21, "hasEastAsianFont"))
  {
    objc_msgSend(v21, "eastAsianFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setEastAsianFont:](self, "setEastAsianFont:", v13);

  }
  if (objc_msgSend(v21, "hasBidiFont"))
  {
    objc_msgSend(v21, "bidiFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setBidiFont:](self, "setBidiFont:", v14);

  }
  if (objc_msgSend(v21, "hasHAnsiFont"))
  {
    objc_msgSend(v21, "hansiFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setHAnsiFont:](self, "setHAnsiFont:", v15);

  }
  if (objc_msgSend(v21, "hasSymbolFont"))
  {
    objc_msgSend(v21, "symbolFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setSymbolFont:](self, "setSymbolFont:", v16);

  }
  objc_msgSend(v21, "clickHyperlink");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v21, "clickHyperlink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setClickHyperlink:](self, "setClickHyperlink:", v18);

  }
  objc_msgSend(v21, "hoverHyperlink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v21, "hoverHyperlink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCharacterProperties setHoverHyperlink:](self, "setHoverHyperlink:", v20);

  }
  objc_msgSend(v21, "setMerged:", v4);
  objc_msgSend(v21, "setMergedWithParent:", v5);

}

- (BOOL)isAnyCharacterPropertyOverridden
{
  BOOL v3;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OADCharacterProperties;
  if (-[OADProperties isAnythingOverridden](&v7, sel_isAnythingOverridden)
    || -[OADCharacterProperties hasFill](self, "hasFill")
    || -[OADCharacterProperties hasStroke](self, "hasStroke")
    || -[OADCharacterProperties hasOpacity](self, "hasOpacity")
    || -[OADCharacterProperties hasUnderlineType](self, "hasUnderlineType")
    || -[OADCharacterProperties hasUnderlineFill](self, "hasUnderlineFill")
    || -[OADCharacterProperties hasUnderlineStroke](self, "hasUnderlineStroke")
    || -[OADCharacterProperties hasHighlight](self, "hasHighlight")
    || -[OADCharacterProperties hasIsBold](self, "hasIsBold")
    || -[OADCharacterProperties hasIsItalic](self, "hasIsItalic")
    || -[OADCharacterProperties hasEffects](self, "hasEffects")
    || -[OADCharacterProperties hasFormatType](self, "hasFormatType")
    || -[OADCharacterProperties hasFormatKerningType](self, "hasFormatKerningType")
    || -[OADCharacterProperties hasStrikeThroughType](self, "hasStrikeThroughType")
    || -[OADCharacterProperties hasSize](self, "hasSize")
    || -[OADCharacterProperties hasSpacing](self, "hasSpacing")
    || -[OADCharacterProperties hasIsVerticalText](self, "hasIsVerticalText")
    || -[OADCharacterProperties hasIsRightToLeft](self, "hasIsRightToLeft")
    || -[OADCharacterProperties hasBaseline](self, "hasBaseline")
    || -[OADCharacterProperties hasIsHorizontalNormalized](self, "hasIsHorizontalNormalized")
    || -[OADCharacterProperties hasCaps](self, "hasCaps")
    || -[OADCharacterProperties hasLatinFont](self, "hasLatinFont")
    || -[OADCharacterProperties hasEastAsianFont](self, "hasEastAsianFont")
    || -[OADCharacterProperties hasBidiFont](self, "hasBidiFont")
    || -[OADCharacterProperties hasHAnsiFont](self, "hasHAnsiFont")
    || -[OADCharacterProperties hasSymbolFont](self, "hasSymbolFont"))
  {
    return 1;
  }
  -[OADCharacterProperties clickHyperlink](self, "clickHyperlink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = 1;
  }
  else
  {
    -[OADCharacterProperties hoverHyperlink](self, "hoverHyperlink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6 != 0;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHighlight, 0);
  objc_storeStrong((id *)&self->mUnderlineStroke, 0);
  objc_storeStrong((id *)&self->mUnderlineFill, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStroke, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mHoverHyperlink, 0);
  objc_storeStrong((id *)&self->mClickHyperlink, 0);
  objc_storeStrong((id *)&self->mSymbolFont, 0);
  objc_storeStrong((id *)&self->mHAnsiFont, 0);
  objc_storeStrong((id *)&self->mBidiFont, 0);
  objc_storeStrong((id *)&self->mEastAsianFont, 0);
  objc_storeStrong((id *)&self->mLatinFont, 0);
}

@end
