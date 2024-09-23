@implementation EditShortcutTypeCell

- (EditShortcutTypeCell)initWithShortcut:(id)a3 shortcutType:(id)a4
{
  id v6;
  id v7;
  EditShortcutTypeCell *v8;
  EditShortcutTypeCell *v9;
  void *v10;
  id v11;
  double y;
  double width;
  double height;
  id v15;
  id v16;
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
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  void *v52;
  EditShortcutTypeCell *v53;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  objc_super v74;
  _QWORD v75[9];

  v6 = a3;
  v7 = a4;
  v74.receiver = self;
  v74.super_class = (Class)EditShortcutTypeCell;
  v8 = -[EditShortcutTypeCell initWithStyle:reuseIdentifier:](&v74, "initWithStyle:reuseIdentifier:", 0, CFSTR("EditShortcutTypeCell"));
  v9 = v8;
  if (v8)
  {
    -[EditShortcutTypeCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("EditShortcutTypeCell"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTypeCell contentView](v9, "contentView"));
    v11 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("EditShortcutTypeImage"));
    objc_msgSend(v10, "addSubview:", v15);
    objc_storeStrong((id *)&v9->_imageView, v15);
    v16 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("EditShortcutTypeLabel"));
    objc_msgSend(v10, "addSubview:", v16);
    v53 = v9;
    objc_storeStrong((id *)&v9->_label, v16);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToConstant:", 30.0));
    v75[0] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToConstant:", 30.0));
    v75[1] = v67;
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v75[2] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 16.0));
    v75[3] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v51 = v15;
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 10.0));
    v75[4] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, -10.0));
    v75[5] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v17));
    v75[6] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v71 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 15.0));
    v75[7] = v21;
    v50 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v52 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v24 = v7;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -15.0));
    v75[8] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

    v7 = v24;
    v6 = v71;

    v27 = objc_alloc((Class)MKMapItem);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "geoMapItem"));
    v29 = objc_msgSend(v27, "initWithGeoMapItem:isPlaceHolderPlace:", v28, 0);

    v30 = (unint64_t)objc_msgSend(v24, "type");
    v31 = v29;
    v32 = v31;
    if (v30 <= 5 && ((1 << v30) & 0x2C) != 0)
    {
      v33 = MapsSuggestionsLocalizedMyTitleForShortcutType(v30);
      v34 = (id)objc_claimAutoreleasedReturnValue(v33);
      v35 = v52;
      v9 = v53;
      v37 = v50;
      v36 = v51;
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_firstLocalizedCategoryName"));
      v39 = v38;
      if (v38)
      {
        v34 = v38;
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Address Label"), CFSTR("localized string not found"), 0));

      }
      v35 = v52;
      v9 = v53;
      v37 = v50;
      v36 = v51;

    }
    objc_msgSend(v37, "setText:", v34);

    if (sub_1002A8AA0(v9) != 5)
    {
      v41 = (unint64_t)objc_msgSend(v7, "type");
      v42 = v32;
      v43 = v42;
      if (v41 <= 5 && ((1 << v41) & 0x2C) != 0)
      {
        v44 = MapsSuggestionsShortcutTypeStyleAttributes(v41);
        v45 = objc_claimAutoreleasedReturnValue(v44);
      }
      else
      {
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_styleAttributes"));
      }
      v46 = (void *)v45;

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_10077D238;
      v72[3] = &unk_1011BAA70;
      v73 = v36;
      objc_msgSend(v47, "getImageForStyleAttributes:completion:", v46, v72);

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    -[EditShortcutTypeCell _updateFonts](v9, "_updateFonts");
  }

  return v9;
}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;

  if (sub_1002A8AA0(self) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v4 = (void *)v3;
  -[UILabel setFont:](self->_label, "setFont:", v3);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled") ^ 1);
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v3 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      v14[0] = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutTypeCell theme](self, "theme"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyColor"));
      v14[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("record.circle.fill"), v9));
      -[UIImageView setImage:](self->_imageView, "setImage:", v10);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v12);

      v13 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circle.fill")));
      -[UIImageView setImage:](self->_imageView, "setImage:");

    }
  }
  else
  {
    if (v3)
      v11 = 3;
    else
      v11 = 0;
    -[EditShortcutTypeCell setAccessoryType:](self, "setAccessoryType:", v11);
  }
}

- (BOOL)isChecked
{
  return -[EditShortcutTypeCell accessoryType](self, "accessoryType") == (id)3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
