@implementation ICNoteEditorActivityItemsConfigurationProvider

- (ICNoteEditorActivityItemsConfigurationProvider)initWithDelegate:(id)a3
{
  id v4;
  ICNoteEditorActivityItemsConfigurationProvider *v5;
  ICNoteEditorActivityItemsConfigurationProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteEditorActivityItemsConfigurationProvider;
  v5 = -[ICNoteEditorActivityItemsConfigurationProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)activityItemsConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CFIndex (__cdecl **v20)(CFArrayRef);
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t (*__ptr32 *v29)();
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v3 = objc_opt_class(ICNote);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorActivityItemsConfigurationProvider delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noteForActivityItemsConfiguration"));
  v6 = ICDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (objc_msgSend(v7, "canBeSharedViaICloud"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedRootObject"));
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    v11 = v10;

    v12 = objc_alloc_init((Class)LPLinkMetadata);
    v13 = objc_opt_class(ICNote);
    v14 = ICDynamicCast(v13, v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_opt_class(ICFolder);
    v17 = ICDynamicCast(v16, v11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)v18;
    if (v15 | v18)
    {
      v20 = &CFArrayGetCount_ptr;
      v21 = ICNoteEditorBaseViewController_ptr;
      if (v15)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "title"));
        objc_msgSend(v12, "setTitle:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteEditorActivityItemsConfigurationProvider delegate](self, "delegate"));
        v24 = objc_msgSend(v23, "isDarkModeForActivityItemsConfiguration");

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppearanceInfo appearanceInfoWithType:](ICAppearanceInfo, "appearanceInfoWithType:", v24));
        v26 = objc_msgSend(objc_alloc((Class)ICThumbnailConfiguration), "initForSharePreviewThumbnailWithNote:appearanceInfo:", v15, v25);
        v27 = objc_alloc_init((Class)NSItemProvider);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100024C00;
        v45[3] = &unk_10054F908;
        v46 = v26;
        v28 = v26;
        v21 = ICNoteEditorBaseViewController_ptr;
        objc_msgSend(v27, "registerDataRepresentationForContentType:visibility:loadHandler:", UTTypePNG, 0, v45);
        objc_msgSend(v12, "setImageProvider:", v27);

        v20 = &CFArrayGetCount_ptr;
        v29 = &off_100451000;
      }
      else
      {
        v29 = &off_100451000;
        if (v18)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v18, "title"));
          objc_msgSend(v12, "setTitle:", v31);

          v32 = objc_alloc((Class)LPImage);
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController shareSheetFolderThumbnailImage](ICCollaborationController, "shareSheetFolderThumbnailImage"));
          v34 = objc_msgSend(v32, "initWithPlatformImage:", v33);
          objc_msgSend(v12, "setImage:", v34);

        }
      }
      v35 = objc_alloc_init((Class)v21[129]);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[410], "sharedInstance"));
      objc_msgSend(v36, "registerShareForObject:itemProvider:generateThumbnails:", v11, v35, 0);

      v37 = objc_alloc((Class)UIActivityItemsConfiguration);
      v47 = v35;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
      v30 = objc_msgSend(v37, "initWithItemProviders:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v39, "ic_setNonNilObject:forNonNilKey:", v12, UIActivityItemsConfigurationMetadataKeyLinkPresentationMetadata);
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
      objc_msgSend(v39, "ic_setNonNilObject:forNonNilKey:", v40, UIActivityItemsConfigurationMetadataKeyTitle);

      v43[0] = _NSConcreteStackBlock;
      v43[1] = *((_QWORD *)v29 + 236);
      v43[2] = sub_100024D40;
      v43[3] = &unk_10054F930;
      v44 = v39;
      v41 = v39;
      objc_msgSend(v30, "setMetadataProvider:", v43);

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (ICNoteEditorActivityItemsConfigurationProviderDelegate)delegate
{
  return (ICNoteEditorActivityItemsConfigurationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
