@implementation PXForYouSettingAdvisoryGadgetProvider

- (unint64_t)estimatedNumberOfGadgets
{
  return 1;
}

- (void)generateGadgets
{
  PXForYouSettingAdvisoryGadgetFeedConfiguration *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(PXForYouSettingAdvisoryGadgetFeedConfiguration);
  +[PXStoryUIFactory feedGadgetWithConfiguration:](PXStoryUIFactory, "feedGadgetWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PXForYouSettingAdvisoryGadgetProvider_generateGadgets__block_invoke;
  v6[3] = &unk_1E5145360;
  v7 = v4;
  v5 = v4;
  -[PXGadgetProvider performChanges:](self, "performChanges:", v6);

}

- (int64_t)forYouContentIdentifier
{
  return 10;
}

void __56__PXForYouSettingAdvisoryGadgetProvider_generateGadgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGadgets:", v4, v5, v6);

}

@end
