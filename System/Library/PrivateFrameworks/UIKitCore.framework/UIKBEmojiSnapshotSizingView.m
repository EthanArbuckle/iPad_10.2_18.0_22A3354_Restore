@implementation UIKBEmojiSnapshotSizingView

- (UIKBEmojiSnapshotSizingView)initWithSnapshotView:(id)a3
{
  id v5;
  UIKBEmojiSnapshotSizingView *v6;
  UIKBEmojiSnapshotSizingView *v7;
  id *p_snapshotView;
  CGFloat v9;
  CGFloat v10;
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
  id v26;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBEmojiSnapshotSizingView;
  v6 = -[UIView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v26 = v5;
    p_snapshotView = (id *)&v6->_snapshotView;
    objc_storeStrong((id *)&v6->_snapshotView, a3);
    objc_msgSend(*p_snapshotView, "bounds");
    v7->_snapshotSize.width = v9;
    v7->_snapshotSize.height = v10;
    objc_msgSend(*p_snapshotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v7, "addSubview:", *p_snapshotView);
    v21 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(*p_snapshotView, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v7, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v23;
    objc_msgSend(*p_snapshotView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v7, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v12;
    objc_msgSend(*p_snapshotView, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v7, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    objc_msgSend(*p_snapshotView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_snapshotView, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v17, v7->_snapshotSize.width / v7->_snapshotSize.height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v19);

    v5 = v26;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_snapshotSize.width;
  height = self->_snapshotSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
