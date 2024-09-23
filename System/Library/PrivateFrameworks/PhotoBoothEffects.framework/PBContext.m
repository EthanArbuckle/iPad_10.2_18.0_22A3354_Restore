@implementation PBContext

+ (id)openGLContext
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDBF850]));
}

+ (id)openGLContext:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a3)
    v4 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  else
    v4 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)v4;
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  objc_msgSend(v5, "setValue:forKey:", v6, *MEMORY[0x24BDBF850]);
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", a3);
}

+ (id)openCLContext
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BDBF850]));
}

- (PBContext)init
{
  PBContext *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBContext;
  v2 = -[PBContext init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return (PBContext *)-[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", 0);
    }
  }
  return v2;
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
  NSLog(CFSTR("*** WARNING: use [PBContext createCVPixelBufferForFilter:inputPixelBuffer:mirrored:] instead! ***"), a2);
  return -[PBContext createCVPixelBufferForFilter:inputPixelBuffer:mirrored:](self, "createCVPixelBufferForFilter:inputPixelBuffer:mirrored:", a3, a4, 0);
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v9;
  IOSurfaceRef IOSurface;
  __CVBuffer *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = dispatch_semaphore_create(0);
  IOSurface = CVPixelBufferGetIOSurface(a4);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__PBContext_createCVPixelBufferForFilter_inputPixelBuffer_mirrored___block_invoke;
  v13[3] = &unk_24F93CA68;
  v13[4] = v9;
  v13[5] = &v14;
  -[PBContext applyFilter:toSurface:mirrored:resultHandler:](self, "applyFilter:toSurface:mirrored:resultHandler:", a3, IOSurface, v5, v13);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  v11 = (__CVBuffer *)v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

intptr_t __68__PBContext_createCVPixelBufferForFilter_inputPixelBuffer_mirrored___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (_CAImageQueue)outputImageQueue
{
  return 0;
}

- (__CVPixelBufferPool)largePool
{
  return 0;
}

- (__CVPixelBufferPool)smallPool
{
  return 0;
}

- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 surfaceResultHandler:(id)a6
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PBContext_applyFilter_toSurface_mirrored_surfaceResultHandler___block_invoke;
  block[3] = &unk_24F93CA90;
  block[4] = a6;
  dispatch_async(global_queue, block);
}

uint64_t __65__PBContext_applyFilter_toSurface_mirrored_surfaceResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 resultHandler:(id)a6
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__PBContext_applyFilter_toSurface_mirrored_resultHandler___block_invoke;
  v6[3] = &unk_24F93CAB8;
  v6[4] = a6;
  -[PBContext applyFilter:toSurface:mirrored:surfaceResultHandler:](self, "applyFilter:toSurface:mirrored:surfaceResultHandler:", a3, a4, a5, v6);
}

uint64_t __58__PBContext_applyFilter_toSurface_mirrored_resultHandler___block_invoke(uint64_t result, __IOSurface *a2)
{
  uint64_t v3;
  CVReturn v4;
  CVPixelBufferRef pixelBufferOut;

  if (a2)
  {
    v3 = result;
    pixelBufferOut = 0;
    v4 = CVPixelBufferCreateWithIOSurface(0, a2, 0, &pixelBufferOut);
    CFRelease(a2);
    if (v4)
      NSLog(CFSTR("Failed to create CVPixelBuffer from IOSurface."));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

@end
