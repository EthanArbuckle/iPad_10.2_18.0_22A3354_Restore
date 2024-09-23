@implementation BKPageThumbnailView

- (BKPageThumbnailView)initWithFrame:(CGRect)a3
{
  BKPageThumbnailView *v3;
  BKPageThumbnailView *v4;
  id v5;
  double y;
  double width;
  double height;
  UIImageView *v9;
  UIImageView *imageView;
  UILabel *v11;
  UILabel *pageLabel;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKPageThumbnailView;
  v3 = -[BKPageThumbnailView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
    v5 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v4->_imageView;
    v4->_imageView = v9;

    -[UIImageView setOpaque:](v4->_imageView, "setOpaque:", 1);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 0);
    -[UIImageView setClearsContextBeforeDrawing:](v4->_imageView, "setClearsContextBeforeDrawing:", 0);
    -[BKPageThumbnailView addSubview:](v4, "addSubview:", v4->_imageView);
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    pageLabel = v4->_pageLabel;
    v4->_pageLabel = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 24.0));
    -[UILabel setFont:](v4->_pageLabel, "setFont:", v13);

    -[UILabel setTextAlignment:](v4->_pageLabel, "setTextAlignment:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
    -[UILabel setTextColor:](v4->_pageLabel, "setTextColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_pageLabel, "setBackgroundColor:", v15);

    -[BKPageThumbnailView addSubview:](v4, "addSubview:", v4->_pageLabel);
  }
  return v4;
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKPageThumbnailView;
  -[BKPageThumbnailView layoutSubviews](&v4, "layoutSubviews");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_AFB48;
  v3[3] = &unk_1BEA38;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageThumbnailView image](self, "image"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageThumbnailView image](self, "image"));
    objc_msgSend(v7, "size");
    width = CGSizeScaledToFitInSize(v8, v9, width, height);
    height = v10;

  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setShowsPageNumber:(BOOL)a3
{
  if (self->_showsPageNumber != a3)
  {
    self->_showsPageNumber = a3;
    -[BKPageThumbnailView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageNumber:(int64_t)a3
{
  NSString *pageTitle;

  if (self->_pageNumber != a3)
  {
    pageTitle = self->_pageTitle;
    self->_pageTitle = 0;

    self->_pageNumber = a3;
    -[BKPageThumbnailView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_pageTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pageTitle, a3);
    -[BKPageThumbnailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageThumbnailView imageView](self, "imageView"));
  objc_msgSend(v5, "setImage:", v4);

  -[BKPageThumbnailView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (BOOL)showsPageNumber
{
  return self->_showsPageNumber;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pageLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
}

@end
