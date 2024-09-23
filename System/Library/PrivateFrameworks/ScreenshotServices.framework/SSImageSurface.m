@implementation SSImageSurface

- (SSImageSurface)init
{
  SSImageSurface *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSImageSurface;
  v2 = -[SSImageSurface init](&v5, sel_init);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  -[SSImageSurface setScale:](v2, "setScale:");

  -[SSImageSurface setOrientation:](v2, "setOrientation:", 0);
  return v2;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id XPCObject;

  v4 = a3;
  XPCObject = IOSurfaceCreateXPCObject(-[SSImageSurface backingSurface](self, "backingSurface"));
  objc_msgSend(v4, "encodeXPCObject:forKey:", XPCObject, CFSTR("SSImageSurfaceBackingSurfaceKey"));
  -[SSImageSurface scale](self, "scale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SSImageSurfaceImageScaleKey"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SSImageSurface orientation](self, "orientation"), CFSTR("SSImageSurfaceImageOrientationKey"));

}

- (SSImageSurface)initWithBSXPCCoder:(id)a3
{
  id v4;
  SSImageSurface *v5;
  void *v6;
  IOSurfaceRef v7;
  double v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = -[SSImageSurface init](self, "init");
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("SSImageSurfaceBackingSurfaceKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = IOSurfaceLookupFromXPCObject(v6);
  v5->_backingSurface = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SSImageSurfaceImageScaleKey"));
  v5->_scale = v8;
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSImageSurfaceImageOrientationKey"));

  v5->_orientation = v9;
  if (v7 && IOSurfaceSetOwnership())
  {
    v10 = os_log_create("com.apple.screenshotservices", "Surface");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[SSImageSurface initWithBSXPCCoder:].cold.1(v10);

  }
  return v5;
}

- (void)setBackingSurface:(__IOSurface *)a3
{
  __IOSurface *backingSurface;

  backingSurface = self->_backingSurface;
  if (backingSurface != a3)
  {
    if (backingSurface)
      CFRelease(backingSurface);
    self->_backingSurface = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)dealloc
{
  __IOSurface *backingSurface;
  objc_super v4;

  backingSurface = self->_backingSurface;
  if (backingSurface)
    CFRelease(backingSurface);
  v4.receiver = self;
  v4.super_class = (Class)SSImageSurface;
  -[SSImageSurface dealloc](&v4, sel_dealloc);
}

- (__IOSurface)backingSurface
{
  return self->_backingSurface;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)initWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = *MEMORY[0x24BDAEC58];
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_213892000, log, OS_LOG_TYPE_FAULT, "Failed to assign surface ownership to task %d", (uint8_t *)v2, 8u);
}

@end
