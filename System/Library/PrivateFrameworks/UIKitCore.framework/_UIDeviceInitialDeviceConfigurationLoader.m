@implementation _UIDeviceInitialDeviceConfigurationLoader

+ (_UIDeviceInitialDeviceConfigurationLoader)sharedLoader
{
  if (_MergedGlobals_1096 != -1)
    dispatch_once(&_MergedGlobals_1096, &__block_literal_global_292);
  return (_UIDeviceInitialDeviceConfigurationLoader *)(id)qword_1ECD7E848;
}

- (UISDeviceContext)initialDeviceContext
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  UISDeviceContext *v8;
  UISDeviceContext *context;
  UISDeviceContext *v10;
  uint8_t v12[16];

  if (!self->_hasRequestedPreload)
    -[_UIDeviceInitialDeviceConfigurationLoader _startPreloadInitialDeviceContext](self, "_startPreloadInitialDeviceContext");
  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_context && (objc_msgSend(v3, "isFrontBoard") & 1) == 0)
  {
    objc_msgSend(v4, "applicationInitializationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = initialDeviceContext___s_category[0];
      if (!initialDeviceContext___s_category[0])
      {
        v6 = __UILogCategoryGetNode("DeviceConfigurationFetch", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, initialDeviceContext___s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Failed to load a device context.", v12, 2u);
      }
    }
    objc_msgSend(v5, "deviceContext");
    v8 = (UISDeviceContext *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    self->_context = v8;

  }
  v10 = self->_context;

  return v10;
}

- (void)_startPreloadInitialDeviceContext
{
  void *v3;
  void *v4;
  UISDeviceContext *v5;
  UISDeviceContext *context;
  id v7;

  +[_UIApplicationConfigurationLoader sharedLoader](_UIApplicationConfigurationLoader, "sharedLoader");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPreloadInitializationContext");
  if (!self->_hasRequestedPreload)
  {
    self->_hasRequestedPreload = 1;
    if (objc_msgSend(v7, "usesLocalInitializationContext"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC5BA8], "__bootstrappingDeviceContext");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          objc_storeStrong((id *)&self->_context, v3);

      }
      if (!self->_context)
      {
        objc_msgSend(v7, "applicationInitializationContext");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "deviceContext");
        v5 = (UISDeviceContext *)objc_claimAutoreleasedReturnValue();
        context = self->_context;
        self->_context = v5;

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
