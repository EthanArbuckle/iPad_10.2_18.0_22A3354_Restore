@implementation _UILabelVisualStyle

+ (id)inferredVisualStyle
{
  if (_MergedGlobals_1322 != -1)
    dispatch_once(&_MergedGlobals_1322, &__block_literal_global_651);
  return (id)qword_1ECD824C0;
}

- (id)defaultFont
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 47, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (void)actionsForInitializationOfLabel:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 53, CFSTR("%@ should provide an implementation for %@"), v6, v7);

}

- (void)actionsForDeallocationOfLabel:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 58, CFSTR("%@ should provide an implementation for %@"), v6, v7);

}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 63, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (BOOL)shouldDelayStartMarquee
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 69, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UILabelVisualStyle.m"), 75, CFSTR("%@ should provide an implementation for %@"), v8, v9);

  return 0;
}

@end
