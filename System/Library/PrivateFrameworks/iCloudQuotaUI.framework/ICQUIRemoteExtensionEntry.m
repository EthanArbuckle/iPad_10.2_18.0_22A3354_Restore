@implementation ICQUIRemoteExtensionEntry

+ (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Presenting remote extension by %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "presentRemoteViewControllerWithContext:presentingViewController:completion:", v9, v7, v8);

}

+ (void)dismissRemoteViewControllerWithError:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[ICQUIRemoteExtensionEntry dismissRemoteViewControllerWithError:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s - error: %@", (uint8_t *)&v6, 0x16u);
  }

  +[ICQUIRemoteExtensionEntry sharedInstance](ICQUIRemoteExtensionEntry, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerWithError:", v3);

}

+ (id)extensionPointID
{
  return CFSTR("com.apple.iCloudQuotaUI.remote-extension");
}

- (ICQUIRemoteExtensionEntry)init
{
  ICQUIRemoteExtensionEntry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQUIRemoteExtensionEntry;
  v2 = -[ICQUIRemoteExtensionEntry init](&v4, sel_init);
  if (v2)
    +[ICQUIRemoteExtensionEntry setSharedInstance:](ICQUIRemoteExtensionEntry, "setSharedInstance:", v2);
  return v2;
}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQUIRemoteExtensionEntry shouldAcceptConnection:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[ICQUIRemoteExtensionEntry extensionShouldAccept:](self, "extensionShouldAccept:", v4);
  return v6;
}

- (void)prepareForSceneConnectionWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQUIRemoteExtensionEntry prepareForSceneConnectionWithConfiguration:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQUIRemoteExtensionEntry extensionPrepareForSceneConnectionWith:](self, "extensionPrepareForSceneConnectionWith:", v4);
}

- (id)makeContentViewController
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQUIRemoteExtensionEntry makeContentViewController]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQUIRemoteExtensionEntry extensionMakeContentViewController](self, "extensionMakeContentViewController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSXPCConnection)currentConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_currentConnection);
}

- (void)setCurrentConnection:(id)a3
{
  objc_storeWeak((id *)&self->_currentConnection, a3);
}

- (NSDictionary)offerContext
{
  return self->_offerContext;
}

- (void)setOfferContext:(id)a3
{
  objc_storeStrong((id *)&self->_offerContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerContext, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
}

+ (ICQUIRemoteExtensionEntry)sharedInstance
{
  swift_beginAccess();
  return (ICQUIRemoteExtensionEntry *)(id)qword_2554D5000;
}

+ (void)setSharedInstance:(id)a3
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = (void *)qword_2554D5000;
  qword_2554D5000 = (uint64_t)a3;
  v5 = a3;

}

- (ICQUIRemoteExtensionDelegate)transformer
{
  ICQUIRemoteExtensionEntry *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21F44AB08();

  return (ICQUIRemoteExtensionDelegate *)v3;
}

- (BOOL)extensionShouldAccept:(id)a3
{
  id v4;
  ICQUIRemoteExtensionEntry *v5;

  v4 = a3;
  v5 = self;
  ICQUIRemoteExtensionEntry.extensionShouldAccept(_:)((NSXPCConnection)v4);

  return 1;
}

- (void)extensionPrepareForSceneConnectionWith:(id)a3
{
  id v4;
  ICQUIRemoteExtensionEntry *v5;

  v4 = a3;
  v5 = self;
  _sSo25ICQUIRemoteExtensionEntryC13iCloudQuotaUIE34extensionPrepareForSceneConnection4withySo21_EXSceneConfigurationC_tF_0(v4);

}

- (id)extensionMakeContentViewController
{
  ICQUIRemoteExtensionEntry *v2;
  ICQUIRemoteExtensionDelegate *v3;
  id v4;

  v2 = self;
  v3 = -[ICQUIRemoteExtensionEntry transformer](v2, sel_transformer);
  if (v3)
  {
    v4 = -[ICQUIRemoteExtensionDelegate makeContentViewController](v3, sel_makeContentViewController);

    swift_unknownObjectRelease();
  }
  else
  {

    v4 = 0;
  }
  return v4;
}

- (void)dismissViewControllerWithError:(id)a3
{
  ICQUIRemoteExtensionEntry *v4;
  id v5;

  v4 = self;
  v5 = a3;
  ICQUIRemoteExtensionEntry.dismissViewController(error:)(a3);

}

- (void)startConnectionWithContext:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  ICQUIRemoteExtensionEntry *v7;

  v5 = _Block_copy(a4);
  v6 = sub_21F455F98();
  _Block_copy(v5);
  v7 = self;
  sub_21F44C5F0(v6, v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end
