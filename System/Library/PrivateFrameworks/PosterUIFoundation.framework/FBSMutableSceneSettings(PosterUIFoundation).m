@implementation FBSMutableSceneSettings(PosterUIFoundation)

- (void)pui_applyToMutableSceneSettings:()PosterUIFoundation
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BE384F8];
  v5 = a3;
  objc_msgSend(v4, "diffFromSettings:toSettings:", a1, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyToMutableSettings:", a1);
  objc_msgSend(v5, "pui_role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_setRole:", v6);

  objc_msgSend(a1, "pui_setPreviewContent:", objc_msgSend(v5, "pui_previewContent"));
  objc_msgSend(a1, "pui_setContent:", objc_msgSend(v5, "pui_content"));
  objc_msgSend(v5, "pui_provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_setProvider:", v7);

  objc_msgSend(v5, "pui_posterContents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_setPosterContents:", v8);

  objc_msgSend(v5, "pui_previewIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pui_setPreviewIdentifier:", v9);

  objc_msgSend(a1, "pui_setUserInterfaceStyle:", objc_msgSend(v5, "pui_userInterfaceStyle"));
  objc_msgSend(a1, "pui_setDeviceOrientation:", objc_msgSend(v5, "pui_deviceOrientation"));
  objc_msgSend(a1, "pui_setWallpaperObscured:", objc_msgSend(v5, "pui_isWallpaperObscured"));
  objc_msgSend(a1, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(v5, "pui_isExtensionUserInteractionEnabled"));
  objc_msgSend(a1, "pui_setSnapshot:", objc_msgSend(v5, "pui_isSnapshot"));
  objc_msgSend(a1, "pui_setFloatingLayerSnapshot:", objc_msgSend(v5, "pui_isFloatingLayerSnapshot"));
  objc_msgSend(a1, "pui_setSignificantEventsCounter:", objc_msgSend(v5, "pui_significantEventsCounter"));
  objc_msgSend(a1, "pui_setUserTapEventsCounter:", objc_msgSend(v5, "pui_userTapEventsCounter"));
  objc_msgSend(v5, "pui_userTapLocation");
  objc_msgSend(a1, "pui_setUserTapEventWithLocation:");
  objc_msgSend(a1, "pui_setShowsHeaderElements:", objc_msgSend(v5, "pui_showsHeaderElements"));
  objc_msgSend(a1, "pui_setShowsComplications:", objc_msgSend(v5, "pui_showsComplications"));
  objc_msgSend(v5, "pui_sceneAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pui_setSceneAttachments:", v10);
}

- (void)pui_setRole:()PosterUIFoundation
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9 && (NSClassFromString(CFSTR("NSString")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setRole:].cold.1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setObject:forSetting:", v5, 20462);

    objc_msgSend(a1, "otherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v6, "setObject:forSetting:", v7, 20211529);

  }
}

- (void)pui_setProvider:()PosterUIFoundation
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setProvider:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244685DC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setProvider:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(a1, "otherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v6, 20463);

}

- (void)pui_setInvalidated
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", 1, 20464);

}

- (void)pui_setPreviewIdentifier:()PosterUIFoundation
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6 && (NSClassFromString(CFSTR("NSString")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setPreviewIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20465);

  }
}

- (void)pui_setDeviceOrientation:()PosterUIFoundation
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 20466);

  v7 = objc_opt_class();
  v8 = a1;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;

  v10 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setDeviceOrientation:", a3);
    v10 = v11;
  }

}

- (void)pui_setPosterContents:()PosterUIFoundation
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6 && (NSClassFromString(CFSTR("PFServerPosterPath")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBSMutableSceneSettings(PosterUIFoundation) pui_setPosterContents:].cold.1();
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v6, 20467);

  }
}

- (void)pui_setWallpaperObscured:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20468);

}

- (void)pui_setInvalidated:()PosterUIFoundation
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "pui_setInvalidated");
  if (v5)
  {
    objc_msgSend(a1, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forSetting:", v5, 20469);

  }
}

- (void)pui_setExtensionUserInteractionEnabled:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20470);

}

- (void)pui_setInlineComplicationConfigured:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20471);

}

- (void)pui_setComplicationRowConfigured:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20472);

}

- (void)pui_setComplicationSidebarConfigured:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20473);

}

- (void)pui_setShowsComplications:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20474);

}

- (void)pui_setShowsHeaderElements:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20475);

}

- (void)pui_setUserInterfaceStyle:()PosterUIFoundation
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 20476);

  v7 = objc_opt_class();
  v8 = a1;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v11 = v9;

  v10 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setUserInterfaceStyle:", a3);
    v10 = v11;
  }

}

- (void)pui_setPosterBoundingShape:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20477);

}

- (void)pui_setSnapshot:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20487);

}

- (void)pui_setFloatingLayerSnapshot:()PosterUIFoundation
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 20488);

}

- (void)pui_setSignificantEventsCounter:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20489);

}

- (void)pui_setUserTapEventWithLocation:()PosterUIFoundation
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  objc_msgSend(a1, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v7, "{CGPoint=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 20490);

}

- (void)pui_setUserTapEventsCounter:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20491);

}

- (void)pui_setMode:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20492);

}

- (void)pui_setContent:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20493);

}

- (void)pui_setPreviewContent:()PosterUIFoundation
{
  void *v4;
  id v5;

  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20494);

}

- (void)pui_setSceneAttachments:()PosterUIFoundation
{
  id v3;
  xpc_object_t empty;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  xpc_object_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  empty = xpc_array_create_empty();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = xpc_dictionary_create_empty();
        xpc_dictionary_set_uint64(v11, "contextId", objc_msgSend(v10, "contextId"));
        xpc_dictionary_set_uint64(v11, "renderId", objc_msgSend(v10, "renderId"));
        xpc_dictionary_set_int64(v11, "level", objc_msgSend(v10, "level"));
        xpc_array_append_value(empty, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(a1, "otherSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", empty, 20495);

}

- (void)pui_setRole:()PosterUIFoundation .cold.1()
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

- (void)pui_setProvider:()PosterUIFoundation .cold.1()
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
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)pui_setPreviewIdentifier:()PosterUIFoundation .cold.1()
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

- (void)pui_setPosterContents:()PosterUIFoundation .cold.1()
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
