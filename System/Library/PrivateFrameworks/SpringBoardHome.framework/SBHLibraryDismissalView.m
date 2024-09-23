@implementation SBHLibraryDismissalView

- (SBHLibraryDismissalView)initWithFrame:(CGRect)a3
{
  SBHLibraryDismissalView *v3;
  SBHLibraryDismissalView *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryDismissalView;
  v3 = -[SBHLibraryDismissalView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBHLibraryDismissalView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.18);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));
    objc_msgSend(v5, "setFillRule:", *MEMORY[0x1E0CD2B70]);

  }
  return v4;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryDismissalView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBrightness:(double)a3
{
  int IsOne;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    IsOne = BSFloatIsOne();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0 - a3 + (1.0 - (1.0 - a3)) * 0.18);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryDismissalView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsOne)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("fillColor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimingFunction:", v8);

      objc_msgSend(v7, "setFromValue:", objc_msgSend(v6, "fillColor"));
      objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v7, "setDuration:", 0.3);
      objc_msgSend(v6, "setFillColor:", objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
      objc_msgSend(v6, "addAnimation:forKey:", v7, 0);

    }
    else
    {
      objc_msgSend(v6, "setFillColor:", objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
    }

  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)layer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryDismissalView;
  -[SBHLibraryDismissalView layer](&v3, sel_layer);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double continuousCornerRadius;
  void *v6;
  void *v7;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  CGFloat width;
  CGFloat v15;
  long double v16;
  double MinX;
  double MaxX;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MidX;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  CGFloat rect;
  long double rect_8;
  double rect_16;
  CGFloat rect_24;
  long double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v38.receiver = self;
  v38.super_class = (Class)SBHLibraryDismissalView;
  -[SBHLibraryDismissalView layoutSubviews](&v38, sel_layoutSubviews);
  -[SBHLibraryDismissalView bounds](self, "bounds");
  v4 = v3;
  continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectCenteredRect();
  rect_16 = continuousCornerRadius / 6.0;
  rect_24 = v39.size.width;
  x = v39.origin.x;
  rect = v39.origin.x;
  v39.origin.y = v4 * 0.3 * 0.1 + v10;
  y = v39.origin.y;
  height = v39.size.height;
  v40 = CGRectInset(v39, continuousCornerRadius / 6.0, continuousCornerRadius / 6.0);
  v12 = v40.origin.x;
  v13 = v40.origin.y;
  width = v40.size.width;
  v15 = v40.size.height;
  v16 = atan(v40.size.height / (fmax(v40.size.width, 2.22507386e-308) * 0.5));
  rect_8 = 1.57079633 - v16;
  v37 = v16 + 1.57079633;
  v41.origin.x = v12;
  v41.origin.y = v13;
  v41.size.width = width;
  v41.size.height = v15;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = rect_24;
  v42.size.height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMinY(v42));
  v43.origin.x = v12;
  v43.origin.y = v13;
  v43.size.width = width;
  v43.size.height = v15;
  MaxX = CGRectGetMaxX(v43);
  v44.origin.x = rect;
  v44.origin.y = y;
  v44.size.width = rect_24;
  v44.size.height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, CGRectGetMinY(v44));
  v45.origin.x = v12;
  v45.origin.y = v13;
  v45.size.width = width;
  v45.size.height = v15;
  v19 = CGRectGetMaxX(v45);
  v46.origin.x = v12;
  v46.origin.y = v13;
  v46.size.width = width;
  v46.size.height = v15;
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, CGRectGetMinY(v46), rect_16);
  objc_msgSend(v7, "currentPoint");
  v21 = v20;
  v47.origin.x = v12;
  v47.origin.y = v13;
  v47.size.width = width;
  v47.size.height = v15;
  v22 = v21 - CGRectGetWidth(v47) * 0.5;
  objc_msgSend(v7, "currentPoint");
  v24 = v23;
  v48.origin.x = v12;
  v48.origin.y = v13;
  v48.size.width = width;
  v48.size.height = v15;
  objc_msgSend(v7, "addLineToPoint:", v22, v24 + CGRectGetHeight(v48));
  v49.origin.x = v12;
  v49.origin.y = v13;
  v49.size.width = width;
  v49.size.height = v15;
  MidX = CGRectGetMidX(v49);
  v50.origin.x = v12;
  v50.origin.y = v13;
  v50.size.width = width;
  v50.size.height = v15;
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMaxY(v50), rect_16, (double)rect_8, (double)v37);
  objc_msgSend(v7, "currentPoint");
  v27 = v26;
  v51.origin.x = v12;
  v51.origin.y = v13;
  v51.size.width = width;
  v51.size.height = v15;
  v28 = v27 - CGRectGetWidth(v51) * 0.5;
  objc_msgSend(v7, "currentPoint");
  v30 = v29;
  v52.origin.x = v12;
  v52.origin.y = v13;
  v52.size.width = width;
  v52.size.height = v15;
  objc_msgSend(v7, "addLineToPoint:", v28, v30 - CGRectGetHeight(v52));
  objc_msgSend(v7, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v13, rect_16, (double)v37, 4.71238898);
  objc_msgSend(v6, "appendPath:", v7);
  -[SBHLibraryDismissalView layer](self, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_retainAutorelease(v6);
  objc_msgSend(v31, "setPath:", objc_msgSend(v32, "CGPath"));

}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)brightness
{
  return self->_brightness;
}

@end
