@implementation _PXForYouSampleHorizontalCollectionGadgetProvider

- (_PXForYouSampleHorizontalCollectionGadgetProvider)init
{
  PXForYouSampleGadgetProvider *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _PXForYouSampleHorizontalCollectionGadgetProvider *v8;
  _PXForYouSampleHorizontalCollectionGadgetProvider *v9;
  objc_super v11;

  v3 = -[PXForYouSampleGadgetProvider initWithSampleGadgetType:minimumHeight:]([PXForYouSampleGadgetProvider alloc], "initWithSampleGadgetType:minimumHeight:", 5, 200.0);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v11.receiver = self;
  v11.super_class = (Class)_PXForYouSampleHorizontalCollectionGadgetProvider;
  v8 = -[PXHorizontalCollectionGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:](&v11, sel_initWithIdentifier_contentGadgetProvider_title_horizontalCollectionGadgetClass_, v6, v3, CFSTR("Horizontal Scroll Gadget"), v7);
  v9 = v8;
  if (v8)
    -[PXHorizontalCollectionGadgetProvider setGadgetType:](v8, "setGadgetType:", 7);

  return v9;
}

- (NSDate)mostRecentContentDate
{
  return 0;
}

- (int64_t)forYouContentIdentifier
{
  return 13;
}

@end
