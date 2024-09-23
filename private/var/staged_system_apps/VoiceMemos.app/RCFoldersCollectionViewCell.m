@implementation RCFoldersCollectionViewCell

- (void)setEnabled:(BOOL)a3
{
  double v3;
  id v4;

  self->_enabled = a3;
  if (a3)
    v3 = 1.0;
  else
    v3 = 0.5;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    if (a3 == 2)
    {
      -[RCFoldersCollectionViewCell _showEditingMoreOptionsButton](self, "_showEditingMoreOptionsButton");
    }
    else if (a3 == 1)
    {
      -[RCFoldersCollectionViewCell _showRecordingsCountLabel](self, "_showRecordingsCountLabel");
    }
  }
}

- (void)setFolderName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  objc_msgSend(v5, "setText:", v4);

  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (NSString)folderName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setRecordingsCount:(int64_t)a3
{
  id v4;

  self->_recordingsCount = a3;
  if ((id)-[RCFoldersCollectionViewCell displayMode](self, "displayMode") != (id)2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell recordingsCountString](self, "recordingsCountString"));
    -[RCFoldersCollectionViewCell _setRecordingsCountText:](self, "_setRecordingsCountText:", v4);

  }
}

- (int64_t)recordingsCount
{
  return self->_recordingsCount;
}

- (id)recordingsCountString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_recordingsCount));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v2, 0));

  return v3;
}

- (void)setIconImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));

  objc_msgSend(v6, "setImage:", v5);
  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v6);

}

- (UIImage)iconImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (RCFoldersCollectionViewCell)initWithFrame:(CGRect)a3
{
  RCFoldersCollectionViewCell *v3;
  RCFoldersCollectionViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCFoldersCollectionViewCell;
  v3 = -[RCFoldersCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, "_boldTextStatusChanged", UIAccessibilityBoldTextStatusDidChangeNotification, 0);

  }
  return v4;
}

- (void)configureWithFolderName:(id)a3 recordingsCount:(int64_t)a4 iconImage:(id)a5 UUID:(id)a6 folderType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v15);
  -[RCFoldersCollectionViewCell setFolderName:](self, "setFolderName:", v14);

  -[RCFoldersCollectionViewCell setRecordingsCount:](self, "setRecordingsCount:", a4);
  -[RCFoldersCollectionViewCell setIconImage:](self, "setIconImage:", v13);

  -[RCFoldersCollectionViewCell setUUID:](self, "setUUID:", v12);
  -[RCFoldersCollectionViewCell setFolderType:](self, "setFolderType:", a7);
  -[RCFoldersCollectionViewCell updateAccessories](self, "updateAccessories");

}

- (void)updateAccessories
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell _defaultCellAccessories](self, "_defaultCellAccessories"));
  -[RCFoldersCollectionViewCell setAccessories:](self, "setAccessories:", v3);

}

- (id)_defaultCellAccessories
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)UICellAccessoryReorder);
  objc_msgSend(v4, "setDisplayedState:", 1);
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell _moreOptionsButtonAccessory](self, "_moreOptionsButtonAccessory"));
  objc_msgSend(v3, "addObject:", v5);
  v6 = objc_alloc_init((Class)UICellAccessoryDelete);
  objc_msgSend(v6, "setDisplayedState:", 1);
  objc_msgSend(v3, "addObject:", v6);
  if (!-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
  {
    v7 = objc_alloc((Class)UICellAccessoryLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell recordingsCountString](self, "recordingsCountString"));
    v9 = objc_msgSend(v7, "initWithText:", v8);

    objc_msgSend(v9, "setDisplayedState:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell _labelAccessoryTintColor](self, "_labelAccessoryTintColor"));
    -[RCFoldersCollectionViewCell setCurrentLabelAccessoryTintColor:](self, "setCurrentLabelAccessoryTintColor:", v10);
    objc_msgSend(v9, "setTintColor:", v10);
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[RCFoldersCollectionViewCell _needsDisclosureAccessory](self, "_needsDisclosureAccessory"))
  {
    v11 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    objc_msgSend(v11, "setDisplayedState:", 2);
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = objc_msgSend(v3, "copy");

  return v12;
}

- (id)_moreOptionsButtonAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle")));
  objc_msgSend(v3, "setImage:forState:", v4, 0);

  objc_msgSend(v3, "setShowsMenuAsPrimaryAction:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MORE_ACTIONS"), &stru_1001B2BC0, 0));
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v3, "setTintColor:", v7);

  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10002E0C8;
  v14 = &unk_1001AB9E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "_setMenuProvider:", &v11);
  v8 = objc_alloc((Class)UICellAccessoryCustomView);
  v9 = objc_msgSend(v8, "initWithCustomView:placement:", v3, 1, v11, v12, v13, v14);
  objc_msgSend(v9, "setDisplayedState:", 1);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

- (void)contentSizeChanged
{
  if ((id)-[RCFoldersCollectionViewCell displayMode](self, "displayMode") == (id)1)
  {
    -[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout");
    -[RCFoldersCollectionViewCell _switchToAccessibilityTextLayout:](self, "_switchToAccessibilityTextLayout:");
  }
  else if ((id)-[RCFoldersCollectionViewCell displayMode](self, "displayMode") == (id)2)
  {
    -[RCFoldersCollectionViewCell _showEditingMoreOptionsButton](self, "_showEditingMoreOptionsButton");
  }
}

- (void)_showRecordingsCountLabel
{
  id v3;

  if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell recordingsCountString](self, "recordingsCountString"));
    -[RCFoldersCollectionViewCell _setSecondaryAttributedTextWithRecordingsCount:](self, "_setSecondaryAttributedTextWithRecordingsCount:", v3);

  }
}

- (void)_showEditingMoreOptionsButton
{
  -[RCFoldersCollectionViewCell _transitionSpecialAccessoryToEditMode](self, "_transitionSpecialAccessoryToEditMode");
}

- (void)_transitionSpecialAccessoryToEditMode
{
  id v3;

  if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
    objc_msgSend(v3, "setSecondaryAttributedText:", 0);
    -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v3);

  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RCFoldersCollectionViewCell;
  v4 = a3;
  -[RCFoldersCollectionViewCell updateConfigurationUsingState:](&v20, "updateConfigurationUsingState:", v4);
  v5 = objc_msgSend(v4, "isEditing", v20.receiver, v20.super_class);

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  -[RCFoldersCollectionViewCell setDisplayMode:](self, "setDisplayMode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "secondaryTextProperties"));
  objc_msgSend(v9, "setFont:", v8);

  LODWORD(v9) = -[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
  v11 = v10;
  if ((_DWORD)v9)
  {
    objc_msgSend(v10, "setNumberOfLines:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    v13 = v12;
    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "setNumberOfLines:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    v13 = v12;
    v14 = 4;
  }
  objc_msgSend(v12, "setLineBreakMode:", v14);

  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v7);
  v15 = objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell _labelAccessoryTintColor](self, "_labelAccessoryTintColor"));
  v16 = objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell currentLabelAccessoryTintColor](self, "currentLabelAccessoryTintColor"));
  v17 = v16 | v15;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell currentLabelAccessoryTintColor](self, "currentLabelAccessoryTintColor"));
  v19 = objc_msgSend(v18, "isEqual:", v15);

  if (v17 && (v19 & 1) == 0)
    -[RCFoldersCollectionViewCell updateAccessories](self, "updateAccessories");

}

- (void)_setRecordingsCountText:(id)a3
{
  id v4;

  v4 = a3;
  if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
    -[RCFoldersCollectionViewCell _setSecondaryAttributedTextWithRecordingsCount:](self, "_setSecondaryAttributedTextWithRecordingsCount:", v4);
  else
    -[RCFoldersCollectionViewCell updateAccessories](self, "updateAccessories");

}

- (void)_switchToAccessibilityTextLayout:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  -[RCFoldersCollectionViewCell updateAccessories](self, "updateAccessories");
  v5 = objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell recordingsCountString](self, "recordingsCountString"));
  v6 = (id)v5;
  if (v3)
    -[RCFoldersCollectionViewCell _setSecondaryAttributedTextWithRecordingsCount:](self, "_setSecondaryAttributedTextWithRecordingsCount:", v5);
  else
    -[RCFoldersCollectionViewCell _clearSecondaryAttributedText](self, "_clearSecondaryAttributedText");

}

- (void)_setSecondaryAttributedTextWithRecordingsCount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell _attributedStringForRecordingsCount:](self, "_attributedStringForRecordingsCount:", v4));

  objc_msgSend(v6, "setSecondaryAttributedText:", v5);
  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v6);

}

- (void)_clearSecondaryAttributedText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  objc_msgSend(v3, "setSecondaryAttributedText:", 0);
  -[RCFoldersCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v3);

}

- (id)_attributedStringForRecordingsCount:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSAttributedStringDocumentAttributeKey v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = 0.0;
  if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
  {
    objc_msgSend(v5, "sidebarCollectionViewCellAXHyphenationFactor");
    v6 = v7;
  }
  v8 = objc_alloc((Class)NSAttributedString);
  v13 = NSHyphenationFactorDocumentAttribute;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  v11 = objc_msgSend(v8, "initWithString:attributes:", v4, v10);

  return v11;
}

- (BOOL)_shouldUseAccessibilityTextLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "isAccessibilityLargerTextSizeEnabled");

  return v3;
}

- (id)_labelAccessoryTintColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedColor"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = v4;

  return v7;
}

- (BOOL)_needsDisclosureAccessory
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "sidebarCollectionViewNeedsDisclosureAccessory");

  return v3;
}

- (void)restyle
{
  -[RCFoldersCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell configurationState](self, "configurationState"));
  v4 = objc_msgSend(v3, "isEditing");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell folderName](self, "folderName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v5));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AX_NUMBER_OF_RECORDINGS_IN_FOLDER"), &stru_1001B2BC0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, -[RCFoldersCollectionViewCell recordingsCount](self, "recordingsCount")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewCell folderName](self, "folderName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v9, v5));

  }
  return v6;
}

- (id)accessibilityValue
{
  return 0;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RCFoldersCollectionViewCellActionHandler)actionHandler
{
  return (RCFoldersCollectionViewCellActionHandler *)objc_loadWeakRetained((id *)&self->_actionHandler);
}

- (void)setActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandler, a3);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (UIButton)editingMoreOptionsButton
{
  return self->_editingMoreOptionsButton;
}

- (void)setEditingMoreOptionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_editingMoreOptionsButton, a3);
}

- (UIColor)currentLabelAccessoryTintColor
{
  return self->_currentLabelAccessoryTintColor;
}

- (void)setCurrentLabelAccessoryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentLabelAccessoryTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLabelAccessoryTintColor, 0);
  objc_storeStrong((id *)&self->_editingMoreOptionsButton, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
