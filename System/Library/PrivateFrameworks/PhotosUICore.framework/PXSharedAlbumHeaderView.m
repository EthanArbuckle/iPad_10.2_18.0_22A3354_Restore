@implementation PXSharedAlbumHeaderView

- (PXSharedAlbumHeaderView)init
{
  PXSharedAlbumHeaderView *v2;
  PXSharedAlbumHeaderView *v3;
  UIImageView *v4;
  UIImageView *headerImageView;
  void *v6;
  UILabel *v7;
  UILabel *titleLabel;
  UILabel *v9;
  UILabel *subtitleLabel;
  void *v11;
  uint64_t v12;
  UIImageView *chevronView;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXSharedAlbumHeaderView;
  v2 = -[PXSharedAlbumHeaderView init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_textColorStyle = 0;
    v2->_headerImageTag = 0;
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    headerImageView = v3->_headerImageView;
    v3->_headerImageView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_headerImageView, "setTintColor:", v6);

    -[UIImageView setAccessibilityIgnoresInvertColors:](v3->_headerImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXSharedAlbumHeaderView addSubview:](v3, "addSubview:", v3->_headerImageView);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    -[UILabel setUserInteractionEnabled:](v3->_titleLabel, "setUserInteractionEnabled:", 1);
    -[PXSharedAlbumHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v9;

    -[UILabel setUserInteractionEnabled:](v3->_subtitleLabel, "setUserInteractionEnabled:", 1);
    -[PXSharedAlbumHeaderView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    +[PXActivitySpec activityChevronImage](PXActivitySpec, "activityChevronImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_chevronView, "setTintColor:", v14);

    -[PXSharedAlbumHeaderView addSubview:](v3, "addSubview:", v3->_chevronView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)setUseInPopover:(BOOL)a3
{
  if (self->_useInPopover != a3)
  {
    self->_useInPopover = a3;
    -[PXSharedAlbumHeaderView _updateUI](self, "_updateUI");
  }
}

- (void)setTextColorStyle:(unint64_t)a3
{
  if (self->_textColorStyle != a3)
  {
    self->_textColorStyle = a3;
    -[PXSharedAlbumHeaderView _updateUI](self, "_updateUI");
  }
}

- (void)setLayoutStyle:(unint64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[PXSharedAlbumHeaderView _updateUI](self, "_updateUI");
  }
}

- (void)setSectionInfo:(id)a3
{
  PXFeedSectionInfo *sectionInfo;
  id v6;

  v6 = a3;
  sectionInfo = self->_sectionInfo;
  if (!sectionInfo || -[PXFeedSectionInfo isLoaded](sectionInfo, "isLoaded"))
  {
    objc_storeStrong((id *)&self->_sectionInfo, a3);
    -[PXSharedAlbumHeaderView _updateUI](self, "_updateUI");
  }

}

- (void)setHeaderImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_headerImage != v6)
  {
    objc_storeStrong((id *)&self->_headerImage, a3);
    -[PXSharedAlbumHeaderView headerImageView](self, "headerImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setIsNew:(BOOL)a3
{
  if (self->_isNew != a3)
  {
    self->_isNew = a3;
    -[PXSharedAlbumHeaderView _updateTitle](self, "_updateTitle");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumHeaderView;
  -[PXSharedAlbumHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXSharedAlbumHeaderView bounds](self, "bounds");
  -[PXSharedAlbumHeaderView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXSharedAlbumHeaderView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGPoint v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = -[PXSharedAlbumHeaderView tappableArea](self, "tappableArea")) != 0)
  {
    v6 = v5;
    objc_msgSend(v4, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    if ((v6 & 1) != 0)
    {
      -[PXSharedAlbumHeaderView titleLabel](self, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");

      -[PXSharedAlbumHeaderView chevronView](self, "chevronView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");

      PXRectWithMinimumSize();
      v17.x = v8;
      v17.y = v10;
      v11 = CGRectContainsPoint(v19, v17);
      if ((v6 & 2) != 0)
      {
LABEL_9:
        -[PXSharedAlbumHeaderView subtitleLabel](self, "subtitleLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");

        -[PXSharedAlbumHeaderView chevronView](self, "chevronView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");

        PXRectWithMinimumSize();
        v18.x = v8;
        v18.y = v10;
        v11 = CGRectContainsPoint(v20, v18);
      }
    }
    else
    {
      v11 = 0;
      if ((v6 & 2) != 0)
        goto LABEL_9;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)_updateBackgroundColor
{
  id v3;

  if (-[PXSharedAlbumHeaderView textColorStyle](self, "textColorStyle") == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    +[PXActivitySpec invitationParentViewBackgroundColor:](PXActivitySpec, "invitationParentViewBackgroundColor:", -[PXSharedAlbumHeaderView useInPopover](self, "useInPopover"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_updateHeaderImage
{
  void *v3;
  id v4;

  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView setHeaderImageTag:](self, "setHeaderImageTag:", -[PXSharedAlbumHeaderView headerImageTag](self, "headerImageTag") + 1);
  if (v4)
  {
    if (objc_msgSend(v4, "sectionType") == 2)
    {
      +[PXActivitySpec invitationHeaderImage](PXActivitySpec, "invitationHeaderImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedAlbumHeaderView setHeaderImage:](self, "setHeaderImage:", v3);

    }
    else
    {
      -[PXSharedAlbumHeaderView _updateAvatar:](self, "_updateAvatar:", -[PXSharedAlbumHeaderView headerImageTag](self, "headerImageTag"));
    }
  }
  else
  {
    -[PXSharedAlbumHeaderView setHeaderImage:](self, "setHeaderImage:", 0);
  }

}

- (void)_updateAvatar:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  _BOOL8 v18;
  void *v19;
  _QWORD v20[4];
  id v21[2];
  id location;

  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v6, "sectionType"))
  {
    case 0:
      v14 = v6;
      if (objc_msgSend(v14, "numberOfItems") < 1)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v14, "assetForItemAtIndex:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "cloudOwnerFirstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cloudOwnerLastName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cloudOwnerEmail");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (objc_msgSend(v15, "cloudIsMyAsset"))
        {
          objc_msgSend(MEMORY[0x1E0D719E0], "sharingUsername");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
      }

      goto LABEL_12;
    case 3:
    case 5:
      objc_msgSend(MEMORY[0x1E0D719E0], "sharingFirstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D719E0], "sharingLastName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D719E0], "sharingUsername");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v13 = 0;
      break;
    case 4:
      objc_msgSend(v6, "invitationRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inviteeEmails");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "inviteePhones");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "inviteeFirstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inviteeLastName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumHeaderView.m"), 274, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  objc_initWeak(&location, self);
  -[PXSharedAlbumHeaderView px_screenScale](self, "px_screenScale");
  v17 = v16;
  v18 = -[PXSharedAlbumHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __41__PXSharedAlbumHeaderView__updateAvatar___block_invoke;
  v20[3] = &unk_1E5147548;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", v18, v9, v13, v7, v8, 1, 32.0, 32.0, v17, v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)_handleHeaderImage:(id)a3 imageTag:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[PXSharedAlbumHeaderView headerImageTag](self, "headerImageTag") == a4)
    -[PXSharedAlbumHeaderView setHeaderImage:](self, "setHeaderImage:", v6);

}

- (void)_updateTitle
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "sectionType");
    v7 = -[PXSharedAlbumHeaderView textColorStyle](self, "textColorStyle");
    +[PXActivitySpec activityHeaderTextAttributesForTextColorStyle:](PXActivitySpec, "activityHeaderTextAttributesForTextColorStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXActivitySpec activityPosterTextAttributesForTextColorStyle:](PXActivitySpec, "activityPosterTextAttributesForTextColorStyle:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    switch(v6)
    {
      case 0:
        if (objc_msgSend(v5, "numberOfItems") < 1)
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v5, "assetForItemAtIndex:", 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v10, "cloudIsMyAsset") & 1) != 0)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v10, "cloudOwnerDisplayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v22 = objc_alloc_init(MEMORY[0x1E0CB3550]);
        objc_msgSend(v5, "countsByAssetDisplayType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "unionSet:", v23);

        objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:defaultTextAttributes:posterTextAttributes:", v22, v13, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      case 2:
        v12 = objc_alloc(MEMORY[0x1E0CB3498]);
        PXLocalizedStringFromTable(CFSTR("PXForYouInvitationLabel"), CFSTR("PhotosUICore"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        +[PXActivitySpec invitationTextAttributes](PXActivitySpec, "invitationTextAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithString:attributes:", v10, v13);
        goto LABEL_15;
      case 3:
        objc_msgSend(v5, "albumTitle");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[PXActivitySpec activityAlbumTitleTextAttributesForTextColorStyle:](PXActivitySpec, "activityAlbumTitleTextAttributesForTextColorStyle:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserJoiningSharedAlbumWithName:defaultTextAttributes:posterTextAttributes:albumTextAttributes:", v10, v8, v9, v13);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        PLPhotoSharingGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        *(_DWORD *)buf = 138412290;
        v47 = v5;
        goto LABEL_43;
      case 4:
        v43 = v8;
        v15 = v5;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "px_descriptionForAssertionMessage");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumHeaderView.m"), 336, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sectionInfo"), v40, v41);

        }
        v10 = v15;
        objc_msgSend(v10, "invitationRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "inviteeDisplayNameIncludingEmail:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "invitationState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        objc_msgSend(v10, "albumTitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          +[PXActivitySpec activityAlbumTitleTextAttributesForTextColorStyle:](PXActivitySpec, "activityAlbumTitleTextAttributesForTextColorStyle:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18 == 2;
          v8 = v43;
          objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:sharedAlbumName:accepted:defaultTextAttributes:posterTextAttributes:albumTextAttributes:", v16, v19, v21, v43, v9, v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          PLPhotoSharingGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v10;
            _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "ERROR: Section information (%@) missing album title", buf, 0xCu);
          }

          v11 = 0;
          v8 = v43;
        }

        goto LABEL_27;
      case 5:
        objc_msgSend(v5, "albumTitle");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[PXActivitySpec activityAlbumTitleTextAttributesForTextColorStyle:](PXActivitySpec, "activityAlbumTitleTextAttributesForTextColorStyle:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForUserCreatingSharedAlbumWithName:defaultTextAttributes:posterTextAttributes:albumTextAttributes:", v10, v8, v9, v13);
          v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v11 = (void *)v14;
LABEL_27:

        }
        else
        {
          PLPhotoSharingGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v5;
LABEL_43:
            _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "ERROR: Section information (%@) missing album title", buf, 0xCu);
          }
LABEL_44:

          v11 = 0;
        }

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumHeaderView.m"), 352, CFSTR("Code which should be unreachable has been reached"));

        abort();
    }
  }
  else
  {
    v11 = 0;
  }
  -[PXSharedAlbumHeaderView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXSharedAlbumHeaderView isNew](self, "isNew")
    && (-[PXSharedAlbumHeaderView layoutStyle](self, "layoutStyle") & 2) != 0)
  {
    objc_msgSend(v26, "font");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v28 = *MEMORY[0x1E0DC1138];
      objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
      }
      else
      {
        objc_msgSend(v26, "font");
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v31;

      v27 = v33;
    }
    else
    {
      PLPhotoSharingGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v5;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "ERROR: New section information (%@) missing title", buf, 0xCu);
      }

      v28 = *MEMORY[0x1E0DC1138];
    }
    v34 = *MEMORY[0x1E0DC1140];
    v44[0] = v28;
    v44[1] = v34;
    v45[0] = v27;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "px_bulletPrefixAttributedStringWithBulletAttributes:isLeftToRight:", v36, -[PXSharedAlbumHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 0);
    v37 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v37;
  }
  objc_msgSend(v26, "setAttributedText:", v11);

}

- (void)_updateSubtitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "sectionType");
    switch(v5)
    {
      case 4:
        objc_msgSend(v4, "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(v4, "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXActivityUtilities textForDate:](PXActivityUtilities, "textForDate:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x1E0CB3498];
          +[PXActivitySpec activityDateSubtitleTextAttributes](PXActivitySpec, "activityDateSubtitleTextAttributes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "px_attributedStringWithHTMLString:defaultAttributes:", v11, v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        PLPhotoSharingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v20 = 138412290;
          *(_QWORD *)&v20[4] = v4;
          v18 = "ERROR: Section information (%@) missing date";
LABEL_15:
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, v18, v20, 0xCu);
        }
LABEL_16:

        v9 = 0;
        goto LABEL_17;
      case 2:
        v14 = objc_alloc(MEMORY[0x1E0CB3498]);
        PXLocalizedStringFromTable(CFSTR("PXForYouInvitationSubtitle"), CFSTR("PhotosUICore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXActivitySpec invitationSubtitleTextAttributes](PXActivitySpec, "invitationSubtitleTextAttributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v16);

        goto LABEL_18;
      case 0:
        objc_msgSend(v4, "albumTitle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = objc_alloc(MEMORY[0x1E0CB3498]);
          +[PXActivitySpec activityAlbumTitleTextAttributesForTextColorStyle:](PXActivitySpec, "activityAlbumTitleTextAttributesForTextColorStyle:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v8);

LABEL_17:
          goto LABEL_18;
        }
        PLPhotoSharingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v20 = 138412290;
          *(_QWORD *)&v20[4] = v4;
          v18 = "ERROR: Section information (%@) missing album title";
          goto LABEL_15;
        }
        goto LABEL_16;
    }
  }
  v9 = 0;
LABEL_18:
  -[PXSharedAlbumHeaderView subtitleLabel](self, "subtitleLabel", *(_OWORD *)v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAttributedText:", v9);

}

- (void)_updateIsNew
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (-[PXSharedAlbumHeaderView isObservingLastExitedForYou](self, "isObservingLastExitedForYou"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PXForYouLastExitedDateChangeNotification"), 0);

    -[PXSharedAlbumHeaderView setIsObservingLastExitedForYou:](self, "setIsObservingLastExitedForYou:", 0);
  }
  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  PXForYouLastExitedDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v10
    && (objc_msgSend(v5, "laterDate:", v10), v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 == v10))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__lastExitedForYouDateDidChange_, CFSTR("PXForYouLastExitedDateChangeNotification"), 0);

    v8 = 1;
    -[PXSharedAlbumHeaderView setIsObservingLastExitedForYou:](self, "setIsObservingLastExitedForYou:", 1);
  }
  else
  {
    v8 = 0;
  }
  -[PXSharedAlbumHeaderView setIsNew:](self, "setIsNew:", v8);

}

- (BOOL)_showSubtitle
{
  void *v3;
  unint64_t v4;

  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionType");

  return v4 <= 4 && ((1 << v4) & 0x15) != 0 && -[PXSharedAlbumHeaderView textColorStyle](self, "textColorStyle") == 0;
}

- (BOOL)_showChevron
{
  void *v3;
  uint64_t v4;
  BOOL result;

  -[PXSharedAlbumHeaderView sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionType");

  result = 0;
  if (v4 != 2 && v4 != 4)
    return -[PXSharedAlbumHeaderView textColorStyle](self, "textColorStyle") == 0;
  return result;
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[PXSharedAlbumHeaderView subtitleLabel](self, "subtitleLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView _updateBackgroundColor](self, "_updateBackgroundColor");
  -[PXSharedAlbumHeaderView _updateHeaderImage](self, "_updateHeaderImage");
  -[PXSharedAlbumHeaderView _updateIsNew](self, "_updateIsNew");
  -[PXSharedAlbumHeaderView _updateTitle](self, "_updateTitle");
  -[PXSharedAlbumHeaderView _updateSubtitle](self, "_updateSubtitle");
  if ((-[PXSharedAlbumHeaderView layoutStyle](self, "layoutStyle") & 1) != 0)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    -[PXSharedAlbumHeaderView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == (void *)*MEMORY[0x1E0DC4938])
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v5))
    {
      v8 = 2;
      v9 = 2;
    }
    else
    {
      objc_msgSend(v12, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v8 = 1;
      if (v11)
        v9 = 1;
      else
        v9 = 2;
    }

  }
  objc_msgSend(v3, "setNumberOfLines:", v9);
  objc_msgSend(v12, "setNumberOfLines:", v8);
  -[PXSharedAlbumHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSString *v25;
  _BOOL4 IsAccessibilityCategory;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  int v47;
  double *v48;
  double Height;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  CGFloat v67;
  double MaxX;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  void *v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  double v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat x;
  double v101;
  CGFloat y;
  double v103;
  CGFloat rect;
  double recta;
  CGFloat rectb;
  CGSize result;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v4 = a4;
  y = a3.origin.y;
  rect = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  -[PXSharedAlbumHeaderView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v9 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");

  }
  -[PXSharedAlbumHeaderView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView subtitleLabel](self, "subtitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumHeaderView chevronView](self, "chevronView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXSharedAlbumHeaderView _showSubtitle](self, "_showSubtitle");
  v15 = -[PXSharedAlbumHeaderView _showChevron](self, "_showChevron");
  v95 = width;
  v16 = width + -8.0 + -32.0;
  objc_msgSend(v11, "sizeThatFits:", v16, 1.79769313e308);
  v19 = v18;
  if (v16 >= v17)
    v20 = v17;
  else
    v20 = v16;
  objc_msgSend(v12, "sizeThatFits:", v16, 1.79769313e308);
  v99 = v22;
  if (v16 >= v21)
    v23 = v21;
  else
    v23 = v16;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferredContentSizeCategory");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

  +[PXActivitySpec headerDynamicTopToBottomTitleDistance](PXActivitySpec, "headerDynamicTopToBottomTitleDistance");
  v28 = v27;
  objc_msgSend(v11, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lineHeight");
  v93 = v19;
  v31 = v19 - v30;

  v32 = 0.0;
  if (v31 >= 0.0)
    v33 = v31;
  else
    v33 = 0.0;
  +[PXActivitySpec headerDynamicBottomTitleToBottomSubtitleDistance](PXActivitySpec, "headerDynamicBottomTitleToBottomSubtitleDistance");
  v35 = v34;
  +[PXActivitySpec headerDynamicBottomSubtitleToBottomDistance](PXActivitySpec, "headerDynamicBottomSubtitleToBottomDistance");
  v37 = v36;
  if (v14)
  {
    if (objc_msgSend(v12, "numberOfLines") != 1)
    {
      objc_msgSend(v12, "font");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lineHeight");
      v40 = v99 - v39;

      v41 = 0.0;
      if (v40 >= 0.0)
        v41 = v40;
      v37 = v37 + v41;
    }
    v42 = v35;
  }
  else
  {
    v42 = 0.0;
  }
  v98 = v23;
  v92 = v20;
  v43 = v42 + v28 + v33 + v37;
  if (-[PXSharedAlbumHeaderView layoutStyle](self, "layoutStyle") == 1)
  {
    v44 = 16.0;
    v45 = 8.0;
  }
  else
  {
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "disableSharedAlbumTopMargin");

    if (v47)
      v32 = 4.0;
    else
      v32 = 0.0;
    if (v47)
      v45 = 0.0;
    else
      v45 = 8.0;
    if (v47)
      v44 = 8.0;
    else
      v44 = 16.0;
  }
  v48 = (double *)MEMORY[0x1E0C9D648];
  Height = v28 + v35 + v37 + v44;
  if (Height < v43 + v44)
    Height = v43 + v44;
  if (IsAccessibilityCategory && v4)
  {
    v108.origin.x = x;
    v108.origin.y = y;
    v108.size.width = v95;
    v108.size.height = rect;
    Height = CGRectGetHeight(v108);
  }
  v101 = v48[1];
  v103 = v48[2];
  recta = *v48;
  v97 = v48[3];
  v109.origin.y = -(v32 - (Height + -32.0) * 0.5);
  v89 = Height;
  v50 = Height - v44;
  v109.origin.x = 0.0;
  v94 = v109.origin.y;
  v109.size.width = 32.0;
  v109.size.height = 32.0;
  v96 = CGRectGetMaxX(v109) + 8.0;
  if (v50 <= v43)
    v51 = v45;
  else
    v51 = v45 + (v50 - v43) * 0.5;
  objc_msgSend(v11, "font");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "ascender");
  v54 = v51 + v28 - v53;

  v87 = v54;
  if (v14)
  {
    objc_msgSend(v11, "font");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "ascender");
    v57 = v35 + v33 + v56;
    objc_msgSend(v12, "font");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "ascender");
    v60 = v54 + v57 - v59;

    v88 = v60;
    if (!v15)
    {
      v70 = v96;
      v66 = v97;
      v61 = v13;
      v75 = v90;
      v67 = v99;
      v69 = v101;
      v64 = v103;
      v74 = recta;
      goto LABEL_46;
    }
    v61 = v13;
    objc_msgSend(v13, "size");
    objc_msgSend(v12, "font");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "_scaledValueForValue:", 1.0);
    PXSizeScale();
    v64 = v63;
    v66 = v65;

    v110.origin.x = v96;
    v110.origin.y = v60;
    v67 = v99;
    v110.size.width = v98;
    v110.size.height = v99;
    MaxX = CGRectGetMaxX(v110);
    v111.origin.x = v96;
    v111.origin.y = v60;
    v111.size.width = v98;
    v111.size.height = v99;
    v69 = CGRectGetMinY(v111) + (v99 - v66) * 0.5;
    v70 = v96;
  }
  else
  {
    if (!v15)
    {
      v64 = v103;
      v74 = recta;
      v70 = recta;
      v69 = v101;
      v88 = v101;
      v98 = v103;
      v66 = v97;
      v67 = v97;
      v61 = v13;
      goto LABEL_45;
    }
    v61 = v13;
    objc_msgSend(v13, "size");
    objc_msgSend(v11, "font");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "_scaledValueForValue:", 1.0);
    PXSizeScale();
    v64 = v72;
    v66 = v73;

    v112.origin.x = v96;
    v112.origin.y = v54;
    v112.size.width = v92;
    v112.size.height = v93;
    MaxX = CGRectGetMaxX(v112);
    v113.origin.x = v96;
    v113.origin.y = v54;
    v113.size.width = v92;
    v113.size.height = v93;
    v67 = v97;
    v88 = v101;
    v69 = CGRectGetMinY(v113) + (v93 - v66) * 0.5;
    v98 = v103;
    v70 = recta;
  }
  v74 = MaxX + 4.0;
LABEL_45:
  v75 = v90;
LABEL_46:
  if (v4)
  {
    v91 = v70;
    rectb = v74;
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXSharedAlbumHeaderView semanticContentAttribute](self, "semanticContentAttribute")) == 1)
    {
      -[PXSharedAlbumHeaderView bounds](self, "bounds", 0.0);
      CGRectGetMaxX(v114);
      v115.origin.x = 0.0;
      v115.origin.y = v94;
      v115.size.width = 32.0;
      v115.size.height = 32.0;
      CGRectGetWidth(v115);
      v116.origin.x = 0.0;
      v116.origin.y = v94;
      v116.size.width = 32.0;
      v116.size.height = 32.0;
      CGRectGetMinX(v116);
      v117.origin.x = v96;
      v117.origin.y = v87;
      v117.size.width = v92;
      v117.size.height = v93;
      CGRectGetWidth(v117);
      v118.origin.x = v96;
      v118.origin.y = v87;
      v118.size.width = v92;
      v118.size.height = v93;
      CGRectGetMinX(v118);
      v119.origin.x = v91;
      v119.origin.y = v88;
      v119.size.width = v98;
      v119.size.height = v67;
      CGRectGetWidth(v119);
      v120.origin.x = v91;
      v120.origin.y = v88;
      v120.size.width = v98;
      v120.size.height = v67;
      CGRectGetMinX(v120);
      v121.origin.x = rectb;
      v121.origin.y = v69;
      v121.size.width = v64;
      v121.size.height = v66;
      CGRectGetWidth(v121);
      v122.origin.x = rectb;
      v122.origin.y = v69;
      v122.size.width = v64;
      v122.size.height = v66;
      CGRectGetMinX(v122);
    }
    PXRectRoundToPixel();
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v83 = v82;
    -[PXSharedAlbumHeaderView headerImageView](self, "headerImageView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setFrame:", v77, v79, v81, v83);

    PXRectRoundToPixel();
    objc_msgSend(v11, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v12, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v75, "setFrame:");
  }

  v85 = v95;
  v86 = v89;
  result.height = v86;
  result.width = v85;
  return result;
}

- (BOOL)useInPopover
{
  return self->_useInPopover;
}

- (unint64_t)textColorStyle
{
  return self->_textColorStyle;
}

- (unint64_t)tappableArea
{
  return self->_tappableArea;
}

- (void)setTappableArea:(unint64_t)a3
{
  self->_tappableArea = a3;
}

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (PXFeedSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (unint64_t)headerImageTag
{
  return self->_headerImageTag;
}

- (void)setHeaderImageTag:(unint64_t)a3
{
  self->_headerImageTag = a3;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isObservingLastExitedForYou
{
  return self->_isObservingLastExitedForYou;
}

- (void)setIsObservingLastExitedForYou:(BOOL)a3
{
  self->_isObservingLastExitedForYou = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

void __41__PXSharedAlbumHeaderView__updateAvatar___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handleHeaderImage:imageTag:", v7, *(_QWORD *)(a1 + 40));

  }
  else if (v9)
  {
    PLPhotoSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "ERROR: Failed to retreive avatar image: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

+ (void)preloadResources
{
  if (preloadResources_onceToken_294698 != -1)
    dispatch_once(&preloadResources_onceToken_294698, &__block_literal_global_294699);
}

void __43__PXSharedAlbumHeaderView_preloadResources__block_invoke()
{
  id v0;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleTaskWithQoS:block:", 0, &__block_literal_global_128_294701);
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_130_294702);
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_132_294703);
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_133_294704);

}

uint64_t __43__PXSharedAlbumHeaderView_preloadResources__block_invoke_5()
{
  return +[PXActivitySpec headerDynamicBottomSubtitleToBottomDistance](PXActivitySpec, "headerDynamicBottomSubtitleToBottomDistance");
}

uint64_t __43__PXSharedAlbumHeaderView_preloadResources__block_invoke_4()
{
  return +[PXActivitySpec headerDynamicBottomTitleToBottomSubtitleDistance](PXActivitySpec, "headerDynamicBottomTitleToBottomSubtitleDistance");
}

uint64_t __43__PXSharedAlbumHeaderView_preloadResources__block_invoke_3()
{
  return +[PXActivitySpec headerDynamicTopToBottomTitleDistance](PXActivitySpec, "headerDynamicTopToBottomTitleDistance");
}

void __43__PXSharedAlbumHeaderView_preloadResources__block_invoke_2()
{
  objc_msgSend(MEMORY[0x1E0D719E0], "sharingUsername");

}

@end
