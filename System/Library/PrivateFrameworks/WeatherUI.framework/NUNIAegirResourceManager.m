@implementation NUNIAegirResourceManager

+ (id)sharedInstanceWithDisplayPixelFormat:(unint64_t)a3
{
  id v4;
  NUNIAegirResourceManager *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a1;
  objc_sync_enter(v4);
  if (!__sharedInstance)
  {
    v5 = -[NUNIAegirResourceManager initWithDisplayPixelFormat:]([NUNIAegirResourceManager alloc], "initWithDisplayPixelFormat:", a3);
    v6 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v5;

  }
  objc_sync_exit(v4);

  v7 = (void *)__sharedInstance;
  if (*(_QWORD *)(__sharedInstance + 32) != a3)
  {
    NUNILoggingObjectForDomain(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[NUNIAegirResourceManager sharedInstanceWithDisplayPixelFormat:].cold.1(a3, v8);

    v7 = (void *)__sharedInstance;
  }
  return v7;
}

+ (void)_deallocInstance:(id)a3
{
  void *v3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v3 = (void *)__sharedInstance;
  __sharedInstance = 0;

  objc_sync_exit(obj);
}

- (NUNIAegirResourceManager)initWithDisplayPixelFormat:(unint64_t)a3
{
  NUNIAegirResourceManager *v4;
  uint64_t v5;
  CLKUIResourceProviderKey *resourceProviderKey;
  uint64_t v7;
  NSMapTable *textureGroupHashTable;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUNIAegirResourceManager;
  v4 = -[NUNIAegirResourceManager init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    resourceProviderKey = v4->_resourceProviderKey;
    v4->_resourceProviderKey = (CLKUIResourceProviderKey *)v5;

    v4->_displayPixelFormat = a3;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    textureGroupHashTable = v4->_textureGroupHashTable;
    v4->_textureGroupHashTable = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__handleCloudCoverTextureExpired, CFSTR("CloudCoverExpiredNotification"), 0);

  }
  return v4;
}

- (void)prepareForRendering
{
  MTLDevice *v3;
  MTLDevice *device;
  MTLDevice *v5;
  void *v6;
  MTLLibrary *v7;
  MTLLibrary *library;

  if (!self->_device)
  {
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v3 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    self->_device = v3;

    v5 = self->_device;
    NUNIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (MTLLibrary *)-[MTLDevice newDefaultLibraryWithBundle:error:](v5, "newDefaultLibraryWithBundle:error:", v6, 0);
    library = self->_library;
    self->_library = v7;

    -[NUNIAegirResourceManager _loadGeometry](self, "_loadGeometry");
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NUNIAegirResourceManager;
  -[NUNIAegirResourceManager dealloc](&v2, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  int v2;
  void *v3;

  v2 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = (void *)objc_opt_class();
  if (v2)
    objc_msgSend(v3, "_deallocInstance:", 0);
  else
    objc_msgSend(v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__deallocInstance_, 0, 0);
}

- (void)addClient
{
  NUNIAegirResourceManager *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_clients;
  objc_sync_exit(obj);

}

- (void)removeClient
{
  NUNIAegirResourceManager *v2;
  uint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_clients - 1;
  v2->_clients = v3;
  objc_sync_exit(v2);

  if (!v3)
    -[NUNIAegirResourceManager _asyncDeallocInstance](v2, "_asyncDeallocInstance");
}

- (void)setPipelineConstants:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id obj;

  obj = (id)objc_opt_new();
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3, 16, 0);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 2, 16, 1);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 4, 16, 2);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 6, 16, 3);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 8, 16, 4);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 10, 16, 5);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 12, 16, 6);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 14, 16, 7);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 16, 16, 8);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 18, 16, 9);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 20, 16, 10);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 22, 16, 11);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 24, 16, 12);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 26, 16, 13);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 28, 16, 14);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 30, 16, 15);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 32, 16, 16);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 34, 16, 17);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 36, 16, 18);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 38, 16, 19);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 40, 16, 20);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 42, 16, 21);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 44, 16, 22);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 46, 16, 23);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 48, 16, 24);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 50, 16, 25);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 52, 16, 26);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 54, 16, 27);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 56, 16, 28);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 58, 16, 29);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 60, 16, 30);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 62, 16, 31);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 64, 16, 32);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 66, 16, 33);
  objc_msgSend(obj, "setConstantValue:type:atIndex:", a3 + 68, 16, 34);
  objc_storeStrong((id *)(a1 + 880), obj);
  v5 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = 0;

  v6 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;

  v7 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  v8 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = 0;

  v9 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = 0;

  v10 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;

  v11 = 0;
  v12 = a1 + 96;
  do
  {
    for (i = 0; i != 32; i += 8)
    {
      v14 = *(void **)(v12 + i);
      *(_QWORD *)(v12 + i) = 0;

    }
    ++v11;
    v12 += 32;
  }
  while (v11 != 24);

}

- (void)_loadGeometry
{
  MTLBuffer *v3;
  MTLBuffer *rectVerticesBuffer;
  MTLBuffer *v5;
  MTLBuffer *starVerticesBuffer;

  v3 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &quadVertices, 16, 1);
  rectVerticesBuffer = self->_rectVerticesBuffer;
  self->_rectVerticesBuffer = v3;

  v5 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &starVertices, 67392, 1);
  starVerticesBuffer = self->_starVerticesBuffer;
  self->_starVerticesBuffer = v5;

}

- (id)rectVerticesBuffer
{
  return self->_rectVerticesBuffer;
}

- (id)starVerticesBuffer
{
  return self->_starVerticesBuffer;
}

- (id)textureGroupWithSuffix:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t j;
  void *v22;
  int v23;
  const __CFString *v24;
  void *v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t n;
  void *v40;
  uint64_t ii;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  NUNIAegirTextureGroup *v48;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_textureGroupHashTable, "objectForKey:", v6);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v48 = objc_alloc_init(NUNIAegirTextureGroup);
    +[CLKUITexture nullTexture2D](CLKUITexture, "nullTexture2D");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    do
      objc_msgSend(v10, "setObject:atIndexedSubscript:", &stru_1E6095498, v8++);
    while (v8 != (char *)24);
    +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v7;
    v12 = objc_msgSend(v11, "supportXR10ForDevice:", v7);

    if (v12)
      v13 = CFSTR("c4a");
    else
      v13 = CFSTR("c4a_b");
    objc_msgSend(v10, "setObject:atIndexedSubscript:", v13, 4);
    v14 = (void *)objc_opt_new();
    for (i = 0; i != 24; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("-%@"), v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLKUITexture textureWithProviderDelegate:uuid:nullTexture:](CLKUITexture, "textureWithProviderDelegate:uuid:nullTexture:", self, v18, v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

      }
      else
      {
        objc_msgSend(v14, "addObject:", v9);
      }

    }
    -[NUNIAegirTextureGroup setAlbedos:](v48, "setAlbedos:", v14);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 24; ++j)
      objc_msgSend(v20, "setObject:atIndexedSubscript:", &stru_1E6095498, j);
    +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "supportXR10ForDevice:", v47);

    if (v23)
      v24 = CFSTR("c4n");
    else
      v24 = CFSTR("c4n_b");
    objc_msgSend(v20, "setObject:atIndexedSubscript:", v24, 4);
    v25 = (void *)objc_opt_new();
    for (k = 0; k != 24; ++k)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", k);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("-%@"), v6);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLKUITexture textureWithProviderDelegate:uuid:nullTexture:](CLKUITexture, "textureWithProviderDelegate:uuid:nullTexture:", self, v29, v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v30);

      }
      else
      {
        objc_msgSend(v25, "addObject:", v9);
      }

    }
    -[NUNIAegirTextureGroup setNormals:](v48, "setNormals:", v25);

    v31 = (void *)objc_opt_new();
    for (m = 0; m != 24; ++m)
    {
      v33 = (void *)textureGroupWithSuffix_device__uuidEmissives[m];
      if (v33)
      {
        objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("-%@"), v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLKUITexture textureWithProviderDelegate:uuid:nullTexture:](CLKUITexture, "textureWithProviderDelegate:uuid:nullTexture:", self, v34, v9);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v35);

      }
      else
      {
        objc_msgSend(v31, "addObject:", v9);
      }
    }
    -[NUNIAegirTextureGroup setEmissives:](v48, "setEmissives:", v31);

    v36 = (void *)objc_opt_new();
    v37 = (void *)objc_opt_new();
    v38 = (void *)objc_opt_new();
    for (n = 0; n != 24; ++n)
    {
      if (!textureGroupWithSuffix_device__uuidClouds[n])
      {
        objc_msgSend(v36, "addObject:", v9);
        objc_msgSend(v37, "addObject:", v9);
        objc_msgSend(v38, "addObject:", v9);
      }
    }
    -[NUNIAegirTextureGroup setCloudsLo:](v48, "setCloudsLo:", v36);
    -[NUNIAegirTextureGroup setCloudsMd:](v48, "setCloudsMd:", v37);
    -[NUNIAegirTextureGroup setCloudsHi:](v48, "setCloudsHi:", v38);

    v40 = (void *)objc_opt_new();
    for (ii = 0; ii != 24; ++ii)
    {
      if (((0x40B7FuLL >> ii) & 1) != 0)
      {
        objc_msgSend(v40, "addObject:", v9);
      }
      else
      {
        objc_msgSend(textureGroupWithSuffix_device__uuidGradients[ii], "stringByAppendingFormat:", CFSTR("-%@"), v6);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[CLKUITexture textureWithProviderDelegate:uuid:nullTexture:](CLKUITexture, "textureWithProviderDelegate:uuid:nullTexture:", self, v42, v9);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v43);

      }
    }
    v8 = (char *)v48;
    -[NUNIAegirTextureGroup setGradients:](v48, "setGradients:", v40);

    objc_msgSend(CFSTR("s1a"), "stringByAppendingFormat:", CFSTR("-%@"), v6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKUITexture textureWithProviderDelegate:uuid:nullTexture:](CLKUITexture, "textureWithProviderDelegate:uuid:nullTexture:", self, v44, v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIAegirTextureGroup setStarfield:](v48, "setStarfield:", v45);

    -[NSMapTable setObject:forKey:](self->_textureGroupHashTable, "setObject:forKey:", v48, v6);
    v7 = v47;
  }

  return v8;
}

- (id)renderDisplayPipeline
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateDisplay;

  v3 = self->_pipelineStateDisplay;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_pass_vsh"), CFSTR("aegir_display_fsh"), 0, 0, 4, self->_displayPixelFormat, 0);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateDisplay = self->_pipelineStateDisplay;
    self->_pipelineStateDisplay = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForPost
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStatePost;

  v3 = self->_pipelineStatePost;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_pass_vsh"), CFSTR("aegir_post_fsh"), 0, 2, 3, -[NUNIAegirResourceManager pixelFormat0For:](self, "pixelFormat0For:", self->_device), 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStatePost = self->_pipelineStatePost;
    self->_pipelineStatePost = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStarfield
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateStarfield;

  v3 = self->_pipelineStateStarfield;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_pass_vsh"), CFSTR("aegir_starfield_fsh"), 0, 0, 4, -[NUNIAegirResourceManager pixelFormat0For:](self, "pixelFormat0For:", self->_device), 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateStarfield = self->_pipelineStateStarfield;
    self->_pipelineStateStarfield = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForStar
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateStar;

  v3 = self->_pipelineStateStar;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_star_vsh"), CFSTR("aegir_star_fsh"), 0, 1, 4, -[NUNIAegirResourceManager pixelFormat0For:](self, "pixelFormat0For:", self->_device), 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateStar = self->_pipelineStateStar;
    self->_pipelineStateStar = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForThreshold
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateThreshold;

  v3 = self->_pipelineStateThreshold;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_pass_vsh"), CFSTR("aegir_threshold_fsh"), 0, 0, 4, 10, 0);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateThreshold = self->_pipelineStateThreshold;
    self->_pipelineStateThreshold = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForLocationDot
{
  MTLRenderPipelineState *v3;
  MTLRenderPipelineState *v4;
  MTLRenderPipelineState *pipelineStateLocationDot;

  v3 = self->_pipelineStateLocationDot;
  if (!v3)
  {
    -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", CFSTR("aegir_locdot_vsh"), CFSTR("aegir_locdot_fsh"), 0, 1, 4, -[NUNIAegirResourceManager pixelFormat0For:](self, "pixelFormat0For:", self->_device), 10);
    v4 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
    pipelineStateLocationDot = self->_pipelineStateLocationDot;
    self->_pipelineStateLocationDot = v4;

    v3 = v4;
  }
  return v3;
}

- (id)renderOffscreenPipelineForSpheroid:(unint64_t)a3 config:(unint64_t)a4
{
  char *v7;
  void **v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  int v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = (char *)self + 32 * a3 + 8 * a4;
  v9 = (void *)*((_QWORD *)v7 + 12);
  v8 = (void **)(v7 + 96);
  v10 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 24; ++i)
      objc_msgSend(v11, "setObject:atIndexedSubscript:", &stru_1E6095498, i);
    +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportXR10ForDevice:", self->_device);

    if (v14)
      v15 = CFSTR("aegir_luna_fsh");
    else
      v15 = CFSTR("aegir_luna_fsh_intel");
    objc_msgSend(v11, "setObject:atIndexedSubscript:", v15, 4);
    v16 = renderOffscreenPipelineForSpheroid_config__spheroridVshs[a3];
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NUNIAegirResourceManager _generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:](self, "_generatePipelineVshName:fshName:config:blend0:blend1:pixelFormat0:pixelFormat1:", v16, v17, a4, 1, 1, -[NUNIAegirResourceManager pixelFormat0For:](self, "pixelFormat0For:", self->_device), 10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *v8;
      *v8 = v18;

      v10 = v18;
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)_generatePipelineVshName:(id)a3 fshName:(id)a4 config:(unint64_t)a5 blend0:(unint64_t)a6 blend1:(unint64_t)a7 pixelFormat0:(unint64_t)a8 pixelFormat1:(unint64_t)a9
{
  char v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  MTLDevice *device;
  void *v33;
  id v34;
  NSObject *v35;
  MTLDevice *v37;
  void *v38;
  void *v39;
  id v40;
  BOOL v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  MTLDevice *v48;
  __int16 v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[4];

  v12 = a5;
  v52[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v42 = v12 & 1;
  v41 = (v12 & 2) != 0;
  v17 = (void *)-[MTLFunctionConstantValues copy](self->_pipelineConstants, "copy");
  objc_msgSend(v17, "setConstantValue:type:atIndex:", &v42, 53, 35);
  objc_msgSend(v17, "setConstantValue:type:atIndex:", &v41, 53, 36);
  v52[0] = a6;
  v52[1] = a7;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)+(%@)"), v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLabel:", v19);

  v39 = v15;
  v20 = (void *)-[MTLLibrary newFunctionWithName:](self->_library, "newFunctionWithName:", v15);
  objc_msgSend(v18, "setVertexFunction:", v20);

  v38 = v17;
  v21 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_library, "newFunctionWithName:constantValues:error:", v16, v17, 0);
  objc_msgSend(v18, "setFragmentFunction:", v21);

  v22 = 0;
  v51[0] = a8;
  v51[1] = a9;
  v23 = 1;
  do
  {
    v24 = v23;
    v25 = v51[v22];
    if (v25)
    {
      objc_msgSend(v18, "colorAttachments");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setPixelFormat:", v25);
      objc_msgSend(v27, "setBlendingEnabled:", 0);
      switch(v52[v22])
      {
        case 1:
          objc_msgSend(v27, "setBlendingEnabled:", 1);
          objc_msgSend(v27, "setRgbBlendOperation:", 0);
          objc_msgSend(v27, "setAlphaBlendOperation:", 0);
          objc_msgSend(v27, "setSourceRGBBlendFactor:", 4);
          objc_msgSend(v27, "setSourceAlphaBlendFactor:", 4);
          objc_msgSend(v27, "setDestinationRGBBlendFactor:", 5);
          v28 = v27;
          v29 = 5;
          goto LABEL_8;
        case 2:
          objc_msgSend(v27, "setBlendingEnabled:", 1);
          objc_msgSend(v27, "setRgbBlendOperation:", 0);
          v30 = v27;
          v31 = 0;
          goto LABEL_7;
        case 3:
          objc_msgSend(v27, "setBlendingEnabled:", 1);
          objc_msgSend(v27, "setRgbBlendOperation:", 2);
          v30 = v27;
          v31 = 2;
LABEL_7:
          objc_msgSend(v30, "setAlphaBlendOperation:", v31);
          objc_msgSend(v27, "setSourceRGBBlendFactor:", 1);
          objc_msgSend(v27, "setSourceAlphaBlendFactor:", 1);
          objc_msgSend(v27, "setDestinationRGBBlendFactor:", 1);
          v28 = v27;
          v29 = 1;
LABEL_8:
          objc_msgSend(v28, "setDestinationAlphaBlendFactor:", v29);
          break;
        case 4:
          objc_msgSend(v27, "setWriteMask:", 0);
          break;
        default:
          break;
      }

    }
    v23 = 0;
    v22 = 1;
  }
  while ((v24 & 1) != 0);
  device = self->_device;
  v40 = 0;
  v33 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](device, "newRenderPipelineStateWithDescriptor:error:", v18, &v40);
  v34 = v40;
  if (!v33)
  {
    NUNILoggingObjectForDomain(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = self->_device;
      *(_DWORD *)buf = 138413058;
      v44 = v39;
      v45 = 2112;
      v46 = v16;
      v47 = 2112;
      v48 = v37;
      v49 = 2112;
      v50 = v34;
      _os_log_error_impl(&dword_1AFABF000, v35, OS_LOG_TYPE_ERROR, "AegirResourceManager: Metal compilation failure Shader=%@+%@ Device=%@ Error=%@", buf, 0x2Au);
    }

  }
  return v33;
}

- (void)_handleCloudCoverTextureExpired
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke;
  block[3] = &unk_1E6076110;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__NUNIAegirResourceManager__handleCloudCoverTextureExpired__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NUNILoggingObjectForDomain(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AFABF000, v2, OS_LOG_TYPE_DEFAULT, "Received cloud cover texture expired update. It will purge current textures.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "purgeAllCloudCoverTextures");
}

- (id)provideAtlasBacking:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  NUNIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v3, CFSTR("art"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NUNILoggingObjectForDomain(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1AFABF000, v7, OS_LOG_TYPE_DEFAULT, "providing artwork for %@ at %@", (uint8_t *)&v10, 0x16u);
    }

    +[CLKUIAtlasBacking atlasBackingWithArt:uuid:](CLKUIAtlasBacking, "atlasBackingWithArt:uuid:", v5, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NUNIAegirResourceManager provideAtlasBacking:].cold.1((uint64_t)v3, v7);

    v8 = 0;
  }

  return v8;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (unint64_t)pixelFormat0For:(id)a3
{
  void *v4;
  unint64_t v5;

  +[MetalDeviceInfo sharedInfo](MetalDeviceInfo, "sharedInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportXR10ForDevice:", self->_device))
    v5 = 555;
  else
    v5 = 81;

  return v5;
}

- (AegirCloudCoverService)cloudsService
{
  return self->_cloudsService;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_cloudsService, 0);
  objc_storeStrong((id *)&self->_textureGroupHashTable, 0);
  objc_storeStrong((id *)&self->_pipelineConstants, 0);
  objc_storeStrong((id *)&self->_starVerticesBuffer, 0);
  objc_storeStrong((id *)&self->_rectVerticesBuffer, 0);
  for (i = 856; i != 88; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_pipelineStateStar, 0);
  objc_storeStrong((id *)&self->_pipelineStateStarfield, 0);
  objc_storeStrong((id *)&self->_pipelineStateDisplay, 0);
  objc_storeStrong((id *)&self->_pipelineStatePost, 0);
  objc_storeStrong((id *)&self->_pipelineStateThreshold, 0);
  objc_storeStrong((id *)&self->_pipelineStateLocationDot, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)sharedInstanceWithDisplayPixelFormat:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(__sharedInstance + 32);
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1AFABF000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: DisplayPixelFormat %d != %d", (uint8_t *)v3, 0xEu);
}

- (void)provideAtlasBacking:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AFABF000, a2, OS_LOG_TYPE_ERROR, "AegirResourceManager: missing artwork for %@", (uint8_t *)&v2, 0xCu);
}

@end
