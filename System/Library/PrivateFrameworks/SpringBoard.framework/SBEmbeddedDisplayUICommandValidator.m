@implementation SBEmbeddedDisplayUICommandValidator

- (SBEmbeddedDisplayUICommandValidator)initWithLayoutStateProvider:(id)a3
{
  id v6;
  SBEmbeddedDisplayUICommandValidator *v7;
  SBEmbeddedDisplayUICommandValidator *v8;
  SBEmbeddedDisplayUICommandValidator *result;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBEmbeddedDisplayUICommandValidator;
  v7 = -[SBEmbeddedDisplayUICommandValidator init](&v11, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_4;
  if (v6)
  {
    objc_storeStrong((id *)&v7->_layoutStateProvider, a3);
LABEL_4:

    return v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("layoutStateProvider != ((void *)0)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBEmbeddedDisplayUICommandValidator initWithLayoutStateProvider:].cold.1(a2, (uint64_t)v8, (uint64_t)v10);
  objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  result = (SBEmbeddedDisplayUICommandValidator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)validateCommand:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "action") == sel__handleToggleFloatingAppVisibilityKeyShortcut_)
  {
    -[SBSceneLayoutStateProvider layoutState](self->_layoutStateProvider, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementWithRole:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SHOW_SLIDE_OVER_DISCOVERABILITY");
    if (v7 && !SBFloatingConfigurationIsStashed(objc_msgSend(v6, "floatingConfiguration")))
      v8 = CFSTR("HIDE_SLIDE_OVER_DISCOVERABILITY");

    v9 = (void *)MEMORY[0x1E0CB34D0];
    v10 = v8;
    objc_msgSend(v9, "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setDiscoverabilityTitle:", v12);
    goto LABEL_9;
  }
  if ((char *)objc_msgSend(v4, "action") == sel__handleMoveToOtherDisplayKeyShortcut_)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_OTHER_DISPLAY_DISCOVERABILITY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDiscoverabilityTitle:", v11);
LABEL_9:

    v5 = 1;
    goto LABEL_10;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  return self->_layoutStateProvider;
}

- (void)setLayoutStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_layoutStateProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutStateProvider, 0);
}

- (void)initWithLayoutStateProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBUICommandValidating.m");
  v16 = 1024;
  v17 = 25;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
