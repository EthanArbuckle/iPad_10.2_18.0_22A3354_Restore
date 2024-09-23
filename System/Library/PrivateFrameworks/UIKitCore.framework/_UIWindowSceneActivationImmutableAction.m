@implementation _UIWindowSceneActivationImmutableAction

- (void)setTitle:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 249, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)setImage:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 253, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)setDiscoverabilityTitle:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 257, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)setAttributes:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 261, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)setState:(int64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 265, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 269, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)_setAlternateAction:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 273, CFSTR("Action is immutable because it is a child of a menu"));

}

- (void)_setConfigurationProvider:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 277, CFSTR("Action is immutable because it is a child of a menu"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIWindowSceneActivationAction *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIMenuElementAttributes v9;
  void *v10;
  void *v11;
  UIWindowSceneActivationAction *v12;

  v4 = [UIWindowSceneActivationAction alloc];
  -[UIMenuElement title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMenuElement image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAction identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAction discoverabilityTitle](self, "discoverabilityTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIAction attributes](self, "attributes");
  -[UIWindowSceneActivationAction _alternateAction](self, "_alternateAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationAction _configurationProvider](self, "_configurationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIWindowSceneActivationAction initWithTitle:image:identifier:discoverabilityTitle:attributes:alternateAction:configurationProvider:](v4, "initWithTitle:image:identifier:discoverabilityTitle:attributes:alternateAction:configurationProvider:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

@end
