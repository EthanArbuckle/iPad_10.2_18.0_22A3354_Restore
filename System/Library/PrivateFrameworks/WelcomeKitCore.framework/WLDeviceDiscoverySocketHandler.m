@implementation WLDeviceDiscoverySocketHandler

- (WLDeviceDiscoverySocketHandler)initWithSocket:(int)a3 srpPassword:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  WLDeviceDiscoverySocketHandler *v11;
  WLDeviceDiscoverySocketHandler *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *writeQueue;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WLDeviceDiscoverySocketHandler;
  v11 = -[WLSocketHandler init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_srpPassword, a4);
    v13 = dispatch_queue_create("Socket Write Serialization Queue", 0);
    writeQueue = v12->_writeQueue;
    v12->_writeQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_sockfd = a3;
  }

  return v12;
}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WLDeviceDiscoverySocketHandler_resume__block_invoke;
  block[3] = &unk_24E375DE8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __40__WLDeviceDiscoverySocketHandler_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performSRPAuthenticationAndHandshake");
}

- (void)close
{
  close(self->_sockfd);
}

- (void)invalidateWithError:(id)a3
{
  NSObject *readSource;
  id v5;
  id WeakRetained;

  readSource = self->_readSource;
  v5 = a3;
  dispatch_source_cancel(readSource);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deviceDiscoverySocketHandler:didFailToHandshakeWithSourceDevice:error:", self, self->_sourceDevice, v5);

}

- (void)_performSRPAuthenticationAndHandshake
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id *v14;
  void *v15;
  void *v16;
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
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id WeakRetained;
  CFDataRef v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id *v52;
  id v53;
  void *v54;
  id v55;
  id *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _BOOL8 v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  WLDeviceDiscoverySocketHandler *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  dispatch_semaphore_t v104;
  WLSRPServer *v105;
  id v106;
  _QWORD v107[5];
  NSObject *v108;
  uint64_t *v109;
  id v110;
  _QWORD v111[5];
  NSObject *v112;
  uint64_t *v113;
  id v114;
  _QWORD v115[5];
  NSObject *v116;
  uint64_t *v117;
  id obj;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  _QWORD v125[3];
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  const __CFString *v129;
  uint64_t v130;
  const __CFString *v131;
  uint64_t v132;
  const __CFString *v133;
  uint64_t v134;
  const __CFString *v135;
  uint64_t v136;
  const __CFString *v137;
  _QWORD v138[2];
  uint64_t v139;
  _QWORD v140[3];

  v140[1] = *MEMORY[0x24BDAC8D0];
  -[WLSocketHandler beginReadingIntoCacheFromSocket:](self, "beginReadingIntoCacheFromSocket:", self->_sockfd);
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__4;
  v123 = __Block_byref_object_dispose__4;
  v124 = 0;
  v104 = dispatch_semaphore_create(0);
  v105 = 0;
  if (v120[5])
    goto LABEL_5;
  _WLLog();
  v3 = (id *)(v120 + 5);
  obj = (id)v120[5];
  -[WLSocketHandler waitForCommand:fromReadCacheReturningError:](self, "waitForCommand:fromReadCacheReturningError:", CFSTR("AUTHENTICATE"), &obj, self);
  objc_storeStrong(v3, obj);
  v83 = self;
  v90 = v120[5];
  _WLLog();
  if (v120[5])
    goto LABEL_3;
  v105 = -[WLSRPServer initWithUsername:password:]([WLSRPServer alloc], "initWithUsername:password:", CFSTR("movetoios"), self->_srpPassword, self, v90);
  v83 = self;
  _WLLog();
  if (!v105)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v139 = *MEMORY[0x24BDD0FC8];
    v140[0] = CFSTR("Failed to create SRP session");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, &v139, 1, self, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v120[5];
    v120[5] = v20;

LABEL_3:
    v105 = 0;
  }
LABEL_5:
  if (v120[5])
    goto LABEL_18;
  v4 = (void *)MEMORY[0x24BDBCE50];
  -[WLSRPServer salt_s](v105, "salt_s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wl_hexEncodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v6;
  -[WLSRPServer serverPublicKey_B](v105, "serverPublicKey_B");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wl_hexEncodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v138[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wl_lengthPrefixedBlobSequenceFromDataArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLSRPServer salt_s](v105, "salt_s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wl_hexEncodedString");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  -[WLSRPServer serverPublicKey_B](v105, "serverPublicKey_B", v84);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wl_hexEncodedString");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "length", v85));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v115[0] = MEMORY[0x24BDAC760];
  v115[1] = 3221225472;
  v115[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke;
  v115[3] = &unk_24E376BD8;
  v115[4] = self;
  v117 = &v119;
  v13 = v104;
  v116 = v13;
  -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v10, v115, self, v91);
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  if (v120[5])
    goto LABEL_18;
  _WLLog();
  v14 = (id *)(v120 + 5);
  v114 = (id)v120[5];
  -[WLSocketHandler waitForBlobDataFromReadCacheReturningError:](self, "waitForBlobDataFromReadCacheReturningError:", &v114, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v14, v114);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
  v83 = self;
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v120[5])
  {
    v16 = 0;
    v17 = 0;
  }
  else
  {
    _WLLog();
    objc_msgSend(v15, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 2, self, v92);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v22 != 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (v22)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0, self, v93);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "wl_utf8String");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      objc_msgSend(v22, "objectAtIndexedSubscript:", 1, v86);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "wl_utf8String");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      v25 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0, v87);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "wl_dataFromHexEncodedData:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "wl_dataFromHexEncodedData:", v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v136 = *MEMORY[0x24BDD0FC8];
      v137 = CFSTR("Failed to parse client public key and proof of match");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1, self, v93);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v28);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v120[5];
      v120[5] = v30;

      v17 = 0;
      v16 = 0;
    }

    if (!v120[5])
    {
      _WLLog();
      v32 = -[WLSRPServer didReceiveClientPublicKey_A:proofOfMatch_M:](v105, "didReceiveClientPublicKey_A:proofOfMatch_M:", v16, v17, self);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
      v83 = self;
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      if ((v32 & 1) == 0)
      {
        v33 = (void *)MEMORY[0x24BDD1540];
        v134 = *MEMORY[0x24BDD0FC8];
        v135 = CFSTR("Failed to validate client public key and proof of match");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1, self, v94);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v34);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v120[5];
        v120[5] = v35;

      }
    }
  }

  if (v120[5])
    goto LABEL_18;
  -[WLSRPServer hashOfProofOfMatch_HAMK](v105, "hashOfProofOfMatch_HAMK");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "wl_hexEncodedData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "wl_lengthPrefixedBlob");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v39, "length"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v111[0] = MEMORY[0x24BDAC760];
  v111[1] = 3221225472;
  v111[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_2;
  v111[3] = &unk_24E376BD8;
  v111[4] = self;
  v113 = &v119;
  v40 = v13;
  v112 = v40;
  -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v39, v111, self, v95);
  dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);

  if (v120[5])
  {
LABEL_18:
    v103 = 0;
  }
  else
  {
    _WLLog();
    +[WLAuthenticationCredentials generateAuthenticationCredentialsContainingSelfSignedCertificate](WLAuthenticationCredentials, "generateAuthenticationCredentialsContainingSelfSignedCertificate", self);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v103 != 0);
    v83 = self;
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (!v120[5])
    {
      _WLLog();
      v56 = (id *)(v120 + 5);
      v110 = (id)v120[5];
      -[WLSocketHandler waitForBlobDataFromReadCacheReturningError:](self, "waitForBlobDataFromReadCacheReturningError:", &v110, self, v97);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v56, v110);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v57, "length"));
      v83 = self;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      _WLLog();

      if (v120[5])
      {
        v58 = 0;
        v59 = 0;
        v60 = 0;
      }
      else
      {
        _WLLog();
        objc_msgSend(v57, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 3, self, v98);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v61 != 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        _WLLog();

        if (v61)
        {
          objc_msgSend(v61, "objectAtIndex:", 0, self, v99);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndex:", 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", 2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "wl_utf8String");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          v63 = (void *)MEMORY[0x24BDBCE50];
          objc_msgSend(v61, "objectAtIndexedSubscript:", 2, v89);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "wl_dataFromHexEncodedData:", v64);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = (void *)MEMORY[0x24BDD1540];
          v132 = *MEMORY[0x24BDD0FC8];
          v133 = CFSTR("Failed to parse client cert and handshake and mac");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1, self, v99);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v64);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)v120[5];
          v120[5] = v66;

          v58 = 0;
          v59 = 0;
          v60 = 0;
        }

        if (!v120[5])
        {
          _WLLog();
          v68 = (void *)objc_msgSend(v60, "mutableCopy", self);
          objc_msgSend(v68, "appendData:", v59);
          v69 = -[WLSRPServer isHmacData:validForData:](v105, "isHmacData:validForData:", v58, v68);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v69);
          v83 = self;
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          if ((v69 & 1) == 0)
          {
            v70 = (void *)MEMORY[0x24BDD1540];
            v130 = *MEMORY[0x24BDD0FC8];
            v131 = CFSTR("Client cert and handshake data does not match MAC");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1, self, v100);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v71);
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = (void *)v120[5];
            v120[5] = v72;

          }
          if (!v120[5])
          {
            objc_msgSend(v103, "setRemoteCertificate:", SecCertificateCreateWithPEM());
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v103, "remoteCertificate") != 0);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            _WLLog();

            if (!objc_msgSend(v103, "remoteCertificate", self, v101))
            {
              v74 = (void *)MEMORY[0x24BDD1540];
              v128 = *MEMORY[0x24BDD0FC8];
              v129 = CFSTR("Failed to create client cert");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v75);
              v76 = objc_claimAutoreleasedReturnValue();
              v77 = (void *)v120[5];
              v120[5] = v76;

            }
          }
        }
      }
      if (!v120[5])
      {
        _WLLog();
        v78 = -[WLDeviceDiscoverySocketHandler _didReceiveHandshakeData:](self, "_didReceiveHandshakeData:", v59, self);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v78);
        v83 = self;
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        _WLLog();

        if (!v78)
        {
          v79 = (void *)MEMORY[0x24BDD1540];
          v126 = *MEMORY[0x24BDD0FC8];
          v127 = CFSTR("Failed to parse client handshake data");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1, self, v102);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v80);
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = (void *)v120[5];
          v120[5] = v81;

        }
      }

    }
  }
  if (-[WLSourceDevice isSelectingDataTypeInHandshake](self->_sourceDevice, "isSelectingDataTypeInHandshake", v83))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "deviceDiscoverySocketHandler:didDiscoverCandidate:", self, self->_sourceDevice);

  }
  if (!v120[5])
  {
    v42 = SecCertificateCopyData((SecCertificateRef)objc_msgSend(v103, "localCertificate"));
    +[WLAuthenticationUtilities pemFormattedCertificateData:](WLAuthenticationUtilities, "pemFormattedCertificateData:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDeviceDiscoverySocketHandler _handshakeResponseData](self, "_handshakeResponseData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "mutableCopy");
    objc_msgSend(v45, "appendData:", v44);
    -[WLSRPServer hmacDataForData:](v105, "hmacDataForData:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "wl_hexEncodedString");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v47 = (void *)MEMORY[0x24BDBCE50];
    v125[0] = v43;
    v125[1] = v44;
    objc_msgSend(v46, "wl_hexEncodedData", v88);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v125[2] = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "wl_lengthPrefixedBlobSequenceFromDataArray:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v50, "length"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    v107[0] = MEMORY[0x24BDAC760];
    v107[1] = 3221225472;
    v107[2] = __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_3;
    v107[3] = &unk_24E376BD8;
    v107[4] = self;
    v109 = &v119;
    v51 = v104;
    v108 = v51;
    -[WLDeviceDiscoverySocketHandler sendData:completion:](self, "sendData:completion:", v50, v107, self, v96);
    dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);

    if (!v120[5] && (-[WLSourceDevice useMigrationKit](self->_sourceDevice, "useMigrationKit") & 1) == 0)
    {
      _WLLog();
      v52 = (id *)(v120 + 5);
      v106 = (id)v120[5];
      -[WLSocketHandler waitForCommand:fromReadCacheReturningError:](self, "waitForCommand:fromReadCacheReturningError:", CFSTR("OK"), &v106, self);
      objc_storeStrong(v52, v106);
      _WLLog();
    }
  }
  if (v120[5] || (-[WLSocketHandler endReadingIntoCache](self, "endReadingIntoCache"), v120[5]))
  {
    _WLLog();
    v53 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v53, "deviceDiscoverySocketHandler:didFailToHandshakeWithSourceDevice:error:", self, self->_sourceDevice, v120[5], self);
  }
  else
  {
    _WLLog();
    v53 = objc_alloc_init(MEMORY[0x24BEC2808]);
    +[WLCredentialStore sharedInstance](WLCredentialStore, "sharedInstance", self);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setCredentials:forAuthentication:", v103, v53);

    v55 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v55, "deviceDiscoverySocketHandler:didFinishHandshakeWithSourceDevice:", self, self->_sourceDevice);

  }
  _Block_object_dispose(&v119, 8);

}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__WLDeviceDiscoverySocketHandler__performSRPAuthenticationAndHandshake__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_commandStringWithData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  v9 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v8, 4, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "hasSuffix:", v10);

  if ((_DWORD)v7)
  {
    objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v9, "length") - 2, 2, &stru_24E376E00);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  return v9;
}

- (id)_okResponseData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OK\r\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_handshakeCommandData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HANDSHAKE\r\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_didReceiveHandshakeData:(id)a3
{
  id v4;
  WLSourceDevice *v5;
  WLSourceDevice *sourceDevice;
  in_addr v7;
  void *v8;
  WLSourceDeviceHandshakeParser *v9;
  BOOL v10;
  void *v12;
  socklen_t v13;
  sockaddr v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (WLSourceDevice *)objc_alloc_init(MEMORY[0x24BEC2838]);
  sourceDevice = self->_sourceDevice;
  self->_sourceDevice = v5;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
  _WLLog();

  *(_QWORD *)&v14.sa_len = 0;
  *(_QWORD *)&v14.sa_data[6] = 0;
  v13 = 16;
  if (getpeername(self->_sockfd, &v14, &v13))
  {
    _WLLog();
  }
  else
  {
    v7.s_addr = *(_DWORD *)&v14.sa_data[2];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", inet_ntoa(v7), self, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLSourceDevice setIpAddress:](self->_sourceDevice, "setIpAddress:", v8);

  }
  v9 = objc_alloc_init(WLSourceDeviceHandshakeParser);
  v10 = -[WLSourceDeviceHandshakeParser parseData:modifyingSourceDevice:completion:](v9, "parseData:modifyingSourceDevice:completion:", v4, self->_sourceDevice, &__block_literal_global_11);

  return v10;
}

- (id)_handshakeResponseData
{
  xmlDoc *v3;
  xmlNode *v4;
  xmlNode *v5;
  id v6;
  void *v7;
  int size;
  xmlChar *mem;

  v3 = xmlNewDoc((const xmlChar *)"1.0");
  v4 = xmlNewNode(0, (const xmlChar *)"root");
  xmlDocSetRootElement(v3, v4);
  v5 = xmlNewChild(v4, 0, (const xmlChar *)"device_info", 0);
  +[WLDevice deviceName](WLDevice, "deviceName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xmlNewChild(v5, 0, (const xmlChar *)"name", (const xmlChar *)objc_msgSend(v6, "UTF8String"));

  xmlNewChild(v5, 0, (const xmlChar *)"supports_name", (const xmlChar *)"1");
  xmlNewChild(v5, 0, (const xmlChar *)"port", (const xmlChar *)"0");
  xmlNewChild(v5, 0, (const xmlChar *)"device_type", (const xmlChar *)"ios");
  xmlNewChild(v5, 0, (const xmlChar *)"supports_role", (const xmlChar *)"migration_target");
  xmlNewChild(v5, 0, (const xmlChar *)"protocol_version", (const xmlChar *)"2");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"photos");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"contacts");
  xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"calendar");
  if (-[WLSourceDevice isSelectingDataTypeInHandshake](self->_sourceDevice, "isSelectingDataTypeInHandshake"))xmlNewChild(v5, 0, (const xmlChar *)"is_selecting_data_type_in_handshake", (const xmlChar *)"1");
  if (-[WLSourceDevice useMigrationKit](self->_sourceDevice, "useMigrationKit"))
    xmlNewChild(v5, 0, (const xmlChar *)"upgrade", (const xmlChar *)"api/2.0");
  if (-[WLSourceDevice canAddDisplay](self->_sourceDevice, "canAddDisplay"))
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"display");
  if (-[WLSourceDevice canAddAccessibility](self->_sourceDevice, "canAddAccessibility"))
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"accessibility");
  if (-[WLSourceDevice canAddFiles](self->_sourceDevice, "canAddFiles"))
    xmlNewChild(v5, 0, (const xmlChar *)"can_add", (const xmlChar *)"files");
  xmlNewChild(v5, 0, (const xmlChar *)"supports_retry_after", (const xmlChar *)"1");
  if (WLLoggingEnabled())
    xmlNewChild(v5, 0, (const xmlChar *)"logging_enabled", (const xmlChar *)"1");
  mem = 0;
  size = 0;
  xmlDocDumpFormatMemory(v3, &mem, &size, 0);
  if (mem)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", mem, size);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  xmlFreeDoc(v3);
  xmlCleanupParser();
  return v7;
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *writeQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke;
  block[3] = &unk_24E376C40;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(writeQueue, block);

}

void __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  v4 = objc_msgSend(*(id *)(a1 + 40), "length");
  v5 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 72);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke_2;
  v7[3] = &unk_24E376548;
  v6 = *(id *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v2, "writeBytes:length:toSocket:completion:", v3, v4, v5, v7);

}

void __54__WLDeviceDiscoverySocketHandler_sendData_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v7;
  }
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateWithError:", 0);
    v5 = v7;
  }

}

- (int)sockfd
{
  return self->_sockfd;
}

- (WLDeviceDiscoverySocketHandlerDelegate)delegate
{
  return (WLDeviceDiscoverySocketHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceDevice, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_srpPassword, 0);
}

@end
