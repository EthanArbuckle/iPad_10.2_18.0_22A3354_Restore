@implementation SHQuickNoteActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.sharing.quick-note");
}

- (SHQuickNoteActivity)init
{
  SHQuickNoteActivity *v2;
  SHQuickNoteActivity *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queryQueue;
  NSObject *v8;
  uint64_t v9;
  SHQuickNoteActivity *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD block[4];
  SHQuickNoteActivity *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SHQuickNoteActivity;
  v2 = -[UIActivity init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned __int8 *)&v2->_isQuickNoteExtensionInstalled);
    atomic_store(0, (unsigned __int8 *)&v2->_canOpenFromManagedToUnmanaged);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("com.apple.sharing.QuickNote", v5);
    queryQueue = v3->_queryQueue;
    v3->_queryQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_queryQueue;
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SHQuickNoteActivity_init__block_invoke;
    block[3] = &unk_1E4001608;
    v10 = v3;
    v18 = v10;
    dispatch_async(v8, block);
    objc_msgSend(MEMORY[0x1E0CA5920], "_currentUserActivityUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->__hasUserActivityCurrent = v11 != 0;
    if (v11)
    {
      location = 0;
      objc_initWeak(&location, v10);
      v12 = (void *)MEMORY[0x1E0CA5920];
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __27__SHQuickNoteActivity_init__block_invoke_2;
      v14[3] = &unk_1E4002FE0;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v12, "_fetchUserActivityWithUUID:completionHandler:", v11, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
  return v3;
}

void __27__SHQuickNoteActivity_init__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v21 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getMCProfileConnectionClass_block_invoke;
    v16 = &unk_1E4001370;
    v17 = &v18;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v13);
    v2 = (void *)v19[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v3, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  atomic_store(objc_msgSend(v4, "mayOpenFromManagedToUnmanaged"), (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 129));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)get_EXQueryClass_softClass;
  v21 = get_EXQueryClass_softClass;
  if (!get_EXQueryClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __get_EXQueryClass_block_invoke;
    v16 = &unk_1E4001370;
    v17 = &v18;
    __get_EXQueryClass_block_invoke((uint64_t)&v13);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v7 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleIdentifier == %@"), CFSTR("com.apple.mobilenotes.EditorExtension"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithExtensionPointIdentifier:predicate:", CFSTR("com.apple.private.system-paper"), v8);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v10 = (void *)get_EXQueryControllerClass_softClass;
  v21 = get_EXQueryControllerClass_softClass;
  if (!get_EXQueryControllerClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __get_EXQueryControllerClass_block_invoke;
    v16 = &unk_1E4001370;
    v17 = &v18;
    __get_EXQueryControllerClass_block_invoke((uint64_t)&v13);
    v10 = (void *)v19[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v11, "executeQuery:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  atomic_store(objc_msgSend(v12, "count") != 0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));

}

void __27__SHQuickNoteActivity_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SHQuickNoteActivity_init__block_invoke_3;
  block[3] = &unk_1E4002FB8;
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __27__SHQuickNoteActivity_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *WeakRetained;
  uint64_t *v8;
  uint64_t v9;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v4 = getSYIsLinkableUserActivitySymbolLoc_ptr;
    v14 = getSYIsLinkableUserActivitySymbolLoc_ptr;
    if (!getSYIsLinkableUserActivitySymbolLoc_ptr)
    {
      v5 = (void *)SynapseLibrary();
      v4 = dlsym(v5, "SYIsLinkableUserActivity");
      v12[3] = (uint64_t)v4;
      getSYIsLinkableUserActivitySymbolLoc_ptr = v4;
    }
    _Block_object_dispose(&v11, 8);
    if (!v4)
    {
      v10 = (_Unwind_Exception *)__85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v10);
    }
    v6 = ((uint64_t (*)(id))v4)(v3);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject set_hasUserActivityCurrent:](WeakRetained, "set_hasUserActivityCurrent:", v6, v11);
  }
  else
  {
    v8 = (uint64_t *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 40))
      return;
    SHQuickNoteLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __27__SHQuickNoteActivity_init__block_invoke_3_cold_1(v8, WeakRetained, v9);
  }

}

- (BOOL)isQuickNoteExtensionInstalled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isQuickNoteExtensionInstalled);
  return v2 & 1;
}

- (BOOL)canOpenFromManagedToUnmanaged
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_canOpenFromManagedToUnmanaged);
  return v2 & 1;
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  if (-[SHQuickNoteActivity _hasSupportedShareableItems](self, "_hasSupportedShareableItems")
    || -[SHQuickNoteActivity _hasUserActivityCurrent](self, "_hasUserActivityCurrent"))
  {
    _ShareSheetBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AddToNewQuickNote[Activity]");
    v6 = CFSTR("Add to New Quick Note");
  }
  else
  {
    _ShareSheetBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("NewQuickNote[Activity]");
    v6 = CFSTR("New Quick Note");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_systemImageName
{
  return CFSTR("quicknote");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(MEMORY[0x1E0D97420], "isSWYActivityItemProvider:", v9) & 1) != 0)
        {

          goto LABEL_24;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (!-[SHQuickNoteActivity canOpenFromManagedToUnmanaged](self, "canOpenFromManagedToUnmanaged"))
  {
    SHQuickNoteLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_INFO, "Can't perform Quick Note activity from managed app.", v28, 2u);
    }

    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  v21 = 0;
  if (v11 || !v12)
    goto LABEL_25;
  if (((!-[SHQuickNoteActivity isQuickNoteExtensionInstalled](self, "isQuickNoteExtensionInstalled") | v16 | v20) & 1) != 0
    || (v22 = _UIActivityItemCountOfType(v4, 2), v22 > 5))
  {
LABEL_24:
    v21 = 0;
    goto LABEL_25;
  }
  v23 = v22;
  v24 = _UIActivityHasAtMoreThan(v4, 4, 0);
  v25 = v23 > 0 || v24;
  -[SHQuickNoteActivity set_hasSupportedShareableItems:](self, "set_hasSupportedShareableItems:", v25);
  v21 = -[SHQuickNoteActivity _hasUserActivityCurrent](self, "_hasUserActivityCurrent")
     || objc_msgSend(v4, "count") != 0;
LABEL_25:

  return v21;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  void *v13;
  char isKindOfClass;
  id v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIActivityItemsGetWebURLs(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHQuickNoteActivity set_urls:](self, "set_urls:", v5);

  _UIActivityItemsGetImages(v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHQuickNoteActivity set_images:](self, "set_images:", v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = (const __CFString *)*MEMORY[0x1E0CA5B90];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (isKindOfClass & 1) != 0)
        {
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = v13;
          }
          v16 = v15;
          _UIActivityUTIForURL(v15);
          v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v18 = (__CFString *)v17;
          if (v17 && UTTypeConformsTo(v17, v11))
            objc_msgSend(v19, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[SHQuickNoteActivity set_imageFileURLs:](self, "set_imageFileURLs:", v19);
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  UIImage *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  Class (*v42)(uint64_t);
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = -[SHQuickNoteActivity isQuickNoteExtensionInstalled](self, "isQuickNoteExtensionInstalled");
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v10 = (void *)getSYNotesActivationRequestClass_softClass;
  v48 = getSYNotesActivationRequestClass_softClass;
  if (!getSYNotesActivationRequestClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getSYNotesActivationRequestClass_block_invoke;
    v43 = &unk_1E4001370;
    v44 = &v45;
    __getSYNotesActivationRequestClass_block_invoke((uint64_t)&v40);
    v10 = (void *)v46[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v45, 8);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setShouldAutoInsertLinkToCurrentActivity:", -[SHQuickNoteActivity _hasUserActivityCurrent](self, "_hasUserActivityCurrent"));
  if (v9)
  {
    -[SHQuickNoteActivity _urls](self, "_urls");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") == 0;

    if (!v14)
    {
      -[SHQuickNoteActivity _urls](self, "_urls");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addURLs:", v15);

    }
    -[SHQuickNoteActivity _images](self, "_images");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count") == 0;

    if (!v17)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      -[SHQuickNoteActivity _images](self, "_images");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v18);
            v22 = *(UIImage **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if (-[UIImage imageOrientation](v22, "imageOrientation"))
              UIImageJPEGRepresentation(v22, 0.9);
            else
              UIImagePNGRepresentation(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              objc_msgSend(v12, "addImageData:", v23);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        }
        while (v19);
      }

    }
    -[SHQuickNoteActivity _imageFileURLs](self, "_imageFileURLs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count") == 0;

    if (!v25)
    {
      -[SHQuickNoteActivity _imageFileURLs](self, "_imageFileURLs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addImageFileURLs:", v26);

    }
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v27 = (void *)getSYNotesActivationCommandClass_softClass;
  v48 = getSYNotesActivationCommandClass_softClass;
  if (!getSYNotesActivationCommandClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getSYNotesActivationCommandClass_block_invoke;
    v43 = &unk_1E4001370;
    v44 = &v45;
    __getSYNotesActivationCommandClass_block_invoke((uint64_t)&v40);
    v27 = (void *)v46[3];
  }
  v28 = objc_retainAutorelease(v27);
  _Block_object_dispose(&v45, 8);
  v29 = objc_alloc_init(v28);
  objc_msgSend(v29, "setActivationRequest:", v12);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke;
  v33[3] = &unk_1E4003008;
  v33[4] = self;
  v34 = v7;
  v35 = v8;
  v30 = v8;
  v31 = v7;
  objc_msgSend(v29, "activateWithCompletion:", v33);

  return 1;
}

void __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    SHQuickNoteLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1((uint64_t)v3, v4, v5);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_37;
  block[3] = &unk_1E4001A88;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_37(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureQuickNotePresentationDelegateWithPresenterViewController:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_configureQuickNotePresentationDelegateWithPresenterViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    while (1)
    {
      NSClassFromString(CFSTR("ICSystemPaperExtensionHostViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "presentedViewController");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_7;
    }
    -[SHQuickNoteActivity setSystemPaperViewController:](self, "setSystemPaperViewController:", v5);

  }
LABEL_7:
  -[SHQuickNoteActivity systemPaperViewController](self, "systemPaperViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[SHQuickNoteActivity systemPaperViewController](self, "systemPaperViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isBeingDismissed"),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    -[SHQuickNoteActivity systemPaperViewController](self, "systemPaperViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPresentationDelegate:", self);

  }
  else
  {
    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  SHQuickNoteActivity *v19;
  id v20;

  v7 = a3;
  v8 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __78__SHQuickNoteActivity__dismissActivityFromViewController_animated_completion___block_invoke;
  v18 = &unk_1E4002500;
  v19 = self;
  v20 = v8;
  v9 = v8;
  v10 = (void (**)(_QWORD))MEMORY[0x1A1AE9514](&v15);
  if (v7)
  {
    v11 = 1;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v10, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    -[SHQuickNoteActivity systemPaperViewController](self, "systemPaperViewController", v15, v16, v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SHQuickNoteActivity systemPaperViewController](self, "systemPaperViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v10);

    }
    else
    {
      v10[2](v10);
      v11 = 0;
    }
  }

  return v11;
}

uint64_t __78__SHQuickNoteActivity__dismissActivityFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setSystemPaperViewController:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)systemPaperDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v7 = objc_msgSend(v4, "code");

    if (v7 == 3072)
    {
      SHQuickNoteLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SHQuickNoteActivity systemPaperDidFinishWithError:].cold.1(v8);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v4)
  {
    SHQuickNoteLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SHQuickNoteActivity systemPaperDidFinishWithError:].cold.2(v4, v8);
LABEL_9:

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v4 == 0);

}

- (NSArray)_urls
{
  return self->__urls;
}

- (void)set_urls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)_images
{
  return self->__images;
}

- (void)set_images:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)_imageFileURLs
{
  return self->__imageFileURLs;
}

- (void)set_imageFileURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)_hasSupportedShareableItems
{
  return self->__hasSupportedShareableItems;
}

- (void)set_hasSupportedShareableItems:(BOOL)a3
{
  self->__hasSupportedShareableItems = a3;
}

- (BOOL)_hasUserActivityCurrent
{
  return self->__hasUserActivityCurrent;
}

- (void)set_hasUserActivityCurrent:(BOOL)a3
{
  self->__hasUserActivityCurrent = a3;
}

- (ICSystemPaperExtensionHostViewController)systemPaperViewController
{
  return self->_systemPaperViewController;
}

- (void)setSystemPaperViewController:(id)a3
{
  objc_storeStrong((id *)&self->_systemPaperViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPaperViewController, 0);
  objc_storeStrong((id *)&self->__imageFileURLs, 0);
  objc_storeStrong((id *)&self->__images, 0);
  objc_storeStrong((id *)&self->__urls, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
}

void __27__SHQuickNoteActivity_init__block_invoke_3_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_19E419000, a2, a3, "Failed to fetch local user activity: %@", (uint8_t *)&v4);
}

void __76__SHQuickNoteActivity__presentActivityOnViewController_animated_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_19E419000, a2, a3, "Quick Note invocation failed with error: %@", (uint8_t *)&v3);
}

- (void)systemPaperDidFinishWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19E419000, log, OS_LOG_TYPE_DEBUG, "Quick Note presentation cancelled", v1, 2u);
}

- (void)systemPaperDidFinishWithError:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_19E419000, a2, v4, "Quick Note presentation finished with error: %@", (uint8_t *)&v5);

}

@end
