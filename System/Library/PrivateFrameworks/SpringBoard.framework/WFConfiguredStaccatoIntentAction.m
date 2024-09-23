@implementation WFConfiguredStaccatoIntentAction

- (void)sb_accessibilityTripleClickState
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (id)sb_focusModeIdentifier
{
  id v1;
  void *v2;
  char v3;
  void *v4;
  void *v5;
  id result;
  void *v7;

  v1 = a1;
  if (!a1)
    return v1;
  objc_msgSend(a1, "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Focus"));

  if ((v3 & 1) != 0)
  {
    objc_msgSend(v1, "templateParameterValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("focus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    return v1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only query this on the Focus action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier].cold.1(sel_sb_focusModeIdentifier);
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)sb_getCameraCaptureMode:(_QWORD *)a3 andCaptureDevice:
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1, "sectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Camera"));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only query this on the Camera action"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[WFConfiguredStaccatoIntentAction sb_getCameraCaptureMode:andCaptureDevice:].cold.1(sel_sb_getCameraCaptureMode_andCaptureDevice_);
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AC4544);
    }
    objc_msgSend(a1, "templateParameterValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("cameraMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "hasSuffix:", CFSTR("Video")) & 1) != 0)
    {
      v10 = 1;
    }
    else if (objc_msgSend(v13, "hasSuffix:", CFSTR("Portrait")))
    {
      v10 = 2;
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(v13, "hasPrefix:", CFSTR("front"));
    *a2 = v10;
    *a3 = v11 ^ 1u;

  }
}

- (void)sb_focusModeIdentifier
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sb_getCameraCaptureMode:(const char *)a1 andCaptureDevice:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
