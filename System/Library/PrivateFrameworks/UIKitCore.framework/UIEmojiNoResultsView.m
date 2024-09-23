@implementation UIEmojiNoResultsView

- (UIEmojiNoResultsView)initWithFrame:(CGRect)a3
{
  UIEmojiNoResultsView *v3;
  UILabel *v4;
  UILabel *noResultsLabel;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *createNewEmojiLabel;
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
  UILabel *v22;
  UITapGestureRecognizer *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)UIEmojiNoResultsView;
  v3 = -[UIView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UILabel);
    noResultsLabel = v3->_noResultsLabel;
    v3->_noResultsLabel = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_noResultsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _UILocalizedStringInSystemLanguage(CFSTR("No Results"), CFSTR("No Results"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_noResultsLabel, "setText:", v6);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_noResultsLabel, "setFont:", v7);

    -[UILabel setTextAlignment:](v3->_noResultsLabel, "setTextAlignment:", 1);
    +[UIColor labelColor](UIColor, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_noResultsLabel, "setTextColor:", v8);

    -[UIView addSubview:](v3, "addSubview:", v3->_noResultsLabel);
    v9 = objc_alloc_init(UILabel);
    createNewEmojiLabel = v3->_createNewEmojiLabel;
    v3->_createNewEmojiLabel = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_createNewEmojiLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _UILocalizedStringInSystemLanguage(CFSTR("Create New Emoji"), CFSTR("Create New Emoji"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_createNewEmojiLabel, "setText:", v11);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_createNewEmojiLabel, "setFont:", v12);

    -[UILabel setTextAlignment:](v3->_createNewEmojiLabel, "setTextAlignment:", 1);
    +[_UIIntelligenceLightSourceDescriptor sharedLight](_UIIntelligenceLightSourceDescriptor, "sharedLight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setLightSourceDescriptor:](v3->_createNewEmojiLabel, "_setLightSourceDescriptor:", v13);

    -[UIView addSubview:](v3, "addSubview:", v3->_createNewEmojiLabel);
    v25 = (void *)MEMORY[0x1E0D156E0];
    -[UIView bottomAnchor](v3->_noResultsLabel, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    -[UIView centerXAnchor](v3->_noResultsLabel, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    -[UIView topAnchor](v3->_createNewEmojiLabel, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 10.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    -[UIView centerXAnchor](v3->_createNewEmojiLabel, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v21);

    -[UILabel setUserInteractionEnabled:](v3->_createNewEmojiLabel, "setUserInteractionEnabled:", 1);
    -[NSObject setAccessibilityTraits:](v3->_createNewEmojiLabel, "setAccessibilityTraits:", 1);
    v22 = v3->_createNewEmojiLabel;
    v23 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v3, sel_createNewEmoji);
    -[UIView addGestureRecognizer:](v22, "addGestureRecognizer:", v23);

  }
  return v3;
}

- (void)setSupportsGenmoji:(BOOL)a3
{
  self->_supportsGenmoji = a3;
  -[UIView setHidden:](self->_createNewEmojiLabel, "setHidden:", !a3);
}

- (void)createNewEmoji
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldCreateNotification"), 0, 0);

}

- (BOOL)supportsGenmoji
{
  return self->_supportsGenmoji;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createNewEmojiLabel, 0);
  objc_storeStrong((id *)&self->_noResultsLabel, 0);
}

@end
