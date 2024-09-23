@implementation PRSPosterConfiguration(PBFAdditions)

- (id)pui_modelObjectCache
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  if (objc_msgSend(v2, "isEqual:", objc_opt_class()))
  {
    objc_msgSend(a1, "_path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isServerPosterPath"))
    {
      +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)pr_loadConfiguredPropertiesWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuredProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:](PRPosterPathUtilities, "loadConfiguredPropertiesForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadFocusConfigurationWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadFocusConfigurationForPath:error:](PRPosterPathUtilities, "loadFocusConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadHomeScreenConfigurationWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeScreenConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadHomeScreenConfigurationForPath:error:](PRPosterPathUtilities, "loadHomeScreenConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadTitleStyleConfigurationWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadTitleStyleConfigurationForPath:error:](PRPosterPathUtilities, "loadTitleStyleConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadComplicationLayoutWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadComplicationLayoutForPath:error:](PRPosterPathUtilities, "loadComplicationLayoutForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadColorVariationsWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorVariationsConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadColorVariationsConfigurationForPath:error:](PRPosterPathUtilities, "loadColorVariationsConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadQuickActionsConfigurationWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickActionsConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadQuickActionsConfigurationForPath:error:](PRPosterPathUtilities, "loadQuickActionsConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadAmbientConfigurationWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ambientConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadAmbientConfigurationForPath:error:](PRPosterPathUtilities, "loadAmbientConfigurationForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadAmbientWidgetLayoutWithError:()PBFAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterPathUtilities loadAmbientWidgetLayoutForPath:error:](PRPosterPathUtilities, "loadAmbientWidgetLayoutForPath:error:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pr_loadSuggestionMetadataWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadSuggestionMetadataForPath:error:](PRPosterPathUtilities, "loadSuggestionMetadataForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pr_loadOtherMetadataWithError:()PBFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(a1, "pui_modelObjectCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "otherMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterPathUtilities loadOtherMetadataForPath:error:](PRPosterPathUtilities, "loadOtherMetadataForPath:error:", v9, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)pr_storeAmbientWidgetLayout:()PBFAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;

  v6 = a3;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "widgetLayoutIconState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    objc_msgSend(a1, "_path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[PRPosterPathUtilities storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:](PRPosterPathUtilities, "storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:", v10, v7, a4);
  }
  else
  {
    objc_msgSend(a1, "_path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[PRPosterPathUtilities removeAmbientWidgetLayout:error:](PRPosterPathUtilities, "removeAmbientWidgetLayout:error:", v10, a4);
  }
  v12 = v11;

  return v12;
}

- (id)pr_posterProvider
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pr_posterUUID
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serverIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pr_suggestedTintColor
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(a1, "pr_loadHomeScreenConfigurationWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    PRLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfiguration(PBFAdditions) pr_suggestedTintColor].cold.1(a2);

  }
  objc_msgSend(v3, "customizationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)pr_isHomeScreenDimmed
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v9;

  v9 = 0;
  objc_msgSend(a1, "pr_loadHomeScreenConfigurationWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    PRLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PRSPosterConfiguration(PBFAdditions) pr_suggestedTintColor].cold.1(a2);

  }
  objc_msgSend(v3, "customizationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDimmed");

  return v7;
}

- (void)pr_suggestedTintColor
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "%{public}@ error fetching home screen configuration: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
