@implementation SBHighlightView

+ (id)imageCache
{
  id v3;
  _QWORD block[5];

  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isFrontBoard"))
  {
    objc_msgSend(MEMORY[0x1E0DA9E78], "systemAppPersistenteCache");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__SBHighlightView_imageCache__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (imageCache_onceToken != -1)
      dispatch_once(&imageCache_onceToken, block);
    v3 = (id)imageCache_specialCache;
  }
  return v3;
}

void __29__SBHighlightView_imageCache__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0DA9E78]);
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithUniqueIdentifier:", v5);
  v4 = (void *)imageCache_specialCache;
  imageCache_specialCache = v3;

}

+ (id)_highlightImageWithHeight:(double)a3 alpha:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("highlight-%.2fa-%.1fh"), *(_QWORD *)&a4, *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke;
  v11[3] = &__block_descriptor_48_e18___UIImage_16__0_Q8l;
  *(double *)&v11[4] = a3;
  *(double *)&v11[5] = a4;
  objc_msgSend(v8, "imageForKey:generatingIfNecessaryWithBlock:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[8];

  v2 = *(double *)(a1 + 32) + 2.0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 1.0, v2);
  v7[1] = 3221225472;
  v4 = *(_QWORD *)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke_2;
  v7[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v7[5] = 0x3FF0000000000000;
  *(double *)&v7[6] = v2;
  v7[7] = v4;
  objc_msgSend(v3, "imageWithActions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__SBHighlightView__highlightImageWithHeight_alpha___block_invoke_2(CGFloat *a1, void *a2)
{
  CGContext *v3;
  void *v4;
  CGRect v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  CGContextSetAlpha(v3, a1[4]);
  v5.size.width = a1[5];
  v5.size.height = a1[7];
  v5.origin.x = 0.0;
  v5.origin.y = 1.0;
  CGContextFillRect(v3, v5);
}

- (SBHighlightView)initWithFrame:(CGRect)a3 highlightAlpha:(double)a4 highlightHeight:(double)a5
{
  SBHighlightView *v7;
  SBHighlightView *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *highlight;
  UIImageView *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHighlightView;
  v7 = -[SBHighlightView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_highlightAlpha = fmin(fmax(a4, 0.0), 1.0);
    v7->_highlightHeight = a5;
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend((id)objc_opt_class(), "_highlightImageWithHeight:alpha:", a5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    highlight = v8->_highlight;
    v8->_highlight = (UIImageView *)v11;

    v13 = v8->_highlight;
    -[SBHighlightView bounds](v8, "bounds");
    -[UIImageView setFrame:](v13, "setFrame:");
    -[SBHighlightView addSubview:](v8, "addSubview:", v8->_highlight);
  }
  return v8;
}

- (void)layoutSubviews
{
  UIImageView *highlight;

  highlight = self->_highlight;
  -[SBHighlightView bounds](self, "bounds");
  -[UIImageView setFrame:](highlight, "setFrame:");
}

- (double)highlightAlpha
{
  return self->_highlightAlpha;
}

- (double)highlightHeight
{
  return self->_highlightHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
}

@end
