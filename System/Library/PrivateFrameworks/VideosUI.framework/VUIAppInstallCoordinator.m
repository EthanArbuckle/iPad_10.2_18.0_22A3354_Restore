@implementation VUIAppInstallCoordinator

- (VUIAppInstallCoordinator)initWithChannelDetails:(id)a3 contentTitle:(id)a4
{
  id v7;
  id v8;
  VUIAppInstallCoordinator *v9;
  VUIAppInstallCoordinator *v10;
  uint64_t v11;
  void *uuid;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUIAppInstallCoordinator;
  v9 = -[VUIAppInstallCoordinator init](&v14, sel_init);
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v9->_contentTitle, a4);
      objc_storeStrong((id *)&v10->_channelDetails, a3);
      v11 = objc_opt_new();
      uuid = v10->_uuid;
      v10->_uuid = (NSUUID *)v11;
    }
    else
    {
      uuid = 0;
    }
  }
  else
  {
    uuid = v9;
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VUIAppInstallCoordinator uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIAppInstallCoordinator *v4;
  VUIAppInstallCoordinator *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VUIAppInstallCoordinator *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[VUIAppInstallCoordinator uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAppInstallCoordinator uuid](v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)installAppWithPunchoutURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[WLKChannelDetails appBundleIDs](self->_channelDetails, "appBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    -[VUIAppInstallCoordinator _installAppWithChannel:punchoutURL:completion:](self, "_installAppWithChannel:punchoutURL:completion:", self->_channelDetails, v9, v6);
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

- (void)_installAppWithChannel:(id)a3 punchoutURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v14 = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke;
    v15 = &unk_1E9F997F0;
    objc_copyWeak(&v19, &location);
    v16 = v8;
    v17 = v9;
    v18 = v11;
    v12 = v13;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v14((uint64_t)v12);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  VUIAppInstallerViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  VUIAppInstallerViewController *v14;
  _QWORD v15[4];
  id v16;
  VUIAppInstallerViewController *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controllerPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = -[VUIAppInstallerViewController initWithInstallable:punchoutURL:]([VUIAppInstallerViewController alloc], "initWithInstallable:punchoutURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "contentTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[VUIAppInstallerViewController setLocalizedContentTitle:](v5, "setLocalizedContentTitle:", v6);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 2)
    {
      v9 = 8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userInterfaceIdiom") != 0;

      v9 = 2 * v11;
    }
    -[VUIAppInstallerViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", v9);
    objc_msgSend(WeakRetained, "setInstallerViewController:", v5);
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "channelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "Presenting app installation flow for channel ID: %@", buf, 0xCu);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_6;
    v15[3] = &unk_1E9F997A0;
    v16 = *(id *)(a1 + 32);
    v17 = v5;
    v18 = WeakRetained;
    v19 = *(id *)(a1 + 48);
    v14 = v5;
    objc_msgSend(v4, "presentViewController:animated:completion:", v14, 1, v15);

  }
}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "channelID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "Beginning app installation flow for channel ID: %@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_7;
  v8[3] = &unk_1E9F9EFB0;
  v4 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v4, "beginInstallingAppWithProgressHandler:completion:", 0, v8);

}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD block[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "channelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v9;
    v18 = 1024;
    v19 = a2;
    v20 = 1024;
    v21 = a3;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "Completed app installation flow for channel ID: %@, success: %d isHeadless:%d", buf, 0x18u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v13 = __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_8;
  v14 = &unk_1E9F98DF0;
  v15 = *(id *)(a1 + 40);
  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (!(_DWORD)a2)
      goto LABEL_8;
    goto LABEL_7;
  }
  v13((uint64_t)block);
  if ((_DWORD)a2)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("VUIFederatedAppDidInstallNotification"), *(_QWORD *)(a1 + 32), 0);

  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "setInstallerViewController:", 0);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v7);

}

void __74__VUIAppInstallCoordinator__installAppWithChannel_punchoutURL_completion___block_invoke_8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (WLKChannelDetails)channelDetails
{
  return self->_channelDetails;
}

- (void)setChannelDetails:(id)a3
{
  objc_storeStrong((id *)&self->_channelDetails, a3);
}

- (NSString)contentTitle
{
  return self->_contentTitle;
}

- (void)setContentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_contentTitle, a3);
}

- (VUIAppInstallerViewController)installerViewController
{
  return self->_installerViewController;
}

- (void)setInstallerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_installerViewController, a3);
}

- (VUIAccessViewController)accessViewController
{
  return self->_accessViewController;
}

- (void)setAccessViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accessViewController, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_accessViewController, 0);
  objc_storeStrong((id *)&self->_installerViewController, 0);
  objc_storeStrong((id *)&self->_contentTitle, 0);
  objc_storeStrong((id *)&self->_channelDetails, 0);
}

@end
