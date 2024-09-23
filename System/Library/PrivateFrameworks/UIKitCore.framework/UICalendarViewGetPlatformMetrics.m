@implementation UICalendarViewGetPlatformMetrics

void ___UICalendarViewGetPlatformMetrics_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  objc_msgSend(v3, "registerVisualStyleClass:forStylableClass:", v2, objc_opt_class());

}

@end
