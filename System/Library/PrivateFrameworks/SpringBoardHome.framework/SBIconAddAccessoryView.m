@implementation SBIconAddAccessoryView

- (SBIconAddAccessoryView)init
{
  SBIconAddAccessoryView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImageView *addImageView;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBIconAddAccessoryView;
  v2 = -[SBIconAddAccessoryView init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithConfiguration:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    addImageView = v2->_addImageView;
    v2->_addImageView = (UIImageView *)v12;

    -[UIImageView setContentMode:](v2->_addImageView, "setContentMode:", 1);
    -[SBIconAddAccessoryView addSubview:](v2, "addSubview:", v2->_addImageView);

  }
  return v2;
}

- (void)layoutSubviews
{
  UIImageView *addImageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconAddAccessoryView;
  -[SBIconAddAccessoryView layoutSubviews](&v4, sel_layoutSubviews);
  addImageView = self->_addImageView;
  -[SBIconAddAccessoryView bounds](self, "bounds");
  UIRectInset();
  -[UIImageView setFrame:](addImageView, "setFrame:");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[SBIconAddAccessoryView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBIconAddAccessoryView _hitTestPadding](self, "_hitTestPadding");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SBIconAddAccessoryView listLayout](self, "listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutIconAccessorySize(v2);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconAddAccessoryView listLayout](self, "listLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SBHIconListLayoutIconAccessoryOffset(v8);
  v11 = v10;

  -[SBIconAddAccessoryView listLayout](self, "listLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SBHIconListLayoutIconAccessorySize(v12);
  v15 = v14;

  v16 = SBIconBadgeViewCalculateAccessoryCenter(objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, x, y, width, height, v13 + 2.0 + 2.0, v15 + 2.0 + 2.0, v9, v11);
  result.y = v17;
  result.x = v16;
  return result;
}

- (BOOL)displayingAccessory
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v6 = (void *)MEMORY[0x1E0DC3508];
  -[SBIconAddAccessoryView bounds](self, "bounds");
  v14 = CGRectInset(v13, 1.0, 1.0);
  objc_msgSend(v6, "bezierPathWithOvalInRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowPath:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIEdgeInsets)_hitTestPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -9.0;
  v3 = -9.0;
  v4 = -9.0;
  v5 = -9.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (UITapGestureRecognizer)actionTapGestureRecognizer
{
  return self->_actionTapGestureRecognizer;
}

- (void)setActionTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_addImageView, 0);
}

@end
