@implementation _UISceneHostingWorkspaceController

- (_UISceneHostingWorkspaceController)initWithIdentifier:(id)a3
{
  id v4;
  _UISceneHostingWorkspaceController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  FBSceneWorkspace *sceneWorkspace;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UISceneHostingWorkspaceController;
  v5 = -[_UISceneHostingWorkspaceController init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UISceneHostingWorkspace-%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("UISceneHostingWorkspace-%@"), v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", v7);
    sceneWorkspace = v5->_sceneWorkspace;
    v5->_sceneWorkspace = (FBSceneWorkspace *)v10;

    -[FBSceneWorkspace setDelegate:](v5->_sceneWorkspace, "setDelegate:", v5);
  }

  return v5;
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _UISceneHostingWorkspaceController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = workspace_didAddScene____s_category[0];
  if (!workspace_didAddScene____s_category[0])
  {
    v8 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, workspace_didAddScene____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Workspace %@ didAddScene:%@ (self: %@)", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _UISceneHostingWorkspaceController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = workspace_willRemoveScene____s_category;
  if (!workspace_willRemoveScene____s_category)
  {
    v8 = __UILogCategoryGetNode("UISceneHosting", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&workspace_willRemoveScene____s_category);
  }
  if ((*(_BYTE *)v8 & 1) != 0)
  {
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412802;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Workspace %@ willRemoveScene:%@ (self: %@)", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
}

@end
