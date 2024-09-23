@implementation VUIShareURLActivityItem

- (VUIShareURLActivityItem)initWithURL:(id)a3 title:(id)a4 subtitle:(id)a5 imageURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VUIShareURLActivityItem *v15;
  VUIShareURLActivityItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIShareURLActivityItem;
  v15 = -[VUIShareURLActivityItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shareURL, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_subtitle, a5);
    objc_storeStrong((id *)&v16->_imageURL, a6);
  }

  return v16;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_shareURL;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_shareURL;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSURL *imageURL;
  void *v8;
  uint64_t v9;
  NSItemProvider *v10;
  NSItemProvider *itemProvider;
  NSItemProvider *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v5, "setURL:", self->_shareURL);
  objc_msgSend(v5, "setRemoteVideoURL:", self->_previewURL);
  v6 = objc_alloc_init(MEMORY[0x1E0CC1138]);
  objc_msgSend(v6, "setTitle:", self->_title);
  objc_msgSend(v6, "setSubtitle:", self->_subtitle);
  imageURL = self->_imageURL;
  if (imageURL)
  {
    -[NSURL absoluteString](imageURL, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_initWeak(&location, self);
      v10 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E0CB36C8]);
      itemProvider = self->_itemProvider;
      self->_itemProvider = v10;

      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__12;
      v18[4] = __Block_byref_object_dispose__12;
      v19 = 0;
      v12 = self->_itemProvider;
      v13 = objc_opt_class();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke;
      v16[3] = &unk_1E9F9F000;
      objc_copyWeak(&v17, &location);
      v16[4] = v18;
      -[NSItemProvider registerObjectOfClass:visibility:loadHandler:](v12, "registerObjectOfClass:visibility:loadHandler:", v13, 0, v16);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithItemProvider:properties:placeholderImage:", self->_itemProvider, 0, 0);
      objc_msgSend(v6, "setArtwork:", v14);

      objc_destroyWeak(&v17);
      _Block_object_dispose(v18, 8);

      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(v5, "setSpecialization:", v6);

  return v5;
}

uint64_t __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[4])
  {
    v5 = objc_alloc(MEMORY[0x1E0DB1870]);
    v6 = WeakRetained[4];
    objc_msgSend(MEMORY[0x1E0DB1898], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithObject:imageLoader:groupType:", v6, v7, 0);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAllowsSubstitutionForOriginal:", 1);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke_2;
    v13[3] = &unk_1E9F9EFD8;
    v14 = v3;
    objc_msgSend(v11, "setCompletionHandler:", v13);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "load");

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __74__VUIShareURLActivityItem_activityViewControllerLinkPresentationMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "uiImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
