@implementation PPKLayoutCompleteCollectionView

- (void)layoutSubviews
{
  void (**v3)(void);
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPKLayoutCompleteCollectionView;
  -[PPKLayoutCompleteCollectionView layoutSubviews](&v4, sel_layoutSubviews);
  if (!-[PPKLayoutCompleteCollectionView laidOut](self, "laidOut"))
  {
    -[PPKLayoutCompleteCollectionView setLaidOut:](self, "setLaidOut:", 1);
    -[PPKLayoutCompleteCollectionView layoutCompletion](self, "layoutCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (PPKLayoutCompleteCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4 layoutCompletion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PPKLayoutCompleteCollectionView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PPKLayoutCompleteCollectionView;
  v10 = a5;
  v11 = -[PPKLayoutCompleteCollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
  -[PPKLayoutCompleteCollectionView setLayoutCompletion:](v11, "setLayoutCompletion:", v10, v13.receiver, v13.super_class);

  return v11;
}

- (BOOL)laidOut
{
  return self->_laidOut;
}

- (void)setLaidOut:(BOOL)a3
{
  self->_laidOut = a3;
}

- (id)layoutCompletion
{
  return self->_layoutCompletion;
}

- (void)setLayoutCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutCompletion, 0);
}

@end
