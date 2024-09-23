@implementation CoreFileHandler

- (CoreFileHandler)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(unint64_t)a6 :(void *)a7 :(unint64_t)a8
{
  id v14;
  CoreFileHandler *v15;
  CoreFileHandler *v16;
  void *v17;
  ReadOnlyKeyStore *v18;
  LockedReadOnlyKeyStore *v19;
  ReadOnlyKeyStore *keystore;
  uint64_t v21;
  NSString *corefilePath;
  int v23;
  size_t v24;
  void *v25;
  void *v26;
  ssize_t v27;
  unint64_t v28;
  NSObject *v29;
  CoreFileHandler *v30;
  void *v31;
  NSString *v32;
  NSObject *v33;
  int v34;
  const char *v35;
  uint8_t *v36;
  void *v37;
  unint64_t v38;
  int v39;
  ssize_t v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  NSObject *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  stat v54;

  v14 = a5;
  v49.receiver = self;
  v49.super_class = (Class)CoreFileHandler;
  v15 = -[CoreFileHandler init](&v49, "init");
  v16 = v15;
  if (!v15)
    goto LABEL_29;
  v15->_scratchBufSize = 0x100000;
  v17 = malloc_type_aligned_alloc(vm_page_size, 0x100000uLL, 0x34CE2CF8uLL);
  v16->_scratchBuf = v17;
  if (!v17)
  {
    v47 = _os_assert_log(0);
    v25 = (void *)_os_crash(v47);
    __break(1u);
LABEL_34:
    v48 = _os_assert_log(v25);
    _os_crash(v48);
    __break(1u);
  }
  if (v14)
  {
    v18 = (ReadOnlyKeyStore *)v14;
  }
  else
  {
    v19 = [LockedReadOnlyKeyStore alloc];
    v18 = -[ReadOnlyKeyStore init:](v19, "init:", qword_10003A5A8);
  }
  keystore = v16->_keystore;
  v16->_keystore = v18;

  v16->_zero_on_close = a4;
  v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  corefilePath = v16->_corefilePath;
  v16->_corefilePath = (NSString *)v21;

  v23 = open_dprotected_np(-[NSString UTF8String](v16->_corefilePath, "UTF8String"), 0, 0, 2);
  v16->_corefile_fd = v23;
  if (v23 == -1)
  {
    v31 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      v32 = v16->_corefilePath;
      v33 = v31;
      v34 = *__error();
      v54.st_dev = 138412546;
      *(_QWORD *)&v54.st_mode = v32;
      WORD2(v54.st_ino) = 1024;
      *(_DWORD *)((char *)&v54.st_ino + 6) = v34;
      v35 = "open_dprotected_np(%@, O_RDONLY): -1 (%{errno}d)";
      v36 = (uint8_t *)&v54;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v35, v36, 0x12u);

    }
LABEL_29:
    v30 = 0;
    goto LABEL_30;
  }
  memset(&v54, 0, sizeof(v54));
  if (fstat(v23, &v54) == -1)
  {
    v37 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      v38 = (unint64_t)v16->_corefilePath;
      v33 = v37;
      v39 = *__error();
      *(_DWORD *)buf = 138412546;
      v51 = v38;
      v52 = 1024;
      LODWORD(v53) = v39;
      v35 = "stat(%@): -1 (%{errno}d)";
      v36 = buf;
      goto LABEL_18;
    }
    goto LABEL_29;
  }
  v16->_corefileSize = v54.st_size;
  v24 = (a8 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  v25 = malloc_type_aligned_alloc(vm_page_size, v24, 0xE0E8F204uLL);
  if (!v25)
    goto LABEL_34;
  v26 = v25;
  v27 = read(v16->_corefile_fd, v25, v24);
  if (v27 != v24)
  {
    v40 = v27;
    v41 = qword_10003A5A8;
    v42 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v40 == -1)
    {
      if (v42)
      {
        v45 = v41;
        v46 = *__error();
        *(_DWORD *)buf = 134218240;
        v51 = v24;
        v52 = 1024;
        LODWORD(v53) = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "failed to read header from corefile (%zd bytes) with error: %{errno}d", buf, 0x12u);

      }
    }
    else if (v42)
    {
      *(_DWORD *)buf = 134218240;
      v51 = v24;
      v52 = 2048;
      v53 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Read of %lu bytes from fileoffset 0 only read %lu bytes", buf, 0x16u);
    }
    free(v26);
    goto LABEL_28;
  }
  memmove(a7, v26, a8);
  free(v26);
  v28 = *(_QWORD *)a7;
  if (*(_QWORD *)a7 != a6)
  {
    v43 = qword_10003A5A8;
    if (v28)
    {
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v51 = v28;
        v52 = 2048;
        v53 = a6;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "invalid core file signature: %#llx (expected :%#llx)", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "no core file data found", buf, 2u);
    }
LABEL_28:
    close(v16->_corefile_fd);
    goto LABEL_29;
  }
  v29 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v51 = a6;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found corefile with signature %#llx", buf, 0xCu);
  }
  v30 = v16;
LABEL_30:

  return v30;
}

- (void)dealloc
{
  CoreFileHandler *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  size_t v18;
  ssize_t v19;
  ssize_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  int v29;
  NSString *corefilePath;
  NSObject *v31;
  int v32;
  uint64_t v33;
  void *v34;
  CoreFileHandler *v35;
  objc_super v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  size_t v42;
  __int16 v43;
  ssize_t v44;
  _BYTE v45[128];

  v2 = self;
  close(self->_corefile_fd);
  free(v2->_scratchBuf);
  if (v2->_zero_on_close)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCorefileZeroRanges](v2, "getCorefileZeroRanges"));
    v4 = malloc_type_calloc(1uLL, 0x100000uLL, 0x57CD57BEuLL);
    if (!v4)
    {
      v33 = _os_assert_log(0);
      _os_crash(v33);
      __break(1u);
    }
    v5 = v4;
    v6 = open_dprotected_np(-[NSString UTF8String](v2->_corefilePath, "UTF8String"), 2, 0, 0);
    if (v6 == -1)
    {
      v27 = (void *)qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        corefilePath = v2->_corefilePath;
        v31 = v27;
        v32 = *__error();
        *(_DWORD *)buf = 138412546;
        v42 = (size_t)corefilePath;
        v43 = 1024;
        LODWORD(v44) = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "open_dprotected_np(%@, O_RDWR): -1 (%{errno}d)", buf, 0x12u);

      }
      free(v5);
    }
    else
    {
      v7 = v6;
      v35 = v2;
      fcntl(v6, 48, 1);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v34 = v3;
      v8 = v3;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
            v15 = objc_msgSend(v14, "unsignedLongLongValue");

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
            v17 = (unint64_t)objc_msgSend(v16, "unsignedLongLongValue");

            if (lseek(v7, (off_t)v15, 0) == -1)
            {
              v25 = (void *)qword_10003A5A8;
              if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
              {
                v28 = v25;
                v29 = *__error();
                *(_DWORD *)buf = 134218240;
                v42 = (size_t)v15;
                v43 = 1024;
                LODWORD(v44) = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "lseek() to file offset 0x%llx returned -1 (%{errno}d)", buf, 0x12u);

              }
              goto LABEL_27;
            }
            if (v17)
            {
              while (1)
              {
                v18 = v17 >= 0x100000 ? 0x100000 : v17;
                v19 = write(v7, v5, v18);
                if (v19 != v18)
                  break;
                v17 -= v18;
                if (!v17)
                  goto LABEL_22;
              }
              v20 = v19;
              v21 = qword_10003A5A8;
              v22 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
              if (v20 == -1)
              {
                if (v22)
                {
                  v23 = v21;
                  v24 = *__error();
                  *(_DWORD *)buf = 134218240;
                  v42 = v18;
                  v43 = 1024;
                  LODWORD(v44) = v24;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "error zeroing corefile: write(%zu): (%{errno}d)", buf, 0x12u);

                }
              }
              else if (v22)
              {
                *(_DWORD *)buf = 134218240;
                v42 = v18;
                v43 = 2048;
                v44 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error zeroing corefile, attempted to write %zu bytes, wrote %zu bytes", buf, 0x16u);
              }
            }
LABEL_22:
            ;
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_27:

      fsync(v7);
      close(v7);
      free(v5);
      v26 = qword_10003A5A8;
      v3 = v34;
      v2 = v35;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "erased corefile contents", buf, 2u);
      }
    }

  }
  v36.receiver = v2;
  v36.super_class = (Class)CoreFileHandler;
  -[CoreFileHandler dealloc](&v36, "dealloc");
}

- (id)getCoreDumpContentsWithOffset:(unint64_t)a3 AndLength:(unint64_t)a4
{
  NSObject *v4;
  NSObject *v8;
  char *v9;
  unint64_t v10;
  size_t v11;
  ssize_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  ssize_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v23;
  int v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  ssize_t v34;

  v4 = qword_10003A5A8;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "getCoreDumpContentsWithOffset called with zero length", buf, 2u);
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "copying %llu bytes", buf, 0xCu);
  }
  if (lseek(self->_corefile_fd, a3, 0) != -1)
  {
    v8 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", a4));
    v9 = (char *)-[NSObject mutableBytes](v8, "mutableBytes");
    v10 = 0;
    while (1)
    {
      v11 = self->_scratchBufSize >= ((a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size)
          ? (a4 - v10 + vm_page_size - 1) & -(uint64_t)vm_page_size
          : self->_scratchBufSize;
      v12 = read(self->_corefile_fd, self->_scratchBuf, v11);
      if (v12 != v11)
        break;
      if (v11 >= a4 - v10)
        v11 = a4 - v10;
      memmove(v9, self->_scratchBuf, v11);
      v10 += v11;
      v9 += v11;
      if (v10 >= a4)
      {
        v13 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v26 = a3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished extracting core file data from file offset %llu\n", buf, 0xCu);
        }
        return v8;
      }
    }
    v19 = v12;
    v20 = qword_10003A5A8;
    v21 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v19 == -1)
    {
      if (v21)
      {
        v23 = v20;
        v24 = *__error();
        *(_DWORD *)buf = 134219008;
        v26 = v11;
        v27 = 2048;
        v28 = v10;
        v29 = 2048;
        v30 = a3;
        v31 = 2048;
        v32 = a4;
        v33 = 1024;
        LODWORD(v34) = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) failed with error %{errno}d", buf, 0x30u);

      }
      goto LABEL_25;
    }
    if (!v21)
      goto LABEL_25;
    *(_DWORD *)buf = 134219008;
    v26 = v11;
    v27 = 2048;
    v28 = v10;
    v29 = 2048;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    v33 = 2048;
    v34 = v19;
    v16 = "Read of %lu bytes from dataOffset %llu (file offset from %llu)(total length %llu) only read %lu bytes";
    v17 = v20;
    v18 = 52;
LABEL_22:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
LABEL_25:

    goto LABEL_26;
  }
  v14 = (void *)qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    v8 = v14;
    v15 = *__error();
    *(_DWORD *)buf = 134218240;
    v26 = a3;
    v27 = 1024;
    LODWORD(v28) = v15;
    v16 = "lseek() to file offset 0x%llx returned -1 (%{errno}d)";
    v17 = v8;
    v18 = 18;
    goto LABEL_22;
  }
LABEL_26:
  v8 = 0;
  return v8;
}

- (BOOL)saveCoreDumpAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 named:(id)a5 encryptedWithPublicKey:(id)a6 toFileName:(id)a7 flags:(unsigned int)a8
{
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  char v18;
  id v19;
  id v20;
  int corefile_fd;
  unint64_t scratchBufSize;
  void *scratchBuf;
  _QWORD *v24;
  _QWORD *v25;
  AAByteStream_impl *v26;
  AAByteStream_impl *v27;
  AAByteStream_impl *v28;
  AAByteStream *v29;
  AAByteStream_impl *v30;
  void *v31;
  AAByteStream_impl *v32;
  unsigned int v33;
  const char *v34;
  const char *v35;
  gzFile *v36;
  gzFile *v37;
  gzFile v38;
  AAByteStream_impl *v39;
  AAByteStream_impl *v40;
  AAByteStream_impl *v41;
  AAByteStream_impl *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  NSObject *v48;
  BOOL v49;
  void *v51;
  void *v52;
  id v53;
  AEAContext *v54;
  AEAContext *v55;
  AEAContext v56;
  AEAContext_impl *v57;
  int v58;
  AAByteStream v59;
  AAByteStream_impl *v60;
  _QWORD *v61;
  _QWORD *v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  AAByteStream v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  char v74;
  NSObject *v75;
  const char *v76;
  NSObject *v77;
  const char *v78;
  NSObject *v79;
  const char *v80;
  NSObject *v81;
  int v82;
  NSObject *v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  const char *v87;
  NSObject *v88;
  const char *v89;
  int v90;
  int v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  AAByteStream_impl *v95;
  NSObject *v96;
  NSObject *v97;
  int *v98;
  char *v99;
  NSObject *v100;
  int *v101;
  char *v102;
  NSObject *v103;
  int *v104;
  char *v105;
  id v106;
  id v107;
  os_log_t log;
  NSObject *loga;
  AAByteStream_impl *v110;
  AAByteStream_impl *v111;
  AAByteStream_impl *v112;
  int v113;
  uint8_t buf[4];
  unint64_t v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  unint64_t v119;
  __int16 v120;
  unsigned int v121;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v115 = (unint64_t)v14;
    v116 = 2048;
    v117 = a3;
    v118 = 2048;
    v119 = a4;
    v120 = 1024;
    v121 = a8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %@: offset: 0x%llx, length: 0x%llx, flags: 0x%x. Writing to disk", buf, 0x26u);
  }
  v18 = a8;
  if ((a8 & 1) != 0)
  {
    v43 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v44 = "On-disk zlib-compressed cores are not supported.";
LABEL_50:
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_32;
  }
  v110 = 0;
  v111 = 0;
  if (!&_AACustomByteStreamOpen)
  {
    v45 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "AppleArchive is not supported.";
LABEL_23:
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    }
LABEL_31:
    v43 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v44 = "Failed to open section input stream.";
    goto LABEL_50;
  }
  v19 = v16;
  log = v14;
  v20 = v15;
  corefile_fd = self->_corefile_fd;
  scratchBuf = self->_scratchBuf;
  scratchBufSize = self->_scratchBufSize;
  v24 = malloc_type_calloc(1uLL, 0x30uLL, 0x101004041698121uLL);
  if (!v24)
  {
    v45 = qword_10003A5A8;
    v15 = v20;
    v14 = log;
    v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Failed to allocate section input stream data.";
      goto LABEL_23;
    }
    goto LABEL_31;
  }
  v25 = v24;
  if (lseek(corefile_fd, a3, 0) == -1)
  {
    v47 = qword_10003A5A8;
    v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v115 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to seek to offset %lld in kernelcore.", buf, 0xCu);
    }
    free(v25);
    v15 = v20;
    goto LABEL_30;
  }
  *(_DWORD *)v25 = corefile_fd;
  v25[1] = a4;
  v25[2] = scratchBuf;
  v25[4] = 0;
  v25[5] = 0;
  v25[3] = scratchBufSize;
  v26 = AACustomByteStreamOpen();
  if (!v26)
  {
    v48 = qword_10003A5A8;
    v15 = v20;
    v16 = v19;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to allocate section input stream.", buf, 2u);
    }
    free(v25);
LABEL_30:
    v14 = log;
    goto LABEL_31;
  }
  v27 = v26;
  AACustomByteStreamSetData(v26, v25);
  AACustomByteStreamSetReadProc(v27, (AAByteStreamReadProc)sub_100015288);
  AACustomByteStreamSetCloseProc(v27, (AAByteStreamCloseProc)sub_1000153A4);
  v112 = v27;
  v15 = v20;
  v16 = v19;
  if ((v18 & 4) != 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ReadOnlyKeyStore getMatchingPrivateKey::](self->_keystore, "getMatchingPrivateKey::", 1, v20));
    v52 = v51;
    v14 = log;
    v31 = &unk_10003A000;
    if (!v51)
    {
      v66 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
LABEL_127:

        AAByteStreamClose(v27);
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      v67 = "Failed to find a matching private key for the public key.";
LABEL_129:
      _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, 2u);
      goto LABEL_127;
    }
    v53 = v51;
    if (&_AACustomByteStreamOpen)
    {
      v54 = (AEAContext *)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
      if (v54)
      {
        v55 = v54;
        v56 = AEAContextCreateWithEncryptedStream(v27);
        *v55 = v56;
        if (!v56)
        {
          v81 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Failed to create an AEA context.", buf, 2u);
          }
          goto LABEL_125;
        }
        v57 = v56;
        v107 = v53;
        v106 = objc_retainAutorelease(v53);
        v58 = AEAContextSetFieldBlob(v57, 0xBu, 1u, (const uint8_t *)objc_msgSend(v106, "bytes"), (size_t)objc_msgSend(v106, "length"));
        if (v58 < 0)
        {
          v82 = v58;
          v83 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v115) = v82;
            _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Failed to set the private key. Error %d", buf, 8u);
          }
          AEAContextDestroy(*v55);
          free(v55);
          v53 = v107;
          goto LABEL_126;
        }
        v59 = AEADecryptionInputStreamOpen(v27, *v55, 0, 1);
        v55[1] = v59;
        if (v59)
        {
          v60 = AACustomByteStreamOpen();
          if (v60)
          {
            v28 = v60;
            AACustomByteStreamSetData(v60, v55);
            AACustomByteStreamSetReadProc(v28, (AAByteStreamReadProc)sub_1000153BC);
            AACustomByteStreamSetCloseProc(v28, (AAByteStreamCloseProc)sub_100015438);

            v111 = v28;
            v29 = &v111;
            v30 = v28;
            if ((v18 & 2) == 0)
              goto LABEL_10;
            goto LABEL_42;
          }
          v96 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to allocate AEA decryption stream.", buf, 2u);
          }
          if (AAByteStreamClose(v55[1]) != -1)
            goto LABEL_124;
          v86 = qword_10003A5A8;
          if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            goto LABEL_124;
          *(_WORD *)buf = 0;
          v87 = "Failed to close AEA decrypt stream source.";
        }
        else
        {
          v86 = qword_10003A5A8;
          if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          {
LABEL_124:
            AEAContextDestroy(*v55);
LABEL_125:
            free(v55);
            goto LABEL_126;
          }
          *(_WORD *)buf = 0;
          v87 = "Failed to open AEA decryption stream.";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, v87, buf, 2u);
        goto LABEL_124;
      }
      v68 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v69 = "Failed to allocate AEA decryption stream data.";
        goto LABEL_72;
      }
    }
    else
    {
      v68 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v69 = "AppleArchive is not supported.";
LABEL_72:
        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, v69, buf, 2u);
      }
    }
LABEL_126:

    v66 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_127;
    *(_WORD *)buf = 0;
    v67 = "Failed to open AEA decryption stream.";
    goto LABEL_129;
  }
  v28 = 0;
  v29 = &v112;
  v30 = v27;
  v14 = log;
  v31 = &unk_10003A000;
  if ((v18 & 2) == 0)
  {
LABEL_10:
    v32 = 0;
    goto LABEL_11;
  }
LABEL_42:
  if (!&_AACustomByteStreamOpen)
  {
    v75 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_91;
    *(_WORD *)buf = 0;
    v76 = "AppleArchive is not supported.";
LABEL_82:
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, v76, buf, 2u);
    goto LABEL_91;
  }
  if (!&_compression_stream_init)
  {
    v75 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_91;
    *(_WORD *)buf = 0;
    v76 = "LZ4 decode stream is not supported.";
    goto LABEL_82;
  }
  v61 = malloc_type_calloc(1uLL, 0x40uLL, 0x10F0040D5368861uLL);
  if (v61)
  {
    v62 = v61;
    *v61 = v30;
    v63 = malloc_type_calloc(1uLL, 0x8000uLL, 0x7161CB57uLL);
    v62[7] = v63;
    if (v63)
    {
      if (compression_stream_init((compression_stream *)(v62 + 1), COMPRESSION_STREAM_DECODE, COMPRESSION_LZ4) == COMPRESSION_STATUS_OK)
      {
        v95 = AACustomByteStreamOpen();
        if (v95)
        {
          v32 = v95;
          AACustomByteStreamSetData(v95, v62);
          AACustomByteStreamSetReadProc(v32, (AAByteStreamReadProc)sub_1000154D0);
          AACustomByteStreamSetCloseProc(v32, (AAByteStreamCloseProc)sub_10001560C);
          v110 = v32;
          v29 = &v110;
LABEL_11:
          v33 = objc_msgSend(v16, "hasSuffix:", CFSTR(".gz"));
          v34 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
          v35 = v34;
          if (!v33)
          {
            v70 = AAFileStreamOpenWithPath(v34, 1537, 0x1B6u);
            if (v70)
            {
              v41 = v70;
              v40 = 0;
              v42 = v70;
LABEL_57:
              v71 = AAByteStreamProcess(*v29, v42);
              v72 = v71 >> 63;
              if ((v71 & 0x8000000000000000) != 0)
              {
                v73 = v71;
                loga = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  v115 = v73;
                  _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "Failed to process the coredump through the byte streams. Error %lld", buf, 0xCu);
                }
              }
              v74 = v72 ^ 1;
              if (v41)
                AAByteStreamClose(v41);
              v31 = &unk_10003A000;
              if (v40)
                AAByteStreamClose(v40);
              goto LABEL_102;
            }
            v79 = qword_10003A5A8;
            if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
LABEL_101:
              v74 = 0;
LABEL_102:
              if (v32)
                AAByteStreamClose(v32);
              goto LABEL_104;
            }
            *(_WORD *)buf = 0;
            v80 = "Failed to open file output stream.";
LABEL_131:
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, v80, buf, 2u);
            goto LABEL_101;
          }
          if (&_AACustomByteStreamOpen)
          {
            v36 = (gzFile *)malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
            if (v36)
            {
              v37 = v36;
              v38 = gzopen(v35, "wb");
              *v37 = v38;
              if (v38)
              {
                v39 = AACustomByteStreamOpen();
                if (v39)
                {
                  v40 = v39;
                  AACustomByteStreamSetData(v39, v37);
                  AACustomByteStreamSetWriteProc(v40, (AAByteStreamWriteProc)sub_100015644);
                  AACustomByteStreamSetCloseProc(v40, (AAByteStreamCloseProc)sub_10001573C);
                  v41 = 0;
                  v42 = v40;
                  goto LABEL_57;
                }
                v88 = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Failed to allocate gzip output stream.", buf, 2u);
                }
                free(v37);
                gzclose(*v37);
              }
              else
              {
                v84 = (void *)qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  v103 = v84;
                  v104 = __error();
                  v105 = strerror(*v104);
                  *(_DWORD *)buf = 136315394;
                  v115 = (unint64_t)v35;
                  v116 = 2080;
                  v117 = (unint64_t)v105;
                  _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "gzopen(%s, wb) error: %s", buf, 0x16u);

                }
                free(v37);
                v31 = &unk_10003A000;
              }
              goto LABEL_100;
            }
            v77 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v78 = "Failed to allocate gzip output stream data.";
              goto LABEL_79;
            }
          }
          else
          {
            v77 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v78 = "AppleArchive is not supported.";
LABEL_79:
              _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v78, buf, 2u);
            }
          }
LABEL_100:
          v79 = *((_QWORD *)v31 + 181);
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            goto LABEL_101;
          *(_WORD *)buf = 0;
          v80 = "Failed to open gzip output stream.";
          goto LABEL_131;
        }
        v64 = qword_10003A5A8;
        if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
          goto LABEL_90;
        *(_WORD *)buf = 0;
        v65 = "Failed to allocate lz4 decode stream.";
        goto LABEL_135;
      }
      v64 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v65 = "Failed to initialize lz4 decode stream data.";
LABEL_135:
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v65, buf, 2u);
      }
    }
    else
    {
      v64 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v65 = "Failed to allocate lz4 decode stream data buffer.";
        goto LABEL_135;
      }
    }
LABEL_90:
    free(v62);
    goto LABEL_91;
  }
  v75 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v76 = "Failed to allocate lz4 decode stream data.";
    goto LABEL_82;
  }
LABEL_91:
  v85 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Failed to open lz4 decode stream.", buf, 2u);
  }
  v74 = 0;
LABEL_104:
  if (v28)
    AAByteStreamClose(v28);
  AAByteStreamClose(v27);
  if ((v74 & 1) != 0)
  {
    v89 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    v90 = open(v89, 0);
    if (v90 < 0)
    {
      v93 = *((_QWORD *)v31 + 181);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v100 = v93;
        v101 = __error();
        v102 = strerror(*v101);
        *(_DWORD *)buf = 136315394;
        v115 = (unint64_t)v89;
        v116 = 2080;
        v117 = (unint64_t)v102;
        _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Failed to open %s to mark as purgeable. Error: %s", buf, 0x16u);

      }
    }
    else
    {
      v91 = v90;
      v113 = 67589;
      if (!ffsctl(v90, 0xC0084A44uLL, &v113, 0))
      {
        close(v91);
LABEL_117:
        v49 = 1;
        goto LABEL_33;
      }
      v92 = *((_QWORD *)v31 + 181);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v97 = v92;
        v98 = __error();
        v99 = strerror(*v98);
        *(_DWORD *)buf = 136315394;
        v115 = (unint64_t)v89;
        v116 = 2080;
        v117 = (unint64_t)v99;
        _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable. Error: %s", buf, 0x16u);

      }
      close(v91);
    }
    v94 = *((_QWORD *)v31 + 181);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Failed to mark the coredump output file as purgeable.", buf, 2u);
    }
    goto LABEL_117;
  }
LABEL_32:
  v49 = 0;
LABEL_33:

  return v49;
}

- (BOOL)saveCoreDumpWithIndex:(unint64_t)a3 named:(id)a4 toFileName:(id *)a5
{
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  _BYTE *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  BOOL result;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CoreFileHandler *v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a4;
  v24 = 0;
  v25 = 0;
  v23 = 0;
  -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", a3, &v25, &v24, &v23);
  v8 = 0;
  if ((v23 & 4) != 0)
    v8 = objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpEncryptionKey:](self, "getCoreDumpEncryptionKey:", a3));
  v20 = (void *)v8;
  v21 = self;
  if (!objc_msgSend(*a5, "hasSuffix:", CFSTR(".gz")))
    goto LABEL_11;
  if (objc_msgSend(*a5, "containsString:", CFSTR("cp.core.gz")))
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*a5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("cp.core.gz"), CFSTR("coproc.core.gz")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", *a5);

  if (v10)
  {
    v11 = 1;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("core.%llu.gz"), v11));
      v13 = objc_msgSend(*a5, "rangeOfString:", CFSTR("core"));
      if (v13 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        break;
      if (!v13)
        goto LABEL_13;
      *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*a5, "stringByReplacingCharactersInRange:withString:", v13, (_BYTE *)objc_msgSend(*a5, "length") - v13, v12));
      ++v11;

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v15 = objc_msgSend(v14, "fileExistsAtPath:", *a5);

      if ((v15 & 1) == 0)
        goto LABEL_11;
    }
    v18 = _os_assert_log(0);
    _os_crash(v18);
    __break(1u);
LABEL_13:
    v19 = _os_assert_log(0);
    result = _os_crash(v19);
    __break(1u);
  }
  else
  {
LABEL_11:
    v16 = -[CoreFileHandler saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:](v21, "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:", v25, v24, v22, v20, *a5, v23);

    return v16;
  }
  return result;
}

- (id)getPanicRegion
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSString *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v22[4];
  void *v23;
  uint8_t buf[40];

  v3 = -[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps");
  if (v3)
  {
    v4 = 0;
    while (strncmp(-[CoreFileHandler getCoreDumpNameWithIndex:](self, "getCoreDumpNameWithIndex:", v4), "panic_region", 0xCuLL))
    {
      if (v3 == ++v4)
        goto LABEL_5;
    }
    v20 = 0;
    v21 = 0;
    v19 = 0;
    -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", v4, &v21, &v20, &v19);
    strcpy((char *)buf, "/private/var/tmp/panicregion.XXX");
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", mktemp((char *)buf));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v18 = v8;
    v9 = -[CoreFileHandler saveCoreDumpWithIndex:named:toFileName:](self, "saveCoreDumpWithIndex:named:toFileName:", v4, CFSTR("panic region"), &v18);
    v10 = v18;

    v11 = 0;
    if (v9)
    {
      v17 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v10, 0, &v17));
      v13 = v17;
      if (!v12)
      {
        v14 = (void *)qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
          *(_DWORD *)v22 = 138412290;
          v23 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to read the file contents for panic region file. Error: %@", v22, 0xCu);

        }
      }
      unlink((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
      v11 = v12;

    }
    return v11;
  }
  else
  {
LABEL_5:
    v5 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to find panic region in corefile with %llu files", buf, 0xCu);
    }
    return 0;
  }
}

- (id)saveKernelCoreToDisk:(const char *)a3 :(unsigned int)a4 :(double)a5 :(BOOL)a6 :(id)a7
{
  const char *v9;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  const char *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t i;
  const char *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  unsigned __int8 v49;
  NSObject *v50;
  id v52;
  NSObject *v53;
  id v54;
  const char *v55;
  id v56;
  void *v57;
  unsigned int v58;
  void *v59;
  id v60;
  _QWORD v61[5];
  int v62;
  unsigned int v63;
  unint64_t v64;
  uint64_t v65;
  _QWORD v66[6];
  id v67;
  id v68;
  char *v69;
  uint8_t buf[4];
  id v71;

  v9 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3, *(_QWORD *)&a4, a6, a7));
  v12 = sub_10001D3B0(a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v69 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v15 = sub_10001D4C0(v14, a4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v68 = 0;
  v17 = sub_100015A64(v16, &v68, 493);
  v18 = v68;

  if ((v17 & 1) != 0)
  {
    asprintf(&v69, "%s/staged", v9);
    if (v69)
    {
      v19 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
      v67 = v18;
      v21 = sub_100015A64(v20, &v67, 493);
      v22 = v67;

      if ((v21 & 1) == 0)
      {
        v25 = (void *)qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          v52 = objc_retainAutorelease(v22);
          v53 = v25;
          v54 = objc_msgSend(v52, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v71 = v54;
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "failed to setup corefile stage directory due to error: %s", buf, 0xCu);

        }
        free(v69);
        v69 = 0;
        v9 = v19;
        goto LABEL_14;
      }
      v18 = v22;
      v9 = v19;
    }
    else
    {
      v24 = qword_10003A5A8;
      if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v22 = v18;
LABEL_14:
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@."), v9, v13));
        v18 = v22;
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to allocate staging directory string", buf, 2u);
    }
    if (v69)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@."), v69, v13));
LABEL_15:
      v58 = a4;
      v26 = qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Attempting to extract kernel core if it exists...", buf, 2u);
      }
      v27 = -[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps");
      v28 = v27;
      if (&_AnalyticsSendEventLazy && v27)
      {
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10001DF5C;
        v66[3] = &unk_100034D58;
        v66[4] = self;
        v66[5] = v27;
        AnalyticsSendEventLazy(CFSTR("com.apple.DumpPanic.corefileSummary"), v66);
      }
      if (-[CoreFileHandler privateKeyChecking](self, "privateKeyChecking"))
      {
        v55 = v9;
        v56 = v18;
        v57 = v13;
        if (v28)
        {
          for (i = 0; i != v28; ++i)
          {
            v30 = -[CoreFileHandler getCoreDumpNameWithIndex:](self, "getCoreDumpNameWithIndex:", i);
            v64 = 0;
            v65 = 0;
            v63 = 0;
            -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", i, &v65, &v64, &v63);
            if (&_AnalyticsSendEventLazy)
            {
              v61[0] = _NSConcreteStackBlock;
              v61[1] = 3221225472;
              v61[2] = sub_10001E0B0;
              v61[3] = &unk_100034D78;
              v61[4] = v30;
              v62 = v64 >> 20;
              AnalyticsSendEventLazy(CFSTR("com.apple.DumpPanic.corefileSize"), v61);
            }
            if (strncmp(v30, "panic_region", 0xCuLL))
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%s%s.core.gz"), v59, ", v30));
              v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("corefile with name %s"), v30));
              v60 = v31;
              v33 = -[CoreFileHandler saveCoreDumpWithIndex:named:toFileName:](self, "saveCoreDumpWithIndex:named:toFileName:", i, v32, &v60);
              v34 = v60;

              if (v33)
              {
                v35 = qword_10003A5A8;
                if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = v34;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
                }
                objc_msgSend(v11, "addObject:", v34);
              }

            }
          }
        }
        v64 = 0;
        v65 = 0;
        v63 = 0;
        v13 = v57;
        if (-[CoreFileHandler getCorefileLogInfo:::](self, "getCorefileLogInfo:::", &v65, &v64, &v63))
        {
          if ((v63 & 4) != 0)
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCorefileLogEncryptionKey](self, "getCorefileLogEncryptionKey"));
          else
            v36 = 0;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%skernel.core.log"), v59, "));
          if (-[CoreFileHandler saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:](self, "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:", v65, v64, CFSTR("kernel core log"), v36, v37, v63))
          {
            v38 = qword_10003A5A8;
            if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v71 = v37;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "saved core file %@", buf, 0xCu);
            }
            objc_msgSend(v11, "addObject:", v37);
          }

        }
        v18 = v56;
        if (objc_msgSend(v11, "count"))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v55));
          v40 = sub_10001D4C0(v39, v58);

          if (v69)
          {
            free(v69);
            v69 = 0;
            if (objc_msgSend(v11, "count"))
            {
              v41 = 0;
              v42 = 0;
              v43 = 0;
              do
              {
                v44 = v43;
                v45 = v42;
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v41));

                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/staged"), &stru_100035420));
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                LOBYTE(v45) = objc_msgSend(v46, "fileExistsAtPath:", v42);

                if ((v45 & 1) != 0)
                {
                  objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v41, v42);
                }
                else
                {
                  v47 = qword_10003A5A8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v71 = v42;
                    _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Cannot find %@", buf, 0xCu);
                  }
                  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                  v49 = objc_msgSend(v48, "fileExistsAtPath:", v43);

                  if ((v49 & 1) == 0)
                  {
                    v50 = qword_10003A5A8;
                    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v71 = v43;
                      _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Neither can find %@", buf, 0xCu);
                    }
                    objc_msgSend(v11, "removeObjectAtIndex:", v41);
                  }
                }
                ++v41;
              }
              while (v41 < (unint64_t)objc_msgSend(v11, "count"));

              v18 = v56;
              v13 = v57;
            }
          }
        }
      }

      goto LABEL_56;
    }
    goto LABEL_10;
  }
  v23 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v18;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to setup corefile output directory with error: %@", buf, 0xCu);
  }
LABEL_56:

  return v11;
}

- (BOOL)privateKeyChecking
{
  NSObject *v3;
  void *v4;
  BOOL result;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[12];
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[CoreFileHandler getNumCoreDumps](self, "getNumCoreDumps"))
    return 1;
  v10 = 0;
  v11 = 0;
  v9 = 0;
  -[CoreFileHandler getCoreDumpInfoWithIndex::::](self, "getCoreDumpInfoWithIndex::::", 0, &v11, &v10, &v9);
  if ((v9 & 4) == 0)
  {
    v3 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The kernel core is not encrypted", v8, 2u);
    }
    return 1;
  }
  if (-[ReadOnlyKeyStore unlock](self->_keystore, "unlock"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CoreFileHandler getCoreDumpEncryptionKey:](self, "getCoreDumpEncryptionKey:", 0));
    if (-[ReadOnlyKeyStore hasMatchingPrivateKey::](self->_keystore, "hasMatchingPrivateKey::", 1, v4))
    {

      return 1;
    }
    v7 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot find matching private encryption key for encrypted core", v8, 2u);
    }
    self->_zero_on_close = 0;

    return 0;
  }
  else
  {
    v6 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Keystore unlock has failed", v8, 2u);
    }
    result = 0;
    self->_zero_on_close = 0;
  }
  return result;
}

- (id)getCorefileZeroRanges
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[CoreFileHandler getCorefileZeroRanges]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v2, 0));

  objc_exception_throw(v3);
}

- (unint64_t)getNumCoreDumps
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[CoreFileHandler getNumCoreDumps]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v2, 0));

  objc_exception_throw(v3);
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[CoreFileHandler getCoreDumpNameWithIndex:]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v3, 0));

  objc_exception_throw(v4);
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, a6, "-[CoreFileHandler getCoreDumpInfoWithIndex::::]"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v6, 0));

  objc_exception_throw(v7);
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, "-[CoreFileHandler getCorefileLogInfo:::]"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v5, 0));

  objc_exception_throw(v6);
}

- (id)getCoreDumpEncryptionKey:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[CoreFileHandler getCoreDumpEncryptionKey:]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v3, 0));

  objc_exception_throw(v4);
}

- (id)getCorefileLogEncryptionKey
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[CoreFileHandler getCorefileLogEncryptionKey]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v2, 0));

  objc_exception_throw(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corefilePath, 0);
  objc_storeStrong((id *)&self->_keystore, 0);
}

+ (id)coreFileWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  vm_size_t v14;
  char **v15;
  char **v16;
  ssize_t v17;
  char *v18;
  __objc2_class *v19;
  void *v20;
  NSObject *v21;
  int v22;
  ssize_t v23;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;

  v7 = a4;
  v9 = a5;
  v10 = a6;
  if (!v10)
  {
    v36 = _os_assert_log(0);
    v15 = (char **)_os_crash(v36);
    __break(1u);
    goto LABEL_35;
  }
  v11 = v10;
  objc_storeStrong((id *)&qword_10003A5A8, a6);
  v12 = open_dprotected_np(a3, 0, 0, 2);
  if (v12 == -1)
  {
    v20 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = *__error();
      v38 = 136315394;
      v39 = a3;
      v40 = 1024;
      LODWORD(v41) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "open_dprotected_np(%s, O_RDONLY): -1 (%{errno}d)", (uint8_t *)&v38, 0x12u);

    }
    goto LABEL_19;
  }
  v13 = v12;
  v14 = (vm_page_size + 7) & -(uint64_t)vm_page_size;
  v15 = (char **)malloc_type_aligned_alloc(vm_page_size, v14, 0x359BC122uLL);
  if (!v15)
  {
LABEL_35:
    v37 = _os_assert_log(v15);
    _os_crash(v37);
    __break(1u);
  }
  v16 = v15;
  v17 = read(v13, v15, v14);
  if (v17 != v14)
  {
    v23 = v17;
    v24 = qword_10003A5A8;
    v25 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR);
    if (v23 == -1)
    {
      if (v25)
      {
        v34 = v24;
        v35 = *__error();
        v38 = 134218240;
        v39 = (char *)v14;
        v40 = 1024;
        LODWORD(v41) = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "failed to read header from corefile (%zd bytes) with error: %{errno}d", (uint8_t *)&v38, 0x12u);

      }
    }
    else if (v25)
    {
      v38 = 134218240;
      v39 = (char *)v14;
      v40 = 2048;
      v41 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Read of %lu bytes from fileoffset 0 only read %lu bytes", (uint8_t *)&v38, 0x16u);
    }
    close(v13);
    goto LABEL_18;
  }
  v18 = *v16;
  close(v13);
  if (!v18)
  {
    v28 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "no core file data found", (uint8_t *)&v38, 2u);
    }
    goto LABEL_18;
  }
  if (v18 == (char *)0x63614D2073736F42)
  {
    if (v16[7])
    {
      v19 = CoreFileHandlerV2;
      goto LABEL_25;
    }
    v33 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v38) = 0;
    v30 = "Skip handling kernel corefile which suggests 0 files present";
LABEL_32:
    v31 = v33;
    v32 = 2;
    goto LABEL_33;
  }
  if (v18 == (char *)0x63614D20646152)
  {
    if (v16[3])
    {
      v19 = CoreFileHandlerV1;
LABEL_25:
      v26 = objc_msgSend([v19 alloc], "initWithCoreFilePath:::", a3, v7, v9);
      goto LABEL_20;
    }
    v33 = qword_10003A5A8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    LOWORD(v38) = 0;
    v30 = "Skip handling kernel corefile which suggests 0 files present";
    goto LABEL_32;
  }
  v29 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    v38 = 134218496;
    v39 = v18;
    v40 = 2048;
    v41 = 0x63614D20646152;
    v42 = 2048;
    v43 = 0x63614D2073736F42;
    v30 = "invalid core file signature: %#llx (expected :%#llx or %#llx)";
    v31 = v29;
    v32 = 32;
LABEL_33:
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v38, v32);
  }
LABEL_18:
  free(v16);
LABEL_19:
  v26 = 0;
LABEL_20:

  return v26;
}

@end
