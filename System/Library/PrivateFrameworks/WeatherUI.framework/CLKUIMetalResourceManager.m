@implementation CLKUIMetalResourceManager

- (CLKUIMetalResourceManager)init
{
  CLKUIMetalResourceManager *v2;
  MTLDevice *v3;
  MTLDevice *device;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalResourceManager;
  v2 = -[CLKUIResourceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v2->_device;
    v2->_device = v3;

  }
  return v2;
}

+ (MTLDevice)sharedDevice
{
  id *v2;
  MTLDevice *v3;

  objc_msgSend(a1, "sharedMetalInstance");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (MTLDevice *)v2[9];

  return v3;
}

+ (id)sharedCommandQueue
{
  id v2;
  id WeakRetained;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(sharedCommandQueue__sharedCommandQueue);
  if (!WeakRetained)
  {
    objc_msgSend(v2, "sharedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id)objc_msgSend(v4, "newCommandQueue");

    objc_storeWeak(sharedCommandQueue__sharedCommandQueue, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (MTLTexture)sharedNilTexture2D
{
  void *v3;
  void *v4;
  id *v5;
  id v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id *v13;
  id v14;

  objc_msgSend(a1, "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke;
    v12 = &unk_1E60761C8;
    v13 = v3;
    v14 = a1;
    if (sharedNilTexture2D_onceToken != -1)
      dispatch_once(&sharedNilTexture2D_onceToken, &v9);
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5[10];

    v7 = v13;
  }
  else
  {
    objc_msgSend(a1, "sharedMetalInstance");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v7[10];
  }

  return (MTLTexture *)v6;
}

void __47__CLKUIMetalResourceManager_sharedNilTexture2D__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[3];
  int64x2_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, 4, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsage:", 0);
  +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStorageMode:", objc_msgSend(v3, "defaultStorageModeForDevice:", *(_QWORD *)(a1 + 32)));

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v2);
  objc_msgSend(v4, "setLabel:", CFSTR("CLKUIMetalResourceManager Nil Texture2D"));
  v5 = malloc_type_calloc(1uLL, 0x40uLL, 0x212AFB53uLL);
  memset(v8, 0, sizeof(v8));
  v9 = vdupq_n_s64(4uLL);
  v10 = 1;
  objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v8, 0, 0, v5, 16, 64);
  free(v5);
  objc_msgSend(*(id *)(a1 + 40), "sharedMetalInstance");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[10];
  v6[10] = v4;

}

+ (MTLTexture)sharedNilTextureCube
{
  void *v3;
  void *v4;
  id *v5;
  id v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id *v13;
  id v14;

  objc_msgSend(a1, "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke;
    v12 = &unk_1E60761C8;
    v13 = v3;
    v14 = a1;
    if (sharedNilTextureCube_onceToken != -1)
      dispatch_once(&sharedNilTextureCube_onceToken, &v9);
    objc_msgSend(a1, "sharedMetalInstance", v9, v10, v11, v12);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5[11];

    v7 = v13;
  }
  else
  {
    objc_msgSend(a1, "sharedMetalInstance");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v7[11];
  }

  return (MTLTexture *)v6;
}

void __49__CLKUIMetalResourceManager_sharedNilTextureCube__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  _QWORD *v7;
  void *v8;
  _QWORD v9[3];
  int64x2_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 80, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUsage:", 0);
  +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStorageMode:", objc_msgSend(v3, "defaultStorageModeForDevice:", *(_QWORD *)(a1 + 32)));

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v2);
  objc_msgSend(v4, "setLabel:", CFSTR("CLKUIMetalResourceManager Nil TextureCube"));
  v5 = malloc_type_calloc(1uLL, 0x40uLL, 0xD8D31C23uLL);
  for (i = 0; i != 6; ++i)
  {
    memset(v9, 0, sizeof(v9));
    v10 = vdupq_n_s64(4uLL);
    v11 = 1;
    objc_msgSend(v4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, i, v5, 16, 64);
  }
  free(v5);
  objc_msgSend(*(id *)(a1 + 40), "sharedMetalInstance");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7[11];
  v7[11] = v4;

}

+ (void)addCompletedErrorCheckToCommandBuffer:(id)a3 forCase:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke;
  v7[3] = &unk_1E60761F0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "addCompletedHandler:", v7);

}

void __75__CLKUIMetalResourceManager_addCompletedErrorCheckToCommandBuffer_forCase___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "status") == 4;
  v4 = v7;
  if (!v3)
  {
    objc_msgSend(v7, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");
    if (objc_msgSend(v5, "code") == 4 && (CLKInternalBuild() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CLKUIMTLCommandBufferException"), CFSTR("GPU Error Code %lu found submitting MTLCommandBuffer for %@: %@"), v6, *(_QWORD *)(a1 + 32), v5);

    v4 = v7;
  }

}

- (id)nullAtlas2D
{
  if (nullAtlas2D_onceToken != -1)
    dispatch_once(&nullAtlas2D_onceToken, &__block_literal_global_3);
  return (id)__nullAtlas2D;
}

void __40__CLKUIMetalResourceManager_nullAtlas2D__block_invoke()
{
  CLKUIMetalAtlas *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CLKUIMetalAtlas alloc];
  +[CLKUIMetalResourceManager sharedNilTexture2D](CLKUIMetalResourceManager, "sharedNilTexture2D");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CLKUIMetalAtlas initWithUuid:nilTexture:](v0, "initWithUuid:nilTexture:", 0, v3);
  v2 = (void *)__nullAtlas2D;
  __nullAtlas2D = v1;

}

- (id)nullAtlasCube
{
  if (nullAtlasCube_onceToken != -1)
    dispatch_once(&nullAtlasCube_onceToken, &__block_literal_global_13);
  return (id)__nullAtlasCube;
}

void __42__CLKUIMetalResourceManager_nullAtlasCube__block_invoke()
{
  CLKUIMetalAtlas *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CLKUIMetalAtlas alloc];
  +[CLKUIMetalResourceManager sharedNilTextureCube](CLKUIMetalResourceManager, "sharedNilTextureCube");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[CLKUIMetalAtlas initWithUuid:nilTexture:](v0, "initWithUuid:nilTexture:", 0, v3);
  v2 = (void *)__nullAtlasCube;
  __nullAtlasCube = v1;

}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "atlas");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nilTexture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLKUIMetalResourceManager _newAtlasForUuid:nilTexture:](self, "_newAtlasForUuid:nilTexture:", v6, v8);

  return v9;
}

- (id)_newAtlasForUuid:(id)a3 nilTexture:(id)a4
{
  id v5;
  id v6;
  CLKUIMetalAtlas *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CLKUIMetalAtlas initWithUuid:nilTexture:]([CLKUIMetalAtlas alloc], "initWithUuid:nilTexture:", v6, v5);

  return v7;
}

- (void)_purgeAtlases:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "purge");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTextureCube, 0);
  objc_storeStrong((id *)&self->_nilTexture2D, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
