@implementation TSKPlaceholderTextView

- (TSKPlaceholderTextView)initWithFrame:(CGRect)a3
{
  TSKPlaceholderTextView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKPlaceholderTextView;
  v3 = -[TSKPlaceholderTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[TSKPlaceholderTextView setFont:](v3, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_p_textDidChange_, *MEMORY[0x24BDF7F70], v3);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7F70], self);

  self->mPlaceholderView = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView dealloc](&v4, sel_dealloc);
}

- (NSString)placeholder
{
  return -[UILabel text](self->mPlaceholderView, "text");
}

- (void)setPlaceholder:(id)a3
{
  UILabel *mPlaceholderView;
  CGRect v6;
  CGRect v7;

  mPlaceholderView = self->mPlaceholderView;
  if (!mPlaceholderView)
  {
    -[TSKPlaceholderTextView frame](self, "frame");
    v7 = CGRectInset(v6, 2.0, 0.0);
    self->mPlaceholderView = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
    -[UILabel setTextAlignment:](self->mPlaceholderView, "setTextAlignment:", -[TSKPlaceholderTextView textAlignment](self, "textAlignment"));
    -[UILabel setFont:](self->mPlaceholderView, "setFont:", -[TSKPlaceholderTextView font](self, "font"));
    -[UILabel setTextColor:](self->mPlaceholderView, "setTextColor:", -[TSKPlaceholderTextView textColor](self, "textColor"));
    -[UILabel setAlpha:](self->mPlaceholderView, "setAlpha:", 0.600000024);
    -[UILabel setOpaque:](self->mPlaceholderView, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](self->mPlaceholderView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[UILabel setAdjustsFontSizeToFitWidth:](self->mPlaceholderView, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumFontSize:](self->mPlaceholderView, "setMinimumFontSize:", 12.0);
    objc_msgSend((id)-[TSKPlaceholderTextView superview](self, "superview"), "insertSubview:belowSubview:", self->mPlaceholderView, self);
    mPlaceholderView = self->mPlaceholderView;
  }
  -[UILabel setText:](mPlaceholderView, "setText:", a3);
  -[UILabel setHidden:](self->mPlaceholderView, "setHidden:", objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text"), "length") != 0);
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setFrame:](&v8, sel_setFrame_);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  v10 = CGRectInset(v9, 6.0, 0.0);
  -[UILabel setFrame:](self->mPlaceholderView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
}

- (void)setTextAlignment:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setTextAlignment:](&v5, sel_setTextAlignment_);
  -[UILabel setTextAlignment:](self->mPlaceholderView, "setTextAlignment:", a3);
}

- (void)setFont:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setFont:](&v5, sel_setFont_);
  -[UILabel setFont:](self->mPlaceholderView, "setFont:", a3);
}

- (void)setTextColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setTextColor:](&v5, sel_setTextColor_);
  -[UILabel setTextColor:](self->mPlaceholderView, "setTextColor:", a3);
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UILabel removeFromSuperview](self->mPlaceholderView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  objc_msgSend((id)-[TSKPlaceholderTextView superview](self, "superview"), "insertSubview:belowSubview:", self->mPlaceholderView, self);
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKPlaceholderTextView;
  -[TSKPlaceholderTextView setText:](&v4, sel_setText_, a3);
  -[UILabel setHidden:](self->mPlaceholderView, "setHidden:", objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text"), "length") != 0);
}

- (void)p_textDidChange:(id)a3
{
  -[UILabel setHidden:](self->mPlaceholderView, "setHidden:", objc_msgSend((id)-[TSKPlaceholderTextView text](self, "text", a3), "length") != 0);
}

- (BOOL)becomeFirstResponder
{
  int v3;
  objc_super v5;

  v3 = -[TSKPlaceholderTextView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSKPlaceholderTextView;
    LOBYTE(v3) = -[TSKPlaceholderTextView becomeFirstResponder](&v5, sel_becomeFirstResponder);
  }
  return v3;
}

@end
