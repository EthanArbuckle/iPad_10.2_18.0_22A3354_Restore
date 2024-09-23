@implementation ISO18013HybridHandler

- (id)setActiveCredential:(id)a3
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  STSCredential *v16;
  uint64_t v17;
  void *v18;
  STSCredential *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    -[ISO18013HybridHandler setActiveCredentials:](self, "setActiveCredentials:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v7 = objc_msgSend(v5, "type");
  if (v7 != -[ISO18013HybridHandler supportedCredentialType](self, "supportedCredentialType"))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredential:]", 187, self, CFSTR("Invalid credential type"), v8, v9, v32);
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    v37[1] = &unk_24D3B3260;
    v36[1] = CFSTR("Line");
    v36[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v25;
    v36[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 188);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v26;
    v27 = (void *)MEMORY[0x24BDBCE70];
    v28 = v37;
    v29 = v36;
LABEL_9:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 8, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v6, "subIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v13 = (void *)v10,
        objc_msgSend(v6, "subIdentifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4),
        v14,
        v13,
        !v15))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredential:]", 193, self, CFSTR("Missing required subIdentifier"), v11, v12, v32);
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v24;
    v35[1] = &unk_24D3B3278;
    v34[1] = CFSTR("Line");
    v34[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v25;
    v34[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 194);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v26;
    v27 = (void *)MEMORY[0x24BDBCE70];
    v28 = v35;
    v29 = v34;
    goto LABEL_9;
  }
  v16 = [STSCredential alloc];
  v17 = objc_msgSend(v6, "type");
  objc_msgSend(v6, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[STSCredential initWithType:identifier:subIdentifier:](v16, "initWithType:identifier:subIdentifier:", v17, v18, 0);

  v33[0] = v6;
  v33[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISO18013HybridHandler setActiveCredentials:](self, "setActiveCredentials:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v21;
}

- (id)setActiveCredentials:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  void *v22;
  void *v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  NFSecureTransactionServicesHandoverHybridSession *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NFSecureTransactionServicesHandoverHybridSession *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NFSecureTransactionServicesHandoverHybridSession *handoverSession;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  NFSecureTransactionServicesHandoverHybridSession *v63;
  char v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id obj;
  id obja;
  id v98;
  objc_super v99;
  _QWORD v100[7];
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  objc_super v113;
  _QWORD v114[5];
  NSObject *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[2];
  _QWORD v130[4];
  _QWORD v131[4];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[4];
  _QWORD v137[4];
  _QWORD v138[5];
  _QWORD v139[5];
  _QWORD v140[4];
  _QWORD v141[6];

  v141[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "count") == 2)
    {
      v107 = 0;
      v108 = &v107;
      v109 = 0x3032000000;
      v110 = sub_2158C3C0C;
      v111 = sub_2158C3C1C;
      v112 = 0;
      v101 = 0;
      v102 = &v101;
      v103 = 0x3032000000;
      v104 = sub_2158C3C0C;
      v105 = sub_2158C3C1C;
      v106 = 0;
      v9 = MEMORY[0x24BDAC760];
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = sub_2158C530C;
      v100[3] = &unk_24D3A75B8;
      v100[4] = self;
      v100[5] = &v107;
      v100[6] = &v101;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v100);
      if (!v108[5] || !v102[5])
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 238, self, CFSTR("Invalid credential configuration"), v10, v11, v88);
        v19 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v130[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v131[0] = v21;
        v131[1] = &unk_24D3B32A8;
        v130[1] = CFSTR("Line");
        v130[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v131[2] = v22;
        v130[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 239);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v131[3] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 8, v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
        _Block_object_dispose(&v101, 8);

        _Block_object_dispose(&v107, 8);
        goto LABEL_41;
      }
      if (!self)
        goto LABEL_21;
      if (self->_handoverSession)
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 116, self, CFSTR("handover session already exists, reusing"), v10, v11, v88);
        goto LABEL_21;
      }
      self->_transactionState = 0;
      v117 = 0;
      v118 = &v117;
      v119 = 0x3032000000;
      v120 = sub_2158C3C0C;
      v121 = sub_2158C3C1C;
      v122 = 0;
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 123, self, CFSTR("Starting handover device session, type=%lu"), v10, v11, 2);
      v25 = dispatch_semaphore_create(0);
      -[STSHandler nfHardwareManager](self, "nfHardwareManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v9;
      v114[1] = 3221225472;
      v114[2] = sub_2158C3C24;
      v114[3] = &unk_24D3A7590;
      v114[4] = self;
      v116 = &v117;
      v27 = v25;
      v115 = v27;
      v92 = v26;
      objc_msgSend(v26, "startHandoverHybridSessionWithCompletion:", v114);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v30 = sel__startHandoverSession;
      if (obj)
      {
        objc_storeStrong((id *)&self->_handoverSession, obj);
        v31 = self->_handoverSession;
        -[NFSecureTransactionServicesHandoverHybridSession setDelegate:](v31, "setDelegate:", self);

        -[STSHandler handoffToken](self, "handoffToken");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 153, self, CFSTR("Activating session with token: %@"), v33, v34, (uint64_t)v32);

        v35 = self->_handoverSession;
        -[STSHandler handoffToken](self, "handoffToken");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFSecureTransactionServicesHandoverHybridSession activateWithToken:](v35, "activateWithToken:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 156, self, CFSTR("Session switching error=%@"), v38, v39, (uint64_t)v37);
          sub_2158C3BB4((uint64_t)self);
          v40 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v138[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *MEMORY[0x24BDD1398];
          v139[0] = v95;
          v139[1] = v37;
          v138[1] = v41;
          v138[2] = CFSTR("Line");
          v139[2] = &unk_24D3B3218;
          v138[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel__startHandoverSession));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v139[3] = v42;
          v138[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel__startHandoverSession), 158);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v139[4] = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v139, v138, 5);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", v93, 10, v44);
          v30 = (char *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

          if (!v118[5])
          {
            v37 = 0;
            v27 = 0;
            v46 = 1;
            goto LABEL_18;
          }
          sub_2158C3BB4((uint64_t)self);
          v77 = objc_msgSend((id)v118[5], "code");
          v42 = (void *)0x24BDD1000;
          v91 = (void *)MEMORY[0x24BDD1540];
          if (v77 != 50)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v134[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v135[0] = v95;
            v134[1] = *MEMORY[0x24BDD1398];
            v43 = (void *)v118[5];
            v90 = v43;
            if (!v43)
            {
              v84 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "errorWithDomain:code:userInfo:", v42, 5, 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v135[1] = v43;
            v135[2] = &unk_24D3B3248;
            v134[2] = CFSTR("Line");
            v134[3] = CFSTR("Method");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel__startHandoverSession));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v135[3] = v85;
            v134[4] = *MEMORY[0x24BDD0BA0];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel__startHandoverSession), 172);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v135[4] = v86;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 5);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "errorWithDomain:code:userInfo:", v93, 10, v87);
            v30 = (char *)objc_claimAutoreleasedReturnValue();

            v37 = 0;
            v27 = 0;
            if (v90)
              goto LABEL_17;
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v136[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NFC radio disabled");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v137[0] = v95;
          v137[1] = &unk_24D3B3230;
          v136[1] = CFSTR("Line");
          v136[2] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel__startHandoverSession));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v137[2] = v42;
          v136[3] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel__startHandoverSession), 170);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v137[3] = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v137, v136, 4);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "errorWithDomain:code:userInfo:", v93, 18, v44);
          v30 = (char *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
        }

      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler _startHandoverSession]", 142, self, CFSTR("Fail to start SecureTransactionServicesSession"), v28, v29, v89);
        sub_2158C3BB4((uint64_t)self);
        v45 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v140[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v141[0] = v93;
        v141[1] = &unk_24D3B3200;
        v140[1] = CFSTR("Line");
        v140[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel__startHandoverSession));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v141[2] = v95;
        v140[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel__startHandoverSession), 144);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v141[3] = v42;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v141, v140, 4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v37, 9, v43);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
      }
LABEL_16:

LABEL_17:
      v46 = 0;
LABEL_18:

      _Block_object_dispose(&v117, 8);
      if ((v46 & 1) == 0 && v30)
      {
        v47 = v30;
LABEL_39:
        v20 = v47;
        v12 = v47;
        goto LABEL_40;
      }
LABEL_21:
      v48 = v102[5];
      v129[0] = v108[5];
      v129[1] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v99.receiver = self;
      v99.super_class = (Class)ISO18013HybridHandler;
      -[STSHandler setActiveCredentials:](&v99, sel_setActiveCredentials_, v49);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v50 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v127[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = *MEMORY[0x24BDD1398];
        v128[0] = v52;
        v128[1] = v20;
        v127[1] = v53;
        v127[2] = CFSTR("Line");
        v128[2] = &unk_24D3B32C0;
        v127[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v128[3] = v54;
        v127[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 249);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v128[4] = v55;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v128, v127, 5);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, 10, v56);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_40;
      }
      v57 = (void *)v102[5];
      if (!v57)
      {
        v68 = 0;
LABEL_38:
        v47 = v68;
        goto LABEL_39;
      }
      handoverSession = self->_handoverSession;
      objc_msgSend(v57, "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFSecureTransactionServicesHandoverHybridSession appletWithIdentifier:](handoverSession, "appletWithIdentifier:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 256, self, CFSTR("applet %@"), v61, v62, (uint64_t)v60);
        v63 = self->_handoverSession;
        v98 = 0;
        v64 = -[NFSecureTransactionServicesHandoverHybridSession setActiveApplet:authorization:error:](v63, "setActiveApplet:authorization:error:", v60, 0, &v98);
        v65 = v98;
        v68 = v65;
        if ((v64 & 1) != 0)
        {
LABEL_37:
          sub_2158C52F4((uint64_t)self, (void *)v102[5]);

          goto LABEL_38;
        }
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 258, self, CFSTR("set active applet failed = %@"), v66, v67, (uint64_t)v65);
        v69 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v125[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v126[0] = v70;
        v125[1] = *MEMORY[0x24BDD1398];
        v71 = v68;
        if (!v68)
        {
          v72 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "errorWithDomain:code:userInfo:", v95, 5, 0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v126[1] = v71;
        v126[2] = &unk_24D3B32D8;
        v125[2] = CFSTR("Line");
        v125[3] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v126[3] = v94;
        v125[4] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 259);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v126[4] = v73;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 5);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "errorWithDomain:code:userInfo:", obja, 10, v74);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v68 == 0;

        v68 = (void *)v75;
        if (!v76)
        {
LABEL_36:

          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend((id)v102[5], "identifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 262, self, CFSTR("applet not found for identifier = %@"), v79, v80, (uint64_t)v78);

        v81 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v123[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v124[0] = v70;
        v124[1] = &unk_24D3B32F0;
        v123[1] = CFSTR("Line");
        v123[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v124[2] = v95;
        v123[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 263);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v124[3] = v71;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 4);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "errorWithDomain:code:userInfo:", obja, 8, v82);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_36;
    }
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler setActiveCredentials:]", 215, self, CFSTR("Non expected number of credentials provided"), v7, v8, v88);
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v15;
    v133[1] = &unk_24D3B3290;
    v132[1] = CFSTR("Line");
    v132[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v133[2] = v16;
    v132[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 216);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v133[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v133, v132, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    sub_2158C52F4((uint64_t)self, 0);
    v113.receiver = self;
    v113.super_class = (Class)ISO18013HybridHandler;
    -[STSHandler setActiveCredentials:](&v113, sel_setActiveCredentials_, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_41:

  return v12;
}

- (id)activateWithHandoffToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler activateWithHandoffToken:]", 285, self, &stru_24D3A78C0, v5, v6, v8);
  -[STSHandler setHandoffToken:](self, "setHandoffToken:", v4);

  return 0;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 1;
}

- (id)stopTransaction
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NFSecureTransactionServicesHandoverHybridSession *handoverSession;
  id v15;
  unint64_t transactionState;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  objc_super v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler stopTransaction]", 321, self, &stru_24D3A78C0, v2, v3, v27);
  v30.receiver = self;
  v30.super_class = (Class)ISO18013HybridHandler;
  -[STSTransactionHandler stopTransaction](&v30, sel_stopTransaction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[STSHandler activeSTSCredential](self, "activeSTSCredential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "type") == 5)
    {
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler stopTransaction]", 328, self, &stru_24D3A78C0, v12, v13, v28);
        handoverSession = self->_handoverSession;
        v29 = v6;
        -[NFSecureTransactionServicesHandoverHybridSession stopCardEmulation:](handoverSession, "stopCardEmulation:", &v29);
        v15 = v29;

        transactionState = self->_transactionState;
        v6 = v15;
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  if (!self)
    goto LABEL_11;
  transactionState = self->_transactionState;
LABEL_8:
  if (transactionState == 1 || transactionState == 2)
  {
    -[STSTransactionHandler parent](self, "parent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fireSessionDidEndUnexpectedlyEventWithStatus:", 3);

  }
LABEL_11:
  sub_2158C5440((os_unfair_lock_s *)self, 0);
  if (v6)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BDD1398];
    v32[0] = v20;
    v32[1] = v6;
    v31[1] = v21;
    v31[2] = CFSTR("Line");
    v32[2] = &unk_24D3B3308;
    v31[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v22;
    v31[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 340);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 10, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)tearDownWithCompletion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler tearDownWithCompletion:]", 344, self, &stru_24D3A78C0, v4, v5, v6);
  sub_2158C5440((os_unfair_lock_s *)self, v7);

}

- (unsigned)supportedCredentialType
{
  return 5;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NFSecureTransactionServicesHandoverHybridSession *handoverSession;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  objc_super v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 385, self, CFSTR("options = 0x%04x"), v8, v9, a4);
  if ((a4 & 4) != 0)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 387, self, CFSTR("Non supported options"), v10, v11, v48);
    v29 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v30;
    v57[1] = &unk_24D3B3320;
    v56[1] = CFSTR("Line");
    v56[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v31;
    v56[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 388);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v29;
    v35 = v28;
    v36 = 8;
LABEL_11:
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, v36, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  -[STSHandler handoffToken](self, "handoffToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 392, self, CFSTR("Handoff has not been started"), v13, v14, v48);
    v37 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v30;
    v55[1] = &unk_24D3B3338;
    v54[1] = CFSTR("Line");
    v54[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v31;
    v54[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 393);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v37;
    v35 = v28;
    v36 = 9;
    goto LABEL_11;
  }
  if (self)
    self->_startTransactionOption = a4;
  -[STSHandler activeSTSCredentials](self, "activeSTSCredentials");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 398, self, CFSTR("active credentials=%@"), v16, v17, (uint64_t)v15);

  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "type") != 5)
  {

LABEL_14:
    -[STSHandler handoffToken](self, "handoffToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self)
    {
LABEL_16:
      v38 = 0;
      goto LABEL_17;
    }
LABEL_15:
    os_unfair_lock_lock(&self->_handoverSessionMutex);
    v51.receiver = self;
    v51.super_class = (Class)ISO18013HybridHandler;
    v39 = -[STSTransactionHandler startTransactionWithAuthorization:options:](&v51, sel_startTransactionWithAuthorization_options_, 0, 0);
    os_unfair_lock_unlock(&self->_handoverSessionMutex);
    goto LABEL_16;
  }
  -[STSHandler activeSTSCredential](self, "activeSTSCredential");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_14;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 403, self, CFSTR("auth: %@"), v21, v22, (uint64_t)v7);
  handoverSession = self->_handoverSession;
  v50 = 0;
  v24 = -[NFSecureTransactionServicesHandoverHybridSession startCardEmulationWithAuthorization:error:](handoverSession, "startCardEmulationWithAuthorization:error:", v7, &v50);
  v25 = v50;
  v28 = v25;
  if (v24)
  {

    -[STSHandler handoffToken](self, "handoffToken");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler startTransactionWithAuthorization:options:]", 405, self, CFSTR("start transaction failed = %@"), v26, v27, (uint64_t)v25);
  v41 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v42;
  v52[1] = *MEMORY[0x24BDD1398];
  v43 = v28;
  if (!v28)
  {
    v44 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v53[1] = v43;
  v53[2] = &unk_24D3B3350;
  v52[2] = CFSTR("Line");
  v52[3] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v45;
  v52[4] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 406);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v46;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "errorWithDomain:code:userInfo:", v30, 10, v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {

  }
LABEL_12:

LABEL_17:
  return v38;
}

- (void)transactionStarted:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t transactionState;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 415, self, CFSTR("status=%lu"), v3, v4, a3);
  if (self)
  {
    transactionState = self->_transactionState;
    if (transactionState && transactionState != 3)
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 419, self, CFSTR("Unexpected transaction state=%d"), v7, v8, self->_transactionState);
  }
  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 9)
  {
    v17 = v11;
    objc_msgSend(v11, "fireRequestHandoverConfirmation");
LABEL_16:
    v11 = v17;
    goto LABEL_17;
  }
  if (!a3)
  {
    v17 = v11;
    if (self && self->_transactionState)
    {
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionStarted:]", 430, self, CFSTR("Unexpected state, dropping start event"), v12, v13, v16);
    }
    else
    {
      v14 = (void *)objc_opt_new();
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCredential:", v15);

      objc_msgSend(v14, "setTransactionMode:", 4);
      objc_msgSend(v17, "fireTransactionStartEvent:", v14);
      if (self)
        self->_transactionState = 1;

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  STSCredential *v9;
  STSCredential *v10;
  STSCredential *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  STSTransactionEndEvent *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  if (!self)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 453, 0, CFSTR("keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
    goto LABEL_8;
  }
  if (self->_transactionState - 3 <= 1)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 449, self, CFSTR("Dropping transaction end event, keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
    goto LABEL_22;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 453, self, CFSTR("keyIdentifier: %@, error: %@"), v6, v7, (uint64_t)v22);
  v9 = self->_releasedCredential;
  if (!v9)
  {
LABEL_8:
    -[STSHandler activeSTSCredential](self, "activeSTSCredential");
    v11 = (STSCredential *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_6;
LABEL_9:
    v12 = 5;
    +[STSCredential credentialWithType:identifier:subIdentifier:](STSCredential, "credentialWithType:identifier:subIdentifier:", 5, 0x24D3A8880, v22);
    v11 = (STSCredential *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler transactionEndedWithIdentifier:error:]", 463, self, CFSTR("A credential is not available.  Creating a credential for event - credential=%@"), v13, v14, (uint64_t)v11);
    goto LABEL_10;
  }
  v10 = v9;
  v11 = self->_releasedCredential;

  if (!v11)
    goto LABEL_9;
LABEL_6:
  v12 = 0;
LABEL_10:
  v15 = objc_alloc_init(STSTransactionEndEvent);
  -[STSTransactionEndEvent setCredential:](v15, "setCredential:", v11);
  -[STSTransactionEndEvent setStatus:](v15, "setStatus:", v12);
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", CFSTR("STSXPCHelperErrorDomain"));

    if (v17)
    {
      v18 = objc_msgSend(v8, "code");
      v19 = 3;
      if (v18 == 14)
        v19 = 4;
      if (v18 == 15)
        v20 = 6;
      else
        v20 = v19;
    }
    else
    {
      v20 = 2;
    }
    -[STSTransactionEndEvent setStatus:](v15, "setStatus:", v20);
  }
  -[STSTransactionHandler parent](self, "parent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fireTransactionEndEvent:", v15);

  if (self)
    self->_transactionState = 3;

LABEL_22:
}

- (void)notificationClientConnected
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler notificationClientConnected]", 492, self, &stru_24D3A78C0, v2, v3, v7);
  if (self && (self->_startTransactionOption & 2) != 0)
    v5 = -[STSXPCClientNotificationListener setRequestHandoverConfirmation:](self->_stsNotificationListener, "setRequestHandoverConfirmation:", 1);
  sub_2158C6770((id *)&self->super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[STSTransactionHandler parent](self, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stsSessionNotificationListenerStarted:", v6);

}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierReceived:dataPending:]", 501, self, CFSTR("dataPending=%d"), v7, v8, v4);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  sub_2158C6770((id *)&self->super.super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stsSession:receivedFromAlternativeCarrier:dataPending:", v10, v6, v4);

}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierConnectedWithStatus:]", 510, self, CFSTR("status=%lu"), v3, v4, a3);
  if (a3)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = &unk_24D3B3368;
    v18[1] = CFSTR("Line");
    v18[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    v18[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 514);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[STSTransactionHandler parent](self, "parent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158C6770((id *)&self->super.super.super.isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stsSession:connectedAlternativeCarrierWithStatus:", v15, v14);

  if (a3)
  {
    if (a3 == 3)
      v17 = 1;
    else
      v17 = 2;
    objc_msgSend(v15, "fireSessionDidEndUnexpectedlyEventWithStatus:", v17);
    sub_2158C5440((os_unfair_lock_s *)self, 0);
  }

}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  STSTransactionEndEvent *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 532, self, CFSTR("status=%d, transactionState=%lu"), v3, v4, a3);
  -[STSTransactionHandler parent](self, "parent");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  sub_2158C6770((id *)&self->super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stsSessionAlternativeCarrierDisconnected:", v20);

  if (self && self->_transactionState - 1 <= 1)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 538, self, CFSTR("Transaction end unexpectedly"), v8, v9, v18);
    switch(a3)
    {
      case 0uLL:
        v10 = 0;
        v11 = 7;
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 9uLL:
        v10 = 0;
        v11 = 2;
        break;
      case 3uLL:
        v10 = 0;
        v11 = 1;
        break;
      case 6uLL:
      case 7uLL:
        v10 = 0;
        v11 = 12;
        break;
      case 8uLL:
        v10 = 0;
        v11 = 6;
        break;
      default:
        v11 = 0;
        v10 = 1;
        break;
    }
    v12 = objc_alloc_init(STSTransactionEndEvent);
    -[STSTransactionEndEvent setStatus:](v12, "setStatus:", v11);
    if (self->_releasedCredential)
    {
      -[STSTransactionEndEvent setCredential:](v12, "setCredential:");
    }
    else
    {
      -[STSHandler activeSTSCredential](self, "activeSTSCredential");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[STSHandler activeSTSCredential](self, "activeSTSCredential");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSTransactionEndEvent setCredential:](v12, "setCredential:", v14);

      }
      else
      {
        +[STSCredential credentialWithType:identifier:subIdentifier:](STSCredential, "credentialWithType:identifier:subIdentifier:", 2, 0x24D3A8880, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[STSTransactionEndEvent setCredential:](v12, "setCredential:", v15);

        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler alternativeCarrierDisconnectedWithStatus:]", 574, self, CFSTR("Neither an active nor a released credential are set."), v16, v17, v19);
        if (v10)
          -[STSTransactionEndEvent setStatus:](v12, "setStatus:", 5);
      }
    }
    objc_msgSend(v20, "fireTransactionEndEvent:", v12);

  }
  sub_2158C5440((os_unfair_lock_s *)self, 0);

}

- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler processISO18013CredentialProposals:readerAuthInfo:]", 589, self, &stru_24D3A78C0, v8, v9, v12);
  sub_2158CE0B8();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessCredentialProposals", (const char *)&unk_2158E2973, (uint8_t *)&v12, 2u);
  }

  if (self)
    self->_transactionState = 2;
  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireDidReceive18013Requests:readerAuthInfo:", v7, v6);

}

- (void)xpcInvalidated
{
  void *v3;

  if (!self || self->_transactionState != 4)
  {
    -[STSTransactionHandler parent](self, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fireSessionDidEndUnexpectedlyEventWithStatus:", 2);

    sub_2158C5440((os_unfair_lock_s *)self, 0);
  }
}

- (void)xpcInterrupted
{
  void *v3;

  if (!self || self->_transactionState != 4)
  {
    -[STSTransactionHandler parent](self, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fireSessionDidEndUnexpectedlyEventWithStatus:", 2);

    sub_2158C5440((os_unfair_lock_s *)self, 0);
  }
}

- (void)session:(id)a3 fieldChange:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  STSXPCClientNotificationListener *stsNotificationListener;
  int v9;
  const char *v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    v7 = "no";
    if (v4)
      v7 = "yes";
    v9 = 136315138;
    v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_FieldChange", "fieldPresent=%s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    if (self)
      stsNotificationListener = self->_stsNotificationListener;
    else
      stsNotificationListener = 0;
    -[STSXPCClientNotificationListener sendConnectionHandoverStarted](stsNotificationListener, "sendConnectionHandoverStarted");
  }
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:fieldNotification:]", 645, self, CFSTR("field=%@"), v6, v7, (uint64_t)v5);
  sub_2158CE0B8();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_FieldDetect", "field=%@", buf, 0xCu);
  }

  sub_2158CEFF0(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireFieldNotificationEvent:", v9);

}

- (void)session:(id)a3 tnepService:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_TnepService_Selected", "service=%@", buf, 0xCu);
  }

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:tnepService:]", 655, self, CFSTR("service=%@"), v7, v8, (uint64_t)v5);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sub_2158CE0B8();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_HandoverFailure", "error=%@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "code") != 2 && objc_msgSend(v5, "code") != 8)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013HybridHandler session:connectionHandoverProcessFailure:]", 668, self, CFSTR("error=%@"), v7, v8, (uint64_t)v5);
    if (objc_msgSend(v5, "code") == 6)
    {
      v9 = 4;
LABEL_20:
      sub_2158C6E4C((os_unfair_lock_s *)self);
      -[STSTransactionHandler parent](self, "parent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fireSessionDidEndUnexpectedlyEventWithStatus:", v9);

      goto LABEL_21;
    }
    if (objc_msgSend(v5, "code") != 12)
    {
      v9 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("WifiDomain")))
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 3)
      {
        v9 = 5;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("BluetoothDomain")))
    {
      v15 = objc_msgSend(v11, "code");

      if (v15)
        v9 = 0;
      else
        v9 = 6;
    }
    else
    {

      v9 = 0;
    }
    goto LABEL_19;
  }
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:connectionHandoverProcessFailure:]", 665, self, CFSTR("Allows reader to retry"), v7, v8, v17);
LABEL_21:

}

- (void)connectionHandoverCompleted:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[16];

  sub_2158CE0B8();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2158A9000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013HybridHandler_HandoverCompleted", (const char *)&unk_2158E2973, buf, 2u);
  }

  if (self)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler connectionHandoverCompleted:]", 690, self, CFSTR("transactionState=%lu"), v5, v6, self->_transactionState);
    -[STSXPCClientNotificationListener sendConnectionHandoverCompleted](self->_stsNotificationListener, "sendConnectionHandoverCompleted");
    if (self->_transactionState)
      sub_2158C6E4C((os_unfair_lock_s *)self);
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler connectionHandoverCompleted:]", 690, 0, CFSTR("transactionState=%lu"), v5, v6, 0);
    objc_msgSend(0, "sendConnectionHandoverCompleted");
  }
}

- (void)session:(id)a3 didEndUnexpectedly:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEndUnexpectedly:]", 700, self, CFSTR("reason: %@"), v4, v5, (uint64_t)a4);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireSessionDidEndUnexpectedlyEventWithStatus:", 0);

}

- (void)session:(id)a3 didDetectField:(BOOL)a4
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
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didDetectField:]", 705, self, v8, v4, v5, v9);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireFieldDetectEvent:", v6);

}

- (void)session:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEnterFieldWithNotification:]", 711, self, CFSTR("%@"), v6, v7, (uint64_t)v5);
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

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler sessionDidExitField:]", 717, self, CFSTR("Field Off"), v3, v4, v6);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireFieldDetectEvent:", 0);

}

- (void)session:(id)a3 didSelectApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didSelectApplet:]", 722, self, CFSTR("SELECT: %@"), v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 didExpireTransactionForApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didExpireTransactionForApplet:]", 728, self, CFSTR("EXPIRED: %@"), v4, v5, (uint64_t)a4);
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
  STSCredential *jpkiCredential;
  void *v10;
  STSTransactionStartEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didStartTransaction:]", 734, self, CFSTR("START: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionStartEvent alloc];
  if (self)
    jpkiCredential = self->_jpkiCredential;
  else
    jpkiCredential = 0;
  v11 = -[STSTransactionStartEvent initWithCredential:andNearFieldStartEvent:](v8, "initWithCredential:andNearFieldStartEvent:", jpkiCredential, v5);

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
  STSCredential *jpkiCredential;
  void *v10;
  STSTransactionEndEvent *v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didEndTransaction:]", 742, self, CFSTR("END: %@"), v6, v7, (uint64_t)v5);
  v8 = [STSTransactionEndEvent alloc];
  if (self)
    jpkiCredential = self->_jpkiCredential;
  else
    jpkiCredential = 0;
  v11 = -[STSTransactionEndEvent initWithCredential:andNearFieldEndEvent:](v8, "initWithCredential:andNearFieldEndEvent:", jpkiCredential, v5);

  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionEndEvent:", v11);

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
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013HybridHandler session:didExpressModeStateChange:withObject:]", 751, self, CFSTR("%d - %@"), v8, v9, v5);
  v10 = 0;
  if ((v5 - 1) <= 8)
    v10 = dword_2158DB8C0[(int)v5 - 1];
  v12 = -[STSExpressEventInfoWithDetail initWithState:detail:]([STSExpressEventInfoWithDetail alloc], "initWithState:detail:", v10, v7);

  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireExpressModeStateChangeWithInfo:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jpkiCredential, 0);
  objc_storeStrong((id *)&self->_releasedCredential, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_destroyWeak((id *)&self->_notificationTesterDelegate);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
}

@end
