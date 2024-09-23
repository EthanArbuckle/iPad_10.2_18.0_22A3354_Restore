@implementation PREditingStandaloneLabelView

+ (id)newLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v2, "setNumberOfLines:", 1);
  objc_msgSend(v2, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1438]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v4);

  objc_msgSend(v2, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v2, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(v2, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (PREditingStandaloneLabelView)initWithFrame:(CGRect)a3
{
  PREditingStandaloneLabelView *v3;
  PREditingStandaloneLabelView *v4;
  NSString *text;
  uint64_t v6;
  UILabel *label;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PREditingStandaloneLabelView;
  v3 = -[PREditingStandaloneLabelView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    text = v3->_text;
    v3->_text = (NSString *)&stru_1E2186E08;

    v6 = objc_msgSend((id)objc_opt_class(), "newLabel");
    label = v4->_label;
    v4->_label = (UILabel *)v6;

    -[PREditingStandaloneLabelView addSubview:](v4, "addSubview:", v4->_label);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[PREditingStandaloneLabelView topAnchor](v4, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v4->_label, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[PREditingStandaloneLabelView leftAnchor](v4, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leftAnchor](v4->_label, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    -[PREditingStandaloneLabelView rightAnchor](v4, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel rightAnchor](v4->_label, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    -[PREditingStandaloneLabelView bottomAnchor](v4, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_label, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

  }
  return v4;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    text = self->_text;
    self->_text = v4;

    -[PREditingStandaloneLabelView setDisplayedText:](self, "setDisplayedText:", v6);
  }

}

- (void)setDisplayedText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PREditingStandaloneLabelView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[PREditingStandaloneLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)beginInteractiveTransitionToText:(id)a3
{
  id v5;
  PREditingStandaloneLabelViewInteractiveTransition *v6;
  void *v7;
  PREditingStandaloneLabelViewInteractiveTransition *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREditingStandaloneLabelView.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

  }
  v6 = [PREditingStandaloneLabelViewInteractiveTransition alloc];
  -[PREditingStandaloneLabelView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PREditingStandaloneLabelViewInteractiveTransition initWithLabel:currentText:transitionText:](v6, "initWithLabel:currentText:transitionText:", self, v7, v5);

  -[PREditingStandaloneLabelView setCurrentTransition:](self, "setCurrentTransition:", v8);
  -[PREditingStandaloneLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  return v8;
}

- (void)interactiveTransition:(id)a3 didUpdate:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PREditingStandaloneLabelView currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    if (a4 >= 0.5)
      objc_msgSend(v9, "transitionText");
    else
      objc_msgSend(v9, "currentText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingStandaloneLabelView setDisplayedText:](self, "setDisplayedText:", v8);

    v7 = v9;
  }

}

- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PREditingStandaloneLabelView currentTransition](self, "currentTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    if (a4)
      objc_msgSend(v9, "transitionText");
    else
      objc_msgSend(v9, "currentText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingStandaloneLabelView setText:](self, "setText:", v8);
    -[PREditingStandaloneLabelView setCurrentTransition:](self, "setCurrentTransition:", 0);
    -[PREditingStandaloneLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

    v7 = v9;
  }

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PREditingStandaloneLabelView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (PREditingStandaloneLabelViewInteractiveTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
