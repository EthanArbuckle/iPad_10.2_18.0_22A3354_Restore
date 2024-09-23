@implementation PXPeopleRecoCollectionViewCell

- (PXPeopleRecoCollectionViewCell)initWithFrame:(CGRect)a3
{
  PXPeopleRecoCollectionViewCell *v3;
  PXPeopleRecoCollectionViewCell *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *faceView;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *checkView;
  UIImageView *v12;
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
  UIImageView *v24;
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
  objc_super v40;
  _QWORD v41[10];

  v41[8] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)PXPeopleRecoCollectionViewCell;
  v3 = -[PXPeopleRecoCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXPeopleRecoCollectionViewCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleRecoCollectionViewCell addSubview:](v4, "addSubview:", v6);
    faceView = v4->_faceView;
    v4->_faceView = v6;
    v8 = v6;

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    -[UIImageView setHidden:](v9, "setHidden:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleRecoCollectionViewCell addSubview:](v4, "addSubview:", v9);
    checkView = v4->_checkView;
    v4->_checkView = v9;
    v12 = v9;

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell leadingAnchor](v4, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v37;
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell trailingAnchor](v4, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v34;
    v24 = v8;
    -[UIImageView topAnchor](v8, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell topAnchor](v4, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v31;
    -[UIImageView bottomAnchor](v8, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell bottomAnchor](v4, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v27;
    -[UIImageView heightAnchor](v12, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", 22.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v25;
    -[UIImageView heightAnchor](v12, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v12, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[5] = v13;
    -[UIImageView trailingAnchor](v12, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell trailingAnchor](v4, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -7.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[6] = v16;
    -[UIImageView bottomAnchor](v12, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoCollectionViewCell bottomAnchor](v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -7.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v20);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewCell;
  -[PXPeopleRecoCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PXPeopleRecoCollectionViewCell checkView](self, "checkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXPeopleRecoCollectionViewCell faceView](self, "faceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleRecoCollectionViewCell;
  -[PXPeopleRecoCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PXPeopleRecoCollectionViewCell frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[PXPeopleRecoCollectionViewCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", v4, v6, v8);
  v10 = v9;
  -[PXPeopleRecoCollectionViewCell layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

}

- (void)setIsRejected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_tintedCircularImageWithColor:backgroundColor:", v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PXPeopleRecoCollectionViewCell checkView](self, "checkView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);
  objc_msgSend(v7, "setImage:", v8);

}

- (void)setImage:(id)a3 contentsRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PXPeopleRecoCollectionViewCell faceView](self, "faceView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);

  objc_msgSend(v11, "setImage:", v9);
}

- (BOOL)hasImageSet
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXPeopleRecoCollectionViewCell faceView](self, "faceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (UIImageView)faceView
{
  return self->_faceView;
}

- (UIImageView)checkView
{
  return self->_checkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
}

@end
