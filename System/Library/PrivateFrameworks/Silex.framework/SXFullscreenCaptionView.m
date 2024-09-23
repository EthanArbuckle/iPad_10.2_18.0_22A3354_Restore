@implementation SXFullscreenCaptionView

- (SXFullscreenCaptionView)initWithTextSourceFactory:(id)a3 actionHandler:(id)a4
{
  id v7;
  id v8;
  SXFullscreenCaptionView *v9;
  SXFullscreenCaptionView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXFullscreenCaptionView;
  v9 = -[SXFullscreenCaptionView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textSourceFactory, a3);
    objc_storeStrong((id *)&v10->_actionHandler, a4);
    -[SXFullscreenCaptionView createBackgroundView](v10, "createBackgroundView");
    -[SXFullscreenCaptionView createScrollView](v10, "createScrollView");
    -[SXFullscreenCaptionView setupGestureRecognizers](v10, "setupGestureRecognizers");
    -[SXFullscreenCaptionView initializeTangier](v10, "initializeTangier");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SXStandaloneTextLayout setDelegate:](self->_captionLayout, "setDelegate:", 0);
  -[SXAutoSizedCanvasController setDelegate:](self->_autoSizeCanvasController, "setDelegate:", 0);
  -[SXAutoSizedCanvasController teardown](self->_autoSizeCanvasController, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView dealloc](&v3, sel_dealloc);
}

- (void)updateWithCaption:(id)a3 forViewIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = a5;
  v17 = a3;
  objc_storeStrong((id *)&self->_caption, a3);
  self->_viewIndex = a4;
  if (-[SXFullscreenCaptionView expansionMode](self, "expansionMode") == 2)
  {
    -[SXFullscreenCaptionView scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScrollEnabled:", 0);

  }
  self->_expansionMode = 1;
  -[SXFullscreenCaptionView renderCaptionInTangier](self, "renderCaptionInTangier");
  -[SXFullscreenCaptionView updateFrameAnimated:](self, "updateFrameAnimated:", v5);
  -[SXFullscreenCaptionView frame](self, "frame");
  v11 = v10;
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineHeight");
  v14 = v13 * 4.5 + 15.5;

  if (v11 > v14)
    v15 = 1;
  else
    v15 = 2;
  -[SXFullscreenCaptionView setExpansionMode:animated:](self, "setExpansionMode:animated:", v15, 0);
  -[SXFullscreenCaption text]((uint64_t)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    -[SXFullscreenCaptionView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
    -[SXFullscreenCaptionView setAccessibilityLabel:](self, "setAccessibilityLabel:", v16);
  }
  else
  {
    -[SXFullscreenCaptionView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 0);
  }

}

- (void)createBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v6);
  -[SXFullscreenCaptionView setBackgroundView:](self, "setBackgroundView:", v3);

  -[SXFullscreenCaptionView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setGroupName:", CFSTR("captionBars"));

  -[SXFullscreenCaptionView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView addSubview:](self, "addSubview:", v5);

}

- (CGRect)determineFrameInSuperview:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_peripheryInsets");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "bounds");
  v14 = CGRectGetWidth(v28) - v6 - v8;
  -[SXFullscreenCaptionView sizeThatFits:](self, "sizeThatFits:", v14, 1.79769313e308);
  self->_fullSize.width = v14;
  self->_fullSize.height = v15;
  self->_fullInsets.top = v11;
  self->_fullInsets.left = v6;
  self->_fullInsets.bottom = v13;
  self->_fullInsets.right = v8;
  -[SXFullscreenCaptionView frameWithSuperview:size:forExpansionMode:](self, "frameWithSuperview:size:forExpansionMode:", v4, -[SXFullscreenCaptionView expansionMode](self, "expansionMode"), v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)frameWithSuperview:(id)a3 size:(CGSize)a4 forExpansionMode:(int)a5
{
  double height;
  CGFloat width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  -[SXFullscreenCaptionView fullInsets](self, "fullInsets");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "bounds");
  v14 = CGRectGetHeight(v35);
  v15 = height + v13 + 16.0;
  if (a5 == 2)
  {
    -[SXFullscreenCaptionView superview](self, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22 * 0.5;

    if (v23 >= v14 - v15)
      v16 = v23;
    else
      v16 = v14 - v15;
  }
  else
  {
    v16 = v14;
    if (a5 == 1)
    {
      -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lineHeight");
      v19 = v18;

      v20 = v19 * 4.5 + 15.5;
      if (v20 >= v15)
        v20 = v15;
      v16 = v14 - v20;
    }
  }
  -[SXFullscreenCaptionView caption](self, "caption");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_12;
  v25 = (void *)v24;
  -[SXFullscreenCaptionView caption](self, "caption");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption text]((uint64_t)v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v28)
  {
    v29 = v14 - v16;
    v14 = v16;
  }
  else
  {
LABEL_12:
    v29 = 0.0;
  }
  objc_msgSend(v9, "bounds");
  v30 = v11 + CGRectGetMinX(v36);

  v31 = v30;
  v32 = v14;
  v33 = width;
  v34 = v29;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double Width;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;

  v33.receiver = self;
  v33.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView setFrame:](&v33, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXFullscreenCaptionView fullInsets](self, "fullInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = -v4;
  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  v12 = v9 + v5 + v11;
  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  v14 = v7 + v13 + 16.0;
  -[SXFullscreenCaptionView backgroundView](self, "backgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v10, 0.0, v12, v14);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView fullInsets](self, "fullInsets");
  v18 = v17;
  -[SXFullscreenCaptionView bounds](self, "bounds");
  Width = CGRectGetWidth(v34);
  -[SXFullscreenCaptionView bounds](self, "bounds");
  objc_msgSend(v16, "setFrame:", v18, 15.5, Width, CGRectGetHeight(v35) + -15.5);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  objc_msgSend(v20, "setContentSize:");

  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "canvasView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  v24 = v23;
  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v24, v25);

  -[SXFullscreenCaptionView fullSize](self, "fullSize");
  v27 = v26;
  v29 = v28;
  -[SXAutoSizedCanvasController cvc](self->_autoSizeCanvasController, "cvc");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "canvasLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUnscaledSize:", v27, v29);

  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "invalidateLayoutsAndFrames");

}

- (void)setNeedsLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView setNeedsLayout](&v4, sel_setNeedsLayout);
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayoutsAndFrames");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView layoutSubviews](&v5, sel_layoutSubviews);
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXFullscreenCaptionView;
  -[SXFullscreenCaptionView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[SXFullscreenCaptionView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SXFullscreenCaptionView updateFrameAnimated:](self, "updateFrameAnimated:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayoutsAndFrames");

  -[SXFullscreenCaptionView setTemporaryLayoutRect:](self, "setTemporaryLayoutRect:", 0.0, 0.0, width, height);
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits");
  v9 = v8;
  v11 = v10;

  -[SXFullscreenCaptionView setTemporaryLayoutRect:](self, "setTemporaryLayoutRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v12 = v11 + 16.0;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)updateFrameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MinY;
  double v16;
  double Height;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  _QWORD v23[9];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = a3;
  -[SXFullscreenCaptionView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SXFullscreenCaptionView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView determineFrameInSuperview:](self, "determineFrameInSuperview:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[SXFullscreenCaptionView frame](self, "frame");
    MinY = CGRectGetMinY(v24);
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = v14;
    v16 = CGRectGetMinY(v25);
    -[SXFullscreenCaptionView frame](self, "frame");
    Height = CGRectGetHeight(v26);
    v27.origin.x = v8;
    v27.origin.y = v10;
    v27.size.width = v12;
    v27.size.height = v14;
    v18 = CGRectGetHeight(v27);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __47__SXFullscreenCaptionView_updateFrameAnimated___block_invoke;
    v23[3] = &unk_24D688B48;
    v23[4] = self;
    *(CGFloat *)&v23[5] = v8;
    *(CGFloat *)&v23[6] = v10;
    *(CGFloat *)&v23[7] = v12;
    *(CGFloat *)&v23[8] = v14;
    v19 = MEMORY[0x219A070A8](v23);
    v20 = (void *)v19;
    if (v3)
    {
      v21 = MinY - v16;
      if (MinY - v16 < 0.0)
        v21 = -(MinY - v16);
      v22 = Height - v18;
      if (Height - v18 < 0.0)
        v22 = -(Height - v18);
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v19, 0, (v21 + v22) * 0.00017 + 0.16, 0.0);
    }
    else
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
    }

  }
}

uint64_t __47__SXFullscreenCaptionView_updateFrameAnimated___block_invoke(uint64_t a1)
{
  void *v1;
  CGRect v3;

  v1 = *(void **)(a1 + 32);
  v3 = CGRectIntegral(*(CGRect *)(a1 + 40));
  return objc_msgSend(v1, "setFrame:", v3.origin.x, v3.origin.y, v3.size.width, v3.size.height);
}

- (void)createScrollView
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollsToTop:", 0);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlwaysBounceVertical:", 1);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[SXFullscreenCaptionView backgroundView](self, "backgroundView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)initializeTangier
{
  SXTextTangierDocumentRoot *v3;
  SXTextTangierDocumentRoot *documentRoot;
  SXAutoSizedCanvasController *v5;
  SXTextTangierDocumentRoot *v6;
  void *v7;
  SXAutoSizedCanvasController *v8;
  SXAutoSizedCanvasController *autoSizeCanvasController;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SXTangierDragItemProvider *v25;

  v3 = objc_alloc_init(SXTextTangierDocumentRoot);
  documentRoot = self->_documentRoot;
  self->_documentRoot = v3;

  v25 = objc_alloc_init(SXTangierDragItemProvider);
  v5 = [SXAutoSizedCanvasController alloc];
  v6 = self->_documentRoot;
  -[SXFullscreenCaptionView actionHandler](self, "actionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXAutoSizedCanvasController initWithDocumentRoot:actionHandler:dragItemProvider:](v5, "initWithDocumentRoot:actionHandler:dragItemProvider:", v6, v7, v25);
  autoSizeCanvasController = self->_autoSizeCanvasController;
  self->_autoSizeCanvasController = v8;

  -[SXAutoSizedCanvasController setDelegate:](self->_autoSizeCanvasController, "setDelegate:", self);
  -[SXAutoSizedCanvasController canvasView](self->_autoSizeCanvasController, "canvasView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClipsToBounds:", 0);

  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[SXAutoSizedCanvasController canvasView](self->_autoSizeCanvasController, "canvasView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAutoSizedCanvasController canvasView](self->_autoSizeCanvasController, "canvasView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  -[SXAutoSizedCanvasController canvasView](self->_autoSizeCanvasController, "canvasView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOpaque:", 0);

  v19 = *MEMORY[0x24BDBF148];
  v20 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[SXAutoSizedCanvasController cvc](self->_autoSizeCanvasController, "cvc");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "canvasLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnscaledSize:", v19, v20);

  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAutoSizedCanvasController canvasView](self->_autoSizeCanvasController, "canvasView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

}

- (void)renderCaptionInTangier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SXTextTangierStorage *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SXTextTangierStorage *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SXStandaloneTextInfo *v39;
  void *v40;
  SXStandaloneTextInfo *v41;
  SXStandaloneTextLayout *v42;
  void *v43;
  SXStandaloneTextLayout *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  -[SXFullscreenCaptionView captionLayout](self, "captionLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXFullscreenCaptionView captionLayout](self, "captionLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView captionLayout](self, "captionLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterLayout:", v8);

  }
  -[SXFullscreenCaptionView caption](self, "caption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption text]((uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BEB3B70]);
    -[TSPObject context](self->_documentRoot, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView caption](self, "caption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaption text]((uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextTangierDocumentRoot stylesheet](self->_documentRoot, "stylesheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v11, "initWithContext:string:stylesheet:kind:", v12, v14, v15, 3);

    v16 = (void *)objc_opt_class();
    -[SXFullscreenCaptionView caption](self, "caption");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView textSource](self, "textSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentTextStyleForTextSource:inheritingFromDefaultStyles:", v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_applyStyle:toStorage:", v19, v54);

    -[SXFullscreenCaptionView textSourceFactory](self, "textSourceFactory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView caption](self, "caption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaption text]((uint64_t)v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView caption](self, "caption");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createTextSourceWithString:dataSource:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView setTextSource:](self, "setTextSource:", v24);

    v25 = [SXTextTangierStorage alloc];
    -[SXFullscreenCaptionView documentRoot](self, "documentRoot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView documentRoot](self, "documentRoot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stylesheet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView textSource](self, "textSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "string");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView textSource](self, "textSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "locale");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SXTextTangierStorage initWithContext:stylesheet:storageKind:string:locale:](v25, "initWithContext:stylesheet:storageKind:string:locale:", v27, v29, 3, v31, v33);
    -[SXFullscreenCaptionView setTextStorage:](self, "setTextStorage:", v34);

    -[SXFullscreenCaptionView textSource](self, "textSource");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView textStorage](self, "textStorage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "applyStylingOnTextTangierStorage:", v36);

    -[SXFullscreenCaptionView textSource](self, "textSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView textStorage](self, "textStorage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "applyAdditionsOnTextTangierStorage:", v38);

    v39 = [SXStandaloneTextInfo alloc];
    -[SXFullscreenCaptionView textStorage](self, "textStorage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[SXStandaloneTextInfo initWithStorage:](v39, "initWithStorage:", v40);
    -[SXFullscreenCaptionView setCaptionInfo:](self, "setCaptionInfo:", v41);

    v42 = [SXStandaloneTextLayout alloc];
    -[SXFullscreenCaptionView captionInfo](self, "captionInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[TSDContainerLayout initWithInfo:](v42, "initWithInfo:", v43);
    -[SXFullscreenCaptionView setCaptionLayout:](self, "setCaptionLayout:", v44);

    -[SXFullscreenCaptionView captionLayout](self, "captionLayout");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setDelegate:", self);

    -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "icc");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView captionLayout](self, "captionLayout");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "preregisterLayout:", v49);

    -[SXFullscreenCaptionView captionInfo](self, "captionInfo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "icc");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setInfosToDisplay:", v51);

  }
}

+ (id)_overridePropertiesWithComponentStyle:(id)a3 storage:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", a3, a4, 15.0, *MEMORY[0x24BDF7888]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BEB3AE8]);
  objc_msgSend(v4, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v8 = v7;
  objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB3C40], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithPropertiesAndValues:", 16, v6, 17, v8, 18, v9, 37, v10, 98, v11, 35, 0xBF978D4FDF3B645ALL, 0);

  return v12;
}

+ (void)_applyStyle:(id)a3 toStorage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "stylesheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleWithIdentifier:", CFSTR("paragraph-style-default"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_overridePropertiesWithComponentStyle:storage:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stylesheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "variationOfStyle:propertyMap:", v14, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "range");
  objc_msgSend(v6, "setParagraphStyle:forCharRange:undoTransaction:", v11, v12, v13, 0);

}

- (double)marginForTextLayout:(id)a3
{
  return 10.0;
}

- (double)widthForTextLayout:(id)a3
{
  double v4;
  CGRect v6;

  -[SXFullscreenCaptionView temporaryLayoutRect](self, "temporaryLayoutRect", a3);
  if (CGRectIsInfinite(v6))
    -[SXFullscreenCaptionView frame](self, "frame");
  else
    -[SXFullscreenCaptionView temporaryLayoutRect](self, "temporaryLayoutRect");
  return v4;
}

- (CGPoint)positionForTextLayout:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setExpansionMode:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v5 = *(void **)&a3;
  self->_expansionMode = a3;
  -[SXFullscreenCaptionView updateFrameAnimated:](self, "updateFrameAnimated:", a4);
  if ((_DWORD)v5 == 2)
  {
    -[SXFullscreenCaptionView scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSize");
    v10 = v9;
    -[SXFullscreenCaptionView frame](self, "frame");
    v8 = v10 > v11;
    v7 = 1;
  }
  else
  {
    if ((_DWORD)v5 == 1)
    {
      -[SXFullscreenCaptionView scrollView](self, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContentOffset:animated:", v4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

    }
    v7 = 0;
    v8 = 0;
  }
  -[SXFullscreenCaptionView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollEnabled:", v8);

  if ((_DWORD)v7)
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cvc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", v7);

}

- (BOOL)expanded
{
  return -[SXFullscreenCaptionView expansionMode](self, "expansionMode") != 0;
}

- (void)setupGestureRecognizers
{
  UISwipeGestureRecognizer *v3;
  UISwipeGestureRecognizer *swipeGestureRecognizer;
  void *v5;
  void *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v10;
  id v11;

  v3 = (UISwipeGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E18]), "initWithTarget:action:", self, sel_handleSwipeGestureRecognizer_);
  swipeGestureRecognizer = self->_swipeGestureRecognizer;
  self->_swipeGestureRecognizer = v3;

  -[SXFullscreenCaptionView swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[SXFullscreenCaptionView swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDirection:", 4);

  -[SXFullscreenCaptionView swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView addGestureRecognizer:](self, "addGestureRecognizer:", v7);

  v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleTapGestureRecognizer_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  -[SXFullscreenCaptionView tapGestureRecognizer](self, "tapGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[SXFullscreenCaptionView tapGestureRecognizer](self, "tapGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaptionView addGestureRecognizer:](self, "addGestureRecognizer:", v11);

}

- (void)handleTapGestureRecognizer:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = -[SXFullscreenCaptionView expansionMode](self, "expansionMode", a3);
  if (!-[SXFullscreenCaptionView forceFullExpandsionMode](self, "forceFullExpandsionMode"))
  {
    if (v4 == 1)
      v5 = 2;
    else
      v5 = 1;
    -[SXFullscreenCaptionView setExpansionMode:animated:](self, "setExpansionMode:animated:", v5, 1);
  }
}

- (void)handleSwipeGestureRecognizer:(id)a3
{
  if (!-[SXFullscreenCaptionView forceFullExpandsionMode](self, "forceFullExpandsionMode", a3))
    -[SXFullscreenCaptionView setExpansionMode:animated:](self, "setExpansionMode:animated:", 2, 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  -[SXFullscreenCaptionView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4
    && (-[SXFullscreenCaptionView delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    -[SXFullscreenCaptionView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaptionView tapGestureRecognizer](self, "tapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "captionView:tapGestureRecognizerShouldBegin:", self, v9);

  }
  else
  {
    v10 = 1;
  }
  -[SXFullscreenCaptionView swipeGestureRecognizer](self, "swipeGestureRecognizer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
    v10 = -[SXFullscreenCaptionView expansionMode](self, "expansionMode") == 1;

  return v10;
}

- (BOOL)forceFullExpandsionMode
{
  double v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[SXFullscreenCaptionView frame](self, "frame");
  v4 = v3;
  -[SXFullscreenCaptionView autoSizeCanvasController](self, "autoSizeCanvasController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = v4 <= v6 * 4.5 + 15.5;

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;

  objc_msgSend(a3, "contentOffset");
  if (v4 < -40.0)
    -[SXFullscreenCaptionView setExpansionMode:animated:](self, "setExpansionMode:animated:", 1, 1);
}

- (SXFullscreenCaptionViewDelegate)delegate
{
  return (SXFullscreenCaptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXFullscreenCaption)caption
{
  return self->_caption;
}

- (unint64_t)viewIndex
{
  return self->_viewIndex;
}

- (int)expansionMode
{
  return self->_expansionMode;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXTextSourceFactory)textSourceFactory
{
  return self->_textSourceFactory;
}

- (SXAutoSizedCanvasController)autoSizeCanvasController
{
  return self->_autoSizeCanvasController;
}

- (void)setAutoSizeCanvasController:(id)a3
{
  objc_storeStrong((id *)&self->_autoSizeCanvasController, a3);
}

- (SXTextTangierDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_storeStrong((id *)&self->_documentRoot, a3);
}

- (SXStandaloneTextInfo)captionInfo
{
  return self->_captionInfo;
}

- (void)setCaptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_captionInfo, a3);
}

- (SXStandaloneTextLayout)captionLayout
{
  return self->_captionLayout;
}

- (void)setCaptionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_captionLayout, a3);
}

- (CGRect)temporaryLayoutRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_temporaryLayoutRect.origin.x;
  y = self->_temporaryLayoutRect.origin.y;
  width = self->_temporaryLayoutRect.size.width;
  height = self->_temporaryLayoutRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTemporaryLayoutRect:(CGRect)a3
{
  self->_temporaryLayoutRect = a3;
}

- (CGSize)fullSize
{
  double width;
  double height;
  CGSize result;

  width = self->_fullSize.width;
  height = self->_fullSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFullSize:(CGSize)a3
{
  self->_fullSize = a3;
}

- (UIEdgeInsets)fullInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fullInsets.top;
  left = self->_fullInsets.left;
  bottom = self->_fullInsets.bottom;
  right = self->_fullInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFullInsets:(UIEdgeInsets)a3
{
  self->_fullInsets = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, a3);
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (void)setTextSource:(id)a3
{
  objc_storeStrong((id *)&self->_textSource, a3);
}

- (SXTextTangierStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
  objc_storeStrong((id *)&self->_textStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_captionLayout, 0);
  objc_storeStrong((id *)&self->_captionInfo, 0);
  objc_storeStrong((id *)&self->_documentRoot, 0);
  objc_storeStrong((id *)&self->_autoSizeCanvasController, 0);
  objc_storeStrong((id *)&self->_textSourceFactory, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
