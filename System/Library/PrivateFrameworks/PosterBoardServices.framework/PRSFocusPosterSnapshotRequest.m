@implementation PRSFocusPosterSnapshotRequest

- (PRSFocusPosterSnapshotRequest)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PRSFocusPosterSnapshotRequest *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PRSFocusPosterSnapshotRequest *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please use the designated initializer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PRSPosterSnapshotRequest.m");
    v17 = 1024;
    v18 = 426;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A4996000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PRSFocusPosterSnapshotRequest *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4
{
  return -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:](self, "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", a3, 1, 0, 0, 1, a4, 0.333333343);
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7
{
  return -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:](self, "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", a3, a4, a5, a6, 1, a7, 0.333333343);
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 maxCount:(unint64_t)a8
{
  return -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:](self, "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", a3, a4, a5, a6, 1, a8, a7);
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 orientation:(int64_t)a8 maxCount:(unint64_t)a9
{
  id v16;
  PRSFocusPosterSnapshotRequest *v17;
  uint64_t v18;
  NSString *focusModeUUID;
  double v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v16 = a3;
  if (v16)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:].cold.4();
LABEL_22:
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A49BECC0);
    }
  }

  if ((unint64_t)(a4 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configurationType >= PRSPosterSnapshotRequestConfigurationTypeNone && configurationType <= PRSPosterSnapshotRequestConfigurationTypeActive"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:].cold.1();
    goto LABEL_22;
  }
  if ((unint64_t)(a5 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("variant >= PRSPosterSnapshotRequestVariantNone && variant <= PRSPosterSnapshotRequestVariantHomeScreen"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BED24);
  }
  if (!a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("maxCount > 0"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:].cold.3();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BED88);
  }
  v25.receiver = self;
  v25.super_class = (Class)PRSFocusPosterSnapshotRequest;
  v17 = -[PRSFocusPosterSnapshotRequest init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    focusModeUUID = v17->_focusModeUUID;
    v17->_focusModeUUID = (NSString *)v18;

    v17->_configurationType = a4;
    v17->_variant = a5;
    v20 = 0.333333343;
    if (a7 > 0.0)
      v20 = a7;
    v17->_imageScaleRelativeToScreen = v20;
    v17->_orientation = a8;
    v17->_options = a6;
    v17->_maxCount = a9;
  }

  return v17;
}

- (PRSFocusPosterSnapshotRequest)initWithPosterRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  PRSFocusPosterSnapshotRequest *v25;

  v4 = a3;
  objc_msgSend(v4, "requestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionFocusUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "requestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyConfigurationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "requestOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyVariant"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v4, "requestOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionOptionsEnum"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v4, "requestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v4, "requestOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("PRSPosterSnapshotRequestOptionLegacyMaxCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  v24 = objc_msgSend(v4, "orientation");
  v25 = -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:](self, "initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:", v7, v10, v13, v16, v24, v23, v20);

  return v25;
}

- (void)setImageScaleRelativeToScreen:(double)a3
{
  self->_imageScaleRelativeToScreen = a3;
}

- (NSString)focusModeUUID
{
  return self->_focusModeUUID;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (int64_t)variant
{
  return self->_variant;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (double)imageScaleRelativeToScreen
{
  return self->_imageScaleRelativeToScreen;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusModeUUID, 0);
}

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.1()
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

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.2()
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

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.3()
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

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.4()
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
