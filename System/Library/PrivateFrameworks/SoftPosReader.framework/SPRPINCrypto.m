@implementation SPRPINCrypto

- (SPRPINCrypto)initWithPeerPublicKey:(__SecKey *)a3
{
  self->_peerPublicKey = a3;
  return self;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  __SecKey *peerPublicKey;
  objc_super v9;
  uint8_t buf[4];
  SPRPINCrypto *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_pinCrypto(SPRLogger, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_215968000, v7, OS_LOG_TYPE_INFO, "%@.dealloc()", buf, 0xCu);
  }

  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    CFRelease(peerPublicKey);
    self->_peerPublicKey = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)SPRPINCrypto;
  -[SPRPINCrypto dealloc](&v9, sel_dealloc);
}

- (__SecKey)peerPublicKey
{
  return self->_peerPublicKey;
}

- (SPRPINCrypto)initWithAttestationData:(id)a3 casdCertificate:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v6 = a3;
  v7 = a4;
  v8 = sub_215998CD4();
  v10 = v9;

  v11 = sub_215998CD4();
  v13 = v12;

  return (SPRPINCrypto *)sub_21597C398(v8, v10, v11, v13);
}

- (id)encryptDigit:(unsigned __int8)a3 error:(id *)a4
{
  SPRPINCrypto *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v4 = self;
  sub_21597CDC8();
  v6 = v5;
  v8 = v7;

  v9 = (void *)sub_215998CBC();
  sub_21597AD00(v6, v8);
  return v9;
}

@end
