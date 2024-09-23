@implementation IMMetricsController

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    _IMStoreLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch metrics dictionary with error %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addPropertiesWithDictionary:", *(_QWORD *)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("metricsBase"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("fields"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_30;
          v18[3] = &unk_1E54D3368;
          v19 = *(id *)(a1 + 40);
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v18);

        }
      }
    }
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_2;
        v16 = &unk_1E54D3368;
        v17 = *(id *)(a1 + 40);
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v13);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addPropertiesWithDictionary:", *(_QWORD *)(a1 + 40), v13, v14, v15, v16);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(void))(v12 + 16))();

  }
}

uint64_t __35__IMMetricsController_recordEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enqueueEvent:", *(_QWORD *)(a1 + 40));
}

- (void)recordEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  IMMetricsController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__IMMetricsController_recordEvent___block_invoke;
  v6[3] = &unk_1E54D3340;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[IMMetricsController getMetricsController:](self, "getMetricsController:", v6);

}

- (void)getMetricsController:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  void (**v9)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[IMMetricsController metricsController](self, "metricsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMMetricsController metricsController](self, "metricsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__IMMetricsController_getMetricsController___block_invoke;
    v8[3] = &unk_1E54D1018;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

void __35__IMMetricsController_recordEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  +[PFClientUtil clientBundleVersion](PFClientUtil, "clientBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppVersion:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTopic:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setAnonymous:", 1);
  v10 = a1 + 32;
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__IMMetricsController_recordEvent___block_invoke_2;
  v12[3] = &unk_1E54D11F8;
  v13 = v3;
  v14 = v8;
  v11 = v3;
  objc_msgSend(v9, "addAdditionalFieldsToEvent:completion:", v8, v12);

}

- (NSString)topic
{
  return self->_topic;
}

- (void)addAdditionalFieldsToEvent:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectionTypeHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = CFSTR("unknown");
  objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("connection"));
  v11 = (void *)MEMORY[0x1E0CFDCA8];
  objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userAgentForProcessInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("userAgent"));
  +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "metricsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke;
  v20[3] = &unk_1E54D3390;
  v21 = v5;
  v22 = v7;
  v23 = v6;
  v17 = v6;
  v18 = v7;
  v19 = v5;
  objc_msgSend(v15, "asyncValueOnQueue:withCompletion:", v16, v20);

}

+ (id)queue
{
  if (queue_onceToken[0] != -1)
    dispatch_once(queue_onceToken, &__block_literal_global_16);
  return (id)queue_queue;
}

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (IMMetricsController)initWithTopic:(id)a3
{
  id v4;
  IMMetricsController *v5;
  IMMetricsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMMetricsController;
  v5 = -[IMMetricsController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMMetricsController setTopic:](v5, "setTopic:", v4);
    -[IMMetricsController setIsLoading:](v6, "setIsLoading:", 0);
    -[IMMetricsController setShouldIgnoreDNU:](v6, "setShouldIgnoreDNU:", 0);
    -[IMMetricsController setShouldSuppressUserInfo:](v6, "setShouldSuppressUserInfo:", 0);
  }

  return v6;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (void)setShouldIgnoreDNU:(BOOL)a3
{
  self->_shouldIgnoreDNU = a3;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

void __44__IMMetricsController_getMetricsController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "metricsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB60]), "initWithContainerID:bag:", CFSTR("com.apple.podcasts"), v3);
    objc_msgSend(*(id *)(a1 + 32), "setMetricsController:", v4);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "metricsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)setMetricsController:(id)a3
{
  objc_storeStrong((id *)&self->_metricsController, a3);
}

void __28__IMMetricsController_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("IMMetricsController", v2);
  v1 = (void *)queue_queue;
  queue_queue = (uint64_t)v0;

}

- (id)flushImmediately
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;

  -[IMMetricsController metricsController](self, "metricsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CFDBD8]);
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__IMMetricsController_flushImmediately__block_invoke;
    aBlock[3] = &unk_1E54D11F8;
    aBlock[4] = self;
    v6 = v4;
    v15 = v6;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __39__IMMetricsController_flushImmediately__block_invoke_10;
    v12[3] = &unk_1E54D3318;
    v13 = _Block_copy(aBlock);
    v7 = v13;
    v8 = _Block_copy(v12);
    objc_msgSend((id)objc_opt_class(), "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v9, v8);

    v10 = v6;
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void __39__IMMetricsController_flushImmediately__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _IMStoreLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "Start flushing metric events.", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "metricsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "finishWithPromise:", v4);
    objc_msgSend(v4, "addErrorBlock:", &__block_literal_global_5);
    objc_msgSend(v4, "addFinishBlock:", &__block_literal_global_8);
  }
  else
  {
    objc_msgSend(v5, "finishWithResult:", &unk_1E55393B0);
  }

}

void __39__IMMetricsController_flushImmediately__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _IMStoreLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_ERROR, "Error flushing metric events: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __39__IMMetricsController_flushImmediately__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _IMStoreLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      v8 = "Finished flushing %@ metric events. Error: %@";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 22;
LABEL_6:
      _os_log_impl(&dword_1A904E000, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    v8 = "Finished flushing %@ metric events.";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
    v11 = 12;
    goto LABEL_6;
  }

}

uint64_t __39__IMMetricsController_flushImmediately__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (BOOL)shouldIgnoreDNU
{
  return self->_shouldIgnoreDNU;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
