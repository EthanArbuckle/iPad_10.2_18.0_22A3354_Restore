@implementation BKSpreadThumbnailDirectoryCell

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKSpreadThumbnailDirectoryCell;
  -[BKThumbnailDirectoryCell layoutSubviews](&v12, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailDirectoryCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BKSpreadThumbnailDirectoryCell contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  -[BKSpreadThumbnailView setFrame:](self->_spreadView, "setFrame:");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSpreadThumbnailDirectoryCell;
  -[BKThumbnailDirectoryCell prepareForReuse](&v7, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](self->_spreadView, "leftPageView"));
  objc_msgSend(v3, "setImage:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](self->_spreadView, "leftPageView"));
  objc_msgSend(v4, "setPageNumber:", 0x7FFFFFFFFFFFFFFFLL);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](self->_spreadView, "rightPageView"));
  objc_msgSend(v5, "setImage:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](self->_spreadView, "rightPageView"));
  objc_msgSend(v6, "setPageNumber:", 0x7FFFFFFFFFFFFFFFLL);

}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double v4;
  double x;
  double v6;
  CGFloat y;
  double v8;
  double width;
  double v10;
  CGFloat height;
  void *v12;
  id v13;
  void *v14;
  id v15;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[BKSpreadThumbnailDirectoryCell bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](self->_spreadView, "leftPageView"));
  v13 = objc_msgSend(v12, "pageNumber");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](self->_spreadView, "rightPageView"));
  v15 = objc_msgSend(v14, "pageNumber");

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL && v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    width = CGRectGetWidth(v21) * 0.5;
    x = x + width;
  }
  else if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    width = CGRectGetWidth(v22) * 0.5;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BKSpreadThumbnailView)spreadView
{
  BKSpreadThumbnailView *spreadView;
  BKSpreadThumbnailView *v4;
  BKSpreadThumbnailView *v5;

  spreadView = self->_spreadView;
  if (!spreadView)
  {
    v4 = -[BKSpreadThumbnailView initWithFrame:]([BKSpreadThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_spreadView;
    self->_spreadView = v4;

    -[BKSpreadThumbnailDirectoryCell addSubview:](self, "addSubview:", self->_spreadView);
    spreadView = self->_spreadView;
  }
  return spreadView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spreadView, 0);
}

@end
