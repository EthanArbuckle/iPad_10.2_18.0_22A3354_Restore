@implementation TVRUINowPlayingController

+ (TVRUINowPlayingController)controllerWithHostingViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHostingViewController:", v4);

  return (TVRUINowPlayingController *)v5;
}

- (TVRUINowPlayingController)initWithHostingViewController:(id)a3
{
  id v5;
  TVRUINowPlayingController *v6;
  void *v7;
  TVRUIUpNextController *v8;
  TVRUIUpNextController *upNextController;
  TVRUINowPlayingViewController *v10;
  TVRUIUpNextController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVRUINowPlayingController;
  v6 = -[TVRUINowPlayingController init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isPad = objc_msgSend(v7, "userInterfaceIdiom") == 1;

    v8 = objc_alloc_init(TVRUIUpNextController);
    upNextController = v6->_upNextController;
    v6->_upNextController = v8;

    objc_storeStrong((id *)&v6->_hostingViewController, a3);
    v10 = objc_alloc_init(TVRUINowPlayingViewController);
    -[TVRUINowPlayingController setNowPlayingViewController:](v6, "setNowPlayingViewController:", v10);

    v11 = v6->_upNextController;
    -[TVRUINowPlayingController nowPlayingViewController](v6, "nowPlayingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUpNextProvider:", v11);

    -[TVRUINowPlayingController nowPlayingViewController](v6, "nowPlayingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSharingProvider:", v6);

  }
  return v6;
}

- (double)bottomSpacingRequired
{
  return 0.0;
}

- (BOOL)capellaInfoAvailable
{
  TVRUINowPlayingController *v2;
  void *v3;

  v2 = self;
  -[TVRUINowPlayingController nowPlayingInfo](self, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[TVRUINowPlayingController isReadyForPresentationWithNowPlayingInfo:](v2, "isReadyForPresentationWithNowPlayingInfo:", v3);

  return (char)v2;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  TVRCNowPlayingInfo *nowPlayingInfo;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TVRCNowPlayingInfo **p_nowPlayingInfo;
  void *v21;
  char v22;
  uint64_t v23;
  TVRCNowPlayingInfo *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  double v34;
  dispatch_time_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  char v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  NSObject *v51;
  _BOOL4 v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD block[5];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "tvrui_isSimplePlaybackRateUpdate"))
    {
      _TVRUINowPlayingLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "playbackRate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v8;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_INFO, "Updating playbackRate to %@", buf, 0xCu);

      }
      objc_msgSend(v6, "playbackRate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCNowPlayingInfo setPlaybackRate:](self->_nowPlayingInfo, "setPlaybackRate:", v9);

    }
    else if (objc_msgSend(v6, "tvrui_isSimplePlaybackStateUpdate"))
    {
      _TVRUINowPlayingLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "playbackState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v12;
        _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_INFO, "Updating playbackState to %@", buf, 0xCu);

      }
      objc_msgSend(v6, "playbackState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCNowPlayingInfo setPlaybackState:](self->_nowPlayingInfo, "setPlaybackState:", v13);

    }
    else if (objc_msgSend(v6, "tvrui_isSimpleCaptionStateUpdate"))
    {
      _TVRUINowPlayingLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "captionsEnabled");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hasValidCaptionOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = v15;
        v60 = 2112;
        v61 = v16;
        _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_INFO, "Updating captionsEnabled to %@; hasValidCaptionsOptoins to %@",
          buf,
          0x16u);

      }
      objc_msgSend(v6, "captionsEnabled");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCNowPlayingInfo setCaptionsEnabled:](self->_nowPlayingInfo, "setCaptionsEnabled:", v17);

      objc_msgSend(v6, "hasValidCaptionOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRCNowPlayingInfo setHasValidCaptionOptions:](self->_nowPlayingInfo, "setHasValidCaptionOptions:", v18);

    }
    else
    {
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      p_nowPlayingInfo = &self->_nowPlayingInfo;
      -[TVRCNowPlayingInfo identifier](self->_nowPlayingInfo, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "isEqualToString:", v21);

      if ((v22 & 1) != 0)
      {
        -[TVRCNowPlayingInfo nowPlayingInfoMergedWithNowPlayingInfo:](*p_nowPlayingInfo, "nowPlayingInfoMergedWithNowPlayingInfo:", v6);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *p_nowPlayingInfo;
        *p_nowPlayingInfo = (TVRCNowPlayingInfo *)v23;

        _TVRUINowPlayingLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          -[TVRCNowPlayingInfo metadata](*p_nowPlayingInfo, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "canonicalID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v59 = v27;
          _os_log_impl(&dword_21B042000, v25, OS_LOG_TYPE_INFO, "Updating nowPlayingInfo (identifiers remained the same; merging info) for canonicalID=%@",
            buf,
            0xCu);

        }
      }
      else
      {
        _TVRUINowPlayingLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRCNowPlayingInfo identifier](*p_nowPlayingInfo, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = v29;
          v60 = 2112;
          v61 = v30;
          _os_log_impl(&dword_21B042000, v28, OS_LOG_TYPE_INFO, "Updating nowPlayingInfo via identified change %@ -> %@", buf, 0x16u);

        }
        objc_msgSend(v6, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "length"))
        {
          -[TVRCNowPlayingInfo identifier](*p_nowPlayingInfo, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "length") == 0;

          objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
          if (!v33)
          {
            +[TVRUIUpNextController refreshDelayOnMediaDidChangeTimeInterval](TVRUIUpNextController, "refreshDelayOnMediaDidChangeTimeInterval");
            v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke;
            block[3] = &unk_24DE2C198;
            block[4] = self;
            dispatch_after(v35, MEMORY[0x24BDAC9B8], block);
          }
        }
        else
        {

          objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
        }
      }
    }
    objc_msgSend(v6, "tvrui_effectiveCanonicalID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v6, "metadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isMissingCriticalMetadata");

      v40 = v39 ^ 1;
    }
    else
    {
      v40 = 1;
    }

    if (objc_msgSend(v36, "length"))
      v41 = v40;
    else
      v41 = 1;
    if ((v41 & 1) != 0)
    {
      -[TVRUINowPlayingController nowPlayingInfo](self, "nowPlayingInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUINowPlayingController _updateNowPlayingUIWithNowPlayingInfo:](self, "_updateNowPlayingUIWithNowPlayingInfo:", v42);

    }
    else
    {
      -[TVRUINowPlayingController cachedMediaInfo](self, "cachedMediaInfo");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v36, "isEqualToString:", v44);

      if (v45)
      {
        -[TVRCNowPlayingInfo metadata](self->_nowPlayingInfo, "metadata");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRUINowPlayingController cachedMediaInfo](self, "cachedMediaInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "metadataMergedFromTVRCMediaInfo:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRCNowPlayingInfo setMetadata:](self->_nowPlayingInfo, "setMetadata:", v48);

        -[TVRUINowPlayingController _updateNowPlayingUIWithNowPlayingInfo:](self, "_updateNowPlayingUIWithNowPlayingInfo:", self->_nowPlayingInfo);
      }
      else
      {
        -[TVRUINowPlayingController canonicalIDOfCurrentUTSRequest](self, "canonicalIDOfCurrentUTSRequest");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v36, "isEqualToString:", v49);

        _TVRUINowPlayingLog();
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);
        if (v50)
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v36;
            _os_log_impl(&dword_21B042000, v51, OS_LOG_TYPE_INFO, "Already requesting metadata from UTS for canonicalID=%@ ... will not request again.", buf, 0xCu);
          }

        }
        else
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v36;
            _os_log_impl(&dword_21B042000, v51, OS_LOG_TYPE_INFO, "Requesting metadata from UTS for canonicalID=%@", buf, 0xCu);
          }

          -[TVRUINowPlayingController setCanonicalIDOfCurrentUTSRequest:](self, "setCanonicalIDOfCurrentUTSRequest:", v36);
          v53 = objc_alloc_init(MEMORY[0x24BEB40E0]);
          objc_initWeak((id *)buf, self);
          v54[0] = MEMORY[0x24BDAC760];
          v54[1] = 3221225472;
          v54[2] = __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4;
          v54[3] = &unk_24DE2D7C8;
          objc_copyWeak(&v56, (id *)buf);
          v54[4] = self;
          v55 = v36;
          objc_msgSend(v53, "requestForCanonicalID:completion:", v55, v54);

          objc_destroyWeak(&v56);
          objc_destroyWeak((id *)buf);

        }
      }
    }

  }
  else
  {
    nowPlayingInfo = self->_nowPlayingInfo;
    self->_nowPlayingInfo = 0;

  }
}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "upNextController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "refresh");

}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCanonicalIDOfCurrentUTSRequest:", 0);
    if (v6)
    {
      _TVRUINowPlayingLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "canonicalID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "setCachedMediaInfo:", v5);
        objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "metadata");
        v9 = objc_claimAutoreleasedReturnValue();

        -[NSObject metadataMergedFromTVRCMediaInfo:](v9, "metadataMergedFromTVRCMediaInfo:", v5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "nowPlayingInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setMetadata:", v22);

        v24 = *(void **)(a1 + 32);
        objc_msgSend(v24, "nowPlayingInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_updateNowPlayingUIWithNowPlayingInfo:", v25);

        _TVRUINowPlayingLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = *(_QWORD *)(a1 + 40);
          v29 = 138412290;
          v30 = v27;
          _os_log_impl(&dword_21B042000, v26, OS_LOG_TYPE_INFO, "Received metadata from UTS for canonicalID=%@", (uint8_t *)&v29, 0xCu);
        }

      }
      else
      {
        _TVRUINowPlayingLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v28 = *(_QWORD *)(a1 + 40);
          v29 = 138412290;
          v30 = v28;
          _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_INFO, "Received metadata from UTS but request canonicalID=%@ has changed so discarding info", (uint8_t *)&v29, 0xCu);
        }
      }
    }

  }
}

- (unint64_t)currentModalContext
{
  if (-[TVRUINowPlayingController _upNextViewControllerIsPresented](self, "_upNextViewControllerIsPresented"))
    return 2;
  else
    return -[TVRUINowPlayingController _nowPlayingViewControllerIsPresented](self, "_nowPlayingViewControllerIsPresented");
}

- (void)shareItem:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v18 = a3;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BE8F650]);

  v14 = (void *)objc_msgSend(v12, "copy", v18, v19);
  v15 = (void *)objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v14, 0);

  if (-[TVRUINowPlayingController isPad](self, "isPad"))
  {
    objc_msgSend(v15, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSourceView:", v9);
    objc_msgSend(v15, "setOverrideUserInterfaceStyle:", 2);
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else
  {
    objc_msgSend(v8, "presentViewController:animated:completion:", v15, 1, 0);
  }

}

- (void)openURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    if (-[TVRUINowPlayingController isPad](self, "isPad"))
      -[TVRUINowPlayingController dismissModalUI](self, "dismissModalUI");
    v5 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    v8 = *MEMORY[0x24BE38310];
    v9[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFrontBoardOptions:", v6);

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:configuration:completionHandler:", v4, v5, &__block_literal_global_17);

  }
}

void __37__TVRUINowPlayingController_openURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (v3)
  {
    _TVRUINowPlayingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37__TVRUINowPlayingController_openURL___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)setDevice:(id)a3
{
  void *v5;
  void *v6;
  TVRUIDevice *v7;

  v7 = (TVRUIDevice *)a3;
  if (self->_device != v7)
  {
    objc_storeStrong((id *)&self->_device, a3);
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveDevice:", v7);

    -[TVRUINowPlayingController upNextController](self, "upNextController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveDevice:", v7);

  }
}

- (void)infoButtonWasTapped
{
  if (!-[TVRUINowPlayingController _nowPlayingViewControllerIsPresented](self, "_nowPlayingViewControllerIsPresented"))
  {
    -[TVRUINowPlayingController _refreshUpNextInfosIfNeeded](self, "_refreshUpNextInfosIfNeeded");
    -[TVRUINowPlayingController _presentNowPlayingAnimated:](self, "_presentNowPlayingAnimated:", 1);
  }
}

- (void)displayUpNext
{
  OUTLINED_FUNCTION_0_0(&dword_21B042000, a1, a3, "Could not display Up Next as there was no active device.", a5, a6, a7, a8, 0);
}

- (void)dismissModalUI
{
  if (-[TVRUINowPlayingController _nowPlayingViewControllerIsPresented](self, "_nowPlayingViewControllerIsPresented"))
  {
    -[TVRUINowPlayingController _dismissNowPlayingViewControllerAnimated:](self, "_dismissNowPlayingViewControllerAnimated:", 0);
  }
  else if (-[TVRUINowPlayingController _upNextViewControllerIsPresented](self, "_upNextViewControllerIsPresented"))
  {
    -[TVRUINowPlayingController _dismissUpNextViewControllerAnimated:](self, "_dismissUpNextViewControllerAnimated:", 0);
  }
}

- (BOOL)_nowPlayingViewControllerIsPresented
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TVRUINowPlayingController isPad](self, "isPad"))
    -[TVRUINowPlayingController nowPlayingNavController](self, "nowPlayingNavController");
  else
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (BOOL)_upNextViewControllerIsPresented
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[TVRUINowPlayingController upNextNavController](self, "upNextNavController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_updateNowPlayingUIWithNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, BOOL);

  v4 = a3;
  -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNowPlayingInfo:", v4);

  -[TVRUINowPlayingController capellaInfoDidChangeHandler](self, "capellaInfoDidChangeHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TVRUINowPlayingController capellaInfoDidChangeHandler](self, "capellaInfoDidChangeHandler");
    v7 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
    v7[2](v7, -[TVRUINowPlayingController capellaInfoAvailable](self, "capellaInfoAvailable"));

  }
}

- (void)setCommandHandler:(id)a3
{
  id v4;
  void *v5;
  id commandHandler;
  id v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  commandHandler = self->_commandHandler;
  self->_commandHandler = v5;

  -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCommandHandler:", v4);

}

- (id)actionButtonMenu
{
  void *v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  _QWORD v43[2];
  void *v44;
  _QWORD v45[5];

  v45[3] = *MEMORY[0x24BDAC8D0];
  if (+[TVRUIFeatures replaceMuteButtonWithContextMenu](TVRUIFeatures, "replaceMuteButtonWithContextMenu"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIMute"), &stru_24DE30718, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("speaker.slash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke;
    v40[3] = &unk_24DE2C440;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUINowPlayingController device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v7, "supportsMute");

    if ((v4 & 1) == 0)
      objc_msgSend(v33, "setAttributes:", 1);
    v8 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIControlCenter"), &stru_24DE30718, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("switch.2"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_2;
    v38[3] = &unk_24DE2C440;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TVRemoteUISearch"), &stru_24DE30718, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("magnifyingglass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_3;
    v36[3] = &unk_24DE2C440;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIOpenUpNext"), &stru_24DE30718, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("list.bullet"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_4;
    v34[3] = &unk_24DE2C440;
    objc_copyWeak(&v35, &location);
    objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v21, 0, v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BEBD748];
    v45[0] = v33;
    v45[1] = v12;
    v45[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", &stru_24DE30718, 0, 0, 1, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setPreferredElementSize:", 1);
    v26 = (void *)MEMORY[0x24BEBD748];
    v44 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "menuWithTitle:image:identifier:options:children:", &stru_24DE30718, 0, 0, 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BEBD748];
    v43[0] = v25;
    v43[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "menuWithChildren:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v31 = 0;
  }
  return v31;
}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCommandHandlerWithCommand:", 8);

}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCommandHandlerWithCommand:", 9);

}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invokeCommandHandlerWithCommand:", 12);

}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentUpNext");

}

- (UINavigationController)nowPlayingNavController
{
  id v3;
  void *v4;
  UINavigationController *v5;
  UINavigationController *nowPlayingNavController;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (-[TVRUINowPlayingController isPad](self, "isPad") && !self->_nowPlayingNavController)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD7A0]);
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UINavigationController *)objc_msgSend(v3, "initWithRootViewController:", v4);
    nowPlayingNavController = self->_nowPlayingNavController;
    self->_nowPlayingNavController = v5;

    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x24BEBD410]);
    v8 = (void *)MEMORY[0x24BEBD388];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __52__TVRUINowPlayingController_nowPlayingNavController__block_invoke;
    v16 = &unk_24DE2C440;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v8, "actionWithHandler:", &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 0, v9, v13, v14, v15, v16);

    -[TVRUINowPlayingViewController navigationItem](self->_nowPlayingViewController, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

    -[TVRUINowPlayingViewController setOverrideUserInterfaceStyle:](self->_nowPlayingViewController, "setOverrideUserInterfaceStyle:", 2);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return self->_nowPlayingNavController;
}

void __52__TVRUINowPlayingController_nowPlayingNavController__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "nowPlayingNavController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UINavigationController)upNextNavController
{
  UINavigationController *upNextNavController;
  TVRUIUpNextViewController *v4;
  void *v5;
  UINavigationController *v6;
  UINavigationController *v7;

  upNextNavController = self->_upNextNavController;
  if (!upNextNavController)
  {
    v4 = objc_alloc_init(TVRUIUpNextViewController);
    -[TVRUIUpNextViewController setMode:](v4, "setMode:", 1);
    -[TVRUINowPlayingController upNextController](self, "upNextController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIUpNextViewController setUpNextProvider:](v4, "setUpNextProvider:", v5);

    -[TVRUIUpNextViewController setSharingProvider:](v4, "setSharingProvider:", self);
    v6 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v4);
    v7 = self->_upNextNavController;
    self->_upNextNavController = v6;

    -[UINavigationController setOverrideUserInterfaceStyle:](self->_upNextNavController, "setOverrideUserInterfaceStyle:", 2);
    upNextNavController = self->_upNextNavController;
  }
  return upNextNavController;
}

- (void)_refreshUpNextInfosIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[TVRUINowPlayingController upNextController](self, "upNextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[TVRUINowPlayingController upNextController](self, "upNextController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refresh");

  }
}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3
{
  -[TVRUINowPlayingController _invokeCommandHandlerWithCommand:paramDict:](self, "_invokeCommandHandlerWithCommand:paramDict:", a3, MEMORY[0x24BDBD1B8]);
}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 paramDict:(id)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;
  id v9;

  v9 = a4;
  -[TVRUINowPlayingController commandHandler](self, "commandHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TVRUINowPlayingController commandHandler](self, "commandHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = v9;
    else
      v8 = (id)MEMORY[0x24BDBD1B8];
    ((void (**)(_QWORD, unint64_t, id))v7)[2](v7, a3, v8);

  }
}

- (BOOL)isReadyForPresentationWithNowPlayingInfo:(id)a3
{
  id v3;
  int v4;
  int v5;
  char v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "tvrui_hasMetadata");
  v5 = objc_msgSend(v3, "tvrui_hasArtworkImage");
  v6 = objc_msgSend(v3, "tvrui_mediaIsStopped");
  objc_msgSend(v3, "tvrui_effectiveCanonicalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  v9 = (v8 != 0) & ~v6;
  if (!v5)
    v9 = 0;
  return v4 && v9;
}

- (void)presentModalContext:(unint64_t)a3 animated:(BOOL)a4
{
  if (a3 == 1)
  {
    -[TVRUINowPlayingController _presentNowPlayingAnimated:](self, "_presentNowPlayingAnimated:", a4);
  }
  else if (a3 == 2)
  {
    -[TVRUINowPlayingController _presentUpNextAnimated:](self, "_presentUpNextAnimated:", a4);
  }
}

- (void)_presentNowPlayingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[TVRUINowPlayingController isPad](self, "isPad"))
    -[TVRUINowPlayingController nowPlayingNavController](self, "nowPlayingNavController");
  else
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUINowPlayingController _presentViewController:animated:completion:](self, "_presentViewController:animated:completion:", v5, v3, 0);

}

- (void)_presentUpNext
{
  -[TVRUINowPlayingController _presentUpNextAnimated:](self, "_presentUpNextAnimated:", 1);
}

- (void)_presentUpNextAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  -[TVRUINowPlayingController upNextNavController](self, "upNextNavController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__TVRUINowPlayingController__presentUpNextAnimated___block_invoke;
  v6[3] = &unk_24DE2C198;
  v6[4] = self;
  -[TVRUINowPlayingController _presentViewController:animated:completion:](self, "_presentViewController:animated:completion:", v5, v3, v6);

}

void __52__TVRUINowPlayingController__presentUpNextAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "upNextController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsRefresh");

  objc_msgSend(*(id *)(a1 + 32), "upNextController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshIfNeeded");

}

- (void)_dismissNowPlayingViewController
{
  -[TVRUINowPlayingController _dismissNowPlayingViewControllerAnimated:](self, "_dismissNowPlayingViewControllerAnimated:", 1);
}

- (void)_dismissNowPlayingViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[TVRUINowPlayingController isPad](self, "isPad"))
    -[TVRUINowPlayingController nowPlayingNavController](self, "nowPlayingNavController");
  else
    -[TVRUINowPlayingController nowPlayingViewController](self, "nowPlayingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, 0);

}

- (void)_dismissUpNextViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TVRUINowPlayingController upNextNavController](self, "upNextNavController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v3, 0);

}

- (unint64_t)_layoutStyleForViewServiceLaunchContext:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 5) < 2 || a3 == 2)
    return 2;
  if (a3 != 3)
    return 1;
  if (-[TVRUINowPlayingController isPad](self, "isPad", v3, v4))
    return 2;
  return 1;
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  if (-[TVRUINowPlayingController isPad](self, "isPad"))
  {
    objc_msgSend(v9, "setTransitioningDelegate:", self);
    objc_msgSend(v9, "setModalPresentationStyle:", 4);
    -[TVRUINowPlayingController hostingViewController](self, "hostingViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v9, v5, v8);
  }
  else
  {
    objc_msgSend(v9, "sheetPresentationController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrefersGrabberVisible:", 1);
    objc_msgSend(v9, "setModalPresentationStyle:", 1);
    -[TVRUINowPlayingController hostingViewController](self, "hostingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v8);

    v8 = v9;
    v9 = v10;
  }

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TVRUIControlCenterSheetPresentationController *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_TVRUIControlCenterSheetPresentationController initWithPresentedViewController:presentingViewController:]([_TVRUIControlCenterSheetPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v10, v9);

  -[_TVRUIControlCenterSheetPresentationController setSourceViewController:](v11, "setSourceViewController:", v8);
  -[_TVRUIControlCenterSheetPresentationController setLayoutStyle:](v11, "setLayoutStyle:", -[TVRUINowPlayingController _layoutStyleForViewServiceLaunchContext:](self, "_layoutStyleForViewServiceLaunchContext:", -[TVRUINowPlayingController viewServiceLaunchContext](self, "viewServiceLaunchContext")));
  return v11;
}

- (UIViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (int64_t)viewServiceLaunchContext
{
  return self->_viewServiceLaunchContext;
}

- (void)setViewServiceLaunchContext:(int64_t)a3
{
  self->_viewServiceLaunchContext = a3;
}

- (BOOL)showsCastTab
{
  return self->_showsCastTab;
}

- (void)setShowsCastTab:(BOOL)a3
{
  self->_showsCastTab = a3;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (id)capellaInfoDidChangeHandler
{
  return self->_capellaInfoDidChangeHandler;
}

- (void)setCapellaInfoDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TVRUIUpNextController)upNextController
{
  return self->_upNextController;
}

- (void)setUpNextController:(id)a3
{
  objc_storeStrong((id *)&self->_upNextController, a3);
}

- (TVRUINowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, a3);
}

- (void)setNowPlayingNavController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingNavController, a3);
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (TVRCMediaInfo)cachedMediaInfo
{
  return self->_cachedMediaInfo;
}

- (void)setCachedMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMediaInfo, a3);
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (NSString)canonicalIDOfCurrentUTSRequest
{
  return self->_canonicalIDOfCurrentUTSRequest;
}

- (void)setCanonicalIDOfCurrentUTSRequest:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalIDOfCurrentUTSRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalIDOfCurrentUTSRequest, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cachedMediaInfo, 0);
  objc_storeStrong((id *)&self->_nowPlayingNavController, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong(&self->_capellaInfoDidChangeHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_upNextNavController, 0);
}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21B042000, a2, a3, "Error when requested media info from UTS: %@", a5, a6, a7, a8, 2u);
}

void __37__TVRUINowPlayingController_openURL___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_21B042000, a2, a3, "Failed to openURL: %@", a5, a6, a7, a8, 2u);
}

@end
