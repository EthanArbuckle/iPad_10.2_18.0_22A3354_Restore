@implementation PLIOSurfaceData

- (PLIOSurfaceData)initWithIOSurface:(void *)a3
{
  return -[PLIOSurfaceData initWithIOSurface:length:](self, "initWithIOSurface:length:", a3, 0);
}

- (PLIOSurfaceData)initWithIOSurface:(void *)a3 length:(unint64_t)a4
{
  PLIOSurfaceData *v6;
  CFTypeID v7;
  __IOSurface *v8;
  size_t AllocSize;
  unint64_t v11;
  PLIOSurfaceData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLIOSurfaceData;
  v6 = -[PLIOSurfaceData init](&v14, sel_init);
  if (v6)
  {
    if (!a3 || (v7 = CFGetTypeID(a3), v7 != IOSurfaceGetTypeID()))
    {
      v12 = 0;
      goto LABEL_13;
    }
    v8 = (__IOSurface *)CFRetain(a3);
    v6->_surface = v8;
    AllocSize = IOSurfaceGetAllocSize(v8);
    if (AllocSize <= a4 || a4 == 0)
      v11 = AllocSize;
    else
      v11 = a4;
    v6->_length = v11;
  }
  v12 = v6;
LABEL_13:

  return v12;
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  const void *result;

  result = self->_bytes;
  if (!result)
  {
    IOSurfaceLock(self->_surface, 1u, 0);
    result = IOSurfaceGetBaseAddress(self->_surface);
    self->_bytes = result;
  }
  return result;
}

- (void)dealloc
{
  __IOSurface *surface;
  objc_super v4;

  surface = self->_surface;
  if (surface)
  {
    if (self->_bytes)
    {
      IOSurfaceUnlock(surface, 1u, 0);
      self->_bytes = 0;
      surface = self->_surface;
    }
    CFRelease(surface);
    self->_surface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLIOSurfaceData;
  -[PLIOSurfaceData dealloc](&v4, sel_dealloc);
}

+ (id)dataWithIOSurface:(void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:", a3);
}

@end
