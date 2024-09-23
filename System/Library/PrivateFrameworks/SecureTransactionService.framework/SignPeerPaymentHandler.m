@implementation SignPeerPaymentHandler

- (SignPeerPaymentHandler)initWithParent:(id)a3
{
  id v4;
  SignPeerPaymentHandler *v5;
  SignPeerPaymentHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignPeerPaymentHandler;
  v5 = -[SignPeerPaymentHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parent, v4);

  return v6;
}

- (unsigned)supportedCredentialType
{
  return 1;
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
  v9[2] = sub_2158B6AE4;
  v9[3] = &unk_24D3A7260;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "startPeerPaymentSession:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)signPeerPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  NFPeerPaymentSession *nfPeerPaymentSession;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[6];

  v60[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[STSHandler activeSTSCredential](self, "activeSTSCredential");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", 0x24D3A8860);

    if ((v16 & 1) != 0)
    {
      if (self->_nfPeerPaymentSession)
      {
        v19 = "is";
        if (!v10)
          v19 = "is not";
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 81, self, CFSTR("Authorization %s available"), v17, v18, (uint64_t)v19);
        -[STSHandler activeSTSCredential](self, "activeSTSCredential");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "toNFPeerPaymentRequest:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        nfPeerPaymentSession = self->_nfPeerPaymentSession;
        v52 = 0;
        -[NFPeerPaymentSession performPeerPayment:request:error:](nfPeerPaymentSession, "performPeerPayment:request:error:", v10, v22, &v52);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v52;
        v28 = v25;
        if (!v25)
        {
          a5 = -[STSPeerPaymentResponse initFromNFPeerPaymentResponse:]([STSPeerPaymentResponse alloc], "initFromNFPeerPaymentResponse:", v24);
          goto LABEL_18;
        }
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 89, self, CFSTR("start transaction failed = %@"), v26, v27, (uint64_t)v25);
        if (!a5)
        {
LABEL_18:

          goto LABEL_19;
        }
        v29 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *MEMORY[0x24BDD1398];
        v54[0] = v51;
        v54[1] = v28;
        v53[1] = v30;
        v53[2] = CFSTR("Line");
        v54[2] = &unk_24D3B2D80;
        v53[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v54[3] = v31;
        v53[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 91);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v54[4] = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v50, 10, v33);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
        a5 = 0;
        goto LABEL_18;
      }
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 74, self, CFSTR("NF session does not exist!"), v17, v18, v49);
      if (a5)
      {
        v34 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v22;
        v56[1] = &unk_24D3B2D68;
        v55[1] = CFSTR("Line");
        v55[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v56[2] = v24;
        v55[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 76);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v56[3] = v35;
        v36 = (void *)MEMORY[0x24BDBCE70];
        v37 = v56;
        v38 = v55;
        goto LABEL_15;
      }
    }
    else
    {
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 65, self, CFSTR("AID is not supported by Peer Payment handler - %@"), v41, v42, (uint64_t)v40);

      if (a5)
      {
        v43 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v22;
        v58[1] = &unk_24D3B2D50;
        v57[1] = CFSTR("Line");
        v57[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v58[2] = v24;
        v57[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 67);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v58[3] = v35;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v43;
        v46 = v28;
        v47 = 8;
LABEL_16:
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v46, v47, v44);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignPeerPaymentHandler signPeerPayment:authorization:error:]", 57, self, CFSTR("Credential does not exist!"), v12, v13, v49);
    if (a5)
    {
      v34 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v22;
      v60[1] = &unk_24D3B2D38;
      v59[1] = CFSTR("Line");
      v59[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2] = v24;
      v59[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 59);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v60[3] = v35;
      v36 = (void *)MEMORY[0x24BDBCE70];
      v37 = v60;
      v38 = v59;
LABEL_15:
      objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v34;
      v46 = v28;
      v47 = 9;
      goto LABEL_16;
    }
  }
LABEL_19:

  return a5;
}

- (STSSigningSession)parent
{
  return (STSSigningSession *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nfPeerPaymentSession, 0);
}

@end
