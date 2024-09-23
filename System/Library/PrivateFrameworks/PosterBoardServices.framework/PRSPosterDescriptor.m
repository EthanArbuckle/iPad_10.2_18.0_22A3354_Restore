@implementation PRSPosterDescriptor

- (PRSPosterDescriptor)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PRSPosterDescriptor *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PRSPosterDescriptor *v18;
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
    v20 = CFSTR("PRSPosterDescriptor.m");
    v21 = 1024;
    v22 = 22;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PRSPosterDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterDescriptor;
  -[PRSPosterDescriptor dealloc](&v3, sel_dealloc);
}

- (id)_initWithPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PRSPosterDescriptor *v8;
  PRSPosterDescriptor *v9;
  PFPosterPath *path;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  BSInvalidatable *pathValidityExtension;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterDescriptor _initWithPath:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A499BC9CLL);
  }
  v6 = v5;
  objc_msgSend(v5, "descriptorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("descriptors must have descriptorIdentifiers : %@"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterDescriptor _initWithPath:].cold.2();
    goto LABEL_11;
  }
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterDescriptor;
  v8 = -[PRSPosterDescriptor init](&v17, sel_init);
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

- (NSString)identifier
{
  return (NSString *)-[PFPosterPath descriptorIdentifier](self->_path, "descriptorIdentifier");
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
  PRSPosterDescriptor *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (PRSPosterDescriptor *)a3;
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

- (id)description
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

  return v6;
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

- (void)_initWithPath:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithPath:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
