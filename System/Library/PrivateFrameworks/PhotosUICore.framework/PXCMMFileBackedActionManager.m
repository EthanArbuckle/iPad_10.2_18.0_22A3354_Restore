@implementation PXCMMFileBackedActionManager

- (PXCMMFileBackedActionManager)init
{
  PXCMMFileBackedActionManager *v2;
  PXCMMFileBackedActionManager *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCMMFileBackedActionManager;
  v2 = -[PXCMMActionManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PXCMMActionManager performerClassByType](v2, "performerClassByType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("PXCMMActionTypeSaveToLibrary"));

  }
  return v3;
}

@end
