@implementation PKSharingMessageExtensionOpenGraphPresenter

- (PKSharingMessageExtensionOpenGraphPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7;
  id v8;
  PKSharingMessageExtensionOpenGraphPresenter *v9;
  PKSharingMessageExtensionOpenGraphPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionOpenGraphPresenter;
  v9 = -[PKSharingMessageExtensionOpenGraphPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_message, a3);

}

- (void)extensionWillAppear
{
  _BOOL4 v3;
  PKSharingMessageExtensionOpenGraphMessage *message;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  PKSharingMessageExtensionOpenGraphMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[PKSharingMessageExtensionOpenGraphMessage hasFetchedOpenGraphPreview](self->_message, "hasFetchedOpenGraphPreview"))
  {
    v3 = -[PKSharingMessageExtensionOpenGraphMessage isFromMe](self->_message, "isFromMe");
    message = self->_message;
    if (v3)
    {
      -[PKSharingMessageExtensionOpenGraphMessage urlRepresentation](self->_message, "urlRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "host");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: fetching open graph preview for: '%@'...", buf, 0xCu);

      }
      v8 = objc_alloc_init(MEMORY[0x1E0CC11E8]);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke;
      v16[3] = &unk_1E3E6ABB0;
      v16[4] = self;
      v17 = v8;
      v9 = v8;
      objc_msgSend(v9, "startFetchingMetadataForURL:completionHandler:", v5, v16);

    }
    else
    {
      PKLocalizedShareableCredentialString(CFSTR("SHARE_PREVIEW_SUBTITLE_GENERAL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionOpenGraphMessage setTitle:](message, "setTitle:", v10);

      v11 = self->_message;
      v12 = (void *)MEMORY[0x1E0DC3870];
      PKPassKitUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("Generic-Shared-Key"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharingMessageExtensionOpenGraphMessage setThumbnail:](v11, "setThumbnail:", v14);

      -[PKSharingMessageExtensionOpenGraphMessage setHasFetchedOpenGraphPreview:](self->_message, "setHasFetchedOpenGraphPreview:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
      objc_msgSend(WeakRetained, "messageDidUpdate");

    }
  }
}

void __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__PKSharingMessageExtensionOpenGraphPresenter_extensionWillAppear__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "iMessage Extension: received metadata %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setHasFetchedOpenGraphPreview:", 1);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    objc_msgSend(*(id *)(a1 + 32), "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v8);
      objc_msgSend(v9, "setThumbnail:", v10);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(WeakRetained, "messageDidUpdate");

}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a5;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: validateForRecipients called for open graph presenter. This shouldn't happen", v7, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
}

- (void)didTapMessage
{
  void *v3;
  id WeakRetained;

  if (!-[PKSharingMessageExtensionOpenGraphMessage isFromMe](self->_message, "isFromMe"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
    -[PKSharingMessageExtensionOpenGraphMessage urlRepresentation](self->_message, "urlRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "openAppURL:", v3);

  }
}

+ (id)propertiesForMessage:(id)a3
{
  id v3;
  PKSharingMessageExtensionViewProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v5);
  }
  else
  {
    PKLocalizedString(CFSTR("WALLET"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v6);

  }
  objc_msgSend(v3, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v7);

  objc_msgSend(v3, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setCardImage:](v4, "setCardImage:", v8);

  if ((objc_msgSend(v3, "isFromMe") & 1) == 0)
  {
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_EXTENSION_BUTTON_TEXT_VIEW"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v9);

  }
  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  return (PKSharingMessageExtensionRenderer *)objc_loadWeakRetained((id *)&self->_renderer);
}

- (void)setRenderer:(id)a3
{
  objc_storeWeak((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
