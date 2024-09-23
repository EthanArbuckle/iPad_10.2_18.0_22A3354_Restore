@implementation EDResources

- (EDResources)initWithStringOptimization:(BOOL)a3
{
  _BOOL4 v3;
  EDResources *v4;
  EDContentFormatsCollection *v5;
  EDContentFormatsCollection *mContentFormats;
  EDFontsCollection *v7;
  EDFontsCollection *mFonts;
  EDCollection *v9;
  EDCollection *mAlignmentInfos;
  EDStylesCollection *v11;
  EDStylesCollection *mStyles;
  EDColorsCollection *v13;
  EDColorsCollection *mColors;
  EDColorsCollection *v15;
  EDColorsCollection *mThemes;
  EDCollection *v17;
  EDCollection *mNames;
  EDLinksCollection *v19;
  EDLinksCollection *mLinks;
  EDCollection *v21;
  EDCollection *mBorders;
  EDCollection *v23;
  EDCollection *mBorder;
  EDCollection *v25;
  EDCollection *mFills;
  EDCollection *v27;
  EDCollection *mDifferentialStyles;
  EDTableStylesCollection *v29;
  EDTableStylesCollection *mTableStyles;
  EDOptimizedStringsCollection *v31;
  EDCollection *mStrings;
  objc_super v34;

  v3 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EDResources;
  v4 = -[EDResources init](&v34, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(EDContentFormatsCollection);
    mContentFormats = v4->mContentFormats;
    v4->mContentFormats = v5;

    v7 = objc_alloc_init(EDFontsCollection);
    mFonts = v4->mFonts;
    v4->mFonts = v7;

    v9 = objc_alloc_init(EDCollection);
    mAlignmentInfos = v4->mAlignmentInfos;
    v4->mAlignmentInfos = v9;

    v11 = objc_alloc_init(EDStylesCollection);
    mStyles = v4->mStyles;
    v4->mStyles = v11;

    v13 = -[EDColorsCollection initWithDefaultSetup:]([EDColorsCollection alloc], "initWithDefaultSetup:", 1);
    mColors = v4->mColors;
    v4->mColors = v13;

    v15 = -[EDColorsCollection initWithDefaultSetup:]([EDColorsCollection alloc], "initWithDefaultSetup:", 0);
    mThemes = v4->mThemes;
    v4->mThemes = v15;

    v17 = objc_alloc_init(EDCollection);
    mNames = v4->mNames;
    v4->mNames = v17;

    v19 = objc_alloc_init(EDLinksCollection);
    mLinks = v4->mLinks;
    v4->mLinks = v19;

    v21 = objc_alloc_init(EDCollection);
    mBorders = v4->mBorders;
    v4->mBorders = v21;

    v23 = objc_alloc_init(EDCollection);
    mBorder = v4->mBorder;
    v4->mBorder = v23;

    v25 = objc_alloc_init(EDCollection);
    mFills = v4->mFills;
    v4->mFills = v25;

    v27 = objc_alloc_init(EDCollection);
    mDifferentialStyles = v4->mDifferentialStyles;
    v4->mDifferentialStyles = v27;

    v29 = objc_alloc_init(EDTableStylesCollection);
    mTableStyles = v4->mTableStyles;
    v4->mTableStyles = v29;

    if (v3)
      v31 = objc_alloc_init(EDOptimizedStringsCollection);
    else
      v31 = objc_alloc_init(EDCollection);
    mStrings = v4->mStrings;
    v4->mStrings = &v31->super;

  }
  return v4;
}

- (id)fonts
{
  return self->mFonts;
}

- (id)contentFormats
{
  return self->mContentFormats;
}

- (id)styles
{
  return self->mStyles;
}

- (id)alignmentInfos
{
  return self->mAlignmentInfos;
}

- (id)border
{
  return self->mBorder;
}

- (id)borders
{
  return self->mBorders;
}

- (id)fills
{
  return self->mFills;
}

- (void)setColors:(id)a3
{
  EDColorsCollection *v5;
  EDColorsCollection **p_mColors;
  EDColorsCollection *mColors;
  EDColorsCollection *v8;

  v5 = (EDColorsCollection *)a3;
  mColors = self->mColors;
  p_mColors = &self->mColors;
  if (mColors != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mColors, a3);
    v5 = v8;
  }

}

- (id)links
{
  return self->mLinks;
}

- (id)names
{
  return self->mNames;
}

- (id)strings
{
  return self->mStrings;
}

- (id)colors
{
  return self->mColors;
}

- (id)differentialStyles
{
  return self->mDifferentialStyles;
}

- (id)themes
{
  return self->mThemes;
}

- (id)tableStyles
{
  return self->mTableStyles;
}

- (void)setThemes:(id)a3
{
  EDColorsCollection *v5;
  EDColorsCollection **p_mThemes;
  EDColorsCollection *mThemes;
  EDColorsCollection *v8;

  v5 = (EDColorsCollection *)a3;
  mThemes = self->mThemes;
  p_mThemes = &self->mThemes;
  if (mThemes != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mThemes, a3);
    v5 = v8;
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDResources;
  -[EDResources description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableStyles, 0);
  objc_storeStrong((id *)&self->mDifferentialStyles, 0);
  objc_storeStrong((id *)&self->mFills, 0);
  objc_storeStrong((id *)&self->mBorder, 0);
  objc_storeStrong((id *)&self->mBorders, 0);
  objc_storeStrong((id *)&self->mLinks, 0);
  objc_storeStrong((id *)&self->mNames, 0);
  objc_storeStrong((id *)&self->mThemes, 0);
  objc_storeStrong((id *)&self->mColors, 0);
  objc_storeStrong((id *)&self->mStyles, 0);
  objc_storeStrong((id *)&self->mAlignmentInfos, 0);
  objc_storeStrong((id *)&self->mFonts, 0);
  objc_storeStrong((id *)&self->mContentFormats, 0);
  objc_storeStrong((id *)&self->mStrings, 0);
}

@end
