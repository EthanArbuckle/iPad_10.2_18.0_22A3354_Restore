uint64_t ACMobileShimCopyTicket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRunLoopRef Current;
  NSObject *global_queue;
  const __CFString *v10;
  uint64_t v11;
  _QWORD block[11];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  Current = CFRunLoopGetCurrent();
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __ACMobileShimCopyTicket_block_invoke;
  block[3] = &unk_24FCE4F58;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[9] = a4;
  block[4] = &v14;
  block[5] = &v18;
  block[10] = Current;
  dispatch_async(global_queue, block);
  v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  while (!*((_BYTE *)v19 + 24))
    CFRunLoopRunInMode(v10, 1.0, 1u);
  v11 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_22F7D00FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

id ACMImageWithName(uint64_t a1)
{
  return -[ACMImageLoader imageNamed:](+[ACMImageLoader sharedInstance](ACMImageLoader, "sharedInstance"), "imageNamed:", a1);
}

void ACMClearImagesCache()
{

  sLoader = 0;
}

void sub_22F7D15F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_22F7D8B04(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22F7DA1FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E12CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E1378(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E4CC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ACFMakeRandomData(_BYTE *bytes, size_t a2)
{
  size_t v2;
  _BYTE *v3;
  int v4;
  int v5;

  v2 = a2;
  v3 = bytes;
  v4 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], a2, bytes);
  if (v4)
  {
    if (ACFLog)
    {
      v5 = v4;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"void ACFMakeRandomData(unsigned char *, NSUInteger)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 71, 0, "Error with code %d occurred while creating random string", v5);
    }
    for (; v2; --v2)
      *v3++ = arc4random_uniform(0x100u);
  }
}

void *ACFRandomData(uint64_t a1)
{
  size_t v1;
  void *v2;
  _QWORD v4[2];

  v1 = a1;
  v4[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    a1 = objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to allcoate 0 size random block"));
  MEMORY[0x24BDAC7A8](a1);
  ACFMakeRandomData((_BYTE *)v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (char *)v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  if (!objc_msgSend(v2, "length"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Failed to create data block"));
  return v2;
}

void ACFMakeRandomString(char *a1, uint64_t a2)
{
  size_t v4;
  _BYTE *v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ACFMakeRandomData(v5, v4);
  for (; a2; --a2)
  {
    v6 = *v5++;
    v7 = (107374183 * (unint64_t)v6) >> 32;
    v8 = v6 - 40 * v7 + 46;
    if (v6 - 40 * (_DWORD)v7 == 12)
      v8 = 59;
    *a1++ = v8;
  }
}

uint64_t ACFRandomString(uint64_t a1)
{
  char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = (char *)v4 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
  ACFMakeRandomString(v2, a1);
  v2[a1] = 0;
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
}

uint64_t ACFEncodeBase64(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
    else
      return objc_msgSend(v1, "base64Encoding");
  }
  return result;
}

id ACFDecodeBase64(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc(MEMORY[0x24BDBCE50]);
    v3 = objc_msgSend((id)objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet")), "componentsJoinedByString:", &stru_24FCE58F0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend(v2, "initWithBase64EncodedString:options:", v3, 0);
    a1 = (void *)objc_msgSend(v2, "initWithBase64Encoding:", v3);
  }
  return a1;
}

void *ACFDecodeBase32(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  char v17;
  char v18;
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  if ((v2 & 7) != 0)
    return 0;
  v3 = v2;
  qmemcpy(v20, "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", sizeof(v20));
  v18 = 61;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v20, 32, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v5, "addCharactersInString:", v4);
  objc_msgSend(v5, "addCharactersInString:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v18, 1, 1));
  if (objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v5), "length"))
    return 0;
  v6 = 0;
  do
  {
    v7 = v3 + v6;
    v8 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("="), 12, 0, v3 + v6--);
  }
  while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  if (v6 < 0xFFFFFFFFFFFFFFF9)
    return 0;
  v9 = 0;
  if (~v6 != 2 && ~v6 != 5)
  {
    v9 = 0;
    if (objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("="), 0, 0, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 5 * (v3 >> 3));
      CFRetain(a1);
      if (v3)
      {
        for (i = 0; i < v3; i += 8)
        {
          v12 = 0;
          v19 = 0;
          do
          {
            v13 = objc_msgSend(a1, "characterAtIndex:", i + v12);
            if ((_DWORD)v13 == v18)
              v14 = -1;
            else
              v14 = objc_msgSend(v4, "rangeOfString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v13));
            *((_BYTE *)&v19 + v12++) = v14;
          }
          while (v12 != 8);
          v17 = 0;
          v16 = ((8 * v19) | (BYTE1(v19) >> 2) & 7);
          if (BYTE2(v19) == 255)
          {
            v15 = 1;
          }
          else
          {
            BYTE1(v16) = (BYTE1(v19) << 6) | (2 * (BYTE2(v19) & 0x1F)) | ((v19 & 0x10000000) != 0);
            if (BYTE4(v19) == 255)
            {
              v15 = 2;
            }
            else
            {
              BYTE2(v16) = (16 * BYTE3(v19)) | (BYTE4(v19) >> 1) & 0xF;
              if (BYTE5(v19) == 255)
              {
                v15 = 3;
              }
              else
              {
                HIBYTE(v16) = (BYTE4(v19) << 7) | (4 * (BYTE5(v19) & 0x1F)) | (BYTE6(v19) >> 3) & 3;
                if (HIBYTE(v19) == 255)
                {
                  v15 = 4;
                }
                else
                {
                  v17 = HIBYTE(v19) & 0x1F | (32 * BYTE6(v19));
                  v15 = 5;
                }
              }
            }
          }
          objc_msgSend(v9, "appendBytes:length:", &v16, v15);
        }
      }
      CFRelease(a1);
    }
  }
  return v9;
}

uint64_t ACFEncodeBase16(void *a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  if (a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v3 = objc_msgSend(a1, "bytes");
    if (objc_msgSend(a1, "length"))
    {
      v4 = 0;
      do
        objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(v3 + v4++));
      while (v4 < objc_msgSend(a1, "length"));
    }
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSString *ACFEncodeBase16(NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 306, 0, "Invalid parameter!");
    return 0;
  }
}

uint64_t ACFDecodeBase16(void *a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  char v8;

  if (a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    if (objc_msgSend(a1, "length"))
    {
      v3 = 0;
      v4 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v5 = objc_msgSend(CFSTR("0123456789abcdef"), "rangeOfString:options:", objc_msgSend(a1, "substringWithRange:", v3, 1), 1);
        if (v5 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v4 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v4 = v5;
          }
          else
          {
            v8 = v5 + 16 * v4;
            objc_msgSend(v2, "appendBytes:length:", &v8, 1);
            v4 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        ++v3;
      }
      while (v3 < objc_msgSend(a1, "length"));
      if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 16 * v4;
        objc_msgSend(v2, "appendBytes:length:", &v7, 1);
      }
    }
    return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v2);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSData *ACFDecodeBase16(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 352, 0, "Invalid parameter!");
    return 0;
  }
}

uint64_t ACFSHA1Init()
{
  _OWORD *v0;
  _OWORD *v1;

  v0 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  if (v0)
  {
    v1 = v0;
    v0[4] = 0u;
    v0[5] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    *v0 = 0u;
    v0[1] = 0u;
    CC_SHA1_Init((CC_SHA1_CTX *)v0);
    return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v1, 96, 1);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"NSData *ACFSHA1Init(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 375, 0, "Error occured: malloc return NULL");
    }
    return 0;
  }
}

void ACFSHA1Update(void *a1, void *a2)
{
  if (a1 && a2)
  {
    CC_SHA1_Update((CC_SHA1_CTX *)objc_msgSend(a1, "bytes"), (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
  }
  else if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"void ACFSHA1Update(NSData *, NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 389, 0, "Invalid parameters!");
  }
}

uint64_t ACFSHA1Final(void *a1)
{
  unsigned __int8 md[20];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)objc_msgSend(a1, "bytes"));
    return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"NSData *ACFSHA1Final(NSData *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 407, 0, "Invalid parameter!");
    }
    return 0;
  }
}

uint64_t ACFSHA1(void *a1)
{
  unsigned __int8 md[20];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  CC_SHA1((const void *)objc_msgSend(a1, "UTF8String"), objc_msgSend(a1, "length"), md);
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
}

void *ACFSHA1AsString(void *a1)
{
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v1 = (void *)ACFSHA1(a1);
  v2 = objc_msgSend(v1, "length");
  v3 = objc_msgSend(v1, "bytes");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (v2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v3 + v5));
      v5 = v6;
    }
    while (v2 > v6++);
  }
  return v4;
}

uint64_t ACFSHA256(void *a1)
{
  unsigned __int8 md[32];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  CC_SHA256((const void *)objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"), md);
  return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
}

void *ACFSHA256AsString(void *a1)
{
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v1 = (void *)ACFSHA256(a1);
  v2 = objc_msgSend(v1, "length");
  v3 = objc_msgSend(v1, "bytes");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (v2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v3 + v5));
      v5 = v6;
    }
    while (v2 > v6++);
  }
  return v4;
}

uint64_t ACFSHA256ForString(void *a1)
{
  return ACFSHA256((void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(a1, "UTF8String"), objc_msgSend(a1, "length")));
}

uint64_t ACFDES_ECB_Encrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 1u, 8, 8uLL, 0, 1, 2u);
}

uint64_t ACFCrypt_Process(void *a1, void *a2, CCAlgorithm a3, uint64_t a4, unint64_t a5, void *a6, int a7, CCOptions a8)
{
  uint64_t v16;
  unint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  size_t dataOutAvailable;
  void *dataOut;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _BYTE op[12];

  v16 = objc_msgSend(a1, "length");
  if (!v16)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      v19 = CFSTR("decrypt");
      if (a7)
        v19 = CFSTR("encrypt");
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 527, 0, "Attempt to %@ data with zero size", v19);
    }
    return 0;
  }
  v17 = v16;
  if (objc_msgSend(a2, "length") != a4)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      v20 = CFSTR("decrypt");
      if (a7)
        v20 = CFSTR("encrypt");
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 522, 0, "Attempt to %@ data with incorrect key", v20);
    }
    return 0;
  }
  if ((a8 & 1) == 0 && v17 % a5)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      v18 = CFSTR("decrypt");
      if (a7)
        v18 = CFSTR("encrypt");
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 517, 0, "Attempt to %@ data with incorrect size", v18);
    }
    return 0;
  }
  dataOutAvailable = v17 + a5;
  dataOut = malloc_type_malloc(dataOutAvailable, 0xDFABB69FuLL);
  if (!dataOut)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 512, 0, "Error occured in crypt: malloc return NULL");
    return 0;
  }
  v23 = dataOut;
  *(_DWORD *)&op[8] = 0;
  *(_QWORD *)op = a7 ^ 1u;
  v24 = CCCrypt(*(CCOperation *)op, a3, a8, (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"), (const void *)objc_msgSend(a6, "bytes"), (const void *)objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"), dataOut, dataOutAvailable, (size_t *)&op[4]);
  if ((_DWORD)v24)
  {
    if (ACFLog)
    {
      v25 = v24;
      if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        v26 = CFSTR("decryption");
        if (a7)
          v26 = CFSTR("encryption");
        ACFLog(3, (uint64_t)"NSData *ACFCrypt_Process(NSData *, NSData *, CCAlgorithm, NSUInteger, NSUInteger, NSData *, BOOL, CCOptions)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 494, 0, "Error with code %d has been occured during %@ process", v25, v26);
      }
    }
    v27 = 0;
  }
  else
  {
    v27 = objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v23, *(_QWORD *)&op[4]);
  }
  free(v23);
  return v27;
}

uint64_t ACFDES_ECB_Decrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 1u, 8, 8uLL, 0, 0, 2u);
}

uint64_t ACF3DES_CBC_Encrypt(void *a1, void *a2, CCOptions a3)
{
  return ACFCrypt_Process(a1, a2, 2u, 24, 8uLL, 0, 1, a3);
}

uint64_t ACF3DES_CBC_Decrypt(void *a1, void *a2)
{
  return ACFCrypt_Process(a1, a2, 2u, 24, 8uLL, 0, 0, 0);
}

uint64_t ACFAES128_CBC_Encrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, a3, 1, a4);
}

uint64_t ACFAES128_CBC_Decrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, a3, 0, a4);
}

uint64_t ACFAES128_Key256_CBC_Encrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 32, 0x10uLL, a3, 1, a4);
}

uint64_t ACFAES128_Key256_CBC_Decrypt(void *a1, void *a2, void *a3, CCOptions a4)
{
  return ACFCrypt_Process(a1, a2, 0, 32, 0x10uLL, a3, 0, a4);
}

uint64_t ACFAES128_ECB_Encrypt(void *a1, void *a2, int a3)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, 0, 1, a3 | 2u);
}

uint64_t ACFAES128_ECB_Decrypt(void *a1, void *a2, int a3)
{
  return ACFCrypt_Process(a1, a2, 0, 16, 0x10uLL, 0, 0, a3 | 2u);
}

void *ACFEncodeObscuredString(void *a1, unint64_t a2)
{
  const char *v3;
  const char *v4;
  size_t v5;
  size_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  v3 = (const char *)objc_msgSend(a1, "UTF8String");
  if (v3)
  {
    v4 = v3;
    v5 = strlen(v3);
    v6 = v5;
    if (2 * v5 > a2)
      a2 = 2 * v5;
    v7 = (void *)ACFRandomString(a2);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "length"));
    v9 = objc_msgSend(v8, "mutableBytes");
    if (v9)
      v10 = a2 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      v11 = 0;
      do
      {
        if (v11 >> 1 >= v6)
          v12 = 0;
        else
          v12 = v4[v11 >> 1];
        *(_BYTE *)(v9 + v11) = v12;
        v11 += 2;
      }
      while (v11 < a2);
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSData *ACFEncodeObscuredString(NSString *, NSUInteger)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 626, 0, "Failed to generate obscured string, extractng UTF8 string from NSString failed.");
    return 0;
  }
  return v8;
}

uint64_t ACFObscureAndBaseEncode64String(void *a1)
{
  void *v1;
  uint64_t result;

  if (!a1)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 655, 0, "Invalid Parameters");
    return 0;
  }
  v1 = ACFEncodeObscuredString(a1, 2 * objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4));
  if (!v1)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 650, 0, "Failed to generate obscured string");
    return 0;
  }
  result = ACFEncodeBase64((uint64_t)v1);
  if (!result && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"NSString *ACFObscureAndBaseEncode64String(NSString *)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFEncryption.m", 645, 0, "Failed encoding Base64 string");
    return 0;
  }
  return result;
}

uint64_t ACFDecodeObscuredString(void *a1)
{
  unint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v2 = objc_msgSend(a1, "length");
  if (v2 < 2)
    return 0;
  v3 = v2 >> 1;
  v4 = malloc_type_malloc((v2 >> 1) + 1, 0x44658E6CuLL);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (char *)objc_msgSend(a1, "bytes");
  v7 = 0;
  if (v3 <= 1)
    v8 = 1;
  else
    v8 = v3;
  do
  {
    v9 = *v6;
    v6 += 2;
    v5[v7++] = v9;
  }
  while (v8 != v7);
  v5[v3] = 0;
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  free(v5);
  return v10;
}

uint64_t ACFHmacSHA1(void *a1, void *a2)
{
  uint64_t result;
  const void *v5;
  size_t v6;
  const void *v7;
  size_t v8;
  _QWORD v9[2];
  int v10;
  uint64_t v11;

  result = 0;
  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      v5 = (const void *)objc_msgSend(a2, "bytes");
      v6 = objc_msgSend(a2, "length");
      v7 = (const void *)objc_msgSend(a1, "bytes");
      v8 = objc_msgSend(a1, "length");
      result = 0;
      if (v7)
      {
        if (v5)
        {
          v9[0] = 0;
          v9[1] = 0;
          v10 = 0;
          CCHmac(0, v5, v6, v7, v8, v9);
          return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, 20);
        }
      }
    }
  }
  return result;
}

uint64_t ACFHmacSHA256(void *a1, void *a2)
{
  uint64_t result;
  const void *v5;
  size_t v6;
  const void *v7;
  size_t v8;
  _OWORD v9[2];
  uint64_t v10;

  result = 0;
  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      v5 = (const void *)objc_msgSend(a2, "bytes");
      v6 = objc_msgSend(a2, "length");
      v7 = (const void *)objc_msgSend(a1, "bytes");
      v8 = objc_msgSend(a1, "length");
      result = 0;
      if (v7)
      {
        if (v5)
        {
          memset(v9, 0, sizeof(v9));
          CCHmac(2u, v5, v6, v7, v8, v9);
          return objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, 32);
        }
      }
    }
  }
  return result;
}

char *ACFLogSettingsGetLevelName(int a1)
{
  return kACFLogLevelNames[a1];
}

uint64_t ACFLogSettingsGetLevelMask()
{
  return kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

uint64_t ACFLogSettingsGetLevel()
{
  uint64_t result;
  uint64_t v1;

  v1 = 2;
  result = _logLevel;
  if (_logLevel < 0)
  {
    if (ACFPreferencesGetIntegerValue(CFSTR("ACCLogLevel"), CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (const __CFString *)*MEMORY[0x24BDBD590], (const __CFString *)*MEMORY[0x24BDBD570], 0, &v1))return v1;
    else
      return 2;
  }
  return result;
}

uint64_t ACFLogSettingsGetDestination()
{
  uint64_t result;
  uint64_t v1;

  v1 = 0;
  result = _logDestination;
  if (_logDestination >= 3)
  {
    result = ACFPreferencesGetIntegerValue(CFSTR("ACCLogDestination"), CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (const __CFString *)*MEMORY[0x24BDBD590], (const __CFString *)*MEMORY[0x24BDBD570], 0, &v1);
    if ((_DWORD)result)
      return v1;
  }
  return result;
}

CFStringRef ACFLogSettingsGetFilePath()
{
  if (_logFilePath)
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)_logFilePath);
  else
    return (CFStringRef)ACFPreferencesCopyString(CFSTR("ACCLogFilePath"), CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (const __CFString *)*MEMORY[0x24BDBD590], (const __CFString *)*MEMORY[0x24BDBD570], 0);
}

void ACFLogSettingsSetLevel(unsigned int a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  unsigned int valuePtr;

  valuePtr = a1;
  if (a1 <= 5)
  {
    v1 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      v2 = v1;
      CFPreferencesSetValue(CFSTR("ACCLogLevel"), v1, CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
      CFRelease(v2);
    }
  }
}

void ACFLogSettingsSetDestination(unsigned int a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  unsigned int valuePtr;

  valuePtr = a1;
  if (a1 <= 2)
  {
    v1 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      v2 = v1;
      CFPreferencesSetValue(CFSTR("ACCLogDestination"), v1, CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
      CFRelease(v2);
    }
  }
}

void ACFLogSettingsSetFilePath(CFPropertyListRef value)
{
  CFPreferencesSetValue(CFSTR("ACCLogFilePath"), value, CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

uint64_t ACFLogSettingsSynchronizeWithPreferences()
{
  __CFString *v0;
  __CFString *v1;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  CFStringRef v7;

  if (ACFGetHomedirAccess())
  {
    v0 = ACFPreferencesCopyPreferencesFilePath(CFSTR("com.apple.ist.ds.appleconnect.mobile.external"), (const __CFString *)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    if (v0)
    {
      v1 = v0;
      v7 = 0;
      v2 = ACFPreferencesCopyDictionaryWithContentsOfFile(v0, &v7);
      v3 = v2;
      if (v7 || !v2)
      {
        v4 = 0;
        v5 = 0;
        if (!v2)
        {
LABEL_9:
          CFRelease(v1);
          return v5;
        }
      }
      else
      {
        ACFLogSettingsSynchronizeFromDictionary(v2);
        v4 = 1;
      }
      CFRelease(v3);
      v5 = v4;
      goto LABEL_9;
    }
  }
  return 0;
}

const __CFDictionary *ACFLogSettingsSynchronizeFromDictionary(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;
  const __CFString *v4;
  CFTypeID v5;
  unint64_t v6;
  unint64_t v7;

  if (result)
  {
    v1 = result;
    Value = CFDictionaryGetValue(result, CFSTR("ACCLogLevel"));
    v7 = 0;
    if (ACFConvertCFTypeToInteger((uint64_t)Value, &v7) && v7 <= 5)
      _logLevel = v7;
    v3 = CFDictionaryGetValue(v1, CFSTR("ACCLogDestination"));
    v6 = 0;
    if (ACFConvertCFTypeToInteger((uint64_t)v3, &v6) && v6 <= 2)
      _logDestination = v6;
    result = (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("ACCLogFilePath"));
    if (result)
    {
      v4 = (const __CFString *)result;
      v5 = CFGetTypeID(result);
      result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v5 == result)
      {
        result = (const __CFDictionary *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v4);
        _logFilePath = (uint64_t)result;
      }
    }
  }
  return result;
}

void ACFLogImpl(int a1, uint64_t a2, char *__s, uint64_t a4, const char *a5, uint64_t a6)
{
  char *v8;
  const char *v11;
  char *v12;
  int Destination;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;

  if (a6)
  {
    v8 = __s;
    if (a5)
      v11 = a5;
    else
      v11 = "ACUnknown";
    if (__s)
    {
      v12 = strrchr(__s, 47);
      if (v12)
        v8 = v12 + 1;
    }
    Destination = ACFLogSettingsGetDestination();
    switch(Destination)
    {
      case 0:
        v14 = a1;
        v15 = a2;
        v16 = (uint64_t)v8;
        v17 = a4;
        v18 = v11;
        v19 = a6;
        v20 = 0;
        goto LABEL_14;
      case 1:
        ACFLogImplStandard(a1, a2, (uint64_t)v8, a4, v11, a6);
        break;
      case 2:
        v14 = a1;
        v15 = a2;
        v16 = (uint64_t)v8;
        v17 = a4;
        v18 = v11;
        v19 = a6;
        v20 = 1;
LABEL_14:
        ACFLogImplASL(v14, v15, v16, v17, v18, v19, v20);
        break;
    }
  }
}

asl_object_t ACFLogImplASL(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, int a7)
{
  const char *v13;
  asl_object_t result;
  __asl_object_s *v15;
  CFStringRef FilePath;
  CFStringRef v17;
  __CFString *CopyExpandingTildeInPath;
  __CFString *v19;
  uint64_t v20;
  char v21;
  int v22;
  char *v23;
  pthread_t v24;
  const __CFString *v25;
  const __CFString *v26;
  char *v27;
  const char *v28;
  char buffer[1024];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a5)
    v13 = a5;
  else
    v13 = "";
  result = asl_open(0, v13, 2u);
  if (!result)
    return result;
  v15 = result;
  if (a7 != 1)
  {
    v20 = 0xFFFFFFFFLL;
LABEL_25:
    v21 = 1;
    goto LABEL_26;
  }
  FilePath = ACFLogSettingsGetFilePath();
  v17 = FilePath;
  if (FilePath)
    CopyExpandingTildeInPath = (__CFString *)FilePath;
  else
    CopyExpandingTildeInPath = CFSTR("~/Library/Logs/AppleConnect.log");
  if (CFStringHasPrefix(CopyExpandingTildeInPath, CFSTR("~")))
  {
    if (!ACFGetHomedirAccess())
    {
      v19 = 0;
      goto LABEL_19;
    }
    CopyExpandingTildeInPath = ACFStringCreateCopyExpandingTildeInPath(CopyExpandingTildeInPath);
    v19 = CopyExpandingTildeInPath;
    if (!CopyExpandingTildeInPath)
    {
LABEL_19:
      v20 = 0xFFFFFFFFLL;
      if (!v17)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else
  {
    v19 = 0;
  }
  buffer[0] = 0;
  if (CFStringGetCString(CopyExpandingTildeInPath, buffer, 1024, 0x8000100u) != 1)
    goto LABEL_19;
  v20 = open(buffer, 522, 438);
  if (v17)
LABEL_20:
    CFRelease(v17);
LABEL_21:
  if (v19)
    CFRelease(v19);
  if ((_DWORD)v20 == -1)
    goto LABEL_25;
  asl_add_log_file(v15, v20);
  v21 = 0;
LABEL_26:
  if (a1 >= 5)
    v22 = 5;
  else
    v22 = a1;
  buffer[0] = 0;
  v23 = kACFLogLevelNames[a1];
  v24 = pthread_self();
  v25 = CFStringCreateWithFormat(0, 0, CFSTR("%s: %@ <%s:%s, %s:%ld, Thread:%p>"), v23, a6, v13, a2, a3, a4, v24);
  v26 = v25;
  if (v25)
    v27 = ACFStringConvertToCString(v25, 0x8000100u, buffer);
  else
    v27 = 0;
  v28 = "";
  if (v27)
    v28 = v27;
  asl_log(v15, 0, v22, "%s", v28);
  if ((v21 & 1) == 0)
  {
    MEMORY[0x2348A39C4](v15, v20);
    close(v20);
  }
  if (v26)
    CFRelease(v26);
  if (v27)
  {
    if (buffer[0] == 1)
      free(v27);
  }
  return (asl_object_t)MEMORY[0x2348A39A0](v15);
}

void ACFLogImplStandard(int a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6)
{
  char *v10;
  const char *v11;
  pthread_t v12;
  CFStringRef v13;
  CFStringRef v14;

  v10 = kACFLogLevelNames[a1];
  if (a5)
    v11 = a5;
  else
    v11 = "";
  v12 = pthread_self();
  v13 = CFStringCreateWithFormat(0, 0, CFSTR("%s: %@ <%s:%s, %s:%ld, Thread:%p>"), v10, a6, v11, a2, a3, a4, v12);
  if (v13)
  {
    v14 = v13;
    CFShow(v13);
    CFRelease(v14);
  }
}

void ACFLog(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *a6, ...)
{
  va_list va;

  va_start(va, a6);
  if (a6)
    ACFLogWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)va);
}

void ACFLogWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *cStr, uint64_t a7)
{
  CFStringRef v13;
  CFStringRef v14;

  if (cStr)
  {
    v13 = CFStringCreateWithCStringNoCopy(0, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v13)
    {
      v14 = v13;
      ACFLogNSWithArgs(a1, a2, a3, a4, a5, (uint64_t)v13, a7);
      CFRelease(v14);
    }
  }
}

void ACFLogNSWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7)
{
  if (a6)
    ACFLogImpl(a1, a2, a3, a4, a5, (uint64_t)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a6, a7));
}

void ACFLogCF(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a6)
    ACFLogCFWithArgs(a1, a2, a3, a4, a5, a6, &a9);
}

void ACFLogCFWithArgs(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, CFStringRef format, va_list arguments)
{
  CFStringRef v12;
  CFStringRef v13;

  if (format)
  {
    v12 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
    if (v12)
    {
      v13 = v12;
      ACFLogImpl(a1, a2, a3, a4, a5, (uint64_t)v12);
      CFRelease(v13);
    }
  }
}

void ACFLogNS(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6)
    ACFLogNSWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)&a9);
}

double ACFProfileCurrentTime()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  if (*(double *)&ACFProfileCurrentTime_sACFProfileScale == 0.0
    && !pthread_mutex_lock(&ACFProfileCurrentTime_sACFProfileMutex))
  {
    if (*(double *)&ACFProfileCurrentTime_sACFProfileScale == 0.0)
    {
      info = 0;
      mach_timebase_info(&info);
      LODWORD(v1) = info.denom;
      LODWORD(v0) = info.numer;
      *(double *)&ACFProfileCurrentTime_sACFProfileScale = (double)v0 / (double)v1 * 0.000000001;
    }
    pthread_mutex_unlock(&ACFProfileCurrentTime_sACFProfileMutex);
  }
  return *(double *)&ACFProfileCurrentTime_sACFProfileScale * (double)mach_absolute_time();
}

double ACFProfileStart(uint64_t a1, char *a2, uint64_t a3, const char *a4, uint64_t a5)
{
  double v10;

  v10 = ACFProfileCurrentTime();
  if (a5)
    ACFLog(8, a1, a2, a3, a4, "<%s> { ");
  else
    ACFLog(8, a1, a2, a3, a4, "{");
  return v10;
}

void ACFProfileEnd(uint64_t a1, char *a2, uint64_t a3, const char *a4, uint64_t a5)
{
  ACFProfileCurrentTime();
  if (a5)
    ACFLog(8, a1, a2, a3, a4, "} <%s> duration: %g seconds");
  else
    ACFLog(8, a1, a2, a3, a4, "} duration: %g seconds");
}

void ACFLogC(int a1, uint64_t a2, char *a3, uint64_t a4, const char *a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6)
    ACFLogWithArgs(a1, a2, a3, a4, a5, a6, (uint64_t)&a9);
}

uint64_t ACFLogLevelsMasks()
{
  return (int)kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

uint64_t ACFLogLevelMask()
{
  return (int)kACFLogLevelMasks[(int)ACFLogSettingsGetLevel()];
}

id mapUserName(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a1);
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), CFSTR("#"), 0, 0, v2);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("@"), CFSTR("%"), 0, 0, v2);
  return (id)objc_msgSend(v1, "copy");
}

void sub_22F7E9864(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E996C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E99EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E9A50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E9B18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7E9C54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7EAF50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  _Unwind_Resume(exception_object);
}

void sub_22F7EAF90(uint64_t a1, int a2)
{
  if (!a2)
    JUMPOUT(0x22F7EAF7CLL);
  JUMPOUT(0x22F7EAFA8);
}

void sub_22F7EAFA0(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exc_buf);
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
        ACFLog(3, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 182, 0, "Exception has been thrown - %@");
      objc_end_catch();
      JUMPOUT(0x22F7EAE7CLL);
    }
    objc_begin_catch(exc_buf);
    JUMPOUT(0x22F7EAE84);
  }
  JUMPOUT(0x22F7EAF7CLL);
}

void sub_22F7EB004(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x22F7EB010);
  }
  JUMPOUT(0x22F7EAF7CLL);
}

void sub_22F7EB0E8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22F7EB208(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22F7EB32C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22F7EB88C()
{
  objc_end_catch();
  JUMPOUT(0x22F7EB894);
}

void sub_22F7EB8A4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

__CFData *ACFDataCreateFromByteString(const __CFAllocator *a1, const __CFString *a2)
{
  char *v3;
  char *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFData *Mutable;
  uint64_t i;
  UInt8 bytes;
  char __str[3];
  char *__endptr;
  char v14;

  v14 = 0;
  v3 = ACFStringConvertToCString(a2, 0x8000100u, &v14);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = strlen(v3);
  v6 = v5;
  if ((v5 & 1) != 0)
  {
    Mutable = 0;
  }
  else
  {
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    Mutable = CFDataCreateMutable(a1, v7 >> 1);
    if (Mutable)
    {
      __endptr = 0;
      __str[2] = 0;
      if (v6 >= 1)
      {
        for (i = 0; i < v6; i += 2)
        {
          __str[0] = v4[i];
          __str[1] = v4[i + 1];
          bytes = 0;
          bytes = strtol(__str, &__endptr, 16);
          CFDataAppendBytes(Mutable, &bytes, 1);
        }
      }
    }
  }
  if (v14)
    free(v4);
  return Mutable;
}

char *ACFStringConvertToCString(const __CFString *a1, CFStringEncoding a2, _BYTE *a3)
{
  const char *CStringPtr;
  char *result;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  size_t v10;
  char *v11;

  if (a1)
  {
    CStringPtr = CFStringGetCStringPtr(a1, a2);
    if (CStringPtr)
    {
      result = strdup(CStringPtr);
      *a3 = 1;
      return result;
    }
    Length = CFStringGetLength(a1);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, a2);
    v10 = MaximumSizeForEncoding + 1;
    if ((unint64_t)(MaximumSizeForEncoding + 1) >= 2)
    {
      v11 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x2AC1F145uLL);
      if (!v11)
        return v11;
      if (CFStringGetCString(a1, v11, v10, a2))
      {
        *a3 = 1;
        return v11;
      }
      bzero(v11, v10);
      free(v11);
    }
  }
  return 0;
}

__CFString *ACFDataCreateByteString(const __CFAllocator *a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v6;
  __CFString *Mutable;
  unsigned int v8;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  if (!BytePtr)
    return 0;
  v6 = Length;
  Mutable = CFStringCreateMutable(a1, 2 * Length);
  if (Mutable && v6 >= 1)
  {
    do
    {
      v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v8);
      --v6;
    }
    while (v6);
  }
  return Mutable;
}

uint64_t ACFNumberGetBooleanValue(const __CFNumber *a1)
{
  uint64_t v1;
  double valuePtr;

  valuePtr = 0.0;
  if (!CFNumberGetValue(a1, kCFNumberFloat64Type, &valuePtr))
    return 0;
  v1 = MEMORY[0x24BDBD268];
  if (valuePtr != 0.0)
    v1 = MEMORY[0x24BDBD270];
  return *(_QWORD *)v1;
}

uint64_t ACFGetBooleanValue(const __CFString *a1)
{
  uint64_t v1;
  CFTypeID v3;

  v1 = *MEMORY[0x24BDBD268];
  if (a1)
  {
    v3 = CFGetTypeID(a1);
    if (v3 == CFBooleanGetTypeID())
    {
      return (uint64_t)a1;
    }
    else
    {
      if (v3 == CFNumberGetTypeID())
        return ACFNumberGetBooleanValue((const __CFNumber *)a1);
      if (v3 == CFStringGetTypeID())
        return ACFStringGetBooleanValue(a1);
    }
  }
  return v1;
}

uint64_t ACFStringGetBooleanValue(CFStringRef theString)
{
  __CFString *MutableCopy;
  const __CFString *v2;
  CFIndex Length;
  uint64_t *v4;
  uint64_t v5;
  CFRange v7;
  CFRange v8;
  CFRange v9;
  CFRange v10;
  CFRange v11;

  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy)
    return 0;
  v2 = MutableCopy;
  CFStringTrimWhitespace(MutableCopy);
  Length = CFStringGetLength(v2);
  v7.location = 0;
  v7.length = Length;
  if (CFStringCompareWithOptions(v2, CFSTR("NO"), v7, 1uLL)
    && (v8.location = 0, v8.length = Length, CFStringCompareWithOptions(v2, CFSTR("FALSE"), v8, 1uLL))
    && (v9.location = 0, v9.length = Length, CFStringCompareWithOptions(v2, CFSTR("0"), v9, 1uLL)))
  {
    v10.location = 0;
    v10.length = Length;
    if (CFStringCompareWithOptions(v2, CFSTR("YES"), v10, 1uLL))
    {
      v11.location = 0;
      v11.length = Length;
      if (CFStringCompareWithOptions(v2, CFSTR("TRUE"), v11, 1uLL))
      {
        if (CFStringGetDoubleValue(v2) == 0.0)
        {
          v5 = 0;
          goto LABEL_11;
        }
      }
    }
    v4 = (uint64_t *)MEMORY[0x24BDBD270];
  }
  else
  {
    v4 = (uint64_t *)MEMORY[0x24BDBD268];
  }
  v5 = *v4;
LABEL_11:
  CFRelease(v2);
  return v5;
}

__CFString *ACFStringCreateCopyExpandingTildeInPath(CFStringRef theString)
{
  const __CFString *MutableCopy;
  __CFString *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFRange v8;

  if (!theString)
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  v2 = (__CFString *)MutableCopy;
  if (MutableCopy)
  {
    if (CFStringHasPrefix(MutableCopy, CFSTR("~")))
    {
      v3 = ACFCopyHomeDirectoryURLForUser(0);
      if (v3)
      {
        v4 = v3;
        v5 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
        if (v5)
        {
          v6 = v5;
          v8.location = 0;
          v8.length = 1;
          CFStringReplace(v2, v8, v5);
          CFRelease(v6);
        }
        CFRelease(v4);
      }
    }
  }
  return v2;
}

CFURLRef ACFCopyHomeDirectoryURLForUser(const __CFString *a1)
{
  char *v2;
  char *v3;
  passwd *v4;
  uid_t v5;
  const char *pw_dir;
  size_t v7;
  char v9;

  if (!a1)
  {
    v5 = geteuid();
    if (!v5)
      v5 = getuid();
    v4 = getpwuid(v5);
    goto LABEL_9;
  }
  v9 = 0;
  v2 = ACFStringConvertToCString(a1, 0x8000100u, &v9);
  if (!v2)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, "CFURLRef ACFCopyHomeDirectoryURLForUser(CFStringRef)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 259, 0, "Failed to convert user name '%@' to UTF8 string.", a1);
    return 0;
  }
  v3 = v2;
  v4 = getpwnam(v2);
  if (v9 != 1)
  {
LABEL_9:
    if (!v4)
      return 0;
    goto LABEL_10;
  }
  free(v3);
  if (!v4)
    return 0;
LABEL_10:
  pw_dir = v4->pw_dir;
  if (pw_dir)
  {
    v7 = strlen(pw_dir);
    if (v7)
      return CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD260], (const UInt8 *)pw_dir, v7, 1u);
  }
  return 0;
}

uint64_t ACFConvertCFTypeToInteger(uint64_t result, _QWORD *a2)
{
  const __CFNumber *v3;
  CFTypeID v4;

  if (result)
  {
    v3 = (const __CFNumber *)result;
    v4 = CFGetTypeID((CFTypeRef)result);
    if (v4 == CFNumberGetTypeID())
    {
      return CFNumberGetValue(v3, kCFNumberCFIndexType, a2);
    }
    else if (v4 == CFStringGetTypeID())
    {
      *a2 = CFStringGetIntValue((CFStringRef)v3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ACFGetHomedirAccess()
{
  return sACFHomedirAllowed;
}

uint64_t ACFSetHomedirAccess(uint64_t result)
{
  sACFHomedirAllowed = result;
  return result;
}

__CFString *ACFPreferencesCopyPreferencesFilePath(const __CFString *a1, const __CFString *a2, CFStringRef theString1)
{
  CFComparisonResult v6;
  CFComparisonResult v7;
  __CFString *Mutable;
  __CFString *v9;
  const __CFString *v10;
  const __CFURL *v11;
  const __CFURL *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  BOOL v16;
  char v17;
  const __CFString *v18;

  v6 = CFStringCompare(theString1, (CFStringRef)*MEMORY[0x24BDBD570], 0);
  v7 = CFStringCompare(a2, (CFStringRef)*MEMORY[0x24BDBD578], 0);
  Mutable = CFStringCreateMutable(0, 0);
  v9 = Mutable;
  if (Mutable)
  {
    if (v7)
    {
      if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x24BDBD590], 0))
        v10 = a2;
      else
        v10 = 0;
      v11 = ACFCopyHomeDirectoryURLForUser(v10);
      if (v11)
      {
        v12 = v11;
        v13 = CFURLCopyFileSystemPath(v11, kCFURLPOSIXPathStyle);
        if (v13)
        {
          v14 = v13;
          CFStringAppend(v9, v13);
          CFStringAppend(v9, CFSTR("/"));
          CFRelease(v14);
        }
        CFRelease(v12);
      }
    }
    else
    {
      if (v6)
        v15 = CFSTR("/");
      else
        v15 = CFSTR("/Network/");
      CFStringAppend(Mutable, v15);
    }
    if (v6)
      v16 = v7 == kCFCompareEqualTo;
    else
      v16 = 1;
    v17 = v16;
    if (v16)
      v18 = CFSTR("Library/Preferences/");
    else
      v18 = CFSTR("Library/Preferences/ByHost/");
    CFStringAppend(v9, v18);
    CFStringAppend(v9, a1);
    if ((v17 & 1) == 0 && CFStringCompare(theString1, (CFStringRef)*MEMORY[0x24BDBD588], 0))
    {
      CFStringAppend(v9, CFSTR("."));
      CFStringAppend(v9, theString1);
    }
    CFStringAppend(v9, CFSTR(".plist"));
  }
  return v9;
}

uint64_t ACFCopyHostUUIDString()
{
  return 0;
}

CFTypeRef ACFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const void *Value;

  if (!sACFHomedirAllowed)
  {
    if ((CFStringRef)*MEMORY[0x24BDBD578] == userName)
    {
      v10 = ACFPreferencesCopyValueDirectlyFromFile((uint64_t)CFSTR("/Library/Preferences"), key, (uint64_t)applicationID);
      if (!a5)
        return v10;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  v10 = CFPreferencesCopyValue(key, applicationID, userName, a4);
  if (v10)
    return v10;
  v11 = (const __CFString *)*MEMORY[0x24BDBD590];
  v12 = (CFStringRef)*MEMORY[0x24BDBD578] == userName || v11 == userName;
  if (v12 || (v13 = ACFCopyLoginUserName()) == 0)
  {
LABEL_13:
    v10 = 0;
    if (!a5)
      return v10;
    goto LABEL_16;
  }
  v14 = v13;
  v10 = 0;
  if (CFStringCompare(userName, v13, 0) == kCFCompareEqualTo)
    v10 = CFPreferencesCopyValue(key, applicationID, v11, a4);
  CFRelease(v14);
  if (!a5)
    return v10;
LABEL_16:
  if (!v10)
  {
    Value = CFDictionaryGetValue(a5, key);
    if (Value)
      return CFRetain(Value);
    return 0;
  }
  return v10;
}

CFStringRef ACFCopyLoginUserName()
{
  char cStr[257];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (getlogin_r(cStr, 0x100uLL))
    return 0;
  else
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
}

CFTypeRef ACFPreferencesCopyValueDirectlyFromFile(uint64_t a1, const void *a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  __CFReadStream *v8;
  __CFReadStream *v9;
  CFPropertyListRef v10;
  CFTypeID TypeID;
  const void *Value;
  CFTypeRef v13;
  CFErrorRef error;
  CFPropertyListFormat format;

  error = 0;
  format = 0;
  v4 = CFStringCreateWithFormat(0, 0, CFSTR("%@/%@.plist"), a1, a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  if (v6)
  {
    v7 = v6;
    v8 = CFReadStreamCreateWithFile(0, v6);
    v9 = v8;
    if (v8 && CFReadStreamOpen(v8) == 1)
    {
      v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, &format, &error);
      if (v10
        && (TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v10))
        && (Value = CFDictionaryGetValue((CFDictionaryRef)v10, a2)) != 0)
      {
        v13 = CFRetain(Value);
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
      v10 = 0;
    }
    CFRelease(v5);
    CFRelease(v7);
    if (v9)
    {
      CFReadStreamClose(v9);
      CFRelease(v9);
    }
    if (v10)
      CFRelease(v10);
  }
  else
  {
    CFRelease(v5);
    v13 = 0;
  }
  if (error)
    CFRelease(error);
  return v13;
}

CFMutableDictionaryRef ACFPreferencesCopyDictionaryWithContentsOfFile(CFStringRef filePath, CFStringRef *a2)
{
  const __CFURL *v4;
  const __CFURL *v5;
  __CFReadStream *v6;
  __CFReadStream *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID TypeID;
  CFMutableDictionaryRef MutableCopy;
  CFErrorRef v12;
  CFErrorRef error;
  CFPropertyListFormat format;

  v4 = CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 0);
  if (v4)
  {
    v5 = v4;
    v6 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], v4);
    if (v6)
    {
      v7 = v6;
      if (CFReadStreamOpen(v6))
      {
        error = 0;
        format = kCFPropertyListXMLFormat_v1_0;
        v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v7, 0, 0, &format, &error);
        if (v8)
        {
          v9 = v8;
          TypeID = CFDictionaryGetTypeID();
          if (TypeID == CFGetTypeID(v9))
            MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v9);
          else
            MutableCopy = 0;
          CFRelease(v9);
        }
        else
        {
          MutableCopy = 0;
        }
        v12 = error;
        if (error)
        {
          if (a2)
          {
            *a2 = CFErrorCopyDescription(error);
            v12 = error;
          }
          CFRelease(v12);
        }
        CFReadStreamClose(v7);
      }
      else
      {
        MutableCopy = 0;
      }
      CFRelease(v7);
    }
    else
    {
      MutableCopy = 0;
      if (a2)
        *a2 = CFStringCreateWithFormat(0, 0, CFSTR("Failed to create read stream with file %@."), v5);
    }
    CFRelease(v5);
  }
  else
  {
    MutableCopy = 0;
    if (a2)
      *a2 = CFStringCreateWithFormat(0, 0, CFSTR("Failed to create CFURL with path %@."), filePath);
  }
  return MutableCopy;
}

const void *ACFPreferencesCopyArray(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5;
  const void *v6;
  CFTypeID v7;

  v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFArrayGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

const void *ACFPreferencesCopyDictionary(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5;
  const void *v6;
  CFTypeID v7;

  v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFDictionaryGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

const void *ACFPreferencesCopyString(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5)
{
  CFTypeRef v5;
  const void *v6;
  CFTypeID v7;

  v5 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID())
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

uint64_t ACFPreferencesGetBooleanValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, Boolean *a6)
{
  const __CFString *v7;
  const __CFString *v8;
  const __CFBoolean *v9;
  uint64_t v10;

  v7 = (const __CFString *)ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = (const __CFBoolean *)ACFGetBooleanValue(v7);
  if (v9)
  {
    if (a6)
      *a6 = CFBooleanGetValue(v9);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  CFRelease(v8);
  return v10;
}

uint64_t ACFPreferencesGetIntegerValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, _QWORD *a6)
{
  CFTypeRef v7;
  uint64_t v8;

  v7 = ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  v8 = ACFConvertCFTypeToInteger((uint64_t)v7, a6);
  if (v7)
    CFRelease(v7);
  return v8;
}

uint64_t ACFPreferencesGetDoubleValue(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, double *a6)
{
  const __CFNumber *v7;
  const __CFNumber *v8;
  CFTypeID v9;
  uint64_t Value;

  v7 = (const __CFNumber *)ACFPreferencesCopyValue(a1, a2, a3, a4, a5);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = CFGetTypeID(v7);
  if (v9 == CFNumberGetTypeID())
  {
    Value = CFNumberGetValue(v8, kCFNumberDoubleType, a6);
  }
  else if (v9 == CFStringGetTypeID())
  {
    if (a6)
      *a6 = CFStringGetDoubleValue((CFStringRef)v8);
    Value = 1;
  }
  else
  {
    Value = 0;
  }
  CFRelease(v8);
  return Value;
}

uint64_t ACFPreferencesSynchronize(const __CFString *a1, const __CFString *a2, const __CFString *a3)
{
  if (sACFHomedirAllowed)
    return CFPreferencesSynchronize(a1, a2, a3);
  else
    return 0;
}

uint64_t ACFSystemVersion()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const __CFString *Value;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v4;
  CFIndex Count;
  unint64_t v6;
  const __CFString *ValueAtIndex;
  SInt32 v8;
  SInt32 v9;
  const __CFString *v10;
  const __CFString *v11;
  SInt32 IntValue;

  if (!ACFSystemVersion_sACFSystemVersion)
  {
    v0 = (const __CFDictionary *)ACFCopySystemVersionDictionary();
    if (v0)
    {
      v1 = v0;
      Value = (const __CFString *)CFDictionaryGetValue(v0, CFSTR("ProductVersion"));
      if (!Value)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"unsigned int ACFSystemVersion(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 664, 0, "Failed to get system version. SystemVersion.plist doesn't contain ProductVersion.");
        goto LABEL_20;
      }
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, Value, CFSTR("."));
      if (!ArrayBySeparatingStrings)
      {
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
          ACFLog(3, (uint64_t)"unsigned int ACFSystemVersion(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 669, 0, "Failed to get system version. Failed to create substring from ProductVersion string %@.", 0);
        goto LABEL_20;
      }
      v4 = ArrayBySeparatingStrings;
      Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count < 1)
      {
        v9 = 0;
        v8 = 0;
      }
      else
      {
        v6 = Count;
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
        v8 = CFStringGetIntValue(ValueAtIndex) << 16;
        if (v6 == 1)
        {
          v9 = 0;
        }
        else
        {
          v10 = (const __CFString *)CFArrayGetValueAtIndex(v4, 1);
          v9 = CFStringGetIntValue(v10) << 8;
          if (v6 >= 3)
          {
            v11 = (const __CFString *)CFArrayGetValueAtIndex(v4, 2);
            IntValue = CFStringGetIntValue(v11);
LABEL_19:
            ACFSystemVersion_sACFSystemVersion = v8 | v9 | IntValue;
            CFRelease(v4);
LABEL_20:
            CFRelease(v1);
            return ACFSystemVersion_sACFSystemVersion;
          }
        }
      }
      IntValue = 0;
      goto LABEL_19;
    }
  }
  return ACFSystemVersion_sACFSystemVersion;
}

CFPropertyListRef ACFCopySystemVersionDictionary()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFReadStream *v2;
  __CFReadStream *v3;
  CFPropertyListRef v4;
  CFErrorRef error;
  CFPropertyListFormat format;

  error = 0;
  format = kCFPropertyListXMLFormat_v1_0;
  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/CoreServices/SystemVersion.plist"), kCFURLPOSIXPathStyle, 0);
  if (!v0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 712, 0, "Failed to read SystemVersion.plist. CFURLCreateWithFileSystemPath fails");
    return 0;
  }
  v1 = v0;
  v2 = CFReadStreamCreateWithFile(0, v0);
  if (!v2)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 714, 0, "Failed to read SystemVersion.plist. CFReadStreamCreateWithFile fails.");
    CFRelease(v1);
    return 0;
  }
  v3 = v2;
  if (!CFReadStreamOpen(v2))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 716, 0, "Failed to read SystemVersion.plist. CFReadStreamOpen fails.");
    goto LABEL_19;
  }
  v4 = CFPropertyListCreateWithStream(0, v3, 0, 0, &format, &error);
  if (!v4 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0)
      ACFLog(3, (uint64_t)"CFDictionaryRef ACFCopySystemVersionDictionary(void)", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCoreFoundationConveniences.c", 718, 0, "Failed to read SystemVersion.plist. CFPropertyListCreateFromStream fails: %@.", error);
LABEL_19:
    v4 = 0;
  }
  CFRelease(v1);
  CFReadStreamClose(v3);
  CFRelease(v3);
  if (error)
    CFRelease(error);
  return v4;
}

uint64_t ACFCopySystemVersionString()
{
  return 0;
}

uint64_t ACFCopySystemVersionDictionaryProductName()
{
  return 0;
}

CFStringRef ACFCopyProcessNameForPID(int a1)
{
  int v1;
  CFStringRef result;
  size_t v3;
  int v4[2];
  int v5;
  int v6;
  _OWORD v7[40];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v7, 0, 512);
  v3 = 648;
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = a1;
  v1 = sysctl(v4, 4u, v7, &v3, 0, 0);
  result = 0;
  if (!v1)
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)&v7[15] + 3, 0x8000100u);
  return result;
}

void sub_22F7EDB8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7EDC50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7EDD3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7EDED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ACMExternalAppleConnectPrivateCreate(uint64_t a1)
{
  return objc_msgSend(+[ACMExternalAppleConnectImplComponents components](ACMExternalAppleConnectImplComponents, "components"), "createAppleConnectImplWithMasterObject:", a1);
}

void sub_22F7F1FC8(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_22F7F4128(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7F4194(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7F575C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7F5874(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7F59D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7F5AC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void dispatch_async_on_main_thread(uint64_t a1)
{
  ACFDispatchHelper *v2;
  ACFDispatchHelper *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v2 = [ACFDispatchHelper alloc];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __dispatch_async_on_main_thread_block_invoke;
  v4[3] = &unk_24FCE5428;
  v4[4] = a1;
  v4[5] = &v5;
  v3 = -[ACFDispatchHelper initWithBlock:](v2, "initWithBlock:", v4);
  v6[5] = (uint64_t)v3;
  -[ACFDispatchHelper performSelectorOnMainThread:withObject:waitUntilDone:](v3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_dispatch, 0, 0);
  _Block_object_dispose(&v5, 8);
}

void sub_22F7F9668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __dispatch_async_on_main_thread_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_22F7FCC38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FCCF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FCD64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FDC08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FDCD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FDD40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FDEE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FDFE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FE79C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FE7E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FE834(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FE898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FE964(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F7FEA4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22F807400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A0](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4E0](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x24BDBC630](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E0](theString, range.location, range.length, replacement);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE618](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecKeyEncrypt(SecKeyRef key, SecPadding padding, const uint8_t *plainText, size_t plainTextLen, uint8_t *cipherText, size_t *cipherTextLen)
{
  return MEMORY[0x24BDE8B50](key, *(_QWORD *)&padding, plainText, plainTextLen, cipherText, cipherTextLen);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x24BDE8B70](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x24BDE8B90](key, *(_QWORD *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

int asl_add_log_file(asl_object_t client, int descriptor)
{
  return MEMORY[0x24BDAD1A8](client, *(_QWORD *)&descriptor);
}

void asl_close(asl_object_t obj)
{
  MEMORY[0x24BDAD1B0](obj);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x24BDAD1C0](client, msg, *(_QWORD *)&level, format);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x24BDAD1D0](ident, facility, *(_QWORD *)&opts);
}

int asl_remove_log_file(asl_object_t client, int descriptor)
{
  return MEMORY[0x24BDAD1D8](client, *(_QWORD *)&descriptor);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x24BEDF1B0](dest, destLen, source, sourceLen, *(_QWORD *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x24BEDF1B8](sourceLen);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getlogin_r(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE688](a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x24BDAE8A8](*(_QWORD *)&a1.s_addr);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

