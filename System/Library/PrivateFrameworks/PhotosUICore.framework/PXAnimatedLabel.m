@implementation PXAnimatedLabel

- (void)commonInit
{
  UILabel *v3;
  void *v4;
  void *v5;
  UILabel *label;
  UILabel *v7;
  PXAnimatedCounter *v8;
  PXAnimatedCounter *counter;
  PXAnimatedCounter *v10;
  id v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *counterWidthConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
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
  void *v46;
  void *v47;
  _QWORD v48[13];

  v48[11] = *MEMORY[0x1E0C80C00];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v3, "setTextColor:", v5);

  label = self->_label;
  self->_label = v3;
  v7 = v3;

  v8 = -[PXAnimatedCounter initWithNumber:]([PXAnimatedCounter alloc], "initWithNumber:", 0);
  -[PXAnimatedCounter setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXAnimatedCounter setHidden:](v8, "setHidden:", 1);
  counter = self->_counter;
  self->_counter = v8;
  v10 = v8;

  v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", v10);
  objc_msgSend(v11, "addSubview:", v7);
  -[PXAnimatedLabel addSubview:](self, "addSubview:", v11);
  -[PXAnimatedCounter widthAnchor](v10, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  counterWidthConstraint = self->_counterWidthConstraint;
  self->_counterWidthConstraint = v13;

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[PXAnimatedCounter topAnchor](v10, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v45;
  -[PXAnimatedCounter bottomAnchor](v10, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v42;
  -[PXAnimatedCounter leadingAnchor](v10, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v39;
  -[PXAnimatedCounter trailingAnchor](v10, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v7, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v36;
  -[UILabel trailingAnchor](v7, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v32;
  -[UILabel bottomAnchor](v7, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v29;
  -[UILabel topAnchor](v7, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v26;
  objc_msgSend(v11, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedLabel topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v23;
  objc_msgSend(v11, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedLabel bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v17;
  objc_msgSend(v11, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedLabel centerXAnchor](self, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_counterWidthConstraint;
  v48[9] = v20;
  v48[10] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v22);

}

- (PXAnimatedLabel)initWithFrame:(CGRect)a3
{
  PXAnimatedLabel *v3;
  PXAnimatedLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedLabel;
  v3 = -[PXAnimatedLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXAnimatedLabel commonInit](v3, "commonInit");
  return v4;
}

- (PXAnimatedLabel)initWithCoder:(id)a3
{
  PXAnimatedLabel *v3;
  PXAnimatedLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedLabel;
  v3 = -[PXAnimatedLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXAnimatedLabel commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedLabel;
  -[PXAnimatedLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[PXAnimatedLabel _updateConstraintsForText](self, "_updateConstraintsForText");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PXAnimatedLabel label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[PXAnimatedLabel counterWidthConstraint](self, "counterWidthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constant");
  v10 = v5 + v9;

  v11 = v10;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setText:(id)a3
{
  -[PXAnimatedLabel setText:withAnimationStyle:completionBlock:](self, "setText:withAnimationStyle:completionBlock:", a3, 0, 0);
  -[PXAnimatedLabel _updateConstraintsForText](self, "_updateConstraintsForText");
  -[PXAnimatedLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setText:(id)a3 withAnimationStyle:(int64_t)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  id v29;
  int v30;
  int v31;
  BOOL v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD);
  id v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  int64_t v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  void (**v57)(_QWORD, _QWORD);
  _QWORD v58[5];
  void (**v59)(_QWORD, _QWORD);

  v9 = a3;
  v10 = a5;
  -[PXAnimatedLabel layoutIfNeeded](self, "layoutIfNeeded");
  -[PXAnimatedLabel text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_text, a3);
  -[PXAnimatedLabel label](self, "label");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedLabel counter](self, "counter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v15 = objc_msgSend(v9, "containsDigits");
  v16 = objc_msgSend(v9, "digits");
  v17 = v14;
  v18 = v13;
  if (objc_msgSend(v11, "containsDigits"))
  {
    objc_msgSend(v12, "requiredSizeForNumber:", objc_msgSend(v12, "number"));
    v18 = v19;
    v17 = v20;
  }
  if (v15)
  {
    objc_msgSend(v12, "requiredSizeForNumber:", v16);
    v13 = v21;
    v14 = v22;
  }
  objc_msgSend(v11, "stringByRemovingDigits");
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByRemovingDigits");
  v24 = objc_claimAutoreleasedReturnValue();
  v52 = v12;
  v53 = (void *)v24;
  v54 = (void *)v23;
  v51 = v15;
  if (objc_msgSend(v9, "rangeOfDigits"))
  {
    v49 = 0;
    v25 = v11;
    v26 = v9;
  }
  else
  {
    v27 = objc_msgSend(v9, "containsDigits");
    v49 = v27;
    if (v27)
      v25 = (void *)v23;
    else
      v25 = v11;
    if (v27)
      v26 = (void *)v24;
    else
      v26 = v9;
  }
  v28 = v25;
  v29 = v26;
  v30 = objc_msgSend(v29, "isEqualToString:", v28);
  v31 = v30;
  v32 = v18 == v13 && v17 == v14;
  v50 = a4;
  v33 = v9;
  if (!v32)
  {
    v34 = v28;
    v35 = v16;
    v36 = v11;
    v37 = (void (**)(_QWORD, _QWORD))v10;
    v38 = v34;
    v39 = objc_msgSend(v29, "isEqualToString:");
    if (!v31)
      goto LABEL_21;
LABEL_20:
    objc_msgSend(v55, "text");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", v29);

    if ((v41 & 1) != 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v38 = v28;
  v35 = v16;
  v36 = v11;
  v37 = (void (**)(_QWORD, _QWORD))v10;
  v39 = 0;
  if (v30)
    goto LABEL_20;
LABEL_21:
  objc_msgSend(v55, "setText:", v29);
LABEL_22:
  if (v39)
  {
    v42 = v52;
    v43 = v35;
    if (objc_msgSend(v52, "preferredAnimationStyleForNumber:", v35) == 1)
    {
      -[PXAnimatedLabel _updateConstraintsForText](self, "_updateConstraintsForText");
      -[PXAnimatedLabel layoutIfNeeded](self, "layoutIfNeeded");
      v44 = v37;
      v45 = v36;
      v46 = v38;
      if (v51)
      {
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke;
        v58[3] = &unk_1E5140638;
        v58[4] = self;
        v59 = v44;
        objc_msgSend(v52, "setNumber:animated:completionBlock:", v43, v50 != 0, v58);
        v47 = v59;
LABEL_31:

      }
    }
    else
    {
      v44 = v37;
      v45 = v36;
      v46 = v38;
      if (v51)
      {
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke_2;
        v56[3] = &unk_1E5140638;
        v56[4] = self;
        v57 = v44;
        objc_msgSend(v52, "setNumber:animated:completionBlock:", v43, v50 != 0, v56);
        v47 = v57;
        goto LABEL_31;
      }
    }
  }
  else
  {
    v44 = v37;
    v45 = v36;
    v42 = v52;
    v48 = v35;
    v46 = v38;
    if ((v51 & v49) == 1)
    {
      objc_msgSend(v52, "setNumber:animated:", v48, v50 != 0);
      -[PXAnimatedLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      if (v44)
        v44[2](v44, 1);
    }
  }

}

- (void)setFont:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[PXAnimatedLabel label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[PXAnimatedLabel counter](self, "counter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

}

- (void)_updateConstraintsForText
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  -[PXAnimatedLabel counter](self, "counter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAnimatedLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "rangeOfDigits") || !objc_msgSend(v3, "containsDigits"))
  {
    objc_msgSend(v7, "setHidden:", 1);
    v5 = 0.0;
  }
  else
  {
    objc_msgSend(v7, "setHidden:", 0);
    objc_msgSend(v7, "requiredSizeForNumber:", objc_msgSend(v3, "digits"));
    *(float *)&v4 = v4;
    v5 = ceilf(*(float *)&v4);
  }
  -[PXAnimatedLabel counterWidthConstraint](self, "counterWidthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

}

- (UIFont)font
{
  return self->_font;
}

- (NSString)text
{
  return self->_text;
}

- (PXAnimatedCounter)counter
{
  return (PXAnimatedCounter *)objc_getProperty(self, a2, 432, 1);
}

- (void)setCounter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSLayoutConstraint)counterWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 448, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_counter, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

uint64_t __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __62__PXAnimatedLabel_setText_withAnimationStyle_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsForText");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

@end
