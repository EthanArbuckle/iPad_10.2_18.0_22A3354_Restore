@implementation _UIApplicationConfigurationLoader

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIApplicationConfigurationLoader;
  return -[_UIApplicationConfigurationLoader init](&v3, sel_init);
}

- (BOOL)isFrontBoard
{
  if (qword_1ECD7E828 != -1)
    dispatch_once(&qword_1ECD7E828, &__block_literal_global_40_2);
  return _MergedGlobals_1094;
}

+ (_UIApplicationConfigurationLoader)sharedLoader
{
  if (qword_1ECD7E808 != -1)
    dispatch_once(&qword_1ECD7E808, &__block_literal_global_290);
  return (_UIApplicationConfigurationLoader *)(id)qword_1ECD7E800;
}

- (UISApplicationInitializationContext)applicationInitializationContext
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  -[_UIApplicationConfigurationLoader _loadInitializationContext](self, "_loadInitializationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (qword_1ECD7E828 != -1)
      dispatch_once(&qword_1ECD7E828, &__block_literal_global_40_2);
    if (!_MergedGlobals_1094)
    {
      v3 = qword_1ECD7E820;
      if (!qword_1ECD7E820)
      {
        v3 = __UILogCategoryGetNode("ApplicationEnviromentLoading", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD7E820);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Failed to initialize application enviroment context", v6, 2u);
      }
    }
  }
  return (UISApplicationInitializationContext *)v2;
}

- (id)_loadInitializationContext
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke;
  v4[3] = &unk_1E16B1888;
  v4[4] = self;
  v4[5] = a2;
  if (_loadInitializationContext_load_once != -1)
    dispatch_once(&_loadInitializationContext_load_once, v4);
  return self->_applicationInitializationContext;
}

- (void)startPreloadInitializationContext
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  if (-[_UIApplicationConfigurationLoader usesLocalInitializationContext](self, "usesLocalInitializationContext"))
  {
    v3 = -[_UIApplicationConfigurationLoader _loadInitializationContext](self, "_loadInitializationContext");
  }
  else if (!self->_hasRequestedPreload)
  {
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70___UIApplicationConfigurationLoader_startPreloadInitializationContext__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(v4, block);

    self->_hasRequestedPreload = 1;
  }
}

- (BOOL)usesLocalInitializationContext
{
  BOOL v3;
  void *v4;

  if (qword_1ECD7E828 != -1)
    dispatch_once(&qword_1ECD7E828, &__block_literal_global_40_2);
  if (_MergedGlobals_1094)
    return 1;
  -[_UIApplicationConfigurationLoader _appInitializationContextFactoryClass](self, "_appInitializationContextFactoryClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (id)_appInitializationContextFactoryClass
{
  if (qword_1ECD7E818 != -1)
    dispatch_once(&qword_1ECD7E818, &__block_literal_global_7_6);
  return (id)qword_1ECD7E810;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIApplicationConfigurationLoader.m"), 83, CFSTR("This is a singleton that should never be deallocated"));

  v5.receiver = self;
  v5.super_class = (Class)_UIApplicationConfigurationLoader;
  -[_UIApplicationConfigurationLoader dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInitializationContext, 0);
}

@end
