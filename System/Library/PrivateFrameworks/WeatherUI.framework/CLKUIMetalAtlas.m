@implementation CLKUIMetalAtlas

- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4
{
  id v7;
  CLKUIMetalAtlas *v8;
  CLKUIMetalAtlas *v9;
  NSRecursiveLock *v10;
  NSRecursiveLock *prewarmLock;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIMetalAtlas;
  v8 = -[CLKUIAtlas initWithUuid:](&v13, sel_initWithUuid_, a3);
  v9 = v8;
  if (v8)
  {
    v8->_prewarmState = 0;
    objc_storeStrong((id *)&v8->_nilTexture, a4);
    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    prewarmLock = v9->_prewarmLock;
    v9->_prewarmLock = v10;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  OS_dispatch_queue *loaderQueue;
  objc_super v5;

  -[CLKUIMetalAtlas purge](self, "purge");
  if (self->_loaderQueue)
  {
    +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "returnTextureLoadingQueue:", self->_loaderQueue);

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)CLKUIMetalAtlas;
  -[CLKUIMetalAtlas dealloc](&v5, sel_dealloc);
}

+ (id)_createMTLTextureWithBacking:(id)a3 device:(id)a4 encoder:(id)a5
{
  id v7;
  id v8;
  id v9;
  __int128 v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v12 = 0;
    v11 = 0u;
    objc_msgSend(v7, "structure");
    +[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:].cold.1();
  }

  return 0;
}

- (void)prewarm
{
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("none");
  if (*a2 == 1)
    v6 = CFSTR("prewarming");
  if (*a2 == 2)
    v7 = CFSTR("prewarmed");
  else
    v7 = (__CFString *)v6;
  v8 = v7;
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1AFABF000, a3, OS_LOG_TYPE_ERROR, "Not prewarming %@ because prewarmState = %@, but the texture is already loaded", (uint8_t *)&v9, 0x16u);

}

void __26__CLKUIMetalAtlas_prewarm__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    +[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:](CLKUIMetalAtlas, "_createMTLTextureWithBacking:device:encoder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[10];
    WeakRetained[10] = v3;

    CLKLoggingObjectForDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AFABF000, v5, OS_LOG_TYPE_DEFAULT, "Finished prewarming texture %@", (uint8_t *)&v7, 0xCu);

    }
    if (WeakRetained[11] == 1)
      WeakRetained[11] = 2;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

- (void)bind:(id)a3 slot:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_block_t v10;
  void *v11;
  OS_dispatch_queue *loaderQueue;
  MTLTexture *texture;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  MTLTexture *v26;
  MTLTexture *v27;
  MTLTexture *nilTexture;
  _QWORD block[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CLKUIAtlas uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_25;
  CLKLoggingObjectForDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CLKUIAtlas uuid](self, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl(&dword_1AFABF000, v8, OS_LOG_TYPE_DEFAULT, "Binding atlas %@", buf, 0xCu);

  }
  if (self->_prewarmState && !self->_texture && self->_loaderQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke;
    block[3] = &unk_1E6076110;
    block[4] = self;
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v10);
    +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "returnTextureLoadingQueue:", self->_loaderQueue);

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;

  }
  texture = self->_texture;
  CLKLoggingObjectForDomain();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (texture)
  {
    if (!v15)
      goto LABEL_23;
    -[CLKUIAtlas uuid](self, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v16;
    _os_log_impl(&dword_1AFABF000, v14, OS_LOG_TYPE_DEFAULT, "Texture prewarmed in atlas %@", buf, 0xCu);
    goto LABEL_22;
  }
  if (v15)
  {
    -[CLKUIAtlas uuid](self, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v17;
    _os_log_impl(&dword_1AFABF000, v14, OS_LOG_TYPE_DEFAULT, "Texure not prewarmed. %@", buf, 0xCu);

  }
  -[CLKUIAtlas backing](self, "backing");
  v18 = objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v18)
  {
    v19 = -[NSObject bytesLength](v18, "bytesLength");
    +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "ensureMemoryAvailable:", v19) & 1) == 0)
    {
      CLKLoggingObjectForDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKUIAtlas uuid](self, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v21;
        _os_log_impl(&dword_1AFABF000, v20, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);

      }
    }
    objc_msgSend(v6, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    +[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:](CLKUIMetalAtlas, "_createMTLTextureWithBacking:device:encoder:", v14, v25, v6);
    v26 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    v27 = self->_texture;
    self->_texture = v26;

    self->_prewarmState = 2;
    -[CLKUIAtlas setStatus:](self, "setStatus:", 3);
    objc_msgSend(v16, "notifyAtlas:willChangeToMemoryCost:", self, v19);
    -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", v19);

LABEL_22:
  }
LABEL_23:

  if (!self->_texture)
  {
LABEL_25:
    nilTexture = self->_nilTexture;
    goto LABEL_26;
  }
  -[CLKUIAtlas setBoundTime:](self, "setBoundTime:", CACurrentMediaTime());
  nilTexture = self->_texture;
LABEL_26:
  objc_msgSend(v6, "setFragmentTexture:atIndex:", nilTexture, a4);

}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CLKLoggingObjectForDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AFABF000, v2, OS_LOG_TYPE_DEFAULT, "Loading prewarmed texture %@", (uint8_t *)&v6, 0xCu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(*(_QWORD *)(a1 + 32) + 80));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = 0;

}

- (void)purge
{
  void *v3;
  dispatch_block_t v4;
  MTLTexture *texture;
  void *v6;
  _QWORD block[5];

  -[CLKUIAtlas uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_loaderQueue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __24__CLKUIMetalAtlas_purge__block_invoke;
      block[3] = &unk_1E6076110;
      block[4] = self;
      v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_sync((dispatch_queue_t)self->_loaderQueue, v4);

    }
    if (self->_texture)
    {
      if (-[CLKUIAtlas isPurgable](self, "isPurgable"))
      {
        texture = self->_texture;
        self->_texture = 0;

        -[CLKUIAtlas setStatus:](self, "setStatus:", 4);
        +[CLKUIResourceManager sharedInstance](CLKUIResourceManager, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notifyAtlas:willChangeToMemoryCost:", self, 0);
        -[CLKUIAtlas setMemoryCost:](self, "setMemoryCost:", 0);
        self->_prewarmState = 0;

      }
    }
  }
}

void __24__CLKUIMetalAtlas_purge__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CLKLoggingObjectForDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AFABF000, v2, OS_LOG_TYPE_DEFAULT, "Purging prewarming texture %@", (uint8_t *)&v6, 0xCu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(*(_QWORD *)(a1 + 32) + 80));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = 0;

}

- (MTLTexture)nilTexture
{
  return self->_nilTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTexture, 0);
  objc_storeStrong((id *)&self->_prewarmLock, 0);
  objc_storeStrong((id *)&self->_loaderQueue_prewarmedTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.1()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 220, "opt.width > 0 && opt.height > 0");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 221, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 222, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.4()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 224, "isMipmapped || (opt.mipCount < 2)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.5()
{
  __assert_rtn("_CLKUICalculateNumCompressedTexMipmaps", "CLKUIMetalTexture.m", 100, "mipCount != 0");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 304, "planeStart == (uint8_t*)opt.bytes + opt.bytesLength");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.7()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 267, "(width > 0) && (height > 0)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 225, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.9()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 223, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

@end
