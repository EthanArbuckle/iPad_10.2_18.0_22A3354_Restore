@implementation RSPeerToPeerClientController

- (void)prepareForConnection
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (self->_serviceBrowser)
    -[RSPeerToPeerClientController abort](self, "abort");
  v10.receiver = self;
  v10.super_class = (Class)RSPeerToPeerClientController;
  -[RSPeerToPeerConnectionController prepareForConnection](&v10, sel_prepareForConnection);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getMCNearbyServiceBrowserClass_softClass;
  v15 = getMCNearbyServiceBrowserClass_softClass;
  if (!getMCNearbyServiceBrowserClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getMCNearbyServiceBrowserClass_block_invoke;
    v11[3] = &unk_24DA9B270;
    v11[4] = &v12;
    __getMCNearbyServiceBrowserClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v5 = [v4 alloc];
  -[RSPeerToPeerConnectionController localPeerID](self, "localPeerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPeer:serviceType:", v6, CFSTR("RS-StateDmpSrvc"));

  -[RSPeerToPeerClientController setServiceBrowser:](self, "setServiceBrowser:", v7);
  -[RSPeerToPeerClientController serviceBrowser](self, "serviceBrowser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[RSPeerToPeerClientController serviceBrowser](self, "serviceBrowser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startBrowsingForPeers");

}

- (void)abort
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RSPeerToPeerClientController;
  -[RSPeerToPeerConnectionController abort](&v5, sel_abort);
  -[RSPeerToPeerClientController serviceBrowser](self, "serviceBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[RSPeerToPeerClientController serviceBrowser](self, "serviceBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopBrowsingForPeers");

  -[RSPeerToPeerClientController setServiceBrowser:](self, "setServiceBrowser:", 0);
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  RSPeerToPeerClientController *v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__RSPeerToPeerClientController_browser_foundPeer_withDiscoveryInfo___block_invoke;
  v11[3] = &unk_24DA9B248;
  v12 = v7;
  v13 = v8;
  v14 = self;
  v9 = v8;
  v10 = v7;
  -[RSPeerToPeerConnectionController attemptConnectionWithPeer:successBlock:](self, "attemptConnectionWithPeer:successBlock:", v9, v11);

}

void __68__RSPeerToPeerClientController_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invitePeer:toSession:withContext:timeout:", v2, v3, 0, 5.0);

}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = a4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ browser did lost peer %@.", (uint8_t *)&v9, 0x16u);

  }
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = a4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ browser did not start browsing for peers %@.", (uint8_t *)&v9, 0x16u);

  }
}

- (MCNearbyServiceBrowser)serviceBrowser
{
  return self->_serviceBrowser;
}

- (void)setServiceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBrowser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
}

@end
