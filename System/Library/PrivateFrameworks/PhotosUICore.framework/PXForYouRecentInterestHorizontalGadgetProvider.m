@implementation PXForYouRecentInterestHorizontalGadgetProvider

- (PXForYouRecentInterestHorizontalGadgetProvider)initWithContentGadgetProvider:(id)a3 title:(id)a4
{
  PXForYouRecentInterestHorizontalGadgetProvider *v4;
  PXForYouRecentInterestHorizontalGadgetProvider *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PXForYouRecentInterestHorizontalGadgetProvider;
  v4 = -[PXHorizontalCollectionGadgetProvider initWithContentGadgetProvider:title:](&v9, sel_initWithContentGadgetProvider_title_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PXHorizontalCollectionGadgetProvider setGadgetType:](v4, "setGadgetType:", 10);
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithVerticalSizeClass:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v11[0] = &unk_1E53EC168;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXHorizontalCollectionGadgetProvider setColumnSpanForTraitCollection:](v5, "setColumnSpanForTraitCollection:", v7);

    -[PXHorizontalCollectionGadgetProvider setDefaultColumnSpan:](v5, "setDefaultColumnSpan:", 1);
  }
  return v5;
}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 3;
}

@end
