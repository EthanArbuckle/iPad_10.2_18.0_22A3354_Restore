@implementation PBContext

+ (id)openGLContext
{
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), kCIContextUseSoftwareRenderer));
}

+ (id)openGLContext:(id)a3
{
  NSMutableDictionary *v4;

  if (a3)
    v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3);
  else
    v4 = (NSMutableDictionary *)+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), kCIContextUseSoftwareRenderer);
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", a3);
}

+ (id)openCLContext
{
  return -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), kCIContextUseSoftwareRenderer));
}

- (PBContext)init
{
  PBContext *v2;
  uint64_t v3;
  PBContext *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBContext;
  v2 = -[PBContext init](&v8, "init");
  v4 = v2;
  if (v2)
  {
    v5 = objc_opt_class(v2, v3);
    if (v5 == objc_opt_class(PBContext, v6))
    {

      return (PBContext *)-[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", 0);
    }
  }
  return v4;
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
  __CVBuffer *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = dispatch_semaphore_create(0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001AEA8;
  v12[3] = &unk_100034EB8;
  v12[4] = v9;
  v12[5] = &v13;
  -[PBContext applyFilter:toSurface:mirrored:resultHandler:](self, "applyFilter:toSurface:mirrored:resultHandler:", a3, CVPixelBufferGetIOSurface(a4), v5, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  v10 = (__CVBuffer *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF48;
  block[3] = &unk_100034EE0;
  block[4] = a6;
  dispatch_async(global_queue, block);
}

- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 resultHandler:(id)a6
{
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AFA8;
  v6[3] = &unk_100034F08;
  v6[4] = a6;
  -[PBContext applyFilter:toSurface:mirrored:surfaceResultHandler:](self, "applyFilter:toSurface:mirrored:surfaceResultHandler:", a3, a4, a5, v6);
}

@end
