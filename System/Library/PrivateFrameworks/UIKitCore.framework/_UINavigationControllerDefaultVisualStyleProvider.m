@implementation _UINavigationControllerDefaultVisualStyleProvider

- (id)styleForNavigationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v4 = a3;
  if (self)
  {
    if (_MergedGlobals_938 != -1)
      dispatch_once(&_MergedGlobals_938, &__block_literal_global_22);
    self = (_UINavigationControllerDefaultVisualStyleProvider *)(id)qword_1ECD7CAD0;
  }
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)-[_UINavigationControllerDefaultVisualStyleProvider objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v7);

  if (!v8)
    v8 = (objc_class *)objc_opt_class();
  v9 = (void *)objc_msgSend([v8 alloc], "initWithNavigationController:", v4);

  return v9;
}

@end
