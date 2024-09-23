@implementation RSPeerToPeerServerController

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

  if (self->_serviceAdvertiser)
    -[RSPeerToPeerServerController abort](self, "abort");
  v10.receiver = self;
  v10.super_class = (Class)RSPeerToPeerServerController;
  -[RSPeerToPeerConnectionController prepareForConnection](&v10, sel_prepareForConnection);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getMCNearbyServiceAdvertiserClass_softClass;
  v15 = getMCNearbyServiceAdvertiserClass_softClass;
  if (!getMCNearbyServiceAdvertiserClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getMCNearbyServiceAdvertiserClass_block_invoke;
    v11[3] = &unk_24DA9B270;
    v11[4] = &v12;
    __getMCNearbyServiceAdvertiserClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v5 = [v4 alloc];
  -[RSPeerToPeerConnectionController localPeerID](self, "localPeerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPeer:discoveryInfo:serviceType:", v6, 0, CFSTR("RS-StateDmpSrvc"));

  -[RSPeerToPeerServerController setServiceAdvertiser:](self, "setServiceAdvertiser:", v7);
  -[RSPeerToPeerServerController serviceAdvertiser](self, "serviceAdvertiser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[RSPeerToPeerServerController serviceAdvertiser](self, "serviceAdvertiser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAdvertisingPeer");

}

- (void)abort
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RSPeerToPeerServerController;
  -[RSPeerToPeerConnectionController abort](&v5, sel_abort);
  -[RSPeerToPeerServerController serviceAdvertiser](self, "serviceAdvertiser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[RSPeerToPeerServerController serviceAdvertiser](self, "serviceAdvertiser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAdvertisingPeer");

  -[RSPeerToPeerServerController setServiceAdvertiser:](self, "setServiceAdvertiser:", 0);
  self->_advertiserDidNotStartAdvertising = 0;
}

- (BOOL)didStartAcceptingConnections
{
  return self->_serviceAdvertiser && !self->_advertiserDidNotStartAdvertising;
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __102__RSPeerToPeerServerController_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke;
  v10[3] = &unk_24DA9B318;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[RSPeerToPeerConnectionController attemptConnectionWithPeer:successBlock:](self, "attemptConnectionWithPeer:successBlock:", a4, v10);

}

void __102__RSPeerToPeerServerController_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v2);

}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
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
  self->_advertiserDidNotStartAdvertising = 1;
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
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ advertiser did not start advertising peer %@.", (uint8_t *)&v9, 0x16u);

  }
}

- (MCNearbyServiceAdvertiser)serviceAdvertiser
{
  return self->_serviceAdvertiser;
}

- (void)setServiceAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_serviceAdvertiser, a3);
}

- (BOOL)advertiserDidNotStartAdvertising
{
  return self->_advertiserDidNotStartAdvertising;
}

- (void)setAdvertiserDidNotStartAdvertising:(BOOL)a3
{
  self->_advertiserDidNotStartAdvertising = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAdvertiser, 0);
}

@end
