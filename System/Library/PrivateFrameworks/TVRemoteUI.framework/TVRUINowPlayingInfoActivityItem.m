@implementation TVRUINowPlayingInfoActivityItem

- (TVRUINowPlayingInfoActivityItem)initWithNowPlayingInfo:(id)a3 shareShow:(BOOL)a4
{
  id v7;
  TVRUINowPlayingInfoActivityItem *v8;
  TVRUINowPlayingInfoActivityItem *v9;
  void *v10;
  uint64_t v11;
  NSURLSession *urlSession;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVRUINowPlayingInfoActivityItem;
  v8 = -[TVRUINowPlayingInfoActivityItem init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nowPlayingInfo, a3);
    v9->_shareShow = a4;
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHTTPMaximumConnectionsPerHost:", 1);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v11;

  }
  return v9;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSItemProvider *v10;
  NSItemProvider *imageItemProvider;
  NSItemProvider *v12;
  uint64_t v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSItemProvider *v28;
  NSItemProvider *v29;
  NSItemProvider *v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  -[TVRUINowPlayingInfoActivityItem _shareURL](self, "_shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDDA888]);
  -[TVRUINowPlayingInfoActivityItem _title](self, "_title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  -[TVRUINowPlayingInfoActivityItem _subtitle](self, "_subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v9);

  if (-[TVRUINowPlayingInfoActivityItem shareShow](self, "shareShow"))
  {
    objc_initWeak(&location, self);
    v10 = (NSItemProvider *)objc_alloc_init(MEMORY[0x24BDD15F0]);
    imageItemProvider = self->_imageItemProvider;
    self->_imageItemProvider = v10;

    v12 = self->_imageItemProvider;
    v13 = objc_opt_class();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke;
    v36[3] = &unk_24DE2C7E0;
    v14 = &v37;
    objc_copyWeak(&v37, &location);
    -[NSItemProvider registerObjectOfClass:visibility:loadHandler:](v12, "registerObjectOfClass:visibility:loadHandler:", v13, 0, v36);
    v15 = objc_alloc(MEMORY[0x24BDDA898]);
    -[TVRUINowPlayingInfoActivityItem imageItemProvider](self, "imageItemProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithItemProvider:properties:placeholderImage:", v16, 0, 0);

    objc_msgSend(v7, "setArtwork:", v17);
LABEL_8:
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageData");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {

    goto LABEL_7;
  }
  v20 = (void *)v19;
  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageDataIsPlaceholder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if ((v23 & 1) != 0)
  {
LABEL_7:
    objc_initWeak(&location, self);
    v28 = (NSItemProvider *)objc_alloc_init(MEMORY[0x24BDD15F0]);
    v29 = self->_imageItemProvider;
    self->_imageItemProvider = v28;

    v30 = self->_imageItemProvider;
    v31 = objc_opt_class();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_4;
    v34[3] = &unk_24DE2C7E0;
    v14 = &v35;
    objc_copyWeak(&v35, &location);
    -[NSItemProvider registerObjectOfClass:visibility:loadHandler:](v30, "registerObjectOfClass:visibility:loadHandler:", v31, 0, v34);
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithItemProvider:properties:placeholderImage:", self->_imageItemProvider, 0, 0);
    objc_msgSend(v7, "setArtwork:", v32);

    goto LABEL_8;
  }
  v24 = objc_alloc(MEMORY[0x24BDDA898]);
  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithData:MIMEType:", v26, CFSTR("image/png"));

  objc_msgSend(v7, "setArtwork:", v27);
LABEL_9:
  objc_msgSend(v5, "setSpecialization:", v7);

  return v5;
}

uint64_t __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "nowPlayingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_2;
  v12[3] = &unk_24DE2C7B8;
  v12[4] = WeakRetained;
  v13 = v3;
  v10 = v3;
  objc_msgSend(v6, "requestForCanonicalID:completion:", v9, v12);

  return 0;
}

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_2(uint64_t a1, void *a2)
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
    v11[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_3;
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

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

uint64_t __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
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
  _QWORD v17[4];
  id v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "nowPlayingInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageURLTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BEB40A0];
    objc_msgSend(WeakRetained, "nowPlayingInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageURLTemplate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageTemplateWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "urlForSize:", 384.0, 216.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "urlSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_5;
    v17[3] = &unk_24DE2C790;
    v18 = v3;
    objc_msgSend(v14, "dataTaskWithURL:completionHandler:", v13, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "resume");
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __70__TVRUINowPlayingInfoActivityItem_activityViewControllerLinkMetadata___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

- (id)_shareURL
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[TVRUINowPlayingInfoActivityItem shareShow](self, "shareShow");
  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "showProductPageURL");
  else
    objc_msgSend(v5, "productPageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_title
{
  void *v2;
  void *v3;
  void *v4;

  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
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

  -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "kind") != 2)
  {
    v6 = 0;
LABEL_6:

    return v6;
  }
  v5 = -[TVRUINowPlayingInfoActivityItem shareShow](self, "shareShow");

  if (!v5)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRUIEpisodeShareSubtitle"), &stru_24DE30718, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seasonNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUINowPlayingInfoActivityItem nowPlayingInfo](self, "nowPlayingInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
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

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfoRequest, 0);
  objc_storeStrong((id *)&self->_imageItemProvider, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

@end
