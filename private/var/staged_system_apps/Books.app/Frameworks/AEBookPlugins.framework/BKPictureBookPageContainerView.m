@implementation BKPictureBookPageContainerView

- (BKPictureBookPageContainerView)init
{
  BKPictureBookPageContainerView *v2;
  BKPictureBookPageContainerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookPageContainerView;
  v2 = -[BKPictureBookPageContainerView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKPictureBookPageContainerView setUseRoundedCornerRadius:](v2, "setUseRoundedCornerRadius:", 1);
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKPictureBookPageContainerView;
  -[BKPictureBookPageContainerView layoutSubviews](&v10, "layoutSubviews");
  if (-[BKPictureBookPageContainerView useRoundedCornerRadius](self, "useRoundedCornerRadius"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPageContainerView layer](self, "layer"));
    objc_msgSend(v3, "setCornerRadius:", 6.0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPageContainerView layer](self, "layer"));
    objc_msgSend(v4, "setMasksToBounds:", 1);

    if (-[BKPictureBookPageContainerView isLeftPage](self, "isLeftPage"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPageContainerView layer](self, "layer"));
      v6 = v5;
      v7 = 5;
    }
    else
    {
      v8 = -[BKPictureBookPageContainerView isRightPage](self, "isRightPage");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookPageContainerView layer](self, "layer"));
      v6 = v5;
      if (v8)
        v7 = 10;
      else
        v7 = 15;
    }
    objc_msgSend(v5, "setMaskedCorners:", v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[BKPictureBookPageContainerView setBackgroundColor:](self, "setBackgroundColor:", v9);

}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (BKPageScrollerPageView)pageScrollerPageView
{
  return (BKPageScrollerPageView *)objc_loadWeakRetained((id *)&self->_pageScrollerPageView);
}

- (void)setPageScrollerPageView:(id)a3
{
  objc_storeWeak((id *)&self->_pageScrollerPageView, a3);
}

- (BOOL)isLeftPage
{
  return self->_isLeftPage;
}

- (void)setIsLeftPage:(BOOL)a3
{
  self->_isLeftPage = a3;
}

- (BOOL)isRightPage
{
  return self->_isRightPage;
}

- (void)setIsRightPage:(BOOL)a3
{
  self->_isRightPage = a3;
}

- (BOOL)useRoundedCornerRadius
{
  return self->_useRoundedCornerRadius;
}

- (void)setUseRoundedCornerRadius:(BOOL)a3
{
  self->_useRoundedCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageScrollerPageView);
}

@end
