@implementation _UICloudSharingActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

+ (int64_t)activityCategory
{
  return 0;
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.CloudSharing");
}

- (id)_systemImageName
{
  if (-[_UICloudSharingActivity initialSharing](self, "initialSharing"))
    return CFSTR("person.crop.circle.badge.plus");
  else
    return CFSTR("person.crop.circle.badge.checkmark");
}

- (id)_activityFooterText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!-[_UICloudSharingActivity activityItemIsInSharedFolder](self, "activityItemIsInSharedFolder"))
    return 0;
  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MANAGE_SHARED_FOLDER_FOOTER"), CFSTR("This document is in a shared folder."), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v3, v7);

  return v8;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (void)_setupForInitialSharing
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = -[_UICloudSharingActivity activityItemIsFolder](self, "activityItemIsFolder");
  v4 = CFSTR("Share File in iCloud");
  if (v3)
    v4 = CFSTR("Share Folder in iCloud");
  v5 = v4;
  _ShareSheetBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICloudSharingActivity setActivityTitle:](self, "setActivityTitle:", v6);
}

- (void)_setupForSharingInfo
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  id v7;

  v3 = -[_UICloudSharingActivity activityItemIsFolder](self, "activityItemIsFolder");
  v4 = CFSTR("Manage Shared File");
  if (v3)
    v4 = CFSTR("Manage Shared Folder");
  v5 = v4;
  _ShareSheetBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UICloudSharingActivity setActivityTitle:](self, "setActivityTitle:", v6);
}

- (BOOL)eligibleTypeForActivity:(id)a3
{
  __CFString *v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v16[0] = *MEMORY[0x1E0CA5AB0];
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (UTTypeConformsTo(v3, *(CFStringRef *)(*((_QWORD *)&v11 + 1) + 8 * i)))
        {
          v4 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
    v4 = 1;
  }
LABEL_11:

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  BOOL v12;
  BOOL v13;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "isFileURL"))
        {
          v11 = v10;
          v15 = 0;
          v12 = -[_UICloudSharingActivity _isURLEligibleForSharing:isInitial:isFolder:](self, "_isURLEligibleForSharing:isInitial:isFolder:", v11, (char *)&v15 + 1, &v15);
          if (v7 & 1 | !v12)
          {
            v13 = v12;

            if (v13)
              goto LABEL_20;
          }
          else
          {
            -[_UICloudSharingActivity setActivityItemIsFolder:](self, "setActivityItemIsFolder:", v15);
            if (HIBYTE(v15))
            {
              -[_UICloudSharingActivity setInitialSharing:](self, "setInitialSharing:", 1);
              -[_UICloudSharingActivity _setupForInitialSharing](self, "_setupForInitialSharing");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D97420], "isSharedFileURL:isLocalStorageFileURL:isiCloudDriveFileURL:isInSharedFolder:", v11, 0, 0, &self->_activityItemIsInSharedFolder);
              if (-[_UICloudSharingActivity activityItemIsInSharedFolder](self, "activityItemIsInSharedFolder"))
                -[_UICloudSharingActivity setActivityItemIsFolder:](self, "setActivityItemIsFolder:", 1);
              -[_UICloudSharingActivity _setupForSharingInfo](self, "_setupForSharingInfo");
            }

            v7 = 1;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
LABEL_20:
    v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)_isURLEligibleForSharing:(id)a3 isInitial:(BOOL *)a4 isFolder:(BOOL *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _UICloudSharingActivity *v14;
  uint64_t *v15;
  BOOL *v16;
  BOOL *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71___UICloudSharingActivity__isURLEligibleForSharing_isInitial_isFolder___block_invoke;
  v12[3] = &unk_1E4001F60;
  v15 = &v18;
  v10 = v8;
  v13 = v10;
  v14 = self;
  v16 = a4;
  v17 = a5;
  objc_msgSend(v9, "synchronouslyGetFileProviderServicesForItemAtURL:completionHandler:", v10, v12);

  LOBYTE(a5) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)a5;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke;
  v8[3] = &unk_1E4001810;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[UIActivity _loadItemProvidersFromActivityItems:wantsSendCopyRepresentation:completion:](self, "_loadItemProvidersFromActivityItems:wantsSendCopyRepresentation:completion:", a3, 0, v8);

}

- (void)_showSharingControllerForURL:(id)a3 completion:(id)a4
{
  objc_class *v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0DC3740];
  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  v15 = 0;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFileURL:error:", v8, &v15);

  v10 = v15;
  if (v9)
  {
    objc_msgSend(v9, "_setPrivateDelegate:", self);
    -[_UICloudSharingActivity setActivityViewController:](self, "setActivityViewController:", v9);
  }
  else
  {
    _ShareSheetBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Unable to Share Item"), CFSTR("Unable to Share Item"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICloudSharingActivity setActivityViewController:](self, "setActivityViewController:", v14);

  }
  v7[2](v7);

}

- (void)_cloudShareControllerDidDismiss:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (void)_documentSharingControllerDidDismiss:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 1;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (void)setActivityTitle:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitle, a3);
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (void)setActivityImage:(id)a3
{
  objc_storeStrong((id *)&self->_activityImage, a3);
}

- (BOOL)initialSharing
{
  return self->_initialSharing;
}

- (void)setInitialSharing:(BOOL)a3
{
  self->_initialSharing = a3;
}

- (BOOL)activityItemIsFolder
{
  return self->_activityItemIsFolder;
}

- (void)setActivityItemIsFolder:(BOOL)a3
{
  self->_activityItemIsFolder = a3;
}

- (BOOL)activityItemIsInSharedFolder
{
  return self->_activityItemIsInSharedFolder;
}

- (void)setActivityItemIsInSharedFolder:(BOOL)a3
{
  self->_activityItemIsInSharedFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end
