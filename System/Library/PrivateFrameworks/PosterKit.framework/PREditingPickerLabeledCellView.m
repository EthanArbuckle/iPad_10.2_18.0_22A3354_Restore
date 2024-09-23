@implementation PREditingPickerLabeledCellView

- (PREditingPickerLabeledCellView)initWithFrame:(CGRect)a3
{
  PREditingPickerLabeledCellView *v3;
  PREditingPickerLabeledCellView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UILabel *v9;
  UILabel *contentLabel;
  UILabel *v11;
  UILabel *nameLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  id v17;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[14];

  v58[12] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)PREditingPickerLabeledCellView;
  v3 = -[PREditingPickerLabeledCellView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PREditingPickerLabeledCellView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[PREditingPickerLabeledCellView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 14.0);

    -[PREditingPickerLabeledCellView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    contentLabel = v4->_contentLabel;
    v4->_contentLabel = v9;

    -[UILabel setTextAlignment:](v4->_contentLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditingPickerLabeledCellView addSubview:](v4, "addSubview:", v4->_contentLabel);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v11;

    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 2);
    v13 = v4->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setTextAlignment:](v4->_nameLabel, "setTextAlignment:", 1);
    v15 = v4->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setUserInteractionEnabled:](v4->_nameLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditingPickerLabeledCellView addSubview:](v4, "addSubview:", v4->_nameLabel);
    v17 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    -[PREditingPickerLabeledCellView addLayoutGuide:](v4, "addLayoutGuide:", v17);
    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v17, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerLabeledCellView leadingAnchor](v4, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v54;
    objc_msgSend(v17, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerLabeledCellView trailingAnchor](v4, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v51;
    objc_msgSend(v17, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingPickerLabeledCellView centerYAnchor](v4, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v48;
    -[UILabel topAnchor](v4->_contentLabel, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v45;
    -[UILabel centerXAnchor](v4->_contentLabel, "centerXAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v42;
    -[UILabel leadingAnchor](v4->_contentLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v38;
    -[UILabel trailingAnchor](v4->_contentLabel, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v35;
    -[UILabel topAnchor](v4->_nameLabel, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_contentLabel, "lastBaselineAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 4.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v32;
    -[UILabel centerXAnchor](v4->_nameLabel, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v29;
    -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 2.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v18;
    -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -2.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58[10] = v21;
    -[UILabel bottomAnchor](v4->_nameLabel, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58[11] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v25);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_contentLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_nameLabel, "intrinsicContentSize");
  v9 = v8 + 8.0 + 8.0;
  if (v4 >= v9)
    v9 = v4;
  v10 = v6 + 2.0 + v7 + 2.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PREditingPickerLabeledCellView;
  -[PREditingPickerLabeledCellView setSelected:](&v8, sel_setSelected_);
  -[PREditingPickerLabeledCellView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v3)
    v7 = 2.0;
  objc_msgSend(v5, "setBorderWidth:", v7);

}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
