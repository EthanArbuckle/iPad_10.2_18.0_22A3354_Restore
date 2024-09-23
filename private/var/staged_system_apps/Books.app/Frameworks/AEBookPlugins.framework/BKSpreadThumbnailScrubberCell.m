@implementation BKSpreadThumbnailScrubberCell

- (BKSpreadThumbnailScrubberCell)initWithFrame:(CGRect)a3
{
  BKSpreadThumbnailScrubberCell *v3;
  id v4;
  double y;
  double width;
  double height;
  UIImageView *v8;
  UIImageView *rightImageView;
  UIImageView *v10;
  double v11;
  id v12;
  void *v13;
  UIImageView *v14;
  UIImageView *leftImageView;
  UIImageView *v16;
  double v17;
  id v18;
  void *v19;
  UIImageView *imageView;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BKSpreadThumbnailScrubberCell;
  v3 = -[BKThumbnailScrubberCell initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    rightImageView = v3->_rightImageView;
    v3->_rightImageView = v8;

    v10 = v3->_rightImageView;
    *(_QWORD *)&v11 = objc_opt_class(v3).n128_u64[0];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "emptyBackgroundColor", v11));
    -[UIImageView setBackgroundColor:](v10, "setBackgroundColor:", v13);

    -[BKSpreadThumbnailScrubberCell addSubview:](v3, "addSubview:", v3->_rightImageView);
    v14 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = v14;

    v16 = v3->_leftImageView;
    *(_QWORD *)&v17 = objc_opt_class(v3).n128_u64[0];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emptyBackgroundColor", v17));
    -[UIImageView setBackgroundColor:](v16, "setBackgroundColor:", v19);

    -[BKSpreadThumbnailScrubberCell addSubview:](v3, "addSubview:", v3->_leftImageView);
    -[UIImageView removeFromSuperview](v3->super._imageView, "removeFromSuperview");
    imageView = v3->super._imageView;
    v3->super._imageView = 0;

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImageView *leftImageView;
  double v13;
  id v14;
  void *v15;
  UIImageView *rightImageView;
  double v17;
  id v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BKSpreadThumbnailScrubberCell;
  -[BKThumbnailScrubberCell layoutSubviews](&v20, "layoutSubviews");
  -[BKSpreadThumbnailScrubberCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 * 0.5;
  if (!-[BKSpreadThumbnailScrubberCell shouldHaveLeftImage](self, "shouldHaveLeftImage")
    || !-[BKSpreadThumbnailScrubberCell shouldHaveRightImage](self, "shouldHaveRightImage"))
  {
    if (-[BKSpreadThumbnailScrubberCell shouldHaveLeftImage](self, "shouldHaveLeftImage"))
    {
      -[UIImageView setFrame:](self->_leftImageView, "setFrame:", v4, v6, v11, v10);
      -[UIImageView setBackgroundColor:](self->_rightImageView, "setBackgroundColor:", 0);
    }
    else
    {
      if (!-[BKSpreadThumbnailScrubberCell shouldHaveRightImage](self, "shouldHaveRightImage"))
        goto LABEL_9;
      -[UIImageView setFrame:](self->_rightImageView, "setFrame:", v11, v6, v11, v10);
      -[UIImageView setBackgroundColor:](self->_leftImageView, "setBackgroundColor:", 0);
      v4 = v11;
    }
    v8 = v11;
    goto LABEL_9;
  }
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", v4, v6, v11, v10);
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", v11, v6, v11, v10);
  leftImageView = self->_leftImageView;
  *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "emptyBackgroundColor", v13));
  -[UIImageView setBackgroundColor:](leftImageView, "setBackgroundColor:", v15);

  rightImageView = self->_rightImageView;
  *(_QWORD *)&v17 = objc_opt_class(self).n128_u64[0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emptyBackgroundColor", v17));
  -[UIImageView setBackgroundColor:](rightImageView, "setBackgroundColor:", v19);

LABEL_9:
  -[CALayer setFrame:](self->super._borderLayer, "setFrame:", v4, v6, v8, v10);
}

- (UIImage)leftImage
{
  return -[UIImageView image](self->_leftImageView, "image");
}

- (UIImage)rightImage
{
  return -[UIImageView image](self->_rightImageView, "image");
}

- (void)setLeftImage:(id)a3
{
  -[UIImageView setImage:](self->_leftImageView, "setImage:", a3);
}

- (void)setRightImage:(id)a3
{
  -[UIImageView setImage:](self->_rightImageView, "setImage:", a3);
}

- (void)setShouldHaveLeftImage:(BOOL)a3
{
  if (self->_shouldHaveLeftImage != a3)
  {
    self->_shouldHaveLeftImage = a3;
    -[BKSpreadThumbnailScrubberCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldHaveRightImage:(BOOL)a3
{
  if (self->_shouldHaveRightImage != a3)
  {
    self->_shouldHaveRightImage = a3;
    -[BKSpreadThumbnailScrubberCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)shouldHaveLeftImage
{
  return self->_shouldHaveLeftImage;
}

- (BOOL)shouldHaveRightImage
{
  return self->_shouldHaveRightImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_rightImage, 0);
  objc_storeStrong((id *)&self->_leftImage, 0);
}

@end
