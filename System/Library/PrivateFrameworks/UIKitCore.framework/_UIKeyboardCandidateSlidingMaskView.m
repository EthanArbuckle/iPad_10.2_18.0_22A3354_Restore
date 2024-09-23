@implementation _UIKeyboardCandidateSlidingMaskView

- (_UIKeyboardCandidateSlidingMaskView)initWithFrame:(CGRect)a3 opaqueHeight:(double)a4 fadeHeight:(double)a5
{
  double width;
  _UIKeyboardCandidateSlidingMaskView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  UIView *v14;
  void *v15;
  objc_super v17;

  width = a3.size.width;
  v17.receiver = self;
  v17.super_class = (Class)_UIKeyboardCandidateSlidingMaskView;
  v8 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    v9 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", 0.0, 0.0, width, a4);
    +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionMaskImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](v9, "setImage:", v11);
    -[UIImageView setContentMode:](v9, "setContentMode:", 0);
    v12 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, width, a4);
    +[UIColor blackColor](UIColor, "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, -a5, width, a5);
    +[UIColor blackColor](UIColor, "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIView addSubview:](v8, "addSubview:", v9);
    -[UIView addSubview:](v8, "addSubview:", v14);
    -[UIView addSubview:](v8, "addSubview:", v12);
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 10);
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 34);
    -[UIView setAutoresizingMask:](v14, "setAutoresizingMask:", 10);

  }
  return v8;
}

@end
