@implementation WFFocusConfigurationRequest

- (WFFocusConfigurationRequest)initWithOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFFocusConfigurationRequest *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationRequest.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  objc_msgSend(v5, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerButtons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFFocusConfigurationRequest initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:", v6, v7, v8, v9, objc_msgSend(v5, "showsEnablementButton"), objc_msgSend(v5, "isEnabled"));

  return v10;
}

- (WFFocusConfigurationRequest)initWithContextualActionOptions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WFFocusConfigurationRequest *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationRequest.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  }
  objc_msgSend(v5, "contextualAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "showsEnablementButton");
  v9 = objc_msgSend(v5, "isEnabled");
  objc_msgSend(v5, "mastheadTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFFocusConfigurationRequest initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:](self, "initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:", v6, v7, v8, v9, v10);

  return v11;
}

- (WFFocusConfigurationRequest)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFFocusConfigurationRequest *v19;
  WFFocusConfigurationRequest *v20;
  uint64_t v21;
  LNAction *action;
  WFFocusConfigurationRequest *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusConfigurationRequest;
  v19 = -[WFFocusConfigurationRequest init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_mode = 0;
    v21 = objc_msgSend(v16, "copy");
    action = v20->_action;
    v20->_action = (LNAction *)v21;

    objc_storeStrong((id *)&v20->_actionIdentifier, a3);
    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    objc_storeStrong((id *)&v20->_footerButtons, a6);
    v20->_showsEnablementButton = a7;
    v20->_enabled = a8;
    v23 = v20;
  }

  return v20;
}

- (WFFocusConfigurationRequest)initWithContextualAction:(id)a3 footerButtons:(id)a4 showsEnablementButton:(BOOL)a5 isEnabled:(BOOL)a6 mastheadTintColor:(id)a7
{
  id v14;
  id v15;
  id v16;
  WFFocusConfigurationRequest *v17;
  WFFocusConfigurationRequest *v18;
  WFFocusConfigurationRequest *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationRequest.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contextualAction"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFocusConfigurationRequest.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("footerButtons"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)WFFocusConfigurationRequest;
  v17 = -[WFFocusConfigurationRequest init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_mode = 1;
    objc_storeStrong((id *)&v17->_contextualAction, a3);
    objc_storeStrong((id *)&v18->_footerButtons, a4);
    v18->_showsEnablementButton = a5;
    v18->_enabled = a6;
    objc_storeStrong((id *)&v18->_mastheadTintColor, a7);
    v19 = v18;
  }

  return v18;
}

- (BOOL)isValid
{
  unint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = -[WFFocusConfigurationRequest mode](self, "mode");
  if (v3 == 1)
  {
    -[WFFocusConfigurationRequest contextualAction](self, "contextualAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 != 0;
LABEL_8:

    return v6;
  }
  if (!v3)
  {
    -[WFFocusConfigurationRequest actionIdentifier](self, "actionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFFocusConfigurationRequest action](self, "action");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }
    goto LABEL_8;
  }
  return 0;
}

- (void)loadFocusActionWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, void *);
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = -[WFFocusConfigurationRequest mode](self, "mode");
  if (v5 == 1)
    goto LABEL_4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Invalid focus configuration request."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10);

    goto LABEL_9;
  }
  -[WFFocusConfigurationRequest action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_4:
    v4[2](v4, 0);
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v11 = (void *)getLNActionDefaultValueProviderClass_softClass;
    v26 = getLNActionDefaultValueProviderClass_softClass;
    v12 = MEMORY[0x24BDAC760];
    if (!getLNActionDefaultValueProviderClass_softClass)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __getLNActionDefaultValueProviderClass_block_invoke;
      v22[3] = &unk_24C5AB7C0;
      v22[4] = &v23;
      __getLNActionDefaultValueProviderClass_block_invoke((uint64_t)v22);
      v11 = (void *)v24[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v23, 8);
    v14 = [v13 alloc];
    -[WFFocusConfigurationRequest actionIdentifier](self, "actionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithActionIdentifier:actionMetadata:", v15, 0);

    -[WFFocusConfigurationRequest suggestionContext](self, "suggestionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke;
    v19[3] = &unk_24C5AB298;
    v19[4] = self;
    v20 = v16;
    v21 = v4;
    v18 = v16;
    objc_msgSend(v18, "loadSuggestedFocusActionsWithSuggestionContext:completion:", v17, v19);

  }
LABEL_9:

}

- (WFFocusConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  WFFocusConfigurationRequest *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsEnablementButton"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled"));
  if (v5 == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextualAction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("footerButtons"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mastheadTintColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFFocusConfigurationRequest initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:](self, "initWithContextualAction:footerButtons:showsEnablementButton:isEnabled:mastheadTintColor:", v10, v24, v6, v7, v25);

  }
  else
  {
    if (v5)
    {
      v26 = 0;
      goto LABEL_13;
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v8 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass_626;
    v36 = getLNFullyQualifiedActionIdentifierClass_softClass_626;
    if (!getLNFullyQualifiedActionIdentifierClass_softClass_626)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getLNFullyQualifiedActionIdentifierClass_block_invoke_627;
      v31 = &unk_24C5AB7C0;
      v32 = &v33;
      __getLNFullyQualifiedActionIdentifierClass_block_invoke_627((uint64_t)&v28);
      v8 = (void *)v34[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v33, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("actionIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v11 = (void *)getLNActionClass_softClass;
    v36 = getLNActionClass_softClass;
    if (!getLNActionClass_softClass)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getLNActionClass_block_invoke;
      v31 = &unk_24C5AB7C0;
      v32 = &v33;
      __getLNActionClass_block_invoke((uint64_t)&v28);
      v11 = (void *)v34[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v33, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v14 = (void *)getLNFocusConfigurationSuggestionContextClass_softClass_628;
    v36 = getLNFocusConfigurationSuggestionContextClass_softClass_628;
    if (!getLNFocusConfigurationSuggestionContextClass_softClass_628)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getLNFocusConfigurationSuggestionContextClass_block_invoke_629;
      v31 = &unk_24C5AB7C0;
      v32 = &v33;
      __getLNFocusConfigurationSuggestionContextClass_block_invoke_629((uint64_t)&v28);
      v14 = (void *)v34[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v33, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("suggestionContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("footerButtons"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[WFFocusConfigurationRequest initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:", v10, v13, v16, v20, v6, v7);
  }

  v26 = self;
LABEL_13:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[WFFocusConfigurationRequest mode](self, "mode"), CFSTR("mode"));
  -[WFFocusConfigurationRequest actionIdentifier](self, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("actionIdentifier"));

  -[WFFocusConfigurationRequest action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("action"));

  -[WFFocusConfigurationRequest suggestionContext](self, "suggestionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("suggestionContext"));

  -[WFFocusConfigurationRequest contextualAction](self, "contextualAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("contextualAction"));

  -[WFFocusConfigurationRequest footerButtons](self, "footerButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("footerButtons"));

  -[WFFocusConfigurationRequest mastheadTintColor](self, "mastheadTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("mastheadTintColor"));

  objc_msgSend(v10, "encodeBool:forKey:", -[WFFocusConfigurationRequest showsEnablementButton](self, "showsEnablementButton"), CFSTR("showsEnablementButton"));
  objc_msgSend(v10, "encodeBool:forKey:", -[WFFocusConfigurationRequest isEnabled](self, "isEnabled"), CFSTR("isEnabled"));

}

- (unint64_t)mode
{
  return self->_mode;
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (WFColor)mastheadTintColor
{
  return self->_mastheadTintColor;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (BOOL)showsEnablementButton
{
  return self->_showsEnablementButton;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_mastheadTintColor, 0);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

void __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 && v6)
  {
    getWFFocusConfigurationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFFocusConfigurationRequest loadFocusActionWithCompletion:]_block_invoke";
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_20CE0F000, v8, OS_LOG_TYPE_ERROR, "%s Failed to load suggested focus actions with error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAction:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke_41;
    v11[3] = &unk_24C5AB270;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v10, "loadDefaultValuesWithCompletionHandler:", v11);

  }
}

void __61__WFFocusConfigurationRequest_loadFocusActionWithCompletion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setAction:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
