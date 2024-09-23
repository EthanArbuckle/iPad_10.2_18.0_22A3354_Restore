@implementation UIWorkspaceSceneRequestOptionsFactory

void __55___UIWorkspaceSceneRequestOptionsFactory_sharedFactory__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_UIWorkspaceSceneRequestOptionsFactory _init]([_UIWorkspaceSceneRequestOptionsFactory alloc], "_init");
  v1 = (void *)qword_1ECD7F6E0;
  qword_1ECD7F6E0 = (uint64_t)v0;

}

void __98___UIWorkspaceSceneRequestOptionsFactory_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    v7 = qword_1ECD7F710;
    if (!qword_1ECD7F710)
    {
      v7 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7F710);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v20 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = a1[4];
        v28 = 138412290;
        v29 = v21;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Neither a result nor an error was produced by builder: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    _UISceneErrorWithCode(1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    v8 = qword_1ECD7F718;
    if (!qword_1ECD7F718)
    {
      v8 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7F718);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v18 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = a1[4];
        v28 = 138412546;
        v29 = v6;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Failed to build workspace request options: %@; builder=%@",
          (uint8_t *)&v28,
          0x16u);
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend((id)v5, "specification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "uiSceneSessionRole");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend((id)a1[5], "isEqualToString:", v11) & 1) != 0)
      {
        v12 = qword_1ECD7F730;
        if (!qword_1ECD7F730)
        {
          v12 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&qword_1ECD7F730);
        }
        if ((*(_BYTE *)v12 & 1) != 0)
        {
          v24 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v28 = 138412290;
            v29 = v5;
            _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Successfully built workspace request options: %@", (uint8_t *)&v28, 0xCu);
          }
        }
        (*(void (**)(_QWORD, unint64_t, _QWORD))(a1[6] + 16))(a1[6], v5, 0);
      }
      else
      {
        v15 = qword_1ECD7F728;
        if (!qword_1ECD7F728)
        {
          v15 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v15, (unint64_t *)&qword_1ECD7F728);
        }
        if ((*(_BYTE *)v15 & 1) != 0)
        {
          v25 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = a1[4];
            v27 = a1[5];
            v28 = 138412802;
            v29 = v26;
            v30 = 2112;
            v31 = v27;
            v32 = 2112;
            v33 = v11;
            _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Builder produced a workspace request options object with a specification whose role does not match the requested one. builder=%@; expectedRole=%@; builtRole=%@",
              (uint8_t *)&v28,
              0x20u);
          }
        }
        v16 = a1[6];
        _UISceneErrorWithCode(1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

      }
    }
    else
    {
      v13 = qword_1ECD7F720;
      if (!qword_1ECD7F720)
      {
        v13 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&qword_1ECD7F720);
      }
      if ((*(_BYTE *)v13 & 1) != 0)
      {
        v22 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = a1[4];
          v28 = 138412546;
          v29 = v23;
          v30 = 2112;
          v31 = v5;
          _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Builder produced a workspace request options object with no specification. builder=%@; workspaceOptions=%@",
            (uint8_t *)&v28,
            0x16u);
        }
      }
      v14 = a1[6];
      _UISceneErrorWithCode(1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v11);
    }

  }
}

@end
