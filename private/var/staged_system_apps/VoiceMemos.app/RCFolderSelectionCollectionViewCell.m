@implementation RCFolderSelectionCollectionViewCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RCFolderSelectionCollectionViewCell;
  -[RCFoldersCollectionViewCell updateConfigurationUsingState:](&v23, "updateConfigurationUsingState:", v4);
  if (objc_msgSend(v4, "isSwiped"))
    v5 = 2;
  else
    v5 = 1;
  -[RCFoldersCollectionViewCell setDisplayMode:](self, "setDisplayMode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration listGroupedCellConfiguration](UIBackgroundConfiguration, "listGroupedCellConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewCell contentConfiguration](self, "contentConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folderSelectionCollectionViewCellColor"));
  if (v9)
  {
    if ((objc_msgSend(v4, "isSelected") & 1) != 0
      || (objc_msgSend(v4, "isHighlighted") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sidebarCollectionViewCellDropTargetBackgroundColor"));
      objc_msgSend(v7, "setBackgroundColor:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewSelectedCellTextColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
      objc_msgSend(v12, "setColor:", v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageProperties"));
      objc_msgSend(v13, "setTintColor:", v11);

      if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
        objc_msgSend(v14, "setColor:", v11);
LABEL_11:

      }
    }
    else
    {
      objc_msgSend(v7, "setBackgroundColor:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textProperties"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "color"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
      objc_msgSend(v17, "setColor:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageProperties"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tintColor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageProperties"));
      objc_msgSend(v20, "setTintColor:", v19);

      if (-[RCFoldersCollectionViewCell _shouldUseAccessibilityTextLayout](self, "_shouldUseAccessibilityTextLayout"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textProperties"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "color"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textProperties"));
        objc_msgSend(v22, "setColor:", v21);

        goto LABEL_11;
      }
    }

  }
  -[RCFolderSelectionCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v7);
  -[RCFolderSelectionCollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v8);

}

- (BOOL)_needsDisclosureAccessory
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "folderSelectionCollectionViewNeedsDisclosureAccessory");

  return v3;
}

- (void)restyle
{
  -[RCFolderSelectionCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

@end
