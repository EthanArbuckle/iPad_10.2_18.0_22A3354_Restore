@implementation PBUIImageSlotView

- (void)setImageSlot:(id)a3
{
  PBUIImageSlot *v5;
  PBUIImageSlot **p_imageSlot;
  PBUIImageSlot *imageSlot;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *imageView;
  PBUIImageSlot *v13;

  v5 = (PBUIImageSlot *)a3;
  p_imageSlot = &self->_imageSlot;
  imageSlot = self->_imageSlot;
  if (imageSlot != v5)
  {
    v13 = v5;
    -[PBUIImageSlot _deferredImageSlot](imageSlot, "_deferredImageSlot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeImageSlotObserver:", self);

    objc_storeStrong((id *)&self->_imageSlot, a3);
    -[PBUIImageSlot _deferredImageSlot](*p_imageSlot, "_deferredImageSlot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addImageSlotObserver:", self);
    objc_msgSend(v9, "fallbackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIImageSlotView setBackgroundColor:](self, "setBackgroundColor:", v10);

    -[PBUIImageSlot image](*p_imageSlot, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PBUIImageSlot image](*p_imageSlot, "image");
      imageView = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIImageSlotView _updateWithImage:](self, "_updateWithImage:", imageView);
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
      imageView = self->_imageView;
      self->_imageView = 0;
    }

    -[PBUIImageSlotView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBUIImageSlotView setNeedsLayout](self, "setNeedsLayout");

    v5 = v13;
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIImageSlotView;
  -[PBUIImageSlotView layoutSubviews](&v5, sel_layoutSubviews);
  -[PBUIImageSlot image](self->_imageSlot, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView image](self->_imageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v3)
    -[PBUIImageSlotView _updateWithImage:](self, "_updateWithImage:", v3);

}

- (void)deferredImageSlot:(id)a3 didUpdateImage:(id)a4
{
  if (self->_imageSlot == a3)
    -[PBUIImageSlotView _updateWithImage:](self, "_updateWithImage:", a4);
}

- (void)_updateWithImage:(id)a3
{
  UIImageView *imageView;
  id v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;

  imageView = self->_imageView;
  if (!imageView)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[PBUIImageSlotView bounds](self, "bounds");
    v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
    v7 = self->_imageView;
    self->_imageView = v6;

    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
    -[PBUIImageSlotView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  -[PBUIImageSlot image](self->_imageSlot, "image", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v8);

  -[PBUIImageSlotView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PBUIImageSlotView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_pointSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PBUIImageSlot image](self->_imageSlot, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PBUIImageSlot)imageSlot
{
  return self->_imageSlot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSlot, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
