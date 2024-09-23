@implementation UserProfilePersonalizationLinkCell

- (UserProfilePersonalizationLinkCell)initWithFrame:(CGRect)a3
{
  UserProfilePersonalizationLinkCell *v3;
  UserProfilePersonalizationLinkCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIListContentConfiguration *contentConfig;
  uint64_t v11;
  UIColor *glyphTintColor;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UserProfilePersonalizationLinkCell;
  v3 = -[UserProfilePersonalizationLinkCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UserProfilePersonalizationLinkCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    if (sub_1002A8AA0(v4) == 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
      -[UserProfilePersonalizationLinkCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v8);

    }
    v9 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration valueCellConfiguration](UIListContentConfiguration, "valueCellConfiguration"));
    contentConfig = v4->_contentConfig;
    v4->_contentConfig = (UIListContentConfiguration *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    glyphTintColor = v4->_glyphTintColor;
    v4->_glyphTintColor = (UIColor *)v11;

  }
  return v4;
}

- (void)_updateConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[UIListContentConfiguration setPrefersSideBySideTextAndSecondaryText:](self->_contentConfig, "setPrefersSideBySideTextAndSecondaryText:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIListContentConfiguration imageProperties](self->_contentConfig, "imageProperties"));
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIListContentConfiguration imageProperties](self->_contentConfig, "imageProperties"));
  objc_msgSend(v5, "setCornerRadius:", 15.0);

  -[UIListContentConfiguration setImageToTextPadding:](self->_contentConfig, "setImageToTextPadding:", 10.0);
  -[UIListContentConfiguration setDirectionalLayoutMargins:](self->_contentConfig, "setDirectionalLayoutMargins:", 11.0, 16.0, 11.0, 16.0);
  -[UserProfilePersonalizationLinkCell setContentConfiguration:](self, "setContentConfiguration:", self->_contentConfig);
  if (sub_1002A8AA0(self) != 5)
  {
    v6 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    v8 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    -[UserProfilePersonalizationLinkCell setAccessories:](self, "setAccessories:", v7);

  }
}

- (id)_convertIconToImageWithBackground:(id)a3
{
  id v4;
  ImageIconWithBackgroundConfiguration *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setBackgroundColor:](v5, "setBackgroundColor:", self->_glyphBackgroundColor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfilePersonalizationLinkCell glyphTintColor](self, "glyphTintColor"));
  -[ImageIconWithBackgroundConfiguration setTintColor:](v5, "setTintColor:", v6);

  -[ImageIconWithBackgroundConfiguration setIconSize:](v5, "setIconSize:", 30.0, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_imageIconWithBackgroundConfiguration:", v5));

  return v7;
}

- (void)setUserProfileLink:(id)a3
{
  UserProfileLink *v5;

  v5 = (UserProfileLink *)a3;
  if (self->_userProfileLink != v5)
    objc_storeStrong((id *)&self->_userProfileLink, a3);
  -[UserProfilePersonalizationLinkCell _updateFromUserProfileLinkModel](self, "_updateFromUserProfileLinkModel");

}

- (void)setTitle:(id)a3
{
  id WeakRetained;
  unsigned __int8 v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  v5 = objc_msgSend(WeakRetained, "isEqualToString:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_title, obj);
    -[UIListContentConfiguration setText:](self->_contentConfig, "setText:", obj);
  }

}

- (void)setSubtitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[UIListContentConfiguration setSecondaryText:](self->_contentConfig, "setSecondaryText:", v5);
  }

}

- (void)setIcon:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_icon != v6)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfilePersonalizationLinkCell _convertIconToImageWithBackground:](self, "_convertIconToImageWithBackground:", v6));
    -[UIListContentConfiguration setImage:](self->_contentConfig, "setImage:", v5);

  }
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[UserProfilePersonalizationLinkCell setTitle:](self, "setTitle:", a3);
  -[UserProfilePersonalizationLinkCell setSubtitle:](self, "setSubtitle:", v9);

  -[UserProfilePersonalizationLinkCell setIcon:](self, "setIcon:", v8);
  -[UserProfilePersonalizationLinkCell _updateConfiguration](self, "_updateConfiguration");
}

- (void)_updateFromUserProfileLinkModel
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink title](self->_userProfileLink, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink subtitle](self->_userProfileLink, "subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileLink icon](self->_userProfileLink, "icon"));
  -[UserProfilePersonalizationLinkCell updateTitle:subtitle:icon:](self, "updateTitle:subtitle:icon:", v3, v4, v5);

  -[UserProfilePersonalizationLinkCell _updateConfiguration](self, "_updateConfiguration");
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(UserProfilePersonalizationLinkCell);
  return NSStringFromClass(v2);
}

- (NSString)title
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_title);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (void)setGlyphTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphTintColor, a3);
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (void)setGlyphBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_glyphBackgroundColor, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UserProfileLink)userProfileLink
{
  return self->_userProfileLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileLink, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_destroyWeak((id *)&self->_title);
  objc_storeStrong((id *)&self->_contentConfig, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end
