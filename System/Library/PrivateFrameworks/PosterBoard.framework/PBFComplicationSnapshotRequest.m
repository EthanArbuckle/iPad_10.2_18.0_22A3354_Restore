@implementation PBFComplicationSnapshotRequest

+ (id)requestsForPreview:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(void *, void *, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(void *, void *, id);
  id v14;
  id v15;
  void *v16;
  id v17;
  void (**v18)(void *, void *, id);
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void (**v27)(void *, void *, id);
  _QWORD v28[4];
  id v29;
  id v30;
  void (**v31)(void *, void *, id);
  _QWORD aBlock[5];

  v4 = a3;
  objc_msgSend(v4, "subtitleComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "suggestedComplications"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "count")))
  {

  }
  else
  {
    objc_msgSend(v4, "suggestedLandscapeComplications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      v20 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke;
  aBlock[3] = &__block_descriptor_40_e92___PBFComplicationSnapshotRequest_24__0___PBFComplicationLookupInfo__8___PBFPosterPreview__16l;
  aBlock[4] = a1;
  v7 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "subtitleComplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "subtitleComplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bs_safeAddObject:", v11);
  }
  objc_msgSend(v4, "suggestedComplications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_2;
  v28[3] = &unk_1E86F5810;
  v13 = v7;
  v31 = v13;
  v14 = v4;
  v29 = v14;
  v15 = v8;
  v30 = v15;
  objc_msgSend(v12, "bs_each:", v28);

  objc_msgSend(v14, "suggestedLandscapeComplications");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_3;
  v24[3] = &unk_1E86F5810;
  v27 = v13;
  v25 = v14;
  v17 = v15;
  v26 = v17;
  v18 = v13;
  objc_msgSend(v16, "bs_each:", v24);

  v19 = v26;
  v20 = v17;

LABEL_7:
  return v20;
}

uint64_t __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestForComplicationLookupInfo:", a2);
}

void __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bs_safeAddObject:", v2);

}

void __53__PBFComplicationSnapshotRequest_requestsForPreview___block_invoke_3(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bs_safeAddObject:", v2);

}

+ (id)requestForComplicationLookupInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "complicationExtensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "complicationContainingBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "complicationWidgetKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "complicationWidgetFamily");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "complicationIntent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10148]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v5, v6, v7, v9, v10);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D7FBD0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemMetricsForWidget:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWidget:metrics:", v11, v13);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (PBFComplicationSnapshotRequest)initWithWidget:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  PBFComplicationSnapshotRequest *v11;
  PBFComplicationSnapshotRequest *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("CHSWidget"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA84760);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:CHSWidgetClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA847C4);
  }

  v10 = v8;
  NSClassFromString(CFSTR("CHSWidgetMetrics"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA84828);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:CHSWidgetMetricsClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotRequest initWithWidget:metrics:].cold.2();
    goto LABEL_19;
  }

  v20.receiver = self;
  v20.super_class = (Class)PBFComplicationSnapshotRequest;
  v11 = -[PBFComplicationSnapshotRequest init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_widget, a3);
    objc_storeStrong((id *)&v12->_metrics, a4);
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "appendObject:", v12->_widget);
    v15 = (id)objc_msgSend(v13, "appendObject:", v10);
    v12->_hash = objc_msgSend(v13, "hash");

  }
  return v12;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  PBFComplicationSnapshotRequest *v4;
  PBFComplicationSnapshotRequest *v5;
  char v6;

  v4 = (PBFComplicationSnapshotRequest *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      v5 = v4;
      if (BSEqualObjects())
        v6 = BSEqualObjects();
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  PBFComplicationSnapshotRequest *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_hash, CFSTR("_hash"));
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__PBFComplicationSnapshotRequest_description__block_invoke;
  v11 = &unk_1E86F2540;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("content"), 0, &v8);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __45__PBFComplicationSnapshotRequest_description__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("_widget"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("_metrics"));
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)initWithWidget:metrics:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithWidget:metrics:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
