@implementation STSSigningSession

- (id)canStartSession
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase nfHardwareManager](self, "nfHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getHwSupport");

  if (v5 == 2)
    return 0;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession canStartSession]", 25, self, CFSTR("Hardware not available"), v6, v7, v16);
  v9 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = &unk_24D3B3380;
  v17[1] = CFSTR("Line");
  v17[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v17[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)createHandlerForCredential:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession createHandlerForCredential:]", 35, self, CFSTR("Not Applicable"), v3, v4, vars0);
  return 0;
}

- (id)_createHandlerForMerchantPaymentSign
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  SignMerchantPaymentHandler *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  if (-[STSCredential type](self->_activeCredential, "type") == 1)
  {
    -[STSSessionBase handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v21 = -[SignMerchantPaymentHandler initWithParent:]([SignMerchantPaymentHandler alloc], "initWithParent:", self);
      -[STSSessionBase setHandler:](self, "setHandler:", v21);

      -[STSSessionBase activateChildSession](self, "activateChildSession");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v25 = (void *)v22;
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 60, self, CFSTR("Handler activation failure: %@"), v23, v24, v22);
      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 62, self, CFSTR("Setting new activeCredential %@ on handler"), v23, v24, (uint64_t)self->_activeCredential);
        -[STSSessionBase handler](self, "handler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActiveCredential:", self->_activeCredential);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          return v25;
      }
      -[STSSessionBase handler](self, "handler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "tearDownWithCompletion:", 0);

      -[STSSessionBase setHandler:](self, "setHandler:", 0);
      return v25;
    }
    -[STSSessionBase handler](self, "handler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

    if ((v6 & 1) != 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 52, self, CFSTR("Using existing handler."), v7, v8, v29);
      return 0;
    }
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 48, self, CFSTR("Handler already exists but is of wrong class type"), v7, v8, v29);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v15;
    v31[1] = &unk_24D3B33B0;
    v30[1] = CFSTR("Line");
    v30[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v16;
    v30[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 49);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v17;
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = v31;
    v20 = v30;
  }
  else
  {
    v10 = -[STSCredential type](self->_activeCredential, "type");
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForMerchantPaymentSign]", 42, self, CFSTR("Unsupported credential type %02x"), v11, v12, v10);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v15;
    v33[1] = &unk_24D3B3398;
    v32[1] = CFSTR("Line");
    v32[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v16;
    v32[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 43);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v17;
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = v33;
    v20 = v32;
  }
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 9, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_createHandlerForPeerPaymentSign
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  SignPeerPaymentHandler *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  if (-[STSCredential type](self->_activeCredential, "type") == 1)
  {
    -[STSSessionBase handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v21 = -[SignPeerPaymentHandler initWithParent:]([SignPeerPaymentHandler alloc], "initWithParent:", self);
      -[STSSessionBase setHandler:](self, "setHandler:", v21);

      -[STSSessionBase activateChildSession](self, "activateChildSession");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v25 = (void *)v22;
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 95, self, CFSTR("Handler activation failure: %@"), v23, v24, v22);
      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 97, self, CFSTR("Seting new activeCredential %@ on handler"), v23, v24, (uint64_t)self->_activeCredential);
        -[STSSessionBase handler](self, "handler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActiveCredential:", self->_activeCredential);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          return v25;
      }
      -[STSSessionBase handler](self, "handler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "tearDownWithCompletion:", 0);

      -[STSSessionBase setHandler:](self, "setHandler:", 0);
      return v25;
    }
    -[STSSessionBase handler](self, "handler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

    if ((v6 & 1) != 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 87, self, CFSTR("Using existing handler."), v7, v8, v29);
      return 0;
    }
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 83, self, CFSTR("Handler already exists but is of wrong class type"), v7, v8, v29);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v15;
    v31[1] = &unk_24D3B33E0;
    v30[1] = CFSTR("Line");
    v30[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v16;
    v30[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 84);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v17;
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = v31;
    v20 = v30;
  }
  else
  {
    v10 = -[STSCredential type](self->_activeCredential, "type");
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession _createHandlerForPeerPaymentSign]", 77, self, CFSTR("Unsupported credential type %02x"), v11, v12, v10);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v15;
    v33[1] = &unk_24D3B33C8;
    v32[1] = CFSTR("Line");
    v32[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v16;
    v32[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 78);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v17;
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = v33;
    v20 = v32;
  }
  objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 9, v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  const char *ClassName;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_activity_scope_state_s state;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_2158A9000, "signPeerPayment:authorization:error:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if ((objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    ClassName = object_getClassName(v9);
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession signPeerPayment:authorization:error:]", 115, self, CFSTR("Unsupported request type - %s"), v16, v17, (uint64_t)ClassName);
    if (!a5)
    {
      v14 = 0;
      goto LABEL_10;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = &unk_24D3B33F8;
    v26[1] = CFSTR("Line");
    v26[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v20;
    v26[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 117);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v13, 8, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v14 = 0;
    goto LABEL_9;
  }
  -[STSSigningSession _createHandlerForPeerPaymentSign](self, "_createHandlerForPeerPaymentSign");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[STSSessionBase handler](self, "handler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "signPeerPayment:authorization:error:", v9, v10, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_9;
  }
  v13 = v12;
  if (!a5)
    goto LABEL_7;
  v13 = objc_retainAutorelease(v12);
  v14 = 0;
  *a5 = v13;
LABEL_9:

LABEL_10:
  return v14;
}

- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  const char *ClassName;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_activity_scope_state_s state;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_2158A9000, "signInAppPayment:authorization:error:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if ((objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    ClassName = object_getClassName(v9);
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession signInAppPayment:authorization:error:]", 142, self, CFSTR("Unsupported request type - %s"), v16, v17, (uint64_t)ClassName);
    if (!a5)
    {
      v14 = 0;
      goto LABEL_10;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v26[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = &unk_24D3B3410;
    v26[1] = CFSTR("Line");
    v26[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v20;
    v26[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 144);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v13, 8, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    v14 = 0;
    goto LABEL_9;
  }
  -[STSSigningSession _createHandlerForMerchantPaymentSign](self, "_createHandlerForMerchantPaymentSign");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[STSSessionBase handler](self, "handler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "signInAppPayment:authorization:error:", v9, v10, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    goto LABEL_9;
  }
  v13 = v12;
  if (!a5)
    goto LABEL_7;
  v13 = objc_retainAutorelease(v12);
  v14 = 0;
  *a5 = v13;
LABEL_9:

LABEL_10:
  return v14;
}

- (id)setActiveCredential:(id)a3
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  os_activity_scope_state_s state;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[5];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = _os_activity_create(&dword_2158A9000, "setActiveCredential:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 165, self, CFSTR("%@"), v8, v9, (uint64_t)v6);
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 168, self, CFSTR("New handler will be required, Tearing down current handler."), v11, v12, v45);
  -[STSSessionBase handler](self, "handler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tearDownWithCompletion:", 0);

  -[STSSessionBase setHandler:](self, "setHandler:", 0);
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 172, self, CFSTR("Waiting for Control SE session ready"), v14, v15, v46);
  -[STSSessionBase waitForControlSessionToBeReady:](self, "waitForControlSessionToBeReady:", 1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_4:
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      -[STSSessionBase masterSESession](self, "masterSESession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appletWithIdentifier:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 184, self, CFSTR("Applet is present: applet=%@"), v27, v28, (uint64_t)v26);
LABEL_10:

        objc_storeStrong((id *)&self->_activeCredential, a3);
        v19 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v6, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", 0x24D3A8860);

      objc_msgSend(v6, "identifier");
      v39 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v39;
      if (v38)
      {
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 192, self, CFSTR("Applet is presumed to be present = %@"), v40, v41, v39);

        goto LABEL_10;
      }
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 189, self, CFSTR("Applet not found for identifier = %@"), v40, v41, v39);

      v29 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v31;
      v51[1] = &unk_24D3B3428;
      v50[1] = CFSTR("Line");
      v50[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v32;
      v50[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 190);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v51[3] = v33;
      v34 = (void *)MEMORY[0x24BDBCE70];
      v35 = v51;
      v36 = v50;
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 196, self, CFSTR("Credential did not specify an AID"), v22, v23, v45);
      v29 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v31;
      v49[1] = &unk_24D3B3440;
      v48[1] = CFSTR("Line");
      v48[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v32;
      v48[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 197);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v33;
      v34 = (void *)MEMORY[0x24BDBCE70];
      v35 = v49;
      v36 = v48;
    }
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 8, v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v19 = (void *)v16;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSigningSession setActiveCredential:]", 176, self, CFSTR("Control SE session not ready: %@"), v17, v18, v16);
LABEL_13:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCredential, 0);
}

@end
