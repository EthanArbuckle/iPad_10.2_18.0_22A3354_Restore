@implementation CRLMetalShaderManager

- (CRLMetalShaderManager)initWithDevice:(id)a3
{
  id v5;
  CRLMetalShaderManager *v6;
  CRLMetalShaderManager *v7;
  uint64_t v8;
  NSMapTable *libraries;
  uint64_t v10;
  NSMutableDictionary *shaders;
  uint64_t v12;
  NSMutableDictionary *computeShaders;
  uint64_t v14;
  NSMutableDictionary *samplers;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLMetalShaderManager;
  v6 = -[CRLMetalShaderManager init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    libraries = v7->_libraries;
    v7->_libraries = (NSMapTable *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    shaders = v7->_shaders;
    v7->_shaders = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    computeShaders = v7->_computeShaders;
    v7->_computeShaders = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    samplers = v7->_samplers;
    v7->_samplers = (NSMutableDictionary *)v14;

    *(_QWORD *)&v7->_librariesLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v7->_computeShadersLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)libraryForBundle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v4 = a3;
  os_unfair_lock_lock(&self->_librariesLock);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_libraries, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShaderManager device](self, "device"));
    v13 = 0;
    v5 = objc_msgSend(v6, "newDefaultLibraryWithBundle:error:", v4, &v13);
    v7 = v13;

    if (!v5)
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012303A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDAD8((uint64_t)v7, v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012303C0);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager libraryForBundle:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 57, 0, "Failed to create library, error %@", v7);

    }
    -[NSMapTable setObject:forKeyedSubscript:](self->_libraries, "setObject:forKeyedSubscript:", v5, v4);

  }
  os_unfair_lock_unlock(&self->_librariesLock);

  return v5;
}

- (id)shaderWithName:(id)a3 initBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  os_unfair_lock_lock(&self->_shadersLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shaders, "objectForKeyedSubscript:", v6));
  if (!v8)
  {
    v9 = v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012303E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDB80();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230400);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager shaderWithName:initBlock:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 70, 0, "invalid nil value for '%{public}s'", "namedShader");

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shaders, "setObject:forKeyedSubscript:", v8, v6);
  }
  os_unfair_lock_unlock(&self->_shadersLock);

  return v8;
}

- (id)computeShaderWithName:(id)a3 initBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  os_unfair_lock_lock(&self->_computeShadersLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_computeShaders, "objectForKeyedSubscript:", v6));
  if (!v8)
  {
    v9 = v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230420);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDC14();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230440);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager computeShaderWithName:initBlock:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 83, 0, "invalid nil value for '%{public}s'", "namedShader");

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_computeShaders, "setObject:forKeyedSubscript:", v8, v6);
  }
  os_unfair_lock_unlock(&self->_computeShadersLock);

  return v8;
}

- (id)samplerWithName:(id)a3 initBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  os_unfair_lock_lock(&self->_samplersLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_samplers, "objectForKeyedSubscript:", v6));
  if (!v8)
  {
    v9 = v7[2](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230460);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEDCA8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230480);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShaderManager samplerWithName:initBlock:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShaderManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 97, 0, "invalid nil value for '%{public}s'", "namedSampler");

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_samplers, "setObject:forKeyedSubscript:", v8, v6);
  }
  os_unfair_lock_unlock(&self->_samplersLock);

  return v8;
}

- (id)defaultSampler
{
  return -[CRLMetalShaderManager linearClampToZeroSampler](self, "linearClampToZeroSampler");
}

- (id)defaultLinearSampler
{
  return -[CRLMetalShaderManager linearClampToZeroSampler](self, "linearClampToZeroSampler");
}

- (id)defaultNearestSampler
{
  return -[CRLMetalShaderManager nearestClampToZeroSampler](self, "nearestClampToZeroSampler");
}

- (id)defaultClampToEdgeSampler
{
  return -[CRLMetalShaderManager linearClampToEdgeSampler](self, "linearClampToEdgeSampler");
}

- (id)defaultClampToZeroSampler
{
  return -[CRLMetalShaderManager linearClampToZeroSampler](self, "linearClampToZeroSampler");
}

- (id)linearClampToEdgeSampler
{
  _QWORD *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D47C;
  v6[3] = &unk_1012304A8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShaderManager samplerWithName:initBlock:](self, "samplerWithName:initBlock:", CFSTR("Linear Clamp To Edge Sampler"), v3));

  return v4;
}

- (id)linearClampToZeroSampler
{
  _QWORD *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D5B0;
  v6[3] = &unk_1012304A8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShaderManager samplerWithName:initBlock:](self, "samplerWithName:initBlock:", CFSTR("Linear Clamp To Zero Sampler"), v3));

  return v4;
}

- (id)nearestClampToEdgeSampler
{
  _QWORD *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D6E4;
  v6[3] = &unk_1012304A8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShaderManager samplerWithName:initBlock:](self, "samplerWithName:initBlock:", CFSTR("Nearest Clamp To Edge Sampler"), v3));

  return v4;
}

- (id)nearestClampToZeroSampler
{
  _QWORD *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D818;
  v6[3] = &unk_1012304A8;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMetalShaderManager samplerWithName:initBlock:](self, "samplerWithName:initBlock:", CFSTR("Nearest Clamp To Zero Sampler"), v3));

  return v4;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_samplers, 0);
  objc_storeStrong((id *)&self->_computeShaders, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
}

@end
