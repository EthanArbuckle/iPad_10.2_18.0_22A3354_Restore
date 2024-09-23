@implementation RSPeerToPeerConnectionController

- (RSPeerToPeerConnectionController)initWithDataSource:(id)a3
{
  id v4;
  RSPeerToPeerConnectionController *v5;
  RSPeerToPeerConnectionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RSPeerToPeerConnectionController;
  v5 = -[RSPeerToPeerConnectionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)prepareForConnection
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v3 = (void *)getMCPeerIDClass_softClass;
  v24 = getMCPeerIDClass_softClass;
  if (!getMCPeerIDClass_softClass)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __getMCPeerIDClass_block_invoke;
    v19 = &unk_24DA9B270;
    v20 = &v21;
    __getMCPeerIDClass_block_invoke((uint64_t)&v16);
    v3 = (void *)v22[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v21, 8);
  v5 = [v4 alloc];
  -[RSPeerToPeerConnectionController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localPeerDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDisplayName:", v7);

  -[RSPeerToPeerConnectionController setLocalPeerID:](self, "setLocalPeerID:", v8);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v9 = (void *)getMCSessionClass_softClass;
  v24 = getMCSessionClass_softClass;
  if (!getMCSessionClass_softClass)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __getMCSessionClass_block_invoke;
    v19 = &unk_24DA9B270;
    v20 = &v21;
    __getMCSessionClass_block_invoke((uint64_t)&v16);
    v9 = (void *)v22[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v21, 8);
  v11 = [v10 alloc];
  -[RSPeerToPeerConnectionController localPeerID](self, "localPeerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithPeer:securityIdentity:encryptionPreference:", v12, 0, 2);

  -[RSPeerToPeerConnectionController setSession:](self, "setSession:", v13);
  -[RSPeerToPeerConnectionController session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RSPeerToPeerConnectionController setAlreadyConnectedPeerIDs:](self, "setAlreadyConnectedPeerIDs:", v15);

}

- (void)abort
{
  void *v3;
  void *v4;

  -[RSPeerToPeerConnectionController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[RSPeerToPeerConnectionController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnect");

  -[RSPeerToPeerConnectionController setSession:](self, "setSession:", 0);
  -[RSPeerToPeerConnectionController setLocalPeerID:](self, "setLocalPeerID:", 0);
  -[RSPeerToPeerConnectionController setAlreadyConnectedPeerIDs:](self, "setAlreadyConnectedPeerIDs:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[RSPeerToPeerConnectionController abort](self, "abort");
  v3.receiver = self;
  v3.super_class = (Class)RSPeerToPeerConnectionController;
  -[RSPeerToPeerConnectionController dealloc](&v3, sel_dealloc);
}

- (void)attemptConnectionWithPeer:(id)a3 successBlock:(id)a4
{
  _BOOL4 v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = -[RSPeerToPeerConnectionController _shouldInteractWithPeer:](self, "_shouldInteractWithPeer:", a3);
  v7 = v8;
  if (v8 && v6)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)sendState:(id)a3 withInfo:(id)a4 toPeer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[RSPeerToPeerConnectionController _stateDataWithRequestType:stateContent:info:](self, "_stateDataWithRequestType:stateContent:info:", 2, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v10)
      {
        v22[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v13;
      -[RSPeerToPeerConnectionController _sendData:toPeers:](self, "_sendData:toPeers:", v12, v13);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ no conneted peers, cannot send state to peer %@.", (uint8_t *)&v18, 0x16u);

  }
}

- (void)requestState:(id)a3 fromPeer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RSPeerToPeerConnectionController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedPeers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ no conneted peers, cannot request state from peer %@.", (uint8_t *)&v16, 0x16u);

LABEL_10:
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ cannot request state, source peer was not specified.", (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  -[RSPeerToPeerConnectionController _stateDataWithRequestType:stateContent:info:](self, "_stateDataWithRequestType:stateContent:info:", 1, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RSPeerToPeerConnectionController _sendData:toPeers:](self, "_sendData:toPeers:", v10, v11);

  }
LABEL_11:

}

- (BOOL)_shouldInteractWithPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[RSPeerToPeerConnectionController localPeerID](self, "localPeerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[RSPeerToPeerConnectionController prepareForConnection](self, "prepareForConnection");
    goto LABEL_5;
  }
  -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  -[RSPeerToPeerConnectionController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedRemotePeerDisplayNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

LABEL_6:
  return v13;
}

- (id)_connectedPeerWithDisplayName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__RSPeerToPeerConnectionController__connectedPeerWithDisplayName___block_invoke;
  v13[3] = &unk_24DA9B2B0;
  v6 = v4;
  v14 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ Peer display name %@ was not found to be amongst connected ones.", buf, 0x16u);

    }
    v10 = 0;
  }
  else
  {
    -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

uint64_t __66__RSPeerToPeerConnectionController__connectedPeerWithDisplayName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (id)_stateDataWithRequestType:(unint64_t)a3 stateContent:(id)a4 info:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("RSStateEncodedRequestTypeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "stateType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("RSStateEncodedStateTypeKey"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend(v9, "actionRevision");

  objc_msgSend(v13, "numberWithInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("RSStateEncodedRevisionKey"));

  if (v7)
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RSStateEncodedContentKey"));
  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 0, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (v16)
  {
    v18 = v16;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v20;
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ json data encoding error: %@ for state %@.", buf, 0x20u);

  }
  return v16;
}

- (void)_sendData:(id)a3 toPeers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[RSPeerToPeerConnectionController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "sendData:toPeers:withMode:error:", v7, v6, 0, &v13);

  v9 = v13;
  if (v9 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RSDK-%@ data transmission failure error: %@.", buf, 0x16u);

  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  switch(a5)
  {
    case 0:
      -[RSPeerToPeerConnectionController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[RSPeerToPeerConnectionController delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didDisconnectFromRemotePeer:", v8);

      }
      -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v8);
      goto LABEL_12;
    case 2:
      -[RSPeerToPeerConnectionController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[RSPeerToPeerConnectionController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "didConnectToRemotePeer:", v8);

      }
      -[RSPeerToPeerConnectionController alreadyConnectedPeerIDs](self, "alreadyConnectedPeerIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v8);
      goto LABEL_12;
    case 1:
      -[RSPeerToPeerConnectionController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[RSPeerToPeerConnectionController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "willConnectToRemotePeer:", v8);
LABEL_12:

      }
      break;
  }

}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  RSStateInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  RSStateInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  objc_class *v32;
  RSStateInfo *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  RSStateInfo *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  RSStateInfo *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  if (a4)
  {
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a4, 0, &v39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v39;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("RSStateEncodedRequestTypeKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      objc_msgSend(v8, "objectForKey:", CFSTR("RSStateEncodedStateTypeKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      objc_msgSend(v8, "objectForKey:", CFSTR("RSStateEncodedRevisionKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      v16 = -[RSStateInfo initWithType:revision:]([RSStateInfo alloc], "initWithType:revision:", v13, v15);
      if (v11 == 2)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("RSStateEncodedContentKey"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[RSPeerToPeerConnectionController delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "didReceiveState:withInfo:fromPeer:", v28, v16, v30);

      }
      else
      {
        if (v11 == 1)
        {
          -[RSPeerToPeerConnectionController dataSource](self, "dataSource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "supportedStateTypes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "containsObject:", v19);

          if (v20)
          {
            -[RSPeerToPeerConnectionController dataSource](self, "dataSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_opt_respondsToSelector();

            if ((v22 & 1) != 0)
            {
              -[RSPeerToPeerConnectionController dataSource](self, "dataSource");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[RSStateInfo stateType](v16, "stateType");
              v36[0] = MEMORY[0x24BDAC760];
              v36[1] = 3221225472;
              v36[2] = __68__RSPeerToPeerConnectionController_session_didReceiveData_fromPeer___block_invoke;
              v36[3] = &unk_24DA9B2D8;
              v36[4] = self;
              v37 = v16;
              v38 = v7;
              objc_msgSend(v23, "stateForStateType:withCompletionHandler:", v24, v36);

            }
          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
            -[RSPeerToPeerConnectionController localPeerID](self, "localPeerID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "displayName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v41 = v33;
            v42 = 2112;
            v43 = (uint64_t)v35;
            v44 = 2048;
            v45 = v13;
            _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Peer %@ doens't support state type %lul", buf, 0x20u);

          }
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v26 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v26;
          v42 = 2048;
          v43 = v11;
          _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Unable to handle unkown request type: %lul.", buf, 0x16u);
LABEL_13:

        }
      }
LABEL_14:

      goto LABEL_15;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
LABEL_15:

      goto LABEL_16;
    }
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v16 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v26 = (RSStateInfo *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v16;
    v42 = 2112;
    v43 = (uint64_t)v26;
    v44 = 2112;
    v45 = (uint64_t)v27;
    _os_log_impl(&dword_21950E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[RemoteStateDumpKit]-[%@] Unable to serialize JSON data received from %@. %@.", buf, 0x20u);

    goto LABEL_13;
  }
LABEL_16:

}

uint64_t __68__RSPeerToPeerConnectionController_session_didReceiveData_fromPeer___block_invoke(uint64_t result, int a2, uint64_t a3)
{
  if (a3)
  {
    if (a2)
      return objc_msgSend(*(id *)(result + 32), "sendState:withInfo:toPeer:");
  }
  return result;
}

- (RSPeerToPeerConnectionControllerDelegate)delegate
{
  return (RSPeerToPeerConnectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCPeerID)localPeerID
{
  return self->_localPeerID;
}

- (void)setLocalPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_localPeerID, a3);
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSMutableArray)alreadyConnectedPeerIDs
{
  return self->_alreadyConnectedPeerIDs;
}

- (void)setAlreadyConnectedPeerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_alreadyConnectedPeerIDs, a3);
}

- (RSPeerToPeerConnectionControllerDataSource)dataSource
{
  return (RSPeerToPeerConnectionControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_alreadyConnectedPeerIDs, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localPeerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
