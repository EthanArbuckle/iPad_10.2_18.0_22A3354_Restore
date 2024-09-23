@implementation PLProgressHUD

- (PLProgressHUD)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  PLProgressHUD *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v13;
  void *v14;
  UILabel *v15;
  uint64_t v16;
  objc_super v18;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  v18.receiver = self;
  v18.super_class = (Class)PLProgressHUD;
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = -[PLProgressHUD initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2020);
    v7->_backdropView = (_UIBackdropView *)v8;
    -[PLProgressHUD addSubview:](v7, "addSubview:", v8);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
    v10 = v9;
    v19.width = 16.0;
    v19.height = 16.0;
    UIGraphicsBeginImageContextWithOptions(v19, 0, v10);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = 16.0;
    v20.size.height = 16.0;
    CGContextAddRect(CurrentContext, v20);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, 0.0, 0.0, 16.0, 16.0, 7.0, 7.0), "CGPath"));
    CGContextEOClip(CurrentContext);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = 16.0;
    v21.size.height = 16.0;
    UIRectFill(v21);
    CGContextRestoreGState(CurrentContext);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v13 = -[UIImage resizableImageWithCapInsets:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:", 7.0, 7.0, 7.0, 7.0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v13);
    objc_msgSend(v14, "setAlpha:", 0.0);
    objc_msgSend(v14, "_setBackdropMaskViewFlags:", 7);
    objc_msgSend(v14, "setAutoresizingMask:", 18);
    objc_msgSend((id)-[_UIBackdropView contentView](v7->_backdropView, "contentView"), "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend((id)-[_UIBackdropView contentView](v7->_backdropView, "contentView"), "addSubview:", v14);

    v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v3, v4, v5, v6);
    v7->_label = v15;
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[UILabel setTextColor:](v7->_label, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5));
    -[UILabel setFont:](v7->_label, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0));
    -[PLProgressHUD addSubview:](v7, "addSubview:", v7->_label);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v7->_activityIndicatorView = (UIActivityIndicatorView *)v16;
    -[PLProgressHUD addSubview:](v7, "addSubview:", v16);
    -[PLProgressHUD setOpaque:](v7, "setOpaque:", 0);
    -[PLProgressHUD setNeedsDisplay](v7, "setNeedsDisplay");
    objc_msgSend((id)-[PLProgressHUD layer](v7, "layer"), "setAllowsGroupOpacity:", 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isShowing)
    -[PLProgressHUD hide](self, "hide");

  v3.receiver = self;
  v3.super_class = (Class)PLProgressHUD;
  -[PLProgressHUD dealloc](&v3, sel_dealloc);
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[PLProgressHUD setNeedsLayout](self, "setNeedsLayout");
}

- (void)showInView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  self->_isShowing = 1;
  objc_msgSend(a3, "addSubview:", self);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
  objc_msgSend(a3, "bounds");
  v6 = v5;
  v8 = v7;
  -[PLProgressHUD sizeThatFits:](self, "sizeThatFits:", v5, v7);
  v11.size.width = v9;
  v11.size.height = v10;
  v11.origin.x = (v6 - v9) * 0.5;
  v11.origin.y = (v8 - v10) * 0.5;
  v12 = CGRectIntegral(v11);
  -[PLProgressHUD setFrame:](self, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  -[PLProgressHUD setAutoresizingMask:](self, "setAutoresizingMask:", 45);
}

- (void)hide
{
  self->_isShowing = 0;
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  -[PLProgressHUD removeFromSuperview](self, "removeFromSuperview");
}

- (void)done
{
  UIImageView *v3;

  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_activityIndicatorView, "removeFromSuperview");

  self->_activityIndicatorView = 0;
  v3 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLProgressHUDCheckmark"), PLPhotoLibraryFrameworkBundle()), "_flatImageWithColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.65)));
  self->_checkmarkView = v3;
  -[PLProgressHUD addSubview:](self, "addSubview:", v3);
  if (self->_isShowing)
    -[PLProgressHUD setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", 100);
  v7 = v6;
  v9 = v8;
  if (-[NSString length](-[UILabel text](self->_label, "text"), "length"))
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
    v12 = v11 + 5.0;
  }
  else
  {
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v12 = 0.0;
  }
  v13 = ceil(v7 + 15.0 + v12 + 15.0);
  if (v9 >= v10)
    v10 = v9;
  v14 = ceil(v10 + 15.0 + 15.0);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v14.receiver = self;
  v14.super_class = (Class)PLProgressHUD;
  -[PLProgressHUD layoutSubviews](&v14, sel_layoutSubviews);
  -[PLProgressHUD bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", 100);
  v8 = v7;
  v10 = v9;
  v11 = round((v6 - v9) * 0.5);
  -[UIActivityIndicatorView setFrame:](self->_activityIndicatorView, "setFrame:", 15.0, v11, v7, v9);
  v15.origin.x = 15.0;
  v15.origin.y = v11;
  v15.size.width = v8;
  v15.size.height = v10;
  v16.origin.x = CGRectGetMaxX(v15) + 5.0;
  v16.size.width = v4 - v16.origin.x + -15.0;
  v16.origin.y = 0.0;
  v16.size.height = v6;
  v17 = CGRectIntegral(v16);
  -[UILabel setFrame:](self->_label, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  -[UIImage size](-[UIImageView image](self->_checkmarkView, "image"), "size");
  v18.size.width = v12;
  v18.size.height = v13;
  v18.origin.x = 18.0;
  v18.origin.y = 18.0;
  v19 = CGRectIntegral(v18);
  -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

@end
