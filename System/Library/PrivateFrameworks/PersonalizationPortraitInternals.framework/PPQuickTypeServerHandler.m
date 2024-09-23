@implementation PPQuickTypeServerHandler

- (void)warmUpWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: warmUp", v6, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "warmUpWithCompletion:", v3);

}

- (PPQuickTypeServerHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPQuickTypeServerHandler;
  return -[PPQuickTypeServerHandler init](&v3, sel_init);
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v7 = a5;
  v8 = a3;
  pp_xpc_server_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: quickTypeItemsWithQuery", v11, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quickTypeItemsWithQuery:limit:completion:", v8, a4, v7);

}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint8_t v20[16];

  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  pp_xpc_server_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: quickTypeItemsWithLanguageModelingTokens", v20, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "quickTypeItemsWithLanguageModelingTokens:localeIdentifier:recipients:bundleIdentifier:limit:completion:", v17, v16, v15, v14, a7, v13);

}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: recentQuickTypeItemsForRecipients", v9, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recentQuickTypeItemsForRecipients:completion:", v6, v5);

}

- (void)hibernateWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: hibernate", v6, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hibernateWithCompletion:", v3);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPQuickTypeServer: registerFeedback", v9, 2u);
  }

  +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerFeedback:completion:", v6, v5);

}

@end
