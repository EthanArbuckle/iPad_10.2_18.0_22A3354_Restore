@implementation STUIStatusBarStyleAttributes

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "style");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "traitCollection");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mode");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "font");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isScaledFixedWidthBar");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "symbolScale");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconSize");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconScale");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveLayoutDirection");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageNamePrefixes");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageDimmedTintColor");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageTintColor");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smallFont");
}

uint64_t __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "emphasizedFont");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  int64_t v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  int64_t v24;
  id v25;
  id v26;
  int64_t v27;
  id v28;
  id v29;
  _BOOL8 v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = -[STUIStatusBarStyleAttributes style](self, "style");
  v8 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke;
  v81[3] = &unk_1E8D63930;
  v9 = v6;
  v82 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v7, v81);
  v11 = -[STUIStatusBarStyleAttributes mode](self, "mode");
  v79[0] = v8;
  v79[1] = 3221225472;
  v79[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_2;
  v79[3] = &unk_1E8D63930;
  v12 = v9;
  v80 = v12;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v11, v79);
  -[STUIStatusBarStyleAttributes traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v8;
  v77[1] = 3221225472;
  v77[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_3;
  v77[3] = &unk_1E8D62FB0;
  v15 = v12;
  v78 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", v14, v77);

  v17 = -[STUIStatusBarStyleAttributes effectiveLayoutDirection](self, "effectiveLayoutDirection");
  v75[0] = v8;
  v75[1] = 3221225472;
  v75[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_4;
  v75[3] = &unk_1E8D63930;
  v18 = v15;
  v76 = v18;
  v19 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v17, v75);
  -[STUIStatusBarStyleAttributes iconScale](self, "iconScale");
  v21 = v20;
  v73[0] = v8;
  v73[1] = 3221225472;
  v73[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_5;
  v73[3] = &unk_1E8D62C38;
  v22 = v18;
  v74 = v22;
  v23 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v73, v21);
  v24 = -[STUIStatusBarStyleAttributes iconSize](self, "iconSize");
  v71[0] = v8;
  v71[1] = 3221225472;
  v71[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_6;
  v71[3] = &unk_1E8D63930;
  v25 = v22;
  v72 = v25;
  v26 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v24, v71);
  v27 = -[STUIStatusBarStyleAttributes symbolScale](self, "symbolScale");
  v69[0] = v8;
  v69[1] = 3221225472;
  v69[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_7;
  v69[3] = &unk_1E8D63930;
  v28 = v25;
  v70 = v28;
  v29 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v27, v69);
  v30 = -[STUIStatusBarStyleAttributes isScaledFixedWidthBar](self, "isScaledFixedWidthBar");
  v67[0] = v8;
  v67[1] = 3221225472;
  v67[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_8;
  v67[3] = &unk_1E8D62C60;
  v31 = v28;
  v68 = v31;
  v32 = (id)objc_msgSend(v5, "appendBool:counterpart:", v30, v67);
  -[STUIStatusBarStyleAttributes font](self, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v8;
  v65[1] = 3221225472;
  v65[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_9;
  v65[3] = &unk_1E8D62FB0;
  v34 = v31;
  v66 = v34;
  v35 = (id)objc_msgSend(v5, "appendObject:counterpart:", v33, v65);

  -[STUIStatusBarStyleAttributes emphasizedFont](self, "emphasizedFont");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v8;
  v63[1] = 3221225472;
  v63[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_10;
  v63[3] = &unk_1E8D62FB0;
  v37 = v34;
  v64 = v37;
  v38 = (id)objc_msgSend(v5, "appendObject:counterpart:", v36, v63);

  -[STUIStatusBarStyleAttributes smallFont](self, "smallFont");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v8;
  v61[1] = 3221225472;
  v61[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_11;
  v61[3] = &unk_1E8D62FB0;
  v40 = v37;
  v62 = v40;
  v41 = (id)objc_msgSend(v5, "appendObject:counterpart:", v39, v61);

  -[STUIStatusBarStyleAttributes imageTintColor](self, "imageTintColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v8;
  v59[1] = 3221225472;
  v59[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_12;
  v59[3] = &unk_1E8D62FB0;
  v43 = v40;
  v60 = v43;
  v44 = (id)objc_msgSend(v5, "appendObject:counterpart:", v42, v59);

  -[STUIStatusBarStyleAttributes imageDimmedTintColor](self, "imageDimmedTintColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v8;
  v57[1] = 3221225472;
  v57[2] = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_13;
  v57[3] = &unk_1E8D62FB0;
  v46 = v43;
  v58 = v46;
  v47 = (id)objc_msgSend(v5, "appendObject:counterpart:", v45, v57);

  -[STUIStatusBarStyleAttributes imageNamePrefixes](self, "imageNamePrefixes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v8;
  v53 = 3221225472;
  v54 = __40__STUIStatusBarStyleAttributes_isEqual___block_invoke_14;
  v55 = &unk_1E8D62FB0;
  v56 = v46;
  v49 = v46;
  v50 = (id)objc_msgSend(v5, "appendObject:counterpart:", v48, &v52);

  LOBYTE(v46) = objc_msgSend(v5, "isEqual", v52, v53, v54, v55);
  return (char)v46;
}

- (STUIStatusBarStyleAttributes)styleAttributesWithOverrides:(id)a3
{
  STUIStatusBarStyleAttributes *v4;
  STUIStatusBarStyleAttributes *v5;
  STUIStatusBarStyleAttributes *v6;
  double v7;
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
  void *v21;

  v4 = (STUIStatusBarStyleAttributes *)a3;
  v5 = v4;
  if (!v4 || v4 == self)
  {
    v6 = self;
  }
  else
  {
    v6 = (STUIStatusBarStyleAttributes *)-[STUIStatusBarStyleAttributes copy](self, "copy");
    -[STUIStatusBarStyleAttributes iconScale](v5, "iconScale");
    if (v7 > 0.0)
    {
      -[STUIStatusBarStyleAttributes iconScale](v5, "iconScale");
      -[STUIStatusBarStyleAttributes setIconScale:](v6, "setIconScale:");
    }
    if (-[STUIStatusBarStyleAttributes iconSize](v5, "iconSize"))
      -[STUIStatusBarStyleAttributes setIconSize:](v6, "setIconSize:", -[STUIStatusBarStyleAttributes iconSize](v5, "iconSize"));
    if (-[STUIStatusBarStyleAttributes symbolScale](v5, "symbolScale"))
      -[STUIStatusBarStyleAttributes setSymbolScale:](v6, "setSymbolScale:", -[STUIStatusBarStyleAttributes symbolScale](v5, "symbolScale"));
    -[STUIStatusBarStyleAttributes font](v5, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[STUIStatusBarStyleAttributes font](v5, "font");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setFont:](v6, "setFont:", v9);

    }
    -[STUIStatusBarStyleAttributes emphasizedFont](v5, "emphasizedFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[STUIStatusBarStyleAttributes emphasizedFont](v5, "emphasizedFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setEmphasizedFont:](v6, "setEmphasizedFont:", v11);

    }
    -[STUIStatusBarStyleAttributes smallFont](v5, "smallFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[STUIStatusBarStyleAttributes smallFont](v5, "smallFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setSmallFont:](v6, "setSmallFont:", v13);

    }
    -[STUIStatusBarStyleAttributes textColor](v5, "textColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[STUIStatusBarStyleAttributes textColor](v5, "textColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setTextColor:](v6, "setTextColor:", v15);

    }
    -[STUIStatusBarStyleAttributes imageTintColor](v5, "imageTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[STUIStatusBarStyleAttributes imageTintColor](v5, "imageTintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setImageTintColor:](v6, "setImageTintColor:", v17);

    }
    -[STUIStatusBarStyleAttributes imageDimmedTintColor](v5, "imageDimmedTintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[STUIStatusBarStyleAttributes imageDimmedTintColor](v5, "imageDimmedTintColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setImageDimmedTintColor:](v6, "setImageDimmedTintColor:", v19);

    }
    -[STUIStatusBarStyleAttributes imageNamePrefixes](v5, "imageNamePrefixes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[STUIStatusBarStyleAttributes imageNamePrefixes](v5, "imageNamePrefixes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarStyleAttributes setImageNamePrefixes:](v6, "setImageNamePrefixes:", v21);

    }
  }

  return v6;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIFont)font
{
  return self->_font;
}

- (NSArray)imageNamePrefixes
{
  return self->_imageNamePrefixes;
}

- (UIFont)smallFont
{
  return self->_smallFont;
}

- (UIColor)imageDimmedTintColor
{
  return self->_imageDimmedTintColor;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (UIFont)emphasizedFont
{
  return self->_emphasizedFont;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v4 + 2) = self->_style;
  *((_QWORD *)v4 + 3) = self->_mode;
  objc_storeStrong((id *)v4 + 4, self->_traitCollection);
  *((_QWORD *)v4 + 5) = self->_effectiveLayoutDirection;
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_iconScale;
  *((_QWORD *)v4 + 8) = self->_iconSize;
  *((_QWORD *)v4 + 7) = self->_symbolScale;
  *((_BYTE *)v4 + 8) = self->_scaledFixedWidthBar;
  objc_msgSend(v4, "setFont:", self->_font);
  objc_msgSend(v4, "setEmphasizedFont:", self->_emphasizedFont);
  objc_msgSend(v4, "setSmallFont:", self->_smallFont);
  objc_msgSend(v4, "setTextColor:", self->_textColor);
  objc_msgSend(v4, "setImageTintColor:", self->_imageTintColor);
  objc_msgSend(v4, "setImageDimmedTintColor:", self->_imageDimmedTintColor);
  v5 = (void *)-[NSArray copy](self->_imageNamePrefixes, "copy");
  objc_msgSend(v4, "setImageNamePrefixes:", v5);

  return v4;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setImageNamePrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSmallFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setEmphasizedFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setImageDimmedTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setImageTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)style
{
  return self->_style;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (int64_t)effectiveLayoutDirection
{
  return self->_effectiveLayoutDirection;
}

- (BOOL)isScaledFixedWidthBar
{
  return self->_scaledFixedWidthBar;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

+ (id)styleAttributesForStatusBar:(id)a3 style:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  *((_QWORD *)v7 + 2) = a4;
  *((_QWORD *)v7 + 3) = objc_msgSend(v6, "mode");
  *((_QWORD *)v7 + 5) = objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection");
  *((_QWORD *)v7 + 6) = 0x3FF0000000000000;
  *((_QWORD *)v7 + 7) = 0;
  objc_msgSend(v6, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  if (v9 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollectionByReplacingCGFloatValue:forTrait:", v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }
  objc_storeStrong((id *)v7 + 4, v8);
  objc_msgSend(v8, "displayScale");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");
  if (v18 == 1)
  {
    v19 = 14;
  }
  else if (v18 == 3)
  {
    v19 = 16;
    if (v16 > 2.5)
      v19 = 17;
  }
  else if (v16 <= 2.5)
  {
    v19 = 1;
  }
  else
  {
    v19 = 2;
  }
  *((_QWORD *)v7 + 8) = v19;

  objc_msgSend(v6, "foregroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "foregroundColor");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v7 + 12);
    *((_QWORD *)v7 + 12) = v21;

    objc_msgSend(v6, "foregroundColor");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v7 + 13);
    *((_QWORD *)v7 + 13) = v23;

  }
  return v7;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNamePrefixes, 0);
  objc_storeStrong((id *)&self->_imageDimmedTintColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_smallFont, 0);
  objc_storeStrong((id *)&self->_emphasizedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

+ (id)overriddenStyleAttributes
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isRounded
{
  void *v2;
  void *UIFontDesign;

  -[STUIStatusBarStyleAttributes font](self, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIFontDesign = (void *)CTFontGetUIFontDesign();

  LOBYTE(v2) = objc_msgSend(UIFontDesign, "isEqualToString:", *MEMORY[0x1E0CA8440]);
  return (char)v2;
}

- (id)fontForStyle:(int64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2:
      -[STUIStatusBarStyleAttributes smallFont](self, "smallFont");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[STUIStatusBarStyleAttributes emphasizedFont](self, "emphasizedFont");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[STUIStatusBarStyleAttributes font](self, "font");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUIStatusBarStyleAttributes)initWithCoder:(id)a3
{
  id v3;
  STUIStatusBarStyleAttributes *v4;
  uint64_t v5;
  UITraitCollection *traitCollection;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarStyleAttributes;
  v3 = a3;
  v4 = -[STUIStatusBarStyleAttributes init](&v16, sel_init);
  v4->_style = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("style"), v16.receiver, v16.super_class);
  v4->_mode = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mode"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
  v5 = objc_claimAutoreleasedReturnValue();
  traitCollection = v4->_traitCollection;
  v4->_traitCollection = (UITraitCollection *)v5;

  v4->_effectiveLayoutDirection = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("effectiveLayoutDirection"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("iconScale"));
  v4->_iconScale = v7;
  v4->_iconSize = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("iconSize"));
  v4->_symbolScale = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("symbolScale"));
  v4->_scaledFixedWidthBar = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("scaledFixedWidthBar"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setFont:](v4, "setFont:", v8);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emphasizedFont"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setEmphasizedFont:](v4, "setEmphasizedFont:", v9);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smallFont"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setSmallFont:](v4, "setSmallFont:", v10);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setTextColor:](v4, "setTextColor:", v11);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageTintColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setImageTintColor:](v4, "setImageTintColor:", v12);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDimmedTintColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarStyleAttributes setImageDimmedTintColor:](v4, "setImageDimmedTintColor:", v13);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageNamePrefixes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarStyleAttributes setImageNamePrefixes:](v4, "setImageNamePrefixes:", v14);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("style"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_effectiveLayoutDirection, CFSTR("effectiveLayoutDirection"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("iconScale"), self->_iconScale);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_iconSize, CFSTR("iconSize"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_symbolScale, CFSTR("symbolScale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_scaledFixedWidthBar, CFSTR("scaledFixedWidthBar"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emphasizedFont, CFSTR("emphasizedFont"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_smallFont, CFSTR("smallFont"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textColor, CFSTR("textColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageTintColor, CFSTR("imageTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageDimmedTintColor, CFSTR("imageDimmedTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageNamePrefixes, CFSTR("imageNamePrefixes"));

}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes style](self, "style"));
  v5 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes mode](self, "mode"));
  -[STUIStatusBarStyleAttributes traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes effectiveLayoutDirection](self, "effectiveLayoutDirection"));
  -[STUIStatusBarStyleAttributes iconScale](self, "iconScale");
  v9 = (id)objc_msgSend(v3, "appendCGFloat:");
  v10 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes iconSize](self, "iconSize"));
  v11 = (id)objc_msgSend(v3, "appendInteger:", -[STUIStatusBarStyleAttributes symbolScale](self, "symbolScale"));
  v12 = (id)objc_msgSend(v3, "appendBool:", -[STUIStatusBarStyleAttributes isScaledFixedWidthBar](self, "isScaledFixedWidthBar"));
  -[STUIStatusBarStyleAttributes font](self, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:", v13);

  -[STUIStatusBarStyleAttributes emphasizedFont](self, "emphasizedFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:", v15);

  -[STUIStatusBarStyleAttributes smallFont](self, "smallFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:", v17);

  -[STUIStatusBarStyleAttributes imageTintColor](self, "imageTintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:", v19);

  -[STUIStatusBarStyleAttributes imageDimmedTintColor](self, "imageDimmedTintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:", v21);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[STUIStatusBarStyleAttributes imageNamePrefixes](self, "imageNamePrefixes", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        v28 = (id)objc_msgSend(v3, "appendString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v25);
  }

  v29 = objc_msgSend(v3, "hash");
  return v29;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarStyleAttributes descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarStyleAttributes debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarStyleAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarStyleAttributes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarStyleAttributes _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarStyleAttributes _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STUIStatusBarStyleAttributes *v14;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarStyleAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__STUIStatusBarStyleAttributes__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E8D62C88;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __80__STUIStatusBarStyleAttributes__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;

  v2 = *(void **)(a1 + 32);
  _UIStatusBarResolvedStyleDescription(objc_msgSend(*(id *)(a1 + 40), "style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("style"));

  v4 = *(void **)(a1 + 32);
  STUIStatusBarModeDescription(objc_msgSend(*(id *)(a1 + 40), "mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("mode"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "effectiveLayoutDirection") == 1, CFSTR("isRTL"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("iconSize"), 1, (double)objc_msgSend(*(id *)(a1 + 40), "iconSize"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "symbolScale"), CFSTR("symbolScale"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("traitCollection"));

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "appendObject:withName:skipIfNil:", v13, CFSTR("font"), 1);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "emphasizedFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "appendObject:withName:skipIfNil:", v16, CFSTR("emphasizedFont"), 1);

  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "smallFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "appendObject:withName:skipIfNil:", v19, CFSTR("smallFont"), 1);

  v21 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "appendObject:withName:skipIfNil:", v22, CFSTR("textColor"), 1);

  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageTintColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v24, "appendObject:withName:skipIfNil:", v25, CFSTR("imageTintColor"), 1);

  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageDimmedTintColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v27, "appendObject:withName:skipIfNil:", v28, CFSTR("imageDimmedTintColor"), 1);

  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageNamePrefixes");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendString:withName:skipIfEmpty:", v31, CFSTR("imageNamePrefixes"), 1);

}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setScaledFixedWidthBar:(BOOL)a3
{
  self->_scaledFixedWidthBar = a3;
}

@end
