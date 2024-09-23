@implementation VUIShareActivityViewController_iOS

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 sharedWatchId:(id)a8 sharedWatchUrl:(id)a9 sourceView:(id)a10 completionHandler:(id)a11
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v17 = (void *)MEMORY[0x1E0C99E08];
  v26 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v17, "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v20, CFSTR("sharedWatchId"));

  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v19, CFSTR("sharedWatchUrl"));
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v23, CFSTR("title"));
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v22, CFSTR("subtitle"));
  objc_msgSend(v27, "vui_setObjectIfNotNil:forKey:", v21, CFSTR("imageUrlFormat"));
  objc_msgSend((id)objc_opt_class(), "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:completionHandler:", v25, v24, v23, v22, v21, v27, v18, v26);

}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  objc_msgSend(v18, "bounds");
  objc_msgSend(a1, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:sourceRect:completionHandler:", v24, v23, v22, v21, v20, v19, v18, v17);

}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceRect:(CGRect)a9 completionHandler:(id)a10
{
  objc_msgSend(a1, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:sourceRect:completionHandler:", a3, a4, a5, a6, a7, a8, a9.origin.x, a9.origin.y, a9.size.width, a9.size.height, 0, a10);
}

+ (void)shareMediaItem:(id)a3 previewURLString:(id)a4 title:(id)a5 subtitle:(id)a6 imageURLStr:(id)a7 groupActivityMetadata:(id)a8 sourceView:(id)a9 sourceRect:(CGRect)a10 completionHandler:(id)a11
{
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  VUIShareURLActivityItem *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  VUIShareURLActivityItem *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL4 v39;
  VUIGroupWatchActivityPreviewMetadata *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  VUIShareActivityViewController_iOS *v48;
  void *v49;
  VUIShareActivityViewController_iOS *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  uint64_t v68;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v68 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = (__CFString *)a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a11;
  if (objc_msgSend(v20, "length"))
  {
    v59 = v27;
    v60 = v26;
    v62 = v21;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v20;
    if (v22 && v24)
    {
      v29 = [VUIShareURLActivityItem alloc];
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0C99E98];
      v32 = v22;
      objc_msgSend(v31, "URLWithString:", v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[VUIShareURLActivityItem initWithURL:title:subtitle:imageURL:](v29, "initWithURL:title:subtitle:imageURL:", v30, v32, v23, v33);

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIShareURLActivityItem setPreviewURL:](v34, "setPreviewURL:", v35);

      }
      objc_msgSend(v28, "addObject:", v34);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *MEMORY[0x1E0CEB1A8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "vui_stringForKey:", CFSTR("sharedWatchId"));
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "vui_URLForKey:", CFSTR("sharedWatchUrl"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    v57 = (void *)v37;
    v58 = v25;
    if (v25 && v37 && v63)
    {
      if (v39)
      {
        *(_DWORD *)buf = 138412290;
        v67 = v37;
        _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: Adding group activity to activity items for sharedWatchId %@", buf, 0xCu);
      }

      v40 = -[VUIGroupWatchActivityPreviewMetadata initWithContextData:]([VUIGroupWatchActivityPreviewMetadata alloc], "initWithContextData:", v25);
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "groupActivitiesManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v37;
      v44 = v42;
      objc_msgSend(v42, "itemProviderForActivityWithSharedWatchId:sharedWatchUrl:previewMetadata:existingItemProvider:", v43, v63, v40, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v28, "addObject:", v45);
        v21 = v62;
      }
      else
      {
        VUIDefaultLogObject();
        v47 = objc_claimAutoreleasedReturnValue();
        v21 = v62;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v47, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: failed to create group activity provider", buf, 2u);
        }

      }
      v46 = v36;

    }
    else
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "VUIShareActivityViewController:: Not adding group activity to activity because shared watch id or url is missing", buf, 2u);
      }

      v46 = v36;
      objc_msgSend(v36, "addObject:", *MEMORY[0x1E0CEB240]);
      v21 = v62;
    }
    v48 = [VUIShareActivityViewController_iOS alloc];
    v49 = (void *)objc_msgSend(v28, "copy");
    v50 = -[VUIShareActivityViewController_iOS initWithActivityItems:applicationActivities:](v48, "initWithActivityItems:applicationActivities:", v49, 0);

    v51 = &stru_1E9FF3598;
    if (v22 && -[__CFString length](v22, "length"))
      v51 = v22;
    -[VUIShareActivityViewController_iOS setItemTitle:](v50, "setItemTitle:", v51);
    if (v23)
    {
      if (objc_msgSend(v23, "length"))
        v52 = v23;
      else
        v52 = 0;
    }
    else
    {
      v52 = 0;
    }
    -[VUIShareActivityViewController_iOS setItemSubtitle:](v50, "setItemSubtitle:", v52);
    if (v24 && objc_msgSend(v24, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIShareActivityViewController_iOS setItemImageURL:](v50, "setItemImageURL:", v53);

    }
    else
    {
      -[VUIShareActivityViewController_iOS setItemImageURL:](v50, "setItemImageURL:", 0);
    }
    -[VUIShareActivityViewController_iOS setExcludedActivityTypes:](v50, "setExcludedActivityTypes:", v46);
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "controllerPresenter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIShareActivityViewController_iOS setModalPresentationStyle:](v50, "setModalPresentationStyle:", 7);
    -[VUIShareActivityViewController_iOS popoverPresentationController](v50, "popoverPresentationController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setSourceView:", v60);
    objc_msgSend(v56, "setSourceRect:", x, y, width, height);
    objc_msgSend(v56, "_setCentersPopoverIfSourceViewNotSet:", 1);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __159__VUIShareActivityViewController_iOS_shareMediaItem_previewURLString_title_subtitle_imageURLStr_groupActivityMetadata_sourceView_sourceRect_completionHandler___block_invoke;
    v64[3] = &unk_1E9F98E68;
    v27 = v59;
    v65 = v59;
    objc_msgSend(v55, "presentViewController:animated:completion:", v50, 1, v64);

    v26 = v60;
    v20 = v61;
    v25 = v58;
  }

}

+ (void)shareMediaWithShareSheet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "urlString");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewUrlStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageURLStr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupActivityMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v4, "shareMediaItem:previewURLString:title:subtitle:imageURLStr:groupActivityMetadata:sourceView:sourceRect:completionHandler:", v19, v5, v6, v7, v8, v9, v12, v14, v16, v18, v10, 0);
}

- (VUIShareActivityViewController_iOS)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  void *v4;
  id v7;
  VUIShareActivityViewController_iOS *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIShareActivityViewController_iOS;
  v8 = -[VUIShareActivityViewController_iOS initWithActivityItems:applicationActivities:](&v13, sel_initWithActivityItems_applicationActivities_, v7, a4);
  if (v8)
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shareURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&v8->_sharingURL, v11);
    if ((isKindOfClass & 1) != 0)
    {

    }
  }

  return v8;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  LPMetadataProvider **p_pendingMessageMetadataProvider;
  LPMetadataProvider *pendingMessageMetadataProvider;
  NSURL *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSURL *v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(void);
  id v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSURL *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  NSString *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  VUIShareActivityViewController_iOS *v63;
  id v64;
  NSURL *v65;
  void (**v66)(_QWORD);
  _QWORD aBlock[4];
  id v68;
  id v69;
  id v70;
  id v71;
  NSURL *v72;
  void (**v73)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEB1E0]);

  if (v9)
  {
    p_pendingMessageMetadataProvider = &self->_pendingMessageMetadataProvider;
    pendingMessageMetadataProvider = self->_pendingMessageMetadataProvider;
    if (pendingMessageMetadataProvider)
      -[LPMetadataProvider cancel](pendingMessageMetadataProvider, "cancel");
    v12 = self->_sharingURL;
    -[VUIShareActivityViewController_iOS itemTitle](self, "itemTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
      objc_msgSend(v14, "setURL:", v12);
      v15 = objc_alloc_init(MEMORY[0x1E0CC1138]);
      -[VUIShareActivityViewController_iOS itemTitle](self, "itemTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:", v16);

      -[VUIShareActivityViewController_iOS itemSubtitle](self, "itemSubtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSubtitle:", v17);

      -[VUIShareActivityViewController_iOS itemImageURL](self, "itemImageURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke;
      aBlock[3] = &unk_1E9F99C18;
      v68 = v18;
      v69 = v14;
      v70 = v15;
      v71 = v6;
      v72 = v12;
      v73 = v7;
      v19 = v12;
      v20 = v15;
      v21 = v14;
      v22 = v18;
      v23 = (void (**)(void))_Block_copy(aBlock);
      v23[2]();

      v24 = 0;
    }
    else
    {
      v43 = objc_alloc_init(MEMORY[0x1E0CC11E0]);
      objc_msgSend(v43, "setShouldFetchSubresources:", 0);
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __66__VUIShareActivityViewController_iOS__prepareActivity_completion___block_invoke_3;
      v61[3] = &unk_1E9F9C9B8;
      v24 = v43;
      v62 = v24;
      v63 = self;
      v64 = v6;
      v65 = v12;
      v66 = v7;
      v44 = v12;
      v45 = _Block_copy(v61);
      objc_msgSend(v24, "startFetchingMetadataForURL:completionHandler:", v44, v45);
      objc_storeStrong((id *)p_pendingMessageMetadataProvider, v43);

      v22 = v62;
    }

    goto LABEL_32;
  }
  objc_msgSend(v6, "activityType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CEB1D0]))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedInfoDictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", CFSTR("CFBundleDisplayFullName"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "infoDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("CFBundleDisplayFullName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v32 = (void *)objc_opt_new();
      objc_msgSend(v32, "setString:", CFSTR("<!DOCTYPE html><html><body>"));
      -[VUIShareActivityViewController_iOS itemTitle](self, "itemTitle");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v33
        && (v34 = (void *)v33,
            -[VUIShareActivityViewController_iOS itemSubtitle](self, "itemSubtitle"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            v34,
            !v35))
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:", CFSTR("SHARE_ITEM_MAIL"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithValidatedFormat:validFormatSpecifiers:error:", v48, CFSTR("%@ %@"), 0, self->_itemTitle, v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "appendFormat:", CFSTR("%@<br/><br/>"), v42, v60);
      }
      else
      {
        -[VUIShareActivityViewController_iOS itemTitle](self, "itemTitle");
        v36 = objc_claimAutoreleasedReturnValue();
        if (!v36)
          goto LABEL_22;
        v37 = (void *)v36;
        -[VUIShareActivityViewController_iOS itemSubtitle](self, "itemSubtitle");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          goto LABEL_22;
        v39 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:", CFSTR("SHARE_ITEM_MAIL"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithValidatedFormat:validFormatSpecifiers:error:", v41, CFSTR("%@ %@"), 0, self->_itemSubtitle, v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "appendFormat:", CFSTR("%@ · %@<br/><br/>"), self->_itemTitle, v42);
      }

LABEL_22:
      -[VUIShareActivityViewController_iOS itemImageURL](self, "itemImageURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        -[VUIShareActivityViewController_iOS view](self, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "bounds");
        v52 = v51 + -20.0;

        if (v52 < 150.0)
          v52 = 150.0;
        v53 = (void *)MEMORY[0x1E0CB3940];
        -[VUIShareActivityViewController_iOS itemImageURL](self, "itemImageURL");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("<br/><br/><img width=\"%f\" src=\"%@\"/>"), *(_QWORD *)&v52, v54);
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v55 = &stru_1E9FF3598;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<a href=\"%@\">%@</a>%@</body></html>"), v32, self->_sharingURL, self->_sharingURL, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = self->_itemTitle;
      if (v57)
      {
        objc_msgSend(v6, "mailComposeViewController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setSubject:", v57);

      }
      objc_msgSend(v6, "mailComposeViewController");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setMessageBody:isHTML:", v56, 1);

      if (v7)
        v7[2](v7);

      goto LABEL_32;
    }
  }
  else
  {

  }
  if (v7)
    v7[2](v7);
LABEL_32:

}

- (NSURL)itemImageURL
{
  return self->_itemImageURL;
}

- (void)setItemImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemImageURL, a3);
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitle, a3);
}

- (NSString)itemSubtitle
{
  return self->_itemSubtitle;
}

- (void)setItemSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_itemSubtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSubtitle, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemImageURL, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_pendingMessageMetadataProvider, 0);
}

@end
