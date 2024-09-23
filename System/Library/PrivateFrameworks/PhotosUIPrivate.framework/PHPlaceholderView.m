@implementation PHPlaceholderView

- (PHPlaceholderView)initWithFrame:(CGRect)a3
{
  return -[PHPlaceholderView initWithType:](self, "initWithType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PHPlaceholderView)initWithCoder:(id)a3
{
  return -[PHPlaceholderView initWithType:](self, "initWithType:", 0);
}

- (PHPlaceholderView)initWithType:(int64_t)a3
{
  PHPlaceholderView *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHPlaceholderView;
  v5 = -[PHPlaceholderView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    if ((unint64_t)a3 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PHPlaceholderView.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PHPlaceholderTypeIsValid(type)"));

    }
    v5->_type = a3;
    -[PHPlaceholderView _setup](v5, "_setup");
  }
  return v5;
}

- (void)_setup
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  id v30;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "airPlayVideoPlaceholderBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPlaceholderView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[PHPlaceholderView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHPlaceholderView addSubview:](self, "addSubview:", v4);
  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(v30, "airPlayVideoPlaceholderIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithImage:", v6);

  objc_msgSend(v30, "airPlayVideoPlaceholderIconTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v7);
  v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  PULocalizedString(CFSTR("VIDEO_PLAYING_ON_EXTERNAL_DISPLAY_PLACEHOLDER_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(v30, "airPlayVideoPlaceholderTitleTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v11);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v30, "airPlayVideoPlaceholderTitleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v12);

  objc_msgSend(v4, "addSubview:", v9);
  -[PHPlaceholderView _appleTVMessage](self, "_appleTVMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(v14, "setText:", v13);
  objc_msgSend(v30, "airPlayVideoPlaceholderMessageTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v15);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v30, "airPlayVideoPlaceholderMessageFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v16);

  objc_msgSend(v4, "addSubview:", v14);
  -[PHPlaceholderView _setContainer:](self, "_setContainer:", v4);
  -[PHPlaceholderView _setImageView:](self, "_setImageView:", v7);
  -[PHPlaceholderView _setAirPlayLabel:](self, "_setAirPlayLabel:", v9);
  -[PHPlaceholderView _setAppleTVMessageLabel:](self, "_setAppleTVMessageLabel:", v14);
  _NSDictionaryOfVariableBindings(CFSTR("container, imageView, airPlayLabel, appleTVMessageLabel"), v4, v7, v9, v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[container]|"), 0, 0, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, self, 10, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 9, 0, v4, 9, 1.0, 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v21);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 11, 0, v7, 4, 1.0, 33.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v22);

  objc_msgSend(v18, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = 1132068864;
  objc_msgSend(v23, "setPriority:", v24);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 11, 0, v9, 11, 1.0, 15.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v25);

  objc_msgSend(v18, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = 1132068864;
  objc_msgSend(v26, "setPriority:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[appleTVMessageLabel]|"), 512, 0, v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v28);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[imageView]-(>=0)-[airPlayLabel]-(>=0)-[appleTVMessageLabel]|"), 512, 0, v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v29);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v18);
}

- (id)_appleTVMessage
{
  int64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[PHPlaceholderView type](self, "type");
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("AIRPLAY_SLIDESHOW_ON_APPLE_TV_MESSAGE");
  }
  else
  {
    v3 = CFSTR("VIDEO_PLAYING_ON_EXTERNAL_DISPLAY_PLACEHOLDER_MESSAGE");
  }
  PULocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (UIView)_container
{
  return self->__container;
}

- (void)_setContainer:(id)a3
{
  objc_storeStrong((id *)&self->__container, a3);
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setImageView:(id)a3
{
  objc_storeStrong((id *)&self->__imageView, a3);
}

- (UILabel)_airPlayLabel
{
  return self->__airPlayLabel;
}

- (void)_setAirPlayLabel:(id)a3
{
  objc_storeStrong((id *)&self->__airPlayLabel, a3);
}

- (UILabel)_appleTVMessageLabel
{
  return self->__appleTVMessageLabel;
}

- (void)_setAppleTVMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->__appleTVMessageLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__appleTVMessageLabel, 0);
  objc_storeStrong((id *)&self->__airPlayLabel, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__container, 0);
}

@end
