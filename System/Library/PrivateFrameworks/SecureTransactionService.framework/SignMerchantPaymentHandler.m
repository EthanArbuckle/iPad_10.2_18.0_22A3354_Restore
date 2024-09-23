@implementation SignMerchantPaymentHandler

- (SignMerchantPaymentHandler)initWithParent:(id)a3
{
  id v4;
  SignMerchantPaymentHandler *v5;
  SignMerchantPaymentHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SignMerchantPaymentHandler;
  v5 = -[SignMerchantPaymentHandler init](&v8, sel_init);
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
  v9[2] = sub_2158CA9A0;
  v9[3] = &unk_24D3A7680;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "startECommercePaymentSession:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)signInAppPayment:(id)a3 authorization:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NFECommercePaymentSession *nfECommerceSession;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  const char *ClassName;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[6];

  v56[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 55, self, CFSTR("Credential does not exist!"), v12, v13, v43);
    if (a5)
    {
      v31 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v56[0] = v17;
      v56[1] = &unk_24D3B3458;
      v55[1] = CFSTR("Line");
      v55[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v19;
      v55[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 57);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v56[3] = v20;
      v32 = (void *)MEMORY[0x24BDBCE70];
      v33 = v56;
      v34 = v55;
LABEL_16:
      objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v31;
      v40 = v26;
      v41 = 9;
      goto LABEL_17;
    }
LABEL_19:
    v30 = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    if (self->_nfECommerceSession)
    {
      v16 = "is";
      if (!v10)
        v16 = "is not";
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 76, self, CFSTR("Authorization %s available"), v14, v15, (uint64_t)v16);
      v17 = v9;
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "toNFECommercePaymentRequest:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      nfECommerceSession = self->_nfECommerceSession;
      v48 = 0;
      -[NFECommercePaymentSession performECommercePayment:request:error:](nfECommerceSession, "performECommercePayment:request:error:", v10, v20, &v48);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v48;
      v26 = v23;
      if (v23)
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 86, self, CFSTR("start transaction failed = %@"), v24, v25, (uint64_t)v23);
        if (a5)
        {
          v47 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *MEMORY[0x24BDD1398];
          v50[0] = v46;
          v50[1] = v26;
          v49[1] = v27;
          v49[2] = CFSTR("Line");
          v50[2] = &unk_24D3B34A0;
          v49[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v50[3] = v44;
          v49[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 88);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50[4] = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "errorWithDomain:code:userInfo:", v45, 10, v29);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v30 = 0;
      }
      else
      {
        v30 = -[STSMerchantPaymentResponse initFromNFECommercePaymentResponse:]([STSMerchantPaymentResponse alloc], "initFromNFECommercePaymentResponse:", v22);
      }
      goto LABEL_18;
    }
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 69, self, CFSTR("NF session does not exist!"), v14, v15, v43);
    if (a5)
    {
      v31 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v52[0] = v17;
      v52[1] = &unk_24D3B3488;
      v51[1] = CFSTR("Line");
      v51[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2] = v19;
      v51[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 71);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52[3] = v20;
      v32 = (void *)MEMORY[0x24BDBCE70];
      v33 = v52;
      v34 = v51;
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  ClassName = object_getClassName(v9);
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[SignMerchantPaymentHandler signInAppPayment:authorization:error:]", 61, self, CFSTR("Class %s is not supported!"), v36, v37, (uint64_t)ClassName);
  if (!a5)
    goto LABEL_19;
  v38 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v54[0] = v17;
  v54[1] = &unk_24D3B3470;
  v53[1] = CFSTR("Line");
  v53[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v19;
  v53[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 63);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v40 = v26;
  v41 = 8;
LABEL_17:
  objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, v41, v22);
  v30 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_20:
  return v30;
}

- (STSSigningSession)parent
{
  return (STSSigningSession *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nfECommerceSession, 0);
}

@end
