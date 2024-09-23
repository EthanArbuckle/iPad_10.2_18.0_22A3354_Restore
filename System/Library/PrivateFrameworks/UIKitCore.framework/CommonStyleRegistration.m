@implementation CommonStyleRegistration

void __CommonStyleRegistration_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_opt_class();
  objc_msgSend(v0, "registerVisualStyleClass:forStylableClass:", v1, objc_opt_class());

  +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "registerVisualStyleClass:forStylableClass:", v3, objc_opt_class());

  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  objc_msgSend(v4, "registerVisualStyleClass:forStylableClass:", v5, objc_opt_class());

  v6 = objc_opt_class();
  +[_UIVisualStyleRegistry defaultRegistry](_UIVisualStyleRegistry, "defaultRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerVisualStyleClass:forStylableClass:", v6, objc_opt_class());

}

@end
