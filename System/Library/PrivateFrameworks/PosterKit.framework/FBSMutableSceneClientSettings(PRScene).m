@implementation FBSMutableSceneClientSettings(PRScene)

- (void)pr_setTimeDescriptor:()PRScene
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6 && (NSClassFromString(CFSTR("PRTimeDescriptor")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRTimeDescriptorClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings(PRScene) pr_setTimeDescriptor:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20612);

  }
}

- (void)pr_setStatusBarTintColor:()PRScene
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6 && (NSClassFromString(CFSTR("BSColor")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSColorClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneClientSettings(PRScene) pr_setStatusBarTintColor:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20613);

  }
}

- (void)pr_setDepthEffectDisabled:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20614);

}

- (void)pr_setParallaxEnabled:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20615);

}

- (void)pr_setVibrancyConfiguration:()PRScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20616);

}

- (void)pr_setTimeDescriptor:()PRScene .cold.1()
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

- (void)pr_setStatusBarTintColor:()PRScene .cold.1()
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
