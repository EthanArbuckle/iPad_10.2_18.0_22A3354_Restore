@implementation SFUCryptoUtils

+ (BOOL)generateRandomDataInBuffer:(char *)a3 length:(unint64_t)a4
{
  FILE *v6;
  FILE *v7;
  BOOL v8;

  v6 = fopen("/dev/random", "r");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = fread(a3, a4, 1uLL, v6) == 1;
  fclose(v7);
  return v8;
}

+ (id)generateRandomSalt
{
  return (id)objc_msgSend((id)objc_opt_class(), "generateRandomSaltWithLength:", 32);
}

+ (id)generateRandomSaltWithLength:(unint64_t)a3
{
  void *v5;

  v5 = malloc_type_calloc(a3, 1uLL, 0x100004077774924uLL);
  if (objc_msgSend(a1, "generateRandomDataInBuffer:length:", v5, a3))
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, a3, 1);
  free(v5);
  return 0;
}

+ (id)hashForPassphrase:(id)a3 withSalt:(id)a4
{
  void *v6;

  if (!a3 || !a4)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a4);
  objc_msgSend(v6, "appendData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
  return (id)objc_msgSend(a1, "sha256HashFromData:", v6);
}

+ (unsigned)ivLengthForKey:(id)a3
{
  return 16 * (objc_msgSend(a3, "keyType") == 0);
}

+ (id)generatePassphraseVerifierForKey:(id)a3 verifierVersion:(unsigned __int16)a4
{
  unsigned int v4;
  id v7;
  uint64_t v8;
  void *v9;
  SFUMemoryOutputStream *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  SFUCryptor *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  CC_SHA256_CTX c;
  int v25;
  __int16 v26;
  __int16 v27;
  id v28;
  unsigned __int8 md[32];
  _BYTE data[32];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "keyType"))
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptoUtils.mm"), 113, CFSTR("Unsupported key type"));
    return 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v28 = 0;
    v10 = -[SFUMemoryOutputStream initWithData:]([SFUMemoryOutputStream alloc], "initWithData:", v9);
    v27 = v4;
    v26 = 1;
    -[SFUMemoryOutputStream writeBuffer:size:](v10, "writeBuffer:size:", &v27, 2);
    -[SFUMemoryOutputStream writeBuffer:size:](v10, "writeBuffer:size:", &v26, 2);
    v25 = objc_msgSend(a3, "iterationCount");
    -[SFUMemoryOutputStream writeBuffer:size:](v10, "writeBuffer:size:", &v25, 4);
    if (v4 >= 2)
      -[SFUMemoryOutputStream writeBuffer:size:](v10, "writeBuffer:size:", objc_msgSend((id)objc_msgSend(a3, "saltData"), "bytes"), objc_msgSend((id)objc_msgSend(a3, "saltData"), "length"));
    v11 = objc_msgSend(a1, "ivLengthForKey:", a3);
    MEMORY[0x24BDAC7A8]();
    v13 = (char *)&c - v12;
    objc_msgSend(a1, "generateRandomDataInBuffer:length:", (char *)&c - v12, v11);
    -[SFUMemoryOutputStream writeBuffer:size:](v10, "writeBuffer:size:", v13, v11);
    v14 = -[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]([SFUCryptor alloc], "initWithKey:operation:iv:ivLength:usePKCS7Padding:", a3, 0, v13, v11, v4 == 1);
    objc_msgSend(a1, "generateRandomDataInBuffer:length:", data, 32);
    if (!-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:error:](v14, "cryptDataFromBuffer:length:toStream:finished:error:", data, 32, v10, 0, &v28))
    {

      v15 = (void *)MEMORY[0x24BDBCE88];
      v16 = *MEMORY[0x24BDBCA98];
      v17 = objc_msgSend(v28, "localizedDescription");
      objc_msgSend(v15, "raise:format:", v16, CFSTR("SFUCryptor failed. %@: %@"), v17, objc_msgSend(v28, "localizedFailureReason"));
      v10 = 0;
      v14 = 0;
    }
    if (CC_SHA256_Init(&c) && CC_SHA256_Update(&c, data, 0x20u) && CC_SHA256_Final(md, &c))
    {
      if (!-[SFUCryptor cryptDataFromBuffer:length:toStream:finished:error:](v14, "cryptDataFromBuffer:length:toStream:finished:error:", md, 32, v10, 1, &v28))
      {

        v18 = (void *)MEMORY[0x24BDBCE88];
        v19 = *MEMORY[0x24BDBCA98];
        v20 = objc_msgSend(v28, "localizedDescription");
        objc_msgSend(v18, "raise:format:", v19, CFSTR("SFUCryptor failed. %@: %@"), v20, objc_msgSend(v28, "localizedFailureReason"));
        v14 = 0;
        v10 = 0;
      }
    }
    else
    {
      v21 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptoUtils.mm"), 167, CFSTR("CC_SHA256 failed"));
      v9 = 0;
    }

  }
  return v9;
}

+ (unsigned)iterationCountFromPassphraseVerifier:(id)a3
{
  SFUMemoryInputStream *v4;
  uint64_t v5;
  unsigned int v7;

  v4 = -[SFUMemoryInputStream initWithData:]([SFUMemoryInputStream alloc], "initWithData:", a3);
  if ((objc_msgSend((id)objc_opt_class(), "isEncryptionVersionAndFormatSupportedInPassphraseVerifier:", a3) & 1) != 0)
  {
    -[SFUMemoryInputStream seekToOffset:](v4, "seekToOffset:", 4);
    v7 = 0;
    v5 = -[SFUMemoryInputStream readToBuffer:size:](v4, "readToBuffer:size:", &v7, 4);

    if (v5 == 4)
      return v7;
    else
      return 0;
  }
  else
  {

    return 0;
  }
}

+ (id)saltFromVerifier:(id)a3 saltLength:(unint64_t)a4
{
  SFUMemoryInputStream *v7;
  id v8;
  uint64_t v10;
  _BYTE v11[6];
  __int16 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = -[SFUMemoryInputStream initWithData:]([SFUMemoryInputStream alloc], "initWithData:", a3);
  if ((objc_msgSend((id)objc_opt_class(), "isEncryptionVersionAndFormatSupportedInPassphraseVerifier:", a3) & 1) != 0)
  {
    v12 = 0;
    if (-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v12, 2) == 2 && v12)
    {
      if (v12 == 1)
      {
        v8 = (id)objc_msgSend(a1, "saltForSageFiles");
      }
      else
      {
        v10 = -[SFUMemoryInputStream seekToOffset:](v7, "seekToOffset:", 8);
        MEMORY[0x24BDAC7A8](v10);
        if (-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v11[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)], a4) == a4)v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v11[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)], a4);
        else
          v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {

    return 0;
  }
  return v8;
}

+ (id)saltForSageFiles
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", "someSalt", 8);
}

+ (BOOL)checkKey:(id)a3 againstPassphraseVerifier:(id)a4
{
  SFUMemoryInputStream *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  SFUCryptor *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  int v21;
  uint64_t v26;
  CC_SHA256_CTX c;
  uint64_t v28;
  uint64_t v29;
  int v30;
  __int16 v31;
  unsigned __int16 v32;
  unsigned __int8 md[8];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE data[32];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = -[SFUMemoryInputStream initWithData:]([SFUMemoryInputStream alloc], "initWithData:", a4);
  v32 = 0;
  if (-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v32, 2) == 2
    && (v8 = v32, v31 = 0, -[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v31, 2) == 2)
    && (objc_msgSend((id)objc_opt_class(), "isEncryptionVersionAndFormatSupportedInPassphraseVerifier:", a4) & 1) != 0
    && (v30 = 0, -[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v30, 4) == 4)
    && (v9 = v30, v9 == objc_msgSend(a3, "iterationCount"))
    && (v8 < 2
     || (v10 = objc_msgSend((id)objc_msgSend(a3, "saltData"), "length"),
         MEMORY[0x24BDAC7A8](v10),
         -[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:") == v10)))
  {
    v11 = objc_msgSend(a1, "ivLengthForKey:", a3);
    v12 = v11;
    v13 = v11;
    MEMORY[0x24BDAC7A8](v11);
    v15 = (char *)&v26 - v14;
    if (-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", (char *)&v26 - v14, v13) == v12)
    {
      v16 = -[SFUCryptor initWithKey:operation:iv:ivLength:usePKCS7Padding:]([SFUCryptor alloc], "initWithKey:operation:iv:ivLength:usePKCS7Padding:", a3, 1, v15, v13, v8 == 1);
      v17 = 0;
      v28 = 0;
      v29 = 0;
      do
      {
        v18 = v17;
        v19 = -[SFUCryptor cryptDataFromStream:toBuffer:length:bytesRead:error:](v16, "cryptDataFromStream:toBuffer:length:bytesRead:error:", v7, &data[v17], 64 - v17, &v29, &v28);
        v17 = v29 + v18;
      }
      while (v19 && v29 != 0);

      LOBYTE(v21) = 0;
      if (v18 == 64 && !v28)
      {
        v21 = CC_SHA256_Init(&c);
        if (v21)
        {
          v21 = CC_SHA256_Update(&c, data, 0x20u);
          if (v21)
          {
            v21 = CC_SHA256_Final(md, &c);
            if (v21)
              LOBYTE(v21) = v38 == *(_QWORD *)md && v39 == v34 && v40 == v35 && v41 == v36;
          }
        }
      }
    }
    else
    {

      LOBYTE(v21) = 0;
    }
  }
  else
  {

    LOBYTE(v21) = 0;
  }
  return v21;
}

+ (BOOL)isEncryptionVersionAndFormatSupportedInPassphraseVerifier:(id)a3
{
  unsigned __int16 *v4;

  v4 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  return (unint64_t)objc_msgSend(a3, "length") >= 4 && *v4 - 1 <= 1 && v4[1] == 1;
}

+ (id)newBufferedInputStreamForDecryptingFile:(id)a3 key:(id)a4 isDeflated:(BOOL)a5 zipStream:(id *)a6
{
  _BOOL4 v7;
  SFUFileInputStream *v9;
  SFUFileInputStream *v10;
  SFUZipInflateInputStream *v11;
  SFUZipInflateInputStream *v12;
  SFUBufferedInputStream *v13;

  v7 = a5;
  v9 = -[SFUFileInputStream initWithPath:offset:]([SFUFileInputStream alloc], "initWithPath:offset:", a3, 0);
  if (v9)
  {
    v10 = v9;
    v11 = -[SFUCryptoInputStream initForDecryptionWithInputStream:key:]([SFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v9, a4);

    if (!v7)
    {
      if (!v11)
        return 0;
LABEL_10:
      v13 = -[SFUBufferedInputStream initWithStream:]([SFUBufferedInputStream alloc], "initWithStream:", v11);

      return v13;
    }
  }
  else
  {
    if (!v7)
      return 0;
    v11 = 0;
  }
  v12 = v11;
  v11 = -[SFUZipInflateInputStream initWithInput:]([SFUZipInflateInputStream alloc], "initWithInput:", v11);

  if (v11)
  {
    if (a6)
      *a6 = v11;
    goto LABEL_10;
  }
  return 0;
}

+ (id)newBufferedInputStreamForDecryptingZippedBundle:(id)a3 key:(id)a4 zipArchive:(id)a5 isDeflated:(BOOL)a6 zipStream:(id *)a7
{
  _BOOL4 v8;
  void *v10;
  uint64_t v11;
  SFUZipInflateInputStream *v12;
  SFUZipInflateInputStream *v13;
  SFUBufferedInputStream *v14;

  v8 = a6;
  v10 = (void *)objc_msgSend(a5, "entryWithName:", a3);
  if (v10 && (v11 = objc_msgSend(v10, "inputStream")) != 0)
  {
    v12 = -[SFUCryptoInputStream initForDecryptionWithInputStream:key:]([SFUCryptoInputStream alloc], "initForDecryptionWithInputStream:key:", v11, a4);
    if (!v8)
      goto LABEL_4;
  }
  else
  {
    v12 = 0;
    if (!v8)
    {
LABEL_4:
      if (!v12)
        return 0;
LABEL_11:
      v14 = -[SFUBufferedInputStream initWithStream:]([SFUBufferedInputStream alloc], "initWithStream:", v12);

      return v14;
    }
  }
  v13 = -[SFUZipInflateInputStream initWithInput:]([SFUZipInflateInputStream alloc], "initWithInput:", v12);

  if (v13)
  {
    if (a7)
      *a7 = v13;
    v12 = v13;
    goto LABEL_11;
  }
  return 0;
}

+ (id)encodePassphraseHint:(id)a3
{
  return (id)objc_msgSend(a3, "dataUsingEncoding:", 4);
}

+ (id)decodePassphraseHint:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 4);
}

+ (id)sha256HashFromData:(id)a3
{
  int v4;
  id v5;
  uint64_t v6;
  CC_SHA256_CTX v8;
  unsigned __int8 md[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = CC_SHA256_Init(&v8);
  if ((unint64_t)objc_msgSend(a3, "length") >> 32)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[SFUCryptoUtils sha256HashFromData:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUCryptoUtils.mm"), 467, CFSTR("overflow  in sha256HashFromData"));
  }
  if (v4
    && CC_SHA256_Update(&v8, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"))
    && CC_SHA256_Final(md, &v8))
  {
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
  }
  else
  {
    return 0;
  }
}

+ (id)sha256HashFromStorage:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *data;
  CC_SHA256_CTX c;
  unsigned __int8 md[32];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = CC_SHA256_Init(&c);
  v5 = (void *)objc_msgSend(a3, "bufferedInputStream");
  objc_msgSend(v5, "disableSystemCaching");
  data = 0;
  if (!v4)
    return 0;
  while (1)
  {
    v6 = objc_msgSend(v5, "readToOwnBuffer:size:", &data, 0xFFFFFFFFLL);
    if (!v6)
      break;
    if (!CC_SHA256_Update(&c, data, v6))
      return 0;
  }
  if (CC_SHA256_Final(md, &c))
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
  else
    return 0;
}

+ (id)sha256HashFromString:(id)a3
{
  return (id)objc_msgSend(a1, "sha256HashFromData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
}

+ (id)sha1HashFromStorage:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *data;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = CC_SHA1_Init(&c);
  v5 = (void *)objc_msgSend(a3, "bufferedInputStream");
  objc_msgSend(v5, "disableSystemCaching");
  data = 0;
  if (!v4)
    return 0;
  while (1)
  {
    v6 = objc_msgSend(v5, "readToOwnBuffer:size:", &data, 0xFFFFFFFFLL);
    if (!v6)
      break;
    if (!CC_SHA1_Update(&c, data, v6))
      return 0;
  }
  if (CC_SHA1_Final(md, &c))
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
  else
    return 0;
}

@end
