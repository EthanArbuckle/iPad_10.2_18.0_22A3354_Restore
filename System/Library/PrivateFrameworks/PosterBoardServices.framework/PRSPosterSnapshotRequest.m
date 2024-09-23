@implementation PRSPosterSnapshotRequest

- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4
{
  id v6;
  PRSFocusPosterSnapshotRequest *v7;

  v6 = a3;
  v7 = -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:]([PRSFocusPosterSnapshotRequest alloc], "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", v6, 1, 0, 0, 1, a4, 0.333333343);

  return (PRSPosterSnapshotRequest *)v7;
}

- (PRSPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7
{
  id v12;
  PRSFocusPosterSnapshotRequest *v13;

  v12 = a3;
  v13 = -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:]([PRSFocusPosterSnapshotRequest alloc], "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", v12, a4, a5, a6, 1, a7, 0.333333343);

  return (PRSPosterSnapshotRequest *)v13;
}

- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  return -[PRSPosterSnapshotRequest initWithConfiguration:variantType:options:orientation:](self, "initWithConfiguration:variantType:options:orientation:", a3, a4, a5, 1);
}

- (PRSPosterSnapshotRequest)initWithDescriptor:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  id v8;
  PRSPosterSnapshotRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PFServerPosterPath *path;
  void *v16;
  objc_super v17;

  v8 = a3;
  NSClassFromString(CFSTR("PRSPosterDescriptor"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithDescriptor:variantType:options:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BD084);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterDescriptorClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithDescriptor:variantType:options:].cold.1();
    goto LABEL_11;
  }

  v17.receiver = self;
  v17.super_class = (Class)PRSPosterSnapshotRequest;
  v9 = -[PRSPosterSnapshotRequest init](&v17, sel_init);
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"));

    objc_msgSend(v8, "_path");
    v13 = objc_claimAutoreleasedReturnValue();
    path = v9->_path;
    v9->_path = (PFServerPosterPath *)v13;

    -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:](v9, "_validateRequestOptionsOrAbort:", 1);
  }

  return v9;
}

- (PRSPosterSnapshotRequest)initWithConfiguration:(id)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6
{
  id v10;
  PRSPosterSnapshotRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PFServerPosterPath *path;
  uint64_t v17;
  NSDictionary *requestOptions;
  void *v20;
  objc_super v21;

  v10 = a3;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithConfiguration:variantType:options:orientation:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BD2A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithConfiguration:variantType:options:orientation:].cold.1();
    goto LABEL_11;
  }

  v21.receiver = self;
  v21.super_class = (Class)PRSPosterSnapshotRequest;
  v11 = -[PRSPosterSnapshotRequest init](&v21, sel_init);
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"));

    objc_msgSend(v10, "_path");
    v15 = objc_claimAutoreleasedReturnValue();
    path = v11->_path;
    v11->_path = (PFServerPosterPath *)v15;

    v17 = objc_msgSend(v12, "copy");
    requestOptions = v11->_requestOptions;
    v11->_requestOptions = (NSDictionary *)v17;

    v11->_orientation = a6;
    -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:](v11, "_validateRequestOptionsOrAbort:", 1);

  }
  return v11;
}

- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5 orientation:(int64_t)a6
{
  PRSPosterSnapshotRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *requestOptions;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PRSPosterSnapshotRequest;
  v10 = -[PRSPosterSnapshotRequest init](&v18, sel_init);
  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType"));

    v15 = objc_msgSend(v11, "copy");
    requestOptions = v10->_requestOptions;
    v10->_requestOptions = (NSDictionary *)v15;

    v10->_orientation = a6;
    -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:](v10, "_validateRequestOptionsOrAbort:", 1);

  }
  return v10;
}

- (PRSPosterSnapshotRequest)initWithConfigurationType:(int64_t)a3 variantType:(int64_t)a4 options:(unint64_t)a5
{
  return -[PRSPosterSnapshotRequest initWithConfigurationType:variantType:options:orientation:](self, "initWithConfigurationType:variantType:options:orientation:", a3, a4, a5, 1);
}

- (PRSPosterSnapshotRequest)initWithPath:(id)a3 requestOptions:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  PRSPosterSnapshotRequest *v11;
  PRSPosterSnapshotRequest *v12;
  uint64_t v13;
  NSDictionary *requestOptions;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (v9)
  {
    NSClassFromString(CFSTR("PFServerPosterPath"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshotRequest initWithPath:requestOptions:].cold.3();
LABEL_16:
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49BD5A4);
    }
  }

  v10 = v8;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithPath:requestOptions:].cold.1();
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithPath:requestOptions:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BD608);
  }

  v18.receiver = self;
  v18.super_class = (Class)PRSPosterSnapshotRequest;
  v11 = -[PRSPosterSnapshotRequest init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_path, a3);
    v13 = objc_msgSend(v10, "copy");
    requestOptions = v12->_requestOptions;
    v12->_requestOptions = (NSDictionary *)v13;

    -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:](v12, "_validateRequestOptionsOrAbort:", 1);
  }

  return v12;
}

- (PRSPosterSnapshotRequest)initWithFocusPosterRequest:(id)a3
{
  id v4;
  PRSPosterSnapshotRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSDictionary *requestOptions;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSClassFromString(CFSTR("PRSFocusPosterSnapshotRequest"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithFocusPosterRequest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BD97CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSFocusPosterSnapshotRequestClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest initWithFocusPosterRequest:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BD9E0);
  }

  v23.receiver = self;
  v23.super_class = (Class)PRSPosterSnapshotRequest;
  v5 = -[PRSPosterSnapshotRequest init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    v24[0] = CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "variant"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    v24[1] = CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "configurationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v8;
    v24[2] = CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "imageScaleRelativeToScreen");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v10;
    v24[3] = CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "maxCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v11;
    v24[4] = CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = CFSTR("PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest");
    v25[4] = v12;
    v25[5] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v13);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "focusModeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v4, "focusModeUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
      -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, CFSTR("PRSPosterSnapshotRequestOptionFocusUUID"));

    }
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = v14;

    v5->_orientation = objc_msgSend(v4, "orientation");
    -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:](v5, "_validateRequestOptionsOrAbort:", 1);
  }

  return v5;
}

+ (id)validOptions
{
  if (validOptions_onceToken != -1)
    dispatch_once(&validOptions_onceToken, &__block_literal_global_10);
  return (id)validOptions_validOptions;
}

void __40__PRSPosterSnapshotRequest_validOptions__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"), CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"), CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType"), CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount"), CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"), CFSTR("PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier"), CFSTR("PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest"), CFSTR("PRSPosterSnapshotRequestOptionFocusUUID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validOptions_validOptions;
  validOptions_validOptions = v0;

}

- (int64_t)variantType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PRSPosterSnapshotRequest requestOptions](self, "requestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)configurationType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PRSPosterSnapshotRequest requestOptions](self, "requestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (unint64_t)options
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PRSPosterSnapshotRequest requestOptions](self, "requestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)imageScaleRelativeToScreen
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PRSPosterSnapshotRequest requestOptions](self, "requestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (unint64_t)maxCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PRSPosterSnapshotRequest requestOptions](self, "requestOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)_validateRequestOptionsOrAbort:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[NSDictionary allKeys](self->_requestOptions, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v9)
  {
    v28 = 1;
    goto LABEL_53;
  }
  v10 = v9;
  v11 = *(_QWORD *)v37;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v37 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
    objc_msgSend((id)objc_opt_class(), "validOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v13);

    if ((v15 & 1) == 0)
    {
      if (!v3)
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest contained undefined key '%@'"), v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.7();
      goto LABEL_62;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen")))
    {
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      if (v18 < 0.0)
        break;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount")))
    {
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unsignedIntegerValue");

    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType")))
    {
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      if ((unint64_t)(v21 + 1) >= 3)
      {
        if (v3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.1();
          objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A49BE04CLL);
        }
        goto LABEL_52;
      }
      goto LABEL_23;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant")))
    {
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      if ((unint64_t)(v23 + 1) >= 3)
      {
        if (v3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.2();
          objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A49BE0C0);
        }
        goto LABEL_52;
      }
      goto LABEL_23;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier")))
    {
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "length"))
      {
        if (v3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.3();
          objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A49BE1D0);
        }

        goto LABEL_52;
      }
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum")))
      {
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest")))
        {
          -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (!v25 && v3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.5();
            objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1A49BE174);
          }

          if (!v26)
            goto LABEL_52;
        }
        goto LABEL_23;
      }
      -[NSDictionary objectForKey:](self->_requestOptions, "objectForKey:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        if (!v3)
          goto LABEL_52;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.4();
LABEL_62:
        objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A49BDF84);
      }
    }

LABEL_23:
    if (v10 == ++v12)
    {
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v10 = v27;
      v28 = 1;
      if (!v27)
        goto LABEL_53;
      goto LABEL_3;
    }
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRSPosterSnapshotRequest key '%@' was outside acceptable bounds"), v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterSnapshotRequest _validateRequestOptionsOrAbort:].cold.6();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BDFE8);
  }
LABEL_52:
  v28 = 0;
LABEL_53:

  return v28;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "sanitizeRequestOptions:", self->_requestOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("_requestOptions"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_path, CFSTR("_path"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_orientation, CFSTR("_orientation"));

}

- (PRSPosterSnapshotRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSPosterSnapshotRequest *v5;
  void *v6;
  uint64_t v7;
  PFServerPosterPath *path;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *requestOptions;
  unint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PRSPosterSnapshotRequest;
  v5 = -[PRSPosterSnapshotRequest init](&v16, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_path"));
    v7 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v7;

    v9 = (void *)objc_opt_class();
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_requestOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contaminateRequestOptions:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = (NSDictionary *)v11;

    v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_orientation"));
    if (v13 <= 1)
      v14 = 1;
    else
      v14 = v13;
    v5->_orientation = v14;
  }

  return v5;
}

+ (id)sanitizeRequestOptions:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(a1, "validOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_dictionary_create(0, 0, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PRSPosterSnapshotRequest_sanitizeRequestOptions___block_invoke;
  v12[3] = &unk_1E4D42DD8;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __51__PRSPosterSnapshotRequest_sanitizeRequestOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13))
  {
    v6 = (void *)MEMORY[0x1A85A43E4]();
    v7 = objc_retainAutorelease(v13);
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen")))
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v5, "doubleValue");
      xpc_dictionary_set_double(v9, v8, v10);
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant")))
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "unsignedIntegerValue"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType")))xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "unsignedIntegerValue"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount")))
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "unsignedIntegerValue"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum")))
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "unsignedIntegerValue"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier")))xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), v8, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest")))xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), v8, objc_msgSend(v5, "BOOLValue"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionFocusUUID")))
    {
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v5, "UUIDString");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v11, v8, (const char *)objc_msgSend(v12, "UTF8String"));

    }
    objc_autoreleasePoolPop(v6);
  }

}

+ (id)contaminateRequestOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD applier[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(a1, "validOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __54__PRSPosterSnapshotRequest_contaminateRequestOptions___block_invoke;
  applier[3] = &unk_1E4D42E00;
  v13 = v5;
  v14 = v6;
  v15 = v4;
  v7 = v4;
  v8 = v6;
  v9 = v5;
  xpc_dictionary_apply(v7, applier);
  v10 = (void *)objc_msgSend(v8, "copy");

  return v10;
}

uint64_t __54__PRSPosterSnapshotRequest_contaminateRequestOptions___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  void *v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1A85A43E4]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen")))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", xpc_dictionary_get_double(*(xpc_object_t *)(a1 + 48), a2));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"))
           || objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType"))|| objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount"))|| objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum")))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 48), a2));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionSnapshotDefinitionIdentifier")))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), a2));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionLegacyIsFocusModeSnapshotRequest")))
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PRSPosterSnapshotRequestOptionFocusUUID")))
          goto LABEL_11;
        v12 = *(void **)(a1 + 40);
        v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 48), a2));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "initWithUUIDString:", v10);
        objc_msgSend(v12, "setObject:forKey:", v14, v7);

        goto LABEL_10;
      }
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 48), a2));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    objc_msgSend(v8, "setObject:forKey:", v9, v7);
LABEL_10:

  }
LABEL_11:

  objc_autoreleasePoolPop(v6);
  return 1;
}

- (void)setImageScaleRelativeToScreen:(double)a3
{
  self->_imageScaleRelativeToScreen = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (NSDictionary)requestOptions
{
  return self->_requestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithDescriptor:variantType:options:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfiguration:variantType:options:orientation:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPath:requestOptions:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPath:requestOptions:.cold.3()
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

- (void)initWithFocusPosterRequest:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_validateRequestOptionsOrAbort:.cold.1()
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

- (void)_validateRequestOptionsOrAbort:.cold.2()
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

- (void)_validateRequestOptionsOrAbort:.cold.3()
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

- (void)_validateRequestOptionsOrAbort:.cold.4()
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

- (void)_validateRequestOptionsOrAbort:.cold.5()
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

- (void)_validateRequestOptionsOrAbort:.cold.6()
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

- (void)_validateRequestOptionsOrAbort:.cold.7()
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
