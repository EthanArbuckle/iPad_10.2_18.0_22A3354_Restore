@implementation TIAnalyticsServiceProviderImpl

- (TIAnalyticsServiceProviderImpl)init
{
  TIAnalyticsServiceProviderImpl *v2;
  void *v3;
  objc_class *v4;
  IAEventDispatcher *v5;
  IAEventDispatcher *dispatcher;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)TIAnalyticsServiceProviderImpl;
  v2 = -[TIAnalyticsServiceProviderImpl init](&v8, sel_init);
  if (v2)
  {
    if (!InputAnalyticsLibraryCore_frameworkLibrary)
    {
      v13 = xmmword_1E243A6D8;
      v14 = 0;
      InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (InputAnalyticsLibraryCore_frameworkLibrary)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)getIAEventDispatcherClass_softClass;
      v12 = getIAEventDispatcherClass_softClass;
      if (!getIAEventDispatcherClass_softClass)
      {
        *(_QWORD *)&v13 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v13 + 1) = 3221225472;
        v14 = __getIAEventDispatcherClass_block_invoke;
        v15 = &unk_1E243AE68;
        v16 = &v9;
        __getIAEventDispatcherClass_block_invoke((uint64_t)&v13);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      v5 = (IAEventDispatcher *)objc_alloc_init(v4);
      dispatcher = v2->_dispatcher;
      v2->_dispatcher = v5;

    }
  }
  return v2;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  IAEventDispatcher *dispatcher;
  id v9;

  v6 = a3;
  v7 = a4;
  if (!InputAnalyticsLibraryCore_frameworkLibrary)
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (InputAnalyticsLibraryCore_frameworkLibrary && (dispatcher = self->_dispatcher) != 0)
  {
    -[IAEventDispatcher dispatchEvent:payload:](dispatcher, "dispatchEvent:payload:", v6, v7);
  }
  else
  {
    v9 = v7;
    AnalyticsSendEventLazy();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

id __64__TIAnalyticsServiceProviderImpl_dispatchEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
