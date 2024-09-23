@implementation PaymentHandler

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
  v9[2] = sub_2158BF804;
  v9[3] = &unk_24D3A7568;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "startLoyaltyAndContactlessPaymentSession:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)supportedCredentialType
{
  return 1;
}

- (id)setActiveCredential:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NFLoyaltyAndPaymentSession *nfSession;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NFLoyaltyAndPaymentSession *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  objc_super v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PaymentHandler;
  -[STSHandler setActiveCredential:](&v47, sel_setActiveCredential_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_13;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_13;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hasPrefix:", 0x24D3A8820))
  {
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPrefix:", 0x24D3A8840);

    if (v10)
      goto LABEL_6;
    v21 = 56;
    nfSession = self->_nfSession;
    objc_msgSend(v5, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFLoyaltyAndPaymentSession appletWithIdentifier:](nfSession, "appletWithIdentifier:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 68, self, CFSTR("applet %@"), v24, v25, (uint64_t)v15);
      v26 = self->_nfSession;
      v46 = v6;
      v27 = -[NFLoyaltyAndPaymentSession setActivePaymentApplet:error:](v26, "setActivePaymentApplet:error:", v15, &v46);
      v28 = v46;

      if ((v27 & 1) != 0)
      {
LABEL_16:
        v20 = v28;
        v6 = v20;
        goto LABEL_17;
      }
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 70, self, CFSTR("set active applet failed = %@"), v29, v30, (uint64_t)v28);
      v45 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v32;
      v50[1] = *MEMORY[0x24BDD1398];
      v33 = v28;
      if (!v28)
      {
        v34 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", v21, 5, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v51[1] = v33;
      v51[2] = &unk_24D3B2FC0;
      v50[2] = CFSTR("Line");
      v50[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v51[3] = v44;
      v50[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 71);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51[4] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", v31, 10, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      if (v28)
      {
LABEL_15:

        v28 = (id)v37;
        goto LABEL_16;
      }
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    objc_msgSend(v5, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 74, self, CFSTR("applet not found for identifier = %@"), v39, v40, (uint64_t)v38);

    v41 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v32;
    v49[1] = &unk_24D3B2FD8;
    v48[1] = CFSTR("Line");
    v48[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v21 = objc_claimAutoreleasedReturnValue();
    v49[2] = v21;
    v48[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 75);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "errorWithDomain:code:userInfo:", v31, 8, v42);
    v37 = objc_claimAutoreleasedReturnValue();

    v15 = 0;
    goto LABEL_14;
  }

LABEL_6:
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 60, self, CFSTR("AID is not supported by payment handler - %@"), v12, v13, (uint64_t)v11);

  v14 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v16;
  v53[1] = &unk_24D3B2FA8;
  v52[1] = CFSTR("Line");
  v52[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v17;
  v52[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 61);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 8, v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v20;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NFLoyaltyAndPaymentSession *v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NFLoyaltyAndPaymentSession *nfSession;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  objc_super v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[4];
  _QWORD v51[6];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PaymentHandler;
  -[STSTransactionHandler startTransactionWithAuthorization:options:](&v45, sel_startTransactionWithAuthorization_options_, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nfSession)
  {
    if ((a4 & 1) != 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 91, self, CFSTR("deferred auth: %@"), v8, v9, (uint64_t)v7);
      nfSession = self->_nfSession;
      v44 = v10;
      v33 = -[NFLoyaltyAndPaymentSession startDeferredCardEmulation:authorization:error:](nfSession, "startDeferredCardEmulation:authorization:error:", 1, v7, &v44);
      v13 = v44;

      if ((v33 & 1) == 0)
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 95, self, CFSTR("start deferred transaction failed = %@"), v34, v35, (uint64_t)v13);
        v36 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v18;
        v48[1] = *MEMORY[0x24BDD1398];
        v19 = v13;
        if (!v13)
        {
          v37 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v49[1] = v19;
        v49[2] = &unk_24D3B3008;
        v48[2] = CFSTR("Line");
        v48[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v49[3] = v21;
        v48[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 96);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v49[4] = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 5);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v17, 10, v39);
        v24 = objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 100, self, CFSTR("auth: %@"), v8, v9, (uint64_t)v7);
      v11 = self->_nfSession;
      v43 = v10;
      v12 = -[NFLoyaltyAndPaymentSession startCardEmulation:authorization:error:](v11, "startCardEmulation:authorization:error:", 1, v7, &v43);
      v13 = v43;

      if ((v12 & 1) == 0)
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 102, self, CFSTR("start transaction failed = %@"), v14, v15, (uint64_t)v13);
        v16 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v18;
        v46[1] = *MEMORY[0x24BDD1398];
        v19 = v13;
        if (!v13)
        {
          v20 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v47[1] = v19;
        v47[2] = &unk_24D3B3020;
        v46[2] = CFSTR("Line");
        v46[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v47[3] = v21;
        v46[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 103);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v47[4] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 10, v23);
        v24 = objc_claimAutoreleasedReturnValue();

LABEL_12:
        if (!v13)
        {

        }
        v13 = (id)v24;
      }
    }
    v31 = v13;
    v10 = v31;
    goto LABEL_16;
  }
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 85, self, CFSTR("NF session does not exist!"), v8, v9, v41);
  v25 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v27;
  v51[1] = &unk_24D3B2FF0;
  v50[1] = CFSTR("Line");
  v50[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v28;
  v50[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 86);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 9, v30);
  v31 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v31;
}

- (id)stopTransaction
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NFLoyaltyAndPaymentSession *nfSession;
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
  v19.super_class = (Class)PaymentHandler;
  -[STSTransactionHandler stopTransaction](&v19, sel_stopTransaction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nfSession)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[PaymentHandler stopTransaction]", 118, self, &stru_24D3A78C0, v4, v5, v17);
    nfSession = self->_nfSession;
    v18 = v6;
    -[NFLoyaltyAndPaymentSession stopCardEmulation:](nfSession, "stopCardEmulation:", &v18);
    v8 = v18;

    v9 = v8;
    v6 = v9;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler stopTransaction]", 114, self, CFSTR("NF session does not exist!"), v4, v5, v17);
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = &unk_24D3B3038;
    v20[1] = CFSTR("Line");
    v20[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 115);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 9, v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)loyaltyAndPaymentSession:(id)a3 didDetectField:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  __CFString *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  if (a4)
    v8 = CFSTR("Field On");
  else
    v8 = CFSTR("Field Off");
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didDetectField:]", 252, self, v8, v4, v5, v9);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireFieldDetectEvent:", v6);

}

- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didEnterFieldWithNotification:]", 258, self, CFSTR("%@"), v6, v7, (uint64_t)v5);
  sub_2158CEFF0(v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[STSTransactionHandler parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireFieldNotificationEvent:", v9);

}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didSelectApplet:]", 264, self, CFSTR("SELECT: %@"), v4, v5, (uint64_t)a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didExpireTransactionForApplet:]", 276, self, CFSTR("EXPIRED: %@"), v4, v5, (uint64_t)a4);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireDidExpireTransaction:", 1);

}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  STSTransactionStartEvent *v8;
  void *v9;
  void *v10;
  STSTransactionStartEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didStartTransaction:]", 282, self, CFSTR("START: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionStartEvent alloc];
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STSTransactionStartEvent initWithCredential:andNearFieldStartEvent:](v8, "initWithCredential:andNearFieldStartEvent:", v9, v5);

  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionStartEvent:", v11);

}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  STSTransactionEndEvent *v8;
  void *v9;
  void *v10;
  STSTransactionEndEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didEndTransaction:]", 290, self, CFSTR("END: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionEndEvent alloc];
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[STSTransactionEndEvent initWithCredential:andNearFieldEndEvent:](v8, "initWithCredential:andNearFieldEndEvent:", v9, v5);

  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionEndEvent:", v11);

}

- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;
  id v9;

  v6 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didFailDeferredAuthorization:]", 297, self, CFSTR("Failed deferred authorization"), v4, v5, v8);
  -[STSTransactionHandler parent](self, "parent");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fireDidFailDeferredAuth:", v6);

}

- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSessionHasPendingServerRequest:]", 302, self, CFSTR("Pending priority server request"), v3, v4, v6);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireHasPendingServerRequest:", 1);

}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didSelectValueAddedService:]", 307, self, CFSTR("VAS selected = %d"), v4, v5, a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSArray *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  PaymentHandler *v29;
  uint64_t v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didPerformValueAddedServiceTransactions:]", 313, self, CFSTR("HCE transactions: %@"), v6, v7, (uint64_t)v5);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    v28 = *(_QWORD *)v38;
    v29 = self;
    do
    {
      v11 = 0;
      v30 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v14 = self->_vasCredentials;
          v15 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v34;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v13, "merchantId");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "merchantId");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqualToData:", v20);

                if (v21)
                {
                  v15 = v18;
                  goto LABEL_18;
                }
              }
              v15 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v15)
                continue;
              break;
            }
LABEL_18:
            v10 = v28;
            self = v29;
            v9 = v30;
          }

          objc_msgSend(v13, "asDictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[STSVASTransaction vasTransactionForCredential:withDictionary:](STSVASTransaction, "vasTransactionForCredential:withDictionary:", v15, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "addObject:", v26);
        }
        else
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didPerformValueAddedServiceTransactions:]", 320, self, CFSTR("Wrong transaction class: %@"), v23, v24, (uint64_t)v13);
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  -[STSTransactionHandler parent](self, "parent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fireDidPerformAuxiliaryTransactions:", v31);

}

- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didFelicaStateChange:]", 345, self, CFSTR("NOT USED Felica State: %@"), v4, v5, (uint64_t)a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
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
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didExpressModeStateChange:withObject:]", 351, self, CFSTR("%d - %@"), v8, v9, v5);
  v10 = 0;
  if ((v5 - 1) <= 8)
    v10 = dword_2158DB890[(int)v5 - 1];
  v12 = -[STSExpressEventInfoWithDetail initWithState:detail:]([STSExpressEventInfoWithDetail alloc], "initWithState:detail:", v10, v7);

  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireExpressModeStateChangeWithInfo:", v12);

}

- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSessionDidReceiveActivityTimeout:result:]", 359, self, CFSTR("Activity Timeout : %@"), v6, v7, (uint64_t)v5);
  -[STSTransactionHandler parent](self, "parent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireDidReceiveActivityTimeout:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasCredentials, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end
