@implementation UIMutableScenePresentationContext

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIScenePresentationContext _initWithPresentationContext:]([UIScenePresentationContext alloc], "_initWithPresentationContext:", self);
}

- (void)setRenderingMode:(unint64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 7);

}

- (void)_setVisibilityPropagationEnabled:(BOOL)a3
{
  -[BSMutableSettings setFlag:forSetting:](self->super._settings, "setFlag:forSetting:", BSSettingFlagForBool(), 12);
}

- (void)setPresentedLayerTypes:(unint64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 3);

}

- (void)setResizesHostedContext:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 15);

}

- (void)_setLayerTargetsToExclude:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 11);

  }
}

- (void)_setDefaultPresentationContext:(id)a3
{
  UIScenePresentationContext *v5;
  UIScenePresentationContext **p_defaultPresentationContext;
  UIScenePresentationContext *defaultPresentationContext;
  UIScenePresentationContext *v8;

  v5 = (UIScenePresentationContext *)a3;
  defaultPresentationContext = self->super._defaultPresentationContext;
  p_defaultPresentationContext = &self->super._defaultPresentationContext;
  if (defaultPresentationContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_defaultPresentationContext, a3);
    v5 = v8;
  }

}

- (void)setClippingDisabled:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 1);

}

- (void)setAppearanceStyle:(unint64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 2);

}

- (void)setBackgroundColorWhileHosting:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 4);

  }
}

- (void)setBackgroundColorWhileNotHosting:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 5);

  }
}

- (void)setHostTransformer:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 6);

  }
}

- (void)setAsynchronousRenderingOptions:(id)a3
{
  BSMutableSettings *settings;
  uint64_t v4;
  void *v5;
  id v6;

  settings = self->super._settings;
  v4 = objc_msgSend(a3, "copy");
  v6 = (id)v4;
  if (v4)
  {
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v5, 13);

  }
}

- (void)setInheritsSecurity:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 14);

}

- (void)setShouldPassthroughHitTestEventsIfTransparent:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 16);

}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 17);

}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 18);

}

- (void)modifyLayerPresentationOverrideContextForLayerTarget:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  UIMutableSceneLayerPresentationContext *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  UIMutableSceneLayerPresentationContext *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationContext.m"), 539, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layerTarget"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationContext.m"), 540, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modifyBlock"));

LABEL_3:
  -[UIMutableScenePresentationContext _existingLayerPresentationContextCreatingIfNecessary:](self, "_existingLayerPresentationContextCreatingIfNecessary:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIMutableSceneLayerPresentationContext *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
    v12 = objc_alloc_init(UIMutableSceneLayerPresentationContext);
  ((void (**)(_QWORD, UIMutableSceneLayerPresentationContext *))v9)[2](v9, v12);
  UIScenePresentationLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    UIScenePresentationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "objectForKey:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithBool:", BSEqualObjects());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v12;
      _os_log_debug_impl(&dword_185066000, v15, OS_LOG_TYPE_DEBUG, "modify default LAYER presentation context (equal? %@), prevContext: %@, newContext: %@", buf, 0x20u);

    }
  }
  v16 = (void *)-[UIMutableSceneLayerPresentationContext copy](v12, "copy");
  if (objc_msgSend(v16, "_isEqualToDefaultContext"))
    objc_msgSend(v10, "removeObjectForKey:", v7);
  else
    objc_msgSend(v10, "setObject:forKey:", v16, v7);

}

- (void)removeLayerPresentationOverrideForLayerTarget:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIMutableScenePresentationContext _existingLayerPresentationContextCreatingIfNecessary:](self, "_existingLayerPresentationContextCreatingIfNecessary:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)removeAllLayerPresentationOverrides
{
  id v2;

  -[UIMutableScenePresentationContext _existingLayerPresentationContextCreatingIfNecessary:](self, "_existingLayerPresentationContextCreatingIfNecessary:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)resetToDefaults
{
  -[BSMutableSettings removeAllSettings](self->super._settings, "removeAllSettings");
}

- (void)_setMinificationFilterName:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 8);

  }
}

- (UIScenePresentationContext)_defaultPresentationContext
{
  return self->super._defaultPresentationContext;
}

- (void)_setExclusiveLayerTargetsToInclude:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  if (a3)
  {
    -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 10);

  }
}

- (id)_existingLayerPresentationContextCreatingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  BSMutableSettings *settings;
  void *v11;

  v3 = a3;
  -[BSMutableSettings objectForSetting:](self->super._settings, "objectForSetting:", 9);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = 1;
  else
    v7 = !v3;
  v8 = v5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    settings = self->super._settings;
    if (v9)
    {
      v8 = (void *)v9;
      -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v9, 9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v11, 9);

      v8 = 0;
    }
  }

  return v8;
}

@end
