@implementation UIWindowSceneActivationConfiguration

- (UIWindowSceneActivationConfiguration)initWithUserActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v5;
  UIWindowSceneActivationConfiguration *v6;
  UIWindowSceneActivationConfiguration *v7;
  objc_super v9;

  v5 = userActivity;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowSceneActivationConfiguration;
  v6 = -[UIWindowSceneActivationConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userActivity, userActivity);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[UIWindowSceneActivationConfiguration userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUserActivity:", v5);

  -[UIWindowSceneActivationConfiguration options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setOptions:", v8);

  -[UIWindowSceneActivationConfiguration preview](self, "preview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v6, "setPreview:", v10);

  -[UIWindowSceneActivationConfiguration _sceneActivator](self, "_sceneActivator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSceneActivator:", v11);

  objc_msgSend(v6, "_setAnimationSource:", -[UIWindowSceneActivationConfiguration _animationSource](self, "_animationSource"));
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
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
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[UIWindowSceneActivationConfiguration userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("activityType = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[UIWindowSceneActivationConfiguration preview](self, "preview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[UIWindowSceneActivationConfiguration preview](self, "preview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("preview = %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[UIWindowSceneActivationConfiguration options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[UIWindowSceneActivationConfiguration options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("options = %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v18, self, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (UIWindowSceneActivationRequestOptions)options
{
  return self->_options;
}

- (void)setOptions:(UIWindowSceneActivationRequestOptions *)options
{
  objc_storeStrong((id *)&self->_options, options);
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(UITargetedPreview *)preview
{
  objc_storeStrong((id *)&self->_preview, preview);
}

- (unint64_t)_animationSource
{
  return self->__animationSource;
}

- (void)_setAnimationSource:(unint64_t)a3
{
  self->__animationSource = a3;
}

- (_UIWindowSceneActivator)_sceneActivator
{
  return (_UIWindowSceneActivator *)objc_loadWeakRetained((id *)&self->__sceneActivator);
}

- (void)_setSceneActivator:(id)a3
{
  objc_storeWeak((id *)&self->__sceneActivator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__sceneActivator);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
