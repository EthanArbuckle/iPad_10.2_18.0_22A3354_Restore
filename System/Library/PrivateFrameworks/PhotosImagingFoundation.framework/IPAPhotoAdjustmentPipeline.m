@implementation IPAPhotoAdjustmentPipeline

- (IPAPhotoAdjustmentPipeline)initWithPlatform:(id)a3 version:(unint64_t)a4
{
  id v6;
  IPAPhotoAdjustmentPipeline *v7;
  uint64_t v8;
  NSString *platform;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAPhotoAdjustmentPipeline;
  v7 = -[IPAPhotoAdjustmentPipeline init](&v11, sel_init);
  if (v7)
  {
    +[IPAAdjustmentVersion validatePlatformString:](IPAAdjustmentVersion, "validatePlatformString:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    platform = v7->_platform;
    v7->_platform = (NSString *)v8;

    v7->_version = a4;
  }

  return v7;
}

- (id)string
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu"), self->_platform, self->_version);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IPAPhotoAdjustmentPipeline string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAPhotoAdjustmentPipeline isEqualToAdjustmentPipeline:](self, "isEqualToAdjustmentPipeline:", v4);

  return v5;
}

- (BOOL)isEqualToAdjustmentPipeline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPAPhotoAdjustmentPipeline string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (NSString)platform
{
  return self->_platform;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (void)initialize
{
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!s_pipelineRegex)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(osx|ios)\\.([0-9]+)$"), 0, &v6);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v6;
    v4 = (void *)s_pipelineRegex;
    s_pipelineRegex = v2;

    if (!s_pipelineRegex)
    {
      IPAAdjustmentGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = CFSTR("^(osx|ios)\\.([0-9]+)$");
        _os_log_impl(&dword_1D4CAA000, v5, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }

    }
  }
}

+ (id)pipelineForPlatform:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlatform:version:", v6, a4);

  return v7;
}

+ (id)pipelineForVersion:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "pipelineForPlatform:version:", CFSTR("iOS"), a3);
}

+ (id)pipelineFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "length");
    objc_msgSend((id)s_pipelineRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      +[IPAPhotoAdjustmentPipeline pipelineForPlatform:version:](IPAPhotoAdjustmentPipeline, "pipelineForPlatform:version:", v4, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v5 = 0;
    v8 = 0;
  }

  return v8;
}

+ (id)current
{
  return +[IPAPhotoAdjustmentPipeline pipelineForVersion:](IPAPhotoAdjustmentPipeline, "pipelineForVersion:", 4);
}

@end
