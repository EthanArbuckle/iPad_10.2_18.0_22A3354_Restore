@implementation UIKeyboardHostedCandidateInlineFloatingView

- (BOOL)hostInlineRectIsVertical
{
  UIKeyboardHostedCandidateInlineFloatingView *v2;
  char v3;

  v2 = self;
  v3 = sub_1856A8578();

  return v3 & 1;
}

- (UIKeyboardHostedCandidateInlineFloatingView)initWithContainer:(id)a3 delegate:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  UIKeyboardHostedCandidateInlineFloatingView *v11;
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
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = a4;
  v10 = a3;
  v11 = -[UIKeyboardCandidateInlineFloatingView initWithFrame:](&v32, sel_initWithFrame_, v5, v6, v7, v8);
  -[UIView setClipsToBounds:](v11, "setClipsToBounds:", 1);
  objc_msgSend(v10, "addSubview:", v11);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIKeyboardHostedCandidateInlineFloatingView setDelegate:](v11, "setDelegate:", v9);

  +[UIColor clearColor](UIColor, "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v13);

  objc_msgSend(v10, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", 22.0);

  -[UIView layer](v11, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", 18.0);

  v27 = (void *)MEMORY[0x1E0D156E0];
  -[UIView topAnchor](v11, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 4.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v29;
  -[UIView leadingAnchor](v11, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v16, 4.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v17;
  -[UIView trailingAnchor](v11, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -4.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v20;
  -[UIView bottomAnchor](v11, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -4.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v24);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", v11, sel_hostIsTextVerticalDidChange_, CFSTR("_UIKeyboardCandidateInlineFloatingViewHostIsTextVerticalDidChangeNotification"), 0);

  return v11;
}

- (BOOL)shouldExtendUpwards
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIKeyboardHostedCandidateInlineFloatingView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostedInlineFloatingViewFrameUpdated");

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardHostedCandidateInlineFloatingView;
  -[UIView setHidden:](&v7, sel_setHidden_);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("_UIKeyboardCandidateInlineFloatingViewHiddenDidChangeHiddenKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("_UIKeyboardCandidateInlineFloatingViewHiddenDidChangeNotification"), 0, v6);

}

- (void)hostIsTextVerticalDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isVertical"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[UIKeyboardHostedCandidateInlineFloatingView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostedInlineFloatingViewIsTextVerticalUpdated:", v5);

}

- (UIKeyboardHostedCandidateInlineFloatingViewDelegate)delegate
{
  return (UIKeyboardHostedCandidateInlineFloatingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
