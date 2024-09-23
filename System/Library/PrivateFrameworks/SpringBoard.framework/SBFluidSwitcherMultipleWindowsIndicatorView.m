@implementation SBFluidSwitcherMultipleWindowsIndicatorView

- (SBFluidSwitcherMultipleWindowsIndicatorView)initWithFrame:(CGRect)a3
{
  SBFluidSwitcherMultipleWindowsIndicatorView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIPointerInteraction *pointerInteraction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherMultipleWindowsIndicatorView;
  v3 = -[SBFluidSwitcherMultipleWindowsIndicatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 14.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("square.fill.on.square.fill"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherMultipleWindowsIndicatorView setAccessibilityTraits:](v3, "setAccessibilityTraits:", *MEMORY[0x1E0CEB110]);
    -[SBFluidSwitcherMultipleWindowsIndicatorView setImage:](v3, "setImage:", v5);
    -[SBFluidSwitcherMultipleWindowsIndicatorView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v3);
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v6;

    -[SBFluidSwitcherMultipleWindowsIndicatorView addInteraction:](v3, "addInteraction:", v3->_pointerInteraction);
  }
  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  objc_super v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherMultipleWindowsIndicatorView;
  if (-[SBFluidSwitcherMultipleWindowsIndicatorView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4))
    return 1;
  -[SBFluidSwitcherMultipleWindowsIndicatorView _hitTestBounds](self, "_hitTestBounds");
  v9.x = x;
  v9.y = y;
  return CGRectContainsPoint(v10, v9);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CEA870];
  v7 = a5;
  -[SBFluidSwitcherMultipleWindowsIndicatorView _hitTestBounds](self, "_hitTestBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA878];
  -[SBFluidSwitcherMultipleWindowsIndicatorView frame](self, "frame");
  UIRectCenteredRect();
  objc_msgSend(v8, "shapeWithRoundedRect:cornerRadius:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)_hitTestBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SBFluidSwitcherMultipleWindowsIndicatorView bounds](self, "bounds");
  UIRectInset();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
}

@end
