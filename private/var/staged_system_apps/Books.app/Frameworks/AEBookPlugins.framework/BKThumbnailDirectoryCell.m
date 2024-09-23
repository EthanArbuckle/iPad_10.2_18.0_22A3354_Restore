@implementation BKThumbnailDirectoryCell

- (BKThumbnailDirectoryCell)initWithFrame:(CGRect)a3
{
  BKThumbnailDirectoryCell *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BKThumbnailDirectoryCell;
  v3 = -[BKThumbnailDirectoryCell initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "scale");
    v6 = 1.0 / v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](v3, "layer"));
    objc_msgSend(v7, "setBorderWidth:", v6);

    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor")));
    v9 = objc_msgSend(v8, "CGColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](v3, "layer"));
    objc_msgSend(v10, "setBorderColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](v3, "layer"));
    objc_msgSend(v11, "setMasksToBounds:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](v3, "layer"));
    objc_msgSend(v12, "setCornerRadius:", 6.0);

    -[BKThumbnailDirectoryCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v14 = -[BKThumbnailDirectoryCell registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v13, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v3;
}

- (void)prepareForReuse
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKThumbnailDirectoryCell;
  -[BKThumbnailDirectoryCell prepareForReuse](&v6, "prepareForReuse");
  -[BKThumbnailDirectoryCell setShowSelectionView:](self, "setShowSelectionView:", 1);
  -[BKThumbnailDirectoryCell setHasRibbon:](self, "setHasRibbon:", 0);
  -[BKPageThumbnailView setImage:](self->_pageView, "setImage:", 0);
  -[BKPageThumbnailView setPageNumber:](self->_pageView, "setPageNumber:", 0x7FFFFFFFFFFFFFFFLL);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor")));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](self, "layer"));
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BKPageThumbnailView *pageView;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  pageView = self->_pageView;
  if (pageView)
  {
    v8 = CGRectZero.origin.y;
    v9 = -[BKPageThumbnailView sizeThatFits:](pageView, "sizeThatFits:", a3.size.width, a3.size.height);
    x = CGRectFitRectInRect(v9, CGRectZero.origin.x, v8, v10, v11, x, y, width, height);
    y = v12;
    width = v13;
    height = v14;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setHasRibbon:(BOOL)a3
{
  if (self->_hasRibbon != a3)
  {
    self->_hasRibbon = a3;
    -[UIImageView setHidden:](self->_ribbonView, "setHidden:", !a3);
    -[BKThumbnailDirectoryCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BKPageThumbnailView)pageView
{
  BKPageThumbnailView *pageView;
  BKPageThumbnailView *v4;
  BKPageThumbnailView *v5;

  pageView = self->_pageView;
  if (!pageView)
  {
    v4 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_pageView;
    self->_pageView = v4;

    -[BKThumbnailDirectoryCell addSubview:](self, "addSubview:", self->_pageView);
    pageView = self->_pageView;
  }
  return pageView;
}

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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIImageView *ribbonView;
  void *v21;
  UIImageView *v22;
  UIImageView *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  id v33;
  id v34;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)BKThumbnailDirectoryCell;
  -[BKThumbnailDirectoryCell layoutSubviews](&v36, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[BKThumbnailDirectoryCell contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[BKThumbnailDirectoryCell hasRibbon](self, "hasRibbon"))
  {
    ribbonView = self->_ribbonView;
    if (!ribbonView)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ib_tb_icon_bookmark")));
      v22 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v21);
      v23 = self->_ribbonView;
      self->_ribbonView = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell contentView](self, "contentView"));
      objc_msgSend(v24, "addSubview:", self->_ribbonView);

      ribbonView = self->_ribbonView;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](ribbonView, "image"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_ribbonView, "image"));
      objc_msgSend(v26, "size");
      v28 = v27;
      v30 = v29;

      if (isRetina())
        v31 = -1.5;
      else
        v31 = -2.0;
      v37.origin.x = v13;
      v37.origin.y = v15;
      v37.size.width = v17;
      v37.size.height = v19;
      v32 = CGRectGetMaxX(v37) - v28 + -8.0;
      v38.origin.x = v13;
      v38.origin.y = v15;
      v38.size.width = v17;
      v38.size.height = v19;
      -[UIImageView setFrame:](self->_ribbonView, "setFrame:", v32, v31 + CGRectGetMinY(v38), v28, v30);
    }
  }
  -[BKPageThumbnailView setFrame:](self->_pageView, "setFrame:", v13, v15, v17, v19);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v13, v15, v17, v19)));
  v34 = objc_msgSend(v33, "CGPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](self, "layer"));
  objc_msgSend(v35, "setShadowPath:", v34);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor", a3, a4)));
  v5 = objc_msgSend(v7, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailDirectoryCell layer](self, "layer"));
  objc_msgSend(v6, "setBorderColor:", v5);

}

- (BOOL)hasRibbon
{
  return self->_hasRibbon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_ribbonView, 0);
}

@end
