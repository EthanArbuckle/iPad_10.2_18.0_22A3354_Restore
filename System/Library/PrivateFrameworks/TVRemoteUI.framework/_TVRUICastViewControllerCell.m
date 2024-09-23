@implementation _TVRUICastViewControllerCell

- (_TVRUICastViewControllerCell)initWithFrame:(CGRect)a3
{
  _TVRUICastViewControllerCell *v3;
  _TVRUICastViewControllerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRUICastViewControllerCell;
  v3 = -[_TVRUICastViewControllerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVRUICastViewControllerCell configureHierarchy](v3, "configureHierarchy");
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVRUICastViewControllerCell;
  -[_TVRUICastViewControllerCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_TVRUICastViewControllerCell setRole:](self, "setRole:", 0);
}

- (void)setRole:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_role, a3);
  v5 = a3;
  -[_TVRUICastViewControllerCell _updateUIWithRole:](self, "_updateUIWithRole:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVRUICastViewControllerCell;
  -[_TVRUICastViewControllerCell layoutSubviews](&v8, sel_layoutSubviews);
  -[_TVRUICastViewControllerCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 > 0.0)
  {
    -[_TVRUICastViewControllerCell imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", v5 * 0.5);

  }
}

- (void)configureHierarchy
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
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
  UIImageView *imageView;
  UIImageView *v45;
  UILabel *nameLabel;
  UILabel *v47;
  UILabel *characterNameLabel;
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
  UIImageView *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  UILabel *v70;
  void *v71;
  void *v72;
  void *v73;
  UILabel *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _TVRUICastViewControllerCell *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[12];
  _QWORD v88[4];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.up.forward.square.fill"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v12);

  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v13);

  -[UIImageView setContentMode:](v8, "setContentMode:", 2);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.2, 1.0);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[UIImageView layer](v8, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderColor:", v15);

  -[UIImageView layer](v8, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderWidth:", 1.0);

  -[UIImageView setClipsToBounds:](v8, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1E0], 1024);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v19);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10, "setFont:", v20);

  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v21);

  v82 = self;
  -[_TVRUICastViewControllerCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v88[0] = v8;
  v88[1] = v9;
  v23 = v10;
  v88[2] = v10;
  v88[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v84 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v22, "addSubview:", v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v83, v89, 16);
    }
    while (v26);
  }

  v62 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](v8, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:constant:", v80, 10.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v79;
  -[UIImageView bottomAnchor](v8, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -10.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v76;
  -[UIImageView leadingAnchor](v8, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, 10.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v72;
  -[UIImageView widthAnchor](v8, "widthAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](v8, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v67;
  -[UILabel leadingAnchor](v9, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](v8, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 10.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v63;
  -[UILabel trailingAnchor](v9, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, -5.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v59;
  -[UILabel bottomAnchor](v9, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerYAnchor](v8, "centerYAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v56;
  -[UILabel leadingAnchor](v23, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v9, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v53;
  v74 = v23;
  -[UILabel trailingAnchor](v23, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -5.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v50;
  -[UILabel topAnchor](v23, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v9, "bottomAnchor");
  v70 = v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v30, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v31;
  objc_msgSend(v11, "centerYAnchor");
  v32 = v11;
  v71 = v11;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v35;
  objc_msgSend(v32, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v64 = v8;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v39);

  -[_TVRUICastViewControllerCell contentView](v82, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClipsToBounds:", 1);

  -[_TVRUICastViewControllerCell contentView](v82, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_setContinuousCornerRadius:", 13.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.18, 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUICastViewControllerCell contentView](v82, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBackgroundColor:", v42);

  imageView = v82->_imageView;
  v82->_imageView = v64;
  v45 = v64;

  nameLabel = v82->_nameLabel;
  v82->_nameLabel = v70;
  v47 = v70;

  characterNameLabel = v82->_characterNameLabel;
  v82->_characterNameLabel = v74;

}

- (void)_updateUIWithRole:(id)a3
{
  id v4;
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
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  -[_TVRUICastViewControllerCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  objc_msgSend(v4, "actorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUICastViewControllerCell nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "characterName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUICastViewControllerCell characterNameLabel](self, "characterNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v4, "imageURLTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x24BEB40A0];
    objc_msgSend(v4, "imageURLTemplate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageTemplateWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "urlForSize:", 200.0, 112.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageURLTemplate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __50___TVRUICastViewControllerCell__updateUIWithRole___block_invoke;
    v16[3] = &unk_24DE2D388;
    objc_copyWeak(&v17, &location);
    -[_TVRUICastViewControllerCell requestImageForURL:identifier:completion:](self, "requestImageForURL:identifier:completion:", v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)requestImageForURL:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v9, "length"))
  {
    objc_initWeak(&location, self);
    -[_TVRUICastViewControllerCell urlSession](self, "urlSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __73___TVRUICastViewControllerCell_requestImageForURL_identifier_completion___block_invoke;
    v16 = &unk_24DE2D3B0;
    v18 = v10;
    objc_copyWeak(&v19, &location);
    v17 = v9;
    objc_msgSend(v11, "dataTaskWithURL:completionHandler:", v8, &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "resume", v13, v14, v15, v16);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (TVRCMediaInfoRole)role
{
  return self->_role;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)characterNameLabel
{
  return self->_characterNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterNameLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
