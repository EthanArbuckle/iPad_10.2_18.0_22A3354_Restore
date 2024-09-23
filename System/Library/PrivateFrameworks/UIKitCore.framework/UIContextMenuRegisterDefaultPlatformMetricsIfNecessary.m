@implementation UIContextMenuRegisterDefaultPlatformMetricsIfNecessary

void ___UIContextMenuRegisterDefaultPlatformMetricsIfNecessary_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "registerVisualStyleClass:forStylableClass:", v3, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "registerVisualStyleClass:forStylableClass:", v5, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v6, "registerVisualStyleClass:forStylableClass:", v7, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v9, "registerVisualStyleClass:forStylableClass:", v8, objc_opt_class());

}

@end
