@implementation PUIPosterSnapshotRequest

- (PUIPosterSnapshotRequest)initWithPath:(id)a3 snapshotCacheIdentifier:(id)a4 settings:(id)a5 output:(unint64_t)a6 priority:(int64_t)a7 snapshotLevelSets:(id)a8 snapshotLegibilityProcessingRequest:(id)a9 attachments:(id)a10 timeout:(double)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  PUIPosterSnapshotRequest *v25;
  uint64_t v26;
  NSDate *date;
  uint64_t v28;
  NSString *snapshotCacheIdentifier;
  void *v30;
  uint64_t v31;
  NSString *provider;
  uint64_t v33;
  NSArray *snapshotLevelSets;
  uint64_t v35;
  PUIPosterSnapshotLegibilityProcessingRequest *legibilityProcessingRequest;
  uint64_t v37;
  NSArray *attachments;
  uint64_t v39;
  NSUUID *uniqueIdentifier;
  void *v42;
  void *v43;
  void *v44;
  objc_super v47;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("path"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.1();
LABEL_20:
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244673D58);
  }
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settings"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.2();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244673DBCLL);
  }
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("snapshotCacheIdentifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.3();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244673E20);
  }
  v23 = v22;
  v24 = v20;
  if (v24)
  {
    NSClassFromString(CFSTR("NSArray"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:].cold.4();
      goto LABEL_20;
    }
  }

  v47.receiver = self;
  v47.super_class = (Class)PUIPosterSnapshotRequest;
  v25 = -[PUIPosterSnapshotRequest init](&v47, sel_init);
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = objc_claimAutoreleasedReturnValue();
    date = v25->_date;
    v25->_date = (NSDate *)v26;

    objc_storeStrong((id *)&v25->_path, a3);
    v28 = objc_msgSend(v18, "copy");
    snapshotCacheIdentifier = v25->_snapshotCacheIdentifier;
    v25->_snapshotCacheIdentifier = (NSString *)v28;

    objc_msgSend(v17, "serverIdentity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "provider");
    v31 = objc_claimAutoreleasedReturnValue();
    provider = v25->_provider;
    v25->_provider = (NSString *)v31;

    objc_storeStrong((id *)&v25->_settings, a5);
    v25->_priority = a7;
    v25->_output = a6;
    v33 = objc_msgSend(v24, "copy");
    snapshotLevelSets = v25->_snapshotLevelSets;
    v25->_snapshotLevelSets = (NSArray *)v33;

    v25->_timeoutInterval = a11;
    v35 = objc_msgSend(v21, "copy");
    legibilityProcessingRequest = v25->_legibilityProcessingRequest;
    v25->_legibilityProcessingRequest = (PUIPosterSnapshotLegibilityProcessingRequest *)v35;

    v37 = objc_msgSend(v23, "copy");
    attachments = v25->_attachments;
    v25->_attachments = (NSArray *)v37;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v39 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v25->_uniqueIdentifier;
    v25->_uniqueIdentifier = (NSUUID *)v39;

  }
  return v25;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uniqueIdentifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  PUIPosterSnapshotRequest *v39;
  void *v40;
  uint64_t v41;
  NSUUID *uniqueIdentifier;
  void *v43;
  uint64_t v44;
  NSDate *date;
  void *v46;
  uint64_t v47;
  NSString *provider;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("path"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("serverPosterPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("priority"));
  v51 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("output"));
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("legibilityProcessingRequest"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("_attachments"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("timeoutInterval"));
  v12 = v11;
  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("snapshotLevelSets"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_snapshotCacheIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v19, CFSTR("sceneSettingsOtherSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneSettingsFrame"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "CGRectValue");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sceneSettingsInterfaceOrientation"));
  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v31, CFSTR("sceneSettingsDisplayConfigurationIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE38400], "pui_displayConfigurationForHardwareIdentifier:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38470], "settings");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke;
  v58[3] = &unk_25154C280;
  v36 = v34;
  v59 = v36;
  objc_msgSend(v20, "enumerateObjectsWithBlock:", v58);
  v56[0] = v35;
  v56[1] = 3221225472;
  v56[2] = __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke_2;
  v56[3] = &unk_25154C2A8;
  v37 = v36;
  v57 = v37;
  objc_msgSend(v20, "enumerateFlagsWithBlock:", v56);
  objc_msgSend(v37, "setDisplayConfiguration:", v33);
  objc_msgSend(v37, "setFrame:", v23, v25, v27, v29);
  objc_msgSend(v37, "setInterfaceOrientation:", v30);
  if (v6)
    v38 = v6;
  else
    v38 = v55;
  v39 = -[PUIPosterSnapshotRequest initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:](self, "initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:", v38, v18, v37, v51, v52, v17, v12, v50, v54);
  if (v39)
  {
    objc_opt_self();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v40, CFSTR("uniqueIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v39->_uniqueIdentifier;
    v39->_uniqueIdentifier = (NSUUID *)v41;

    objc_opt_self();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v43, CFSTR("date"));
    v44 = objc_claimAutoreleasedReturnValue();
    date = v39->_date;
    v39->_date = (NSDate *)v44;

    objc_opt_self();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", v46, CFSTR("provider"));
    v47 = objc_claimAutoreleasedReturnValue();
    provider = v39->_provider;
    v39->_provider = (NSString *)v47;

  }
  return v39;
}

void __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "otherSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v5, a2);

}

void __42__PUIPosterSnapshotRequest_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlag:forSetting:", a3, a2);

}

- (void)encodeWithCoder:(id)a3
{
  PFPosterPath *path;
  PFPosterPath *v5;
  PFPosterPath *v6;
  PFPosterPath *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  path = self->_path;
  v14 = a3;
  -[PFPosterPath extendContentsReadAccessToAuditToken:error:](path, "extendContentsReadAccessToAuditToken:error:", 0, 0);
  v5 = (PFPosterPath *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v6 = self->_path;
  v7 = v6;

  if (-[PFPosterPath isServerPosterPath](self->_path, "isServerPosterPath"))
    v8 = CFSTR("serverPosterPath");
  else
    v8 = CFSTR("path");
  objc_msgSend(v14, "encodeObject:forKey:", v7, v8);
  -[FBSSceneSettings otherSettings](self->_settings, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("sceneSettingsOtherSettings"));

  v10 = (void *)MEMORY[0x24BDD1968];
  -[FBSSceneSettings frame](self->_settings, "frame");
  objc_msgSend(v10, "valueWithCGRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("sceneSettingsFrame"));

  -[FBSSceneSettings displayConfiguration](self->_settings, "displayConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pui_displayConfigurationIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("sceneSettingsDisplayConfigurationIdentifier"));

  objc_msgSend(v14, "encodeInteger:forKey:", -[FBSSceneSettings interfaceOrientation](self->_settings, "interfaceOrientation"), CFSTR("sceneSettingsInterfaceOrientation"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_snapshotLevelSets, CFSTR("snapshotLevelSets"));
  objc_msgSend(v14, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v14, "encodeInteger:forKey:", self->_output, CFSTR("output"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v14, "encodeDouble:forKey:", CFSTR("timeoutInterval"), self->_timeoutInterval);
  objc_msgSend(v14, "encodeObject:forKey:", self->_legibilityProcessingRequest, CFSTR("legibilityProcessingRequest"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_snapshotCacheIdentifier, CFSTR("_snapshotCacheIdentifier"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_attachments, CFSTR("_attachments"));

}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)snapshotCacheIdentifier
{
  return self->_snapshotCacheIdentifier;
}

- (NSArray)snapshotLevelSets
{
  return self->_snapshotLevelSets;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)legibilityProcessingRequest
{
  return self->_legibilityProcessingRequest;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (int64_t)priority
{
  return self->_priority;
}

- (unint64_t)output
{
  return self->_output;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_legibilityProcessingRequest, 0);
  objc_storeStrong((id *)&self->_snapshotLevelSets, 0);
  objc_storeStrong((id *)&self->_snapshotCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.1()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.2()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.3()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPath:snapshotCacheIdentifier:settings:output:priority:snapshotLevelSets:snapshotLegibilityProcessingRequest:attachments:timeout:.cold.4()
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
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
