@implementation PXUIButton

- (PXUIButton)initWithFrame:(CGRect)a3
{
  PXUIButton *v3;
  PXUIButtonConfiguration *v4;
  PXUIButtonConfiguration *px_configuration;
  uint64_t v6;
  UIPointerInteraction *pointerInteraction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXUIButton;
  v3 = -[PXUIButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PXUIButtonConfiguration);
    px_configuration = v3->_px_configuration;
    v3->_px_configuration = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    pointerInteraction = v3->_pointerInteraction;
    v3->_pointerInteraction = (UIPointerInteraction *)v6;

    -[PXUIButton addInteraction:](v3, "addInteraction:", v3->_pointerInteraction);
  }
  return v3;
}

- (void)setPx_configuration:(id)a3
{
  PXUIButtonConfiguration *v4;
  PXUIButtonConfiguration *px_configuration;
  uint64_t v6;
  void *v7;
  PXUIButtonConfiguration *v8;
  PXUIButtonConfiguration *v9;
  PXUIButtonConfiguration *v10;

  v4 = (PXUIButtonConfiguration *)a3;
  px_configuration = self->_px_configuration;
  if (px_configuration != v4)
  {
    v10 = v4;
    v6 = -[PXUIButtonConfiguration cursorEffect](px_configuration, "cursorEffect");
    if (v6 != -[PXUIButtonConfiguration cursorEffect](v10, "cursorEffect"))
    {
      -[PXUIButton pointerInteraction](self, "pointerInteraction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidate");

    }
    v8 = (PXUIButtonConfiguration *)-[PXUIButtonConfiguration copy](v10, "copy");
    v9 = self->_px_configuration;
    self->_px_configuration = v8;

    v4 = v10;
  }

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)PXUIButton;
  v7 = -[PXUIButton pointInside:withEvent:](&v18, sel_pointInside_withEvent_, a4);
  -[PXUIButton bounds](self, "bounds");
  if (!CGRectIsEmpty(v20))
  {
    -[PXUIButton px_configuration](self, "px_configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hitTestOutset");
    sub_1A7AE3F38();
    PXEdgeInsetsInsetRect();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    if (v7)
    {
      return 1;
    }
    else
    {
      v21.origin.x = v10;
      v21.origin.y = v12;
      v21.size.width = v14;
      v21.size.height = v16;
      v19.x = x;
      v19.y = y;
      return CGRectContainsPoint(v21, v19);
    }
  }
  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  int v6;
  _QWORD v7[5];
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXUIButton;
  -[PXUIButton setHighlighted:](&v9, sel_setHighlighted_);
  -[PXUIButton px_configuration](self, "px_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowAnimatedHighlighting");

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__PXUIButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E5144398;
    v7[4] = self;
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.25);
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  PXUIButtonConfiguration *px_configuration;
  id v6;
  void *v7;
  id v8;

  px_configuration = self->_px_configuration;
  v6 = a5;
  if (-[PXUIButtonConfiguration cursorEffect](px_configuration, "cursorEffect"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  -[PXUIButton px_configuration](self, "px_configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cursorEffect");
  if (v9)
  {
    if (v9 != 1 && v9 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _ClassForCursorEffect(PXUIButtonCursorEffect)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXUIButton.m"), 26, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_opt_class();
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(v10, "effectWithPreview:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXEdgeInsetsMake();
  -[PXUIButton _pointerRectForCurrentState](self, "_pointerRectForCurrentState");
  PXEdgeInsetsInsetRect();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CGRect)_pointerRectForCurrentState
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[PXUIButton frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PXUIButton state](self, "state");
  v12 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXUIButton titleForState:](self, "titleForState:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PXUIButton titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v12 = v18;
    v13 = v19;
    v14 = v20;
    v15 = v21;

  }
  v34.origin.x = v12;
  v34.origin.y = v13;
  v34.size.width = v14;
  v34.size.height = v15;
  if (CGRectIsNull(v34))
  {
    -[PXUIButton imageForState:](self, "imageForState:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[PXUIButton imageView](self, "imageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v12 = v24;
      v13 = v25;
      v14 = v26;
      v15 = v27;

    }
  }
  v35.origin.x = v12;
  v35.origin.y = v13;
  v35.size.width = v14;
  v35.size.height = v15;
  if (CGRectIsNull(v35))
  {
    v15 = v10;
    v14 = v8;
  }
  else
  {
    PXPointAdd();
    v4 = v28;
    v6 = v29;
  }
  v30 = v4;
  v31 = v6;
  v32 = v14;
  v33 = v15;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (PXUIButtonConfiguration)px_configuration
{
  return self->_px_configuration;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_px_configuration, 0);
}

uint64_t __29__PXUIButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.5;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

+ (id)buttonWithWithCursorEffect:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = objc_alloc_init((Class)a1);
  +[PXUIButtonConfiguration configurationWithCursorEffect:](PXUIButtonConfiguration, "configurationWithCursorEffect:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPx_configuration:", v10);

  objc_msgSend(v9, "addTarget:action:forControlEvents:", v8, a5, 0x2000);
  return v9;
}

@end
