@implementation OADParagraphProperties

- (OADParagraphProperties)initWithDefaults
{
  OADParagraphProperties *v2;
  OADPercentTextSpacing *v3;
  double v4;
  OADPercentTextSpacing *v5;
  OADPointTextSpacing *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  OADBulletSizeFollowText *v12;
  OADBulletColorFollowText *v13;
  OADBulletFontFollowText *v14;
  OADNullBulletProperties *v15;
  OADParagraphProperties *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OADParagraphProperties;
  v2 = -[OADCharacterProperties initWithDefaults](&v18, sel_initWithDefaults);
  if (v2)
  {
    v3 = [OADPercentTextSpacing alloc];
    LODWORD(v4) = 1120403456;
    v5 = -[OADPercentTextSpacing initWithPercent:](v3, "initWithPercent:", v4);
    -[OADParagraphProperties setLineSpacing:](v2, "setLineSpacing:", v5);
    v6 = -[OADPointTextSpacing initWithPoints:]([OADPointTextSpacing alloc], "initWithPoints:", 0);
    -[OADParagraphProperties setBeforeSpacing:](v2, "setBeforeSpacing:", v6);
    -[OADParagraphProperties setAfterSpacing:](v2, "setAfterSpacing:", v6);
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setTabStops:](v2, "setTabStops:", v7);

    LODWORD(v8) = 0;
    -[OADParagraphProperties setLeftMargin:](v2, "setLeftMargin:", v8);
    LODWORD(v9) = 0;
    -[OADParagraphProperties setRightMargin:](v2, "setRightMargin:", v9);
    -[OADParagraphProperties setLevel:](v2, "setLevel:", 0);
    LODWORD(v10) = 0;
    -[OADParagraphProperties setIndent:](v2, "setIndent:", v10);
    -[OADParagraphProperties setAlign:](v2, "setAlign:", 0);
    LODWORD(v11) = 1116733440;
    -[OADParagraphProperties setDefaultTab:](v2, "setDefaultTab:", v11);
    -[OADCharacterProperties setIsRightToLeft:](v2, "setIsRightToLeft:", 0);
    -[OADParagraphProperties setWrap:](v2, "setWrap:", 1);
    -[OADParagraphProperties setFontAlign:](v2, "setFontAlign:", 0);
    -[OADParagraphProperties setIsLatinLineBreak:](v2, "setIsLatinLineBreak:", 1);
    -[OADParagraphProperties setIsHangingPunctuation:](v2, "setIsHangingPunctuation:", 0);
    -[OADParagraphProperties setBulletCharSet:](v2, "setBulletCharSet:", 1);
    v12 = objc_alloc_init(OADBulletSizeFollowText);
    -[OADParagraphProperties setBulletSize:](v2, "setBulletSize:", v12);
    v13 = objc_alloc_init(OADBulletColorFollowText);
    -[OADParagraphProperties setBulletColor:](v2, "setBulletColor:", v13);
    v14 = objc_alloc_init(OADBulletFontFollowText);
    -[OADParagraphProperties setBulletFont:](v2, "setBulletFont:", v14);
    v15 = objc_alloc_init(OADNullBulletProperties);
    -[OADParagraphProperties setBulletProperties:](v2, "setBulletProperties:", v15);
    v16 = v2;

  }
  return v2;
}

- (void)setLineSpacing:(id)a3
{
  objc_storeStrong((id *)&self->mLineSpacing, a3);
}

- (void)setBeforeSpacing:(id)a3
{
  objc_storeStrong((id *)&self->mBeforeSpacing, a3);
}

- (void)setAfterSpacing:(id)a3
{
  objc_storeStrong((id *)&self->mAfterSpacing, a3);
}

- (void)setLeftMargin:(float)a3
{
  self->mLeftMargin = a3;
  *((_BYTE *)self + 255) |= 8u;
}

- (void)setRightMargin:(float)a3
{
  self->mRightMargin = a3;
  *((_BYTE *)self + 255) |= 0x10u;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
  *((_BYTE *)self + 255) |= 4u;
}

- (void)setIndent:(float)a3
{
  self->mIndent = a3;
  *((_BYTE *)self + 255) |= 0x20u;
}

- (void)setAlign:(unsigned __int8)a3
{
  self->mAlign = a3;
  *((_BYTE *)self + 256) |= 1u;
}

- (void)setDefaultTab:(float)a3
{
  self->mDefaultTab = a3;
  *((_BYTE *)self + 255) |= 0x40u;
}

- (void)setWrap:(unsigned __int8)a3
{
  self->mWrap = a3;
  *((_BYTE *)self + 256) |= 2u;
}

- (void)setFontAlign:(unsigned __int8)a3
{
  self->mFontAlign = a3;
  *((_BYTE *)self + 256) |= 4u;
}

- (void)setIsLatinLineBreak:(BOOL)a3
{
  *((_BYTE *)self + 255) = *((_BYTE *)self + 255) & 0xFE | a3;
  *((_BYTE *)self + 256) |= 8u;
}

- (void)setIsHangingPunctuation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 255) = *((_BYTE *)self + 255) & 0xFD | v3;
  *((_BYTE *)self + 256) |= 0x10u;
}

- (void)setBulletCharSet:(int)a3
{
  self->mBulletCharSet = a3;
  *((_BYTE *)self + 255) |= 0x80u;
}

- (void)setBulletSize:(id)a3
{
  objc_storeStrong((id *)&self->mBulletSize, a3);
}

- (void)setBulletColor:(id)a3
{
  objc_storeStrong((id *)&self->mBulletColor, a3);
}

- (void)setBulletFont:(id)a3
{
  objc_storeStrong((id *)&self->mBulletFont, a3);
}

- (void)setBulletProperties:(id)a3
{
  objc_storeStrong((id *)&self->mBulletProperties, a3);
}

- (OADParagraphProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADParagraphProperties;
  return -[OADProperties init](&v3, sel_init);
}

+ (id)defaultProperties
{
  if (+[OADParagraphProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADParagraphProperties defaultProperties]::once, &__block_literal_global_60);
  return (id)+[OADParagraphProperties defaultProperties]::defaultProperties;
}

- (float)leftMargin
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLeftMargin);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[58];

  return v3;
}

- (BOOL)hasLeftMargin
{
  return (*((_BYTE *)self + 255) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void)overrideWithProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMerged");
  v6 = objc_msgSend(v4, "isMergedWithParent");
  objc_msgSend(v4, "setMerged:", 0);
  objc_msgSend(v4, "setMergedWithParent:", 0);
  if (objc_msgSend(v4, "hasLineSpacing"))
  {
    objc_msgSend(v4, "lineSpacing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setLineSpacing:](self, "setLineSpacing:", v7);

  }
  if (objc_msgSend(v4, "hasBeforeSpacing"))
  {
    objc_msgSend(v4, "beforeSpacing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setBeforeSpacing:](self, "setBeforeSpacing:", v8);

  }
  if (objc_msgSend(v4, "hasAfterSpacing"))
  {
    objc_msgSend(v4, "afterSpacing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setAfterSpacing:](self, "setAfterSpacing:", v9);

  }
  if (objc_msgSend(v4, "hasTabStops"))
  {
    objc_msgSend(v4, "tabStops");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setTabStops:](self, "setTabStops:", v10);

  }
  if (objc_msgSend(v4, "hasLeftMargin"))
  {
    objc_msgSend(v4, "leftMargin");
    -[OADParagraphProperties setLeftMargin:](self, "setLeftMargin:");
  }
  if (objc_msgSend(v4, "hasRightMargin"))
  {
    objc_msgSend(v4, "rightMargin");
    -[OADParagraphProperties setRightMargin:](self, "setRightMargin:");
  }
  if (objc_msgSend(v4, "hasIndent"))
  {
    objc_msgSend(v4, "indent");
    -[OADParagraphProperties setIndent:](self, "setIndent:");
  }
  if (objc_msgSend(v4, "hasAlign"))
    -[OADParagraphProperties setAlign:](self, "setAlign:", objc_msgSend(v4, "align"));
  if (objc_msgSend(v4, "hasDefaultTab"))
  {
    objc_msgSend(v4, "defaultTab");
    -[OADParagraphProperties setDefaultTab:](self, "setDefaultTab:");
  }
  if (objc_msgSend(v4, "hasIsRightToLeft"))
    -[OADCharacterProperties setIsRightToLeft:](self, "setIsRightToLeft:", objc_msgSend(v4, "isRightToLeft"));
  if (objc_msgSend(v4, "hasWrap"))
    -[OADParagraphProperties setWrap:](self, "setWrap:", objc_msgSend(v4, "wrap"));
  if (objc_msgSend(v4, "hasFontAlign"))
    -[OADParagraphProperties setFontAlign:](self, "setFontAlign:", objc_msgSend(v4, "fontAlign"));
  if (objc_msgSend(v4, "hasIsLatinLineBreak"))
    -[OADParagraphProperties setIsLatinLineBreak:](self, "setIsLatinLineBreak:", objc_msgSend(v4, "isLatinLineBreak"));
  if (objc_msgSend(v4, "hasIsHangingPunctuation"))
    -[OADParagraphProperties setIsHangingPunctuation:](self, "setIsHangingPunctuation:", objc_msgSend(v4, "isHangingPunctuation"));
  if (objc_msgSend(v4, "hasBulletSize"))
  {
    objc_msgSend(v4, "bulletSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setBulletSize:](self, "setBulletSize:", v11);

  }
  if (objc_msgSend(v4, "hasBulletColor"))
  {
    objc_msgSend(v4, "bulletColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setBulletColor:](self, "setBulletColor:", v12);

  }
  if (objc_msgSend(v4, "hasBulletFont"))
  {
    objc_msgSend(v4, "bulletFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setBulletFont:](self, "setBulletFont:", v13);

  }
  if (objc_msgSend(v4, "hasBulletProperties"))
  {
    objc_msgSend(v4, "bulletProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties setBulletProperties:](self, "setBulletProperties:", v14);

  }
  if (objc_msgSend(v4, "hasBulletCharSet"))
    -[OADParagraphProperties setBulletCharSet:](self, "setBulletCharSet:", objc_msgSend(v4, "bulletCharSet"));
  v15.receiver = self;
  v15.super_class = (Class)OADParagraphProperties;
  -[OADCharacterProperties overrideWithProperties:](&v15, sel_overrideWithProperties_, v4);
  objc_msgSend(v4, "setMerged:", v5);
  objc_msgSend(v4, "setMergedWithParent:", v6);

}

- (BOOL)hasLineSpacing
{
  return self->mLineSpacing || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)lineSpacing
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLineSpacing);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[25];

  return v3;
}

- (BOOL)hasBeforeSpacing
{
  return self->mBeforeSpacing || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)beforeSpacing
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBeforeSpacing);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[26];

  return v3;
}

- (BOOL)hasAfterSpacing
{
  return self->mAfterSpacing || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)afterSpacing
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasAfterSpacing);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[27];

  return v3;
}

- (BOOL)hasTabStops
{
  return self->mTabStops || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasRightMargin
{
  return (*((_BYTE *)self + 255) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasLevel
{
  return (*((_BYTE *)self + 255) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)level
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLevel);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[40];

  return v3;
}

- (BOOL)hasIndent
{
  return (*((_BYTE *)self + 255) & 0x20) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)indent
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIndent);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[60];

  return v3;
}

- (BOOL)hasAlign
{
  return (*((_BYTE *)self + 256) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)align
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasAlign);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[252];

  return v3;
}

- (BOOL)hasDefaultTab
{
  return (*((_BYTE *)self + 255) & 0x40) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)defaultTab
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasDefaultTab);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[61];

  return v3;
}

- (BOOL)hasWrap
{
  return (*((_BYTE *)self + 256) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasFontAlign
{
  return (*((_BYTE *)self + 256) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasIsLatinLineBreak
{
  return (*((_BYTE *)self + 256) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasIsHangingPunctuation
{
  return (*((_BYTE *)self + 256) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasBulletSize
{
  return self->mBulletSize || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)bulletSize
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBulletSize);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[21];

  return v3;
}

- (BOOL)hasBulletColor
{
  return self->mBulletColor || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)bulletColor
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBulletColor);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[22];

  return v3;
}

- (BOOL)hasBulletFont
{
  return self->mBulletFont || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)bulletFont
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBulletFont);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[23];

  return v3;
}

- (BOOL)hasBulletProperties
{
  return self->mBulletProperties
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)bulletProperties
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBulletProperties);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[24];

  return v3;
}

- (BOOL)hasBulletCharSet
{
  return *((char *)self + 255) < 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  objc_object *v7;
  objc_object *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  OADTextSpacing *mLineSpacing;
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  OADTextSpacing *mBeforeSpacing;
  void *v20;
  objc_object *v21;
  objc_object *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  OADTextSpacing *mAfterSpacing;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSArray *mTabStops;
  void *v32;
  float v33;
  float v34;
  double v35;
  void *v36;
  float v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  float v42;
  double v43;
  void *v44;
  int v45;
  void *v46;
  float v47;
  float v48;
  double v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  objc_object *v63;
  objc_object *v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  OADBulletSize *mBulletSize;
  void *v69;
  objc_object *v70;
  objc_object *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  OADBulletColor *mBulletColor;
  void *v76;
  objc_object *v77;
  objc_object *v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  OADBulletFont *mBulletFont;
  void *v83;
  objc_object *v84;
  objc_object *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  OADBulletProperties *mBulletProperties;
  objc_super v90;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADParagraphProperties hasLineSpacing](self, "hasLineSpacing"))
      goto LABEL_10;
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADParagraphProperties lineSpacing](self, "lineSpacing");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lineSpacing");
    v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v7, "removeUnnecessaryOverrides");
      v9 = objc_opt_class();
      if (v9 != objc_opt_class())
        goto LABEL_9;
      v10 = -[objc_object isMergedWithParent](v7, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", 0);
      v11 = -[objc_object isAnythingOverridden](v7, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", v10);
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

LABEL_10:
      if (!-[OADParagraphProperties hasBeforeSpacing](self, "hasBeforeSpacing"))
        goto LABEL_18;
      -[OADProperties parent](self, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties beforeSpacing](self, "beforeSpacing");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beforeSpacing");
      v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[objc_object removeUnnecessaryOverrides](v14, "removeUnnecessaryOverrides");
        v16 = objc_opt_class();
        if (v16 != objc_opt_class())
          goto LABEL_17;
        v17 = -[objc_object isMergedWithParent](v14, "isMergedWithParent");
        -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", 0);
        v18 = -[objc_object isAnythingOverridden](v14, "isAnythingOverridden");
        -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", v17);
        if ((v18 & 1) != 0)
          goto LABEL_17;
      }
      else if (!TCObjectEqual(v14, v15))
      {
LABEL_17:

LABEL_18:
        if (!-[OADParagraphProperties hasAfterSpacing](self, "hasAfterSpacing"))
        {
LABEL_26:
          if (-[OADParagraphProperties hasTabStops](self, "hasTabStops"))
          {
            -[OADParagraphProperties tabStops](self, "tabStops");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADProperties parent](self, "parent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "tabStops");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v27, "isEqualToArray:", v29);

            if (v30)
            {
              mTabStops = self->mTabStops;
              self->mTabStops = 0;

            }
          }
          if (-[OADParagraphProperties hasLeftMargin](self, "hasLeftMargin"))
          {
            -[OADProperties parent](self, "parent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADParagraphProperties leftMargin](self, "leftMargin");
            v34 = v33;
            objc_msgSend(v32, "leftMargin");
            if (v34 == *(float *)&v35)
            {
              LODWORD(v35) = 0;
              -[OADParagraphProperties setLeftMargin:](self, "setLeftMargin:", v35);
              *((_BYTE *)self + 255) &= ~8u;
            }

          }
          if (-[OADParagraphProperties hasRightMargin](self, "hasRightMargin"))
          {
            -[OADProperties parent](self, "parent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADParagraphProperties rightMargin](self, "rightMargin");
            v38 = v37;
            objc_msgSend(v36, "rightMargin");
            if (v38 == *(float *)&v39)
            {
              LODWORD(v39) = 0;
              -[OADParagraphProperties setRightMargin:](self, "setRightMargin:", v39);
              *((_BYTE *)self + 255) &= ~0x10u;
            }

          }
          if (-[OADParagraphProperties hasIndent](self, "hasIndent"))
          {
            -[OADProperties parent](self, "parent");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADParagraphProperties indent](self, "indent");
            v42 = v41;
            objc_msgSend(v40, "indent");
            if (v42 == *(float *)&v43)
            {
              LODWORD(v43) = 0;
              -[OADParagraphProperties setIndent:](self, "setIndent:", v43);
              *((_BYTE *)self + 255) &= ~0x20u;
            }

          }
          if (-[OADParagraphProperties hasAlign](self, "hasAlign"))
          {
            -[OADProperties parent](self, "parent");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = -[OADParagraphProperties align](self, "align");
            if (v45 == objc_msgSend(v44, "align"))
            {
              -[OADParagraphProperties setAlign:](self, "setAlign:", 0);
              *((_BYTE *)self + 256) &= ~1u;
            }

          }
          if (-[OADParagraphProperties hasDefaultTab](self, "hasDefaultTab"))
          {
            -[OADProperties parent](self, "parent");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADParagraphProperties defaultTab](self, "defaultTab");
            v48 = v47;
            objc_msgSend(v46, "defaultTab");
            if (v48 == *(float *)&v49)
            {
              LODWORD(v49) = 0;
              -[OADParagraphProperties setDefaultTab:](self, "setDefaultTab:", v49);
              *((_BYTE *)self + 255) &= ~0x40u;
            }

          }
          if (-[OADCharacterProperties hasIsRightToLeft](self, "hasIsRightToLeft"))
          {
            -[OADProperties parent](self, "parent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = -[OADCharacterProperties isRightToLeft](self, "isRightToLeft");
            if (v51 == objc_msgSend(v50, "isRightToLeft"))
            {
              -[OADCharacterProperties setIsRightToLeft:](self, "setIsRightToLeft:", 0);
              *((_BYTE *)&self->super + 158) &= ~2u;
            }

          }
          if (-[OADParagraphProperties hasWrap](self, "hasWrap"))
          {
            -[OADProperties parent](self, "parent");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = -[OADParagraphProperties wrap](self, "wrap");
            if (v53 == objc_msgSend(v52, "wrap"))
            {
              -[OADParagraphProperties setWrap:](self, "setWrap:", 0);
              *((_BYTE *)self + 256) &= ~2u;
            }

          }
          if (-[OADParagraphProperties hasFontAlign](self, "hasFontAlign"))
          {
            -[OADProperties parent](self, "parent");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = -[OADParagraphProperties fontAlign](self, "fontAlign");
            if (v55 == objc_msgSend(v54, "fontAlign"))
            {
              -[OADParagraphProperties setFontAlign:](self, "setFontAlign:", 0);
              *((_BYTE *)self + 256) &= ~4u;
            }

          }
          if (-[OADParagraphProperties hasIsLatinLineBreak](self, "hasIsLatinLineBreak"))
          {
            -[OADProperties parent](self, "parent");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = -[OADParagraphProperties isLatinLineBreak](self, "isLatinLineBreak");
            if (v57 == objc_msgSend(v56, "isLatinLineBreak"))
            {
              -[OADParagraphProperties setIsLatinLineBreak:](self, "setIsLatinLineBreak:", 0);
              *((_BYTE *)self + 256) &= ~8u;
            }

          }
          if (-[OADParagraphProperties hasIsHangingPunctuation](self, "hasIsHangingPunctuation"))
          {
            -[OADProperties parent](self, "parent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[OADParagraphProperties isHangingPunctuation](self, "isHangingPunctuation");
            if (v59 == objc_msgSend(v58, "isHangingPunctuation"))
            {
              -[OADParagraphProperties setIsHangingPunctuation:](self, "setIsHangingPunctuation:", 0);
              *((_BYTE *)self + 256) &= ~0x10u;
            }

          }
          if (-[OADParagraphProperties hasBulletCharSet](self, "hasBulletCharSet"))
          {
            -[OADProperties parent](self, "parent");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = -[OADParagraphProperties bulletCharSet](self, "bulletCharSet");
            if (v61 == objc_msgSend(v60, "bulletCharSet"))
            {
              -[OADParagraphProperties setBulletCharSet:](self, "setBulletCharSet:", 0);
              *((_BYTE *)self + 255) &= ~0x80u;
            }

          }
          if (!-[OADParagraphProperties hasBulletSize](self, "hasBulletSize"))
          {
LABEL_81:
            if (!-[OADParagraphProperties hasBulletColor](self, "hasBulletColor"))
              goto LABEL_89;
            -[OADProperties parent](self, "parent");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADParagraphProperties bulletColor](self, "bulletColor");
            v70 = (objc_object *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "bulletColor");
            v71 = (objc_object *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[objc_object removeUnnecessaryOverrides](v70, "removeUnnecessaryOverrides");
              v72 = objc_opt_class();
              if (v72 != objc_opt_class())
                goto LABEL_88;
              v73 = -[objc_object isMergedWithParent](v70, "isMergedWithParent");
              -[objc_object setMergedWithParent:](v70, "setMergedWithParent:", 0);
              v74 = -[objc_object isAnythingOverridden](v70, "isAnythingOverridden");
              -[objc_object setMergedWithParent:](v70, "setMergedWithParent:", v73);
              if ((v74 & 1) != 0)
                goto LABEL_88;
            }
            else if (!TCObjectEqual(v70, v71))
            {
LABEL_88:

LABEL_89:
              if (!-[OADParagraphProperties hasBulletFont](self, "hasBulletFont"))
                goto LABEL_97;
              -[OADProperties parent](self, "parent");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[OADParagraphProperties bulletFont](self, "bulletFont");
              v77 = (objc_object *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "bulletFont");
              v78 = (objc_object *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[objc_object removeUnnecessaryOverrides](v77, "removeUnnecessaryOverrides");
                v79 = objc_opt_class();
                if (v79 != objc_opt_class())
                  goto LABEL_96;
                v80 = -[objc_object isMergedWithParent](v77, "isMergedWithParent");
                -[objc_object setMergedWithParent:](v77, "setMergedWithParent:", 0);
                v81 = -[objc_object isAnythingOverridden](v77, "isAnythingOverridden");
                -[objc_object setMergedWithParent:](v77, "setMergedWithParent:", v80);
                if ((v81 & 1) != 0)
                  goto LABEL_96;
              }
              else if (!TCObjectEqual(v77, v78))
              {
LABEL_96:

LABEL_97:
                if (!-[OADParagraphProperties hasBulletProperties](self, "hasBulletProperties"))
                {
LABEL_105:
                  -[OADProperties setMerged:](self, "setMerged:", v4);
                  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
                  v90.receiver = self;
                  v90.super_class = (Class)OADParagraphProperties;
                  -[OADCharacterProperties removeUnnecessaryOverrides](&v90, sel_removeUnnecessaryOverrides);
                  return;
                }
                -[OADProperties parent](self, "parent");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                -[OADParagraphProperties bulletProperties](self, "bulletProperties");
                v84 = (objc_object *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "bulletProperties");
                v85 = (objc_object *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  -[objc_object removeUnnecessaryOverrides](v84, "removeUnnecessaryOverrides");
                  v86 = objc_opt_class();
                  if (v86 != objc_opt_class())
                    goto LABEL_104;
                  v87 = -[objc_object isMergedWithParent](v84, "isMergedWithParent");
                  -[objc_object setMergedWithParent:](v84, "setMergedWithParent:", 0);
                  v88 = -[objc_object isAnythingOverridden](v84, "isAnythingOverridden");
                  -[objc_object setMergedWithParent:](v84, "setMergedWithParent:", v87);
                  if ((v88 & 1) != 0)
                    goto LABEL_104;
                }
                else if (!TCObjectEqual(v84, v85))
                {
LABEL_104:

                  goto LABEL_105;
                }
                mBulletProperties = self->mBulletProperties;
                self->mBulletProperties = 0;

                goto LABEL_104;
              }
              mBulletFont = self->mBulletFont;
              self->mBulletFont = 0;

              goto LABEL_96;
            }
            mBulletColor = self->mBulletColor;
            self->mBulletColor = 0;

            goto LABEL_88;
          }
          -[OADProperties parent](self, "parent");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[OADParagraphProperties bulletSize](self, "bulletSize");
          v63 = (objc_object *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "bulletSize");
          v64 = (objc_object *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[objc_object removeUnnecessaryOverrides](v63, "removeUnnecessaryOverrides");
            v65 = objc_opt_class();
            if (v65 != objc_opt_class())
              goto LABEL_80;
            v66 = -[objc_object isMergedWithParent](v63, "isMergedWithParent");
            -[objc_object setMergedWithParent:](v63, "setMergedWithParent:", 0);
            v67 = -[objc_object isAnythingOverridden](v63, "isAnythingOverridden");
            -[objc_object setMergedWithParent:](v63, "setMergedWithParent:", v66);
            if ((v67 & 1) != 0)
              goto LABEL_80;
          }
          else if (!TCObjectEqual(v63, v64))
          {
LABEL_80:

            goto LABEL_81;
          }
          mBulletSize = self->mBulletSize;
          self->mBulletSize = 0;

          goto LABEL_80;
        }
        -[OADProperties parent](self, "parent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADParagraphProperties afterSpacing](self, "afterSpacing");
        v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "afterSpacing");
        v22 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[objc_object removeUnnecessaryOverrides](v21, "removeUnnecessaryOverrides");
          v23 = objc_opt_class();
          if (v23 != objc_opt_class())
            goto LABEL_25;
          v24 = -[objc_object isMergedWithParent](v21, "isMergedWithParent");
          -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", 0);
          v25 = -[objc_object isAnythingOverridden](v21, "isAnythingOverridden");
          -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", v24);
          if ((v25 & 1) != 0)
            goto LABEL_25;
        }
        else if (!TCObjectEqual(v21, v22))
        {
LABEL_25:

          goto LABEL_26;
        }
        mAfterSpacing = self->mAfterSpacing;
        self->mAfterSpacing = 0;

        goto LABEL_25;
      }
      mBeforeSpacing = self->mBeforeSpacing;
      self->mBeforeSpacing = 0;

      goto LABEL_17;
    }
    mLineSpacing = self->mLineSpacing;
    self->mLineSpacing = 0;

    goto LABEL_9;
  }
}

- (double)nonOveridenLeftMargin
{
  double result;

  result = 0.0;
  if ((*((_BYTE *)self + 255) & 8) != 0)
    return self->mLeftMargin;
  return result;
}

- (float)rightMargin
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasRightMargin);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[59];

  return v3;
}

- (int)bulletCharSet
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBulletCharSet);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[62];

  return v3;
}

- (id)tabStops
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasTabStops);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[28];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  float v28;
  float v29;
  float v30;
  int v31;
  float v32;
  float v33;
  float v34;
  int v35;
  int v36;
  int v37;
  float v38;
  float v39;
  float v40;
  int v41;
  int v42;
  int v43;
  float v44;
  float v45;
  float v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  void *v58;
  void *v59;
  char v60;
  int v61;
  void *v62;
  void *v63;
  char v64;
  int v65;
  void *v66;
  void *v67;
  char v68;
  int v69;
  void *v70;
  void *v71;
  char v72;
  int v73;
  BOOL v74;
  int v76;
  objc_super v77;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[OADProperties isMerged](self, "isMerged");
    v7 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    v8 = objc_msgSend(v5, "isMerged");
    v9 = objc_msgSend(v5, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    objc_msgSend(v5, "setMerged:", 0);
    objc_msgSend(v5, "setMergedWithParent:", 0);
    v10 = -[OADParagraphProperties hash](self, "hash");
    if (v10 != objc_msgSend(v5, "hash"))
      goto LABEL_62;
    v77.receiver = self;
    v77.super_class = (Class)OADParagraphProperties;
    if (!-[OADCharacterProperties isEqual:](&v77, sel_isEqual_, v5))
      goto LABEL_62;
    v11 = objc_msgSend(v5, "hasLineSpacing");
    if (v11 != -[OADParagraphProperties hasLineSpacing](self, "hasLineSpacing"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasLineSpacing"))
    {
      objc_msgSend(v5, "lineSpacing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties lineSpacing](self, "lineSpacing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) == 0)
        goto LABEL_62;
    }
    v15 = objc_msgSend(v5, "hasBeforeSpacing");
    if (v15 != -[OADParagraphProperties hasBeforeSpacing](self, "hasBeforeSpacing"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasBeforeSpacing"))
    {
      objc_msgSend(v5, "beforeSpacing");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties beforeSpacing](self, "beforeSpacing");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if ((v18 & 1) == 0)
        goto LABEL_62;
    }
    v19 = objc_msgSend(v5, "hasAfterSpacing");
    if (v19 != -[OADParagraphProperties hasAfterSpacing](self, "hasAfterSpacing"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasAfterSpacing"))
    {
      objc_msgSend(v5, "afterSpacing");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties afterSpacing](self, "afterSpacing");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if ((v22 & 1) == 0)
        goto LABEL_62;
    }
    v23 = objc_msgSend(v5, "hasTabStops");
    if (v23 != -[OADParagraphProperties hasTabStops](self, "hasTabStops"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasTabStops"))
    {
      objc_msgSend(v5, "tabStops");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties tabStops](self, "tabStops");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToArray:", v25);

      if ((v26 & 1) == 0)
        goto LABEL_62;
    }
    v27 = objc_msgSend(v5, "hasLeftMargin");
    if (v27 != -[OADParagraphProperties hasLeftMargin](self, "hasLeftMargin"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasLeftMargin"))
    {
      objc_msgSend(v5, "leftMargin");
      v29 = v28;
      -[OADParagraphProperties leftMargin](self, "leftMargin");
      if (v29 != v30)
        goto LABEL_62;
    }
    v31 = objc_msgSend(v5, "hasRightMargin");
    if (v31 != -[OADParagraphProperties hasRightMargin](self, "hasRightMargin"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasRightMargin"))
    {
      objc_msgSend(v5, "rightMargin");
      v33 = v32;
      -[OADParagraphProperties rightMargin](self, "rightMargin");
      if (v33 != v34)
        goto LABEL_62;
    }
    v35 = objc_msgSend(v5, "hasLevel");
    if (v35 != -[OADParagraphProperties hasLevel](self, "hasLevel"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasLevel"))
    {
      v36 = objc_msgSend(v5, "level");
      if (v36 != -[OADParagraphProperties level](self, "level"))
        goto LABEL_62;
    }
    v37 = objc_msgSend(v5, "hasIndent");
    if (v37 != -[OADParagraphProperties hasIndent](self, "hasIndent"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasIndent"))
    {
      objc_msgSend(v5, "indent");
      v39 = v38;
      -[OADParagraphProperties indent](self, "indent");
      if (v39 != v40)
        goto LABEL_62;
    }
    v41 = objc_msgSend(v5, "hasAlign");
    if (v41 != -[OADParagraphProperties hasAlign](self, "hasAlign"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasAlign"))
    {
      v42 = objc_msgSend(v5, "align");
      if (v42 != -[OADParagraphProperties align](self, "align"))
        goto LABEL_62;
    }
    v43 = objc_msgSend(v5, "hasDefaultTab");
    if (v43 != -[OADParagraphProperties hasDefaultTab](self, "hasDefaultTab"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasDefaultTab"))
    {
      objc_msgSend(v5, "defaultTab");
      v45 = v44;
      -[OADParagraphProperties defaultTab](self, "defaultTab");
      if (v45 != v46)
        goto LABEL_62;
    }
    v47 = objc_msgSend(v5, "hasIsRightToLeft");
    if (v47 != -[OADCharacterProperties hasIsRightToLeft](self, "hasIsRightToLeft"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasIsRightToLeft"))
    {
      v48 = objc_msgSend(v5, "isRightToLeft");
      if (v48 != -[OADCharacterProperties isRightToLeft](self, "isRightToLeft"))
        goto LABEL_62;
    }
    v49 = objc_msgSend(v5, "hasWrap");
    if (v49 != -[OADParagraphProperties hasWrap](self, "hasWrap"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasWrap"))
    {
      v50 = objc_msgSend(v5, "wrap");
      if (v50 != -[OADParagraphProperties wrap](self, "wrap"))
        goto LABEL_62;
    }
    v51 = objc_msgSend(v5, "hasFontAlign");
    if (v51 != -[OADParagraphProperties hasFontAlign](self, "hasFontAlign"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasFontAlign"))
    {
      v52 = objc_msgSend(v5, "fontAlign");
      if (v52 != -[OADParagraphProperties fontAlign](self, "fontAlign"))
        goto LABEL_62;
    }
    v53 = objc_msgSend(v5, "hasIsLatinLineBreak");
    if (v53 != -[OADParagraphProperties hasIsLatinLineBreak](self, "hasIsLatinLineBreak"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasIsLatinLineBreak"))
    {
      v54 = objc_msgSend(v5, "isLatinLineBreak");
      if (v54 != -[OADParagraphProperties isLatinLineBreak](self, "isLatinLineBreak"))
        goto LABEL_62;
    }
    v55 = objc_msgSend(v5, "hasIsHangingPunctuation");
    if (v55 != -[OADParagraphProperties hasIsHangingPunctuation](self, "hasIsHangingPunctuation"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasIsHangingPunctuation"))
    {
      v56 = objc_msgSend(v5, "isHangingPunctuation");
      if (v56 != -[OADParagraphProperties isHangingPunctuation](self, "isHangingPunctuation"))
        goto LABEL_62;
    }
    v57 = objc_msgSend(v5, "hasBulletSize");
    if (v57 != -[OADParagraphProperties hasBulletSize](self, "hasBulletSize"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasBulletSize"))
    {
      objc_msgSend(v5, "bulletSize");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties bulletSize](self, "bulletSize");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqual:", v59);

      if ((v60 & 1) == 0)
        goto LABEL_62;
    }
    v61 = objc_msgSend(v5, "hasBulletColor");
    if (v61 != -[OADParagraphProperties hasBulletColor](self, "hasBulletColor"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasBulletColor"))
    {
      objc_msgSend(v5, "bulletColor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties bulletColor](self, "bulletColor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v62, "isEqual:", v63);

      if ((v64 & 1) == 0)
        goto LABEL_62;
    }
    v65 = objc_msgSend(v5, "hasBulletFont");
    if (v65 != -[OADParagraphProperties hasBulletFont](self, "hasBulletFont"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasBulletFont"))
    {
      objc_msgSend(v5, "bulletFont");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties bulletFont](self, "bulletFont");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqual:", v67);

      if ((v68 & 1) == 0)
        goto LABEL_62;
    }
    v69 = objc_msgSend(v5, "hasBulletProperties");
    if (v69 != -[OADParagraphProperties hasBulletProperties](self, "hasBulletProperties"))
      goto LABEL_62;
    if (objc_msgSend(v5, "hasBulletProperties"))
    {
      objc_msgSend(v5, "bulletProperties");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADParagraphProperties bulletProperties](self, "bulletProperties");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v70, "isEqual:", v71);

      if ((v72 & 1) == 0)
        goto LABEL_62;
    }
    v73 = objc_msgSend(v5, "hasBulletCharSet");
    if (v73 == -[OADParagraphProperties hasBulletCharSet](self, "hasBulletCharSet")
      && (!objc_msgSend(v5, "hasBulletCharSet")
       || (v76 = objc_msgSend(v5, "bulletCharSet"), v76 == -[OADParagraphProperties bulletCharSet](self, "bulletCharSet"))))
    {
      v74 = 1;
    }
    else
    {
LABEL_62:
      v74 = 0;
    }
    -[OADProperties setMerged:](self, "setMerged:", v6);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v7);
    objc_msgSend(v5, "setMerged:", v8);
    objc_msgSend(v5, "setMergedWithParent:", v9);

  }
  else
  {
    v74 = 0;
  }

  return v74;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  unint64_t mLeftMargin;
  unint64_t mRightMargin;
  unint64_t mIndent;
  unint64_t mDefaultTab;
  uint64_t mLevel;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v3 = -[OADBulletSize hash](self->mBulletSize, "hash");
  v4 = -[OADBulletColor hash](self->mBulletColor, "hash");
  v5 = -[OADBulletFont hash](self->mBulletFont, "hash");
  v6 = -[OADBulletProperties hash](self->mBulletProperties, "hash");
  v7 = -[OADTextSpacing hash](self->mLineSpacing, "hash");
  v8 = -[OADTextSpacing hash](self->mBeforeSpacing, "hash");
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[OADTextSpacing hash](self->mAfterSpacing, "hash");
  if (-[NSArray count](self->mTabStops, "count"))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->mTabStops, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 ^= objc_msgSend(v12, "hash");

      v10 = v11;
    }
    while (-[NSArray count](self->mTabStops, "count") > v11++);
  }
  mLeftMargin = (unint64_t)self->mLeftMargin;
  mRightMargin = (unint64_t)self->mRightMargin;
  mIndent = (unint64_t)self->mIndent;
  mDefaultTab = (unint64_t)self->mDefaultTab;
  mLevel = self->mLevel;
  v19 = LOBYTE(self->mBulletCharSet) ^ self->mFontAlign ^ self->mWrap ^ self->mAlign;
  v20 = ((*((_BYTE *)self + 255) ^ (*((_BYTE *)&self->super + 158) >> 2)) ^ (*((_BYTE *)self + 255) >> 1)) & 1;
  v22.receiver = self;
  v22.super_class = (Class)OADParagraphProperties;
  return v9 ^ mLeftMargin ^ mRightMargin ^ mIndent ^ mDefaultTab ^ mLevel ^ v19 ^ -[OADCharacterProperties hash](&v22, sel_hash) ^ v20;
}

- (void)setTabStops:(id)a3
{
  objc_storeStrong((id *)&self->mTabStops, a3);
}

- (unsigned)wrap
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasWrap);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[253];

  return v3;
}

- (unsigned)fontAlign
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFontAlign);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[254];

  return v3;
}

- (BOOL)isLatinLineBreak
{
  _BYTE *v2;
  BOOL v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsLatinLineBreak);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[255] & 1;

  return v3;
}

- (BOOL)isHangingPunctuation
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsHangingPunctuation);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[255] >> 1) & 1;

  return v3;
}

void __43__OADParagraphProperties_defaultProperties__block_invoke()
{
  OADParagraphProperties *v0;
  void *v1;

  v0 = -[OADParagraphProperties initWithDefaults]([OADParagraphProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADParagraphProperties defaultProperties]::defaultProperties;
  +[OADParagraphProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADParagraphProperties;
  return -[OADCharacterProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADParagraphProperties hasLineSpacing](self, "hasLineSpacing")
      || -[OADParagraphProperties hasBeforeSpacing](self, "hasBeforeSpacing")
      || -[OADParagraphProperties hasAfterSpacing](self, "hasAfterSpacing")
      || -[OADParagraphProperties hasTabStops](self, "hasTabStops")
      || -[OADParagraphProperties hasLeftMargin](self, "hasLeftMargin")
      || -[OADParagraphProperties hasRightMargin](self, "hasRightMargin")
      || -[OADParagraphProperties hasLevel](self, "hasLevel")
      || -[OADParagraphProperties hasIndent](self, "hasIndent")
      || -[OADParagraphProperties hasAlign](self, "hasAlign")
      || -[OADParagraphProperties hasDefaultTab](self, "hasDefaultTab")
      || -[OADParagraphProperties hasWrap](self, "hasWrap")
      || -[OADParagraphProperties hasFontAlign](self, "hasFontAlign")
      || -[OADParagraphProperties hasIsLatinLineBreak](self, "hasIsLatinLineBreak")
      || -[OADParagraphProperties hasIsHangingPunctuation](self, "hasIsHangingPunctuation")
      || -[OADParagraphProperties hasBulletSize](self, "hasBulletSize")
      || -[OADParagraphProperties hasBulletColor](self, "hasBulletColor")
      || -[OADParagraphProperties hasBulletFont](self, "hasBulletFont")
      || -[OADParagraphProperties hasBulletProperties](self, "hasBulletProperties")
      || -[OADParagraphProperties hasBulletCharSet](self, "hasBulletCharSet");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  int v6;
  id v7;
  void *v8;
  objc_object *v9;
  void *v10;
  objc_object *v11;
  int v12;
  OADBulletSize *mBulletSize;
  id v14;
  void *v15;
  objc_object *v16;
  void *v17;
  objc_object *v18;
  int v19;
  OADBulletColor *mBulletColor;
  id v21;
  void *v22;
  objc_object *v23;
  void *v24;
  objc_object *v25;
  int v26;
  OADBulletFont *mBulletFont;
  id v28;
  void *v29;
  objc_object *v30;
  void *v31;
  objc_object *v32;
  int v33;
  OADBulletProperties *mBulletProperties;
  id v35;
  void *v36;
  objc_object *v37;
  void *v38;
  objc_object *v39;
  int v40;
  OADTextSpacing *mLineSpacing;
  id v42;
  void *v43;
  objc_object *v44;
  void *v45;
  objc_object *v46;
  int v47;
  OADTextSpacing *mBeforeSpacing;
  id v49;
  void *v50;
  objc_object *v51;
  void *v52;
  objc_object *v53;
  int v54;
  OADTextSpacing *mAfterSpacing;
  id v56;
  void *v57;
  objc_object *v58;
  void *v59;
  objc_object *v60;
  int v61;
  NSArray *mTabStops;
  id v63;
  float v64;
  float v65;
  float v66;
  id v67;
  float v68;
  float v69;
  float v70;
  id v71;
  float v72;
  float v73;
  float v74;
  id v75;
  float v76;
  float v77;
  float v78;
  id v79;
  int v80;
  int v81;
  int v82;
  id v83;
  int v84;
  id v85;
  int v86;
  id v87;
  int v88;
  id v89;
  int v90;
  id v91;
  int v92;
  objc_super v93;

  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)OADParagraphProperties;
  -[OADCharacterProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v93, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if ((*((_BYTE *)self + 255) & 4) != 0
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    v6 = -[OADParagraphProperties level](self, "level");
    if (v6 == objc_msgSend(v4, "level"))
    {
      *((_BYTE *)self + 255) &= ~4u;
    }
    else if ((*((_BYTE *)self + 255) & 4) == 0)
    {
      -[OADParagraphProperties setLevel:](self, "setLevel:", -[OADParagraphProperties level](self, "level"));
    }
  }
  if (-[OADParagraphProperties hasBulletSize](self, "hasBulletSize")
    || (-[OADProperties parent](self, "parent"), v7 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v7,
                                                 v7 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBulletSize);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[OADParagraphProperties bulletSize](self, "bulletSize");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBulletSize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "bulletSize");
      v11 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = TCObjectEqual(v9, v11);
    mBulletSize = self->mBulletSize;
    if (v12)
    {
      self->mBulletSize = 0;

    }
    else if (!mBulletSize && v8)
    {
      -[OADParagraphProperties setBulletSize:](self, "setBulletSize:", v9);
    }

  }
  if (-[OADParagraphProperties hasBulletColor](self, "hasBulletColor")
    || (-[OADProperties parent](self, "parent"),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBulletColor);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[OADParagraphProperties bulletColor](self, "bulletColor");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBulletColor);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "bulletColor");
      v18 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v19 = TCObjectEqual(v16, v18);
    mBulletColor = self->mBulletColor;
    if (v19)
    {
      self->mBulletColor = 0;

    }
    else if (!mBulletColor && v15)
    {
      -[OADParagraphProperties setBulletColor:](self, "setBulletColor:", v16);
    }

  }
  if (-[OADParagraphProperties hasBulletFont](self, "hasBulletFont")
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBulletFont);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[OADParagraphProperties bulletFont](self, "bulletFont");
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBulletFont);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "bulletFont");
      v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v26 = TCObjectEqual(v23, v25);
    mBulletFont = self->mBulletFont;
    if (v26)
    {
      self->mBulletFont = 0;

    }
    else if (!mBulletFont && v22)
    {
      -[OADParagraphProperties setBulletFont:](self, "setBulletFont:", v23);
    }

  }
  if (-[OADParagraphProperties hasBulletProperties](self, "hasBulletProperties")
    || (-[OADProperties parent](self, "parent"),
        v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBulletProperties);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[OADParagraphProperties bulletProperties](self, "bulletProperties");
      v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBulletProperties);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "bulletProperties");
      v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v33 = TCObjectEqual(v30, v32);
    mBulletProperties = self->mBulletProperties;
    if (v33)
    {
      self->mBulletProperties = 0;

    }
    else if (!mBulletProperties && v29)
    {
      -[OADParagraphProperties setBulletProperties:](self, "setBulletProperties:", v30);
    }

  }
  if (-[OADParagraphProperties hasLineSpacing](self, "hasLineSpacing")
    || (-[OADProperties parent](self, "parent"),
        v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasLineSpacing);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[OADParagraphProperties lineSpacing](self, "lineSpacing");
      v37 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasLineSpacing);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "lineSpacing");
      v39 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = 0;
    }
    v40 = TCObjectEqual(v37, v39);
    mLineSpacing = self->mLineSpacing;
    if (v40)
    {
      self->mLineSpacing = 0;

    }
    else if (!mLineSpacing && v36)
    {
      -[OADParagraphProperties setLineSpacing:](self, "setLineSpacing:", v37);
    }

  }
  if (-[OADParagraphProperties hasBeforeSpacing](self, "hasBeforeSpacing")
    || (-[OADProperties parent](self, "parent"),
        v42 = (id)objc_claimAutoreleasedReturnValue(),
        v42,
        v42 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasBeforeSpacing);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[OADParagraphProperties beforeSpacing](self, "beforeSpacing");
      v44 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasBeforeSpacing);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "beforeSpacing");
      v46 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    v47 = TCObjectEqual(v44, v46);
    mBeforeSpacing = self->mBeforeSpacing;
    if (v47)
    {
      self->mBeforeSpacing = 0;

    }
    else if (!mBeforeSpacing && v43)
    {
      -[OADParagraphProperties setBeforeSpacing:](self, "setBeforeSpacing:", v44);
    }

  }
  if (-[OADParagraphProperties hasAfterSpacing](self, "hasAfterSpacing")
    || (-[OADProperties parent](self, "parent"),
        v49 = (id)objc_claimAutoreleasedReturnValue(),
        v49,
        v49 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasAfterSpacing);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[OADParagraphProperties afterSpacing](self, "afterSpacing");
      v51 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasAfterSpacing);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "afterSpacing");
      v53 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = 0;
    }
    v54 = TCObjectEqual(v51, v53);
    mAfterSpacing = self->mAfterSpacing;
    if (v54)
    {
      self->mAfterSpacing = 0;

    }
    else if (!mAfterSpacing && v50)
    {
      -[OADParagraphProperties setAfterSpacing:](self, "setAfterSpacing:", v51);
    }

  }
  if (-[OADParagraphProperties hasTabStops](self, "hasTabStops")
    || (-[OADProperties parent](self, "parent"),
        v56 = (id)objc_claimAutoreleasedReturnValue(),
        v56,
        v56 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasTabStops);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      -[OADParagraphProperties tabStops](self, "tabStops");
      v58 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasTabStops);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v4, "tabStops");
      v60 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }
    v61 = TCObjectEqual(v58, v60);
    mTabStops = self->mTabStops;
    if (v61)
    {
      self->mTabStops = 0;

    }
    else if (!mTabStops && v57)
    {
      -[OADParagraphProperties setTabStops:](self, "setTabStops:", v58);
    }

  }
  if ((*((_BYTE *)self + 255) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v63 = (id)objc_claimAutoreleasedReturnValue(),
        v63,
        v63 != v4))
  {
    -[OADParagraphProperties leftMargin](self, "leftMargin");
    v65 = v64;
    objc_msgSend(v4, "leftMargin");
    if (v65 == v66)
    {
      *((_BYTE *)self + 255) &= ~8u;
    }
    else if ((*((_BYTE *)self + 255) & 8) == 0)
    {
      -[OADParagraphProperties leftMargin](self, "leftMargin");
      -[OADParagraphProperties setLeftMargin:](self, "setLeftMargin:");
    }
  }
  if ((*((_BYTE *)self + 255) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v67 = (id)objc_claimAutoreleasedReturnValue(),
        v67,
        v67 != v4))
  {
    -[OADParagraphProperties rightMargin](self, "rightMargin");
    v69 = v68;
    objc_msgSend(v4, "rightMargin");
    if (v69 == v70)
    {
      *((_BYTE *)self + 255) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 255) & 0x10) == 0)
    {
      -[OADParagraphProperties rightMargin](self, "rightMargin");
      -[OADParagraphProperties setRightMargin:](self, "setRightMargin:");
    }
  }
  if ((*((_BYTE *)self + 255) & 0x20) != 0
    || (-[OADProperties parent](self, "parent"),
        v71 = (id)objc_claimAutoreleasedReturnValue(),
        v71,
        v71 != v4))
  {
    -[OADParagraphProperties indent](self, "indent");
    v73 = v72;
    objc_msgSend(v4, "indent");
    if (v73 == v74)
    {
      *((_BYTE *)self + 255) &= ~0x20u;
    }
    else if ((*((_BYTE *)self + 255) & 0x20) == 0)
    {
      -[OADParagraphProperties indent](self, "indent");
      -[OADParagraphProperties setIndent:](self, "setIndent:");
    }
  }
  if ((*((_BYTE *)self + 255) & 0x40) != 0
    || (-[OADProperties parent](self, "parent"),
        v75 = (id)objc_claimAutoreleasedReturnValue(),
        v75,
        v75 != v4))
  {
    -[OADParagraphProperties defaultTab](self, "defaultTab");
    v77 = v76;
    objc_msgSend(v4, "defaultTab");
    if (v77 == v78)
    {
      *((_BYTE *)self + 255) &= ~0x40u;
    }
    else if ((*((_BYTE *)self + 255) & 0x40) == 0)
    {
      -[OADParagraphProperties defaultTab](self, "defaultTab");
      -[OADParagraphProperties setDefaultTab:](self, "setDefaultTab:");
    }
  }
  if (*((char *)self + 255) < 0
    || (-[OADProperties parent](self, "parent"),
        v79 = (id)objc_claimAutoreleasedReturnValue(),
        v79,
        v79 != v4))
  {
    v80 = -[OADParagraphProperties bulletCharSet](self, "bulletCharSet");
    v81 = objc_msgSend(v4, "bulletCharSet");
    v82 = *((char *)self + 255);
    if (v80 == v81)
    {
      *((_BYTE *)self + 255) = v82 & 0x7F;
    }
    else if ((v82 & 0x80000000) == 0)
    {
      -[OADParagraphProperties setBulletCharSet:](self, "setBulletCharSet:", -[OADParagraphProperties bulletCharSet](self, "bulletCharSet"));
    }
  }
  if ((*((_BYTE *)self + 256) & 1) != 0
    || (-[OADProperties parent](self, "parent"),
        v83 = (id)objc_claimAutoreleasedReturnValue(),
        v83,
        v83 != v4))
  {
    v84 = -[OADParagraphProperties align](self, "align");
    if (v84 == objc_msgSend(v4, "align"))
    {
      *((_BYTE *)self + 256) &= ~1u;
    }
    else if ((*((_BYTE *)self + 256) & 1) == 0)
    {
      -[OADParagraphProperties setAlign:](self, "setAlign:", -[OADParagraphProperties align](self, "align"));
    }
  }
  if ((*((_BYTE *)self + 256) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v85 = (id)objc_claimAutoreleasedReturnValue(),
        v85,
        v85 != v4))
  {
    v86 = -[OADParagraphProperties wrap](self, "wrap");
    if (v86 == objc_msgSend(v4, "wrap"))
    {
      *((_BYTE *)self + 256) &= ~2u;
    }
    else if ((*((_BYTE *)self + 256) & 2) == 0)
    {
      -[OADParagraphProperties setWrap:](self, "setWrap:", -[OADParagraphProperties wrap](self, "wrap"));
    }
  }
  if ((*((_BYTE *)self + 256) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v87 = (id)objc_claimAutoreleasedReturnValue(),
        v87,
        v87 != v4))
  {
    v88 = -[OADParagraphProperties fontAlign](self, "fontAlign");
    if (v88 == objc_msgSend(v4, "fontAlign"))
    {
      *((_BYTE *)self + 256) &= ~4u;
    }
    else if ((*((_BYTE *)self + 256) & 4) == 0)
    {
      -[OADParagraphProperties setFontAlign:](self, "setFontAlign:", -[OADParagraphProperties fontAlign](self, "fontAlign"));
    }
  }
  if ((*((_BYTE *)self + 256) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v89 = (id)objc_claimAutoreleasedReturnValue(),
        v89,
        v89 != v4))
  {
    v90 = -[OADParagraphProperties isLatinLineBreak](self, "isLatinLineBreak");
    if (v90 == objc_msgSend(v4, "isLatinLineBreak"))
    {
      *((_BYTE *)self + 256) &= ~8u;
    }
    else if ((*((_BYTE *)self + 256) & 8) == 0)
    {
      -[OADParagraphProperties setIsLatinLineBreak:](self, "setIsLatinLineBreak:", -[OADParagraphProperties isLatinLineBreak](self, "isLatinLineBreak"));
    }
  }
  if ((*((_BYTE *)self + 256) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v91 = (id)objc_claimAutoreleasedReturnValue(),
        v91,
        v91 != v4))
  {
    v92 = -[OADParagraphProperties isHangingPunctuation](self, "isHangingPunctuation");
    if (v92 == objc_msgSend(v4, "isHangingPunctuation"))
    {
      *((_BYTE *)self + 256) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 256) & 0x10) == 0)
    {
      -[OADParagraphProperties setIsHangingPunctuation:](self, "setIsHangingPunctuation:", -[OADParagraphProperties isHangingPunctuation](self, "isHangingPunctuation"));
    }
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADParagraphProperties;
  -[OADCharacterProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTabStops, 0);
  objc_storeStrong((id *)&self->mAfterSpacing, 0);
  objc_storeStrong((id *)&self->mBeforeSpacing, 0);
  objc_storeStrong((id *)&self->mLineSpacing, 0);
  objc_storeStrong((id *)&self->mBulletProperties, 0);
  objc_storeStrong((id *)&self->mBulletFont, 0);
  objc_storeStrong((id *)&self->mBulletColor, 0);
  objc_storeStrong((id *)&self->mBulletSize, 0);
}

@end
