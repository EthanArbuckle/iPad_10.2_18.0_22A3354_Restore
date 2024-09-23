@implementation StreamingUnzipState

- (StreamingUnzipState)init
{
  __assert_rtn("-[StreamingUnzipState init]", "StreamingUnzipState.m", 114, "false");
}

- (void)dealloc
{
  StreamingFileWriter *fileWriter;
  StreamingFileWriter *v4;
  objc_super v5;

  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    -[StreamingFileWriter closeCurrentOutputFD](fileWriter, "closeCurrentOutputFD");
    v4 = self->_fileWriter;
    self->_fileWriter = 0;

  }
  free(self->_dataDescriptor);
  free(self->_currentLFRecord);
  compression_stream_destroy((compression_stream *)&self->_cmpState);
  v5.receiver = self;
  v5.super_class = (Class)StreamingUnzipState;
  -[StreamingUnzipState dealloc](&v5, sel_dealloc);
}

- ($D199E5C2C3D9BBBBA45D19FC310E2D7B)cmpState
{
  return ($D199E5C2C3D9BBBBA45D19FC310E2D7B *)&self->_cmpState;
}

- (void)_internalSetStreamState:(unsigned __int8)a3
{
  self->_streamState = a3;
}

- (void)setStreamState:(unsigned __int8)a3
{
  unsigned int v3;
  NSObject *v5;
  int v6;
  StreamingFileWriter *fileWriter;
  StreamingFileWriter *v8;
  $AA9291E5398F62F4D1A894576DDA1914 *dataDescriptor;
  $3632F29577C185DF68DCA35DB3C0928E *currentLFRecord;
  StreamingFileWriter *v11;
  StreamingFileWriter *v12;
  NSDictionary *streamInfoDict;
  NSMutableData *unsureData;
  NSMutableData *inMemoryFileData;
  unint64_t streamState;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  self->_thisStageBytesComplete = 0;
  SZGetLoggingHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    streamState = self->_streamState;
    if (streamState > 8)
      v17 = CFSTR("Unknown");
    else
      v17 = off_1E98B1120[streamState];
    if (v3 > 8)
      v18 = CFSTR("Unknown");
    else
      v18 = off_1E98B1120[v3];
    v19 = 138412546;
    v20 = v17;
    v21 = 2112;
    v22 = v18;
    _os_log_debug_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEBUG, "Updating stream state from %@ to %@", (uint8_t *)&v19, 0x16u);
  }

  switch(v3)
  {
    case 0u:
      v6 = self->_streamState;
      if (v6 != 1 && v6 != 4)
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 208, "kStreamStateCompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      self->_currentCRC32 = 0;
      self->_uncompressedBytesOutput = 0;
      fileWriter = self->_fileWriter;
      if (fileWriter)
      {
        -[StreamingFileWriter closeCurrentOutputFD](fileWriter, "closeCurrentOutputFD");
        v8 = self->_fileWriter;
        self->_fileWriter = 0;

      }
      dataDescriptor = self->_dataDescriptor;
      if (dataDescriptor)
      {
        *(_QWORD *)dataDescriptor->var0 = 0;
        *(_QWORD *)&dataDescriptor->var1.var0.var0.var0 = 0;
        dataDescriptor->var1.var0.var1.var0 = 0;
      }
      currentLFRecord = self->_currentLFRecord;
      *(_QWORD *)currentLFRecord->var0 = 0;
      *(_QWORD *)&currentLFRecord->var3.var0 = 0;
      *(_QWORD *)((char *)&currentLFRecord->var6.var0 + 2) = 0;
      *(_QWORD *)&currentLFRecord->var5.var0 = 0;
      *(_WORD *)&self->_storeCurrentFileInMemory = 0;
      -[NSMutableData setLength:](self->_inMemoryFileData, "setLength:", 0);
      self->_currentLFMode = 0;
      ++self->_recordsProcessed;
      break;
    case 1u:
      if (self->_streamState)
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 233, "kStreamStateReadNextRecordSignature == _streamState");
      self->_thisStageBytesComplete = 4;
      break;
    case 2u:
      if (self->_streamState != 1)
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 238, "kStreamStateIncompleteLFRecord == _streamState");
      return;
    case 3u:
      if (self->_streamState != 2)
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 242, "kStreamStateIncompleteLFData == _streamState");
      return;
    case 4u:
      if (self->_streamState - 1 >= 3)
        __assert_rtn("-[StreamingUnzipState setStreamState:]", "StreamingUnzipState.m", 246, "kStreamStateIncompleteDataDescriptor == _streamState|| kStreamStateIncompleteLFData == _streamState || kStreamStateIncompleteLFRecord == _streamState");
      return;
    case 5u:
      streamInfoDict = self->_streamInfoDict;
      self->_streamInfoDict = 0;

      unsureData = self->_unsureData;
      self->_unsureData = 0;

      inMemoryFileData = self->_inMemoryFileData;
      self->_inMemoryFileData = 0;

      free(self->_currentLFRecord);
      self->_currentLFRecord = 0;
      self->_thisStageBytesComplete = 0;
      self->_currentCRC32 = 0;
      self->_currentLFMode = 0;
      self->_recordsProcessed = 0;
      self->_totalRecordCount = 0;
      break;
    case 6u:
      goto LABEL_18;
    case 7u:
      v11 = self->_fileWriter;
      if (v11)
      {
        -[StreamingFileWriter closeCurrentOutputFD](v11, "closeCurrentOutputFD");
        v12 = self->_fileWriter;
        self->_fileWriter = 0;

      }
LABEL_18:
      free(self->_currentLFRecord);
      self->_currentLFRecord = 0;
      break;
    default:
      break;
  }
  self->_streamState = v3;
  -[StreamingUnzipState markResumptionPoint](self, "markResumptionPoint");
}

- (void)clearSavedState
{
  NSString *unzipPath;
  id v4;
  stat v5;

  if (!stat(-[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0),
          &v5))
  {
    unzipPath = self->_unzipPath;
    if ((v5.st_mode & 0xF000) == 0x4000)
    {
      -[NSString stringByAppendingPathComponent:](unzipPath, "stringByAppendingPathComponent:", CFSTR("com.apple.StreamingUnzipResumptionData"));
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      unlink((const char *)objc_msgSend(v4, "fileSystemRepresentation"));

    }
    else
    {
      removexattr(-[NSString fileSystemRepresentation](unzipPath, "fileSystemRepresentation"), "com.apple.StreamingPassthroughResumptionData", 1);
    }
  }
}

- (id)serializeState
{
  void *v2;
  StreamingFileWriter *fileWriter;
  _BOOL4 v5;
  id v6;
  NSArray *hashes;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSArray *v14;
  $3632F29577C185DF68DCA35DB3C0928E *currentLFRecord;
  unint64_t currentLFRecordAllocationSize;
  void *v17;
  void *v18;
  StreamingFileWriter *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *state;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  char v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  NSString *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v56;
  NSString *v57;
  char *v58;
  NSString *unzipPath;
  uint64_t v60;
  unint64_t currentOffset;
  unint64_t uncompressedBytesOutput;
  unint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSString *v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  unint64_t v80;
  __int16 v81;
  char *v82;
  uint64_t v83;
  _QWORD v84[2];

  v84[1] = *MEMORY[0x1E0C80C00];
  if (!self->_currentOffset)
    return 0;
  fileWriter = self->_fileWriter;
  if (fileWriter)
  {
    v66 = 0;
    v5 = -[StreamingFileWriter suspendWithError:](fileWriter, "suspendWithError:", &v66);
    v6 = v66;
    v2 = v6;
    if (!v5)
      return v2;

  }
  if (self->_streamState == 5)
  {
    hashes = self->_hashes;
    if (hashes && -[NSArray count](hashes, "count"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v8, "setOutputFormat:", 200);
      objc_msgSend(v8, "encodeInt:forKey:", 8, CFSTR("SerializationVersion"));
      objc_msgSend(v8, "encodeBytes:length:forKey:", &self->_hashContext.context, gHashContextSizes[self->_hashContext.hashType], CFSTR("HashContext"));
      objc_msgSend(v8, "encodedData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_9:
        SZGetLoggingHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          unzipPath = self->_unzipPath;
          *(_DWORD *)buf = 138412290;
          v78 = (const char *)unzipPath;
          _os_log_error_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_ERROR, "Failed to create archive for passthrough EA on path %@", buf, 0xCu);
        }

        v11 = self->_unzipPath;
        v83 = *MEMORY[0x1E0CB2AA0];
        v84[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 362, CFSTR("SZExtractorErrorDomain"), 1, 0, v12, CFSTR("Failed to create archive for passthrough EA on path %@"), v13, (uint64_t)self->_unzipPath);
LABEL_38:
        v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_53:
        return v2;
      }
    }
    else
    {
      v9 = (void *)objc_opt_new();
      if (!v9)
        goto LABEL_9;
    }
    v41 = -[NSString fileSystemRepresentation](self->_unzipPath, "fileSystemRepresentation");
    v42 = objc_retainAutorelease(v9);
    if (setxattr(v41, "com.apple.StreamingPassthroughResumptionData", (const void *)objc_msgSend(v42, "bytes"), objc_msgSend(v42, "length"), 0, 1))
    {
      v43 = *__error();
      SZGetLoggingHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v57 = self->_unzipPath;
        v58 = strerror(v43);
        *(_DWORD *)buf = 136315650;
        v78 = "com.apple.StreamingPassthroughResumptionData";
        v79 = 2112;
        v80 = (unint64_t)v57;
        v81 = 2080;
        v82 = v58;
        _os_log_error_impl(&dword_1D4E55000, v44, OS_LOG_TYPE_ERROR, "Failed to set passthrough EA %s on path %@: %s", buf, 0x20u);
      }

      v45 = (void *)*MEMORY[0x1E0CB2FE0];
      v46 = self->_unzipPath;
      v75 = *MEMORY[0x1E0CB2AA0];
      v76 = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v43);
      _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 367, v45, v43, 0, v12, CFSTR("Failed to set passthrough EA %s on path %@: %s"), v47, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
      goto LABEL_38;
    }

    return 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "setOutputFormat:", 200);
  objc_msgSend(v9, "encodeInt:forKey:", 8, CFSTR("SerializationVersion"));
  v14 = self->_hashes;
  if (v14 && -[NSArray count](v14, "count"))
    objc_msgSend(v9, "encodeBytes:length:forKey:", &self->_hashContext.context, gHashContextSizes[self->_hashContext.hashType], CFSTR("HashContext"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_streamInfoDict, CFSTR("StreamInfoDict"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_lastChunkPartialHash, CFSTR("LastChunkPartialHash"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_unsureData, CFSTR("UnsureData"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_inMemoryFileData, CFSTR("InMemoryFileData"));
  currentLFRecord = self->_currentLFRecord;
  if (currentLFRecord)
  {
    if (HIWORD(currentLFRecord->var7.var0) + (unint64_t)currentLFRecord->var8.var0 + 30 >= self->_currentLFRecordAllocationSize)
      currentLFRecordAllocationSize = self->_currentLFRecordAllocationSize;
    else
      currentLFRecordAllocationSize = HIWORD(currentLFRecord->var7.var0)
                                    + (unint64_t)currentLFRecord->var8.var0
                                    + 30;
    objc_msgSend(v9, "encodeBytes:length:forKey:", currentLFRecord, currentLFRecordAllocationSize, CFSTR("LocalFileRecord"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_thisStageBytesComplete);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v17, CFSTR("StageBytesComplete"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_currentOffset);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v18, CFSTR("CurrentOffset"));

  v19 = self->_fileWriter;
  if (v19)
  {
    v65 = 0;
    v20 = -[StreamingFileWriter currentOffsetWithError:](v19, "currentOffsetWithError:", &v65);
    v21 = v65;
    v22 = v21;
    if (v20 == -1)
    {
      SZGetLoggingHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D4E55000, v48, OS_LOG_TYPE_ERROR, "Unable to get current output offset from current output file", buf, 2u);
      }

      v73 = *MEMORY[0x1E0CB2AA0];
      GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("Unable to get current output offset from current output file");
      v53 = 395;
    }
    else
    {
      if (v20 == self->_uncompressedBytesOutput)
      {

        goto LABEL_24;
      }
      SZGetLoggingHandle();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        uncompressedBytesOutput = self->_uncompressedBytesOutput;
        *(_DWORD *)buf = 134218240;
        v78 = (const char *)uncompressedBytesOutput;
        v79 = 2048;
        v80 = v20;
        _os_log_error_impl(&dword_1D4E55000, v56, OS_LOG_TYPE_ERROR, "Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)", buf, 0x16u);
      }

      v71 = *MEMORY[0x1E0CB2AA0];
      GetFileNameStringFromLocalFileRecord(self->_currentLFRecord->var0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = self->_uncompressedBytesOutput;
      v52 = CFSTR("Mismatch between uncompressed bytes output (%llu) and output file offset (%lld)");
      v53 = 397;
    }
    _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", v53, CFSTR("SZExtractorErrorDomain"), 1, v22, v51, v52, v50, v63);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_53;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uncompressedBytesOutput);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v23, CFSTR("CurrentOutputFileOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalFileSizeWritten);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v24, CFSTR("TotalFileSizeWritten"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_currentCRC32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v25, CFSTR("CurrentCRC32"));

  state = self->_cmpState.state;
  if (state)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", state, compression_stream_get_state_size(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v27, CFSTR("SerializedCompressionState"));

  }
  objc_msgSend(v9, "encodeBool:forKey:", self->_fileWriter != 0, CFSTR("OpenCurrentOutputFile"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_recordsProcessed);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v28, CFSTR("RecordsProcessed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_currentLFMode);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v29, CFSTR("LocalFileMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_streamState);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v30, CFSTR("StreamState"));

  objc_msgSend(v9, "encodeBool:forKey:", self->_storeCurrentFileInMemory, CFSTR("StoreCurrentFileInMemory"));
  objc_msgSend(v9, "encodedData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_unzipPath, "stringByAppendingPathComponent:", CFSTR("com.apple.StreamingUnzipResumptionData"));
  v32 = (char *)objc_claimAutoreleasedReturnValue();
  SZGetLoggingHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v31)
  {
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v32;
      _os_log_error_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_ERROR, "Failed to create archive for resumption data to path %@", buf, 0xCu);
    }

    v69 = *MEMORY[0x1E0CB2AA0];
    v70 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 424, CFSTR("SZExtractorErrorDomain"), 1, 0, v37, CFSTR("Failed to create archive for resumption data to path %@"), v54, (uint64_t)v32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v60 = objc_msgSend(v31, "length");
    currentOffset = self->_currentOffset;
    *(_DWORD *)buf = 134218240;
    v78 = (const char *)v60;
    v79 = 2048;
    v80 = currentOffset;
    _os_log_debug_impl(&dword_1D4E55000, v34, OS_LOG_TYPE_DEBUG, "Serializing %lu bytes of resumption data for offset %llu", buf, 0x16u);
  }

  v64 = 0;
  v35 = 1;
  v36 = objc_msgSend(v31, "writeToFile:options:error:", v32, 1, &v64);
  v37 = v64;
  if ((v36 & 1) == 0)
  {
    SZGetLoggingHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v78 = v32;
      v79 = 2112;
      v80 = (unint64_t)v37;
      _os_log_error_impl(&dword_1D4E55000, v38, OS_LOG_TYPE_ERROR, "Failed to save resumption data to path %@: %@", buf, 0x16u);
    }

    v67 = *MEMORY[0x1E0CB2AA0];
    v68 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[StreamingUnzipState serializeState]", 431, CFSTR("SZExtractorErrorDomain"), 1, v37, v39, CFSTR("Failed to save resumption data to path %@: %@"), v40, (uint64_t)v32);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
    v35 = 0;
  }

  if (v35)
    return 0;
  return v2;
}

- (id)checkLastChunkPartialHash
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *lastChunkPartialHash;
  _OWORD v20[13];
  CC_LONG64 v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = gHashDigestSizes[self->_hashContext.hashType];
  v4 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[11];
  v20[10] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[9];
  v20[11] = v4;
  v20[12] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[13];
  v21 = self->_hashContext.context.sha384.wbuf[15];
  v5 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[3];
  v20[6] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[1];
  v20[7] = v5;
  v6 = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[7];
  v20[8] = *(_OWORD *)&self->_hashContext.context.sha512.wbuf[5];
  v20[9] = v6;
  v7 = *(_OWORD *)&self->_hashContext.context.sha512.hash[3];
  v20[2] = *(_OWORD *)&self->_hashContext.context.sha512.hash[1];
  v20[3] = v7;
  v8 = *(_OWORD *)&self->_hashContext.context.sha512.hash[7];
  v20[4] = *(_OWORD *)&self->_hashContext.context.sha512.hash[5];
  v20[5] = v8;
  v9 = *(_OWORD *)&self->_hashContext.context.sha512.count[1];
  v20[0] = *(_OWORD *)&self->_hashContext.hashType;
  v20[1] = v9;
  GenericHashFinal((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20);
  StringFromDigest((unsigned __int8 *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "caseInsensitiveCompare:", self->_lastChunkPartialHash);
  SZGetLoggingHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      lastChunkPartialHash = self->_lastChunkPartialHash;
      *(_DWORD *)buf = 138412546;
      v25 = lastChunkPartialHash;
      v26 = 2112;
      v27 = v10;
      _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for last partial chunk: expected %@, got %@", buf, 0x16u);
    }

    v22 = CFSTR("SZExtractorFileOffsetErrorKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_currentOffset);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[StreamingUnzipState checkLastChunkPartialHash]", 491, CFSTR("SZExtractorErrorDomain"), 2, 0, v15, CFSTR("Hash mismatch for last partial chunk: expected %@, got %@"), v16, (uint64_t)self->_lastChunkPartialHash);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = (NSString *)v10;
      _os_log_debug_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_DEBUG, "Verified that last chunk partial hash matches: %@", buf, 0xCu);
    }

    v17 = 0;
    self->_bytesHashedInChunk = 0;
  }

  return v17;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5 onlyFinishCurrentChunk:(BOOL)a6
{
  void *hashes;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t hashedChunkSize;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  NSUInteger v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  NSUInteger v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  hashes = self->_hashes;
  if (hashes)
  {
    hashes = (void *)objc_msgSend(hashes, "count");
    if (hashes)
    {
      if (self->_hashedChunkSize || -[NSArray count](self->_hashes, "count") < 2)
      {
        if (a5)
        {
          while (1)
          {
            hashedChunkSize = self->_hashedChunkSize;
            v16 = a5;
            if (hashedChunkSize)
            {
              v17 = hashedChunkSize - self->_bytesHashedInChunk;
              if (a5 >= v17)
                v16 = v17;
              else
                v16 = a5;
            }
            GenericHashUpdate((uint64_t)&self->_hashContext, (void *)a4, v16);
            v18 = self->_hashedChunkSize;
            v19 = self->_bytesHashedInChunk + v16;
            self->_bytesHashedInChunk = v19;
            if (!v18)
              break;
            a5 -= v16;
            if (v19 > v18)
              __assert_rtn("-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", "StreamingUnzipState.m", 534, "_bytesHashedInChunk <= _hashedChunkSize");
            a4 = (char *)a4 + v16;
            a3 += v16;
            if (v19 == v18)
            {
              -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, a3 - v19);
              hashes = (void *)objc_claimAutoreleasedReturnValue();
              if (hashes)
                return hashes;
              GenericHashInit((uint64_t)&self->_hashContext, self->_hashContext.hashType);
              hashes = 0;
              self->_bytesHashedInChunk = 0;
              if (a6 || !a5)
                return hashes;
            }
            else if (!a5)
            {
              break;
            }
          }
        }
        hashes = 0;
      }
      else
      {
        SZGetLoggingHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v21 = self->_hashedChunkSize;
          v22 = -[NSArray count](self->_hashes, "count");
          *(_DWORD *)buf = 134218240;
          v24 = v21;
          v25 = 2048;
          v26 = v22;
          _os_log_error_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_ERROR, "Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes", buf, 0x16u);
        }

        v13 = self->_hashedChunkSize;
        -[NSArray count](self->_hashes, "count");
        _CreateError((uint64_t)"-[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:]", 508, CFSTR("SZExtractorErrorDomain"), 4, 0, 0, CFSTR("Ambiguous or missing hash chunk size: chunk size is %llu but have %lu hashes"), v14, v13);
        hashes = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return hashes;
}

- (id)updateHashFromOffset:(unint64_t)a3 withBytes:(const void *)a4 length:(unint64_t)a5
{
  return -[StreamingUnzipState updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:](self, "updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:", a3, a4, a5, 0);
}

- (id)finishStream
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  -[StreamingUnzipState clearSavedState](self, "clearSavedState");
  if (self->_streamState - 5 >= 3)
  {
    SZGetLoggingHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_1D4E55000, v4, OS_LOG_TYPE_ERROR, "Finishing an incomplete stream! This stream will not be resumable.", (uint8_t *)&v8, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipState finishStream]", 568, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Finishing an incomplete stream! This stream will not be resumable."), v5, v8);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_bytesHashedInChunk)
    {
      v6 = 0;
      goto LABEL_8;
    }
    -[StreamingUnzipState _checkHashForOffset:]((uint64_t)self, self->_currentOffset);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v3;
LABEL_8:
  -[StreamingUnzipState setStreamState:](self, "setStreamState:", 7);
  return v6;
}

- (BOOL)resolveOwnershipWithExtraField:(id *)a3 outUID:(unsigned int *)a4 outGID:(unsigned int *)a5
{
  int var0;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uid_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;

  if (a3 && a3->var1.var0 >= 0xCu)
  {
    var0 = a3->var4.var0;
    v9 = a3->var5.var0;
    v10 = 1;
  }
  else
  {
    v10 = 0;
    v9 = 0xFFFFFFFFLL;
    var0 = -1;
  }
  -[StreamingUnzipState overrideUID](self, "overrideUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[StreamingUnzipState overrideGID](self, "overrideGID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    var0 = objc_msgSend(v11, "unsignedIntValue");
    if (!v13)
      goto LABEL_10;
LABEL_9:
    v9 = objc_msgSend(v13, "unsignedIntValue");
    goto LABEL_10;
  }
  if (v12)
    goto LABEL_9;
  if (!v10)
    goto LABEL_14;
LABEL_10:
  -[StreamingUnzipState cachedGIDs](self, "cachedGIDs");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = getuid();
  if (v15)
  {
    if (var0 != -1 && v15 != var0)
      goto LABEL_13;
    if ((_DWORD)v9 == -1)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v14 && v17 && !objc_msgSend(v14, "containsObject:", v17))
      {

LABEL_13:
LABEL_14:
        v16 = 0;
        goto LABEL_32;
      }
    }

  }
  if (a4)
  {
    if (getuid())
      v19 = -1;
    else
      v19 = var0;
    *a4 = v19;
  }
  if (a5)
    *a5 = v9;
  v16 = 1;
LABEL_32:

  return v16;
}

- (NSString)unzipPath
{
  return self->_unzipPath;
}

- ($5C6E2A525B2F304BB512036F15118BA6)hashContext
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)self[1].var1.var5.wbuf;
  *(_OWORD *)&retstr->var1.var5.wbuf[9] = *(_OWORD *)&self[1].var1.var5.hash[6];
  *(_OWORD *)&retstr->var1.var5.wbuf[11] = v3;
  *(_OWORD *)&retstr->var1.var5.wbuf[13] = *(_OWORD *)&self[1].var1.var5.wbuf[2];
  retstr->var1.var4.wbuf[15] = self[1].var1.var4.wbuf[4];
  v4 = *(_OWORD *)self[1].var1.var5.hash;
  *(_OWORD *)&retstr->var1.var5.wbuf[1] = *(_OWORD *)&self[1].var1.var0.A;
  *(_OWORD *)&retstr->var1.var5.wbuf[3] = v4;
  v5 = *(_OWORD *)&self[1].var1.var5.hash[4];
  *(_OWORD *)&retstr->var1.var5.wbuf[5] = *(_OWORD *)&self[1].var1.var5.hash[2];
  *(_OWORD *)&retstr->var1.var5.wbuf[7] = v5;
  v6 = *(_OWORD *)&self->var1.var5.wbuf[11];
  *(_OWORD *)&retstr->var1.var5.hash[1] = *(_OWORD *)&self->var1.var5.wbuf[9];
  *(_OWORD *)&retstr->var1.var5.hash[3] = v6;
  v7 = *(_OWORD *)&self->var1.var5.wbuf[15];
  *(_OWORD *)&retstr->var1.var5.hash[5] = *(_OWORD *)&self->var1.var5.wbuf[13];
  *(_OWORD *)&retstr->var1.var5.hash[7] = v7;
  v8 = *(_OWORD *)&self->var1.var5.wbuf[7];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var5.wbuf[5];
  *(_OWORD *)&retstr->var1.var5.count[1] = v8;
  return self;
}

- (NSDictionary)streamInfoDict
{
  return self->_streamInfoDict;
}

- (void)setStreamInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_streamInfoDict, a3);
}

- (NSString)lastChunkPartialHash
{
  return self->_lastChunkPartialHash;
}

- (void)setLastChunkPartialHash:(id)a3
{
  objc_storeStrong((id *)&self->_lastChunkPartialHash, a3);
}

- (NSMutableData)unsureData
{
  return self->_unsureData;
}

- (void)setUnsureData:(id)a3
{
  objc_storeStrong((id *)&self->_unsureData, a3);
}

- (NSMutableData)inMemoryFileData
{
  return self->_inMemoryFileData;
}

- (void)setInMemoryFileData:(id)a3
{
  objc_storeStrong((id *)&self->_inMemoryFileData, a3);
}

- ($3632F29577C185DF68DCA35DB3C0928E)currentLFRecord
{
  return self->_currentLFRecord;
}

- (void)setCurrentLFRecord:(id *)a3
{
  self->_currentLFRecord = a3;
}

- (unint64_t)currentLFRecordAllocationSize
{
  return self->_currentLFRecordAllocationSize;
}

- (void)setCurrentLFRecordAllocationSize:(unint64_t)a3
{
  self->_currentLFRecordAllocationSize = a3;
}

- (unint64_t)thisStageBytesComplete
{
  return self->_thisStageBytesComplete;
}

- (void)setThisStageBytesComplete:(unint64_t)a3
{
  self->_thisStageBytesComplete = a3;
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_currentOffset = a3;
}

- (unint64_t)currentCRC32
{
  return self->_currentCRC32;
}

- (void)setCurrentCRC32:(unint64_t)a3
{
  self->_currentCRC32 = a3;
}

- (unint64_t)recordsProcessed
{
  return self->_recordsProcessed;
}

- (void)setRecordsProcessed:(unint64_t)a3
{
  self->_recordsProcessed = a3;
}

- (unint64_t)totalRecordCount
{
  return self->_totalRecordCount;
}

- (void)setTotalRecordCount:(unint64_t)a3
{
  self->_totalRecordCount = a3;
}

- (unint64_t)totalUncompressedBytes
{
  return self->_totalUncompressedBytes;
}

- (void)setTotalUncompressedBytes:(unint64_t)a3
{
  self->_totalUncompressedBytes = a3;
}

- (unsigned)currentLFMode
{
  return self->_currentLFMode;
}

- (void)setCurrentLFMode:(unsigned __int16)a3
{
  self->_currentLFMode = a3;
}

- (unsigned)streamState
{
  return self->_streamState;
}

- (BOOL)storeCurrentFileInMemory
{
  return self->_storeCurrentFileInMemory;
}

- (void)setStoreCurrentFileInMemory:(BOOL)a3
{
  self->_storeCurrentFileInMemory = a3;
}

- (BOOL)currentLFRequiresDataDescriptor
{
  return self->_currentLFRequiresDataDescriptor;
}

- (void)setCurrentLFRequiresDataDescriptor:(BOOL)a3
{
  self->_currentLFRequiresDataDescriptor = a3;
}

- (unint64_t)bytesHashedInChunk
{
  return self->_bytesHashedInChunk;
}

- (unint64_t)hashedChunkSize
{
  return self->_hashedChunkSize;
}

- (unint64_t)uncompressedBytesOutput
{
  return self->_uncompressedBytesOutput;
}

- (void)setUncompressedBytesOutput:(unint64_t)a3
{
  self->_uncompressedBytesOutput = a3;
}

- (unint64_t)totalFileSizeWritten
{
  return self->_totalFileSizeWritten;
}

- (void)setTotalFileSizeWritten:(unint64_t)a3
{
  self->_totalFileSizeWritten = a3;
}

- ($AA9291E5398F62F4D1A894576DDA1914)dataDescriptor
{
  return self->_dataDescriptor;
}

- (void)setDataDescriptor:(id *)a3
{
  self->_dataDescriptor = a3;
}

- (BOOL)denyInvalidSymlinks
{
  return self->_denyInvalidSymlinks;
}

- (void)setDenyInvalidSymlinks:(BOOL)a3
{
  self->_denyInvalidSymlinks = a3;
}

- (BOOL)performCachedWrites
{
  return self->_performCachedWrites;
}

- (void)setPerformCachedWrites:(BOOL)a3
{
  self->_performCachedWrites = a3;
}

- (BOOL)performingExtraction
{
  return self->_performingExtraction;
}

- (void)setPerformingExtraction:(BOOL)a3
{
  self->_performingExtraction = a3;
}

- (NSNumber)overrideUID
{
  return self->_overrideUID;
}

- (NSNumber)overrideGID
{
  return self->_overrideGID;
}

- (StreamingFileWriter)fileWriter
{
  return self->_fileWriter;
}

- (void)setFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_fileWriter, a3);
}

- (NSSet)cachedGIDs
{
  return self->_cachedGIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedGIDs, 0);
  objc_storeStrong((id *)&self->_fileWriter, 0);
  objc_storeStrong((id *)&self->_inMemoryFileData, 0);
  objc_storeStrong((id *)&self->_unsureData, 0);
  objc_storeStrong((id *)&self->_lastChunkPartialHash, 0);
  objc_storeStrong((id *)&self->_streamInfoDict, 0);
  objc_storeStrong((id *)&self->_overrideGID, 0);
  objc_storeStrong((id *)&self->_overrideUID, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_unzipPath, 0);
}

- (id)_checkHashForOffset:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a1 + 128;
  v5 = gHashDigestSizes[*(unsigned int *)(a1 + 128)];
  GenericHashFinal(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a1 + 128);
  StringFromDigest(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(v4 - 72);
  if (v7)
    v8 = a2 / v7;
  else
    v8 = 0;
  if (v8 >= objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v31[0] = CFSTR("SZExtractorFileOffsetErrorKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = v6;
    v31[1] = CFSTR("SZExtractorActualHashValueErrorKey");
    v31[2] = CFSTR("SZExtractorHashChunkIndexErrorKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    SZGetLoggingHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(*(id *)(a1 + 96), "count");
      *(_DWORD *)buf = 134218240;
      v24 = v8;
      v25 = 2048;
      v26 = v22;
      _os_log_error_impl(&dword_1D4E55000, v18, OS_LOG_TYPE_ERROR, "Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
        buf,
        0x16u);
    }

    objc_msgSend(*(id *)(a1 + 96), "count");
    _CreateError((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 457, CFSTR("SZExtractorErrorDomain"), 4, 0, v9, CFSTR("Cannot validate hash; this chunk is index %llu, but we only have %lu hashes."),
      v19,
      v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "caseInsensitiveCompare:", v6))
    {
      v29[0] = CFSTR("SZExtractorFileOffsetErrorKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v10;
      v30[1] = v6;
      v29[1] = CFSTR("SZExtractorActualHashValueErrorKey");
      v29[2] = CFSTR("SZExtractorHashChunkIndexErrorKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      SZGetLoggingHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v24 = a2;
        v25 = 2112;
        v26 = (unint64_t)v9;
        v27 = 2112;
        v28 = v6;
        _os_log_error_impl(&dword_1D4E55000, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for chunk containing offset %llu: expected %@, got %@", buf, 0x20u);
      }

      _CreateError((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 466, CFSTR("SZExtractorErrorDomain"), 4, 0, v12, CFSTR("Hash mismatch for chunk containing offset %llu: expected %@, got %@"), v14, a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      SZGetLoggingHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v24 = a2;
        v25 = 2048;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        _os_log_debug_impl(&dword_1D4E55000, v20, OS_LOG_TYPE_DEBUG, "Verified that hashed data offset %llu matches index %llu: %@", buf, 0x20u);
      }

      v15 = 0;
    }
  }

  return v15;
}

+ (id)unzipStateWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  char *v9;
  id v10;
  int v11;
  id v12;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = -[StreamingUnzipState initWithPath:options:error:]([StreamingUnzipState alloc], v7, v8, 0);
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v15 = 0;
    v11 = _RemoveAndRecreateDirectoryAtPath(v7, &v15);
    v10 = v15;
    if (v11)
    {
      v14 = v10;
      v9 = -[StreamingUnzipState initWithPath:options:error:]([StreamingUnzipState alloc], v7, v8, &v14);
      v12 = v14;

      v10 = v12;
    }
    if (a5 && !v9)
    {
      v10 = objc_retainAutorelease(v10);
      *a5 = v10;
    }
  }

  return v9;
}

- (char)initWithPath:(void *)a3 options:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  char *v9;
  id v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uid_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  char *v47;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  int v73;
  id v74;
  const char *v75;
  int v76;
  NSObject *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  char v84;
  NSObject *v85;
  int v86;
  void *v87;
  unint64_t v88;
  unint64_t v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  off_t st_size;
  id v94;
  ssize_t v95;
  size_t v96;
  void *v97;
  const char *v98;
  ssize_t v99;
  NSObject *v100;
  id v101;
  int v102;
  unint64_t v103;
  unint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  NSObject *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  char *v116;
  NSObject *v117;
  id v118;
  int v119;
  NSObject *v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  void *v124;
  void *v125;
  id v126;
  ssize_t v127;
  NSObject *v128;
  id *v129;
  uint64_t v130;
  NSObject *v131;
  void *v132;
  uint64_t v133;
  NSObject *v134;
  id v135;
  const void *v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  size_t v153;
  const void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  _WORD *v163;
  uint64_t v164;
  NSObject *v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  void *v169;
  int v170;
  void *v171;
  size_t v172;
  void *v173;
  void *v174;
  char v175;
  id v176;
  NSObject *v177;
  void *v178;
  NSObject *v179;
  int v180;
  NSObject *v181;
  NSObject *v182;
  uint64_t v183;
  NSObject *v184;
  const void *v185;
  unint64_t v186;
  unint64_t v187;
  NSObject *v188;
  NSObject *v189;
  void *v190;
  uint64_t v191;
  NSObject *v192;
  uint64_t v193;
  char *v194;
  NSObject *v195;
  uint64_t v196;
  NSObject *v197;
  uint64_t v198;
  int *v199;
  char *v200;
  NSObject *v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  const char *v210;
  uint64_t v211;
  char *v212;
  const char *v213;
  uint64_t v214;
  id v215;
  void *v216;
  unsigned int *v217;
  uid_t v218;
  id v219;
  id v220;
  gid_t v221;
  id v222;
  id v223;
  id v224;
  void *v225;
  id v226;
  void *v227;
  id v228;
  unint64_t v229;
  void *v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  size_t __n;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  gid_t v250;
  uid_t v251;
  stat v252;
  id v253;
  objc_super v254;
  uint64_t v255;
  void *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  id v260;
  uint8_t buf[4];
  _BYTE v262[10];
  _BYTE v263[10];
  const char *v264;
  _QWORD v265[3];
  uint64_t v266;
  id v267;
  uint64_t v268;
  id v269;
  uint64_t v270;
  _QWORD v271[4];

  v271[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v47 = 0;
    goto LABEL_42;
  }
  if (a4)
    *a4 = 0;
  v254.receiver = a1;
  v254.super_class = (Class)StreamingUnzipState;
  v9 = (char *)objc_msgSendSuper2(&v254, sel_init);

  if (!v9)
  {
    SZGetLoggingHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v44, OS_LOG_TYPE_ERROR, "Failed to init", buf, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 856, (void *)*MEMORY[0x1E0CB2FE0], 12, 0, 0, CFSTR("Failed to init"), v45, v214);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v46;
    if (a4)
    {
      v43 = objc_retainAutorelease(v46);
      v42 = v43;
      v9 = 0;
      goto LABEL_38;
    }
    v9 = 0;
LABEL_40:
    v47 = 0;
    goto LABEL_41;
  }
  v10 = v8;
  v11 = (objc_class *)objc_opt_class();
  if (_ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsHashType"), v11)
    && (v12 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsHashesArray"), v12))
    && (v13 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsHashedChunkSize"), v13))
    && (v14 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsDenyInvalidSymlinks"), v14))
    && (v15 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsPerformCachedWrites"), v15))
    && (v16 = (objc_class *)objc_opt_class(),
        _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsQuarantineInfo"), v16))
    && (v17 = (objc_class *)objc_opt_class(),
        (_ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsOwnerUserID"), v17) & 1) != 0))
  {
    v18 = (objc_class *)objc_opt_class();
    v19 = _ValidateDictionaryKeyValueType(v10, CFSTR("SZExtractorOptionsOwnerGroupID"), v18);

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v7, "SZ_stringByDeletingTrailingSlashes");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)*((_QWORD *)v9 + 11);
      *((_QWORD *)v9 + 11) = v20;

      v22 = (void *)*((_QWORD *)v9 + 49);
      *((_QWORD *)v9 + 49) = 0;

      *((_QWORD *)v9 + 15) = 30;
      v23 = malloc_type_calloc(1uLL, 0x1EuLL, 0xD142217uLL);
      *((_QWORD *)v9 + 47) = v23;
      if (!v23)
      {
        SZGetLoggingHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D4E55000, v49, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E0CB2FE0];
        v52 = CFSTR("Could not allocate memory for local file record");
        v53 = 879;
        v54 = 12;
        goto LABEL_54;
      }
      v24 = objc_opt_new();
      v25 = (void *)*((_QWORD *)v9 + 45);
      *((_QWORD *)v9 + 45) = v24;

      v26 = objc_opt_new();
      v27 = (void *)*((_QWORD *)v9 + 46);
      *((_QWORD *)v9 + 46) = v26;

      objc_msgSend(v10, "objectForKey:", CFSTR("SZExtractorOptionsHashedChunkSize"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v9 + 7) = objc_msgSend(v28, "unsignedLongLongValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("SZExtractorOptionsHashesArray"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*((_QWORD *)v9 + 12);
      *((_QWORD *)v9 + 12) = v29;

      if ((unint64_t)objc_msgSend(*((id *)v9 + 12), "count") >= 2 && !*((_QWORD *)v9 + 7))
      {
        SZGetLoggingHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D4E55000, v56, OS_LOG_TYPE_ERROR, "Ambiguous chunk size (hashes > 1 but chunkSize == 0)", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E0CB2FE0];
        v52 = CFSTR("Ambiguous chunk size (hashes > 1 but chunkSize == 0)");
        v53 = 890;
        goto LABEL_53;
      }
      if (!objc_msgSend(*((id *)v9 + 12), "count") && *((_QWORD *)v9 + 7))
      {
        SZGetLoggingHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D4E55000, v55, OS_LOG_TYPE_ERROR, "Hash chunk size given as > 0, but no hashes", buf, 2u);
        }

        v51 = (void *)*MEMORY[0x1E0CB2FE0];
        v52 = CFSTR("Hash chunk size given as > 0, but no hashes");
        v53 = 895;
LABEL_53:
        v54 = 22;
LABEL_54:
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", v53, v51, v54, 0, 0, v52, v50, v214);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v58 = 0;
LABEL_70:
        objc_msgSend(v58, "finishDecoding");
        if (v42)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v42);

          v9 = 0;
        }
        v9 = v9;

        v47 = v9;
        goto LABEL_41;
      }
      objc_msgSend(v10, "objectForKey:", CFSTR("SZExtractorOptionsDenyInvalidSymlinks"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9[453] = objc_msgSend(v31, "BOOLValue");

      objc_msgSend(v10, "objectForKey:", CFSTR("SZExtractorOptionsPerformCachedWrites"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v9[454] = objc_msgSend(v32, "BOOLValue");

      if (v9[454])
      {
        SZGetLoggingHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v262 = v7;
          _os_log_impl(&dword_1D4E55000, v33, OS_LOG_TYPE_DEFAULT, "Performing cached writes to extraction under %@", buf, 0xCu);
        }

      }
      v253 = 0;
      FetchGroupIDs(&v253);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = v253;
      if (!v34)
      {
        SZGetLoggingHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v262 = v228;
          _os_log_impl(&dword_1D4E55000, v35, OS_LOG_TYPE_DEFAULT, "Failed to fetch current group access list, falling back to always calling chown: %@", buf, 0xCu);
        }

        v228 = 0;
      }
      v227 = v34;
      objc_storeStrong((id *)v9 + 57, v34);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SZExtractorOptionsOwnerUserID"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        if (getuid())
        {
          SZGetLoggingHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = getuid();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v262 = v38;
            _os_log_impl(&dword_1D4E55000, v37, OS_LOG_TYPE_DEFAULT, "Use of SZExtractorOptionsOwnerUserID requires the caller to be running as root, but it was running as uid %d; ignoring.",
              buf,
              8u);
          }
        }
        else
        {
          v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(v36, "unsignedIntValue"));
          v37 = *((_QWORD *)v9 + 13);
          *((_QWORD *)v9 + 13) = v59;
        }

      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SZExtractorOptionsOwnerGroupID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v61 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(v60, "unsignedIntValue"));
        v62 = (void *)*((_QWORD *)v9 + 14);
        *((_QWORD *)v9 + 14) = v61;

      }
      objc_msgSend(v10, "objectForKey:", CFSTR("SZExtractorOptionsHashType"));
      v63 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v63;
      if (!v63 || (objc_msgSend(v63, "isEqualToString:", CFSTR("SZExtractorHashTypeMD5")) & 1) != 0)
        goto LABEL_61;
      if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SZExtractorHashTypeSHA1")) & 1) != 0)
      {
        v65 = 1;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SZExtractorHashTypeSHA224")) & 1) != 0)
      {
        v65 = 4;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SZExtractorHashTypeSHA256")) & 1) != 0)
      {
        v65 = 5;
      }
      else if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SZExtractorHashTypeSHA384")) & 1) != 0)
      {
        v65 = 6;
      }
      else
      {
        if ((objc_msgSend(v64, "isEqualToString:", CFSTR("SZExtractorHashTypeSHA512")) & 1) == 0)
        {
          SZGetLoggingHandle();
          v134 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v262 = v64;
            _os_log_error_impl(&dword_1D4E55000, v134, OS_LOG_TYPE_ERROR, "Unsupported hash type: %@. Defaulting to MD5", buf, 0xCu);
          }

LABEL_61:
          v65 = 0;
          goto LABEL_62;
        }
        v65 = 7;
      }
LABEL_62:

      GenericHashInit((uint64_t)(v9 + 128), v65);
      *((_QWORD *)v9 + 5) = 0;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 8) = 0u;
      memset(&v252, 0, sizeof(v252));
      v66 = objc_retainAutorelease(v7);
      if (stat((const char *)objc_msgSend(v66, "fileSystemRepresentation"), &v252))
      {
        v67 = (uint64_t)v66;
        v68 = *__error();
        SZGetLoggingHandle();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v116 = strerror(v68);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v262 = v67;
          *(_WORD *)&v262[8] = 2080;
          *(_QWORD *)v263 = v116;
          _os_log_error_impl(&dword_1D4E55000, v69, OS_LOG_TYPE_ERROR, "Failed to stat path %@: %s", buf, 0x16u);
        }

        v70 = (void *)*MEMORY[0x1E0CB2FE0];
        v270 = *MEMORY[0x1E0CB2AA0];
        v271[0] = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v271, &v270, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v68);
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 938, v70, v68, 0, v71, CFSTR("Failed to stat path %@: %s"), v72, v67);
LABEL_66:
        v42 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
LABEL_68:
        v58 = 0;
LABEL_69:
        v57 = v227;
        goto LABEL_70;
      }
      v73 = v252.st_mode & 0xF000;
      if (v73 != 0x4000 && v73 != 0x8000)
      {
        SZGetLoggingHandle();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v262 = v66;
          *(_WORD *)&v262[8] = 1024;
          *(_DWORD *)v263 = v252.st_mode;
          _os_log_error_impl(&dword_1D4E55000, v90, OS_LOG_TYPE_ERROR, "Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)", buf, 0x12u);
        }

        v268 = *MEMORY[0x1E0CB2AA0];
        v269 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v269, &v268, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 944, CFSTR("SZExtractorErrorDomain"), 3, 0, v91, CFSTR("Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)"), v92, (uint64_t)v66);
        v42 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_67;
      }
      v217 = (unsigned int *)(v9 + 128);
      v250 = -1;
      v251 = -1;
      if (objc_msgSend(v9, "resolveOwnershipWithExtraField:outUID:outGID:", 0, &v251, &v250))
      {
        v74 = objc_retainAutorelease(v66);
        v75 = (const char *)objc_msgSend(v74, "fileSystemRepresentation");
        if (lchown(v75, v251, v250))
        {
          v224 = v66;
          v76 = *__error();
          SZGetLoggingHandle();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            v78 = objc_msgSend(objc_retainAutorelease(v74), "fileSystemRepresentation");
            v218 = v251;
            v221 = v250;
            v79 = strerror(v76);
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)v262 = v78;
            *(_WORD *)&v262[8] = 1024;
            *(_DWORD *)v263 = v218;
            *(_WORD *)&v263[4] = 1024;
            *(_DWORD *)&v263[6] = v221;
            LOWORD(v264) = 1024;
            *(_DWORD *)((char *)&v264 + 2) = v76;
            HIWORD(v264) = 2080;
            v265[0] = v79;
            _os_log_impl(&dword_1D4E55000, v77, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", buf, 0x28u);
          }

          v66 = v224;
        }
      }
      if ((v252.st_mode & 0xF000) == 0x4000)
      {
        __n = 0;
        v225 = v66;
        objc_msgSend(v66, "stringByAppendingPathComponent:", CFSTR("com.apple.StreamingUnzipResumptionData"));
        v80 = objc_claimAutoreleasedReturnValue();
        v240 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v80, 2, &v240);
        v81 = objc_claimAutoreleasedReturnValue();
        v82 = v240;
        v219 = v82;
        v222 = (id)v81;
        v216 = (void *)v80;
        if (v81)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v237 = 0;
          v84 = objc_msgSend(v83, "removeItemAtPath:error:", v80, &v237);
          v215 = v237;

          if ((v84 & 1) == 0)
          {
            SZGetLoggingHandle();
            v85 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v262 = v216;
              *(_WORD *)&v262[8] = 2112;
              *(_QWORD *)v263 = v215;
              _os_log_error_impl(&dword_1D4E55000, v85, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
            }

          }
          v236 = v228;
          v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v222, &v236);
          v42 = v236;

          objc_msgSend(v58, "setDecodingFailurePolicy:", 0);
          if (!v58)
          {
            SZGetLoggingHandle();
            v117 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v262 = v42;
              _os_log_error_impl(&dword_1D4E55000, v117, OS_LOG_TYPE_ERROR, "Failed to deserialize resumption data (%@); resuming from offset 0",
                buf,
                0xCu);
            }

            v234 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v234);
            v118 = v234;
            v58 = 0;
            goto LABEL_193;
          }
          v86 = objc_msgSend(v58, "decodeIntForKey:", CFSTR("SerializationVersion"));
          if (v86 == 8)
          {
            objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOffset"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v229 = objc_msgSend(v87, "unsignedLongLongValue");

            if (!objc_msgSend(*((id *)v9 + 12), "count"))
              goto LABEL_160;
            v88 = *((_QWORD *)v9 + 7);
            if (v88)
              v89 = v229 / v88;
            else
              v89 = 0;
            if (v89 < objc_msgSend(*((id *)v9 + 12), "count"))
            {
              v135 = objc_retainAutorelease(v58);
              v136 = (const void *)objc_msgSend(v135, "decodeBytesForKey:returnedLength:", CFSTR("HashContext"), &__n);
              if (v136 && __n)
              {
                if (__n != gHashContextSizes[*v217])
                {
                  SZGetLoggingHandle();
                  v184 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                  {
                    v208 = *v217;
                    v209 = gHashStringNames[v208];
                    v210 = (const char *)gHashContextSizes[v208];
                    *(_DWORD *)buf = 136315650;
                    *(_QWORD *)v262 = v209;
                    *(_WORD *)&v262[8] = 2048;
                    *(_QWORD *)v263 = __n;
                    *(_WORD *)&v263[8] = 2048;
                    v264 = v210;
                    _os_log_error_impl(&dword_1D4E55000, v184, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                      buf,
                      0x20u);
                  }

                  v232 = v42;
                  _RemoveAndRecreateDirectoryAtPath(v225, &v232);
                  v125 = v42;
                  v42 = v232;
                  v58 = v135;
                  goto LABEL_194;
                }
                memcpy(v9 + 136, v136, __n);
                v137 = *((_QWORD *)v9 + 7);
                v138 = v229;
                if (v137)
                  v138 = v229 % v137;
                *((_QWORD *)v9 + 8) = v138;
              }
LABEL_160:
              objc_msgSend(v58, "decodePropertyListForKey:", CFSTR("StreamInfoDict"));
              v139 = objc_claimAutoreleasedReturnValue();
              v140 = (void *)*((_QWORD *)v9 + 43);
              *((_QWORD *)v9 + 43) = v139;

              v141 = (void *)*((_QWORD *)v9 + 43);
              if (v141)
              {
                objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("RecordCount"));
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                *((_QWORD *)v9 + 53) = objc_msgSend(v142, "unsignedLongLongValue");

                objc_msgSend(*((id *)v9 + 43), "objectForKeyedSubscript:", CFSTR("TotalUncompressedBytes"));
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                *((_QWORD *)v9 + 54) = objc_msgSend(v143, "unsignedLongLongValue");

              }
              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastChunkPartialHash"));
              v144 = objc_claimAutoreleasedReturnValue();
              v145 = (void *)*((_QWORD *)v9 + 44);
              *((_QWORD *)v9 + 44) = v144;

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnsureData"));
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = objc_msgSend(v146, "mutableCopy");
              v148 = (void *)*((_QWORD *)v9 + 45);
              *((_QWORD *)v9 + 45) = v147;

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InMemoryFileData"));
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = objc_msgSend(v149, "mutableCopy");
              v151 = (void *)*((_QWORD *)v9 + 46);
              *((_QWORD *)v9 + 46) = v150;

              __n = 0;
              v58 = objc_retainAutorelease(v58);
              v152 = objc_msgSend(v58, "decodeBytesForKey:returnedLength:", CFSTR("LocalFileRecord"), &__n);
              if (v152)
              {
                v153 = __n;
                if (__n)
                {
                  v154 = (const void *)v152;
                  v155 = (void *)*((_QWORD *)v9 + 47);
                  if (*((_QWORD *)v9 + 15) < __n)
                  {
                    v155 = reallocf(v155, __n);
                    *((_QWORD *)v9 + 47) = v155;
                    if (!v155)
                    {
                      SZGetLoggingHandle();
                      v192 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_error_impl(&dword_1D4E55000, v192, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
                      }

                      _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1160, (void *)*MEMORY[0x1E0CB2FE0], 12, 0, 0, CFSTR("Could not allocate memory for local file record"), v193, v214);
LABEL_230:
                      v118 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_193;
                    }
                    v153 = __n;
                    *((_QWORD *)v9 + 15) = __n;
                  }
                  memcpy(v155, v154, v153);
                }
              }
              v9[452] = (*(_BYTE *)(*((_QWORD *)v9 + 47) + 6) & 8) != 0;
              __n = 0;
              v58 = objc_retainAutorelease(v58);
              if (objc_msgSend(v58, "decodeBytesForKey:returnedLength:", CFSTR("DataDescriptorUnion"), &__n) && __n)
              {
                *((_QWORD *)v9 + 48) = malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
                __memcpy_chk();
              }
              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StageBytesComplete"));
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)v9 + 50) = objc_msgSend(v156, "unsignedLongLongValue");

              *((_QWORD *)v9 + 51) = v229;
              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StreamState"));
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v9[450] = objc_msgSend(v157, "unsignedCharValue");

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentCRC32"));
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)v9 + 55) = objc_msgSend(v158, "unsignedLongValue");

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordsProcessed"));
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)v9 + 52) = objc_msgSend(v159, "unsignedShortValue");

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalFileMode"));
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              *((_WORD *)v9 + 224) = objc_msgSend(v160, "unsignedShortValue") & 0xF1FF;

              v9[451] = objc_msgSend(v58, "decodeBoolForKey:", CFSTR("StoreCurrentFileInMemory"));
              *((_QWORD *)v9 + 6) = *((_QWORD *)v9 + 51);
              if (v9[450] < 2u)
                goto LABEL_195;
              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOutputFileOffset"));
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)v9 + 9) = objc_msgSend(v161, "unsignedLongLongValue");

              objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TotalFileSizeWritten"));
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)v9 + 10) = objc_msgSend(v162, "unsignedLongLongValue");

              v163 = (_WORD *)*((_QWORD *)v9 + 47);
              if (v163)
              {
                GetFileNameStringFromLocalFileRecord(v163);
                v164 = objc_claimAutoreleasedReturnValue();
                if (!v164)
                {
                  SZGetLoggingHandle();
                  v189 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1D4E55000, v189, OS_LOG_TYPE_ERROR, "Failed to get path from current local file record.", buf, 2u);
                  }

                  v257 = *MEMORY[0x1E0CB2AA0];
                  v258 = v225;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v258, &v257, 1);
                  v190 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1202, CFSTR("SZExtractorErrorDomain"), 1, 0, v190, CFSTR("Failed to get path from current local file record."), v191, v214);
                  v176 = (id)objc_claimAutoreleasedReturnValue();

                  v125 = v42;
                  goto LABEL_247;
                }
                v125 = (void *)v164;
                objc_msgSend(v225, "stringByAppendingPathComponent:", v164);
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                SZGetLoggingHandle();
                v165 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
                {
                  v206 = *((_QWORD *)v9 + 9);
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)v262 = v230;
                  *(_WORD *)&v262[8] = 2048;
                  *(_QWORD *)v263 = v206;
                  _os_log_debug_impl(&dword_1D4E55000, v165, OS_LOG_TYPE_DEBUG, "Resuming %@ at offset %lld", buf, 0x16u);
                }

                if (objc_msgSend(v58, "decodeBoolForKey:", CFSTR("OpenCurrentOutputFile")))
                {
                  v166 = v9[454];
                  v231 = v42;
                  +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:](StreamingFileWriter, "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:", v230, 2, 0, 0, v166, &v231);
                  v167 = objc_claimAutoreleasedReturnValue();
                  v168 = v231;

                  v169 = (void *)*((_QWORD *)v9 + 49);
                  *((_QWORD *)v9 + 49) = v167;

                  if (!*((_QWORD *)v9 + 49))
                  {
                    SZGetLoggingHandle();
                    v201 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v262 = v230;
                      _os_log_error_impl(&dword_1D4E55000, v201, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                    }

                    v255 = *MEMORY[0x1E0CB2AA0];
                    v256 = v230;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v256, &v255, 1);
                    v42 = (id)objc_claimAutoreleasedReturnValue();
                    _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1213, CFSTR("SZExtractorErrorDomain"), 1, v168, v42, CFSTR("Failed to open output file at path %@"), v202, (uint64_t)v230);
                    goto LABEL_244;
                  }
                  v42 = v168;
                }
                v170 = *(unsigned __int16 *)(*((_QWORD *)v9 + 47) + 8);
                if (v170 != 8 && v170 != 99 && v170 != 14)
                {
LABEL_185:
                  if (!*((_QWORD *)v9 + 9)
                    || (v174 = (void *)*((_QWORD *)v9 + 49)) == 0
                    || (v175 = objc_msgSend(v174, "setCurrentOffset:error:"),
                        v176 = v42,
                        v42,
                        v42 = v176,
                        (v175 & 1) != 0))
                  {

LABEL_194:
LABEL_195:

                    v178 = v216;
LABEL_196:

                    goto LABEL_69;
                  }
                  goto LABEL_246;
                }
                objc_msgSend(v58, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SerializedCompressionState"));
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v171)
                {
                  SZGetLoggingHandle();
                  v195 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1D4E55000, v195, OS_LOG_TYPE_ERROR, "Failed to get serialized compression state from save data", buf, 2u);
                  }

                  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1222, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Failed to get serialized compression state from save data"), v196, v214);
                  v176 = (id)objc_claimAutoreleasedReturnValue();
                  v168 = 0;
                  goto LABEL_245;
                }
                v168 = v171;
                v172 = objc_msgSend(v171, "length");
                v173 = malloc_type_malloc(v172, 0xAB65AED1uLL);
                objc_msgSend(v168, "getBytes:length:", v173, v172);
                if (compression_stream_is_state_valid())
                {
                  *((_QWORD *)v9 + 5) = v173;

                  goto LABEL_185;
                }
                SZGetLoggingHandle();
                v204 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1D4E55000, v204, OS_LOG_TYPE_ERROR, "Compression save state was not valid.", buf, 2u);
                }

                _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1231, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Compression save state was not valid."), v205, v214);
LABEL_244:
                v176 = (id)objc_claimAutoreleasedReturnValue();
LABEL_245:

LABEL_246:
LABEL_247:
                v42 = v176;
                goto LABEL_194;
              }
              SZGetLoggingHandle();
              v182 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v262 = v225;
                _os_log_error_impl(&dword_1D4E55000, v182, OS_LOG_TYPE_ERROR, "Invalid state in resumption data at path %@", buf, 0xCu);
              }

              _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1377, CFSTR("SZExtractorErrorDomain"), 1, 0, 0, CFSTR("Invalid state in resumption data at path %@"), v183, (uint64_t)v225);
              goto LABEL_230;
            }
            SZGetLoggingHandle();
            v177 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
            {
              v203 = objc_msgSend(*((id *)v9 + 12), "count");
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v262 = v89;
              *(_WORD *)&v262[8] = 2048;
              *(_QWORD *)v263 = v203;
              _os_log_error_impl(&dword_1D4E55000, v177, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            v233 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v233);
            v121 = v233;
          }
          else
          {
            v119 = v86;
            SZGetLoggingHandle();
            v120 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v262 = v119;
              *(_WORD *)&v262[4] = 1024;
              *(_DWORD *)&v262[6] = 8;
              *(_WORD *)v263 = 2112;
              *(_QWORD *)&v263[2] = v225;
              _os_log_error_impl(&dword_1D4E55000, v120, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            v235 = v42;
            _RemoveAndRecreateDirectoryAtPath(v225, &v235);
            v121 = v235;
          }
          v118 = v121;
LABEL_193:
          v125 = v42;
          v42 = v118;
          goto LABEL_194;
        }
        v114 = (void *)*MEMORY[0x1E0CB28A8];
        objc_msgSend(v82, "domain");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        if (v114 == v115)
        {
          v122 = objc_msgSend(v219, "code");

          if (v122 == 260)
          {
LABEL_138:
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v239 = v228;
            objc_msgSend(v124, "contentsOfDirectoryAtPath:error:", v225, &v239);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = v239;

            if (v125 && !objc_msgSend(v125, "count"))
            {
              v42 = 0;
            }
            else
            {
              v238 = v126;
              _RemoveAndRecreateDirectoryAtPath(v225, &v238);
              v42 = v238;
            }

            v215 = 0;
            v58 = 0;
            goto LABEL_194;
          }
        }
        else
        {

        }
        SZGetLoggingHandle();
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v262 = v216;
          *(_WORD *)&v262[8] = 2112;
          *(_QWORD *)v263 = v219;
          _os_log_error_impl(&dword_1D4E55000, v123, OS_LOG_TYPE_ERROR, "Failed to read resumption data from path %@: %@; starting from offset 0",
            buf,
            0x16u);
        }

        goto LABEL_138;
      }
      st_size = v252.st_size;
      v94 = objc_retainAutorelease(v66);
      v95 = getxattr((const char *)objc_msgSend(v94, "fileSystemRepresentation"), "com.apple.StreamingPassthroughResumptionData", 0, 0, 0, 1);
      if (v95 == -1)
      {
        if (*__error() == 2 || *__error() == 93)
        {
          v249 = v228;
          _RemoveAndRecreateDirectoryAtPath(v94, &v249);
          v42 = v249;

          goto LABEL_68;
        }
        v130 = *__error();
        SZGetLoggingHandle();
        v131 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          v194 = strerror(v130);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v262 = "com.apple.StreamingPassthroughResumptionData";
          *(_WORD *)&v262[8] = 2112;
          *(_QWORD *)v263 = v94;
          *(_WORD *)&v263[8] = 2080;
          v264 = v194;
          _os_log_error_impl(&dword_1D4E55000, v131, OS_LOG_TYPE_ERROR, "Failed to get size of xattr %s from path %@: %s", buf, 0x20u);
        }

        v132 = (void *)*MEMORY[0x1E0CB2FE0];
        v266 = *MEMORY[0x1E0CB2AA0];
        v267 = v94;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v267, &v266, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v130);
        _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 976, v132, v130, 0, v71, CFSTR("Failed to get size of xattr %s from path %@: %s"), v133, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
        goto LABEL_66;
      }
      v96 = v95;
      if (v95 < 1 || !objc_msgSend(*((id *)v9 + 12), "count"))
      {
        v58 = 0;
        v101 = v228;
        goto LABEL_115;
      }
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setLength:", v96);
      v223 = objc_retainAutorelease(v94);
      v98 = (const char *)objc_msgSend(v223, "fileSystemRepresentation");
      v226 = objc_retainAutorelease(v97);
      v99 = getxattr(v98, "com.apple.StreamingPassthroughResumptionData", (void *)objc_msgSend(v226, "mutableBytes"), v96, 0, 1);
      if (v99 == v96)
      {
        v220 = objc_retainAutorelease(v223);
        if (removexattr((const char *)objc_msgSend(v220, "fileSystemRepresentation"), "com.apple.StreamingPassthroughResumptionData", 1))
        {
          SZGetLoggingHandle();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v198 = objc_msgSend(objc_retainAutorelease(v220), "fileSystemRepresentation");
            v199 = __error();
            v200 = strerror(*v199);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)v262 = "com.apple.StreamingPassthroughResumptionData";
            *(_WORD *)&v262[8] = 2080;
            *(_QWORD *)v263 = v198;
            *(_WORD *)&v263[8] = 2080;
            v264 = v200;
            _os_log_error_impl(&dword_1D4E55000, v100, OS_LOG_TYPE_ERROR, "Failed to remove EA %s from %s: %s", buf, 0x20u);
          }

        }
        v247 = v228;
        v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v226, &v247);
        v101 = v247;

        objc_msgSend(v58, "setDecodingFailurePolicy:", 0);
        if (v58)
        {
          v102 = objc_msgSend(v58, "decodeIntForKey:", CFSTR("SerializationVersion"));
          if (v102 == 8)
          {
            v103 = *((_QWORD *)v9 + 7);
            if (v103)
              v104 = (st_size - (unint64_t)(st_size > 0)) / v103;
            else
              v104 = 0;
            if (v104 < objc_msgSend(*((id *)v9 + 12), "count"))
            {
              __n = 0;
              v58 = objc_retainAutorelease(v58);
              v185 = (const void *)objc_msgSend(v58, "decodeBytesForKey:returnedLength:", CFSTR("HashContext"), &__n);
              if (!v185 || !__n)
              {
LABEL_217:

LABEL_115:
                v9[450] = 5;
                *((_QWORD *)v9 + 6) = st_size;
                v105 = (void *)*((_QWORD *)v9 + 45);
                *((_QWORD *)v9 + 45) = 0;

                v106 = (void *)*((_QWORD *)v9 + 46);
                *((_QWORD *)v9 + 46) = 0;

                *((_QWORD *)v9 + 51) = st_size;
                v107 = v9[454];
                v241 = v101;
                +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:](StreamingFileWriter, "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:", v94, 9, 0, 0, v107, &v241);
                v108 = objc_claimAutoreleasedReturnValue();
                v42 = v241;

                v109 = (void *)*((_QWORD *)v9 + 49);
                *((_QWORD *)v9 + 49) = v108;

                if (!*((_QWORD *)v9 + 49))
                {
                  SZGetLoggingHandle();
                  v110 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v262 = v94;
                    _os_log_error_impl(&dword_1D4E55000, v110, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                  }

                  v259 = *MEMORY[0x1E0CB2AA0];
                  v260 = v94;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v260, &v259, 1);
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1060, CFSTR("SZExtractorErrorDomain"), 1, v42, v111, CFSTR("Failed to open output file at path %@"), v112, (uint64_t)v94);
                  v113 = objc_claimAutoreleasedReturnValue();

                  v42 = (id)v113;
                }
                goto LABEL_69;
              }
              if (__n == gHashContextSizes[*v217])
              {
                memcpy(v9 + 136, v185, __n);
                v186 = *((_QWORD *)v9 + 7);
                v187 = st_size;
                if (v186)
                  v187 = st_size % v186;
                *((_QWORD *)v9 + 8) = v187;
                goto LABEL_217;
              }
              SZGetLoggingHandle();
              v197 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
              {
                v211 = *v217;
                v212 = gHashStringNames[v211];
                v213 = (const char *)gHashContextSizes[v211];
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)v262 = v212;
                *(_WORD *)&v262[8] = 2048;
                *(_QWORD *)v263 = __n;
                *(_WORD *)&v263[8] = 2048;
                v264 = v213;
                _os_log_error_impl(&dword_1D4E55000, v197, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                  buf,
                  0x20u);
              }

              v242 = v101;
              _RemoveAndRecreateDirectoryAtPath(v220, &v242);
              v42 = v242;

LABEL_223:
              v178 = v226;
              goto LABEL_196;
            }
            SZGetLoggingHandle();
            v188 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
            {
              v207 = objc_msgSend(*((id *)v9 + 12), "count");
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v262 = v104;
              *(_WORD *)&v262[8] = 2048;
              *(_QWORD *)v263 = v207;
              _os_log_error_impl(&dword_1D4E55000, v188, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            v244 = v101;
            v129 = &v244;
          }
          else
          {
            v180 = v102;
            SZGetLoggingHandle();
            v181 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v262 = v180;
              *(_WORD *)&v262[4] = 1024;
              *(_DWORD *)&v262[6] = 8;
              *(_WORD *)v263 = 2112;
              *(_QWORD *)&v263[2] = v220;
              _os_log_error_impl(&dword_1D4E55000, v181, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            v246 = v101;
            v129 = &v246;
          }
        }
        else
        {
          SZGetLoggingHandle();
          v179 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v262 = v101;
            _os_log_error_impl(&dword_1D4E55000, v179, OS_LOG_TYPE_ERROR, "Unable to deserialize resumption data (%@); resuming from offset 0",
              buf,
              0xCu);
          }

          v58 = 0;
          v245 = v101;
          v129 = &v245;
        }
        v228 = v101;
      }
      else
      {
        v127 = v99;
        SZGetLoggingHandle();
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          *(_QWORD *)v262 = v96;
          *(_WORD *)&v262[8] = 2048;
          *(_QWORD *)v263 = v127;
          *(_WORD *)&v263[8] = 2080;
          v264 = "com.apple.StreamingPassthroughResumptionData";
          LOWORD(v265[0]) = 2112;
          *(_QWORD *)((char *)v265 + 2) = v223;
          _os_log_error_impl(&dword_1D4E55000, v128, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes but got %ld for EA %s on %@; resuming from offset 0",
            buf,
            0x2Au);
        }

        v58 = 0;
        v248 = v228;
        v129 = &v248;
      }
      _RemoveAndRecreateDirectoryAtPath(v223, v129);
      v42 = *v129;

      goto LABEL_223;
    }
  }
  else
  {

  }
  SZGetLoggingHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v262 = v10;
    _os_log_error_impl(&dword_1D4E55000, v39, OS_LOG_TYPE_ERROR, "Options dictionary supplied has one or more options with an incorrect type: %@", buf, 0xCu);
  }

  _CreateError((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 864, CFSTR("SZExtractorErrorDomain"), 2, 0, 0, CFSTR("Options dictionary supplied has one or more options with an incorrect type: %@"), v40, (uint64_t)v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (!a4)
    goto LABEL_40;
  v43 = objc_retainAutorelease(v41);
  v42 = v43;
LABEL_38:
  v47 = 0;
  *a4 = v43;
LABEL_41:

LABEL_42:
  return v47;
}

@end
