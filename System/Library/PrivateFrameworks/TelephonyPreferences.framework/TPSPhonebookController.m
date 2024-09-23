@implementation TPSPhonebookController

- (TPSPhonebookController)init
{
  -[TPSPhonebookController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSPhonebookController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSPhonebookController *v6;
  TPSPhonebookController *v7;
  TPSPhonebookTelephonyController *v8;
  TPSPhonebookTelephonyController *telephonyClient;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSPhonebookController;
  v6 = -[TPSPhonebookController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = -[TPSPhonebookTelephonyController initWithSubscriptionContext:]([TPSPhonebookTelephonyController alloc], "initWithSubscriptionContext:", v5);
    telephonyClient = v7->_telephonyClient;
    v7->_telephonyClient = v8;

    -[TPSController addDelegate:queue:](v7->_telephonyClient, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
  }

  return v7;
}

- (BOOL)isSubscriptionEditable
{
  void *v2;
  void *v3;
  char v4;

  -[TPSPhonebookController telephonyClient](self, "telephonyClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phoneNumberInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  return v4;
}

- (NSString)subscriptionISOCountryCode
{
  NSString *subscriptionISOCountryCode;
  void *v4;
  NSString *v5;
  NSString *v6;

  subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  if (!subscriptionISOCountryCode)
  {
    -[TPSPhonebookController subscriptionContext](self, "subscriptionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tps_isoCountryCode");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_subscriptionISOCountryCode;
    self->_subscriptionISOCountryCode = v5;

    subscriptionISOCountryCode = self->_subscriptionISOCountryCode;
  }
  return subscriptionISOCountryCode;
}

- (NSString)localizedSubscriptionTelephoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TPSPhonebookController telephonyClient](self, "telephonyClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumberInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TPSPhonebookController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TPSLocalizedPhoneNumberString(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (void)updateSubscriptionTelephoneNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  -[TPSPhonebookController subscriptionISOCountryCode](self, "subscriptionISOCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TPSNormalizedPhoneNumberString(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSPhonebookController telephonyClient](self, "telephonyClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "phoneNumberInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "number");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  v14 = v12;
  if (v13 | v14)
  {
    v15 = (void *)v14;
    if (v14)
    {
      v16 = objc_msgSend((id)v13, "isEqualToString:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    -[TPSPhonebookController telephonyClient](self, "telephonyClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke;
    v18[3] = &unk_1EA2CDC68;
    v19 = v6;
    objc_msgSend(v17, "updatePhoneNumberInfo:label:number:completion:", v11, CFSTR("My Number"), v13, v18);

  }
LABEL_7:

}

void __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke_2;
  v6[3] = &unk_1EA2CDC40;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __71__TPSPhonebookController_updateSubscriptionTelephoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)phonebookController:(id)a3 didChangePhoneNumberInfo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  TPSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "Phone number info changed to %@.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", TPSPhonebookControllerSubscriptionDidChangeNotification, self);

}

- (TPSPhonebookControllerDelegate)delegate
{
  return (TPSPhonebookControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TPSPhonebookTelephonyController)telephonyClient
{
  return self->_telephonyClient;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionISOCountryCode, 0);
}

@end
