@implementation TVRUIUpNextActivityItem

- (TVRUIUpNextActivityItem)initWithUpNextInfo:(id)a3 upNextProvider:(id)a4 shareShow:(BOOL)a5
{
  id v9;
  id v10;
  TVRUIUpNextActivityItem *v11;
  TVRUIUpNextActivityItem *v12;
  void *v13;
  uint64_t v14;
  NSURLSession *urlSession;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TVRUIUpNextActivityItem;
  v11 = -[TVRUIUpNextActivityItem init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_upNextInfo, a3);
    objc_storeStrong((id *)&v12->_upNextProvider, a4);
    v12->_shareShow = a5;
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    urlSession = v12->_urlSession;
    v12->_urlSession = (NSURLSession *)v14;

  }
  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSItemProvider *v13;
  NSItemProvider *imageItemProvider;
  NSItemProvider *v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  NSItemProvider *v21;
  NSItemProvider *v22;
  NSItemProvider *v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  -[TVRUIUpNextActivityItem _shareURL](self, "_shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDDA888]);
  -[TVRUIUpNextActivityItem _title](self, "_title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  -[TVRUIUpNextActivityItem _subtitle](self, "_subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v9);

  if (-[TVRUIUpNextActivityItem shareShow](self, "shareShow")
    && (-[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "mediaInfo"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "kind"),
        v11,
        v10,
        v12 == 1))
  {
    objc_initWeak(&location, self);
    v13 = (NSItemProvider *)objc_alloc_init(MEMORY[0x24BDD15F0]);
    imageItemProvider = self->_imageItemProvider;
    self->_imageItemProvider = v13;

    v15 = self->_imageItemProvider;
    v16 = objc_opt_class();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke;
    v29[3] = &unk_24DE2C7E0;
    v17 = &v30;
    objc_copyWeak(&v30, &location);
    -[NSItemProvider registerObjectOfClass:visibility:loadHandler:](v15, "registerObjectOfClass:visibility:loadHandler:", v16, 0, v29);
    v18 = objc_alloc(MEMORY[0x24BDDA898]);
    -[TVRUIUpNextActivityItem imageItemProvider](self, "imageItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithItemProvider:properties:placeholderImage:", v19, 0, 0);

    objc_msgSend(v7, "setArtwork:", v20);
  }
  else
  {
    objc_initWeak(&location, self);
    v21 = (NSItemProvider *)objc_alloc_init(MEMORY[0x24BDD15F0]);
    v22 = self->_imageItemProvider;
    self->_imageItemProvider = v21;

    v23 = self->_imageItemProvider;
    v24 = objc_opt_class();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_4;
    v27[3] = &unk_24DE2C7E0;
    v17 = &v28;
    objc_copyWeak(&v28, &location);
    -[NSItemProvider registerObjectOfClass:visibility:loadHandler:](v23, "registerObjectOfClass:visibility:loadHandler:", v24, 0, v27);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithItemProvider:properties:placeholderImage:", self->_imageItemProvider, 0, 0);
    objc_msgSend(v7, "setArtwork:", v25);

  }
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_msgSend(v5, "setSpecialization:", v7);

  return v5;
}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_alloc_init(MEMORY[0x24BEB40E0]);
  objc_msgSend(WeakRetained, "setMediaInfoRequest:", v5);

  objc_msgSend(WeakRetained, "mediaInfoRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_2;
  v12[3] = &unk_24DE2C7B8;
  v12[4] = WeakRetained;
  v13 = v3;
  v10 = v3;
  objc_msgSend(v6, "requestForCanonicalID:completion:", v9, v12);

  return 0;
}

void __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "imageURLTemplate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEB40A0];
    objc_msgSend(v3, "imageURLTemplate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageTemplateWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "urlForSize:", 384.0, 216.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "urlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_3;
    v11[3] = &unk_24DE2C790;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v8, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "resume");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "upNextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "upNextInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_5;
  v9[3] = &unk_24DE2C808;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "fetchImageForUpNextInfo:completion:", v6, v9);

  return 0;
}

uint64_t __62__TVRUIUpNextActivityItem_activityViewControllerLinkMetadata___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_shareURL
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[TVRUIUpNextActivityItem shareShow](self, "shareShow");
  -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "shareShowURL");
  else
    objc_msgSend(v4, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_title
{
  void *v2;
  void *v3;
  void *v4;

  -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_subtitle
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "kind") != 1)
  {
    v6 = 0;
LABEL_6:

    return v6;
  }
  v5 = -[TVRUIUpNextActivityItem shareShow](self, "shareShow");

  if (!v5)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRUIEpisodeShareSubtitle"), &stru_24DE30718, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mediaInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextActivityItem upNextInfo](self, "upNextInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "episodeNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v4, v7, v10, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v6 = 0;
  return v6;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (void)setUpNextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_upNextInfo, a3);
}

- (BOOL)shareShow
{
  return self->_shareShow;
}

- (void)setShareShow:(BOOL)a3
{
  self->_shareShow = a3;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (NSItemProvider)imageItemProvider
{
  return self->_imageItemProvider;
}

- (void)setImageItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageItemProvider, a3);
}

- (TVRCUTSMediaInfoRequest)mediaInfoRequest
{
  return self->_mediaInfoRequest;
}

- (void)setMediaInfoRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfoRequest, a3);
}

- (TVRUIUpNextProviding)upNextProvider
{
  return self->_upNextProvider;
}

- (void)setUpNextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_upNextProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextProvider, 0);
  objc_storeStrong((id *)&self->_mediaInfoRequest, 0);
  objc_storeStrong((id *)&self->_imageItemProvider, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_upNextInfo, 0);
}

@end
