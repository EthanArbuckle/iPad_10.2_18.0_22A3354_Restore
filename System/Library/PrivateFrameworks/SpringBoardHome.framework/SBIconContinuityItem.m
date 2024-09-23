@implementation SBIconContinuityItem

+ (id)itemForContinuityInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isLocationBasedSuggestion") & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isBluetoothAudioPrediction") & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isBluetoothPrediction") & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isHeadphonesPrediction") & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isFirstWakePrediction"))
    {
      v6 = 6;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v5, "originatingDeviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_resolvedItemForExplicitBadgeType:deviceTypeIdentifier:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (SBIconContinuityItem)itemWithBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = v6;
  if (a3 == 1 && !v6)
    NSLog(CFSTR("SBIconContinuityBadgeTypeDevice is never going to resolve successfully if the specified 'deviceTypeIdentifier' is nil."));
  objc_msgSend(a1, "_resolvedItemForExplicitBadgeType:deviceTypeIdentifier:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconContinuityItem *)v8;
}

- (SBIconContinuityItem)initWithBadgeType:(int64_t)a3 systemImageName:(id)a4
{
  id v8;
  void *v9;
  SBIconContinuityItem *v10;
  SBIconContinuityItem *v11;
  void *v13;
  objc_super v14;

  v8 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("badgeType != SBIconContinuityBadgeTypeNone"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBIconContinuityItem initWithBadgeType:systemImageName:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFF93440);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemImageName != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBIconContinuityItem initWithBadgeType:systemImageName:].cold.2(a2);
    goto LABEL_11;
  }
  v14.receiver = self;
  v14.super_class = (Class)SBIconContinuityItem;
  v10 = -[SBIconContinuityItem init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_badgeType = a3;
    objc_storeStrong((id *)&v10->_systemImageName, a4);
  }

  return v11;
}

- (SBIconContinuityItem)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBIconContinuityItem *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBIconContinuityItem *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed for SBIconContinuityItem"));
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
    v16 = CFSTR("SBIconContinuityItem.m");
    v17 = 1024;
    v18 = 74;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CFEF3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBIconContinuityItem *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)itemForBadgeTypeString:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "itemWithBadgeType:deviceTypeIdentifier:", objc_msgSend(a1, "_continuityBadgeTypeForNSString:", a3), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_resolvedItemForExplicitBadgeType:(int64_t)a3 deviceTypeIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v12;
  id v13;

  v6 = a4;
  if (v6)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v6, 1, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      objc_msgSend(v7, "name");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mac")) & 1) != 0)
    {
      v9 = CFSTR("display");
LABEL_6:

      a3 = 1;
LABEL_7:
      v10 = objc_msgSend(objc_alloc((Class)a1), "initWithBadgeType:systemImageName:", a3, v9);

      v9 = (__CFString *)v10;
      goto LABEL_8;
    }
    SBLogContinuity();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[SBIconContinuityItem _resolvedItemForExplicitBadgeType:deviceTypeIdentifier:].cold.1((uint64_t)v6, v12);

  }
  v9 = 0;
  switch(a3)
  {
    case 0:
    case 1:
      break;
    case 2:
      v9 = CFSTR("headphones");
      goto LABEL_7;
    case 3:
      v9 = CFSTR("bluetooth");
      goto LABEL_7;
    case 4:
      v9 = CFSTR("airpods");
      goto LABEL_7;
    case 5:
      v9 = CFSTR("location.fill");
      goto LABEL_7;
    case 6:
      v9 = CFSTR("alarm");
      goto LABEL_7;
    default:
      goto LABEL_7;
  }
LABEL_8:

  return v9;
}

+ (int64_t)_continuityBadgeTypeForNSString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeDevice")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeAUX")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeBluetooth")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeHeadphones")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeLocation")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconContinuityBadgeTypeWake")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBIconContinuityItem *v4;
  void *v5;
  char isKindOfClass;
  SBIconContinuityItem *v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SBIconContinuityItem *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[SBIconContinuityItem badgeType](self, "badgeType");
      if (v8 == -[SBIconContinuityItem badgeType](v7, "badgeType"))
      {
        -[SBIconContinuityItem systemImageName](self, "systemImageName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconContinuityItem systemImageName](v7, "systemImageName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SBIconContinuityItem badgeType](self, "badgeType");
  -[SBIconContinuityItem systemImageName](self, "systemImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[SBIconContinuityItem badgeType](self, "badgeType") - 1;
  if (v5 > 5)
    v6 = CFSTR("none");
  else
    v6 = off_1E8D86950[v5];
  -[SBIconContinuityItem systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; badgeType: %@, systemImageName: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (void)initWithBadgeType:(const char *)a1 systemImageName:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1CFEF3000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithBadgeType:(const char *)a1 systemImageName:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1CFEF3000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_resolvedItemForExplicitBadgeType:(uint64_t)a1 deviceTypeIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Failed to find symbol for device type identifier: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end
