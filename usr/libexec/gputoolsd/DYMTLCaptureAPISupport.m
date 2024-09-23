@implementation DYMTLCaptureAPISupport

- (DYMTLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  DYMTLCaptureAPISupport *v3;
  objc_super v5;

  if (a3 == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)DYMTLCaptureAPISupport;
    self = -[DYMTLCaptureAPISupport init](&v5, "init");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)interposeDylibPath
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DYGetMTLInterposeDylibPath(self, a2));
}

- (id)diagnosticsDylibPath
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DYGetMTLDiagnosticsDylibPath(self, a2));
}

- (id)graphicsAPIInfo
{
  id v2;
  id v3;
  void *v4;
  id v6;

  v2 = MTLCreateSystemDefaultDevice();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)DYMTLDeviceProfile), "initWithDevice:", v2);
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)transportEnvironmentVariable
{
  return CFSTR("GT_HOST_URL_MTL");
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return CFSTR("GT_HOST_URL_MTL_DIAGNOSTICS");
}

@end
