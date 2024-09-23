@implementation WFObservableResult

- (WFObservableResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  WFObservableResult *v9;
  WFObservableResult *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *observerNotificationQueue;
  uint64_t v17;
  NSHashTable *observers;
  WFObservableResult *v19;
  void *v21;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EEE5D550) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFObservableResult.m"), 204, CFSTR("Value type must be secure-codable"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFObservableResult;
  v9 = -[WFObservableResult init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueType, a3);
    v10->_glyphSize.width = width;
    v10->_glyphSize.height = height;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.shortcuts.WFObservableResult-private", v11);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.shortcuts.WFObservableResult-observer", v14);
    observerNotificationQueue = v10->_observerNotificationQueue;
    v10->_observerNotificationQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v17;

    v19 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[WFObservableResult stopConnection](self, "stopConnection");
  v3.receiver = self;
  v3.super_class = (Class)WFObservableResult;
  -[WFObservableResult dealloc](&v3, sel_dealloc);
}

- (void)addResultObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFObservableResult serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WFObservableResult_addResultObserver___block_invoke;
  block[3] = &unk_1E5FC7AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)removeResultObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFObservableResult serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WFObservableResult_removeResultObserver___block_invoke;
  block[3] = &unk_1E5FC7AC0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)startConnectionIfNecessary
{
  NSObject *v3;
  void *v4;

  -[WFObservableResult serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[WFObservableResult observingDistributedNotifications](self, "observingDistributedNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel_databaseDidChange_, CFSTR("com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification"), 0, 4);

    -[WFObservableResult setObservingDistributedNotifications:](self, "setObservingDistributedNotifications:", 1);
  }
}

- (void)stopConnection
{
  void *v3;

  if (-[WFObservableResult observingDistributedNotifications](self, "observingDistributedNotifications"))
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.shortcuts.WFCoreDataDatabaseContextDidSaveNotification"), 0);

    -[WFObservableResult setObservingDistributedNotifications:](self, "setObservingDistributedNotifications:", 0);
  }
}

- (void)databaseDidChange:(id)a3
{
  id v4;
  WFCoreDataChangeNotification *v5;
  void *v6;
  WFCoreDataChangeNotification *v7;

  v4 = a3;
  v5 = [WFCoreDataChangeNotification alloc];
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFCoreDataChangeNotification initWithDictionaryRepresentation:](v5, "initWithDictionaryRepresentation:", v6);
  -[WFObservableResult handleChangeNotification:](self, "handleChangeNotification:", v7);

}

- (Class)valueType
{
  return self->_valueType;
}

- (CGSize)glyphSize
{
  double width;
  double height;
  CGSize result;

  width = self->_glyphSize.width;
  height = self->_glyphSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)observerNotificationQueue
{
  return self->_observerNotificationQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)observingDistributedNotifications
{
  return self->_observingDistributedNotifications;
}

- (void)setObservingDistributedNotifications:(BOOL)a3
{
  self->_observingDistributedNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerNotificationQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

void __43__WFObservableResult_removeResultObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "stopConnection");
}

uint64_t __40__WFObservableResult_addResultObserver___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "startConnectionIfNecessary");
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 completion:(id)a5
{
  objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:", a3, 1, 0, a5, a4.width, a4.height);
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4
{
  objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:", a3, 1, 1, &__block_literal_global_10748, a4.width, a4.height);
}

+ (void)drawGlyphsIntoWorkflowsIfNecessary:(id)a3 glyphSize:(CGSize)a4 roundedIcon:(BOOL)a5 synchronously:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  void *v16;
  CGColorSpaceRef DeviceRGB;
  WFRemoteImageDrawingContext *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void (**v27)(void);
  _QWORD v28[4];
  id v29;
  WFRemoteImageDrawingContext *v30;
  void (**v31)(_QWORD);
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v8 = a6;
  v9 = a5;
  height = a4.height;
  width = a4.width;
  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(_QWORD))a7;
  v14 = v13;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v13[2](v13);
  }
  else
  {
    objc_msgSend(v12, "if_compactMap:", &__block_literal_global_122);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = DeviceRGB;
      v27 = (void (**)(void))_Block_copy(aBlock);
      v18 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:]([WFRemoteImageDrawingContext alloc], "initWithImageCount:singleImageSize:scale:colorSpace:", objc_msgSend(v16, "count"), DeviceRGB, width, height, 0.0);
      if (v18)
      {
        objc_msgSend(v16, "valueForKey:", CFSTR("glyphCharacter"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "if_compactMap:", &__block_literal_global_178);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        if (v21 != objc_msgSend(v19, "count"))
        {

          v20 = 0;
        }
        +[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_181;
          v33[3] = &unk_1E5FC88A0;
          v23 = v33;
          v33[4] = v14;
          objc_msgSend(v22, "synchronousRemoteDataStoreWithErrorHandler:", v33);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_183;
          v32[3] = &unk_1E5FC88A0;
          v23 = v32;
          v32[4] = v14;
          objc_msgSend(v22, "asynchronousRemoteDataStoreWithErrorHandler:", v32);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v26 = (void *)v24;

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_184;
        v28[3] = &unk_1E5FC7900;
        v29 = v16;
        v30 = v18;
        v31 = v14;
        objc_msgSend(v26, "drawGlyphs:withBackgroundColorValues:padding:rounded:intoContext:completion:", v19, v20, v9, v30, v28, 0.0);

      }
      else
      {
        getWFVoiceShortcutClientLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]";
          v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_1AF681000, v25, OS_LOG_TYPE_ERROR, "%s Could not create remote image drawing context for drawing icons into workflows: %@", buf, 0x16u);
        }

        v14[2](v14);
      }

      v27[2]();
    }
    else
    {
      v14[2](v14);
    }

  }
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2(uint64_t a1)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 32));
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_181(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching synchronous VCVoiceShortcutClient proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_183(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "+[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_ERROR, "%s Error fetching asynchronous VCVoiceShortcutClient proxy: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_184(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_185;
  v3[3] = &unk_1E5FC6F90;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_2_185(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = (void *)MEMORY[0x1B5DFC064]();
  v6 = objc_msgSend(*(id *)(a1 + 32), "imageAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v7, "setIconImage:scale:", v6);
  objc_autoreleasePoolPop(v5);

}

id __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke_176(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "backgroundColorValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __104__WFObservableResult_drawGlyphsIntoWorkflowsIfNecessary_glyphSize_roundedIcon_synchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEE5FF80))
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

@end
