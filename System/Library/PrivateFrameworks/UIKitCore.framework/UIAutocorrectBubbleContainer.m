@implementation UIAutocorrectBubbleContainer

- (UIAutocorrectBubbleContainer)init
{
  UIAutocorrectBubbleContainer *v2;
  UIAutocorrectBubbleContainer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAutocorrectBubbleContainer;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIAutocorrectBubbleContainer setReferenceRect:](v3, "setReferenceRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  }
  return v3;
}

- (void)updateWithAutocorrectionText:(id)a3 typedText:(id)a4 referenceTextView:(id)a5 referenceRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a3;
  -[UIAutocorrectBubbleContainer setTypedText:](self, "setTypedText:", a4);
  -[UIAutocorrectBubbleContainer updateFakeTextSelectionHighlightForRect:](self, "updateFakeTextSelectionHighlightForRect:", x, y, width, height);
  -[UIAutocorrectBubbleContainer updateBubbleWithAutocorrectionText:referenceRect:](self, "updateBubbleWithAutocorrectionText:referenceRect:", v12, x, y, width, height);

  -[UIAutocorrectBubbleContainer updateSelfWithRect:](self, "updateSelfWithRect:", x, y, width, height);
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)updateFakeTextSelectionHighlightForRect:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  UIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIAutocorrectBubbleContainer *v17;
  void *v18;
  void *v19;
  void *v20;
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
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];

  height = a3.size.height;
  width = a3.size.width;
  v41[4] = *MEMORY[0x1E0C80C00];
  -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(UIView);
    -[UIAutocorrectBubbleContainer setFakeTextSelectionHighlight:](self, "setFakeTextSelectionHighlight:", v7);

    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 2.0);

    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaskedCorners:", 3);

    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.349999994);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

  }
  -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (UIAutocorrectBubbleContainer *)objc_claimAutoreleasedReturnValue();

  if (v17 != self)
  {
    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v18);

    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAutocorrectBubbleContainer setHighlightWidthConstraint:](self, "setHighlightWidthConstraint:", v21);

    v36 = (void *)MEMORY[0x1E0D156E0];
    -[UIAutocorrectBubbleContainer highlightWidthConstraint](self, "highlightWidthConstraint");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v40;
    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v22;
    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v26;
    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", height);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v30);

    -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v31);

  }
  -[UIAutocorrectBubbleContainer highlightWidthConstraint](self, "highlightWidthConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constant");
  v34 = v33;

  if (v34 != width)
  {
    -[UIAutocorrectBubbleContainer highlightWidthConstraint](self, "highlightWidthConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", width);

  }
}

- (void)updateBubbleWithAutocorrectionText:(id)a3 referenceRect:(CGRect)a4
{
  double height;
  id v6;
  void *v7;
  UIAutocorrectBubble *v8;
  UITapGestureRecognizer *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
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
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];

  height = a4.size.height;
  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(UIAutocorrectBubble);
    -[UIAutocorrectBubbleContainer setBubble:](self, "setBubble:", v8);

    v9 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_didTapAutocorrectionBubble);
    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addGestureRecognizer:", v9);

  }
  -[UIView subviews](self, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if ((v13 & 1) == 0)
  {
    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v14);

    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v15);

    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAutocorrectBubbleContainer setBubbleTopConstraint:](self, "setBubbleTopConstraint:", v20);

    v21 = (void *)MEMORY[0x1E0D156E0];
    -[UIAutocorrectBubbleContainer bubbleTopConstraint](self, "bubbleTopConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    -[UIAutocorrectBubbleContainer bubble](self, "bubble");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v27);

  }
  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateWithAutocorrectionText:", v6);

}

- (void)updateSelfWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  _QWORD v39[5];
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39[4] = *MEMORY[0x1E0C80C00];
  -[UIAutocorrectBubbleContainer referenceRect](self, "referenceRect");
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  if (!CGRectEqualToRect(v40, v41))
  {
    -[UIAutocorrectBubbleContainer xConstraint](self, "xConstraint");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_9;
    v9 = (void *)v8;
    -[UIAutocorrectBubbleContainer yConstraint](self, "yConstraint");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[UIAutocorrectBubbleContainer widthConstraint](self, "widthConstraint");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        -[UIAutocorrectBubbleContainer heightConstraint](self, "heightConstraint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
LABEL_13:
          -[UIAutocorrectBubbleContainer xConstraint](self, "xConstraint");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setConstant:", x);

          -[UIAutocorrectBubbleContainer yConstraint](self, "yConstraint");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setConstant:", y);

          -[UIAutocorrectBubbleContainer setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
          return;
        }
LABEL_9:
        -[UIView widthAnchor](self, "widthAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAutocorrectBubbleContainer bubble](self, "bubble");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "widthAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "constraintEqualToAnchor:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAutocorrectBubbleContainer setWidthConstraint:](self, "setWidthConstraint:", v18);

        -[UIView heightAnchor](self, "heightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToConstant:", height + 19.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAutocorrectBubbleContainer setHeightConstraint:](self, "setHeightConstraint:", v20);

        -[UIView leftAnchor](self, "leftAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView superview](self, "superview");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v22, "leftAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, x);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAutocorrectBubbleContainer setXConstraint:](self, "setXConstraint:", v24);

        -[UIView superview](self, "superview");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        LOBYTE(v22) = objc_opt_isKindOfClass();

        if ((v22 & 1) != 0)
        {
          -[UIView superview](self, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView topAnchor](self, "topAnchor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "contentLayoutGuide");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "topAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, y);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAutocorrectBubbleContainer setYConstraint:](self, "setYConstraint:", v30);

        }
        else
        {
          -[UIView topAnchor](self, "topAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView superview](self, "superview");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "topAnchor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, y);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIAutocorrectBubbleContainer setYConstraint:](self, "setYConstraint:", v29);
        }

        v31 = (void *)MEMORY[0x1E0D156E0];
        -[UIAutocorrectBubbleContainer widthConstraint](self, "widthConstraint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v32;
        -[UIAutocorrectBubbleContainer heightConstraint](self, "heightConstraint");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v33;
        -[UIAutocorrectBubbleContainer xConstraint](self, "xConstraint");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v39[2] = v34;
        -[UIAutocorrectBubbleContainer yConstraint](self, "yConstraint");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v39[3] = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "activateConstraints:", v36);

        goto LABEL_13;
      }

    }
    goto LABEL_9;
  }
}

- (id)createTypedTextViewWithTypedText:(id)a3
{
  id v4;
  UITextView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(UITextView);
  -[UITextView setText:](v5, "setText:", v4);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v5, "setTextColor:", v6);

  +[UIColor blackColor](UIColor, "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v7);

  -[UITextView setTextContainerInset:](v5, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  -[UITextView textContainer](v5, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

  objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 16.0, *(double *)off_1E167DC70);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v5, "setFont:", v9);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAlpha:](v5, "setAlpha:", 1.0);
  -[UIView addSubview:](self, "addSubview:", v5);
  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView insertSubview:below:](self, "insertSubview:below:", v5, v10);

  v22 = (void *)MEMORY[0x1E0D156E0];
  -[UIView widthAnchor](v5, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  objc_msgSend(v23, "constraintEqualToConstant:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  -[UIView heightAnchor](v5, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  objc_msgSend(v12, "constraintLessThanOrEqualToConstant:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  -[UIView leadingAnchor](v5, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v19);

  -[UIAutocorrectBubbleContainer setTypedTextAnimationPlaceholder:](self, "setTypedTextAnimationPlaceholder:", v5);
  -[UIAutocorrectBubbleContainer typedTextAnimationPlaceholder](self, "typedTextAnimationPlaceholder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)dismissAutocorrectBubble
{
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fadeAutocorrectPrompt");

  -[UIAutocorrectBubbleContainer performReset](self, "performReset");
}

- (void)animateAutocorrectionAccepted
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[UIAutocorrectBubbleContainer typedText](self, "typedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIAutocorrectBubbleContainer createTypedTextViewWithTypedText:](self, "createTypedTextViewWithTypedText:", v3);

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_5;
  v5[3] = &unk_1E16B3FD8;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v6, v5, 0.5, 0.0);
}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_2;
  v6[3] = &unk_1E16B1B28;
  v6[4] = *(_QWORD *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.0, 0.0);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_3;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_4;
  v4[3] = &unk_1E16B1B28;
  v4[4] = *(_QWORD *)(a1 + 32);
  return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.75, 0.25);
}

void __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "fakeTextSelectionHighlight");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "bubbleTopConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 1.0);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "typedTextAnimationPlaceholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "bubble");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __61__UIAutocorrectBubbleContainer_animateAutocorrectionAccepted__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performReset");
}

- (void)reset
{
  if (!-[UIAutocorrectBubbleContainer isViewAnimating](self, "isViewAnimating"))
    -[UIAutocorrectBubbleContainer performReset](self, "performReset");
}

- (BOOL)isViewAnimating
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)performReset
{
  void *v3;
  void *v4;
  void *v5;

  -[UIAutocorrectBubbleContainer setBubbleTopConstraint:](self, "setBubbleTopConstraint:", 0);
  -[UIAutocorrectBubbleContainer setHighlightWidthConstraint:](self, "setHighlightWidthConstraint:", 0);
  -[UIAutocorrectBubbleContainer setWidthConstraint:](self, "setWidthConstraint:", 0);
  -[UIAutocorrectBubbleContainer setHeightConstraint:](self, "setHeightConstraint:", 0);
  -[UIAutocorrectBubbleContainer setXConstraint:](self, "setXConstraint:", 0);
  -[UIAutocorrectBubbleContainer setYConstraint:](self, "setYConstraint:", 0);
  -[UIAutocorrectBubbleContainer setReferenceRect:](self, "setReferenceRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[UIAutocorrectBubbleContainer fakeTextSelectionHighlight](self, "fakeTextSelectionHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIAutocorrectBubbleContainer bubble](self, "bubble");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[UIAutocorrectBubbleContainer setFakeTextSelectionHighlight:](self, "setFakeTextSelectionHighlight:", 0);
  -[UIAutocorrectBubbleContainer setBubble:](self, "setBubble:", 0);
  -[UIAutocorrectBubbleContainer typedTextAnimationPlaceholder](self, "typedTextAnimationPlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIAutocorrectBubbleContainer setTypedTextAnimationPlaceholder:](self, "setTypedTextAnimationPlaceholder:", 0);
  -[UIView removeFromSuperview](self, "removeFromSuperview");
}

- (NSString)typedText
{
  return self->_typedText;
}

- (void)setTypedText:(id)a3
{
  objc_storeStrong((id *)&self->_typedText, a3);
}

- (CGRect)referenceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceRect.origin.x;
  y = self->_referenceRect.origin.y;
  width = self->_referenceRect.size.width;
  height = self->_referenceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (UIAutocorrectBubble)bubble
{
  return self->_bubble;
}

- (void)setBubble:(id)a3
{
  objc_storeStrong((id *)&self->_bubble, a3);
}

- (UIView)fakeTextSelectionHighlight
{
  return self->_fakeTextSelectionHighlight;
}

- (void)setFakeTextSelectionHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_fakeTextSelectionHighlight, a3);
}

- (UIView)typedTextAnimationPlaceholder
{
  return self->_typedTextAnimationPlaceholder;
}

- (void)setTypedTextAnimationPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_typedTextAnimationPlaceholder, a3);
}

- (NSLayoutConstraint)highlightWidthConstraint
{
  return self->_highlightWidthConstraint;
}

- (void)setHighlightWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_highlightWidthConstraint, a3);
}

- (NSLayoutConstraint)bubbleTopConstraint
{
  return self->_bubbleTopConstraint;
}

- (void)setBubbleTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleTopConstraint, a3);
}

- (NSLayoutConstraint)xConstraint
{
  return self->_xConstraint;
}

- (void)setXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_xConstraint, a3);
}

- (NSLayoutConstraint)yConstraint
{
  return self->_yConstraint;
}

- (void)setYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_yConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_yConstraint, 0);
  objc_storeStrong((id *)&self->_xConstraint, 0);
  objc_storeStrong((id *)&self->_bubbleTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightWidthConstraint, 0);
  objc_storeStrong((id *)&self->_typedTextAnimationPlaceholder, 0);
  objc_storeStrong((id *)&self->_fakeTextSelectionHighlight, 0);
  objc_storeStrong((id *)&self->_bubble, 0);
  objc_storeStrong((id *)&self->_typedText, 0);
}

@end
