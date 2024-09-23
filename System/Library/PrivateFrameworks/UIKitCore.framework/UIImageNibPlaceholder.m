@implementation UIImageNibPlaceholder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceCatalogName, 0);
  objc_storeStrong((id *)&self->_resourceSymbolImageConfiguration, 0);
  objc_storeStrong((id *)&self->systemSymbolResourceName, 0);
  objc_storeStrong((id *)&self->runtimeResourceName, 0);
}

- (UIImageNibPlaceholder)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UIImage *v15;
  float v16;
  float v17;
  void *v18;
  size_t v19;
  CGContext *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIImageNibPlaceholder *v27;
  uint64_t v28;
  UIImageNibPlaceholder *v29;
  CGColorSpace *space;
  size_t v32;
  void *v33;
  uint64_t height;
  CGImage *heighta;
  void *v36;

  v4 = a3;
  UIResourceBundleForNIBBeingDecodedWithCoder(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISystemSymbolResourceName"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIResourceCatalogName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "length")
    || (+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("private")))
    {
      +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIImageVariableValue")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIImageVariableValue"));
    objc_msgSend(v9, "_imageWithVariableValue:");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIResourceName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v12)
    {
      _UIKitGetApplicationAssetManager();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v5;
    }
    else
    {
      v13 = (void *)v12;
      +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _UIKitGetApplicationAssetManager();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v4;
  if (v9)
  {
    v15 = v9;
  }
  else
  {
    objc_msgSend(v14, "imageNamed:", v11);
    v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      _UIImageAtPath(v11, v5, 0, 0);
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIImageWidth"));
        v32 = (uint64_t)v16;
        objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIImageHeight"));
        height = (uint64_t)v17;
        objc_msgSend(v5, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Could not load the \"%@\" image referenced from a nib in the bundle with identifier \"%@\"), v11, v18);

        v19 = (4 * v32);
        space = CGColorSpaceCreateDeviceRGB();
        v33 = malloc_type_calloc(v19 * height, 1uLL, 0x64B17EC7uLL);
        v20 = CGBitmapContextCreate(v33, v32, height, 8uLL, v19, space, 2u);
        heighta = CGBitmapContextCreateImage(v20);
        CGContextRelease(v20);
        CGColorSpaceRelease(space);
        v15 = -[UIImage initWithCGImage:]([UIImage alloc], "initWithCGImage:", heighta);
        CGImageRelease(heighta);
        free(v33);
        if (!v15)
        {
          v24 = v5;
          v25 = (void *)v6;
          v26 = v8;
          v27 = self;
          goto LABEL_26;
        }
      }
    }
  }
  v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIRenderingMode"));
  if (v21)
  {
    -[UIImage imageWithRenderingMode:](v15, "imageWithRenderingMode:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (UIImage *)v22;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UISymbolImageConfiguration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  v25 = (void *)v6;
  v26 = v8;
  v27 = self;
  if (v23)
  {
    -[UIImage imageByApplyingSymbolConfiguration:](v15, "imageByApplyingSymbolConfiguration:", v23);
    v28 = objc_claimAutoreleasedReturnValue();

    v15 = (UIImage *)v28;
  }

LABEL_26:
  v29 = v15;

  return v29;
}

- (void)_commonInit
{
  self->_variableValue = INFINITY;
}

- (UIImageNibPlaceholder)initWithContentsOfFile:(id)a3 andRuntimeResourceName:(id)a4
{
  id v6;
  UIImageNibPlaceholder *v7;
  UIImageNibPlaceholder *v8;
  uint64_t v9;
  NSString *runtimeResourceName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v7 = -[UIImage initWithContentsOfFile:](&v12, sel_initWithContentsOfFile_, a3);
  v8 = v7;
  if (v7)
  {
    -[UIImageNibPlaceholder _commonInit](v7, "_commonInit");
    v9 = objc_msgSend(v6, "copy");
    runtimeResourceName = v8->runtimeResourceName;
    v8->runtimeResourceName = (NSString *)v9;

  }
  return v8;
}

- (UIImageNibPlaceholder)initWithData:(id)a3 andRuntimeResourceName:(id)a4
{
  id v6;
  UIImageNibPlaceholder *v7;
  UIImageNibPlaceholder *v8;
  uint64_t v9;
  NSString *runtimeResourceName;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v7 = -[UIImage initWithData:](&v12, sel_initWithData_, a3);
  v8 = v7;
  if (v7)
  {
    -[UIImageNibPlaceholder _commonInit](v7, "_commonInit");
    v9 = objc_msgSend(v6, "copy");
    runtimeResourceName = v8->runtimeResourceName;
    v8->runtimeResourceName = (NSString *)v9;

  }
  return v8;
}

- (UIImageNibPlaceholder)initWithRuntimeSystemSymbolResourceName:(id)a3
{
  id v4;
  UIImageNibPlaceholder *v5;
  UIImageNibPlaceholder *v6;
  uint64_t v7;
  NSString *systemSymbolResourceName;
  uint64_t v9;
  NSString *runtimeResourceName;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIImageNibPlaceholder;
  v5 = -[UIImage init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIImageNibPlaceholder _commonInit](v5, "_commonInit");
    v7 = objc_msgSend(v4, "copy");
    systemSymbolResourceName = v6->systemSymbolResourceName;
    v6->systemSymbolResourceName = (NSString *)v7;

    v9 = objc_msgSend(v4, "copy");
    runtimeResourceName = v6->runtimeResourceName;
    v6->runtimeResourceName = (NSString *)v9;

  }
  return v6;
}

- (id)_initWithOtherImage:(id)a3
{
  id *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)UIImageNibPlaceholder;
  v5 = -[UIImage _initWithOtherImage:](&v16, sel__initWithOtherImage_, v4);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_commonInit");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v4[18], "copy");
      v8 = (void *)v6[18];
      v6[18] = v7;

      v9 = objc_msgSend(v4[19], "copy");
      v10 = (void *)v6[19];
      v6[19] = v9;

      v6[20] = v4[20];
      v11 = objc_msgSend(v4[21], "copy");
      v12 = (void *)v6[21];
      v6[21] = v11;

      v13 = objc_msgSend(v4[22], "copy");
      v14 = (void *)v6[22];
      v6[22] = v13;

      v6[23] = v4[23];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t resourceRenderingMode;
  id v8;

  v8 = a3;
  -[UIImage size](self, "size");
  *(float *)&v4 = v4;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("UIImageWidth"), v4);
  -[UIImage size](self, "size");
  *(float *)&v6 = v5;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("UIImageHeight"), v6);
  objc_msgSend(v8, "encodeObject:forKey:", self->runtimeResourceName, CFSTR("UIResourceName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->systemSymbolResourceName, CFSTR("UISystemSymbolResourceName"));
  if (self->_variableValue != INFINITY)
    objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("UIImageVariableValue"));
  resourceRenderingMode = self->_resourceRenderingMode;
  if (resourceRenderingMode)
    objc_msgSend(v8, "encodeInteger:forKey:", resourceRenderingMode, CFSTR("UIRenderingMode"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_resourceSymbolImageConfiguration, CFSTR("UISymbolImageConfiguration"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_resourceCatalogName, CFSTR("UIResourceCatalogName"));

}

- (int64_t)resourceRenderingMode
{
  return self->_resourceRenderingMode;
}

- (void)setResourceRenderingMode:(int64_t)a3
{
  self->_resourceRenderingMode = a3;
}

- (UIImageSymbolConfiguration)resourceSymbolImageConfiguration
{
  return self->_resourceSymbolImageConfiguration;
}

- (void)setResourceSymbolImageConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)resourceCatalogName
{
  return self->_resourceCatalogName;
}

- (void)setResourceCatalogName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (double)variableValue
{
  return self->_variableValue;
}

- (void)setVariableValue:(double)a3
{
  self->_variableValue = a3;
}

@end
