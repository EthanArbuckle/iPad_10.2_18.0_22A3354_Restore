@implementation _UIPreviewInteractionSystemHighlighter

- (void)prepareHighlightWithPreviewingContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = -[_UIPreviewInteractionSystemHighlighter _newSnapshotViewForPreviewingContext:afterScreenUpdates:](self, "_newSnapshotViewForPreviewingContext:afterScreenUpdates:", v4, 0);
  objc_msgSend(v4, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v6);
  -[_UIPreviewInteractionSystemHighlighter setInitialSnapshotView:](self, "setInitialSnapshotView:", v6);

}

- (id)highlightShouldBeginInContainerView:(id)a3 presentationContainerView:(id)a4 previewingContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UIView *v38;
  void *v39;
  void *v40;
  _QWORD v42[5];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "sourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "flipsHorizontalAxis");

  objc_msgSend(v10, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPreviewInteractionSystemHighlighter initialSnapshotView](self, "initialSnapshotView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[_UIPreviewInteractionSystemHighlighter initialSnapshotView](self, "initialSnapshotView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFlipsHorizontalAxis:", v13);

  -[_UIPreviewInteractionSystemHighlighter initialSnapshotView](self, "initialSnapshotView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v25);

  v26 = -[_UIPreviewInteractionSystemHighlighter _newSnapshotViewForPreviewingContext:afterScreenUpdates:](self, "_newSnapshotViewForPreviewingContext:afterScreenUpdates:", v9, 1);
  objc_msgSend(v10, "bounds");
  objc_msgSend(v26, "setFrame:");
  -[_UIPreviewInteractionSystemHighlighter setUpdatedSnapshotView:](self, "setUpdatedSnapshotView:", v26);
  -[_UIPreviewInteractionSystemHighlighter updatedSnapshotView](self, "updatedSnapshotView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFlipsHorizontalAxis:", v13);

  -[_UIPreviewInteractionSystemHighlighter initialSnapshotView](self, "initialSnapshotView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSubview:belowSubview:", v26, v29);

  objc_msgSend(v9, "sourceView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "backgroundColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v31);

  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __122___UIPreviewInteractionSystemHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke;
  v42[3] = &unk_1E16B1B28;
  v42[4] = self;
  +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:](UIViewPropertyAnimator, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 4, v42, 0, 0.2, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  if (-[_UIPreviewInteractionSystemHighlighter blinderViewEnabled](self, "blinderViewEnabled"))
  {
    objc_msgSend(v9, "preferredSourceViewRectInCoordinateSpace:", v33);
    v38 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v34, v35, v36, v37);
    objc_msgSend(v9, "sourceView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "backgroundColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v40);

    objc_msgSend(v33, "insertSubview:atIndex:", v38, 0);
    -[_UIPreviewInteractionSystemHighlighter setBlinderView:](self, "setBlinderView:", v38);

  }
  return v32;
}

- (void)finalizeHighlightForPreviewingContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIPreviewInteractionSystemHighlighter initialSnapshotView](self, "initialSnapshotView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIPreviewInteractionSystemHighlighter updatedSnapshotView](self, "updatedSnapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[_UIPreviewInteractionSystemHighlighter blinderView](self, "blinderView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

}

- (id)_newSnapshotViewForPreviewingContext:(id)a3 afterScreenUpdates:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSourceViewRectInCoordinateSpace:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, v8, v10, v12, v14, 0.0, 0.0, 0.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  return v15;
}

- (UIView)initialSnapshotView
{
  return self->_initialSnapshotView;
}

- (void)setInitialSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_initialSnapshotView, a3);
}

- (UIView)updatedSnapshotView
{
  return self->_updatedSnapshotView;
}

- (void)setUpdatedSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_updatedSnapshotView, a3);
}

- (BOOL)blinderViewEnabled
{
  return self->_blinderViewEnabled;
}

- (void)setBlinderViewEnabled:(BOOL)a3
{
  self->_blinderViewEnabled = a3;
}

- (UIView)blinderView
{
  return self->_blinderView;
}

- (void)setBlinderView:(id)a3
{
  objc_storeStrong((id *)&self->_blinderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinderView, 0);
  objc_storeStrong((id *)&self->_updatedSnapshotView, 0);
  objc_storeStrong((id *)&self->_initialSnapshotView, 0);
}

@end
