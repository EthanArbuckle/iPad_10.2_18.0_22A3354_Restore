@implementation BKSpreadThumbnailView

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKSpreadThumbnailView;
  -[BKSpreadThumbnailView layoutSubviews](&v4, "layoutSubviews");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_B0498;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (-[BKPageThumbnailView pageNumber](self->_leftPageView, "pageNumber", a3.width, a3.height) != 0x7FFFFFFFFFFFFFFFLL
    && -[BKPageThumbnailView pageNumber](self->_rightPageView, "pageNumber") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKSpreadThumbnailView pageSize](self, "pageSize");
    width = v7 + v7;
    goto LABEL_8;
  }
  if (-[BKPageThumbnailView pageNumber](self->_leftPageView, "pageNumber") != 0x7FFFFFFFFFFFFFFFLL
    || -[BKPageThumbnailView pageNumber](self->_rightPageView, "pageNumber") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BKSpreadThumbnailView pageSize](self, "pageSize");
    width = v6;
LABEL_8:
    -[BKSpreadThumbnailView pageSize](self, "pageSize");
    goto LABEL_9;
  }
  width = CGSizeZero.width;
  height = CGSizeZero.height;
LABEL_9:
  v8 = width;
  result.height = height;
  result.width = v8;
  return result;
}

- (BKPageThumbnailView)leftPageView
{
  BKPageThumbnailView *leftPageView;
  BKPageThumbnailView *v4;
  BKPageThumbnailView *v5;

  leftPageView = self->_leftPageView;
  if (!leftPageView)
  {
    v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_leftPageView;
    self->_leftPageView = v4;

    -[BKPageThumbnailView setShowsPageNumber:](self->_leftPageView, "setShowsPageNumber:", 0);
    -[BKSpreadThumbnailView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_leftPageView, 0);
    leftPageView = self->_leftPageView;
  }
  return leftPageView;
}

- (BKPageThumbnailView)rightPageView
{
  BKPageThumbnailView *rightPageView;
  BKPageThumbnailView *v4;
  BKPageThumbnailView *v5;

  rightPageView = self->_rightPageView;
  if (!rightPageView)
  {
    v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_rightPageView;
    self->_rightPageView = v4;

    -[BKPageThumbnailView setShowsPageNumber:](self->_rightPageView, "setShowsPageNumber:", 0);
    -[BKSpreadThumbnailView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_rightPageView, 0);
    rightPageView = self->_rightPageView;
  }
  return rightPageView;
}

- (id)gutter
{
  UIImageView *gutter;
  void *v4;
  UIImageView *v5;
  UIImageView *v6;

  gutter = self->_gutter;
  if (!gutter)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("pb-toc-spread-gradient")));
    v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v4);
    v6 = self->_gutter;
    self->_gutter = v5;

    -[UIImageView setContentMode:](self->_gutter, "setContentMode:", 0);
    -[BKSpreadThumbnailView addSubview:](self, "addSubview:", self->_gutter);

    gutter = self->_gutter;
  }
  return gutter;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gutter, 0);
  objc_storeStrong((id *)&self->_rightPageView, 0);
  objc_storeStrong((id *)&self->_leftPageView, 0);
}

@end
