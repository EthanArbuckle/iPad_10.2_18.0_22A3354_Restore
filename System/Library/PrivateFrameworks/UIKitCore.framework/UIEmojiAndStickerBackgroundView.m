@implementation UIEmojiAndStickerBackgroundView

- (UIEmojiAndStickerBackgroundView)initWithFrame:(CGRect)a3
{
  UIEmojiAndStickerBackgroundView *v3;
  UIEmojiAndStickerBackgroundView *v4;
  uint64_t v5;
  UIView *topRow;
  uint64_t v7;
  UIView *secondRow;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *firstRowHeightConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  objc_super v35;
  _QWORD v36[10];

  v36[8] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)UIEmojiAndStickerBackgroundView;
  v3 = -[UIView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIEmojiAndStickerBackgroundView createHittableView](v3, "createHittableView");
    v5 = objc_claimAutoreleasedReturnValue();
    topRow = v4->_topRow;
    v4->_topRow = (UIView *)v5;

    -[UIEmojiAndStickerBackgroundView createHittableView](v4, "createHittableView");
    v7 = objc_claimAutoreleasedReturnValue();
    secondRow = v4->_secondRow;
    v4->_secondRow = (UIView *)v7;

    -[UIView addSubview:](v4, "addSubview:", v4->_topRow);
    -[UIView addSubview:](v4, "addSubview:", v4->_secondRow);
    -[UIView heightAnchor](v4->_topRow, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", v4->_cutoutHeight);
    v10 = objc_claimAutoreleasedReturnValue();
    firstRowHeightConstraint = v4->_firstRowHeightConstraint;
    v4->_firstRowHeightConstraint = (NSLayoutConstraint *)v10;

    -[UIView topAnchor](v4->_topRow, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    v36[1] = v4->_firstRowHeightConstraint;
    -[UIView leadingAnchor](v4->_topRow, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v29;
    -[UIView widthAnchor](v4->_topRow, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](v4, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v27, 0.666666667);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v26;
    -[UIView topAnchor](v4->_secondRow, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_topRow, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v23;
    -[UIView bottomAnchor](v4->_secondRow, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v13;
    -[UIView leadingAnchor](v4->_secondRow, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[6] = v16;
    -[UIView trailingAnchor](v4->_secondRow, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v20);
  }
  return v4;
}

- (void)setCutoutHeight:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_firstRowHeightConstraint, "setConstant:", a3);
}

- (id)createHittableView
{
  UIView *v2;
  UIView *v3;
  void *v4;

  v2 = [UIView alloc];
  v3 = -[UIView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  return v3;
}

- (double)cutoutHeight
{
  return self->_cutoutHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstRowHeightConstraint, 0);
  objc_storeStrong((id *)&self->_secondRow, 0);
  objc_storeStrong((id *)&self->_topRow, 0);
}

@end
