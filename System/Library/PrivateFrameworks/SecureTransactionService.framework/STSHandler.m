@implementation STSHandler

- (unsigned)supportedCredentialType
{
  return 0;
}

- (id)nfHardwareManager
{
  STSHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  -[STSHandler nfHwManager](v2, "nfHwManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[STSHandler setNfHwManager:](v2, "setNfHwManager:", v4);

  }
  -[STSHandler nfHwManager](v2, "nfHwManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v6;
}

- (id)setActiveCredential:(id)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler setActiveCredential:]", 35, self, CFSTR("credential=%@"), v7, v8, (uint64_t)v6);
  if (v6
    && (v9 = objc_msgSend(v6, "type"), v9 != -[STSHandler supportedCredentialType](self, "supportedCredentialType")))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler setActiveCredential:]", 37, self, CFSTR("Invalid credential type"), v10, v11, v20);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = &unk_24D3B3158;
    v21[1] = CFSTR("Line");
    v21[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    v21[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_storeStrong((id *)&self->_activeSTSCredential, a3);
    v12 = 0;
  }

  return v12;
}

- (id)setActiveCredentials:(id)a3
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler setActiveCredentials:]", 46, self, CFSTR("credentials=%@"), v7, v8, (uint64_t)v6);
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && (v11 = objc_msgSend(v9, "type"), v11 != -[STSHandler supportedCredentialType](self, "supportedCredentialType")))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler setActiveCredentials:]", 50, self, CFSTR("Invalid credential type"), v12, v13, v22);
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = &unk_24D3B3170;
    v23[1] = CFSTR("Line");
    v23[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v18;
    v23[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 51);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 8, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_storeStrong((id *)&self->_activeSTSCredential, v10);
    objc_storeStrong((id *)&self->_activeSTSCredentials, a3);
    v14 = 0;
  }

  return v14;
}

- (void)tearDownWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NFSession *startedNFSession;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHandler tearDownWithCompletion:]", 61, self, &stru_24D3A78C0, v5, v6, v8);
  -[STSHandler _tearDown](self, "_tearDown");
  startedNFSession = self->_startedNFSession;
  if (startedNFSession)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_2158C2E78;
    v9[3] = &unk_24D3A6F80;
    v10 = v4;
    -[NFSession endSessionWithCompletion:](startedNFSession, "endSessionWithCompletion:", v9);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)activateWithHandoffToken:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSData *handoffToken;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSData *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSData *v49;
  _QWORD v50[5];
  NSObject *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[4];
  _QWORD v62[4];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[4];
  _QWORD v66[6];

  v66[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 75, self, CFSTR("Creating session with token: %@"), v6, v7, (uint64_t)v5);
  handoffToken = self->_handoffToken;
  self->_handoffToken = 0;

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_2158C3640;
  v57 = sub_2158C3650;
  v58 = 0;
  v9 = dispatch_semaphore_create(0);
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_2158C3658;
  v50[3] = &unk_24D3A7330;
  v50[4] = self;
  v52 = &v53;
  v10 = v9;
  v51 = v10;
  -[STSHandler startNFSessionWithCompletion:](self, "startNFSessionWithCompletion:", v50);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 95, self, CFSTR("Activating session with token: %@"), v11, v12, (uint64_t)v5);
    objc_msgSend(v13, "activateWithToken:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v14;
    if (v14)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 98, self, CFSTR("Session switching error=%@"), v15, v16, v14);
      objc_msgSend(v13, "endSession");
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x24BDD1398];
      v64[0] = v19;
      v64[1] = v17;
      v63[1] = v20;
      v63[2] = CFSTR("Line");
      v64[2] = &unk_24D3B31A0;
      v63[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v64[3] = v21;
      v63[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 100);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v64[4] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v46, 10, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      if (v54[5])
      {
        objc_msgSend(v13, "endSession");
        v29 = objc_msgSend((id)v54[5], "code");
        v45 = (void *)MEMORY[0x24BDD1540];
        if (v29 == 50)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC radio disabled");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v30;
          v62[1] = &unk_24D3B31B8;
          v61[1] = CFSTR("Line");
          v61[2] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v62[2] = v31;
          v61[3] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 111);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v62[3] = v32;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "errorWithDomain:code:userInfo:", v48, 18, v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v35;
          v59[1] = *MEMORY[0x24BDD1398];
          v36 = v54[5];
          if (v36)
          {
            v37 = (void *)v54[5];
          }
          else
          {
            v38 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorWithDomain:code:userInfo:", v44, 5, 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v60[1] = v37;
          v60[2] = &unk_24D3B31D0;
          v59[2] = CFSTR("Line");
          v59[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v60[3] = v39;
          v59[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 113);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v60[4] = v40;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 5);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "errorWithDomain:code:userInfo:", v48, 10, v41);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {

          }
        }
        v17 = 0;
        v10 = 0;

      }
      else
      {
        objc_storeStrong((id *)&self->_startedNFSession, v13);
        v34 = (NSData *)v5;
        v17 = 0;
        v10 = 0;
        v24 = 0;
        v49 = self->_handoffToken;
        self->_handoffToken = v34;

      }
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHandler activateWithHandoffToken:]", 91, self, CFSTR("Failed to start session."), v11, v12, v43);
    v25 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unknown Error");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v47;
    v66[1] = &unk_24D3B3188;
    v65[1] = CFSTR("Line");
    v65[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v26;
    v65[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 92);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v17, 5, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v53, 8);

  return v24;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 1;
}

- (void)_tearDown
{
  NSData *handoffToken;

  handoffToken = self->_handoffToken;
  self->_handoffToken = 0;

}

- (id)startNFSessionWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  objc_msgSend(v6, "stringWithUTF8String:", "STS.fwk");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = &unk_24D3B31E8;
  v15[1] = CFSTR("Line");
  v15[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  v15[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 132);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v8, 10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v7, v13);

  return 0;
}

- (STSCredential)activeSTSCredential
{
  return self->_activeSTSCredential;
}

- (NSArray)activeSTSCredentials
{
  return self->_activeSTSCredentials;
}

- (NSData)handoffToken
{
  return self->_handoffToken;
}

- (void)setHandoffToken:(id)a3
{
  objc_storeStrong((id *)&self->_handoffToken, a3);
}

- (STSHardwareManagerWrapper)nfHwManager
{
  return self->_nfHwManager;
}

- (void)setNfHwManager:(id)a3
{
  objc_storeStrong((id *)&self->_nfHwManager, a3);
}

- (NFSession)startedNFSession
{
  return self->_startedNFSession;
}

- (void)setStartedNFSession:(id)a3
{
  objc_storeStrong((id *)&self->_startedNFSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedNFSession, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_activeSTSCredentials, 0);
  objc_storeStrong((id *)&self->_activeSTSCredential, 0);
}

@end
