@implementation VUIProgressBarView

- (VUIProgressBarView)initWithFrame:(CGRect)a3
{
  VUIProgressBarView *v3;
  VUIProgressBarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIProgressBarView;
  v3 = -[VUIProgressBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VUIProgressBarView setContentMode:](v3, "setContentMode:", 3);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double top;
  double left;
  double bottom;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  CGColorSpace *DeviceRGB;
  const __CFArray *v33;
  CGGradientRef v34;
  CGGradient *v35;
  CGFloat MaxX;
  void *v37;
  CGFloat v38[2];
  CGFloat locations[3];
  uint64_t v40;
  CGPoint v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  CGContextClearRect(CurrentContext, v43);
  -[VUIProgressBarView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (!self->_useMaterial)
  {
    -[VUIProgressBarView completeTintColor](self, "completeTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFill");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, self->_cornerRadius);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fill");

  }
  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  v22 = v14 - left - self->_padding.right;
  -[VUIProgressBarView progress](self, "progress");
  v23 = 0.0;
  if (v24 > 0.0)
  {
    -[VUIProgressBarView progress](self, "progress");
    v23 = 0.02;
    if (v25 >= 0.02)
      v23 = v25;
  }
  v26 = v10 + left;
  v27 = v12 + top;
  v28 = v14 - (left + ceil(v22 * (1.0 - v23)));
  v29 = v16 - (top + bottom);
  if (self->_shouldProgressBarUseRoundCorner)
    v30 = -1;
  else
    v30 = 5;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v30, v26, v27, v28, v29, self->_cornerRadius, self->_cornerRadius);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_gradientStartColor && self->_gradientEndColor)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1DA1C23E0;
    *(_QWORD *)&v38[1] = -[UIColor CGColor](self->_gradientEndColor, "CGColor", -[UIColor CGColor](self->_gradientStartColor, "CGColor"));
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v33 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v34 = CGGradientCreateWithColors(DeviceRGB, v33, locations);
    if (v34)
    {
      v35 = v34;
      v44.origin.x = v26;
      v44.origin.y = v27;
      v44.size.width = v28;
      v44.size.height = v29;
      MaxX = CGRectGetMaxX(v44);
      CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(objc_retainAutorelease(v31), "CGPath"));
      CGContextClip(CurrentContext);
      v41.x = 0.0;
      v41.y = 0.0;
      v42.y = 0.0;
      v42.x = MaxX;
      CGContextDrawLinearGradient(CurrentContext, v35, v41, v42, 3u);
      CGGradientRelease(v35);
    }
    CFRelease(DeviceRGB);

  }
  else
  {
    -[VUIProgressBarView progressTintColor](self, "progressTintColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFill");

    objc_msgSend(v31, "fill");
  }

}

- (void)setCompleteTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_completeTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_completeTintColor, a3);
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setCornerRadius:(double)a3
{
  if (vabdd_f64(self->_cornerRadius, a3) > 0.00000011920929)
  {
    self->_cornerRadius = a3;
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 0.00000011920929)
  {
    self->_progress = a3;
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setProgressTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_progressTintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressTintColor, a3);
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setGradientStartColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientStartColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientStartColor, a3);
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setgradientEndColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientEndColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientEndColor, a3);
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setUseMaterial:(BOOL)a3
{
  if (self->_useMaterial != a3)
  {
    self->_useMaterial = a3;
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_padding.left
    || a3.top != self->_padding.top
    || a3.right != self->_padding.right
    || a3.bottom != self->_padding.bottom)
  {
    self->_padding = a3;
    -[VUIProgressBarView setPadding:](self, "setPadding:");
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setShouldProgressBarUseRoundCorner:(BOOL)a3
{
  if (self->_shouldProgressBarUseRoundCorner != a3)
  {
    self->_shouldProgressBarUseRoundCorner = a3;
    -[VUIProgressBarView setShouldProgressBarUseRoundCorner:](self, "setShouldProgressBarUseRoundCorner:");
    -[VUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientEndColor, a3);
}

- (UIColor)completeTintColor
{
  return self->_completeTintColor;
}

- (BOOL)useMaterial
{
  return self->_useMaterial;
}

- (BOOL)shouldProgressBarUseRoundCorner
{
  return self->_shouldProgressBarUseRoundCorner;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeTintColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

@end
