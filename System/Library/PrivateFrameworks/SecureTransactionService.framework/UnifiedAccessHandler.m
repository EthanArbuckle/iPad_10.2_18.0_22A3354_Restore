@implementation UnifiedAccessHandler

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
  v9[2] = sub_2158D4638;
  v9[3] = &unk_24D3A78A0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "startUnifiedAccessSession:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)supportedCredentialType
{
  return 3;
}

- (id)setActiveCredential:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NFUnifiedAccessSession *nfSession;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NFUnifiedAccessSession *v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NFUnifiedAccessSession *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NFUnifiedAccessSession *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  _QWORD *v68;
  _QWORD *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  const char *sel;
  const char *sela;
  id v94;
  id v95;
  objc_super v96;
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[5];
  _QWORD v102[5];
  _QWORD v103[4];
  _QWORD v104[4];
  _QWORD v105[4];
  _QWORD v106[4];
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD v109[4];
  _QWORD v110[4];
  _QWORD v111[2];
  _QWORD v112[4];

  v112[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v96.receiver = self;
  v96.super_class = (Class)UnifiedAccessHandler;
  -[STSHandler setActiveCredential:](&v96, sel_setActiveCredential_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "secondaryIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        nfSession = self->_nfSession;
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "secondaryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFUnifiedAccessSession appletsWithIdentifiers:secondaryIdentifier:](nfSession, "appletsWithIdentifiers:secondaryIdentifier:", v11, v12);
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v91 = (void *)v13;
          sel = a2;
          objc_msgSend(v5, "subIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 74, self, CFSTR("primaryAid %@ and primaryKeyID %@"), v16, v17, (uint64_t)v14);

          objc_msgSend(v5, "secondaryIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "secondarySubIdentifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 76, self, CFSTR("secondaryAid %@ and secondaryKeyID %@"), v19, v20, (uint64_t)v18);

          objc_msgSend(v5, "subIdentifier");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21
            && (v24 = (void *)v21,
                objc_msgSend(v5, "secondarySubIdentifier"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v25,
                v24,
                v25))
          {
            objc_msgSend(v5, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v111[0] = v26;
            objc_msgSend(v5, "subIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v112[0] = v27;
            objc_msgSend(v5, "secondaryIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v111[1] = v28;
            objc_msgSend(v5, "secondarySubIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v112[1] = v29;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v30, "count") == 2)
            {
              v33 = self->_nfSession;
              v95 = v6;
              v34 = -[NFUnifiedAccessSession setActivePaymentApplets:error:](v33, "setActivePaymentApplets:error:", v30, &v95);
              v35 = v95;

              if ((v34 & 1) != 0)
              {
                v38 = (void *)v13;
LABEL_26:

                v6 = v35;
                goto LABEL_27;
              }
              v89 = v30;
              sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 88, self, CFSTR("set active applet failed = %@"), v36, v37, (uint64_t)v35);
              v88 = (void *)MEMORY[0x24BDD1540];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v107[0] = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v108[0] = v56;
              v107[1] = *MEMORY[0x24BDD1398];
              v6 = v35;
              if (!v35)
              {
                v78 = (void *)MEMORY[0x24BDD1540];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "errorWithDomain:code:userInfo:", v27, 5, 0);
                v6 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v108[1] = v6;
              v108[2] = &unk_24D3B3848;
              v107[2] = CFSTR("Line");
              v107[3] = CFSTR("Method");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel), v84);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v108[3] = v79;
              v107[4] = *MEMORY[0x24BDD0BA0];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 89);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v108[4] = v80;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 5);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "errorWithDomain:code:userInfo:", v55, 10, v81);
              v61 = objc_claimAutoreleasedReturnValue();

LABEL_31:
              v30 = v89;
              v38 = v91;
              if (v35)
                goto LABEL_25;
              goto LABEL_24;
            }
            sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 85, self, CFSTR("Invalid number of aids and keys "), v31, v32, v82);
            v90 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v109[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Missing Parameter");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v110[0] = v56;
            v110[1] = &unk_24D3B3830;
            v109[1] = CFSTR("Line");
            v109[2] = CFSTR("Method");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel), v84);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v110[2] = v27;
            v109[3] = *MEMORY[0x24BDD0BA0];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sel), 86);
            v63 = objc_claimAutoreleasedReturnValue();
            v110[3] = v63;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 4);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "errorWithDomain:code:userInfo:", v55, 7, v76);
            v61 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 92, self, CFSTR("keyIdentifier missing"), v22, v23, v82);
            v62 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v105[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Missing Parameter");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v106[0] = v55;
            v106[1] = &unk_24D3B3860;
            v105[1] = CFSTR("Line");
            v105[2] = CFSTR("Method");
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v84);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v106[2] = v56;
            v105[3] = *MEMORY[0x24BDD0BA0];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 93);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v106[3] = v27;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v106, v105, 4);
            v63 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "errorWithDomain:code:userInfo:", v30, 7, v63);
            v61 = objc_claimAutoreleasedReturnValue();

          }
          v6 = (void *)v63;
          v38 = (void *)v13;
          goto LABEL_24;
        }
        objc_msgSend(v5, "secondaryIdentifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 97, self, CFSTR("applets not found for identifiers = %@ and/or %@"), v64, v65, (uint64_t)v14);

        v66 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v104[0] = v30;
        v104[1] = &unk_24D3B3878;
        v103[1] = CFSTR("Line");
        v103[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v86);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v104[2] = v55;
        v103[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 98);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v104[3] = v56;
        v67 = (void *)MEMORY[0x24BDBCE70];
        v68 = v104;
        v69 = v103;
        goto LABEL_20;
      }
    }
    objc_msgSend(v5, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = self->_nfSession;
      objc_msgSend(v5, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFUnifiedAccessSession appletWithIdentifier:](v40, "appletWithIdentifier:", v41);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        sela = a2;
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 104, self, CFSTR("applet %@"), v42, v43, (uint64_t)v38);
        objc_msgSend(v5, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v27;
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 106, self, CFSTR("aid %@ and keyID %@"), v45, v46, (uint64_t)v44);

        objc_msgSend(v5, "subIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v50 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v5, "subIdentifier");
          v51 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setWithObject:", v51);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = self->_nfSession;
          v94 = v6;
          LOBYTE(v51) = -[NFUnifiedAccessSession setActivePaymentApplet:keys:error:](v52, "setActivePaymentApplet:keys:error:", v38, v30, &v94);
          v35 = v94;

          if ((v51 & 1) != 0)
            goto LABEL_26;
          v89 = v30;
          v91 = v38;
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 111, self, CFSTR("set active applet failed = %@"), v53, v54, (uint64_t)v35);
          v87 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v101[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v102[0] = v56;
          v101[1] = *MEMORY[0x24BDD1398];
          v6 = v35;
          if (!v35)
          {
            v57 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "errorWithDomain:code:userInfo:", v27, 5, 0);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v102[1] = v6;
          v102[2] = &unk_24D3B3890;
          v101[2] = CFSTR("Line");
          v101[3] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sela), v85);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v102[3] = v58;
          v101[4] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sela), 112);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v102[4] = v59;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 5);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "errorWithDomain:code:userInfo:", v55, 10, v60);
          v61 = objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 115, self, CFSTR("keyIdentifier missing"), v48, v49, v83);
        v73 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v74 = objc_claimAutoreleasedReturnValue();
        v99[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Missing Parameter");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = v55;
        v100[1] = &unk_24D3B38A8;
        v99[1] = CFSTR("Line");
        v99[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sela), v85);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v100[2] = v56;
        v99[3] = *MEMORY[0x24BDD0BA0];
        v30 = (void *)v74;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(sela), 116);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v100[3] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 4);
        v75 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "errorWithDomain:code:userInfo:", v30, 7, v75);
        v61 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v75;
LABEL_24:

LABEL_25:
        v35 = (id)v61;
        goto LABEL_26;
      }
      objc_msgSend(v5, "identifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredential:]", 119, self, CFSTR("applet not found for identifier = %@"), v71, v72, (uint64_t)v70);

      v66 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = v30;
      v98[1] = &unk_24D3B38C0;
      v97[1] = CFSTR("Line");
      v97[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = v55;
      v97[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 120);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v98[3] = v56;
      v67 = (void *)MEMORY[0x24BDBCE70];
      v68 = v98;
      v69 = v97;
LABEL_20:
      objc_msgSend(v67, "dictionaryWithObjects:forKeys:count:", v68, v69, 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", v38, 8, v27);
      v61 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
LABEL_27:

  return v6;
}

- (id)setActiveCredentials:(id)a3
{
  void *v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  UnifiedAccessHandler *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  NFUnifiedAccessSession *nfSession;
  char v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const char *Name;
  UnifiedAccessHandler *v105;
  void *v106;
  const char *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  objc_super v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _BYTE v127[128];
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[4];
  _QWORD v135[4];
  _BYTE v136[128];
  _QWORD v137[4];
  _QWORD v138[6];

  v138[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_27;
  v8 = v6;
  v9 = v8;
  if (!self)
  {

    goto LABEL_27;
  }
  if ((unint64_t)objc_msgSend(v8, "count") < 3)
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v18 = v9;
    v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
    if (!v21)
    {
      v3 = 0;
      goto LABEL_22;
    }
    v22 = v21;
    v105 = self;
    v106 = v9;
    v107 = a2;
    v108 = v7;
    v23 = *(_QWORD *)v118;
    v110 = v18;
LABEL_7:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v118 != v23)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v24);
      if (objc_msgSend(v25, "type") != 3)
      {
        self = v105;
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 139, v105, CFSTR("Invalid credential types."), v26, v27, (uint64_t)Name);
        v32 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v134[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v16;
        v135[1] = &unk_24D3B38F0;
        v134[1] = CFSTR("Line");
        v134[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_validateCredentials_));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v135[2] = v19;
        v134[3] = *MEMORY[0x24BDD0BA0];
        v33 = (void *)MEMORY[0x24BDD17C8];
        Name = sel_getName(sel_validateCredentials_);
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%s:%d"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v135[3] = v20;
        v34 = (void *)MEMORY[0x24BDBCE70];
        v35 = v135;
        v36 = v134;
LABEL_20:
        objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 4);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", v15, 8, v37);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v106;
        v18 = v110;
        goto LABEL_21;
      }
      objc_msgSend(v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "hasPrefix:", 0x24D3A8820) & 1) != 0)
        goto LABEL_14;
      objc_msgSend(v25, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "hasPrefix:", 0x24D3A8840))
        break;
      objc_msgSend(v25, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "hasPrefix:", 0x24D3A88A0);

      v18 = v110;
      if ((v31 & 1) == 0)
      {
        objc_msgSend(v25, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        self = v105;
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 146, v105, CFSTR("Not a valid UA or Aliro aid - %@"), v47, v48, (uint64_t)v46);

        v32 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v132[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v133[0] = v16;
        v133[1] = &unk_24D3B3908;
        v132[1] = CFSTR("Line");
        v132[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_validateCredentials_));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v133[2] = v19;
        v132[3] = *MEMORY[0x24BDD0BA0];
        v49 = (void *)MEMORY[0x24BDD17C8];
        Name = sel_getName(sel_validateCredentials_);
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%s:%d"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v133[3] = v20;
        v34 = (void *)MEMORY[0x24BDBCE70];
        v35 = v133;
        v36 = v132;
        goto LABEL_20;
      }
LABEL_16:
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
        if (v22)
          goto LABEL_7;
        v3 = 0;
        a2 = v107;
        self = v105;
        v9 = v106;
        goto LABEL_22;
      }
    }

LABEL_14:
    goto LABEL_16;
  }
  v107 = a2;
  v108 = v7;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler validateCredentials:]", 133, self, CFSTR("Currently we support a max of two credentials. One Aliro and one UA"), v10, v11, (uint64_t)Name);
  v12 = v9;
  v13 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v14 = objc_claimAutoreleasedReturnValue();
  v137[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v15;
  v138[1] = &unk_24D3B38D8;
  v137[1] = CFSTR("Line");
  v137[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(sel_validateCredentials_));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v138[2] = v16;
  v137[3] = *MEMORY[0x24BDD0BA0];
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = (id)v14;
  Name = sel_getName(sel_validateCredentials_);
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%s:%d"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v138[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v138, v137, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  a2 = v107;
  v7 = v108;
LABEL_22:

  if (v3)
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v130[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x24BDD1398];
    v131[0] = v40;
    v131[1] = v3;
    v130[1] = v41;
    v130[2] = CFSTR("Line");
    v131[2] = &unk_24D3B3920;
    v130[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v131[3] = v42;
    v130[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 166);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v131[4] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 8, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
    v60 = v45;
    goto LABEL_53;
  }
LABEL_27:
  v116.receiver = self;
  v116.super_class = (Class)UnifiedAccessHandler;
  -[STSHandler setActiveCredentials:](&v116, sel_setActiveCredentials_, v7);
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v53 = (void *)v50;
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 173, self, CFSTR("Failed to set active credentials"), v51, v52, (uint64_t)Name);
    v54 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *MEMORY[0x24BDD1398];
    v129[0] = v55;
    v129[1] = v53;
    v128[1] = v56;
    v128[2] = CFSTR("Line");
    v129[2] = &unk_24D3B3938;
    v128[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v129[3] = v57;
    v128[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 174);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v129[4] = v58;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", v39, 8, v59);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v63 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v63)
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 180, self, CFSTR("No resource available"), v61, v62, (uint64_t)Name);
  v64 = self;
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v65 = v7;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
  if (v66)
  {
    v67 = v66;
    v3 = *(void **)v113;
    while (2)
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(void **)v113 != v3)
          objc_enumerationMutation(v65);
        v69 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        objc_msgSend(v69, "subIdentifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v70)
        {
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 186, v64, CFSTR("Invalid credential provided %@"), v71, v72, (uint64_t)v69);
          v94 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v125[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v126[0] = v96;
          v126[1] = &unk_24D3B3950;
          v125[1] = CFSTR("Line");
          v125[2] = CFSTR("Method");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v126[2] = v97;
          v125[3] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 187);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v126[3] = v98;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 4);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "errorWithDomain:code:userInfo:", v95, 8, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = v100;
          goto LABEL_52;
        }
        objc_msgSend(v69, "subIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "identifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKey:", v73, v74);

      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
      if (v67)
        continue;
      break;
    }
  }

  if (v7 && !objc_msgSend(v63, "count"))
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 194, v64, CFSTR("Invalid credentials provided %@"), v75, v76, (uint64_t)v65);
    v101 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v123[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v124[0] = v85;
    v124[1] = &unk_24D3B3968;
    v123[1] = CFSTR("Line");
    v123[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v124[2] = v3;
    v123[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 195);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v124[3] = v86;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 4);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "errorWithDomain:code:userInfo:", v84, 8, v102);
    v93 = objc_claimAutoreleasedReturnValue();

LABEL_49:
    goto LABEL_50;
  }
  nfSession = v64->_nfSession;
  v111 = 0;
  v78 = -[NFUnifiedAccessSession setActivePaymentApplets:error:](nfSession, "setActivePaymentApplets:error:", v63, &v111);
  v79 = v111;
  v82 = v79;
  if ((v78 & 1) != 0)
    goto LABEL_51;
  v109 = v7;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler setActiveCredentials:]", 197, v64, CFSTR("set active applet failed = %@"), v80, v81, (uint64_t)v79);
  v83 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v85;
  v121[1] = *MEMORY[0x24BDD1398];
  v86 = v82;
  if (!v82)
  {
    v87 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "errorWithDomain:code:userInfo:", v3, 5, 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v122[1] = v86;
  v122[2] = &unk_24D3B3980;
  v121[2] = CFSTR("Line");
  v121[3] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v88 = objc_claimAutoreleasedReturnValue();
  v89 = a2;
  v90 = (void *)v88;
  v122[3] = v88;
  v121[4] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(v89), 198);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v91;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 5);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "errorWithDomain:code:userInfo:", v84, 10, v92);
  v93 = objc_claimAutoreleasedReturnValue();

  v7 = v109;
  if (!v82)
    goto LABEL_49;
LABEL_50:

  v82 = (void *)v93;
LABEL_51:
  v60 = v82;
LABEL_52:

LABEL_53:
  return v60;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NFUnifiedAccessSession *nfSession;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[4];
  _QWORD v43[6];

  v43[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v10 = v7;
  if (self->_nfSession)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 218, self, CFSTR("auth: %@  deferred:%d"), v8, v9, (uint64_t)v7);
    nfSession = self->_nfSession;
    if ((a4 & 1) != 0)
    {
      v39 = 0;
      v12 = -[NFUnifiedAccessSession startDeferredCardEmulationWithAuthorization:error:](nfSession, "startDeferredCardEmulationWithAuthorization:error:", v10, &v39);
      v13 = v39;
    }
    else
    {
      v38 = 0;
      v12 = -[NFUnifiedAccessSession startCardEmulationWithAuthorization:error:](nfSession, "startCardEmulationWithAuthorization:error:", v10, &v38);
      v13 = v38;
    }
    v21 = v13;
    v20 = v21;
    if ((v12 & 1) == 0)
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 227, self, CFSTR("start transaction failed = %@"), v22, v23, (uint64_t)v21);
      v35 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v24;
      v40[1] = *MEMORY[0x24BDD1398];
      v25 = v20;
      if (!v20)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41[1] = v25;
      v41[2] = &unk_24D3B39B0;
      v40[2] = CFSTR("Line");
      v40[3] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), a4 & 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[3] = v27;
      v40[4] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 228);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41[4] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 10, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {

      }
      v20 = (void *)v30;
    }
    if (!v20)
    {
      v37.receiver = self;
      v37.super_class = (Class)UnifiedAccessHandler;
      v31 = -[STSTransactionHandler startTransactionWithAuthorization:options:](&v37, sel_startTransactionWithAuthorization_options_, v10, a4);
    }
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler startTransactionWithAuthorization:options:]", 212, self, CFSTR("NF session does not exist!"), v8, v9, v33);
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v16;
    v43[1] = &unk_24D3B3998;
    v42[1] = CFSTR("Line");
    v42[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v17;
    v42[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 213);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 9, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

- (id)stopTransaction
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NFUnifiedAccessSession *nfSession;
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
  v19.super_class = (Class)UnifiedAccessHandler;
  -[STSTransactionHandler stopTransaction](&v19, sel_stopTransaction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nfSession)
  {
    sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[UnifiedAccessHandler stopTransaction]", 249, self, &stru_24D3A78C0, v4, v5, v17);
    nfSession = self->_nfSession;
    v18 = v6;
    -[NFUnifiedAccessSession stopCardEmulation:](nfSession, "stopCardEmulation:", &v18);
    v8 = v18;

    v9 = v8;
    v6 = v9;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessHandler stopTransaction]", 245, self, CFSTR("NF session does not exist!"), v4, v5, v17);
    v10 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = &unk_24D3B39C8;
    v20[1] = CFSTR("Line");
    v20[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 246);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 9, v15);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)unifiedAccessSession:(id)a3 didDetectField:(BOOL)a4
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
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didDetectField:]", 274, self, v8, v4, v5, v9);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireFieldDetectEvent:", v6);

}

- (void)unifiedAccessSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didEnterFieldWithNotification:]", 280, self, CFSTR("%@"), v6, v7, (uint64_t)v5);
  sub_2158CEFF0(v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[STSTransactionHandler parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireFieldNotificationEvent:", v9);

}

- (void)unifiedAccessSession:(id)a3 didSelectApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didSelectApplet:]", 286, self, CFSTR("SELECT: %@"), v4, v5, (uint64_t)a4);
}

- (void)unifiedAccessSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didExpireTransactionForApplet:]", 297, self, CFSTR("EXPIRED: %@"), v4, v5, (uint64_t)a4);
  -[STSTransactionHandler parent](self, "parent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fireDidExpireTransaction:", 1);

}

- (void)unifiedAccessSession:(id)a3 didStartTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  STSTransactionStartEvent *v9;
  void *v10;
  id v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didStartTransaction:]", 303, self, CFSTR("START: %@"), v6, v7, (uint64_t)v5);
  objc_msgSend(v5, "appletIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158D6A50(self, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[STSTransactionStartEvent initWithCredential:andNearFieldStartEvent:]([STSTransactionStartEvent alloc], "initWithCredential:andNearFieldStartEvent:", v11, v5);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionStartEvent:", v9);

}

- (void)unifiedAccessSession:(id)a3 didEndTransaction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  STSTransactionEndEvent *v9;
  void *v10;
  id v11;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didEndTransaction:]", 314, self, CFSTR("END: %@"), v6, v7, (uint64_t)v5);
  objc_msgSend(v5, "appletIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2158D6A50(self, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v9 = -[STSTransactionEndEvent initWithCredential:andNearFieldEndEvent:]([STSTransactionEndEvent alloc], "initWithCredential:andNearFieldEndEvent:", v11, v5);
  -[STSTransactionHandler parent](self, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireTransactionEndEvent:", v9);

}

- (void)unifiedAccessSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
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
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessHandler unifiedAccessSession:didExpressModeStateChange:withObject:]", 336, self, CFSTR("%d - %@"), v8, v9, v5);
  v10 = 0;
  if ((v5 - 1) <= 8)
    v10 = dword_2158DB9B8[(int)v5 - 1];
  v12 = -[STSExpressEventInfoWithDetail initWithState:detail:]([STSExpressEventInfoWithDetail alloc], "initWithState:detail:", v10, v7);

  -[STSTransactionHandler parent](self, "parent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fireExpressModeStateChangeWithInfo:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end
