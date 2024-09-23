@implementation _UITextViewVisualStyle

+ (id)inferredVisualStyle
{
  return objc_alloc_init(_UITextViewVisualStyle_iOS);
}

- (id)backgroundColor
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
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextViewVisualStyle.m"), 41, CFSTR("%@ should provide an implementation for %@"), v6, v7);

  return 0;
}

@end
