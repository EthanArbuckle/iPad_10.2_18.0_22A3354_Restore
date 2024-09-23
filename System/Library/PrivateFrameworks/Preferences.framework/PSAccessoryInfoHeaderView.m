@implementation PSAccessoryInfoHeaderView

- (PSAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  PSAccessoryInfoHeaderView *v10;
  id v11;
  void *v12;
  uint64_t v13;
  UIImageView *imageView;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *displayNameLabel;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *otaNameLabel;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _QWORD v72[9];
  _QWORD v73[3];
  _BYTE v74[128];
  uint64_t v75;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PSAccessoryInfoHeaderView;
  v10 = -[PSAccessoryInfoHeaderView initWithFrame:](&v71, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PSAccessoryInfoHeaderView setLayoutMargins:](v10, "setLayoutMargins:", top, left, bottom, right);
  v11 = objc_alloc(MEMORY[0x1E0CEA658]);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("dot.radiowaves.left.and.right"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithImage:", v12);
  imageView = v10->_imageView;
  v10->_imageView = (UIImageView *)v13;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 100.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v10->_imageView, "setPreferredSymbolConfiguration:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v10->_imageView, "setTintColor:", v16);

  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  displayNameLabel = v10->_displayNameLabel;
  v10->_displayNameLabel = v17;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 24.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10->_displayNameLabel, "setFont:", v19);

  objc_msgSend(v9, "discoveryConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10->_displayNameLabel, "setText:", v21);

  -[UILabel setTextAlignment:](v10->_displayNameLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v10->_displayNameLabel, "setNumberOfLines:", 0);
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  otaNameLabel = v10->_otaNameLabel;
  v10->_otaNameLabel = v22;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10->_otaNameLabel, "setFont:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10->_otaNameLabel, "setTextColor:", v25);

  v66 = v9;
  objc_msgSend(v9, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10->_otaNameLabel, "setText:", v26);

  -[UILabel setTextAlignment:](v10->_otaNameLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v10->_otaNameLabel, "setNumberOfLines:", 0);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v73[0] = v10->_imageView;
  v73[1] = v10->_displayNameLabel;
  v73[2] = v10->_otaNameLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v68 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PSAccessoryInfoHeaderView addSubview:](v10, "addSubview:", v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v29);
  }

  v55 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView topAnchor](v10->_imageView, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView topAnchor](v10, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v63;
  -[UIImageView centerXAnchor](v10->_imageView, "centerXAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v60;
  -[UILabel topAnchor](v10->_displayNameLabel, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](v10->_imageView, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 10.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v57;
  -[UILabel centerXAnchor](v10->_displayNameLabel, "centerXAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v53;
  -[UILabel leadingAnchor](v10->_displayNameLabel, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView leadingAnchor](v10, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v52, "constraintGreaterThanOrEqualToAnchor:constant:", v51, v33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v50;
  -[UILabel topAnchor](v10->_otaNameLabel, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v10->_displayNameLabel, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v47;
  -[UILabel centerXAnchor](v10->_otaNameLabel, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView centerXAnchor](v10, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v35;
  -[UILabel leadingAnchor](v10->_otaNameLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView leadingAnchor](v10, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:constant:", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v39;
  -[UILabel bottomAnchor](v10->_otaNameLabel, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView bottomAnchor](v10, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoHeaderView layoutMargins](v10, "layoutMargins");
  objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v41, -v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 9);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "activateConstraints:", v44);

  return v10;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayNameLabel, a3);
}

- (UILabel)otaNameLabel
{
  return self->_otaNameLabel;
}

- (void)setOtaNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_otaNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaNameLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
