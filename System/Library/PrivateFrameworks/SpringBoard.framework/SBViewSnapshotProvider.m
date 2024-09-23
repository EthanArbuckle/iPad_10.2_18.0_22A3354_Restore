@implementation SBViewSnapshotProvider

- (SBViewSnapshotProvider)initWithWindowScene:(id)a3 view:(id)a4 orientation:(int64_t)a5
{
  id v8;
  id v9;
  SBViewSnapshotProvider *v10;
  SBViewSnapshotProvider *v11;
  SBViewSnapshotProvider *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBViewSnapshotProvider;
  v10 = -[SBViewSnapshotProvider init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_windowScene, v8);
    objc_storeStrong((id *)&v11->_view, a4);
    v11->_orientation = a5;
    v12 = v11;
  }

  return v11;
}

- (id)snapshot
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__50;
  v9 = __Block_byref_object_dispose__50;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SBViewSnapshotProvider_snapshot__block_invoke;
  v4[3] = &unk_1E8EAE278;
  v4[4] = &v5;
  -[SBViewSnapshotProvider snapshotAsynchronously:withImageBlock:](self, "snapshotAsynchronously:withImageBlock:", 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SBViewSnapshotProvider_snapshot__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)snapshotWithImageBlock:(id)a3
{
  -[SBViewSnapshotProvider snapshotAsynchronously:withImageBlock:](self, "snapshotAsynchronously:withImageBlock:", 1, a3);
}

- (id)_createSnapshotOfWallpaperAndWindow:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  char *v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CFTypeID v24;
  void *v25;
  void *v26;
  CFTypeID v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "windows", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = *MEMORY[0x1E0CEBE28] + -3.0;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "windowLevel");
        if (v14 == v11)
        {
          objc_msgSend(v5, "addObject:", v13);
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v5, "addObject:", v4);
  v15 = (char *)&v32 - ((4 * objc_msgSend(v5, "count") + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v15[4 * v16] = objc_msgSend(v17, "_contextId");

      ++v16;
    }
    while (v16 < objc_msgSend(v5, "count"));
  }
  SBScreenBoundsRotatedRoundCenter(self->_orientation);
  v22 = (void *)objc_msgSend(MEMORY[0x1E0CEAC18], "createIOSurfaceWithContextIds:count:frame:", v15, objc_msgSend(v5, "count"), v18, v19, v20, v21);
  if (v22)
  {
    v23 = v22;
    v24 = CFGetTypeID(v22);
    if (v24 == IOSurfaceGetTypeID())
    {
      objc_msgSend(v4, "screen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SBCreateUIImageFromIOSurfaceResizingIfNecessary(v23, v25, 1, 1, 0, 0.0, 1.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
    v27 = CFGetTypeID(v23);
    if (v27 == CGImageGetTypeID())
    {
      v28 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v4, "screen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      objc_msgSend(v28, "imageWithCGImage:scale:orientation:", v23, 0);
      v30 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v30;
    }
    CFRelease(v23);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)snapshotAsynchronously:(BOOL)a3 withImageBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBSnapshotWindow *v12;
  uint64_t v13;
  SBSnapshotWindow *v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  _QWORD v20[5];
  SBSnapshotWindow *v21;
  id v22;

  v4 = a3;
  v6 = a4;
  if (v6 && self->_view)
  {
    -[SBViewSnapshotProvider windowScene](self, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBScreenBounds(self->_orientation);
    BSRectWithSize();
    v12 = -[SBSnapshotWindow initWithWindowScene:frame:orientation:]([SBSnapshotWindow alloc], "initWithWindowScene:frame:orientation:", v7, self->_orientation, v8, v9, v10, v11);
    -[SBSnapshotWindow setWindowLevel:](v12, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0 + -1.0);
    -[SBSnapshotWindow setHidden:](v12, "setHidden:", 0);
    -[SBSnapshotWindow addSubview:](v12, "addSubview:", self->_view);
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke;
    v20[3] = &unk_1E8E9F7B8;
    v20[4] = self;
    v14 = v12;
    v21 = v14;
    v22 = v6;
    v15 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v20);
    v16 = v15;
    if (v4)
    {
      v17 = (void *)*MEMORY[0x1E0CEB258];
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_2;
      v18[3] = &unk_1E8EA02D8;
      v18[4] = self;
      v19 = v15;
      objc_msgSend(v17, "sb_performBlockAfterCATransactionSynchronizedCommit:", v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
      objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
      v16[2](v16);
    }

  }
}

void __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
    objc_msgSend((id)v2, "_createSnapshotOfWallpaperAndWindow:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(*(id *)(v2 + 8), "sb_snapshotImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 32);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v3 + 8), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);

}

void __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_3;
  block[3] = &unk_1E8E9E8D0;
  v4 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __64__SBViewSnapshotProvider_snapshotAsynchronously_withImageBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)includeWindowSceneWallpaper
{
  return self->_includeWindowSceneWallpaper;
}

- (void)setIncludeWindowSceneWallpaper:(BOOL)a3
{
  self->_includeWindowSceneWallpaper = a3;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
