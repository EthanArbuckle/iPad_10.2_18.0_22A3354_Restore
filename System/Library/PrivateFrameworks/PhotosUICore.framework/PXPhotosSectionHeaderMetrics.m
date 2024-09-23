@implementation PXPhotosSectionHeaderMetrics

- (PXPhotosSectionHeaderMetrics)init
{
  PXPhotosSectionHeaderMetrics *v2;
  PXPhotosSectionHeaderMetrics *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosSectionHeaderMetrics;
  v2 = -[PXPhotosSectionHeaderMetrics init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXPhotosSectionHeaderMetrics _invalidateCache](v2, "_invalidateCache");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)_invalidateCache
{
  *(_OWORD *)&self->_cachedHeights[2] = 0u;
  *(_OWORD *)self->_cachedHeights = 0u;
}

- (double)sectionHeaderHeightForStyle:(int64_t)a3 hasTitle:(BOOL)a4 hasDates:(BOOL)a5 hasLocation:(BOOL)a6
{
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  double *cachedHeights;
  double v11;
  void *v12;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v7 = a4 && a5 || a6;
  v8 = 2;
  if (v7)
    v8 = 3;
  if (a3 == 1)
    v9 = v8;
  else
    v9 = (a4 && a5) | a6;
  cachedHeights = self->_cachedHeights;
  v11 = self->_cachedHeights[v9];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");

  if (v11 == 0.0)
  {
    _PXPhotoCollectionHeaderTitleLabelFontForStyle(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    if (v7)
    {
      _PXPhotoCollectionHeaderSubtitleFontForStyle(a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_scaledValueForValue:", 20.0);
      PXFloatRoundToPixel();
      v15 = v17;

    }
    v18 = 26.0;
    if (a3 == 1)
      v18 = 30.0;
    objc_msgSend(v14, "_scaledValueForValue:", v18);
    PXFloatRoundToPixel();
    v20 = v19;
    objc_msgSend(v14, "_scaledValueForValue:", 14.0);
    PXFloatRoundToPixel();
    v11 = v15 + v20 + v21;
    cachedHeights[v9] = v11;

  }
  return v11;
}

- (double)accessibilitySectionHeaderHeightForStyle:(int64_t)a3 width:(double)a4 actionButton:(BOOL)a5 disclosure:(BOOL)a6 title:(id)a7 startDate:(id)a8 endDate:(id)a9 locations:(id)a10 actionButtonSpec:(id)a11
{
  _BOOL4 v13;
  _BOOL4 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  double v50;

  v13 = a6;
  v14 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__onceToken != -1)
    dispatch_once(&accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__onceToken, &__block_literal_global_362);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "scale");

  objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setNumberOfLines:", 2);
  _PXConfigurePhotoCollectionHeaderTitleLabel((void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, a3);
  objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = 26.0;
  if (a3 == 1)
    v25 = 30.0;
  objc_msgSend(v23, "_scaledValueForValue:", v25);
  PXFloatRoundToPixel();
  v27 = v26;
  objc_msgSend(v24, "_scaledValueForValue:", 8.0);
  PXFloatRoundToPixel();
  v29 = v28;
  if (v13)
  {
    _PXPhotoCollectionHeaderDisclosureIconForStyle(a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    a4 = a4 - (v31 + 16.0);

  }
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setText:", v17);
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "sizeThatFits:", a4, 1.79769313e308);
    v33 = v32;
    objc_msgSend(v24, "ascender");
    v35 = v33 + v27 - v34 + 0.0;
    if (!v14)
      goto LABEL_10;
    goto LABEL_9;
  }
  v35 = 0.0;
  if (v14)
  {
LABEL_9:
    PXLocalizedStringFromTable(CFSTR("LIKE_PHOTO_BUTTON_TITLE"), CFSTR("PhotosUICore"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v36, v21);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", v37);
    v35 = v35 + v38;

  }
LABEL_10:
  if (v18)
  {
    v39 = objc_msgSend(v17, "length");
    v40 = v39;
    v41 = 2;
    if (a3 == 1)
      v41 = 4;
    if (v39)
      v42 = 0;
    else
      v42 = v41;
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter, "setPreset:", v42);
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter, "stringFromDate:toDate:", v18, v19);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setText:", v43);
    if (v40)
    {
      _PXConfigurePhotoCollectionHeaderDateLabel((void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, a3);
    }
    else
    {
      _PXConfigurePhotoCollectionHeaderTitleLabel((void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, a3);
      objc_msgSend(v24, "ascender");
      v35 = v35 + v27 - v44;
    }
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "sizeThatFits:", a4, 1.79769313e308);
    v35 = v35 + v45;

  }
  if (objc_msgSend(v20, "count"))
  {
    _PXConfigurePhotoCollectionHeaderLocationsLabel((void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, a3);
    objc_msgSend(v20, "px_localizedComposedStringThatFitsWidth:withMeasuringBlock:", &__block_literal_global_365, a4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setNumberOfLines:", 2);
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setText:", v46);
    objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "sizeThatFits:", a4, 1.79769313e308);
    v35 = v35 + v47;

  }
  objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "font");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "descender");
  v50 = v29 + v35 + v49;

  return v50;
}

uint64_t __154__PXPhotosSectionHeaderMetrics_accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "setText:", a2);
  return objc_msgSend((id)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

void __154__PXPhotosSectionHeaderMetrics_accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v1 = (void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel;
  accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__measuringLabel = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0D716B0]);
  v3 = (void *)accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter;
  accessibilitySectionHeaderHeightForStyle_width_actionButton_disclosure_title_startDate_endDate_locations_actionButtonSpec__dateRangeFormatter = (uint64_t)v2;

}

+ (PXPhotosSectionHeaderMetrics)sharedMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PXPhotosSectionHeaderMetrics_sharedMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetrics_onceToken != -1)
    dispatch_once(&sharedMetrics_onceToken, block);
  return (PXPhotosSectionHeaderMetrics *)(id)sharedMetrics_sharedMetrics;
}

void __45__PXPhotosSectionHeaderMetrics_sharedMetrics__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMetrics_sharedMetrics;
  sharedMetrics_sharedMetrics = (uint64_t)v1;

}

@end
