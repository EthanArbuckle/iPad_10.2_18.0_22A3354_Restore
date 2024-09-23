@implementation _UISceneHostingClientActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  _UISceneHostingClientActionHandler *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_234);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = _respondToActions_forFBSScene_inUIScene_fromTransitionContext____s_category;
      if (!_respondToActions_forFBSScene_inUIScene_fromTransitionContext____s_category)
      {
        v11 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&_respondToActions_forFBSScene_inUIScene_fromTransitionContext____s_category);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v20 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = (void *)objc_opt_class();
          v23 = v22;
          *(_DWORD *)buf = 138413058;
          v30 = v22;
          v31 = 2048;
          v32 = self;
          v33 = 2048;
          v34 = objc_msgSend(v10, "count");
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "[<%@;%p>] Received %ld actions: %@", buf, 0x2Au);

        }
      }
      v12 = v9;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "performActionForHostedWindowScene:", v12, (_QWORD)v24);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v15);
      }

    }
  }
  v18 = (void *)objc_msgSend(v8, "mutableCopy", (_QWORD)v24);
  objc_msgSend(v18, "minusSet:", v10);

  return v18;
}

@end
