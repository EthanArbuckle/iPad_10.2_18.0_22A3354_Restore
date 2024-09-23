@implementation ICPaperStyleCell

- (ICPaperStyleCell)initWithFrame:(CGRect)a3
{
  ICPaperStyleCell *v3;
  ICPaperStyleCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICPaperStyleCell;
  v3 = -[ICPaperStyleCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICPaperStyleCell setupCell](v3, "setupCell");
  return v4;
}

- (void)setupCell
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
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
  id v32;
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
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v82 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[ICPaperStyleCell setSelectionView:](self, "setSelectionView:", v4);

  -[ICPaperStyleCell selectionView](self, "selectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICPaperStyleCell selectionView](self, "selectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell addSubview:](self, "addSubview:", v6);

  -[ICPaperStyleCell selectionView](self, "selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  v8 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = (uint64_t *)MEMORY[0x1E0CD2A68];
  if (v8)
  {
    objc_msgSend(v10, "setCornerRadius:", 23.0);

    v13 = *v12;
    -[ICPaperStyleCell selectionView](self, "selectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerCurve:", v13);

    -[ICPaperStyleCell selectionView](self, "selectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 4.0);
  }
  else
  {
    objc_msgSend(v10, "setCornerRadius:", 6.0);
  }

  -[ICPaperStyleCell leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v19);

  -[ICPaperStyleCell trailingAnchor](self, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v23);

  -[ICPaperStyleCell topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v27);

  -[ICPaperStyleCell bottomAnchor](self, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v31);

  v32 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[ICPaperStyleCell setImageView:](self, "setImageView:", v32);

  -[ICPaperStyleCell imageView](self, "imageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setContentMode:", 0);

  -[ICPaperStyleCell imageView](self, "imageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorPreviewColorForceLightContent:", 1);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackgroundColor:", v35);

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTintColor:", v37);

  -[ICPaperStyleCell imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell addSubview:](self, "addSubview:", v39);

  -[ICPaperStyleCell leadingAnchor](self, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v43 = 7.0;
  else
    v43 = 2.0;
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, -v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v44);

  -[ICPaperStyleCell topAnchor](self, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v48 = 7.0;
  else
    v48 = 2.0;
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, -v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v49);

  -[ICPaperStyleCell trailingAnchor](self, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v53 = 7.0;
  else
    v53 = 2.0;
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v54);

  -[ICPaperStyleCell bottomAnchor](self, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell imageView](self, "imageView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v58 = 7.0;
  else
    v58 = 2.0;
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addObject:", v59);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v82);
  -[ICPaperStyleCell imageView](self, "imageView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setMasksToBounds:", 0);

  v62 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  -[ICPaperStyleCell imageView](self, "imageView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "layer");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v62)
  {
    objc_msgSend(v64, "setCornerRadius:", 16.0);

    v66 = *v12;
    -[ICPaperStyleCell imageView](self, "imageView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setCornerCurve:", v66);
  }
  else
  {
    objc_msgSend(v64, "setCornerRadius:", 4.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = objc_msgSend(v69, "CGColor");
    -[ICPaperStyleCell imageView](self, "imageView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setShadowColor:", v70);

    -[ICPaperStyleCell imageView](self, "imageView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "layer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setShadowOffset:", 0.0, 1.0);

    -[ICPaperStyleCell imageView](self, "imageView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setShadowRadius:", 6.0);

    -[ICPaperStyleCell imageView](self, "imageView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v77) = 1022739087;
    objc_msgSend(v68, "setShadowOpacity:", v77);
  }

  -[ICPaperStyleCell layer](self, "layer");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setBorderWidth:", 0.0);

  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "layer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "cornerRadius");
  objc_msgSend(v79, "setCornerRadius:");

  -[ICPaperStyleCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v79);
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICPaperStyleCell;
  -[ICPaperStyleCell prepareForReuse](&v5, sel_prepareForReuse);
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[ICPaperStyleCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICPaperStyleCell;
  -[ICPaperStyleCell layoutSubviews](&v3, sel_layoutSubviews);
  -[ICPaperStyleCell updateColors](self, "updateColors");
}

- (void)updateColors
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  -[ICPaperStyleCell tintColor](self, "tintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    -[ICPaperStyleCell selectionView](self, "selectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", v4);

  }
  else
  {
    -[ICPaperStyleCell selectionView](self, "selectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v7);
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICPaperStyleCell;
  v3 = -[ICPaperStyleCell accessibilityTraits](&v8, sel_accessibilityTraits);
  -[ICPaperStyleCell selectionView](self, "selectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  v6 = *MEMORY[0x1E0DC46B0];
  if (v5)
    v6 = 0;
  return v6 | v3;
}

- (id)accessibilityHint
{
  return (id)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Double tap to choose paper style."), CFSTR("Double tap to choose paper style."), 0, 1);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
