@implementation SDActivityEncryptionKey

+ (id)newEncryptionKey
{
  id v2;
  NSUUID *v3;
  NSDate *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc_init((Class)a1);
  v3 = objc_opt_new(NSUUID);
  objc_msgSend(v2, "setKeyIdentifier:", v3);

  v4 = objc_opt_new(NSDate);
  objc_msgSend(v2, "setDateCreated:", v4);

  v5 = 1;
  objc_msgSend(v2, "setLastUsedCounter:", (unsigned __int16)sub_1000CEA34(CFSTR("BluetoothAdvertiseEncryptionStartCount"), 1));
  if (objc_msgSend(v2, "lastUsedCounter"))
    v5 = (uint64_t)objc_msgSend(v2, "lastUsedCounter");
  objc_msgSend(v2, "setLastUsedCounter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 32));
  objc_msgSend(v2, "setKeyData:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyData"));
  objc_msgSend(v7, "setLength:", 32);

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyData")));
  CCRandomGenerateBytes(objc_msgSend(v8, "mutableBytes"), 0x20uLL);

  return v2;
}

- (void)prepareForNewEncryptionRequest
{
  -[SDActivityKey setLastUsedCounter:](self, "setLastUsedCounter:", (unsigned __int16)(-[SDActivityKey lastUsedCounter](self, "lastUsedCounter") + 1));
  -[SDActivityKey setValidKey:](self, "setValidKey:", -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") != 0);
}

- (unsigned)getTagWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] counterValue:(unsigned __int8)a4[2] forAdvertisementWithVersion:(unsigned __int8)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v13;
  unsigned __int8 v14;

  v14 = a5;
  v13 = 0;
  *a4 = -[SDActivityKey lastUsedCounter](self, "lastUsedCounter");
  a4[1] = -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") >> 8;
  v8 = ccaes_gcm_encrypt_mode();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  v10 = objc_msgSend(v9, "length");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData")));
  ccgcm_one_shot(v8, v10, objc_msgSend(v11, "bytes"), 2, a4, 1, &v14, 10, a3, a3, 1, &v13);

  return v13;
}

@end
