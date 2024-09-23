@implementation TVRMSPairingSession

+ (id)localPairingSession
{
  return (id)objc_opt_new();
}

+ (id)proxyPairingSession
{
  return (id)objc_opt_new();
}

- (TVRMSPairingSession)init
{
  TVRMSPairingSession *v2;
  void *v3;
  uint64_t v4;
  NSString *advertisedAppName;
  uint64_t v6;
  NSString *advertisedDeviceName;
  uint64_t v8;
  NSString *advertisedDeviceModel;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVRMSPairingSession;
  v2 = -[TVRMSPairingSession init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v4 = objc_claimAutoreleasedReturnValue();
    advertisedAppName = v2->_advertisedAppName;
    v2->_advertisedAppName = (NSString *)v4;

    v6 = MGCopyAnswer();
    advertisedDeviceName = v2->_advertisedDeviceName;
    v2->_advertisedDeviceName = (NSString *)v6;

    v8 = MGCopyAnswer();
    advertisedDeviceModel = v2->_advertisedDeviceModel;
    v2->_advertisedDeviceModel = (NSString *)v8;

  }
  return v2;
}

- (void)dealloc
{
  TVRMSPairingSession *v3;
  void *v4;
  objc_super v5;

  objc_msgSend((id)__netService, "delegate");
  v3 = (TVRMSPairingSession *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    objc_msgSend((id)__netService, "stop");
    v4 = (void *)__netService;
    __netService = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)TVRMSPairingSession;
  -[TVRMSPairingSession dealloc](&v5, sel_dealloc);
}

- (void)beginPairing
{
  NSString *v3;
  NSString *passcode;
  void *v5;
  TVRMSPairingServer *v6;
  TVRMSPairingServer *pairingServer;
  id WeakRetained;
  id v9;

  if (!self->_passcode)
  {
    generateRandomPasscode();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    passcode = self->_passcode;
    self->_passcode = v3;

  }
  -[TVRMSPairingSession _generatePublicKey](self, "_generatePublicKey");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRMSPairingSession _expectedPasscodeHashForPasscode:publicKey:](self, "_expectedPasscodeHashForPasscode:publicKey:", self->_passcode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (TVRMSPairingServer *)objc_opt_new();
  pairingServer = self->_pairingServer;
  self->_pairingServer = v6;

  -[TVRMSPairingServer setDelegate:](self->_pairingServer, "setDelegate:", self);
  if (-[TVRMSPairingServer startServerWithExpectedPasscodeHash:advertisedDeviceName:advertisedDeviceModel:](self->_pairingServer, "startServerWithExpectedPasscodeHash:advertisedDeviceName:advertisedDeviceModel:", v5, self->_advertisedDeviceName, self->_advertisedDeviceModel))
  {
    -[TVRMSPairingSession _startBonjourAdvertisingWithPublicKey:httpServerPort:](self, "_startBonjourAdvertisingWithPublicKey:httpServerPort:", v9, -[TVRMSPairingServer port](self->_pairingServer, "port"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pairingSessionDidFail:", self);

  }
}

- (void)endPairing
{
  -[TVRMSPairingServer stopServer](self->_pairingServer, "stopServer");
  objc_msgSend((id)__netService, "stop");
}

- (void)netServiceDidPublish:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  char v6;
  id v7;
  uint8_t v8[16];

  _TVRCRMSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Pairing bonjour service published", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "pairingSession:didBeginPairingWithPasscode:", self, self->_passcode);

  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id WeakRetained;

  -[TVRMSPairingServer stopServer](self->_pairingServer, "stopServer", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pairingSessionDidFail:", self);

}

- (void)netServiceDidStop:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRCRMSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A51B000, v3, OS_LOG_TYPE_DEFAULT, "Pairing bonjour service stopped", v5, 2u);
  }

  v4 = (void *)__netService;
  __netService = 0;

}

- (void)pairingServer:(id)a3 didPairWithService:(id)a4 pairingGUID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _TVRCRMSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Pairing server successfully paired, serviceName=[%@] pairingGUID=[%@]", (uint8_t *)&v11, 0x16u);
  }

  -[TVRMSPairingSession endPairing](self, "endPairing");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pairingSession:didPairWithServiceNetworkName:pairingGUID:", self, v7, v8);

}

- (void)pairingServerDidFail:(id)a3
{
  id WeakRetained;

  -[TVRMSPairingSession endPairing](self, "endPairing", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pairingSessionDidFail:", self);

}

- (void)_startBonjourAdvertisingWithPublicKey:(id)a3 httpServerPort:(unsigned __int16)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  unsigned __int16 v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__TVRMSPairingSession__startBonjourAdvertisingWithPublicKey_httpServerPort___block_invoke;
  block[3] = &unk_24DCD7A70;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__TVRMSPairingSession__startBonjourAdvertisingWithPublicKey_httpServerPort___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("txtvers");
  v13[1] = CFSTR("RemN");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2[4];
  v5 = v2[5];
  v14[0] = CFSTR("1");
  v14[1] = v4;
  v13[2] = CFSTR("DvTy");
  v13[3] = CFSTR("DvNm");
  v14[2] = v2[6];
  v14[3] = v5;
  v13[4] = CFSTR("RemV");
  v13[5] = CFSTR("Pair");
  v14[4] = CFSTR("10000");
  v14[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (__netService)
    objc_msgSend((id)__netService, "stop");
  v7 = objc_alloc(MEMORY[0x24BDD16B8]);
  objc_msgSend(*(id *)(a1 + 32), "_pairingNetServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "initWithDomain:type:name:port:", CFSTR("local."), CFSTR("_touch-remote._tcp."), v8, *(unsigned __int16 *)(a1 + 48));
  v10 = (void *)__netService;
  __netService = v9;

  v11 = (void *)__netService;
  objc_msgSend(MEMORY[0x24BDD16B8], "dataFromTXTRecordDictionary:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTXTRecordData:", v12);

  objc_msgSend((id)__netService, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)__netService, "publish");

}

- (id)_generatePublicKey
{
  unsigned int v2;

  v2 = random();
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.16llX"), bswap64(random() | ((unint64_t)v2 << 32)));
}

- (id)_expectedPasscodeHashForPasscode:(id)a3 publicKey:(id)a4
{
  id v5;
  id v6;
  const void *v7;
  CC_LONG v8;
  id v9;
  const void *v10;
  void *v11;
  _BYTE c[96];
  unsigned __int8 md[16];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(c, 0, 92);
  v5 = a4;
  CC_MD5_Init((CC_MD5_CTX *)c);
  v6 = objc_retainAutorelease(v5);
  v7 = (const void *)objc_msgSend(v6, "UTF8String");
  v8 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);

  CC_MD5_Update((CC_MD5_CTX *)c, v7, v8);
  -[TVRMSPairingSession passcode](self, "passcode");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const void *)objc_msgSend(v9, "cStringUsingEncoding:", 10);
  -[TVRMSPairingSession passcode](self, "passcode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CC_MD5_Update((CC_MD5_CTX *)c, v10, objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 10));

  CC_MD5_Final(md, (CC_MD5_CTX *)c);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X%.2X"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15],
    *(_OWORD *)c,
    *(_QWORD *)&c[16],
    *(_OWORD *)&c[24],
    *(_QWORD *)&c[40],
    *(_OWORD *)&c[48],
    *(_QWORD *)&c[64],
    *(_OWORD *)&c[72],
    *(_QWORD *)&c[88]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pairingNetServiceName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PairingNetServiceName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("PairingNetServiceName"));
    objc_msgSend(v2, "synchronize");
  }

  return v3;
}

- (TVRMSPairingSessionDelegate)delegate
{
  return (TVRMSPairingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_passcode, a3);
}

- (NSString)advertisedAppName
{
  return self->_advertisedAppName;
}

- (void)setAdvertisedAppName:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedAppName, a3);
}

- (NSString)advertisedDeviceName
{
  return self->_advertisedDeviceName;
}

- (void)setAdvertisedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedDeviceName, a3);
}

- (NSString)advertisedDeviceModel
{
  return self->_advertisedDeviceModel;
}

- (void)setAdvertisedDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedDeviceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisedDeviceModel, 0);
  objc_storeStrong((id *)&self->_advertisedDeviceName, 0);
  objc_storeStrong((id *)&self->_advertisedAppName, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pairingServer, 0);
}

@end
