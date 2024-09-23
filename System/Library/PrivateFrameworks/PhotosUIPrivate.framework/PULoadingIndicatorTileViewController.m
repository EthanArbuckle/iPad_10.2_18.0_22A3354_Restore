@implementation PULoadingIndicatorTileViewController

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PULoadingIndicatorTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PULoadingIndicatorTileViewController setStyle:animated:](self, "setStyle:animated:", 0, 0);
}

- (void)setStyle:(int64_t)a3
{
  -[PULoadingIndicatorTileViewController setStyle:animated:](self, "setStyle:animated:", a3, 1);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  void (**v19)(void *, uint64_t);
  double v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[5];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  CGRect v29;
  CGRect v30;

  if (self->_style != a3)
  {
    v4 = a4;
    v5 = (void *)a3;
    self->_style = a3;
    -[PULoadingIndicatorTileViewController indicatorView](self, "indicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "_createIndicatorViewForStyle:", v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlpha:", 0.0);
      objc_msgSend(v5, "setAutoresizingMask:", 45);
      -[PUTileViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      x = v29.origin.x;
      y = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      MidX = CGRectGetMidX(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v30));
      objc_msgSend(v8, "addSubview:", v5);

    }
    -[PULoadingIndicatorTileViewController setIndicatorView:](self, "setIndicatorView:", v5);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke;
    aBlock[3] = &unk_1E58ABCA8;
    v15 = v7;
    v27 = v15;
    v16 = v5;
    v28 = v16;
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_2;
    v24[3] = &unk_1E58AAE08;
    v24[4] = self;
    v18 = v15;
    v25 = v18;
    v19 = (void (**)(void *, uint64_t))_Block_copy(v24);
    if (v4)
    {
      v20 = dbl_1AB0EF330[v16 == 0];
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_3;
      v22[3] = &unk_1E58ABAC8;
      v23 = v17;
      objc_msgSend(v21, "animateWithDuration:delay:options:animations:completion:", 4, v22, v19, v20, 0.0);

    }
    else
    {
      v17[2](v17);
      v19[2](v19, 1);
    }

  }
}

- (int64_t)style
{
  return self->_style;
}

- (PUProgressIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "_destroyIndicatorView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

uint64_t __58__PULoadingIndicatorTileViewController_setStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (CGSize)loadingIndicatorTileSizeForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  if (loadingIndicatorTileSizeForStyle__onceToken != -1)
    dispatch_once(&loadingIndicatorTileSizeForStyle__onceToken, &__block_literal_global_46064);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)loadingIndicatorTileSizeForStyle__cache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(a1, "_createIndicatorViewForStyle:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v7, "intrinsicContentSize");
    objc_msgSend(v8, "valueWithCGSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_destroyIndicatorView:", v7);
    objc_msgSend((id)loadingIndicatorTileSizeForStyle__cache, "setObject:forKey:", v6, v5);

  }
  objc_msgSend(v6, "CGSizeValue");
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (id)_createIndicatorViewForStyle:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  PUProgressIndicatorView *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a3 != 3)
  {
    if (a3 == 2)
    {
      v3 = CFSTR("SAVING_PHOTO_INDICATOR_TITLE");
    }
    else
    {
      if (a3 != 1)
      {
        v4 = 0;
        goto LABEL_9;
      }
      v3 = CFSTR("LOADING_PHOTO_INDICATOR_TITLE");
    }
    PULocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = 0;
    v5 = 1;
    goto LABEL_10;
  }
  v4 = 0;
  v5 = 0;
  v6 = 2;
LABEL_10:
  v7 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", v6);
  -[PUProgressIndicatorView setDeterminate:](v7, "setDeterminate:", 0);
  -[PUProgressIndicatorView setShowsBackground:](v7, "setShowsBackground:", v5);
  -[PUProgressIndicatorView setLocalizedMessage:](v7, "setLocalizedMessage:", v4);
  -[PUProgressIndicatorView beginShowingProgressImmediately:animated:](v7, "beginShowingProgressImmediately:animated:", 1, 0);
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PUProgressIndicatorView intrinsicContentSize](v7, "intrinsicContentSize");
  -[PUProgressIndicatorView setBounds:](v7, "setBounds:", v8, v9, v10, v11);

  return v7;
}

+ (void)_destroyIndicatorView:(id)a3
{
  objc_msgSend(a3, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 0, 0);
}

void __73__PULoadingIndicatorTileViewController_loadingIndicatorTileSizeForStyle___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)loadingIndicatorTileSizeForStyle__cache;
  loadingIndicatorTileSizeForStyle__cache = (uint64_t)v0;

}

@end
