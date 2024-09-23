@implementation NCMaterialDisplayingCaptureOnlyViewController

- (NCMaterialDisplayingCaptureOnlyViewController)init
{
  NCMaterialDisplayingCaptureOnlyViewController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *supplementaryMaterialsAndUsageCounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCMaterialDisplayingCaptureOnlyViewController;
  v2 = -[NCMaterialDisplayingCaptureOnlyViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    supplementaryMaterialsAndUsageCounts = v2->_supplementaryMaterialsAndUsageCounts;
    v2->_supplementaryMaterialsAndUsageCounts = v3;

  }
  return v2;
}

- (void)loadView
{
  NCMaterialDisplayingCaptureOnlyViewControllerView *v3;

  v3 = objc_alloc_init(NCMaterialDisplayingCaptureOnlyViewControllerView);
  -[NCMaterialDisplayingCaptureOnlyViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)registerMaterialDisplaying:(id)a3 persistent:(BOOL)a4
{
  -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:](self, "_registerMaterialDisplaying:forDisplaying:persistent:", 1, a3, a4);
}

- (void)unregisterMaterialDisplaying:(id)a3
{
  -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:](self, "_registerMaterialDisplaying:forDisplaying:persistent:", 0, a3, 0);
}

- (void)_registerMaterialDisplaying:(BOOL)a3 forDisplaying:(id)a4 persistent:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  BOOL v20;
  int v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *supplementaryMaterialsAndUsageCounts;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  _QWORD v44[3];

  v5 = a5;
  v6 = a3;
  v44[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "materialRecipe");
  MTStringFromMaterialRecipe();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "materialGroupNameBase");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("<NULL>");
  if (v11)
    v13 = (const __CFString *)v11;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Recipe:%@-GroupNameBase:%@"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NCMaterialDisplayingCaptureOnlyViewController _supportsCaptureForMaterialDisplaying:](self, "_supportsCaptureForMaterialDisplaying:", v8))
  {
    -[NSMutableDictionary objectForKey:](self->_supplementaryMaterialsAndUsageCounts, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v15, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

    }
    else
    {
      v18 = 0;
    }
    if (v16)
      v20 = v18 == 0;
    else
      v20 = 0;
    v21 = v20 || v5;
    if (v6)
    {
      if (v21)
        v22 = 0;
      else
        v22 = v18 + 1;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:", objc_msgSend(v8, "materialRecipe"), 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "materialGroupNameBase");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setGroupNameBase:", v23);

        -[NCMaterialDisplayingCaptureOnlyViewController view](self, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        objc_msgSend(v16, "setFrame:");

        objc_msgSend(v16, "setAutoresizingMask:", 18);
        -[NCMaterialDisplayingCaptureOnlyViewController view](self, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSubview:", v16);

      }
      supplementaryMaterialsAndUsageCounts = self->_supplementaryMaterialsAndUsageCounts;
      v44[0] = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](supplementaryMaterialsAndUsageCounts, "setObject:forKey:", v28, v14);

      v29 = *MEMORY[0x1E0DC5F70];
      if (v21)
      {
        v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Changing previous material of '%lu'reference count to permanent material."), v18);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = &stru_1E8D21F60;
          }
          *(_DWORD *)buf = 138543618;
          v39 = v14;
          v40 = 2114;
          v41 = (unint64_t)v36;
          _os_log_debug_impl(&dword_1CFC3D000, v30, OS_LOG_TYPE_DEBUG, "Capture-Only Material - Register '%{public}@': Permanently persisting Material.'%{public}@'", buf, 0x16u);
          if (v18)

        }
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v39 = v14;
        v40 = 2050;
        v41 = v18;
        v42 = 2050;
        v43 = v18 + 1;
        v32 = "Capture-Only Material - Register '%{public}@': Changing reference count from '%{public}lu' to '%{public}lu'.";
LABEL_38:
        _os_log_debug_impl(&dword_1CFC3D000, v29, OS_LOG_TYPE_DEBUG, v32, buf, 0x20u);
      }
    }
    else
    {
      if (v21)
      {
        v31 = *MEMORY[0x1E0DC5F70];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
          -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:].cold.1((uint64_t)v14, v31);
        goto LABEL_33;
      }
      if (v18 < 2)
      {
        objc_msgSend(v16, "removeFromSuperview");
        -[NSMutableDictionary removeObjectForKey:](self->_supplementaryMaterialsAndUsageCounts, "removeObjectForKey:", v14);
      }
      else
      {
        v33 = self->_supplementaryMaterialsAndUsageCounts;
        v37[0] = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 - 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v35, v14);

      }
      v29 = *MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v39 = v14;
        v40 = 2050;
        v41 = v18;
        v42 = 2050;
        v43 = v18 - 1;
        v32 = "Capture-Only Material - Unregister '%{public}@': Changing reference count from '%{public}lu' to '%{public}lu'.";
        goto LABEL_38;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  v19 = *MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_ERROR))
    -[NCMaterialDisplayingCaptureOnlyViewController _registerMaterialDisplaying:forDisplaying:persistent:].cold.2(v6, (uint64_t)v14, v19);
LABEL_34:

}

- (BOOL)_supportsCaptureForMaterialDisplaying:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "materialGroupNameBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = objc_msgSend(v3, "materialRecipe") != 0;
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryMaterialsAndUsageCounts, 0);
}

- (void)_registerMaterialDisplaying:(uint64_t)a1 forDisplaying:(NSObject *)a2 persistent:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_DEBUG, "Capture-Only Material - Unregister '%{public}@': Not change being made because this is a permanent material.", (uint8_t *)&v2, 0xCu);
}

- (void)_registerMaterialDisplaying:(char)a1 forDisplaying:(uint64_t)a2 persistent:(os_log_t)log .cold.2(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("Register");
  if ((a1 & 1) == 0)
    v3 = CFSTR("Unregister");
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "Capture-Only Material - %{public}@ '%{public}@': Material configuration unsupported", (uint8_t *)&v4, 0x16u);
}

@end
