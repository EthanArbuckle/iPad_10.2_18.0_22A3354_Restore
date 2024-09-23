@implementation VSUIVoiceShortcutCard

- (VSUIVoiceShortcutCard)initWithCard:(id)a3
{
  id v4;
  VSUIVoiceShortcutCard *v5;
  VSUIVoiceShortcutCard *v6;
  VSUIVoiceShortcutCard *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSUIVoiceShortcutCard;
  v5 = -[VSUIAsyncLoadingCard initWithCard:](&v9, sel_initWithCard_, v4);
  v6 = v5;
  if (v5)
  {
    -[VSUIVoiceShortcutCard _configureWithCard:](v5, "_configureWithCard:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)_configureWithCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *shortcutIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INIntent *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INIntent *intent;
  INIntent *v21;
  INIntentResponse *intentResponse;
  INIntentResponse *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *sectionCommands;
  INIntentResponse *v31;
  id v32;
  id v33;

  v4 = a3;
  objc_msgSend(v4, "interactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v6;
    objc_msgSend(v32, "voiceCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vocabularyIdentifier");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    shortcutIdentifier = self->_shortcutIdentifier;
    self->_shortcutIdentifier = v8;

    objc_msgSend(v33, "intentResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "underlyingIntent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "underlyingIntentResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentCreate();
    v15 = (INIntent *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "typeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentResponseCreate();
    v31 = (INIntentResponse *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "_metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntent _metadata](v15, "_metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setExecutionContext:", objc_msgSend(v18, "executionContext"));
    -[INIntent _setMetadata:](v15, "_setMetadata:", v19);
    intent = self->_intent;
    self->_intent = v15;
    v21 = v15;

    intentResponse = self->_intentResponse;
    self->_intentResponse = v31;

  }
  else
  {
    objc_storeStrong((id *)&self->_intent, v6);
    objc_msgSend(v33, "intentResponse");
    v23 = (INIntentResponse *)objc_claimAutoreleasedReturnValue();
    v10 = self->_intentResponse;
    self->_intentResponse = v23;
  }

  objc_msgSend(v4, "cardSections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "commands");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = (void *)MEMORY[0x24BDBD1A8];
  if (v26)
    v28 = (void *)v26;
  v29 = v28;

  sectionCommands = self->_sectionCommands;
  self->_sectionCommands = v29;

}

- (id)cardIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)loadCardWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = (void (**)(id, _QWORD))a3;
  -[VSUIVoiceShortcutCard intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIVoiceShortcutCard intentResponse](self, "intentResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD9DF0]), "initWithIntent:response:", v5, v6);
    -[VSUIVoiceShortcutCard loadCardWithContent:completion:](self, "loadCardWithContent:completion:", v7, v4);
  }
  else
  {
    v7 = os_log_create("com.apple.cards.VoiceShortcutsUICardKitProviderSupport", "VSUIVoiceShortcutCard");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VSUIVoiceShortcutCard loadCardWithCompletion:].cold.1(self, v7);

    v4[2](v4, 0);
  }

}

- (void)loadCardWithContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setStyle:", 0);
  objc_msgSend(v8, "setShowThumbnailImage:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE042B8]), "initWithCardViewConfig:", v8);
  objc_msgSend(v9, "setFormat:", 1);
  objc_msgSend(v9, "setContent:", v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__VSUIVoiceShortcutCard_loadCardWithContent_completion___block_invoke;
  v11[3] = &unk_24E717038;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "startWithReply:", v11);

}

void __56__VSUIVoiceShortcutCard_loadCardWithContent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "card");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "sectionCommands");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCommands:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (NSArray)sectionCommands
{
  return self->_sectionCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionCommands, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

- (void)loadCardWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "intentResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_221537000, a2, OS_LOG_TYPE_ERROR, "Nil intent encountered while loading VSUIVoiceShortcutCard: shortcutIdentifier = %{public}@, intentResponse = %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
