@implementation IPAAdjustmentVersion

- (IPAAdjustmentVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5
{
  IPAAdjustmentVersion *v6;
  uint64_t v10;
  void *v11;
  IPAAdjustmentVersion *v12;
  objc_super v14;

  if (a4 < 0x3E8)
  {
    +[IPAAdjustmentVersion validatePlatformString:](IPAAdjustmentVersion, "validatePlatformString:", a5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!a5 || v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)IPAAdjustmentVersion;
      v12 = -[IPAAdjustmentVersion init](&v14, sel_init);
      v6 = v12;
      if (v12)
      {
        v12->_majorVersion = a3;
        v12->_minorVersion = a4;
        objc_storeStrong((id *)&v12->_platform, v11);
      }
    }
    else
    {

      v6 = 0;
    }

  }
  else
  {

    return 0;
  }
  return v6;
}

- (id)archivalRepresentation
{
  unint64_t minorVersion;
  NSString *platform;
  void *v4;
  uint64_t v6;

  minorVersion = self->_minorVersion;
  platform = self->_platform;
  if (!minorVersion)
  {
    if (!platform)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_majorVersion);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    goto LABEL_5;
  }
  if (platform)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu.%@"), self->_majorVersion, self->_minorVersion, platform);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu"), self->_majorVersion, minorVersion, v6);
LABEL_6:
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (int64_t)compare:(id)a3
{
  int64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  BOOL v8;
  int64_t v9;

  v3 = self->_minorVersion + 1000 * self->_majorVersion;
  v4 = a3;
  v5 = objc_msgSend(v4, "majorVersion");
  v6 = objc_msgSend(v4, "minorVersion");

  v7 = v6 + 1000 * v5;
  v8 = v3 < v7;
  v9 = v3 != v7;
  if (v8)
    return -1;
  else
    return v9;
}

- (void)setMinorVersion:(unint64_t)a3
{
  IPAAdjustmentVersion *v3;
  SEL v4;

  if (a3 >= 0x3E8)
  {
    v3 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
    -[IPAAdjustmentVersion hash](v3, v4);
  }
  else
  {
    self->_minorVersion = a3;
  }
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  IPAAdjustmentVersion *v6;
  SEL v7;
  id v8;

  -[IPAAdjustmentVersion archivalRepresentation](self, "archivalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "hash");

    return v4;
  }
  else
  {
    v6 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
    return -[IPAAdjustmentVersion isEqual:](v6, v7, v8);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAAdjustmentVersion isEqualToAdjustmentVersion:](self, "isEqualToAdjustmentVersion:", v4);

  return v5;
}

- (BOOL)isEqualToAdjustmentVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPAAdjustmentVersion archivalRepresentation](self, "archivalRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archivalRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IPAAdjustmentVersion archivalRepresentation](self, "archivalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (NSString)platform
{
  return self->_platform;
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
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!s_formatVersionRegex)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+)\\.([0-9]+)$"), 0, &v20);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v20;
    v4 = (void *)s_formatVersionRegex;
    s_formatVersionRegex = v2;

    if (!s_formatVersionRegex)
    {
      IPAAdjustmentGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = CFSTR("^([0-9]+)\\.([0-9]+)$");
        _os_log_impl(&dword_1D4CAA000, v5, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }

    }
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+)\\.([0-9]+)\\.(osx|ios)$"), 0, &v19);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = (void *)s_platformFormatVersionRegex;
    s_platformFormatVersionRegex = v6;

    if (!s_platformFormatVersionRegex)
    {
      IPAAdjustmentGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = CFSTR("^([0-9]+)\\.([0-9]+)\\.(osx|ios)$");
        _os_log_impl(&dword_1D4CAA000, v9, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }

    }
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([0-9]+)$"), 0, &v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v18;
    v12 = (void *)s_formatVersionSimpleRegex;
    s_formatVersionSimpleRegex = v10;

    if (!s_formatVersionSimpleRegex)
    {
      IPAAdjustmentGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = CFSTR("^([0-9]+)$");
        _os_log_impl(&dword_1D4CAA000, v13, OS_LOG_TYPE_ERROR, "unable to create regex for pattern: %@", buf, 0xCu);
      }

    }
    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = CFSTR("OSX");
    v21[1] = CFSTR("iOS");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)s_validPlatforms;
    s_validPlatforms = v16;

  }
}

+ (id)validatePlatformString:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (id)s_validPlatforms;
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v3, "compare:options:", v8, 3, (_QWORD)v10))
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4 platform:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMajor:minor:platform:", a3, a4, v8);

  return v9;
}

+ (id)versionForMajor:(unint64_t)a3 minor:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "versionForMajor:minor:platform:", a3, a4, 0);
}

+ (id)versionFromArchivalRepresentation:(id)a3
{
  id v3;
  IPAAdjustmentVersion *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    objc_msgSend((id)s_platformFormatVersionRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      v13 = objc_msgSend(v8, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      v17 = objc_msgSend(v8, "rangeAtIndex:", 3);
      objc_msgSend(v5, "substringWithRange:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)s_formatVersionRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v8 = v20;
        v21 = objc_msgSend(v20, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v23, "integerValue");

        v24 = objc_msgSend(v8, "rangeAtIndex:", 2);
        objc_msgSend(v5, "substringWithRange:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v26, "integerValue");

        v19 = 0;
      }
      else
      {
        objc_msgSend((id)s_formatVersionSimpleRegex, "firstMatchInString:options:range:", v5, 0, 0, v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v4 = 0;
          goto LABEL_12;
        }
        v8 = v27;
        v28 = objc_msgSend(v27, "rangeAtIndex:", 1);
        objc_msgSend(v5, "substringWithRange:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v30, "integerValue");

        v19 = 0;
        v16 = 0;
      }
    }
    v4 = -[IPAAdjustmentVersion initWithMajor:minor:platform:]([IPAAdjustmentVersion alloc], "initWithMajor:minor:platform:", v12, v16, v19);

LABEL_12:
    goto LABEL_13;
  }
  +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", objc_msgSend(v3, "unsignedIntegerValue"), 0);
  v4 = (IPAAdjustmentVersion *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

@end
