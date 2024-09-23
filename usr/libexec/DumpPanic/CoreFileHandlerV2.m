@implementation CoreFileHandlerV2

- (BOOL)isZeroes:(id)a3
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  BOOL v6;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    while (1)
    {
      v6 = v4[v5] == 0;
      if (v4[v5])
        break;
      if (++v5 >= (unint64_t)objc_msgSend(v3, "length"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 1;
  }

  return v6;
}

- (CoreFileHandlerV2)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5
{
  CoreFileHandlerV2 *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  CoreFileHandlerV2 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSData *headerData;
  mach_core_fileheader_v2 *corefileHeader;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t pub_key_offset;
  unsigned int pub_key_length;
  NSObject *v28;
  mach_core_fileheader_v2 *v29;
  uint64_t v30;
  NSData **p_encryptionPublicKey;
  NSData *encryptionPublicKey;
  NSObject *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  unint64_t corefileSize;
  NSData *v42;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t flags;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  _BYTE v57[18];
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = -[CoreFileHandler initWithCoreFilePath::::::](self, "initWithCoreFilePath::::::", a3, a4, a5, 0x63614D2073736F42, &v50, 64);
  if (!v5)
    goto LABEL_39;
  v6 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v55 = *((_QWORD *)&v53 + 1);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "opened corefile, header indicates %llu files present", buf, 0xCu);
  }
  v7 = *((_QWORD *)&v51 + 1);
  v8 = (unsigned __int16)v52;
  if (__CFADD__(*((_QWORD *)&v51 + 1), (unsigned __int16)v52)
    || (v9 = v5->super._corefileSize, *((_QWORD *)&v51 + 1) + (unint64_t)(unsigned __int16)v52 > v9))
  {
    v10 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      corefileSize = v5->super._corefileSize;
      *(_DWORD *)buf = 134218496;
      v55 = v7;
      v56 = 1024;
      *(_DWORD *)v57 = v8;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = corefileSize;
      v37 = "Corefile corrupted. Public key (offset %llu, length %hu) extends past end of file (length %zu).";
      v38 = v10;
      v39 = 28;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  v13 = *((_QWORD *)&v52 + 1);
  v12 = v53;
  if (__CFADD__(*((_QWORD *)&v52 + 1), (_QWORD)v53) || *((_QWORD *)&v52 + 1) + (_QWORD)v53 > v9)
  {
    v36 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v55 = v13;
      v56 = 2048;
      *(_QWORD *)v57 = v12;
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = v9;
      v37 = "Corefile corrupted. Log (offset %llu, length %llu) extends past end of file (length %zu).";
      v38 = v36;
      v39 = 32;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  v14 = *((_QWORD *)&v53 + 1);
  v15 = 40 * *((_QWORD *)&v53 + 1) + 64;
  if (!is_mul_ok(*((unint64_t *)&v53 + 1), 0x28uLL)
    || (unint64_t)(40 * *((_QWORD *)&v53 + 1)) >= 0xFFFFFFFFFFFFFFC0
    || v15 > v9)
  {
    v40 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      v55 = 64;
      v56 = 2048;
      *(_QWORD *)v57 = v14;
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = 40;
      v58 = 2048;
      v59 = v9;
      v37 = "Corefile corrupted. Header (size %zu) and %llu file headers (each of size %zu) extend past end of file (length %zu).";
      v38 = v40;
      v39 = 42;
      goto LABEL_36;
    }
    goto LABEL_7;
  }
  v16 = objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpContentsWithOffset:AndLength:](v5, "getCoreDumpContentsWithOffset:AndLength:", 0, 40 * *((_QWORD *)&v53 + 1) + 64));
  headerData = v5->_headerData;
  v5->_headerData = (NSData *)v16;

  corefileHeader = -[NSData bytes](v5->_headerData, "bytes");
  v5->_corefileHeader = corefileHeader;
  v19 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v55 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Successfully read %llu bytes for the corefile headers", buf, 0xCu);
    corefileHeader = v5->_corefileHeader;
  }
  if (!corefileHeader->num_files)
  {
LABEL_22:
    pub_key_offset = corefileHeader->pub_key_offset;
    if (pub_key_offset && (pub_key_length = corefileHeader->pub_key_length) != 0)
    {
      v28 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Reading public encryption key from corefile", buf, 2u);
        v29 = v5->_corefileHeader;
        pub_key_offset = v29->pub_key_offset;
        pub_key_length = v29->pub_key_length;
      }
      v30 = objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpContentsWithOffset:AndLength:](v5, "getCoreDumpContentsWithOffset:AndLength:", pub_key_offset, pub_key_length));
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
      encryptionPublicKey = v5->_encryptionPublicKey;
      v5->_encryptionPublicKey = (NSData *)v30;

      v33 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v5->_corefileHeader->pub_key_length;
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Successfully read %hu bytes for the public encryption key", buf, 8u);
      }
      if (!-[CoreFileHandlerV2 isZeroes:](v5, "isZeroes:", *p_encryptionPublicKey))
      {
        flags = v5->_corefileHeader->flags;
        if ((flags & 0x100) == 0)
        {
          v49 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v55 = flags;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
          }
          v11 = 0;
          v5->super._zero_on_close = 0;
          goto LABEL_40;
        }
LABEL_39:
        v11 = v5;
        goto LABEL_40;
      }
      v35 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Public encryption key is empty. Corefile is not encrypted", buf, 2u);
      }
    }
    else
    {
      p_encryptionPublicKey = &v5->_encryptionPublicKey;
    }
    v42 = *p_encryptionPublicKey;
    *p_encryptionPublicKey = 0;

    goto LABEL_39;
  }
  v20 = 0;
  v21 = 0;
  while (1)
  {
    if (strnlen((const char *)&corefileHeader[1].pub_key_offset + v20, 0x10uLL) == 16)
    {
      v44 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      *(_DWORD *)buf = 134217984;
      v55 = v21;
      v37 = "Corefile corrupted. File %zu's name was not terminated.";
LABEL_45:
      v38 = v44;
      v39 = 12;
      goto LABEL_36;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (char *)&corefileHeader[1].pub_key_offset + v20));

    if (!v22)
    {
      v44 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      *(_DWORD *)buf = 134217984;
      v55 = v21;
      v37 = "Corefile corrupted. File %zu's name is not a valid string.";
      goto LABEL_45;
    }
    v23 = (char *)corefileHeader + v20;
    v25 = *(_QWORD *)((char *)&corefileHeader[1].version + v20);
    v24 = *(uint64_t *)((char *)&corefileHeader[1].flags + v20);
    if (__CFADD__(v25, v24))
      goto LABEL_47;
    if (v25 + v24 > v5->super._corefileSize)
      break;
    ++v21;
    corefileHeader = v5->_corefileHeader;
    v20 += 40;
    if (v21 >= corefileHeader->num_files)
      goto LABEL_22;
  }
  v23 = (char *)corefileHeader + v20;
LABEL_47:
  v45 = v23 + 88;
  v46 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    v47 = v5->super._corefileSize;
    *(_DWORD *)buf = 134219010;
    v55 = v21;
    v56 = 2080;
    *(_QWORD *)v57 = v45;
    *(_WORD *)&v57[8] = 2048;
    *(_QWORD *)&v57[10] = v25;
    v58 = 2048;
    v59 = v24;
    v60 = 2048;
    v61 = v47;
    v37 = "Corefile corrupted. File %zu's (name %s, offset %llu, length %llu) extends past end of file (length %zu).";
    v38 = v46;
    v39 = 52;
LABEL_36:
    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
  }
LABEL_7:
  v11 = 0;
LABEL_40:

  return v11;
}

- (id)getCorefileZeroRanges
{
  return &off_100037BD0;
}

- (unint64_t)getNumCoreDumps
{
  return self->_corefileHeader->num_files;
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  mach_core_fileheader_v2 *corefileHeader;
  const char *result;
  uint64_t v5;

  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files > a3)
    return (const char *)(&corefileHeader[1].pub_key_offset + 5 * a3);
  v5 = _os_assert_log(0);
  result = (const char *)_os_crash(v5);
  __break(1u);
  return result;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  mach_core_fileheader_v2 *corefileHeader;
  uint64_t *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;

  corefileHeader = self->_corefileHeader;
  if (corefileHeader->num_files <= a3)
  {
    v12 = _os_assert_log(0);
    _os_crash(v12);
    __break(1u);
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    v13 = _os_assert_log(0);
    _os_crash(v13);
    __break(1u);
    goto LABEL_17;
  }
  if (!a5)
  {
LABEL_17:
    v14 = _os_assert_log(0);
    _os_crash(v14);
    __break(1u);
LABEL_18:
    v15 = _os_assert_log(0);
    _os_crash(v15);
    __break(1u);
  }
  if (!a6)
    goto LABEL_18;
  v7 = &corefileHeader->signature + 5 * a3;
  v8 = v7[8];
  *a4 = v7[9];
  *a5 = v7[10];
  *a6 = 0;
  if ((v8 & 0x100) != 0)
  {
    v9 = 5;
    v10 = 1;
    goto LABEL_11;
  }
  if ((v8 & 0x200) != 0)
  {
    v9 = 6;
    v10 = 2;
LABEL_11:
    *a6 = v10;
    if ((v8 & 1) == 0)
      return;
    goto LABEL_12;
  }
  v9 = 4;
  if ((v8 & 1) == 0)
    return;
LABEL_12:
  flags = corefileHeader->flags;
  if ((flags & 0x100) == 0)
  {
    v16 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v20 = flags;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be implemented"), "Encryption key format"));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v17, 0));

    objc_exception_throw(v18);
  }
  *a6 = v9;
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  mach_core_fileheader_v2 *corefileHeader;
  uint64_t log_length;
  uint64_t flags;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;

  if (!a3)
  {
    v9 = _os_assert_log(0);
    _os_crash(v9);
    __break(1u);
LABEL_9:
    v10 = _os_assert_log(0);
    _os_crash(v10);
    __break(1u);
  }
  if (!a4)
    goto LABEL_9;
  corefileHeader = self->_corefileHeader;
  *a4 = corefileHeader->log_length;
  log_length = corefileHeader->log_length;
  if (log_length)
  {
    *a3 = corefileHeader->log_offset;
    *a5 = 0;
    flags = corefileHeader->flags;
    if ((flags & 1) != 0)
    {
      if ((flags & 0x100) == 0)
      {
        v11 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v15 = flags;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unsupported encryption key format in corefile flags: %llu", buf, 0xCu);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be implemented"), "Encryption key format"));
        v13 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v12, 0));

        objc_exception_throw(v13);
      }
      *a5 = 4;
    }
  }
  return log_length != 0;
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  id result;
  uint64_t v4;

  if (self->_corefileHeader->num_files > a3)
    return self->_encryptionPublicKey;
  v4 = _os_assert_log(0);
  result = (id)_os_crash(v4);
  __break(1u);
  return result;
}

- (id)getCorefileLogEncryptionKey
{
  return self->_encryptionPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);
  objc_storeStrong((id *)&self->_headerData, 0);
}

@end
