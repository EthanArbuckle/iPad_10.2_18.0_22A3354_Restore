@implementation SKUISlideshowGalleryBarView

- (SKUISlideshowGalleryBarView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUISlideshowGalleryBarView *v8;
  SKUISlideshowGalleryBarView *v9;
  id v10;
  uint64_t v11;
  UIToolbar *toolbarView;
  UIView *v13;
  UIView *imageViewsContainer;
  NSMutableArray *v15;
  NSMutableArray *imageViews;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowGalleryBarView initWithFrame:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUISlideshowGalleryBarView;
  v8 = -[SKUISlideshowGalleryBarView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_numberOfImages = 0;
    v8->_selectedImageIndex = 0;
    v10 = objc_alloc(MEMORY[0x1E0DC3E68]);
    -[SKUISlideshowGalleryBarView bounds](v9, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:");
    toolbarView = v9->_toolbarView;
    v9->_toolbarView = (UIToolbar *)v11;

    -[UIToolbar setBarStyle:](v9->_toolbarView, "setBarStyle:", 2);
    -[SKUISlideshowGalleryBarView addSubview:](v9, "addSubview:", v9->_toolbarView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    imageViewsContainer = v9->_imageViewsContainer;
    v9->_imageViewsContainer = v13;

    -[UIToolbar addSubview:](v9->_toolbarView, "addSubview:", v9->_imageViewsContainer);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    imageViews = v9->_imageViews;
    v9->_imageViews = v15;

  }
  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  UIView *imageViewsContainer;
  void *v9;
  NSMutableArray *imageViews;
  _QWORD v11[7];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKUISlideshowGalleryBarView;
  -[SKUISlideshowGalleryBarView layoutSubviews](&v12, sel_layoutSubviews);
  -[SKUISlideshowGalleryBarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIToolbar setFrame:](self->_toolbarView, "setFrame:");
  v7 = -[NSMutableArray count](self->_imageViews, "count");
  -[UIView setFrame:](self->_imageViewsContainer, "setFrame:", v4 * 0.5 - (v6 / 3.0 * 1.33333337 + 1.0) * (double)v7 * 0.5, 0.0, (v6 / 3.0 * 1.33333337 + 1.0) * (double)v7, v6);
  imageViewsContainer = self->_imageViewsContainer;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](imageViewsContainer, "setBackgroundColor:", v9);

  v11[1] = 3221225472;
  imageViews = self->_imageViews;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __45__SKUISlideshowGalleryBarView_layoutSubviews__block_invoke;
  v11[3] = &__block_descriptor_56_e28_v32__0__UIImageView_8Q16_B24l;
  *(double *)&v11[4] = v6 / 3.0 * 1.33333337;
  *(double *)&v11[5] = v6 / 3.0;
  *(double *)&v11[6] = v6 * 0.5 - v6 / 3.0 * 0.5;
  -[NSMutableArray enumerateObjectsUsingBlock:](imageViews, "enumerateObjectsUsingBlock:", v11);
}

void __45__SKUISlideshowGalleryBarView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  CGAffineTransform v11[2];

  v5 = a2;
  v6 = v5;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  memset(&v11[1], 0, sizeof(CGAffineTransform));
  if (v5)
    objc_msgSend(v5, "transform");
  v11[0] = v11[1];
  if (CGAffineTransformIsIdentity(v11))
  {
    objc_msgSend(v6, "setFrame:", (v7 + 1.0) * (double)a3, v9, v7, v8);
  }
  else
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v11[0].a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v11[0].c = v10;
    *(_OWORD *)&v11[0].tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v6, "setTransform:", v11);
    objc_msgSend(v6, "setFrame:", (v7 + 1.0) * (double)a3, v9, v7, v8);
    v11[0] = v11[1];
    objc_msgSend(v6, "setTransform:", v11);
  }

}

- (void)setNumberOfImages:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;

  v5 = -[NSMutableArray count](self->_imageViews, "count");
  v6 = a3 - v5;
  if (a3 <= v5)
  {
    if (a3 < v5)
    {
      v9 = v5;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");
        -[NSMutableArray removeObjectAtIndex:](self->_imageViews, "removeObjectAtIndex:", a3);

        ++a3;
      }
      while (v9 != a3);
    }
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = -[SKUISlideshowGalleryBarView _newImageView](self, "_newImageView");
      objc_msgSend(v8, "setTag:", v7);
      -[NSMutableArray addObject:](self->_imageViews, "addObject:", v8);
      -[UIView addSubview:](self->_imageViewsContainer, "addSubview:", v8);

      ++v7;
    }
    while (v6 != v7);
  }
  -[SKUISlideshowGalleryBarView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedImageIndex:(unint64_t)a3
{
  void *v5;
  __int128 v6;
  void *v7;
  CGAffineTransform v8;
  _OWORD v9[3];

  if (-[NSMutableArray count](self->_imageViews, "count") > a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", self->_selectedImageIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v9[0] = *MEMORY[0x1E0C9BAA8];
    v9[1] = v6;
    v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v9);
    -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v8, 1.5, 1.5);
    objc_msgSend(v7, "setTransform:", &v8);
    -[UIView bringSubviewToFront:](self->_imageViewsContainer, "bringSubviewToFront:", v7);
    self->_selectedImageIndex = a3;

  }
}

- (id)imageAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[NSMutableArray count](self->_imageViews, "count") > (unint64_t)a3
    && (-[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NSMutableArray count](self->_imageViews, "count") > (unint64_t)a4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = -[SKUISlideshowGalleryBarView _newImageView](self, "_newImageView");
      objc_msgSend(v7, "setTag:", a4);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_imageViews, "setObject:atIndexedSubscript:", v7, a4);

    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUISlideshowGalleryBarView;
  v7 = a4;
  -[SKUISlideshowGalleryBarView touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "userBeganInteractingWithGalleryBarView:", self, v11.receiver, v11.super_class);

  }
  objc_msgSend(v6, "anyObject", v11.receiver, v11.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISlideshowGalleryBarView _handleTouch:withEvent:](self, "_handleTouch:withEvent:", v10, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUISlideshowGalleryBarView;
  v6 = a4;
  v7 = a3;
  -[SKUISlideshowGalleryBarView touchesMoved:withEvent:](&v9, sel_touchesMoved_withEvent_, v7, v6);
  objc_msgSend(v7, "anyObject", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUISlideshowGalleryBarView _handleTouch:withEvent:](self, "_handleTouch:withEvent:", v8, v6);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUISlideshowGalleryBarView;
  -[SKUISlideshowGalleryBarView touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "userStoppedInteractingWithGalleryBarView:", self);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUISlideshowGalleryBarView;
  -[SKUISlideshowGalleryBarView touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "userStoppedInteractingWithGalleryBarView:", self);

  }
}

- (id)_newImageView
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.75, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setContentMode:", 2);
  objc_msgSend(v2, "setClipsToBounds:", 1);
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);
  objc_msgSend(v2, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v2, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 1.0);

  objc_msgSend(v2, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(v2, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  objc_msgSend(v2, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1061997773;
  objc_msgSend(v10, "setShadowOpacity:", v11);

  objc_msgSend(v2, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowRadius:", 2.0);

  return v2;
}

- (void)_handleTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(v17, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    if (-[NSMutableArray count](self->_imageViews, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "center");
      v11 = v13;

    }
    -[SKUISlideshowGalleryBarView hitTest:withEvent:](self, "hitTest:withEvent:", v6, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "tag");
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "galleryBarView:didSelectIndex:", self, v15);

    }
  }

}

- (SKUISlideshowGalleryBarViewDelegate)delegate
{
  return (SKUISlideshowGalleryBarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfImages
{
  return self->_numberOfImages;
}

- (unint64_t)selectedImageIndex
{
  return self->_selectedImageIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageViewsContainer, 0);
  objc_storeStrong((id *)&self->_toolbarView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISlideshowGalleryBarView initWithFrame:]";
}

@end
