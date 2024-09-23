@implementation PBFFocusSnapshotPreferredConfigurationArbiter

+ (void)determineDesiredConfigurations:(id *)a3 preferredConfiguration:(id *)a4 snapshotDefinition:(id *)a5 fromSwitcherConfiguration:(id)a6 configurationType:(int64_t)a7 variantType:(int64_t)a8 options:(unint64_t)a9 andFocusModeUUID:(id)a10 maxCount:(unint64_t)a11
{
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a10;
  objc_msgSend(v15, "configurations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke;
  v39[3] = &unk_1E86F3C40;
  v19 = v16;
  v40 = v19;
  v20 = v15;
  v41 = v20;
  objc_msgSend(v17, "bs_filter:", v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(a7 + 1) < 2)
  {
    objc_msgSend(v20, "selectedConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_8;
LABEL_6:
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke_2;
    v37[3] = &unk_1E86F31F8;
    v23 = v22;
    v38 = v23;
    objc_msgSend(v21, "sortedArrayUsingComparator:", v37);
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v24;
    if (!v19)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (a7 == 1)
  {
    objc_msgSend(v20, "activeConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      goto LABEL_6;
  }
LABEL_8:
  v23 = 0;
  if (!v19)
    goto LABEL_12;
LABEL_9:
  v25 = objc_msgSend(v21, "count");
  if ((a9 & 2) != 0 && !v25)
  {
    objc_msgSend(v20, "activeConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }
LABEL_12:
  if (a11)
  {
    v28 = objc_msgSend(v21, "count");
    if (v28 >= a11)
      v29 = a11;
    else
      v29 = v28;
    objc_msgSend(v21, "subarrayWithRange:", 0, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v30;
  }
  if ((unint64_t)(a8 + 1) >= 2)
  {
    if (a8 != 1)
      goto LABEL_31;
    +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition](PBFPosterSnapshotDefinition, "switcherUnlockedSnapshotDefinition");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition](PBFPosterSnapshotDefinition, "gallerySnapshotWithComplicationsDefinition");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v31;
  if (v31)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v23);
    if (a5)
      *a5 = objc_retainAutorelease(v32);
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    if (a5)
      *a5 = objc_retainAutorelease(v32);

    return;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("snapshotDefinition != nil"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[PBFFocusSnapshotPreferredConfigurationArbiter determineDesiredConfigurations:preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:].cold.1(a2, (uint64_t)a1, (uint64_t)v33);
  objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(a1 + 32))
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "focusConfigurationForPoster:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v6 = -1;
  else
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  return v6;
}

+ (void)determineDesiredConfigurations:(uint64_t)a3 preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBFFocusSnapshotPreferredConfigurationArbiter.m");
  v16 = 1024;
  v17 = 82;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
