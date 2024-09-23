@implementation NCNotificationAction(Wallet)

+ (id)revealWalletPassNotificationActionForCardItem:()Wallet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WALLET_ACTION_SHOW_PASS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%lu-default"), v9, objc_msgSend(v3, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdentifier:", v10);
  objc_msgSend(v4, "setActivationMode:", 0);
  objc_msgSend(v4, "setShouldDismissNotification:", 0);
  objc_msgSend(v4, "setRequiresAuthentication:", objc_msgSend(v3, "requiresPasscode"));
  v11 = -[NCRevealWalletPassActionRunner initWithCardItem:]((id *)[NCRevealWalletPassActionRunner alloc], v3);

  objc_msgSend(v4, "setActionRunner:", v11);
  return v4;
}

@end
