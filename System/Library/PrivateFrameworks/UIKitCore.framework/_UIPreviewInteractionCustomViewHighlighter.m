@implementation _UIPreviewInteractionCustomViewHighlighter

- (void)prepareHighlightWithPreviewingContext:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "sourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredSourceViewRectInCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v20, "customViewForInteractiveHighlight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionCustomViewHighlighter setCustomViewFlipsHorizontalAxis:](self, "setCustomViewFlipsHorizontalAxis:", objc_msgSend(v14, "flipsHorizontalAxis"));

  objc_msgSend(v4, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "flipsHorizontalAxis");

  if (v16)
  {
    v17 = -[_UIPreviewInteractionCustomViewHighlighter customViewFlipsHorizontalAxis](self, "customViewFlipsHorizontalAxis") ^ 1;
    objc_msgSend(v13, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFlipsHorizontalAxis:", v17);

  }
  objc_msgSend(v20, "sourceView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v13);

  -[_UIPreviewInteractionCustomViewHighlighter setCustomView:](self, "setCustomView:", v13);
}

- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5
{
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  -[_UIPreviewInteractionCustomViewHighlighter customView](self, "customView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIPreviewInteractionCustomViewHighlighter customViewFlipsHorizontalAxis](self, "customViewFlipsHorizontalAxis");
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFlipsHorizontalAxis:", v8);

  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v6, "addSubview:", v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __126___UIPreviewInteractionCustomViewHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v13 = v7;
    +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 4, v12, 0, 0.2, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)finalizeHighlightForPreviewingContext:(id)a3
{
  id v3;

  -[_UIPreviewInteractionCustomViewHighlighter customView](self, "customView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (UIView)customView
{
  return self->_customView;
}

- (void)setCustomView:(id)a3
{
  objc_storeStrong((id *)&self->_customView, a3);
}

- (BOOL)customViewFlipsHorizontalAxis
{
  return self->_customViewFlipsHorizontalAxis;
}

- (void)setCustomViewFlipsHorizontalAxis:(BOOL)a3
{
  self->_customViewFlipsHorizontalAxis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
}

@end
