@implementation PRSPosterConfiguration

- (PRSPosterConfiguration)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PRSPosterConfiguration *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PRSPosterConfiguration *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("PRSPosterConfiguration.m");
    v21 = 1024;
    v22 = 29;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PRSPosterConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterConfiguration;
  -[PRSPosterConfiguration dealloc](&v3, sel_dealloc);
}

- (id)descriptorIdentifier
{
  void *v2;
  void *v3;

  -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_initWithPath:(id)a3
{
  id v6;
  void *v7;
  PRSPosterConfiguration *v8;
  PRSPosterConfiguration *v9;
  PFPosterPath *path;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  BSInvalidatable *pathValidityExtension;
  id result;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v17.receiver = self;
    v17.super_class = (Class)PRSPosterConfiguration;
    v8 = -[PRSPosterConfiguration init](&v17, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_path, a3);
      path = v9->_path;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterPath extendValidityForReason:](path, "extendValidityForReason:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      pathValidityExtension = v9->_pathValidityExtension;
      v9->_pathValidityExtension = (BSInvalidatable *)v13;

    }
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterConfiguration _initWithPath:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSString)role
{
  return (NSString *)-[PFPosterPath role](self->_path, "role");
}

- (NSURL)assetDirectory
{
  return (NSURL *)-[PFPosterPath contentsURL](self->_path, "contentsURL");
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)-[PFPosterPath loadUserInfoWithError:](self->_path, "loadUserInfoWithError:", a3);
}

- (id)serverUUID
{
  void *v2;
  void *v3;

  -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)providerBundleIdentifier
{
  void *v2;
  void *v3;

  -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[PFPosterPath contentsURL](self->_path, "contentsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hash");

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterConfiguration *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (PRSPosterConfiguration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[PFPosterPath serverIdentity](self->_path, "serverIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[PFPosterPath serverIdentity](v4->_path, "serverIdentity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = BSEqualObjects();

      }
      else
      {
        v6 = -[PFPosterPath isEqual:](self->_path, "isEqual:", v4->_path);
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p path=%@>"), v5, self, self->_path);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_path, CFSTR("p"));
}

- (PRSPosterConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  PRSPosterConfiguration *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PRSPosterConfiguration _initWithPath:](self, "_initWithPath:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_path, CFSTR("p"));
}

- (PRSPosterConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PRSPosterConfiguration *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = (PRSPosterConfiguration *)-[PRSPosterConfiguration _initWithPath:](self, "_initWithPath:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)persistableRepresentationWithError:(id *)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[PFPosterPath isServerPosterPath](self->_path, "isServerPosterPath")
    && -[PFPosterPath isPersistable](self->_path, "isPersistable"))
  {
    -[PRSPosterConfiguration bs_secureEncoded](self, "bs_secureEncoded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0CB2D68];
      v12[0] = CFSTR("configuration is not persistable");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v8, 1, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v5 = 0;
  }
  return v5;
}

+ (id)decodeFromPersistableRepresentation:(id)a3 expectedContainerIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  _QWORD v43[3];
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v43[0] = CFSTR("PRSPosterPath");
  v8 = a3;
  v44[0] = objc_opt_class();
  v43[1] = CFSTR("PRSServerPosterPath");
  v44[1] = objc_opt_class();
  v43[2] = CFSTR("PRSServerPosterIdentity");
  v44[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRSPosterConfiguration pf_secureDecodedFromData:classReplacementMap:](PRSPosterConfiguration, "pf_secureDecodedFromData:classReplacementMap:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "_path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "standardizedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PRSBehaviorAggregator dataStoreContainerDirectoryPath](PRSBehaviorAggregator, "dataStoreContainerDirectoryPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PRSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_1A4996000, v15, OS_LOG_TYPE_DEFAULT, "[decodeFromPersistableRepresentation] Attempting to fix up path for configuration. Persisted configuration container URL: %@ kContainerDirectory: %@, targetContainerIdentifier: %@>", buf, 0x20u);
    }

    objc_msgSend(v13, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeOfString:", v14);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v10;
    }
    else
    {
      v22 = v17;
      v23 = v18;
      objc_msgSend(v7, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length") == 36)
      {
        v25 = v22 + v23;
        objc_msgSend(v16, "substringWithRange:", v25, 36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", v24))
        {
          v19 = v10;
        }
        else
        {
          v32 = (void *)objc_msgSend(v16, "mutableCopy");
          objc_msgSend(v32, "replaceCharactersInRange:withString:", v25, 36, v24);
          v33 = (void *)MEMORY[0x1E0D7F8E8];
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v32, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "serverIdentity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "pathWithContainerURL:identity:", v27, v29);
          v34 = v26;
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v30);
          v26 = v34;

        }
      }
      else
      {
        v19 = v10;
      }

    }
    goto LABEL_17;
  }
  if (a5)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x1E0CB2D68];
    v42 = CFSTR("failed to decode configuration from data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v13, 2, v14);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

+ (id)decodeFromPersistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v9)
  {
    objc_msgSend(a1, "expectedContainerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1, "decodeFromPersistableRepresentation:expectedContainerIdentifier:error:", v6, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSUUID)expectedContainerIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (+[PRSBehaviorAggregator shouldUseSharedDataStore](PRSBehaviorAggregator, "shouldUseSharedDataStore"))
  {
    +[PRSBehaviorAggregator sharedInstance](PRSBehaviorAggregator, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sharedDirectoryURL");
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.PosterBoard"), 0, 0);
    objc_msgSend(v2, "dataContainerURL");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (BOOL)isEqualToPersistable:(id)a3
{
  id v4;
  char v5;
  int v7;

  v4 = a3;
  if (self->_pathValidityExtension)
  {
LABEL_2:
    v5 = 0;
    goto LABEL_3;
  }
  v7 = -[PFPosterPath isServerPosterPath](self->_path, "isServerPosterPath");
  v5 = 0;
  if (v4 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !*((_QWORD *)v4 + 1)
      && objc_msgSend(*((id *)v4 + 2), "isServerPosterPath"))
    {
      v5 = -[PFPosterPath isEqualToPersistable:](self->_path, "isEqualToPersistable:", *((_QWORD *)v4 + 2));
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v5;
}

- (PFPosterPath)_path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)_initWithPath:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
