@implementation _UIShareableContentSceneActionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareableContentActionHandler, 0);
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v16)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "info");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForSetting:", 30295);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_10;
      }
    }

    -[_UIShareableContentSceneActionHandler shareableContentActionHandler](self, "shareableContentActionHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_13;
    -[_UIShareableContentSceneActionHandler shareableContentActionHandler](self, "shareableContentActionHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_respondToActions:forFBSScene:inUIScene:fromTransitionContext:", v13, v10, v11, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_10:

LABEL_13:
    v22 = (void *)objc_msgSend(v13, "copy");
  }

  return v22;
}

- (_UISceneBSActionHandler)shareableContentActionHandler
{
  _UISceneBSActionHandler *shareableContentActionHandler;
  void *v4;
  objc_class *v5;
  _UISceneBSActionHandler *v6;
  _UISceneBSActionHandler *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  shareableContentActionHandler = self->_shareableContentActionHandler;
  if (!shareableContentActionHandler)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)_MergedGlobals_958;
    v13 = _MergedGlobals_958;
    if (!_MergedGlobals_958)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getSWShareableContentBSActionResponderClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getSWShareableContentBSActionResponderClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (_UISceneBSActionHandler *)objc_alloc_init(v5);
    v7 = self->_shareableContentActionHandler;
    self->_shareableContentActionHandler = v6;

    shareableContentActionHandler = self->_shareableContentActionHandler;
  }
  return shareableContentActionHandler;
}

- (void)setShareableContentActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_shareableContentActionHandler, a3);
}

@end
