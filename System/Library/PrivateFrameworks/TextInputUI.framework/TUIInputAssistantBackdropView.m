@implementation TUIInputAssistantBackdropView

- (TUIInputAssistantBackdropView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TUIInputAssistantBackdropView *v7;
  uint64_t v8;
  UIVisualEffectView *contentView;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)TUIInputAssistantBackdropView;
  v7 = -[TUIInputAssistantBackdropView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", x, y, width, height);
    contentView = v7->_contentView;
    v7->_contentView = (UIVisualEffectView *)v8;

    -[UIVisualEffectView layer](v7->_contentView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", 1.0 / TUIScreenScaleForView(v7));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(v10, "setMasksToBounds:", 1);
    -[TUIInputAssistantBackdropView addSubview:](v7, "addSubview:", v7->_contentView);
    -[TUIInputAssistantBackdropView _inheritedRenderConfig](v7, "_inheritedRenderConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIInputAssistantBackdropView updateVisualStyle:](v7, "updateVisualStyle:", v12);
    -[TUIInputAssistantBackdropView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    -[TUIInputAssistantBackdropView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("InputAssistantBackdrop"));

  }
  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIInputAssistantBackdropView;
  -[TUIInputAssistantBackdropView layoutSubviews](&v3, sel_layoutSubviews);
  -[TUIInputAssistantBackdropView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_contentView, "setFrame:");
}

- (void)setContentCornerRadius:(double)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  -[TUIInputAssistantBackdropView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v7, "setCornerRadius:", a3);
  -[UIVisualEffectView layer](self->_contentView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerCurve:", v5);
  objc_msgSend(v6, "setCornerRadius:", a3);

}

- (double)contentCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIVisualEffectView layer](self->_contentView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (id)effectsFor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "animatedBackground"))
  {
    v4 = objc_alloc(MEMORY[0x1E0DC4210]);
    objc_msgSend(MEMORY[0x1E0DC4228], "sharedLight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithLightSource:", v5);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v3, "lightKeyboard"))
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v5;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v12;
    }
    objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_setRenderConfig:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIInputAssistantBackdropView;
  v4 = a3;
  -[TUIInputAssistantBackdropView _setRenderConfig:](&v5, sel__setRenderConfig_, v4);
  -[TUIInputAssistantBackdropView updateVisualStyle:](self, "updateVisualStyle:", v4, v5.receiver, v5.super_class);

}

- (void)updateVisualStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  id v8;
  id v9;

  v4 = a3;
  -[TUIInputAssistantBackdropView effectsFor:](self, "effectsFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_contentView, "setBackgroundEffects:", v5);

  -[TUIInputAssistantBackdropView layer](self, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v4, "lightKeyboard");

  if ((_DWORD)self)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v9, "setShadowRadius:", 15.0);
    LODWORD(v7) = 1045220557;
    objc_msgSend(v9, "setShadowOpacity:", v7);
    objc_msgSend(v9, "setShadowOffset:", 0.0, 4.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v8, "CGColor"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
