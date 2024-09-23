@implementation PXPortraitFocusView

- (PXPortraitFocusView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  id v7;
  PXPortraitFocusView *v8;
  PXPortraitFocusView *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPortraitFocusView.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaView != nil"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXPortraitFocusView;
  v8 = -[PXPortraitFocusView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mediaView, a3);

  return v9;
}

- (void)focusPointChanged:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[PXPortraitFocusView focusViewDelegate](self, "focusViewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusPointChanged:", x, y);

}

- (PXPortraitFocusViewDelegate)focusViewDelegate
{
  return (PXPortraitFocusViewDelegate *)objc_loadWeakRetained((id *)&self->_focusViewDelegate);
}

- (void)setFocusViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusViewDelegate, a3);
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_destroyWeak((id *)&self->_focusViewDelegate);
}

@end
