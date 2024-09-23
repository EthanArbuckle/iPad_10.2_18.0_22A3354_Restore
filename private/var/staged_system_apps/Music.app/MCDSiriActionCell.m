@implementation MCDSiriActionCell

- (void)layoutSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MCDSiriActionCell;
  -[MCDSiriActionCell layoutSubviews](&v18, "layoutSubviews");
  v3 = sub_1000357A4();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIRI_ACTION_CELL_TITLE"), &stru_101122068, CFSTR("MusicCarDisplayUI")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell textLabel](self, "textLabel"));
  objc_msgSend(v10, "setHighlightedTextColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell textLabel](self, "textLabel"));
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell siriImageView](self, "siriImageView"));
  if (!v12)
  {
    v13 = objc_alloc((Class)UIImageView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("siri")));
    v15 = objc_msgSend(v13, "initWithImage:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v15, "setPreferredSymbolConfiguration:", v16);

    objc_msgSend(v15, "setContentMode:", 4);
    -[MCDSiriActionCell setSiriImageView:](self, "setSiriImageView:", v15);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell siriImageView](self, "siriImageView"));
  -[MCDSiriActionCell setAccessoryView:](self, "setAccessoryView:", v17);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDSiriActionCell;
  -[_MCDReusableCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[MCDSiriActionCell _updateSiriImageViewTintColor](self, "_updateSiriImageViewTintColor");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCDSiriActionCell;
  -[_MCDReusableCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[MCDSiriActionCell _updateSiriImageViewTintColor](self, "_updateSiriImageViewTintColor");
}

- (void)_updateSiriImageViewTintColor
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCDSiriActionCell siriImageView](self, "siriImageView"));
  if ((-[MCDSiriActionCell isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[MCDSiriActionCell isSelected](self, "isSelected") & 1) != 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
  }
  v4 = (void *)v3;
  objc_msgSend(v5, "setTintColor:", v3);

}

- (UIImageView)siriImageView
{
  return self->_siriImageView;
}

- (void)setSiriImageView:(id)a3
{
  objc_storeStrong((id *)&self->_siriImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriImageView, 0);
}

@end
