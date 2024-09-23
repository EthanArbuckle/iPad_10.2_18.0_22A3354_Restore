@implementation SKUIStackView

- (id)_initSKUIStackView
{
  SKUIStackView *v2;
  SKUIStackView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIStackView;
  v2 = -[SKUIStackView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKUIStackView setClipsToBounds:](v2, "setClipsToBounds:", 0);
  return v3;
}

- (SKUIStackView)initWithStackViewStyle:(int64_t)a3
{
  SKUIStackView *v5;
  SKUIStackView *v6;
  NSMutableArray *v7;
  NSMutableArray *stackViews;
  uint64_t v9;
  SKUIStackViewItemView *v10;
  void *v11;
  int64_t stackViewStyle;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackView initWithStackViewStyle:].cold.1();
  }
  v5 = -[SKUIStackView _initSKUIStackView](self, "_initSKUIStackView");
  v6 = v5;
  if (v5)
  {
    v5->_stackViewStyle = a3;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackViews = v6->_stackViews;
    v6->_stackViews = v7;

    if (-[SKUIStackView _stackDepth](v6, "_stackDepth") >= 1)
    {
      v9 = 0;
      do
      {
        v10 = objc_alloc_init(SKUIStackViewItemView);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIStackViewItemView setBorderColor:](v10, "setBorderColor:", v11);

        stackViewStyle = v6->_stackViewStyle;
        if (stackViewStyle == 1)
        {
          -[SKUIStackViewItemView setAlpha:](v10, "setAlpha:", initWithStackViewStyle__sShallowAlphas[v9]);
        }
        else if (!stackViewStyle)
        {
          -[SKUIStackViewItemView setAlpha:](v10, "setAlpha:", initWithStackViewStyle__sDefaultAlphas[v9]);
          -[SKUIStackViewItemView setShouldFlipImageHorizontal:](v10, "setShouldFlipImageHorizontal:", (0x2AuLL >> v9) & 1);
          -[SKUIStackViewItemView setShouldFlipImageVertical:](v10, "setShouldFlipImageVertical:", (unint64_t)(v9 - 1) < 2);
        }
        -[SKUIStackView insertSubview:atIndex:](v6, "insertSubview:atIndex:", v10, 0);
        -[NSMutableArray addObject:](v6->_stackViews, "addObject:", v10);

        ++v9;
      }
      while (v9 < -[SKUIStackView _stackDepth](v6, "_stackDepth"));
    }
  }
  return v6;
}

- (void)performCompressionAnimationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *stackViews;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[SKUIStackView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStackView center](self, "center");
  objc_msgSend(v5, "convertPoint:toView:", 0);
  v7 = v6;
  v9 = v8;

  stackViews = self->_stackViews;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E73A7BA0;
  v14 = v7;
  v15 = v9;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackViews, "enumerateObjectsUsingBlock:", v12);

}

void __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  SKUIBlockAnimationDelegate *v37;
  SKUIBlockAnimationDelegate *v38;
  double v39;
  _QWORD v40[4];
  id v41;
  _OWORD v42[8];
  _BYTE v43[128];
  CATransform3D v44;
  CATransform3D v45;
  CATransform3D v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v39 = (double)a3;
  objc_msgSend(*(id *)(a1 + 32), "_sizeOfItemAtIndex:", (double)a3 + 0.75);
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", a3, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", (uint64_t)((double)a3 + 0.75), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v46, 0, sizeof(v46));
  CATransform3DMakeScale(&v46, v11 / v7, v13 / v9, 1.0);
  v44 = v46;
  CATransform3DTranslate(&v45, &v44, v19 - v15, v21 - v17, 0.0);
  v46 = v45;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v22, "presentationLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = v22;
  if (v25)
    objc_msgSend(v25, "transform");
  else
    memset(v43, 0, sizeof(v43));
  objc_msgSend(v24, "valueWithCATransform3D:", v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFromValue:", v27);

  v45 = v46;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setToValue:", v28);

  objc_msgSend(v23, "setDamping:", 30.0);
  objc_msgSend(v23, "setStiffness:", 300.0);
  objc_msgSend(v23, "setDuration:", 1.0);
  objc_msgSend(v23, "setBeginTime:", v39 * 0.075);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB3B18];
  if (v22)
    objc_msgSend(v22, "transform");
  else
    memset(v42, 0, sizeof(v42));
  objc_msgSend(v30, "valueWithCATransform3D:", v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setToValue:", v31);

  objc_msgSend(v29, "setDamping:", 30.0);
  objc_msgSend(v29, "setStiffness:", 300.0);
  objc_msgSend(v29, "setDuration:", 1.5);
  objc_msgSend(v29, "setBeginTime:", v39 * 0.075 + 0.25);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v23;
  v47[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAnimations:", v33);

  objc_msgSend(v23, "duration");
  v35 = v34;
  objc_msgSend(v29, "duration");
  objc_msgSend(v32, "setDuration:", v35 + v36);
  if (*(_QWORD *)(a1 + 40) && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "count") - 1 == a3)
  {
    v37 = [SKUIBlockAnimationDelegate alloc];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke_2;
    v40[3] = &unk_1E73A7B78;
    v41 = *(id *)(a1 + 40);
    v38 = -[SKUIBlockAnimationDelegate initWithCompletionHandler:](v37, "initWithCompletionHandler:", v40);
    objc_msgSend(v32, "setDelegate:", v38);

  }
  objc_msgSend(v22, "addAnimation:forKey:", v32, CFSTR("SKUIStackViewAnimationKey"));

}

uint64_t __66__SKUIStackView_performCompressionAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setImage:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_stackViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setImage:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)didMoveToWindow
{
  UIWindow *v3;
  UIWindow *window;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIStackView;
  -[SKUIStackView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[SKUIStackView window](self, "window");
  v3 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  window = self->_window;
  self->_window = v3;

}

- (void)layoutSubviews
{
  NSMutableArray *stackViews;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[7];

  -[SKUIStackView _centerInPerspectiveTargetViewCoordinates](self, "_centerInPerspectiveTargetViewCoordinates");
  stackViews = self->_stackViews;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SKUIStackView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E73A7BC8;
  v6[4] = self;
  v6[5] = v4;
  v6[6] = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackViews, "enumerateObjectsUsingBlock:", v6);
}

void __31__SKUIStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MidX;
  double MidY;
  double v19;
  double v20;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v26 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectGetMidY(v28);
  objc_msgSend(*(id *)(a1 + 32), "_sizeOfItemAtIndex:", (double)a3);
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_relativeOffsetOfItemAtIndex:withCenter:", a3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  UIRectCenteredAboutPointScale();
  v13 = v29.origin.x;
  v14 = v29.origin.y;
  v15 = v29.size.width;
  v16 = v29.size.height;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v13;
  v30.origin.y = v14;
  v30.size.width = v15;
  v30.size.height = v16;
  MidY = CGRectGetMidY(v30);
  objc_msgSend(v26, "center");
  if (MidX != v20 || MidY != v19)
    objc_msgSend(v26, "setCenter:", MidX, MidY);
  objc_msgSend(v26, "bounds");
  v32.origin.x = v22;
  v32.origin.y = v23;
  v32.size.width = v24;
  v32.size.height = v25;
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v10;
  v31.size.height = v12;
  if (!CGRectEqualToRect(v31, v32))
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v10, v12);

}

- (CGPoint)_centerInPerspectiveTargetViewCoordinates
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  if (self->_window)
  {
    -[SKUIStackView bounds](self, "bounds");
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    MidX = CGRectGetMidX(v11);
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    -[SKUIStackView convertPoint:toView:](self, "convertPoint:toView:", self->_window, MidX, CGRectGetMidY(v12));
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)_levelInsetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 3.0;
  v3 = 3.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_normalizedDistanceFromVanishingPointForCenter:(CGPoint)a3 perspectiveTargetView:(id)a4
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;
  CGRect v16;

  if (a4)
  {
    y = a3.y;
    x = a3.x;
    objc_msgSend(a4, "bounds");
    v6 = v15.origin.x;
    v7 = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    v10 = fmax(CGRectGetWidth(v15) - x, x);
    v16.origin.x = v6;
    v16.origin.y = v7;
    v16.size.width = width;
    v16.size.height = height;
    v11 = fmax(CGRectGetHeight(v16) + 1000.0, -1000.0);
    v12 = (x - x) / v10;
    v13 = (-1000.0 - y) / v11;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIOffset)_relativeOffsetForMinimumRelativeOffset:(UIOffset)a3 maximumRelativeOffset:(UIOffset)a4 normalizedDistanceFromVanishingPoint:(CGSize)a5
{
  double v5;
  double v6;
  UIOffset result;

  v5 = a3.horizontal + (fabs(a3.horizontal) + fabs(a4.horizontal)) * (a5.width * 0.5 + 0.5);
  v6 = a3.vertical + (fabs(a3.vertical) + fabs(a4.vertical)) * (a5.height * 0.5 + 0.5);
  result.vertical = v6;
  result.horizontal = v5;
  return result;
}

- (UIOffset)_relativeOffsetOfItemAtIndex:(int64_t)a3 withCenter:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIOffset result;

  y = a4.y;
  x = a4.x;
  -[SKUIStackView _levelInsetSize](self, "_levelInsetSize");
  v9 = (v8 + v8) * (double)a3;
  v11 = (v10 + v10) * (double)a3;
  -[SKUIStackView _normalizedDistanceFromVanishingPointForCenter:perspectiveTargetView:](self, "_normalizedDistanceFromVanishingPointForCenter:perspectiveTargetView:", self->_window, x, y);
  -[SKUIStackView _relativeOffsetForMinimumRelativeOffset:maximumRelativeOffset:normalizedDistanceFromVanishingPoint:](self, "_relativeOffsetForMinimumRelativeOffset:maximumRelativeOffset:normalizedDistanceFromVanishingPoint:", -(double)(3 * a3) - v9 * 0.5, -(double)(3 * a3) - v11 * 0.5, v9 * 0.5 + (double)(3 * a3), v11 * 0.5 + (double)(3 * a3), v12, v13);
  result.vertical = v15;
  result.horizontal = v14;
  return result;
}

- (CGSize)_sizeOfItemAtIndex:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SKUIStackView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[SKUIStackView _levelInsetSize](self, "_levelInsetSize");
  v11 = v6 - (v9 + v9) * a3;
  v12 = v8 - (v10 + v10) * a3;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_stackDepth
{
  if (self->_stackViewStyle)
    return 3;
  else
    return 6;
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)stackViewStyle
{
  return self->_stackViewStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_stackViews, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)initWithStackViewStyle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStackView initWithStackViewStyle:]";
}

@end
