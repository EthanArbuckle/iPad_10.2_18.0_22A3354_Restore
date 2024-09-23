@implementation SXDocumentStyleRenderer

- (SXDocumentStyleRenderer)initWithViewport:(id)a3 gradientFactory:(id)a4
{
  id v7;
  id v8;
  SXDocumentStyleRenderer *v9;
  SXDocumentStyleRenderer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDocumentStyleRenderer;
  v9 = -[SXDocumentStyleRenderer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_gradientFactory, a4);
  }

  return v10;
}

- (void)applyStyle:(id)a3 onView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentStyleRenderer applyBackgroundColorForStyle:onView:](self, "applyBackgroundColorForStyle:onView:", v13, v7);

  objc_msgSend(v6, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDocumentStyleRenderer applyTopBackgroundForStyle:onView:](self, "applyTopBackgroundForStyle:onView:", v13, v8);

  if (v13
    && (objc_msgSend(v13, "backgroundColor"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "brightness"),
        v11 = v10,
        v9,
        v11 <= 0.5))
  {
    v12 = 2;
  }
  else
  {
    v12 = 1;
  }
  objc_msgSend(v6, "setIndicatorStyle:", v12);

}

- (void)applyBackgroundColorForStyle:(id)a3 onView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "setBackgroundColor:", v9);
}

- (void)applyTopBackgroundForStyle:(id)a3 onView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXGradientView *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "topBackgroundGradient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_10;
    -[SXDocumentStyleRenderer gradientFactory](self, "gradientFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topBackgroundGradient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorStops");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "NSArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topBackgroundGradient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "angle");
    objc_msgSend(v9, "gradientForColorStops:angle:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[SXGradientView initWithGradient:]([SXGradientView alloc], "initWithGradient:", v14);
    -[SXDocumentStyleRenderer setTopBackgroundView:](self, "setTopBackgroundView:", v15);
    goto LABEL_8;
  }
  objc_msgSend(v25, "topBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (!v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDF6F90]);
      v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[SXDocumentStyleRenderer setTopBackgroundView:](self, "setTopBackgroundView:", v19);

    }
    -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topBackgroundColor");
    v15 = (SXGradientView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if (v17)
  {
    -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeFromSuperview");

    -[SXDocumentStyleRenderer setTopBackgroundView:](self, "setTopBackgroundView:", 0);
    -[SXDocumentStyleRenderer viewport](self, "viewport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeViewportChangeListener:forOptions:", self, 4);
    goto LABEL_9;
  }
LABEL_10:
  -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v21);

    -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendSubviewToBack:", v22);

    -[SXDocumentStyleRenderer layoutTopBackgroundView](self, "layoutTopBackgroundView");
    -[SXDocumentStyleRenderer viewport](self, "viewport");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addViewportChangeListener:forOptions:", self, 4);

  }
}

- (void)layoutTopBackgroundView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[SXDocumentStyleRenderer topBackgroundView](self, "topBackgroundView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SXDocumentStyleRenderer viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = -v4;
  -[SXDocumentStyleRenderer viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 - v7;
  -[SXDocumentStyleRenderer viewport](self, "viewport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  -[SXDocumentStyleRenderer viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "setFrame:", 0.0, v8, v11);

}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXGradientFactory)gradientFactory
{
  return self->_gradientFactory;
}

- (UIView)topBackgroundView
{
  return self->_topBackgroundView;
}

- (void)setTopBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_topBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBackgroundView, 0);
  objc_storeStrong((id *)&self->_gradientFactory, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
