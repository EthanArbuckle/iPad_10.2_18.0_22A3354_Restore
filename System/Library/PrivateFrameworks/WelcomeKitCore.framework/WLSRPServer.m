@implementation WLSRPServer

- (WLSRPServer)initWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  WLSRPServer *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *salt_s;
  uint64_t v13;
  NSData *serverPublicKey_B;
  objc_super v15;
  _BYTE bytes[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WLSRPServer;
  v8 = -[WLSRPServer init](&v15, sel_init);
  if (v8)
  {
    SRP6a_server_method();
    v9 = SRP_new();
    v8->_session = (srp_st *)v9;
    if (v9)
    {
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (!SRP_set_username() && !CCRandomGenerateBytes(bytes, 0x10uLL))
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes, 16);
        v10 = objc_claimAutoreleasedReturnValue();
        salt_s = v8->_salt_s;
        v8->_salt_s = (NSData *)v10;

        if (!SRP_set_params())
        {
          objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
          if (!SRP_set_auth_password() && !SRP_gen_pub())
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0], MEMORY[8]);
            v13 = objc_claimAutoreleasedReturnValue();
            serverPublicKey_B = v8->_serverPublicKey_B;
            v8->_serverPublicKey_B = (NSData *)v13;

            cstr_free();
            goto LABEL_10;
          }
        }
      }
      SRP_free();
      v8->_session = 0;
    }

    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  SRP_free();
  self->_session = 0;
  v3.receiver = self;
  v3.super_class = (Class)WLSRPServer;
  -[WLSRPServer dealloc](&v3, sel_dealloc);
}

- (BOOL)didReceiveClientPublicKey_A:(id)a3 proofOfMatch_M:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  NSData *v9;
  NSData *sharedKey_K;
  id v11;
  int v12;
  _BOOL8 v13;
  int v15;
  NSData *v16;
  NSData *hashOfProofOfMatch_HAMK;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = objc_retainAutorelease(a3);
  objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");

  if (SRP_compute_key())
    v8 = 0;
  else
    v8 = MEMORY[8] != 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (!v8)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0], MEMORY[8], v18);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  sharedKey_K = self->_sharedKey_K;
  self->_sharedKey_K = v9;

  -[NSData wl_hexEncodedString](self->_sharedKey_K, "wl_hexEncodedString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  cstr_free();
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes", v19);
  objc_msgSend(v11, "length");
  v12 = SRP_verify();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12 == 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (!v12)
  {
    v15 = SRP_respond();
    v13 = v15 == 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", MEMORY[0], MEMORY[8], v21);
      v16 = (NSData *)objc_claimAutoreleasedReturnValue();
      hashOfProofOfMatch_HAMK = self->_hashOfProofOfMatch_HAMK;
      self->_hashOfProofOfMatch_HAMK = v16;

      cstr_free();
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)hmacDataForData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "wl_hmacSHA256DataForData:key:", a3, self->_sharedKey_K);
}

- (BOOL)isHmacData:(id)a3 validForData:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v6 = a3;
  -[WLSRPServer hmacDataForData:](self, "hmacDataForData:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wl_hexEncodedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(v7, "wl_hexEncodedString", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v8 = objc_msgSend(v7, "isEqualToData:", v6, v11);
  return v8;
}

- (NSData)salt_s
{
  return self->_salt_s;
}

- (NSData)serverPublicKey_B
{
  return self->_serverPublicKey_B;
}

- (NSData)sharedKey_K
{
  return self->_sharedKey_K;
}

- (NSData)hashOfProofOfMatch_HAMK
{
  return self->_hashOfProofOfMatch_HAMK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashOfProofOfMatch_HAMK, 0);
  objc_storeStrong((id *)&self->_sharedKey_K, 0);
  objc_storeStrong((id *)&self->_serverPublicKey_B, 0);
  objc_storeStrong((id *)&self->_salt_s, 0);
}

@end
