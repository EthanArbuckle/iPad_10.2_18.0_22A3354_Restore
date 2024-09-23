@implementation ICNoteBrowseGalleryFolderCollectionViewCell

- (void)awakeFromNib
{
  void *v3;
  unsigned int v4;
  UIFontTextStyle v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  UIFontTextStyle v10;
  unsigned int v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICNoteBrowseGalleryFolderCollectionViewCell;
  -[ICNoteBrowseGalleryFolderCollectionViewCell awakeFromNib](&v19, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell smartFolderBadgeView](self, "smartFolderBadgeView"));
  objc_msgSend(v3, "setSystemImageName:", CFSTR("gearshape.fill"));

  v4 = -[ICNoteBrowseGalleryFolderCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth");
  v5 = UIFontTextStyleBody;
  if (v4)
    v5 = UIFontTextStyleSubheadline;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:symbolicTraits:](UIFont, "ic_preferredFontForStyle:symbolicTraits:", v6, 0x8000));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_fontWithSingleLineA"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setFont:", v8);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v10 = UIFontTextStyleFootnote;
  }
  else
  {
    v11 = -[ICNoteBrowseGalleryFolderCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth");
    v10 = UIFontTextStyleCaption1;
    if (!v11)
      v10 = UIFontTextStyleSubheadline;
  }
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:symbolicTraits:](UIFont, "ic_preferredFontForStyle:symbolicTraits:", v12, 0x8000));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_fontWithSingleLineA"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v15, "setFont:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  -[ICNoteBrowseGalleryFolderCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v16);

  v17 = 8.0;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    if (-[ICNoteBrowseGalleryFolderCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth"))
      v17 = 10.0;
    else
      v17 = 12.0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell thumbnailTitleSpaceConstraint](self, "thumbnailTitleSpaceConstraint"));
  objc_msgSend(v18, "setConstant:", v17);

}

- (void)updateFromConfiguration
{
  -[ICNoteBrowseGalleryFolderCollectionViewCell updateTextAndStatus](self, "updateTextAndStatus");
  -[ICNoteBrowseGalleryFolderCollectionViewCell updateThumbnail](self, "updateThumbnail");
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
  -[ICNoteBrowseGalleryFolderCollectionViewCell updateUI](self, "updateUI");
}

- (UIView)contextMenuInteractionPreview
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell thumbnailView](self, "thumbnailView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contextMenuInteractionPreview"));

  return (UIView *)v3;
}

- (void)updateTextAndStatus
{
  void *v3;
  void *v4;
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
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%lu Notes"), &stru_1005704B8, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleNotes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, objc_msgSend(v9, "count")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  LODWORD(v10) = objc_msgSend(v12, "isSharedRootObject");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  v14 = v13;
  if ((_DWORD)v10)
  {
    objc_msgSend(v13, "setHidden:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serverShareCheckingParent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
    objc_msgSend(v16, "setShare:", v15);

  }
  else
  {
    objc_msgSend(v13, "setHidden:", 1);
  }

  v19 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v17 = objc_msgSend(v19, "isSmartFolder") ^ 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell smartFolderBadgeView](self, "smartFolderBadgeView"));
  objc_msgSend(v18, "setHidden:", v17);

}

- (void)updateThumbnail
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v3, "setFolder:", v4);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  v6 = objc_msgSend(v5, "isEqual:", self);

  if (v6)
    -[ICNoteBrowseGalleryFolderCollectionViewCell updateFocusEffect](self, "updateFocusEffect");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v4 = objc_msgSend(v3, "isSharedViaICloud");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
    v7 = CFSTR("Shared Folder");
  else
    v7 = CFSTR("Folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1005704B8, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell summaryLabel](self, "summaryLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  v12 = __ICAccessibilityStringForVariables(1, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICNoteBrowseGalleryFolderCollectionViewCell;
  v3 = -[ICNoteBrowseGalleryFolderCollectionViewCell accessibilityValue](&v14, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
  v6 = objc_msgSend(v5, "isSharedViaICloud");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell cloudSharingParticipantNames](self, "cloudSharingParticipantNames"));
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Folder participants: %@"), &stru_1005704B8, 0));

      v11 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8));
      v4 = (void *)v11;
    }
    v12 = v4;

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)accessibilityCustomActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "customAccessibilityActionsForObjectID:galleryView:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell folder](self, "folder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customAccessibilityActionsForObjectID:galleryView:", v7, 1));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)updateUI
{
  -[ICNoteBrowseGalleryFolderCollectionViewCell updateTextAndStatus](self, "updateTextAndStatus");
  -[ICNoteBrowseGalleryFolderCollectionViewCell updateThumbnail](self, "updateThumbnail");
}

- (void)updateFocusEffect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v14, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseGalleryFolderCollectionViewCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v11, "cornerRadius");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", kCACornerCurveContinuous, v4, v6, v8, v10, v12));
  -[ICNoteBrowseGalleryFolderCollectionViewCell setFocusEffect:](self, "setFocusEffect:", v13);

}

- (ICFolder)folder
{
  return self->_folder;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  return (ICAccessibilityCustomActionsDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityCustomActionsDelegate, a3);
}

- (ICNoteResultsImageBadgeView)smartFolderBadgeView
{
  return (ICNoteResultsImageBadgeView *)objc_loadWeakRetained((id *)&self->_smartFolderBadgeView);
}

- (void)setSmartFolderBadgeView:(id)a3
{
  objc_storeWeak((id *)&self->_smartFolderBadgeView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)summaryLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_summaryLabel);
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeWeak((id *)&self->_summaryLabel, a3);
}

- (ICNoteBrowseFolderThumbnailView)thumbnailView
{
  return (ICNoteBrowseFolderThumbnailView *)objc_loadWeakRetained((id *)&self->_thumbnailView);
}

- (void)setThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailView, a3);
}

- (NSLayoutConstraint)thumbnailTitleSpaceConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_thumbnailTitleSpaceConstraint);
}

- (void)setThumbnailTitleSpaceConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailTitleSpaceConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailTitleSpaceConstraint);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_summaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_smartFolderBadgeView);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
  objc_storeStrong((id *)&self->_folder, 0);
}

@end
