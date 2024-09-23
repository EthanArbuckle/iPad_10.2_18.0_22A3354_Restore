@implementation LineGraphView

- (LineGraphView)initWithFrame:(CGRect)a3
{
  LineGraphView *v3;
  LineGraphView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LineGraphView;
  v3 = -[LineGraphView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4 = v3;
  if (v3)
    -[LineGraphView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)setSelectedLineImage:(id)a3
{
  UIImage **p_lineImage;
  TintedView *tintedLineView;
  UIImage *v7;

  p_lineImage = &self->_lineImage;
  v7 = (UIImage *)a3;
  if (*p_lineImage != v7)
  {
    objc_storeStrong((id *)&self->_lineImage, a3);
    tintedLineView = self->_tintedLineView;
    if (tintedLineView)
      -[TintedView setImage:](tintedLineView, "setImage:", *p_lineImage);
  }

}

- (void)setGraphImageSet:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "lineGraphImage");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGImage");
  -[LineGraphView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

  objc_msgSend(v4, "highlightOverlayImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[LineGraphView setSelectedLineImage:](self, "setSelectedLineImage:", v8);
}

- (void)setShowingSelectedLine:(BOOL)a3
{
  _BOOL4 v3;
  TintedView *v5;
  TintedView *tintedLineView;
  id v7;
  UIView *v8;
  UIView *tintedLineClipView;

  if (self->_showingTintedLine != a3)
  {
    v3 = a3;
    self->_showingTintedLine = a3;
    if (a3)
    {
      if (!self->_tintedLineView)
      {
        v5 = objc_alloc_init(TintedView);
        tintedLineView = self->_tintedLineView;
        self->_tintedLineView = v5;

        v7 = objc_alloc(MEMORY[0x24BDF6F90]);
        -[LineGraphView bounds](self, "bounds");
        v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
        tintedLineClipView = self->_tintedLineClipView;
        self->_tintedLineClipView = v8;

        -[UIView setClipsToBounds:](self->_tintedLineClipView, "setClipsToBounds:", 1);
        -[UIView addSubview:](self->_tintedLineClipView, "addSubview:", self->_tintedLineView);
        -[UIView setAlpha:](self->_tintedLineClipView, "setAlpha:", 0.0);
        -[LineGraphView addSubview:](self, "addSubview:", self->_tintedLineClipView);
      }
      if (self->_lineImage)
        -[TintedView setImage:](self->_tintedLineView, "setImage:");
    }
    -[UIView setAlpha:](self->_tintedLineClipView, "setAlpha:", (double)v3);
  }
}

- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TintedView *tintedLineView;

  -[TintedView layer](self->_tintedLineView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UIView layer](self->_tintedLineClipView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  -[LineGraphView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView setFrame:](self->_tintedLineClipView, "setFrame:", a3, 0.0, a4 - a3);
  tintedLineView = self->_tintedLineView;
  -[LineGraphView convertRect:toView:](self, "convertRect:toView:", self->_tintedLineClipView, v10, v12, v14, v16);
  -[TintedView setFrame:](tintedLineView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedLineView, 0);
  objc_storeStrong((id *)&self->_tintedLineClipView, 0);
  objc_storeStrong((id *)&self->_lineImage, 0);
}

@end
