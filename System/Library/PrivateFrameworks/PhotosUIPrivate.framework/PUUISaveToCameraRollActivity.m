@implementation PUUISaveToCameraRollActivity

- (id)activityType
{
  return CFSTR("com.apple.Photos.activity.saveToCameraRoll");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (-[PUUISaveToCameraRollActivity _containsVideoComplementsInActivityItems:outVideoComplements:](self, "_containsVideoComplementsInActivityItems:outVideoComplements:", v4, 0))
  {
    v5 = (unint64_t)(objc_msgSend(MEMORY[0x1E0CD16F8], "authorizationStatusForAccessLevel:", 1) - 3) < 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUUISaveToCameraRollActivity;
    v5 = -[UISaveToCameraRollActivity canPerformWithActivityItems:](&v7, sel_canPerformWithActivityItems_, v4);
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;
  id v16;

  v4 = a3;
  v16 = 0;
  v5 = -[PUUISaveToCameraRollActivity _containsVideoComplementsInActivityItems:outVideoComplements:](self, "_containsVideoComplementsInActivityItems:outVideoComplements:", v4, &v16);
  v6 = v16;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke;
      v12[3] = &unk_1E58ABD10;
      v13 = v7;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_2;
      v10[3] = &unk_1E58AA4C8;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v8, "performChanges:completionHandler:", v12, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUUISaveToCameraRollActivity;
    -[UISaveToCameraRollActivity prepareWithActivityItems:](&v15, sel_prepareWithActivityItems_, v4);
  }

}

- (BOOL)_containsVideoComplementsInActivityItems:(id)a3 outVideoComplements:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v6 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "addObject:", v13, (_QWORD)v15);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v10 & 1;
}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = (id)objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetFromVideoComplementBundle:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_3;
  v3[3] = &unk_1E58AA4A0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityDidFinish:", *(unsigned __int8 *)(a1 + 40));

}

@end
