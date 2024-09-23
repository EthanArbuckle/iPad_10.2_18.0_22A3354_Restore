@implementation PXForYouSettingAdvisoryGadgetFeedConfiguration

- (PXForYouSettingAdvisoryGadgetFeedConfiguration)init
{
  _PXEmptySectionedDataSourceManager *v3;
  PXFeedDummyItemLayoutFactory *v4;
  _PXEmptySectionedDataSourceManager *v5;
  PXForYouSettingAdvisoryGadgetFeedConfiguration *v6;
  PXForYouSettingAdvisoryFeedPlaceholderFactory *v7;
  objc_super v9;
  _QWORD v10[4];
  _PXEmptySectionedDataSourceManager *v11;

  v3 = objc_alloc_init(_PXEmptySectionedDataSourceManager);
  v4 = objc_alloc_init(PXFeedDummyItemLayoutFactory);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PXForYouSettingAdvisoryGadgetFeedConfiguration_init__block_invoke;
  v10[3] = &unk_1E51382E8;
  v5 = v3;
  v11 = v5;
  v9.receiver = self;
  v9.super_class = (Class)PXForYouSettingAdvisoryGadgetFeedConfiguration;
  v6 = -[PXFeedConfiguration initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:](&v9, sel_initWithDataSourceManagerPromise_specManagerPromise_itemLayoutFactory_, v10, &__block_literal_global_151924, v4);
  if (v6)
  {
    v7 = objc_alloc_init(PXForYouSettingAdvisoryFeedPlaceholderFactory);
    -[PXFeedConfiguration setPlaceholderFactory:](v6, "setPlaceholderFactory:", v7);

  }
  return v6;
}

- (unint64_t)gadgetType
{
  return 22;
}

- (id)gadgetLocalizedTitle
{
  return PXLocalizedStringFromTable(CFSTR("SHOW_FEATURED_CONTENT_SETTING_ADVISORY_SECTION_HEADER"), CFSTR("PhotosUICore"));
}

- (BOOL)wantsMultilineGadgetTitle
{
  return 0;
}

- (unint64_t)gadgetAccessoryButtonType
{
  return 0;
}

- (BOOL)wantsEmbeddedScrollView
{
  return 1;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return 0;
}

- (id)gadgetAccessoryButtonLocalizedTitle
{
  return &stru_1E5149688;
}

- (int64_t)horizontalGadgetStyle
{
  return 0;
}

id __54__PXForYouSettingAdvisoryGadgetFeedConfiguration_init__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __54__PXForYouSettingAdvisoryGadgetFeedConfiguration_init__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "horizontalGadgetViewSpecManagerWithExtendedTraitCollection:");
}

@end
