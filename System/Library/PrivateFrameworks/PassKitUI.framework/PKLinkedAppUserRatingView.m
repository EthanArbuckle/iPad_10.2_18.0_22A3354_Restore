@implementation PKLinkedAppUserRatingView

- (PKLinkedAppUserRatingView)initWithFrame:(CGRect)a3
{
  PKLinkedAppUserRatingView *v3;
  NSMutableArray *v4;
  NSMutableArray *starViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKLinkedAppUserRatingView;
  v3 = -[PKLinkedAppUserRatingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    starViews = v3->_starViews;
    v3->_starViews = v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKLinkedAppUserRatingView;
  -[PKLinkedAppUserRatingView dealloc](&v2, sel_dealloc);
}

- (void)setUserRating:(float)a3
{
  float v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  float userRating;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSMutableArray *starViews;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSMutableArray *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = 5.0;
  if (a3 <= 5.0)
    v5 = a3;
  self->_userRating = v5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_starViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v30);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_starViews, "removeAllObjects");
  userRating = self->_userRating;
  v12 = vcvtms_s32_f32(userRating);
  v13 = vcvtps_s32_f32(a3 - (float)(int)floorf(userRating));
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithSymbolConfiguration:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 < 1)
    {
      v12 = 0;
    }
    else
    {
      v17 = v12;
      do
      {
        starViews = self->_starViews;
        -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v16, (_QWORD)v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](starViews, "addObject:", v19);

        --v17;
      }
      while (v17);
    }

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.leadinghalf.fill"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageWithSymbolConfiguration:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 >= 1)
    {
      v22 = v13;
      do
      {
        v23 = self->_starViews;
        -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v21, (_QWORD)v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v23, "addObject:", v24);

        --v22;
      }
      while (v22);
      v12 += v13;
    }

  }
  if (v12 != 5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageWithSymbolConfiguration:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 <= 4)
    {
      if (5 - v12 <= 1)
        v27 = 1;
      else
        v27 = 5 - v12;
      do
      {
        v28 = self->_starViews;
        -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v26, (_QWORD)v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v28, "addObject:", v29);

        --v27;
      }
      while (v27);
    }

  }
}

- (void)layoutSubviews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_starViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[PKLinkedAppUserRatingView addSubview:](self, "addSubview:", v9, (_QWORD)v24);
        objc_msgSend(v9, "sizeToFit");
        objc_msgSend(v9, "frame");
        v11 = v10;
        objc_msgSend(v9, "frame");
        v30.origin.y = 0.0;
        v30.origin.x = v7;
        v30.size.width = v11;
        MaxX = CGRectGetMaxX(v30);
        -[PKLinkedAppUserRatingView bounds](self, "bounds");
        UIRectCenteredYInRect();
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        if (-[PKLinkedAppUserRatingView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
        {
          -[PKLinkedAppUserRatingView bounds](self, "bounds");
          v22 = v21 - v18;
          -[PKLinkedAppUserRatingView bounds](self, "bounds");
          v14 = v22 - (v14 - v23);
        }
        v7 = MaxX + 1.0;
        objc_msgSend(v9, "setFrame:", v14, v16, v18, v20);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[NSMutableArray lastObject](self->_starViews, "lastObject", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "frame");
  else
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = v5 * 5.0;

  v7 = 15.0;
  v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (id)_starImageViewWithImage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  return v4;
}

- (float)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starViews, 0);
}

@end
