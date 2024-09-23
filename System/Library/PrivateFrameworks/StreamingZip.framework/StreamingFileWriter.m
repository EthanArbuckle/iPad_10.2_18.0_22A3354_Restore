@implementation StreamingFileWriter

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  unsigned int v10;
  id v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  char *v31;
  char *v32;
  uint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  char *v39;
  uint64_t v40;

  v10 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = -[StreamingFileWriter fileSize](self, "fileSize");
  v15 = objc_retainAutorelease(v13);
  v16 = (const char *)objc_msgSend(v15, "fileSystemRepresentation");

  if ((a4 & 0x200) != 0)
    v33 = v10;
  v17 = open(v16, a4, v33);
  v18 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    if (fcntl(v17, 68, 1) < 0)
    {
      v24 = *__error();
      SZGetLoggingHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = v16;
        v36 = 1024;
        v37 = v24;
        v38 = 2080;
        v39 = strerror(v24);
        _os_log_error_impl(&dword_1D4E55000, v25, OS_LOG_TYPE_ERROR, "Could not mark %s static: %d (%s)", buf, 0x1Cu);
      }

      if (a6)
        goto LABEL_20;
    }
    else if (a6)
    {
LABEL_20:
      if (fcntl(v18, 76, 1) < 0)
      {
        v28 = *__error();
        SZGetLoggingHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v31 = strerror(v28);
          *(_DWORD *)buf = 136315650;
          v35 = v16;
          v36 = 1024;
          v37 = v28;
          v38 = 2080;
          v39 = v31;
          _os_log_error_impl(&dword_1D4E55000, v29, OS_LOG_TYPE_ERROR, "Unable to set F_SINGLE_WRITER on %s : %d (%s)", buf, 0x1Cu);
        }

      }
      -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", v18);
      v23 = 0;
      goto LABEL_25;
    }
    if ((v14 >= 0x8000 || v14 == -1) && fcntl(v18, 48, 1) < 0)
    {
      v26 = *__error();
      SZGetLoggingHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v32 = strerror(v26);
        *(_DWORD *)buf = 136315650;
        v35 = v16;
        v36 = 1024;
        v37 = v26;
        v38 = 2080;
        v39 = v32;
        _os_log_error_impl(&dword_1D4E55000, v27, OS_LOG_TYPE_ERROR, "Unable to set F_NOCACHE accessing file %s : %d (%s)", buf, 0x1Cu);
      }

    }
    goto LABEL_20;
  }
  v19 = *__error();
  SZGetLoggingHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v35 = v16;
    v36 = 1024;
    v37 = v19;
    v38 = 2080;
    v39 = strerror(v19);
    _os_log_error_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_ERROR, "Failed to open %s : %d (%s)", buf, 0x1Cu);
  }

  v21 = (void *)*MEMORY[0x1E0CB2FE0];
  strerror(v19);
  _CreateError((uint64_t)"-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:]", 93, v21, v19, 0, 0, CFSTR("Failed to open %s : %d (%s)"), v22, (uint64_t)v16);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (a8)
  {
    v23 = objc_retainAutorelease(v23);
    *a8 = v23;
  }
LABEL_25:

  return (int)v18 >= 0;
}

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 error:(id *)a9
{
  _BOOL8 v10;
  uint64_t v12;
  uint64_t v13;
  id v16;
  StreamingFileWriter *v17;
  StreamingFileWriter *v18;
  StreamingFileWriter *v19;
  objc_super v21;

  v10 = a7;
  v12 = a5;
  v13 = *(_QWORD *)&a4;
  v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)StreamingFileWriter;
  v17 = -[StreamingFileWriter init](&v21, sel_init);
  v18 = v17;
  if (v17
    && (v17->_fileSize = a8,
        objc_storeStrong((id *)&v17->_path, a3),
        v18->_currentOutputFD = -1,
        !-[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:](v18, "_openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:", v16, v13, v12, v10, a6, a9)))
  {
    v19 = 0;
  }
  else
  {
    v19 = v18;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[StreamingFileWriter closeCurrentOutputFD](self, "closeCurrentOutputFD");
  v3.receiver = self;
  v3.super_class = (Class)StreamingFileWriter;
  -[StreamingFileWriter dealloc](&v3, sel_dealloc);
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  ssize_t v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = read(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, a4);
  if (v7 == -1)
  {
    v8 = *__error();
    -[StreamingFileWriter path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SZGetLoggingHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v9;
      v20 = 1024;
      v21 = v8;
      v22 = 2080;
      v23 = strerror(v8);
      _os_log_error_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_ERROR, "Failed to read bytes from %@ : %d (%s)", buf, 0x1Cu);
    }

    v11 = (void *)*MEMORY[0x1E0CB2FE0];
    v16 = *MEMORY[0x1E0CB2AA0];
    v17 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateError((uint64_t)"-[StreamingFileWriter readIntoBuffer:length:error:]", 210, v11, v8, 0, v12, CFSTR("Failed to read bytes from %@ : %d (%s)"), v13, (uint64_t)v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v14);

  }
  return v7;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  off_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), 0, 1);
  if (v5 == -1)
  {
    v6 = *__error();
    -[StreamingFileWriter path](self, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SZGetLoggingHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2080;
      v19 = strerror(v6);
      _os_log_error_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_ERROR, "Failed to seek to current offset in output file at path %@ : %s", buf, 0x16u);
    }

    v9 = (void *)*MEMORY[0x1E0CB2FE0];
    v14 = *MEMORY[0x1E0CB2AA0];
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v6);
    _CreateError((uint64_t)"-[StreamingFileWriter currentOffsetWithError:]", 225, v9, v6, 0, v10, CFSTR("Failed to seek to current offset in output file at path %@ : %s"), v11, (uint64_t)v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v12);

  }
  return v5;
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  off_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = lseek(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), a3, 0);
  if (v7 == -1)
  {
    v8 = *__error();
    -[StreamingFileWriter path](self, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SZGetLoggingHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v19 = a3;
      v20 = 2112;
      v21 = v9;
      v22 = 2080;
      v23 = strerror(v8);
      _os_log_error_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_ERROR, "Failed to seek to offset %llu in output file at path %@ : %s", buf, 0x20u);
    }

    v11 = (void *)*MEMORY[0x1E0CB2FE0];
    v16 = *MEMORY[0x1E0CB2AA0];
    v17 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateError((uint64_t)"-[StreamingFileWriter setCurrentOffset:error:]", 239, v11, v8, 0, v12, CFSTR("Failed to seek to offset %llu in output file at path %@ : %s"), v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v14);

  }
  return v7 != -1;
}

- (void)setIncompleteExtractionAttribute
{
  int v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (fsetxattr(-[StreamingFileWriter currentOutputFD](self, "currentOutputFD"), "com.apple.streamingzip.incomplete_extraction", "y", 1uLL, 0, 0))
  {
    v3 = *__error();
    SZGetLoggingHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2080;
      v9 = strerror(v3);
      _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "Failed to set incomplete extraction xattr on %@ : %s", (uint8_t *)&v6, 0x16u);

    }
  }
}

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int v9;
  uint64_t v10;
  ssize_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  v10 = 0;
  do
  {
    if (a4 == v10)
      return 1;
    v11 = write(v9, (char *)a3 + v10, a4 - v10);
    v10 += v11;
  }
  while ((v11 & 0x8000000000000000) == 0);
  if (a4 == -1)
    return 1;
  v12 = *__error();
  -[StreamingFileWriter path](self, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SZGetLoggingHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v13;
    v24 = 2080;
    v25 = strerror(v12);
    _os_log_error_impl(&dword_1D4E55000, v14, OS_LOG_TYPE_ERROR, "Failed to write data to output file at %@: %s", buf, 0x16u);
  }

  v15 = (void *)*MEMORY[0x1E0CB2FE0];
  v20 = *MEMORY[0x1E0CB2AA0];
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v12);
  _CreateError((uint64_t)"-[StreamingFileWriter writeBuffer:length:error:]", 263, v15, v12, 0, v16, CFSTR("Failed to write data to output file at %@: %s"), v17, (uint64_t)v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return 0;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  _BOOL4 v7;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  char *v19;
  char *v20;
  char *v21;
  _BYTE buf[24];
  uint64_t v23;
  char *v24;
  uint8_t v25[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v7 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[StreamingFileWriter path](self, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[StreamingFileWriter fileSize](self, "fileSize");
  v11 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  v12 = v11;
  if (v10 > 0x4000)
  {
    *(_QWORD *)&buf[16] = v10;
    v23 = 0;
    *(_QWORD *)buf = 0x300000002;
    *(_QWORD *)&buf[8] = 0;
    if (fcntl(v11, 42, buf) == -1)
    {
      v13 = *__error();
      SZGetLoggingHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = strerror(v13);
        *(_DWORD *)v25 = 134218498;
        v26 = v10;
        v27 = 2112;
        v28 = v9;
        v29 = 2080;
        v30 = v21;
        _os_log_error_impl(&dword_1D4E55000, v14, OS_LOG_TYPE_ERROR, "Advisory preallocation of %lld bytes for %@ failed: %s", v25, 0x20u);
      }

    }
  }
  if (fchmod(v12, 0x180u))
  {
    v15 = *__error();
    SZGetLoggingHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = strerror(v15);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v19;
      _os_log_error_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_ERROR, "Setting initial mode on %@ failed: %s", buf, 0x16u);
    }

  }
  if (v7 && fchown(v12, a4, a5))
  {
    v17 = *__error();
    SZGetLoggingHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = strerror(v17);
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v17;
      HIWORD(v23) = 2080;
      v24 = v20;
      _os_log_error_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_ERROR, "Failed to fchown %@ to (%d:%d) : %d (%s)", buf, 0x28u);
    }

  }
}

- (BOOL)suspendWithError:(id *)a3
{
  return 1;
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  int v6;
  uint64_t v7;
  __darwin_time_t tv_sec;
  uint64_t v9;
  __darwin_time_t v10;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v18;
  void *v19;
  char *v20;
  int v21;
  void *v22;
  __int16 v23;
  _QWORD v24[3];
  timeval v25;
  __darwin_time_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a5;
  v7 = *(_QWORD *)&a4.tv_usec;
  tv_sec = a4.tv_sec;
  v9 = *(_QWORD *)&a3.tv_usec;
  v10 = a3.tv_sec;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD", a3.tv_sec, *(_QWORD *)&a3.tv_usec, a4.tv_sec, *(_QWORD *)&a4.tv_usec, a5, a6);
  v25.tv_sec = v10;
  *(_QWORD *)&v25.tv_usec = v9;
  v26 = tv_sec;
  v27 = v7;
  if (futimes(v12, &v25))
  {
    v13 = *__error();
    SZGetLoggingHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v18;
      v23 = 2080;
      v24[0] = strerror(v13);
      _os_log_error_impl(&dword_1D4E55000, v14, OS_LOG_TYPE_ERROR, "Failed to set times on %@ : %s", (uint8_t *)&v21, 0x16u);

    }
  }
  if (fchmod(v12, v6))
  {
    v15 = *__error();
    SZGetLoggingHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = strerror(v15);
      v21 = 138412802;
      v22 = v19;
      v23 = 1024;
      LODWORD(v24[0]) = v6;
      WORD2(v24[0]) = 2080;
      *(_QWORD *)((char *)v24 + 6) = v20;
      _os_log_error_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_ERROR, "Failed to set mode of %@ to 0%o: %s", (uint8_t *)&v21, 0x1Cu);

    }
  }
  return 1;
}

- (void)closeCurrentOutputFD
{
  int v3;

  v3 = -[StreamingFileWriter currentOutputFD](self, "currentOutputFD");
  if ((v3 & 0x80000000) == 0)
  {
    close(v3);
    -[StreamingFileWriter setCurrentOutputFD:](self, "setCurrentOutputFD:", 0xFFFFFFFFLL);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StreamingFileWriter path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: path=%@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)currentOutputFD
{
  return self->_currentOutputFD;
}

- (void)setCurrentOutputFD:(int)a3
{
  self->_currentOutputFD = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)fileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 error:(id *)a11
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v23;
  char v24;

  v12 = a7;
  v14 = a5;
  v15 = *(_QWORD *)&a4;
  v16 = a3;
  v17 = a9;
  v18 = a10;
  v24 = 0;
  if (fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__onceToken != -1)
    dispatch_once(&fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__onceToken, &__block_literal_global_782);
  if (fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__performAllWritesSynchronously)
    goto LABEL_4;
  v23 = v12;
  +[StreamingFileWriterQueue sharedInstance](StreamingFileWriterQueue, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reserveAsyncOperationForFileSize:path:group:operationPendingForPath:", a8, v16, v17, &v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v12 = v23;
  if (!v21)
  {
LABEL_4:
    v19 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]([StreamingFileWriter alloc], "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:", v16, v15, v14, a6, v12, a8, a11);
  }
  else
  {
    v19 = -[AsyncStreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:reservation:error:]([AsyncStreamingFileWriter alloc], "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:reservation:error:", v16, v15, v14, a6, v23, a8, v17, v18, v21, a11);

  }
  return v19;
}

+ (id)synchronousFileWriterForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v9 = a7;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:]([StreamingFileWriter alloc], "_initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:", v13, v12, v11, a6, v9, -1, a8);

  return v14;
}

void __147__StreamingFileWriter_fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  fileWriterForPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_asyncTrackingGroup_errorDelegate_error__performAllWritesSynchronously = objc_msgSend(v0, "BOOLForKey:", CFSTR("PerformAllWritesSynchronously"));

}

@end
