@implementation PRPosterPathUtilities

+ (id)expectedConfigurationFilesForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "descriptorGalleryOptionsURLForPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(a1, "otherMetadataURLForPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "suggestionMetadataURLForPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(a1, "colorVariationsConfigurationURLForPath:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v9);
  objc_msgSend(a1, "complicationsLayoutURLForPath:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v10);
  objc_msgSend(a1, "focusConfigurationURLForPath:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v11);
  objc_msgSend(a1, "homeScreenConfigurationURLForPath:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v12);
  v29 = v7;
  objc_msgSend(a1, "oldHomeScreenConfigurationURLForPath:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v13);
  v28 = v8;
  objc_msgSend(a1, "renderingConfigurationURLForPath:", v4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v14);
  v27 = v9;
  objc_msgSend(a1, "depthEffectConfigurationURLForPath:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v15);
  v26 = v10;
  objc_msgSend(a1, "titleStyleConfigurationURLForPath:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v16);
  v25 = v11;
  objc_msgSend(a1, "ambientConfigurationURLForPath:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v17);
  v24 = v12;
  objc_msgSend(a1, "ambientWidgetLayoutURLForPath:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v18);
  v30 = v6;
  objc_msgSend(a1, "userInfoURLForPath:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v19);
  objc_msgSend(a1, "configurableOptionsURLForPath:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "addObject:", v20);
  v21 = (void *)objc_msgSend(v5, "copy");

  return v21;
}

+ (id)loadUserObjectForURL:(id)a3 expectedClass:(Class)a4 strict:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  Class v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", a6))
  {
    v16 = 0;
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x18D77C448]();
  v22 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v9, 1, &v22);
  v12 = v22;
  v13 = v12;
  if (!v11)
  {
    PRLogModel();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v9;
      v25 = 2112;
      v26 = a4;
      v27 = 2114;
      v28 = v13;
      _os_log_debug_impl(&dword_18B634000, v18, OS_LOG_TYPE_DEBUG, "Unable to load user object @ %@; expected class %@: %{public}@",
        buf,
        0x20u);
    }
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x1E0CB3710];
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4);
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = v13;
    objc_msgSend(v14, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v15, v11, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;

    v13 = (void *)v15;
  }
  else
  {
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a4, v11, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
  }

  if (!v16)
  {
    PRLogModel();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v9;
      v25 = 2112;
      v26 = a4;
      v27 = 2114;
      v28 = v17;
      _os_log_debug_impl(&dword_18B634000, v18, OS_LOG_TYPE_DEBUG, "Unable to unarchive user object @ %@; expected class %@: %{public}@",
        buf,
        0x20u);
    }
    v13 = v17;
LABEL_13:

    v16 = 0;
    v17 = v13;
  }

  objc_autoreleasePoolPop(v10);
  if (a6 && v17)
    *a6 = objc_retainAutorelease(v17);

LABEL_18:
  return v16;
}

+ (BOOL)storeUserObject:(id)a3 path:(id)a4 atURL:(id)a5 clearCache:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v8 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v8)
    +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:](PRPosterPathModelObjectCache, "invalidateModelObjectCacheForPath:", v12);
  PRLogModel();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    _os_log_debug_impl(&dword_18B634000, v14, OS_LOG_TYPE_DEBUG, "Storing %@ for path %@ to URL '%@'", buf, 0x20u);
  }

  if (v11)
  {
    v28 = 0;
    v15 = objc_msgSend(v12, "ensureContentsURLIsReachableAndReturnError:", &v28);
    v16 = v28;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v27 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v27;
      v20 = v19;
      if (v19)
      {
        if (a7)
          *a7 = objc_retainAutorelease(v19);
        PRLogModel();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:].cold.2();
        v22 = 0;
      }
      else
      {
        v26 = 0;
        v22 = objc_msgSend(v18, "writeToURL:options:error:", v13, 268435457, &v26);
        v21 = v26;
        PRLogModel();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if ((v22 & 1) != 0)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v30 = v11;
            v31 = 2112;
            v32 = v12;
            v33 = 2112;
            v34 = v13;
            _os_log_debug_impl(&dword_18B634000, v24, OS_LOG_TYPE_DEBUG, "Successfuly stored %@ for path %@ to URL '%@'", buf, 0x20u);
          }
        }
        else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:].cold.1();
        }

      }
    }
    else
    {
      if (a7)
        *a7 = objc_retainAutorelease(v16);
      PRLogModel();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[PRPosterPathUtilities storeUserObject:path:atURL:clearCache:error:].cold.3();
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)loadConfiguredPropertiesForPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v5 = a3;
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6A8DF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:].cold.1();
    goto LABEL_9;
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "loadComplicationLayoutForPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComplicationLayout:", v7);

  objc_msgSend(a1, "loadFocusConfigurationForPath:error:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFocusConfiguration:", v8);

  objc_msgSend(a1, "loadTitleStyleConfigurationForPath:error:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleStyleConfiguration:", v9);

  objc_msgSend(a1, "loadRenderingConfigurationForPath:error:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRenderingConfiguration:", v10);

  objc_msgSend(a1, "loadHomeScreenConfigurationForPath:error:", v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHomeScreenConfiguration:", v11);

  objc_msgSend(a1, "loadColorVariationsConfigurationForPath:error:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColorVariationsConfiguration:", v12);

  objc_msgSend(a1, "loadQuickActionsConfigurationForPath:error:", v5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQuickActionsConfiguration:", v13);

  objc_msgSend(a1, "loadSuggestionMetadataForPath:error:", v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuggestionMetadata:", v14);

  objc_msgSend(a1, "loadOtherMetadataForPath:error:", v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOtherMetadata:", v15);

  objc_msgSend(a1, "loadAmbientConfigurationForPath:error:", v5, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAmbientConfiguration:", v16);

  objc_msgSend(a1, "loadAmbientWidgetLayoutForPath:error:", v5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAmbientWidgetLayout:", v17);

  return v6;
}

+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  BOOL v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:](PRPosterPathModelObjectCache, "invalidateModelObjectCacheForPath:", v8);
  objc_msgSend(v9, "complicationLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && !objc_msgSend(a1, "storeComplicationLayoutForPath:complicationLayout:error:", v8, v10, a5))
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(v9, "focusConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && !objc_msgSend(a1, "storeFocusConfigurationForPath:focusConfiguration:error:", v8, v11, a5))
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v9, "suggestionMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        && !objc_msgSend(a1, "storeSuggestionMetadataForPath:suggestionMetadata:error:", v8, v12, a5))
      {
        v26 = 0;
      }
      else
      {
        objc_msgSend(v9, "otherMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && !objc_msgSend(a1, "storeOtherMetadataForPath:otherMetadata:error:", v8, v13, a5))
        {
          v26 = 0;
        }
        else
        {
          objc_msgSend(v9, "homeScreenConfiguration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14
            && !objc_msgSend(a1, "storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:", v8, v14, a5))
          {
            v26 = 0;
          }
          else
          {
            objc_msgSend(v9, "titleStyleConfiguration");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15
              && !objc_msgSend(a1, "storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:", v8, v15, a5))
            {
              v26 = 0;
            }
            else
            {
              v31 = v15;
              objc_msgSend(v9, "renderingConfiguration");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16
                && (v17 = v16,
                    v18 = objc_msgSend(a1, "storeRenderingConfiguration:forPath:error:", v16, v8, a5),
                    v16 = v17,
                    !v18))
              {
                v26 = 0;
              }
              else
              {
                v30 = v16;
                objc_msgSend(v9, "colorVariationsConfiguration");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19
                  && !objc_msgSend(a1, "storeColorVariationsConfigurationForPath:colorVariationsConfiguration:error:", v8, v19, a5))
                {
                  v26 = 0;
                }
                else
                {
                  v29 = v19;
                  objc_msgSend(v9, "quickActionsConfiguration");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v20
                    && !objc_msgSend(a1, "storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:", v8, v20, a5))
                  {
                    v26 = 0;
                  }
                  else
                  {
                    objc_msgSend(v9, "ambientConfiguration", v20);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v21
                      && !objc_msgSend(a1, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v8, v21, a5))
                    {
                      v26 = 0;
                    }
                    else
                    {
                      objc_msgSend(v9, "ambientWidgetLayout");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = 1;
                      if (v22)
                      {
                        v23 = a1;
                        v24 = v22;
                        v25 = objc_msgSend(v23, "storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:", v8, v22, a5);
                        v22 = v24;
                        if (!v25)
                          v26 = 0;
                      }

                    }
                    v20 = v28;
                  }

                  v19 = v29;
                }

                v16 = v30;
              }
              v15 = v31;

            }
          }

        }
      }

    }
  }

  return v26;
}

+ (id)titleStyleConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.titleStyleConfiguration.plist"), 0);
}

+ (id)titleStyleConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "titleStyleConfigurationURLForPathInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)loadTitleStyleConfigurationForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "titleStyleConfigurationURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeTitleStyleConfigurationForPath:(id)a3 titleStyleConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetTitleStyleConfiguration");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterTitleStyleConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterTitleStyleConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "titleStyleConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeTitleStyleConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetTitleStyleConfiguration");

  objc_msgSend(a1, "titleStyleConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)renderingConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "renderingConfigurationURLForPathInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)renderingConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.renderingConfiguration.plist"), 0);
}

+ (id)depthEffectConfigurationURLForPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "instanceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.depthEffectConfiguration.plist"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)depthEffectConfigurationURLForPathInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.depthEffectConfiguration.plist"), 0);
}

+ (id)loadRenderingConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a1, "depthEffectConfigurationURLForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v7, v8, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "renderingConfigurationURLForPath:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v10, v11, 1, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v9;
}

+ (BOOL)storeRenderingConfiguration:(id)a3 forPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetRenderingConfiguration");

  v11 = v8;
  if (v11 && (NSClassFromString(CFSTR("PRPosterRenderingConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterRenderingConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeRenderingConfiguration:forPath:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "renderingConfigurationURLForPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v9, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeRenderingConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetRenderingConfiguration");

  objc_msgSend(a1, "depthEffectConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "renderingConfigurationURLForPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtURL:error:", v8, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v11, "removeItemAtURL:error:", v9, a4);

  return (char)a4;
}

+ (id)configurableOptionsURLForPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "contentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.posterkit.provider.contents.configurableOptions.plist"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)configurableOptionsURLForContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.posterkit.provider.contents.configurableOptions.plist"), 0);
}

+ (id)loadConfigurableOptionsForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "configurableOptionsURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeConfigurableOptionsForPath:(id)a3 configurableOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetConfigurableOptions");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterConfigurableOptions")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeConfigurableOptionsForPath:configurableOptions:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "configurableOptionsURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeConfigurableOptionsForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetConfigurableOptions");

  objc_msgSend(a1, "configurableOptionsURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)oldHomeScreenConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifierURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "oldHomeScreenConfigurationURLForIdentifierURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)homeScreenConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "supplementURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "homeScreenConfigurationURLForSupplementURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)oldHomeScreenConfigurationURLForIdentifierURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.identifierURL.homescreenConfiguration.plist"), 0);
}

+ (id)homeScreenConfigurationURLForSupplementURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.supplementURL.homescreenConfiguration.plist"), 0);
}

+ (id)loadHomeScreenConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "homeScreenConfigurationURLForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v7, v8, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(a1, "oldHomeScreenConfigurationURLForPath:", v6);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v11, v12, 0, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }

  return v10;
}

+ (BOOL)storeHomeScreenConfigurationForPath:(id)a3 homeScreenConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetHomeScreenConfiguration");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterHomeScreenConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterHomeScreenConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "homeScreenConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (id)focusConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifierURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "focusConfigurationURLForIdentifierURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)focusConfigurationURLForIdentifierURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.identifierURL.focusConfiguration.plist"), 0);
}

+ (id)loadFocusConfigurationForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "focusConfigurationURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeFocusConfigurationForPath:(id)a3 focusConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetFocusConfiguration");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterFocusConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterFocusConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeFocusConfigurationForPath:focusConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "focusConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeFocusConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetFocusConfiguration");

  objc_msgSend(a1, "focusConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)complicationsLayoutURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "complicationsLayoutURLForInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)complicationsLayoutURLForInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.complicationLayout.plist"), 0);
}

+ (id)loadComplicationLayoutForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "complicationsLayoutURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeComplicationLayoutForPath:(id)a3 complicationLayout:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetComplicationLayout");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterComplicationLayout")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterComplicationLayoutClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeComplicationLayoutForPath:complicationLayout:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "complicationsLayoutURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeComplicationLayoutForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetComplicationLayout");

  objc_msgSend(a1, "complicationsLayoutURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)colorVariationsConfigurationURLForInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.colorVariations.plist"), 0);
}

+ (id)colorVariationsConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorVariationsConfigurationURLForInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)loadColorVariationsConfigurationForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "colorVariationsConfigurationURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeColorVariationsConfigurationForPath:(id)a3 colorVariationsConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetColorVariationsConfiguration");

  v11 = v9;
  if (v11
    && (NSClassFromString(CFSTR("PRPosterColorVariationsConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterColorVariationsConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeColorVariationsConfigurationForPath:colorVariationsConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "colorVariationsConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeColorVariationsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetColorVariationsConfiguration");

  objc_msgSend(a1, "colorVariationsConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)quickActionsConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quickActionsConfigurationURLForInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)quickActionsConfigurationURLForInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.quickActions.plist"), 0);
}

+ (id)loadQuickActionsConfigurationForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "quickActionsConfigurationURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeQuickActionsConfigurationForPath:(id)a3 quickActionsConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetQuickActionsConfiguration");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterQuickActionsConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterQuickActionsConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "quickActionsConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeQuickActionsConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetQuickActionsConfiguration");

  objc_msgSend(a1, "quickActionsConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)ambientConfigurationURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ambientConfigurationURLForContentsURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ambientConfigurationURLForContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.posterkit.provider.contents.ambient.plist"), 0);
}

+ (id)loadAmbientConfigurationForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "ambientConfigurationURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeAmbientConfigurationForPath:(id)a3 ambientConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetAmbientConfiguration");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterAmbientConfiguration")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterAmbientConfigurationClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeAmbientConfigurationForPath:ambientConfiguration:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "ambientConfigurationURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeAmbientConfigurationForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetAmbientConfiguration");

  objc_msgSend(a1, "ambientConfigurationURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)suggestionMetadataURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifierURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionMetadataURLForIdentifierURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)suggestionMetadataURLForIdentifierURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.identifierURL.suggestionMetadata.plist"), 0);
}

+ (id)loadSuggestionMetadataForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "suggestionMetadataURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeSuggestionMetadataForPath:(id)a3 suggestionMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetSuggestionMetadata");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterSuggestionMetadata")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterSuggestionMetadataClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeSuggestionMetadataForPath:suggestionMetadata:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "suggestionMetadataURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeSuggestionMetadataForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetSuggestionMetadata");

  objc_msgSend(a1, "suggestionMetadataURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)loadPosterDescriptorIdentifierForPathAtURL:(id)a3 type:(int64_t)a4 posterUUID:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.identifierURL.suggestionMetadata.plist"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v7, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "suggestedGalleryItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptorIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)otherMetadataURLForContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.otherMetadata.plist"), 0);
}

+ (id)otherMetadataURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "otherMetadataURLForContentsURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)loadOtherMetadataForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "otherMetadataURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeOtherMetadataForPath:(id)a3 otherMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetOtherMetadata");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterMetadata")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterMetadataClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeOtherMetadataForPath:otherMetadata:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "otherMetadataURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeOtherMetadataForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetOtherMetadata");

  objc_msgSend(a1, "otherMetadataURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)descriptorGalleryOptionsURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorGalleryOptionsURLForContentsURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)descriptorGalleryOptionsURLForContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.posterkit.provider.containerURL.posterDescriptorGalleryOptions.plist"), 0);
}

+ (id)loadPosterDescriptorGalleryOptionsForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "descriptorGalleryOptionsURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storePosterDescriptorGalleryOptions:(id)a3 posterDescriptorGalleryOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetGalleryOptions");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterDescriptorGalleryOptions")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterDescriptorGalleryOptionsClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "descriptorGalleryOptionsURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removePosterDescriptorGalleryOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetGalleryOptions");

  objc_msgSend(a1, "descriptorGalleryOptionsURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)ambientWidgetLayoutURLForInstanceURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.instance.ambientWidgetLayout.plist"), 0);
}

+ (id)ambientWidgetLayoutURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ambientWidgetLayoutURLForInstanceURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)loadAmbientWidgetLayoutForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "ambientWidgetLayoutURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeAmbientWidgetLayoutToPath:(id)a3 posterAmbientWidgetLayout:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  BOOL result;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetAmbientWidgetLayout");

  v11 = v9;
  if (v11 && (NSClassFromString(CFSTR("PRPosterAmbientWidgetLayout")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterAmbientWidgetLayoutClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    objc_msgSend(a1, "ambientWidgetLayoutURLForPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

    return v13;
  }
  return result;
}

+ (BOOL)removeAmbientWidgetLayout:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetAmbientWidgetLayout");

  objc_msgSend(a1, "ambientWidgetLayoutURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)userInfoURLForPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "contentsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.userInfo"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)userInfoURLForPosterContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.userInfo"), 0);
}

+ (id)loadUserInfoForPath:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "userInfoURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserInfoForURL:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadUserInfoForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  id v16;

  v5 = a3;
  v6 = (void *)MEMORY[0x18D77C448]();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  v9 = v8;
  if (v7)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      PRLogModel();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[PRPosterPathUtilities loadUserInfoForURL:error:].cold.1();

      v13 = v11;
    }

  }
  else
  {
    v11 = v8;
    v10 = 0;
  }

  objc_autoreleasePoolPop(v6);
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return v10;
}

+ (BOOL)storeUserInfoToPath:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetUserInfo");

  v11 = v9;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6ABB70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6ABBD4);
  }

  objc_msgSend(a1, "userInfoURLForPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x18D77C448]();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;
  if (v15)
  {
    PRLogModel();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:].cold.3();

    v17 = v15;
  }
  if (v14)
  {
    v29 = a5;
    v30 = 0;
    v18 = objc_msgSend(v14, "writeToURL:options:error:", v12, 268435457, &v30);
    v19 = v30;
    PRLogModel();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[PRPosterPathUtilities storeUserInfoToPath:userInfo:error:].cold.2();

      v22 = v19;
      v21 = v15;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByDeletingLastPathComponent");
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v28;
        v34 = 2112;
        v35 = v23;
        v24 = (void *)v23;
        _os_log_impl(&dword_18B634000, v21, OS_LOG_TYPE_DEFAULT, "saved '%@'': (path=%@)", buf, 0x16u);

      }
      v22 = v15;
    }

    a5 = v29;
  }
  else
  {
    v18 = 0;
    v22 = v15;
  }

  objc_autoreleasePoolPop(v13);
  if (a5 && v22)
    *a5 = objc_retainAutorelease(v22);

  return v18;
}

+ (BOOL)removeUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetUserInfo");

  objc_msgSend(a1, "userInfoURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (id)proactiveGalleryOptionsURLForPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "contentsURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "proactiveGalleryOptionsURLForContentsURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)proactiveGalleryOptionsURLForContentsURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.galleryOptions"), 0);
}

+ (id)loadProactiveGalleryOptions:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "proactiveGalleryOptionsURLForPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadUserObjectForURL:expectedClass:strict:error:", v6, v7, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)storeProactiveGalleryOptionsToPath:(id)a3 proactiveGalleryOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v15;

  v8 = a3;
  v9 = a4;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetProactiveGalleryOptions");

  v11 = v9;
  NSClassFromString(CFSTR("ATXPosterDescriptorGalleryOptions"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6ABE88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:ATXPosterDescriptorGalleryOptionsClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRPosterPathUtilities storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(a1, "proactiveGalleryOptionsURLForPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "storeUserObject:path:atURL:clearCache:error:", v11, v8, v12, 0, a5);

  return v13;
}

+ (BOOL)removeProactiveGalleryOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetProactiveGalleryOptions");

  objc_msgSend(a1, "proactiveGalleryOptionsURLForPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "removeItemAtURL:error:", v8, a4);

  return (char)a4;
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18B634000, v0, v1, "Failed to write %@: %{public}@");
  OUTLINED_FUNCTION_17();
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18B634000, v0, v1, "Failed to archive %@: %{public}@");
  OUTLINED_FUNCTION_17();
}

+ (void)storeUserObject:path:atURL:clearCache:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18B634000, v0, v1, "Failed to store %@: %{public}@");
  OUTLINED_FUNCTION_17();
}

+ (void)loadConfiguredPropertiesForPath:error:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)storeTitleStyleConfigurationForPath:titleStyleConfiguration:error:.cold.1()
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

+ (void)storeRenderingConfiguration:forPath:error:.cold.1()
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

+ (void)storeConfigurableOptionsForPath:configurableOptions:error:.cold.1()
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

+ (void)storeHomeScreenConfigurationForPath:homeScreenConfiguration:error:.cold.1()
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

+ (void)storeFocusConfigurationForPath:focusConfiguration:error:.cold.1()
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

+ (void)storeComplicationLayoutForPath:complicationLayout:error:.cold.1()
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

+ (void)storeColorVariationsConfigurationForPath:colorVariationsConfiguration:error:.cold.1()
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

+ (void)storeQuickActionsConfigurationForPath:quickActionsConfiguration:error:.cold.1()
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

+ (void)storeAmbientConfigurationForPath:ambientConfiguration:error:.cold.1()
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

+ (void)storeSuggestionMetadataForPath:suggestionMetadata:error:.cold.1()
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

+ (void)storeOtherMetadataForPath:otherMetadata:error:.cold.1()
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

+ (void)storePosterDescriptorGalleryOptions:posterDescriptorGalleryOptions:error:.cold.1()
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

+ (void)storeAmbientWidgetLayoutToPath:posterAmbientWidgetLayout:error:.cold.1()
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

+ (void)loadUserInfoForURL:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_18B634000, v4, v5, "Error during dict-plist deserializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_15();
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_18B634000, v4, v5, "Error during dict-plist writing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_15();
}

+ (void)storeUserInfoToPath:userInfo:error:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_18();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_18B634000, v4, v5, "Error during dict-plist serializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_15();
}

+ (void)storeProactiveGalleryOptionsToPath:proactiveGalleryOptions:error:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
