@implementation FBSMutableSceneSettings(PRScene)

- (void)pr_setCaseColor:()PRScene
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
      -[FBSMutableSceneSettings(PRScene) pr_setCaseColor:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20562);

  }
}

- (void)pr_setPosterConfigurableOptions:()PRScene
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6 && (NSClassFromString(CFSTR("PRPosterConfigurableOptions")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PRScene) pr_setPosterConfigurableOptions:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20563);

  }
}

- (void)pr_setPosterConfiguredProperties:()PRScene
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  if (!v19)
  {
    v4 = 0;
    goto LABEL_5;
  }
  NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    +[PRPosterConfiguredProperties configuredPropertiesSanitizedForPassingToExtension:](PRPosterConfiguredProperties, "configuredPropertiesSanitizedForPassingToExtension:", v19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    objc_msgSend(a1, "otherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v4, 20564);

    objc_msgSend(a1, "transientLocalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forSetting:", v19, 20564);

    objc_msgSend(v19, "complicationLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "renderingConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "complications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    objc_msgSend(v7, "sidebarComplications");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    objc_msgSend(v7, "inlineComplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v19, "titleStyleConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "prefersVerticalTitleLayout");

      objc_msgSend(a1, "pr_setDepthEffectDisallowed:", objc_msgSend(v8, "isDepthEffectDisabled") | v15);
      objc_msgSend(a1, "pr_setParallaxEnabled:", objc_msgSend(v8, "isParallaxEnabled"));
    }
    objc_msgSend(v19, "titleStyleConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isAlternateDateEnabled");

    objc_msgSend(a1, "pr_setAlternateDateEnabled:", v17);
    objc_msgSend(a1, "pui_setInlineComplicationConfigured:", v13 != 0);
    objc_msgSend(a1, "pui_setComplicationRowConfigured:", v10 != 0);
    objc_msgSend(a1, "pui_setComplicationSidebarConfigured:", v12 != 0);
    objc_msgSend(a1, "pr_setParallaxDisallowed:", 1);

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSMutableSceneSettings(PRScene) pr_setPosterConfiguredProperties:].cold.1();
  objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)pr_setPosterTitleStyleConfiguration:()PRScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20565);

}

- (void)pr_setPosterAmbientConfiguration:()PRScene
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20566);

}

- (void)pr_setDepthEffectDisallowed:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20567);

}

- (void)pr_setParallaxEnabled:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagIfYes(), 20568);

}

- (void)pr_setParallaxDisallowed:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagIfYes(), 20569);

}

- (void)pr_setAlternateDateEnabled:()PRScene
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20763);

}

- (void)pr_setHorizontalTitleBoundingRect:()PRScene
{
  void *v9;
  void *v10;
  _QWORD v11[4];

  objc_msgSend(a1, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 20572);

}

- (void)pr_setVerticalTitleBoundingRect:()PRScene
{
  void *v9;
  void *v10;
  _QWORD v11[4];

  objc_msgSend(a1, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v11 = a2;
  *(double *)&v11[1] = a3;
  *(double *)&v11[2] = a4;
  *(double *)&v11[3] = a5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 20573);

}

- (void)pr_setCaseColor:()PRScene .cold.1()
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

- (void)pr_setPosterConfigurableOptions:()PRScene .cold.1()
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

- (void)pr_setPosterConfiguredProperties:()PRScene .cold.1()
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
