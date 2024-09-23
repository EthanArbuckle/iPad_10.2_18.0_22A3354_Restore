@implementation NSData(SafariCoreExtras)

- (id)safari_dataByCompressingData
{
  id v2;
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  z_stream v8;

  if (objc_msgSend(a1, "length"))
  {
    v2 = objc_retainAutorelease(a1);
    v8.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    v3 = 0;
    if (!deflateInit_(&v8, 9, "1.2.12", 112))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", deflateBound(&v8, objc_msgSend(v2, "length")));
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8.next_out = (Bytef *)objc_msgSend(v4, "mutableBytes");
      v8.avail_out = objc_msgSend(v4, "length");
      v5 = deflate(&v8, 4);
      deflateEnd(&v8);
      if (v5 == 1)
      {
        v6 = objc_msgSend(v4, "length");
        objc_msgSend(v4, "setLength:", v6 - v8.avail_out);
        v3 = v4;
      }
      else
      {
        v3 = 0;
      }

    }
    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)safari_dataByDecompressingData
{
  id v2;
  id v3;
  void *v4;
  z_stream strm;
  _BYTE v7[65536];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "length"))
  {
    memset(&strm.avail_in, 0, 104);
    v2 = objc_retainAutorelease(a1);
    strm.next_in = (Bytef *)objc_msgSend(v2, "bytes");
    strm.avail_in = objc_msgSend(v2, "length");
    v3 = 0;
    if (!inflateInit_(&strm, "1.2.12", 112))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        strm.avail_out = 0x10000;
        strm.next_out = v7;
        if (inflate(&strm, 0) >= 2)
          break;
        objc_msgSend(v4, "appendBytes:length:", v7, 0x10000 - strm.avail_out);
        if (strm.avail_out)
        {
          inflateEnd(&strm);
          v3 = v4;
          goto LABEL_9;
        }
      }
      inflateEnd(&strm);
      v3 = 0;
LABEL_9:

    }
    return v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)safari_dataAppearsToBeCompressed
{
  unsigned __int16 v3;

  if ((unint64_t)objc_msgSend(a1, "length") >= 2
    && (objc_msgSend(a1, "getBytes:length:", &v3, 2), (v3 & 0x8F) == 8))
  {
    return (unsigned __int16)(31711 * (bswap32(v3) >> 16)) < 0x843u;
  }
  else
  {
    return 0;
  }
}

- (uint64_t)safari_hashMD5
{
  id v1;
  unsigned __int8 md[8];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  if (v4 >= 0)
    return v4;
  else
    return -v4;
}

- (id)safari_SHA1Hash
{
  id v1;
  void *v2;
  unsigned __int8 md[20];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = CC_SHA1((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)safari_scryptHashWithSalt:()SafariCoreExtras N:r:p:keyLength:
{
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  WBSScopeExitHandler *v22;
  _QWORD v23[6];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = ccscrypt_storage_size();
  if (v13 <= 0)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349568;
      v25 = a4;
      v26 = 1026;
      v27 = a5;
      v28 = 1026;
      v29 = a6;
      _os_log_error_impl(&dword_1B2621000, v20, OS_LOG_TYPE_ERROR, "Invalid scrypt parameters N: %{public}llu, r: %{public}u, p: %{public}u.", buf, 0x18u);
    }
    v19 = 0;
  }
  else
  {
    v14 = malloc_type_malloc(v13, 0x26C1784BuLL);
    v15 = malloc_type_malloc(a7, 0x3DD5B4F7uLL);
    v23[1] = 3221225472;
    v23[2] = __70__NSData_SafariCoreExtras__safari_scryptHashWithSalt_N_r_p_keyLength___block_invoke;
    v23[3] = &__block_descriptor_48_e5_v8__0l;
    v23[4] = v14;
    v23[5] = v15;
    v22 = objc_alloc_init(WBSScopeExitHandler);
    v23[0] = MEMORY[0x1E0C809B0];
    -[WBSScopeExitHandler setHandler:](v22, "setHandler:", v23);
    objc_msgSend(a1, "length");
    objc_msgSend(objc_retainAutorelease(a1), "bytes");
    objc_msgSend(v12, "length");
    objc_msgSend(objc_retainAutorelease(v12), "bytes");
    v16 = ccscrypt();
    if (v16)
    {
      v17 = v16;
      v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[NSData(SafariCoreExtras) safari_scryptHashWithSalt:N:r:p:keyLength:].cold.1(v17, v18);
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, a7, a7, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v19;
}

- (id)safari_descriptionWithoutSpaces
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "safari_stringAsHexWithData:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_dataByAppendingData:()SafariCoreExtras
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "appendData:", v4);

  return v5;
}

+ (id)safari_dataWithHexString:()SafariCoreExtras
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  char v12;
  char __str[3];

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("0123456789abcdefABCDEF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "UTF8String");
  if (objc_msgSend(v9, "length") != 1)
  {
    v10 = 0;
    do
    {
      __strlcpy_chk();
      v12 = 0;
      v12 = strtol(__str, 0, 16);
      objc_msgSend(v8, "appendBytes:length:", &v12, 1);
      v10 += 2;
    }
    while (v10 < objc_msgSend(v9, "length") - 1);
  }

  return v8;
}

- (void)safari_scryptHashWithSalt:()SafariCoreExtras N:r:p:keyLength:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B2621000, a2, OS_LOG_TYPE_ERROR, "Scrypt failed with error: %{public}d", (uint8_t *)v2, 8u);
}

@end
