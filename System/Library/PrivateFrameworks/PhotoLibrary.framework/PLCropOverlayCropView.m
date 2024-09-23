@implementation PLCropOverlayCropView

- (PLCropOverlayCropView)initWithFrame:(CGRect)a3
{
  PLCropOverlayCropView *v3;
  PLCropOverlayCropView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayCropView;
  v3 = -[PLCropOverlayCropView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLCropOverlayCropView setCropRect:](v3, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayCropView;
  -[PLCropOverlayCropView dealloc](&v3, sel_dealloc);
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
  -[PLCropOverlayCropView _updateCropRectIfNeeded](self, "_updateCropRectIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLCropOverlayCropView frame](self, "frame");
  if (width != v9 || height != v8)
    -[PLCropOverlayCropView _updateCropRectIfNeeded](self, "_updateCropRectIfNeeded");
  v11.receiver = self;
  v11.super_class = (Class)PLCropOverlayCropView;
  -[PLCropOverlayCropView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCropOverlayCropView;
  -[PLCropOverlayCropView setAlpha:](&v4, sel_setAlpha_, a3);
  -[PLCropOverlayCropView _updateCropRectIfNeeded](self, "_updateCropRectIfNeeded");
}

- (void)_updateCropRectIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *v14;
  UIView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxY;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[PLCropOverlayCropView alpha](self, "alpha");
  v4 = v3;
  -[PLCropOverlayCropView cropRect](self, "cropRect");
  if (v4 <= 0.0 || (v9 = v5, v10 = v6, v11 = v7, v12 = v8, CGRectIsEmpty(*(CGRect *)&v5)))
  {
    -[PLCropOverlayCropView _removeCropViews](self, "_removeCropViews");
  }
  else
  {
    if (!self->_cropRectView)
    {
      v13 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      self->_aboveCropView = v14;
      -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v13);
      -[PLCropOverlayCropView addSubview:](self, "addSubview:", self->_aboveCropView);
      self->_cropRectView = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      -[UIView setBackgroundColor:](self->_cropRectView, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
      -[CALayer setBorderColor:](-[UIView layer](self->_cropRectView, "layer"), "setBorderColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5), "CGColor"));
      -[CALayer setBorderWidth:](-[UIView layer](self->_cropRectView, "layer"), "setBorderWidth:", 1.0);
      -[PLCropOverlayCropView addSubview:](self, "addSubview:", self->_cropRectView);
      v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      self->_belowCropView = v15;
      -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v13);
      -[PLCropOverlayCropView addSubview:](self, "addSubview:", self->_belowCropView);
    }
    -[PLCropOverlayCropView bounds](self, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25.origin.x = v9;
    v25.origin.y = v10;
    v25.size.width = v11;
    v25.size.height = v12;
    -[UIView setFrame:](self->_aboveCropView, "setFrame:", v17, v19, v21, CGRectGetMinY(v25));
    -[UIView setFrame:](self->_cropRectView, "setFrame:", v9, v10, v11, v12);
    v26.origin.x = v9;
    v26.origin.y = v10;
    v26.size.width = v11;
    v26.size.height = v12;
    MaxY = CGRectGetMaxY(v26);
    v27.origin.x = v9;
    v27.origin.y = v10;
    v27.size.width = v11;
    v27.size.height = v12;
    -[UIView setFrame:](self->_belowCropView, "setFrame:", v17, MaxY, v21, v23 - CGRectGetMaxY(v27));
  }
}

- (void)_removeCropViews
{
  if (self->_cropRectView)
  {
    -[UIView removeFromSuperview](self->_aboveCropView, "removeFromSuperview");

    self->_aboveCropView = 0;
    -[UIView removeFromSuperview](self->_cropRectView, "removeFromSuperview");

    self->_cropRectView = 0;
    -[UIView removeFromSuperview](self->_belowCropView, "removeFromSuperview");

    self->_belowCropView = 0;
  }
}

@end
