@implementation POJWTEncryption

+ (id)algorithmWithAlg:(id)a3 enc:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v14;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ECDH-ES"))
    && objc_msgSend(v6, "isEqualToString:", CFSTR("A256GCM")))
  {
    v7 = POJWTEncryptionECDHE_A256GCM;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("dir")))
      goto LABEL_18;
    v18[0] = CFSTR("HPKE-Base-P256-SHA256-AES256GCM");
    v18[1] = CFSTR("HPKE-PSK-P256-SHA256-AES256GCM");
    v18[2] = CFSTR("HPKE-Auth-P256-SHA256-AES256GCM");
    v18[3] = CFSTR("HPKE-Auth_Psk-P256-SHA256-AES256GCM");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v6);

    if (v9)
    {
      v7 = _TtC15PlatformSSOCore39POCryptoKitHPKE_P256_SHA256_AES_GCM_256;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("dir")))
        goto LABEL_19;
LABEL_18:
      v17[0] = CFSTR("HPKE-Base-P384-SHA384-AES256GCM");
      v17[1] = CFSTR("HPKE-PSK-P384-SHA384-AES256GCM");
      v17[2] = CFSTR("HPKE-Auth-P384-SHA384-AES256GCM");
      v17[3] = CFSTR("HPKE-Auth_Psk-P384-SHA384-AES256GCM");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v6);

      if (v11)
      {
        v7 = _TtC15PlatformSSOCore39POCryptoKitHPKE_P384_SHA384_AES_GCM_256;
      }
      else
      {
LABEL_19:
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("dir")))
          goto LABEL_14;
        v16[0] = CFSTR("HPKE-Base-X25519-SHA256-ChaCha20Poly1305");
        v16[1] = CFSTR("HPKE-PSK-X25519-SHA256-ChaCha20Poly1305");
        v16[2] = CFSTR("HPKE-Auth-X25519-SHA256-ChaCha20Poly1305");
        v16[3] = CFSTR("HPKE-Auth_Psk-X25519-SHA256-ChaCha20Poly1305");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v6);

        if (!v13)
        {
LABEL_14:
          v14 = 0;
          goto LABEL_15;
        }
        v7 = _TtC15PlatformSSOCore44POCryptoKitHPKE_Curve25519_SHA256_ChachaPoly;
      }
    }
  }
  v14 = objc_alloc_init(v7);
LABEL_15:

  return v14;
}

+ (id)algorithmWithEncryptionAlgorithm:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F48) & 1) != 0)
  {
    v4 = off_2514FEAF8;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F60) & 1) != 0)
  {
    v4 = off_2514FEE10;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F78) & 1) != 0)
  {
    v4 = off_2514FEE18;
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", 0x251520F90) & 1) != 0)
  {
    v4 = &off_2514FEE20;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToNumber:", 0x251520FA8))
    {
      v5 = 0;
      goto LABEL_12;
    }
    v4 = off_2514FEE08;
  }
  v5 = objc_alloc_init(*v4);
LABEL_12:

  return v5;
}

- (POJWTEncryption)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POJWTEncryption;
  return -[POJWTEncryption init](&v3, sel_init);
}

+ (id)encodeAndEncryptJWT:(id)a3 encryptionAlgorithm:(id)a4 publicKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPrivateKey:(__SecKey *)a9 auth_kid:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  objc_msgSend(a1, "algorithmWithEncryptionAlgorithm:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "encodeAndEncryptJWT:publicKey:otherInfo:psk:psk_id:authPrivateKey:auth_kid:error:", v17, a5, v18, v19, v20, a9, v21, a11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __120__POJWTEncryption_encodeAndEncryptJWT_encryptionAlgorithm_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke();
    v24 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

id __120__POJWTEncryption_encodeAndEncryptJWT_encryptionAlgorithm_publicKey_otherInfo_psk_psk_id_authPrivateKey_auth_kid_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Algorithm not found when encrypting JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTEncryption();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

+ (BOOL)decodeAndDecryptJWT:(id)a3 encryptionAlgorithm:(id)a4 privateKey:(__SecKey *)a5 otherInfo:(id)a6 psk:(id)a7 psk_id:(id)a8 authPublicKey:(__SecKey *)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(a1, "algorithmWithEncryptionAlgorithm:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = objc_msgSend(v20, "decodeAndDecryptJWT:privateKey:otherInfo:psk:psk_id:authPublicKey:error:", v16, a5, v17, v18, v19, a9, a10);
  }
  else
  {
    __111__POJWTEncryption_decodeAndDecryptJWT_encryptionAlgorithm_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke();
    v22 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

id __111__POJWTEncryption_decodeAndDecryptJWT_encryptionAlgorithm_privateKey_otherInfo_psk_psk_id_authPublicKey_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Algorithm not found when decrypting JWT."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POJWTEncryption();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

@end
