@implementation ACFCryptograph

- (id)encryptData:(id)a3 withKey:(__SecKey *)a4
{
  uint64_t v6;
  unint64_t v7;
  size_t BlockSize;
  void *v9;
  uint8_t *v10;
  uint8_t *v11;
  OSStatus v12;
  BOOL v13;
  size_t cipherTextLen;

  cipherTextLen = 0;
  v6 = objc_msgSend(a3, "length");
  if (a4
    && v6
    && (v7 = objc_msgSend(a3, "length"), BlockSize = SecKeyGetBlockSize(a4), cipherTextLen = BlockSize, v7 <= BlockSize))
  {
    v10 = (uint8_t *)malloc_type_malloc(BlockSize, 0x988C9ED2uLL);
    if (v10)
    {
      v11 = v10;
      v12 = SecKeyEncrypt(a4, 1u, (const uint8_t *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), v10, &cipherTextLen);
      v9 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v11, cipherTextLen);
      free(v11);
      v13 = v12 == 0 && v9 != 0;
      if (!v13)
        v9 = 0;
      if (v13 || !ACFLog)
        goto LABEL_16;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 52, 0, "Failed to encrypt random key with public key. Status - %d");
    }
  }
  else
  {
    if (!ACFLog)
      return 0;
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 58, 0, "Invalid parameters");
  }
  v9 = 0;
LABEL_16:
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 60, 0, "SIZE TEST: Encrypted random key size is %d", objc_msgSend(v9, "length"));
  return v9;
}

- (id)signatureForData:(id)a3 withKey:(__SecKey *)a4
{
  unint64_t BlockSize;
  id result;
  id v8;
  OSStatus v9;
  uint64_t v10;
  size_t sigLen;

  if (!a3 || !a4 || (BlockSize = SecKeyGetBlockSize(a4), sigLen = BlockSize, BlockSize < objc_msgSend(a3, "length")))
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFCryptograph signatureForData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 89, 0, "Invalid parameters");
    }
    return 0;
  }
  result = malloc_type_malloc(BlockSize, 0x78F43951uLL);
  if (result)
  {
    v8 = result;
    v9 = SecKeyRawSign(a4, 0, (const uint8_t *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), (uint8_t *)result, &sigLen);
    v10 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, sigLen);
    free(v8);
    result = v9 == 0 && v10 != 0 ? (id)v10 : 0;
    if ((v9 != 0 || v10 == 0) && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFCryptograph signatureForData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 83, 0, "Failed to generate sign. Status - %d");
      return 0;
    }
  }
  return result;
}

- (id)decodeBase64:(id)a3
{
  return ACFDecodeBase64(a3);
}

- (id)encodeBase64:(id)a3
{
  return (id)ACFEncodeBase64((uint64_t)a3);
}

- (id)decodeBase16:(id)a3
{
  return (id)ACFDecodeBase16(a3);
}

- (id)encodeBase16:(id)a3
{
  return (id)ACFEncodeBase16(a3);
}

- (id)decodeStringWithObscuredData:(id)a3
{
  return (id)ACFDecodeObscuredString(a3);
}

- (id)encodeObscuredDataWithString:(id)a3 length:(unint64_t)a4
{
  return ACFEncodeObscuredString(a3, a4);
}

- (id)hashStringSHA256WithString:(id)a3
{
  return (id)objc_msgSend(ACFSHA256AsString((void *)objc_msgSend(a3, "dataUsingEncoding:", 4)), "lowercaseString");
}

- (id)hashDataSHA256WithData:(id)a3
{
  return (id)ACFSHA256(a3);
}

- (id)hashDataSHA1WithString:(id)a3
{
  return (id)ACFSHA1(a3);
}

- (id)hashStringSHA1WithString:(id)a3
{
  return ACFSHA1AsString(a3);
}

- (id)randomDataOfLength:(unint64_t)a3
{
  return ACFRandomData(a3);
}

- (id)randomStringOfLength:(unint64_t)a3
{
  return (id)ACFRandomString(a3);
}

- (id)encryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6
{
  return (id)ACFAES128_CBC_Encrypt(a3, a4, a5, a6);
}

- (id)decryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6
{
  return (id)ACFAES128_CBC_Decrypt(a3, a4, a5, a6);
}

- (id)encrypt3DESCBCData:(id)a3 withKey:(id)a4 pading:(BOOL)a5
{
  return (id)ACF3DES_CBC_Encrypt(a3, a4, a5);
}

- (id)decrypt3DESCBCData:(id)a3 withKey:(id)a4
{
  return (id)ACF3DES_CBC_Decrypt(a3, a4);
}

- (id)hmac256DataWithData:(id)a3 key:(id)a4
{
  return (id)ACFHmacSHA256(a3, a4);
}

- (void)fillEncryptionSuffix:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "setLength:", 16);
    qmemcpy((void *)objc_msgSend(a3, "mutableBytes"), "HARDCODEDKEY1321", 16);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACFCryptograph.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != outKey1"));
  }
}

- (void)fillHMACSuffix:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "setLength:", 16);
    qmemcpy((void *)objc_msgSend(a3, "mutableBytes"), "HARDCODEDKEY2abc", 16);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACFCryptograph.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != outKey1"));
  }
}

- (void)clearKey:(id)a3
{
  _BYTE *v4;
  uint64_t i;

  if (a3)
  {
    v4 = (_BYTE *)objc_msgSend(a3, "mutableBytes");
    for (i = objc_msgSend(a3, "length"); i; --i)
      *v4++ = 0;
    objc_msgSend(a3, "setLength:", 0);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACFCryptograph.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != outKey"));
  }
}

- (id)compactDataFromPropertyList:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\t\n"))), "componentsJoinedByString:", &stru_24FCE58F0), "dataUsingEncoding:", 4);
}

- (id)compressData:(id)a3
{
  id result;
  id v5;
  int v6;
  int v7;
  uLongf destLen;

  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACFCryptograph.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != plainData"));
    return 0;
  }
  destLen = compressBound(objc_msgSend(a3, "length"));
  result = (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", destLen);
  if (result)
  {
    v5 = result;
    v6 = compress2((Bytef *)objc_msgSend(result, "mutableBytes"), &destLen, (const Bytef *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 9);
    if (v6)
    {
      if (ACFLog)
      {
        v7 = v6;
        if ((ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"-[ACFCryptograph compressData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 281, 0, "Failed to compress data with error: %d", v7);
      }
      return 0;
    }
    objc_msgSend(v5, "setLength:", destLen);
    return (id)objc_msgSend(v5, "copy");
  }
  return result;
}

- (void)sha1Context:(id)a3 updateWithData:(id)a4
{
  ACFSHA1Update(a3, a4);
}

- (id)sha1ContextFinalize:(id)a3
{
  return (id)ACFSHA1Final(a3);
}

- (void)setLength:(unint64_t)a3 toData:(id)a4
{
  objc_msgSend(a4, "setLength:", a3);
}

@end
