@implementation SBStreamBuddySession

- (SBStreamBuddySession)init
{
  SBStreamBuddySession *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MCPeerID *myPeerID;
  uint64_t v8;
  MCSession *session;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBStreamBuddySession;
  v2 = -[SBStreamBuddySession init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CC7850]);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithDisplayName:", v5);
    myPeerID = v2->_myPeerID;
    v2->_myPeerID = (MCPeerID *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC7858]), "initWithPeer:securityIdentity:encryptionPreference:", v2->_myPeerID, 0, 1);
    session = v2->_session;
    v2->_session = (MCSession *)v8;

    -[MCSession setDelegate:](v2->_session, "setDelegate:", v2);
  }
  return v2;
}

- (void)start
{
  MCNearbyServiceAdvertiser *v3;
  MCNearbyServiceAdvertiser *advertiser;
  id WeakRetained;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (MCNearbyServiceAdvertiser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC7840]), "initWithPeer:discoveryInfo:serviceType:", self->_myPeerID, 0, CFSTR("StreamBuddy"));
  advertiser = self->_advertiser;
  self->_advertiser = v3;

  -[MCNearbyServiceAdvertiser setDelegate:](self->_advertiser, "setDelegate:", self);
  -[MCNearbyServiceAdvertiser startAdvertisingPeer](self->_advertiser, "startAdvertisingPeer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "streamBuddySession:connectionState:withError:", self, 0, 0);

  SBLogStreamBuddy();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "-[SBStreamBuddySession start]", v7, 2u);
  }

}

- (void)stop
{
  MCNearbyServiceAdvertiser *advertiser;
  MCPeerID *connectedPeer;
  id WeakRetained;
  NSObject *v6;
  uint8_t v7[16];

  -[MCNearbyServiceAdvertiser stopAdvertisingPeer](self->_advertiser, "stopAdvertisingPeer");
  -[MCSession disconnect](self->_session, "disconnect");
  advertiser = self->_advertiser;
  self->_advertiser = 0;

  connectedPeer = self->_connectedPeer;
  self->_connectedPeer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "streamBuddySession:connectionState:withError:", self, 1, 0);

  SBLogStreamBuddy();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "-[SBStreamBuddySession stop]", v7, 2u);
  }

}

- (void)sendSystemApertureStateDump:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  MCSession **p_session;
  MCSession *session;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_connectedPeer)
  {
    v6 = (void *)MEMORY[0x1E0CB36D8];
    v32[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v6, "dataWithJSONObject:options:error:", v7, 0, &v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v31;

    if (v8)
    {
      session = self->_session;
      p_session = &self->_session;
      -[MCSession connectedPeers](session, "connectedPeers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v9;
      v13 = -[MCSession sendData:toPeers:withMode:error:](session, "sendData:toPeers:withMode:error:", v8, v12, 0, &v30);
      v14 = v30;

      if (v13)
      {
LABEL_12:

        goto LABEL_13;
      }
      SBLogStreamBuddy();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SBStreamBuddySession sendSystemApertureStateDump:].cold.3((id *)p_session, (uint64_t)v14, v15);
      v9 = v14;
    }
    else
    {
      SBLogStreamBuddy();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SBStreamBuddySession sendSystemApertureStateDump:].cold.2(v15, v23, v24, v25, v26, v27, v28, v29);
    }

    v14 = v9;
    goto LABEL_12;
  }
  SBLogStreamBuddy();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SBStreamBuddySession sendSystemApertureStateDump:].cold.1(v14, v16, v17, v18, v19, v20, v21, v22);
LABEL_13:

}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t, MCSession *);
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, uint64_t, MCSession *))a6;
  SBLogStreamBuddy();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%@ peerID.displayName:%@", (uint8_t *)&v14, 0x16u);

  }
  v10[2](v10, 1, self->_session);

}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogStreamBuddy();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ Error:%@", (uint8_t *)&v10, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "streamBuddySession:connectionState:withError:", self, 5, v6);

}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  _QWORD block[4];
  id v12;
  SBStreamBuddySession *v13;
  id v14;
  int64_t v15;
  SEL v16;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SBStreamBuddySession_session_peer_didChangeState___block_invoke;
    block[3] = &unk_1E8EA1338;
    v15 = a5;
    v12 = WeakRetained;
    v13 = self;
    v14 = v8;
    v16 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __52__SBStreamBuddySession_session_peer_didChangeState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "streamBuddySession:connectionState:withError:", *(_QWORD *)(a1 + 40), 4, 0);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = 0;

      SBLogStreamBuddy();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%@ state:MCSessionStateNotConnected", (uint8_t *)&v10, 0xCu);

      }
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "streamBuddySession:connectionState:withError:", *(_QWORD *)(a1 + 40), 3, 0);
      SBLogStreamBuddy();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "displayName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v5;
        v6 = "%@ state:MCSessionStateConnecting to %@";
        goto LABEL_10;
      }
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "streamBuddySession:connectionState:withError:", *(_QWORD *)(a1 + 40), 2, 0);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 48));
      SBLogStreamBuddy();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "displayName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v5;
        v6 = "%@ state:MCSessionStateConnected to %@";
LABEL_10:
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0x16u);

      }
      break;
    default:
      return;
  }

}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogStreamBuddy();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  SBLogStreamBuddy();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogStreamBuddy();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  SBLogStreamBuddy();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v11, 0x16u);

  }
}

- (SBStreamBuddySessionDelegate)delegate
{
  return (SBStreamBuddySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_connectedPeer, 0);
  objc_storeStrong((id *)&self->_myPeerID, 0);
}

- (void)sendSystemApertureStateDump:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "ERROR: Trying to send data to nowhere.", a5, a6, a7, a8, 0);
}

- (void)sendSystemApertureStateDump:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "ERROR: Failed to seralize streamBuddyPreferences", a5, a6, a7, a8, 0);
}

- (void)sendSystemApertureStateDump:(NSObject *)a3 .cold.3(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "connectedPeers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v7;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "ERROR: Failed to send data to %@ with error: %@", (uint8_t *)&v8, 0x16u);

}

@end
