@implementation ICQPremiumFlowManager

- (void)beginPremiumFlowWithURL:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQPremiumFlowManager;
  -[ICQUpgradeFlowManager _beginRemoteFlowWithURL:](&v3, sel__beginRemoteFlowWithURL_, a3);
}

- (void)beginPremiumFlow
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICQPremiumFlowManager;
  -[ICQUpgradeFlowManager _beginRemoteFlowWithURL:](&v2, sel__beginRemoteFlowWithURL_, 0);
}

- (void)_configurePresentingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverUIURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "presenting premium out of process page with remoteUI URL %@", buf, 0xCu);

  }
  v8.receiver = self;
  v8.super_class = (Class)ICQPremiumFlowManager;
  -[ICQUpgradeFlowManager _presentRemoteUIUsingViewController:](&v8, sel__presentRemoteUIUsingViewController_, v4);

}

@end
