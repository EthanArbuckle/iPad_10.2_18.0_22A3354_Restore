@implementation DYEAGLCaptureAPISupport

- (DYEAGLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  DYEAGLCaptureAPISupport *v3;
  objc_super v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DYEAGLCaptureAPISupport;
    self = -[DYEAGLCaptureAPISupport init](&v5, "init");
    v3 = self;
  }

  return v3;
}

- (id)interposeDylibPath
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DYGetGLInterposeDylibPath(self, a2));
}

- (id)diagnosticsDylibPath
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DYGetMTLDiagnosticsDylibPath(self, a2));
}

- (id)_createContextInfo:(unint64_t)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v4 = objc_msgSend(objc_alloc((Class)EAGLContext), "initWithAPI:", a3);
  v5 = v4;
  if (v4)
  {
    v6 = GLIContextFromEAGLContext(v4);
    if (!v6)
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "gli_ctx");
    v7 = GLCFrontDispatch(v5);
    if (!v7)
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "dispatch");
    if (a3 - 1 > 2)
      v8 = 0;
    else
      v8 = dword_100009DD0[a3 - 1];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DYRendererInfo rendererInfoWithGLIContext:dispatch:api:](DYRendererInfo, "rendererInfoWithGLIContext:dispatch:api:", v6, v7, v8));
    v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v10, 0);
    v12 = objc_alloc((Class)DYContextInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharegroup"));
    v9 = objc_msgSend(v12, "initWithIdentifier:sharegroupIdentifier:renderers:currentRendererIndex:api:", v5, v13, v11, 0, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)graphicsAPIInfo
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 1));
  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 2));

  if (v5)
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLCaptureAPISupport _createContextInfo:](self, "_createContextInfo:", 3));

  if (v6)
    -[NSMutableArray addObject:](v3, "addObject:", v6);

  return v3;
}

- (id)transportEnvironmentVariable
{
  return CFSTR("GT_HOST_URL_GL");
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return CFSTR("GT_HOST_GL_DIAGNOSTICS");
}

@end
