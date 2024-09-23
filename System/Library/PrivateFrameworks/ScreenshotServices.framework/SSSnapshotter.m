@implementation SSSnapshotter

- (SSSnapshotter)init
{
  SSSnapshotter *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  CARSessionStatus *carSessionStatus;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)SSSnapshotter;
  v2 = -[SSSnapshotter init](&v8, sel_init);
  if (v2)
  {
    if (!CarKitLibraryCore_frameworkLibrary)
    {
      v13 = xmmword_24D06C050;
      v14 = 0;
      CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CarKitLibraryCore_frameworkLibrary)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)getCARSessionStatusClass_softClass;
      v12 = getCARSessionStatusClass_softClass;
      if (!getCARSessionStatusClass_softClass)
      {
        *(_QWORD *)&v13 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v13 + 1) = 3221225472;
        v14 = __getCARSessionStatusClass_block_invoke;
        v15 = &unk_24D06B990;
        v16 = &v9;
        __getCARSessionStatusClass_block_invoke((uint64_t)&v13);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      v5 = objc_msgSend([v4 alloc], "initWithOptions:", 0);
      carSessionStatus = v2->_carSessionStatus;
      v2->_carSessionStatus = (CARSessionStatus *)v5;

    }
  }
  return v2;
}

- (id)captureAvailableSnapshotsWithOptionsCollection:(id)a3 didFindOnenessScreens:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[SSSnapshotter _screensThatAreCaptureableDidFindOnenessScreens:](self, "_screensThatAreCaptureableDidFindOnenessScreens:", a4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "screenshotOptionsForScreen:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSSnapshotter _captureScreen:withScreenshotOptions:](self, "_captureScreen:withScreenshotOptions:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "image");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "image");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SSScreenSnapshot snapshotWithImage:fromScreen:](SSScreenSnapshot, "snapshotWithImage:fromScreen:", v16, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "addObject:", v17);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v19;
}

- (id)_screensThatAreCaptureableDidFindOnenessScreens:(BOOL *)a3
{
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
  id v15;
  id v16;
  uint64_t (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  uint64_t v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  char v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rootIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CARSessionStatus currentSession](self->_carSessionStatus, "currentSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v14 != 0;

  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke_2;
  v44[3] = &unk_24D06C030;
  v47 = &__block_literal_global_5;
  v48 = (char)self;
  v15 = v7;
  v45 = v15;
  v16 = v13;
  v46 = v16;
  v17 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x2199B823C](v44);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "connectedScenes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "screen");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = ((uint64_t (**)(_QWORD, void *))v17)[2](v17, v25);
          if (a3 && !*a3)
            *a3 = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(v26, v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v21);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(MEMORY[0x24BDF6D38], "screens", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        v33 = ((uint64_t (**)(_QWORD, void *))v17)[2](v17, v32);
        if (a3 && !*a3)
          *a3 = __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(v33, v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v29);
  }

  v34 = v15;
  return v34;
}

uint64_t __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContinuityDisplay");

  return v4;
}

void __65__SSSnapshotter__screensThatAreCaptureableDidFindOnenessScreens___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v7 = ((objc_msgSend(v5, "isCarDisplay") & 1) != 0 || objc_msgSend(v5, "isCarInstrumentsDisplay"))
    && *(_BYTE *)(a1 + 56) == 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "mirroredScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (v9 = *(void **)(a1 + 40),
          objc_msgSend(v5, "rootIdentity"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v9, "containsObject:", v8) & 1) != 0))
    {

    }
    else
    {

      if (((v6 | v7) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(v5, "rootIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        goto LABEL_13;
      }
    }
  }
  if (v7)
  {
    v10 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v3;
      _os_log_impl(&dword_213892000, v10, OS_LOG_TYPE_INFO, "Ignoring defunct car screen %{public}@", (uint8_t *)&v13, 0xCu);
    }

  }
LABEL_13:

}

- (id)_captureScreen:(id)a3 withScreenshotOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v5 = a4;
  +[SSScreenSnapshotter snapshotterForScreen:](SSScreenSnapshotter, "snapshotterForScreen:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preparedImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "takeScreenshot");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setImage:", v9);
  if (v9)
    v11 = 0;
  else
    v11 = CFSTR("Unknown");
  objc_msgSend(v10, "setFailureReasonIfImageIsNil:", v11);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end
