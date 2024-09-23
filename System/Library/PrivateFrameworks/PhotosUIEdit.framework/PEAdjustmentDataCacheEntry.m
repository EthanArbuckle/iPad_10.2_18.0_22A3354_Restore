@implementation PEAdjustmentDataCacheEntry

- (PEAdjustmentDataCacheEntry)initWithAsset:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  PEAdjustmentDataCacheEntry *v8;
  dispatch_group_t v9;
  OS_dispatch_group *group;
  dispatch_group_t v11;
  OS_dispatch_group *timeoutGroup;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PEAdjustmentDataCacheEntry;
  v7 = a3;
  v8 = -[PEAdjustmentDataCacheEntry init](&v14, sel_init);
  v9 = dispatch_group_create();
  group = v8->_group;
  v8->_group = (OS_dispatch_group *)v9;

  v11 = dispatch_group_create();
  timeoutGroup = v8->_timeoutGroup;
  v8->_timeoutGroup = (OS_dispatch_group *)v11;

  v8->_disposition = 0;
  -[PEAdjustmentDataCacheEntry _load:networkAccessAllowed:originalAdjustmentData:](v8, "_load:networkAccessAllowed:originalAdjustmentData:", v7, v6, v5, v14.receiver, v14.super_class);

  return v8;
}

- (void)_load:(id)a3 networkAccessAllowed:(BOOL)a4 originalAdjustmentData:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  dispatch_time_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  PEAdjustmentDataCacheEntry *v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  BOOL v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if ((objc_msgSend(v8, "hasAdjustments") & 1) != 0)
  {
    -[PEAdjustmentDataCacheEntry setDisposition:](self, "setDisposition:", 0);
    dispatch_group_enter((dispatch_group_t)self->_group);
    dispatch_group_enter((dispatch_group_t)self->_timeoutGroup);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v9 = objc_alloc_init(MEMORY[0x24BDE3598]);
    v10 = v9;
    if (v5)
      v11 = 17;
    else
      v11 = 16;
    objc_msgSend(v9, "setVersion:", v11);
    objc_msgSend(v10, "setNetworkAccessAllowed:", v6);
    objc_msgSend((id)objc_opt_class(), "_resultHandlingQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResultHandlerQueue:", v12);

    objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke;
    v25[3] = &unk_24C6188F8;
    v27 = v32;
    v25[4] = self;
    v15 = v8;
    v29 = v5;
    v26 = v15;
    v28 = v30;
    objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, 0, v10, v25, 0.0, 0.0);

    v16 = dispatch_time(0, 1500000000);
    +[PEAdjustmentDataCacheEntry _resultHandlingQueue](PEAdjustmentDataCacheEntry, "_resultHandlingQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_67;
    v19[3] = &unk_24C618920;
    v22 = v32;
    v24 = v5;
    v23 = v30;
    v20 = v15;
    v21 = self;
    dispatch_after(v16, v17, v19);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    -[PEAdjustmentDataCacheEntry setDisposition:](self, "setDisposition:", 1);
    objc_msgSend(v8, "fetchPropertySetsIfNeeded");
    objc_msgSend(v8, "originalMetadataProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEAdjustmentDataCacheEntry setInputSize:](self, "setInputSize:", (double)objc_msgSend(v18, "originalWidth"), (double)objc_msgSend(v18, "originalHeight"));

  }
}

- (void)deliverOn:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *group;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  group = self->_group;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__PEAdjustmentDataCacheEntry_deliverOn_completion___block_invoke;
  v9[3] = &unk_24C618948;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_group_notify(group, (dispatch_queue_t)a3, v9);

}

- (void)waitForResultsWithTimeout
{
  NSObject *timeoutGroup;
  dispatch_time_t v3;

  timeoutGroup = self->_timeoutGroup;
  v3 = dispatch_time(0, 1500000000);
  dispatch_group_wait(timeoutGroup, v3);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_group)timeoutGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimeoutGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PICompositionController)compositionController
{
  return (PICompositionController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompositionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(int64_t)a3
{
  self->_disposition = a3;
}

- (CGSize)inputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInputSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_inputSize, &v3, 16, 1, 0);
}

- (NSString)editorBundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEditorBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_timeoutGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

uint64_t __51__PEAdjustmentDataCacheEntry_deliverOn_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  NSObject *v4;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  _QWORD v25[5];
  char v26[48];
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    PLPhotoEditGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v4, OS_LOG_TYPE_INFO, "Extra call to requestImageForAsset callback (_load)", buf, 2u);
    }
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDE36C0]);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject editorBundleID](v4, "editorBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEditorBundleID:", v6);

    v28 = 0;
    v29 = 0;
    v7 = +[PESerializationUtility adjustmentDataIsSupported:](PESerializationUtility, "adjustmentDataIsSupported:", v4);
    v8 = v7;
    if (!v7)
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 40), "originalAVAssetOrProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v27 = 0;
      objc_msgSend(MEMORY[0x24BE6C438], "firstEnabledVideoTrackInAsset:error:", v9, &v27);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CFString *)v27;
      if (v10)
      {
        v12 = (void *)MEMORY[0x24BE6C438];
        objc_msgSend(v10, "preferredTransform");
        v13 = objc_msgSend(v12, "videoOrientationForAssetPreferredTransform:", v26);
      }
      else
      {
        PLPhotoEditGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v11;
          _os_log_impl(&dword_20D13D000, v16, OS_LOG_TYPE_INFO, "[PEAdjustmentDataCache] failed to extract orientation from video track %@", buf, 0xCu);
        }

        v13 = 1;
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "fetchPropertySetsIfNeeded");
      v14 = *(void **)(a1 + 40);
      if (v14)
      {
        objc_msgSend(v14, "originalMetadataProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (int)objc_msgSend(v15, "originalExifOrientation");

      }
      else
      {
        v13 = 1;
      }
    }
    if (NUOrientationIsValid())
      v17 = v13;
    else
      v17 = 1;
    objc_msgSend(MEMORY[0x24BE72020], "compositionControllerWithAdjustmentData:asset:imageOrientation:outMasterWidth:outMasterHeight:", v4, *(_QWORD *)(a1 + 40), v17, &v29, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orientationAdjustmentController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = *MEMORY[0x24BE71E18];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_59;
      v25[3] = &__block_descriptor_40_e43_v16__0__PIOrientationAdjustmentController_8l;
      v25[4] = v17;
      objc_msgSend(v18, "modifyAdjustmentWithKey:modificationBlock:", v20, v25);
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompositionController:", v18);
    objc_msgSend(*(id *)(a1 + 32), "setDisposition:", 2);

    v21 = v29;
    if (!v29 || (v22 = v28) == 0)
    {
LABEL_21:
      v21 = 1024;
      v22 = 769;
      v28 = 769;
      v29 = 1024;
    }
    objc_msgSend(*(id *)(a1 + 32), "setInputSize:", (double)v21, (double)v22);
    if (!v8)
    {
      PLPhotoEditGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        if (*(_BYTE *)(a1 + 64))
          v24 = CFSTR("YES");
        else
          v24 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v31 = v24;
        _os_log_impl(&dword_20D13D000, v23, OS_LOG_TYPE_INFO, "[PEAdjustmentDataCache] editing as opaque. parsedEnvelope does not contain supported photo adjustments. Is loading original adjustment data: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setDisposition:", 3);
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
  }

}

void __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_67(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PLPhotoEditGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 64))
        v4 = CFSTR("NO");
      v5 = 138412546;
      v6 = v3;
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_20D13D000, v2, OS_LOG_TYPE_ERROR, "PEAdjustmentDataCache timed out for asset: %@ original adjustment data: %@", (uint8_t *)&v5, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 16));
  }
}

uint64_t __80__PEAdjustmentDataCacheEntry__load_networkAccessAllowed_originalAdjustmentData___block_invoke_59(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOrientation:", *(_QWORD *)(a1 + 32));
}

+ (id)_resultHandlingQueue
{
  if (_resultHandlingQueue_onceToken != -1)
    dispatch_once(&_resultHandlingQueue_onceToken, &__block_literal_global_1174);
  return (id)_resultHandlingQueue_resultHandlingQueue;
}

void __50__PEAdjustmentDataCacheEntry__resultHandlingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PEAdjustmentDataCache.resultHandlingQueue", attr);
  v2 = (void *)_resultHandlingQueue_resultHandlingQueue;
  _resultHandlingQueue_resultHandlingQueue = (uint64_t)v1;

}

@end
