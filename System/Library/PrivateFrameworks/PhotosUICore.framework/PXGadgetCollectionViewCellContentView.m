@implementation PXGadgetCollectionViewCellContentView

- (PXGadgetCollectionViewCellContentView)initWithFrame:(CGRect)a3
{
  PXGadgetCollectionViewCellContentView *v3;
  PXGadgetCollectionViewCellContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGadgetCollectionViewCellContentView;
  v3 = -[PXGadgetCollectionViewCellContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXGadgetCollectionViewCellContentView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 0);
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGadgetCollectionViewCellContentView;
  -[PXGadgetCollectionViewCellContentView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXGadgetCollectionViewCellContentView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXGadgetCollectionViewCellContentView bounds](self, "bounds");
    objc_msgSend(v4, "setFrame:");
  }

}

@end
