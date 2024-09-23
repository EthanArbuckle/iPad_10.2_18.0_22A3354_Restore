@implementation BKLibraryBookshelfCoverView

+ (Class)layerClass
{
  return (Class)objc_opt_class(BKLibraryBookshelfCoverLayer);
}

- (BKLibraryBookshelfCoverView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCoverView;
  return -[BKLibraryBookshelfCoverView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_ancestorCell
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCoverView superview](self, "superview"));
  if (v2)
  {
    do
    {
      v3 = objc_opt_class(BKLibraryBookshelfCollectionViewCell);
      if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));

      v2 = (void *)v4;
    }
    while (v4);
  }
  return v2;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end
