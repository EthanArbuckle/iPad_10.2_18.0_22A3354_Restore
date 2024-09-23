@implementation OABOle

+ (id)readFromParentStorage:(SsrwOOStorage *)a3 storageName:(id)a4 cancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  SsrwOOStorage *v12;
  int8x8_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  SsrwOOStorage v21;
  void *v22;

  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v22 = 0;
  if (v11)
  {
    v12 = (SsrwOOStorage *)SsrwOOStorage::openStorage(a3, v11);
    if (v12)
    {
      SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)&v21);
      v22 = malloc_type_malloc(0x4000uLL, 0x7E9BD92FuLL);
      SsrwOORootStorage::createInBuf((SsrwOORootStorage *)&v21, &v22, 0x4000u, MEMORY[0x24BDAFAB0], v13);
      copyStorageToStorage(v12, &v21);
      v14 = SsrwOORootStorage::allocedSize((SsrwOORootStorage *)&v21);
      SsrwOORootStorage::close((SsrwOORootStorage *)&v21, 0);
      v15 = objc_alloc(MEMORY[0x24BDBCEC8]);
      v16 = (void *)objc_msgSend(v15, "initWithBytesNoCopy:length:freeWhenDone:", v22, v14, 0);
      objc_msgSend(a1, "readFromData:cancel:", v16, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)&v21);
      v18 = v22;
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
  }
  else
  {
    v18 = 0;
    v17 = 0;
    v12 = 0;
  }
  free(v18);
  if (v12)
  {
    SsrwOOStorage::close(v12, 0);
    SsrwOOStorage::~SsrwOOStorage(v12);
    MEMORY[0x22E2DD408]();
  }
  v19 = v17;

  return v19;
}

+ (id)readFromData:(id)a3 cancel:(id)a4
{
  id v6;
  id v7;
  OADOle *v8;
  OADOle *v9;
  id v10;
  char v11;
  EBReader *v12;
  EBReader *v13;
  void *v14;
  char v15;
  uint64_t v16;
  OADOle *v17;
  const void *v19;
  _DWORD v20[22];

  v6 = a3;
  v7 = a4;
  if (!((unint64_t)objc_msgSend(v6, "length") >> 32))
  {
    v9 = objc_alloc_init(OADOle);
    SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)v20);
    v19 = 0;
    v10 = objc_retainAutorelease(v6);
    SsrwOORootStorage::openInBuf((SsrwOORootStorage *)v20, &v19, objc_msgSend(v10, "length", objc_msgSend(v10, "bytes", 0)));
    v11 = objc_msgSend(a1, "readSharedInfoFor:fromStorage:", v9, v20);
    SsrwOORootStorage::close((SsrwOORootStorage *)v20, 0);
    SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)v20);
    if ((v11 & 1) != 0)
    {
      v12 = -[EBReader initWithCancelDelegate:]([EBReader alloc], "initWithCancelDelegate:", v7);
      -[OCDReader setData:](v12, "setData:", v6);
      if (-[EBReader start](v12, "start"))
      {
        v13 = v12;
        v20[0] = 0;
        if (-[OCBReader retainDecryptorWithErrorCode:](v13, "retainDecryptorWithErrorCode:", v20))
        {
          -[OCDEncryptedReader decryptor](v13, "decryptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isReadProtectedUsingDefaultPassphrase");

          if ((v15 & 1) == 0)
          {

            v8 = 0;
            v17 = (OADOle *)v13;
LABEL_13:

            goto LABEL_14;
          }
        }
        -[EBReader read](v13, "read");
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[OADOle setObject:](v9, "setObject:", v16);
LABEL_12:
          v17 = v9;
          v13 = (EBReader *)v16;
          v8 = v17;
          goto LABEL_13;
        }
      }
      else
      {

      }
    }

    v16 = 0;
    v9 = 0;
    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (id)readCompressedFromStream:(SsrwOOStream *)a3 compressedSize:(unsigned int)a4 uncompressedSize:(unsigned int)a5 cancel:(id)a6
{
  id v10;
  size_t v11;
  Bytef *v12;
  size_t v13;
  Bytef *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uInt v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  id v26;
  z_stream strm;
  uInt v28;

  v10 = a6;
  if (a4 >= 0x4000)
    v11 = 0x4000;
  else
    v11 = a4;
  v28 = v11;
  v12 = (Bytef *)malloc_type_malloc(v11, 0x6ADED809uLL);
  if (!v12)
  {
    v15 = 0;
    v22 = 0;
    v14 = 0;
LABEL_22:
    v23 = 1;
    goto LABEL_24;
  }
  if (a5 >= 0x4000)
    v13 = 0x4000;
  else
    v13 = a5;
  v14 = (Bytef *)malloc_type_malloc(v13, 0x7F5E63C1uLL);
  if (!v14)
  {
    v15 = 0;
    v22 = 0;
    goto LABEL_22;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", a5);
  v26 = a1;
  memset(&strm, 0, sizeof(strm));
  v16 = inflateInit_(&strm, "1.2.12", 112);
  strm.avail_in = 0;
  strm.next_out = v14;
  strm.avail_out = v13;
  if (!v16)
  {
    v17 = a4;
    do
    {
      if (!strm.avail_in)
      {
        v18 = v28;
        if (v17 - strm.total_in < v28)
        {
          v28 = v17 - LODWORD(strm.total_in);
          v18 = v17 - LODWORD(strm.total_in);
        }
        if (!v18)
          break;
        (*((void (**)(SsrwOOStream *, Bytef *, uInt *))a3->var0 + 7))(a3, v12, &v28);
        strm.next_in = v12;
        strm.avail_in = v28;
        if (!v28)
          break;
      }
      v19 = inflate(&strm, 0);
      v20 = (v13 - strm.avail_out);
      if ((int)v20 >= 1)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v14, v20, 0);
        objc_msgSend(v15, "appendData:", v21);

      }
      strm.next_out = v14;
      strm.avail_out = v13;
    }
    while (!v19);
  }
  v23 = 0;
  v22 = inflateEnd(&strm);
  a1 = v26;
LABEL_24:
  if (v12)
    free(v12);
  if (v14)
    free(v14);
  if (v23 | v22)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(a1, "readFromData:cancel:", v15, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

+ (BOOL)readSharedInfoFor:(id)a3 fromStorage:(SsrwOOStorage *)a4
{
  id v6;
  SsrwOOStgStream *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  if (!v6
    || SsrwOOStorage::getChildType(a4, +[OABOle readSharedInfoFor:fromStorage:]::compObjStreamName) != 2)
  {
    v12 = 0;
    goto LABEL_15;
  }
  v7 = SsrwOOStorage::openStream(a4, +[OABOle readSharedInfoFor:fromStorage:]::compObjStreamName);
  if ((*(unsigned int (**)(void))(*(_QWORD *)v7 + 176))() >= 0xC)
  {
    (*(void (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 80))(v7);
    (*(void (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 80))(v7);
    (*(void (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 104))(v7);
    (*(void (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 104))(v7);
    +[OABOle readCLSIDFromStream:](OABOle, "readCLSIDFromStream:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "setCLSID:", v8);
      objc_msgSend(a1, "readAnsiStringFromStream:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9
        || (objc_msgSend(v6, "setAnsiUserType:", v9),
            (*(unsigned int (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 176))(v7) < 4))
      {
        LOBYTE(v10) = 1;
LABEL_8:
        v11 = 1;
LABEL_9:

        goto LABEL_12;
      }
      v14 = (*(uint64_t (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 96))(v7);
      if (v14 == -2)
      {
        objc_msgSend(a1, "read4ByteFromStream:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_8;
        objc_msgSend(v6, "setMacClipboardFormat:", v10);
      }
      else
      {
        if (v14 == -1)
        {
          if ((*(unsigned int (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 176))(v7) < 4)
          {
            LOBYTE(v10) = 0;
            goto LABEL_8;
          }
          objc_msgSend(v6, "setWinClipboardFormat:", (*(uint64_t (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 104))(v7));
LABEL_26:
          if ((*(unsigned int (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 176))(v7) >= 4)
          {
            objc_msgSend(a1, "readAnsiStringFromStream:", v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setAnsiProgID:", v15);
            if ((*(unsigned int (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 176))(v7) >= 4
              && (*(unsigned int (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 104))(v7) == 1907505652)
            {
              objc_msgSend(a1, "readUnicodeStringFromStream:", v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setUnicodeUserType:", v16);
              objc_msgSend(a1, "readUnicodeStringFromStream:", v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setUnicodeClipboardFormatName:", v17);
              objc_msgSend(a1, "readUnicodeStringFromStream:", v7);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setUnicodeProgID:", v18);

            }
          }
          LOBYTE(v10) = 0;
          v11 = 0;
          goto LABEL_9;
        }
        (*(void (**)(SsrwOOStgStream *, uint64_t, uint64_t))(*(_QWORD *)v7 + 16))(v7, 4294967292, 1);
        objc_msgSend(a1, "readAnsiStringFromStream:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_8;
        objc_msgSend(v6, "setAnsiClipboardFormatName:", v10);
      }

      goto LABEL_26;
    }
  }
  LOBYTE(v10) = 0;
  v11 = 1;
LABEL_12:
  (*(void (**)(SsrwOOStgStream *, uint64_t))(*(_QWORD *)v7 + 152))(v7, 1);
  (*(void (**)(SsrwOOStgStream *))(*(_QWORD *)v7 + 8))(v7);
  if ((v11 | 2) == 2)
    v12 = 1;
  else
    v12 = (char)v10;
LABEL_15:

  return v12;
}

+ (id)readCLSIDFromStream:(SsrwOOStream *)a3
{
  uint64_t i;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 0x10)
    return 0;
  LODWORD(v7[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
  WORD2(v7[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 10))(a3);
  HIWORD(v7[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 10))(a3);
  for (i = 8; i != 16; ++i)
    *((_BYTE *)v7 + i) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 8))(a3);
  objc_msgSend(a1, "stringForCLSID:", v7[0], v7[1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForCLSID:(_SsrwOO_GUID)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%08X-%04hX-%04hX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX"), *(_QWORD *)&a3.var0, a3.var1, a3.var2, a3.var3[0], a3.var3[1], a3.var3[2], a3.var3[3], a3.var3[4], a3.var3[5], a3.var3[6], a3.var3[7]);
}

+ (BOOL)isChart:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "CLSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(a1, "isBiffCLSID:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isBiffCLSID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = a3;
  v4 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
  if (!+[OABOle isBiffCLSID:]::biffClassIds)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("00020820-0000-0000-C000-000000000046"), CFSTR("00020803-0000-0000-C000-000000000046"), CFSTR("00020821-0000-0000-C000-000000000046"), CFSTR("00020801-0000-0000-C000-000000000046"), 0);
    v6 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
    +[OABOle isBiffCLSID:]::biffClassIds = v5;

    v4 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
  }
  v7 = objc_msgSend(v4, "containsObject:", v3);

  return v7;
}

+ (id)readAnsiStringFromStream:(SsrwOOStream *)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 4)
    return 0;
  v4 = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
  if (!v4)
    return &stru_24F3BFFF8;
  v5 = v4;
  if ((*((unsigned int (**)(SsrwOOStream *))a3->var0 + 22))(a3) < v4)
    return 0;
  v7 = operator new[]();
  v9 = v5;
  (*((void (**)(SsrwOOStream *, uint64_t, unsigned int *))a3->var0 + 7))(a3, v7, &v9);
  *(_BYTE *)(v7 + v5) = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
  MEMORY[0x22E2DD3F0](v7, 0x1000C8077774924);
  return v8;
}

+ (id)readUnicodeStringFromStream:(SsrwOOStream *)a3
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _WORD *v11;
  void *v12;

  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 4)
    return 0;
  v4 = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
  if (!v4)
    return &stru_24F3BFFF8;
  v5 = v4;
  if ((*((unsigned int (**)(SsrwOOStream *))a3->var0 + 22))(a3) < v4)
    return 0;
  v7 = v5 & 0xFFFFFFFE;
  v8 = operator new[]();
  v9 = v8;
  if (v5 >= 2)
  {
    v10 = v5 >> 1;
    v11 = (_WORD *)v8;
    do
    {
      *v11++ = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 10))(a3);
      --v10;
    }
    while (v10);
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v9, (int)(v7 - 2), 10);
  MEMORY[0x22E2DD3F0](v9, 0x1000C80BDFB0063);
  return v12;
}

+ (id)readFromStream:(SsrwOOStream *)a3 size:(unsigned int)a4 cancel:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v13;

  v8 = a5;
  v9 = malloc_type_malloc(a4, 0x55546099uLL);
  v13 = a4;
  (*((void (**)(SsrwOOStream *, void *, unsigned int *))a3->var0 + 7))(a3, v9, &v13);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, a4, 1);
  objc_msgSend(a1, "readFromData:cancel:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)read4ByteFromStream:(SsrwOOStream *)a3
{
  uint64_t i;
  _BYTE v6[5];

  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 4)
    return 0;
  for (i = 3; i != -1; --i)
    v6[i] = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 8))(a3);
  v6[4] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v6);
}

+ (id)readFromFileName:(id)a3 cancel:(id)a4
{
  NSString *v6;
  id v7;
  OADOle *v8;
  EBReader *v9;
  EBReader *v10;
  void *v11;
  char v12;
  uint64_t v13;
  OADOle *v14;
  OADOle *v15;
  void *v16;
  _QWORD v18[11];

  v6 = (NSString *)a3;
  v7 = a4;
  v8 = objc_alloc_init(OADOle);
  SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)v18);
  SsrwOORootStorage::open(v18, -[NSString fileSystemRepresentation](objc_retainAutorelease(v6), "fileSystemRepresentation"), 0);
  LOBYTE(a1) = objc_msgSend(a1, "readSharedInfoFor:fromStorage:", v8, v18);
  SsrwOORootStorage::close((SsrwOORootStorage *)v18, 0);
  SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)v18);
  if ((a1 & 1) == 0)
    goto LABEL_9;
  v9 = -[EBReader initWithCancelDelegate:]([EBReader alloc], "initWithCancelDelegate:", v7);
  -[OCDReader setFileName:](v9, "setFileName:", v6);
  if (!-[EBReader start](v9, "start"))
  {

    goto LABEL_9;
  }
  v10 = v9;
  LODWORD(v18[0]) = 0;
  if (!-[OCBReader retainDecryptorWithErrorCode:](v10, "retainDecryptorWithErrorCode:", v18)
    || (-[OCDEncryptedReader decryptor](v10, "decryptor"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isReadProtectedUsingDefaultPassphrase"),
        v11,
        (v12 & 1) != 0))
  {
    -[EBReader read](v10, "read");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADOle setObject:](v8, "setObject:", v13);
LABEL_10:
      v15 = v8;
      v10 = (EBReader *)v13;
      v14 = v15;
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeItemAtPath:error:", v6, 0);

    v13 = 0;
    goto LABEL_10;
  }

  TCRemoveFileSecurely(v6);
  v14 = 0;
  v15 = (OADOle *)v10;
LABEL_11:

  return v14;
}

@end
