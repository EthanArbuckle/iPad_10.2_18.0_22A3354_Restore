int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  int v9;

  v9 = -4300;
  if (algorithm == 2 && prf - 1 <= 4)
  {
    CCDigestGetDigestInfo(prf + 7);
    if (rounds)
    {
      if (password && derivedKey && derivedKeyLen && (salt || !saltLen))
      {
        if (ccpbkdf2_hmac())
          return -4300;
        else
          return 0;
      }
    }
  }
  return v9;
}

uint64_t ccDRBGGetRngState()
{
  return ccrng();
}

uint64_t CCBigNumDiv()
{
  ccz_divmod();
  return 0;
}

uint64_t CCBigNumMulI()
{
  ccz_muli();
  return 0;
}

uint64_t CCDeriveKey(int *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo;
  uint64_t v12;
  BOOL v13;
  int v14;
  int v15;

  DigestInfo = CCDigestGetDigestInfo(a2);
  v12 = 4294962996;
  if (DigestInfo && a5 && a6 && (a3 || !a4))
  {
    v13 = !a4 || a3 == 0;
    v14 = *a1;
    if (!v13 || v14 == 6)
    {
      v12 = 4294962991;
      switch(v14)
      {
        case 0:
          v15 = ccpbkdf2_hmac();
          goto LABEL_18;
        case 1:
          v15 = ccnistkdf_ctr_hmac();
          goto LABEL_18;
        case 2:
          v15 = ccnistkdf_ctr_hmac_fixed();
          goto LABEL_18;
        case 6:
          v15 = cchkdf();
          goto LABEL_18;
        case 7:
          v15 = ccansikdf_x963();
LABEL_18:
          if (v15)
            v12 = 4294962996;
          else
            v12 = 0;
          break;
        default:
          return v12;
      }
    }
  }
  return v12;
}

uint64_t CCHKDFExtract(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *DigestInfo;
  uint64_t result;

  DigestInfo = (_QWORD *)CCDigestGetDigestInfo(a2);
  result = 4294962996;
  if (a5 && DigestInfo && *DigestInfo == a6 && (a3 || !a4) && *a1 == 6)
  {
    if (cchkdf_extract())
      return 4294962988;
    else
      return 0;
  }
  return result;
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  unsigned int (**v4)(_QWORD, size_t, void *);

  if (!count)
    return 0;
  if (!bytes)
    return -4300;
  v4 = (unsigned int (**)(_QWORD, size_t, void *))ccrng();
  if ((*v4)(v4, count, bytes))
    return -4307;
  else
    return 0;
}

void CCDigestDestroy(void *a1)
{
  if (a1)
  {
    cc_clear();
    free(a1);
  }
}

void CCBigNumFree(void *a1)
{
  ccz_free();
  free(a1);
}

uint64_t CCCryptorGCMOneshotDecrypt(int a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result;
  int v13;
  unsigned int v14;

  if (a1)
    return 4294962996;
  result = 4294962986;
  if (a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0)
  {
    result = 4294962996;
    if (a5 >= 0xC && (unint64_t)(a12 - 17) >= 0xFFFFFFFFFFFFFFF7 && a2 && a4 && a11 && (!a9 || a10))
    {
      __memcpy_chk();
      ccaes_gcm_decrypt_mode();
      v13 = ccgcm_one_shot();
      if (v13)
        cc_clear();
      cc_clear();
      if (v13 == -7)
        v14 = -4300;
      else
        v14 = -4308;
      if (v13)
        return v14;
      else
        return 0;
    }
  }
  return result;
}

void CCKDFParametersDestroy(void *a1)
{
  cc_clear();
  free(a1);
}

uint64_t CCKDFParametersCreateHkdf(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v11;
  _QWORD *v12;

  if (!a2 && a3 || !a4 && a5)
    return 4294962996;
  v11 = malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
  if (!v11)
    return 4294962994;
  v12 = v11;
  result = 0;
  *(_DWORD *)v12 = 6;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  *a1 = v12;
  return result;
}

void cc_free(uint64_t a1, uint64_t a2, void *a3)
{
  cc_clear();
  free(a3);
}

uint64_t init_globals(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  *(_OWORD *)(a1 + 3536) = 0u;
  *(_OWORD *)(a1 + 3552) = 0u;
  *(_QWORD *)(a1 + 3664) = 0;
  *(_OWORD *)(a1 + 3648) = 0u;
  *(_OWORD *)(a1 + 3632) = 0u;
  *(_OWORD *)(a1 + 3616) = 0u;
  *(_OWORD *)(a1 + 3600) = 0u;
  *(_OWORD *)(a1 + 3584) = 0u;
  *(_OWORD *)(a1 + 3568) = 0u;
  *(_QWORD *)(a1 + 3544) = MEMORY[0x1E0C86B58];
  *(_QWORD *)(a1 + 3552) = MEMORY[0x1E0C86B60];
  *(_QWORD *)(a1 + 3560) = ccmd5_di();
  *(_QWORD *)(a1 + 3576) = MEMORY[0x1E0C86C10];
  *(_QWORD *)(a1 + 3600) = ccsha1_di();
  *(_QWORD *)(a1 + 3608) = ccsha224_di();
  *(_QWORD *)(a1 + 3616) = ccsha256_di();
  *(_QWORD *)(a1 + 3624) = ccsha384_di();
  *(_QWORD *)(a1 + 3632) = ccsha512_di();
  *(_QWORD *)(a1 + 3640) = ccsha3_224_di();
  *(_QWORD *)(a1 + 3648) = ccsha3_256_di();
  *(_QWORD *)(a1 + 3656) = ccsha3_384_di();
  v2 = 0;
  *(_QWORD *)(a1 + 3664) = ccsha3_512_di();
  *(_QWORD *)(a1 + 2472) = &defaultBase64;
  *(_QWORD *)(a1 + 2736) = &defaultBase32;
  *(_QWORD *)(a1 + 3000) = &recoveryBase32;
  *(_QWORD *)(a1 + 2208) = 0;
  *(_QWORD *)(a1 + 3264) = &hexBase32;
  *(_QWORD *)(a1 + 3528) = &defaultBase16;
  do
  {
    result = setReverseMap(a1 + 2216 + v2);
    v2 += 264;
  }
  while (v2 != 1320);
  *(_QWORD *)(a1 + 328) = &CC_crc8;
  *(_QWORD *)(a1 + 360) = &CC_crc8_icode;
  *(_QWORD *)(a1 + 392) = &CC_crc8_itu;
  *(_QWORD *)(a1 + 424) = &CC_crc8_rohc;
  *(_QWORD *)(a1 + 456) = &CC_crc8_wcdma;
  *(_QWORD *)(a1 + 648) = &CC_crc16;
  *(_QWORD *)(a1 + 680) = &CC_crc16_ccitt_true;
  *(_QWORD *)(a1 + 712) = &CC_crc16_ccitt_false;
  *(_QWORD *)(a1 + 744) = &CC_crc16_usb;
  *(_QWORD *)(a1 + 776) = &CC_crc16_xmodem;
  *(_QWORD *)(a1 + 808) = &CC_crc16_dect_r;
  *(_QWORD *)(a1 + 840) = &CC_crc16_dect_x;
  *(_QWORD *)(a1 + 872) = &CC_crc16_icode;
  *(_QWORD *)(a1 + 904) = &CC_crc16_verifone;
  *(_QWORD *)(a1 + 936) = &CC_crc16_a;
  *(_QWORD *)(a1 + 968) = &CC_crc16_b;
  *(_QWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 1288) = &CC_adler32;
  *(_QWORD *)(a1 + 1320) = &CC_crc32;
  *(_QWORD *)(a1 + 1352) = &CC_crc32_castagnoli;
  *(_QWORD *)(a1 + 1384) = &CC_crc32_bzip2;
  *(_QWORD *)(a1 + 1416) = &CC_crc32_mpeg_2;
  *(_QWORD *)(a1 + 1448) = &CC_crc32_posix;
  *(_QWORD *)(a1 + 1480) = &CC_crc32_xfer;
  *(_QWORD *)(a1 + 1928) = &CC_crc64_ecma_182;
  return result;
}

uint64_t setReverseMap(uint64_t result)
{
  __int128 v1;
  uint64_t v2;
  unint64_t v3;

  *(_QWORD *)&v1 = 0x8080808080808080;
  *((_QWORD *)&v1 + 1) = 0x8080808080808080;
  *(_OWORD *)(result + 224) = v1;
  *(_OWORD *)(result + 240) = v1;
  *(_OWORD *)(result + 192) = v1;
  *(_OWORD *)(result + 208) = v1;
  *(_OWORD *)(result + 160) = v1;
  *(_OWORD *)(result + 176) = v1;
  *(_OWORD *)(result + 128) = v1;
  *(_OWORD *)(result + 144) = v1;
  *(_OWORD *)(result + 96) = v1;
  *(_OWORD *)(result + 112) = v1;
  *(_OWORD *)(result + 64) = v1;
  *(_OWORD *)(result + 80) = v1;
  *(_OWORD *)(result + 32) = v1;
  *(_OWORD *)(result + 48) = v1;
  *(_OWORD *)result = v1;
  *(_OWORD *)(result + 16) = v1;
  v2 = *(_QWORD *)(result + 256);
  if (*(_BYTE *)(v2 + 32))
  {
    v3 = 0;
    do
    {
      *(_BYTE *)(result + *(unsigned __int8 *)(*(_QWORD *)(v2 + 16) + v3)) = v3;
      ++v3;
    }
    while (v3 < *(unsigned __int8 *)(v2 + 32));
  }
  return result;
}

uint64_t CCCryptorGCMReset(uint64_t a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;

  v1 = 4294962996;
  if (a1)
  {
    v2 = ccgcm_reset();
    if (v2 == -7)
      v3 = -4300;
    else
      v3 = -4308;
    if (v2)
      return v3;
    else
      return 0;
  }
  return v1;
}

uint64_t CCCryptorGCMSetIV(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  int v4;
  unsigned int v5;

  if (!a1)
    return 4294962996;
  result = 4294962996;
  if (a2 && a3 >= 0xC)
  {
    v4 = ccgcm_set_iv();
    if (v4 == -7)
      v5 = -4300;
    else
      v5 = -4308;
    if (v4)
      return v5;
    else
      return 0;
  }
  return result;
}

void *CCBigNumFromDecimalString(int *a1, const char *a2)
{
  void *v4;
  void *v5;
  int v6;

  v4 = CCCreateBigNum(a1);
  if (!v4)
  {
    v6 = -4302;
LABEL_6:
    v5 = 0;
    *a1 = v6;
    return v5;
  }
  v5 = v4;
  strlen(a2);
  if (ccz_read_radix())
  {
    ccz_zero();
    if (!a1)
      return 0;
    v6 = -4304;
    goto LABEL_6;
  }
  return v5;
}

void *CCBigNumFromData(int *a1)
{
  void *v1;

  v1 = CCCreateBigNum(a1);
  if (v1)
    ccz_read_uint();
  return v1;
}

void *CCBigNumFromHexString(int *a1, const char *a2)
{
  void *v4;
  void *v5;
  int v6;

  v4 = CCCreateBigNum(a1);
  if (!v4)
  {
    v6 = -4302;
LABEL_6:
    v5 = 0;
    *a1 = v6;
    return v5;
  }
  v5 = v4;
  strlen(a2);
  if (ccz_read_radix())
  {
    ccz_zero();
    if (!a1)
      return 0;
    v6 = -4304;
    goto LABEL_6;
  }
  return v5;
}

void *CCCreateBigNum(int *a1)
{
  size_t v2;
  void *v3;
  void *v4;
  int v5;

  v2 = ccz_size();
  v3 = malloc_type_malloc(v2, 0xB3F21A55uLL);
  v4 = v3;
  if (a1)
  {
    if (v3)
      v5 = 0;
    else
      v5 = -4302;
    *a1 = v5;
  }
  if (v3)
    ccz_init();
  return v4;
}

uint64_t CCHKDFExpand(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo;
  _QWORD *v12;
  uint64_t result;

  DigestInfo = CCDigestGetDigestInfo(a2);
  if (!DigestInfo)
    return 4294962996;
  v12 = (_QWORD *)DigestInfo;
  result = 4294962996;
  if (a3 && a5 && a6 && *v12 == a4 && *a1 == 6)
  {
    if (cchkdf_expand())
      return 4294962988;
    else
      return 0;
  }
  return result;
}

uint64_t CCCryptorGCMFinalize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;

  if (!a1)
    return 4294962996;
  v4 = 4294962996;
  if (a2)
  {
    if ((unint64_t)(a3 - 17) >= 0xFFFFFFFFFFFFFFF7)
    {
      v5 = *(_DWORD *)(a1 + 72);
      if (v5 <= 1)
      {
        if (v5 == 1)
          __memcpy_chk();
        if (ccgcm_finalize())
          v4 = 4294962988;
        else
          v4 = 0;
        if (*(_DWORD *)(a1 + 72) == 1)
          cc_clear();
      }
    }
  }
  return v4;
}

uint64_t CCDigestUpdate(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (!a1)
    return 4294962996;
  if (!a3)
    return 0;
  if (!a2)
    return 4294962996;
  if (!*a1)
    return 4294962991;
  ccdigest_update();
  return 0;
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(0xCu);
  cc_clear();
  cc_clear();
  c->count[0] = 0;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(_QWORD *)(DigestInfo + 8));
  return 1;
}

void *CCDigestCreate(unsigned int a1)
{
  void *v2;

  v2 = malloc_type_malloc(0x408uLL, 0x1000040F7F14A6DuLL);
  if (v2 && CCDigestInit(a1, (uint64_t *)v2))
  {
    free(v2);
    return 0;
  }
  return v2;
}

uint64_t CCDigestInit(unsigned int a1, uint64_t *a2)
{
  uint64_t DigestInfo;

  if (a1 - 17 < 0xFFFFFFF0 || a2 == 0)
    return 4294962996;
  DigestInfo = CCDigestGetDigestInfo(a1);
  *a2 = DigestInfo;
  if (!DigestInfo)
    return 4294962991;
  ccdigest_init();
  return 0;
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  uint64_t v6;

  v6 = 0;
  while (ccconversionTable[v6] != algorithm)
  {
    v6 += 4;
    if (v6 == 24)
      goto LABEL_6;
  }
  CCDigestGetDigestInfo(ccconversionTable[v6 + 1]);
LABEL_6:
  cchmac();
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  uint64_t v6;
  uint64_t DigestInfo;

  if (ctx)
  {
    cc_clear();
    v6 = 0;
    while (ccconversionTable[v6] != algorithm)
    {
      v6 += 4;
      if (v6 == 24)
      {
        *(_QWORD *)ctx->ctx = 0;
        return;
      }
    }
    DigestInfo = CCDigestGetDigestInfo(ccconversionTable[v6 + 1]);
    *(_QWORD *)ctx->ctx = DigestInfo;
    if (DigestInfo)
      cchmac_init();
  }
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(0xAu, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  int v8;
  CCMode v9;
  size_t v11;
  uint64_t v12;

  if ((options & 2) != 0)
    v8 = 1;
  else
    v8 = 2;
  if (alg == 4)
    v9 = 9;
  else
    v9 = v8;
  return CCCryptorCreateWithMode(op, v9, alg, options & 1, iv, key, keyLength, 0, v11, v12, HIDWORD(v12), cryptorRef);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  int v14;
  CCMode v15;
  CCCryptorStatus v16;
  size_t OutputLength;
  size_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  CCCryptorRef cryptorRef;

  v22 = 0;
  cryptorRef = 0;
  if ((options & 2) != 0)
    v14 = 1;
  else
    v14 = 2;
  if (alg == 4)
    v15 = 9;
  else
    v15 = v14;
  v21 = 0;
  v16 = CCCryptorCreateWithMode(op, v15, alg, options & 1, iv, key, keyLength, 0, v19, v20, HIDWORD(v20), &cryptorRef);
  if (!v16)
  {
    OutputLength = CCCryptorGetOutputLength(cryptorRef, dataInLength, 1);
    if (dataOutMoved)
      *dataOutMoved = OutputLength;
    if (OutputLength <= dataOutAvailable)
    {
      v16 = CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, &v22);
      if (!v16)
      {
        v16 = CCCryptorFinal(cryptorRef, (char *)dataOut + v22, dataOutAvailable - v22, &v21);
        if (dataOutMoved)
          *dataOutMoved = v21 + v22;
      }
    }
    else
    {
      v16 = -4301;
    }
    CCCryptorRelease(cryptorRef);
  }
  return v16;
}

uint64_t CCCryptorGCM(CCOperation a1, CCAlgorithm alg, void *key, size_t keyLength, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17;
  CCCryptorRef cryptorRef;

  cryptorRef = 0;
  v17 = CCCryptorCreateWithMode(a1, 0xBu, alg, 0, 0, key, keyLength, 0, 0, 0, 0, &cryptorRef);
  if (!(_DWORD)v17)
  {
    v17 = CCCryptorGCMAddIV((uint64_t)cryptorRef, a5, a6);
    if (!(_DWORD)v17)
    {
      v17 = CCCryptorGCMAddAAD((uint64_t)cryptorRef, a7, a8);
      if (!(_DWORD)v17)
      {
        v17 = gcm_update((uint64_t)cryptorRef, a9, a10, a11);
        if (!(_DWORD)v17)
        {
          v17 = CCCryptorGCMFinal((uint64_t)cryptorRef, a12, a13);
          CCCryptorRelease(cryptorRef);
        }
      }
    }
  }
  return v17;
}

uint64_t gcm_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  uint64_t result;
  int v6;
  unsigned int v7;

  if (!a1)
    return 4294962996;
  if (a3)
    v4 = a2 == 0;
  else
    v4 = 0;
  result = 4294962996;
  if (!v4 && a4)
  {
    v6 = ccgcm_update();
    if (v6 == -7)
      v7 = -4300;
    else
      v7 = -4308;
    if (v6)
      return v7;
    else
      return 0;
  }
  return result;
}

uint64_t CCCryptorGCMAddAAD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  if (!a1)
    return 4294962996;
  v3 = 4294962996;
  if (a2 || !a3)
  {
    v4 = ccgcm_aad();
    if (v4 == -7)
      v5 = -4300;
    else
      v5 = -4308;
    if (v4)
      return v5;
    else
      return 0;
  }
  return v3;
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  CCCryptorRef v1;

  if (cryptorRef)
  {
    if (*(_QWORD *)cryptorRef)
      v1 = *(CCCryptorRef *)cryptorRef;
    else
      v1 = cryptorRef;
    ccClearCryptor((uint64_t)v1);
    free(v1);
  }
  return 0;
}

uint64_t ccClearCryptor(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  int v4;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v11;

  cc_clear();
  v2 = *(_DWORD *)(a1 + 68);
  v3 = v2 > 8;
  v4 = (1 << v2) & 0x106;
  if (v3 || v4 == 0)
  {
    v11 = *(unsigned int *)(a1 + 72);
    if (v11 < 2)
    {
      (**(void (***)(_QWORD))(a1 + 96))(*(_QWORD *)(a1 + 8 * v11 + 80));
      cc_clear();
      free(*(void **)(a1 + 104 + 8 * *(unsigned int *)(a1 + 72)));
      return cc_clear();
    }
    if ((_DWORD)v11 != 3)
      return cc_clear();
  }
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = a1 + 8 * v6;
    (**(void (***)(_QWORD))(a1 + 96))(*(_QWORD *)(v9 + 80));
    cc_clear();
    free(*(void **)(v9 + 104));
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  return cc_clear();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  CCCryptorStatus v12;
  const void *v15;
  void *v20;
  void *v21;
  _DWORD *v22;
  uint64_t v23;
  CCMode v24;
  CCMode v25;
  uint64_t v26;
  uint64_t (**v27)();
  uint64_t v28;
  size_t v29;
  void *v30;
  size_t v31;
  void *v32;
  uint64_t v33;
  uint64_t (**v34)();
  size_t v35;
  uint64_t (**v36)();
  _QWORD *v38;
  unsigned int v39;
  int v40;
  CCMode v41;
  const void *v42;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C874D8];
  v12 = -4300;
  if (!key || !cryptorRef)
    return v12;
  v15 = key;
  if ((key & 3) != 0)
  {
    v20 = malloc_type_malloc(keyLength, 0xED0CBEFAuLL);
    if (!v20)
      return -4302;
    v21 = v20;
    v42 = tweak;
    memcpy(v20, v15, keyLength);
    v15 = v21;
  }
  else
  {
    v42 = tweak;
    v21 = 0;
  }
  v22 = malloc_type_malloc(0x1000uLL, 0x517B48DuLL);
  if (!v22)
  {
    *cryptorRef = 0;
    v12 = -4302;
    if (!v21)
      return v12;
    goto LABEL_84;
  }
  v23 = (uint64_t)v22;
  *(_QWORD *)v22 = 0;
  if (op <= 3 && alg <= 6)
  {
    if (alg == 4)
      v24 = 7;
    else
      v24 = mode;
    v22[17] = v24;
    if (v24 <= 8 && ((1 << v24) & 0x106) != 0)
    {
      *((_QWORD *)v22 + 13) = 0;
      *((_QWORD *)v22 + 14) = 0;
    }
    else
    {
      *((_QWORD *)v22 + 13) = 0;
      *((_QWORD *)v22 + 14) = 0;
      if (op < 2)
      {
        v41 = v24;
        v12 = setCryptorCipherMode((uint64_t)v22, alg, v24, op);
        if (v12)
          goto LABEL_83;
        v28 = v23 + 8 * op;
        v29 = (**(uint64_t (***)(_QWORD))(v23 + 96))(*(_QWORD *)(v28 + 80));
        v30 = malloc_type_malloc(v29, 0x84A0ADF6uLL);
        *(_QWORD *)(v28 + 104) = v30;
        goto LABEL_64;
      }
      if (op != 3)
      {
LABEL_65:
        if (padding == 12)
        {
          v36 = cccts3_pad;
        }
        else if (padding == 1)
        {
          if (v24 == 2)
            v36 = ccpkcs7_pad;
          else
            v36 = ccpkcs7_ecb_pad;
        }
        else
        {
          v36 = ccnopad_pad;
        }
        *(_QWORD *)(v23 + 120) = v36;
        *(_DWORD *)(v23 + 64) = alg;
        switch(alg)
        {
          case 1u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 8;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength != 8)
              goto LABEL_82;
            goto LABEL_91;
          case 2u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 8;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength != 24)
              goto LABEL_82;
            goto LABEL_91;
          case 3u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 8;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength - 5 < 0xC)
              goto LABEL_91;
            goto LABEL_82;
          case 4u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 1;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength - 1 < 0x200)
              goto LABEL_91;
            goto LABEL_82;
          case 5u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 8;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength - 1 < 0x80)
              goto LABEL_91;
            goto LABEL_82;
          case 6u:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 8;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (keyLength - 8 < 0x31)
              goto LABEL_91;
            goto LABEL_82;
          default:
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 16;
            *(_DWORD *)(v23 + 72) = op;
            *(_QWORD *)(v23 + 40) = 0;
            if (alg)
            {
LABEL_82:
              v12 = -4310;
              goto LABEL_83;
            }
            v12 = -4310;
            if (keyLength > 0x20 || ((1 << keyLength) & 0x101010000) == 0)
              goto LABEL_83;
LABEL_91:
            v44[0] = 0;
            v44[1] = 0;
            if (iv)
              v38 = iv;
            else
              v38 = v44;
            v39 = *(_DWORD *)(v23 + 68);
            if (v39 <= 8 && ((1 << v39) & 0x106) != 0)
              goto LABEL_96;
            if (op >= 2)
            {
              if (op != 3)
                goto LABEL_106;
LABEL_96:
              v40 = (*(uint64_t (**)(_QWORD, _QWORD *, const void *, size_t, const void *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v23 + 96) + 16))(*(_QWORD *)(v23 + 80), v38, v15, keyLength, v42, 0, 0, *(_QWORD *)(v23 + 104));
              if (!((*(unsigned int (**)(_QWORD, _QWORD *, const void *, size_t, const void *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v23 + 96) + 16))(*(_QWORD *)(v23 + 88), v38, v15, keyLength, v42, 0, 0, *(_QWORD *)(v23 + 112)) | v40))goto LABEL_106;
            }
            else if (!(*(unsigned int (**)(_QWORD, _QWORD *, const void *, size_t, const void *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v23 + 96) + 16))(*(_QWORD *)(v23 + 8 * op + 80), v38, v15, keyLength, v42, 0, 0, *(_QWORD *)(v23 + 8 * op + 104)))
            {
              goto LABEL_106;
            }
            if (*(_DWORD *)(v23 + 64) != 2 && *(_DWORD *)(v23 + 68) != 8)
            {
              v12 = -4308;
              goto LABEL_83;
            }
LABEL_106:
            v12 = 0;
            *cryptorRef = (CCCryptorRef)v23;
            if (!v21)
              return v12;
            goto LABEL_84;
        }
      }
    }
    v25 = v24 - 1;
    v41 = v24;
    switch(v24)
    {
      case 1u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = ccecb_mode;
        goto LABEL_43;
      case 2u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 1])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = cccbc_mode;
        goto LABEL_43;
      case 3u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 2])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = cccfb_mode;
        goto LABEL_43;
      case 4u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 4])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = ccctr_mode;
        goto LABEL_43;
      case 7u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 5])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = ccofb_mode;
        goto LABEL_43;
      case 8u:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 6])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = ccxts_mode;
        goto LABEL_43;
      case 0xAu:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 3])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = cccfb8_mode;
        goto LABEL_43;
      case 0xBu:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 7])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
          goto LABEL_68;
        v27 = ccgcm_mode;
        goto LABEL_43;
      case 0xCu:
        v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 8])();
        *(_QWORD *)(v23 + 80) = v26;
        if (!v26)
        {
LABEL_68:
          v12 = -4305;
          goto LABEL_83;
        }
        v27 = ccccm_mode;
LABEL_43:
        *(_QWORD *)(v23 + 96) = v27;
        v31 = ((uint64_t (*)(uint64_t))*v27)(v26);
        v32 = malloc_type_malloc(v31, 0x7AA7BB3BuLL);
        *(_QWORD *)(v23 + 104) = v32;
        if (!v32)
          goto LABEL_69;
        switch(v25)
        {
          case 0u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 9])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccecb_mode;
            break;
          case 1u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 10])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = cccbc_mode;
            break;
          case 2u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 11])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = cccfb_mode;
            break;
          case 3u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 13])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccctr_mode;
            break;
          case 6u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 14])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccofb_mode;
            break;
          case 7u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 15])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccxts_mode;
            break;
          case 9u:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 12])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = cccfb8_mode;
            break;
          case 0xAu:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 16])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccgcm_mode;
            break;
          case 0xBu:
            v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 17])();
            *(_QWORD *)(v23 + 88) = v33;
            if (!v33)
              goto LABEL_68;
            v34 = ccccm_mode;
            break;
          default:
            goto LABEL_83;
        }
        *(_QWORD *)(v23 + 96) = v34;
        v35 = ((uint64_t (*)(uint64_t))*v34)(v33);
        v30 = malloc_type_malloc(v35, 0x4C825E9CuLL);
        *(_QWORD *)(v23 + 112) = v30;
        break;
      default:
        goto LABEL_83;
    }
LABEL_64:
    v24 = v41;
    if (v30)
      goto LABEL_65;
LABEL_69:
    v12 = -4302;
  }
LABEL_83:
  *cryptorRef = 0;
  ccClearCryptor(v23);
  free((void *)v23);
  if (v21)
  {
LABEL_84:
    cc_clear();
    free(v21);
  }
  return v12;
}

uint64_t ccgcm_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t setCryptorCipherMode(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t (**v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 4294962996;
  switch(a3)
  {
    case 1:
      v7 = (*(&ccmodeList[18 * a2] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v7;
      if (!v7)
        return 4294962991;
      v8 = ccecb_mode;
      goto LABEL_20;
    case 2:
      v9 = (*(&ccmodeList[18 * a2 + 1] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v9;
      if (!v9)
        return 4294962991;
      v8 = cccbc_mode;
      goto LABEL_20;
    case 3:
      v10 = (*(&ccmodeList[18 * a2 + 2] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v10;
      if (!v10)
        return 4294962991;
      v8 = cccfb_mode;
      goto LABEL_20;
    case 4:
      v11 = (*(&ccmodeList[18 * a2 + 4] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v11;
      if (!v11)
        return 4294962991;
      v8 = ccctr_mode;
      goto LABEL_20;
    case 7:
      v12 = (*(&ccmodeList[18 * a2 + 5] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v12;
      if (!v12)
        return 4294962991;
      v8 = ccofb_mode;
      goto LABEL_20;
    case 8:
      v13 = (*(&ccmodeList[18 * a2 + 6] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v13;
      if (!v13)
        return 4294962991;
      v8 = ccxts_mode;
      goto LABEL_20;
    case 10:
      v14 = (*(&ccmodeList[18 * a2 + 3] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v14;
      if (!v14)
        return 4294962991;
      v8 = cccfb8_mode;
      goto LABEL_20;
    case 11:
      v15 = (*(&ccmodeList[18 * a2 + 7] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v15;
      if (!v15)
        return 4294962991;
      v8 = ccgcm_mode;
      goto LABEL_20;
    case 12:
      v16 = (*(&ccmodeList[18 * a2 + 8] + 9 * a4))(4294962996);
      *(_QWORD *)(a1 + 8 * a4 + 80) = v16;
      if (!v16)
        return 4294962991;
      v8 = ccccm_mode;
LABEL_20:
      result = 0;
      *(_QWORD *)(a1 + 96) = v8;
      return result;
    default:
      return result;
  }
}

uint64_t ccgcm_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3);
}

uint64_t CCCryptorGCMFinal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!a1)
    return 4294962996;
  result = 4294962996;
  if (a2 && a3)
  {
    if (ccgcm_finalize() == -1)
      return 4294962988;
    else
      return 0;
  }
  return result;
}

uint64_t CCCryptorGCMAddIV(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  if (!a1)
    return 4294962996;
  v3 = 4294962996;
  if (a2 || !a3)
  {
    v4 = ccgcm_set_iv_legacy();
    if (v4 == -7)
      v5 = -4300;
    else
      v5 = -4308;
    if (v4)
      return v5;
    else
      return 0;
  }
  return v3;
}

uint64_t ccecb_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ccecb_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3);
}

unint64_t ccpkcs7_padlen(int a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  unint64_t v5;
  uint64_t (**v8)(uint64_t);
  unint64_t v9;

  v5 = a4;
  if (!a5)
  {
    if (!a1 && a4)
      v5 = (__PAIR128__(v5, v5 % (*(uint64_t (**)(uint64_t))(a2 + 8))(a3)) - 1) >> 64;
    v8 = (uint64_t (**)(uint64_t))(a2 + 8);
    goto LABEL_8;
  }
  if (a1)
  {
    v8 = (uint64_t (**)(uint64_t))(a2 + 8);
    v5 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3) + a4;
LABEL_8:
    v9 = (*v8)(a3);
    return v5 / v9 * v9;
  }
  return v5;
}

unint64_t ccnopad_padlen(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5;

  v5 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return a4 / v5 * v5;
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  size_t v9;
  CCCryptorRef v11;
  uint64_t v12;
  unint64_t v13;
  CCCryptorStatus result;
  void **v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  size_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  size_t v31;
  void *v32;
  void *v33;

  v31 = dataOutAvailable;
  v32 = dataOut;
  if (!cryptorRef)
    return -4300;
  v9 = dataInLength;
  if (*(_QWORD *)cryptorRef)
    v11 = *(CCCryptorRef *)cryptorRef;
  else
    v11 = cryptorRef;
  if (dataOutMoved)
    *dataOutMoved = 0;
  if (!dataInLength)
    return 0;
  v12 = (*(uint64_t (**)(_QWORD))(*((_QWORD *)v11 + 12) + 8))(*((_QWORD *)v11
                                                                          + *((unsigned int *)v11 + 18)
                                                                          + 10));
  v13 = v9;
  if (v12 != 1)
    v13 = (*(uint64_t (**)(BOOL, _QWORD, _QWORD, size_t, _QWORD))(*((_QWORD *)v11 + 15) + 16))(*((_DWORD *)v11 + 18) == 0, *((_QWORD *)v11 + 12), *((_QWORD *)v11 + *((unsigned int *)v11 + 18) + 10), *((_QWORD *)v11 + 5) + v9, 0);
  if (v13 <= dataOutAvailable)
  {
    if ((*(uint64_t (**)(_QWORD))(*((_QWORD *)v11 + 12) + 8))(*((_QWORD *)v11
                                                                           + *((unsigned int *)v11 + 18)
                                                                           + 10)) == 1)
    {
      v15 = &v32;
      return ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v9, (uint64_t *)v15, &v31, dataOutMoved);
    }
    v33 = dataOut;
    v16 = *((_QWORD *)v11 + 5);
    v17 = (*(uint64_t (**)(BOOL, _QWORD, _QWORD))(*((_QWORD *)v11 + 15) + 24))(*((_DWORD *)v11 + 18) == 0, *((_QWORD *)v11 + 12), *((_QWORD *)v11 + *((unsigned int *)v11 + 18) + 10));
    v18 = v17;
    v19 = *((_DWORD *)v11 + 16) - 1;
    if (v19 > 5)
    {
      v20 = 16;
      if (!v17)
      {
LABEL_22:
        if (!*((_QWORD *)v11 + 5) && ((v20 - 1) & v9) == 0)
        {
          v15 = &v33;
          return ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v9, (uint64_t *)v15, &v31, dataOutMoved);
        }
      }
    }
    else
    {
      v20 = qword_1DED4CB20[v19];
      if (!v17)
        goto LABEL_22;
    }
    v21 = v16 + v9;
    v22 = v16 + v9;
    if (v16 + v9 > v17)
    {
      v23 = v17 - v20;
      if (!v17)
        v23 = 0;
      if (((v20 - 1) & v21) != 0)
        v22 = v23 + ((v20 - 1) & v21);
      else
        v22 = v17;
    }
    v24 = v21 - v22;
    if (v21 != v22)
    {
      v25 = *((_QWORD *)v11 + 5);
      if (!v25)
        goto LABEL_38;
      if (v25 >= v24)
      {
        if (v25 != v24)
        {
          if (v22)
            return -4304;
          result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v24, (uint64_t *)&v33, &v31, dataOutMoved);
          if (result)
            return result;
          v30 = (v18 - v24);
          *((_QWORD *)v11 + 5) = v30;
          memmove((char *)v11 + 8, (char *)v11 + v24 + 8, v30);
          return 0;
        }
        result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v24, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result)
          return result;
      }
      else
      {
        v26 = v20 - (v25 & (v20 - 1));
        memcpy((char *)v11 + v25 + 8, dataIn, v26);
        v27 = *((_QWORD *)v11 + 5) + v26;
        *((_QWORD *)v11 + 5) = v27;
        result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v27, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result)
          return result;
        v9 -= v26;
        dataIn = (char *)dataIn + v26;
      }
      v28 = *((_QWORD *)v11 + 5);
      *((_QWORD *)v11 + 5) = 0;
      v24 -= v28;
      if (v24)
      {
LABEL_38:
        if ((v24 & (v20 - 1)) != 0)
          return -4304;
        result = ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v24, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result)
          return result;
        dataIn = (char *)dataIn + v24;
        v9 -= v24;
      }
    }
    if (!v22 || (v29 = *((_QWORD *)v11 + 5), v22 == v29))
    {
      if (!v9)
        return 0;
      return -4304;
    }
    if (v22 - v29 != v9)
      return -4304;
    memcpy((char *)v11 + v29 + 8, dataIn, v9);
    *((_QWORD *)v11 + 5) += v9;
    return 0;
  }
  if (dataOutMoved)
    *dataOutMoved = v13;
  return -4301;
}

uint64_t ccecb_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t ccSimpleUpdate(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t result;

  v11 = *(_QWORD *)(a1 + 96);
  if (*(_DWORD *)(a1 + 72))
  {
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v11 + 32);
    if (!v12)
      return 4294962996;
    v13 = *a4;
    v14 = *(_QWORD *)(a1 + 88);
    v15 = *(_QWORD *)(a1 + 112);
  }
  else
  {
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v11 + 24);
    if (!v12)
      return 4294962996;
    v13 = *a4;
    v14 = *(_QWORD *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 104);
  }
  v16 = v12(v14, a2, v13, a3, v15);
  if (v16 == -68)
    return 4294962987;
  if (v16)
    return 4294962996;
  if (a6)
    *a6 += a3;
  if (*a5 < a3)
    return 4294962995;
  result = 0;
  *(_QWORD *)(a1 + 48) += a3;
  *a4 += a3;
  *a5 -= a3;
  return result;
}

uint64_t ccecb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))(a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t ccnopad_reserve()
{
  return 0;
}

uint64_t cccbc_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t cccbc_mode_get_ctx_size(_QWORD *a1)
{
  return *a1 + 16;
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  _BOOL8 v3;
  CCCryptorRef v5;

  if (!cryptorRef)
    return -4300;
  v3 = final;
  if (*(_QWORD *)cryptorRef)
    v5 = *(CCCryptorRef *)cryptorRef;
  else
    v5 = cryptorRef;
  if ((*(uint64_t (**)(_QWORD))(*((_QWORD *)v5 + 12) + 8))(*((_QWORD *)v5 + *((unsigned int *)v5 + 18) + 10)) != 1)
    return (*(uint64_t (**)(BOOL, _QWORD, _QWORD, size_t, _BOOL8))(*((_QWORD *)v5 + 15) + 16))(*((_DWORD *)v5 + 18) == 0, *((_QWORD *)v5 + 12), *((_QWORD *)v5 + *((unsigned int *)v5 + 18) + 10), *((_QWORD *)v5 + 5) + inputLength, v3);
  return inputLength;
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  CCCryptorRef v7;
  uint64_t v8;
  void (*v9)(_QWORD, _QWORD);
  char *v10;
  unsigned int (**v11)(_QWORD, _QWORD, _QWORD, char *, _QWORD, _BYTE *, size_t *);
  char *v12;
  size_t v13;
  char *v14;
  size_t v15;
  size_t __n;
  _BYTE __src[32];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  if (!cryptorRef)
    return (int)cryptorRef;
  if (*(_QWORD *)cryptorRef)
    v7 = *(CCCryptorRef *)cryptorRef;
  else
    v7 = cryptorRef;
  v8 = *((unsigned int *)v7 + 18);
  __n = 0;
  if (dataOutMoved)
    *dataOutMoved = 0;
  if ((*(uint64_t (**)(_QWORD))(*((_QWORD *)v7 + 12) + 8))(*((_QWORD *)v7 + v8 + 10)) != 1)
  {
    v11 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, char *, _QWORD, _BYTE *, size_t *))*((_QWORD *)v7 + 15);
    if ((_DWORD)v8)
    {
      v12 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
      if (!v11[1](*((_QWORD *)v12 + 13), *((_QWORD *)v7 + 12), *((_QWORD *)v12 + 10), (char *)v7 + 8, *((_QWORD *)v7 + 5), __src, &__n))
      {
        v13 = __n;
        if (__n <= dataOutAvailable)
        {
          if (dataOut)
          {
            memcpy(dataOut, __src, __n);
            if (dataOutMoved)
              *dataOutMoved = v13;
          }
          *((_QWORD *)v7 + 6) += v13;
LABEL_18:
          LODWORD(cryptorRef) = 0;
          *((_QWORD *)v7 + 5) = 0;
          return (int)cryptorRef;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v14 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
      if (!(*v11)(*((_QWORD *)v14 + 13), *((_QWORD *)v7 + 12), *((_QWORD *)v14 + 10), (char *)v7 + 8, *((_QWORD *)v7 + 5), __src, &__n))
      {
        v15 = __n;
        if (__n <= dataOutAvailable)
        {
          if (dataOut)
          {
            memcpy(dataOut, __src, __n);
            if (dataOutMoved)
              *dataOutMoved = v15;
          }
          goto LABEL_18;
        }
LABEL_22:
        LODWORD(cryptorRef) = -4301;
        return (int)cryptorRef;
      }
    }
    LODWORD(cryptorRef) = -4303;
    return (int)cryptorRef;
  }
  v9 = *(void (**)(_QWORD, _QWORD))(*((_QWORD *)v7 + 12) + 56);
  if (v9)
  {
    v10 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
    v9(*((_QWORD *)v10 + 10), *((_QWORD *)v10 + 13));
  }
  LODWORD(cryptorRef) = 0;
  return (int)cryptorRef;
}

uint64_t ccpkcs7_reserve(int a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
}

uint64_t ccpkcs7_encrypt_ecb_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  ccpad_pkcs7_ecb_encrypt();
  *a7 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return 0;
}

uint64_t cccbc_mode_setup(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, char *__dst)
{
  memcpy(__dst, a2, *(_QWORD *)(a1 + 8));
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 16))(a1, __dst + 16, a4, a3);
}

uint64_t cccbc_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))(a5 + 16, a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t ccnopad_encrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  *a7 = 0;
  if (a5)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(3u);
  MEMORY[0x1E0C86820]();
  v4 = (_QWORD *)((char *)v6 - v3);
  ccdigest_init();
  memcpy(c, v4 + 1, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, (char *)v4 + *(_QWORD *)(DigestInfo + 8) + 8, *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v4;
  c->num = *(_DWORD *)((char *)v4 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(3u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820]();
  v8 = (_QWORD *)((char *)v12 - v7);
  v9 = (char *)&v12[1] - v7;
  memcpy(v9, c, v5);
  v10 = &v9[v5];
  memcpy(v10, c->data, v6);
  *v8 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v10[v6] = c->num;
  (*(void (**)(uint64_t, _QWORD *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v8, md);
  memcpy(c, v9, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v9[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v8;
  c->num = *(_DWORD *)((char *)v8 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(3u, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  uint64_t DigestInfo;
  _QWORD *v5;
  unint64_t v6;
  unsigned __int8 *v7;

  DigestInfo = CCDigestGetDigestInfo(0xCu);
  if (md)
  {
    v5 = (_QWORD *)DigestInfo;
    ccdigest_finalize(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, c->count[0] % *(_QWORD *)(DigestInfo + 16), c->count[0]);
    if (*v5 >= 8uLL)
    {
      v6 = 0;
      v7 = md + 3;
      do
      {
        *(_QWORD *)(v7 - 3) = bswap64(c->hash[v6++]);
        v7 += 8;
      }
      while (v6 < *v5 >> 3);
    }
  }
  return 1;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t i;

  DigestInfo = CCDigestGetDigestInfo(0xAu);
  if (md)
  {
    ccdigest_finalize(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, *(_QWORD *)c->count % *(_QWORD *)(DigestInfo + 16), *(_QWORD *)c->count);
    for (i = 0; i != 8; ++i)
      *(_DWORD *)&md[i * 4] = bswap32(c->hash[i]);
  }
  return 1;
}

uint64_t ccdigest_finalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t i;

  v9 = a4 + 1;
  *(_BYTE *)(a2 + a4) = 0x80;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = -8;
  if (v10 == 128)
    v11 = -16;
  if (v9 > v11 + v10)
  {
    if (v9 < v10)
    {
      do
        *(_BYTE *)(a2 + v9++) = 0;
      while (v9 < *(_QWORD *)(a1 + 16));
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 48))(a3, 1, a2);
    v9 = 0;
    v10 = *(_QWORD *)(a1 + 16);
  }
  for (i = v10 - 8; v9 < i; ++v9)
  {
    *(_BYTE *)(a2 + v9) = 0;
    i = *(_QWORD *)(a1 + 16) - 8;
  }
  *(_QWORD *)(a2 + i) = bswap64(8 * a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 48))(a3, 1, a2);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(0xAu);
  cc_clear();
  cc_clear();
  *(_QWORD *)c->count = 0;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(_QWORD *)(DigestInfo + 8));
  return 1;
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(3u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820]();
  v8 = (_QWORD *)((char *)v12 - v7);
  v9 = (char *)&v12[1] - v7;
  memcpy(v9, c, v5);
  v10 = &v9[v5];
  memcpy(v10, c->data, v6);
  *v8 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v10[v6] = c->num;
  ccdigest_update();
  memcpy(c, v9, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v9[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v8;
  c->num = *(_DWORD *)((char *)v8 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  _QWORD *DigestInfo;
  CC_LONG64 v7;

  DigestInfo = (_QWORD *)CCDigestGetDigestInfo(0xCu);
  if (data && len)
  {
    v7 = c->count[0] % DigestInfo[2];
    c->count[0] += len;
    ccdigest_process(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, v7, len, (char *)data);
  }
  return 1;
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  _QWORD *DigestInfo;
  uint64_t v7;

  DigestInfo = (_QWORD *)CCDigestGetDigestInfo(0xAu);
  if (data && len)
  {
    v7 = *(_QWORD *)c->count % DigestInfo[2];
    *(_QWORD *)c->count += len;
    ccdigest_process(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, v7, len, (char *)data);
  }
  return 1;
}

void *ccdigest_process(void *result, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, char *__src)
{
  size_t v7;
  uint64_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;

  if (a5)
  {
    v7 = a5;
    v11 = (uint64_t)result;
    do
    {
      v12 = *(_QWORD *)(v11 + 16);
      if (a4 || v7 < v12)
      {
        v15 = v12 - a4;
        if (v7 >= v15)
          v14 = v15;
        else
          v14 = v7;
        result = memcpy((void *)(a2 + a4), __src, v14);
        a4 += v14;
        if (a4 == *(_QWORD *)(v11 + 16))
        {
          result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a3, 1, a2);
          a4 = 0;
        }
      }
      else
      {
        v13 = v7 / v12;
        result = (void *)(*(uint64_t (**)(uint64_t, size_t, char *))(v11 + 48))(a3, v7 / v12, __src);
        a4 = 0;
        v14 = *(_QWORD *)(v11 + 16) * v13;
      }
      __src += v14;
      v7 -= v14;
    }
    while (v7);
  }
  return result;
}

uint64_t CNEncode(unsigned int a1, int a2, char *a3, size_t a4, uint64_t a5, unint64_t *a6)
{
  uint64_t result;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;

  result = 4294962996;
  if (a3)
  {
    if (a5)
    {
      if (a6)
      {
        v15 = 0;
        result = CNEncoderCreate(a1, a2, &v15);
        if (!(_DWORD)result)
        {
          v12 = *a6;
          v16 = *a6;
          *a6 = 0;
          result = CNEncoderUpdate((uint64_t)v15, a3, a4, a5, &v16);
          if (!(_DWORD)result)
          {
            v13 = v15;
            v14 = v16;
            *a6 = v16;
            v16 = v12 - v14;
            result = CNEncoderFinal((uint64_t)v13, a5 + v14, &v16);
            if (!(_DWORD)result)
            {
              *a6 += v16;
              CNEncoderRelease(&v15);
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CNEncoderCreate(unsigned int a1, int a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v8;
  char *v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  _QWORD *v21;

  if ((a2 - 3) < 0xFFFFFFFE || a3 == 0)
    return 4294962996;
  *a3 = 0;
  if (a1 > 5)
    return 4294962996;
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 96) != -1)
  {
    v8 = _os_alloc_once();
    if (v8)
      goto LABEL_9;
LABEL_30:
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
      CCDigestGetDigestInfo_cold_3();
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
      CCDigestGetDigestInfo_cold_2();
    if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
      CCDigestGetDigestInfo_cold_1();
    result = _os_crash();
    __break(1u);
    return result;
  }
  v8 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 104);
  if (!v8)
    goto LABEL_30;
LABEL_9:
  v9 = (char *)malloc_type_malloc(0x20uLL, 0x10200405028CB4AuLL);
  if (v9)
  {
    v10 = v9;
    v11 = malloc_type_malloc(0x108uLL, 0x1060040B02D0E39uLL);
    if (v11)
    {
      v12 = v11;
      memcpy(v11, (const void *)(v8 + 264 * a1 + 1952), 0x108uLL);
      *((_DWORD *)v10 + 2) = a2;
      *(_QWORD *)v10 = v12;
      *((_QWORD *)v10 + 2) = 0;
      v13 = v10 + 16;
      *((_QWORD *)v10 + 3) = 0;
      v14 = v10 + 24;
      v15 = v12[32];
      if (v15 && (v16 = *(_QWORD *)(v15 + 24)) != 0)
        v17 = *(unsigned int *)(v16 + 8);
      else
        v17 = 0;
      *((_QWORD *)v10 + 2) = CNBufferCreate(v17);
      if (*(_QWORD *)v10 && (v18 = *(_QWORD *)(*(_QWORD *)v10 + 256)) != 0 && (v19 = *(_QWORD *)(v18 + 24)) != 0)
        v20 = *(unsigned int *)(v19 + 12);
      else
        v20 = 0;
      v21 = CNBufferCreate(v20);
      *v14 = v21;
      if (*v13 && v21)
      {
        result = 0;
        *a3 = v10;
        return result;
      }
      if (*v13)
      {
        CNBufferRelease((uint64_t)(v10 + 16));
        v21 = (_QWORD *)*v14;
      }
      if (v21)
        CNBufferRelease((uint64_t)(v10 + 24));
    }
    free(v10);
  }
  return 4294962994;
}

_QWORD *CNBufferCreate(size_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = malloc_type_malloc(0x18uLL, 0x1010040A79CA2DEuLL);
  v3 = v2;
  if (v2)
  {
    *v2 = a1;
    v2[1] = 0;
    v4 = malloc_type_malloc(a1, 0x5950E311uLL);
    v3[2] = v4;
    if (!v4)
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t CNEncoderFinal(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  result = 4294962996;
  if (a1 && a2 && a3)
  {
    v7 = *(_DWORD *)(a1 + 8);
    if (v7 == 2)
    {
      return CNBufferFlushData(*(unint64_t **)(a1 + 24), a1, a2, a3, (void (*)(uint64_t, unint64_t, unint64_t, uint64_t, _QWORD *))deCode, (uint64_t (*)(uint64_t))decodeLen);
    }
    else if (v7 == 1)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8);
      if (v8
        && *(_QWORD *)a1
        && (v9 = *(_QWORD *)(*(_QWORD *)a1 + 256)) != 0
        && (v10 = *(_QWORD *)(v9 + 24)) != 0
        && (v11 = *(unsigned int *)(v10 + 8), (_DWORD)v11)
        && (v12 = *(unsigned int *)(v10 + 12), (_DWORD)v12))
      {
        v13 = (v8 + v11 - 1) / v11 * v12 + 1;
      }
      else
      {
        v13 = 1;
      }
      if (v13 <= *a3)
      {
        result = CNBufferFlushData(*(unint64_t **)(a1 + 16), a1, a2, a3, (void (*)(uint64_t, unint64_t, unint64_t, uint64_t, _QWORD *))enCode, (uint64_t (*)(uint64_t))encodeLen);
        if (!(_DWORD)result)
          *(_BYTE *)(a2 + *a3) = 0;
      }
      else
      {
        return 4294962995;
      }
    }
  }
  return result;
}

uint64_t CNBufferFlushData(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t, unint64_t, unint64_t, uint64_t, _QWORD *), uint64_t (*a6)(uint64_t))
{
  unint64_t v8;
  uint64_t result;

  v8 = a1[1];
  if (v8)
  {
    if (v8 <= *a1)
    {
      if ((unint64_t)a6(a2) <= *a4)
      {
        a5(a2, a1[2], a1[1], a3, a4);
        return 0;
      }
      else
      {
        return 4294962995;
      }
    }
    else
    {
      return 4294962993;
    }
  }
  else
  {
    result = 0;
    *a4 = 0;
  }
  return result;
}

uint64_t CNBufferProcessData(uint64_t a1, uint64_t a2, char *a3, size_t a4, uint64_t a5, unint64_t *a6, void (*a7)(uint64_t, char *, size_t, uint64_t, unint64_t *), uint64_t (*a8)(uint64_t, size_t))
{
  size_t v11;
  unint64_t v15;
  size_t v16;
  uint64_t result;
  uint64_t v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  void (*v22)(uint64_t, char *, size_t, uint64_t, unint64_t *);
  unint64_t v23;

  v11 = a4;
  v23 = *a6;
  v15 = v23;
  v16 = *(_QWORD *)a1;
  if (a8(a2, *(_QWORD *)(a1 + 8) + a4) > v23)
    return 4294962995;
  *a6 = 0;
  v18 = *(_QWORD *)(a1 + 8);
  if (v18)
  {
    if (v16 - v18 >= v11)
      v19 = v11;
    else
      v19 = v16 - v18;
    memcpy((void *)(*(_QWORD *)(a1 + 16) + v18), a3, v19);
    v20 = *(_QWORD *)(a1 + 8) + v19;
    *(_QWORD *)(a1 + 8) = v20;
    if (v20 < v16)
      return 0;
    v22 = a7;
    a7(a2, *(char **)(a1 + 16), v16, a5, &v23);
    v11 -= v19;
    v21 = v23;
    a3 += v19;
    a5 += v23;
    *a6 = v23;
    v15 -= v21;
    *(_QWORD *)(a1 + 8) = 0;
  }
  else
  {
    v22 = a7;
  }
  if (v11 == v11 % v16)
  {
    if (v11 > v16)
      return 4294962993;
  }
  else
  {
    v23 = v15;
    v22(a2, a3, v11 - v11 % v16, a5, &v23);
    a3 += v11 - v11 % v16;
    *a6 += v23;
    v11 %= v16;
  }
  if (v11)
  {
    memcpy(*(void **)(a1 + 16), a3, v11);
    result = 0;
    *(_QWORD *)(a1 + 8) = v11;
    return result;
  }
  return 0;
}

uint64_t enCode(uint64_t *a1, char *a2, uint64_t a3, char *a4, unint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;
  unint64_t v20;
  unint64_t v21;
  int v22;
  char v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char *v31;

  if (!a1)
    goto LABEL_15;
  v7 = *a1;
  if (!*a1)
    goto LABEL_15;
  v8 = a3;
  v10 = *(_QWORD *)(v7 + 256);
  if (v10 && (v11 = *(_QWORD *)(v10 + 24)) != 0)
  {
    v12 = *(_DWORD *)(v11 + 4);
    if (!a3)
      goto LABEL_15;
  }
  else
  {
    v12 = 0;
    if (!a3)
    {
LABEL_15:
      *a5 = 0;
      goto LABEL_16;
    }
  }
  v13 = *(_QWORD *)(v7 + 256);
  if (!v13)
    goto LABEL_15;
  v14 = *(_QWORD *)(v13 + 24);
  if (!v14)
    goto LABEL_15;
  v15 = *(unsigned int *)(v14 + 8);
  if (!(_DWORD)v15)
    goto LABEL_15;
  v16 = *(unsigned int *)(v14 + 12);
  if (!(_DWORD)v16)
    goto LABEL_15;
  v17 = (a3 + v15 - 1) / v15 * v16;
  if (!v17)
    goto LABEL_15;
  v18 = *a5;
  *a5 = v17;
  if (v18 < v17)
    return 0xFFFFFFFFLL;
  cc_clear();
  v20 = 0;
  do
  {
    v21 = v20 / v12;
    v22 = v20 % v12 - v12 + 8;
    a4[v21] |= *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*a1 + 256) + 24) + 16) & (*a2 >> (v20 % v12 - v12 + 8));
    if (v22 > v12)
    {
      a4[++v21] |= *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*a1 + 256) + 24) + 16) & (*a2 >> (v22 - v12));
      LOBYTE(v22) = v22 - v12;
    }
    v23 = *a2++;
    a4[v21 + 1] |= *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*a1 + 256) + 24) + 16) & (v23 << (v12 - v22));
    v20 += 8;
    --v8;
  }
  while (v8);
  v24 = v21 + 2;
  v25 = a4;
  v26 = v21 + 2;
  do
  {
    v27 = *v25;
    v28 = *(_QWORD *)(*a1 + 256);
    if (*(unsigned __int8 *)(v28 + 32) <= v27)
      v29 = 0x80;
    else
      v29 = *(_BYTE *)(*(_QWORD *)(v28 + 16) + v27);
    *v25++ = v29;
    --v26;
  }
  while (v26);
  if (v24 < v17)
  {
    v30 = v17 - v21 - 2;
    v31 = &a4[v21 + 2];
    do
    {
      *v31++ = *(_BYTE *)(*(_QWORD *)(*a1 + 256) + 33);
      --v30;
    }
    while (v30);
    v24 = v17;
  }
  a4 += v24;
LABEL_16:
  result = 0;
  *a4 = 0;
  return result;
}

unint64_t encodeLen(uint64_t *a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 0;
  if (a1 && a2)
  {
    v4 = *a1;
    if (v4
      && (v5 = *(_QWORD *)(v4 + 256)) != 0
      && (v6 = *(_QWORD *)(v5 + 24)) != 0
      && (v7 = *(unsigned int *)(v6 + 8), (_DWORD)v7)
      && (v8 = *(unsigned int *)(v6 + 12), (_DWORD)v8))
    {
      return (a2 + v7 - 1) / v7 * v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CNEncoderRelease(_QWORD **a1)
{
  _QWORD *v1;
  void *v2;
  _DWORD *v3;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    v2 = (void *)*v1;
    v3 = *(_DWORD **)(*v1 + 256);
    if (v3 && v3[2] == 51966)
      free(v3);
    if (v1[2])
      CNBufferRelease((uint64_t)(v1 + 2));
    if (v1[3])
      CNBufferRelease((uint64_t)(v1 + 3));
    free(v2);
    free(v1);
  }
  return 0;
}

uint64_t CNBufferRelease(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = *(void **)a1;
    v2 = *(void **)(*(_QWORD *)a1 + 16);
    if (v2)
      free(v2);
    free(v1);
  }
  return 0;
}

uint64_t CNEncoderUpdate(uint64_t a1, char *a2, size_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t result;
  int v11;
  uint64_t v12;
  void (*v13)(uint64_t, char *, size_t, uint64_t, unint64_t *);
  uint64_t (*v14)(uint64_t, size_t);

  result = 4294962996;
  if (a1 && a4 && a5)
  {
    if (a2)
    {
      v11 = *(_DWORD *)(a1 + 8);
      if (v11 == 2)
      {
        v12 = *(_QWORD *)(a1 + 24);
        v13 = (void (*)(uint64_t, char *, size_t, uint64_t, unint64_t *))deCode;
        v14 = (uint64_t (*)(uint64_t, size_t))decodeLen;
        return CNBufferProcessData(v12, a1, a2, a3, a4, a5, v13, v14);
      }
      if (v11 == 1)
      {
        v12 = *(_QWORD *)(a1 + 16);
        v13 = (void (*)(uint64_t, char *, size_t, uint64_t, unint64_t *))enCode;
        v14 = (uint64_t (*)(uint64_t, size_t))encodeLen;
        return CNBufferProcessData(v12, a1, a2, a3, a4, a5, v13, v14);
      }
    }
    else if (!a3)
    {
      result = 0;
      *a5 = 0;
    }
  }
  return result;
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(8u);
  MEMORY[0x1E0C86820]();
  v4 = (_QWORD *)((char *)v6 - v3);
  ccdigest_init();
  memcpy(c, v4 + 1, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, (char *)v4 + *(_QWORD *)(DigestInfo + 8) + 8, *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v4;
  c->num = *(_DWORD *)((char *)v4 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(8u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820]();
  v8 = (_QWORD *)((char *)v12 - v7);
  v9 = (char *)&v12[1] - v7;
  memcpy(v9, c, v5);
  v10 = &v9[v5];
  memcpy(v10, c->data, v6);
  *v8 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v10[v6] = c->num;
  (*(void (**)(uint64_t, _QWORD *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v8, md);
  memcpy(c, v9, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v9[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v8;
  c->num = *(_DWORD *)((char *)v8 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(8u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820]();
  v8 = (_QWORD *)((char *)v12 - v7);
  v9 = (char *)&v12[1] - v7;
  memcpy(v9, c, v5);
  v10 = &v9[v5];
  memcpy(v10, c->data, v6);
  *v8 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v10[v6] = c->num;
  ccdigest_update();
  memcpy(c, v9, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v9[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v8;
  c->num = *(_DWORD *)((char *)v8 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(8u, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

uint64_t CCDigest(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!CCDigestGetDigestInfo(a1))
    return 4294962991;
  if (!a4 || !a2 && a3)
    return 4294962996;
  ccdigest();
  return 0;
}

uint64_t CCDigestGetDigestInfo(unsigned int a1)
{
  uint64_t v2;
  uint64_t result;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 96) == -1)
  {
    v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 104);
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = _os_alloc_once();
    if (v2)
    {
LABEL_3:
      if (a1 <= 0x10)
        return *(_QWORD *)(v2 + 8 * a1 + 3536);
      else
        return 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_3();
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_2();
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_1();
  result = _os_crash();
  __break(1u);
  return result;
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  cchmac_update();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  cchmac_final();
}

void *cc_alloc(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x54FFDFD8uLL);
}

uint64_t CCDigestOutputSize(uint64_t a1)
{
  if (*(_QWORD *)a1)
    return **(_QWORD **)a1;
  else
    return -4305;
}

uint64_t CCDigestFinal(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2)
  {
    if (*a1)
    {
      (*(void (**)(_QWORD, _QWORD *, uint64_t))(*a1 + 56))(*a1, a1 + 1, a2);
      return 0;
    }
    else
    {
      return 4294962991;
    }
  }
  return result;
}

uint64_t CCRandomCopyBytes(int a1, void *bytes, size_t count)
{
  return CCRandomGenerateBytes(bytes, count);
}

uint64_t CNCRC(unsigned int a1, _BYTE *a2, uint64_t a3, uint64_t *a4)
{
  dispatch_once_t *Desc;
  dispatch_once_t v8;
  uint64_t v9;
  uint64_t v10;

  Desc = (dispatch_once_t *)getDesc(a1);
  v8 = Desc[1];
  if (!v8)
    return 4294962991;
  if (*(_DWORD *)(v8 + 8))
  {
    v9 = (*(uint64_t (**)(uint64_t, _BYTE *))(v8 + 40))(a3, a2);
  }
  else if (*(_DWORD *)(v8 + 20))
  {
    v9 = crc_reverse_oneshot(Desc, a2, a3);
  }
  else
  {
    v9 = crc_normal_oneshot(Desc, a2, a3);
  }
  v10 = 0;
  *a4 = v9;
  return v10;
}

uint64_t getDesc(unsigned int a1)
{
  uint64_t v2;
  uint64_t result;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 96) == -1)
  {
    v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 104);
    if (v2)
      return v2 + 32 * a1;
  }
  else
  {
    v2 = _os_alloc_once();
    if (v2)
      return v2 + 32 * a1;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_3();
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_2();
  if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_FAULT))
    CCDigestGetDigestInfo_cold_1();
  result = _os_crash();
  __break(1u);
  return result;
}

unint64_t crc_reverse_oneshot(dispatch_once_t *predicate, _BYTE *a2, uint64_t a3)
{
  dispatch_once_t v6;

  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  v6 = predicate[1];
  return *(_QWORD *)(v6 + 48) ^ crc_reverse_update((uint64_t)predicate, a2, a3, *(_QWORD *)(v6 + 40));
}

unint64_t crc_reverse_update(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    switch(*(_DWORD *)(*(_QWORD *)(a1 + 8) + 16))
    {
      case 1:
        a4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + (*a2 ^ a4));
        break;
      case 2:
        a4 = (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a1 + 24) + 2 * (*a2 ^ a4)) ^ ((unsigned __int16)(a4 & 0xFF00) >> 8));
        break;
      case 4:
        a4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (*a2 ^ a4)) ^ (a4 >> 8);
        break;
      case 8:
        a4 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * (*a2 ^ a4)) ^ (a4 >> 8);
        break;
      default:
        break;
    }
    ++a2;
  }
  return a4;
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(0xCu, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

uint64_t adler32_implementation(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;

  if (!a1)
    return 1;
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = *a2++;
    v3 = (v3 + v4) % 0xFFF1;
    v2 = (v3 + v2) % 0xFFF1;
    --a1;
  }
  while (a1);
  return v3 | (v2 << 16);
}

uint64_t adler32_final(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t adler32_oneshot(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;

  if (!a1)
    return 1;
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = *a2++;
    v3 = (v3 + v4) % 0xFFF1;
    v2 = (v3 + v2) % 0xFFF1;
    --a1;
  }
  while (a1);
  return v3 | (v2 << 16);
}

uint64_t adler32_setup()
{
  return 0;
}

uint64_t CCCryptorChaCha20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;

  if (a4 == 12)
    LODWORD(v4) = 0;
  else
    LODWORD(v4) = -4300;
  if (a2 == 32)
    v4 = v4;
  else
    v4 = 4294962986;
  if (a2 == 32 && a4 == 12)
  {
    v5 = ccchacha20();
    if (v5 == -7)
      LODWORD(v4) = -4300;
    else
      LODWORD(v4) = -4308;
    if (v5)
      return v4;
    else
      return 0;
  }
  return v4;
}

uint64_t CCCryptorChaCha20Poly1305OneshotEncrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  BOOL v12;
  int v14;
  unsigned int v15;

  if (a2 != 32)
    return 4294962986;
  v11 = 4294962996;
  if (a10)
    v12 = a4 == 12;
  else
    v12 = 0;
  if (v12 && a11 == 16)
  {
    ccchacha20poly1305_info();
    v14 = ccchacha20poly1305_encrypt_oneshot();
    if (v14 == -7)
      v15 = -4300;
    else
      v15 = -4308;
    if (v14)
      return v15;
    else
      return 0;
  }
  return v11;
}

uint64_t CCCryptorChaCha20Poly1305OneshotDecrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;
  int v12;
  unsigned int v13;

  if (a2 != 32)
    return 4294962986;
  result = 4294962996;
  if (a4 == 12 && a11 == 16)
  {
    ccchacha20poly1305_info();
    v12 = ccchacha20poly1305_decrypt_oneshot();
    if (v12 == -7)
      v13 = -4300;
    else
      v13 = -4308;
    if (v12)
      return v13;
    else
      return 0;
  }
  return result;
}

uint64_t CCKDFParametersCreatePbkdf2(_QWORD *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _DWORD *v9;
  _DWORD *v10;

  if (!a2)
    return 4294962996;
  if (!a3 && a4)
    return 4294962996;
  v9 = malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
  if (!v9)
    return 4294962994;
  v10 = v9;
  result = 0;
  *v10 = 0;
  v10[2] = a2;
  *((_QWORD *)v10 + 2) = a3;
  *((_QWORD *)v10 + 3) = a4;
  *a1 = v10;
  return result;
}

uint64_t CCKDFParametersCreateCtrHmac(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v11;
  _QWORD *v12;

  if (!a2 && a3 || !a4 && a5)
    return 4294962996;
  v11 = malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
  if (!v11)
    return 4294962994;
  v12 = v11;
  result = 0;
  *(_DWORD *)v12 = 1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  *a1 = v12;
  return result;
}

uint64_t CCKDFParametersCreateCtrHmacFixed(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v7;
  _QWORD *v8;

  if (!a2 && a3)
    return 4294962996;
  v7 = malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
  if (!v7)
    return 4294962994;
  v8 = v7;
  result = 0;
  *(_DWORD *)v8 = 2;
  v8[1] = a2;
  v8[2] = a3;
  *a1 = v8;
  return result;
}

uint64_t CCKDFParametersCreateAnsiX963(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v7;
  _QWORD *v8;

  if (!a2 && a3)
    return 4294962996;
  v7 = malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
  if (!v7)
    return 4294962994;
  v8 = v7;
  result = 0;
  *(_DWORD *)v8 = 7;
  v8[1] = a2;
  v8[2] = a3;
  *a1 = v8;
  return result;
}

uint64_t CCKeyDerivationHMac(int a1, unsigned int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t result;
  int *v21;
  int *v22;
  uint64_t v23;
  int *v24;

  v24 = 0;
  result = 4294962991;
  switch(a1)
  {
    case 0:
      result = CCKDFParametersCreatePbkdf2(&v24, a3, a12, a13);
      if (!(_DWORD)result)
        goto LABEL_10;
      break;
    case 1:
      result = CCKDFParametersCreateCtrHmac(&v24, a6, a7, a8, a9);
      if (!(_DWORD)result)
        goto LABEL_10;
      break;
    case 2:
      if (a8 || !a9)
      {
        v22 = (int *)malloc_type_malloc(0x28uLL, 0x10C2040F56B5A66uLL);
        if (v22)
        {
          v21 = v22;
          *v22 = 2;
          *((_QWORD *)v22 + 1) = a8;
          *((_QWORD *)v22 + 2) = a9;
          goto LABEL_13;
        }
        result = 4294962994;
      }
      else
      {
        result = 4294962996;
      }
      break;
    case 6:
      result = CCKDFParametersCreateHkdf(&v24, a12, a13, a8, a9);
      if (!(_DWORD)result)
      {
LABEL_10:
        v21 = v24;
LABEL_13:
        v23 = CCDeriveKey(v21, a2, a4, a5, a14, a15);
        cc_clear();
        free(v21);
        result = v23;
      }
      break;
    default:
      return result;
  }
  return result;
}

unint64_t gen_std_crc_table(uint64_t a1)
{
  uint64_t v2;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  int v19;
  char v20;
  int v21;
  char v22;
  int v23;
  char v24;
  int v25;
  int v26;
  BOOL v27;
  int v28;
  int v29;
  int v30;

  v2 = *(int *)(*(_QWORD *)(a1 + 8) + 16);
  result = (unint64_t)malloc_type_malloc(v2 << 8, 0x160AF042uLL);
  *(_QWORD *)(a1 + 24) = result;
  if (result)
  {
    v4 = 0;
    v5 = v2 - 1;
    do
    {
      result = v4;
      switch(v5)
      {
        case 0:
          v6 = *(_QWORD *)(a1 + 8);
          v7 = *(_DWORD *)(v6 + 16);
          if ((v7 - 1) > 7)
            LOBYTE(v8) = 0;
          else
            v8 = qword_1DED4C928[v7 - 1];
          v18 = 8 * v7;
          if (*(_DWORD *)(v6 + 20))
          {
            result = reflect_byte(v4);
            v19 = 8 * *(_DWORD *)(v6 + 16);
          }
          else
          {
            v19 = 8 * v7;
          }
          result <<= v19 - 8;
          v26 = 8;
          do
          {
            v27 = (result & (1 << (v18 - 1))) == 0;
            result *= 2;
            if (!v27)
              result ^= *(_QWORD *)(v6 + 32);
            --v26;
          }
          while (v26);
          if (*(_DWORD *)(v6 + 20))
            result = reflect(result, v19);
          *(_BYTE *)(*(_QWORD *)(a1 + 24) + v4) = result & v8;
          break;
        case 1:
          v9 = *(_QWORD *)(a1 + 8);
          v10 = *(_DWORD *)(v9 + 16);
          if ((v10 - 1) > 7)
            LOWORD(v11) = 0;
          else
            v11 = qword_1DED4C928[v10 - 1];
          v20 = 8 * v10;
          if (*(_DWORD *)(v9 + 20))
          {
            result = reflect_byte(v4);
            v21 = 8 * *(_DWORD *)(v9 + 16);
          }
          else
          {
            v21 = 8 * v10;
          }
          result <<= v21 - 8;
          v28 = 8;
          do
          {
            v27 = (result & (1 << (v20 - 1))) == 0;
            result *= 2;
            if (!v27)
              result ^= *(_QWORD *)(v9 + 32);
            --v28;
          }
          while (v28);
          if (*(_DWORD *)(v9 + 20))
            result = reflect(result, v21);
          *(_WORD *)(*(_QWORD *)(a1 + 24) + 2 * v4) = result & v11;
          break;
        case 3:
          v12 = *(_QWORD *)(a1 + 8);
          v13 = *(_DWORD *)(v12 + 16);
          if ((v13 - 1) > 7)
            LODWORD(v14) = 0;
          else
            v14 = qword_1DED4C928[v13 - 1];
          v22 = 8 * v13;
          if (*(_DWORD *)(v12 + 20))
          {
            result = reflect_byte(v4);
            v23 = 8 * *(_DWORD *)(v12 + 16);
          }
          else
          {
            v23 = 8 * v13;
          }
          result <<= v23 - 8;
          v29 = 8;
          do
          {
            v27 = (result & (1 << (v22 - 1))) == 0;
            result *= 2;
            if (!v27)
              result ^= *(_QWORD *)(v12 + 32);
            --v29;
          }
          while (v29);
          if (*(_DWORD *)(v12 + 20))
            result = reflect(result, v23);
          *(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * v4) = result & v14;
          break;
        case 7:
          v15 = *(_QWORD *)(a1 + 8);
          v16 = *(_DWORD *)(v15 + 16);
          if ((v16 - 1) > 7)
            v17 = 0;
          else
            v17 = qword_1DED4C928[v16 - 1];
          v24 = 8 * v16;
          if (*(_DWORD *)(v15 + 20))
          {
            result = reflect_byte(v4);
            v25 = 8 * *(_DWORD *)(v15 + 16);
          }
          else
          {
            v25 = 8 * v16;
          }
          result <<= v25 - 8;
          v30 = 8;
          do
          {
            v27 = (result & (1 << (v24 - 1))) == 0;
            result *= 2;
            if (!v27)
              result ^= *(_QWORD *)(v15 + 32);
            --v30;
          }
          while (v30);
          if (*(_DWORD *)(v15 + 20))
            result = reflect(result, v25);
          *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * v4) = result & v17;
          break;
        default:
          break;
      }
      ++v4;
    }
    while (v4 != 256);
  }
  return result;
}

void dump_crc_table(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  size_t v4;
  _BYTE *v5;
  size_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(int *)(v1 + 16);
  v3 = *(const char **)v1;
  v4 = strnlen(*(const char **)v1, 0x40uLL);
  v5 = malloc_type_malloc(v4 + 1, 0x957A0BC5uLL);
  memcpy(v5, v3, v4);
  v5[v4] = 0;
  if (*v5)
  {
    v6 = 0;
    do
    {
      if (v5[v6] == 45)
        v5[v6] = 95;
      ++v6;
    }
    while (v6 < strlen(v5));
  }
  v7 = v2 - 1;
  if ((unint64_t)(v2 - 1) < 8 && ((0x8Bu >> v7) & 1) != 0)
  {
    v8 = dword_1DED4C968[v7];
    printf(off_1EA94E7D0[v7], v5);
  }
  else
  {
    v8 = 7;
  }
  v9 = 0;
  do
  {
    switch(v2)
    {
      case 1:
        printf(" 0x%02x,");
        break;
      case 2:
        printf(" 0x%04x,");
        break;
      case 4:
        printf(" 0x%08x,");
        break;
      case 8:
        printf(" 0x%016llx,");
        break;
      default:
        break;
    }
    if ((v8 & ++v9) == 0)
      putchar(10);
  }
  while (v9 != 256);
  puts("};\n");
  free(v5);
}

uint64_t crc_normal_init(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  return *(_QWORD *)(predicate[1] + 40);
}

uint64_t crc_normal_update(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4)
{
  int i;
  unsigned int v5;
  uint64_t v6;

  for (i = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 16); a3; --a3)
  {
    switch(i)
    {
      case 1:
        a4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 24) + (*a2 ^ a4));
        break;
      case 2:
        a4 = (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a1 + 24) + 2 * (*a2 ^ BYTE1(a4))) ^ ((_WORD)a4 << 8));
        break;
      case 4:
        a4 = (*(_DWORD *)(*(_QWORD *)(a1 + 24) + 4 * (*a2 ^ BYTE3(a4))) ^ ((_DWORD)a4 << 8));
        break;
      case 8:
        a4 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * (*a2 ^ HIBYTE(a4))) ^ (a4 << 8);
        break;
      default:
        break;
    }
    ++a2;
  }
  v5 = i - 1;
  if (v5 > 7)
    v6 = 0;
  else
    v6 = qword_1DED4C990[v5];
  return v6 & a4;
}

uint64_t crc_normal_final(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(v2 + 48);
  v4 = *(_DWORD *)(v2 + 16) - 1;
  if (v4 > 7)
    v5 = 0;
  else
    v5 = qword_1DED4C990[v4];
  return v5 & (v3 ^ a2);
}

uint64_t crc_normal_oneshot(dispatch_once_t *predicate, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;

  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  v6 = crc_normal_update((uint64_t)predicate, a2, a3, *(_QWORD *)(predicate[1] + 40));
  return crc_normal_final((uint64_t)predicate, v6);
}

uint64_t reflect_byte(int a1)
{
  return reflector[a1];
}

uint64_t reflect(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2 >> 3 >= 8)
    v2 = 8;
  else
    v2 = a2 >> 3;
  if (!v2)
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 8 * v2 - 8;
  do
  {
    v4 |= (unint64_t)reflector[(a1 >> v3)] << v5;
    v5 -= 8;
    v3 += 8;
  }
  while (v5 != -8);
  return v4;
}

uint64_t crc_reverse_final(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) ^ a2;
}

uint64_t reverse_poly(unint64_t a1, unint64_t a2)
{
  return (2 * reflect(a1, a2)) | 1;
}

uint64_t CCBigNumClear()
{
  ccz_zero();
  return 0;
}

void *CCBigNumCopy(int *a1)
{
  void *v1;

  v1 = CCCreateBigNum(a1);
  if (v1)
    ccz_set();
  return v1;
}

uint64_t CCBigNumBitCount()
{
  return ccz_bitlen();
}

uint64_t CCBigNumZeroLSBCount()
{
  return ccz_trailing_zeros();
}

uint64_t CCBigNumByteCount()
{
  return ccz_write_uint_size();
}

uint64_t CCBigNumToData()
{
  uint64_t v0;

  v0 = ccz_write_uint_size();
  ccz_write_uint();
  return v0;
}

void *CCBigNumToHexString(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;

  v2 = ccz_write_radix_size();
  if (!v2)
  {
    v4 = 0;
    v5 = -4300;
LABEL_7:
    *a1 = v5;
    return v4;
  }
  v3 = v2;
  v4 = malloc_type_malloc(v2 + 1, 0x4BB9F740uLL);
  if (!v4)
  {
    v5 = -4302;
    goto LABEL_7;
  }
  if (ccz_write_radix())
  {
    *a1 = -4300;
    free(v4);
    return 0;
  }
  else
  {
    *((_BYTE *)v4 + v3) = 0;
  }
  return v4;
}

void *CCBigNumToDecimalString(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;

  v2 = ccz_write_radix_size();
  if (!v2)
  {
    v4 = 0;
    v5 = -4300;
LABEL_7:
    *a1 = v5;
    return v4;
  }
  v3 = v2;
  v4 = malloc_type_malloc(v2 + 1, 0x27D3A497uLL);
  if (!v4)
  {
    v5 = -4302;
    goto LABEL_7;
  }
  if (ccz_write_radix())
  {
    *a1 = -4300;
    free(v4);
    return 0;
  }
  else
  {
    *((_BYTE *)v4 + v3) = 0;
  }
  return v4;
}

uint64_t CCBigNumSetNegative()
{
  ccz_neg();
  return 0;
}

uint64_t CCBigNumSetI()
{
  ccz_seti();
  return 0;
}

uint64_t CCBigNumGetI(_DWORD *a1)
{
  uint64_t result;
  unsigned int v3;

  if ((unint64_t)ccz_write_int_size() < 5)
  {
    ccz_write_uint();
    result = bswap32(v3);
    if (a1)
      *a1 = 0;
  }
  else
  {
    result = 0;
    *a1 = -4306;
  }
  return result;
}

void *CCBigNumCreateRandom(int *a1, uint64_t a2, int a3, int a4)
{
  void *v7;
  void *v8;
  uint64_t v9;

  ccDRBGGetRngState();
  v7 = CCCreateBigNum(a1);
  v8 = v7;
  if (a3 >= 1 && v7)
  {
    do
    {
      ccz_random_bits();
      v9 = ccz_bitlen();
    }
    while (v9 - ccz_trailing_zeros() < (unint64_t)a4);
  }
  return v8;
}

uint64_t CCBigNumAdd()
{
  ccz_add();
  return 0;
}

uint64_t CCBigNumAddI()
{
  ccz_addi();
  return 0;
}

uint64_t CCBigNumSub()
{
  ccz_sub();
  return 0;
}

uint64_t CCBigNumSubI()
{
  ccz_subi();
  return 0;
}

uint64_t CCBigNumMul()
{
  ccz_mul();
  return 0;
}

uint64_t CCBigNumMod()
{
  ccz_mod();
  return 0;
}

uint64_t CCBigNumModI(_DWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v7;

  v7 = 0;
  v2 = CCCreateBigNum((int *)&v7);
  if (v2)
  {
    v3 = v2;
    v4 = CCCreateBigNum((int *)&v7);
    if (v4)
    {
      v5 = v4;
      ccz_seti();
      v7 = 0;
      ccz_mod();
      *a1 = CCBigNumGetI(&v7);
      ccz_free();
      free(v3);
      v3 = v5;
    }
    ccz_free();
    free(v3);
  }
  return v7;
}

uint64_t CCBigNumMulMod()
{
  ccz_mulmod();
  return 0;
}

uint64_t CCBigNumModExp()
{
  if (ccz_expmod())
    return 4294962996;
  else
    return 0;
}

uint64_t CCBigNumLeftShift()
{
  ccz_lsl();
  return 0;
}

uint64_t CCBigNumRightShift()
{
  ccz_lsr();
  return 0;
}

uint64_t CCBigNumIsPrime(_DWORD *a1)
{
  if (a1)
    *a1 = 0;
  return ccz_is_prime();
}

uint64_t CCBigNumIsZero(_DWORD *a1)
{
  if (a1)
    *a1 = 0;
  return ccz_is_zero();
}

uint64_t CCBigNumIsNegative(_DWORD *a1)
{
  if (a1)
    *a1 = 0;
  return ccz_is_negative();
}

void *cc_realloc(int a1, size_t a2, void *a3, size_t size)
{
  void *v6;

  v6 = malloc_type_malloc(size, 0x3AF38706uLL);
  memcpy(v6, a3, a2);
  cc_clear();
  free(a3);
  return v6;
}

uint64_t CCAESCmac()
{
  ccaes_cbc_encrypt_mode();
  return cccmac_one_shot_generate();
}

void **CCAESCmacCreate(uint64_t a1)
{
  void **v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  v2 = (void **)malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (v2)
  {
    v3 = (_QWORD *)ccaes_cbc_encrypt_mode();
    v4 = malloc_type_malloc(v3[1] + *v3 + 80, 0x5723D140uLL);
    *v2 = v4;
    if (!v4)
    {
LABEL_7:
      free(v2);
      return 0;
    }
    v5 = v4;
    if (!a1)
    {
LABEL_6:
      free(v5);
      goto LABEL_7;
    }
    if (cccmac_init())
    {
      v5 = *v2;
      goto LABEL_6;
    }
  }
  return v2;
}

uint64_t CCAESCmacUpdate()
{
  return cccmac_update();
}

uint64_t CCAESCmacFinal()
{
  return cccmac_final_generate();
}

void CCAESCmacDestroy(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1);
  }
}

uint64_t CCAESCmacOutputSizeFromContext(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 64) + 8);
}

uint64_t CCCKGGetCommitmentSize(uint64_t a1, unsigned int a2)
{
  if (ccec_keysize_is_supported() && ccec_get_cp() && CCDigestGetDigestInfo(a2))
    return ccckg_sizeof_commitment();
  else
    return 4294962996;
}

uint64_t CCCKGGetShareSize(uint64_t a1, unsigned int a2)
{
  if (ccec_keysize_is_supported() && ccec_get_cp() && CCDigestGetDigestInfo(a2))
    return ccckg_sizeof_share();
  else
    return 4294962996;
}

uint64_t CCCKGGetOpeningSize(uint64_t a1, unsigned int a2)
{
  if (ccec_keysize_is_supported() && ccec_get_cp() && CCDigestGetDigestInfo(a2))
    return ccckg_sizeof_opening();
  else
    return 4294962996;
}

uint64_t CCCKGContributorCreate(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  _QWORD *v6;
  void *v7;
  uint64_t v8;

  if (!a3)
    return 4294962996;
  v6 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (!v6)
    return 4294962994;
  v7 = v6;
  v8 = CCCKGContextCreate(a1, a2, v6);
  if ((_DWORD)v8)
    free(v7);
  else
    *a3 = v7;
  return v8;
}

uint64_t CCCKGContextCreate(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  size_t v5;
  void *v6;

  if (!ccec_keysize_is_supported() || !ccec_get_cp() || !CCDigestGetDigestInfo(a2))
    return 4294962996;
  v5 = ccckg_sizeof_ctx();
  v6 = malloc_type_malloc(v5, 0x2774EF0DuLL);
  *a3 = v6;
  if (!v6)
    return 4294962994;
  ccDRBGGetRngState();
  ccckg_init();
  return 0;
}

uint64_t CCCKGOwnerCreate(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  _QWORD *v6;
  void *v7;
  uint64_t v8;

  if (!a3)
    return 4294962996;
  v6 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (!v6)
    return 4294962994;
  v7 = v6;
  v8 = CCCKGContextCreate(a1, a2, v6);
  if ((_DWORD)v8)
    free(v7);
  else
    *a3 = v7;
  return v8;
}

void CCCKGContributorDestroy(void **a1)
{
  free(*a1);
  free(a1);
}

void CCCKGOwnerDestroy(void **a1)
{
  free(*a1);
  free(a1);
}

uint64_t CCCKGContributorCommit(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2)
  {
    result = ccckg_contributor_commit();
    if ((int)result > -3)
    {
      if ((_DWORD)result == -2)
      {
        return 4294962992;
      }
      else if ((_DWORD)result)
      {
        return 4294962988;
      }
    }
    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7)
          return 4294962996;
        return 4294962988;
      }
      return 4294962987;
    }
  }
  return result;
}

uint64_t CCCKGOwnerGenerateShare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2 && a4)
  {
    result = ccckg_owner_generate_share();
    if ((int)result <= -3)
    {
      if ((_DWORD)result == -86)
        return 4294962987;
      if ((_DWORD)result == -7)
        return 4294962996;
      return 4294962988;
    }
    if ((_DWORD)result == -2)
      return 4294962992;
    if ((_DWORD)result)
      return 4294962988;
  }
  return result;
}

uint64_t CCCKGContributorFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C874D8];
  v8 = 4294962996;
  if (a1 && a2 && a4 && a6 && a8)
  {
    v10 = ccckg_ctx_cp();
    v17[0] = v17;
    v12 = MEMORY[0x1E0C86820](v10, v11);
    v14 = (char *)v17 - v13;
    *(_QWORD *)((char *)v17 - v13) = v12;
    v15 = ccckg_contributor_finish();
    if (v15 > -3)
    {
      if (!v15)
      {
        v8 = CCCKGConvertNativeToECCryptor(v10, (uint64_t)v14, 0, a8);
        goto LABEL_17;
      }
      if (v15 == -2)
      {
        v8 = 4294962992;
        goto LABEL_17;
      }
    }
    else
    {
      if (v15 == -86)
      {
        v8 = 4294962987;
        goto LABEL_17;
      }
      if (v15 == -7)
      {
        v8 = 4294962996;
LABEL_17:
        cc_clear();
        return v8;
      }
    }
    v8 = 4294962988;
    goto LABEL_17;
  }
  return v8;
}

uint64_t CCCKGConvertNativeToECCryptor(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = (unint64_t)(cczp_bitlen() + 7) >> 3;
  v7 = 2;
  if (a3 == 1)
    v7 = 3;
  v8 = v6 * v7 + 1;
  v9 = malloc_type_malloc(v8, 0xF15C6C28uLL);
  if (!v9)
    return 4294962994;
  v10 = v9;
  ccec_x963_export();
  v11 = CCECCryptorImportKey(0, (uint64_t)v10, v8, a3, a4);
  cc_clear();
  free(v10);
  return v11;
}

uint64_t CCCKGOwnerFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C874D8];
  v6 = 4294962996;
  if (a1 && a2 && a4 && a6)
  {
    v8 = ccckg_ctx_cp();
    v10 = MEMORY[0x1E0C86820](v8, v9);
    v12 = (char *)v15 - v11;
    *(_QWORD *)((char *)v15 - v11) = v10;
    v13 = ccckg_owner_finish();
    if (v13 > -3)
    {
      if (v13)
      {
        if (v13 != -2)
        {
LABEL_14:
          v6 = 4294962988;
          goto LABEL_15;
        }
        v6 = 4294962992;
      }
      else
      {
        v6 = CCCKGConvertNativeToECCryptor(v8, (uint64_t)v12, 1, a6);
      }
    }
    else if (v13 == -86)
    {
      v6 = 4294962987;
    }
    else if (v13 != -7)
    {
      goto LABEL_14;
    }
LABEL_15:
    cc_clear();
  }
  return v6;
}

uint64_t CCCKG2GetCommitmentSize()
{
  return ccckg2_sizeof_commitment();
}

uint64_t CCCKG2GetShareSize()
{
  return ccckg2_sizeof_share();
}

uint64_t CCCKG2GetOpeningSize()
{
  return ccckg2_sizeof_opening();
}

uint64_t CCCKG2ContributorCreate(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  if (!a2)
    return 4294962996;
  v4 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (!v4)
    return 4294962994;
  v5 = v4;
  v6 = CCCKG2ContextCreate(a1, v4);
  if ((_DWORD)v6)
    free(v5);
  else
    *a2 = v5;
  return v6;
}

uint64_t CCCKG2ContextCreate(uint64_t a1, _QWORD *a2)
{
  size_t v3;
  void *v4;
  uint64_t result;

  v3 = ccckg2_sizeof_ctx();
  v4 = malloc_type_malloc(v3, 0xA15EFA35uLL);
  *a2 = v4;
  if (!v4)
    return 4294962994;
  result = ccckg2_init();
  if ((int)result > -3)
  {
    if ((_DWORD)result != -2)
    {
      if (!(_DWORD)result)
        return result;
      return 4294962988;
    }
    return 4294962992;
  }
  else
  {
    if ((_DWORD)result != -86)
    {
      if ((_DWORD)result == -7)
        return 4294962996;
      return 4294962988;
    }
    return 4294962987;
  }
}

uint64_t CCCKG2OwnerCreate(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  if (!a2)
    return 4294962996;
  v4 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  if (!v4)
    return 4294962994;
  v5 = v4;
  v6 = CCCKG2ContextCreate(a1, v4);
  if ((_DWORD)v6)
    free(v5);
  else
    *a2 = v5;
  return v6;
}

void CCCKG2ContributorDestroy(void **a1)
{
  free(*a1);
  free(a1);
}

void CCCKG2OwnerDestroy(void **a1)
{
  free(*a1);
  free(a1);
}

uint64_t CCCKG2ContributorCommit(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2)
  {
    ccDRBGGetRngState();
    result = ccckg2_contributor_commit();
    if ((int)result > -3)
    {
      if ((_DWORD)result != -2)
      {
        if (!(_DWORD)result)
          return result;
        return 4294962988;
      }
      return 4294962992;
    }
    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7)
          return 4294962996;
        return 4294962988;
      }
      return 4294962987;
    }
  }
  return result;
}

uint64_t CCCKG2OwnerGenerateShare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2 && a4)
  {
    ccDRBGGetRngState();
    result = ccckg2_owner_generate_share();
    if ((int)result > -3)
    {
      if ((_DWORD)result != -2)
      {
        if (!(_DWORD)result)
          return result;
        return 4294962988;
      }
      return 4294962992;
    }
    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7)
          return 4294962996;
        return 4294962988;
      }
      return 4294962987;
    }
  }
  return result;
}

uint64_t CCCKG2ContributorFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C874D8];
  v8 = 4294962996;
  if (a1 && a2 && a4 && a6 && a8)
  {
    v10 = ccckg2_ctx_cp();
    v17[0] = v17;
    v12 = MEMORY[0x1E0C86820](v10, v11);
    v14 = (char *)v17 - v13;
    *(_QWORD *)((char *)v17 - v13) = v12;
    ccDRBGGetRngState();
    v15 = ccckg2_contributor_finish();
    if (v15 > -3)
    {
      if (!v15)
      {
        v8 = CCCKGConvertNativeToECCryptor(v10, (uint64_t)v14, 0, a8);
        goto LABEL_17;
      }
      if (v15 == -2)
      {
        v8 = 4294962992;
        goto LABEL_17;
      }
    }
    else
    {
      if (v15 == -86)
      {
        v8 = 4294962987;
        goto LABEL_17;
      }
      if (v15 == -7)
      {
        v8 = 4294962996;
LABEL_17:
        cc_clear();
        return v8;
      }
    }
    v8 = 4294962988;
    goto LABEL_17;
  }
  return v8;
}

uint64_t CCCKG2OwnerFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C874D8];
  v6 = 4294962996;
  if (a1 && a2 && a4 && a6)
  {
    v8 = ccckg2_ctx_cp();
    v10 = MEMORY[0x1E0C86820](v8, v9);
    v12 = (char *)v15 - v11;
    *(_QWORD *)((char *)v15 - v11) = v10;
    ccDRBGGetRngState();
    v13 = ccckg2_owner_finish();
    if (v13 > -3)
    {
      if (v13)
      {
        if (v13 != -2)
        {
LABEL_14:
          v6 = 4294962988;
          goto LABEL_15;
        }
        v6 = 4294962992;
      }
      else
      {
        v6 = CCCKGConvertNativeToECCryptor(v8, (uint64_t)v12, 1, a6);
      }
    }
    else if (v13 == -86)
    {
      v6 = 4294962987;
    }
    else if (v13 != -7)
    {
      goto LABEL_14;
    }
LABEL_15:
    cc_clear();
  }
  return v6;
}

uint64_t getCipherMode(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t (**v4)(uint64_t);

  v3 = 0;
  switch((int)a2)
  {
    case 1:
      v4 = &ccmodeList[18 * a1] + 9 * a3;
      goto LABEL_11;
    case 2:
      v4 = &ccmodeList[18 * a1 + 1] + 9 * a3;
      goto LABEL_11;
    case 3:
      v4 = &ccmodeList[18 * a1 + 2] + 9 * a3;
      goto LABEL_11;
    case 4:
      v4 = &ccmodeList[18 * a1 + 4] + 9 * a3;
      goto LABEL_11;
    case 7:
      v4 = &ccmodeList[18 * a1 + 5] + 9 * a3;
      goto LABEL_11;
    case 8:
      v4 = &ccmodeList[18 * a1 + 6] + 9 * a3;
      goto LABEL_11;
    case 10:
      v4 = &ccmodeList[18 * a1 + 3] + 9 * a3;
      goto LABEL_11;
    case 11:
      v4 = &ccmodeList[18 * a1 + 7] + 9 * a3;
      goto LABEL_11;
    case 12:
      v4 = &ccmodeList[18 * a1 + 8] + 9 * a3;
LABEL_11:
      v3 = ((uint64_t (*)(uint64_t, uint64_t))*v4)(a1, a2);
      break;
    default:
      return v3;
  }
  return v3;
}

CCCryptorStatus CCCryptorCreateFromData(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *data, size_t dataLength, CCCryptorRef *cryptorRef, size_t *dataUsed)
{
  _CCCryptor *v11;
  unint64_t v12;
  CCCryptorStatus v13;
  int v14;
  CCMode v15;
  size_t v17;
  uint64_t v18;

  v11 = (_CCCryptor *)(((unint64_t)data + 7) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11 - (_CCCryptor *)data + 16;
  if (dataUsed)
    *dataUsed = v12;
  v13 = -4301;
  if (v11 && v12 <= dataLength)
  {
    if ((options & 2) != 0)
      v14 = 1;
    else
      v14 = 2;
    if (alg == 4)
      v15 = 9;
    else
      v15 = v14;
    v13 = CCCryptorCreateWithMode(op, v15, alg, options & 1, iv, key, keyLength, 0, v17, v18, HIDWORD(v18), (CCCryptorRef *)(((unint64_t)data + 7) & 0xFFFFFFFFFFFFFFF8));
    if (!v13)
      *cryptorRef = v11;
  }
  return v13;
}

uint64_t CCCryptorCreateFromDataWithMode(CCOperation a1, CCMode a2, CCAlgorithm a3, CCPadding a4, const void *a5, const void *a6, size_t a7, const void *a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, CCCryptorRef **a13, unint64_t *a14)
{
  CCCryptorRef *cryptorRef;
  unint64_t v15;
  BOOL v16;
  uint64_t result;
  size_t v18;
  uint64_t v19;

  cryptorRef = (CCCryptorRef *)((a11 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = (unint64_t)cryptorRef - a11 + 16;
  if (a14)
    *a14 = v15;
  if (cryptorRef)
    v16 = v15 > a12;
  else
    v16 = 1;
  if (v16)
    return 4294962995;
  result = CCCryptorCreateWithMode(a1, a2, a3, a4, a5, a6, a7, a8, v18, v19, HIDWORD(v19), cryptorRef);
  if (!(_DWORD)result)
    *a13 = cryptorRef;
  return result;
}

uint64_t CCCryptorReset_binary_compatibility(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  int v3;
  uint64_t v4;
  int v6;
  unsigned int (*v7)(uint64_t, _QWORD *, uint64_t, uint64_t);
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C874D8];
  if (!a1)
    return 4294962996;
  v2 = (_QWORD *)*a1;
  if (!*a1)
    v2 = a1;
  v2[5] = 0;
  v2[6] = 0;
  if (!a2)
  {
    v14[0] = 0;
    v14[1] = 0;
    v6 = *((_DWORD *)v2 + 16) - 1;
    if (v6 > 5)
      v4 = 16;
    else
      v4 = dword_1DED4CB50[v6];
    v7 = *(unsigned int (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v2[12] + 64);
    if (v7)
    {
      v12 = *((_DWORD *)v2 + 18);
      if (v12 == 3)
        v12 = 0;
      v13 = &v2[v12];
      v10 = v13[10];
      v11 = v13[13];
      a2 = v14;
      goto LABEL_20;
    }
    return 0;
  }
  v3 = *((_DWORD *)v2 + 16) - 1;
  if (v3 > 5)
    v4 = 16;
  else
    v4 = dword_1DED4CB50[v3];
  v7 = *(unsigned int (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v2[12] + 64);
  if (!v7)
    return 0;
  v8 = *((_DWORD *)v2 + 18);
  if (v8 == 3)
    v8 = 0;
  v9 = &v2[v8];
  v10 = v9[10];
  v11 = v9[13];
LABEL_20:
  if (v7(v10, a2, v4, v11))
    return 4294962994;
  else
    return 0;
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  CCCryptorRef v4;
  int v5;
  unsigned int v7;
  uint64_t v8;
  unsigned int v10;
  unsigned int (*v11)(uint64_t, _QWORD *, uint64_t, uint64_t);
  unsigned int v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned int v17;
  char *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C874D8];
  if ((dyld_program_sdk_at_least() & 1) == 0)
    return CCCryptorReset_binary_compatibility(cryptorRef, iv);
  if (!cryptorRef)
    return -4300;
  v4 = *(CCCryptorRef *)cryptorRef;
  if (!*(_QWORD *)cryptorRef)
    v4 = cryptorRef;
  v5 = *((_DWORD *)v4 + 17);
  if (v5 != 4 && v5 != 2)
    return -4305;
  *((_QWORD *)v4 + 5) = 0;
  *((_QWORD *)v4 + 6) = 0;
  if (!iv)
  {
    v19[0] = 0;
    v19[1] = 0;
    v10 = *((_DWORD *)v4 + 16) - 1;
    if (v10 > 5)
      v8 = 16;
    else
      v8 = dword_1DED4CB50[v10];
    v11 = *(unsigned int (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(*((_QWORD *)v4 + 12) + 64);
    if (v11)
    {
      v17 = *((_DWORD *)v4 + 18);
      if (v17 == 3)
        v17 = 0;
      v18 = (char *)v4 + 8 * v17;
      v14 = *((_QWORD *)v18 + 10);
      v15 = *((_QWORD *)v18 + 13);
      v16 = v19;
      goto LABEL_26;
    }
    return -4300;
  }
  v7 = *((_DWORD *)v4 + 16) - 1;
  if (v7 > 5)
    v8 = 16;
  else
    v8 = dword_1DED4CB50[v7];
  v11 = *(unsigned int (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(*((_QWORD *)v4 + 12) + 64);
  if (!v11)
    return -4300;
  v12 = *((_DWORD *)v4 + 18);
  if (v12 == 3)
    v12 = 0;
  v13 = (char *)v4 + 8 * v12;
  v14 = *((_QWORD *)v13 + 10);
  v15 = *((_QWORD *)v13 + 13);
  v16 = iv;
LABEL_26:
  if (v11(v14, v16, v8, v15))
    return -4302;
  else
    return 0;
}

uint64_t CCCryptorGetIV(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int (*v7)(_QWORD, uint64_t, unsigned int *, _QWORD);
  unsigned int v8;
  unsigned int v9;

  if (!a1)
    return 4294962996;
  if (*a1)
    v3 = (_QWORD *)*a1;
  else
    v3 = a1;
  if ((*(uint64_t (**)(_QWORD))(v3[12] + 8))(v3[*((unsigned int *)v3 + 18) + 10]) == 1)
    return 4294962996;
  v4 = *((_DWORD *)v3 + 16) - 1;
  v5 = v4 > 5 ? 16 : dword_1DED4CB50[v4];
  v7 = *(unsigned int (**)(_QWORD, uint64_t, unsigned int *, _QWORD))(v3[12] + 72);
  if (!v7)
    return 4294962996;
  v9 = v5;
  v8 = *((_DWORD *)v3 + 18);
  if (v8 == 3)
    v8 = 0;
  if (v7(v3[v8 + 10], a2, &v9, v3[v8 + 13]))
    return 4294962994;
  else
    return 0;
}

uint64_t CCCryptorEncryptDataBlock(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  unsigned int (*v13)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t (*v14)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD);
  int v15;
  unsigned int v16;

  if (!a1)
    return 4294962996;
  v9 = *a1 ? (_QWORD *)*a1 : a1;
  if ((*(uint64_t (**)(_QWORD))(v9[12] + 8))(v9[*((unsigned int *)v9 + 18) + 10]) == 1)
    return 4294962996;
  v12 = v9[12];
  if (a2)
  {
    v13 = *(unsigned int (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v12 + 40);
    v10 = 4294962996;
    if (v13)
    {
      if (v13(v9[10], a3, a4, a5, a2, v9[13]))
        return 4294962996;
      else
        return 0;
    }
  }
  else
  {
    v14 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(v12 + 24);
    v10 = 4294962996;
    if (v14)
    {
      v15 = v14(v9[10], a3, a5, a4, v9[13]);
      if (v15)
        v16 = -4300;
      else
        v16 = 0;
      if (v15 == -68)
        return 4294962987;
      else
        return v16;
    }
  }
  return v10;
}

uint64_t CCCryptorDecryptDataBlock(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;
  unsigned int (*v13)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t (*v14)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD);
  int v15;
  unsigned int v16;

  if (!a1)
    return 4294962996;
  v9 = *a1 ? (_QWORD *)*a1 : a1;
  if ((*(uint64_t (**)(_QWORD))(v9[12] + 8))(v9[*((unsigned int *)v9 + 18) + 10]) == 1)
    return 4294962996;
  v12 = v9[12];
  if (a2)
  {
    v13 = *(unsigned int (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v12 + 48);
    v10 = 4294962996;
    if (v13)
    {
      if (v13(v9[11], a3, a4, a5, a2, v9[14]))
        return 4294962996;
      else
        return 0;
    }
  }
  else
  {
    v14 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(v12 + 32);
    v10 = 4294962996;
    if (v14)
    {
      v15 = v14(v9[11], a3, a5, a4, v9[14]);
      if (v15)
        v16 = -4300;
      else
        v16 = 0;
      if (v15 == -68)
        return 4294962987;
      else
        return v16;
    }
  }
  return v10;
}

uint64_t CCCryptorAddParameter(_QWORD *a1, int a2, void *__src, size_t __n)
{
  _QWORD *v4;
  int v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  _QWORD *v9;

  if (!a1)
    return 4294962996;
  v4 = (_QWORD *)*a1;
  if (!*a1)
    v4 = a1;
  switch(a2)
  {
    case 0:
      v5 = *((_DWORD *)v4 + 17);
      if (v5 == 12)
      {
        v8 = v4[*((unsigned int *)v4 + 18) + 13];
        *(_QWORD *)(v8 + 16) = __n;
        memcpy((void *)(v8 + 32), __src, __n);
        return 0;
      }
      if (v5 != 11)
        return 4294962991;
      if (ccgcm_set_iv_legacy())
        goto LABEL_25;
      return 0;
    case 1:
      v7 = *((_DWORD *)v4 + 17);
      if (v7 != 12)
      {
        if (v7 != 11)
          return 4294962991;
        if (ccgcm_aad())
          return 4294962987;
        return 0;
      }
      v9 = (_QWORD *)v4[*((unsigned int *)v4 + 18) + 13];
      if (v9[1] != -1 && v9[2] != -1 && *v9 != -1)
      {
        v9[3] = __n;
        if (!ccccm_set_iv())
        {
          if (ccccm_cbcmac())
            return 4294962987;
          return 0;
        }
      }
LABEL_25:
      result = 4294962996;
      break;
    case 2:
      if (*((_DWORD *)v4 + 17) != 12)
        return 4294962991;
      *(_QWORD *)(v4[*((unsigned int *)v4 + 18) + 13] + 8) = __n;
      return 0;
    case 3:
      if (*((_DWORD *)v4 + 17) != 12)
        return 4294962991;
      *(_QWORD *)v4[*((unsigned int *)v4 + 18) + 13] = __n;
      return 0;
    default:
      goto LABEL_25;
  }
  return result;
}

uint64_t CCCryptorGetParameter(_QWORD *a1, int a2, void *__dst, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t result;

  if (!a1)
    return 4294962996;
  v4 = (_QWORD *)*a1;
  if (!*a1)
    v4 = a1;
  if (a2 != 4)
    return 4294962996;
  if (*((_DWORD *)v4 + 17) != 12)
    return 4294962991;
  v6 = v4[*((unsigned int *)v4 + 18) + 13];
  memcpy(__dst, (const void *)(v6 + 48), *(_QWORD *)(v6 + 8));
  result = 0;
  *a4 = *(_QWORD *)(v6 + 8);
  return result;
}

void *CCDHCreate(int a1)
{
  uint64_t v1;
  void *v2;

  if (a1 != 1)
    return 0;
  ccdh_gp_rfc3526group05();
  v1 = ccdh_ccn_size();
  v2 = malloc_type_malloc(2 * v1 + 16, 0x352706D4uLL);
  if (v2)
  {
    ccdh_ctx_public();
    ccdh_ctx_init();
  }
  return v2;
}

uint64_t CCDHGenerateKey(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;

  result = 4294962996;
  if (a1 && a2 && a3)
  {
    ccDRBGGetRngState();
    if (ccdh_generate_key())
      return 0xFFFFFFFFLL;
    ccdh_ctx_public();
    v6 = ccdh_export_pub_size();
    v7 = *a3;
    *a3 = v6;
    if (v6 > v7)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      ccdh_ctx_public();
      ccdh_export_pub();
      return 0;
    }
  }
  return result;
}

uint64_t CCDHComputeKey(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  result = 4294962996;
  if (a1 && a2 && a3 && a5)
  {
    v8 = ccdh_ccn_size();
    MEMORY[0x1E0C86820](v8, v9);
    v10 = (unint64_t)(cczp_bitlen() + 7) >> 3;
    if (v10 <= *a2)
    {
      if (ccdh_import_pub())
      {
        *a2 = v10;
        return 4294967294;
      }
      else
      {
        ccrng();
        if (ccdh_compute_shared_secret())
          return 4294967293;
        else
          return 0;
      }
    }
    else
    {
      *a2 = v10;
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t CCDigestGetBlockSize(unsigned int a1)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(a1);
  if (DigestInfo)
    return *(_QWORD *)(DigestInfo + 16);
  else
    return -4305;
}

uint64_t CCDigestGetOutputSize(unsigned int a1)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(a1);
  if (DigestInfo)
    return *(_QWORD *)DigestInfo;
  else
    return -4305;
}

uint64_t CCDigestGetBlockSizeFromRef(uint64_t a1)
{
  if (*(_QWORD *)a1)
    return *(_QWORD *)(*(_QWORD *)a1 + 16);
  else
    return -4305;
}

uint64_t CCDigestBlockSize(uint64_t a1)
{
  if (*(_QWORD *)a1)
    return *(_QWORD *)(*(_QWORD *)a1 + 16);
  else
    return -4305;
}

uint64_t CCDigestGetOutputSizeFromRef(uint64_t a1)
{
  if (*(_QWORD *)a1)
    return **(_QWORD **)a1;
  else
    return -4305;
}

uint64_t CCDigestOID(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 32);
}

uint64_t CCDigestOIDLen(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 24);
}

void *CCDigestCreateByOID(const void *a1, size_t a2)
{
  unsigned int v4;
  uint64_t DigestInfo;

  v4 = 1;
  while (1)
  {
    DigestInfo = CCDigestGetDigestInfo(v4);
    if (DigestInfo)
    {
      if (*(_QWORD *)(DigestInfo + 24) == a2 && !memcmp(a1, *(const void **)(DigestInfo + 32), a2))
        break;
    }
    if (++v4 == 17)
      return 0;
  }
  return CCDigestCreate(v4);
}

uint64_t CCDigestReset(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result)
    return ccdigest_init();
  return result;
}

unsigned __int8 *__cdecl CC_MD2(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(1u, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(2u);
  MEMORY[0x1E0C86820](DigestInfo, v3);
  v5 = (_QWORD *)((char *)v7 - v4);
  ccdigest_init();
  memcpy(c, v5 + 1, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, (char *)v5 + *(_QWORD *)(DigestInfo + 8) + 8, *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v5;
  c->num = *(_DWORD *)((char *)v5 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(2u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820](DigestInfo, v7);
  v9 = (_QWORD *)((char *)v13 - v8);
  v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  *v9 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  ccdigest_update();
  memcpy(c, v10, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  uint64_t DigestInfo;
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(2u);
  v5 = *(_QWORD *)(DigestInfo + 8);
  v6 = *(_QWORD *)(DigestInfo + 16);
  MEMORY[0x1E0C86820](DigestInfo, v7);
  v9 = (_QWORD *)((char *)v13 - v8);
  v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  *v9 = *(_QWORD *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  (*(void (**)(uint64_t, _QWORD *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v9, md);
  memcpy(c, v10, *(_QWORD *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(_QWORD *)(DigestInfo + 8)], *(_QWORD *)(DigestInfo + 16));
  *(_QWORD *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(_QWORD *)(DigestInfo + 8) + *(_QWORD *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(2u, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(9u, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  if (CCDigest(0xBu, (uint64_t)data, len, (uint64_t)md))
    return 0;
  else
    return md;
}

int CC_MD2_Init(CC_MD2_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(1u);
  MEMORY[0x1E0C86820](DigestInfo, v3);
  v5 = (char *)v7 - v4;
  ccdigest_init();
  *(_OWORD *)c->cksm = *(_OWORD *)(v5 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v5 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v5[*(_QWORD *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v5[*(_QWORD *)(DigestInfo + 8) + 8 + *(_QWORD *)(DigestInfo + 16)];
  return 1;
}

int CC_MD2_Update(CC_MD2_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(1u);
  MEMORY[0x1E0C86820](DigestInfo, v5);
  v7 = (char *)v12 - v6;
  *(_OWORD *)(v7 + 56) = *(_OWORD *)c->cksm;
  *(_OWORD *)(v7 + 8) = *(_OWORD *)c->state;
  v9 = (_OWORD *)((char *)&v12[1] + v8 - v6);
  *v9 = *(_OWORD *)c->data;
  *(_DWORD *)((char *)v9 + v10) = c->num;
  ccdigest_update();
  *(_OWORD *)c->cksm = *(_OWORD *)(v7 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v7 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v7[*(_QWORD *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v7[*(_QWORD *)(DigestInfo + 8) + 8 + *(_QWORD *)(DigestInfo + 16)];
  return 1;
}

int CC_MD2_Final(unsigned __int8 *md, CC_MD2_CTX *c)
{
  uint64_t DigestInfo;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C874D8];
  DigestInfo = CCDigestGetDigestInfo(1u);
  v6 = MEMORY[0x1E0C86820](DigestInfo, v5);
  v8 = (char *)v13 - v7;
  *(_OWORD *)(v8 + 56) = *(_OWORD *)c->cksm;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)c->state;
  v10 = (_OWORD *)((char *)&v13[1] + v9 - v7);
  *v10 = *(_OWORD *)c->data;
  *(_DWORD *)((char *)v10 + v11) = c->num;
  (*(void (**)(uint64_t, char *, unsigned __int8 *))(v6 + 56))(v6, (char *)v13 - v7, md);
  *(_OWORD *)c->cksm = *(_OWORD *)(v8 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v8 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v8[*(_QWORD *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v8[*(_QWORD *)(DigestInfo + 8) + 8 + *(_QWORD *)(DigestInfo + 16)];
  return 1;
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(9u);
  cc_clear();
  cc_clear();
  *(_QWORD *)c->count = 0;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(_QWORD *)(DigestInfo + 8));
  return 1;
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  CC_SHA256_Update(c, data, len);
  return 1;
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  unsigned __int8 mda[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  CC_SHA256_Final(mda, c);
  *(_OWORD *)md = *(_OWORD *)mda;
  *(_OWORD *)(md + 12) = *(_OWORD *)&mda[12];
  return 1;
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  uint64_t DigestInfo;

  DigestInfo = CCDigestGetDigestInfo(0xBu);
  cc_clear();
  cc_clear();
  c->count[0] = 0;
  c->count[1] = 0;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(_QWORD *)(DigestInfo + 8));
  return 1;
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  CC_SHA512_Update(c, data, len);
  return 1;
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  __int128 v3;
  unsigned __int8 mda[16];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  CC_SHA512_Final(mda, c);
  v3 = v6;
  *(_OWORD *)md = *(_OWORD *)mda;
  *((_OWORD *)md + 1) = v3;
  *((_OWORD *)md + 2) = v7;
  return 1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t CCECCryptorGeneratePair(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *PublicKeyFromPrivateKey;
  uint64_t v9;
  uint64_t result;

  ccDRBGGetRngState();
  if (!ccec_keysize_is_supported())
    return 4294962996;
  ccec_get_cp();
  v6 = ccMallocECCryptor(a1, 1);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6[1] = a1;
    if (ccec_generate_key()
      || (*(_DWORD *)(v7 + 16) = 1, (PublicKeyFromPrivateKey = CCECCryptorGetPublicKeyFromPrivateKey(v7)) == 0))
    {
      v9 = v7;
    }
    else
    {
      v9 = (uint64_t)PublicKeyFromPrivateKey;
      if (ccECpairwiseConsistencyCheck())
      {
        result = 0;
        *a2 = v9;
        *a3 = v7;
        return result;
      }
      ccECCryptorFree(v7);
    }
    ccECCryptorFree(v9);
  }
  *a3 = 0;
  *a2 = 0;
  return 4294962992;
}

_QWORD *ccMallocECCryptor(uint64_t a1, int a2)
{
  uint64_t *cp;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  if (!ccec_keysize_is_supported())
    return 0;
  cp = (uint64_t *)ccec_get_cp();
  v5 = *cp;
  v6 = malloc_type_malloc(0x18uLL, 0x10320407B3D6EFEuLL);
  v7 = v6;
  if (v6)
  {
    *v6 = 0;
    v6[1] = a1;
    if (a2 == 1)
    {
      *((_DWORD *)v6 + 4) = 98;
      v8 = 32 * v5;
    }
    else
    {
      if (a2)
      {
LABEL_9:
        free(v7);
        return 0;
      }
      *((_DWORD *)v6 + 4) = 97;
      v8 = 24 * v5;
    }
    v9 = malloc_type_malloc(v8 + 16, 0x329285DCuLL);
    *v7 = v9;
    if (v9)
    {
      *v9 = cp;
      return v7;
    }
    goto LABEL_9;
  }
  return v7;
}

_QWORD *CCECCryptorGetPublicKeyFromPrivateKey(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *cp;

  v2 = ccMallocECCryptor(*(_QWORD *)(a1 + 8), 0);
  if (v2)
  {
    cp = (_QWORD *)ccec_get_cp();
    memcpy((void *)*v2, *(const void **)a1, 24 * *cp + 16);
    v2[1] = *(_QWORD *)(a1 + 8);
    *((_DWORD *)v2 + 4) = 0;
    if (!ccECpairwiseConsistencyCheck())
    {
      ccECCryptorFree((uint64_t)v2);
      return 0;
    }
  }
  return v2;
}

BOOL ccECpairwiseConsistencyCheck()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v4;
  uint64_t v5;
  char v6;
  _BYTE v7[4096];
  _QWORD v8[4];

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v8[3] = *MEMORY[0x1E0C874D8];
  v5 = 4096;
  memset(v8, 10, 20);
  if (CCECCryptorSignHash(v0, (uint64_t)v8, 20, (uint64_t)v7, (uint64_t)&v5))
    return 0;
  v6 = 0;
  if (!v2)
    return 0;
  if (ccec_verify())
    v4 = 1;
  else
    v4 = v6 == 0;
  return !v4;
}

void ccECCryptorFree(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)ccec_get_cp();
  v3 = *(_DWORD *)(a1 + 16);
  if (v3 > 96)
  {
    if (v3 != 97)
    {
      if (v3 != 98)
        goto LABEL_11;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!v3)
  {
LABEL_8:
    if (24 * v2 == -16)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (v3 != 1)
    goto LABEL_11;
LABEL_9:
  if (*(_QWORD *)a1)
  {
    cc_clear();
    free(*(void **)a1);
  }
LABEL_11:
  cc_clear();
  free((void *)a1);
}

uint64_t CCECCryptorGetKeyComponents(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 1)
  {
    if (ccec_get_fullkey_components())
      return 4294962994;
    return 0;
  }
  if (!v1)
  {
    if (ccec_get_pubkey_components())
      return 4294962994;
    return 0;
  }
  return 4294962996;
}

uint64_t CCECCryptorCreateFromData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  *a6 = 0;
  v7 = ccMallocECCryptor(a1, 0);
  if (!v7)
    return 4294962994;
  v8 = (uint64_t)v7;
  result = ccec_make_pub();
  if ((_DWORD)result)
  {
    ccECCryptorFree(v8);
    return 4294962992;
  }
  else
  {
    *(_DWORD *)(v8 + 16) = 0;
    *a6 = v8;
  }
  return result;
}

uint64_t CCECGetKeyType(uint64_t a1)
{
  unsigned int v1;

  if (!a1)
    return 97;
  v1 = *(_DWORD *)(a1 + 16);
  if (v1 <= 1)
    return v1;
  else
    return 99;
}

uint64_t CCECGetKeySize(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 8);
  else
    return 4294962996;
}

uint64_t CCECCryptorImportPublicKey(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return CCECCryptorImportKey(0, a1, a2, 0, a3);
}

uint64_t CCECCryptorImportKey(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *PublicKeyFromPrivateKey;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (!a2)
    return 4294962996;
  if (a1 == 2)
  {
    if (a4)
      return 4294962996;
    v12 = ccec_compact_import_pub_size();
    v13 = ccMallocECCryptor(v12, 0);
    if (!v13)
      return 4294962994;
    v9 = (uint64_t)v13;
    ccec_get_cp();
    result = ccec_compact_import_pub();
    if (!(_DWORD)result)
    {
      *(_QWORD *)(v9 + 8) = v12;
      *(_DWORD *)(v9 + 16) = 0;
LABEL_23:
      *a5 = v9;
      return result;
    }
    goto LABEL_25;
  }
  if (a1 == 1)
  {
    result = 4294962991;
LABEL_16:
    *a5 = 0;
    return result;
  }
  if (a1)
  {
    result = 4294962996;
    goto LABEL_16;
  }
  if (a4)
  {
    if (a4 == 1)
    {
      v7 = ccec_x963_import_priv_size();
      v8 = ccMallocECCryptor(v7, 1);
      if (v8)
      {
        v9 = (uint64_t)v8;
        ccec_get_cp();
        if (!ccec_x963_import_priv())
        {
          PublicKeyFromPrivateKey = CCECCryptorGetPublicKeyFromPrivateKey(v9);
          if (PublicKeyFromPrivateKey)
          {
            ccECCryptorFree((uint64_t)PublicKeyFromPrivateKey);
LABEL_22:
            result = 0;
            *(_QWORD *)(v9 + 8) = v7;
            *(_DWORD *)(v9 + 16) = a4;
            goto LABEL_23;
          }
        }
        goto LABEL_25;
      }
      return 4294962994;
    }
    return 4294962996;
  }
  v7 = ccec_x963_import_pub_size();
  v14 = ccMallocECCryptor(v7, 0);
  if (!v14)
    return 4294962994;
  v9 = (uint64_t)v14;
  ccec_get_cp();
  if (!ccec_x963_import_pub())
    goto LABEL_22;
LABEL_25:
  *a5 = 0;
  ccECCryptorFree(v9);
  return 4294962985;
}

uint64_t CCECCryptorExportPublicKey(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (a1 && a2)
    return CCECCryptorExportKey(0, a2, a3, 0, a1);
  else
    return 4294962996;
}

uint64_t CCECCryptorExportKey(int a1, uint64_t a2, unint64_t *a3, int a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  result = 4294962996;
  if (a2 && a5)
  {
    if (a1 == 2)
    {
      if (a4 != 1)
      {
        v13 = (unint64_t)(cczp_bitlen() + 7) >> 3;
        v14 = *a3;
        *a3 = v13;
        if (v13 <= v14)
        {
          ccec_compact_export_pub();
          return 0;
        }
        return 4294962994;
      }
    }
    else if (a1 != 1)
    {
      if (a1)
        return 4294962996;
      v9 = cczp_bitlen();
      v10 = 2;
      if (a4 == 1)
        v10 = 3;
      v11 = ((unint64_t)(v9 + 7) >> 3) * v10;
      v12 = v11 + 1;
      if (v11 < *a3)
      {
        *a3 = v12;
        ccec_x963_export();
        return 0;
      }
      *a3 = v12;
      return 4294962994;
    }
    return 4294962991;
  }
  return result;
}

uint64_t CCECCryptorSignHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2 && a4 && a5)
  {
    ccDRBGGetRngState();
    if (ccec_sign())
      return 4294962992;
    else
      return 0;
  }
  return result;
}

uint64_t CCECCryptorVerifyHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2 && a4)
  {
    if (ccec_verify())
      result = 4294962946;
    else
      result = 0;
    *a6 = 0;
  }
  return result;
}

uint64_t CCECCryptorWrapKey()
{
  return 4294962991;
}

uint64_t CCECCryptorUnwrapKey()
{
  return 4294962991;
}

uint64_t CCECCryptorComputeSharedSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = 4294962996;
  if (a1 && a2 && a3)
  {
    ccrng();
    if (ccecdh_compute_shared_secret())
      return 4294962992;
    else
      return 0;
  }
  return result;
}

uint64_t CCECCryptorTwinDiversifyEntropySize()
{
  return 2 * ccec_diversify_min_entropy_len();
}

uint64_t CCECCryptorTwinDiversifyKey(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  int v12;

  ccDRBGGetRngState();
  if (a1 > 1)
    return 4294962996;
  v9 = ccMallocECCryptor(*(_QWORD *)(a2 + 8), a1);
  if (!v9)
    return 4294962994;
  v10 = (uint64_t)v9;
  if (a1)
    v11 = ccec_diversify_priv_twin();
  else
    v11 = ccec_diversify_pub_twin();
  v12 = v11;
  if (v11)
  {
    *a5 = 0;
    ccECCryptorFree(v10);
    if (v12 == -7)
      return 4294962996;
    else
      return 4294962985;
  }
  else
  {
    result = 0;
    *(_QWORD *)(v10 + 8) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(v10 + 16) = a1;
    *a5 = v10;
  }
  return result;
}

_QWORD *CCECCryptorH2C(int a1)
{
  uint64_t v1;
  _QWORD *v2;

  if (a1 == 2)
  {
    ccec_cp_521();
  }
  else if (a1 == 1)
  {
    MEMORY[0x1DF0EEAF8]();
  }
  else
  {
    if (a1)
      return 0;
    MEMORY[0x1DF0EEAEC]();
  }
  v1 = cczp_bitlen();
  v2 = ccMallocECCryptor(v1, 0);
  if (v2 && cch2c())
  {
    ccECCryptorFree((uint64_t)v2);
    return 0;
  }
  return v2;
}

_QWORD *CCECCryptorGenerateBlindingKeys(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  if (!ccec_get_cp())
  {
    v3 = 0;
LABEL_8:
    CCECCryptorBlindingKeysRelease(v3);
    return 0;
  }
  v2 = malloc_type_malloc(0x18uLL, 0x102004023CB03E4uLL);
  v3 = v2;
  if (!v2)
    goto LABEL_8;
  v2[1] = 0;
  v2[2] = 0;
  *v2 = a1;
  v4 = ccMallocECCryptor(a1, 1);
  v3[1] = v4;
  if (!v4)
    goto LABEL_8;
  v5 = ccMallocECCryptor(a1, 1);
  v3[2] = v5;
  if (!v5)
    goto LABEL_8;
  ccDRBGGetRngState();
  if (ccec_generate_blinding_keys())
    goto LABEL_8;
  return v3;
}

void CCECCryptorBlindingKeysRelease(_QWORD *a1)
{
  if (a1)
  {
    ccECCryptorFree(a1[1]);
    ccECCryptorFree(a1[2]);
  }
  free(a1);
}

_QWORD *CCECCryptorBlind(uint64_t *a1)
{
  _QWORD *v1;

  v1 = ccMallocECCryptor(*a1, 0);
  if (v1)
  {
    ccDRBGGetRngState();
    if (ccec_blind())
    {
      ccECCryptorFree((uint64_t)v1);
      return 0;
    }
  }
  return v1;
}

_QWORD *CCECCryptorUnblind(uint64_t *a1)
{
  _QWORD *v1;

  v1 = ccMallocECCryptor(*a1, 0);
  if (v1)
  {
    ccDRBGGetRngState();
    if (ccec_unblind())
    {
      ccECCryptorFree((uint64_t)v1);
      return 0;
    }
  }
  return v1;
}

uint64_t CCCryptorGCMOneshotEncrypt(int a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  int v14;
  unsigned int v15;

  if (a1)
    return 4294962996;
  v12 = 4294962986;
  if (a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0)
  {
    v12 = 4294962996;
    if (a5 >= 0xC && (unint64_t)(a12 - 17) >= 0xFFFFFFFFFFFFFFF7 && a2 && a4 && a11 && (!a9 || a10))
    {
      ccaes_gcm_encrypt_mode();
      v14 = ccgcm_one_shot();
      if (v14 == -7)
        v15 = -4300;
      else
        v15 = -4308;
      if (v14)
        return v15;
      else
        return 0;
    }
  }
  return v12;
}

void CCHmacDestroy(void *a1)
{
  cc_clear();
  free(a1);
}

uint64_t CCHmacOutputSizeFromRef(uint64_t a1)
{
  return **(_QWORD **)a1;
}

_QWORD *CCHmacCreate(unsigned int a1)
{
  _QWORD *v2;
  uint64_t DigestInfo;

  v2 = malloc_type_malloc(0x118uLL, 0x1060040072DDC3AuLL);
  if (v2)
  {
    cc_clear();
    DigestInfo = CCDigestGetDigestInfo(a1);
    *v2 = DigestInfo;
    if (DigestInfo)
    {
      cchmac_init();
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

uint64_t CCHmacOneShot(unsigned int a1)
{
  CCDigestGetDigestInfo(a1);
  return cchmac();
}

void *CCHmacClone(const void *a1)
{
  void *v2;
  void *v3;

  v2 = malloc_type_malloc(0x118uLL, 0x1060040072DDC3AuLL);
  v3 = v2;
  if (v2)
    memcpy(v2, a1, 0x118uLL);
  return v3;
}

unsigned int CCCalibratePBKDF(CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  unsigned int v6;
  size_t v8;
  char *v12;
  char *v13;
  size_t v14;
  uint8_t *v15;
  uint8_t *v16;
  uint64_t i;
  uint8_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  mach_timebase_info info;

  v6 = -1;
  if (saltLen > 0x84 || !derivedKeyLen)
    return v6;
  if (passwordLen <= 1)
    v8 = 1;
  else
    v8 = passwordLen;
  if (algorithm != 2)
    return -1;
  v12 = (char *)malloc_type_malloc(v8, 0xB619D5CDuLL);
  v13 = v12;
  if (v12)
  {
    memset(v12, 97, v8);
    if (saltLen <= 1)
      v14 = 1;
    else
      v14 = saltLen;
    v15 = (uint8_t *)malloc_type_malloc(v14, 0x808800B5uLL);
    v16 = v15;
    if (v15)
    {
      for (i = 0; i != v14; ++i)
        v15[i] = i;
      v18 = (uint8_t *)malloc_type_malloc(derivedKeyLen, 0xCF925B44uLL);
      if (v18)
      {
        v19 = 0;
        while (1)
        {
          v20 = mach_absolute_time();
          if (CCKeyDerivationPBKDF(2u, v13, v8, v16, saltLen, prf, 0x186A0u, v18, derivedKeyLen))
            break;
          v21 = mach_absolute_time();
          if (v19 <= 3)
          {
            ++v19;
            if (v21 == v20)
              continue;
          }
          v6 = 10000;
          v22 = v21 - v20;
          if (v21 != v20)
          {
            info = 0;
            mach_timebase_info(&info);
            LODWORD(v24) = info.denom;
            LODWORD(v23) = info.numer;
            if ((int)(100000 * msec / (unint64_t)((double)v22 * (double)v23 / (double)v24 / 1000000.0)) <= 10000)
              v6 = 10000;
            else
              v6 = 100000 * msec / (unint64_t)((double)v22 * (double)v23 / (double)v24 / 1000000.0);
          }
          goto LABEL_27;
        }
      }
      goto LABEL_26;
    }
  }
  else
  {
    v16 = 0;
  }
  v18 = 0;
LABEL_26:
  v6 = -1;
LABEL_27:
  free(v13);
  free(v16);
  free(v18);
  return v6;
}

uint64_t ccDevRandomGetRngState()
{
  return ccrng();
}

uint64_t CCRandomUniform()
{
  ccrng();
  if (ccrng_uniform())
    return 4294962989;
  else
    return 0;
}

uint64_t CCRSACryptorGeneratePair(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  size_t v7;
  void *v8;
  _QWORD *v9;
  _DWORD *PublicKeyFromPrivateKey;
  uint64_t v11;

  *a4 = 0;
  *a3 = 0;
  v7 = ccn_write_int_size();
  v8 = malloc_type_malloc(v7, 0x1673213DuLL);
  if (!v8)
  {
    v9 = 0;
LABEL_10:
    v11 = 4294962994;
    goto LABEL_8;
  }
  ccn_write_int();
  if (a1 > 0x1000)
  {
    v9 = 0;
    v11 = 4294962996;
    goto LABEL_8;
  }
  if (!ccDRBGGetRngState())
  {
    v9 = 0;
    v11 = 4294962989;
    goto LABEL_8;
  }
  v9 = ccMallocRSACryptor(a1);
  if (!v9)
    goto LABEL_10;
  if (ccrsa_generate_fips186_key())
  {
    v11 = 4294962992;
    goto LABEL_8;
  }
  *((_DWORD *)v9 + 2) = 1;
  PublicKeyFromPrivateKey = CCRSACryptorCreatePublicKeyFromPrivateKey(v9);
  if (!PublicKeyFromPrivateKey)
    goto LABEL_10;
  v11 = 0;
  *a3 = PublicKeyFromPrivateKey;
  *a4 = v9;
  v9 = 0;
LABEL_8:
  free(v8);
  ccRSACryptorClear(v9);
  ccRSACryptorClear(0);
  return v11;
}

_QWORD *ccMallocRSACryptor(unint64_t a1)
{
  _QWORD *result;
  unint64_t v3;

  if (a1 > 0x1000)
    return 0;
  v3 = a1 + 63;
  result = malloc_type_malloc((((a1 + 63) >> 1) & 0x7FFFFFFFFFFFFFE0)- (((a1 + 63) >> 4) & 0xFFFFFFFFFFFFFF8)+ 8 * (((a1 + 63) >> 4) & 0xFFFFFFFFFFFFFF8)+ 192, 0x313F041FuLL);
  if (result)
  {
    *result = a1;
    result[2] = v3 >> 6;
  }
  return result;
}

_DWORD *CCRSACryptorCreatePublicKeyFromPrivateKey(unint64_t *a1)
{
  _DWORD *v1;
  int inited;

  v1 = ccMallocRSACryptor(*a1);
  if (v1)
  {
    ccrsa_ctx_public();
    inited = ccrsa_init_pub();
    v1[2] = 0;
    if (inited)
    {
      ccRSACryptorClear(v1);
      return 0;
    }
  }
  return v1;
}

void ccRSACryptorClear(void *a1)
{
  if (a1)
  {
    cc_clear();
    free(a1);
  }
}

uint64_t CCRSAGetKeyType(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;

  result = 99;
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 8);
    if (v3 <= 1)
      return v3;
    else
      return 99;
  }
  return result;
}

uint64_t CCRSAGetKeySize(unsigned int *a1)
{
  if (a1)
    return *a1;
  else
    return 4294962996;
}

uint64_t CCRSACryptorImport(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  result = 4294962996;
  if (a1 && a3)
  {
    v6 = ccrsa_import_priv_n();
    if (v6)
    {
      v7 = v6;
      v8 = ccMallocRSACryptor(v6 << 6);
      if (v8)
      {
        v9 = v8;
        v8[2] = v7;
        if (!ccrsa_import_priv())
        {
          v10 = 1;
LABEL_13:
          v9[2] = v10;
          *a3 = v9;
          v14 = ccn_bitlen();
          result = 0;
          *(_QWORD *)v9 = v14;
          return result;
        }
LABEL_10:
        ccRSACryptorClear(v9);
        return 4294962992;
      }
    }
    else
    {
      v11 = ccrsa_import_pub_n();
      if (!v11)
        return 4294962992;
      v12 = v11;
      v13 = ccMallocRSACryptor(v11 << 6);
      if (v13)
      {
        v9 = v13;
        *(_QWORD *)ccrsa_ctx_public() = v12;
        ccrsa_ctx_public();
        if (!ccrsa_import_pub())
        {
          v10 = 0;
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
    ccRSACryptorClear(0);
    *a3 = 0;
    return 4294962994;
  }
  return result;
}

uint64_t CCRSACryptorExport(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = 4294962996;
  if (a1 && a2)
  {
    v6 = *(_DWORD *)(a1 + 8);
    if (v6 == 1)
    {
      v10 = ccrsa_export_priv_size();
      v11 = *a3;
      *a3 = v10;
      if (v11 >= v10)
      {
        result = ccrsa_export_priv();
        if (!(_DWORD)result)
          return result;
        return 4294962992;
      }
    }
    else
    {
      if (v6)
        return 4294962996;
      v7 = ccrsa_ctx_public();
      v8 = MEMORY[0x1DF0EEE1C](v7);
      v9 = *a3;
      *a3 = v8;
      if (v9 >= v8)
      {
        ccrsa_ctx_public();
        result = ccrsa_export_pub();
        if (!(_DWORD)result)
          return result;
        return 4294962992;
      }
    }
    return 4294962995;
  }
  return result;
}

uint64_t CCRSACryptorEncrypt(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t result;
  int v11;

  result = 4294962996;
  if (a6 && a3 && a1 && a5)
  {
    if (a2 == 1002)
    {
      ccrsa_ctx_public();
      CCDigestGetDigestInfo(a9);
      ccDRBGGetRngState();
      v11 = ccrsa_encrypt_oaep();
    }
    else
    {
      if (a2 != 1001)
        return 4294962996;
      ccrsa_ctx_public();
      ccDRBGGetRngState();
      v11 = ccrsa_encrypt_eme_pkcs1v15();
    }
    if (v11)
      return 4294962992;
    else
      return 0;
  }
  return result;
}

uint64_t CCRSACryptorDecrypt(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t result;
  int v11;

  result = 4294962996;
  if (a1 && a3 && a5 && a6)
  {
    if (a2 == 1002)
    {
      CCDigestGetDigestInfo(a9);
      v11 = ccrsa_decrypt_oaep();
    }
    else
    {
      if (a2 != 1001)
        return 0;
      v11 = ccrsa_decrypt_eme_pkcs1v15();
    }
    if (v11)
      return 4294962992;
    else
      return 0;
  }
  return result;
}

uint64_t CCRSACryptorCrypt(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v10;
  int v13;
  int v14;

  v5 = 0;
  v6 = *a5;
  *a5 = 0;
  v7 = 4294962996;
  if (a1 && a2 && a4 && v6)
  {
    v10 = (unint64_t)(*(_QWORD *)a1 + 7) >> 3;
    if (v10 != a3 || v6 < v10)
    {
      v5 = 0;
LABEL_20:
      v7 = 4294962994;
      goto LABEL_19;
    }
    v5 = malloc_type_malloc(8 * *(_QWORD *)(a1 + 16), 0x100004000313F17uLL);
    if (!v5)
      goto LABEL_20;
    if (ccn_read_uint())
      goto LABEL_18;
    v13 = *(_DWORD *)(a1 + 8);
    if (v13 == 1)
    {
      v14 = ccrsa_priv_crypt();
    }
    else
    {
      if (v13)
        goto LABEL_18;
      ccrsa_ctx_public();
      v14 = ccrsa_pub_crypt();
    }
    if (!v14)
    {
      ccn_write_uint_padded();
      v7 = 0;
      *a5 = a3;
      goto LABEL_19;
    }
LABEL_18:
    v7 = 4294962996;
  }
LABEL_19:
  free(v5);
  return v7;
}

uint64_t CCRSACryptorCreateFromData(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _QWORD *a10)
{
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _DWORD *v13;
  BOOL v14;
  unint64_t v20;
  _QWORD *v21;

  if (a1 == 1)
  {
    if (a10)
      v14 = a4 == 0;
    else
      v14 = 1;
    if (!v14 && a5 != 0 && a6 != 0 && a7 != 0 && a8 != 0 && a9 != 0)
    {
      v20 = a9 + a7 + 7;
      if (v20 >= 8)
      {
        v21 = ccMallocRSACryptor(8 * (a9 + a7));
        v13 = v21;
        if (v21)
        {
          v21[2] = v20 >> 3;
          if (!ccrsa_make_priv())
          {
            v10 = 0;
            *(_QWORD *)v13 = ccn_bitlen();
            v13[2] = 1;
            goto LABEL_35;
          }
          goto LABEL_38;
        }
        goto LABEL_39;
      }
    }
LABEL_37:
    v13 = 0;
LABEL_38:
    v10 = 4294962996;
LABEL_40:
    ccRSACryptorClear(v13);
    return v10;
  }
  v10 = 4294962996;
  if (!a1 && a5 && a3 && a2 && a4 && a10)
  {
    v11 = a3 + 7;
    if ((unint64_t)(a3 + 7) >= 8)
    {
      v12 = ccMallocRSACryptor(8 * a3);
      v13 = v12;
      if (v12)
      {
        v12[2] = v11 >> 3;
        ccrsa_ctx_public();
        if (!ccrsa_make_pub())
        {
          v10 = 0;
          *(_QWORD *)v13 = ccn_bitlen();
          v13[2] = 0;
LABEL_35:
          *a10 = v13;
          return v10;
        }
        goto LABEL_38;
      }
LABEL_39:
      v10 = 4294962994;
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  return v10;
}

uint64_t CCRSACryptorRecoverPrivateKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7 = 0;
  v8 = 4294962996;
  if (!a7 || !a1 || !a2 || !a3 || !a4 || !a5 || !a6)
    goto LABEL_16;
  v7 = ccMallocRSACryptor(8 * a2);
  if (!v7)
  {
    v8 = 4294962994;
LABEL_16:
    ccRSACryptorClear(v7);
    return v8;
  }
  if (!ccDRBGGetRngState())
  {
    v8 = 4294962989;
    goto LABEL_16;
  }
  if (ccrsa_recover_priv())
  {
    v8 = 4294962996;
    goto LABEL_16;
  }
  v8 = 0;
  *v7 = cczp_bitlen();
  *((_DWORD *)v7 + 2) = 1;
  *a7 = v7;
  return v8;
}

uint64_t CCRSAGetKeyComponents(uint64_t a1)
{
  int v1;
  int fullkey_components;

  v1 = *(_DWORD *)(a1 + 8);
  if (v1 == 1)
  {
    fullkey_components = ccrsa_get_fullkey_components();
  }
  else
  {
    if (v1)
      return 4294962996;
    ccrsa_ctx_public();
    fullkey_components = ccrsa_get_pubkey_components();
  }
  if (fullkey_components)
    return 4294962996;
  else
    return 0;
}

uint64_t CCRSAGetCRTComponentsSizes(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != 1)
    return 4294962996;
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  *a2 = ccn_write_uint_size();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  *a3 = ccn_write_uint_size();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  v7 = ccn_write_uint_size();
  result = 0;
  *a4 = v7;
  return result;
}

uint64_t CCRSAGetCRTComponents(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  BOOL v10;
  BOOL v11;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  if (*(_DWORD *)(a1 + 8) != 1)
    return 4294962996;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  if (CCRSAGetCRTComponentsSizes(a1, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14))
    return 4294962996;
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  cczp_prime();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_prime();
  v10 = (int)ccn_cmpn() < 1 || v16 > a3;
  v11 = v10 || v15 > a5;
  if (v11 || v14 > a7)
    return 4294962996;
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  return 0;
}

uint64_t CCRSACryptorSign(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  int v8;

  if (!validate_sign_verify_params(a1, a2, a3, a5, a7, a7))
    return 4294962996;
  if (a2 == 1001)
  {
    v8 = ccrsa_sign_pkcs1v15();
  }
  else
  {
    ccDRBGGetRngState();
    v8 = ccrsa_sign_pss();
  }
  if (v8)
    return 4294962992;
  else
    return 0;
}

uint64_t validate_sign_verify_params(uint64_t a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo;
  uint64_t v13;
  BOOL v14;

  if (a4 - 13 < 0xFFFFFFFB)
    return 0;
  DigestInfo = CCDigestGetDigestInfo(a4);
  if ((a2 & 0xFFFFFFFB) == 0x3E9)
    v13 = DigestInfo;
  else
    v13 = 0;
  if (DigestInfo)
    v14 = a6 == 0;
  else
    v14 = 1;
  if (v14 || a5 == 0 || a3 == 0 || a1 == 0)
    return 0;
  else
    return v13;
}

uint64_t CCRSACryptorVerify(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t DigestInfo;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;

  if (a5 - 13 < 0xFFFFFFFB)
    return 4294962996;
  DigestInfo = CCDigestGetDigestInfo(a5);
  v13 = DigestInfo;
  if ((a2 & 0xFFFFFFFB) == 0x3E9)
    v14 = DigestInfo;
  else
    v14 = 0;
  result = 4294962996;
  if (a1 && a3 && a7 && v13 && v14)
  {
    ccrsa_ctx_public();
    if (a2 == 1001)
      v15 = ccrsa_verify_pkcs1v15_digest();
    else
      v15 = ccrsa_verify_pss_digest();
    if (cc_cmp_safe())
      v16 = -146;
    else
      v16 = v15;
    if (v16)
      return 4294962992;
    else
      return 0;
  }
  return result;
}

int CCSymmetricKeyWrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  uint64_t CipherMode;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  BOOL v17;
  size_t v18;
  int v19;
  _QWORD v21[2];

  v21[0] = rawKey;
  v21[1] = *MEMORY[0x1E0C874D8];
  CipherMode = getCipherMode(0, 1, 0);
  MEMORY[0x1E0C86820](CipherMode, v14);
  v16 = (char *)v21 - v15;
  v17 = (kekLen & 0xFFFFFFFFFFFFFFF7) == 0x10 || kekLen == 32;
  if (!v17
    || !wrappedKeyLen
    || (v18 = *wrappedKeyLen, v18 < ccwrap_wrapped_size())
    || iv && ivLen < 8
    || (*(unsigned int (**)(uint64_t, char *, size_t, const uint8_t *))(CipherMode + 16))(CipherMode, v16, kekLen, kek)|| ccwrap_auth_encrypt_withiv())
  {
    cc_clear();
    *wrappedKeyLen = 0;
    v19 = -4300;
  }
  else
  {
    v19 = 0;
  }
  cc_clear();
  return v19;
}

int CCSymmetricKeyUnwrap(CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  uint64_t CipherMode;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  BOOL v19;
  int v20;
  size_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  char v26;
  void *v28[2];
  size_t v29;
  _QWORD v30[3];

  v28[0] = rawKey;
  v30[2] = *MEMORY[0x1E0C874D8];
  v30[0] = iv;
  v30[1] = &rfc3394_iv_data;
  v29 = 0;
  CipherMode = getCipherMode(0, 1, 1u);
  MEMORY[0x1E0C86820](CipherMode, v14);
  v17 = (char *)v28 - v16;
  v18 = 0;
  v19 = (kekLen & 0xFFFFFFFFFFFFFFF7) == 0x10 || kekLen == 32;
  v20 = -4300;
  v28[1] = v15;
  if (v19 && rawKeyLen)
  {
    v21 = *rawKeyLen;
    if (v21 < ccwrap_unwrapped_size()
      || iv && ivLen < 8
      || (*(unsigned int (**)(uint64_t, char *, size_t, const uint8_t *))(CipherMode + 16))(CipherMode, v17, kekLen, kek))
    {
      v18 = 0;
      v20 = -4300;
    }
    else
    {
      v22 = malloc_type_malloc(*rawKeyLen, 0x70B00D28uLL);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = 1;
        while (1)
        {
          v26 = v25;
          if (v30[v24])
          {
            v29 = *rawKeyLen;
            if (!ccwrap_auth_decrypt_withiv())
              break;
          }
          v25 = 0;
          v24 = 1;
          if ((v26 & 1) == 0)
          {
            cc_clear();
            v20 = -4304;
            goto LABEL_18;
          }
        }
        memcpy(v28[0], v23, v29);
        v20 = 0;
LABEL_18:
        cc_clear();
        free(v23);
        v18 = v29;
      }
      else
      {
        v18 = 0;
        v20 = -4302;
      }
    }
  }
  *rawKeyLen = v18;
  cc_clear();
  return v20;
}

size_t CCSymmetricWrappedSize(CCWrappingAlgorithm algorithm, size_t rawKeyLen)
{
  return ccwrap_wrapped_size();
}

size_t CCSymmetricUnwrappedSize(CCWrappingAlgorithm algorithm, size_t wrappedKeyLen)
{
  return ccwrap_unwrapped_size();
}

uint64_t noMode()
{
  return 0;
}

void *cc_rc4_crypt_mode()
{
  return &rc4mode;
}

uint64_t cccbc_setiv(uint64_t a1, const void *a2, size_t __n, void *__dst)
{
  if (*(_QWORD *)(a1 + 8) != __n)
    return 0xFFFFFFFFLL;
  memcpy(__dst, a2, __n);
  return 0;
}

uint64_t cccbc_getiv(uint64_t a1, void *__dst, _DWORD *a3, void *__src)
{
  unint64_t v4;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 <= *a3)
  {
    *a3 = v4;
    memcpy(__dst, __src, v4);
    return 0;
  }
  else
  {
    *a3 = v4;
    return 0xFFFFFFFFLL;
  }
}

uint64_t cccfb_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t cccfb_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t cccfb_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t cccfb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))(a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t cccfb8_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t cccfb8_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t cccfb8_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t cccfb8_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))(a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t ccctr_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ccctr_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t ccctr_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3, a2);
}

uint64_t ccctr_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 40))(a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t ccctr_setiv(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(_QWORD *)(a1 + 16) != a3)
    return 0xFFFFFFFFLL;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a1, a4, a2);
  return 0;
}

uint64_t ccofb_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ccofb_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t ccofb_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t ccofb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))(a5, a4 / *(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t ccxts_mode_get_ctx_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ccxts_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t ccxts_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3);
}

uint64_t ccxts_mode_encrypt_tweak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C874D8];
  v9 = ccxts_context_size();
  MEMORY[0x1E0C86820](v9, v10);
  v12 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 40))(a6, (char *)v14 - v11, a5);
  ccpad_xts_encrypt();
  return v12;
}

uint64_t ccxts_mode_decrypt_tweak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C874D8];
  v9 = ccxts_context_size();
  MEMORY[0x1E0C86820](v9, v10);
  v12 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 40))(a6, (char *)v14 - v11, a5);
  ccpad_xts_decrypt();
  return v12;
}

uint64_t ccgcm_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t ccgcm_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a5, a4, a2, a3);
}

uint64_t ccgcm_setiv()
{
  return ccgcm_set_iv_legacy();
}

uint64_t ccccm_mode_get_ctx_size(_QWORD *a1)
{
  return *a1 + 176;
}

uint64_t ccccm_mode_get_block_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

__n128 ccccm_mode_setup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __n128 *a8)
{
  __n128 result;

  (*(void (**)(uint64_t, __n128 *, uint64_t, uint64_t))(a1 + 24))(a1, a8 + 10, a4, a3);
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  *a8 = result;
  a8[1] = result;
  return result;
}

uint64_t ccccm_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a5 + 160, a5 + 64, a4, a2, a3);
}

uint64_t ccccm_mode_done(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 56))(a2 + 160, a2 + 64, a2 + 48);
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a2 + 152);
  return 0;
}

uint64_t ccpkcs7_encrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  ccpad_pkcs7_encrypt();
  *a7 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return 0;
}

uint64_t ccpkcs7_decrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  *a7 = ccpad_pkcs7_decrypt();
  return 0;
}

uint64_t ccpkcs7_decrypt_ecb_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  *a7 = ccpad_pkcs7_ecb_decrypt();
  return 0;
}

uint64_t cccts3_encrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  ccpad_cts3_encrypt();
  *a7 = a5;
  return 0;
}

uint64_t cccts3_decrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  ccpad_cts3_decrypt();
  *a7 = a5;
  return 0;
}

unint64_t cccts3_padlen(int a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;

  v10 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  if (a5)
  {
    if (a1)
    {
      v11 = a4 + (*(uint64_t (**)(uint64_t))(a2 + 8))(a3) - 1;
LABEL_7:
      v13 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
      return v11 / v13 * v13;
    }
  }
  else if (a1)
  {
    v12 = a4 > v10;
    v11 = a4 - v10;
    if (v12)
      goto LABEL_7;
    return 0;
  }
  return a4;
}

uint64_t cccts3_reserve(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 2 * (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
}

uint64_t ccnopad_decrypt_pad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  *a7 = 0;
  if (a5)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t rc4ModeInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(MEMORY[0x1E0C86C08] + 8))(a2, a3, a4);
  return 0;
}

uint64_t rc4crypt()
{
  (*(void (**)(void))(MEMORY[0x1E0C86C08] + 16))();
  return 0;
}

uint64_t CNCRCInit(unsigned int a1, dispatch_once_t ***a2)
{
  dispatch_once_t **v4;
  dispatch_once_t **v5;
  dispatch_once_t *Desc;
  dispatch_once_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = (dispatch_once_t **)malloc_type_malloc(0x18uLL, 0x102004024DAA5DEuLL);
  if (!v4)
    return 4294962994;
  v5 = v4;
  Desc = (dispatch_once_t *)getDesc(a1);
  *v5 = Desc;
  v7 = Desc[1];
  if (v7)
  {
    v5[1] = 0;
    v5[2] = 0;
    if (*(_DWORD *)(v7 + 8))
      v8 = (*(uint64_t (**)(void))(v7 + 16))();
    else
      v8 = crc_normal_init(Desc);
    v10 = v8;
    result = 0;
    v5[1] = (dispatch_once_t *)v10;
    *a2 = v5;
  }
  else
  {
    free(v5);
    return 4294962991;
  }
  return result;
}

uint64_t CNCRCRelease(void *a1)
{
  free(a1);
  return 0;
}

uint64_t CNCRCUpdate(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v6 = *(_QWORD *)(v5 + 8);
  if (*(_DWORD *)(v6 + 8) == 1)
  {
    v7 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v6 + 24))(a3, a2, a1[1]);
  }
  else
  {
    v8 = a1[1];
    if (*(_DWORD *)(v6 + 20))
      v7 = crc_reverse_update(v5, a2, a3, v8);
    else
      v7 = crc_normal_update(v5, a2, a3, v8);
  }
  v9 = a1[2] + a3;
  a1[1] = v7;
  a1[2] = v9;
  return 0;
}

uint64_t CNCRCFinal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *(_QWORD *)(v4 + 8);
  if (*(_DWORD *)(v5 + 8) == 1)
  {
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(a1[2], a1[1]);
  }
  else
  {
    v7 = a1[1];
    if (*(_DWORD *)(v5 + 20))
      v6 = crc_reverse_final(v4, v7);
    else
      v6 = crc_normal_final(v4, v7);
  }
  a1[1] = v6;
  *a2 = v6;
  return 0;
}

uint64_t CNCRCDumpTable(unsigned int a1)
{
  dispatch_once_t *Desc;
  dispatch_once_t v2;
  uint64_t v4;

  Desc = (dispatch_once_t *)getDesc(a1);
  v2 = Desc[1];
  if (!v2)
    return 4294962991;
  if (*(_DWORD *)(v2 + 8))
    return 4294962996;
  v4 = (uint64_t)Desc;
  crc_normal_init(Desc);
  dump_crc_table(v4);
  return 0;
}

BOOL CNCRCWeakTest(unsigned int a1)
{
  dispatch_once_t *Desc;
  dispatch_once_t v2;
  dispatch_once_t *v4;
  unint64_t v5;

  Desc = (dispatch_once_t *)getDesc(a1);
  v2 = Desc[1];
  if (!v2 || *(_DWORD *)(v2 + 8) == 1)
    return 0;
  v4 = Desc;
  if (*(_DWORD *)(v2 + 20))
    v5 = crc_reverse_oneshot(Desc, "123456789", 9);
  else
    v5 = crc_normal_oneshot(Desc, "123456789", 9);
  return v5 != *(_QWORD *)(v4[1] + 56);
}

uint64_t CNEncoderCreateCustom(uint64_t a1, unsigned int a2, uint64_t a3, char a4, int a5, _QWORD *a6)
{
  uint64_t result;
  _QWORD *v13;
  _BYTE *v14;
  _QWORD *v15;
  _DWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;

  if ((a5 - 3) < 0xFFFFFFFE)
    return 4294962996;
  result = 4294962996;
  if (a2 - 16 <= 0x30 && ((1 << (a2 - 16)) & 0x1000000010001) != 0 && a3 && a6)
  {
    *a6 = 0;
    v13 = malloc_type_malloc(0x108uLL, 0x1060040B02D0E39uLL);
    v14 = malloc_type_malloc(0x28uLL, 0x1070040DD70D767uLL);
    v15 = malloc_type_malloc(0x20uLL, 0x10200405028CB4AuLL);
    if (v15)
    {
      v16 = v15;
      v15[2] = 0;
      v17 = v15 + 2;
      v15[3] = 0;
      v18 = v15 + 3;
      if (v13 && v14)
      {
        v28 = v15 + 3;
        v14[32] = a2;
        *(_QWORD *)v14 = a1;
        *((_QWORD *)v14 + 2) = a3;
        *((_QWORD *)v14 + 3) = (char *)&encoderValue + 20 * (a2 >> 5);
        v14[33] = a4;
        *((_DWORD *)v14 + 2) = 51966;
        v13[32] = v14;
        setReverseMap((uint64_t)v13);
        *(_QWORD *)v16 = v13;
        v16[2] = a5;
        v19 = v13[32];
        if (!v19)
          goto LABEL_14;
        v20 = *(_QWORD *)(v19 + 24);
        if (v20)
          v21 = *(unsigned int *)(v20 + 8);
        else
LABEL_14:
          v21 = 0;
        *((_QWORD *)v16 + 2) = CNBufferCreate(v21);
        if (*(_QWORD *)v16 && (v23 = *(_QWORD *)(*(_QWORD *)v16 + 256)) != 0 && (v24 = *(_QWORD *)(v23 + 24)) != 0)
          v25 = *(unsigned int *)(v24 + 12);
        else
          v25 = 0;
        v26 = CNBufferCreate(v25);
        v18 = v28;
        *v28 = v26;
        if (*v17)
        {
          if (v26)
          {
            result = 0;
            *a6 = v16;
            return result;
          }
        }
      }
      v27 = v18;
      free(v13);
      free(v14);
      if (*v17)
        CNBufferRelease((uint64_t)v17);
      if (*v27)
        CNBufferRelease((uint64_t)v27);
      v22 = v16;
    }
    else
    {
      free(v13);
      v22 = v14;
    }
    free(v22);
    return 4294962994;
  }
  return result;
}

unint64_t CNEncoderGetOutputLength(unint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!result)
    return result;
  v2 = *(_DWORD *)(result + 8);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      v3 = *(_QWORD *)(*(_QWORD *)(result + 16) + 8) + a2;
      if (v3
        && *(_QWORD *)result
        && (v4 = *(_QWORD *)(*(_QWORD *)result + 256)) != 0
        && (v5 = *(_QWORD *)(v4 + 24)) != 0
        && (v6 = *(unsigned int *)(v5 + 8), (_DWORD)v6)
        && (v7 = *(unsigned int *)(v5 + 12), (_DWORD)v7))
      {
        return (v3 + v6 - 1) / v6 * v7 + 1;
      }
      else
      {
        return 1;
      }
    }
    return 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(result + 24) + 8) + a2;
  if (!v8)
    return 0;
  v9 = *(_QWORD *)result;
  if (*(_QWORD *)result)
  {
    v9 = *(_QWORD *)(v9 + 256);
    if (v9)
    {
      v9 = *(_QWORD *)(v9 + 24);
      if (v9)
        v9 = *(unsigned int *)(v9 + 4);
    }
  }
  return (unint64_t)(v9 * v8 + 8) >> 3;
}

unint64_t decodeLen(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v2 = *(_QWORD *)(v2 + 256);
      if (v2)
      {
        v2 = *(_QWORD *)(v2 + 24);
        if (v2)
          v2 = *(unsigned int *)(v2 + 4);
      }
    }
  }
  else
  {
    v2 = 0;
  }
  return (unint64_t)(v2 * a2 + 8) >> 3;
}

unint64_t CNEncoderGetOutputLengthFromEncoding(unsigned int a1, int a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t *v12;

  v12 = 0;
  v5 = 0;
  if (!CNEncoderCreate(a1, a2, &v12))
  {
    if (a2 == 2)
    {
      if (a3)
      {
        v10 = (unint64_t)v12;
        if (v12)
        {
          v10 = *v12;
          if (*v12)
          {
            v10 = *(_QWORD *)(v10 + 256);
            if (v10)
            {
              v10 = *(_QWORD *)(v10 + 24);
              if (v10)
                v10 = *(unsigned int *)(v10 + 4);
            }
          }
        }
        v5 = (v10 * a3 + 8) >> 3;
        goto LABEL_21;
      }
    }
    else if (a2 == 1)
    {
      v5 = 1;
      if (a3 && v12)
      {
        if (*v12
          && (v6 = *(_QWORD *)(*v12 + 256)) != 0
          && (v7 = *(_QWORD *)(v6 + 24)) != 0
          && (v8 = *(unsigned int *)(v7 + 8), (_DWORD)v8)
          && (v9 = *(unsigned int *)(v7 + 12), (_DWORD)v9))
        {
          v5 = (a3 + v8 - 1) / v8 * v9 + 1;
        }
        else
        {
          v5 = 1;
        }
      }
      goto LABEL_21;
    }
    v5 = 0;
LABEL_21:
    CNEncoderRelease(&v12);
  }
  return v5;
}

uint64_t deCode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE *a4, unint64_t *a5)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unint64_t v22;
  unint64_t v23;

  if (!a1)
    return 0;
  if (!*(_QWORD *)a1)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 256);
  if (!v6)
    return 0;
  v9 = a3;
  v11 = *(_QWORD *)(v6 + 24);
  if (v11)
  {
    v12 = *(_DWORD *)(v11 + 4);
    if (a3)
      goto LABEL_6;
LABEL_21:
    *a5 = 0;
LABEL_22:
    *a4 = 0;
    return 0;
  }
  v12 = 0;
  if (!a3)
    goto LABEL_21;
LABEL_6:
  v13 = *(_QWORD *)(v6 + 24);
  if (v13)
    v13 = *(unsigned int *)(v13 + 4);
  v14 = v13 * a3;
  *a5 = (v14 + 8) >> 3;
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
    goto LABEL_22;
  cc_clear();
  v15 = 0;
  v16 = 0;
  do
  {
    v18 = *a2++;
    v17 = v18;
    if (v18 != *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)a1 + 256) + 33))
    {
      v19 = *(unsigned __int8 *)(*(_QWORD *)a1 + v17);
      v20 = (v15 & 7) + v12;
      v16 = v15 >> 3;
      if (8 - v20 < 0)
      {
        a4[v16] |= v19 >> (v20 - 8);
        v21 = v19 << (16 - v20);
        v22 = v16 + 1;
      }
      else
      {
        v21 = v19 << (8 - v20);
        v22 = v15 >> 3;
      }
      a4[v22] |= v21;
    }
    v15 += v12;
    --v9;
  }
  while (v9);
  if (a4[v16 + 1])
    v23 = v16 + 2;
  else
    v23 = v16 + 1;
  *a5 = v23;
  return 0;
}

uint64_t CNEncoderBlocksize(unsigned int a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  result = 4294962996;
  if (a2)
  {
    if (a3)
    {
      v9 = 0;
      result = CNEncoderCreate(a1, 1, &v9);
      if (!(_DWORD)result)
      {
        v7 = v9;
        if (v9 && (v7 = (_QWORD *)*v9) != 0 && (v7 = (_QWORD *)v7[32]) != 0)
        {
          v8 = v7[3];
          if (v8)
            v8 = *(unsigned int *)(v8 + 8);
          *a2 = v8;
          v7 = (_QWORD *)v7[3];
          if (v7)
            v7 = (_QWORD *)*((unsigned int *)v7 + 3);
        }
        else
        {
          *a2 = 0;
        }
        *a3 = v7;
        CNEncoderRelease(&v9);
        return 0;
      }
    }
  }
  return result;
}

uint64_t CNEncoderBlocksizeFromRef(uint64_t *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 4294962996;
  if (a1 && a2 && a3)
  {
    v5 = *a1;
    if (v5 && (v5 = *(_QWORD *)(v5 + 256)) != 0)
    {
      v6 = *(_QWORD *)(v5 + 24);
      if (v6)
        v6 = *(unsigned int *)(v6 + 8);
      *a2 = v6;
      v5 = *(_QWORD *)(v5 + 24);
      if (v5)
        v5 = *(unsigned int *)(v5 + 12);
    }
    else
    {
      *a2 = 0;
    }
    result = 0;
    *a3 = v5;
  }
  return result;
}

BOOL CNBufferEmpty(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) == 0;
}

void CCDigestGetDigestInfo_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DED40000, MEMORY[0x1E0C88E98], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void CCDigestGetDigestInfo_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DED40000, MEMORY[0x1E0C88E98], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void CCDigestGetDigestInfo_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DED40000, MEMORY[0x1E0C88E98], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB0](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C86858]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C86860]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1E0C86868]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C86870]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C86878]();
}

uint64_t ccansikdf_x963()
{
  return MEMORY[0x1E0C86880]();
}

uint64_t ccccm_cbcmac()
{
  return MEMORY[0x1E0C86888]();
}

uint64_t ccccm_set_iv()
{
  return MEMORY[0x1E0C86890]();
}

uint64_t ccchacha20()
{
  return MEMORY[0x1E0C86898]();
}

uint64_t ccchacha20poly1305_decrypt_oneshot()
{
  return MEMORY[0x1E0C868A0]();
}

uint64_t ccchacha20poly1305_encrypt_oneshot()
{
  return MEMORY[0x1E0C868A8]();
}

uint64_t ccchacha20poly1305_info()
{
  return MEMORY[0x1E0C868B0]();
}

uint64_t ccckg2_contributor_commit()
{
  return MEMORY[0x1E0C868B8]();
}

uint64_t ccckg2_contributor_finish()
{
  return MEMORY[0x1E0C868C0]();
}

uint64_t ccckg2_ctx_cp()
{
  return MEMORY[0x1E0C868C8]();
}

uint64_t ccckg2_init()
{
  return MEMORY[0x1E0C868D0]();
}

uint64_t ccckg2_owner_finish()
{
  return MEMORY[0x1E0C868D8]();
}

uint64_t ccckg2_owner_generate_share()
{
  return MEMORY[0x1E0C868E0]();
}

uint64_t ccckg2_params_p224_sha256_v2()
{
  return MEMORY[0x1E0C868E8]();
}

uint64_t ccckg2_sizeof_commitment()
{
  return MEMORY[0x1E0C868F0]();
}

uint64_t ccckg2_sizeof_ctx()
{
  return MEMORY[0x1E0C868F8]();
}

uint64_t ccckg2_sizeof_opening()
{
  return MEMORY[0x1E0C86900]();
}

uint64_t ccckg2_sizeof_share()
{
  return MEMORY[0x1E0C86908]();
}

uint64_t ccckg_contributor_commit()
{
  return MEMORY[0x1E0C86910]();
}

uint64_t ccckg_contributor_finish()
{
  return MEMORY[0x1E0C86918]();
}

uint64_t ccckg_ctx_cp()
{
  return MEMORY[0x1E0C86920]();
}

uint64_t ccckg_init()
{
  return MEMORY[0x1E0C86928]();
}

uint64_t ccckg_owner_finish()
{
  return MEMORY[0x1E0C86930]();
}

uint64_t ccckg_owner_generate_share()
{
  return MEMORY[0x1E0C86938]();
}

uint64_t ccckg_sizeof_commitment()
{
  return MEMORY[0x1E0C86940]();
}

uint64_t ccckg_sizeof_ctx()
{
  return MEMORY[0x1E0C86948]();
}

uint64_t ccckg_sizeof_opening()
{
  return MEMORY[0x1E0C86950]();
}

uint64_t ccckg_sizeof_share()
{
  return MEMORY[0x1E0C86958]();
}

uint64_t cccmac_final_generate()
{
  return MEMORY[0x1E0C86960]();
}

uint64_t cccmac_init()
{
  return MEMORY[0x1E0C86968]();
}

uint64_t cccmac_one_shot_generate()
{
  return MEMORY[0x1E0C86970]();
}

uint64_t cccmac_update()
{
  return MEMORY[0x1E0C86978]();
}

uint64_t ccdes_cbc_cksum()
{
  return MEMORY[0x1E0C86980]();
}

uint64_t ccdes_key_is_weak()
{
  return MEMORY[0x1E0C86988]();
}

uint64_t ccdes_key_set_odd_parity()
{
  return MEMORY[0x1E0C86990]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1E0C86998]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1E0C869A0]();
}

uint64_t ccdh_ctx_init()
{
  return MEMORY[0x1E0C869A8]();
}

uint64_t ccdh_ctx_public()
{
  return MEMORY[0x1E0C869B0]();
}

uint64_t ccdh_export_pub()
{
  return MEMORY[0x1E0C869B8]();
}

uint64_t ccdh_export_pub_size()
{
  return MEMORY[0x1E0C869C0]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1E0C869C8]();
}

uint64_t ccdh_gp_rfc3526group05()
{
  return MEMORY[0x1E0C869D0]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1E0C869D8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C869E0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C869E8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C869F0]();
}

uint64_t ccec_blind()
{
  return MEMORY[0x1E0C869F8]();
}

uint64_t ccec_compact_export_pub()
{
  return MEMORY[0x1E0C86A00]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1E0C86A08]();
}

uint64_t ccec_compact_import_pub_size()
{
  return MEMORY[0x1E0C86A10]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C86A18]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C86A20]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C86A28]();
}

uint64_t ccec_diversify_min_entropy_len()
{
  return MEMORY[0x1E0C86A30]();
}

uint64_t ccec_diversify_priv_twin()
{
  return MEMORY[0x1E0C86A38]();
}

uint64_t ccec_diversify_pub_twin()
{
  return MEMORY[0x1E0C86A40]();
}

uint64_t ccec_generate_blinding_keys()
{
  return MEMORY[0x1E0C86A48]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1E0C86A50]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1E0C86A58]();
}

uint64_t ccec_get_fullkey_components()
{
  return MEMORY[0x1E0C86A60]();
}

uint64_t ccec_get_pubkey_components()
{
  return MEMORY[0x1E0C86A68]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C86A70]();
}

uint64_t ccec_make_pub()
{
  return MEMORY[0x1E0C86A78]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1E0C86A80]();
}

uint64_t ccec_unblind()
{
  return MEMORY[0x1E0C86A88]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C86A90]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1E0C86A98]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1E0C86AA0]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1E0C86AA8]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1E0C86AB0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C86AB8]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1E0C86AC0]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1E0C86AC8]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C86AD0]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1E0C86AD8]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1E0C86AE0]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1E0C86AE8]();
}

uint64_t ccgcm_set_iv_legacy()
{
  return MEMORY[0x1E0C86AF0]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C86AF8]();
}

uint64_t cch2c()
{
  return MEMORY[0x1E0C86B00]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1E0C86B20]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1E0C86B28]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1E0C86B30]();
}

uint64_t cchmac()
{
  return MEMORY[0x1E0C86B38]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1E0C86B40]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1E0C86B48]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1E0C86B50]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C86B68]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1E0C86B70]();
}

uint64_t ccn_cmpn()
{
  return MEMORY[0x1E0C86B78]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C86B80]();
}

uint64_t ccn_write_int()
{
  return MEMORY[0x1E0C86B88]();
}

uint64_t ccn_write_int_size()
{
  return MEMORY[0x1E0C86B90]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1E0C86B98]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1E0C86BA0]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1E0C86BA8]();
}

uint64_t ccnistkdf_ctr_hmac()
{
  return MEMORY[0x1E0C86BB0]();
}

uint64_t ccnistkdf_ctr_hmac_fixed()
{
  return MEMORY[0x1E0C86BB8]();
}

uint64_t ccpad_cts3_decrypt()
{
  return MEMORY[0x1E0C86BC0]();
}

uint64_t ccpad_cts3_encrypt()
{
  return MEMORY[0x1E0C86BC8]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x1E0C86BD0]();
}

uint64_t ccpad_pkcs7_ecb_decrypt()
{
  return MEMORY[0x1E0C86BD8]();
}

uint64_t ccpad_pkcs7_ecb_encrypt()
{
  return MEMORY[0x1E0C86BE0]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x1E0C86BE8]();
}

uint64_t ccpad_xts_decrypt()
{
  return MEMORY[0x1E0C86BF0]();
}

uint64_t ccpad_xts_encrypt()
{
  return MEMORY[0x1E0C86BF8]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1E0C86C00]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C86C18]();
}

uint64_t ccrng_uniform()
{
  return MEMORY[0x1E0C86C20]();
}

uint64_t ccrsa_ctx_private_zp()
{
  return MEMORY[0x1E0C86C28]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x1E0C86C30]();
}

uint64_t ccrsa_decrypt_eme_pkcs1v15()
{
  return MEMORY[0x1E0C86C38]();
}

uint64_t ccrsa_decrypt_oaep()
{
  return MEMORY[0x1E0C86C40]();
}

uint64_t ccrsa_encrypt_eme_pkcs1v15()
{
  return MEMORY[0x1E0C86C48]();
}

uint64_t ccrsa_encrypt_oaep()
{
  return MEMORY[0x1E0C86C50]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x1E0C86C58]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x1E0C86C60]();
}

uint64_t ccrsa_export_pub()
{
  return MEMORY[0x1E0C86C68]();
}

uint64_t ccrsa_export_pub_size()
{
  return MEMORY[0x1E0C86C70]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x1E0C86C78]();
}

uint64_t ccrsa_get_fullkey_components()
{
  return MEMORY[0x1E0C86C80]();
}

uint64_t ccrsa_get_pubkey_components()
{
  return MEMORY[0x1E0C86C88]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x1E0C86C90]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x1E0C86C98]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1E0C86CA0]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1E0C86CA8]();
}

uint64_t ccrsa_init_pub()
{
  return MEMORY[0x1E0C86CB0]();
}

uint64_t ccrsa_make_priv()
{
  return MEMORY[0x1E0C86CB8]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x1E0C86CC0]();
}

uint64_t ccrsa_priv_crypt()
{
  return MEMORY[0x1E0C86CC8]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1E0C86CD0]();
}

uint64_t ccrsa_recover_priv()
{
  return MEMORY[0x1E0C86CD8]();
}

uint64_t ccrsa_sign_pkcs1v15()
{
  return MEMORY[0x1E0C86CE0]();
}

uint64_t ccrsa_sign_pss()
{
  return MEMORY[0x1E0C86CE8]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x1E0C86CF0]();
}

uint64_t ccrsa_verify_pss_digest()
{
  return MEMORY[0x1E0C86CF8]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C86D00]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1E0C86D08]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C86D10]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C86D18]();
}

uint64_t ccsha3_224_di()
{
  return MEMORY[0x1E0C86D20]();
}

uint64_t ccsha3_256_di()
{
  return MEMORY[0x1E0C86D28]();
}

uint64_t ccsha3_384_di()
{
  return MEMORY[0x1E0C86D30]();
}

uint64_t ccsha3_512_di()
{
  return MEMORY[0x1E0C86D38]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C86D40]();
}

uint64_t ccwrap_auth_decrypt_withiv()
{
  return MEMORY[0x1E0C86D48]();
}

uint64_t ccwrap_auth_encrypt_withiv()
{
  return MEMORY[0x1E0C86D50]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1E0C86D58]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1E0C86D60]();
}

uint64_t ccxts_context_size()
{
  return MEMORY[0x1E0C86D68]();
}

uint64_t ccz_add()
{
  return MEMORY[0x1E0C86D70]();
}

uint64_t ccz_addi()
{
  return MEMORY[0x1E0C86D78]();
}

uint64_t ccz_bitlen()
{
  return MEMORY[0x1E0C86D80]();
}

uint64_t ccz_cmp()
{
  return MEMORY[0x1E0C86D88]();
}

uint64_t ccz_cmpi()
{
  return MEMORY[0x1E0C86D90]();
}

uint64_t ccz_divmod()
{
  return MEMORY[0x1E0C86D98]();
}

uint64_t ccz_expmod()
{
  return MEMORY[0x1E0C86DA0]();
}

uint64_t ccz_free()
{
  return MEMORY[0x1E0C86DA8]();
}

uint64_t ccz_init()
{
  return MEMORY[0x1E0C86DB0]();
}

uint64_t ccz_is_negative()
{
  return MEMORY[0x1E0C86DB8]();
}

uint64_t ccz_is_prime()
{
  return MEMORY[0x1E0C86DC0]();
}

uint64_t ccz_is_zero()
{
  return MEMORY[0x1E0C86DC8]();
}

uint64_t ccz_lsl()
{
  return MEMORY[0x1E0C86DD0]();
}

uint64_t ccz_lsr()
{
  return MEMORY[0x1E0C86DD8]();
}

uint64_t ccz_mod()
{
  return MEMORY[0x1E0C86DE0]();
}

uint64_t ccz_mul()
{
  return MEMORY[0x1E0C86DE8]();
}

uint64_t ccz_muli()
{
  return MEMORY[0x1E0C86DF0]();
}

uint64_t ccz_mulmod()
{
  return MEMORY[0x1E0C86DF8]();
}

uint64_t ccz_neg()
{
  return MEMORY[0x1E0C86E00]();
}

uint64_t ccz_random_bits()
{
  return MEMORY[0x1E0C86E08]();
}

uint64_t ccz_read_radix()
{
  return MEMORY[0x1E0C86E10]();
}

uint64_t ccz_read_uint()
{
  return MEMORY[0x1E0C86E18]();
}

uint64_t ccz_set()
{
  return MEMORY[0x1E0C86E20]();
}

uint64_t ccz_seti()
{
  return MEMORY[0x1E0C86E28]();
}

uint64_t ccz_size()
{
  return MEMORY[0x1E0C86E30]();
}

uint64_t ccz_sub()
{
  return MEMORY[0x1E0C86E38]();
}

uint64_t ccz_subi()
{
  return MEMORY[0x1E0C86E40]();
}

uint64_t ccz_trailing_zeros()
{
  return MEMORY[0x1E0C86E48]();
}

uint64_t ccz_write_int_size()
{
  return MEMORY[0x1E0C86E50]();
}

uint64_t ccz_write_radix()
{
  return MEMORY[0x1E0C86E58]();
}

uint64_t ccz_write_radix_size()
{
  return MEMORY[0x1E0C86E60]();
}

uint64_t ccz_write_uint()
{
  return MEMORY[0x1E0C86E68]();
}

uint64_t ccz_write_uint_size()
{
  return MEMORY[0x1E0C86E70]();
}

uint64_t ccz_zero()
{
  return MEMORY[0x1E0C86E78]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C86E80]();
}

uint64_t cczp_n()
{
  return MEMORY[0x1E0C86E88]();
}

uint64_t cczp_prime()
{
  return MEMORY[0x1E0C86E90]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C87108](predicate, context, function);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C87388]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C87828](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C87838](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C87840](__b, *(_QWORD *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C87890](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C87898](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C878A0](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

