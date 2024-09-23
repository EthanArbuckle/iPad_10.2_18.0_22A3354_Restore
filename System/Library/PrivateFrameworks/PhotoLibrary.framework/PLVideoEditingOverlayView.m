@implementation PLVideoEditingOverlayView

- (PLVideoEditingOverlayView)initWithFrame:(CGRect)a3
{
  PLVideoEditingOverlayView *v3;
  PLVideoEditingOverlayView *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UILabel *v9;
  double v10;
  UITextView *v11;
  id v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.receiver = self;
  v14.super_class = (Class)PLVideoEditingOverlayView;
  v3 = -[PLVideoEditingOverlayView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLVideoEditingOverlayView bounds](v3, "bounds");
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", 0.0, 16.0, CGRectGetWidth(v15), 32.0);
    v4->_titleLabel = v9;
    -[UILabel setOpaque:](v9, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v4->_titleLabel, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0));
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[PLVideoEditingOverlayView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[UILabel setAutoresizingMask:](v4->_titleLabel, "setAutoresizingMask:", 34);

    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v10 = CGRectGetWidth(v16);
    -[PLVideoEditingOverlayView bounds](v4, "bounds");
    v11 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB18]), "initWithFrame:textContainer:", 0, 0.0, 48.0, v10, CGRectGetMaxY(v17) + -48.0);
    v4->_bodyLabel = v11;
    -[UITextView setEditable:](v11, "setEditable:", 0);
    -[UITextView setSelectable:](v4->_bodyLabel, "setSelectable:", 0);
    -[UITextView setTextContainerInset:](v4->_bodyLabel, "setTextContainerInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    -[UITextView setOpaque:](v4->_bodyLabel, "setOpaque:", 0);
    -[UITextView setBackgroundColor:](v4->_bodyLabel, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[UITextView setFont:](v4->_bodyLabel, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0));
    -[UITextView setTextAlignment:](v4->_bodyLabel, "setTextAlignment:", 1);
    -[PLVideoEditingOverlayView addSubview:](v4, "addSubview:", v4->_bodyLabel);
    -[UITextView setAutoresizingMask:](v4->_bodyLabel, "setAutoresizingMask:", 34);

    -[PLVideoEditingOverlayView setOpaque:](v4, "setOpaque:", 0);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2020);
    -[PLVideoEditingOverlayView addSubview:](v4, "addSubview:", v12);
    -[PLVideoEditingOverlayView sendSubviewToBack:](v4, "sendSubviewToBack:", v12);
    -[PLVideoEditingOverlayView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend((id)-[PLVideoEditingOverlayView layer](v4, "layer"), "setCornerRadius:", 9.0);
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[PLVideoEditingOverlayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBody:(id)a3
{
  -[UITextView setText:](self->_bodyLabel, "setText:", a3);
  -[PLVideoEditingOverlayView setNeedsLayout](self, "setNeedsLayout");
}

@end
