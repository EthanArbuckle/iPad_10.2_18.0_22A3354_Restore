@implementation PUIPosterSnapshotterResult

- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundleBuilder:(id)a4 executionTime:(double)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  PUIPosterSnapshotterResult *v13;
  PUIPosterSnapshotterResult *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BSInvalidatable *outputPath;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = v9;
  NSClassFromString(CFSTR("PUIPosterSnapshotRequest"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:].cold.1();
LABEL_21:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24466AE34);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PUIPosterSnapshotRequestClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24466AE98);
  }

  v12 = v10;
  NSClassFromString(CFSTR("PUIPosterSnapshotBundleBuilder"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24466AEFCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PUIPosterSnapshotBundleBuilderClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:].cold.2();
    goto LABEL_21;
  }

  v24.receiver = self;
  v24.super_class = (Class)PUIPosterSnapshotterResult;
  v13 = -[PUIPosterSnapshotterResult init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    if (objc_msgSend(v11, "output") == 1)
    {
      v15 = (void *)MEMORY[0x24BE74D20];
      objc_msgSend(v11, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "role");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "temporaryPathForRole:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      outputPath = v14->_outputPath;
      v14->_outputPath = (BSInvalidatable *)v18;

    }
    objc_storeStrong((id *)&v14->_snapshotBundleBuilder, a4);
    v14->_executionTime = a5;
  }

  return v14;
}

- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executionTime:(double)a5
{
  id v8;
  id v9;
  PUIPosterSnapshotBundleBuilder *v10;
  PUIPosterSnapshotterResult *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:]([PUIPosterSnapshotBundleBuilder alloc], "initWithSnapshotBundle:", v8);

  v11 = -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:](self, "initWithRequest:snapshotBundleBuilder:executionTime:", v9, v10, a5);
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_outputPath, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotterResult;
  -[PUIPosterSnapshotterResult dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BSInvalidatable invalidate](self->_outputPath, "invalidate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotterResult)initWithCoder:(id)a3
{
  id v4;
  PUIPosterSnapshotterResult *v5;
  void *v6;
  uint64_t v7;
  PUIPosterSnapshotRequest *request;
  void *v9;
  uint64_t v10;
  BSInvalidatable *outputPath;
  void *v12;
  uint64_t v13;
  PUIPosterSnapshotBundle *snapshotBundle;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUIPosterSnapshotterResult;
  v5 = -[PUIPosterSnapshotterResult init](&v17, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_request"));
    v7 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (PUIPosterSnapshotRequest *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_outputPath"));
    v10 = objc_claimAutoreleasedReturnValue();
    outputPath = v5->_outputPath;
    v5->_outputPath = (BSInvalidatable *)v10;

    if (!v5->_outputPath)
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("_snapshotBundle"));
      v13 = objc_claimAutoreleasedReturnValue();
      snapshotBundle = v5->_snapshotBundle;
      v5->_snapshotBundle = (PUIPosterSnapshotBundle *)v13;

    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_executionTime"));
    v5->_executionTime = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  BSInvalidatable *outputPath;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  -[PUIPosterSnapshotterResult request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("_request"));

  outputPath = self->_outputPath;
  if (outputPath)
  {
    -[BSInvalidatable extendContentsReadAccessToAuditToken:error:](outputPath, "extendContentsReadAccessToAuditToken:error:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("_outputPath");
  }
  else
  {
    -[PUIPosterSnapshotterResult snapshotBundle](self, "snapshotBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("_snapshotBundle");
  }
  objc_msgSend(v8, "encodeObject:forKey:", v6, v7);

  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_executionTime"), self->_executionTime);
}

- (void)finalizeWithError:(id *)a3
{
  PUIPosterSnapshotBundleBuilder *snapshotBundleBuilder;
  void *v6;
  void *v7;
  PUIPosterSnapshotBundle *v8;
  PUIPosterSnapshotBundle *snapshotBundle;
  PUIPosterSnapshotBundle *v10;
  PUIPosterSnapshotBundleBuilder *v11;

  if (!self->_snapshotBundle)
  {
    snapshotBundleBuilder = self->_snapshotBundleBuilder;
    if (self->_outputPath)
    {
      -[PUIPosterSnapshotterResult _snapshotBundleURL](self, "_snapshotBundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUIImageOnDiskFormat defaultFormat](PUIImageOnDiskFormat, "defaultFormat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIPosterSnapshotBundleBuilder buildWithOutputURL:diskFormat:error:](snapshotBundleBuilder, "buildWithOutputURL:diskFormat:error:", v6, v7, a3);
      v8 = (PUIPosterSnapshotBundle *)objc_claimAutoreleasedReturnValue();
      snapshotBundle = self->_snapshotBundle;
      self->_snapshotBundle = v8;

    }
    else
    {
      -[PUIPosterSnapshotBundleBuilder buildWithError:](self->_snapshotBundleBuilder, "buildWithError:", a3);
      v10 = (PUIPosterSnapshotBundle *)objc_claimAutoreleasedReturnValue();
      v6 = self->_snapshotBundle;
      self->_snapshotBundle = v10;
    }

    if (self->_snapshotBundle)
    {
      v11 = self->_snapshotBundleBuilder;
      self->_snapshotBundleBuilder = 0;

    }
  }
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  PUIPosterSnapshotBundle *snapshotBundle;
  void *v4;
  uint64_t v5;
  PUIPosterSnapshotBundle *v6;
  void *v7;
  PUIPosterSnapshotBundle *v8;
  PUIPosterSnapshotBundle *v9;

  snapshotBundle = self->_snapshotBundle;
  if (!snapshotBundle)
  {
    -[PUIPosterSnapshotterResult request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "output");

    if (v5 == 1)
    {
      v6 = [PUIPosterSnapshotBundle alloc];
      -[PUIPosterSnapshotterResult _snapshotBundleURL](self, "_snapshotBundleURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PUIPosterSnapshotBundle initWithURL:](v6, "initWithURL:", v7);
      v9 = self->_snapshotBundle;
      self->_snapshotBundle = v8;

    }
    snapshotBundle = self->_snapshotBundle;
  }
  return snapshotBundle;
}

- (id)_snapshotBundleURL
{
  void *v2;
  void *v3;
  void *v4;

  -[BSInvalidatable contentsURL](self->_outputPath, "contentsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Snapshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("pks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (PFPosterPath)outputPath
{
  return self->_outputPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotBundle, 0);
  objc_storeStrong((id *)&self->_snapshotBundleBuilder, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
}

- (void)initWithRequest:snapshotBundleBuilder:executionTime:.cold.1()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequest:snapshotBundleBuilder:executionTime:.cold.2()
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

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
