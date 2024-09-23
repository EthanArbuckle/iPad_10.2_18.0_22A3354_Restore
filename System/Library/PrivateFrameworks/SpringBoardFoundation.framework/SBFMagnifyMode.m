@implementation SBFMagnifyMode

+ (id)currentMagnifyMode
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v3, "deviceName");
  v4 = IOMobileFramebufferOpenByName();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SBFMagnifyMode currentMagnifyMode].cold.3((uint64_t)v3, v4, v5);

  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[SBFMagnifyMode currentMagnifyMode].cold.1(v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

+ (id)magnifyModeWithSize:(CGSize)a3 name:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setSize:", width, height);
  objc_msgSend(v8, "setName:", v7);

  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setZoomFactor:", v9);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSize:", self->_size.width, self->_size.height);
  objc_msgSend(v4, "setName:", self->_name);
  *(float *)&v5 = self->_zoomFactor;
  objc_msgSend(v4, "setZoomFactor:", v5);
  return v4;
}

- (SBFMagnifyMode)init
{
  SBFMagnifyMode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFMagnifyMode;
  result = -[SBFMagnifyMode init](&v3, sel_init);
  if (result)
    result->_zoomFactor = 1.0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
    -[SBFMagnifyMode size](self, "size");
    if (v7 == v11 && v9 == v10)
    {
      -[SBFMagnifyMode name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v15))
      {
        -[SBFMagnifyMode zoomFactor](self, "zoomFactor");
        v17 = v16;
        objc_msgSend(v5, "zoomFactor");
        v13 = v17 == v18;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", self->_size.width, self->_size.height);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBFMagnifyMode descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFMagnifyMode descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  float v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFMagnifyMode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("name"));

  -[SBFMagnifyMode zoomFactor](self, "zoomFactor");
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("zoomFactor"), v7);
  -[SBFMagnifyMode size](self, "size");
  v9 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("size"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFMagnifyMode succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(float)a3
{
  self->_zoomFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)currentMagnifyMode
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "IOMobileFramebufferRef SBFCreateMobileFrameBuffer()";
  v5 = 2114;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "%s Returning NULL framebuffer because IOMobileFramebufferOpenByName() gave us a NULL framebuffer. display: %{public}@, ioResult: %x", (uint8_t *)&v3, 0x1Cu);
}

@end
