@implementation KeyboardAvoidingView

+ (void)startObservingKeyboard
{
  id v2;

  v2 = +[KeyboardObserver sharedInstance](KeyboardObserver, "sharedInstance");
}

- (KeyboardAvoidingView)initWithContentView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  KeyboardAvoidingView *v10;
  KeyboardAvoidingView *v11;
  void *v12;
  void *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KeyboardAvoidingView;
  v10 = -[KeyboardAvoidingView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_constraintPriority = 750.0;
    -[KeyboardAvoidingView setContentView:](v10, "setContentView:", v9);
    -[KeyboardAvoidingView updateForKeyboardFrame](v11, "updateForKeyboardFrame");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "keyboardWillOrDidChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, "keyboardWillOrDidChangeFrame:", UIKeyboardDidChangeFrameNotification, 0);

  }
  return v11;
}

- (KeyboardAvoidingView)initWithContentView:(id)a3
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (KeyboardAvoidingView)initWithFrame:(CGRect)a3
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (KeyboardAvoidingView)init
{
  return -[KeyboardAvoidingView initWithContentView:frame:](self, "initWithContentView:frame:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (KeyboardAvoidingView)initWithCoder:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;

  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("-[%@ %@] not implemeneted"), v7, v9);

  return 0;
}

- (void)setConstraintPriority:(float)a3
{
  float v5;
  float v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  -[KeyboardAvoidingView constraintPriority](self, "constraintPriority");
  if (v5 != a3)
  {
    if (a3 == 1000.0 || (-[KeyboardAvoidingView constraintPriority](self, "constraintPriority"), v6 == 1000.0))
    {
      -[KeyboardAvoidingView removeConstraints](self, "removeConstraints");
      self->_constraintPriority = a3;
      -[KeyboardAvoidingView addConstraints](self, "addConstraints");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView leadingConstraint](self, "leadingConstraint"));
      *(float *)&v8 = a3;
      objc_msgSend(v7, "setPriority:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView trailingConstraint](self, "trailingConstraint"));
      *(float *)&v10 = a3;
      objc_msgSend(v9, "setPriority:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView topConstraint](self, "topConstraint"));
      *(float *)&v12 = a3;
      objc_msgSend(v11, "setPriority:", v12);

      v14 = (id)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView bottomConstraint](self, "bottomConstraint"));
      *(float *)&v13 = a3;
      objc_msgSend(v14, "setPriority:", v13);

    }
  }
}

- (void)setContentView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));

  v6 = v8;
  if (v5 != v8)
  {
    -[KeyboardAvoidingView removeConstraints](self, "removeConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeStrong((id *)&self->_contentView, a3);
    if (v8)
      -[KeyboardAvoidingView addSubview:](self, "addSubview:", v8);
    -[KeyboardAvoidingView addConstraints](self, "addConstraints");
    v6 = v8;
  }

}

- (void)updateForKeyboardFrame
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[KeyboardObserver sharedInstance](KeyboardObserver, "sharedInstance"));
  objc_msgSend(v3, "keyboardFrame");
  -[KeyboardAvoidingView updateForKeyboardFrame:](self, "updateForKeyboardFrame:");

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KeyboardAvoidingView;
  -[KeyboardAvoidingView updateConstraints](&v3, "updateConstraints");
  -[KeyboardAvoidingView updateForKeyboardFrame](self, "updateForKeyboardFrame");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)KeyboardAvoidingView;
  -[KeyboardAvoidingView layoutSubviews](&v3, "layoutSubviews");
  -[KeyboardAvoidingView updateForKeyboardFrame](self, "updateForKeyboardFrame");
}

- (void)addConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView leadingAnchor](self, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    -[KeyboardAvoidingView setLeadingConstraint:](self, "setLeadingConstraint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView trailingAnchor](self, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    -[KeyboardAvoidingView setTrailingConstraint:](self, "setTrailingConstraint:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView topAnchor](self, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    -[KeyboardAvoidingView setTopConstraint:](self, "setTopConstraint:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView bottomAnchor](self, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    -[KeyboardAvoidingView setBottomConstraint:](self, "setBottomConstraint:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView leadingConstraint](self, "leadingConstraint"));
    v25[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView trailingConstraint](self, "trailingConstraint"));
    v25[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView topConstraint](self, "topConstraint"));
    v25[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView bottomConstraint](self, "bottomConstraint"));
    v25[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  }
}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView leadingConstraint](self, "leadingConstraint"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView leadingConstraint](self, "leadingConstraint"));
    v9[0] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView trailingConstraint](self, "trailingConstraint"));
    v9[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView topConstraint](self, "topConstraint"));
    v9[2] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView bottomConstraint](self, "bottomConstraint"));
    v9[3] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v8);

    -[KeyboardAvoidingView setLeadingConstraint:](self, "setLeadingConstraint:", 0);
    -[KeyboardAvoidingView setTrailingConstraint:](self, "setTrailingConstraint:", 0);
    -[KeyboardAvoidingView setTopConstraint:](self, "setTopConstraint:", 0);
    -[KeyboardAvoidingView setBottomConstraint:](self, "setBottomConstraint:", 0);
  }
}

- (void)keyboardWillOrDidChangeFrame:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));

  if (v9)
  {
    objc_msgSend(v9, "CGRectValue");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  -[KeyboardAvoidingView updateForKeyboardFrame:](self, "updateForKeyboardFrame:", x, y, width, height);

}

- (void)updateForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL IsNull;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MidY;
  double v16;
  double MaxY;
  double v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsNull = CGRectIsNull(a3);
  v9 = 0.0;
  v10 = 0.0;
  if (!IsNull)
  {
    -[KeyboardAvoidingView convertRect:fromView:](self, "convertRect:fromView:", 0, x, y, width, height);
    v11 = v21.origin.x;
    v12 = v21.origin.y;
    v13 = v21.size.width;
    v14 = v21.size.height;
    MidY = CGRectGetMidY(v21);
    -[KeyboardAvoidingView bounds](self, "bounds");
    if (MidY >= CGRectGetMidY(v22))
    {
      -[KeyboardAvoidingView bounds](self, "bounds");
      MaxY = CGRectGetMaxY(v25);
      v26.origin.x = v11;
      v26.origin.y = v12;
      v26.size.width = v13;
      v26.size.height = v14;
      v9 = MaxY - CGRectGetMinY(v26);
      v10 = 0.0;
    }
    else
    {
      v23.origin.x = v11;
      v23.origin.y = v12;
      v23.size.width = v13;
      v23.size.height = v14;
      v16 = CGRectGetMaxY(v23);
      -[KeyboardAvoidingView bounds](self, "bounds");
      v10 = v16 - CGRectGetMinY(v24);
      v9 = 0.0;
    }
  }
  v18 = fmax(v10, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView topConstraint](self, "topConstraint"));
  objc_msgSend(v19, "setConstant:", v18);

  v20 = (id)objc_claimAutoreleasedReturnValue(-[KeyboardAvoidingView bottomConstraint](self, "bottomConstraint"));
  objc_msgSend(v20, "setConstant:", fmin(-v9, 0.0));

}

- (float)constraintPriority
{
  return self->_constraintPriority;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
