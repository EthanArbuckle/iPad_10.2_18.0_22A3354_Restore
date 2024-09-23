@implementation _UIScreenInitialDisplayConfigurationLoader

+ (_UIScreenInitialDisplayConfigurationLoader)sharedLoader
{
  if (qword_1ECD79938 != -1)
    dispatch_once(&qword_1ECD79938, &__block_literal_global_287);
  return (_UIScreenInitialDisplayConfigurationLoader *)(id)qword_1ECD79940;
}

- (void)_startPreloadInitialDisplayContext
{
  void *v3;
  UISDisplayContext *context;
  id v5;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startPreloadInitializationContext");
  if (!self->_hasRequestedPreload)
  {
    self->_hasRequestedPreload = 1;
    objc_msgSend(v5, "isFrontBoard");
    objc_msgSend(MEMORY[0x1E0CD2728], "displays");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "count");

    context = self->_context;
    self->_context = 0;

  }
}

- (UISDisplayContext)initialDisplayContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  UISDisplayContext *v9;
  UISDisplayContext *context;
  UISDisplayContext *v11;
  UISDisplayContext *v12;
  UISDisplayContext *v13;
  uint8_t v15[16];

  if (!self->_hasRequestedPreload)
    -[_UIScreenInitialDisplayConfigurationLoader _startPreloadInitialDisplayContext](self, "_startPreloadInitialDisplayContext");
  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isFrontBoard");
  if (!self->_context)
  {
    objc_msgSend(MEMORY[0x1E0CD2728], "displays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(v3, "applicationInitializationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v7 = initialDisplayContext___s_category;
        if (!initialDisplayContext___s_category)
        {
          v7 = __UILogCategoryGetNode("DisplayConfigurationFetch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&initialDisplayContext___s_category);
        }
        v8 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Failed to load a display context, even though we are not a headless app.", v15, 2u);
        }
      }
      objc_msgSend(v6, "mainDisplayContext");
      v9 = (UISDisplayContext *)objc_claimAutoreleasedReturnValue();
      context = self->_context;
      self->_context = v9;

      if (!self->_context)
      {
        objc_msgSend(MEMORY[0x1E0DC5BB0], "defaultContext");
        v11 = (UISDisplayContext *)objc_claimAutoreleasedReturnValue();
        v12 = self->_context;
        self->_context = v11;

      }
    }
  }
  v13 = self->_context;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
