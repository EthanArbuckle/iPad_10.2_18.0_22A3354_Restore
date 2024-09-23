@implementation _UITextChoiceAccelerationBubble

- (void)reset
{
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *selectedChoice;
  TIKeyboardCandidate *selectedCandidateChoice;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIView alpha](self, "alpha");
  if (v3 == 0.0)
    -[_UITextChoiceAccelerationBubble removeFromSuperview](self, "removeFromSuperview");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "setState:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setState:", 0);

  -[_UITextChoiceAccelerationBubble setCandidate:](self, "setCandidate:", 0);
  selectedChoice = self->_selectedChoice;
  self->_selectedChoice = 0;

  selectedCandidateChoice = self->_selectedCandidateChoice;
  self->_selectedCandidateChoice = 0;

}

- (_UITextOption)sideButton
{
  return self->_sideButton;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (UIStackView)contentsView
{
  return self->_contentsView;
}

- (_UITextChoiceAccelerationBubble)initWithFrame:(CGRect)a3
{
  _UITextChoiceAccelerationBubble *v3;
  _UITextChoiceAccelerationBubble *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITextChoiceAccelerationBubble;
  v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UITextChoiceAccelerationBubble setReferenceRect:](v4, "setReferenceRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[_UITextChoiceAccelerationBubble setNeedsRTLCheck:](v4, "setNeedsRTLCheck:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_inputModeDidChange_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

  }
  return v4;
}

- (void)setReferenceRect:(CGRect)a3
{
  self->_referenceRect = a3;
}

- (void)setNeedsRTLCheck:(BOOL)a3
{
  self->_needsRTLCheck = a3;
}

- (UIView)textHighlightView
{
  return self->_textHighlightView;
}

- (_UITextChoiceAccelerationBubble)init
{
  return -[_UITextChoiceAccelerationBubble initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)updateTextAnchorForParentView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
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
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_UITextChoiceAccelerationBubble parentView](self, "parentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 != v4)
    {

LABEL_4:
      -[UIView superview](self, "superview");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 != v4)
      {
        -[_UITextChoiceAccelerationBubble removeFromSuperview](self, "removeFromSuperview");
        objc_msgSend(v4, "addSubview:", self);
      }
      -[_UITextChoiceAccelerationBubble setParentView:](self, "setParentView:", v4);
      -[_UITextChoiceAccelerationBubble anchorToTextIfNeeded](self, "anchorToTextIfNeeded");
      -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isActive");

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v10;
        -[_UITextChoiceAccelerationBubble anchorTop](self, "anchorTop");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deactivateConstraints:", v12);

      }
      -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leftAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leftAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setAnchorLeading:](self, "setAnchorLeading:", v16);

      -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setAnchorTop:](self, "setAnchorTop:", v20);

      v21 = (void *)MEMORY[0x1E0D156E0];
      -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v22;
      -[_UITextChoiceAccelerationBubble anchorTop](self, "anchorTop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v55[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v24);

      -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "deactivateConstraints:", v27);

      }
      -[UIView leftAnchor](self, "leftAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "leftAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:constant:", v29, 10.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v30;
      objc_msgSend(v4, "_window");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "rightAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView rightAnchor](self, "rightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:constant:", v33, 10.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setBoundaryConstraints:](self, "setBoundaryConstraints:", v35);

      v36 = (void *)MEMORY[0x1E0D156E0];
      -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "activateConstraints:", v37);
LABEL_11:

      goto LABEL_12;
    }
    -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      goto LABEL_4;
    -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isActive");

      if ((v42 & 1) == 0)
      {
        -[_UITextChoiceAccelerationBubble parentView](self, "parentView");
        v43 = (id)objc_claimAutoreleasedReturnValue();

        if (v43 == v4)
        {
          -[UIView superview](self, "superview");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble parentView](self, "parentView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44 != v45)
          {
            -[_UITextChoiceAccelerationBubble parentView](self, "parentView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addSubview:", self);

          }
          v47 = (void *)MEMORY[0x1E0D156E0];
          -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v48;
          -[_UITextChoiceAccelerationBubble anchorTop](self, "anchorTop");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v53[1] = v49;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "activateConstraints:", v51);

          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:

}

- (void)anchorToTextIfNeeded
{
  void *v3;
  UILayoutGuide *v4;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIScrollView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIStackView *v30;
  void *v31;
  void *v32;
  UIStackView *v33;
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
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[11];
  void *v104;
  _QWORD v105[4];

  v105[2] = *MEMORY[0x1E0C80C00];
  -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(UILayoutGuide);
    -[_UITextChoiceAccelerationBubble setTextAnchor:](self, "setTextAnchor:", v4);

    -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v5);

    -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble setAnchorWidth:](self, "setAnchorWidth:", v8);

    -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble setAnchorHeight:](self, "setAnchorHeight:", v11);

    v12 = (void *)MEMORY[0x1E0D156E0];
    -[_UITextChoiceAccelerationBubble anchorHeight](self, "anchorHeight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v13;
    -[_UITextChoiceAccelerationBubble anchorWidth](self, "anchorWidth");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v15);

  }
  -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v17 = (void *)v16,
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFromSuperview");

    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeFromSuperview");

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    -[_UITextChoiceAccelerationBubble backgroundImageView](self, "backgroundImageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble setBackgroundView:](self, "setBackgroundView:", v22);

    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v24);

    v25 = objc_alloc_init(UIScrollView);
    -[_UITextChoiceAccelerationBubble setBackingScrollView:](self, "setBackingScrollView:", v25);

    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v29);

    v30 = [UIStackView alloc];
    -[_UITextChoiceAccelerationBubble textOptionWithText:type:](self, "textOptionWithText:type:", &stru_1E16EDF20, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[UIStackView initWithArrangedSubviews:](v30, "initWithArrangedSubviews:", v32);
    -[_UITextChoiceAccelerationBubble setContentsView:](self, "setContentsView:", v33);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAxis:", 0);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAlignment:", 5);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSpacing:", 0.0);

    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v39);

    -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble setLeadingSpacing:](self, "setLeadingSpacing:", v43);

    -[_UITextChoiceAccelerationBubble leadingSpacing](self, "leadingSpacing");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = 1132068864;
    objc_msgSend(v44, "setPriority:", v45);

    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "widthAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 0.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v51) = 1144750080;
    v75 = v50;
    objc_msgSend(v50, "setPriority:", v51);
    v82 = (void *)MEMORY[0x1E0D156E0];
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v100);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v99;
    -[UIView trailingAnchor](self, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v96);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v95;
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "topAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:constant:", v91, 0.0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v90;
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, 0.0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v85;
    -[_UITextChoiceAccelerationBubble leadingSpacing](self, "leadingSpacing");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v103[4] = v84;
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "contentLayoutGuide");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v103[5] = v77;
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "contentLayoutGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v103[6] = v70;
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "contentLayoutGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v103[7] = v64;
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "contentLayoutGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v103[8] = v55;
    -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "heightAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v103[9] = v60;
    v103[10] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 11);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "activateConstraints:", v61);

  }
}

- (void)updateSelfWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  char v29;
  void *v30;
  uint64_t v31;
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
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[4];
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v62[3] = *MEMORY[0x1E0C80C00];
  -[_UITextChoiceAccelerationBubble referenceRect](self, "referenceRect");
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  if (!CGRectEqualToRect(v63, v65))
  {
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    if (!CGRectIsNull(v64))
    {
      -[_UITextChoiceAccelerationBubble setReferenceRect:](self, "setReferenceRect:", x, y, width, height);
      -[_UITextChoiceAccelerationBubble anchorToTextIfNeeded](self, "anchorToTextIfNeeded");
      -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConstant:", x);

      -[_UITextChoiceAccelerationBubble anchorTop](self, "anchorTop");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setConstant:", y);

      -[_UITextChoiceAccelerationBubble anchorWidth](self, "anchorWidth");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setConstant:", width);

      -[_UITextChoiceAccelerationBubble anchorHeight](self, "anchorHeight");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setConstant:", height);

      if (-[_UITextChoiceAccelerationBubble promptWillCollideWithKeyboard:](self, "promptWillCollideWithKeyboard:", x, y, width, height)|| -[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle") == 3)
      {
        -[_UITextChoiceAccelerationBubble belowTextConstraints](self, "belowTextConstraints");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isActive");

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0D156E0];
          -[_UITextChoiceAccelerationBubble belowTextConstraints](self, "belowTextConstraints");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "deactivateConstraints:", v16);

        }
        -[_UITextChoiceAccelerationBubble aboveTextConstraints](self, "aboveTextConstraints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "topAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView topAnchor](self, "topAnchor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "constraintEqualToAnchor:", v55);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v53;
          -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "topAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bottomAnchor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v62[1] = v21;
          -[UIView bottomAnchor](self, "bottomAnchor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "bottomAnchor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "constraintEqualToAnchor:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v62[2] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble setAboveTextConstraints:](self, "setAboveTextConstraints:", v26);

        }
        -[_UITextChoiceAccelerationBubble aboveTextConstraints](self, "aboveTextConstraints");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isActive");

        if ((v29 & 1) == 0)
        {
          v30 = (void *)MEMORY[0x1E0D156E0];
          -[_UITextChoiceAccelerationBubble aboveTextConstraints](self, "aboveTextConstraints");
          v31 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v50 = (void *)v31;
          objc_msgSend(v30, "activateConstraints:", v31);

        }
      }
      else
      {
        -[_UITextChoiceAccelerationBubble belowTextConstraints](self, "belowTextConstraints");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "topAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "bottomAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintEqualToAnchor:constant:", v54, 0.0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = v52;
          -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "topAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView topAnchor](self, "topAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "constraintEqualToAnchor:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v61[1] = v36;
          -[UIView bottomAnchor](self, "bottomAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "bottomAnchor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "constraintEqualToAnchor:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v61[2] = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble setBelowTextConstraints:](self, "setBelowTextConstraints:", v41);

        }
        -[_UITextChoiceAccelerationBubble aboveTextConstraints](self, "aboveTextConstraints");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isActive");

        if (v44)
        {
          v45 = (void *)MEMORY[0x1E0D156E0];
          -[_UITextChoiceAccelerationBubble aboveTextConstraints](self, "aboveTextConstraints");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "deactivateConstraints:", v46);

        }
        -[_UITextChoiceAccelerationBubble belowTextConstraints](self, "belowTextConstraints");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "firstObject");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isActive");

        if ((v49 & 1) == 0)
        {
          v30 = (void *)MEMORY[0x1E0D156E0];
          -[_UITextChoiceAccelerationBubble belowTextConstraints](self, "belowTextConstraints");
          v31 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
    }
  }
}

- (BOOL)promptWillCollideWithKeyboard:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat MinX;
  CGFloat MaxY;
  void *v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  if (v10 >= height)
    v11 = v10;
  else
    v11 = height;
  v12 = height + v11;
  -[UIView _window](self, "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:fromView:", v14, x, y, width, v12);
  v46 = v16;
  v47 = v15;
  v44 = v18;
  v45 = v17;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "visibleFrameInView:", self);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = v12;
  v52.origin.x = v21;
  v52.origin.y = v23;
  v52.size.width = v25;
  v52.size.height = v27;
  if (CGRectIntersectsRect(v48, v52))
    return 1;
  -[UIView window](self, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutFrame");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v49.origin.x = v32;
  v49.origin.y = v34;
  v49.size.width = v36;
  v49.size.height = v38;
  MinX = CGRectGetMinX(v49);
  v50.origin.x = v32;
  v50.origin.y = v34;
  v50.size.width = v36;
  v50.size.height = v38;
  MaxY = CGRectGetMaxY(v50);
  -[UIView window](self, "window");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "safeAreaInsets");
  v43 = v42;

  v51.origin.y = v46;
  v51.origin.x = v47;
  v51.size.height = v44;
  v51.size.width = v45;
  v53.origin.x = MinX;
  v53.origin.y = MaxY;
  v53.size.width = v36;
  v53.size.height = v43;
  return CGRectIntersectsRect(v51, v53);
}

- (void)showChoices:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[_UITextChoiceAccelerationBubble backgroundMaskLayer](self, "backgroundMaskLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cgColor");
    -[UIView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowColor:", v10);

    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowRadius:", 9.0);

    -[UIView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowOffset:", 0.0, 3.0);

    -[UIView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0.25;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    -[_UITextChoiceAccelerationBubble backgroundMaskLayer](self, "backgroundMaskLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    -[UIView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
  }
  v18 = v14;
  objc_msgSend(v14, "setShadowOpacity:", v15);

}

- (void)updateForSingleWord:(id)a3 textAnchorRect:(id)a4 inTextView:(id)a5 parentView:(id)a6 highlightColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  if (-[_UITextChoiceAccelerationBubble needsRTLCheck](self, "needsRTLCheck")
    || (-[_UITextChoiceAccelerationBubble parentView](self, "parentView"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqual:", v14),
        v17,
        (v18 & 1) == 0))
  {
    v19 = -[_UITextChoiceAccelerationBubble usingRTLInputMode](self, "usingRTLInputMode");
    -[UIView traitOverrides](self, "traitOverrides");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLayoutDirection:", v19);

    -[_UITextChoiceAccelerationBubble setNeedsRTLCheck:](self, "setNeedsRTLCheck:", 0);
  }
  -[_UITextChoiceAccelerationBubble updateTextAnchorForParentView:](self, "updateTextAnchorForParentView:", v14);
  objc_msgSend(v16, "rect");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v14, "convertRect:fromView:", v13, v22, v24, v26, v28);
    v22 = v29;
    v24 = v30;
    v26 = v31;
    v28 = v32;
  }
  -[_UITextChoiceAccelerationBubble updateTextHighlightViewWithColor:convertedRect:](self, "updateTextHighlightViewWithColor:convertedRect:", v15, v22, v24, v26, v28);
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrangedSubviews");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35 == 1)
  {
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "arrangedSubviews");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndex:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "updateText:type:", v12, 3);
  }
  else
  {
    v41[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _candidatesChoicesFromTextChoices(v39, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble updateViewForOptions:](self, "updateViewForOptions:", v40);

  }
}

- (void)updateTextBoxHighlightForRect:(id)a3 inTextView:(id)a4 parentView:(id)a5 highlightColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v25 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  -[_UITextChoiceAccelerationBubble updateTextAnchorForParentView:](self, "updateTextAnchorForParentView:", v10);
  objc_msgSend(v12, "rect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v10, "convertRect:fromView:", v25, v14, v16, v18, v20);
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
  }
  -[_UITextChoiceAccelerationBubble updateTextHighlightViewWithColor:convertedRect:](self, "updateTextHighlightViewWithColor:convertedRect:", v11, v14, v16, v18, v20);

}

- (void)updateTextHighlightViewWithColor:(id)a3 convertedRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[_UITextChoiceAccelerationBubble updateSelfWithRect:](self, "updateSelfWithRect:", x, y, width, height);
  -[_UITextChoiceAccelerationBubble showTextHighlightView:](self, "showTextHighlightView:", 1);
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (void)hideForNow
{
  void *v3;
  char v4;

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[_UITextChoiceAccelerationBubble showTextHighlightView:](self, "showTextHighlightView:", 0);
    -[UIView setAlpha:](self, "setAlpha:", 0.0);
  }
}

- (void)updateWithChoices:(id)a3 fromParentView:(id)a4 referenceTextView:(id)a5 presentedFromRect:(id)a6 textHighlightColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;

  v40 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = objc_msgSend(v17, "_isNaturallyRTL");
  v18 = v16 ^ -[_UITextChoiceAccelerationBubble usingRTLInputMode](self, "usingRTLInputMode");
  -[UIView traitOverrides](self, "traitOverrides");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLayoutDirection:", v16);

  -[_UITextChoiceAccelerationBubble setNeedsRTLCheck:](self, "setNeedsRTLCheck:", v18);
  -[_UITextChoiceAccelerationBubble updateTextAnchorForParentView:](self, "updateTextAnchorForParentView:", v40);
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  -[_UITextChoiceAccelerationBubble showChoices:](self, "showChoices:", 1);
  -[_UITextChoiceAccelerationBubble showTextHighlightView:](self, "showTextHighlightView:", v14 != 0);
  if (v14)
  {
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v14);

    -[_UITextChoiceAccelerationBubble setOptionalTintColor:](self, "setOptionalTintColor:", v14);
    -[_UITextChoiceAccelerationBubble dictationGlowEffect](self, "dictationGlowEffect");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTintColor:", v20);

    -[_UITextChoiceAccelerationBubble dictationGlowEffect](self, "dictationGlowEffect");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPulsing:", 1);

  }
  objc_msgSend(v13, "rect");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v40, "convertRect:fromView:", v12, v25, v27, v29, v31);
    v25 = v32;
    v27 = v33;
    v29 = v34;
    v31 = v35;
  }
  -[_UITextChoiceAccelerationBubble updateSelfWithRect:](self, "updateSelfWithRect:", v25, v27, v29, v31);
  -[_UITextChoiceAccelerationBubble setShouldRejectCandidate:](self, "setShouldRejectCandidate:", 0);
  -[_UITextChoiceAccelerationBubble updateViewForOptions:](self, "updateViewForOptions:", v15);

  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37 / 4.75;
  -[_UITextChoiceAccelerationBubble dictationGlowEffect](self, "dictationGlowEffect");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBlurRadius:", v38);

}

- (void)updateViewForOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int IsSmartReply;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  unsigned int (**v67)(void *, void *);
  _QWORD aBlock[5];

  v4 = a3;
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "slotID");

  if ((_DWORD)v6)
  {
    v8 = 6;
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsSmartReply = _candidateSourceIsSmartReply(v9);

    if ((IsSmartReply & 1) != 0)
    {
      v8 = 7;
    }
    else if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v8 = 2;
    }
    else
    {
      v8 = 3;
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UITextChoiceAccelerationBubble_updateViewForOptions___block_invoke;
  aBlock[3] = &unk_1E16BB930;
  aBlock[4] = self;
  v67 = (unsigned int (**)(void *, void *))_Block_copy(aBlock);
  v11 = objc_msgSend(v4, "count");
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrangedSubviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v11 >= v14)
  {
    if (objc_msgSend(v4, "count"))
    {
      v35 = 0;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "label");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v8;
        if (v8 == 2)
        {
          if (v67[2](v67, v37))
            v38 = 4;
          else
            v38 = 2;
        }
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "arrangedSubviews");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v35 >= v41)
        {
          -[_UITextChoiceAccelerationBubble textOptionWithText:type:](self, "textOptionWithText:type:", v37, v38);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setSlotID:", objc_msgSend(v50, "slotID"));

          -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "secureCandidateWidth");
          v53 = v52;
          -[_UITextChoiceAccelerationBubble secureCandidateHeight](self, "secureCandidateHeight");
          objc_msgSend(v44, "setSecureCandidateSize:", v53, v54);

          objc_msgSend(v44, "setSourceCandidate:", v36);
          -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addArrangedSubview:", v44);

        }
        else
        {
          -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "arrangedSubviews");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectAtIndex:", v35);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setSlotID:", objc_msgSend(v45, "slotID"));

          -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "secureCandidateWidth");
          v48 = v47;
          -[_UITextChoiceAccelerationBubble secureCandidateHeight](self, "secureCandidateHeight");
          objc_msgSend(v44, "setSecureCandidateSize:", v48, v49);

          objc_msgSend(v44, "setSourceCandidate:", v36);
          objc_msgSend(v44, "updateText:type:", v37, v38);
        }
        objc_msgSend(v44, "showSeparator:", v35 < objc_msgSend(v4, "count") - 1);

        ++v35;
      }
      while (v35 < objc_msgSend(v4, "count"));
    }
  }
  else
  {
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrangedSubviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v65 = v17 - objc_msgSend(v4, "count");

    if (objc_msgSend(v4, "count"))
    {
      v18 = 0;
      do
      {
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView", v65, v66);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrangedSubviews");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndex:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v8;
        if (v8 == 2)
        {
          if (v67[2](v67, v23))
            v24 = 4;
          else
            v24 = 2;
        }
        if (!v21)
        {
          -[_UITextChoiceAccelerationBubble textOptionWithText:type:](self, "textOptionWithText:type:", v23, v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addArrangedSubview:", v21);

        }
        -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSlotID:", objc_msgSend(v26, "slotID"));

        -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "secureCandidateWidth");
        v29 = v28;
        -[_UITextChoiceAccelerationBubble secureCandidateHeight](self, "secureCandidateHeight");
        objc_msgSend(v21, "setSecureCandidateSize:", v29, v30);

        objc_msgSend(v21, "setSourceCandidate:", v22);
        objc_msgSend(v21, "updateText:type:", v23, v24);
        objc_msgSend(v21, "showSeparator:", v18 < objc_msgSend(v4, "count") - 1);

        ++v18;
      }
      while (v18 < objc_msgSend(v4, "count"));
    }
    if (v65 >= 1)
    {
      v31 = v65 + 1;
      do
      {
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView", v65);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrangedSubviews");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeFromSuperview");

        --v31;
      }
      while (v31 > 1);
    }
  }
  -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView", v65);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "arrangedSubviews");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "viewForLastBaselineLayout");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(v59, "leadingSpace");
    v62 = v61;
    -[_UITextChoiceAccelerationBubble leadingSpacing](self, "leadingSpacing");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setConstant:", v62);

  }
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "layoutIfNeeded");

}

- (void)updateButtonName:(id)a3 placement:(int64_t)a4 originalText:(id)a5
{
  id v8;
  id v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  uint64_t v34;
  _UITextOption *v35;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int64_t v52;
  uint64_t v53;
  _UITextOption *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int64_t v70;
  int64_t v71;
  _UITextOption *v72;
  _UITextOption *v73;
  _UITextOption *v74;
  _UITextOption *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[5];
  _QWORD v116[4];

  v116[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v111 = v9;
  v112 = v8;
  switch(a4)
  {
    case 0:
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deactivateConstraints:", v13);

        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeFromSuperview");

      }
      -[_UITextChoiceAccelerationBubble setSideButton:](self, "setSideButton:", 0);
      -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "deactivateConstraints:", v17);

      }
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v20;
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setButtonConstraints:](self, "setButtonConstraints:", v26);

      goto LABEL_36;
    case 1:
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        v33 = -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType");
        if (v33 == 2)
          v34 = 1;
        else
          v34 = v33;
        v35 = -[_UITextOption initWithTitle:type:]([_UITextOption alloc], "initWithTitle:type:", v8, v34);
        -[_UITextChoiceAccelerationBubble setSideButton:](self, "setSideButton:", v35);

        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "contentView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addSubview:", v38);

      }
      -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "deactivateConstraints:", v41);

      }
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "topAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "topAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:", v107);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v106;
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "bottomAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "bottomAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:", v102);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v101;
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "trailingAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "trailingAnchor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, 4.0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v95;
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v115[3] = v44;
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 0.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v115[4] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setButtonConstraints:](self, "setButtonConstraints:", v50);

      v51 = v97;
      goto LABEL_34;
    case 2:
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        v52 = -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType");
        if (v52 == 2)
          v53 = 1;
        else
          v53 = v52;
        v54 = -[_UITextOption initWithTitle:type:]([_UITextOption alloc], "initWithTitle:type:", v8, v53);
        -[_UITextChoiceAccelerationBubble setSideButton:](self, "setSideButton:", v54);

        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contentView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addSubview:", v57);

      }
      -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v59 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "deactivateConstraints:", v60);

      }
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "centerYAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "centerYAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:", v107);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v106;
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "leadingAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "leadingAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:constant:", v102, 4.0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v101;
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, 0.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v114[2] = v64;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backingScrollView](self, "backingScrollView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "trailingAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v114[3] = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 4);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setButtonConstraints:](self, "setButtonConstraints:", v69);

      goto LABEL_35;
    case 3:
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "updateText:type:", v8, -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType"));
      }
      else
      {
        v70 = -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType");
        v71 = -[_UITextChoiceAccelerationBubble buttonType](self, "buttonType");
        v72 = [_UITextOption alloc];
        v73 = v72;
        if (v71 == 5)
        {
          -[_UITextChoiceAccelerationBubble optionalTintColor](self, "optionalTintColor");
          v74 = (_UITextOption *)objc_claimAutoreleasedReturnValue();
          v75 = -[_UITextOption initWithTitle:type:optionalTintColor:](v73, "initWithTitle:type:optionalTintColor:", v8, v70, v74);
          -[_UITextChoiceAccelerationBubble setSideButton:](self, "setSideButton:", v75);

        }
        else
        {
          v74 = -[_UITextOption initWithTitle:type:](v72, "initWithTitle:type:", v8, v70);
          -[_UITextChoiceAccelerationBubble setSideButton:](self, "setSideButton:", v74);
        }

        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "contentView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addSubview:", v78);

      }
      -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        v80 = (void *)MEMORY[0x1E0D156E0];
        -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "deactivateConstraints:", v81);

      }
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "centerXAnchor");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "centerXAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:", v107);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v106;
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "topAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "topAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "constraintEqualToAnchor:", v102);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v101;
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "bottomAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "bottomAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToAnchor:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v113[2] = v84;
      -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "widthAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "widthAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintGreaterThanOrEqualToAnchor:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v113[3] = v89;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 4);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UITextChoiceAccelerationBubble setButtonConstraints:](self, "setButtonConstraints:", v90);

      v51 = v99;
LABEL_34:

LABEL_35:
LABEL_36:

      v91 = (void *)MEMORY[0x1E0D156E0];
      -[_UITextChoiceAccelerationBubble buttonConstraints](self, "buttonConstraints");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "activateConstraints:", v92);

      v9 = v111;
      v8 = v112;
      break;
    default:
      break;
  }
  -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setOriginalText:", v9);

}

- (void)updateButtonForType:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 1) > 4)
    v3 = 2;
  else
    v3 = qword_18667CA68[a3 - 1];
  -[_UITextChoiceAccelerationBubble setButtonType:](self, "setButtonType:", v3);
}

- (void)layoutSubviews
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UITextChoiceAccelerationBubble;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == 1
    && (-[_UITextChoiceAccelerationBubble replacement](self, "replacement"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        (_replacementSourceIsSmartReply(v2) & 1) == 0))
  {
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[_UITextChoiceAccelerationBubble squaredOffBubblePathInRect:](self, "squaredOffBubblePathInRect:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[_UITextChoiceAccelerationBubble bubblePathInRect:](self, "bubblePathInRect:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != 1)
      goto LABEL_7;
  }

LABEL_7:
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "CGPath");
  -[_UITextChoiceAccelerationBubble backgroundMaskLayer](self, "backgroundMaskLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowPath:", v11);

  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v13, "CGPath");
  -[_UITextChoiceAccelerationBubble backgroundMaskLayer](self, "backgroundMaskLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPath:", v14);

}

- (void)inputModeDidChange:(id)a3
{
  -[_UITextChoiceAccelerationBubble setNeedsRTLCheck:](self, "setNeedsRTLCheck:", 1);
}

- (BOOL)usingRTLInputMode
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDefaultRightToLeft");

  return v4;
}

- (id)textOptionWithText:(id)a3 type:(int64_t)a4
{
  id v5;
  _UITextOption *v6;

  v5 = a3;
  v6 = -[_UITextOption initWithTitle:type:]([_UITextOption alloc], "initWithTitle:type:", v5, a4);

  return v6;
}

- (id)backgroundImageView
{
  int64_t v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v3 = -[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle");
  v4 = [UIVisualEffectView alloc];
  v5 = v4;
  if (v3 == 3)
  {
    v6 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", 0);
  }
  else
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIVisualEffectView initWithEffect:](v5, "initWithEffect:", v7);

    v8 = (void *)objc_opt_new();
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

    -[_UITextChoiceAccelerationBubble referenceRect](self, "referenceRect");
    -[_UITextChoiceAccelerationBubble bubblePathInRect:](self, "bubblePathInRect:");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setPath:", objc_msgSend(v10, "CGPath"));

    -[_UITextChoiceAccelerationBubble setBackgroundMaskLayer:](self, "setBackgroundMaskLayer:", v8);
    -[_UITextChoiceAccelerationBubble backgroundMaskLayer](self, "backgroundMaskLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMask:", v11);

  }
  return v6;
}

- (id)squaredOffBubblePathInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  double MinY;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double MaxY;
  double MaxX;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = a3.size.height * 0.5;
  v8 = a3.origin.x + a3.size.height * 0.5;
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "layoutDirection");

  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  if (v10 == 1)
  {
    v36 = v7 + CGRectGetMinX(*(CGRect *)&v11);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v38 = v7 + CGRectGetMinX(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v30 = CGRectGetMaxX(v41) + -6.5;
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v15 = CGRectGetMaxY(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v29 = CGRectGetMaxY(v44) + -6.5;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v28 = CGRectGetMaxX(v45);
    v27 = y + 6.5;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v34 = CGRectGetMaxX(v46) + -6.5;
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "moveToPoint:", v8, y);
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v36, y + v7, v7, 4.71238898, 1.57079633);
    objc_msgSend(v16, "addLineToPoint:", v38, MaxY);
    objc_msgSend(v16, "addLineToPoint:", v30, v15);
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v17 = CGRectGetMaxX(v47) + 6.5;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", MaxX, v29, v17, CGRectGetMaxY(v48));
    objc_msgSend(v16, "addLineToPoint:", v28, y + 6.5);
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v18 = CGRectGetMaxX(v49) + 6.5;
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MinY = CGRectGetMinY(v50);
    v20 = v16;
    v21 = v34;
    v22 = y;
    v23 = v18;
  }
  else
  {
    v35 = CGRectGetMaxX(*(CGRect *)&v11) - v7;
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v37 = CGRectGetMaxX(v51) - v7;
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    CGRectGetMaxX(v52);
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    CGRectGetMaxY(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    v24 = CGRectGetMaxY(v54);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    v33 = CGRectGetMaxY(v55) + -6.5;
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "moveToPoint:", v8, y);
    objc_msgSend(v16, "addLineToPoint:", v35, y);
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v37, y + v7, v7, 4.71238898, 1.57079633);
    objc_msgSend(v16, "addLineToPoint:", x + 6.5, v24);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MinX = CGRectGetMinX(v56);
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", x, v33, MinX, CGRectGetMaxY(v57));
    objc_msgSend(v16, "addLineToPoint:", x, y + 6.5);
    v20 = v16;
    v21 = x + 6.5;
    v22 = y;
    v23 = x;
    MinY = y;
  }
  objc_msgSend(v20, "addQuadCurveToPoint:controlPoint:", v21, v22, v23, MinY, *(_QWORD *)&v27, *(_QWORD *)&v28);
  objc_msgSend(v16, "addLineToPoint:", v8, y);
  return v16;
}

- (id)bubblePathInRect:(CGRect)a3
{
  return +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 6.5);
}

- (void)showTextHighlightView:(BOOL)a3
{
  int v3;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  double v9;
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
  UIDictationGlowEffect *v21;
  UIDictationGlowEffect *v22;
  void *v23;
  int v24;
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
  _QWORD v41[6];

  v3 = a3;
  v41[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_10;
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_10;
  v6 = objc_alloc_init(UIView);
  -[_UITextChoiceAccelerationBubble setTextHighlightView:](self, "setTextHighlightView:", v6);

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v8);

  if (-[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle") == 3)
    v9 = 0.0;
  else
    v9 = 2.0;
  v31 = (void *)MEMORY[0x1E0D156E0];
  -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v36;
  -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v30;
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v11;
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble textAnchor](self, "textAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v17);

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v18);

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 0);

  -[_UITextChoiceAccelerationBubble dictationGlowEffect](self, "dictationGlowEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (-[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle") != 3)
      goto LABEL_10;
    v21 = [UIDictationGlowEffect alloc];
    -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UIDictationGlowEffect initWithView:](v21, "initWithView:", v20);
    -[_UITextChoiceAccelerationBubble setDictationGlowEffect:](self, "setDictationGlowEffect:", v22);

  }
LABEL_10:
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isHidden");

  if (v24 == v3)
  {
    -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v25);

    -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", v3 ^ 1u);

  }
}

- (BOOL)showingAutocorrectHighlight
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  if (-[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle") == 3)
    return 0;
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isHidden") & 1) != 0)
      {
        v3 = 0;
      }
      else
      {
        -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alpha");
        v3 = v9 > 0.0;

      }
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)optionForPoint:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextChoiceAccelerationBubble;
  -[UIControl hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)dictationHighlightViewForPoint:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UITextChoiceAccelerationBubble;
  -[UIControl hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0
    || (-[_UITextChoiceAccelerationBubble dictationGlowEffect](self, "dictationGlowEffect"),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = -[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle");

  if (v9 != 3)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = v5;
LABEL_7:

  return v10;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UITextChoiceAccelerationBubble *v8;
  _UITextChoiceAccelerationBubble *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[_UITextChoiceAccelerationBubble pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextChoiceAccelerationBubble;
    -[UIControl hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (_UITextChoiceAccelerationBubble *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v23;
  BOOL v24;
  CGPoint v25;
  CGPoint v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[_UITextChoiceAccelerationBubble backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v28 = CGRectInset(v27, -15.0, -30.0);
  v13 = v28.origin.x;
  v14 = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;

  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
  v19 = v18;
  v21 = v20;

  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.width = width;
  v29.size.height = height;
  v25.x = v9;
  v25.y = v11;
  if (CGRectContainsPoint(v29, v25))
    return 1;
  -[_UITextChoiceAccelerationBubble textHighlightView](self, "textHighlightView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v26.x = v19;
  v26.y = v21;
  v24 = CGRectContainsPoint(v30, v26);

  return v24;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locationInView:", self);
  -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setState:", 4);
    if (!objc_msgSend(v9, "type") || objc_msgSend(v9, "type") == 1)
    {
      -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrangedSubviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setState:", 4);
    }
    if (objc_msgSend(v9, "type") != 3)
    {
      v14 = 1;
      goto LABEL_10;
    }
    -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setState:", 4);
    v14 = 1;
  }
  else
  {
    objc_msgSend(v6, "locationInView:", self);
    -[_UITextChoiceAccelerationBubble dictationHighlightViewForPoint:withEvent:](self, "dictationHighlightViewForPoint:withEvent:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;
  }

LABEL_10:
  return v14;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (!objc_msgSend(v7, "state"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrangedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isEqual:", v8) & 1) == 0)
              objc_msgSend(v15, "setState:", 0);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v12);
      }

      -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v8, "isEqual:", v16);

      if ((v17 & 1) == 0)
      {
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setState:", 0);

      }
      objc_msgSend(v8, "setState:", 4);
    }
  }
  else
  {
    -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setState:", 0);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrangedSubviews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setState:", 0);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v23);
    }

  }
  return v8 != 0;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  if (-[_UITextChoiceAccelerationBubble pointInside:withEvent:](self, "pointInside:withEvent:", v6))
  {
    -[_UITextChoiceAccelerationBubble optionForPoint:withEvent:](self, "optionForPoint:withEvent:", 0, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setState:", 4);
      if (!objc_msgSend(v12, "type"))
      {
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrangedSubviews");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setState:", 4);
        -[_UITextChoiceAccelerationBubble dismissWithCancel](self, "dismissWithCancel");
        goto LABEL_16;
      }
      if (objc_msgSend(v12, "type") == 1)
      {
        -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrangedSubviews");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setState:", 4);
        -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "originalText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationBubble dismissWithRevert:](self, "dismissWithRevert:", v17);

LABEL_16:
        goto LABEL_29;
      }
      if (objc_msgSend(v12, "type") == 6
        || (-[_UITextChoiceAccelerationBubble candidate](self, "candidate"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v26,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v6, "_authenticationMessage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextChoiceAccelerationBubble setAuthenticationMessage:](self, "setAuthenticationMessage:", v28);

        -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
        -[_UITextChoiceAccelerationBubble removeAnimated:](self, "removeAnimated:", 1);
      }
      else
      {
        if (objc_msgSend(v12, "type") == 7
          && (objc_msgSend(v12, "sourceCandidate"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v29,
              v29))
        {
          -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setState:", 4);

          objc_msgSend(v12, "sourceCandidate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble dismissWithCandidate:](self, "dismissWithCandidate:", v31);
        }
        else
        {
          objc_msgSend(v12, "textToUse");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextChoiceAccelerationBubble candidate](self, "candidate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "input");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setState:", 4);

          if (v31 && objc_msgSend(v31, "isEqualToString:", v33))
            -[_UITextChoiceAccelerationBubble dismissWithRevert:](self, "dismissWithRevert:", v31);
          else
            -[_UITextChoiceAccelerationBubble dismissWithText:](self, "dismissWithText:", v31);

        }
      }
    }
    else
    {
      -[_UITextChoiceAccelerationBubble dismissWithText:](self, "dismissWithText:", 0);
    }
  }
  else
  {
    -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setState:", 0);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[_UITextChoiceAccelerationBubble contentsView](self, "contentsView", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrangedSubviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "setState:", 0);
        }
        v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v21);
    }
  }
LABEL_29:

}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D156E0];
    -[_UITextChoiceAccelerationBubble anchorLeading](self, "anchorLeading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    -[_UITextChoiceAccelerationBubble anchorTop](self, "anchorTop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v7);

    -[_UITextChoiceAccelerationBubble setReferenceRect:](self, "setReferenceRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D156E0];
    -[_UITextChoiceAccelerationBubble boundaryConstraints](self, "boundaryConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)_UITextChoiceAccelerationBubble;
  -[UIView removeFromSuperview](&v11, sel_removeFromSuperview);
}

- (void)removeAnimated:(BOOL)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  if (!self->_isDismissing)
  {
    self->_isDismissing = 1;
    if (a3)
    {
      v4[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke_2;
      v4[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, 0.2);
    }
    else
    {
      -[UIView setAlpha:](self, "setAlpha:", 0.0);
      -[_UITextChoiceAccelerationBubble reset](self, "reset");
      self->_isDismissing = 0;
    }
  }
}

- (void)dismissWithCancel
{
  void *v3;
  id v4;

  -[_UITextChoiceAccelerationBubble setShouldRejectCandidate:](self, "setShouldRejectCandidate:", 1);
  -[_UITextChoiceAccelerationBubble sideButton](self, "sideButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textToUse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextChoiceAccelerationBubble dismissWithText:](self, "dismissWithText:", v3);

}

- (void)dismissWithRevert:(id)a3
{
  id v4;

  v4 = a3;
  -[_UITextChoiceAccelerationBubble setShouldRejectCandidate:](self, "setShouldRejectCandidate:", 1);
  -[_UITextChoiceAccelerationBubble dismissWithText:](self, "dismissWithText:", v4);

}

- (void)dismissWithCandidate:(id)a3
{
  int64_t v5;
  NSString *v6;
  NSString *selectedChoice;
  id v8;

  v8 = a3;
  v5 = -[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle");
  if (v8)
  {
    objc_msgSend(v8, "candidate");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectedChoice = self->_selectedChoice;
    self->_selectedChoice = v6;

    objc_storeStrong((id *)&self->_selectedCandidateChoice, a3);
  }
  else if (v5 != 3)
  {
    -[UIControl cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", 0);
  }
  -[_UITextChoiceAccelerationBubble removeAnimated:](self, "removeAnimated:", 1);

}

- (void)dismissWithText:(id)a3
{
  int64_t v5;
  TIKeyboardCandidate *selectedCandidateChoice;
  id v7;

  v7 = a3;
  v5 = -[_UITextChoiceAccelerationBubble promptStyle](self, "promptStyle");
  if (v7)
  {
    objc_storeStrong((id *)&self->_selectedChoice, a3);
    selectedCandidateChoice = self->_selectedCandidateChoice;
    self->_selectedCandidateChoice = 0;

  }
  else if (v5 != 3)
  {
    -[UIControl cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", 0);
  }
  -[_UITextChoiceAccelerationBubble removeAnimated:](self, "removeAnimated:", 1);

}

- (int)textEffectsVisibilityLevelInKeyboardWindow
{
  return 12;
}

- (int)textEffectsVisibilityLevel
{
  void *v2;
  int v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textEffectsVisibilityLevel");

  if (v3 <= 8)
    return 8;
  else
    return v3;
}

- (UILayoutGuide)textAnchor
{
  return self->_textAnchor;
}

- (void)setTextAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_textAnchor, a3);
}

- (NSLayoutConstraint)anchorLeading
{
  return self->_anchorLeading;
}

- (void)setAnchorLeading:(id)a3
{
  objc_storeStrong((id *)&self->_anchorLeading, a3);
}

- (NSLayoutConstraint)anchorTop
{
  return self->_anchorTop;
}

- (void)setAnchorTop:(id)a3
{
  objc_storeStrong((id *)&self->_anchorTop, a3);
}

- (NSLayoutConstraint)anchorWidth
{
  return self->_anchorWidth;
}

- (void)setAnchorWidth:(id)a3
{
  objc_storeStrong((id *)&self->_anchorWidth, a3);
}

- (NSLayoutConstraint)anchorHeight
{
  return self->_anchorHeight;
}

- (void)setAnchorHeight:(id)a3
{
  objc_storeStrong((id *)&self->_anchorHeight, a3);
}

- (NSArray)boundaryConstraints
{
  return self->_boundaryConstraints;
}

- (void)setBoundaryConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryConstraints, a3);
}

- (NSLayoutConstraint)leadingSpacing
{
  return self->_leadingSpacing;
}

- (void)setLeadingSpacing:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSpacing, a3);
}

- (NSArray)belowTextConstraints
{
  return self->_belowTextConstraints;
}

- (void)setBelowTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_belowTextConstraints, a3);
}

- (NSArray)aboveTextConstraints
{
  return self->_aboveTextConstraints;
}

- (void)setAboveTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_aboveTextConstraints, a3);
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

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (double)secureCandidateHeight
{
  return self->_secureCandidateHeight;
}

- (void)setSecureCandidateHeight:(double)a3
{
  self->_secureCandidateHeight = a3;
}

- (BOOL)shouldRejectCandidate
{
  return self->_shouldRejectCandidate;
}

- (void)setShouldRejectCandidate:(BOOL)a3
{
  self->_shouldRejectCandidate = a3;
}

- (_UIReplacementCandidate)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_replacement, a3);
}

- (NSString)selectedChoice
{
  return self->_selectedChoice;
}

- (TIKeyboardCandidate)selectedCandidateChoice
{
  return self->_selectedCandidateChoice;
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (CAShapeLayer)backgroundMaskLayer
{
  return self->_backgroundMaskLayer;
}

- (void)setBackgroundMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaskLayer, a3);
}

- (void)setContentsView:(id)a3
{
  objc_storeStrong((id *)&self->_contentsView, a3);
}

- (UIScrollView)backingScrollView
{
  return self->_backingScrollView;
}

- (void)setBackingScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_backingScrollView, a3);
}

- (void)setSideButton:(id)a3
{
  objc_storeStrong((id *)&self->_sideButton, a3);
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (void)setTextHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_textHighlightView, a3);
}

- (UIDictationGlowEffect)dictationGlowEffect
{
  return self->_dictationGlowEffect;
}

- (void)setDictationGlowEffect:(id)a3
{
  objc_storeStrong((id *)&self->_dictationGlowEffect, a3);
}

- (BOOL)needsRTLCheck
{
  return self->_needsRTLCheck;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (int64_t)promptStyle
{
  return self->_promptStyle;
}

- (void)setPromptStyle:(int64_t)a3
{
  self->_promptStyle = a3;
}

- (UIColor)optionalTintColor
{
  return self->_optionalTintColor;
}

- (void)setOptionalTintColor:(id)a3
{
  self->_optionalTintColor = (UIColor *)a3;
}

- (unint64_t)labelNumber
{
  return self->_labelNumber;
}

- (void)setLabelNumber:(unint64_t)a3
{
  self->_labelNumber = a3;
}

- (_NSRange)deltaRange
{
  _NSRange *p_deltaRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_deltaRange = &self->_deltaRange;
  location = self->_deltaRange.location;
  length = p_deltaRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDeltaRange:(_NSRange)a3
{
  self->_deltaRange = a3;
}

- (_NSRange)originalSelectedRange
{
  _NSRange *p_originalSelectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_originalSelectedRange = &self->_originalSelectedRange;
  location = self->_originalSelectedRange.location;
  length = p_originalSelectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setOriginalSelectedRange:(_NSRange)a3
{
  self->_originalSelectedRange = a3;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)setAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
  objc_storeStrong((id *)&self->_dictationGlowEffect, 0);
  objc_storeStrong((id *)&self->_textHighlightView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_sideButton, 0);
  objc_storeStrong((id *)&self->_backingScrollView, 0);
  objc_storeStrong((id *)&self->_contentsView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong((id *)&self->_selectedCandidateChoice, 0);
  objc_storeStrong((id *)&self->_selectedChoice, 0);
  objc_storeStrong((id *)&self->_replacement, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_aboveTextConstraints, 0);
  objc_storeStrong((id *)&self->_belowTextConstraints, 0);
  objc_storeStrong((id *)&self->_leadingSpacing, 0);
  objc_storeStrong((id *)&self->_boundaryConstraints, 0);
  objc_storeStrong((id *)&self->_anchorHeight, 0);
  objc_storeStrong((id *)&self->_anchorWidth, 0);
  objc_storeStrong((id *)&self->_anchorTop, 0);
  objc_storeStrong((id *)&self->_anchorLeading, 0);
  objc_storeStrong((id *)&self->_textAnchor, 0);
}

@end
