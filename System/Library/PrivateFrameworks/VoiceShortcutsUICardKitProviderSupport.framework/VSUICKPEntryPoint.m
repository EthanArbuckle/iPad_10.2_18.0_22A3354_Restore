@implementation VSUICKPEntryPoint

- (unint64_t)displayPriorityForCard:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "interactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 2 * (v4 != 0);

  return v5;
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __objc2_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  Class *v19;

  v3 = a3;
  objc_msgSend(v3, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v14 = 0;
    goto LABEL_20;
  }
  v6 = v3;
  objc_msgSend(v6, "interactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && objc_msgSend(v10, "executionContext") != 2
    && objc_msgSend(v10, "executionContext") != 9)
  {
    if (objc_msgSend(v6, "asynchronous"))
    {
      v12 = v6;
      goto LABEL_8;
    }
    if (objc_msgSend(v10, "executionContext") == 1 || (objc_msgSend(v10, "hasExecutionContext") & 1) == 0)
    {
      v11 = VSUIAsyncLoadingCard;
      goto LABEL_7;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v11 = VSUIVoiceShortcutCard;
LABEL_7:
  v12 = (id)objc_msgSend([v11 alloc], "initWithCard:", v6);
LABEL_8:
  v13 = v12;
LABEL_15:

  objc_msgSend(v6, "interactions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "intent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_intentCategory");

  v19 = (Class *)0x24BE15460;
  if (v13)
    v6 = v13;
  if (v18 != 1)
    v19 = (Class *)off_24E716E30;
  v14 = (void *)objc_msgSend(objc_alloc(*v19), "_initWithCard:delegate:loadProvidersImmediately:", v6, 0, 0);

LABEL_20:
  return v14;
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.VoiceShortcutsUICardKitProvider");
}

@end
