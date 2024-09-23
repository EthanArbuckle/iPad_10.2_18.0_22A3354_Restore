@implementation ICNoteResultsThumbnailView

- (ICNoteResultsThumbnailView)initWithFrame:(CGRect)a3
{
  ICNoteResultsThumbnailView *v3;
  ICNoteResultsThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsThumbnailView;
  v3 = -[ICNoteResultsThumbnailView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICNoteResultsThumbnailView commonInit](v3, "commonInit");
  return v4;
}

- (ICNoteResultsThumbnailView)initWithCoder:(id)a3
{
  ICNoteResultsThumbnailView *v3;
  ICNoteResultsThumbnailView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsThumbnailView;
  v3 = -[ICNoteResultsThumbnailView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICNoteResultsThumbnailView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;
  UIImageView *v4;
  UIImageView *thumbnailImageView;
  void *v6;
  id v7;
  UIImageView *v8;
  UIImageView *largeImageView;
  void *v10;
  void *v11;
  id v12;
  UILabel *v13;
  UILabel *unsupportedNoteLabel;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[7];
  NSAttributedStringKey v51;
  id v52;

  v3 = objc_alloc((Class)UIImageView);
  -[ICNoteResultsThumbnailView bounds](self, "bounds");
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
  thumbnailImageView = self->_thumbnailImageView;
  self->_thumbnailImageView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_thumbnailImageView, "setBackgroundColor:", v6);

  -[ICNoteResultsThumbnailView addSubview:](self, "addSubview:", self->_thumbnailImageView);
  -[UIImageView ic_addAnchorsToFillSuperview](self->_thumbnailImageView, "ic_addAnchorsToFillSuperview");
  v7 = objc_alloc((Class)UIImageView);
  -[ICNoteResultsThumbnailView bounds](self, "bounds");
  v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
  largeImageView = self->_largeImageView;
  self->_largeImageView = v8;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_largeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_largeImageView, "setContentMode:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UIImageView setTintColor:](self->_largeImageView, "setTintColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_largeImageView, "setBackgroundColor:", v11);

  -[ICNoteResultsThumbnailView addSubview:](self, "addSubview:", self->_largeImageView);
  v12 = objc_alloc((Class)UILabel);
  -[ICNoteResultsThumbnailView bounds](self, "bounds");
  v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:");
  unsupportedNoteLabel = self->_unsupportedNoteLabel;
  self->_unsupportedNoteLabel = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_unsupportedNoteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_unsupportedNoteLabel, "setAdjustsFontForContentSizeCategory:", 1);
  if ((-[ICNoteResultsThumbnailView ic_hasCompactWidth](self, "ic_hasCompactWidth") & 1) != 0)
    v15 = objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:symbolicTraits:maxContentSizeCategory:](UIFont, "ic_preferredFontForStyle:symbolicTraits:maxContentSizeCategory:", UIFontTextStyleCaption1, 2, UIContentSizeCategoryAccessibilityMedium));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForTextStyle:maxContentSizeCategory:](UIFont, "ic_preferredFontForTextStyle:maxContentSizeCategory:", UIFontTextStyleTitle3, UIContentSizeCategoryAccessibilityMedium));
  v16 = (void *)v15;
  -[UILabel setFont:](self->_unsupportedNoteLabel, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_unsupportedNoteLabel, "setTextColor:", v17);

  -[UILabel setNumberOfLines:](self->_unsupportedNoteLabel, "setNumberOfLines:", 0);
  v18 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v18, "setAlignment:", 1);
  LODWORD(v19) = 1.0;
  v20 = v18;
  v49 = v18;
  objc_msgSend(v18, "setHyphenationFactor:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Unsupported Note"), &stru_1005704B8, 0));

  v22 = objc_alloc((Class)NSMutableAttributedString);
  v51 = NSParagraphStyleAttributeName;
  v52 = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v47 = objc_msgSend(v22, "initWithString:attributes:", v48, v23);

  -[UILabel setAttributedText:](self->_unsupportedNoteLabel, "setAttributedText:", v47);
  -[UILabel setHidden:](self->_unsupportedNoteLabel, "setHidden:", 1);
  -[ICNoteResultsThumbnailView addSubview:](self, "addSubview:", self->_unsupportedNoteLabel);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_largeImageView, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView centerXAnchor](self, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v50[0] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_largeImageView, "centerYAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView centerYAnchor](self, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v50[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_largeImageView, "heightAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView heightAnchor](self, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:multiplier:", v39, 0.5));
  v50[2] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_largeImageView, "widthAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_largeImageView, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v50[3] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_unsupportedNoteLabel, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView centerYAnchor](self, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v24));
  v50[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_unsupportedNoteLabel, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView leadingAnchor](self, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 8.0));
  v50[5] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_unsupportedNoteLabel, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView trailingAnchor](self, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -8.0));
  v50[6] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  -[ICNoteResultsThumbnailView setPreviewing:](self, "setPreviewing:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView layer](self, "layer"));
  objc_msgSend(v33, "setMasksToBounds:", 0);

}

- (void)setNote:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_storeWeak((id *)&self->_note, v15);
  if (!v15
    || (objc_storeWeak((id *)&self->_invitation, 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView noteIdentifier](self, "noteIdentifier")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier")),
        v6 = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
    objc_msgSend(v7, "setImage:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    -[ICNoteResultsThumbnailView setNoteIdentifier:](self, "setNoteIdentifier:", v8);

  }
  v9 = objc_opt_class(ICNote);
  v10 = ICDynamicCast(v9, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_msgSend(v11, "prefersLightBackground") & 1) != 0)
    v12 = 1;
  else
    v12 = (uint64_t)+[UITraitCollection ic_alwaysShowLightContent](UITraitCollection, "ic_alwaysShowLightContent");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_noteEditorPreviewColorForceLightContent:](UIColor, "ic_noteEditorPreviewColorForceLightContent:", v12));
  if (v15)
  {
    -[ICNoteResultsThumbnailView setBackgroundColor:](self, "setBackgroundColor:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ICNoteResultsThumbnailView setBackgroundColor:](self, "setBackgroundColor:", v14);

  }
  -[ICNoteResultsThumbnailView updateDropShadow](self, "updateDropShadow");
  -[ICNoteResultsThumbnailView updateImages](self, "updateImages");

}

- (void)setInvitation:(id)a3
{
  void *v5;
  void *v6;

  objc_storeWeak((id *)&self->_invitation, a3);
  if (a3)
  {
    objc_storeWeak((id *)&self->_note, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
    objc_msgSend(v5, "setImage:", 0);

    -[ICNoteResultsThumbnailView setNoteIdentifier:](self, "setNoteIdentifier:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ic_noteEditorPreviewColorForceLightContent:](UIColor, "ic_noteEditorPreviewColorForceLightContent:", 0));
    -[ICNoteResultsThumbnailView setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  -[ICNoteResultsThumbnailView updateDropShadow](self, "updateDropShadow");
  -[ICNoteResultsThumbnailView updateImages](self, "updateImages");
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView layer](self, "layer"));
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[ICNoteResultsThumbnailView ic_applyRoundedCornersWithRadius:](self, "ic_applyRoundedCornersWithRadius:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView layer](self, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", 0);

}

- (void)setHasDropShadow:(BOOL)a3
{
  self->_hasDropShadow = a3;
  -[ICNoteResultsThumbnailView updateDropShadow](self, "updateDropShadow");
}

- (void)setPreviewing:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  unsigned __int8 v6;
  unsigned int v7;

  v3 = a3;
  self->_previewing = a3;
  v5 = 0.0;
  if (!a3)
  {
    v6 = +[UIDevice ic_isVision](UIDevice, "ic_isVision", 0.0);
    v5 = 16.0;
    if ((v6 & 1) == 0)
    {
      v7 = -[ICNoteResultsThumbnailView ic_hasCompactWidth](self, "ic_hasCompactWidth", 16.0);
      v5 = 12.0;
      if (v7)
        v5 = 8.0;
    }
  }
  -[ICNoteResultsThumbnailView setCornerRadius:](self, "setCornerRadius:", v5);
  -[ICNoteResultsThumbnailView setHasDropShadow:](self, "setHasDropShadow:", !v3);
}

- (void)updateImages
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  __CFString *v18;
  __CFString *v19;
  unsigned int v20;
  uint64_t v21;
  const UIFontTextStyle *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIFontTextStyle v28;
  uint64_t v29;
  void *v30;
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView note](self, "note"));
  v4 = objc_opt_class(ICNote);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_opt_class(ICNote);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView note](self, "note"));
    v8 = ICDynamicCast(v6, v7);
    v31 = (id)objc_claimAutoreleasedReturnValue(v8);

    v9 = objc_msgSend(v31, "isUnsupported") ^ 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView unsupportedNoteLabel](self, "unsupportedNoteLabel"));
    objc_msgSend(v10, "setHidden:", v9);

    if (!objc_msgSend(v31, "isPasswordProtected")
      || -[ICNoteResultsThumbnailView isPreviewing](self, "isPreviewing")
      && (objc_msgSend(v31, "isAuthenticated") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView largeImageView](self, "largeImageView"));
      objc_msgSend(v11, "setImage:", 0);

      -[ICNoteResultsThumbnailView updateThumbnailImageIfNeededWithNote:](self, "updateThumbnailImageIfNeededWithNote:", v31);
    }
    else
    {
      v17 = objc_msgSend(v31, "isAuthenticated");
      v18 = CFSTR("lock.fill");
      if (v17)
        v18 = CFSTR("lock.open.fill");
      v19 = v18;
      v20 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
      if (v20)
        v21 = 3;
      else
        v21 = 1;
      v22 = &UIFontTextStyleTitle1;
      if (!v20)
        v22 = &UIFontTextStyleBody;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", v19, *v22, v21));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView largeImageView](self, "largeImageView"));
      objc_msgSend(v24, "setImage:", v23);

    }
    goto LABEL_24;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView note](self, "note"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView unsupportedNoteLabel](self, "unsupportedNoteLabel"));
    objc_msgSend(v13, "setHidden:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView largeImageView](self, "largeImageView"));
    objc_msgSend(v14, "setImage:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
    objc_msgSend(v15, "setImage:", 0);

    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100404B90(self, v16);

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView invitation](self, "invitation"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView unsupportedNoteLabel](self, "unsupportedNoteLabel"));
      objc_msgSend(v26, "setHidden:", 1);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
      objc_msgSend(v27, "setImage:", 0);

      if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
      {
        v28 = UIFontTextStyleTitle1;
        v29 = 3;
      }
      else
      {
        v28 = UIFontTextStyleBody;
        v29 = 1;
      }
      v31 = (id)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", CFSTR("arrow.down.message"), v28, v29));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView largeImageView](self, "largeImageView"));
      objc_msgSend(v30, "setImage:", v31);

LABEL_24:
    }
  }
}

- (void)animateThumbnailImageView
{
  void *v3;
  void *v4;
  double v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100050560;
  v6[3] = &unk_100550110;
  v6[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.5, 0.0);
}

- (void)updateThumbnailImageIfNeededWithNote:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23[2];
  id location;
  _QWORD v25[4];
  unsigned __int8 v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = objc_msgSend(v4, "ic_hasLightBackground");
  if ((v13 & 1) != 0)
    v14 = objc_claimAutoreleasedReturnValue(+[ICAppearanceInfo appearanceInfoWithType:](ICAppearanceInfo, "appearanceInfoWithType:", 0));
  else
    v14 = objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView ic_appearanceInfo](self, "ic_appearanceInfo"));
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView traitCollection](self, "traitCollection"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000507D4;
  v25[3] = &unk_100550F38;
  v26 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "traitCollectionByModifyingTraits:", v25));

  v18 = objc_msgSend(objc_alloc((Class)ICThumbnailConfiguration), "initForNoteGalleryWithNote:preferredSize:traitCollection:scale:appearanceInfo:", v4, v17, v15, v7, v9, v12);
  objc_initWeak(&location, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v21 = objc_msgSend(v20, "applicationState");

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000507EC;
  v22[3] = &unk_100550F88;
  objc_copyWeak(v23, &location);
  v22[4] = self;
  v23[1] = v21;
  objc_msgSend(v19, "thumbnailWithConfiguration:completion:", v18, v22);
  objc_destroyWeak(v23);

  objc_destroyWeak(&location);
}

- (void)updateDropShadow
{
  void *v3;

  if (-[ICNoteResultsThumbnailView hasDropShadow](self, "hasDropShadow")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsThumbnailView note](self, "note")),
        v3,
        v3))
  {
    -[ICNoteResultsThumbnailView ic_applyShadow](self, "ic_applyShadow");
  }
  else
  {
    -[ICNoteResultsThumbnailView ic_removeShadow](self, "ic_removeShadow");
  }
}

- (ICSearchIndexableNote)note
{
  return (ICSearchIndexableNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (ICInvitation)invitation
{
  return (ICInvitation *)objc_loadWeakRetained((id *)&self->_invitation);
}

- (BOOL)hasDropShadow
{
  return self->_hasDropShadow;
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (UIImageView)largeImageView
{
  return self->_largeImageView;
}

- (void)setLargeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_largeImageView, a3);
}

- (UILabel)unsupportedNoteLabel
{
  return self->_unsupportedNoteLabel;
}

- (void)setUnsupportedNoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedNoteLabel, a3);
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (NSString)noteIdentifier
{
  return self->_noteIdentifier;
}

- (void)setNoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_unsupportedNoteLabel, 0);
  objc_storeStrong((id *)&self->_largeImageView, 0);
  objc_destroyWeak((id *)&self->_invitation);
  objc_destroyWeak((id *)&self->_note);
}

@end
