@implementation WLAuthenticationUtilities

+ (id)hashWithString:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

+ (void)generateSelfSignedCertificateWithOrganization:(id)a3 commonName:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, SecKeyRef, __SecKey *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFDictionary *v14;
  __SecKey *RandomKey;
  SecKeyRef v16;
  const __CFAllocator *v17;
  CFArrayRef v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t SelfSignedCertificate;
  CFTypeRef v23;
  CFTypeRef v24;
  CFTypeRef cf;
  CFTypeRef v26;
  void *v27[2];
  void *values[3];

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, SecKeyRef, __SecKey *))a5;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = *MEMORY[0x24BDE9080];
  v12 = *MEMORY[0x24BDE9050];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2048);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v13, *MEMORY[0x24BDE9048], 0);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  RandomKey = SecKeyCreateRandomKey(v14, 0);
  v16 = SecKeyCopyPublicKey(RandomKey);
  values[0] = *(void **)MEMORY[0x24BDE93E0];
  values[1] = v7;
  v27[0] = *(void **)MEMORY[0x24BDE93D0];
  v27[1] = v8;
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v24 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)values, 2, 0);
  v23 = CFArrayCreate(v17, (const void **)v27, 2, 0);
  cf = CFArrayCreate(v17, &v24, 1, 0);
  v26 = CFArrayCreate(v17, &v23, 1, 0);
  v18 = CFArrayCreate(v17, &cf, 2, 0);
  v19 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2147483653);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x24BDE9218], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  SelfSignedCertificate = SecGenerateSelfSignedCertificate();
  if (cf)
    CFRelease(cf);
  if (v26)
    CFRelease(v26);
  if (v18)
    CFRelease(v18);
  if (v23)
    CFRelease(v23);
  if (v24)
    CFRelease(v24);
  if (v9)
    v9[2](v9, SelfSignedCertificate, v16, RandomKey);

}

+ (id)pemFormattedCertificateData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("-----BEGIN CERTIFICATE-----\n"));
  objc_msgSend(a1, "_appendBase64Data:toString:", v5, v6);

  objc_msgSend(v6, "appendString:", CFSTR("\n-----END CERTIFICATE-----\n"));
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_appendBase64Data:(id)a3 toString:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 33);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

}

+ (id)dataFromPEMFormattedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", CFSTR("-----"), (_QWORD)v15) & 1) == 0)
          objc_msgSend(v6, "appendString:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v6, 1);
  return v13;
}

@end
