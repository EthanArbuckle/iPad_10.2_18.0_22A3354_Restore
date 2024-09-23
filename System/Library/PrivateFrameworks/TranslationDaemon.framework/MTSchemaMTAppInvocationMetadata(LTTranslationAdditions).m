@implementation MTSchemaMTAppInvocationMetadata(LTTranslationAdditions)

+ (id)lt_initWithTranslateAppContext:()LTTranslationAdditions
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE951E0]);
  v5 = objc_msgSend(v3, "displayMode");
  if (v5 <= 3)
    objc_msgSend(v4, "setDisplayMode:", v5);
  v6 = (void *)MEMORY[0x24BE95268];
  objc_msgSend(v3, "localePair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lt_initWithLocalePair:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalePair:", v8);

  objc_msgSend(v4, "setIsGenderAlternativeEnabled:", objc_msgSend(v3, "isGenderAlternativeEnabled"));
  v9 = objc_msgSend(v3, "tabName");
  if (v9 <= 4)
    objc_msgSend(v4, "setTabName:", v9);
  v10 = objc_alloc(MEMORY[0x24BE95C78]);
  objc_msgSend(v3, "tabSessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithNSUUID:", v11);
  objc_msgSend(v4, "setTabSessionId:", v12);

  v13 = objc_msgSend(v3, "conversationTabView");
  if (v13 <= 2)
    objc_msgSend(v4, "setConversationTabView:", v13);
  objc_msgSend(v4, "setIsPlayTranslationsEnabled:", objc_msgSend(v3, "isPlayTranslationsEnabled"));
  objc_msgSend(v3, "autoTranslateSessionId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BE95C78]);
    objc_msgSend(v3, "autoTranslateSessionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithNSUUID:", v16);
    objc_msgSend(v4, "setAutoTranslateSessionId:", v17);

  }
  v18 = objc_msgSend(v3, "audioChannel") - 1;
  if (v18 < 5)
    v19 = (v18 + 1);
  else
    v19 = 0;
  objc_msgSend(v4, "setAudioChannel:", v19);

  return v4;
}

@end
