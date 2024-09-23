@implementation RENowPlayingRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  +[REFeature nowPlayingStateFeature](REFeature, "nowPlayingStateFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature currentlyPlayingMediaDonationFeature](REFeature, "currentlyPlayingMediaDonationFeature", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  +[REFeature currentlyPlayingFromAppFeature](REFeature, "currentlyPlayingFromAppFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (RENowPlayingRelevanceProviderManager)initWithQueue:(id)a3
{
  id v4;
  RENowPlayingRelevanceProviderManager *v5;
  void *v6;
  objc_class *v7;
  MPRequestResponseController *v8;
  MPRequestResponseController *requestResponseController;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RENowPlayingRelevanceProviderManager;
  v5 = -[RERelevanceProviderManager initWithQueue:](&v11, sel_initWithQueue_, v4);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getMPRequestResponseControllerClass_softClass;
    v16 = getMPRequestResponseControllerClass_softClass;
    if (!getMPRequestResponseControllerClass_softClass)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getMPRequestResponseControllerClass_block_invoke;
      v12[3] = &unk_24CF8AC38;
      v12[4] = &v13;
      __getMPRequestResponseControllerClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = (MPRequestResponseController *)objc_alloc_init(v7);
    requestResponseController = v5->_requestResponseController;
    v5->_requestResponseController = v8;

    -[MPRequestResponseController setDelegate:](v5->_requestResponseController, "setDelegate:", v5);
  }

  return v5;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  +[REFeature nowPlayingStateFeature](REFeature, "nowPlayingStateFeature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = objc_msgSend(v8, "state") == self->_state;
LABEL_37:
    +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  +[REFeature currentlyPlayingFromAppFeature](REFeature, "currentlyPlayingFromAppFeature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqual:", v12);

  if (!v13)
  {
    if (self->_state != 1
      || (objc_msgSend(v8, "bundleIdentifier"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v20,
          !v20))
    {
      v31 = 0;
LABEL_36:
      v11 = v31;
      goto LABEL_37;
    }
    -[MPRequestResponseController response](self->_requestResponseController, "response");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playerPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "representedBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v23, "isEqualToString:", v24);

    if (!(_DWORD)v22)
    {
      v31 = 0;
LABEL_35:

      goto LABEL_36;
    }
    objc_msgSend(v8, "itemIdentifer");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v31 = 1;
LABEL_34:

      goto LABEL_35;
    }
    -[MPRequestResponseController response](self->_requestResponseController, "response");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tracklist");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "playingItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "metadataObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "song");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "title");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v25 == v29)
    {
      v31 = 1;
      v34 = v25;
      v32 = v63;
LABEL_32:

      goto LABEL_33;
    }
    v62 = v26;
    v30 = objc_msgSend(v25, "isEqual:", v29);

    if ((v30 & 1) != 0)
    {
      v31 = 1;
      v26 = v62;
      v32 = v63;
LABEL_33:

      goto LABEL_34;
    }
    -[MPRequestResponseController response](self->_requestResponseController, "response");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "tracklist");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playingItem");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "metadataObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "song");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "album");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v60 = v35;
    v56 = v36;
    if (v25 == v36)
    {
      v31 = 1;
      v40 = v25;
      v26 = v62;
      v32 = v63;
    }
    else
    {
      v55 = v27;
      v37 = v36;
      v38 = objc_msgSend(v25, "isEqual:", v36);

      if ((v38 & 1) != 0)
      {
        v31 = 1;
        v26 = v62;
        v32 = v63;
        v27 = v55;
        v39 = v56;
LABEL_31:

        v34 = v61;
        goto LABEL_32;
      }
      -[MPRequestResponseController response](self->_requestResponseController, "response");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "tracklist");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "playingItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "metadataObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "song");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "artist");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "name");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v42;
      v53 = v41;
      v50 = v44;
      v51 = v43;
      if (v25 == v45)
      {
        v31 = 1;
      }
      else
      {
        v46 = v45;
        v47 = objc_msgSend(v25, "isEqual:", v45);
        v45 = v46;
        v31 = v47;
      }
      v26 = v62;
      v32 = v63;
      v27 = v55;

      v40 = v54;
    }

    v39 = v56;
    goto LABEL_31;
  }
  -[MPRequestResponseController response](self->_requestResponseController, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "representedBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_state == 1)
  {
    objc_msgSend(v8, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqualToString:", v18);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
  return v33;
}

- (void)resume
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  -[MPRequestResponseController beginAutomaticResponseLoading](self->_requestResponseController, "beginAutomaticResponseLoading");
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v5 = xmmword_24CF8E6F0;
    v6 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getMPAVRoutingControllerActiveSystemRouteDidChangeNotification();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleRoutingControllerActiveSystemRouteDidChange_, v4, 0);

  }
  -[RENowPlayingRelevanceProviderManager _updateActiveRoute](self, "_updateActiveRoute", v5, v6);
}

- (void)pause
{
  void *v3;
  void *v4;

  -[MPRequestResponseController endAutomaticResponseLoading](self->_requestResponseController, "endAutomaticResponseLoading");
  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    getMPAVRoutingControllerActiveSystemRouteDidChangeNotification();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  }
}

- (void)_updatePlaybackState
{
  void *v3;
  unint64_t v4;
  id v5;

  -[RERelevanceProviderManager beginFetchingData](self, "beginFetchingData");
  -[MPRequestResponseController response](self->_requestResponseController, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playbackState = objc_msgSend(v3, "state");

  v4 = self->_playbackState - 1;
  if (v4 <= 5 && ((0x2Bu >> v4) & 1) != 0)
    self->_state = qword_2133E4400[v4];
  -[RERelevanceProviderManager finishFetchingData](self, "finishFetchingData");
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v5);

}

- (void)_updateActiveRoute
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getMPAVRoutingControllerClass_softClass;
  v11 = getMPAVRoutingControllerClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getMPAVRoutingControllerClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMPAVRoutingControllerClass_block_invoke;
    v7[3] = &unk_24CF8AC38;
    v7[4] = &v8;
    __getMPAVRoutingControllerClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke;
  v6[3] = &unk_24CF8E6D0;
  v6[4] = self;
  objc_msgSend(v5, "getProactiveRouteWithCompletion:", v6);
}

void __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke_2;
  v6[3] = &unk_24CF8AB18;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)getMPCPlayerRequestClass_softClass;
  v16 = getMPCPlayerRequestClass_softClass;
  if (!getMPCPlayerRequestClass_softClass)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __getMPCPlayerRequestClass_block_invoke;
    v11 = &unk_24CF8AC38;
    v12 = &v13;
    __getMPCPlayerRequestClass_block_invoke((uint64_t)&v8);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  v4 = objc_alloc_init(v3);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getMPCPlayerPathClass_softClass;
  v16 = getMPCPlayerPathClass_softClass;
  if (!getMPCPlayerPathClass_softClass)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __getMPCPlayerPathClass_block_invoke;
    v11 = &unk_24CF8AC38;
    v12 = &v13;
    __getMPCPlayerPathClass_block_invoke((uint64_t)&v8);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v6, "pathWithRoute:bundleID:playerID:", *(_QWORD *)(a1 + 32), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerPath:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setRequest:", v4);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__RENowPlayingRelevanceProviderManager_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_24CF8B2E0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __77__RENowPlayingRelevanceProviderManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackState");
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestResponseController, 0);
}

@end
