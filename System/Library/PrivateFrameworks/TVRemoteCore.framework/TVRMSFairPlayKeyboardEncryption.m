@implementation TVRMSFairPlayKeyboardEncryption

- (void)dealloc
{
  __SecKey *pubKeyRef;
  objc_super v4;

  pubKeyRef = self->_pubKeyRef;
  if (pubKeyRef)
    CFRelease(pubKeyRef);
  v4.receiver = self;
  v4.super_class = (Class)TVRMSFairPlayKeyboardEncryption;
  -[TVRMSFairPlayKeyboardEncryption dealloc](&v4, sel_dealloc);
}

- (id)encryptString:(id)a3
{
  id v4;
  void *v5;
  NSUInteger v6;
  size_t v7;
  uint8_t *v8;
  id v9;
  __SecKey *pubKeyRef;
  void *v11;
  void *v13;
  void *v14;
  size_t cipherTextLen;
  uint8_t cipherText[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t plainText[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)plainText = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)cipherText = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = -[NSData length](self->_challenge, "length");
    v7 = objc_msgSend(v5, "length") + v6;
    if (v7 > 0x7F)
      goto LABEL_5;
    -[NSData bytes](self->_challenge, "bytes");
    -[NSData length](self->_challenge, "length");
    __memcpy_chk();
    v8 = &plainText[-[NSData length](self->_challenge, "length")];
    v9 = objc_retainAutorelease(v5);
    memcpy(v8, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    plainText[0] = 1;
    cipherTextLen = 128;
    pubKeyRef = self->_pubKeyRef;
    if (!pubKeyRef)
      goto LABEL_5;
    if (!SecKeyEncrypt(pubKeyRef, 1u, plainText, v7, cipherText, &cipherTextLen))
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", cipherText, cipherTextLen);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRMSFairPlayKeyboardEncryption _convertDataToString:](self, "_convertDataToString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_5:
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setLeafString:(id)a3
{
  id v4;

  if (!self->_certIsTrusted)
  {
    -[TVRMSFairPlayKeyboardEncryption _convertStringToData:](self, "_convertStringToData:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      self->_certIsTrusted = -[TVRMSFairPlayKeyboardEncryption _verifyCert:](self, "_verifyCert:", v4);

  }
}

- (void)setChallengeString:(id)a3
{
  NSData **p_challenge;
  NSData *challenge;
  id v6;
  id obj;

  p_challenge = &self->_challenge;
  challenge = self->_challenge;
  self->_challenge = 0;
  v6 = a3;

  -[TVRMSFairPlayKeyboardEncryption _convertStringToData:](self, "_convertStringToData:", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(obj, "length"))
    objc_storeStrong((id *)p_challenge, obj);

}

- (BOOL)isTrusted
{
  return self->_certIsTrusted;
}

- (void)reset
{
  NSData *challenge;

  challenge = self->_challenge;
  self->_challenge = 0;

  self->_certIsTrusted = 0;
}

- (id)_convertStringToData:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4 >> 1;
  v6 = (char *)malloc_type_malloc((v4 >> 1) + 4, 0xD188F7D0uLL);
  v7 = v6;
  if (v4 >= 2)
  {
    v8 = 0;
    if (v5 <= 1)
      v9 = 1;
    else
      v9 = v5;
    v10 = v6;
    do
    {
      objc_msgSend(v3, "substringWithRange:", v8, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scanHexInt:", v10);

      ++v10;
      v8 += 2;
      --v9;
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v7, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_convertDataToString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  unsigned __int8 *v6;
  void *i;
  unsigned int v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    v8 = *v6++;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "appendString:", v9);

  }
  return i;
}

- (BOOL)_verifyCert:(id)a3
{
  const __CFData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  const __CFData *v12;
  uint64_t v13;
  BOOL v14;
  const __CFAllocator *v15;
  CFArrayRef v16;
  SecPolicyRef BasicX509;
  int v19;
  SecTrustRef trust;
  void *values;
  CFTypeRef v22;
  CFTypeRef cf;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFData *)a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("6e1fcd66-79ec-430e-b5f5-42ee88a7a3c4"), CFSTR("der"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || !objc_msgSend(v7, "length"))
    {
      v14 = 0;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForResource:ofType:", CFSTR("b1b56718-0ea0-4953-8027-f60a618e56fd"), CFSTR("der"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v14 = 0;
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v10);
    v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = -[__CFData length](v11, "length");
      v14 = 0;
      if (!v4 || !v13)
        goto LABEL_31;
      if (-[__CFData length](v4, "length"))
      {
        values = 0;
        v22 = 0;
        cf = 0;
        trust = 0;
        v19 = 0;
        v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        cf = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], v12);
        if (cf
          && (v22 = SecCertificateCreateWithData(v15, (CFDataRef)v8)) != 0
          && (values = SecCertificateCreateWithData(v15, v4)) != 0
          && (v16 = CFArrayCreate(0, (const void **)&values, 3, 0)) != 0)
        {
          BasicX509 = SecPolicyCreateBasicX509();
          v14 = BasicX509
             && !SecTrustCreateWithCertificates(v16, BasicX509, &trust)
             && MEMORY[0x220745C0C](trust, &v19) == 0;
          CFRelease(v16);
        }
        else
        {
          BasicX509 = 0;
          v14 = 0;
        }
        if (cf)
          CFRelease(cf);
        if (v22)
          CFRelease(v22);
        if (values)
          CFRelease(values);
        if (BasicX509)
          CFRelease(BasicX509);
        if (trust)
        {
          self->_pubKeyRef = (__SecKey *)MEMORY[0x220745BF4]();
          CFRelease(trust);
        }
        goto LABEL_31;
      }
    }
    v14 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v14 = 0;
LABEL_34:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
