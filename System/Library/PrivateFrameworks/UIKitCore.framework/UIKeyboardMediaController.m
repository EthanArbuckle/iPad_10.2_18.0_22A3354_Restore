@implementation UIKeyboardMediaController

+ (id)sharedKeyboardMediaController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIKeyboardMediaController_sharedKeyboardMediaController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7D8C0 != -1)
    dispatch_once(&qword_1ECD7D8C0, block);
  return (id)_MergedGlobals_1028;
}

void __58__UIKeyboardMediaController_sharedKeyboardMediaController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1028;
  _MergedGlobals_1028 = (uint64_t)v1;

}

void __48__UIKeyboardMediaController_dismissCardIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeFromParentViewController");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didDismissCardForKeyboardMediaController:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)releaseRecentlyUsedMediaViewIfNeeded
{
  UIViewController *recentlyUsedMediaViewController;
  void *v4;
  UIViewController *v5;

  self->_hasRequestedRecentlyUsedMediaViewController = 0;
  recentlyUsedMediaViewController = self->_recentlyUsedMediaViewController;
  if (recentlyUsedMediaViewController)
  {
    -[UIViewController willMoveToParentViewController:](recentlyUsedMediaViewController, "willMoveToParentViewController:", 0);
    -[UIViewController view](self->_recentlyUsedMediaViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_recentlyUsedMediaViewController, "removeFromParentViewController");
    v5 = self->_recentlyUsedMediaViewController;
    self->_recentlyUsedMediaViewController = 0;

  }
}

- (void)dismissCardIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboardMediaController_dismissCardIfNeeded__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)handleStickerSuggestionWithTISticker:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _UIStickerRepresentation *v8;
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
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  dispatch_semaphore_t v29;
  const __CFData *v30;
  CGImage *ImageFromData;
  UIImage *v32;
  NSObject *v33;
  CGImage *v34;
  void *v35;
  void *v36;
  void *v37;
  _UIStickerUsageEvent *v38;
  void *v39;
  id v40;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v40, "representations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v59;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v59 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v6);
        v8 = objc_alloc_init(_UIStickerRepresentation);
        objc_msgSend(v7, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStickerRepresentation setData:](v8, "setData:", v9);

        objc_msgSend(v7, "uti");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStickerRepresentation setType:](v8, "setType:", v11);

        objc_msgSend(v7, "role");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStickerRepresentation setRole:](v8, "setRole:", v12);

        objc_msgSend(v7, "size");
        -[_UIStickerRepresentation setSize:](v8, "setSize:");
        objc_msgSend(v44, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v4);
  }

  v43 = (void *)objc_opt_new();
  objc_msgSend(v40, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setIdentifier:", v14);

  objc_msgSend(v43, "setRepresentations:", v44);
  objc_msgSend(v40, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setName:", v15);

  objc_msgSend(v40, "externalURI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setExternalURI:", v16);

  objc_msgSend(v40, "accessibilityLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityLabel:", v17);

  objc_msgSend(v40, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMetadata:", v18);

  objc_msgSend(v40, "searchText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSearchText:", v19);

  objc_msgSend(v40, "accessibilityName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityName:", v20);

  objc_msgSend(v40, "attributionInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAttributionInfo:", v21);

  objc_msgSend(v43, "setEffectType:", objc_msgSend(v40, "effectType"));
  objc_msgSend(v40, "metadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMetadata:", v22);

  v62 = 0;
  v63 = &v62;
  v64 = 0x2050000000;
  v23 = (void *)qword_1ECD7D8C8;
  v65 = qword_1ECD7D8C8;
  if (!qword_1ECD7D8C8)
  {
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = (uint64_t)__getVKCStickerEffectClass_block_invoke;
    v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16B14C0;
    v52 = (void (*)(uint64_t))&v62;
    __getVKCStickerEffectClass_block_invoke((uint64_t)&v48);
    v23 = (void *)v63[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v62, 8);
  objc_msgSend(v24, "effectWithType:", objc_msgSend(v40, "effectType"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "type"))
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v43, "representations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v55;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v55 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v27);
          v29 = dispatch_semaphore_create(0);
          objc_msgSend(v28, "data");
          v30 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          ImageFromData = _UIStickerCreateImageFromData(v30);

          v32 = -[UIImage initWithCGImage:]([UIImage alloc], "initWithCGImage:", ImageFromData);
          CGImageRelease(ImageFromData);
          v48 = 0;
          v49 = (uint64_t)&v48;
          v50 = 0x3032000000;
          v51 = __Block_byref_object_copy__79;
          v52 = __Block_byref_object_dispose__79;
          v53 = 0;
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __66__UIKeyboardMediaController_handleStickerSuggestionWithTISticker___block_invoke;
          v45[3] = &unk_1E16C5408;
          v47 = &v48;
          v33 = v29;
          v46 = v33;
          objc_msgSend(v42, "applyToImage:completion:", v32, v45);
          dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
          v34 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(v49 + 40)), "CGImage");
          objc_msgSend(v28, "type");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "metadata");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          _UIStickerDataFromImageWithMetadata(v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "setData:", v37);
          _Block_object_dispose(&v48, 8);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v25);
    }

  }
  v38 = -[_UIStickerUsageEvent initWithSuggestedSticker:]([_UIStickerUsageEvent alloc], "initWithSuggestedSticker:", v43);
  -[_UIStickerUsageEvent setUsageType:](v38, "setUsageType:", 0);
  -[_UIStickerUsageEvent send](v38, "send");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "insertSticker:", v43);

}

void __66__UIKeyboardMediaController_handleStickerSuggestionWithTISticker___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)shouldPrefetchRemoteView
{
  return !self->_recentlyUsedMediaViewController
      && !self->_hasRequestedRecentlyUsedMediaViewController
      && -[UIKeyboardMediaController recentsViewWillBeVisible](self, "recentsViewWillBeVisible");
}

- (BOOL)recentsViewWillBeVisible
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;

  +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardEmojiCategory categoryForType:](UIKeyboardEmojiCategory, "categoryForType:", objc_msgSend(v2, "selectedCategoryType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "categoryType"))
  {
    v4 = 0;
  }
  else
  {
    +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "emojiCategoryDefaultsIndex:", v3);

    v4 = v6 == 0;
  }

  return v4;
}

- (void)_embedRecentlyUsedMediaViewInView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v6 = a3;
  -[UIViewController parentViewController](self->_recentlyUsedMediaViewController, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIViewController view](self->_recentlyUsedMediaViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](self->_recentlyUsedMediaViewController, "removeFromParentViewController");
  }
  objc_msgSend(v6, "_viewControllerForAncestor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addChildViewController:", self->_recentlyUsedMediaViewController);
  -[UIViewController view](self->_recentlyUsedMediaViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v10, "setFrame:");
  if (v4)
  {
    objc_msgSend(v10, "setAlpha:", 0.0);
    objc_msgSend(v6, "addSubview:", v10);
    -[UIViewController didMoveToParentViewController:](self->_recentlyUsedMediaViewController, "didMoveToParentViewController:", v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__UIKeyboardMediaController__embedRecentlyUsedMediaViewInView_animated___block_invoke;
    v11[3] = &unk_1E16B1B28;
    v12 = v10;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.15);

  }
  else
  {
    objc_msgSend(v6, "addSubview:", v10);
    -[UIViewController didMoveToParentViewController:](self->_recentlyUsedMediaViewController, "didMoveToParentViewController:", v9);
  }

}

uint64_t __72__UIKeyboardMediaController__embedRecentlyUsedMediaViewInView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)showRecentlyUsedMediaInView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_recentlyUsedMediaViewController)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIKeyboardMediaController _setRecentlyUsedMediaViewControllerHostBundleID](self, "_setRecentlyUsedMediaViewControllerHostBundleID");
    -[UIKeyboardMediaController _embedRecentlyUsedMediaViewInView:animated:](self, "_embedRecentlyUsedMediaViewInView:animated:", v5, 0);
  }
  else
  {
    objc_storeWeak((id *)&self->_targetViewAwaitingRecents, v4);
    -[UIKeyboardMediaController _instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:](self, "_instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:", 0);
  }

}

- (void)prefetchRecentsViewControllerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD aBlock[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v16 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E16BAE58;
  v14 = v15;
  v6 = v4;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  -[UIKeyboardMediaController _instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:](self, "_instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:", v7);
  v8 = dispatch_time(0, 200000000);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E16B1BF8;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v15, 8);
}

uint64_t __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__UIKeyboardMediaController_prefetchRecentsViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_instantiateViewServiceRecentlyUsedMediaWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _UIAsyncInvocation *v6;
  _UIAsyncInvocation *recentlyUsedMediaViewControllerRequest;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (!self->_hasRequestedRecentlyUsedMediaViewController)
  {
    self->_hasRequestedRecentlyUsedMediaViewController = 1;
    kdebug_trace();
    perfLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0x35uLL, "remote-view-fetch", "enableTelemetry=YES", buf, 2u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__UIKeyboardMediaController__instantiateViewServiceRecentlyUsedMediaWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E16C5430;
    v8[4] = self;
    v9 = v4;
    +[UIKeyboardMediaServiceRemoteViewController requestInlineViewControllerWithConnectionHandler:](UIKeyboardMediaServiceRemoteViewController, "requestInlineViewControllerWithConnectionHandler:", v8);
    v6 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
    recentlyUsedMediaViewControllerRequest = self->_recentlyUsedMediaViewControllerRequest;
    self->_recentlyUsedMediaViewControllerRequest = v6;

  }
}

void __91__UIKeyboardMediaController__instantiateViewServiceRecentlyUsedMediaWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];

  v6 = a2;
  kdebug_trace();
  perfLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v7, OS_SIGNPOST_INTERVAL_END, 0x35uLL, "remote-view-fetch", "enableTelemetry=YES", v14, 2u);
  }

  if (v6 && !a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_setRecentlyUsedMediaViewControllerHostBundleID");
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));

    if (WeakRetained)
    {
      v9 = *(id **)(a1 + 32);
      v10 = objc_loadWeakRetained(v9 + 5);
      objc_msgSend(v9, "_embedRecentlyUsedMediaViewInView:animated:", v10, 1);

      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), 0);
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = 0;

  }
}

- (void)_setRecentlyUsedMediaViewControllerHostBundleID
{
  const __CFString *v3;
  __CFString *v4;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E16EDF20;
  }
  v4 = (__CFString *)v3;
  -[UIViewController setHostBundleID:](self->_recentlyUsedMediaViewController, "setHostBundleID:", v3);

}

- (void)_keyboardDidChangeFrame:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController serviceViewControllerProxy](self->_remoteCardViewController, "serviceViewControllerProxy");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
      v6 = v5;

      objc_msgSend(v7, "updateCompactCardHeight:", v6);
    }

  }
}

- (void)_displayiMessageAppWithID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputSystemSourceSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *MEMORY[0x1E0DBE310];
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v5, "textOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyboardOutput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCustomInfo:", v7);

    objc_msgSend(v5, "flushOperations");
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__UIKeyboardMediaController__displayiMessageAppWithID___block_invoke;
    v10[3] = &unk_1E16B1B28;
    v11 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v10);
    v5 = v11;
  }

}

void __55__UIKeyboardMediaController__displayiMessageAppWithID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlePayload:withPayloadId:", 0, *(_QWORD *)(a1 + 32));

}

- (void)_tearDownRemoteViews
{
  unint64_t v3;
  BOOL v4;
  id WeakRetained;
  char v6;
  id v7;

  v3 = self->_viewServiceTerminationCount + 1;
  self->_viewServiceTerminationCount = v3;
  v4 = v3 <= 2 && objc_msgSend((id)UIApp, "applicationState") == 0;
  self->_shouldRetryFetchingRecents = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "didTearDownRecentsViewForKeyboardMediaController:", self);

  }
  if (self->_shouldRetryFetchingRecents)
    -[UIKeyboardMediaController prefetchRecentsViewControllerWithCompletion:](self, "prefetchRecentsViewControllerWithCompletion:", 0);
  -[UIKeyboardMediaController releaseRecentlyUsedMediaViewIfNeeded](self, "releaseRecentlyUsedMediaViewIfNeeded");
  -[UIKeyboardMediaController dismissCardIfNeeded](self, "dismissCardIfNeeded");
}

- (void)_presentiMessageApp
{
  const __CFString *v3;

  if (_os_feature_enabled_impl())
    v3 = CFSTR("com.apple.messages.stickers");
  else
    v3 = CFSTR("com.apple.messages.animoji.stickers");
  -[UIKeyboardMediaController _displayiMessageAppWithID:](self, "_displayiMessageAppWithID:", v3);
  -[UIKeyboardMediaController _didPresentCard](self, "_didPresentCard");
}

- (void)presentCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_remoteCardViewControllerRequest)
  {
    -[UIViewController parentViewController](self->_remoteCardViewController, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_dismissCardAnimated, CFSTR("UIKeyboardPrivateInteractiveDismissalDidBeginNotification"), 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardDidChangeFrame_, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);

      +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileSMS"))
        && (+[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "supportsStickerTapbackPayload"),
            v6,
            (v7 & 1) == 0))
      {
        -[UIKeyboardMediaController _presentiMessageApp](self, "_presentiMessageApp");
      }
      else if (_os_feature_enabled_impl())
      {
        v8 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
          objc_msgSend(v9, "forwardStickerEvent_presentCard");
        else
          objc_msgSend(v9, "handleStickerEvent_presentCard");

      }
      else
      {
        -[UIKeyboardMediaController _instantiateCardFromViewService](self, "_instantiateCardFromViewService");
      }

    }
  }
}

- (void)dismissCardAnimated
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateInteractiveDismissalDidBeginNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController serviceViewControllerProxy](self->_remoteCardViewController, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__UIKeyboardMediaController_dismissCardAnimated__block_invoke;
      v6[3] = &unk_1E16B1B28;
      v6[4] = self;
      objc_msgSend(v5, "animateCardHiddenWithCompletion:", v6);
    }

  }
}

uint64_t __48__UIKeyboardMediaController_dismissCardAnimated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissCard");
}

- (void)_instantiateCardFromViewService
{
  _UIAsyncInvocation *v3;
  _UIAsyncInvocation *remoteCardViewControllerRequest;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__UIKeyboardMediaController__instantiateCardFromViewService__block_invoke;
  v5[3] = &unk_1E16C5458;
  v5[4] = self;
  +[UIKeyboardMediaServiceRemoteViewController requestCardViewControllerWithConnectionHandler:](UIKeyboardMediaServiceRemoteViewController, "requestCardViewControllerWithConnectionHandler:", v5);
  v3 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  remoteCardViewControllerRequest = self->_remoteCardViewControllerRequest;
  self->_remoteCardViewControllerRequest = v3;

}

void __60__UIKeyboardMediaController__instantiateCardFromViewService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v6, "serviceViewControllerProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", objc_msgSend(v8, "interfaceOrientation"));
        v10 = v9;

        objc_msgSend(v7, "updateCompactCardHeight:", v10);
      }

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyboardWindow");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "rootViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v30, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v13, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    objc_msgSend(v13, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v23;
    objc_msgSend(v13, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v15;
    objc_msgSend(v13, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v19);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didMoveToParentViewController:", v30);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 16);
    *(_QWORD *)(v20 + 16) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_didPresentCard");
  }

}

- (void)_didPresentCard
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardMediaController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardMediaController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPresentCardForKeyboardMediaController:", self);

  }
}

- (void)pasteImageAtFileHandle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  UIKeyboardMediaController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateRespectingForwardingDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "__isKindOfUIResponder") & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegateAsResponder");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v4, "_responderForEditing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "readDataToEndOfFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIImage _initWithData:preserveScale:]([UIImage alloc], "_initWithData:preserveScale:", v8, 1);
  v10 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v10, "registerObject:visibility:", v9, 3);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_2;
  v21[3] = &unk_1E16B5178;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v10, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.png-sticker"), 0, v21);
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pinItemProviders:expirationDate:", v13, v14);

  objc_msgSend(v7, "targetForAction:withSender:", sel_paste_, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CE288))
    {
      v17 = v16;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v17, "pasteWithCompletionHandler:", &__block_literal_global_188);

      goto LABEL_15;
    }
    if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0CE228))
    {
      v19 = &__block_literal_global_489;
    }
    else
    {
      if (!objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0CE648))
      {
        objc_msgSend(v16, "paste:", 0);
        v20 = dispatch_time(0, 500000000);
        dispatch_after(v20, MEMORY[0x1E0C80D38], &__block_literal_global_514);
        goto LABEL_15;
      }
      v19 = &__block_literal_global_513;
    }
    objc_msgSend(v16, "pasteWithCompletionHandler:", v19);
LABEL_15:
    objc_msgSend(*(id *)(a1 + 40), "_didInsertMedia");
    goto LABEL_16;
  }
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_clearPinnedItemProviders");

LABEL_16:
}

uint64_t __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_3()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_4()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_5()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

void __52__UIKeyboardMediaController_pasteImageAtFileHandle___block_invoke_6()
{
  id v0;

  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_clearPinnedItemProviders");

}

- (void)stageStickerWithFileHandle:(id)a3 url:(id)a4 accessibilityLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  UIKeyboardMediaController *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__UIKeyboardMediaController_stageStickerWithFileHandle_url_accessibilityLabel___block_invoke;
  v14[3] = &unk_1E16B51E8;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __79__UIKeyboardMediaController_stageStickerWithFileHandle_url_accessibilityLabel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputSystemSourceSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
LABEL_7:
      objc_msgSend(*(id *)(a1 + 56), "_didInsertMedia");

      return;
    }
    objc_msgSend(v4, "textOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v14[0] = CFSTR("url");
    v14[1] = CFSTR("accessibilityLabel");
    v8 = *(_QWORD *)(a1 + 48);
    v15[0] = v6;
    v15[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertImageWithFileHandle:typeIdentifier:imageUserInfo:", v7, CFSTR("com.apple.png-sticker"), v9);

    objc_msgSend(v4, "flushOperations");
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "_stickerIsSupportedPayload"))
  {
    v12[0] = CFSTR("url");
    v12[1] = CFSTR("accessibilityLabel");
    v10 = *(_QWORD *)(a1 + 48);
    v13[0] = *(_QWORD *)(a1 + 40);
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handlePayload:withPayloadId:", v4, CFSTR("com.apple.messages.stageSticker"));

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 56), "pasteImageAtFileHandle:", *(_QWORD *)(a1 + 32));
}

- (void)stageSticker:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIKBMediaLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "UIKeyboardMediaController: Staging sticker with identifier %@", (uint8_t *)&v8, 0xCu);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSticker:", v4);

  -[UIKeyboardMediaController _didInsertMedia](self, "_didInsertMedia");
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  _UIKBMediaLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "UIKeyboardMediaController: Staging sticker using old protocol with identifier %@", (uint8_t *)&v20, 0xCu);
  }

  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setIdentifier:", v12);
  objc_msgSend(v18, "setRepresentations:", v16);

  objc_msgSend(v18, "setName:", v15);
  objc_msgSend(v18, "setExternalURI:", v14);

  objc_msgSend(v18, "setAccessibilityLabel:", v13);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertSticker:", v18);

  -[UIKeyboardMediaController _didInsertMedia](self, "_didInsertMedia");
}

- (void)_didInsertMedia
{
  UIKeyboardMediaControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "didInsertMediaForKeyboardMediaController:", self);

  }
}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  if (a3)
  {
    v4 = (void (**)(id, _QWORD))a3;
    v4[2](v4, -[UIKeyboardMediaController _stickerIsSupportedPayload](self, "_stickerIsSupportedPayload") ^ 1);

  }
}

- (BOOL)remoteHandlesRecentsStickerDonation
{
  return !-[UIKeyboardMediaController _stickerIsSupportedPayload](self, "_stickerIsSupportedPayload");
}

- (BOOL)_stickerIsSupportedPayload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardStateDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedPayloadIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.messages.stageSticker"));
  return (char)v2;
}

- (void)requestInsertionPointCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__UIKeyboardMediaController_requestInsertionPointCompletion___block_invoke;
    v6[3] = &unk_1E16B1D18;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __61__UIKeyboardMediaController_requestInsertionPointCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EDE22B80))
  {
    v3 = v22;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v4)
    {
      objc_msgSend(v4, "position");
      objc_msgSend(v3, "closestPositionToPoint:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textRangeFromPosition:toPosition:", v5, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setSelectedTextRange:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "remove");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = 0;

    }
    objc_msgSend(v3, "selectedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "positionWithinRange:farthestInDirection:", v9, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "caretRectForPosition:", v10);
    v13 = v12 + v11 * 0.5;
    v16 = v15 + v14 * 0.5;
    objc_msgSend(v3, "textInputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertPoint:toView:", 0, v13, v16);
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v19 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(v19, v21);

}

- (void)draggedStickerToPoint:(CGPoint)a3
{
  _QWORD block[5];
  CGPoint v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardMediaController_draggedStickerToPoint___block_invoke;
  block[3] = &unk_1E16B4E70;
  v4 = a3;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__UIKeyboardMediaController_draggedStickerToPoint___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _UITextDragCaretView *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EDE22B80))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v15;
      objc_msgSend(v3, "textInputView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "convertPoint:fromView:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
      v6 = v5;
      v8 = v7;

      objc_msgSend(v3, "closestPositionToPoint:", v6, v8 + -35.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textRangeFromPosition:toPosition:", v9, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      if (v11)
      {
        objc_msgSend(v11, "updateToRange:animations:completion:animated:", v10, 0, 0, 1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "frame");
          v17 = CGRectInset(v16, -24.0, -24.0);
          objc_msgSend(v3, "scrollRectToVisible:animated:", 1, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
        }
      }
      else
      {
        objc_msgSend(v3, "setSelectedTextRange:", 0);
        v12 = -[_UITextDragCaretView initWithTextInputView:]([_UITextDragCaretView alloc], "initWithTextInputView:", v3);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 64);
        *(_QWORD *)(v13 + 64) = v12;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "insertAtRange:animations:completion:animated:", v10, 0, 0, 1);
      }

    }
  }

}

- (UIKeyboardMediaControllerDelegate)delegate
{
  return (UIKeyboardMediaControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldRetryFetchingRecents
{
  return self->_shouldRetryFetchingRecents;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropCaret, 0);
  objc_destroyWeak((id *)&self->_targetViewAwaitingRecents);
  objc_storeStrong((id *)&self->_recentlyUsedMediaViewControllerRequest, 0);
  objc_storeStrong((id *)&self->_recentlyUsedMediaViewController, 0);
  objc_storeStrong((id *)&self->_remoteCardViewControllerRequest, 0);
  objc_storeStrong((id *)&self->_remoteCardViewController, 0);
}

@end
