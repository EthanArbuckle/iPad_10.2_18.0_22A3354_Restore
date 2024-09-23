@implementation MTSwitchCell

- (void)toggleOn:(BOOL)a3
{
  -[MTSwitchCell toggleOn:animated:](self, "toggleOn:animated:", a3, 0);
}

- (void)toggleOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell toggle](self, "toggle"));
  objc_msgSend(v6, "setOn:animated:", v5, v4);

}

- (void)setArtworkKey:(id)a3
{
  NSString **p_artworkKey;
  id v6;

  p_artworkKey = &self->_artworkKey;
  v6 = a3;
  if ((-[NSString isEqual:](*p_artworkKey, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_artworkKey, a3);
    if (-[NSString length](*p_artworkKey, "length"))
      -[MTSwitchCell _fetchArtwork](self, "_fetchArtwork");
    else
      -[MTSwitchCell _clearAndHideArtworkView](self, "_clearAndHideArtworkView");
  }

}

- (void)setMaximumNumberOfTextLines:(unint64_t)a3
{
  unint64_t v3;
  void *v5;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  if (self->_maximumNumberOfTextLines != v3)
  {
    self->_maximumNumberOfTextLines = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
    objc_msgSend(v5, "setNumberOfLines:", self->_maximumNumberOfTextLines);

    -[MTSwitchCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[MTSwitchCell _updateSeparatorInsets](self, "_updateSeparatorInsets");
  v3.receiver = self;
  v3.super_class = (Class)MTSwitchCell;
  -[MTTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[MTSwitchCell _layoutContentViewSubviews](self, "_layoutContentViewSubviews");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTSwitchCell;
  -[MTTableViewCell setEnabled:](&v6, "setEnabled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell toggle](self, "toggle"));
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)setupCell
{
  UISwitch *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTSwitchCell;
  -[MTTableViewCell setupCell](&v9, "setupCell");
  v3 = objc_opt_new(UISwitch);
  -[MTSwitchCell setToggle:](self, "setToggle:", v3);
  -[UISwitch addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, "toggleChanged:", 4096);
  -[MTSwitchCell setAccessoryView:](self, "setAccessoryView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](UIColor, "cellTextColor"));
  objc_msgSend(v4, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
  v7 = objc_msgSend((id)objc_opt_class(self), "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setFont:", v8);

}

- (void)setCellEmphasis:(int64_t)a3
{
  _QWORD v5[6];
  objc_super v6;

  if (-[MTTableViewCell cellEmphasis](self, "cellEmphasis") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MTSwitchCell;
    -[MTTableViewCell setCellEmphasis:](&v6, "setCellEmphasis:", a3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006DD5C;
    v5[3] = &unk_1004A77F8;
    v5[4] = self;
    v5[5] = a3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }
}

- (BOOL)customiseLabelAndSeparatorInsets
{
  return 1;
}

- (void)_updateSeparatorInsets
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;

  if (-[MTSwitchCell customiseLabelAndSeparatorInsets](self, "customiseLabelAndSeparatorInsets"))
  {
    v3 = -[MTSwitchCell mt_isRTL](self, "mt_isRTL");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell contentView](self, "contentView"));
    objc_msgSend(v4, "layoutMargins");
    v6 = v5;
    v8 = v7;

    if (v3)
      v6 = v8;
    v9 = -[MTSwitchCell _showsArtwork](self, "_showsArtwork");
    v10 = 64.0;
    if (!v9)
      v10 = 0.0;
    -[MTSwitchCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v6 + v10, 0.0, 0.0);
  }
}

- (void)_layoutContentViewSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  id v31;
  CGFloat Height;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  CGRect v53;

  v3 = -[MTSwitchCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v52 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell contentView](self, "contentView"));
  objc_msgSend(v52, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v52, "layoutMargins");
  v13 = v12;
  v14 = objc_msgSend(v52, "layoutMargins");
  v16 = ((uint64_t (*)(id, double, double, double, double, double, double, double, double))UIRectInset)(v14, v5, v7, v9, v11, 0.0, v13, 0.0, v15);
  if (v3 == (id)1)
  {
    v21 = 0.0;
    v22 = 10.0;
  }
  else
  {
    v21 = 10.0;
    v22 = 0.0;
  }
  v23 = UIRectInset(v16, v17, v18, v19, v20, 0.0, v21, 0.0, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    v53.origin.x = v23;
    v53.origin.y = v25;
    v53.size.width = v27;
    v53.size.height = v29;
    Height = CGRectGetHeight(v53);
    v33 = sub_10011A178(v3 == (id)1, 1, 1, 0.0, (Height + -48.0) * 0.5, 48.0, 48.0, v23, v25, v27, v29);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "superview"));

    if (!v42)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
      objc_msgSend(v52, "addSubview:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
      objc_msgSend(v45, "setClipsToBounds:", 1);

    }
    if (v3 == (id)1)
    {
      v46 = 64.0;
      v47 = 0.0;
    }
    else
    {
      v47 = 64.0;
      v46 = 0.0;
    }
    v23 = UIRectInset(v43, v23, v25, v27, v29, 0.0, v46, 0.0, v47);
    v25 = v48;
    v27 = v49;
    v29 = v50;
  }
  if (-[MTSwitchCell customiseLabelAndSeparatorInsets](self, "customiseLabelAndSeparatorInsets"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
    objc_msgSend(v51, "setFrame:", v23, v25, v27, v29);

  }
}

- (BOOL)_showsArtwork
{
  return -[NSString length](self->_artworkKey, "length") != 0;
}

- (void)_clearAndHideArtworkView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell _artworkView](self, "_artworkView"));
  objc_msgSend(v2, "setImage:", 0);
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)_fetchArtwork
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell _artworkView](self, "_artworkView"));
    objc_msgSend(v5, "mt_configureForDisplayingArtworkWithRadius:", 3.0);
    objc_msgSend(v5, "setHidden:", 0);
    if (!-[MTSwitchCell _loadArtworkFromMemoryCache](self, "_loadArtworkFromMemoryCache"))
    {
      objc_msgSend(v5, "setImage:", 0);
      -[MTSwitchCell _fetchArtworkInBackground](self, "_fetchArtworkInBackground");
    }

  }
}

- (void)_fetchArtworkInBackground
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](UIImage, "defaultPodcastArtwork"));
  -[MTSwitchCell _asyncFetchArtworkDidLoadImage:forArtworkKey:](self, "_asyncFetchArtworkDidLoadImage:forArtworkKey:", v4, v3);

  if (-[MTSwitchCell isPlaceholder](self, "isPlaceholder"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006E454;
    v8[3] = &unk_1004A7820;
    v6 = v8;
    v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = v3;
    objc_msgSend(v5, "placeholderWithSize:completionHandler:", v8, 48.0, 48.0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006E3C4;
    v10[3] = &unk_1004A7820;
    v6 = v10;
    v7 = &v12;
    objc_copyWeak(&v12, &location);
    v11 = v3;
    objc_msgSend(v5, "artworkForShow:size:completionHandler:", v11, v10, 48.0, 48.0);
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

}

- (void)_asyncFetchArtworkDidLoadImage:(id)a3 forArtworkKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006E594;
  v9[3] = &unk_1004A7398;
  v9[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  +[NSThread mainThread:](NSThread, "mainThread:", v9);

}

- (BOOL)_loadArtworkFromMemoryCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  if (v3
    && !-[MTSwitchCell isPlaceholder](self, "isPlaceholder")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyUICachedArtworkForPodcastUuid:withSize:", v3, 48.0, 48.0)),
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    objc_msgSend(v6, "setImage:", v5);

    -[MTSwitchCell setNeedsLayout](self, "setNeedsLayout");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPlaceholder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  v3 = objc_msgSend(v2, "isEqualToString:", kMTLibraryDefaultImageKey);

  return v3;
}

+ (id)titleFont
{
  return +[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void)toggleChanged:(id)a3
{
  void (**toggleChanged)(id, id);

  toggleChanged = (void (**)(id, id))self->_toggleChanged;
  if (toggleChanged)
    toggleChanged[2](toggleChanged, objc_msgSend(a3, "isOn"));
}

- (id)imageProvider
{
  PUIObjCArtworkProvider *imageProvider;
  PUIObjCArtworkProvider *v4;
  PUIObjCArtworkProvider *v5;

  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    v4 = (PUIObjCArtworkProvider *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider uiShared](PUIObjCArtworkProvider, "uiShared"));
    v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }
  return imageProvider;
}

- (id)toggleChanged
{
  return self->_toggleChanged;
}

- (void)setToggleChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)artworkKey
{
  return self->_artworkKey;
}

- (unint64_t)maximumNumberOfTextLines
{
  return self->_maximumNumberOfTextLines;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
  objc_storeStrong((id *)&self->_toggle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_artworkKey, 0);
  objc_storeStrong(&self->_toggleChanged, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
