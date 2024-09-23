@implementation UIWindowScene(PRScene)

- (void)pr_updatePreferences:()PRScene withTransition:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_FBSScene");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13[1] = 3221225472;
    v13[2] = __62__UIWindowScene_PRScene__pr_updatePreferences_withTransition___block_invoke;
    v13[3] = &unk_1E2185C50;
    v14 = v6;
    v15 = v7;
    v16 = a1;
    v12 = (id)v8;
    v13[0] = MEMORY[0x1E0C809B0];
    v9 = v7;
    v10 = v6;
    objc_msgSend(v12, "pr_performUpdate:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no FBSScene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[UIWindowScene(PRScene) pr_updatePreferences:withTransition:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)pr_updatePreferences:()PRScene withTransition:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
