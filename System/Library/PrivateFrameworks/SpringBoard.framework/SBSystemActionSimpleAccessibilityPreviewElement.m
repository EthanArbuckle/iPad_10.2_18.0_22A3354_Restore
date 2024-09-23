@implementation SBSystemActionSimpleAccessibilityPreviewElement

- (SBSystemActionSimpleAccessibilityPreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  SBSystemActionSimpleAccessibilityPreviewElement *v16;
  SBSystemActionSimpleAccessibilityPreviewElement *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  WFApertureIconView *v23;
  WFApertureIconView *trailingView;
  char *v25;
  WFApertureIconView *v26;
  void *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  SBSystemActionSimpleAccessibilityPreviewElement *result;
  void *v30;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "configuredAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sb_configuredIntentAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sectionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Accessibility"));

  if ((v15 & 1) != 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElement;
    v16 = -[SBSystemActionSimplePreviewElement initWithSystemAction:contentProvider:keyColor:](&v31, sel_initWithSystemAction_contentProvider_keyColor_, v9, v10, v11);
    v17 = v16;
    if (v16)
    {
      v16->_accessibilityTripleClickState = -1;
      objc_msgSend(v10, "trailingContentViewProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "providedView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_class();
      v21 = v19;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      trailingView = v17->_trailingView;
      v17->_trailingView = v23;

      v25 = (char *)-[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v13);
      if ((unint64_t)(v25 - 1) <= 1)
      {
        v26 = v17->_trailingView;
        objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFApertureIconView setSymbolColorOverride:](v26, "setSymbolColorOverride:", v27);

      }
      if ((char *)v17->_accessibilityTripleClickState != v25)
      {
        v17->_accessibilityTripleClickState = (int64_t)v25;
        -[WFApertureIconView setEnabled:animated:](v17->_trailingView, "setEnabled:animated:", v25 != (char *)2, 0);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v17, (CFNotificationCallback)_SBSystemActionSimpleAccessibilityPreviewElementTripleClickOptionDidChange, (CFStringRef)objc_msgSend(MEMORY[0x1E0CF4EC0], "tripleClickOptionDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

    return v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[configuredIntentAction sectionIdentifier] isEqualToString:WFStaccatoActionSectionIdentifierAccessibility]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSimpleAccessibilityPreviewElement initWithSystemAction:contentProvider:keyColor:].cold.1(a2, (uint64_t)self, (uint64_t)v30);
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    result = (SBSystemActionSimpleAccessibilityPreviewElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)_updateWithAccessibilityTripleClickStateIfNeeded:(uint64_t)a3 animated:
{
  if (result)
  {
    if (*(_QWORD *)(result + 184) != a2)
    {
      *(_QWORD *)(result + 184) = a2;
      return objc_msgSend(*(id *)(result + 192), "setEnabled:animated:", a2 != 2, a3);
    }
  }
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(MEMORY[0x1E0CF4EC0], "tripleClickOptionDidChangeNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElement;
  -[SBSystemActionSimpleAccessibilityPreviewElement dealloc](&v4, sel_dealloc);
}

- (void)_handleTripleClickOptionDidChangeNotification
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    -[SBSystemActionSimplePreviewElement systemAction](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "configuredAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sb_configuredIntentAction");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = -[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v5);
    if (*(void **)(a1 + 184) != v4)
    {
      *(_QWORD *)(a1 + 184) = v4;
      objc_msgSend(*(id *)(a1 + 192), "setEnabled:animated:", v4 != (void *)2, 1);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
}

- (void)initWithSystemAction:(const char *)a1 contentProvider:(uint64_t)a2 keyColor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("SBSystemActionSimpleAccessibilityPreviewElement.m");
  v16 = 1024;
  v17 = 32;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
