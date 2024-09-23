@implementation AsyncStreamingFileWriter

- (BOOL)_openCurrentOutputFDForPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 performCachedWrites:(BOOL)a6 quarantineInfo:(void *)a7 error:(id *)a8
{
  return 1;
}

- (id)_initForWritingToPath:(id)a3 withOpenFlags:(int)a4 mode:(unsigned __int16)a5 quarantineInfo:(void *)a6 performCachedWrites:(BOOL)a7 expectedSize:(int64_t)a8 asyncTrackingGroup:(id)a9 errorDelegate:(id)a10 reservation:(id)a11 error:(id *)a12
{
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  id v18;
  id v19;
  int64_t v20;
  id *v21;
  id *v22;
  uint64_t v23;
  id v24;
  id v27;
  id v28;
  objc_super v29;

  v13 = a7;
  v14 = a5;
  v15 = *(_QWORD *)&a4;
  v28 = a9;
  v18 = a10;
  v27 = a11;
  v29.receiver = self;
  v29.super_class = (Class)AsyncStreamingFileWriter;
  v19 = a3;
  v20 = a8;
  v21 = -[StreamingFileWriter _initForWritingToPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:error:](&v29, sel__initForWritingToPath_withOpenFlags_mode_quarantineInfo_performCachedWrites_expectedSize_error_, v19, v15, v14, a6, v13, a8, a12);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong(v21 + 7, a9);
    objc_storeStrong(v22 + 8, a11);
    *((_DWORD *)v22 + 10) = v15;
    *((_WORD *)v22 + 17) = v14;
    *((_BYTE *)v22 + 32) = v13;
    objc_storeWeak(v22 + 11, v18);
    v22[10] = (id)17;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v20);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22[9];
    v22[9] = (id)v23;

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AsyncStreamingFileWriter;
  -[StreamingFileWriter closeCurrentOutputFD](&v4, sel_closeCurrentOutputFD);
  v3.receiver = self;
  v3.super_class = (Class)AsyncStreamingFileWriter;
  -[StreamingFileWriter dealloc](&v3, sel_dealloc);
}

- (int64_t)readIntoBuffer:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[StreamingFileWriter path](self, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v12;
    _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Read not available on async file operation for %@", buf, 0xCu);

  }
  -[StreamingFileWriter path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[AsyncStreamingFileWriter readIntoBuffer:length:error:]", 391, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Read not available on async file operation for %@"), v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v10);

  return -1;
}

- (int64_t)currentOffsetWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[StreamingFileWriter currentOutputFD](self, "currentOutputFD") < 0)
  {
    SZGetLoggingHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[StreamingFileWriter path](self, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "Getting current output offset not available on async file operation for %@", buf, 0xCu);

    }
    -[StreamingFileWriter path](self, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[AsyncStreamingFileWriter currentOffsetWithError:]", 406, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Getting current output offset not available on async file operation for %@"), v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v9);

    return -1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)AsyncStreamingFileWriter;
    return -[StreamingFileWriter currentOffsetWithError:](&v11, sel_currentOffsetWithError_, a3);
  }
}

- (BOOL)setCurrentOffset:(int64_t)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[StreamingFileWriter path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v11;
    _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "Setting current output offset not available on async file operation for %@", buf, 0xCu);

  }
  -[StreamingFileWriter path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[AsyncStreamingFileWriter setCurrentOffset:error:]", 415, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Setting current output offset not available on async file operation for %@"), v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return 0;
}

- (void)setIncompleteExtractionAttribute
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    -[StreamingFileWriter path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_fault_impl(&dword_1D4E55000, v3, OS_LOG_TYPE_FAULT, "Setting incomplete extraction attribute not available on this async file operation for %@", (uint8_t *)&v5, 0xCu);

  }
}

- (BOOL)writeBuffer:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  void *v8;

  -[AsyncStreamingFileWriter fileData](self, "fileData", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", a3, a4);

  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 4);
  return 1;
}

- (void)configureFileAndSetOwnership:(BOOL)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  -[AsyncStreamingFileWriter setSetOwnership:](self, "setSetOwnership:", a3);
  -[AsyncStreamingFileWriter setUid:](self, "setUid:", v6);
  -[AsyncStreamingFileWriter setGid:](self, "setGid:", v5);
  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 2);
}

- (BOOL)_executeWithError:(id *)a3
{
  char v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  v5 = -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags");
  if ((v5 & 1) != 0)
  {
    -[StreamingFileWriter path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22.receiver = self;
    v22.super_class = (Class)AsyncStreamingFileWriter;
    v7 = -[StreamingFileWriter _openCurrentOutputFDForPath:withOpenFlags:mode:performCachedWrites:quarantineInfo:error:](&v22, sel__openCurrentOutputFDForPath_withOpenFlags_mode_performCachedWrites_quarantineInfo_error_, v6, -[AsyncStreamingFileWriter oflag](self, "oflag"), -[AsyncStreamingFileWriter omode](self, "omode"), -[AsyncStreamingFileWriter performCachedWrites](self, "performCachedWrites"), 0, a3);

    if (!v7)
      goto LABEL_12;
  }
  if ((v5 & 2) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)AsyncStreamingFileWriter;
    -[StreamingFileWriter configureFileAndSetOwnership:toUID:GID:](&v21, sel_configureFileAndSetOwnership_toUID_GID_, -[AsyncStreamingFileWriter setOwnership](self, "setOwnership"), -[AsyncStreamingFileWriter uid](self, "uid"), -[AsyncStreamingFileWriter gid](self, "gid"));
  }
  if ((v5 & 4) == 0)
    goto LABEL_16;
  -[AsyncStreamingFileWriter fileData](self, "fileData");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  -[AsyncStreamingFileWriter fileData](self, "fileData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)AsyncStreamingFileWriter;
  LODWORD(v9) = -[StreamingFileWriter writeBuffer:length:error:](&v20, sel_writeBuffer_length_error_, v9, objc_msgSend(v10, "length"), a3);

  if (!(_DWORD)v9)
  {
LABEL_12:
    LOBYTE(v16) = 0;
  }
  else
  {
LABEL_16:
    if ((v5 & 8) == 0
      || (v11 = -[AsyncStreamingFileWriter accessTime](self, "accessTime"),
          v13 = v12,
          v14 = -[AsyncStreamingFileWriter modTime](self, "modTime"),
          v19.receiver = self,
          v19.super_class = (Class)AsyncStreamingFileWriter,
          v16 = -[StreamingFileWriter finalizeFileWithAccessTime:modTime:mode:error:](&v19, sel_finalizeFileWithAccessTime_modTime_mode_error_, v11, v13, v14, v15, -[AsyncStreamingFileWriter mode](self, "mode"), a3)))
    {
      if ((v5 & 0x10) != 0)
      {
        v18.receiver = self;
        v18.super_class = (Class)AsyncStreamingFileWriter;
        -[StreamingFileWriter closeCurrentOutputFD](&v18, sel_closeCurrentOutputFD);
      }
      -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", 0);
      LOBYTE(v16) = 1;
    }
  }
  return v16;
}

- (void)executeAsyncOperation
{
  void *v3;
  int64_t v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[StreamingFileWriter path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[StreamingFileWriter fileSize](self, "fileSize");
  SZGetLoggingHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_debug_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEBUG, "Writing %@ asynchronously", buf, 0xCu);
  }

  SZGetTraceHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ASYNC_WRITE", "Start async operation for %@ size %lld", buf, 0x16u);
  }

  v12 = 0;
  v7 = -[AsyncStreamingFileWriter _executeWithError:](self, "_executeWithError:", &v12);
  v8 = v12;
  if (!v7)
  {
    SZGetLoggingHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = (int64_t)v8;
      _os_log_error_impl(&dword_1D4E55000, v9, OS_LOG_TYPE_ERROR, "Async operation for %@ failed: %@", buf, 0x16u);
    }

    -[AsyncStreamingFileWriter errorDelegate](self, "errorDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "streamingFileWriter:didEncounterError:", self, v8);

  }
  SZGetTraceHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ASYNC_WRITE", "End async operation for %@ size %lld", buf, 0x16u);
  }

}

- (BOOL)suspendWithError:(id *)a3
{
  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") & 0xFFFFFFFFFFFFFFEFLL);
  return -[AsyncStreamingFileWriter _executeWithError:](self, "_executeWithError:", a3);
}

- (BOOL)finalizeFileWithAccessTime:(timeval)a3 modTime:(timeval)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  __darwin_time_t tv_sec;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v7 = a5;
  v8 = *(_QWORD *)&a4.tv_usec;
  tv_sec = a4.tv_sec;
  v22 = *MEMORY[0x1E0C80C00];
  -[AsyncStreamingFileWriter setAccessTime:](self, "setAccessTime:", a3.tv_sec, *(_QWORD *)&a3.tv_usec);
  -[AsyncStreamingFileWriter setModTime:](self, "setModTime:", tv_sec, v8);
  -[AsyncStreamingFileWriter setMode:](self, "setMode:", v7);
  -[AsyncStreamingFileWriter setExecuteFileOperationFlags:](self, "setExecuteFileOperationFlags:", -[AsyncStreamingFileWriter executeFileOperationFlags](self, "executeFileOperationFlags") | 8);
  SZGetTraceHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    -[StreamingFileWriter path](self, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2048;
    v21 = -[StreamingFileWriter fileSize](self, "fileSize");
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ASYNC_ENQUEUE", "Enqueueing async operation for %@ size %lld", buf, 0x16u);

  }
  +[StreamingFileWriterQueue sharedInstance](StreamingFileWriterQueue, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14 = objc_msgSend(v13, "insertAsyncFileOperation:error:", self, &v17);
  v15 = v17;

  if (a6 && (v14 & 1) == 0)
    *a6 = objc_retainAutorelease(v15);

  return v14;
}

- (OS_dispatch_group)trackingGroup
{
  return self->_trackingGroup;
}

- (StreamingFileWriterQueueReservation)reservation
{
  return self->_reservation;
}

- (int)oflag
{
  return self->_oflag;
}

- (unsigned)omode
{
  return self->_omode;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (NSMutableData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
  objc_storeStrong((id *)&self->_fileData, a3);
}

- (BOOL)setOwnership
{
  return self->_setOwnership;
}

- (void)setSetOwnership:(BOOL)a3
{
  self->_setOwnership = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (timeval)accessTime
{
  timeval *p_accessTime;
  __darwin_time_t tv_sec;
  uint64_t v4;
  timeval result;

  p_accessTime = &self->_accessTime;
  tv_sec = self->_accessTime.tv_sec;
  v4 = *(_QWORD *)&p_accessTime->tv_usec;
  result.tv_usec = v4;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setAccessTime:(timeval)a3
{
  self->_accessTime = a3;
}

- (timeval)modTime
{
  timeval *p_modTime;
  __darwin_time_t tv_sec;
  uint64_t v4;
  timeval result;

  p_modTime = &self->_modTime;
  tv_sec = self->_modTime.tv_sec;
  v4 = *(_QWORD *)&p_modTime->tv_usec;
  result.tv_usec = v4;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setModTime:(timeval)a3
{
  self->_modTime = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned __int16)a3
{
  self->_mode = a3;
}

- (unint64_t)executeFileOperationFlags
{
  return self->_executeFileOperationFlags;
}

- (void)setExecuteFileOperationFlags:(unint64_t)a3
{
  self->_executeFileOperationFlags = a3;
}

- (StreamingFileWriterErrorDelegate)errorDelegate
{
  return (StreamingFileWriterErrorDelegate *)objc_loadWeakRetained((id *)&self->_errorDelegate);
}

- (void)setErrorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_errorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorDelegate);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_trackingGroup, 0);
}

@end
