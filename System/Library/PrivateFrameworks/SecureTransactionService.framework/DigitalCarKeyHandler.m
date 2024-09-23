@implementation DigitalCarKeyHandler

- (unsigned)supportedCredentialType
{
  return 4;
}

- (id)startNFSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[STSHandler nfHardwareManager](self, "nfHardwareManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2158CB494;
  v9[3] = &unk_24D3A76D0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "startDigitalCarKeySession:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setActiveCredential:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NFDigitalCarKeySession *nfSession;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NFDigitalCarKeySession *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[5];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)DigitalCarKeyHandler;
  -[STSHandler setActiveCredential:](&v38, sel_setActiveCredential_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_msgSend(v5, "identifier"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 67, self, CFSTR("Invalid credential"), v6, v7, v34);
    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v20;
    v40[1] = &unk_24D3B34E8;
    v39[1] = CFSTR("Line");
    v39[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v21;
    v39[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 68);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v12, 9, v22);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
LABEL_12:

    v17 = (id)v26;
    goto LABEL_13;
  }
  nfSession = self->_nfSession;
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFDigitalCarKeySession appletWithIdentifier:](nfSession, "appletWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v5, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 63, self, CFSTR("applet not found for identifier = %@"), v30, v31, (uint64_t)v29);

    v32 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v21;
    v42[1] = &unk_24D3B34D0;
    v41[1] = CFSTR("Line");
    v41[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v16;
    v41[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 64);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v20, 10, v33);
    v26 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v8 = (void *)v33;
    goto LABEL_10;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 57, self, CFSTR("applet %@"), v13, v14, (uint64_t)v12);
  v15 = self->_nfSession;
  objc_msgSend(v5, "subIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  LOBYTE(v15) = -[NFDigitalCarKeySession setActiveApplet:key:outError:](v15, "setActiveApplet:key:outError:", v12, v16, &v37);
  v17 = v37;

  if ((v15 & 1) == 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler setActiveCredential:]", 59, self, CFSTR("set active applet failed = %@"), v18, v19, (uint64_t)v17);
    v36 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    v43[1] = *MEMORY[0x24BDD1398];
    v22 = v17;
    if (!v17)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v16, 5, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v44[1] = v22;
    v44[2] = &unk_24D3B34B8;
    v43[2] = CFSTR("Line");
    v43[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v35;
    v43[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 60);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v20, 10, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_13:

  return v17;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NFDigitalCarKeySession *nfSession;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[4];
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v36.receiver = self;
  v36.super_class = (Class)DigitalCarKeyHandler;
  -[STSTransactionHandler startTransactionWithAuthorization:options:](&v36, sel_startTransactionWithAuthorization_options_, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nfSession)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 82, self, CFSTR("auth: %@"), v8, v9, (uint64_t)v7);
    nfSession = self->_nfSession;
    v35 = v10;
    v12 = -[NFDigitalCarKeySession startCardEmulationAuthorization:deferred:error:](nfSession, "startCardEmulationAuthorization:deferred:error:", v7, 0, &v35);
    v13 = v35;

    if ((v12 & 1) == 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 84, self, CFSTR("start transaction failed = %@"), v14, v15, (uint64_t)v13);
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v18;
      v37[1] = *MEMORY[0x24BDD1398];
      v19 = v13;
      if (!v13)
      {
        v20 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v38[1] = v19;
      v38[2] = &unk_24D3B3518;
      v37[2] = CFSTR("Line");
      v37[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v21;
      v37[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 85);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 10, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      if (!v13)
      {

      }
      v13 = (id)v24;
    }
    v25 = v13;
    v10 = v25;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler startTransactionWithAuthorization:options:]", 78, self, CFSTR("NF session does not exist!"), v8, v9, v33);
    v26 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v28;
    v40[1] = &unk_24D3B3500;
    v39[1] = CFSTR("Line");
    v39[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v29;
    v39[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 79);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 9, v31);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

- (id)stopTransaction
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NFDigitalCarKeySession *nfSession;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)DigitalCarKeyHandler;
  -[STSTransactionHandler stopTransaction](&v19, sel_stopTransaction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nfSession)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[DigitalCarKeyHandler stopTransaction]", 99, self, &stru_24D3A78C0, v4, v5, v17);
    nfSession = self->_nfSession;
    v18 = v6;
    -[NFDigitalCarKeySession stopCardEmulation:](nfSession, "stopCardEmulation:", &v18);
    v8 = v18;

    v9 = v8;
    v6 = v9;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler stopTransaction]", 95, self, CFSTR("NF session does not exist!"), v4, v5, v17);
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = &unk_24D3B3530;
    v20[1] = CFSTR("Line");
    v20[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 96);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 9, v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)session:(id)a3 event:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  STSExpressEventInfoWithIdentifiers *v15;
  uint64_t v16;
  STSExpressEventInfoWithIdentifiers *v17;
  uint64_t v18;
  id v19;

  v19 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 178, self, CFSTR("%@"), v5, v6, (uint64_t)v19);
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE6B580]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[STSTransactionHandler parent](self, "parent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 188, self, CFSTR("Parent session is no longer available"), v10, v11, v18);
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE6B570]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE6B578]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.unlock")))
    {
      v15 = [STSExpressEventInfoWithIdentifiers alloc];
      v16 = 10;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.secureelementservice.dck.event.vehicle.did.lock")))
      {
        objc_msgSend(v12, "fireDigitalCarKeyEventPayload:", v19);
        goto LABEL_11;
      }
      v15 = [STSExpressEventInfoWithIdentifiers alloc];
      v16 = 9;
    }
    v17 = -[STSExpressEventInfoWithIdentifiers initWithState:appletIdentifier:keyIdentifier:](v15, "initWithState:appletIdentifier:keyIdentifier:", v16, v13, v14);
    objc_msgSend(v12, "fireExpressModeStateChangeWithInfo:", v17);

LABEL_11:
    goto LABEL_12;
  }
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[DigitalCarKeyHandler session:event:]", 182, self, CFSTR("Received invalid key=%@ for payload=%@"), v8, v9, (uint64_t)v7);
LABEL_13:

}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didEnterFieldWithNotification:]", 213, self, CFSTR("%@"), v6, v7, (uint64_t)v5);
  sub_2158CEFF0(v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[STSTransactionHandler parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireFieldNotificationEvent:", v9);

}

- (void)sessionDidExitField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidExitField:]", 219, self, CFSTR("Field Off"), v3, v4, v6);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireFieldDetectEvent:", 0);

}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didExpireTransactionForApplet:]", 224, self, CFSTR("EXPIRED: %@"), v4, v5, (uint64_t)a4);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireDidExpireTransaction:", 1);

}

- (void)session:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  STSTransactionStartEvent *v8;
  void *v9;
  void *v10;
  STSTransactionStartEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didStartTransaction:]", 229, self, CFSTR("START: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionStartEvent alloc];
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STSTransactionStartEvent initWithCredential:andDigitalCarKeyStartEvent:](v8, "initWithCredential:andDigitalCarKeyStartEvent:", v9, v5);

  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionStartEvent:", v11);

}

- (void)session:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  STSTransactionEndEvent *v8;
  void *v9;
  void *v10;
  STSTransactionEndEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didEndTransaction:]", 236, self, CFSTR("END: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionEndEvent alloc];
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STSTransactionEndEvent initWithCredential:andDigitalCarKeyEndEvent:](v8, "initWithCredential:andDigitalCarKeyEndEvent:", v9, v5);

  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionEndEvent:", v11);

}

- (void)sessionDidFailDeferredAuthorization:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidFailDeferredAuthorization:]", 243, self, CFSTR("Failed deferred authorization"), v3, v4, v6);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireDidFailDeferredAuth:", 1);

}

- (void)session:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  STSExpressEventInfoWithDetail *v12;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didExpressModeStateChange:withObject:]", 250, self, CFSTR("%d - %@"), v8, v9, v5);
  v10 = 0;
  if ((v5 - 1) <= 8)
    v10 = dword_2158DB8E4[(int)v5 - 1];
  v12 = -[STSExpressEventInfoWithDetail initWithState:detail:]([STSExpressEventInfoWithDetail alloc], "initWithState:detail:", v10, v7);

  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireExpressModeStateChangeWithInfo:", v12);

}

- (void)sessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler sessionDidReceiveActivityTimeout:result:]", 257, self, CFSTR("Activity Timeout : %@"), v6, v7, (uint64_t)v5);
  -[STSTransactionHandler parent](self, "parent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireDidReceiveActivityTimeout:", v5);

}

- (void)session:(id)a3 didReceivePassthroughMessage:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[DigitalCarKeyHandler session:didReceivePassthroughMessage:]", 264, self, CFSTR("Received passhtrough message"), v6, v7, v8);
  -[STSTransactionHandler parent](self, "parent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fireDidReceivePassthroughMessage:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end
