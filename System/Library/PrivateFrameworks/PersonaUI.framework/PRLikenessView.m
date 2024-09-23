@implementation PRLikenessView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    dispatch_queue_set_specific(MEMORY[0x24BDAC9B8], (const void *)_PRLikenessViewMainQueueKey, (void *)_PRLikenessViewMainQueueKey, 0);
}

- (PRLikenessView)initWithFrame:(CGRect)a3
{
  PRLikenessView *v3;
  PRLikenessView *v4;
  PRLikeness *likeness;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRLikenessView;
  v3 = -[PRLikenessView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    likeness = v3->_likeness;
    v3->_likeness = 0;

    v4->_circular = 1;
    v4->_shouldDecode = 1;
  }
  return v4;
}

- (PRLikenessView)initWithLikeness:(id)a3
{
  id v5;
  PRLikenessView *v6;
  PRLikenessView *v7;

  v5 = a3;
  v6 = -[PRLikenessView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_likeness, a3);
    -[PRLikenessView _updateViewForLikeness:](v7, "_updateViewForLikeness:", 0);
  }

  return v7;
}

- (void)dealloc
{
  CGImage *staticRepresentation;
  objc_super v4;

  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation)
    CFRelease(staticRepresentation);
  v4.receiver = self;
  v4.super_class = (Class)PRLikenessView;
  -[PRLikenessView dealloc](&v4, sel_dealloc);
}

- (void)_updateViewForLikeness:(BOOL)a3
{
  void *v4;
  PRLikeness *likeness;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;

  if (a3 || -[PRLikenessView _shouldRenderStaticRepresentation](self, "_shouldRenderStaticRepresentation"))
  {
    -[PRLikenessView _imageView](self, "_imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRLikenessView _setDisplayedView:](self, "_setDisplayedView:", v4);
    likeness = self->_likeness;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__PRLikenessView__updateViewForLikeness___block_invoke;
    v15[3] = &unk_24C3CF1A8;
    v15[4] = self;
    v16 = v4;
    v6 = v4;
    -[PRLikenessView _imageForLikeness:completion:](self, "_imageForLikeness:completion:", likeness, v15);

  }
  else
  {
    -[PRLikenessView likeness](self, "likeness");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    if (v8 == 1)
    {
      -[PRLikenessView likeness](self, "likeness");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recipe");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRMonogram monogramWithData:](PRMonogram, "monogramWithData:", v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      -[PRLikenessView _monogramView](self, "_monogramView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMonogram:", v14);
      -[PRLikenessView _setDisplayedView:](self, "_setDisplayedView:", v11);

    }
    else
    {
      -[PRLikenessView likeness](self, "likeness");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (v13 != 3)
        -[PRLikenessView _setDisplayedView:](self, "_setDisplayedView:", 0);
    }
  }
}

void __41__PRLikenessView__updateViewForLikeness___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _PRGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315650;
      v15 = "-[PRLikenessView _updateViewForLikeness:]_block_invoke";
      v16 = 1024;
      v17 = 127;
      v18 = 2112;
      v19 = v9;
      v11 = "%s (%d) \"Likeness cache returned an error: %@\";
      v12 = v10;
      v13 = 28;
LABEL_4:
      _os_log_impl(&dword_20AE0A000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
  }
  else
  {
    if (!v7 || (objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504)) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setImage:", v8);
      goto LABEL_9;
    }
    _PRGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[PRLikenessView _updateViewForLikeness:]_block_invoke";
      v16 = 1024;
      v17 = 129;
      v11 = "%s (%d) \"Likeness image came back but client set new likeness!\";
      v12 = v10;
      v13 = 18;
      goto LABEL_4;
    }
  }

LABEL_9:
}

- (BOOL)_shouldRenderStaticRepresentation
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PRLikenessView likeness](self, "likeness");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
    return 1;
  -[PRLikenessView likeness](self, "likeness");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = 0;
  }
  else
  {
    -[PRLikenessView likeness](self, "likeness");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "staticRepresentation"))
    {
      v5 = 1;
    }
    else
    {
      -[PRLikenessView likeness](self, "likeness");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "staticRepresentationData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10 != 0;

    }
  }

  return v5;
}

- (id)_monogramView
{
  PRMonogramView *monogramView;
  PRMonogramView *v4;
  PRMonogramView *v5;
  PRMonogramView *v6;

  monogramView = self->_monogramView;
  if (!monogramView)
  {
    v4 = [PRMonogramView alloc];
    -[PRLikenessView bounds](self, "bounds");
    v5 = -[PRMonogramView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_monogramView;
    self->_monogramView = v5;

    -[PRMonogramView setCircular:](self->_monogramView, "setCircular:", -[PRLikenessView isCircular](self, "isCircular"));
    -[PRLikenessView addSubview:](self, "addSubview:", self->_monogramView);
    monogramView = self->_monogramView;
  }
  return monogramView;
}

- (id)_imageView
{
  PRImageView *imageView;
  PRImageView *v4;
  PRImageView *v5;
  PRImageView *v6;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = [PRImageView alloc];
    -[PRLikenessView bounds](self, "bounds");
    v5 = -[PRImageView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_imageView;
    self->_imageView = v5;

    -[PRImageView setCircular:](self->_imageView, "setCircular:", -[PRLikenessView isCircular](self, "isCircular"));
    -[PRImageView setContentMode:](self->_imageView, "setContentMode:", 2);
    -[PRLikenessView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_imageForLikeness:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, void *, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, id, void *, _QWORD))a4;
  if (objc_msgSend(v6, "staticRepresentation"))
  {
    v8 = (void *)MEMORY[0x24BDF6AC8];
    v9 = objc_msgSend(v6, "staticRepresentation");
    objc_msgSend(v6, "cropRect");
    objc_msgSend(v8, "pr_imageWithCGImage:cropRect:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6, v10, 0);
  }
  else
  {
    -[PRLikenessView bounds](self, "bounds");
    +[PRLikenessCacheContext contextWithCacheSize:](PRLikenessCacheContext, "contextWithCacheSize:", PRLikenessCacheSizeClosestToSize(v11, v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setForceDecode:", 1);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    objc_msgSend(v10, "setScale:");

    +[PRLikenessCache sharedInstance](PRLikenessCache, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__PRLikenessView__imageForLikeness_completion___block_invoke;
    v15[3] = &unk_24C3CF1F8;
    v17 = v7;
    v16 = v6;
    objc_msgSend(v14, "imageForLikeness:context:completion:", v16, v10, v15);

  }
}

void __47__PRLikenessView__imageForLikeness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (dispatch_get_specific((const void *)_PRLikenessViewMainQueueKey))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__PRLikenessView__imageForLikeness_completion___block_invoke_2;
    v7[3] = &unk_24C3CF1D0;
    v11 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __47__PRLikenessView__imageForLikeness_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)setLikeness:(id)a3
{
  void *v5;
  NSData *v6;
  NSData *recipe;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGImage *staticRepresentation;
  CGImage *v13;
  id v14;

  v14 = a3;
  if (!-[PRLikenessView _isLikenessEqual:](self, "_isLikenessEqual:"))
  {
    objc_storeStrong((id *)&self->_likeness, a3);
    self->_likenessType = objc_msgSend(v14, "type");
    objc_msgSend(v14, "recipe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSData *)objc_msgSend(v5, "copy");
    recipe = self->_recipe;
    self->_recipe = v6;

    objc_msgSend(v14, "cropRect");
    self->_cropRect.origin.x = v8;
    self->_cropRect.origin.y = v9;
    self->_cropRect.size.width = v10;
    self->_cropRect.size.height = v11;
    staticRepresentation = self->_staticRepresentation;
    if (staticRepresentation)
      CFRelease(staticRepresentation);
    v13 = (CGImage *)objc_msgSend(v14, "staticRepresentation");
    self->_staticRepresentation = v13;
    if (v13)
      CFRetain(v13);
    if (v14)
      -[PRLikenessView _updateViewForLikeness:](self, "_updateViewForLikeness:", 0);
    else
      -[PRLikenessView _setDisplayedView:](self, "_setDisplayedView:", 0);
  }

}

- (BOOL)_isLikenessEqual:(id)a3
{
  PRLikeness *v4;
  PRLikeness *v5;
  BOOL v6;
  unint64_t likenessType;
  CGImage *staticRepresentation;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  NSData *recipe;
  void *v15;
  CGRect v16;

  v4 = (PRLikeness *)a3;
  v5 = v4;
  if (self->_likeness == v4)
  {
    if (!v4)
    {
      v6 = 1;
      goto LABEL_3;
    }
    likenessType = self->_likenessType;
    if (likenessType == -[PRLikeness type](v4, "type"))
    {
      staticRepresentation = self->_staticRepresentation;
      if (staticRepresentation == (CGImage *)-[PRLikeness staticRepresentation](v5, "staticRepresentation"))
      {
        -[PRLikeness cropRect](v5, "cropRect");
        v16.origin.x = v10;
        v16.origin.y = v11;
        v16.size.width = v12;
        v16.size.height = v13;
        if (CGRectEqualToRect(self->_cropRect, v16))
        {
          recipe = self->_recipe;
          -[PRLikeness recipe](v5, "recipe");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSData isEqual:](recipe, "isEqual:", v15);

        }
      }
    }
  }
  v6 = 0;
LABEL_3:

  return v6;
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    -[PRMonogramView setCircular:](self->_monogramView, "setCircular:");
    -[PRImageView setCircular:](self->_imageView, "setCircular:", -[PRLikenessView isCircular](self, "isCircular"));
    -[PRLikenessView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PRMonogramView setHighlighted:](self->_monogramView, "setHighlighted:");
  }
}

- (void)_setDisplayedView:(id)a3
{
  PRImageView *v4;
  PRImageView *imageView;
  PRMonogramView *monogramView;
  PRMonogramView *v7;

  v4 = (PRImageView *)a3;
  imageView = self->_imageView;
  v7 = (PRMonogramView *)v4;
  if (imageView == v4)
  {
    -[PRImageView setHidden:](v4, "setHidden:", 0);
  }
  else
  {
    -[PRImageView setHidden:](imageView, "setHidden:", 1);
    -[PRImageView setImage:](self->_imageView, "setImage:", 0);
  }
  monogramView = self->_monogramView;
  if (monogramView == v7)
  {
    -[PRMonogramView setHidden:](v7, "setHidden:", 0);
  }
  else
  {
    -[PRMonogramView setHidden:](monogramView, "setHidden:", 1);
    -[PRMonogramView setMonogram:](self->_monogramView, "setMonogram:", 0);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRLikenessView;
  -[PRLikenessView layoutSubviews](&v3, sel_layoutSubviews);
  -[PRLikenessView bounds](self, "bounds");
  -[PRMonogramView setFrame:](self->_monogramView, "setFrame:");
  -[PRLikenessView bounds](self, "bounds");
  -[PRImageView setFrame:](self->_imageView, "setFrame:");
}

- (void)setNeedsRedraw
{
  -[PRLikenessView _updateViewForLikeness:](self, "_updateViewForLikeness:", 0);
}

- (PRLikeness)likeness
{
  return self->_likeness;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)shouldDecode
{
  return self->_shouldDecode;
}

- (void)setShouldDecode:(BOOL)a3
{
  self->_shouldDecode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeness, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_monogramView, 0);
}

@end
