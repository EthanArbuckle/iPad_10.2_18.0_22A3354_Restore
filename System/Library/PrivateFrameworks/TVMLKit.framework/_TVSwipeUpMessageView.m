@implementation _TVSwipeUpMessageView

- (_TVSwipeUpMessageView)initWithFrame:(CGRect)a3
{
  _TVSwipeUpMessageView *v3;
  uint64_t v4;
  _TVImageView *chevronView;
  _TVImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  UILabel *messageView;
  void *v18;
  uint64_t v19;
  id *v20;
  id v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_TVSwipeUpMessageView;
  v3 = -[_TVSwipeUpMessageView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    chevronView = v3->_chevronView;
    v3->_chevronView = (_TVImageView *)v4;

    -[_TVImageView setAlpha:](v3->_chevronView, "setAlpha:", 0.0);
    v6 = v3->_chevronView;
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_resourceImageNamed:", CFSTR("icon_chevron_up"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVImageView setImage:](v6, "setImage:", v8);

    -[_TVImageView layer](v3->_chevronView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    -[_TVImageView layer](v3->_chevronView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowOffset:", 0.0, 2.0);

    -[_TVImageView layer](v3->_chevronView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowRadius:", 4.0);

    -[_TVImageView layer](v3->_chevronView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1.0;
    objc_msgSend(v14, "setShadowOpacity:", v15);

    -[_TVSwipeUpMessageView addSubview:](v3, "addSubview:", v3->_chevronView);
    v16 = objc_opt_new();
    messageView = v3->_messageView;
    v3->_messageView = (UILabel *)v16;

    -[UILabel setAlpha:](v3->_messageView, "setAlpha:", 0.0);
    -[UILabel setNumberOfLines:](v3->_messageView, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v3->_messageView, "setTextAlignment:", 1);
    -[_TVSwipeUpMessageView traitCollection](v3, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceStyle");
    v20 = (id *)MEMORY[0x24BDE5BD8];
    if (v19 != 2)
      v20 = (id *)MEMORY[0x24BDE5BD0];
    v21 = *v20;

    -[UILabel layer](v3->_messageView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCompositingFilter:", v21);

    -[_TVSwipeUpMessageView addSubview:](v3, "addSubview:", v3->_messageView);
  }
  return v3;
}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UILabel *messageView;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_message != v4 || !-[NSString isEqualToString:](v4, "isEqualToString:", v4))
  {
    if (setMessage__onceToken != -1)
      dispatch_once(&setMessage__onceToken, &__block_literal_global_22);
    +[TVMLUtilities fontFromTextStyle:fontWeight:fontSize:symbolicTraits:](TVMLUtilities, "fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", CFSTR("caption2"), CFSTR("semibold"), 0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDF6640];
    v13[0] = *MEMORY[0x24BDF65F8];
    v13[1] = v7;
    v14[0] = v6;
    v14[1] = setMessage__textShadow;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    messageView = self->_messageView;
    v10 = objc_alloc(MEMORY[0x24BDD1458]);
    v11 = (void *)-[NSString copy](v5, "copy");
    v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v8);
    -[UILabel setAttributedText:](messageView, "setAttributedText:", v12);

    -[_TVSwipeUpMessageView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (self->_swipeUpMessageState)
      -[_TVSwipeUpMessageView _processSwipeUpMessageEvent:](self, "_processSwipeUpMessageEvent:", !a3);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[_TVSwipeUpMessageView chevronView](self, "chevronView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x24BDBF148], v6);
  v8 = v7;
  v10 = v9;

  -[_TVSwipeUpMessageView messageView](self, "messageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v5, v6);
  v13 = v12;
  v15 = v14;

  v16 = fmax(v8, v13);
  v17 = v10 + 6.0 + v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _TVImageView *chevronView;
  void *v21;
  UILabel *messageView;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_TVSwipeUpMessageView;
  -[_TVSwipeUpMessageView layoutSubviews](&v24, sel_layoutSubviews);
  -[_TVSwipeUpMessageView bounds](self, "bounds");
  v4 = v3;
  -[_TVSwipeUpMessageView chevronView](self, "chevronView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v7 = v6;
  v9 = v8;

  -[_TVSwipeUpMessageView chevronView](self, "chevronView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4 * 0.5;
  objc_msgSend(v10, "setCenter:", v11, v9 * 0.5);

  -[_TVSwipeUpMessageView chevronView](self, "chevronView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v7, v9);

  -[_TVSwipeUpMessageView messageView](self, "messageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", 468.0, 0.0);
  v15 = v14;
  v17 = v16;

  -[_TVSwipeUpMessageView messageView](self, "messageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCenter:", v11, v9 + 6.0 + v17 * 0.5);

  -[_TVSwipeUpMessageView messageView](self, "messageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v15, v17);

  chevronView = self->_chevronView;
  -[_TVSwipeUpMessageView tintColor](self, "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVImageView _setTintColor:](chevronView, "_setTintColor:", v21);

  messageView = self->_messageView;
  -[_TVSwipeUpMessageView tintColor](self, "tintColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](messageView, "setTextColor:", v23);

  if (!self->_swipeUpMessageState)
    -[_TVSwipeUpMessageView _processSwipeUpMessageEvent:](self, "_processSwipeUpMessageEvent:", 2);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TVSwipeUpMessageView;
  -[_TVSwipeUpMessageView traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  -[_TVSwipeUpMessageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "userInterfaceStyle"))
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "userInterfaceStyle");
  -[_TVSwipeUpMessageView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v6 != v8)
  {
    -[_TVSwipeUpMessageView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");
    v11 = (id *)MEMORY[0x24BDE5BD8];
    if (v10 != 2)
      v11 = (id *)MEMORY[0x24BDE5BD0];
    v12 = *v11;

    -[UILabel layer](self->_messageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v12);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)_processSwipeUpMessageEvent:(int)a3
{
  int swipeUpMessageState;
  int v5;
  BOOL v6;
  int v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  CGAffineTransform v13;

  swipeUpMessageState = self->_swipeUpMessageState;
  switch(swipeUpMessageState)
  {
    case 0:
      if (a3 == 2)
      {
        if (-[_TVSwipeUpMessageView isEnabled](self, "isEnabled"))
          v5 = 3;
        else
          v5 = 1;
        goto LABEL_23;
      }
      return;
    case 1:
      if (a3)
        v5 = 1;
      else
        v5 = 3;
      goto LABEL_23;
    case 2:
      v6 = a3 == 1;
      v5 = 2;
      v7 = 4;
      goto LABEL_17;
    case 3:
      if (a3 == 1)
        v5 = 4;
      else
        v5 = 3;
      if (a3 == 2)
        v5 = 2;
      goto LABEL_23;
    case 4:
      if (a3 == 2)
        v5 = 1;
      else
        v5 = 4;
      v6 = a3 == 0;
      v7 = 3;
LABEL_17:
      if (v6)
        v5 = v7;
LABEL_23:
      if (swipeUpMessageState != v5)
      {
        self->_swipeUpMessageState = v5;
        if (v5 == 4)
        {
          v9[4] = self;
          v10[0] = MEMORY[0x24BDAC760];
          v10[1] = 3221225472;
          v10[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_4;
          v10[3] = &unk_24EB85440;
          v10[4] = self;
          v9[0] = MEMORY[0x24BDAC760];
          v9[1] = 3221225472;
          v9[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_5;
          v9[3] = &unk_24EB85A38;
          objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v10, v9, 0.25);
        }
        else if (v5 == 3)
        {
          -[_TVSwipeUpMessageView messageView](self, "messageView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          CGAffineTransformMakeTranslation(&v13, 0.0, 20.0);
          objc_msgSend(v8, "setTransform:", &v13);

          v11[4] = self;
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke;
          v12[3] = &unk_24EB85440;
          v12[4] = self;
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __53___TVSwipeUpMessageView__processSwipeUpMessageEvent___block_invoke_3;
          v11[3] = &unk_24EB85A38;
          objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v12, v11, 0.25, 0.25);
        }
      }
      break;
    default:
      return;
  }
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (_TVImageView)chevronView
{
  return self->_chevronView;
}

- (UILabel)messageView
{
  return self->_messageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
