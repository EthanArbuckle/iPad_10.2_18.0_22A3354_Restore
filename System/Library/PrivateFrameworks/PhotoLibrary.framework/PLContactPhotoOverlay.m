@implementation PLContactPhotoOverlay

- (UIEdgeInsets)overlayEdgeInsets
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MinX;
  double MinY;
  double MaxX;
  double v22;
  double MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat rect;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  UIEdgeInsets result;

  -[PLContactPhotoOverlay inscribingBounds](self, "inscribingBounds");
  v4 = v3;
  v6 = v5;
  rect = v5;
  v8 = v7;
  v10 = v9;
  -[PLContactPhotoOverlay bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v32.origin.x = v4;
  v28 = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v12;
  v33.origin.y = v14;
  v33.size.width = v16;
  v33.size.height = v18;
  v30 = MinX - CGRectGetMinX(v33);
  v34.origin.x = v4;
  v34.origin.y = rect;
  v34.size.width = v8;
  v34.size.height = v10;
  MinY = CGRectGetMinY(v34);
  v35.origin.x = v12;
  v35.origin.y = v14;
  v35.size.width = v16;
  v35.size.height = v18;
  v29 = MinY - CGRectGetMinY(v35);
  v36.origin.x = v12;
  v36.origin.y = v14;
  v36.size.width = v16;
  v36.size.height = v18;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = v28;
  v37.origin.y = rect;
  v37.size.width = v8;
  v37.size.height = v10;
  v22 = MaxX - CGRectGetMaxX(v37);
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = v28;
  v39.origin.y = rect;
  v39.size.width = v8;
  v39.size.height = v10;
  v24 = MaxY - CGRectGetMaxY(v39);
  v25 = v29;
  v26 = v30;
  v27 = v22;
  result.right = v27;
  result.bottom = v24;
  result.left = v26;
  result.top = v25;
  return result;
}

- (void)_commonPLContactPhotoOverlayInitialization
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UIImageView *v9;

  -[PLContactPhotoOverlay setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  self->_titleLabel = v8;
  -[UILabel setFont:](v8, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]), 18.0));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
  -[PLContactPhotoOverlay addSubview:](self, "addSubview:", self->_titleLabel);
  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v4, v5, v6, v7);
  self->__avatarPreview = v9;
  -[PLContactPhotoOverlay addSubview:](self, "addSubview:", v9);
}

- (PLContactPhotoOverlay)initWithFrame:(CGRect)a3
{
  PLContactPhotoOverlay *v3;
  PLContactPhotoOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLContactPhotoOverlay;
  v3 = -[PLContactPhotoOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLContactPhotoOverlay _commonPLContactPhotoOverlayInitialization](v3, "_commonPLContactPhotoOverlayInitialization");
  return v4;
}

- (PLContactPhotoOverlay)initWithCoder:(id)a3
{
  PLContactPhotoOverlay *v3;
  PLContactPhotoOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLContactPhotoOverlay;
  v3 = -[PLContactPhotoOverlay initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PLContactPhotoOverlay _commonPLContactPhotoOverlayInitialization](v3, "_commonPLContactPhotoOverlayInitialization");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLContactPhotoOverlay;
  -[PLContactPhotoOverlay dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  CAShapeLayer *v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29.receiver = self;
  v29.super_class = (Class)PLContactPhotoOverlay;
  -[PLContactPhotoOverlay layoutSubviews](&v29, sel_layoutSubviews);
  -[PLContactPhotoOverlay bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel bounds](self->_titleLabel, "bounds");
  UIRectCenteredIntegralRectScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, CGRectGetMinY(v30) + 64.0, v14, v16, 0);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v17 = CGRectGetMinX(v31) + 15.0;
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  -[UIImageView setFrame:](self->__avatarPreview, "setFrame:", v17, CGRectGetMinY(v32) + 30.0, 60.0, 60.0);
  -[PLContactPhotoOverlay inscribingBounds](self, "inscribingBounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v4, v6, v8, v10);
  objc_msgSend(v26, "appendPath:", objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", v19, v21, v23, v25));
  objc_msgSend(v26, "setUsesEvenOddFillRule:", 1);
  v27 = -[PLContactPhotoOverlay circularLayer](self, "circularLayer");
  if (!v27)
  {
    v28 = (void *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    objc_msgSend(v28, "setPath:", objc_msgSend(v26, "CGPath"));
    objc_msgSend(v28, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    objc_msgSend(v28, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.043, 0.043, 0.043, 0.73), "CGColor"));
    objc_msgSend((id)-[PLContactPhotoOverlay layer](self, "layer"), "addSublayer:", v28);
    -[PLContactPhotoOverlay bringSubviewToFront:](self, "bringSubviewToFront:", self->_titleLabel);
    -[PLContactPhotoOverlay setCircularLayer:](self, "setCircularLayer:", v28);
  }
  -[CAShapeLayer setPath:](v27, "setPath:", objc_msgSend(v26, "CGPath"));
}

- (CGRect)inscribingBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[PLContactPhotoOverlay bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v6 = CGRectGetWidth(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v7 = CGRectGetHeight(v17);
  if (v6 < v7)
    v7 = v6;
  v8 = v7 + -30.0;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v9 = CGRectGetWidth(v18);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v8;
  v19.size.height = v8;
  v10 = (v9 - CGRectGetWidth(v19)) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v11 = CGRectGetHeight(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v8;
  v21.size.height = v8;
  v12 = (v11 - CGRectGetHeight(v21)) * 0.5;
  v13 = v10;
  v14 = v8;
  v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)_avatarPreview
{
  return self->__avatarPreview;
}

- (CAShapeLayer)circularLayer
{
  return self->_circularLayer;
}

- (void)setCircularLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

@end
