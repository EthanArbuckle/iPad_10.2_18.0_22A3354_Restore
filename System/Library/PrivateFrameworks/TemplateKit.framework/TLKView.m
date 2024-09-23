@implementation TLKView

+ (void)enableShadow:(BOOL)a3 forView:(id)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  int v8;
  double v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = a4;
  objc_msgSend(v11, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  if (v4)
  {
    objc_msgSend(a1, "makeContainerShadowCompatible:", v11, v7);
    v8 = objc_msgSend(v6, "isGeometryFlipped");
    v9 = -2.0;
    if (!v8)
      v9 = 2.0;
    objc_msgSend(v6, "setShadowOffset:", 0.0, v9);
    objc_msgSend(v6, "setShadowRadius:", 8.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v10, "CGColor"));

    LODWORD(v7) = 1039516303;
  }
  objc_msgSend(v6, "setShadowOpacity:", v7);

}

+ (void)makeContainerShadowCompatible:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

}

- (TLKView)init
{
  TLKView *v2;
  TLKView *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKView;
  v2 = -[TLKView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TLKView setObserver:](v2, "setObserver:", v2);
    -[TLKView setupContentView](v3, "setupContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "setLayoutMarginsRelativeArrangement:", 1);
      if (-[TLKView usesDefaultLayoutMargins](v3, "usesDefaultLayoutMargins"))
      {
        objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
        objc_msgSend(v5, "setLayoutMargins:");
      }

    }
    -[TLKView setContentView:](v3, "setContentView:", v4);
    -[TLKView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

    -[TLKView addSubview:](v3, "addSubview:", v4);
  }
  return v3;
}

- (id)setupContentView
{
  return 0;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 1;
}

- (void)propertiesDidChange
{
  void *v3;
  char isKindOfClass;
  id v5;

  -[TLKView observedPropertiesChanged](self, "observedPropertiesChanged");
  if (-[TLKView usesDefaultLayoutMargins](self, "usesDefaultLayoutMargins"))
  {
    -[TLKView contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TLKView contentView](self, "contentView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "hasBaselineRelativeLayoutMarginsForArrangement"))
      {
        -[TLKView defaultBaselineRelativeLayoutMargins](self, "defaultBaselineRelativeLayoutMargins");
        objc_msgSend(v5, "setLayoutMargins:");
      }

    }
  }
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v9;
  UIEdgeInsets result;

  v2 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_0;
  v3 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_1;
  v4 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_2;
  v5 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_3;
  if (*(double *)&defaultLayoutMargins_defaultLayoutMargins_1 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_0 == *MEMORY[0x1E0DC49E8]
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_3 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_2 == *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    +[TLKUtilities standardTableCellContentInset](TLKUtilities, "standardTableCellContentInset", *(double *)&defaultLayoutMargins_defaultLayoutMargins_0, *(double *)&defaultLayoutMargins_defaultLayoutMargins_1, *(double *)&defaultLayoutMargins_defaultLayoutMargins_2, *(double *)&defaultLayoutMargins_defaultLayoutMargins_3);
    v5 = *(double *)&v9;
    defaultLayoutMargins_defaultLayoutMargins_0 = 0x4030000000000000;
    defaultLayoutMargins_defaultLayoutMargins_1 = v9;
    defaultLayoutMargins_defaultLayoutMargins_2 = 0x4030000000000000;
    defaultLayoutMargins_defaultLayoutMargins_3 = v9;
    v4 = 16.0;
    v3 = *(double *)&v9;
    v2 = 16.0;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[TLKView viewForFirstBaselineLayout](self, "viewForFirstBaselineLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performSelector:", sel_font);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "capHeight");
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
    v4 = v4 + v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)effectiveLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  -[TLKView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TLKView contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMargins");
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;

  }
  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutMarginsDidChange
{
  void *v3;
  char isKindOfClass;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TLKView layoutMargins](self, "layoutMargins");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TLKView contentView](self, "contentView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLayoutMargins:", v6, v8, v10, v12);

  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  objc_super v8;

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TLKView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForFirstBaselineLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKView;
    -[TLKView viewForFirstBaselineLayout](&v8, sel_viewForFirstBaselineLayout);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  objc_super v8;

  -[TLKView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TLKView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForLastBaselineLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKView;
    -[TLKView viewForLastBaselineLayout](&v8, sel_viewForLastBaselineLayout);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)performBatchUpdates:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(void);
  _QWORD v12[4];
  void (**v13)(void);

  v11 = (void (**)(void))a3;
  -[TLKView observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBatchUpdateCount:", objc_msgSend(v4, "batchUpdateCount") + 1);

  if (v11)
  {
    -[TLKView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TLKView contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __31__TLKView_performBatchUpdates___block_invoke;
      v12[3] = &unk_1E5C070D8;
      v13 = v11;
      objc_msgSend(v7, "performBatchUpdates:", v12);

    }
    else
    {
      v11[2]();
    }
  }
  -[TLKView observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBatchUpdateCount:", objc_msgSend(v8, "batchUpdateCount") - 1);

  -[TLKView observer](self, "observer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "batchUpdateCount");

  if (!v10)
    -[TLKView propertiesDidChange](self, "propertiesDidChange");

}

uint64_t __31__TLKView_performBatchUpdates___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableUnbatchedUpdates
{
  -[TLKView setObserver:](self, "setObserver:", 0);
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  void *v2;
  char v3;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLayoutSizeDependentOnPerpendicularAxis");

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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TLKView;
  -[TLKView layoutSubviews](&v12, sel_layoutSubviews);
  -[TLKView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TLKView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveLayoutSizeFittingSize:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TLKView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (void)enableLightKeylineStroke:(BOOL)a3 forView:(id)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = a4;
  objc_msgSend(v11, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  if (v4)
  {
    objc_msgSend(a1, "makeContainerShadowCompatible:", v11, v7);
    +[TLKUtilities pixelWidthForView:](TLKUtilities, "pixelWidthForView:", v11);
    v9 = v8 * 1.5;
    if (v9 > 1.0)
      v9 = 1.0;
    objc_msgSend(v6, "setShadowRadius:", v9);
    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v6, "setShadowPath:", 0);
    LODWORD(v7) = 1058642330;
  }
  objc_msgSend(v6, "setShadowOpacity:", v7);

}

- (TLKObserver)observer
{
  return (TLKObserver *)objc_loadWeakRetained((id *)&self->observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->observer, a3);
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

- (UIView)leadingTextView
{
  return (UIView *)objc_getProperty(self, a2, 432, 1);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (TLKAppearance)tlkAppearance
{
  return self->_tlkAppearance;
}

- (void)setTlkAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_tlkAppearance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkAppearance, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_destroyWeak((id *)&self->observer);
}

@end
