@implementation STSSession

- (void)generateHandoverRequestForQRCodeWithConfiguration:(unint64_t)a3 responseHandler:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  uint64_t v13;
  ISO18013Handler *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NFSecureElementProxyListener *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[5];
  void (**v47)(id, _QWORD, void *);
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[6];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a4;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 64, self, CFSTR("dataRetrievalType = 0x%x"), v8, v9, a3);
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 67, self, CFSTR("Invalid ISO18013 configuration"), v12, v13, v45);
    v32 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    v50[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v19;
    v51[1] = &unk_24D3B2D98;
    v50[1] = CFSTR("Line");
    v50[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v29;
    v50[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 68);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v17, 9, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v35);

    goto LABEL_13;
  }
  v14 = [ISO18013Handler alloc];
  -[STSSessionBase callbackQueue](self, "callbackQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {

    goto LABEL_12;
  }
  v17 = (id *)sub_2158B94A4(v14, (uint64_t)self, v14, 1, v15);

  if (!v17)
  {
LABEL_12:
    v40 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v29;
    v49[1] = &unk_24D3B2DB0;
    v48[1] = CFSTR("Line");
    v48[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v41;
    v48[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 76);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", v19, 10, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v44);

    v17 = 0;
    goto LABEL_13;
  }
  -[STSSessionBase handler](self, "handler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeSTSCredential");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[STSSessionBase handler](self, "handler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handoffToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHandoffToken:", v21);

  -[STSSessionBase handler](self, "handler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tearDownWithCompletion:", 0);

  -[STSSessionBase setHandler:](self, "setHandler:", v17);
  -[STSSessionBase handler](self, "handler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "setActiveCredential:", v19);

  -[STSSession setSendRequestCompletion:](self, "setSendRequestCompletion:", v7);
  v25 = -[NFSecureElementProxyListener initWithSTSSession:]([NFSecureElementProxyListener alloc], "initWithSTSSession:", self);
  -[STSSession setSeProxyListener:](self, "setSeProxyListener:", v25);

  v26 = v17[9];
  -[STSSession seProxyListener](self, "seProxyListener");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSessionBase callbackQueue](self, "callbackQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "startSEProxyListener:parameters:workQueue:", v27, MEMORY[0x24BDBD1B8], v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 113, self, CFSTR("SE proxy listener start error=%{public}@"), v30, v31, (uint64_t)v29);
    v7[2](v7, 0, v29);
  }
  else
  {
    v36 = a3 & 7 | 0x40;
    v37 = v17[9];
    objc_msgSend(v37, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", v36, 0, self);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v7[2](v7, 0, v38);

    }
    else
    {
      v39 = v17[9];
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = sub_2158B7D20;
      v46[3] = &unk_24D3A7288;
      v46[4] = self;
      v47 = v7;
      objc_msgSend(v39, "generateQRCodeCHRequestAndStartACWithQueue:responseHandler:", 0, v46);

    }
    v29 = 0;
  }
LABEL_13:

}

- (void)iso18013DataRetrievalCompleted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) iso18013DataRetrievalCompleted]", 140, self, &stru_24D3A78C0, v2, v3, v4);
}

- (void)relinquishSEProxy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) relinquishSEProxy]", 144, self, &stru_24D3A78C0, v2, v3, v9);
  -[STSSessionBase handler](self, "handler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 72);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "stopSEProxyListener");

  -[STSSession setSeProxyListener:](self, "setSeProxyListener:", 0);
}

- (void)restartNFCReaderDiscovery
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) restartNFCReaderDiscovery]", 152, self, &stru_24D3A78C0, v2, v3, v4);
}

- (void)reqlinquishNFCReaderProxy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) reqlinquishNFCReaderProxy]", 156, self, &stru_24D3A78C0, v2, v3, v4);
}

- (void)handoverSelected:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) handoverSelected:]", 160, self, &stru_24D3A78C0, v3, v4, v5);
}

- (void)_activateInvalidationHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateInvalidationHandler:]", 165, self, CFSTR("error=%@"), v5, v6, (uint64_t)v4);
  objc_initWeak(&location, self);
  -[STSSessionBase callbackQueue](self, "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158B7FC8;
  block[3] = &unk_24D3A71E8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_activateSendRequestCompletion:(id)a3 sessionTerminationRequested:(BOOL)a4 error:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateSendRequestCompletion:sessionTerminationRequested:error:]", 180, self, CFSTR("error=%@"), v5, v6, (uint64_t)a5);
}

- (void)_activateOnConnectCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateOnConnectCompletion]", 184, self, &stru_24D3A78C0, v2, v3, v4);
}

- (id)_translateXPCClientNotificationStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id result;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
      v4 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Cancelled");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v6;
      v34[1] = &unk_24D3B2DC8;
      v33[1] = CFSTR("Line");
      v33[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v7;
      v33[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 194);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v34[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      v11 = v5;
      v12 = 13;
      goto LABEL_10;
    case 3uLL:
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Timeout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v6;
      v32[1] = &unk_24D3B2DE0;
      v31[1] = CFSTR("Line");
      v31[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v7;
      v31[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 196);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = v5;
      v12 = 4;
      goto LABEL_10;
    case 5uLL:
      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "No alernative carrier available");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v6;
      v30[1] = &unk_24D3B2DF8;
      v29[1] = CFSTR("Line");
      v29[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v7;
      v29[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 198);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = v5;
      v12 = 14;
      goto LABEL_10;
    case 6uLL:
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Wifi power on");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v6;
      v28[1] = &unk_24D3B2E10;
      v27[1] = CFSTR("Line");
      v27[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v7;
      v27[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 200);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = v5;
      v12 = 15;
      goto LABEL_10;
    case 7uLL:
      v17 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Requires Bluetooth power on");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v6;
      v26[1] = &unk_24D3B2E28;
      v25[1] = CFSTR("Line");
      v25[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v7;
      v25[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 202);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = v5;
      v12 = 16;
      goto LABEL_10;
    case 8uLL:
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Alternative Carrier transmission error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v6;
      v24[1] = &unk_24D3B2E40;
      v23[1] = CFSTR("Line");
      v23[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v7;
      v23[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 204);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      v11 = v5;
      v12 = 19;
      goto LABEL_10;
    case 9uLL:
      v19 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      v22[1] = &unk_24D3B2E58;
      v21[1] = CFSTR("Line");
      v21[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v7;
      v21[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 206);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      v11 = v5;
      v12 = 9;
LABEL_10:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      result = v20;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)fireFieldDetectEvent:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "stsSession:didDetectField:", self, v3);

}

- (void)fireFieldNotificationEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didReceiveFieldNotification:", self, v5);

}

- (void)fireSessionDidConsumeAuthorizationEvent
{
  id v3;

  -[STSSessionBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stsSessionDidConsumeAuthorization:", self);

}

- (void)fireTransactionStartEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didStartTransaction:", self, v5);

}

- (void)fireTransactionEndEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didEndTransaction:", self, v5);

}

- (void)fireHasPendingServerRequest:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "stsSession:hasPendingServerRequest:", self, v3);

}

- (void)fireDidFailDeferredAuth:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "stsSession:didFailDeferredAuth:", self, v3);

}

- (void)fireExpressModeStateChangeWithInfo:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v8;
    v6 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "detail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stsSession:didChangeExpressModeState:withObject:", self, v6, v7);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didChangeExpressModeWithInfo:", self, v8);

}

- (void)fireDidReceiveActivityTimeout:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didReceiveActivityTimeout:", self, v5);

}

- (void)fireDidPerformAuxiliaryTransactions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didPerformAuxiliaryTransactions:", self, v5);

}

- (void)fireDidExpireTransaction:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "stsSession:didExpireTransaction:", self, v3);

}

- (void)fireSessionEndEvent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[STSSessionBase hasStartedWithDelegate](self, "hasStartedWithDelegate"))
  {
    -[STSSessionBase delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "stsSession:didEnd:", self, v5);

  }
}

- (void)fireDidReceive18013Requests:(id)a3 readerAuthInfo:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[STSSessionBase delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "stsSession:didReceive18013Requests:", self, v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "stsSession:didReceive18013Requests:readerAuthInfo:", self, v8, v6);

}

- (void)fireDidReceivePassthroughMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:didReceivePassthroughMessage:", self, v5);

}

- (void)fireDigitalCarKeyEventPayload:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSSessionBase delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "stsSession:digitalCarKeyEventPayload:", self, v5);

}

- (void)fireRequestHandoverConfirmation
{
  id v3;

  -[STSSessionBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "stsSessionRequestHandoffConfirmation:", self);

}

- (id)setAuxiliaryCredentials:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  PaymentHandler *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  os_activity_scope_state_s state;
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "setAuxiliaryCredentials:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 23, self, CFSTR("%@"), v7, v8, (uint64_t)v5);
  -[STSSessionBase handler](self, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[STSSessionBase handler](self, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportedCredentialType");

    if (v13 == 1)
      goto LABEL_6;
    -[STSSessionBase handler](self, "handler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activeSTSCredential");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 33, self, CFSTR("new handler required, switching credential from %@ to STSCredentialTypeApplet"), v16, v17, (uint64_t)v15);

    v18 = -[STSTransactionHandler initWithParent:]([PaymentHandler alloc], "initWithParent:", self);
    -[STSSessionBase handler](self, "handler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tearDownWithCompletion:", 0);

  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 27, self, CFSTR("Creating initial handler"), v10, v11, v36);
    v18 = -[STSTransactionHandler initWithParent:]([PaymentHandler alloc], "initWithParent:", self);
  }
  -[STSSessionBase setHandler:](self, "setHandler:", v18);

LABEL_6:
  -[STSSessionBase handler](self, "handler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[STSSessionBase activateChildSession](self, "activateChildSession");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v26 = (void *)v23;
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 43, self, CFSTR("Handler activation failure: %@"), v24, v25, v23);
      v27 = v26;
      v28 = v27;
    }
    else
    {
      -[STSSessionBase handler](self, "handler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2158C07A8((uint64_t)v34, v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 50, self, CFSTR("Failed to create payment handler"), v21, v22, v36);
    v29 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v30;
    v39[1] = &unk_24D3B3590;
    v38[1] = CFSTR("Line");
    v38[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v31;
    v38[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 51);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v27, 11, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

- (BOOL)supportsSecureRanging
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  -[STSSessionBase handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STSSessionBase handler](self, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[STSSessionBase handler](self, "handler");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v17 = sub_2158CC1D4(v8, v9, v10, v11, v12, v13, v14, v15);

      return v17;
    }
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) supportsSecureRanging]", 37, self, CFSTR("Invalid handler - %@"), v21, v22, (uint64_t)v20);

  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) supportsSecureRanging]", 34, self, CFSTR("No handler available"), v4, v5, v23);
  }
  return 0;
}

- (id)rkeSendPassthroughMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "rkeSendPassthroughMessage:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendPassthroughMessage:]", 49, self, CFSTR("No handler available"), v8, v9, v29);
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    v34[1] = &unk_24D3B35F0;
    v33[1] = CFSTR("Line");
    v33[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v17;
    v33[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 50);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    v21 = v13;
    v22 = 9;
LABEL_6:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((isKindOfClass & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendPassthroughMessage:]", 52, self, CFSTR("Invalid handler - %@"), v25, v26, (uint64_t)v24);

    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = &unk_24D3B3608;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    v31[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 53);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    v21 = v13;
    v22 = 11;
    goto LABEL_6;
  }
  sub_2158CC394(v12, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v14;
}

- (void)rkeSendFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void (**v17)(void *, _QWORD, void *);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char isKindOfClass;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  _QWORD aBlock[5];
  id v46;
  os_activity_scope_state_s state;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[6];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = _os_activity_create(&dword_2158A9000, "rkeSendFunction:action:authorization:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2158CFE40;
  aBlock[3] = &unk_24D3A77F8;
  aBlock[4] = self;
  v16 = v14;
  v46 = v16;
  v17 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  -[STSSessionBase handler](self, "handler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendFunction:action:authorization:completion:]", 74, self, CFSTR("No handler available"), v19, v20, v42);
    v25 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v26;
    v51[1] = &unk_24D3B3620;
    v50[1] = CFSTR("Line");
    v50[2] = CFSTR("Method");
    v44 = v13;
    v27 = v12;
    v28 = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v29;
    v50[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 75);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v24, 9, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v32);

    v11 = v28;
    v12 = v27;
LABEL_7:
    v13 = v44;

    goto LABEL_8;
  }
  -[STSSessionBase handler](self, "handler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if ((isKindOfClass & 1) == 0)
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendFunction:action:authorization:completion:]", 77, self, CFSTR("Invalid handler - %@"), v35, v36, (uint64_t)v34);

    v43 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v26;
    v49[1] = &unk_24D3B3638;
    v48[1] = CFSTR("Line");
    v48[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v44 = v13;
    v37 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v38;
    v48[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 78);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", v24, 11, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v41);

    v11 = v37;
    goto LABEL_7;
  }
  if (v23)
    objc_msgSend(*(id *)(v23 + 56), "sendRKEFunction:action:authorization:completion:", v11, v12, v13, v17);
LABEL_8:

}

- (id)rkeCancelFunction:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "rkeCancelFunction:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeCancelFunction:]", 89, self, CFSTR("No handler available"), v8, v9, v29);
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    v34[1] = &unk_24D3B3650;
    v33[1] = CFSTR("Line");
    v33[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v17;
    v33[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 90);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    v21 = v13;
    v22 = 9;
LABEL_6:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v12 = (id *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((isKindOfClass & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeCancelFunction:]", 92, self, CFSTR("Invalid handler - %@"), v25, v26, (uint64_t)v24);

    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = &unk_24D3B3668;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    v31[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 93);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    v21 = v13;
    v22 = 11;
    goto LABEL_6;
  }
  sub_2158CC7DC(v12, (uint64_t)v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v14;
}

- (id)rkePauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  os_activity_scope_state_s state;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_2158A9000, "rkePauseRangingForReaderIdentifier:durationInSec:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkePauseRangingForReaderIdentifier:durationInSec:]", 105, self, CFSTR("No handler available"), v11, v12, v32);
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    v37[1] = &unk_24D3B3680;
    v36[1] = CFSTR("Line");
    v36[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v20;
    v36[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 106);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    v24 = v16;
    v25 = 9;
LABEL_6:
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[STSSessionBase handler](self, "handler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((isKindOfClass & 1) == 0)
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkePauseRangingForReaderIdentifier:durationInSec:]", 108, self, CFSTR("Invalid handler - %@"), v28, v29, (uint64_t)v27);

    v30 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v19;
    v35[1] = &unk_24D3B3698;
    v34[1] = CFSTR("Line");
    v34[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v20;
    v34[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 109);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30;
    v24 = v16;
    v25 = 11;
    goto LABEL_6;
  }
  sub_2158CC808(v15, (uint64_t)v7, (uint64_t)v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v17;
}

- (id)rkeResumeRangingForReaderIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  os_activity_scope_state_s state;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "rkeResumeRangingForReaderIdentifier:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeResumeRangingForReaderIdentifier:]", 120, self, CFSTR("No handler available"), v8, v9, v29);
    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    v34[1] = &unk_24D3B36B0;
    v33[1] = CFSTR("Line");
    v33[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v17;
    v33[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 121);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    v21 = v13;
    v22 = 9;
LABEL_6:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((isKindOfClass & 1) == 0)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeResumeRangingForReaderIdentifier:]", 123, self, CFSTR("Invalid handler - %@"), v25, v26, (uint64_t)v24);

    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = &unk_24D3B36C8;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    v31[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 124);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;
    v21 = v13;
    v22 = 11;
    goto LABEL_6;
  }
  sub_2158CC834(v12, (uint64_t)v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v14;
}

- (id)rkeGetVehicleReports:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  os_activity_scope_state_s state;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v6 = _os_activity_create(&dword_2158A9000, "rkeGetVehicleReports:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[STSSessionBase handler](self, "handler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[STSSessionBase handler](self, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((isKindOfClass & 1) != 0)
    {
      sub_2158CC228(v12, (uint64_t)a3);
      a3 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      return a3;
    }
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeGetVehicleReports:]", 141, self, CFSTR("Invalid handler - %@"), v24, v25, (uint64_t)v23);

    if (a3)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v15;
      v31[1] = &unk_24D3B36F8;
      v30[1] = CFSTR("Line");
      v30[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v16;
      v30[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 143);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v26;
      v20 = v13;
      v21 = 11;
      goto LABEL_8;
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeGetVehicleReports:]", 135, self, CFSTR("No handler available"), v8, v9, v28);
    if (a3)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v15;
      v33[1] = &unk_24D3B36E0;
      v32[1] = CFSTR("Line");
      v32[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v16;
      v32[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 137);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v14;
      v20 = v13;
      v21 = 9;
LABEL_8:
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
      goto LABEL_9;
    }
  }
  return a3;
}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5
{
  void *v5;
  STSDCKAssertion *v6;

  sub_2158CCEF0((uint64_t)DigitalCarKeyHandler, a3, a4, (const __CFString **)a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[STSDCKAssertion initWithAssertion:]([STSDCKAssertion alloc], "initWithAssertion:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)createHandlerForCredential:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  ISO18013Handler *v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;
  ISO18013HybridHandler *v13;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0u:
      v5 = objc_msgSend(v4, "type");
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession createHandlerForCredential:]", 42, self, CFSTR("Unsupported credential type %02x"), v6, v7, v5);
      goto LABEL_3;
    case 1u:
      v12 = PaymentHandler;
      goto LABEL_9;
    case 2u:
      v9 = [ISO18013Handler alloc];
      -[STSSessionBase callbackQueue](self, "callbackQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_15;
      v11 = sub_2158B94A4(v9, (uint64_t)self, v9, 0, v10);
      goto LABEL_12;
    case 3u:
      v12 = UnifiedAccessHandler;
      goto LABEL_9;
    case 4u:
      v12 = DigitalCarKeyHandler;
LABEL_9:
      v8 = (void *)objc_msgSend([v12 alloc], "initWithParent:", self);
      goto LABEL_14;
    case 5u:
      v13 = [ISO18013HybridHandler alloc];
      -[STSSessionBase callbackQueue](self, "callbackQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v11 = sub_2158C3A84(v13, (uint64_t)self, v13, 0, v10);
LABEL_12:
        v8 = (void *)v11;
      }
      else
      {
LABEL_15:
        v8 = 0;
      }

LABEL_14:
      return v8;
    default:
LABEL_3:
      v8 = 0;
      goto LABEL_14;
  }
}

- (STSSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSSession;
  return -[STSSessionBase init](&v3, sel_init);
}

- (id)startWithDelegate:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v16[4];
  id v17;
  id v18;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_2158A9000, "startWithDelegate:callback:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startWithDelegate:callback:]", 60, self, &stru_24D3A78C0, v9, v10, v16[0]);
  -[STSSession canStartSession](self, "canStartSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[STSSessionBase callbackQueue](self, "callbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)sub_2158D1684;
    v16[3] = (uint64_t)&unk_24D3A6E90;
    v18 = v7;
    v13 = v11;
    v17 = v13;
    dispatch_async(v12, v16);

    v14 = v13;
  }
  else
  {
    LOBYTE(state.opaque[0]) = 0;
    -[STSSessionBase setTheStartCallback:](self, "setTheStartCallback:", v7);
    -[STSSessionBase startWithDelegate:isFirstInQueue:](self, "startWithDelegate:isFirstInQueue:", v6, &state);
  }

  return v11;
}

- (id)startWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  os_activity_scope_state_s v12;

  v4 = a3;
  v5 = _os_activity_create(&dword_2158A9000, "startWithDelegate:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  os_activity_scope_leave(&v12);

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startWithDelegate:]", 79, self, &stru_24D3A78C0, v6, v7, v12.opaque[0]);
  -[STSSession canStartSession](self, "canStartSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    LOBYTE(v12.opaque[0]) = 0;
    -[STSSessionBase startWithDelegate:isFirstInQueue:](self, "startWithDelegate:isFirstInQueue:", v4, &v12);
  }

  return v9;
}

- (id)canStartSession
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase nfHardwareManager](self, "nfHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "getHwSupport") != 2)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession canStartSession]", 97, self, CFSTR("Hardware not available"), v5, v6, v24);
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v29[1] = &unk_24D3B3710;
    v28[1] = CFSTR("Line");
    v28[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v14;
    v28[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 98);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v10, 12, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  v25 = 1;
  objc_msgSend(v4, "getRadioEnabledState:", &v25);
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v7;
  if (v7 || !v25)
  {
    v17 = CFSTR("NFRadioStateDisabled");
    if (v7)
      v17 = (const __CFString *)v7;
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession canStartSession]", 104, self, CFSTR("NFC Radio is not available (error=%@)."), v8, v9, (uint64_t)v17);
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC radio disabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = &unk_24D3B3728;
    v26[1] = CFSTR("Line");
    v26[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v20;
    v26[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 105);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v13, 18, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  os_activity_scope_state_s state;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = _os_activity_create(&dword_2158A9000, "startTransactionWithAuthorization:options:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[STSSessionBase activateChildSession](self, "activateChildSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v15 = v12;
      v16 = v15;
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startTransactionWithAuthorization:options:]", 124, self, CFSTR("options: 0x%04x"), v13, v14, a4);
      -[STSSessionBase handler](self, "handler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startTransactionWithAuthorization:options:", v7, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = 0;
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession startTransactionWithAuthorization:options:]", 115, self, CFSTR("Handler invalid"), v10, v11, v24);
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v26[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    v27[1] = &unk_24D3B3740;
    v26[1] = CFSTR("Line");
    v26[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v19;
    v26[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 116);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v15, 9, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)stopTransaction
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  os_activity_scope_state_s state;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v4 = _os_activity_create(&dword_2158A9000, "stopTransaction:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession stopTransaction]", 136, self, &stru_24D3A78C0, v6, v7, v16);
    -[STSSessionBase handler](self, "handler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopTransaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession stopTransaction]", 132, self, CFSTR("Handler invalid"), v6, v7, v16);
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v19[1] = &unk_24D3B3758;
    v18[1] = CFSTR("Line");
    v18[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    v18[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 133);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v8, 9, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)enableExpressModeForActiveCredential:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = &unk_24D3B3770;
  v12[1] = CFSTR("Line");
  v12[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 141);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 11, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)releaseCredential:(id)a3 withAuthorization:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = &unk_24D3B3788;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 145);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 11, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)releaseCredential:(id)a3 withAuthorization:(id)a4 iso18013Selection:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  char isKindOfClass;
  id *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  os_activity_scope_state_s state;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = _os_activity_create(&dword_2158A9000, "releaseCredential:withAuthorization:iso18013Selection:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v15 = (id *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    sub_2158BA37C(v15, v9, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v21;
      v28[1] = &unk_24D3B37A0;
      v27[1] = CFSTR("Line");
      v27[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v22;
      v27[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 163);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v16, 11, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[STSSessionBase handler](self, "handler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158C5984((id *)v16, v9, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;
LABEL_7:

  return v19;
}

- (id)startHandoff
{
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[STSSessionBase handler](self, "handler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
      v8 = *(void **)(v6 + 64);
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "startHandoff");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      -[STSSessionBase handler](self, "handler");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = *(void **)(v12 + 64);
      else
        v14 = 0;
      v15 = v14;
      objc_msgSend(v15, "startHandoff");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      v22[1] = &unk_24D3B37B8;
      v21[1] = CFSTR("Line");
      v21[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v17;
      v21[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 176);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, 9, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v10;
}

- (id)sendRequestCompletion
{
  return self->_sendRequestCompletion;
}

- (void)setSendRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NFSecureElementProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
  objc_storeStrong((id *)&self->_seProxyListener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);
}

- (id)startWithNotificationTesterDelegate:(id)a3 outNotificationListener:(id *)a4
{
  id v6;
  NSObject *v7;
  ISO18013Handler *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  os_activity_scope_state_s v16;

  v6 = a3;
  v7 = _os_activity_create(&dword_2158A9000, "startWithNotificationTesterDelegate:outNotificationListener:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v7, &v16);
  os_activity_scope_leave(&v16);

  v8 = [ISO18013Handler alloc];
  -[STSSessionBase callbackQueue](self, "callbackQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)sub_2158B95D4(v8, v6, (uint64_t)self, v9);

  -[STSSessionBase setHandler:](self, "setHandler:", v10);
  if (a4)
  {
    if (v10)
      v11 = (void *)v10[8];
    else
      v11 = 0;
    *a4 = objc_retainAutorelease(v11);
  }
  if (v10)
    v12 = (void *)v10[8];
  else
    v12 = 0;
  v13 = v12;
  objc_msgSend(v13, "xpcEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)testSendToAlternativeCarrier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  _QWORD v24[2];
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_2158A9000, "testSendToAlternativeCarrier:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  -[STSSessionBase handler](self, "handler");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_6;
  v11 = (void *)v10;
  -[STSSessionBase handler](self, "handler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158BBD64((uint64_t)ISO18013Handler, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[STSSessionBase handler](self, "handler");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = *(void **)(v14 + 64);
    else
      v16 = 0;
    v17 = v16;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_2158D2D14;
    v21[3] = &unk_24D3A7400;
    v18 = &v22;
    v22 = v8;
    v19 = v8;
    objc_msgSend(v17, "alternativerCarrierSend:completion:", v7, v21);

  }
  else
  {
LABEL_6:
    -[STSSessionBase callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2158D2B6C;
    block[3] = &unk_24D3A7138;
    v18 = (id *)v24;
    v24[0] = v8;
    v24[1] = a2;
    v20 = v8;
    dispatch_async(v15, block);
  }

}

- (id)enablePlasticCardMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  char isKindOfClass;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v3 = a3;
  v25[4] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[STSSessionBase handler](self, "handler");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    sub_2158C0DE8(v8, v3, v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v25[1] = &unk_24D3B37E8;
    v24[1] = CFSTR("Line");
    v24[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v20;
    v24[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 11, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }
}

- (id)felicaCredentialState:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char isKindOfClass;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[STSSessionBase handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[STSSessionBase handler](self, "handler");
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    sub_2158C11B8(v10, v7, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = &unk_24D3B3800;
    v18[1] = CFSTR("Line");
    v18[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v14;
    v18[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 11, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)transitCredentialState:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char isKindOfClass;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[STSSessionBase handler](self, "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[STSSessionBase handler](self, "handler");
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    sub_2158C17A4(v10, v7, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = &unk_24D3B3818;
    v18[1] = CFSTR("Line");
    v18[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v14;
    v18[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 11, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end
