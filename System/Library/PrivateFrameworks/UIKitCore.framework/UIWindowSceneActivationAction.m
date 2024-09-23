@implementation UIWindowSceneActivationAction

+ (UIWindowSceneActivationAction)actionWithIdentifier:(UIActionIdentifier)identifier alternateAction:(UIAction *)alternateAction configurationProvider:(UIWindowSceneActivationActionConfigurationProvider)configurationProvider
{
  UIWindowSceneActivationActionConfigurationProvider v8;
  UIAction *v9;
  NSString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = configurationProvider;
  v9 = alternateAction;
  v10 = identifier;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_defaultTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithTitle:image:identifier:discoverabilityTitle:attributes:alternateAction:configurationProvider:", v12, v13, v10, 0, 0, v9, v8);

  return (UIWindowSceneActivationAction *)v14;
}

- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 alternateAction:(id)a8 configurationProvider:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  UIWindowSceneActivationAction *v27;
  uint64_t v28;
  UIAction *alternateAction;
  uint64_t v30;
  id configurationProvider;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = objc_msgSend((id)UIApp, "supportsMultipleScenes");
  if (!v19 || (v21 & 1) != 0)
  {
    v25 = 0;
    if (!v21)
      a7 |= 4uLL;
    v26 = &__block_literal_global_238;
  }
  else
  {
    objc_msgSend(v19, "title");
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "image");
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "discoverabilityTitle");
    v24 = objc_claimAutoreleasedReturnValue();

    a7 = objc_msgSend(v19, "attributes");
    v25 = objc_msgSend(v19, "state");
    v16 = (id)v23;
    v18 = (id)v24;
    v15 = (id)v22;
    v26 = &__block_literal_global_4_7;
  }
  v33.receiver = self;
  v33.super_class = (Class)UIWindowSceneActivationAction;
  v27 = -[UIAction initWithTitle:image:identifier:discoverabilityTitle:attributes:state:handler:](&v33, sel_initWithTitle_image_identifier_discoverabilityTitle_attributes_state_handler_, v15, v16, v17, v18, a7, v25, v26);
  if (v27)
  {
    v28 = objc_msgSend(v19, "copy");
    alternateAction = v27->__alternateAction;
    v27->__alternateAction = (UIAction *)v28;

    v30 = objc_msgSend(v20, "copy");
    configurationProvider = v27->__configurationProvider;
    v27->__configurationProvider = (id)v30;

  }
  return v27;
}

uint64_t __134__UIWindowSceneActivationAction_initWithTitle_image_identifier_discoverabilityTitle_attributes_alternateAction_configurationProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_requestSceneActivation");
}

void __134__UIWindowSceneActivationAction_initWithTitle_image_identifier_discoverabilityTitle_attributes_alternateAction_configurationProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "_alternateAction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "performWithSender:target:", v3, 0);
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  void *v5;
  objc_super v6;

  v4 = title;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneActivationAction;
  -[UIAction setTitle:](&v6, sel_setTitle_, v5);
  if (!v4)

}

- (void)_requestSceneActivation
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  -[UIAction sender](self, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationAction _configurationProvider](self, "_configurationProvider");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, UIWindowSceneActivationAction *))v4)[2](v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = 0;
    goto LABEL_13;
  }
  v6 = (void *)objc_msgSend(v5, "copy");

  -[UIWindowSceneActivationAction _preferredActivator](self, "_preferredActivator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_7;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "_viewForPresenting");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v15 = 0;
      goto LABEL_11;
    }
LABEL_7:
    objc_msgSend(v9, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  v15 = 0;
LABEL_12:

  _UIWindowSceneActivationPrepareConfiguration(v6, 0, v7, v15, &__block_literal_global_8_3);
LABEL_13:
  -[UIWindowSceneActivationAction set_preferredActivator:](self, "set_preferredActivator:", 0);
  -[UIWindowSceneActivationAction _alternateAction](self, "_alternateAction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userActivity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke_2;
    v18[3] = &unk_1E16C7DA0;
    v19 = v16;
    v20 = v3;
    _UIWindowSceneActivateConfiguration(v6, v20, v18);

  }
  else if (v16)
  {
    objc_msgSend(v16, "performWithSender:target:", v3, 0);
  }

}

UIWindowSceneProminentPlacement *__56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke()
{
  return +[UIWindowSceneProminentPlacement prominentPlacement](UIWindowSceneProminentPlacement, "prominentPlacement");
}

void *__56__UIWindowSceneActivationAction__requestSceneActivation__block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "performWithSender:target:", *(_QWORD *)(a1 + 40), 0);
  return result;
}

- (id)_immutableCopy
{
  _UIWindowSceneActivationImmutableAction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIMenuElementAttributes v8;
  void *v9;
  void *v10;
  _UIWindowSceneActivationImmutableAction *v11;
  void *v12;

  v3 = [_UIWindowSceneActivationImmutableAction alloc];
  -[UIMenuElement title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMenuElement image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAction discoverabilityTitle](self, "discoverabilityTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIAction attributes](self, "attributes");
  -[UIWindowSceneActivationAction _alternateAction](self, "_alternateAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationAction _configurationProvider](self, "_configurationProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIWindowSceneActivationAction initWithTitle:image:identifier:discoverabilityTitle:attributes:alternateAction:configurationProvider:](v3, "initWithTitle:image:identifier:discoverabilityTitle:attributes:alternateAction:configurationProvider:", v4, v5, v6, v7, v8, v9, v10);

  -[UIWindowSceneActivationAction _preferredActivator](self, "_preferredActivator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationAction set_preferredActivator:](v11, "set_preferredActivator:", v12);

  return v11;
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
  void *v13;

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

  -[UIWindowSceneActivationAction _preferredActivator](self, "_preferredActivator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowSceneActivationAction set_preferredActivator:](v12, "set_preferredActivator:", v13);

  return v12;
}

- (BOOL)keepsMenuPresented
{
  return 1;
}

- (void)_willBePreparedForInitialDisplay:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIWindowSceneActivationAction;
  -[UIMenuElement _willBePreparedForInitialDisplay:](&v5, sel__willBePreparedForInitialDisplay_, v4);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF674A0))
    -[UIWindowSceneActivationAction set_preferredActivator:](self, "set_preferredActivator:", v4);

}

+ (id)_defaultTitle
{
  return _UILocalizedString(CFSTR("Open in New Window"), (uint64_t)CFSTR("A title for a menu item used for opening some content in a new window."), CFSTR("Open in New Window"));
}

+ (id)_defaultImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.badge.plus"));
}

- (UIWindowSceneActivationAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9
{
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7, a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 218, CFSTR("Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"));

  return 0;
}

- (UIWindowSceneActivationAction)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowSceneActivationAction.m"), 223, CFSTR("Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"));

  return 0;
}

+ (UIWindowSceneActivationAction)actionWithHandler:(UIActionHandler)handler
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", handler);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIWindowSceneActivationAction.m"), 228, CFSTR("Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"));

  return 0;
}

+ (UIWindowSceneActivationAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", title, image, identifier, handler);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIWindowSceneActivationAction.m"), 236, CFSTR("Initializer is unavailable. Please use init(title:image:identifier:discoverabilityTitle:attributes:alternate:_:)"));

  return 0;
}

- (_UIWindowSceneActivator)_preferredActivator
{
  return (_UIWindowSceneActivator *)objc_loadWeakRetained((id *)&self->__preferredActivator);
}

- (void)set_preferredActivator:(id)a3
{
  objc_storeWeak((id *)&self->__preferredActivator, a3);
}

- (id)_configurationProvider
{
  return self->__configurationProvider;
}

- (void)_setConfigurationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UIAction)_alternateAction
{
  return self->__alternateAction;
}

- (void)_setAlternateAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateAction, 0);
  objc_storeStrong(&self->__configurationProvider, 0);
  objc_destroyWeak((id *)&self->__preferredActivator);
}

@end
