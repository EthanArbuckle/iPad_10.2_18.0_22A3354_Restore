@implementation ICFolderOutlineCollectionViewCell

- (ICFolderOutlineCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICFolderOutlineCollectionViewCell *v3;
  ICFolderOutlineCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICFolderOutlineCollectionViewCell;
  v3 = -[ICFolderOutlineCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showsNoteCount = 1;
    v3->_allowsExpandCollapse = 1;
    -[ICFolderOutlineCollectionViewCell setAutomaticallyUpdatesContentConfiguration:](v3, "setAutomaticallyUpdatesContentConfiguration:", 0);
  }
  return v4;
}

- (void)updateNoteCount
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "updateCountsQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011550;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)setNoteContainer:(id)a3
{
  NoteCollectionObject *noteCollection;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_noteContainer, a3);
  if (v7)
  {
    noteCollection = self->_noteCollection;
    self->_noteCollection = 0;

    virtualSmartFolder = self->_virtualSmartFolder;
    self->_virtualSmartFolder = 0;

  }
  -[ICFolderOutlineCollectionViewCell ic_annotateWithNoteContainer:](self, "ic_annotateWithNoteContainer:", v7);
  -[ICFolderOutlineCollectionViewCell updateTextAndStatus](self, "updateTextAndStatus");
  -[ICFolderOutlineCollectionViewCell updateSubfolderCount](self, "updateSubfolderCount");
  -[ICFolderOutlineCollectionViewCell updateNoteCount](self, "updateNoteCount");

}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isReordering") & 1) == 0)
  {
    -[ICFolderOutlineCollectionViewCell updateAccessoriesUsingState:](self, "updateAccessoriesUsingState:", v4);
    -[ICFolderOutlineCollectionViewCell updateSubfolderCount](self, "updateSubfolderCount");
  }
  -[ICFolderOutlineCollectionViewCell updateContentConfigurationUsingState:](self, "updateContentConfigurationUsingState:", v4);
  -[ICFolderOutlineCollectionViewCell updateBackgroundConfigurationUsingState:](self, "updateBackgroundConfigurationUsingState:", v4);

}

- (void)updateSubfolderCount
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = objc_msgSend((id)objc_opt_class(self, a2), "updateCountsQueue");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013934;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async(v4, block);

}

+ (OS_dispatch_queue)updateCountsQueue
{
  if (qword_1005DDE28 != -1)
    dispatch_once(&qword_1005DDE28, &stru_100552DA8);
  return (OS_dispatch_queue *)(id)qword_1005DDE30;
}

- (void)updateBackgroundConfigurationUsingState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[ICFolderOutlineCollectionViewCell hasGroupInset](self, "hasGroupInset"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration _listInsetGroupedCellConfiguration](UIBackgroundConfiguration, "_listInsetGroupedCellConfiguration"));
  }
  else if (-[ICFolderOutlineCollectionViewCell shouldUseAccompaniedSidebarCellConfiguration](self, "shouldUseAccompaniedSidebarCellConfiguration"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration](UIBackgroundConfiguration, "listAccompaniedSidebarCellConfiguration"));
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration"));
  }
  v5 = (void *)v4;
  if (-[ICFolderOutlineCollectionViewCell isRecentlyCreated](self, "isRecentlyCreated")
    && (objc_msgSend(v9, "isSelected") & 1) == 0)
  {
    objc_msgSend(v9, "setSwiped:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listSidebarCellConfiguration](UIBackgroundConfiguration, "listSidebarCellConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedConfigurationForState:", v9));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
    objc_msgSend(v5, "setBackgroundColor:", v8);

  }
  else
  {
    v6 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v9));
  }

  -[ICFolderOutlineCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v5);
}

- (BOOL)isRecentlyCreated
{
  return self->_recentlyCreated;
}

+ (NSManagedObjectContext)modernWorkerContext
{
  if (qword_1005DDE38 != -1)
    dispatch_once(&qword_1005DDE38, &stru_100552DC8);
  return (NSManagedObjectContext *)(id)qword_1005DDE40;
}

- (void)setSubfoldersCount:(id)a3
{
  objc_storeStrong((id *)&self->_subfoldersCount, a3);
}

- (void)updateContentConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v59 = a3;
  if (-[ICFolderOutlineCollectionViewCell hasGroupInset](self, "hasGroupInset"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextProperties"));
    objc_msgSend(v6, "setColor:", v5);

  }
  else
  {
    if (-[ICFolderOutlineCollectionViewCell shouldUseAccompaniedSidebarCellConfiguration](self, "shouldUseAccompaniedSidebarCellConfiguration"))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration accompaniedSidebarSubtitleCellConfiguration](UIListContentConfiguration, "accompaniedSidebarSubtitleCellConfiguration"));
    }
    else
    {
      v7 = objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration sidebarSubtitleCellConfiguration](UIListContentConfiguration, "sidebarSubtitleCellConfiguration"));
    }
    v4 = (void *)v7;
  }
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision")
    && objc_msgSend(v59, "cellDropState") == (id)2)
  {
    objc_msgSend(v59, "setCellDropState:", 1);
  }
  if (-[ICFolderOutlineCollectionViewCell forceDisabledAppearance](self, "forceDisabledAppearance")
    || objc_msgSend(v59, "isEditing")
    && !-[ICFolderOutlineCollectionViewCell allowsEditing](self, "allowsEditing")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer")),
        v9 = objc_msgSend(v8, "isUnsupported"),
        v8,
        v9))
  {
    objc_msgSend(v59, "setDisabled:", 1);
    v10 = -[ICFolderOutlineCollectionViewCell accessibilityTraits](self, "accessibilityTraits");
    -[ICFolderOutlineCollectionViewCell setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitNotEnabled | v10);
  }
  objc_msgSend(v4, "setTextToSecondaryTextHorizontalPadding:", 0.0);
  v11 = ICAccessibilityAccessibilityLargerTextSizesEnabled(objc_msgSend(v4, "setTextToSecondaryTextVerticalPadding:", 0.0)) ^ 1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleForTableViewCell"));
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCollection](self, "noteCollection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "titleForTableViewCell"));
    v18 = v17;
    if (v17)
    {
      v15 = v17;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));

    }
  }

  objc_msgSend(v4, "setText:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleBody));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
  objc_msgSend(v21, "setFont:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
  objc_msgSend(v22, "setNumberOfLines:", v11);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  LODWORD(v21) = objc_msgSend(v23, "isSharedRootObject");

  if ((_DWORD)v21)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "shareDescription"));

  }
  else
  {
    v25 = 0;
  }
  v26 = -[ICFolderOutlineCollectionViewCell showsNoteCount](self, "showsNoteCount");
  if (!(_DWORD)v26 || (v26 = ICAccessibilityAccessibilityLargerTextSizesEnabled(v26), !(_DWORD)v26))
  {
LABEL_28:
    if (!v25)
      goto LABEL_30;
    goto LABEL_29;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCount](self, "noteCount"));
  v28 = v27;
  if (v25)
  {
    v29 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v25, "stringByAppendingFormat:", CFSTR("\n%@"), v27));

    v25 = (__CFString *)v29;
    goto LABEL_28;
  }
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringValue"));
  v47 = (void *)v46;
  v48 = CFSTR(" ");
  if (v46)
    v48 = (__CFString *)v46;
  v25 = v48;

LABEL_29:
  objc_msgSend(v4, "setSecondaryText:", v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleCaption1));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextProperties"));
  objc_msgSend(v31, "setFont:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextProperties"));
  objc_msgSend(v32, "setNumberOfLines:", v11);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryTextProperties"));
  objc_msgSend(v33, "setAdjustsFontSizeToFitWidth:", 0);

LABEL_30:
  if ((ICAccessibilityAccessibilityLargerTextSizesEnabled(v26) & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "systemImageName"));
    v37 = v35;
    if (v35)
    {
      v38 = v35;
    }
    else
    {
      v39 = objc_opt_class(ICFolder, v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
      v41 = ICDynamicCast(v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "systemImageName"));
      v44 = v43;
      if (v43)
        v45 = v43;
      else
        v45 = (id)objc_claimAutoreleasedReturnValue(+[ICFolder defaultSystemImageName](ICFolder, "defaultSystemImageName"));
      v38 = v45;

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", v38));
    objc_msgSend(v4, "setImage:", v49);

  }
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell traitCollection](self, "traitCollection"));
    v51 = objc_msgSend(v50, "userInterfaceLevel");

    if (v51 == (id)1)
    {
      if (objc_msgSend(v59, "isDisabled"))
        v52 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      else
        v52 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v53 = (void *)v52;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textProperties"));
      objc_msgSend(v54, "setColor:", v53);

      if (objc_msgSend(v59, "isDisabled"))
        v55 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      else
        v55 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v56 = (void *)v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageProperties"));
      objc_msgSend(v57, "setTintColor:", v56);

    }
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedConfigurationForState:", v59));
  -[ICFolderOutlineCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v58);

}

- (void)updateAccessoriesUsingState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  unsigned __int8 v9;
  int v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  UIView *v19;
  uint64_t v20;
  objc_class *v21;
  UICellAccessoryPosition v22;
  void *v23;
  id v24;
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
  id v35;
  void *v36;
  id v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[ICFolderOutlineCollectionViewCell showsCheckmark](self, "showsCheckmark"))
  {
    v6 = objc_alloc_init((Class)UICellAccessoryCheckmark);
    objc_msgSend(v6, "setDisplayedState:", 2);
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = -[ICFolderOutlineCollectionViewCell showsNoteCount](self, "showsNoteCount");
  if (!v7
    || (ICAccessibilityAccessibilityLargerTextSizesEnabled(v7) & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer")),
        v9 = objc_msgSend(v8, "isUnsupported"),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCount](self, "noteCount"));
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCount](self, "noteCount"));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("%@"), v47));

    }
    else
    {
      v48 = &stru_1005704B8;
    }

    v49 = objc_msgSend(objc_alloc((Class)UICellAccessoryLabel), "initWithText:", v48);
    objc_msgSend(v49, "setDisplayedState:", 2);
    objc_msgSend(v5, "addObject:", v49);

    v10 = 1;
  }
  if (-[ICFolderOutlineCollectionViewCell allowsExpandCollapse](self, "allowsExpandCollapse"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell subfoldersCount](self, "subfoldersCount"));
    if (objc_msgSend(v11, "unsignedIntValue"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
      v13 = objc_msgSend(v12, "isUnsupported");

      if ((v13 & 1) == 0)
      {
        v14 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
        objc_msgSend(v14, "setStyle:", 2);
        v15 = v14;
LABEL_15:
        objc_msgSend(v15, "setDisplayedState:", 2);
LABEL_19:
        objc_msgSend(v5, "addObject:", v14);

        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  if (-[ICFolderOutlineCollectionViewCell hasDisclosureIndicator](self, "hasDisclosureIndicator"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    v17 = objc_msgSend(v16, "isUnsupported");

    if ((v17 & 1) != 0)
      goto LABEL_20;
    v15 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    v14 = v15;
    goto LABEL_15;
  }
  if (v10 && -[ICFolderOutlineCollectionViewCell shouldIndentNoteCount](self, "shouldIndentNoteCount"))
  {
    v18 = objc_alloc((Class)UICellAccessoryCustomView);
    v19 = objc_opt_new(UIView);
    v14 = objc_msgSend(v18, "initWithCustomView:placement:", v19, 1);

    objc_msgSend(v14, "setDisplayedState:", 2);
    v21 = (objc_class *)objc_opt_class(UICellAccessoryLabel, v20);
    v22 = UICellAccessoryPositionAfterAccessoryOfClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v14, "setPosition:", v23);

    objc_msgSend(v14, "setReservedLayoutWidth:", UICellAccessoryStandardDimensionDisclosure);
    goto LABEL_19;
  }
LABEL_20:
  v24 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  if ((objc_msgSend(v24, "isUnsupported") & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell unsupportedFolderInfoButtonTapHandler](self, "unsupportedFolderInfoButtonTapHandler"));

    if (!v25)
      goto LABEL_26;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell unsupportedFolderButton](self, "unsupportedFolderButton"));

    if (!v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v28));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("info.circle"), v29));
      objc_msgSend(v27, "setImage:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Unsupported Folder Info"), &stru_1005704B8, 0));
      objc_msgSend(v27, "setAccessibilityLabel:", v32);

      objc_initWeak(&location, self);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100096384;
      v57[3] = &unk_1005518A8;
      objc_copyWeak(&v58, &location);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v57));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v27, v33));
      -[ICFolderOutlineCollectionViewCell setUnsupportedFolderButton:](self, "setUnsupportedFolderButton:", v34);

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);

    }
    v35 = objc_alloc((Class)UICellAccessoryCustomView);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell unsupportedFolderButton](self, "unsupportedFolderButton"));
    v24 = objc_msgSend(v35, "initWithCustomView:placement:", v36, 1);

    objc_msgSend(v24, "setDisplayedState:", 2);
    objc_msgSend(v5, "addObject:", v24);
  }

LABEL_26:
  if (-[ICFolderOutlineCollectionViewCell allowsReordering](self, "allowsReordering"))
  {
    v37 = objc_alloc_init((Class)UICellAccessoryReorder);
    objc_msgSend(v37, "setDisplayedState:", 1);
    objc_msgSend(v5, "addObject:", v37);

  }
  if (-[ICFolderOutlineCollectionViewCell allowsEditing](self, "allowsEditing"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    if ((objc_msgSend(v38, "isUnsupported") & 1) != 0)
    {
LABEL_39:

      goto LABEL_40;
    }
    v39 = -[ICFolderOutlineCollectionViewCell isEditing](self, "isEditing");

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredFontForBodyTextWithMaximumContentSizeCategory:](UIFont, "ic_preferredFontForBodyTextWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v40));

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v38));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));

      if (v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "configuration"));

        objc_msgSend(v44, "setImage:", v41);
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));
        objc_msgSend(v45, "setConfiguration:", v44);
      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
        objc_msgSend(v44, "setImage:", v41);
        objc_msgSend(v44, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Folder Actions"), &stru_1005704B8, 0));
        objc_msgSend(v44, "setAccessibilityLabel:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v44, 0));
        -[ICFolderOutlineCollectionViewCell setActionButton:](self, "setActionButton:", v52);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));
        objc_msgSend(v45, "setShowsMenuAsPrimaryAction:", 1);
      }

      -[ICFolderOutlineCollectionViewCell updateActionMenu](self, "updateActionMenu");
      v53 = objc_alloc((Class)UICellAccessoryCustomView);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));
      v55 = objc_msgSend(v53, "initWithCustomView:placement:", v54, 1);

      objc_msgSend(v55, "setDisplayedState:", 1);
      objc_msgSend(v5, "addObject:", v55);

      goto LABEL_39;
    }
  }
LABEL_40:
  v56 = objc_msgSend(v5, "copy");
  -[ICFolderOutlineCollectionViewCell setAccessories:](self, "setAccessories:", v56);

}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (NSNumber)noteCount
{
  return self->_noteCount;
}

- (BOOL)showsNoteCount
{
  return self->_showsNoteCount;
}

- (NSNumber)subfoldersCount
{
  return self->_subfoldersCount;
}

- (BOOL)showsCheckmark
{
  return self->_showsCheckmark;
}

- (BOOL)hasDisclosureIndicator
{
  return self->_hasDisclosureIndicator;
}

- (BOOL)allowsReordering
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v3 = objc_opt_class(ICFolder, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6 && -[ICFolderOutlineCollectionViewCell allowsEditing](self, "allowsEditing"))
    v7 = objc_msgSend(v6, "isMovable");
  else
    v7 = 0;

  return v7;
}

- (BOOL)allowsEditing
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(ICFolder, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    self = 0;
    switch(objc_msgSend(v6, "folderType"))
    {
      case 0u:
        LODWORD(self) = objc_msgSend(v6, "isDefaultFolderForAccount") ^ 1;
        break;
      case 1u:
      case 3u:
        break;
      case 2u:
        LOBYTE(self) = 1;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    self = (ICFolderOutlineCollectionViewCell *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));

    LOBYTE(self) = self != 0;
  }

  return (char)self;
}

- (BOOL)allowsExpandCollapse
{
  return self->_allowsExpandCollapse;
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (BOOL)forceDisabledAppearance
{
  return self->_forceDisabledAppearance;
}

- (void)setUnsupportedFolderInfoButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setShouldIndentNoteCount:(BOOL)a3
{
  self->_shouldIndentNoteCount = a3;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void)setNoteCount:(id)a3
{
  objc_storeStrong((id *)&self->_noteCount, a3);
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
}

- (void)setHasDisclosureIndicator:(BOOL)a3
{
  self->_hasDisclosureIndicator = a3;
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityCustomActionsDelegate, a3);
}

- (NoteCollectionObject)noteCollection
{
  return self->_noteCollection;
}

- (void)setRecentlyCreated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  self->_recentlyCreated = a3;
  -[ICFolderOutlineCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100095970;
    v5[3] = &unk_100550110;
    v5[4] = self;
    dispatchMainAfterDelay(v5, 1.0);
  }
}

- (void)setNoteCollection:(id)a3
{
  ICNoteContainer *noteContainer;
  ICVirtualSmartFolderItemIdentifier *virtualSmartFolder;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_noteCollection, a3);
  if (v7)
  {
    noteContainer = self->_noteContainer;
    self->_noteContainer = 0;

    virtualSmartFolder = self->_virtualSmartFolder;
    self->_virtualSmartFolder = 0;

  }
  -[ICFolderOutlineCollectionViewCell ic_annotateWithNoteCollection:](self, "ic_annotateWithNoteCollection:", v7);
  -[ICFolderOutlineCollectionViewCell updateTextAndStatus](self, "updateTextAndStatus");
  -[ICFolderOutlineCollectionViewCell updateSubfolderCount](self, "updateSubfolderCount");
  -[ICFolderOutlineCollectionViewCell updateNoteCount](self, "updateNoteCount");

}

- (void)setVirtualSmartFolder:(id)a3
{
  NoteCollectionObject *noteCollection;
  ICNoteContainer *noteContainer;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_virtualSmartFolder, a3);
  if (v7)
  {
    noteCollection = self->_noteCollection;
    self->_noteCollection = 0;

    noteContainer = self->_noteContainer;
    self->_noteContainer = 0;

  }
  -[ICFolderOutlineCollectionViewCell updateTextAndStatus](self, "updateTextAndStatus");
  -[ICFolderOutlineCollectionViewCell updateSubfolderCount](self, "updateSubfolderCount");
  -[ICFolderOutlineCollectionViewCell updateNoteCount](self, "updateNoteCount");

}

- (void)setShowsCheckmark:(BOOL)a3
{
  self->_showsCheckmark = a3;
  -[ICFolderOutlineCollectionViewCell updateAccessories](self, "updateAccessories");
}

- (void)updateAccessories
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell configurationState](self, "configurationState"));
  -[ICFolderOutlineCollectionViewCell updateAccessoriesUsingState:](self, "updateAccessoriesUsingState:", v3);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCollection](self, "noteCollection"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCollection](self, "noteCollection"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleForTableViewCell"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));

  v9 = -[ICFolderOutlineCollectionViewCell isSmartFolder](self, "isSmartFolder");
  v10 = CFSTR("Smart Folder");
  if (!v9)
    v10 = 0;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v13 = 0;
  if (objc_msgSend(v12, "isSharedViaICloud"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "shareDescription"));

  }
  v15 = __ICAccessibilityStringForVariables(1, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Subfolder of %@"), &stru_1005704B8, 0));

  v5 = objc_opt_class(ICFolder);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));

  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v10));
  else
    v11 = 0;
  if (-[ICFolderOutlineCollectionViewCell showsNoteCount](self, "showsNoteCount"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ICAX_NUM_NOTES_%lu"), &stru_1005704B8, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCount](self, "noteCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, objc_msgSend(v14, "unsignedIntValue")));

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell subfoldersCount](self, "subfoldersCount"));
  v17 = objc_msgSend(v16, "unsignedIntValue");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NUM_SUBFOLDERS_%lu"), &stru_1005704B8, 0));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell subfoldersCount](self, "subfoldersCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, objc_msgSend(v20, "unsignedIntValue")));

  }
  else
  {
    v21 = 0;
  }
  v22 = __ICAccessibilityStringForVariables(1, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  return v23;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICFolderOutlineCollectionViewCell;
  v3 = -[ICFolderOutlineCollectionViewCell accessibilityTraits](&v8, "accessibilityTraits");
  v4 = -[ICFolderOutlineCollectionViewCell isSelected](self, "isSelected");
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (!-[ICFolderOutlineCollectionViewCell allowsEditing](self, "allowsEditing")
    && -[ICFolderOutlineCollectionViewCell isEditing](self, "isEditing"))
  {
    v6 |= UIAccessibilityTraitNotEnabled;
  }
  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3;
  void *v4;
  objc_super v6;

  if (-[ICFolderOutlineCollectionViewCell allowsEditing](self, "allowsEditing"))
  {
    v6.receiver = self;
    v6.super_class = (Class)ICFolderOutlineCollectionViewCell;
    v3 = -[ICFolderOutlineCollectionViewCell accessibilityDragSourceDescriptors](&v6, "accessibilityDragSourceDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
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
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "customAccessibilityActionsForObjectID:galleryView:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCollection](self, "noteCollection"));
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell accessibilityCustomActionsDelegate](self, "accessibilityCustomActionsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customAccessibilityActionsForObjectID:galleryView:", v9, 0));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

+ (NSManagedObjectContext)legacyWorkerContext
{
  if (qword_1005DDE48 != -1)
    dispatch_once(&qword_1005DDE48, &stru_100552DE8);
  return (NSManagedObjectContext *)(id)qword_1005DDE50;
}

- (id)createActionMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell ic_viewControllerManager](self, "ic_viewControllerManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell presentingViewController](self, "presentingViewController"));

  if (!v4)
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));

  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));

    if (v9)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell virtualSmartFolder](self, "virtualSmartFolder"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell presentingViewController](self, "presentingViewController"));
      v8 = objc_claimAutoreleasedReturnValue(+[ICNoteContainerActionMenu menuWithVirtualSmartFolder:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:](ICFolderListActionMenu, "menuWithVirtualSmartFolder:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:", v6, v7, 0, v3, 0));
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell presentingViewController](self, "presentingViewController"));
  v8 = objc_claimAutoreleasedReturnValue(+[ICNoteContainerActionMenu menuWithNoteContainer:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:](ICFolderListActionMenu, "menuWithNoteContainer:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:", v6, v7, 0, v3, 0));
LABEL_6:
  v10 = (void *)v8;

LABEL_8:
  return v10;
}

- (void)updateActionMenu
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell createActionMenu](self, "createActionMenu"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v3, "setMenu:", v4);

}

- (void)onUnsupportedFolderInfoPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteCollection](self, "noteCollection"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell unsupportedFolderInfoButtonTapHandler](self, "unsupportedFolderInfoButtonTapHandler"));
  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell unsupportedFolderInfoButtonTapHandler](self, "unsupportedFolderInfoButtonTapHandler"));
    ((void (**)(_QWORD, void *, id))v9)[2](v9, v7, v10);

  }
}

- (BOOL)isSmartFolder
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = objc_opt_class(ICFolder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell noteContainer](self, "noteContainer"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = objc_msgSend(v6, "folderType") == 2;
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldUseAccompaniedSidebarCellConfiguration
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderOutlineCollectionViewCell traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "_splitViewControllerContext") == (id)2;

  return v3;
}

- (void)setForceDisabledAppearance:(BOOL)a3
{
  self->_forceDisabledAppearance = a3;
}

- (void)setAllowsExpandCollapse:(BOOL)a3
{
  self->_allowsExpandCollapse = a3;
}

- (BOOL)shouldIndentNoteCount
{
  return self->_shouldIndentNoteCount;
}

- (void)setShowsNoteCount:(BOOL)a3
{
  self->_showsNoteCount = a3;
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  return (ICAccessibilityCustomActionsDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);
}

- (ICNAViewController)presentingViewController
{
  return (ICNAViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIButton)unsupportedFolderButton
{
  return self->_unsupportedFolderButton;
}

- (void)setUnsupportedFolderButton:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedFolderButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedFolderButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_noteCount, 0);
  objc_storeStrong((id *)&self->_subfoldersCount, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_noteCollection, 0);
}

@end
