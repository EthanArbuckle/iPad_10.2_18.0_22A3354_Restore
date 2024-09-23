@implementation _UISceneMaskingHostComponent

- (id)handlePrivateActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_opt_class();
        v13 = v11;
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v15 = v14;

        if (v15)
        {
          -[_UISceneMaskingHostComponent _handleMaskingAction:](self, "_handleMaskingAction:", v15, (_QWORD)v17);
          objc_msgSend(v5, "addObject:", v15);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_handleMaskingAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 1)
  {
    -[_UISceneMaskingHostComponent _sceneMaskingHost](self, "_sceneMaskingHost");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneComponent hostScene](self, "hostScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateMasking:", v15);

  }
  else if (!v7)
  {
    objc_msgSend(v5, "objectForSetting:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __53___UISceneMaskingHostComponent__handleMaskingAction___block_invoke;
    v21 = &unk_1E16BB768;
    v22 = v4;
    v10 = (void (**)(void *, void *))_Block_copy(&v18);
    -[_UISceneMaskingHostComponent _sceneMaskingHost](self, "_sceneMaskingHost", v18, v19, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_UISceneMaskingHostComponent _sceneMaskingHost](self, "_sceneMaskingHost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSSceneComponent hostScene](self, "hostScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "beginMaskingForReason:continuation:scene:", v9, v10, v13);

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("Host does not implement scene masking.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("_UISceneMaskingErrorDomain"), 0, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, v12);
    }

  }
}

- (_UISceneMaskingDelegate)_sceneMaskingHost
{
  return (_UISceneMaskingDelegate *)objc_loadWeakRetained((id *)&self->_sceneMaskingHost);
}

- (void)set_sceneMaskingHost:(id)a3
{
  objc_storeWeak((id *)&self->_sceneMaskingHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneMaskingHost);
}

@end
