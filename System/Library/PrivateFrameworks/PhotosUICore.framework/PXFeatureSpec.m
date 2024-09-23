@implementation PXFeatureSpec

- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  id v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  objc_super v51;
  _QWORD v52[2];
  _QWORD v53[2];
  id v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PXFeatureSpec;
  v8 = -[PXFeatureSpec init](&v51, sel_init);
  if (!v8)
    goto LABEL_25;
  objc_msgSend(v7, "displayScale");
  v10 = v9;
  v11 = 1.0;
  if (v10 > 0.0)
    objc_msgSend(v7, "displayScale", 1.0);
  *((double *)v8 + 12) = v11;
  *((_QWORD *)v8 + 2) = a4;
  *((_QWORD *)v8 + 3) = objc_msgSend(v7, "layoutSizeClass");
  *((_QWORD *)v8 + 4) = objc_msgSend(v7, "layoutSizeSubclass");
  *((_QWORD *)v8 + 5) = objc_msgSend(v7, "layoutOrientation");
  *((_QWORD *)v8 + 6) = objc_msgSend(v7, "layoutDirection");
  if (v7)
  {
    objc_msgSend(v7, "layoutReferenceSize");
    *((_QWORD *)v8 + 19) = v12;
    *((_QWORD *)v8 + 20) = v13;
    objc_msgSend(v7, "safeAreaInsets");
    *((_QWORD *)v8 + 21) = v14;
    *((_QWORD *)v8 + 22) = v15;
    *((_QWORD *)v8 + 23) = v16;
    *((_QWORD *)v8 + 24) = v17;
    objc_msgSend(v7, "layoutMargins");
    *((_QWORD *)v8 + 25) = v18;
    *((_QWORD *)v8 + 26) = v19;
    *((_QWORD *)v8 + 27) = v20;
    *((_QWORD *)v8 + 28) = v21;
  }
  else
  {
    *(_OWORD *)(v8 + 152) = *MEMORY[0x1E0C9D820];
    v22 = *(_OWORD *)off_1E50B8020;
    v23 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)(v8 + 168) = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)(v8 + 184) = v23;
    *(_OWORD *)(v8 + 200) = v22;
    *(_OWORD *)(v8 + 216) = v23;
  }
  *((_QWORD *)v8 + 7) = objc_msgSend(v7, "userInterfaceIdiom");
  *((_QWORD *)v8 + 9) = objc_msgSend(v7, "userInterfaceStyle");
  *((_QWORD *)v8 + 10) = objc_msgSend(v7, "userInterfaceLevel");
  *((_QWORD *)v8 + 11) = objc_msgSend(v7, "contentSizeCategory");
  v24 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v25 = (void *)*((_QWORD *)v8 + 16);
  *((_QWORD *)v8 + 16) = v24;

  *((_QWORD *)v8 + 8) = objc_msgSend(v7, "userInterfaceFeature");
  objc_storeStrong((id *)v8 + 18, a3);
  v26 = objc_msgSend(v7, "layoutSizeClass") == 2 || objc_msgSend(v7, "layoutOrientation") == 2;
  v8[8] = v26;
  *((_QWORD *)v8 + 13) = objc_msgSend(v7, "windowOrientation");
  v27 = *((_QWORD *)v8 + 8);
  if ((unint64_t)(v27 - 3) < 3)
    goto LABEL_13;
  if (v27 == 6)
  {
    +[PXLayoutMetricInterpolator photosDetailsEdgeInsetsInterpolator](PXLayoutMetricInterpolator, "photosDetailsEdgeInsetsInterpolator");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v27 == 1)
    {
LABEL_13:
      +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator](PXLayoutMetricInterpolator, "layoutMarginWidthInterpolator");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    +[PXLayoutMetricInterpolator memoriesDetailsEdgeInsetsInterpolator](PXLayoutMetricInterpolator, "memoriesDetailsEdgeInsetsInterpolator");
    v28 = objc_claimAutoreleasedReturnValue();
  }
LABEL_16:
  v29 = (void *)*((_QWORD *)v8 + 17);
  *((_QWORD *)v8 + 17) = v28;

  if ((a4 & 1) != 0
    || (+[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "useFancyDarkening"),
        v30,
        (v31 & 1) == 0))
  {
    v32 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v44);

    v36 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.400000006);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v45);

    v55[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v8 + 14);
    *((_QWORD *)v8 + 14) = v46;

    v54 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v48 = objc_claimAutoreleasedReturnValue();
    v38 = (id)*((_QWORD *)v8 + 15);
    *((_QWORD *)v8 + 15) = v48;
  }
  else
  {
    v32 = objc_alloc_init((Class)off_1E50B5EE8);
    v33 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v8, "defaultDarkenSourceOverAmount");
    objc_msgSend(v33, "colorWithWhite:alpha:", 0.0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v35);

    objc_msgSend(v32, "setCompositingFilterType:", 1);
    v36 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.100000001);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v37);

    v38 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.300000012);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBackgroundColor:", v39);

    v53[0] = v32;
    v53[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v8 + 14);
    *((_QWORD *)v8 + 14) = v40;

    v52[0] = v32;
    v52[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)*((_QWORD *)v8 + 15);
    *((_QWORD *)v8 + 15) = v42;

  }
  v49 = objc_msgSend(v7, "layoutSizeClass") == 1
     && objc_msgSend(v7, "layoutSizeSubclass") == 1
     && objc_msgSend(v7, "layoutOrientation") == 1;
  v8[9] = v49;
LABEL_25:

  return (PXFeatureSpec *)v8;
}

- (double)defaultDarkenSourceOverAmount
{
  return 0.15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->__horizontalContentGuideInsetsInterpolator, 0);
  objc_storeStrong((id *)&self->__viewSpecCache, 0);
  objc_storeStrong((id *)&self->_collectionTileImageOverlaySpecsHighlighted, 0);
  objc_storeStrong((id *)&self->_collectionTileImageOverlaySpecs, 0);
}

- (UIEdgeInsets)contentGuideInsetsForScrollAxis:(int64_t)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t userInterfaceFeature;
  void *v16;
  uint64_t v17;
  int64_t layoutOrientation;
  double v19;
  int64_t v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UIEdgeInsets result;

  -[PXFeatureSpec layoutReferenceSize](self, "layoutReferenceSize");
  -[PXFeatureSpec safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetSize();
  v8 = *(double *)off_1E50B8020;
  v9 = *((double *)off_1E50B8020 + 2);
  if (a3 != 1)
  {
    v10 = *((double *)off_1E50B8020 + 1);
    v11 = *((double *)off_1E50B8020 + 3);
    if (a3 == 2)
    {
      v9 = 12.0;
      if (v7 <= 360.0)
      {
        v8 = 12.0;
      }
      else if (v7 <= 720.0)
      {
        PXFloatByLinearlyInterpolatingFloats();
        v9 = v14;
        v8 = v14;
      }
      else
      {
        v9 = v7 * 0.296296299;
        v8 = v7 * 0.296296299;
      }
    }
    else if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpec.m"), 126, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    goto LABEL_45;
  }
  v13 = v6;
  if (self->_userInterfaceIdiom == 4)
  {
    v9 = 20.0;
    if (v6 <= 640.0)
    {
      v11 = 20.0;
      v10 = 20.0;
    }
    else if (v6 <= 1280.0)
    {
      PXFloatByLinearlyInterpolatingFloats();
      v11 = v22;
      v10 = v22;
    }
    else
    {
      v11 = v6 * 0.166666672;
      v10 = v6 * 0.166666672;
    }
    v8 = 20.0;
    goto LABEL_45;
  }
  v11 = 16.0;
  if (-[PXFeatureSpec _shouldUseMiniMargins](self, "_shouldUseMiniMargins"))
  {
    v10 = 16.0;
    goto LABEL_45;
  }
  userInterfaceFeature = self->_userInterfaceFeature;
  -[PXFeatureSpec extendedTraitCollection](self, "extendedTraitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  layoutOrientation = self->_layoutOrientation;
  if (userInterfaceFeature <= 4 && ((0x1Au >> userInterfaceFeature) & 1) != 0)
  {
    -[PXFeatureSpec layoutReferenceSize](self, "layoutReferenceSize");
    v13 = v19;
  }
  v20 = self->_userInterfaceFeature;
  if (v20 == 4)
  {
    if (self->_userInterfaceIdiom != 2)
      goto LABEL_30;
    -[PXFeatureSpec extendedTraitCollection](self, "extendedTraitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (v20 == 6 && v17 == 1 && layoutOrientation == 2)
  {
    -[PXFeatureSpec rootExtendedTraitCollection](self, "rootExtendedTraitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
    v23 = v21;
    objc_msgSend(v21, "windowReferenceSize");
    v13 = v24;

  }
LABEL_30:
  -[PXFeatureSpec _horizontalContentGuideInsetsInterpolator](self, "_horizontalContentGuideInsetsInterpolator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForMetric:", v13);
  v10 = v26;

  -[PXFeatureSpec layoutMargins](self, "layoutMargins");
  if (self->_userInterfaceFeature == 6)
  {
    if (v17 == 1
      && layoutOrientation == 2
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v30 = objc_msgSend(v29, "orientation"),
          v29,
          v30 == 4))
    {
      -[PXFeatureSpec rootExtendedTraitCollection](self, "rootExtendedTraitCollection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutMargins");
      v11 = v32;

      if (v10 >= v11)
        v11 = v10;
    }
    else
    {
      v11 = v10;
    }
  }
  else
  {
    if (v10 >= v27)
      v33 = v10;
    else
      v33 = v27;
    if (v10 >= v28)
      v11 = v10;
    else
      v11 = v28;
    v10 = v33;
  }
LABEL_45:
  v34 = v8;
  v35 = v10;
  v36 = v9;
  v37 = v11;
  result.right = v37;
  result.bottom = v36;
  result.left = v35;
  result.top = v34;
  return result;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (BOOL)_shouldUseMiniMargins
{
  return self->__shouldUseMiniMargins;
}

- (PXLayoutMetricInterpolator)_horizontalContentGuideInsetsInterpolator
{
  return self->__horizontalContentGuideInsetsInterpolator;
}

- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3
{
  return -[PXFeatureSpec initWithExtendedTraitCollection:options:](self, "initWithExtendedTraitCollection:options:", a3, 0);
}

- (int64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)localizedLeadingTextAlignment
{
  if (localizedLeadingTextAlignment_onceToken != -1)
    dispatch_once(&localizedLeadingTextAlignment_onceToken, &__block_literal_global_44);
  return localizedLeadingTextAlignment_textAlignment;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (double)spacingBetweenYearCards
{
  double result;
  int64_t v4;
  unint64_t v5;
  double v6;
  double v7;

  if (-[PXFeatureSpec sizeClass](self, "sizeClass") == 2)
    return 36.0;
  v4 = -[PXFeatureSpec sizeSubclass](self, "sizeSubclass");
  v5 = -[PXFeatureSpec layoutOrientation](self, "layoutOrientation");
  result = 0.0;
  v6 = 30.0;
  if (v4 == 1)
    v6 = 24.0;
  v7 = 20.0;
  if (v4 == 1)
    v7 = 10.0;
  if (v5 == 2)
    result = v7;
  if (v5 < 2)
    return v6;
  return result;
}

- (double)spacingBetweenMonthCards
{
  int64_t v3;
  double result;
  int64_t v5;
  int64_t v6;
  double v7;

  v3 = -[PXFeatureSpec sizeClass](self, "sizeClass");
  result = 24.0;
  if (v3 != 2)
  {
    v5 = -[PXFeatureSpec sizeSubclass](self, "sizeSubclass", 24.0);
    v6 = -[PXFeatureSpec layoutOrientation](self, "layoutOrientation");
    result = 12.0;
    if (v5 == 1)
      result = 8.0;
    v7 = 24.0;
    if (v5 == 1)
      v7 = 20.0;
    if (v6 != 2)
      return v7;
  }
  return result;
}

- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = -[PXFeatureSpec sizeClass](self, "sizeClass");
  v4 = 20.0;
  v5 = 20.0;
  if (v3 != 2)
    -[PXFeatureSpec contentGuideInsetsForScrollAxis:](self, "contentGuideInsetsForScrollAxis:", 1);
  v6 = 20.0;
  v7 = 20.0;
  result.right = v4;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

uint64_t __46__PXFeatureSpec_localizedLeadingTextAlignment__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99DC8], "px_currentCharacterDirection");
  localizedLeadingTextAlignment_textAlignment = 2 * (result == 2);
  return result;
}

- (PXFeatureSpec)init
{
  return -[PXFeatureSpec initWithExtendedTraitCollection:](self, "initWithExtendedTraitCollection:", 0);
}

- (id)viewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  CGSize var2;
  void *v6;
  void *v7;
  void *v8;
  CGSize v9;
  void *v10;
  __int128 v12;
  CGSize v13;

  var2 = a3->var2;
  v12 = *(_OWORD *)&a3->var0;
  v13 = var2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "px_valueWithViewSpecDescriptor:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeatureSpec _viewSpecCache](self, "_viewSpecCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = a3->var2;
    v12 = *(_OWORD *)&a3->var0;
    v13 = v9;
    -[PXFeatureSpec createViewSpecWithDescriptor:](self, "createViewSpecWithDescriptor:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFeatureSpec _viewSpecCache](self, "_viewSpecCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v8, v6);

  }
  return v8;
}

- (void)configureViewSpec:(id)a3
{
  id v4;

  v4 = a3;
  -[PXFeatureSpec displayScale](self, "displayScale");
  objc_msgSend(v4, "setDisplayScale:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setShouldEnableFocus:", self->_userInterfaceIdiom == 3);

}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  unint64_t v6;
  unsigned int v7;
  PXImageViewSpec *v8;
  void *v9;
  CGSize var2;
  CGSize v12;
  void *v13;
  CGSize v14;
  uint64_t v15;
  unint64_t var1;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  PXImageTitleSubtitleSpec *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  CGSize v28;
  _QWORD v29[2];
  CGSize v30;
  __int128 v31;
  CGSize v32;

  v6 = a3->var0 - 1900;
  if (v6 <= 0x63)
  {
    v7 = (LOBYTE(a3->var0) - 108) / 0xFu;
    switch(v7)
    {
      case 0u:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpec.m"), 198, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1u:
        v8 = objc_alloc_init(PXImageViewSpec);
        -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v8);
        if (-[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom") == 3)
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        else
          -[PXFeatureSpec defaultBackgroundColor](self, "defaultBackgroundColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXViewSpec setBackgroundColor:](v8, "setBackgroundColor:", v22);

        if ((a3->var1 & 1) != 0)
          -[PXFeatureSpec collectionTileImageOverlaySpecsHighlighted](self, "collectionTileImageOverlaySpecsHighlighted");
        else
          -[PXFeatureSpec collectionTileImageOverlaySpecs](self, "collectionTileImageOverlaySpecs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXImageViewSpec setOverlaySpecs:](v8, "setOverlaySpecs:", v24);
        -[PXFeatureSpec collectionTileImageCornerRadius](self, "collectionTileImageCornerRadius");
        -[PXViewSpec setCornerRadius:](v8, "setCornerRadius:");
        if (self->_userInterfaceIdiom == 5)
          -[PXImageViewSpec setRoundedCornersMode:](v8, "setRoundedCornersMode:", 0);

        return v8;
      case 2u:
        var2 = a3->var2;
        v31 = *(_OWORD *)&a3->var0;
        v32 = var2;
        objc_msgSend(off_1E50B31F8, "memoriesLabelSpecForLabelKind:descriptor:featureSpec:", 0, &v31, self);
        v8 = (PXImageViewSpec *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3u:
        v12 = a3->var2;
        v31 = *(_OWORD *)&a3->var0;
        v32 = v12;
        objc_msgSend(off_1E50B31F8, "memoriesLabelSpecForLabelKind:descriptor:featureSpec:", 1, &v31, self);
        v8 = (PXImageViewSpec *)objc_claimAutoreleasedReturnValue();
        -[PXImageViewSpec textAttributes](v8, "textAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXViewSpec setHidden:](v8, "setHidden:", v13 == 0);

LABEL_12:
        if ((a3->var1 & 0x800) != 0)
        {
          if (self->_userInterfaceIdiom == 3)
            objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.419999987, 1.0);
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXImageViewSpec setTextColor:](v8, "setTextColor:", v23);

        }
        return v8;
      case 4u:
        v14 = a3->var2;
        v31 = *(_OWORD *)&a3->var0;
        v32 = v14;
        objc_msgSend(off_1E50B5C68, "memoriesTitleSubtitleSpecForViewSpecDescriptor:featureSpec:", &v31, self);
        return (id)objc_claimAutoreleasedReturnValue();
      case 5u:
        v15 = (-15 * v7 + v6) + 1915;
        var1 = a3->var1;
        v29[0] = v15;
        v29[1] = var1;
        v30 = a3->var2;
        -[PXFeatureSpec viewSpecWithDescriptor:](self, "viewSpecWithDescriptor:", v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = a3->var1;
        v19 = 1960;
        if ((unint64_t)(a3->var0 - 1900) < 0x64)
          v19 = (LOBYTE(a3->var0) - 108) % 0xFu + 1960;
        v27[0] = v19;
        v27[1] = v18;
        v28 = a3->var2;
        -[PXFeatureSpec viewSpecWithDescriptor:](self, "viewSpecWithDescriptor:", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc_init(PXImageTitleSubtitleSpec);
        -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v21);
        -[PXImageTitleSubtitleSpec setTitleSubtitleSpec:](v21, "setTitleSubtitleSpec:", v20);
        -[PXImageTitleSubtitleSpec setImageSpec:](v21, "setImageSpec:", v17);

        return v21;
      default:
        return 0;
    }
  }
  if (a3->var0 != 1000)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpec.m"), 268, CFSTR("unknown context %li"), a3->var0);

    abort();
  }
  v8 = (PXImageViewSpec *)objc_alloc_init((Class)off_1E50B5EE8);
  -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v8);
  -[PXFeatureSpec defaultPlaceholderColor](self, "defaultPlaceholderColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXViewSpec setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[PXFeatureSpec defaultCornerRadius](self, "defaultCornerRadius");
  -[PXViewSpec setCornerRadius:](v8, "setCornerRadius:");
  return v8;
}

- (UIEdgeInsets)_fullscreenContentInsetsForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  PXEdgeInsetsScale();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)fullscreenMiroViewSpec
{
  -[PXFeatureSpec layoutReferenceSize](self, "layoutReferenceSize");
  return -[PXFeatureSpec fullscreenMiroViewSpecWithBoundingSize:](self, "fullscreenMiroViewSpecWithBoundingSize:");
}

- (id)fullscreenMiroViewSpecWithBoundingSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  _QWORD v33[4];

  height = a3.height;
  width = a3.width;
  -[PXFeatureSpec extendedTraitCollection](self, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 1966;
  v33[1] = (unint64_t)(v7 == 0) << 12;
  *(double *)&v33[2] = width;
  *(double *)&v33[3] = height;
  -[PXFeatureSpec viewSpecWithDescriptor:](self, "viewSpecWithDescriptor:", v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpec.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self viewSpecWithDescriptor:descriptor]"), v26);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeatureSpec.m"), 292, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self viewSpecWithDescriptor:descriptor]"), v26, v28);

LABEL_14:
    if (v7)
      goto LABEL_4;
LABEL_15:
    -[PXFeatureSpec _fullscreenContentInsetsForWidth:](self, "_fullscreenContentInsetsForWidth:", width);
    v22 = v29;
    v19 = v30;
    v18 = v31;
    goto LABEL_16;
  }
  if (!v7)
    goto LABEL_15;
LABEL_4:
  if (objc_msgSend(v7, "userInterfaceIdiom") == 3)
    goto LABEL_15;
  objc_msgSend(v7, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_15;
  objc_msgSend(v7, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator](PXLayoutMetricInterpolator, "layoutMarginWidthInterpolator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v14 = v13;
  v16 = v15;
  if (objc_msgSend(v11, "verticalSizeClass") == 2)
  {
    objc_msgSend(v12, "valueForMetric:", width);
    v18 = v17;
    if (objc_msgSend(v11, "horizontalSizeClass") == 2)
      v19 = 80.0;
    else
      v19 = v16 + 40.0;
  }
  else
  {
    PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
    v19 = v16 + v20 + 27.0;
    objc_msgSend(v12, "valueForMetric:", height);
    v18 = v14 + v21;
  }
  v22 = *(double *)off_1E50B8020;

  v23 = v18;
LABEL_16:
  objc_msgSend(v8, "setPadding:", v22, v23, v19, v18);

  return v8;
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  void *v2;
  void *v3;

  -[PXFeatureSpec extendedTraitCollection](self, "extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootExtendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXExtendedTraitCollection *)v3;
}

- (UIColor)defaultBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (double)defaultCornerRadius
{
  double result;

  result = 4.0;
  if (self->_userInterfaceIdiom == 3)
    return 8.0;
  return result;
}

- (UIColor)defaultPlaceholderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
}

- (UIColor)defaultPlacesPlaceholderColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
}

- (id)collectionTileImageOverlayColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.100000001);
}

- (id)collectionTileImageOverlayColorHighlighted
{
  if (self->_userInterfaceIdiom == 3)
    -[PXFeatureSpec collectionTileImageOverlayColor](self, "collectionTileImageOverlayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_capitalizationStyleFromTextAttributes:(id)a3 defaultCapitalizationStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7E50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowCapitalization");

  if (!v8)
    a4 = 0;

  return a4;
}

- (id)_textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PXFontCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_10;
    v14 = (void *)_textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames;
    if (!_textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)_textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames;
      _textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames = v15;

      v14 = (void *)_textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames;
    }
    if ((objc_msgSend(v14, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend((id)_textAttributesForFontName_fontSize_lineHeight_tracking_stroke__reportedFontNames, "addObject:", v11);
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v11;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Couldn't find font with name %@", (uint8_t *)&v22, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0DC1138]);
  if (a5 != 0.0)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v18, "setMinimumLineHeight:", a5);
    objc_msgSend(v18, "setMaximumLineHeight:", a5);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DC1178]);

  }
  if (a6 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4 * a6 / 1000.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1150]);

  }
  if (a7 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC11B8]);

  }
  return v12;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (NSArray)collectionTileImageOverlaySpecs
{
  return self->_collectionTileImageOverlaySpecs;
}

- (NSArray)collectionTileImageOverlaySpecsHighlighted
{
  return self->_collectionTileImageOverlaySpecsHighlighted;
}

- (BOOL)shouldInsetAllPhotoDetailsContent
{
  return self->_shouldInsetAllPhotoDetailsContent;
}

- (NSCache)_viewSpecCache
{
  return self->__viewSpecCache;
}

@end
