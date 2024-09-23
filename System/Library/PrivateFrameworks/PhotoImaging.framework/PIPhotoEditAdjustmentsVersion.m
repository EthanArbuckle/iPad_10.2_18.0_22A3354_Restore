@implementation PIPhotoEditAdjustmentsVersion

- (PIPhotoEditAdjustmentsVersion)init
{
  return -[PIPhotoEditAdjustmentsVersion initWithMajor:minor:subMinor:](self, "initWithMajor:minor:subMinor:", 0, 0, 0);
}

- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6
{
  id v10;
  PIPhotoEditAdjustmentsVersion *v11;
  PIPhotoEditAdjustmentsVersion *v12;
  uint64_t v13;
  NSString *platform;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PIPhotoEditAdjustmentsVersion;
  v11 = -[PIPhotoEditAdjustmentsVersion init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_majorVersion = a3;
    v11->_minorVersion = a4;
    v11->_subMinorVersion = a5;
    v13 = objc_msgSend(v10, "copy");
    platform = v12->_platform;
    v12->_platform = (NSString *)v13;

  }
  return v12;
}

- (PIPhotoEditAdjustmentsVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5
{
  return -[PIPhotoEditAdjustmentsVersion initWithMajor:minor:subMinor:platform:](self, "initWithMajor:minor:subMinor:platform:", a3, a4, a5, 0);
}

- (NSString)string
{
  unint64_t subMinorVersion;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  subMinorVersion = self->_subMinorVersion;
  if (subMinorVersion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%lu"), subMinorVersion);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E501A310;
  }
  if (self->_platform)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), self->_platform);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E501A310;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu%@%@"), self->_majorVersion, self->_minorVersion, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)asOrderedInteger
{
  return 1000000 * self->_majorVersion + 1000 * self->_minorVersion + self->_subMinorVersion;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[PIPhotoEditAdjustmentsVersion asOrderedInteger](self, "asOrderedInteger");
  v6 = objc_msgSend(v4, "asOrderedInteger");

  if (v5 < v6)
    return -1;
  else
    return v5 != v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PIPhotoEditAdjustmentsVersion string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0xAAAC9C5260601 * objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PIPhotoEditAdjustmentsVersion isEqualToAdjustmentVersion:](self, "isEqualToAdjustmentVersion:", v4);

  return v5;
}

- (BOOL)isEqualToAdjustmentVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PIPhotoEditAdjustmentsVersion string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "caseInsensitiveCompare:", v6) == 0;
  return (char)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PIPhotoEditAdjustmentsVersion;
  -[PIPhotoEditAdjustmentsVersion description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPhotoEditAdjustmentsVersion string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)subMinorVersion
{
  return self->_subMinorVersion;
}

- (NSString)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (id)versionWithMajor:(unint64_t)a3 minor:(unint64_t)a4 subMinor:(unint64_t)a5 platform:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMajor:minor:subMinor:platform:", a3, a4, a5, v10);

  return v11;
}

+ (id)versionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  PIPhotoEditAdjustmentsVersion *v21;
  PIPhotoEditAdjustmentsVersion *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v25 = v4;
      v26 = 0;
      v6 = 0;
      v7 = -1;
      v8 = 1;
      v9 = -1;
      v10 = -1;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6, v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invertedSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "length") && objc_msgSend(v11, "rangeOfCharacterFromSet:", v13) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = objc_msgSend(v11, "intValue");
          if (v6 == 1)
            v15 = v14;
          else
            v15 = v9;
          if (v6 == 1)
            v16 = (v14 >= 0) & v8;
          else
            v16 = 0;
          if (v6 == 2)
            v17 = v14;
          else
            v17 = v10;
          if (v6 == 2)
          {
            v15 = v9;
            v16 = (v14 >= 0) & v8;
          }
          if (v6)
          {
            v10 = v17;
            v9 = v15;
            v8 = v16;
          }
          else
          {
            v7 = v14;
            v8 &= v14 >= 0;
          }
        }
        else if (v6 == objc_msgSend(v5, "count") - 1
               && ((objc_msgSend(v11, "isEqual:", CFSTR("OSX")) & 1) != 0
                || objc_msgSend(v11, "isEqual:", CFSTR("iOS"))))
        {
          v18 = v11;

          v26 = v18;
        }
        else
        {
          v8 = 0;
        }

        ++v6;
      }
      while (v6 < objc_msgSend(v5, "count"));
      if ((v8 & (v7 >= 0)) == 1 && (v9 & 0x8000000000000000) == 0)
      {
        if (v10 == -1)
          v19 = 0;
        else
          v19 = v10;
        v20 = v26;
        v21 = -[PIPhotoEditAdjustmentsVersion initWithMajor:minor:subMinor:platform:]([PIPhotoEditAdjustmentsVersion alloc], "initWithMajor:minor:subMinor:platform:", v7, v9, v19, v26);
        v4 = v25;
LABEL_40:
        v22 = v21;

        goto LABEL_41;
      }
      v4 = v25;
      v20 = v26;
    }
    else
    {
      v20 = 0;
    }
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_6214);
    v23 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v4;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "invalid format version: %@", buf, 0xCu);
    }
    v21 = 0;
    goto LABEL_40;
  }
  v22 = 0;
LABEL_41:

  return v22;
}

@end
