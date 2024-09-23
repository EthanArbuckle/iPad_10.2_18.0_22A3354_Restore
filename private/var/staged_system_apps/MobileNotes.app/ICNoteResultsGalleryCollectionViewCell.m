@implementation ICNoteResultsGalleryCollectionViewCell

- (ICNoteResultsGalleryCollectionViewCell)initWithCoder:(id)a3
{
  ICNoteResultsGalleryCollectionViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithCoder:](&v6, "initWithCoder:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

- (void)awakeFromNib
{
  void *v3;
  double v4;
  void *v5;
  unsigned int v6;
  UIFontTextStyle v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  UIFontTextStyle v12;
  unsigned int v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  -[ICNoteResultsGalleryCollectionViewCell awakeFromNib](&v26, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
  -[ICNoteResultsGalleryCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v3);
  v4 = 8.0;
  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    if (-[ICNoteResultsGalleryCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth"))
      v4 = 10.0;
    else
      v4 = 12.0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailTitleSpacerHeightConstraint](self, "thumbnailTitleSpacerHeightConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  v6 = -[ICNoteResultsGalleryCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth");
  v7 = UIFontTextStyleBody;
  if (v6)
    v7 = UIFontTextStyleSubheadline;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:symbolicTraits:](UIFont, "ic_preferredFontForStyle:symbolicTraits:", v8, 0x8000));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_fontWithSingleLineA"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setFont:", v10);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v12 = UIFontTextStyleFootnote;
  }
  else
  {
    v13 = -[ICNoteResultsGalleryCollectionViewCell ic_hasCompactWidth](self, "ic_hasCompactWidth");
    v12 = UIFontTextStyleCaption1;
    if (!v13)
      v12 = UIFontTextStyleSubheadline;
  }
  v14 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForStyle:symbolicTraits:](UIFont, "ic_preferredFontForStyle:symbolicTraits:", v14, 0x8000));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ic_fontWithSingleLineA"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v17, "setFont:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v18, "setFont:", v16);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
  objc_msgSend(v19, "setFont:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell pinnedBadgeView](self, "pinnedBadgeView"));
  objc_msgSend(v20, "bringSubviewToFront:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell selectionIndicatorView](self, "selectionIndicatorView"));
  objc_msgSend(v22, "bringSubviewToFront:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  objc_msgSend(v24, "bringSubviewToFront:", v25);

  -[ICBaseNoteResultsCollectionViewCell updateViewStateProperties](self, "updateViewStateProperties");
}

- (void)layoutSubviews
{
  double Width;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  -[ICBaseNoteResultsCollectionViewCell layoutSubviews](&v5, "layoutSubviews");
  -[ICNoteResultsGalleryCollectionViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setPreferredMaxLayoutWidth:", Width);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  -[ICNoteResultsGalleryCollectionViewCell dealloc](&v4, "dealloc");
}

+ (double)heightForItemWidth:(double)a3 showsParticipantsInfo:(BOOL)a4 showsFolderAndOrAccountName:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteResultsCellConfiguration sizingConfigurationWithShowParticipantsInfo:showsFolderName:](ICNoteResultsCellConfiguration, "sizingConfigurationWithShowParticipantsInfo:showsFolderName:", a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sizingCell"));
  objc_msgSend(v8, "setConfiguration:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sizingCell"));
  objc_msgSend(v9, "updateFromConfiguration");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sizingCell"));
  LODWORD(v11) = 1148846080;
  LODWORD(v12) = 1112014848;
  objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, UILayoutFittingCompressedSize.height, v11, v12);
  v14 = v13;

  return v14;
}

- (void)updateFromConfiguration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
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
  void *v22;
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
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "showParticipantsInfo") ^ 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v5, "setHidden:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v7 = objc_msgSend(v6, "showFolderName");
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v8 = objc_msgSend(v5, "showAccountName") ^ 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell folderAndAccountLabelStackView](self, "folderAndAccountLabelStackView"));
  objc_msgSend(v9, "setHidden:", v8);

  if ((v7 & 1) == 0)
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v11 = objc_msgSend(v10, "isDataLoaded");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "note"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "title"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v36, "setText:", v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell summaryLabel](self, "summaryLabel"));
    objc_msgSend(v37, "setText:", CFSTR(" "));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    LODWORD(v34) = objc_msgSend(v38, "showParticipantsInfo");

    if ((_DWORD)v34)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell participantsLabel](self, "participantsLabel"));
      objc_msgSend(v39, "setText:", CFSTR(" "));

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v41 = objc_msgSend(v40, "showsNoteContainer");

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
      objc_msgSend(v42, "setText:", CFSTR(" "));

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v43, "setHidden:", 1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell pinnedBadgeView](self, "pinnedBadgeView"));
    objc_msgSend(v44, "setHidden:", 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
    v46 = v45;
    goto LABEL_19;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v18, "setText:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "participantsInfoString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell participantsLabel](self, "participantsLabel"));
  objc_msgSend(v21, "setText:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "folderAndAccountInfoString"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
  objc_msgSend(v24, "setText:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "folderImage"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell folderImageView](self, "folderImageView"));
  objc_msgSend(v27, "setImage:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  LODWORD(v26) = objc_msgSend(v28, "showUnreadIndicator");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
  v30 = v29;
  if ((_DWORD)v26)
  {
    objc_msgSend(v29, "setHidden:", 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "unreadIndicatorImage"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v33, "setImage:", v32);

  }
  else
  {
    objc_msgSend(v29, "setHidden:", 1);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "image"));

    if (!v48)
      goto LABEL_17;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell statusIndicatorImageView](self, "statusIndicatorImageView"));
    objc_msgSend(v31, "setImage:", 0);
  }

LABEL_17:
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v50 = objc_msgSend(v49, "showPinnedBadge") ^ 1;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell pinnedBadgeView](self, "pinnedBadgeView"));
  objc_msgSend(v51, "setHidden:", v50);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  LODWORD(v50) = objc_msgSend(v52, "showCollaboratorsBadge");

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  v46 = v45;
  if (!(_DWORD)v50)
  {
LABEL_19:
    objc_msgSend(v45, "setHidden:", 1);
    goto LABEL_20;
  }
  objc_msgSend(v45, "setHidden:", 0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "note"));

  v54 = objc_opt_class(ICNote);
  v55 = ICDynamicCast(v54, v46);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "serverShareCheckingParent"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  objc_msgSend(v58, "setShare:", v57);

LABEL_20:
  -[ICNoteResultsGalleryCollectionViewCell updateThumbnail](self, "updateThumbnail");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v3;

  v3 = (void *)qword_1005DDEB0;
  if (qword_1005DDEB0)
  {
    qword_1005DDEB0 = 0;

    qword_1005DDEB8 = 0;
  }
}

- (void)updateThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "note"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v5, "setNote:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "invitation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v7, "setInvitation:", v6);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[ICNoteResultsGalleryCollectionViewCell isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  -[ICNoteResultsGalleryCollectionViewCell setSelected:](&v6, "setSelected:", v3);
  if (v5 != v3)
    -[ICNoteResultsGalleryCollectionViewCell updateSelectionIndicator](self, "updateSelectionIndicator");
}

- (BOOL)canBeEdited
{
  return 1;
}

- (void)setEditing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  -[ICNoteResultsGalleryCollectionViewCell setEditing:](&v4, "setEditing:", a3);
  -[ICNoteResultsGalleryCollectionViewCell updateSelectionIndicator](self, "updateSelectionIndicator");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
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
  v14.super_class = (Class)ICNoteResultsGalleryCollectionViewCell;
  v3 = -[ICNoteResultsGalleryCollectionViewCell accessibilityValue](&v14, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "showCollaboratorsBadge");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell cloudSharingParticipantNames](self, "cloudSharingParticipantNames"));
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", ")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Note participants: %@"), &stru_1005704B8, 0));

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

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityCustomActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "customAccessibilityActionsForObjectID:galleryView:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customAccessibilityActionsForObjectID:galleryView:", v8, 1));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (ICNoteResultsGalleryCollectionViewCell)sizingCell
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEB40;
  block[3] = &unk_1005525E8;
  block[4] = a1;
  if (qword_1005DDEB8 != -1)
    dispatch_once(&qword_1005DDEB8, block);
  return (ICNoteResultsGalleryCollectionViewCell *)(id)qword_1005DDEB0;
}

- (void)updateSelectionIndicator
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v3 = -[ICNoteResultsGalleryCollectionViewCell isEditing](self, "isEditing") ^ 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell selectionIndicatorView](self, "selectionIndicatorView"));
  objc_msgSend(v4, "setHidden:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell selectionIndicatorView](self, "selectionIndicatorView"));
  LODWORD(v4) = objc_msgSend(v5, "isSelected");
  if ((_DWORD)v4 == -[ICNoteResultsGalleryCollectionViewCell isSelected](self, "isSelected"))
  {
    v6 = -[ICNoteResultsGalleryCollectionViewCell isEditing](self, "isEditing");

    if ((v6 & 1) == 0)
      goto LABEL_5;
  }
  else
  {

  }
  v7 = -[ICNoteResultsGalleryCollectionViewCell isSelected](self, "isSelected");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell selectionIndicatorView](self, "selectionIndicatorView"));
  objc_msgSend(v8, "setSelected:", v7);

LABEL_5:
  if (-[ICNoteResultsGalleryCollectionViewCell isEditing](self, "isEditing"))
  {
    v9 = 2.0;
    if ((-[ICNoteResultsGalleryCollectionViewCell isSelected](self, "isSelected") & 1) != 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (!-[ICNoteResultsGalleryCollectionViewCell isFocused](self, "isFocused")
    || (v9 = 2.0, -[ICNoteResultsGalleryCollectionViewCell isSelected](self, "isSelected")))
  {
LABEL_10:
    v9 = 0.0;
  }
LABEL_11:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v11, "setBorderWidth:", v9);

  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell tintColor](self, "tintColor")));
  v12 = objc_msgSend(v15, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsGalleryCollectionViewCell thumbnailView](self, "thumbnailView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  objc_msgSend(v14, "setBorderColor:", v12);

}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  return (ICAccessibilityCustomActionsDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityCustomActionsDelegate, a3);
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

- (UILabel)participantsLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_participantsLabel);
}

- (void)setParticipantsLabel:(id)a3
{
  objc_storeWeak((id *)&self->_participantsLabel, a3);
}

- (UILabel)folderAndAccountLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_folderAndAccountLabel);
}

- (void)setFolderAndAccountLabel:(id)a3
{
  objc_storeWeak((id *)&self->_folderAndAccountLabel, a3);
}

- (UIImageView)folderImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_folderImageView);
}

- (void)setFolderImageView:(id)a3
{
  objc_storeWeak((id *)&self->_folderImageView, a3);
}

- (UIStackView)folderAndAccountLabelStackView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_folderAndAccountLabelStackView);
}

- (void)setFolderAndAccountLabelStackView:(id)a3
{
  objc_storeWeak((id *)&self->_folderAndAccountLabelStackView, a3);
}

- (ICNoteResultsImageBadgeView)pinnedBadgeView
{
  return (ICNoteResultsImageBadgeView *)objc_loadWeakRetained((id *)&self->_pinnedBadgeView);
}

- (void)setPinnedBadgeView:(id)a3
{
  objc_storeWeak((id *)&self->_pinnedBadgeView, a3);
}

- (ICNoteResultsSelectionIndicatorView)selectionIndicatorView
{
  return (ICNoteResultsSelectionIndicatorView *)objc_loadWeakRetained((id *)&self->_selectionIndicatorView);
}

- (void)setSelectionIndicatorView:(id)a3
{
  objc_storeWeak((id *)&self->_selectionIndicatorView, a3);
}

- (UIImageView)statusIndicatorImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_statusIndicatorImageView);
}

- (void)setStatusIndicatorImageView:(id)a3
{
  objc_storeWeak((id *)&self->_statusIndicatorImageView, a3);
}

- (ICNoteResultsThumbnailView)thumbnailView
{
  return (ICNoteResultsThumbnailView *)objc_loadWeakRetained((id *)&self->_thumbnailView);
}

- (void)setThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailView, a3);
}

- (NSLayoutConstraint)thumbnailTitleSpacerHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_thumbnailTitleSpacerHeightConstraint);
}

- (void)setThumbnailTitleSpacerHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailTitleSpacerHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailTitleSpacerHeightConstraint);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_statusIndicatorImageView);
  objc_destroyWeak((id *)&self->_selectionIndicatorView);
  objc_destroyWeak((id *)&self->_pinnedBadgeView);
  objc_destroyWeak((id *)&self->_folderAndAccountLabelStackView);
  objc_destroyWeak((id *)&self->_folderImageView);
  objc_destroyWeak((id *)&self->_folderAndAccountLabel);
  objc_destroyWeak((id *)&self->_participantsLabel);
  objc_destroyWeak((id *)&self->_summaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
}

@end
