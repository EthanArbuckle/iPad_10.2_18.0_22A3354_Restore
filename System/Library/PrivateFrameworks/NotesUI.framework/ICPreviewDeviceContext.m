@implementation ICPreviewDeviceContext

void __39__ICPreviewDeviceContext_sharedContext__block_invoke()
{
  ICPreviewDeviceContext *v0;
  void *v1;

  v0 = objc_alloc_init(ICPreviewDeviceContext);
  v1 = (void *)sharedContext;
  sharedContext = (uint64_t)v0;

}

- (ICPreviewDeviceContext)init
{
  ICPreviewDeviceContext *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICPreviewDeviceContext;
  v2 = -[ICPreviewDeviceContext init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_screensChangedNotification_, *MEMORY[0x1E0DC5348], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_screensChangedNotification_, *MEMORY[0x1E0DC5350], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_screensChangedNotification_, *MEMORY[0x1E0DC5358], 0);

  }
  return v2;
}

- (id)deviceInfoScalable:(BOOL)a3
{
  _BOOL4 v3;
  ICPreviewDeviceContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[3];

  v3 = a3;
  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    -[ICPreviewDeviceContext scalableDeviceInfo](v4, "scalableDeviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 384.0, 1.0);
      v21[0] = v6;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 192.0, 1.0);
      v21[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPreviewDeviceContext setScalableDeviceInfo:](v4, "setScalableDeviceInfo:", v8);

    }
    -[ICPreviewDeviceContext scalableDeviceInfo](v4, "scalableDeviceInfo");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICPreviewDeviceContext nonScalableDeviceInfo](v4, "nonScalableDeviceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 88.0, 1.0);
      v20[0] = v11;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 88.0, 2.0);
      v20[1] = v12;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 88.0, 3.0);
      v20[2] = v13;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 384.0, 1.0);
      v20[3] = v14;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 384.0, 2.0);
      v20[4] = v15;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C20]), "initWithImageSize:scale:", 384.0, 3.0);
      v20[5] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICPreviewDeviceContext setNonScalableDeviceInfo:](v4, "setNonScalableDeviceInfo:", v17);

    }
    -[ICPreviewDeviceContext nonScalableDeviceInfo](v4, "nonScalableDeviceInfo");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v9;
  objc_sync_exit(v4);

  return v18;
}

- (NSArray)scalableDeviceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

+ (id)sharedContext
{
  if (sharedContext_once != -1)
    dispatch_once(&sharedContext_once, &__block_literal_global_46);
  return (id)sharedContext;
}

- (void)setScalableDeviceInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICPreviewDeviceContext;
  -[ICPreviewDeviceContext dealloc](&v4, sel_dealloc);
}

- (NSArray)deviceScales
{
  ICPreviewDeviceContext *v2;
  NSArray *deviceScales;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  deviceScales = v2->_deviceScales;
  if (!deviceScales)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "screens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("scale"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "scale", (_QWORD)v18);
          objc_msgSend(v13, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v4, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v15 = v2->_deviceScales;
    v2->_deviceScales = v4;

    deviceScales = v2->_deviceScales;
  }
  v16 = deviceScales;
  objc_sync_exit(v2);

  return v16;
}

- (double)maxDeviceScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[ICPreviewDeviceContext deviceScales](self, "deviceScales");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)maxSizeOfPreviewDeviceInfoImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ICPreviewDeviceContext deviceInfoScalable:](self, "deviceInfoScalable:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke;
  v9[3] = &unk_1E5C20D60;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  -[ICPreviewDeviceContext deviceInfoScalable:](self, "deviceInfoScalable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke_2;
  v8[3] = &unk_1E5C20D60;
  v8[4] = &v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "imageSize");
  v6 = v5;
  objc_msgSend(v4, "scale");
  v8 = v7;

  v9 = v6 * v8;
  if (v3 >= v6 * v8)
    v9 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
}

void __57__ICPreviewDeviceContext_maxSizeOfPreviewDeviceInfoImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "imageSize");
  v6 = v5;
  objc_msgSend(v4, "scale");
  v8 = v7;

  v9 = v6 * v8;
  if (v3 >= v6 * v8)
    v9 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
}

- (void)screensChangedNotification:(id)a3
{
  NSArray *deviceScales;
  ICPreviewDeviceContext *obj;

  obj = self;
  objc_sync_enter(obj);
  deviceScales = obj->_deviceScales;
  obj->_deviceScales = 0;

  objc_sync_exit(obj);
}

- (NSArray)nonScalableDeviceInfo
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNonScalableDeviceInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonScalableDeviceInfo, 0);
  objc_storeStrong((id *)&self->_scalableDeviceInfo, 0);
  objc_storeStrong((id *)&self->_deviceScales, 0);
}

@end
