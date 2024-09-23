@implementation WFFocusConfigurationOptions

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6 showsEnablementButton:(BOOL)a7 isEnabled:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFFocusConfigurationOptions *v19;
  WFFocusConfigurationOptions *v20;
  uint64_t v21;
  LNAction *action;
  WFFocusConfigurationOptions *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusConfigurationOptions;
  v19 = -[WFFocusConfigurationOptions init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_actionIdentifier, a3);
    v21 = objc_msgSend(v16, "copy");
    action = v20->_action;
    v20->_action = (LNAction *)v21;

    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    objc_storeStrong((id *)&v20->_footerButtons, a6);
    v20->_showsEnablementButton = a7;
    v20->_enabled = a8;
    v23 = v20;
  }

  return v20;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  WFFocusConfigurationOptions *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeLastObject");
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v11 = (void *)getLNFullyQualifiedActionIdentifierClass_softClass;
  v20 = getLNFullyQualifiedActionIdentifierClass_softClass;
  if (!getLNFullyQualifiedActionIdentifierClass_softClass)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getLNFullyQualifiedActionIdentifierClass_block_invoke;
    v16[3] = &unk_24C5AB7C0;
    v16[4] = &v17;
    __getLNFullyQualifiedActionIdentifierClass_block_invoke((uint64_t)v16);
    v11 = (void *)v18[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v17, 8);
  v13 = (void *)objc_msgSend([v12 alloc], "initWithActionIdentifier:bundleIdentifier:", v9, v10);
  v14 = -[WFFocusConfigurationOptions initWithFocusConfigurationActionIdentifier:action:](self, "initWithFocusConfigurationActionIdentifier:action:", v13, v4);

  return v14;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  WFFocusConfigurationOptions *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v8 = (void *)getLNFocusConfigurationSuggestionContextClass_softClass;
  v17 = getLNFocusConfigurationSuggestionContextClass_softClass;
  if (!getLNFocusConfigurationSuggestionContextClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getLNFocusConfigurationSuggestionContextClass_block_invoke;
    v13[3] = &unk_24C5AB7C0;
    v13[4] = &v14;
    __getLNFocusConfigurationSuggestionContextClass_block_invoke((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v14, 8);
  v10 = (void *)objc_opt_new();
  v11 = -[WFFocusConfigurationOptions initWithFocusConfigurationActionIdentifier:action:suggestionContext:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:", v6, v7, v10);

  return v11;
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5
{
  return -[WFFocusConfigurationOptions initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:", a3, a4, a5, MEMORY[0x24BDBD1A8]);
}

- (WFFocusConfigurationOptions)initWithFocusConfigurationActionIdentifier:(id)a3 action:(id)a4 suggestionContext:(id)a5 footerButtons:(id)a6
{
  return -[WFFocusConfigurationOptions initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:](self, "initWithFocusConfigurationActionIdentifier:action:suggestionContext:footerButtons:showsEnablementButton:isEnabled:", a3, a4, a5, a6, 0, 1);
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
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
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
