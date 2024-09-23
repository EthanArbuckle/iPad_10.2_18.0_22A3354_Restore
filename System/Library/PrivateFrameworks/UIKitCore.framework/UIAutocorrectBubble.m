@implementation UIAutocorrectBubble

- (UIAutocorrectBubble)init
{
  UIAutocorrectBubble *v2;
  UIImageView *v3;
  UIImageView *backgroundView;
  UILabel *v5;
  UILabel *textLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[11];

  v47[9] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)UIAutocorrectBubble;
  v2 = -[UIView init](&v46, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "pathForResource:ofType:", CFSTR("autocorrect_bubble_stretchable@2x"), CFSTR("png"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "resizableImageWithCapInsets:", 0.0, 5.0, 0.0, 30.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v42);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2, "addSubview:", v2->_backgroundView);
    v5 = objc_alloc_init(UILabel);
    textLabel = v2->_textLabel;
    v2->_textLabel = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v2, "addSubview:", v2->_textLabel);
    -[UILabel setText:](v2->_textLabel, "setText:", &stru_1E16EDF20);
    v7 = v2->_textLabel;
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 16.0, *(double *)off_1E167DC70);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = v2->_textLabel;
    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v29 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v2->_backgroundView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v2, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v39;
    -[UIView trailingAnchor](v2->_backgroundView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v2, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v36;
    -[UIView topAnchor](v2->_backgroundView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v33;
    -[UIView bottomAnchor](v2->_backgroundView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v2, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v30;
    -[UIView topAnchor](v2->_textLabel, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v26;
    -[UIView bottomAnchor](v2->_textLabel, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v2, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v23;
    -[UIView heightAnchor](v2, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 19.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v21;
    -[UIAutocorrectBubble textLabel](v2, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v2, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[7] = v14;
    -[UIView trailingAnchor](v2, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAutocorrectBubble textLabel](v2, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 16.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[8] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v19);

  }
  return v2;
}

- (void)updateWithAutocorrectionText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIAutocorrectBubble textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 4.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  -[UIAutocorrectBubble textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastBaselineAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UIImageView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
