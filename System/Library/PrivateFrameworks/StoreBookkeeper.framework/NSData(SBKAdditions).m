@implementation NSData(SBKAdditions)

- (id)_SBKDataByInflatingWithNoZipHeader
{
  id v1;
  id v2;
  unsigned int v3;
  unsigned int v4;
  z_stream strm;
  _BYTE v7[16384];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") >> 32)
  {
    NSLog(CFSTR("ERROR: unable to zip large data of size ~%.3f GB"), (double)(unint64_t)objc_msgSend(v1, "length") / 1000000000.0);
  }
  else
  {
    memset(&strm.avail_in, 0, 104);
    strm.avail_in = objc_msgSend(v1, "length");
    strm.next_in = (Bytef *)objc_msgSend(objc_retainAutorelease(v1), "bytes");
    v2 = 0;
    if (inflateInit2_(&strm, -15, "1.2.12", 112))
      goto LABEL_11;
    v2 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v7;
      v3 = inflate(&strm, 0);
      if (v3 > 1)
        break;
      v4 = v3;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v2, "appendBytes:length:", v7, 0x4000 - strm.avail_out);
      if (v4)
      {
        inflateEnd(&strm);
        goto LABEL_11;
      }
    }
    inflateEnd(&strm);

  }
  v2 = 0;
LABEL_11:

  return v2;
}

- (id)_SBKDataByDeflatingWithNoZipHeaderWithCompression:()SBKAdditions
{
  id v4;
  id v5;
  id v6;
  Bytef *v7;
  uInt v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v14;
  Bytef *next_out;
  BOOL v16;
  z_stream strm;
  _BYTE v19[16384];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  if ((unint64_t)objc_msgSend(v4, "length") < 0xFFFFFFFF)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (Bytef *)objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", (v8 >> 1) + 1);
    v5 = 0;
    if (!v7 || !v8)
      goto LABEL_22;
    memset(&strm, 0, sizeof(strm));
    if (a3 == 1)
      v10 = 1;
    else
      v10 = -1;
    strm.avail_out = 0x4000;
    if (a3 == 2)
      v11 = 9;
    else
      v11 = v10;
    strm.next_out = v19;
    if (deflateInit2_(&strm, v11, 8, -15, 9, 0, "1.2.12", 112))
    {
      NSLog(CFSTR("deflateInit2() failed: %s"), strm.msg);
    }
    else
    {
      strm.avail_in = v8;
      strm.next_in = v7;
      do
      {
        if (!strm.avail_out)
        {
          objc_msgSend(v9, "appendBytes:length:", v19, 0x4000);
          strm.avail_out = 0x4000;
          strm.next_out = v19;
        }
        v12 = deflate(&strm, 0);
      }
      while (!v12 && strm.avail_in);
      if (!v12)
      {
        if (strm.next_out)
        {
          do
          {
            v14 = deflate(&strm, 4);
            next_out = strm.next_out;
            objc_msgSend(v9, "appendBytes:length:", v19, strm.next_out - v19);
            v16 = next_out > v19 && v14 == -5;
            strm.avail_out = 0x4000;
            strm.next_out = v19;
          }
          while (v16 || v14 == 0);
          strm.avail_out = 0;
          strm.next_out = 0;
          deflateEnd(&strm);
          if (v14 != -5 && v14 != 1)
          {
            NSLog(CFSTR("deflate() failed: %s"), strm.msg);
            goto LABEL_21;
          }
        }
        else
        {
          deflateEnd(&strm);
        }
        v5 = v9;
        goto LABEL_22;
      }
      NSLog(CFSTR("deflate() failed: %s"), strm.msg);
    }
    deflateEnd(&strm);
LABEL_21:
    v5 = 0;
LABEL_22:

    goto LABEL_23;
  }
  NSLog(CFSTR("ERROR: unable to zip large data of size ~%.3f GB"), (double)(unint64_t)objc_msgSend(v4, "length") / 1000000000.0);
  v5 = 0;
LABEL_23:

  return v5;
}

- (uint64_t)SBKDataByDeflatingWithNoZipHeader
{
  return objc_msgSend(a1, "_SBKDataByDeflatingWithNoZipHeaderWithCompression:", 2);
}

- (id)SBKDataByInflatingWithGZip
{
  return (id)ISCopyDecompressedGZipDataForData();
}

- (id)SBKDataByDeflatingWithGZip
{
  return (id)ISCopyGzippedDataForData();
}

+ (id)SBKStringFromDigestData:()SBKAdditions
{
  id v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  char v9;
  void *v10;

  v3 = objc_retainAutorelease(a3);
  v4 = (char *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = 2 * v5;
  v7 = (char *)malloc_type_calloc(2 * v5, 1uLL, 0x100004077774924uLL);
  if (v5 >= 1)
  {
    v8 = v7 + 1;
    do
    {
      *(v8 - 1) = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)*v4 >> 4];
      v9 = *v4++;
      *v8 = MSVFastHexStringFromBytes_hexCharacters[v9 & 0xF];
      v8 += 2;
      --v5;
    }
    while (v5);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v6, 4, 1);

  return v10;
}

+ (__CFString)SBKStringByMD5HashingString:()SBKAdditions
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  ldiv_t v7;
  uint64_t v8;
  char *v9;
  const UInt8 *v10;
  unsigned __int8 *v11;
  char *v12;
  char *v13;
  uint64_t m;
  unsigned int v15;
  char *v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  unsigned __int8 *v24;
  char *v25;
  char *v26;
  uint64_t j;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t quot;
  lldiv_t v33;
  uint64_t v34;
  CFStringRef v35;
  unsigned __int8 *v36;
  char *v37;
  char *v38;
  uint64_t k;
  unsigned int v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  unsigned __int8 *v46;
  char *v47;
  char *v48;
  uint64_t i;
  unsigned int v50;
  char *v51;
  __CFString *v52;
  void *v54;
  void *v55;
  _BYTE v56[208];
  _BYTE v57[72];
  _OWORD v58[4];
  uint64_t v59;
  _QWORD v60[3];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(v56, 0, sizeof(v56));
  CC_MD5_Init((CC_MD5_CTX *)v56);
  v4 = objc_retainAutorelease(v3);
  CC_MD5_Update((CC_MD5_CTX *)v56, (const void *)objc_msgSend(v4, "UTF8String"), objc_msgSend(v4, "length"));

  memset(&v57[8], 0, 64);
  *(_QWORD *)v57 = 4000;
  CC_MD5_Final(&v57[8], (CC_MD5_CTX *)v56);
  v58[0] = *(_OWORD *)v57;
  v58[1] = *(_OWORD *)&v57[16];
  v58[2] = *(_OWORD *)&v57[32];
  v58[3] = *(_OWORD *)&v57[48];
  v59 = *(_QWORD *)&v57[64];
  if (*(uint64_t *)v57 > 3999)
  {
    if (*(uint64_t *)v57 > 4255)
    {
      if (*(_QWORD *)v57 == 4256)
      {
        v46 = (unsigned __int8 *)v58 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (i = 0; i != 64; i += 2)
        {
          v50 = *v46++;
          v51 = &v47[i];
          *v51 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v50 >> 4];
          v51[1] = MSVFastHexStringFromBytes_hexCharacters[v50 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x24BDD17C8]);
        v18 = v48;
        v19 = 64;
      }
      else
      {
        if (*(_QWORD *)v57 != 4512)
          goto LABEL_48;
        v24 = (unsigned __int8 *)v58 + 8;
        v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v26 = v25;
        for (j = 0; j != 128; j += 2)
        {
          v28 = *v24++;
          v29 = &v25[j];
          *v29 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v28 >> 4];
          v29[1] = MSVFastHexStringFromBytes_hexCharacters[v28 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x24BDD17C8]);
        v18 = v26;
        v19 = 128;
      }
    }
    else if (*(_QWORD *)v57 == 4000)
    {
      v36 = (unsigned __int8 *)v58 + 8;
      v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (k = 0; k != 32; k += 2)
      {
        v40 = *v36++;
        v41 = &v37[k];
        *v41 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v40 >> 4];
        v41[1] = MSVFastHexStringFromBytes_hexCharacters[v40 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      v18 = v38;
      v19 = 32;
    }
    else
    {
      if (*(_QWORD *)v57 != 4001)
        goto LABEL_48;
      v11 = (unsigned __int8 *)v58 + 8;
      v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v13 = v12;
      for (m = 0; m != 40; m += 2)
      {
        v15 = *v11++;
        v16 = &v12[m];
        *v16 = MSVFastHexStringFromBytes_hexCharacters[(unint64_t)v15 >> 4];
        v16[1] = MSVFastHexStringFromBytes_hexCharacters[v15 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      v18 = v13;
      v19 = 40;
    }
LABEL_45:
    v35 = (CFStringRef)objc_msgSend(v17, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v19, 4, 1, 4000, *(_QWORD *)v56);
    goto LABEL_46;
  }
  if (*(uint64_t *)v57 > 2999)
  {
    if (*(_QWORD *)v57 == 3000)
    {
      LODWORD(v60[0]) = bswap32(DWORD2(v58[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v43 = 0;
      v44 = v42 + 1;
      do
      {
        v45 = *((unsigned __int8 *)v60 + v43);
        *(v44 - 1) = MSVFastHexStringFromBytes_hexCharacters[v45 >> 4];
        *v44 = MSVFastHexStringFromBytes_hexCharacters[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      v18 = v42;
      v19 = 8;
    }
    else
    {
      if (*(_QWORD *)v57 != 3001)
        goto LABEL_48;
      v60[0] = bswap64(*((unint64_t *)&v58[0] + 1));
      v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v21 = 0;
      v22 = v20 + 1;
      do
      {
        v23 = *((unsigned __int8 *)v60 + v21);
        *(v22 - 1) = MSVFastHexStringFromBytes_hexCharacters[v23 >> 4];
        *v22 = MSVFastHexStringFromBytes_hexCharacters[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      v18 = v20;
      v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v57 == 1000)
  {
    v30 = *((_QWORD *)&v58[0] + 1);
    v31 = (char *)&v61 + 1;
    quot = *((_QWORD *)&v58[0] + 1);
    do
    {
      v33 = lldiv(quot, 10);
      quot = v33.quot;
      if (v33.rem >= 0)
        LOBYTE(v34) = v33.rem;
      else
        v34 = -v33.rem;
      *(v31 - 2) = v34 + 48;
      v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      v10 = (const UInt8 *)(v31 - 2);
    }
    v9 = (char *)((char *)&v61 - (char *)v10);
    goto LABEL_35;
  }
  if (*(_QWORD *)v57 != 2000)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 4000, *(_QWORD *)v56);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v52 = &stru_24E2A84D0;
    goto LABEL_47;
  }
  v5 = DWORD2(v58[0]);
  v6 = &v61;
  do
  {
    v7 = ldiv(v5, 10);
    v5 = v7.quot;
    if (v7.rem >= 0)
      LOBYTE(v8) = v7.rem;
    else
      v8 = -v7.rem;
    *((_BYTE *)v6 - 1) = v8 + 48;
    v6 = (uint64_t *)((char *)v6 - 1);
  }
  while (v7.quot);
  v9 = (char *)((char *)&v61 - (char *)v6);
  v10 = (const UInt8 *)v6;
LABEL_35:
  v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
  v52 = (__CFString *)v35;
LABEL_47:

  return v52;
}

@end
