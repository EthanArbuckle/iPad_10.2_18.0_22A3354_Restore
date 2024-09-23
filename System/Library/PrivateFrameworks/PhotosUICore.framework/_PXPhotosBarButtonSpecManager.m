@implementation _PXPhotosBarButtonSpecManager

- (PXCuratedLibrarySectionHeaderLayoutSpec)spec
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosBarButtonSpecManager;
  -[PXFeatureSpecManager spec](&v4, sel_spec);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsFloating:", 1);
  return (PXCuratedLibrarySectionHeaderLayoutSpec *)v2;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end
