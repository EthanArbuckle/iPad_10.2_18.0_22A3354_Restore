@implementation UIMovieScrubber

+ (BOOL)_allowActionsToQueue
{
  return 1;
}

- (UIMovieScrubber)init
{
  return -[UIMovieScrubber initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 39.0);
}

- (UIMovieScrubber)initWithFrame:(CGRect)a3
{
  UIMovieScrubber *v3;
  UIMovieScrubber *v4;
  void *v5;
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIMovieScrubber;
  v3 = -[UIControl initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, 39.0);
  v4 = v3;
  if (v3)
  {
    *((_BYTE *)&v3->_sliderFlags + 8) |= 0x10u;
    *(_BYTE *)&v3->_sliderFlags |= 1u;
    v3->_maximumValue = 0.0;
    v3->_value = 0.0;
    v3->_zoomDelay = 1.0;
    v3->_showTimeViews = 0;
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

    v6 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v4, sel__handlePanGesture_);
    panGestureRecognizer = v4->_panGestureRecognizer;
    v4->_panGestureRecognizer = v6;

    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v4->_panGestureRecognizer);
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 1);
    -[UIControl addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__sliderValueDidChange_, 4096);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIMovieScrubberTrackView setDataSource:](self->_trackView, "setDataSource:", 0);
  -[UIMovieScrubberTrackView setDelegate:](self->_trackView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubber;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  __int16 v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 0x4000;
    else
      v6 = 0;
    *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xBFFF | v6;
    -[UIMovieScrubber reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (UIMovieScrubberDataSource)dataSource
{
  return (UIMovieScrubberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)reloadData
{
  *(_BYTE *)&self->_sliderFlags |= 8u;
  -[UIMovieScrubberTrackView clear](self->_trackView, "clear");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  char v19;
  __int16 v20;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_sliderFlags = &self->_sliderFlags;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 256;
    else
      v13 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFEFF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 128;
    else
      v14 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFF7F | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 512;
    else
      v15 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFDFF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 1024;
    else
      v16 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xFBFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 2048;
    else
      v17 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xF7FF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 4096;
    else
      v18 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xEFFF | v18;
    v19 = objc_opt_respondsToSelector();
    v5 = obj;
    if ((v19 & 1) != 0)
      v20 = 0x2000;
    else
      v20 = 0;
    *((_WORD *)p_sliderFlags + 10) = *((_WORD *)p_sliderFlags + 10) & 0xDFFF | v20;
  }

}

- (UIMovieScrubberDelegate)delegate
{
  return (UIMovieScrubberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)thumbIsVisible
{
  return (*((unsigned __int8 *)&self->_sliderFlags + 8) >> 4) & 1;
}

- (void)setThumbIsVisible:(BOOL)a3
{
  char v3;
  char v4;
  _QWORD v5[5];

  v3 = *((_BYTE *)&self->_sliderFlags + 8);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *((_BYTE *)&self->_sliderFlags + 8) = v3 & 0xEF | v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__UIMovieScrubber_setThumbIsVisible___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.25);
  }
}

uint64_t __37__UIMovieScrubber_setThumbIsVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", (double)((*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 712) >> 4) & 1));
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;
  UIMovieScrubberEditingView *editingView;

  v3 = a3;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 8) != 0)
  {
    self->_editable = a3;
  }
  else
  {
    if (!a3)
      -[UIMovieScrubber setEditing:](self, "setEditing:", 0);
    self->_editable = v3;
    editingView = self->_editingView;
    if (editingView)
    {
      -[UIMovieScrubberEditingView setEnabled:](editingView, "setEnabled:", v3);
    }
    else
    {
      -[UIMovieScrubber _initSubviews](self, "_initSubviews");
      -[UIMovieScrubber layoutSubviews](self, "layoutSubviews");
    }
  }
}

- (void)setContinuous:(BOOL)a3
{
  *(_BYTE *)&self->_sliderFlags = *(_BYTE *)&self->_sliderFlags & 0xFE | a3;
}

- (BOOL)isContinuous
{
  return *(_BYTE *)&self->_sliderFlags & 1;
}

- (void)_animateAfterEdit:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UIMovieScrubberEditingView *v21;
  double v22;
  uint64_t v23;
  UIMovieScrubberEditingView *v24;
  _QWORD v25[5];
  UIMovieScrubberEditingView *v26;
  BOOL v27;
  _QWORD v28[4];
  UIMovieScrubberEditingView *v29;
  UIMovieScrubber *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;

  v3 = a3;
  -[UIView frame](self->_editingView, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIMovieScrubber _editingRect](self, "_editingRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (self->_editable)
  {
    v21 = -[UIMovieScrubberEditingView initWithFrame:]([UIMovieScrubberEditingView alloc], "initWithFrame:", v6, v8, v10, v12);
    -[UIMovieScrubberEditingView layoutSubviews](v21, "layoutSubviews");
    -[UIView setUserInteractionEnabled:](v21, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v21, "setAlpha:", 0.0);
    -[UIMovieScrubberEditingView setEnabled:](v21, "setEnabled:", self->_editable);
    -[UIMovieScrubberEditingView setEdgeInset:](v21, "setEdgeInset:", self->_edgeInset);
    -[UIView insertSubview:below:](self, "insertSubview:below:", v21, self->_thumbView);
  }
  else
  {
    v21 = 0;
  }
  *((_BYTE *)&self->_sliderFlags + 8) |= 8u;
  if (v3)
    v22 = 0.5;
  else
    v22 = 0.25;
  v23 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __37__UIMovieScrubber__animateAfterEdit___block_invoke;
  v28[3] = &unk_1E16B7080;
  v31 = v14;
  v32 = v16;
  v33 = v18;
  v34 = v20;
  v29 = v21;
  v30 = self;
  v35 = v3;
  v25[0] = v23;
  v25[1] = 3221225472;
  v25[2] = __37__UIMovieScrubber__animateAfterEdit___block_invoke_2;
  v25[3] = &unk_1E16B7110;
  v27 = v3;
  v25[4] = self;
  v26 = v29;
  v24 = v29;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v28, v25, v22, 0.0);

}

uint64_t __37__UIMovieScrubber__animateAfterEdit___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 480), "layoutSubviews");
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 472);
  if (*(_BYTE *)(a1 + 80))
    return objc_msgSend(v2, "setEditing:", 0);
  else
    return objc_msgSend(v2, "animateFillFramesAway");
}

uint64_t __37__UIMovieScrubber__animateAfterEdit___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_trimAnimationDidStop:glassView:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  unsigned int v7;
  _BOOL4 v8;
  char v9;
  double v10;
  double v11;
  double minTrimmedLength;
  double v13;
  double v14;
  double v15;
  double maxTrimmedLength;
  UIMovieScrubberEditingView *editingView;
  id WeakRetained;

  if (self->_editable)
  {
    v4 = a3;
    p_sliderFlags = &self->_sliderFlags;
    v7 = *((unsigned __int8 *)&self->_sliderFlags + 8);
    if (a3 != v7 >> 7)
    {
      v8 = a4;
      if (a3)
        v9 = 0x80;
      else
        v9 = 0;
      *((_BYTE *)&self->_sliderFlags + 8) = v9 & 0x80 | v7 & 0x7F;
      if ((*(_BYTE *)p_sliderFlags & 8) != 0)
        -[UIMovieScrubber layoutSubviews](self, "layoutSubviews");
      if (!v8 || v4)
        -[UIMovieScrubber setThumbIsVisible:](self, "setThumbIsVisible:", !v4);
      if (*((char *)p_sliderFlags + 8) < 0)
        v10 = 0.0;
      else
        v10 = 1.0;
      -[UIView setAlpha:](self->_elapsedLabel, "setAlpha:", v10);
      -[UIView setAlpha:](self->_remainingLabel, "setAlpha:", v10);
      if (*((char *)p_sliderFlags + 8) < 0)
      {
        if (self->_maxTrimmedLength == 0.0)
        {
          -[UIMovieScrubber duration](self, "duration");
          self->_maxTrimmedLength = v11;
        }
        self->_trimStartValue = 0.0;
        minTrimmedLength = self->_minTrimmedLength;
        -[UIMovieScrubber duration](self, "duration");
        v14 = v13;
        -[UIView frame](self->_trackView, "frame");
        maxTrimmedLength = v14 / v15 * 13.0;
        if (minTrimmedLength > maxTrimmedLength)
          maxTrimmedLength = minTrimmedLength;
        self->_minTrimmedLength = maxTrimmedLength;
        if (maxTrimmedLength < self->_maxTrimmedLength)
          maxTrimmedLength = self->_maxTrimmedLength;
        self->_trimEndValue = maxTrimmedLength;
        -[UIMovieScrubberTrackView setEditing:](self->_trackView, "setEditing:", 1);
        -[UIMovieScrubber _editingRectForStartTime:endTime:](self, "_editingRectForStartTime:endTime:", self->_trimStartValue, self->_trimEndValue);
        -[UIView setFrame:](self->_editingView, "setFrame:");
        -[UIMovieScrubberEditingView setEditing:](self->_editingView, "setEditing:", 1);
        -[UIMovieScrubberTrackView setStartValue:](self->_trackView, "setStartValue:", self->_trimStartValue);
        -[UIMovieScrubberTrackView setEndValue:](self->_trackView, "setEndValue:", self->_trimEndValue);
        if (v8)
          -[UIMovieScrubberEditingView bounce](self->_editingView, "bounce");
        if ((*((_WORD *)p_sliderFlags + 10) & 0x80) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "movieScrubberDidBeginEditing:", self);

        }
      }
      else
      {
        -[UIMovieScrubber _cancelTrackPress:](self, "_cancelTrackPress:", 0);
        if (v8)
        {
          -[UIMovieScrubber animateCancelEdit](self, "animateCancelEdit");
        }
        else
        {
          -[UIMovieScrubberTrackView setEditing:](self->_trackView, "setEditing:", 0);
          editingView = self->_editingView;
          -[UIMovieScrubber _editingRect](self, "_editingRect");
          -[UIView setFrame:](editingView, "setFrame:");
          -[UIMovieScrubberEditingView setEditing:](self->_editingView, "setEditing:", 0);
        }
      }
    }
  }
}

- (void)animateAfterEdit
{
  -[UIMovieScrubber _animateAfterEdit:](self, "_animateAfterEdit:", 1);
}

- (void)animateCancelEdit
{
  -[UIMovieScrubber _animateAfterEdit:](self, "_animateAfterEdit:", 0);
}

- (void)_trimAnimationDidStop:(BOOL)a3 glassView:(id)a4
{
  _BOOL4 v4;
  UIMovieScrubberEditingView *v6;
  UIMovieScrubberEditingView *editingView;
  UIMovieScrubberEditingView *v8;
  id WeakRetained;

  v4 = a3;
  v6 = (UIMovieScrubberEditingView *)a4;
  *((_BYTE *)&self->_sliderFlags + 8) &= 0x77u;
  -[UIView removeFromSuperview](self->_editingView, "removeFromSuperview");
  editingView = self->_editingView;
  self->_editingView = v6;
  v8 = v6;

  -[UIMovieScrubberEditingView setEnabled:](self->_editingView, "setEnabled:", self->_editable);
  if (v4)
  {
    -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0, 0.0);
    -[UIMovieScrubber setThumbIsVisible:](self, "setThumbIsVisible:", 1);
    if ((*((_WORD *)&self->_sliderFlags + 10) & 0x200) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "movieScrubberEditingAnimationFinished:", self);

    }
  }
  else
  {
    -[UIMovieScrubber setThumbIsVisible:](self, "setThumbIsVisible:", 1);
  }
}

- (void)setEditing:(BOOL)a3
{
  -[UIMovieScrubber setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (BOOL)isEditing
{
  return *((unsigned __int8 *)&self->_sliderFlags + 8) >> 7;
}

- (void)setZoomAnimationDuration:(double)a3
{
  -[UIMovieScrubberTrackView setZoomAnimationDuration:](self->_trackView, "setZoomAnimationDuration:", a3);
}

- (void)_computeTrackRectForBounds:(CGRect)a3
{
  double height;
  double y;
  double edgeInset;
  double v7;
  double v8;
  UILabel *elapsedLabel;
  double v10;
  double v11;
  double v12;
  UILabel *remainingLabel;
  double v14;

  height = a3.size.height;
  y = a3.origin.y;
  edgeInset = self->_edgeInset;
  v7 = a3.origin.x + edgeInset;
  v8 = a3.size.width - (edgeInset + edgeInset);
  if ((*(_BYTE *)&self->_sliderFlags & 0x10) != 0 || !self->_showTimeViews)
  {
    v7 = v7 + 12.0;
    v8 = v8 + -24.0;
  }
  else
  {
    elapsedLabel = self->_elapsedLabel;
    if (elapsedLabel)
    {
      -[UIView frame](elapsedLabel, "frame");
      v12 = v10 + v11 + 5.0;
      v7 = v7 + v12;
      v8 = v8 - v12;
    }
    remainingLabel = self->_remainingLabel;
    if (remainingLabel)
    {
      -[UIView frame](remainingLabel, "frame");
      v8 = v8 - (v14 + 4.0);
    }
  }
  self->_trackRect.origin.x = v7;
  self->_trackRect.origin.y = y + 3.0;
  self->_trackRect.size.width = v8;
  self->_trackRect.size.height = height + -7.0;
}

- (CGRect)trackRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->_sliderFlags & 0x20) != 0)
  {
    -[UIView bounds](self, "bounds");
    -[UIMovieScrubber _computeTrackRectForBounds:](self, "_computeTrackRectForBounds:");
    *(_BYTE *)&self->_sliderFlags &= ~0x20u;
  }
  x = self->_trackRect.origin.x;
  y = self->_trackRect.origin.y;
  width = self->_trackRect.size.width;
  height = self->_trackRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_editingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIMovieScrubber _editingRectForStartTime:endTime:](self, "_editingRectForStartTime:endTime:", self->_minimumValue, self->_maximumValue);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_editingRectForStartTime:(double)a3 endTime:(double)a4
{
  double v7;
  double v8;
  double minimumValue;
  double maximumValue;
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
  CGRect result;

  -[UIMovieScrubber trackRect](self, "trackRect");
  minimumValue = self->_minimumValue;
  maximumValue = self->_maximumValue;
  v11 = maximumValue - minimumValue;
  if (maximumValue - minimumValue <= 0.0)
  {
    v15 = 0.0;
  }
  else
  {
    if (a4 >= a3)
      v12 = a3;
    else
      v12 = a4;
    if (a4 >= a3)
      v13 = a4;
    else
      v13 = a3;
    if (v13 >= maximumValue)
      v13 = self->_maximumValue;
    if (v12 < minimumValue)
      v12 = self->_minimumValue;
    v14 = rint(v8 * ((v12 - minimumValue) / v11));
    v7 = v7 + v14;
    v15 = v8 - (v14 + rint(v8 * ((maximumValue - v13) / v11)));
  }
  v16 = self->_edgeInset + 12.0;
  v17 = v7 - v16;
  v18 = v15 + v16 + v16;
  v19 = 36.0;
  v20 = 1.0;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v20;
  result.origin.x = v17;
  return result;
}

- (CGRect)thumbRectForValue:(double)a3
{
  double minimumValue;
  double maximumValue;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  minimumValue = self->_minimumValue;
  maximumValue = self->_maximumValue;
  -[UIView frame](self->_trackView, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = self->_maximumValue;
  v14 = self->_minimumValue;
  v15 = 0.0;
  if (v13 != v14)
  {
    if (minimumValue <= a3)
      v16 = a3;
    else
      v16 = minimumValue;
    if (v16 > maximumValue)
      v16 = maximumValue;
    v15 = (v16 - v14) / (v13 - v14);
  }
  _GetScrubberThumbImage();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  v21 = v20;

  v22 = v8 + round(v15 * (v12 - v19));
  v23 = v10 + -3.0;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)UIMovieScrubber;
  -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.origin.x = v9;
  v18.origin.y = v11;
  v18.size.width = v13;
  v18.size.height = v15;
  if (!CGRectEqualToRect(v17, v18))
  {
    *(_BYTE *)&self->_sliderFlags |= 0x20u;
    if (*((char *)&self->_sliderFlags + 8) < 0)
      -[UIMovieScrubber _editingRectForStartTime:endTime:](self, "_editingRectForStartTime:endTime:", self->_trimStartValue, self->_trimEndValue);
    else
      -[UIMovieScrubber _editingRect](self, "_editingRect");
    -[UIView setFrame:](self->_editingView, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  if (result.width < 35.0)
    result.width = 35.0;
  v3 = 39.0;
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self, "bounds");
  -[UIMovieScrubber sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  double v4;
  double v5;
  char v6;
  char v7;
  id WeakRetained;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIMovieScrubberTrackView *trackView;
  int v19;
  UIMovieScrubberEditingView *editingView;
  objc_super v21;

  p_sliderFlags = &self->_sliderFlags;
  if ((*(_BYTE *)&self->_sliderFlags & 4) == 0 && (*((_BYTE *)&self->_sliderFlags + 8) & 3) == 0)
  {
    -[UIView bounds](self, "bounds");
    v5 = v4;
    v6 = *(_BYTE *)p_sliderFlags;
    v7 = *(_BYTE *)p_sliderFlags | 0x20;
    *(_BYTE *)p_sliderFlags = v7;
    if ((v6 & 8) != 0)
    {
      *(_BYTE *)p_sliderFlags = v7 & 0xF7;
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(WeakRetained, "movieScrubberDuration:", self);
      -[UIMovieScrubber setDuration:](self, "setDuration:");

      -[UIMovieScrubberTrackView reloadData](self->_trackView, "reloadData");
    }
    -[UIMovieScrubber duration](self, "duration");
    if (v9 != 0.0)
    {
      if (!self->_thumbView)
      {
        -[UIMovieScrubber _initSubviews](self, "_initSubviews");
        -[UIMovieScrubberTrackView reloadData](self->_trackView, "reloadData");
      }
      -[UIMovieScrubber _updateTimes](self, "_updateTimes");
      -[UIView sizeToFit](self->_elapsedLabel, "sizeToFit");
      -[UIView sizeToFit](self->_remainingLabel, "sizeToFit");
      v10 = *(double *)&layoutSubviews___timeLabelFontAscent;
      if (*(double *)&layoutSubviews___timeLabelFontAscent == 0.0)
      {
        objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ascender");
        layoutSubviews___timeLabelFontAscent = v12;

      }
      -[UIMovieScrubber trackRect](self, "trackRect", v10);
      v14 = v13;
      v15 = (double)self->_timeComponents * 19.0;
      -[UIView frame](self->_elapsedLabel, "frame");
      v17 = floor((v14 - v16) * 0.5);
      -[UILabel setFrame:](self->_elapsedLabel, "setFrame:", 0.0, v17, v15);
      -[UIView frame](self->_remainingLabel, "frame");
      -[UILabel setFrame:](self->_remainingLabel, "setFrame:", v5 - v15, v17, v15);
      *(_BYTE *)p_sliderFlags = *(_BYTE *)p_sliderFlags & 0xCF | 0x20;
      trackView = self->_trackView;
      -[UIMovieScrubber trackRect](self, "trackRect");
      -[UIView setFrame:](trackView, "setFrame:");
      v19 = *((char *)p_sliderFlags + 8);
      if ((v19 & 0x80000000) == 0)
      {
        if ((v19 & 8) == 0)
          -[UIView setAlpha:](self->_editingView, "setAlpha:", 1.0);
        editingView = self->_editingView;
        -[UIMovieScrubber _editingRect](self, "_editingRect");
        -[UIView setFrame:](editingView, "setFrame:");
      }
      -[UIMovieScrubber _updateThumbLocation](self, "_updateThumbLocation");
      v21.receiver = self;
      v21.super_class = (Class)UIMovieScrubber;
      -[UIView layoutSubviews](&v21, sel_layoutSubviews);
    }
  }
}

- (void)_initSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *v11;
  UILabel *elapsedLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  UILabel *remainingLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  UIMovieScrubberTrackView *v27;
  UIMovieScrubberTrackView *trackView;
  double v29;
  double v30;
  double v31;
  double v32;
  UIImageView *v33;
  UIImageView *thumbView;
  UIImageView *v35;
  void *v36;
  UIMovieScrubberEditingView *v37;
  UIMovieScrubberEditingView *editingView;

  *(_BYTE *)&self->_sliderFlags |= 0x20u;
  -[UIMovieScrubber trackRect](self, "trackRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!self->_elapsedLabel && self->_showTimeViews)
  {
    v11 = objc_alloc_init(UILabel);
    elapsedLabel = self->_elapsedLabel;
    self->_elapsedLabel = v11;

    -[UIView setOpaque:](self->_elapsedLabel, "setOpaque:", 0);
    v13 = self->_elapsedLabel;
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    v15 = self->_elapsedLabel;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = self->_elapsedLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UILabel setTextAlignment:](self->_elapsedLabel, "setTextAlignment:", 1);
    -[UIView setAutoresizingMask:](self->_elapsedLabel, "setAutoresizingMask:", 4);
    -[UIView addSubview:](self, "addSubview:", self->_elapsedLabel);
    *(_BYTE *)&self->_sliderFlags |= 0x10u;
  }
  if (!self->_remainingLabel && self->_showTimeViews)
  {
    v19 = objc_alloc_init(UILabel);
    remainingLabel = self->_remainingLabel;
    self->_remainingLabel = v19;

    -[UIView setOpaque:](self->_remainingLabel, "setOpaque:", 0);
    v21 = self->_remainingLabel;
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    v23 = self->_remainingLabel;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    v25 = self->_remainingLabel;
    +[UIColor clearColor](UIColor, "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UILabel setTextAlignment:](self->_remainingLabel, "setTextAlignment:", 1);
    -[UIView setAutoresizingMask:](self->_remainingLabel, "setAutoresizingMask:", 1);
    -[UIView addSubview:](self, "addSubview:", self->_remainingLabel);
    *(_BYTE *)&self->_sliderFlags |= 0x10u;
  }
  if (!self->_trackView)
  {
    v27 = -[UIMovieScrubberTrackView initWithFrame:]([UIMovieScrubberTrackView alloc], "initWithFrame:", v4, v6, v8, v10);
    trackView = self->_trackView;
    self->_trackView = v27;

    -[UIView setAutoresizingMask:](self->_trackView, "setAutoresizingMask:", 2);
    -[UIMovieScrubberTrackView setDataSource:](self->_trackView, "setDataSource:", self);
    -[UIMovieScrubberTrackView setDelegate:](self->_trackView, "setDelegate:", self);
    -[UIView addSubview:](self, "addSubview:", self->_trackView);
  }
  if (!self->_thumbView)
  {
    -[UIMovieScrubber thumbRectForValue:](self, "thumbRectForValue:", 0.0);
    v33 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v29, v30, v31, v32);
    thumbView = self->_thumbView;
    self->_thumbView = v33;

    -[UIImageView setContentMode:](self->_thumbView, "setContentMode:", 4);
    -[UIView setUserInteractionEnabled:](self->_thumbView, "setUserInteractionEnabled:", 0);
    v35 = self->_thumbView;
    _GetScrubberThumbImage();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v35, "setImage:", v36);

    -[UIView setOpaque:](self->_thumbView, "setOpaque:", 0);
    -[UIView setAutoresizingMask:](self->_thumbView, "setAutoresizingMask:", 0);
    -[UIView addSubview:](self, "addSubview:", self->_thumbView);
  }
  if (!self->_editingView)
  {
    v37 = -[UIMovieScrubberEditingView initWithFrame:]([UIMovieScrubberEditingView alloc], "initWithFrame:", v4, v6, v8, v10);
    editingView = self->_editingView;
    self->_editingView = v37;

    -[UIView setUserInteractionEnabled:](self->_editingView, "setUserInteractionEnabled:", 0);
    -[UIMovieScrubberEditingView setEnabled:](self->_editingView, "setEnabled:", self->_editable);
    -[UIMovieScrubberEditingView setEdgeInset:](self->_editingView, "setEdgeInset:", self->_edgeInset);
    -[UIView insertSubview:below:](self, "insertSubview:below:", self->_editingView, self->_thumbView);
  }
}

- (void)_updateTimes
{
  double v3;
  double v4;
  int v5;
  double v6;
  int v7;
  void *v8;
  id v9;

  if ((*((_BYTE *)&self->_sliderFlags + 8) & 1) == 0 && self->_showTimeViews)
  {
    -[UIMovieScrubber value](self, "value");
    v4 = floor(v3);
    v5 = vcvtmd_s64_f64(v3);
    -[UIMovieScrubber duration](self, "duration");
    __CopyProgressStringForSeconds(v5, 0, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIMovieScrubber duration](self, "duration");
    v7 = (int)-floor(v6 - v4);
    -[UIMovieScrubber duration](self, "duration");
    __CopyProgressStringForSeconds(v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_elapsedLabel, "setText:", v9);
    -[UILabel setText:](self->_remainingLabel, "setText:", v8);

  }
}

- (void)didMoveToSuperview
{
  *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xFFFE | IsInNavigationBar(self);
}

- (void)didMoveToWindow
{
  *((_WORD *)&self->_sliderFlags + 10) = *((_WORD *)&self->_sliderFlags + 10) & 0xFFFE | IsInNavigationBar(self);
}

- (BOOL)isInsideNavigationBar
{
  return *((_WORD *)&self->_sliderFlags + 10) & 1;
}

- (void)setEdgeInset:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_edgeInset != a3)
  {
    self->_edgeInset = a3;
    *(_BYTE *)&self->_sliderFlags |= 0x20u;
    -[UIMovieScrubberEditingView setEdgeInset:](self->_editingView, "setEdgeInset:", self->_edgeInset);
    -[UIMovieScrubber layoutSubviews](self, "layoutSubviews");
  }
}

- (UIEdgeInsets)alignmentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  if (self->_editable)
    v2 = 0.0;
  v3 = 1.0;
  v4 = 2.0;
  v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0, a3);
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  int v5;
  BOOL v6;
  int *v7;
  double v8;
  int *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  if (a4)
  {
    v5 = *((char *)&self->_sliderFlags + 8);
    v6 = v5 < 0;
    if (v5 < 0)
      v7 = &OBJC_IVAR___UIMovieScrubber__trimStartValue;
    else
      v7 = &OBJC_IVAR___UIMovieScrubber__minimumValue;
    v8 = *(double *)((char *)&self->super.super.super.super.isa + *v7);
    v9 = &OBJC_IVAR___UIMovieScrubber__trimEndValue;
    if (!v6)
      v9 = &OBJC_IVAR___UIMovieScrubber__maximumValue;
    v10 = *v9;
    if (v8 > a3)
      a3 = v8;
    if (a3 <= *(double *)((char *)&self->super.super.super.super.isa + v10))
      v11 = a3;
    else
      v11 = *(double *)((char *)&self->super.super.super.super.isa + v10);
    -[UIMovieScrubber trackRect](self, "trackRect");
    v13 = v12;
    -[UIView layer](self->_thumbView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;

    -[UIMovieScrubber thumbRectForValue:](self, "thumbRectForValue:", v11);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37__UIMovieScrubber_setValue_animated___block_invoke;
    v21[3] = &unk_1E16B1888;
    v21[4] = self;
    *(double *)&v21[5] = v11;
    v19[4] = self;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __37__UIMovieScrubber_setValue_animated___block_invoke_2;
    v20[3] = &unk_1E16B1B28;
    v20[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __37__UIMovieScrubber_setValue_animated___block_invoke_3;
    v19[3] = &unk_1E16B3FD8;
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", 4, v21, v20, v19, vabdd_f64(v17, v18) / v13 * 0.25, 0.0);
  }
  else
  {
    -[UIMovieScrubber _setValue:andSendAction:](self, "_setValue:andSendAction:", a3);
  }
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:andSendAction:", 0, *(double *)(a1 + 40));
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sliderAnimationWillStart");
}

uint64_t __37__UIMovieScrubber_setValue_animated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sliderAnimationDidStop:", a2);
}

- (void)_updateThumbLocation
{
  UIImageView *thumbView;

  thumbView = self->_thumbView;
  -[UIMovieScrubber value](self, "value");
  -[UIMovieScrubber thumbRectForValue:](self, "thumbRectForValue:");
  -[UIImageView setFrame:](thumbView, "setFrame:");
}

- (void)_setValue:(double)a3 andSendAction:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  BOOL v7;
  int *v8;
  double v9;
  int *v10;
  uint64_t v11;

  v4 = a4;
  v6 = *((char *)&self->_sliderFlags + 8);
  v7 = v6 < 0;
  if (v6 < 0)
    v8 = &OBJC_IVAR___UIMovieScrubber__trimStartValue;
  else
    v8 = &OBJC_IVAR___UIMovieScrubber__minimumValue;
  v9 = *(double *)((char *)&self->super.super.super.super.isa + *v8);
  v10 = &OBJC_IVAR___UIMovieScrubber__trimEndValue;
  if (!v7)
    v10 = &OBJC_IVAR___UIMovieScrubber__maximumValue;
  v11 = *v10;
  if (v9 > a3)
    a3 = v9;
  if (a3 > *(double *)((char *)&self->super.super.super.super.isa + v11))
    a3 = *(double *)((char *)&self->super.super.super.super.isa + v11);
  if (a3 != self->_value)
  {
    self->_value = a3;
    -[UIMovieScrubberTrackView setValue:](self->_trackView, "setValue:");
    -[UIMovieScrubber _updateThumbLocation](self, "_updateThumbLocation");
    -[UIMovieScrubber _updateTimes](self, "_updateTimes");
  }
  if (v4)
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, 0);
}

- (double)duration
{
  return self->_maximumValue;
}

- (void)setDuration:(double)a3
{
  int v3;

  if (self->_maximumValue != a3)
  {
    self->_maximumValue = a3;
    if ((60 * ((int)a3 / 60) - 60 * ((int)a3 / 60 % 60) + 3599) < 0x1C1F)
      v3 = 2;
    else
      v3 = 3;
    self->_timeComponents = v3;
    *(_BYTE *)&self->_sliderFlags |= 0x10u;
    -[UIMovieScrubber _setValue:andSendAction:](self, "_setValue:andSendAction:", 0, self->_value);
  }
}

- (double)trimStartValue
{
  double result;
  double trimEndValue;
  double maxTrimmedLength;
  double v5;

  result = self->_trimStartValue;
  trimEndValue = self->_trimEndValue;
  maxTrimmedLength = self->_maxTrimmedLength;
  if (trimEndValue - result > maxTrimmedLength)
  {
    v5 = trimEndValue - maxTrimmedLength;
    if (self->_sliderFlags.editingHandle == 2)
      return v5;
  }
  return result;
}

- (void)setTrimStartValue:(double)a3
{
  double minimumValue;
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  double trimStartValue;
  char v7;
  UIMovieScrubberEditingView *editingView;
  id WeakRetained;
  double maxTrimmedLength;
  double trimEndValue;
  double v12;

  minimumValue = a3;
  p_sliderFlags = &self->_sliderFlags;
  if (!self->_sliderFlags.clampingTrimRange)
  {
    if (self->_minimumValue > a3)
      minimumValue = self->_minimumValue;
    if (minimumValue > self->_maximumValue)
      minimumValue = self->_maximumValue;
  }
  if (minimumValue + self->_minTrimmedLength <= self->_trimEndValue)
  {
    trimStartValue = self->_trimStartValue;
    self->_trimStartValue = minimumValue;
    if (minimumValue == trimStartValue)
    {
      -[UIMovieScrubberTrackView setStartValue:](self->_trackView, "setStartValue:", minimumValue);
    }
    else
    {
      v7 = *((_BYTE *)&self->_sliderFlags + 8);
      if ((v7 & 0x40) != 0)
      {
        *((_BYTE *)&self->_sliderFlags + 8) = v7 & 0xBF;
        if ((v7 & 0x80) == 0)
          -[UIMovieScrubber setEditing:animated:](self, "setEditing:animated:", 1, 0);
      }
      editingView = self->_editingView;
      -[UIMovieScrubber _editingRectForStartTime:endTime:](self, "_editingRectForStartTime:endTime:", self->_trimStartValue, self->_trimEndValue);
      -[UIView setFrame:](editingView, "setFrame:");
      -[UIMovieScrubberTrackView setStartValue:](self->_trackView, "setStartValue:", self->_trimStartValue);
      if ((*((_WORD *)p_sliderFlags + 10) & 4) != 0 && p_sliderFlags->editingHandle == 1)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "movieScrubber:editingStartValueDidChange:", self, self->_trimStartValue);

      }
    }
    maxTrimmedLength = self->_maxTrimmedLength;
    if (self->_minTrimmedLength >= maxTrimmedLength)
      maxTrimmedLength = self->_minTrimmedLength;
    if (minimumValue != trimStartValue)
    {
      trimEndValue = self->_trimEndValue;
      v12 = trimEndValue - self->_trimStartValue - maxTrimmedLength;
      if (v12 > 0.01)
      {
        ++p_sliderFlags->clampingTrimRange;
        -[UIMovieScrubber setTrimEndValue:](self, "setTrimEndValue:", trimEndValue - v12);
        --p_sliderFlags->clampingTrimRange;
      }
    }
  }
}

- (double)trimEndValue
{
  double result;
  double trimStartValue;
  double maxTrimmedLength;
  double v5;

  result = self->_trimEndValue;
  trimStartValue = self->_trimStartValue;
  maxTrimmedLength = self->_maxTrimmedLength;
  if (result - trimStartValue > maxTrimmedLength)
  {
    v5 = trimStartValue + maxTrimmedLength;
    if (self->_sliderFlags.editingHandle == 1)
      return v5;
  }
  return result;
}

- (void)setTrimEndValue:(double)a3
{
  double minimumValue;
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  double trimEndValue;
  char v7;
  UIMovieScrubberEditingView *editingView;
  id WeakRetained;
  double maxTrimmedLength;
  double trimStartValue;
  double v12;

  minimumValue = a3;
  p_sliderFlags = &self->_sliderFlags;
  if (!self->_sliderFlags.clampingTrimRange)
  {
    if (self->_minimumValue > a3)
      minimumValue = self->_minimumValue;
    if (minimumValue > self->_maximumValue)
      minimumValue = self->_maximumValue;
  }
  if (minimumValue >= self->_trimStartValue + self->_minTrimmedLength)
  {
    trimEndValue = self->_trimEndValue;
    self->_trimEndValue = minimumValue;
    if (trimEndValue == minimumValue)
    {
      -[UIMovieScrubberTrackView setEndValue:](self->_trackView, "setEndValue:", minimumValue);
    }
    else
    {
      v7 = *((_BYTE *)&self->_sliderFlags + 8);
      if ((v7 & 0x40) != 0)
      {
        *((_BYTE *)&self->_sliderFlags + 8) = v7 & 0xBF;
        if ((v7 & 0x80) == 0)
          -[UIMovieScrubber setEditing:animated:](self, "setEditing:animated:", 1, 0);
      }
      editingView = self->_editingView;
      -[UIMovieScrubber _editingRectForStartTime:endTime:](self, "_editingRectForStartTime:endTime:", self->_trimStartValue, self->_trimEndValue);
      -[UIView setFrame:](editingView, "setFrame:");
      -[UIMovieScrubberTrackView setEndValue:](self->_trackView, "setEndValue:", self->_trimEndValue);
      if (p_sliderFlags->editingHandle == 2 && (*((_WORD *)p_sliderFlags + 10) & 8) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "movieScrubber:editingEndValueDidChange:", self, self->_trimEndValue);

      }
    }
    maxTrimmedLength = self->_maxTrimmedLength;
    if (self->_minTrimmedLength >= maxTrimmedLength)
      maxTrimmedLength = self->_minTrimmedLength;
    if (trimEndValue != minimumValue)
    {
      trimStartValue = self->_trimStartValue;
      v12 = self->_trimEndValue - trimStartValue - maxTrimmedLength;
      if (v12 > 0.01)
      {
        ++p_sliderFlags->clampingTrimRange;
        -[UIMovieScrubber setTrimStartValue:](self, "setTrimStartValue:", trimStartValue + v12);
        --p_sliderFlags->clampingTrimRange;
      }
    }
  }
}

- (void)_sliderAnimationWillStart
{
  *(_BYTE *)&self->_sliderFlags |= 2u;
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  if (a3)
    *(_BYTE *)&self->_sliderFlags &= ~2u;
}

- (double)_valueForLocatable:(id)a3
{
  double minimumValue;
  double maximumValue;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  minimumValue = self->_minimumValue;
  maximumValue = self->_maximumValue;
  objc_msgSend(a3, "locationInView:", self->_trackView);
  v7 = v6;
  -[UIView frame](self->_trackView, "frame");
  v9 = v8;
  -[UIView bounds](self, "bounds");
  v10 = minimumValue + (maximumValue - minimumValue) * (v7 + self->_hitOffset) / v9;
  if (v10 >= minimumValue)
  {
    minimumValue = minimumValue + (maximumValue - minimumValue) * (v7 + self->_hitOffset) / v9;
    if (v10 > maximumValue)
      return maximumValue;
  }
  return minimumValue;
}

- (void)setRotationDisabled:(BOOL)a3
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  unsigned int rotationDisabled;
  void *v5;
  unsigned int v6;
  id v7;

  p_sliderFlags = &self->_sliderFlags;
  rotationDisabled = self->_sliderFlags.rotationDisabled;
  if (a3)
  {
    if (!rotationDisabled)
    {
      -[UIView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beginDisablingInterfaceAutorotation");

      rotationDisabled = p_sliderFlags->rotationDisabled;
    }
    p_sliderFlags->rotationDisabled = rotationDisabled + 1;
  }
  else if (rotationDisabled)
  {
    v6 = rotationDisabled - 1;
    self->_sliderFlags.rotationDisabled = v6;
    if (!v6)
    {
      -[UIView window](self, "window");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDisablingInterfaceAutorotation");

    }
  }
}

- (void)_setZoomAnimating:(BOOL)a3
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  char v4;
  _BOOL4 v5;
  char v7;
  id WeakRetained;
  id v9;

  p_sliderFlags = &self->_sliderFlags;
  v4 = *((_BYTE *)&self->_sliderFlags + 8);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    v5 = a3;
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)&self->_sliderFlags + 8) = v4 & 0xFD | v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v5)
    {
      if ((*((_WORD *)p_sliderFlags + 10) & 0x800) != 0)
      {
        v9 = WeakRetained;
        objc_msgSend(WeakRetained, "movieScrubberDidBeginAnimatingZoom:", self);
LABEL_10:
        WeakRetained = v9;
      }
    }
    else if ((*((_WORD *)p_sliderFlags + 10) & 0x1000) != 0)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "movieScrubberDidEndAnimatingZoom:", self);
      goto LABEL_10;
    }

  }
}

- (BOOL)forceZoom
{
  -[UIMovieScrubber _trackPressWasHeld](self, "_trackPressWasHeld");
  return *((_BYTE *)&self->_sliderFlags + 8) & 1;
}

- (void)forceUnzoom
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;

  p_sliderFlags = &self->_sliderFlags;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 1) != 0)
  {
    _RemoveAllAnimationsForView(self);
    -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 1);
    *((_BYTE *)p_sliderFlags + 8) &= ~1u;
    -[UIMovieScrubberTrackView unzoom](self->_trackView, "unzoom");
  }
}

- (void)_trackPressWasHeld
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  BOOL v12;

  -[UIView frame](self->_thumbView, "frame");
  *(float *)&v4 = v4 + v3 * 0.5;
  *(float *)&v6 = v6 + v5 * 0.5;
  -[UIView convertPoint:fromView:](self->_trackView, "convertPoint:fromView:", self, rintf(*(float *)&v4), rintf(*(float *)&v6));
  v8 = v7;
  v10 = v9;
  v11 = *((_BYTE *)&self->_sliderFlags + 8);
  if ((v11 & 0x40) != 0)
  {
    *((_BYTE *)&self->_sliderFlags + 8) = v11 & 0xBF;
    if ((v11 & 0x80) == 0)
      -[UIMovieScrubber setEditing:animated:](self, "setEditing:animated:", 1, 0);
  }
  -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 1);
  v12 = -[UIMovieScrubberTrackView zoomAtPoint:](self->_trackView, "zoomAtPoint:", v8, v10);
  *((_BYTE *)&self->_sliderFlags + 8) = *((_BYTE *)&self->_sliderFlags + 8) & 0xFE | v12;
  if (!v12)
    -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 0);
}

- (void)_beginTrackPressWithLocatable:(id)a3 touchesBegan:(BOOL)a4
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  _BOOL4 v5;
  CGPoint *p_touchLocationWhenTrackPressBegan;
  CGFloat v8;
  CGFloat v9;
  id WeakRetained;

  p_sliderFlags = &self->_sliderFlags;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 5) == 0)
  {
    v5 = a4;
    p_touchLocationWhenTrackPressBegan = &self->_touchLocationWhenTrackPressBegan;
    objc_msgSend(a3, "locationInView:", self->_trackView);
    p_touchLocationWhenTrackPressBegan->x = v8;
    p_touchLocationWhenTrackPressBegan->y = v9;
    *((_BYTE *)p_sliderFlags + 8) |= 4u;
    -[UIMovieScrubber performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__trackPressWasHeld, 0, self->_zoomDelay);
    if (v5)
    {
      -[UIMovieScrubber setRotationDisabled:](self, "setRotationDisabled:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "movieScrubberDidBeginScrubbing:withHandle:", self, p_sliderFlags->editingHandle);

    }
  }
}

- (void)_cancelTrackPress:(BOOL)a3
{
  $BF730A74D656A2DBEC91C53C5563D644 *p_sliderFlags;
  _BOOL4 v4;
  char v6;
  id WeakRetained;

  p_sliderFlags = &self->_sliderFlags;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 5) == 4)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__trackPressWasHeld, 0);
    v6 = *((_BYTE *)p_sliderFlags + 8);
    *((_BYTE *)p_sliderFlags + 8) = v6 & 0xFB;
    if (v4)
    {
      if ((v6 & 3) == 0)
        -[UIMovieScrubber setRotationDisabled:](self, "setRotationDisabled:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "movieScrubberDidEndScrubbing:withHandle:", self, p_sliderFlags->editingHandle);

    }
  }
}

- (void)_cancelTrackPressIfNeccessaryWithLocatable:(id)a3
{
  double x;
  double v5;

  x = self->_touchLocationWhenTrackPressBegan.x;
  objc_msgSend(a3, "locationInView:", self->_trackView);
  if (vabdd_f64(x, v5) > 2.0)
    -[UIMovieScrubber _cancelTrackPress:](self, "_cancelTrackPress:", 0);
}

- (BOOL)pointInsideThumb:(CGPoint)a3 withEvent:(id)a4
{
  UIImageView *thumbView;
  CGFloat y;
  CGFloat x;
  UIMovieScrubberTrackView *trackView;
  CGPoint v10;
  CGRect v11;
  CGRect v12;

  thumbView = self->_thumbView;
  if (thumbView)
  {
    y = a3.y;
    x = a3.x;
    trackView = self->_trackView;
    -[UIView hitRect](thumbView, "hitRect", a4);
    -[UIView convertRect:fromView:](trackView, "convertRect:fromView:", self->_thumbView);
    v12 = CGRectInset(v11, -20.0, -20.0);
    v10.x = x;
    v10.y = y;
    LOBYTE(thumbView) = CGRectContainsPoint(v12, v10);
  }
  return (char)thumbView;
}

- (int)_editingHandleWithLocatable:(id)a3
{
  int result;

  objc_msgSend(a3, "locationInView:", self->_editingView);
  result = -[UIMovieScrubberEditingView handleForPoint:hitOffset:](self->_editingView, "handleForPoint:hitOffset:", &self->_hitOffset);
  self->_sliderFlags.editingHandle = result;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIMovieScrubber beginTrackingWithLocatable:](self, "beginTrackingWithLocatable:", v4);
      break;
    case 2:
      -[UIMovieScrubber continueTrackingWithLocatable:](self, "continueTrackingWithLocatable:", v4);
      break;
    case 3:
    case 4:
      -[UIMovieScrubber endTrackingWithLocatable:](self, "endTrackingWithLocatable:", v4);
      break;
    default:
      break;
  }

}

- (void)beginTrackingWithLocatable:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  char editable;
  int v15;
  double maxTrimmedLength;
  id WeakRetained;
  unsigned int editingHandle;
  void *v19;
  id v20;

  v4 = a3;
  v5 = v4;
  v20 = v4;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 0x10) != 0)
  {
    objc_msgSend(v4, "locationInView:", self->_trackView);
    v7 = v6;
    v9 = v8;
    -[UIView convertPoint:fromView:](self->_thumbView, "convertPoint:fromView:", self->_trackView);
    v11 = v10;
    if (-[UIMovieScrubber pointInsideThumb:withEvent:](self, "pointInsideThumb:withEvent:", 0, v7, v9))
    {
      -[UIView frame](self->_thumbView, "frame");
      self->_hitOffset = round(v12 * 0.5 - v11);
      goto LABEL_22;
    }
    v13 = -[UIMovieScrubber _editingHandleWithLocatable:](self, "_editingHandleWithLocatable:", v20);
    v5 = v20;
    if (!v13)
    {
      -[UIMovieScrubber _valueForLocatable:](self, "_valueForLocatable:", v20);
      -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0);
LABEL_22:
      self->_sliderFlags.editingHandle = 0;
      -[UIMovieScrubber _beginTrackPressWithLocatable:touchesBegan:](self, "_beginTrackPressWithLocatable:touchesBegan:", v20, 1);
      if (-[UIMovieScrubber isContinuous](self, "isContinuous"))
        -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, 0);
      goto LABEL_27;
    }
  }
  editable = self->_editable;
  if (editable)
  {
    if (!-[UIMovieScrubber _editingHandleWithLocatable:](self, "_editingHandleWithLocatable:", v5))
    {
      editable = 0;
LABEL_28:
      v5 = v20;
      goto LABEL_29;
    }
    v15 = *((char *)&self->_sliderFlags + 8);
    if (v15 < 0)
    {
      editingHandle = self->_sliderFlags.editingHandle;
      if (editingHandle == 2)
      {
        -[UIMovieScrubber setTrimEndValue:](self, "setTrimEndValue:", self->_trimEndValue);
      }
      else
      {
        if (editingHandle != 1)
        {
LABEL_26:
          -[UIMovieScrubber _beginTrackPressWithLocatable:touchesBegan:](self, "_beginTrackPressWithLocatable:touchesBegan:", v20, 1);
          goto LABEL_27;
        }
        -[UIMovieScrubber setTrimStartValue:](self, "setTrimStartValue:", self->_trimStartValue);
      }
    }
    else
    {
      if ((v15 & 0x40) != 0)
        goto LABEL_27;
      if (self->_sliderFlags.editingHandle - 1 <= 1)
      {
        *((_BYTE *)&self->_sliderFlags + 8) = v15 | 0x40;
        maxTrimmedLength = self->_maxTrimmedLength;
        if (maxTrimmedLength == 0.0)
        {
          maxTrimmedLength = self->_maximumValue;
          self->_maxTrimmedLength = maxTrimmedLength;
        }
        if (self->_trimEndValue == 0.0)
          self->_trimEndValue = maxTrimmedLength;
        -[UIMovieScrubberEditingView setEditing:](self->_editingView, "setEditing:", 1);
        if ((*((_WORD *)&self->_sliderFlags + 10) & 0x40) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "movieScrubberWillBeginEditing:", self);

        }
        -[UIMovieScrubber setThumbIsVisible:](self, "setThumbIsVisible:", 0);
      }
    }
    if (*((char *)&self->_sliderFlags + 8) < 0)
      goto LABEL_26;
LABEL_27:
    +[_UIStatistics scrubberUsageTime](_UIStatistics, "scrubberUsageTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startTimingForObject:", self);

    editable = 32;
    goto LABEL_28;
  }
LABEL_29:
  *((_BYTE *)&self->_sliderFlags + 8) = *((_BYTE *)&self->_sliderFlags + 8) & 0xDF | editable;

}

- (void)continueTrackingWithLocatable:(id)a3
{
  id v4;
  unsigned int editingHandle;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 0x20) == 0)
    goto LABEL_12;
  v6 = v4;
  -[UIMovieScrubber _cancelTrackPressIfNeccessaryWithLocatable:](self, "_cancelTrackPressIfNeccessaryWithLocatable:", v4);
  -[UIMovieScrubber _beginTrackPressWithLocatable:touchesBegan:](self, "_beginTrackPressWithLocatable:touchesBegan:", v6, 0);
  v4 = v6;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 2) != 0)
    goto LABEL_12;
  -[UIMovieScrubber _valueForLocatable:](self, "_valueForLocatable:", v6);
  editingHandle = self->_sliderFlags.editingHandle;
  if (editingHandle == 2)
  {
    -[UIMovieScrubber setTrimEndValue:](self, "setTrimEndValue:");
LABEL_11:
    v4 = v6;
    goto LABEL_12;
  }
  if (editingHandle == 1)
  {
    -[UIMovieScrubber setTrimStartValue:](self, "setTrimStartValue:");
    goto LABEL_11;
  }
  v4 = v6;
  if (!editingHandle)
  {
    -[UIMovieScrubber setValue:animated:](self, "setValue:animated:", 0);
    if (-[UIMovieScrubber isContinuous](self, "isContinuous"))
      -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, 0);
    -[UIControl setHighlighted:](self, "setHighlighted:", 1);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)endTrackingWithLocatable:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 0x20) != 0)
  {
    +[_UIStatistics scrubberUsageCount](_UIStatistics, "scrubberUsageCount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incrementValueBy:", 1);

    +[_UIStatistics scrubberUsageTime](_UIStatistics, "scrubberUsageTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordTimingForObject:", self);

  }
  -[UIControl setTracking:](self, "setTracking:", 0);
  v6 = *((_BYTE *)&self->_sliderFlags + 8);
  *((_BYTE *)&self->_sliderFlags + 8) = v6 & 0xDF;
  if ((v6 & 1) != 0)
  {
    _RemoveAllAnimationsForView(self);
    -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 1);
    *((_BYTE *)&self->_sliderFlags + 8) &= ~1u;
    -[UIMovieScrubberTrackView unzoom](self->_trackView, "unzoom");
  }
  else
  {
    if ((v6 & 0x40) != 0)
    {
      *((_BYTE *)&self->_sliderFlags + 8) = v6 & 0x9F;
      -[UIMovieScrubberEditingView setEditing:](self->_editingView, "setEditing:", 0);
      -[UIMovieScrubber setThumbIsVisible:](self, "setThumbIsVisible:", 1);
      if ((*((_WORD *)&self->_sliderFlags + 10) & 0x100) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "movieScrubberDidCancelEditing:", self);

      }
    }
    if ((*((_BYTE *)&self->_sliderFlags + 8) & 0x83) == 0x80)
      -[UIMovieScrubber setRotationDisabled:](self, "setRotationDisabled:", 0);
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
  }
  -[UIMovieScrubber _cancelTrackPress:](self, "_cancelTrackPress:", 1);

}

- (BOOL)cancelTouchTracking
{
  if (-[UIControl isTracking](self, "isTracking"))
    -[UIMovieScrubber endTrackingWithLocatable:](self, "endTrackingWithLocatable:", 0);
  if (-[UIControl isHighlighted](self, "isHighlighted"))
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
  -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 256, 0);
  return 1;
}

- (BOOL)isAnimatingValueChange
{
  return (*(_BYTE *)&self->_sliderFlags >> 1) & 1;
}

- (void)_sliderValueDidChange:(id)a3
{
  id WeakRetained;

  if ((*((_WORD *)&self->_sliderFlags + 10) & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "movieScrubber:valueDidChange:", self, self->_value);

  }
}

- (double)movieScrubberTrackViewDuration:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "movieScrubberDuration:", self);
  v6 = v5;

  -[UIMovieScrubber setDuration:](self, "setDuration:", v6);
  return v6;
}

- (id)movieScrubberTrackView:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  uint64_t v7;
  UIMovieScrubberDataSource **p_dataSource;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;

  v7 = *(_QWORD *)&a4;
  p_dataSource = &self->_dataSource;
  v10 = a6;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "movieScrubber:evenlySpacedTimestamps:startingAt:endingAt:", self, v7, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)movieScrubberTrackView:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5
{
  _BOOL8 v5;
  UIMovieScrubberDataSource **p_dataSource;
  id v8;
  id WeakRetained;
  id v10;

  v5 = a5;
  p_dataSource = &self->_dataSource;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  v10 = WeakRetained;
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x4000) != 0)
    objc_msgSend(WeakRetained, "movieScrubber:requestThumbnailImageForTimestamp:isSummaryThumbnail:", self, v8, v5);
  else
    objc_msgSend(WeakRetained, "movieScrubber:requestThumbnailImageForTimestamp:", self, v8);

}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
  -[UIMovieScrubberTrackView setThumbnailImage:forTimestamp:](self->_trackView, "setThumbnailImage:forTimestamp:", a3, a4);
}

- (double)movieScrubberTrackViewThumbnailAspectRatio:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "movieScrubberThumbnailAspectRatio:", self);
  v6 = v5;

  return v6;
}

- (double)movieScrubberTrackViewZoomAnimationDuration:(id)a3
{
  return self->_zoomAnimationDuration;
}

- (double)movieScrubberTrackViewZoomAnimationDelay:(id)a3
{
  return self->_zoomAnimationDelay;
}

- (void)movieScrubberTrackView:(id)a3 clampedSizeWidthDelta:(double)a4 actualSizeWidthDelta:(double)a5 originXDelta:(double)a6 minimumVisibleValue:(double)a7 maximumVisibleValue:(double)a8
{
  id WeakRetained;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double zoomAnimationDuration;
  id v19;
  _QWORD v20[5];
  id v21;
  double v22;
  double v23;

  self->_minimumValue = a7;
  self->_maximumValue = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = WeakRetained;
  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x2000) != 0)
    objc_msgSend(WeakRetained, "movieScrubber:willZoomToMinimumValue:maximumValue:", self, self->_minimumValue, self->_maximumValue);
  -[UIMovieScrubberTrackView zoomAnimationDuration](self->_trackView, "zoomAnimationDuration");
  v15 = fmax(a4 / a5, 0.2) * v14;
  self->_zoomAnimationDuration = v15;
  v16 = v14 - v15;
  if (a4 >= 0.0)
    v17 = 0.0;
  else
    v17 = v16;
  self->_zoomAnimationDelay = v17;
  zoomAnimationDuration = self->_zoomAnimationDuration;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __138__UIMovieScrubber_movieScrubberTrackView_clampedSizeWidthDelta_actualSizeWidthDelta_originXDelta_minimumVisibleValue_maximumVisibleValue___block_invoke;
  v20[3] = &unk_1E16B80A8;
  v20[4] = self;
  v21 = v13;
  v22 = a4;
  v23 = a6;
  v19 = v13;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, zoomAnimationDuration, v17);

}

uint64_t __138__UIMovieScrubber_movieScrubberTrackView_clampedSizeWidthDelta_actualSizeWidthDelta_originXDelta_minimumVisibleValue_maximumVisibleValue___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 724) & 0x400) != 0)
  {
    v3 = *(double *)(a1 + 48);
    v4 = *(double *)(a1 + 56);
    *(float *)&v3 = v3;
    *(float *)&v4 = v4;
    objc_msgSend(*(id *)(a1 + 40), "movieScrubber:widthDelta:originXDelta:", v3, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    objc_msgSend(*(id *)(a1 + 32), "setFrame:", v2 + *(double *)(a1 + 56));
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (*(char *)(v5 + 712) < 0 && *(_DWORD *)(v5 + 716)
    || (v6 = *(void **)(v5 + 464),
        objc_msgSend(*(id *)(a1 + 32), "value"),
        objc_msgSend((id)v5, "thumbRectForValue:"),
        result = objc_msgSend(v6, "setFrame:"),
        v5 = *(_QWORD *)(a1 + 32),
        *(char *)(v5 + 712) < 0))
  {
    objc_msgSend((id)v5, "_editingRectForStartTime:endTime:", *(double *)(v5 + 656), *(double *)(v5 + 664));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setFrame:");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layoutSubviews");
  }
  return result;
}

- (void)movieScrubberTrackViewDidExpand:(id)a3
{
  if ((*((_BYTE *)&self->_sliderFlags + 8) & 1) != 0)
  {
    *(_BYTE *)&self->_sliderFlags |= 0x20u;
    -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 0);
  }
}

- (void)movieScrubberTrackViewDidCollapse:(id)a3
{
  *(_BYTE *)&self->_sliderFlags |= 0x20u;
  -[UIMovieScrubber _setZoomAnimating:](self, "_setZoomAnimating:", 0);
  -[UIMovieScrubber setRotationDisabled:](self, "setRotationDisabled:", 0);
}

- (void)movieScrubberTrackViewWillBeginRequestingThumbnails:(id)a3
{
  id WeakRetained;

  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "movieScrubberWillBeginRequestingThumbnails:", self);

  }
}

- (void)movieScrubberTrackViewDidFinishRequestingThumbnails:(id)a3
{
  id WeakRetained;

  if ((*((_WORD *)&self->_sliderFlags + 10) & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "movieScrubberDidFinishRequestingThumbnails:", self);

  }
}

+ (id)timeStringForSeconds:(int)a3 forceFullWidthComponents:(BOOL)a4 isElapsed:(BOOL)a5
{
  return __CopyProgressStringForSeconds(a3, a4, a5);
}

- (double)zoomMinimumValue
{
  return self->_minimumValue;
}

- (double)zoomMaximumValue
{
  return self->_maximumValue;
}

- (BOOL)isZoomAnimating
{
  return (*((unsigned __int8 *)&self->_sliderFlags + 8) >> 1) & 1;
}

- (double)zoomDelay
{
  return self->_zoomDelay;
}

- (void)setZoomDelay:(double)a3
{
  self->_zoomDelay = a3;
}

- (BOOL)showTimeViews
{
  return self->_showTimeViews;
}

- (void)setShowTimeViews:(BOOL)a3
{
  self->_showTimeViews = a3;
}

- (double)maximumTrimLength
{
  return self->_maxTrimmedLength;
}

- (void)setMaximumTrimLength:(double)a3
{
  self->_maxTrimmedLength = a3;
}

- (double)minimumTrimLength
{
  return self->_minTrimmedLength;
}

- (void)setMinimumTrimLength:(double)a3
{
  self->_minTrimmedLength = a3;
}

- (double)edgeInset
{
  return self->_edgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_innerShadowImage, 0);
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_remainingLabel, 0);
  objc_storeStrong((id *)&self->_elapsedLabel, 0);
  objc_storeStrong((id *)&self->_editingView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
}

@end
