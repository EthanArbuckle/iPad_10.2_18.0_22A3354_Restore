@implementation PXWidgetCompositionSpec

- (PXWidgetCompositionSpec)init
{
  return -[PXWidgetCompositionSpec initWithExtendedTraitCollection:widgetSpec:](self, "initWithExtendedTraitCollection:widgetSpec:", 0, 0);
}

- (PXWidgetCompositionSpec)initWithExtendedTraitCollection:(id)a3 widgetSpec:(id)a4
{
  id v6;
  id v7;
  PXWidgetCompositionSpec *v8;
  PXWidgetCompositionSpec *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PXWidgetBarSpec *defaultHeaderSpec;
  PXWidgetBarSpec *v24;
  PXWidgetBarSpec *v25;
  PXWidgetBarSpec *v26;
  uint64_t v27;
  PXWidgetBarSpec *headerSpecForFlushedContent;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  PXWidgetBarSpec *footerSpec;
  PXWidgetBarSpec *v33;
  PXWidgetBarSpec *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[8];
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PXWidgetCompositionSpec;
  v8 = -[PXWidgetCompositionSpec init](&v39, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_widgetSpec, a4);
    v10 = objc_msgSend(v6, "layoutSizeClass");
    if (v10 == 2)
    {
      +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "allowMultiColumnLayout");
      v13 = 1;
      if (v12)
        v13 = 2;
      v9->_maximumNumberOfColumns = v13;

    }
    else
    {
      v9->_maximumNumberOfColumns = 1;
    }
    objc_msgSend(v7, "contentGuideInsets");
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __70__PXWidgetCompositionSpec_initWithExtendedTraitCollection_widgetSpec___block_invoke;
    v38[3] = &__block_descriptor_64_e22___PXWidgetBarSpec_8__0l;
    v38[4] = 0;
    v38[5] = v14;
    v38[6] = 0;
    v38[7] = v15;
    v16 = (void (**)(_QWORD))_Block_copy(v38);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyleSymbolicTraits();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyleSymbolicTraits();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.349999994, 0.600000024);
      v20 = objc_claimAutoreleasedReturnValue();

      PXFontWithTextStyle();
      v21 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v20;
      v18 = (void *)v21;
    }
    v16[2](v16);
    v22 = objc_claimAutoreleasedReturnValue();
    defaultHeaderSpec = v9->__defaultHeaderSpec;
    v9->__defaultHeaderSpec = (PXWidgetBarSpec *)v22;

    -[PXWidgetBarSpec setTextColor:](v9->__defaultHeaderSpec, "setTextColor:", v17);
    -[PXWidgetBarSpec setPrimaryFont:](v9->__defaultHeaderSpec, "setPrimaryFont:", v18);
    -[PXWidgetBarSpec setSecondaryFont:](v9->__defaultHeaderSpec, "setSecondaryFont:", v19);
    -[PXWidgetBarSpec setShouldUseSingleLine:](v9->__defaultHeaderSpec, "setShouldUseSingleLine:", v10 == 2);
    v24 = v9->__defaultHeaderSpec;
    objc_msgSend(v7, "distanceBetweenHeaderTopAndHeaderBaseline");
    -[PXWidgetBarSpec setDistanceBetweenTopAndFirstBaseline:](v24, "setDistanceBetweenTopAndFirstBaseline:");
    v25 = v9->__defaultHeaderSpec;
    objc_msgSend(v7, "distanceBetweenHeaderBaselineAndHeaderBottom");
    -[PXWidgetBarSpec setDistanceBetweenLastBaselineAndBottom:](v25, "setDistanceBetweenLastBaselineAndBottom:");
    v26 = v9->__defaultHeaderSpec;
    objc_msgSend(v18, "lineHeight");
    -[PXWidgetBarSpec setDistanceBetweenTitleBaselineAndSubtitleBaseline:](v26, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");
    -[PXWidgetBarSpec setHorizontalSpacingBetweenTitleAndSubtitle:](v9->__defaultHeaderSpec, "setHorizontalSpacingBetweenTitleAndSubtitle:", 12.0);
    v27 = -[PXWidgetBarSpec copy](v9->__defaultHeaderSpec, "copy");
    headerSpecForFlushedContent = v9->__headerSpecForFlushedContent;
    v9->__headerSpecForFlushedContent = (PXWidgetBarSpec *)v27;

    PXFontWithTextStyle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom") == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 36.0);
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v30;
    }
    v16[2](v16);
    v31 = objc_claimAutoreleasedReturnValue();
    footerSpec = v9->_footerSpec;
    v9->_footerSpec = (PXWidgetBarSpec *)v31;

    -[PXWidgetBarSpec setPrimaryFont:](v9->_footerSpec, "setPrimaryFont:", v29);
    v33 = v9->_footerSpec;
    objc_msgSend(v7, "distanceBetweenFooterTopAndFooterBaseline");
    -[PXWidgetBarSpec setDistanceBetweenTopAndFirstBaseline:](v33, "setDistanceBetweenTopAndFirstBaseline:");
    v34 = v9->_footerSpec;
    objc_msgSend(v7, "distanceBetweenFooterBaselineAndFooterBottom");
    -[PXWidgetBarSpec setDistanceBetweenLastBaselineAndBottom:](v34, "setDistanceBetweenLastBaselineAndBottom:");
    v35 = objc_msgSend(v6, "userInterfaceIdiom");
    v36 = 1;
    if (v35 == 3)
      v36 = 2;
    v9->_disclosureLocation = v36;

  }
  return v9;
}

- (id)headerSpecForWidgetContentLayoutStyle:(int64_t)a3
{
  void *v3;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      -[PXWidgetCompositionSpec _headerSpecForFlushedContent](self, "_headerSpecForFlushedContent");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (a3)
    {
      v3 = 0;
      return v3;
    }
  }
  -[PXWidgetCompositionSpec _defaultHeaderSpec](self, "_defaultHeaderSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (PXWidgetSpec)widgetSpec
{
  return self->_widgetSpec;
}

- (int64_t)maximumNumberOfColumns
{
  return self->_maximumNumberOfColumns;
}

- (PXWidgetBarSpec)footerSpec
{
  return self->_footerSpec;
}

- (int64_t)disclosureLocation
{
  return self->_disclosureLocation;
}

- (PXWidgetBarSpec)_defaultHeaderSpec
{
  return self->__defaultHeaderSpec;
}

- (PXWidgetBarSpec)_headerSpecForFlushedContent
{
  return self->__headerSpecForFlushedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__headerSpecForFlushedContent, 0);
  objc_storeStrong((id *)&self->__defaultHeaderSpec, 0);
  objc_storeStrong((id *)&self->_footerSpec, 0);
  objc_storeStrong((id *)&self->_widgetSpec, 0);
}

PXWidgetBarSpec *__70__PXWidgetCompositionSpec_initWithExtendedTraitCollection_widgetSpec___block_invoke(double *a1)
{
  PXWidgetBarSpec *v2;

  v2 = objc_alloc_init(PXWidgetBarSpec);
  -[PXWidgetBarSpec setContentInsets:](v2, "setContentInsets:", a1[4], a1[5], a1[6], a1[7]);
  -[PXWidgetBarSpec setMinimumDistanceBetweenTopAndFirstAscender:](v2, "setMinimumDistanceBetweenTopAndFirstAscender:", 5.0);
  -[PXWidgetBarSpec setMinimumDistanceBetweenLastDescenderAndBottom:](v2, "setMinimumDistanceBetweenLastDescenderAndBottom:", 5.0);
  return v2;
}

@end
