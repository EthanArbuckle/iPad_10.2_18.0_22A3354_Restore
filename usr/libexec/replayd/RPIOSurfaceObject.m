@implementation RPIOSurfaceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  __IOSurface *ioSurface;
  xpc_object_t XPCObject;
  id v7;

  v7 = a3;
  v4 = objc_opt_class(NSXPCCoder);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    ioSurface = self->_ioSurface;
    if (ioSurface)
    {
      XPCObject = IOSurfaceCreateXPCObject(ioSurface);
      objc_msgSend(v7, "encodeXPCObject:forKey:", XPCObject, CFSTR("ioSurface"));

    }
  }

}

- (RPIOSurfaceObject)initWithCoder:(id)a3
{
  id v4;
  RPIOSurfaceObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  IOSurfaceRef v9;
  RPIOSurfaceObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPIOSurfaceObject;
  v5 = -[RPIOSurfaceObject init](&v12, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSXPCCoder);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("ioSurface")));
      v8 = v7;
      if (v7)
      {
        v9 = IOSurfaceLookupFromXPCObject(v7);
        -[RPIOSurfaceObject setIOSurface:](v5, "setIOSurface:", v9);
        CFRelease(v9);
      }

    }
    v10 = v5;
  }

  return v5;
}

- (void)setIOSurface:(__IOSurface *)a3
{
  __IOSurface *ioSurface;

  ioSurface = self->_ioSurface;
  if (ioSurface != a3)
  {
    if (ioSurface)
      CFRelease(ioSurface);
    self->_ioSurface = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)dealloc
{
  __IOSurface *ioSurface;
  objc_super v4;

  ioSurface = self->_ioSurface;
  if (ioSurface)
    CFRelease(ioSurface);
  v4.receiver = self;
  v4.super_class = (Class)RPIOSurfaceObject;
  -[RPIOSurfaceObject dealloc](&v4, "dealloc");
}

@end
