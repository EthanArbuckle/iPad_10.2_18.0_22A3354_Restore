@implementation StreamingUnzipper

- (id)initForClient:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  dispatch_group_t v12;
  void *v13;
  __int128 v14;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)StreamingUnzipper;
  v8 = -[StreamingUnzipper init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unzip session on behalf of %@"), v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    v10 = os_transaction_create();
    v11 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v10;

    v12 = dispatch_group_create();
    v13 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v12;

    if (v7)
    {
      objc_storeWeak((id *)v8 + 15, v7);
      v8[8] = 1;
      objc_msgSend(v7, "auditToken");
      v14 = v16;
      *(_OWORD *)(v8 + 28) = v17;
    }
    else
    {
      *(_QWORD *)&v14 = -1;
      *((_QWORD *)&v14 + 1) = -1;
      *(_OWORD *)(v8 + 28) = v14;
    }
    *(_OWORD *)(v8 + 12) = v14;

  }
  return v8;
}

- (void)setupUnzipperWithOutputPath:(id)a3 sandboxExtensionToken:(char *)a4 options:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, _QWORD);
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  qos_class_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  StreamingUnzipState *v28;
  id v29;
  StreamingUnzipState *currentState;
  StreamingUnzipState *v31;
  qos_class_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  int *v44;
  char *v45;
  uint64_t v46;
  id v47;
  _BYTE buf[32];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id, _QWORD))a6;
  objc_msgSend(v11, "objectForKey:", CFSTR("SZExtractorOptionsAssertQOS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("SZExtractorOptionsAssertQOS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntValue");

    v17 = qos_class_self();
    if (v17 != (_DWORD)v16)
    {
      v32 = v17;
      SZGetLoggingHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v16;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_error_impl(&dword_1D4E55000, v33, OS_LOG_TYPE_ERROR, "Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x", buf, 0xEu);
      }

      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 74, (void *)*MEMORY[0x1E0CB2FE0], 22, 0, 0, CFSTR("Streaming Unzipper running with unexpected QOS: expected=0x%x actual=0x%x"), v34, v16);
      goto LABEL_30;
    }
  }
  if (a4)
  {
    v18 = sandbox_extension_consume();
    self->_sandboxToken = v18;
    if (v18 == -1)
    {
      v35 = *__error();
      SZGetLoggingHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = strerror(v35);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v35;
        _os_log_error_impl(&dword_1D4E55000, v36, OS_LOG_TYPE_ERROR, "Failed to consume sandbox extension token for %@ : %s (%d)", buf, 0x1Cu);
      }

      v37 = (void *)*MEMORY[0x1E0CB2FE0];
      strerror(v35);
      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 85, v37, v35, 0, 0, CFSTR("Failed to consume sandbox extension token for %@ : %s (%d)"), v38, (uint64_t)v10);
      goto LABEL_30;
    }
  }
  if (self->_hasConnection)
  {
    v19 = objc_retainAutorelease(v10);
    v20 = objc_msgSend(v19, "fileSystemRepresentation");
    v21 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&buf[16] = v21;
    v46 = v20;
    v22 = sandbox_check_by_audit_token();
    if (v22)
    {
      if (v22 == -1)
        v23 = *__error();
      else
        v23 = 1;
      SZGetLoggingHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = strerror(v23);
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v23;
        _os_log_error_impl(&dword_1D4E55000, v41, OS_LOG_TYPE_ERROR, "Cannot write to path %@ : %s (%d)", buf, 0x1Cu);
      }

      v42 = (void *)*MEMORY[0x1E0CB2FE0];
      strerror(v23);
      _CreateError((uint64_t)"-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", 97, v42, v23, 0, 0, CFSTR("Cannot write to path %@ : %s (%d)"), v43, (uint64_t)v19);
LABEL_30:
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v29, 0);
      goto LABEL_31;
    }
  }
  SZGetLoggingHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("SZExtractorOptionsHashedChunkSize"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedLongLongValue");
    objc_msgSend(v11, "objectForKey:", CFSTR("SZExtractorOptionsHashesArray"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v27;
    _os_log_impl(&dword_1D4E55000, v24, OS_LOG_TYPE_DEFAULT, "Initialized with path %@ ; hashed chunk size %llu ; hashes %@",
      buf,
      0x20u);

  }
  v47 = 0;
  +[StreamingUnzipState unzipStateWithPath:options:error:](StreamingUnzipState, "unzipStateWithPath:options:error:", v10, v11, &v47);
  v28 = (StreamingUnzipState *)objc_claimAutoreleasedReturnValue();
  v29 = v47;
  currentState = self->_currentState;
  self->_currentState = v28;

  v31 = self->_currentState;
  if (!v29)
  {
    if (!v31)
      __assert_rtn("-[StreamingUnzipper setupUnzipperWithOutputPath:sandboxExtensionToken:options:withReply:]", "StreamingUnzipper.m", 109, "error || _currentState");
    goto LABEL_21;
  }
  if (v31)
  {
LABEL_21:
    v39 = objc_retainAutorelease(v10);
    if (setxattr((const char *)objc_msgSend(v39, "fileSystemRepresentation"), "com.apple.streamingzip.incomplete_extraction", "y", 1uLL, 0, 1))
    {
      SZGetLoggingHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v44 = __error();
        v45 = strerror(*v44);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v45;
        _os_log_error_impl(&dword_1D4E55000, v40, OS_LOG_TYPE_ERROR, "Failed to set incomplete extraction xattr on %@ : %s", buf, 0x16u);
      }

    }
  }
  v12[2](v12, v29, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset", v46));
LABEL_31:

}

- (void)setActiveDelegateMethods:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1D4E55000, v5, OS_LOG_TYPE_DEFAULT, "Set active delegate methods to 0x%x", (uint8_t *)v6, 8u);
  }

  self->_activeDelegateMethods = a3;
}

- (void)streamingFileWriter:(id)a3 didEncounterError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_unfair_lock_s *p_asyncErrorLock;
  NSError **p_asyncError;
  NSError *asyncError;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SZGetLoggingHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_error_impl(&dword_1D4E55000, v8, OS_LOG_TYPE_ERROR, "StreamingFileWriter %@ encountered error %@", (uint8_t *)&v12, 0x16u);
  }

  p_asyncErrorLock = &self->_asyncErrorLock;
  os_unfair_lock_lock(&self->_asyncErrorLock);
  asyncError = self->_asyncError;
  p_asyncError = &self->_asyncError;
  if (!asyncError)
    objc_storeStrong((id *)p_asyncError, a4);
  os_unfair_lock_unlock(p_asyncErrorLock);

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  OS_os_transaction *sessionTransaction;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D4E55000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating state for extraction to %@", buf, 0xCu);

  }
  sessionTransaction = self->_sessionTransaction;
  self->_sessionTransaction = 0;

  free(self->_decompressionOutputBuffer);
  if (self->_sandboxToken)
    sandbox_extension_release();
  v6.receiver = self;
  v6.super_class = (Class)StreamingUnzipper;
  -[StreamingUnzipper dealloc](&v6, sel_dealloc);
}

- (void)supplyBytes:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__427;
  v20 = __Block_byref_object_dispose__428;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = objc_msgSend(v6, "length");
  SZGetTraceHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "Begin processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke;
  v11[3] = &unk_1E98B1228;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  v11[7] = v8;
  objc_msgSend(v6, "enumerateByteRangesUsingBlock:", v11);
  SZGetTraceHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES_UNZIP_SERVICE", "End processing %lu bytes in StreamingUnzipper", buf, 0xCu);
  }

  v7[2](v7, v17[5], *((unsigned __int8 *)v13 + 24));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

}

- (void)suspendStreamWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  StreamingUnzipState *currentState;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _BYTE v14[12];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v14, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper suspendStreamWithReply:]", 1836, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Unzipper did not have any state! Client should suspend stream and resume from the given offset."), v13, *(uint64_t *)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset");
    -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v14 = 134218242;
    *(_QWORD *)&v14[4] = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "Suspending extraction at offset %llu for %@", v14, 0x16u);

  }
  -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    SZGetLoggingHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138412290;
      *(_QWORD *)&v14[4] = v11;
      _os_log_impl(&dword_1D4E55000, v12, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", v14, 0xCu);
    }

    -[StreamingUnzipper _setErrorState]((uint64_t)self);
LABEL_11:
    v4[2](v4, 0, v11);
    goto LABEL_15;
  }
  -[StreamingUnzipState serializeState](self->_currentState, "serializeState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
  v4[2](v4, -[StreamingUnzipState currentOffset](self->_currentState, "currentOffset"), v11);
LABEL_15:

}

- (void)finishStreamWithReply:(id)a3
{
  void (**v4)(id, id);
  StreamingUnzipState *currentState;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  NSObject *v16;
  void *v17;
  int *v18;
  char *v19;
  id v20;
  void *v21;
  id v22;
  _BYTE *v23;
  id v24;
  char *v25;
  char *v26;
  FTS *v27;
  FTS *v28;
  void *v29;
  int v30;
  FTSENT *v31;
  FTSENT *v32;
  int fts_info;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  NSObject *v48;
  int *v49;
  char v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  void *v57;
  char v58;
  char *v59;
  int *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  _BYTE buf[24];
  char *v67;
  id v68;
  uint8_t v69[4];
  uint64_t v70;
  __int16 v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", buf, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper finishStreamWithReply:]", 1868, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Unzipper did not have any state! Client should suspend stream and resume from the given offset."), v12, v63);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "Finishing extraction for %@", buf, 0xCu);

  }
  -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)v9;
    SZGetLoggingHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1D4E55000, v11, OS_LOG_TYPE_DEFAULT, "Returning async file error %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  -[StreamingUnzipState finishStream](self->_currentState, "finishStream");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v10 = (id)v13;
LABEL_13:
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    goto LABEL_14;
  }
  -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = removexattr((const char *)objc_msgSend(v14, "fileSystemRepresentation"), "com.apple.streamingzip.incomplete_extraction", 1);

  if (v15 && *__error() != 93)
  {
    SZGetLoggingHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "com.apple.streamingzip.incomplete_extraction";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2080;
      v67 = v19;
      _os_log_impl(&dword_1D4E55000, v16, OS_LOG_TYPE_DEFAULT, "Failed to remove xattr named %s on %@ : %s", buf, 0x20u);

    }
  }
  if (!-[StreamingUnzipState denyInvalidSymlinks](self->_currentState, "denyInvalidSymlinks"))
  {
    v10 = 0;
    goto LABEL_14;
  }
  -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    SZGetLoggingHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D4E55000, v38, OS_LOG_TYPE_ERROR, "base directory path cannot be nil", buf, 2u);
    }

    v40 = CFSTR("base directory path cannot be nil");
    v41 = 1750;
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    SZGetLoggingHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1D4E55000, v42, OS_LOG_TYPE_ERROR, "base directory URL cannot be nil (created from path: \"%@\")", buf, 0xCu);
    }

    v63 = (uint64_t)v20;
    v40 = CFSTR("base directory URL cannot be nil (created from path: \"%@\")");
    v41 = 1757;
LABEL_40:
    _CreateError((uint64_t)"_ValidateAllSymlinksUnderPath", v41, CFSTR("SZExtractorErrorDomain"), 2, 0, 0, v40, v39, v63);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    goto LABEL_62;
  }
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ValidateAllSymlinksUnderPath_block_invoke;
  v67 = (char *)&unk_1E98B1250;
  v68 = v21;
  v22 = v68;
  v23 = buf;
  v73 = 0;
  v74 = 0;
  v24 = objc_retainAutorelease(v22);
  v25 = (char *)objc_msgSend(v24, "fileSystemRepresentation");
  if (!v25)
  {
    SZGetLoggingHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v69 = 0;
      _os_log_error_impl(&dword_1D4E55000, v44, OS_LOG_TYPE_ERROR, "directory url fileSystemRepresentation cannot be NULL", v69, 2u);
    }

    v46 = CFSTR("directory url fileSystemRepresentation cannot be NULL");
    v47 = 1694;
    goto LABEL_47;
  }
  v26 = v25;
  v73 = v25;
  v74 = 0;
  v27 = fts_open(&v73, 84, 0);
  if (!v27)
  {
    SZGetLoggingHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v60 = __error();
      v61 = strerror(*v60);
      *(_DWORD *)v69 = 136315394;
      v70 = (uint64_t)v26;
      v71 = 2080;
      v72 = v61;
      _os_log_error_impl(&dword_1D4E55000, v48, OS_LOG_TYPE_ERROR, "fts_open failed for %s with error %s", v69, 0x16u);
    }

    v49 = __error();
    v63 = (uint64_t)v26;
    strerror(*v49);
    v46 = CFSTR("fts_open failed for %s with error %s");
    v47 = 1704;
LABEL_47:
    _CreateError((uint64_t)"_TraverseDirectory", v47, CFSTR("SZExtractorErrorDomain"), 2, 0, 0, v46, v45, v63);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v28 = v27;
  v64 = (uint64_t)v26;
  v29 = 0;
  v30 = 0;
  while (1)
  {
    v31 = fts_read(v28);
    if (!v31)
    {
      v37 = v29;
      goto LABEL_53;
    }
    v32 = v31;
    fts_info = v31->fts_info;
    if (fts_info == 10 || fts_info == 7)
      break;
    v35 = (void *)MEMORY[0x1D826ACB8]();
    v65 = v29;
    v36 = (*(uint64_t (**)(_BYTE *, FTSENT *, id *))&buf[16])(v23, v32, &v65);
    v37 = v65;

    objc_autoreleasePoolPop(v35);
    v30 = 1;
    v29 = v37;
    if ((v36 & 1) == 0)
    {
      v30 = 0;
LABEL_53:
      v53 = v64;
      goto LABEL_54;
    }
  }
  SZGetLoggingHandle();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v64;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v62 = strerror(v32->fts_errno);
    *(_DWORD *)v69 = 136315394;
    v70 = v64;
    v71 = 2080;
    v72 = v62;
    _os_log_error_impl(&dword_1D4E55000, v52, OS_LOG_TYPE_ERROR, "Error for path %s: %s", v69, 0x16u);
  }

  strerror(v32->fts_errno);
  _CreateError((uint64_t)"_TraverseDirectory", 1713, CFSTR("SZExtractorErrorDomain"), 2, 0, 0, CFSTR("Error for path %s: %s"), v54, v64);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v30 = 0;
LABEL_54:
  if (fts_close(v28))
  {
    v55 = *__error();
    SZGetLoggingHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v59 = strerror(v55);
      *(_DWORD *)v69 = 136315394;
      v70 = v53;
      v71 = 2080;
      v72 = v59;
      _os_log_error_impl(&dword_1D4E55000, v56, OS_LOG_TYPE_ERROR, "fts_close on FTS for %s returned %s", v69, 0x16u);
    }

  }
  if (!v30)
  {
LABEL_48:
    v37 = objc_retainAutorelease(v37);
    v50 = 0;
    v51 = v37;
    goto LABEL_60;
  }
  v51 = 0;
  v50 = 1;
LABEL_60:

  v43 = v51;
  if ((v50 & 1) != 0)
  {
    v57 = 0;
    v58 = 1;
    goto LABEL_63;
  }
LABEL_62:
  v43 = objc_retainAutorelease(v43);
  v58 = 0;
  v57 = v43;
LABEL_63:

  v10 = v57;
  if ((v58 & 1) == 0)
    goto LABEL_13;
LABEL_14:
  v4[2](v4, v10);

}

- (void)terminateStreamWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  StreamingUnzipState *currentState;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  currentState = self->_currentState;
  SZGetLoggingHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (currentState)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[StreamingUnzipState unzipPath](self->_currentState, "unzipPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = v8;
      _os_log_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_DEFAULT, "Terminating extraction for %@", v12, 0xCu);

    }
    v9 = -[StreamingUnzipper _waitForAsyncFileWriterCompletionAndGetAsyncError]((os_unfair_lock_s *)self);
    -[StreamingUnzipper _setErrorState]((uint64_t)self);
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D4E55000, v7, OS_LOG_TYPE_ERROR, "Unzipper did not have any state, but the client was terminating the stream anyway.", v12, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper terminateStreamWithReply:]", 1912, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Unzipper did not have any state, but the client was terminating the stream anyway."), v10, *(uint64_t *)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v11);

  }
}

- (void)getPidForTestingWithReply:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = getpid();
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v5, v4, 0);

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (StreamingUnzipDelegateProtocol)inProcessExtractorDelegate
{
  return (StreamingUnzipDelegateProtocol *)objc_loadWeakRetained((id *)&self->inProcessExtractorDelegate);
}

- (void)setInProcessExtractorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->inProcessExtractorDelegate, a3);
}

- (OS_dispatch_queue)inProcessDelegateQueue
{
  return self->inProcessDelegateQueue;
}

- (void)setInProcessDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->inProcessDelegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inProcessDelegateQueue, 0);
  objc_destroyWeak((id *)&self->inProcessExtractorDelegate);
  objc_destroyWeak((id *)&self->_xpcConnection);
  objc_storeStrong((id *)&self->_asyncError, 0);
  objc_storeStrong((id *)&self->_asyncWorkTrackingGroup, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (os_unfair_lock_s)_waitForAsyncFileWriterCompletionAndGetAsyncError
{
  os_unfair_lock_s *v1;
  NSObject *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  v1 = a1;
  if (a1)
  {
    v2 = *(NSObject **)&a1[24]._os_unfair_lock_opaque;
    if (v2)
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    v3 = v1 + 28;
    os_unfair_lock_lock(v1 + 28);
    v1 = *(os_unfair_lock_s **)&v1[26]._os_unfair_lock_opaque;
    if (v1)
      v4 = v1;
    os_unfair_lock_unlock(v3);
  }
  return v1;
}

- (void)_setErrorState
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "setStreamState:", 8);
    objc_msgSend(*(id *)(a1 + 64), "unzipPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v7);
      v5 = v7;

      if ((v4 & 1) == 0)
      {
        SZGetLoggingHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v9 = v2;
          v10 = 2112;
          v11 = v5;
          _os_log_error_impl(&dword_1D4E55000, v6, OS_LOG_TYPE_ERROR, "Failed to remove unzip path at %@ : %@", buf, 0x16u);
        }

      }
    }

  }
}

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke(uint64_t a1, const Bytef *a2, uint64_t a3, size_t a4, _BYTE *a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SZGetLoggingHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    v16 = v12;
    v17 = 2048;
    v18 = a3;
    _os_log_debug_impl(&dword_1D4E55000, v10, OS_LOG_TYPE_DEBUG, "Got block of length %lu at offset %lu", buf, 0x16u);
  }

  v11 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2;
  v13[3] = &unk_1E98B1200;
  v14 = *(_OWORD *)(a1 + 40);
  -[StreamingUnzipper _supplyBytes:length:withReply:](v11, a2, a4, v13);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
}

void __43__StreamingUnzipper_supplyBytes_withReply___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (void)_supplyBytes:(size_t)a3 length:(void *)a4 withReply:
{
  void (**v7)(id, id, uint64_t);
  void *v8;
  id v9;
  __int128 v10;
  id *v11;
  unint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t UncompressedSize;
  uint64_t CompressedSize;
  id v31;
  const char *v32;
  id v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  id *v37;
  int v38;
  int v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  const char *v43;
  uint32_t v44;
  _BOOL4 HasZip64ExtraField;
  uint64_t v46;
  id v47;
  NSObject *v48;
  _BOOL4 v49;
  int v50;
  __darwin_ino64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint32_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  int CRC32;
  _WORD *v62;
  unsigned __int16 *v63;
  id v64;
  const char *v65;
  id v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void **v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  size_t v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  id v95;
  const char *v96;
  void *v97;
  id v98;
  uint64_t v99;
  unsigned __int16 *ExtraFieldWithSignature;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  char *v108;
  const char *v109;
  const char *v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  time_t v114;
  time_t v115;
  void *v116;
  void *v117;
  void *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  unint64_t LFUncompressedSize;
  __darwin_ino64_t v127;
  NSObject *v128;
  void *v129;
  id v130;
  const char *v131;
  NSObject *v132;
  int v133;
  int v134;
  int v135;
  NSObject *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  unsigned __int16 *InfoZipExtraFieldFromLF;
  id v141;
  NSObject *v142;
  dev_t v143;
  NSObject *v144;
  uid_t v145;
  gid_t v146;
  char *v147;
  uint64_t v148;
  void **v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSObject *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  NSObject *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  void *v164;
  id v165;
  uint64_t v166;
  int v167;
  int v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  __darwin_ino64_t v172;
  compression_stream *v173;
  uint64_t v174;
  const Bytef *src_ptr;
  uint64_t v176;
  size_t src_size;
  __darwin_ino64_t v178;
  NSObject *v179;
  unint64_t dst_size;
  uint64_t v181;
  unint64_t v182;
  int v183;
  void *v184;
  void *v185;
  void *v186;
  id *v187;
  void *v188;
  uint64_t v189;
  id v190;
  int v191;
  id v192;
  uLong v193;
  const Bytef *v194;
  int v195;
  id v196;
  void *v197;
  void *v198;
  void *v199;
  int v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const Bytef *v207;
  id v208;
  uint64_t v209;
  NSObject *v210;
  void *v211;
  id v212;
  NSObject *v213;
  NSObject *v214;
  uint64_t v215;
  unint64_t v216;
  NSObject *v217;
  _BOOL4 v218;
  void *v219;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  NSObject *v223;
  void *v224;
  uint64_t v225;
  NSObject *v226;
  void *v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  uint64_t v234;
  id v235;
  char v236;
  uint64_t v237;
  id v238;
  int v239;
  NSObject *v240;
  uint64_t v241;
  NSObject *v242;
  int v243;
  int v244;
  uid_t v245;
  int v246;
  NSObject *v247;
  id v248;
  unsigned __int8 v249;
  uint64_t v250;
  NSObject *v251;
  id v252;
  void *v253;
  void *v254;
  id v255;
  void *v256;
  void *v257;
  NSObject *v258;
  char *v259;
  char *v260;
  __int128 v261;
  void *v262;
  char *v263;
  int *v264;
  char *v265;
  uint64_t v266;
  BOOL v267;
  size_t v268;
  uint64_t v269;
  char *v270;
  unsigned __int8 *v271;
  void *v272;
  void *v273;
  char *v274;
  NSObject *v275;
  uint64_t v276;
  id *v277;
  void *v278;
  void *v279;
  void *v280;
  NSObject *v281;
  void *v282;
  uint64_t v283;
  void *v284;
  id *v285;
  void *v286;
  void *v287;
  NSObject *v288;
  uint64_t v289;
  void *v290;
  void *v291;
  void *v292;
  NSObject *v293;
  uint64_t v294;
  void *v295;
  NSObject *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  id v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  void *v308;
  NSObject *v309;
  NSObject *v310;
  int v311;
  int v312;
  uid_t v313;
  gid_t v314;
  const Bytef *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  NSObject *v319;
  NSObject *v320;
  _BOOL4 v321;
  NSObject *v322;
  uint64_t v323;
  const char *v324;
  NSObject *v325;
  uint32_t v326;
  id v327;
  void *v328;
  NSObject *v329;
  NSObject *v330;
  const char *v331;
  NSObject *v332;
  uint32_t v333;
  const Bytef *v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  NSObject *v338;
  int v339;
  int v340;
  uid_t v341;
  gid_t v342;
  NSObject *v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  NSObject *v347;
  NSObject *v348;
  void *v349;
  void *v350;
  NSObject *v351;
  NSObject *v352;
  uint64_t v353;
  uint64_t v354;
  NSObject *v355;
  void *v356;
  void *v357;
  uint64_t v358;
  void *v359;
  NSObject *v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  void *v364;
  uint64_t v365;
  uint64_t v366;
  _BOOL4 v367;
  void *v368;
  void *v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  NSObject *v373;
  void *v374;
  void *v375;
  uint64_t v376;
  NSObject *v377;
  void *v378;
  void *v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  void *v383;
  uint64_t v384;
  uint64_t v385;
  NSObject *v386;
  void *v387;
  void *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  NSObject *v393;
  void *v394;
  void *v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  NSObject *v399;
  __darwin_ino64_t v400;
  uint64_t v401;
  uint64_t v402;
  int v403;
  void *v404;
  void *v405;
  uint64_t v406;
  void *v407;
  uint64_t v408;
  void *v409;
  NSObject *v410;
  uint64_t v411;
  NSObject *v412;
  NSObject *v413;
  int v414;
  int v415;
  int v416;
  uid_t v417;
  gid_t v418;
  uint64_t v419;
  NSObject *v420;
  size_t v421;
  uint64_t v422;
  uint64_t v423;
  size_t v424;
  id v425;
  uint64_t v426;
  NSObject *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  id v433;
  uint64_t v434;
  id v435;
  uint64_t v436;
  NSObject *v437;
  __darwin_ino64_t v438;
  uint64_t v439;
  NSObject *v440;
  int v441;
  void *v442;
  uint64_t v443;
  uint64_t v444;
  void *v445;
  uint64_t v446;
  int v447;
  int v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  void *v457;
  __int128 v458;
  unint64_t v459;
  int v460;
  uint64_t v461;
  void (**v462)(id, id, uint64_t);
  void *v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  id v467;
  id *v468;
  id v469;
  id v470;
  id v471;
  char v472;
  id v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  uint64_t v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  uint64_t v501;
  id v502;
  id v503;
  id v504;
  id v505;
  id v506;
  id v507;
  gid_t v508;
  size_t v509;
  const Bytef *v510;
  uint64_t v511;
  NSObject *v512;
  uint64_t v513;
  NSObject *v514;
  uint64_t v515;
  NSObject *v516;
  uint64_t v517;
  void *v518;
  const __CFString *v519;
  void *v520;
  _QWORD v521[2];
  _QWORD v522[2];
  _QWORD v523[2];
  _QWORD v524[2];
  const __CFString *v525;
  void *v526;
  _QWORD v527[2];
  _QWORD v528[2];
  const __CFString *v529;
  void *v530;
  const __CFString *v531;
  void *v532;
  _QWORD v533[3];
  _QWORD v534[3];
  _QWORD v535[2];
  _QWORD v536[2];
  const __CFString *v537;
  void *v538;
  uint64_t v539;
  id v540;
  uint64_t v541;
  id v542;
  uint64_t v543;
  id v544;
  uint64_t v545;
  id v546;
  uid_t v547;
  id v548;
  __int16 v549;
  char *v550;
  stat v551;
  const __CFString *v552;
  void *v553;
  const __CFString *v554;
  void *v555;
  const __CFString *v556;
  void *v557;
  const __CFString *v558;
  void *v559;
  const __CFString *v560;
  void *v561;
  const __CFString *v562;
  void *v563;
  const __CFString *v564;
  _QWORD v565[4];

  v565[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a1)
    goto LABEL_519;
  v510 = a2;
  v509 = a3;
  v8 = *(void **)(a1 + 64);
  v468 = (id *)(a1 + 64);
  if (!v8)
  {
    SZGetLoggingHandle();
    v275 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v551.st_dev) = 0;
      _os_log_error_impl(&dword_1D4E55000, v275, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", (uint8_t *)&v551, 2u);
    }

    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 470, CFSTR("SZExtractorErrorDomain"), 3, 0, 0, CFSTR("Unzipper did not have any state! Client should suspend stream and resume from the given offset."), v276, v446);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v464 = 0;
    v15 = 0;
    goto LABEL_512;
  }
  v466 = a1;
  v462 = v7;
  objc_msgSend(v8, "unzipPath");
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v461 = *MEMORY[0x1E0CB2AA0];
  v457 = (void *)*MEMORY[0x1E0CB2FE0];
  *(_QWORD *)&v10 = 138412546;
  v455 = v10;
  *(_QWORD *)&v10 = 136315138;
  v451 = v10;
  *(_QWORD *)&v10 = 136315394;
  v453 = v10;
  *(_QWORD *)&v10 = 136316162;
  v450 = v10;
  *(_QWORD *)&v10 = 138412290;
  v456 = v10;
  *(_QWORD *)&v10 = 138413058;
  v454 = v10;
  *(_QWORD *)&v10 = 134217984;
  v458 = v10;
  *(_QWORD *)&v10 = 67109632;
  v452 = v10;
  *(_QWORD *)&v10 = 136315650;
  v449 = v10;
  v11 = v468;
  while (2)
  {
    v12 = v509;
    if (!v509)
    {
LABEL_377:
      v15 = 0;
      v7 = v462;
      a1 = v466;
      goto LABEL_512;
    }
    v13 = (void *)MEMORY[0x1D826ACB8]();
    v14 = objc_msgSend(*v11, "streamState");
    a1 = v466;
    v15 = 0;
    switch(v14)
    {
      case 0:
        if (!objc_msgSend(*v11, "currentLFRecord"))
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 485, "_currentState.currentLFRecord");
        _CopyStreamBytesToRecord(objc_msgSend(*v11, "currentLFRecord"), 4, *v11, (const void **)&v510, &v509);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_463;
        if ((unint64_t)objc_msgSend(*v11, "thisStageBytesComplete") >= 5)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 493, "_currentState.thisStageBytesComplete <= peekSignatureSize");
        v17 = objc_msgSend(*v11, "thisStageBytesComplete");
        v18 = *v11;
        if (v17 == 4)
        {
          v19 = *(_DWORD *)objc_msgSend(v18, "currentLFRecord");
          v20 = *v11;
          if (v19 != 67324752)
          {
            objc_msgSend(v20, "unsureData");
            v337 = (void *)objc_claimAutoreleasedReturnValue();

            if (v337)
            {
              SZGetLoggingHandle();
              v338 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT))
              {
                v339 = *(unsigned __int8 *)objc_msgSend(*v11, "currentLFRecord");
                v340 = *(unsigned __int8 *)(objc_msgSend(*v468, "currentLFRecord") + 1);
                v341 = *(unsigned __int8 *)(objc_msgSend(*v468, "currentLFRecord") + 2);
                v342 = *(unsigned __int8 *)(objc_msgSend(*v468, "currentLFRecord") + 3);
                v551.st_dev = 67109888;
                *(_DWORD *)&v551.st_mode = v339;
                LOWORD(v551.st_ino) = 1024;
                *(_DWORD *)((char *)&v551.st_ino + 2) = v340;
                HIWORD(v551.st_ino) = 1024;
                v551.st_uid = v341;
                LOWORD(v551.st_gid) = 1024;
                *(gid_t *)((char *)&v551.st_gid + 2) = v342;
                _os_log_impl(&dword_1D4E55000, v338, OS_LOG_TYPE_DEFAULT, "Got unexpected local file signature %c%c%c%c ; entering passthrough mode",
                  (uint8_t *)&v551,
                  0x1Au);
              }

              v315 = v510;
              v317 = v509;
              v316 = a1;
LABEL_431:
              -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v316, (uint64_t)v315, v317);
              v9 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_474;
            }
            if (*(_DWORD *)objc_msgSend(*v11, "currentLFRecord") != 33639248)
            {
              SZGetLoggingHandle();
              v377 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_error_impl(&dword_1D4E55000, v377, OS_LOG_TYPE_ERROR, "Encountered unexpectedly non-stream-compliant data in stream!", (uint8_t *)&v551, 2u);
              }

              v564 = CFSTR("SZExtractorFileOffsetErrorKey");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v378 = (void *)objc_claimAutoreleasedReturnValue();
              v565[0] = v378;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v565, &v564, 1);
              v379 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 552, CFSTR("SZExtractorErrorDomain"), 2, 0, v379, CFSTR("Encountered unexpectedly non-stream-compliant data in stream!"), v380, v446);
              v9 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_474;
            }
            if (objc_msgSend(*v11, "bytesHashedInChunk"))
            {
              objc_msgSend(*v11, "lastChunkPartialHash");
              v407 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v407)
              {
                SZGetLoggingHandle();
                v410 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl(&dword_1D4E55000, v410, OS_LOG_TYPE_DEBUG, "No last chunk partial hash; will need full chunk to validate.",
                    (uint8_t *)&v551,
                    2u);
                }
                v409 = 0;
                goto LABEL_525;
              }
              objc_msgSend(*v11, "checkLastChunkPartialHash");
              v408 = objc_claimAutoreleasedReturnValue();
              if (v408)
              {
                v409 = (void *)v408;
                SZGetLoggingHandle();
                v410 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_error_impl(&dword_1D4E55000, v410, OS_LOG_TYPE_ERROR, "Last chunk's partial hash did not validate (store hashed chunk size mismatch?); consuming more data "
                    "to check full chunk.",
                    (uint8_t *)&v551,
                    2u);
                }
LABEL_525:

                SZGetLoggingHandle();
                v420 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v420, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl(&dword_1D4E55000, v420, OS_LOG_TYPE_DEBUG, "Finished central directory signature; updating hash with remainder of stream data",
                    (uint8_t *)&v551,
                    2u);
                }

                v421 = v509;
                if (objc_msgSend(*v11, "hashedChunkSize"))
                {
                  v422 = objc_msgSend(*v11, "hashedChunkSize");
                  v423 = objc_msgSend(*v11, "bytesHashedInChunk");
                  if (v422 - v423 >= v421)
                    v424 = v421;
                  else
                    v424 = v422 - v423;
                }
                else
                {
                  v424 = v421;
                }
                v425 = *v11;
                v426 = objc_msgSend(*v11, "currentOffset");
                objc_msgSend(v425, "updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:", v426, v510, v424, 1);
                v9 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v424);
                if (v9)
                  goto LABEL_454;
                if (objc_msgSend(*v11, "bytesHashedInChunk"))
                {
                  if (v424 != v421)
                    __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 543, "lengthToRead == length");
                  SZGetLoggingHandle();
                  v427 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v427, OS_LOG_TYPE_DEBUG))
                  {
                    LOWORD(v551.st_dev) = 0;
                    _os_log_debug_impl(&dword_1D4E55000, v427, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we need more data to finish the chunk", (uint8_t *)&v551, 2u);
                  }

                  objc_msgSend(*v468, "setStreamState:", 6);
                  v9 = 0;
                  goto LABEL_454;
                }
                SZGetLoggingHandle();
                v437 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v437, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v551.st_dev) = 0;
                  _os_log_debug_impl(&dword_1D4E55000, v437, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we had enough data already to finish the chunk", (uint8_t *)&v551, 2u);
                }

                objc_msgSend(*v468, "setStreamState:", 7);
                v9 = 0;
                v15 = 1;
                goto LABEL_455;
              }
            }
            else
            {
              SZGetLoggingHandle();
              v412 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v412, OS_LOG_TYPE_DEBUG))
              {
                v439 = objc_msgSend(*v11, "currentOffset");
                v551.st_dev = v458;
                *(_QWORD *)&v551.st_mode = v439;
                _os_log_debug_impl(&dword_1D4E55000, v412, OS_LOG_TYPE_DEBUG, "Finished central directory signature at offset %llu and we are also at a chunk boundary.", (uint8_t *)&v551, 0xCu);
              }

            }
LABEL_509:
            objc_msgSend(*v11, "setStreamState:", 7);
            v9 = 0;
LABEL_510:
            v15 = 1;
            goto LABEL_511;
          }
          objc_msgSend(v20, "setStreamState:", 1);
        }
        else
        {
          objc_msgSend(v18, "markResumptionPoint");
        }
        v9 = 0;
LABEL_55:
        v56 = 3;
LABEL_359:
        objc_autoreleasePoolPop(v13);
        if (v56 != 3)
          goto LABEL_377;
        continue;
      case 1:
        if (!objc_msgSend(*v11, "currentLFRecord"))
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 567, "_currentState.currentLFRecord");
        if ((unint64_t)objc_msgSend(*v11, "thisStageBytesComplete") > 0x1D)
          goto LABEL_16;
        _CopyStreamBytesToRecord(objc_msgSend(*v11, "currentLFRecord"), 30, *v11, (const void **)&v510, &v509);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_463;
        v9 = 0;
LABEL_16:
        if (objc_msgSend(*v11, "thisStageBytesComplete") != 30)
          goto LABEL_21;
        objc_msgSend(*v11, "setCurrentLFRequiresDataDescriptor:", (*(unsigned __int16 *)(objc_msgSend(*v11, "currentLFRecord") + 6) >> 3) & 1);
        v21 = *(unsigned __int16 *)(objc_msgSend(*v11, "currentLFRecord") + 26);
        v22 = *v11;
        if (!v21)
        {
          objc_msgSend(v22, "unsureData");
          v328 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v329 = objc_claimAutoreleasedReturnValue();
          v330 = v329;
          if (v328)
          {
            if (os_log_type_enabled(v329, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              v331 = "Got zero-length filename; entering passthrough mode";
              v332 = v330;
              v333 = 2;
              goto LABEL_425;
            }
LABEL_426:

            v334 = v510;
            v335 = v509;
            v336 = a1;
LABEL_439:
            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](v336, (uint64_t)v334, v335);
            v345 = objc_claimAutoreleasedReturnValue();
LABEL_440:
            v16 = (id)v345;
LABEL_462:

            goto LABEL_463;
          }
          if (os_log_type_enabled(v329, OS_LOG_TYPE_ERROR))
          {
            v428 = objc_msgSend(*v11, "currentOffset");
            v551.st_dev = v458;
            *(_QWORD *)&v551.st_mode = v428;
            _os_log_error_impl(&dword_1D4E55000, v330, OS_LOG_TYPE_ERROR, "Encountered zero-length filename for local file record at offset %llu", (uint8_t *)&v551, 0xCu);
          }

          v562 = CFSTR("SZExtractorFileOffsetErrorKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          v563 = v374;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v563, &v562, 1);
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          v443 = objc_msgSend(*v11, "currentOffset");
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 589, CFSTR("SZExtractorErrorDomain"), 2, 0, v375, CFSTR("Encountered zero-length filename for local file record at offset %llu"), v376, v443);
LABEL_504:
          v28 = objc_claimAutoreleasedReturnValue();

LABEL_395:
          v15 = 0;
          v9 = (id)v28;
          goto LABEL_511;
        }
        v23 = *(unsigned __int16 *)(objc_msgSend(v22, "currentLFRecord") + 8);
        if ((v23 > 0xE || ((1 << v23) & 0x4101) == 0) && (_DWORD)v23 != 99)
        {
          objc_msgSend(*v11, "unsureData");
          v398 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v399 = objc_claimAutoreleasedReturnValue();
          v330 = v399;
          if (v398)
          {
            if (os_log_type_enabled(v399, OS_LOG_TYPE_DEFAULT))
            {
              v551.st_dev = 67109120;
              *(_DWORD *)&v551.st_mode = v23;
              v331 = "Got unexpected compression method: %hu; entering passthrough mode";
              v332 = v330;
              v333 = 8;
LABEL_425:
              _os_log_impl(&dword_1D4E55000, v332, OS_LOG_TYPE_DEFAULT, v331, (uint8_t *)&v551, v333);
            }
            goto LABEL_426;
          }
          if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR))
          {
            v438 = objc_msgSend(*v11, "currentOffset");
            v551.st_dev = 67109376;
            *(_DWORD *)&v551.st_mode = v23;
            LOWORD(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = v438;
            _os_log_error_impl(&dword_1D4E55000, v330, OS_LOG_TYPE_ERROR, "Encountered unsupported compression method %hu in stream at offset %llu", (uint8_t *)&v551, 0x12u);
          }

          v560 = CFSTR("SZExtractorFileOffsetErrorKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          v561 = v374;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v561, &v560, 1);
          v375 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v11, "currentOffset");
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 601, CFSTR("SZExtractorErrorDomain"), 2, 0, v375, CFSTR("Encountered unsupported compression method %hu in stream at offset %llu"), v411, v23);
          goto LABEL_504;
        }
LABEL_21:
        v24 = v509;
        v25 = *v11;
        if (!v509)
        {
LABEL_400:
          objc_msgSend(v25, "markResumptionPoint");
          goto LABEL_474;
        }
        if ((unint64_t)objc_msgSend(v25, "thisStageBytesComplete") <= 0x1D)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 617, "_currentState.thisStageBytesComplete >= sizeof(LocalFileRecord)");
        v26 = objc_msgSend(*v11, "currentLFRecord");
        v27 = *(unsigned __int16 *)(v26 + 26) + (unint64_t)*(unsigned __int16 *)(v26 + 28) + 30;
        if (v27 > objc_msgSend(*v11, "currentLFRecordAllocationSize"))
        {
          objc_msgSend(*v11, "setCurrentLFRecord:", reallocf((void *)objc_msgSend(*v11, "currentLFRecord"), v27));
          if (!objc_msgSend(*v11, "currentLFRecord"))
          {
            SZGetLoggingHandle();
            v343 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_error_impl(&dword_1D4E55000, v343, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", (uint8_t *)&v551, 2u);
            }

            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 624, v457, 12, 0, 0, CFSTR("Could not allocate memory for local file record"), v344, v446);
            v345 = objc_claimAutoreleasedReturnValue();
            goto LABEL_440;
          }
          objc_msgSend(*v11, "setCurrentLFRecordAllocationSize:", v27);
        }
        if (objc_msgSend(*v11, "thisStageBytesComplete") < v27)
        {
          _CopyStreamBytesToRecord(objc_msgSend(*v11, "currentLFRecord"), v27, *v11, (const void **)&v510, &v509);
          v28 = objc_claimAutoreleasedReturnValue();

          if (v28)
            goto LABEL_395;
          v24 = v509;
          if (!v509)
          {
LABEL_407:
            v47 = *v11;
LABEL_408:
            objc_msgSend(v47, "markResumptionPoint");
            v9 = 0;
LABEL_474:
            v15 = 0;
            goto LABEL_511;
          }
          v9 = 0;
        }
        if (objc_msgSend(*v11, "thisStageBytesComplete") != v27)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 643, "_currentState.thisStageBytesComplete == fullLFRSize");
        if ((objc_msgSend(*v11, "currentLFRequiresDataDescriptor") & 1) == 0)
        {
          UncompressedSize = _GetUncompressedSize(*v11);
          CompressedSize = _GetCompressedSize(*v11);
          v31 = *v11;
          if (!CompressedSize && UncompressedSize)
          {
            objc_msgSend(v31, "unsureData");
            v346 = (void *)objc_claimAutoreleasedReturnValue();

            SZGetLoggingHandle();
            v347 = objc_claimAutoreleasedReturnValue();
            v348 = v347;
            if (v346)
            {
              if (os_log_type_enabled(v347, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_impl(&dword_1D4E55000, v348, OS_LOG_TYPE_DEFAULT, "File has 0-length compressed size but non-zero uncompressed size; entering passthrough mode",
                  (uint8_t *)&v551,
                  2u);
              }

              v334 = v510;
              v336 = a1;
              v335 = v24;
              goto LABEL_439;
            }
            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              v429 = objc_msgSend(*v11, "currentOffset");
              v551.st_dev = v458;
              *(_QWORD *)&v551.st_mode = v429;
              _os_log_error_impl(&dword_1D4E55000, v348, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size", (uint8_t *)&v551, 0xCu);
            }

            v558 = CFSTR("SZExtractorFileOffsetErrorKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v374 = (void *)objc_claimAutoreleasedReturnValue();
            v559 = v374;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v559, &v558, 1);
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            v444 = objc_msgSend(*v11, "currentOffset");
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 658, CFSTR("SZExtractorErrorDomain"), 2, 0, v375, CFSTR("Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size"), v381, v444);
            goto LABEL_504;
          }
          if (!*(_WORD *)(objc_msgSend(v31, "currentLFRecord") + 8) && UncompressedSize != CompressedSize)
          {
            v349 = v13;
            objc_msgSend(*v11, "unsureData");
            v350 = (void *)objc_claimAutoreleasedReturnValue();

            SZGetLoggingHandle();
            v351 = objc_claimAutoreleasedReturnValue();
            v352 = v351;
            if (v350)
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v551.st_dev) = 0;
                _os_log_impl(&dword_1D4E55000, v352, OS_LOG_TYPE_DEFAULT, "Stored file has compressed size != uncompressed size; entering passthrough mode",
                  (uint8_t *)&v551,
                  2u);
              }

              -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v24);
              v353 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
              {
                v430 = objc_msgSend(*v11, "currentOffset");
                v551.st_dev = 134218496;
                *(_QWORD *)&v551.st_mode = v430;
                WORD2(v551.st_ino) = 2048;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = UncompressedSize;
                HIWORD(v551.st_gid) = 2048;
                *(_QWORD *)&v551.st_rdev = CompressedSize;
                _os_log_error_impl(&dword_1D4E55000, v352, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)", (uint8_t *)&v551, 0x20u);
              }

              v556 = CFSTR("SZExtractorFileOffsetErrorKey");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v382 = (void *)objc_claimAutoreleasedReturnValue();
              v557 = v382;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v557, &v556, 1);
              v383 = (void *)objc_claimAutoreleasedReturnValue();
              v384 = objc_msgSend(*v11, "currentOffset");
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 671, CFSTR("SZExtractorErrorDomain"), 2, 0, v383, CFSTR("Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)"), v385, v384);
              v353 = objc_claimAutoreleasedReturnValue();

            }
            v15 = 0;
            v9 = (id)v353;
            v13 = v349;
            goto LABEL_511;
          }
        }
        v467 = v9;
        v463 = v13;
        GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v11, "currentLFRecord"));
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
        v33 = *v11;
        if (!v9 || !v32)
        {
          objc_msgSend(v33, "unsureData");
          v318 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v319 = objc_claimAutoreleasedReturnValue();
          v320 = v319;
          if (v318)
          {
            v321 = os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT);
            v13 = v463;
            if (v321)
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl(&dword_1D4E55000, v320, OS_LOG_TYPE_DEFAULT, "Failed to get filename for file; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v24);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v367 = os_log_type_enabled(v319, OS_LOG_TYPE_ERROR);
            v13 = v463;
            if (v367)
            {
              v419 = objc_msgSend(*v11, "currentOffset");
              v551.st_dev = v458;
              *(_QWORD *)&v551.st_mode = v419;
              _os_log_error_impl(&dword_1D4E55000, v320, OS_LOG_TYPE_ERROR, "Failed to get filename for file at offset %llu.", (uint8_t *)&v551, 0xCu);
            }

            v554 = CFSTR("SZExtractorFileOffsetErrorKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v368 = (void *)objc_claimAutoreleasedReturnValue();
            v555 = v368;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v555, &v554, 1);
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            v370 = objc_msgSend(*v11, "currentOffset");
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 686, CFSTR("SZExtractorErrorDomain"), 2, 0, v369, CFSTR("Failed to get filename for file at offset %llu."), v371, v370);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_461;
        }
        v34 = objc_msgSend(v33, "currentLFRecord");
        v35 = *(unsigned __int8 *)(*(unsigned __int16 *)(v34 + 26) + v34 + 29);
        objc_msgSend(*v11, "setPerformingExtraction:", 1);
        v36 = objc_msgSend(*v11, "currentLFRecord");
        v37 = v11;
        v38 = *(unsigned __int16 *)(v36 + 8);
        v39 = objc_msgSend(*v37, "currentLFRequiresDataDescriptor");
        SZGetTraceHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = os_signpost_enabled(v40);
        if (v39)
        {
          if (!v41)
            goto LABEL_78;
          v551.st_dev = v455;
          *(_QWORD *)&v551.st_mode = v9;
          WORD2(v551.st_ino) = 1024;
          *(_DWORD *)((char *)&v551.st_ino + 6) = v38;
          v42 = v40;
          v43 = "Processing file %@ (csize: ??; usize: ??; cmethod: %hu)";
          v44 = 18;
        }
        else
        {
          if (!v41)
            goto LABEL_78;
          v74 = v468;
          v75 = _GetCompressedSize(*v468);
          v76 = _GetUncompressedSize(*v74);
          v551.st_dev = v454;
          *(_QWORD *)&v551.st_mode = v9;
          WORD2(v551.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v75;
          HIWORD(v551.st_gid) = 2048;
          *(_QWORD *)&v551.st_rdev = v76;
          LOWORD(v551.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&v551.st_atimespec.tv_sec + 2) = v38;
          v42 = v40;
          v43 = "Processing file %@ (csize: %llu; usize: %llu; cmethod: %hu)";
          v44 = 38;
        }
        _os_signpost_emit_with_name_impl(&dword_1D4E55000, v42, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", v43, (uint8_t *)&v551, v44);
LABEL_78:

        v11 = v468;
        if (v35 == 47 && (objc_msgSend(*v468, "currentLFRequiresDataDescriptor") & 1) == 0 && _GetCompressedSize(*v11))
        {
          objc_msgSend(*v11, "unsureData");
          v372 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v373 = objc_claimAutoreleasedReturnValue();
          v322 = v373;
          if (v372)
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
            {
              v551.st_dev = v451;
              *(_QWORD *)&v551.st_mode = v32;
              v324 = "Got directory %s with non-zero compressed data size; entering passthrough mode";
              v325 = v322;
              v326 = 12;
LABEL_419:
              _os_log_impl(&dword_1D4E55000, v325, OS_LOG_TYPE_DEFAULT, v324, (uint8_t *)&v551, v326);
            }
LABEL_420:

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v24);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v451;
              *(_QWORD *)&v551.st_mode = v32;
              _os_log_error_impl(&dword_1D4E55000, v322, OS_LOG_TYPE_ERROR, "Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                (uint8_t *)&v551,
                0xCu);
            }

            v552 = CFSTR("SZExtractorFileOffsetErrorKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            v553 = v404;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v553, &v552, 1);
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 708, CFSTR("SZExtractorErrorDomain"), 2, 0, v405, CFSTR("Directory %s has a non-zero compressed size; directories aren't supposed to have data."),
              v406,
              (uint64_t)v32);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          v13 = v463;
LABEL_461:

          goto LABEL_462;
        }
        objc_msgSend(*v11, "unsureData");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v77)
          goto LABEL_108;
        if ((unint64_t)objc_msgSend(*v11, "recordsProcessed") >= 3)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 714, "_currentState.recordsProcessed <= 2");
        if (objc_msgSend(*v11, "recordsProcessed"))
        {
          if (objc_msgSend(*v11, "recordsProcessed") != 1)
          {
            if (objc_msgSend(*v11, "recordsProcessed") != 2 || strcmp(v32, "META-INF/com.apple.ZipMetadata.plist"))
            {
LABEL_417:
              SZGetLoggingHandle();
              v322 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
              {
                v323 = objc_msgSend(*v11, "recordsProcessed");
                v551.st_dev = 134218498;
                *(_QWORD *)&v551.st_mode = v323;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v32;
                HIWORD(v551.st_gid) = 2080;
                *(_QWORD *)&v551.st_rdev = "META-INF/";
                v324 = "Item %lld (%s) in archive was not 'mimetype' or %s; entering passthrough mode";
                v325 = v322;
                v326 = 32;
                goto LABEL_419;
              }
              goto LABEL_420;
            }
LABEL_105:
            SZGetLoggingHandle();
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              v551.st_dev = v451;
              *(_QWORD *)&v551.st_mode = v32;
              _os_log_debug_impl(&dword_1D4E55000, v93, OS_LOG_TYPE_DEBUG, "File %s is metadata file, so keeping in memory", (uint8_t *)&v551, 0xCu);
            }

            objc_msgSend(*v11, "setStoreCurrentFileInMemory:", 1);
            goto LABEL_108;
          }
          if (!strcmp(v32, "META-INF/com.apple.ZipMetadata.plist"))
            goto LABEL_105;
          v78 = v32;
          v79 = "META-INF/";
        }
        else
        {
          if (!strcmp(v32, "META-INF/"))
            goto LABEL_108;
          v78 = v32;
          v79 = "mimetype";
        }
        if (strcmp(v78, v79))
          goto LABEL_417;
LABEL_108:
        if (!strcmp(v32, "META-INF/com.apple.FixedZipMetadata.bin"))
        {
          SZGetLoggingHandle();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            v551.st_dev = v451;
            *(_QWORD *)&v551.st_mode = v32;
            _os_log_debug_impl(&dword_1D4E55000, v94, OS_LOG_TYPE_DEBUG, "File %s is fixed metadata file, so keeping in memory", (uint8_t *)&v551, 0xCu);
          }

          objc_msgSend(*v11, "setStoreCurrentFileInMemory:", 1);
        }
        objc_msgSend(v464, "stringByAppendingPathComponent:", v9);
        v95 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v96 = (const char *)objc_msgSend(v95, "fileSystemRepresentation");
        objc_msgSend(*v11, "streamInfoDict");
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = *v11;
        if (!v97)
        {
          if (v35 == 47)
            v105 = 16877;
          else
            v105 = 33188;
          goto LABEL_137;
        }
        v99 = objc_msgSend(v98, "currentLFRecord");
        if (*(_WORD *)(v99 + 28))
        {
          ExtraFieldWithSignature = GetExtraFieldWithSignature(v99 + *(unsigned __int16 *)(v99 + 26) + 30, *(unsigned __int16 *)(v99 + 28), &kStreamingZipLFExtraFieldSignature);
          if (ExtraFieldWithSignature)
          {
            if (ExtraFieldWithSignature[1] >= 2u)
            {
              v105 = ExtraFieldWithSignature[2];
              v98 = *v11;
LABEL_137:
              objc_msgSend(v98, "setCurrentLFMode:", v105);
              goto LABEL_155;
            }
          }
        }
        objc_msgSend(*v11, "streamInfoDict");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = v101;
        if (v35 == 47)
        {
          objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("StandardDirectoryPerms"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v103)
          {
            v104 = 16877;
            goto LABEL_154;
          }
LABEL_122:
          v104 = objc_msgSend(v103, "unsignedShortValue");
          goto LABEL_154;
        }
        objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("StandardFilePerms"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (v103)
          goto LABEL_122;
        v104 = 33188;
LABEL_154:
        objc_msgSend(*v11, "setCurrentLFMode:", v104);

LABEL_155:
        objc_msgSend(*v11, "setCurrentLFMode:", objc_msgSend(*v11, "currentLFMode") & 0xFFFFF1FFLL);
        if ((objc_msgSend(*v11, "currentLFMode") & 0xF000) == 0xA000)
        {
          SZGetLoggingHandle();
          v125 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
          {
            v246 = objc_msgSend(*v11, "currentLFMode");
            v551.st_dev = v453;
            *(_QWORD *)&v551.st_mode = v32;
            WORD2(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 6) = v246;
            _os_log_debug_impl(&dword_1D4E55000, v125, OS_LOG_TYPE_DEBUG, "File %s is a symlink (mode = 0%o), so keeping in memory", (uint8_t *)&v551, 0x12u);
          }

          objc_msgSend(*v11, "setStoreCurrentFileInMemory:", 1);
        }
        LFUncompressedSize = GetLFUncompressedSize(objc_msgSend(*v11, "currentLFRecord"));
        if (LFUncompressedSize > 0x500000)
        {
          v127 = LFUncompressedSize;
          SZGetLoggingHandle();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
          {
            v551.st_dev = v453;
            *(_QWORD *)&v551.st_mode = v32;
            WORD2(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v127;
            _os_log_debug_impl(&dword_1D4E55000, v128, OS_LOG_TYPE_DEBUG, "File %s is larger than 5 MB (%llu) so not keeping in memory", (uint8_t *)&v551, 0x16u);
          }

          objc_msgSend(*v11, "setStoreCurrentFileInMemory:", 0);
        }
        objc_msgSend(v95, "stringByDeletingLastPathComponent");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v129, "isEqualToString:", v464) & 1) != 0)
          goto LABEL_176;
        v130 = objc_retainAutorelease(v129);
        v131 = (const char *)objc_msgSend(v130, "fileSystemRepresentation");
        memset(&v551, 0, sizeof(v551));
        if (!stat(v131, &v551))
          goto LABEL_176;
        if (*__error() != 2)
        {
          v152 = *__error();
          SZGetLoggingHandle();
          v153 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
          {
            v259 = strerror(v152);
            v547 = v455;
            v548 = v130;
            v549 = 2080;
            v550 = v259;
            _os_log_error_impl(&dword_1D4E55000, v153, OS_LOG_TYPE_ERROR, "Can't determine if parent path exists %@: %s", (uint8_t *)&v547, 0x16u);
          }

          v543 = v461;
          v544 = v130;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v544, &v543, 1);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v152);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 881, v457, v152, 0, v154, CFSTR("Can't determine if parent path exists %@: %s"), v155, (uint64_t)v130);
          v156 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_200;
        }
        v465 = v96;
        SZGetLoggingHandle();
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
        {
          v547 = v456;
          v548 = v130;
          _os_log_debug_impl(&dword_1D4E55000, v132, OS_LOG_TYPE_DEBUG, "Parent path %@ did not exist", (uint8_t *)&v547, 0xCu);
        }

        v133 = mkpath_np(v131, 0x1EDu);
        v134 = v133;
        v56 = 0;
        v135 = 1;
        if (v133 && v133 != 17)
        {
          SZGetLoggingHandle();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v274 = strerror(v134);
            v547 = v455;
            v548 = v130;
            v549 = 2080;
            v550 = v274;
            _os_log_error_impl(&dword_1D4E55000, v136, OS_LOG_TYPE_ERROR, "Failed to create parent directory %@: %s", (uint8_t *)&v547, 0x16u);
          }

          v545 = v461;
          v546 = v130;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v546, &v545, 1);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v134);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 834, v457, v134, 0, v137, CFSTR("Failed to create parent directory %@: %s"), v138, (uint64_t)v130);
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          v135 = 0;
          v56 = 2;
          v467 = v139;
        }
        v96 = v465;
        if (v134 && v134 != 17 && !v135)
          goto LABEL_207;
LABEL_176:
        InfoZipExtraFieldFromLF = GetInfoZipExtraFieldFromLF(objc_msgSend(*v11, "currentLFRecord"));
        v141 = *v11;
        if (v35 == 47)
        {
          if ((~objc_msgSend(v141, "currentLFMode") & 0xC0) != 0)
            objc_msgSend(*v11, "setCurrentLFMode:", objc_msgSend(*v11, "currentLFMode") | 0xC0);
          if (mkdir(v96, objc_msgSend(*v11, "currentLFMode")))
          {
            if (*__error() != 17)
            {
              v157 = *__error();
              SZGetLoggingHandle();
              v158 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
              {
                v260 = strerror(v157);
                v551.st_dev = v455;
                *(_QWORD *)&v551.st_mode = v95;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v260;
                _os_log_error_impl(&dword_1D4E55000, v158, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@: %s", (uint8_t *)&v551, 0x16u);
              }

              v541 = v461;
              v542 = v95;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v542, &v541, 1);
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              strerror(v157);
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 899, v457, v157, 0, v159, CFSTR("Failed to create directory at path %@: %s"), v160, (uint64_t)v95);
              v156 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_200:
              v56 = 2;
              v467 = v156;
              goto LABEL_207;
            }
            if (chmod(v96, objc_msgSend(*v11, "currentLFMode")))
            {
              SZGetLoggingHandle();
              v142 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
              {
                v264 = __error();
                v265 = strerror(*v264);
                v551.st_dev = v455;
                *(_QWORD *)&v551.st_mode = v95;
                WORD2(v551.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v265;
                _os_log_error_impl(&dword_1D4E55000, v142, OS_LOG_TYPE_ERROR, "Failed to set proper mode on directory %@: %s", (uint8_t *)&v551, 0x16u);
              }

            }
          }
          v547 = -1;
          v508 = -1;
          if (objc_msgSend(*v11, "resolveOwnershipWithExtraField:outUID:outGID:", InfoZipExtraFieldFromLF, &v547, &v508)&& lchown(v96, v547, v508))
          {
            v143 = *__error();
            SZGetLoggingHandle();
            v144 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
            {
              v145 = v547;
              v146 = v508;
              v147 = strerror(v143);
              v551.st_dev = v450;
              *(_QWORD *)&v551.st_mode = v96;
              WORD2(v551.st_ino) = 1024;
              *(_DWORD *)((char *)&v551.st_ino + 6) = v145;
              v11 = v468;
              HIWORD(v551.st_uid) = 1024;
              v551.st_gid = v146;
              LOWORD(v551.st_rdev) = 1024;
              *(dev_t *)((char *)&v551.st_rdev + 2) = v143;
              *((_WORD *)&v551.st_rdev + 3) = 2080;
              v551.st_atimespec.tv_sec = (__darwin_time_t)v147;
              _os_log_impl(&dword_1D4E55000, v144, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", (uint8_t *)&v551, 0x28u);
            }

          }
          goto LABEL_204;
        }
        if ((objc_msgSend(v141, "storeCurrentFileInMemory") & 1) != 0)
          goto LABEL_204;
        objc_msgSend(*v11, "fileWriter");
        v148 = objc_claimAutoreleasedReturnValue();
        v149 = v11;
        v150 = v466;
        if (v148)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 929, "!_currentState.fileWriter");
        if ((objc_msgSend(*v149, "currentLFRequiresDataDescriptor") & 1) != 0)
          v151 = -1;
        else
          v151 = _GetUncompressedSize(*v149);
        v161 = objc_msgSend(*(id *)(v150 + 64), "performCachedWrites");
        v162 = *(_QWORD *)(v150 + 96);
        v163 = v467;
        v507 = v467;
        +[StreamingFileWriter fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:](StreamingFileWriter, "fileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:expectedSize:asyncTrackingGroup:errorDelegate:error:", v95, 1537, 384, 0, v161, v151, v162, v150, &v507);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = v507;

        if (v164)
        {
          v551.st_dev = -1;
          v547 = -1;
          v11 = v468;
          v166 = objc_msgSend(*v468, "resolveOwnershipWithExtraField:outUID:outGID:", InfoZipExtraFieldFromLF, &v551, &v547);
          objc_msgSend(v164, "configureFileAndSetOwnership:toUID:GID:", v166, v551.st_dev, v547);
          objc_msgSend(*v11, "setFileWriter:", v164);

          v467 = v165;
LABEL_204:
          if ((objc_msgSend(*v11, "currentLFRequiresDataDescriptor") & 1) != 0 || _GetCompressedSize(*v11))
          {
            objc_msgSend(*v11, "setStreamState:", 2);
            v56 = 0;
          }
          else
          {
            objc_msgSend(*v11, "setStreamState:", 4);
            v56 = 3;
          }
          goto LABEL_207;
        }
        SZGetLoggingHandle();
        v217 = objc_claimAutoreleasedReturnValue();
        v218 = os_log_type_enabled(v217, OS_LOG_TYPE_ERROR);
        v11 = v468;
        if (v218)
        {
          v551.st_dev = v456;
          *(_QWORD *)&v551.st_mode = v95;
          _os_log_error_impl(&dword_1D4E55000, v217, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", (uint8_t *)&v551, 0xCu);
        }

        v539 = v461;
        v540 = v95;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v540, &v539, 1);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 940, CFSTR("SZExtractorErrorDomain"), 1, v165, v219, CFSTR("Failed to open output file at path %@"), v220, (uint64_t)v95);
        v467 = (id)objc_claimAutoreleasedReturnValue();

        v56 = 2;
LABEL_207:

        if (v56)
        {
          v13 = v463;
          v9 = v467;
          goto LABEL_359;
        }
        v12 = v509;
        a1 = v466;
        v9 = v467;
        v13 = v463;
LABEL_210:
        v167 = objc_msgSend(*v11, "currentLFRequiresDataDescriptor");
        v168 = *(unsigned __int16 *)(objc_msgSend(*v11, "currentLFRecord") + 8);
        v460 = v167;
        if (!v167 || (v169 = v12, !v168))
        {
          v170 = _GetCompressedSize(*v11);
          v171 = objc_msgSend(*v11, "thisStageBytesComplete");
          if (v12 >= v170 - v171)
            v169 = v170 - v171;
          else
            v169 = v12;
        }
        if (!objc_msgSend(*v11, "thisStageBytesComplete"))
        {
          objc_msgSend(*v11, "setCurrentCRC32:", crc32(0, 0, 0));
          if (v169)
            goto LABEL_219;
LABEL_276:
          if (v460 && *(_WORD *)(objc_msgSend(*v11, "currentLFRecord") + 8))
          {
            if ((v169 & 1) != 0)
            {
              v208 = *v11;
LABEL_282:
              v56 = 3;
              objc_msgSend(v208, "setStreamState:", 3);
              goto LABEL_359;
            }
          }
          else
          {
            v209 = objc_msgSend(*v11, "thisStageBytesComplete");
            if (v209 != _GetCompressedSize(*v11))
            {
              if (v12)
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1295, "0 == length");
              goto LABEL_474;
            }
            v208 = *v11;
            if (v460)
              goto LABEL_282;
            objc_msgSend(v208, "setStreamState:", 4);
          }
          goto LABEL_55;
        }
        if (!v169)
          goto LABEL_276;
LABEL_219:
        v447 = 0;
        v448 = v168;
        v463 = v13;
        while (2)
        {
          if (v169 >= 0x7FFFFFFF)
            v172 = 0x7FFFFFFFLL;
          else
            v172 = v169;
          v459 = v169 - v172;
          if (v168 > 13)
          {
            if (v168 != 14 && v168 != 99)
            {
LABEL_448:
              GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v11, "currentLFRecord"));
              v290 = (void *)objc_claimAutoreleasedReturnValue();
              v527[0] = CFSTR("SZExtractorFileOffsetErrorKey");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
              v359 = (void *)objc_claimAutoreleasedReturnValue();
              v527[1] = v461;
              v528[0] = v359;
              v528[1] = v290;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v528, v527, 2);
              v292 = (void *)objc_claimAutoreleasedReturnValue();

              SZGetLoggingHandle();
              v360 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
              {
                v414 = *(unsigned __int16 *)(objc_msgSend(*v11, "currentLFRecord") + 8);
                v551.st_dev = 67109378;
                *(_DWORD *)&v551.st_mode = v414;
                LOWORD(v551.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = (__darwin_ino64_t)v290;
                _os_log_error_impl(&dword_1D4E55000, v360, OS_LOG_TYPE_ERROR, "Unknown compression method %hu for file %@", (uint8_t *)&v551, 0x12u);
              }

              v361 = objc_msgSend(*v11, "currentLFRecord");
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1283, CFSTR("SZExtractorErrorDomain"), 2, 0, v292, CFSTR("Unknown compression method %hu for file %@"), v362, *(unsigned __int16 *)(v361 + 8));
              v299 = objc_claimAutoreleasedReturnValue();
              goto LABEL_394;
            }
            goto LABEL_229;
          }
          if (v168)
          {
            if (v168 != 8)
              goto LABEL_448;
LABEL_229:
            v467 = v9;
            if (!*(_QWORD *)(a1 + 56))
              *(_QWORD *)(a1 + 56) = malloc_type_malloc(0x10000uLL, 0x165A7F06uLL);
            v173 = (compression_stream *)objc_msgSend(*v11, "cmpState");
            if (!objc_msgSend(*v11, "thisStageBytesComplete"))
            {
              v174 = compression_stream_reinit();
              if ((_DWORD)v174)
              {
                v354 = v174;
                SZGetLoggingHandle();
                v355 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
                {
                  v551.st_dev = 67109120;
                  *(_DWORD *)&v551.st_mode = v354;
                  _os_log_error_impl(&dword_1D4E55000, v355, OS_LOG_TYPE_ERROR, "Failed to initialize compression: %d", (uint8_t *)&v551, 8u);
                }

                v537 = CFSTR("SZExtractorCompressionLibErrorKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v354);
                v356 = (void *)objc_claimAutoreleasedReturnValue();
                v538 = v356;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v538, &v537, 1);
                v357 = (void *)objc_claimAutoreleasedReturnValue();
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1044, CFSTR("SZExtractorErrorDomain"), 1, 0, v357, CFSTR("Failed to initialize compression: %d"), v358, v354);
                v9 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_474;
              }
            }
            LODWORD(v465) = 0;
            src_ptr = v510;
            v173->src_ptr = v510;
            v173->src_size = v172;
            while (1)
            {
              v173->dst_ptr = *(uint8_t **)(a1 + 56);
              v173->dst_size = 0x10000;
              v176 = compression_stream_process(v173, 0);
              src_size = v173->src_size;
              v178 = v172 - src_size;
              SZGetLoggingHandle();
              v179 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
              {
                v551.st_dev = v458;
                *(_QWORD *)&v551.st_mode = v172 - src_size;
                _os_log_debug_impl(&dword_1D4E55000, v179, OS_LOG_TYPE_DEBUG, "compression_stream_process consumed %zu bytes", (uint8_t *)&v551, 0xCu);
              }

              objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v178);
              objc_msgSend(*v11, "setThisStageBytesComplete:", objc_msgSend(*v11, "thisStageBytesComplete") + v178);
              dst_size = v173->dst_size;
              if (dst_size > 0x10000)
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1083, "outputSize >= cmpState->dst_size");
              if (!(_DWORD)v176 && v172 && v172 == src_size && dst_size == 0x10000)
              {
                v535[0] = CFSTR("SZExtractorFileOffsetErrorKey");
                v277 = v468;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v468, "currentOffset"));
                v278 = (void *)objc_claimAutoreleasedReturnValue();
                v536[0] = v278;
                v535[1] = v461;
                GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v277, "currentLFRecord"));
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                v536[1] = v279;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v536, v535, 2);
                v280 = (void *)objc_claimAutoreleasedReturnValue();

                SZGetLoggingHandle();
                v281 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v281, OS_LOG_TYPE_ERROR))
                {
                  GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v277, "currentLFRecord"));
                  v327 = (id)objc_claimAutoreleasedReturnValue();
                  v551.st_dev = 138412802;
                  *(_QWORD *)&v551.st_mode = v327;
                  WORD2(v551.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v172;
                  HIWORD(v551.st_gid) = 2048;
                  *(_QWORD *)&v551.st_rdev = 0x10000;
                  _os_log_error_impl(&dword_1D4E55000, v281, OS_LOG_TYPE_ERROR, "compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                    (uint8_t *)&v551,
                    0x20u);

                }
                GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v277, "currentLFRecord"));
                v282 = (void *)objc_claimAutoreleasedReturnValue();
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1089, CFSTR("SZExtractorErrorDomain"), 1, 0, v280, CFSTR("compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu"),
                  v283,
                  (uint64_t)v282);
                v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_384:
                v15 = 0;
                a1 = v466;
LABEL_385:
                v13 = v463;
                goto LABEL_511;
              }
              if (v176 >= 2)
              {
                v533[0] = CFSTR("SZExtractorCompressionLibErrorKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v176);
                v284 = (void *)objc_claimAutoreleasedReturnValue();
                v534[0] = v284;
                v533[1] = CFSTR("SZExtractorFileOffsetErrorKey");
                v285 = v468;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v468, "currentOffset"));
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v534[1] = v286;
                v533[2] = v461;
                GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v285, "currentLFRecord"));
                v287 = (void *)objc_claimAutoreleasedReturnValue();
                v534[2] = v287;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v534, v533, 3);
                v280 = (void *)objc_claimAutoreleasedReturnValue();

                SZGetLoggingHandle();
                v288 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
                {
                  v551.st_dev = 67109120;
                  *(_DWORD *)&v551.st_mode = v176;
                  _os_log_error_impl(&dword_1D4E55000, v288, OS_LOG_TYPE_ERROR, "compression_stream_process returned unexpected result %d", (uint8_t *)&v551, 8u);
                }

                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1097, CFSTR("SZExtractorErrorDomain"), 2, 0, v280, CFSTR("compression_stream_process returned unexpected result %d"), v289, v176);
                v9 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_384;
              }
              if (v172 == src_size)
              {
                a1 = v466;
              }
              else
              {
                objc_msgSend(*v468, "updateHashFromOffset:withBytes:length:", objc_msgSend(*v468, "currentOffset") - v178, src_ptr, v172 - src_size);
                v181 = objc_claimAutoreleasedReturnValue();

                a1 = v466;
                if (v181)
                {
                  v15 = 0;
                  v9 = (id)v181;
                  goto LABEL_385;
                }
                v467 = 0;
                LODWORD(v465) = (_DWORD)v465 + v178;
              }
              if (dst_size == 0x10000)
              {
                v11 = v468;
              }
              else
              {
                v182 = 0x10000 - dst_size;
                objc_msgSend(*(id *)(a1 + 64), "setUncompressedBytesOutput:", objc_msgSend(*(id *)(a1 + 64), "uncompressedBytesOutput") + 0x10000 - dst_size);
                objc_msgSend(*(id *)(a1 + 64), "setCurrentCRC32:", crc32(objc_msgSend(*(id *)(a1 + 64), "currentCRC32"), *(const Bytef **)(a1 + 56), 0x10000 - (int)dst_size));
                v183 = objc_msgSend(*(id *)(a1 + 64), "storeCurrentFileInMemory");
                v184 = *(void **)(a1 + 64);
                if (v183)
                {
                  objc_msgSend(v184, "inMemoryFileData");
                  v185 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v185, "appendBytes:length:", *(_QWORD *)(a1 + 56), 0x10000 - dst_size);

                  v11 = v468;
                }
                else
                {
                  objc_msgSend(v184, "fileWriter");
                  v186 = (void *)objc_claimAutoreleasedReturnValue();
                  v187 = v468;
                  if (!v186)
                    __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1118, "_currentState.fileWriter");

                  objc_msgSend(*(id *)(a1 + 64), "fileWriter");
                  v188 = (void *)objc_claimAutoreleasedReturnValue();
                  v189 = *(_QWORD *)(a1 + 56);
                  v190 = v467;
                  v505 = v467;
                  v191 = objc_msgSend(v188, "writeBuffer:length:error:", v189, v182, &v505);
                  v192 = v505;

                  if (!v191)
                    goto LABEL_489;
                  v467 = v192;
                  v11 = v187;
                }
                objc_msgSend(*v11, "setTotalFileSizeWritten:", objc_msgSend(*v11, "totalFileSizeWritten") + v182);
                if (objc_msgSend(*v11, "totalUncompressedBytes"))
                  -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalFileSizeWritten")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
              }
              if ((_DWORD)v176)
                break;
              v172 = v173->src_size;
              if (!v172 && v173->dst_size)
                goto LABEL_263;
              src_ptr = v173->src_ptr;
            }
            if ((v460 & 1) == 0)
            {
              v203 = _GetCompressedSize(*v11);
              v204 = objc_msgSend(*v11, "thisStageBytesComplete");
              v9 = v467;
              if (v203 == v204)
              {
                v205 = _GetUncompressedSize(*v11);
                if (v205 == objc_msgSend(*v11, "uncompressedBytesOutput"))
                {
                  LODWORD(v172) = (_DWORD)v465;
                  v13 = v463;
                  goto LABEL_274;
                }
                SZGetLoggingHandle();
                v393 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v393, OS_LOG_TYPE_ERROR))
                {
                  v434 = objc_msgSend(*v11, "uncompressedBytesOutput");
                  GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v11, "currentLFRecord"));
                  v435 = (id)objc_claimAutoreleasedReturnValue();
                  v436 = _GetUncompressedSize(*v11);
                  v551.st_dev = 134218498;
                  *(_QWORD *)&v551.st_mode = v434;
                  WORD2(v551.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v435;
                  HIWORD(v551.st_gid) = 2048;
                  *(_QWORD *)&v551.st_rdev = v436;
                  _os_log_error_impl(&dword_1D4E55000, v393, OS_LOG_TYPE_ERROR, "Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes", (uint8_t *)&v551, 0x20u);

                }
                v529 = CFSTR("SZExtractorFileOffsetErrorKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
                v394 = (void *)objc_claimAutoreleasedReturnValue();
                v530 = v394;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v530, &v529, 1);
                v395 = (void *)objc_claimAutoreleasedReturnValue();
                v396 = objc_msgSend(*v11, "uncompressedBytesOutput");
                GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v11, "currentLFRecord"));
                v442 = (void *)objc_claimAutoreleasedReturnValue();
                _GetUncompressedSize(*v11);
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1143, CFSTR("SZExtractorErrorDomain"), 2, 0, v395, CFSTR("Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes"), v397, v396);
                v192 = (id)objc_claimAutoreleasedReturnValue();

LABEL_489:
                v15 = 0;
                v9 = v192;
              }
              else
              {
                SZGetLoggingHandle();
                v386 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v386, OS_LOG_TYPE_ERROR))
                {
                  v431 = _GetCompressedSize(*v11);
                  v432 = v431 - objc_msgSend(*v11, "thisStageBytesComplete");
                  GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v468, "currentLFRecord"));
                  v433 = (id)objc_claimAutoreleasedReturnValue();
                  v551.st_dev = 134218242;
                  *(_QWORD *)&v551.st_mode = v432;
                  v11 = v468;
                  WORD2(v551.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v433;
                  _os_log_error_impl(&dword_1D4E55000, v386, OS_LOG_TYPE_ERROR, "Hit compression stream end with %llu compressed bytes remaining for file %@", (uint8_t *)&v551, 0x16u);

                }
                v531 = CFSTR("SZExtractorFileOffsetErrorKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
                v387 = (void *)objc_claimAutoreleasedReturnValue();
                v532 = v387;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v532, &v531, 1);
                v388 = (void *)objc_claimAutoreleasedReturnValue();
                v389 = _GetCompressedSize(*v11);
                v390 = v389 - objc_msgSend(*v11, "thisStageBytesComplete");
                GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v468, "currentLFRecord"));
                v445 = (void *)objc_claimAutoreleasedReturnValue();
                _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1140, CFSTR("SZExtractorErrorDomain"), 2, 0, v388, CFSTR("Hit compression stream end with %llu compressed bytes remaining for file %@"), v391, v390);
                v392 = objc_claimAutoreleasedReturnValue();

                v15 = 0;
                v9 = (id)v392;
              }
              goto LABEL_385;
            }
            v459 = 0;
            v447 = 1;
LABEL_263:
            LODWORD(v172) = (_DWORD)v465;
            v13 = v463;
            v9 = v467;
LABEL_274:
            objc_msgSend(*v11, "unsureData");
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            v207 = v510;
            objc_msgSend(v206, "appendBytes:length:", v510, v172);

            v12 = v509 - v172;
            v509 = v12;
            v510 = &v207[v172];
            v168 = v448;
            v169 = v459;
            if (!v459)
            {
              LOBYTE(v169) = v447;
              goto LABEL_276;
            }
            continue;
          }
          break;
        }
        v193 = objc_msgSend(*v11, "currentCRC32");
        v194 = v510;
        objc_msgSend(*v11, "setCurrentCRC32:", crc32(v193, v510, v172));
        v195 = objc_msgSend(*v11, "storeCurrentFileInMemory");
        v196 = *v11;
        if (v195)
        {
          objc_msgSend(v196, "inMemoryFileData");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "appendBytes:length:", v194, v172);

LABEL_267:
          objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v172);
          objc_msgSend(*v11, "setThisStageBytesComplete:", objc_msgSend(*v11, "thisStageBytesComplete") + v172);
          objc_msgSend(*v11, "setUncompressedBytesOutput:", objc_msgSend(*v11, "uncompressedBytesOutput") + v172);
          objc_msgSend(*v11, "setTotalFileSizeWritten:", objc_msgSend(*v11, "totalFileSizeWritten") + v172);
          if (objc_msgSend(*v11, "totalUncompressedBytes"))
            -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalFileSizeWritten")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
          v201 = *v11;
          v202 = objc_msgSend(*v11, "currentOffset");
          objc_msgSend(v201, "updateHashFromOffset:withBytes:length:", v202 - v172, v510, v172);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(*v11, "markResumptionPoint");
            v9 = 0;
            goto LABEL_274;
          }
        }
        else
        {
          objc_msgSend(v196, "fileWriter");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v198)
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 993, "_currentState.fileWriter");

          objc_msgSend(*v11, "fileWriter");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v506 = v9;
          v200 = objc_msgSend(v199, "writeBuffer:length:error:", v194, v172, &v506);
          v16 = v506;

          if (v200)
          {
            v9 = v16;
            goto LABEL_267;
          }
        }
LABEL_463:
        v15 = 0;
        v9 = v16;
LABEL_511:
        objc_autoreleasePoolPop(v13);
        v7 = v462;
LABEL_512:
        if (v9)
        {
          if (objc_msgSend(*v468, "performingExtraction"))
          {
            SZGetTraceHandle();
            v413 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v413))
            {
              LOWORD(v551.st_dev) = 0;
              _os_signpost_emit_with_name_impl(&dword_1D4E55000, v413, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction failed", (uint8_t *)&v551, 2u);
            }

            objc_msgSend(*v468, "setPerformingExtraction:", 0);
          }
          -[StreamingUnzipper _setErrorState](a1);
        }
        v7[2](v7, v9, v15);

LABEL_519:
        return;
      case 2:
        goto LABEL_210;
      case 3:
        if (!objc_msgSend(*v11, "dataDescriptor"))
          objc_msgSend(*v11, "setDataDescriptor:", malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL));
        HasZip64ExtraField = LocalFileRecordHasZip64ExtraField(objc_msgSend(*v11, "currentLFRecord"));
        if (HasZip64ExtraField)
          v46 = 24;
        else
          v46 = 16;
        _CopyStreamBytesToRecord(objc_msgSend(*v11, "dataDescriptor"), v46, *v11, (const void **)&v510, &v509);
        v28 = objc_claimAutoreleasedReturnValue();

        if (v28)
          goto LABEL_395;
        v12 = v509;
        v47 = *v11;
        if (!v509)
          goto LABEL_408;
        if (objc_msgSend(v47, "thisStageBytesComplete") != v46)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1334, "_currentState.thisStageBytesComplete == expected_size");
        if (*(_DWORD *)objc_msgSend(*v11, "dataDescriptor") != 134695760)
        {
          objc_msgSend(*v11, "unsureData");
          v308 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v309 = objc_claimAutoreleasedReturnValue();
          v310 = v309;
          if (v308)
          {
            if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
            {
              v311 = *(unsigned __int8 *)objc_msgSend(*v11, "dataDescriptor");
              v312 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 1);
              v313 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 2);
              v314 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 3);
              v551.st_dev = 67109888;
              *(_DWORD *)&v551.st_mode = v311;
              LOWORD(v551.st_ino) = 1024;
              *(_DWORD *)((char *)&v551.st_ino + 2) = v312;
              HIWORD(v551.st_ino) = 1024;
              v551.st_uid = v313;
              LOWORD(v551.st_gid) = 1024;
              *(gid_t *)((char *)&v551.st_gid + 2) = v314;
              _os_log_impl(&dword_1D4E55000, v310, OS_LOG_TYPE_DEFAULT, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx); entering passthrough mode",
                (uint8_t *)&v551,
                0x1Au);
            }

            v315 = v510;
            v316 = a1;
            v317 = v12;
            goto LABEL_431;
          }
          if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
          {
            v415 = *(unsigned __int8 *)objc_msgSend(*v11, "dataDescriptor");
            v416 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 1);
            v417 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 2);
            v418 = *(unsigned __int8 *)(objc_msgSend(*v468, "dataDescriptor") + 3);
            v551.st_dev = 67109888;
            *(_DWORD *)&v551.st_mode = v415;
            v11 = v468;
            LOWORD(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 2) = v416;
            HIWORD(v551.st_ino) = 1024;
            v551.st_uid = v417;
            LOWORD(v551.st_gid) = 1024;
            *(gid_t *)((char *)&v551.st_gid + 2) = v418;
            _os_log_error_impl(&dword_1D4E55000, v310, OS_LOG_TYPE_ERROR, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).", (uint8_t *)&v551, 0x1Au);
          }

          v525 = CFSTR("SZExtractorFileOffsetErrorKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          v526 = v363;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v526, &v525, 1);
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          v365 = *(unsigned __int8 *)objc_msgSend(*v11, "dataDescriptor");
          objc_msgSend(*v468, "dataDescriptor");
          objc_msgSend(*v468, "dataDescriptor");
          objc_msgSend(*v468, "dataDescriptor");
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1343, CFSTR("SZExtractorErrorDomain"), 2, 0, v364, CFSTR("Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx)."), v366, v365);
          v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_454:
          v15 = 0;
LABEL_455:
          a1 = v466;
          goto LABEL_511;
        }
        SZGetLoggingHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG);
        if (HasZip64ExtraField)
        {
          if (!v49)
            goto LABEL_57;
          v50 = *(_DWORD *)(objc_msgSend(*v11, "dataDescriptor") + 4);
          v51 = *(_QWORD *)(objc_msgSend(*v468, "dataDescriptor") + 16);
          v52 = *(_QWORD *)(objc_msgSend(*v468, "dataDescriptor") + 8);
          v551.st_dev = v452;
          *(_DWORD *)&v551.st_mode = v50;
          v11 = v468;
          LOWORD(v551.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v551.st_ino + 2) = v51;
          HIWORD(v551.st_uid) = 2048;
          *(_QWORD *)&v551.st_gid = v52;
          v53 = v48;
          v54 = "Got data descriptor with CRC 0x%x, uncompressed size %llu, compressed size %llu";
          v55 = 28;
        }
        else
        {
          if (!v49)
            goto LABEL_57;
          v243 = *(_DWORD *)(objc_msgSend(*v11, "dataDescriptor") + 4);
          v244 = *(_DWORD *)(objc_msgSend(*v468, "dataDescriptor") + 12);
          v245 = *(_DWORD *)(objc_msgSend(*v468, "dataDescriptor") + 8);
          v551.st_dev = v452;
          *(_DWORD *)&v551.st_mode = v243;
          v11 = v468;
          LOWORD(v551.st_ino) = 1024;
          *(_DWORD *)((char *)&v551.st_ino + 2) = v244;
          HIWORD(v551.st_ino) = 1024;
          v551.st_uid = v245;
          v53 = v48;
          v54 = "Got data descriptor with CRC 0x%x, uncompressed size %u, compressed size %u";
          v55 = 20;
        }
        _os_log_debug_impl(&dword_1D4E55000, v53, OS_LOG_TYPE_DEBUG, v54, (uint8_t *)&v551, v55);
LABEL_57:

        objc_msgSend(*v11, "setStreamState:", 4);
        v9 = 0;
LABEL_58:
        v57 = objc_msgSend(*v11, "uncompressedBytesOutput");
        v58 = _GetUncompressedSize(*v11);
        v59 = *v11;
        if (v57 != v58)
        {
          GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(v59, "currentLFRecord"));
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          v523[0] = CFSTR("SZExtractorFileOffsetErrorKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          v523[1] = v461;
          v524[0] = v291;
          v524[1] = v290;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v524, v523, 2);
          v292 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v293 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v293, OS_LOG_TYPE_ERROR))
          {
            v400 = objc_msgSend(*v11, "uncompressedBytesOutput");
            v401 = _GetUncompressedSize(*v11);
            v551.st_dev = 138412802;
            *(_QWORD *)&v551.st_mode = v290;
            WORD2(v551.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = v400;
            HIWORD(v551.st_gid) = 2048;
            *(_QWORD *)&v551.st_rdev = v401;
            _os_log_error_impl(&dword_1D4E55000, v293, OS_LOG_TYPE_ERROR, "Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
              (uint8_t *)&v551,
              0x20u);
          }

          objc_msgSend(*v11, "uncompressedBytesOutput");
          _GetUncompressedSize(*v11);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1364, CFSTR("SZExtractorErrorDomain"), 2, 0, v292, CFSTR("Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu"),
            v294,
            (uint64_t)v290);
LABEL_393:
          v299 = objc_claimAutoreleasedReturnValue();
LABEL_394:
          v28 = v299;

          goto LABEL_395;
        }
        v60 = objc_msgSend(v59, "currentCRC32");
        CRC32 = _GetCRC32(*v11);
        v62 = (_WORD *)objc_msgSend(*v11, "currentLFRecord");
        if (v60 != CRC32)
        {
          GetFileNameStringFromLocalFileRecord(v62);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          v521[0] = CFSTR("SZExtractorFileOffsetErrorKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          v521[1] = v461;
          v522[0] = v295;
          v522[1] = v290;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v522, v521, 2);
          v292 = (void *)objc_claimAutoreleasedReturnValue();

          SZGetLoggingHandle();
          v296 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR))
          {
            v402 = objc_msgSend(*v11, "currentCRC32");
            v403 = _GetCRC32(*v11);
            v551.st_dev = 134218498;
            *(_QWORD *)&v551.st_mode = v402;
            WORD2(v551.st_ino) = 1024;
            *(_DWORD *)((char *)&v551.st_ino + 6) = v403;
            HIWORD(v551.st_uid) = 2112;
            *(_QWORD *)&v551.st_gid = v290;
            _os_log_error_impl(&dword_1D4E55000, v296, OS_LOG_TYPE_ERROR, "CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
              (uint8_t *)&v551,
              0x1Cu);
          }

          v297 = objc_msgSend(*v11, "currentCRC32");
          _GetCRC32(*v11);
          _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1372, CFSTR("SZExtractorErrorDomain"), 2, 0, v292, CFSTR("CRC mismatch; got: 0x%lx expected: 0x%x for file %@"),
            v298,
            v297);
          goto LABEL_393;
        }
        v467 = v9;
        v63 = GetInfoZipExtraFieldFromLF((uint64_t)v62);
        GetFileNameStringFromLocalFileRecord((_WORD *)objc_msgSend(*v11, "currentLFRecord"));
        v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v65 = (const char *)objc_msgSend(v64, "fileSystemRepresentation");
        v66 = *v11;
        if (!v64 || !v65)
        {
          objc_msgSend(v66, "unsureData");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v71)
          {
            v80 = objc_msgSend(*v11, "currentLFRecord");
            v81 = *(unsigned __int16 *)(v80 + 26);
            v82 = malloc_type_calloc(v81 + 1, 1uLL, 0xCB3B20E1uLL);
            memcpy(v82, (const void *)(v80 + 30), v81);
            SZGetLoggingHandle();
            v83 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v451;
              *(_QWORD *)&v551.st_mode = v82;
              _os_log_error_impl(&dword_1D4E55000, v83, OS_LOG_TYPE_ERROR, "Couldn't get filename for current file \"%s\", (uint8_t *)&v551, 0xCu);
            }

            v519 = CFSTR("SZExtractorFileOffsetErrorKey");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*v11, "currentOffset"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v520 = v84;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v520, &v519, 1);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 2;
            _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1387, CFSTR("SZExtractorErrorDomain"), 2, 0, v85, CFSTR("Couldn't get filename for current file \"%s\"), v86, (uint64_t)v82);
            v73 = (id)objc_claimAutoreleasedReturnValue();

            free(v82);
            goto LABEL_358;
          }
          SZGetLoggingHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v551.st_dev) = 0;
            _os_log_impl(&dword_1D4E55000, v72, OS_LOG_TYPE_DEFAULT, "Couldn't get filename for stream metadata file; entering passthrough mode",
              (uint8_t *)&v551,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v12);
          v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_74:
          v56 = 2;
          goto LABEL_358;
        }
        v67 = objc_msgSend(v66, "recordsProcessed");
        v463 = v13;
        if (v67 > 2 || strcmp(v65, "META-INF/com.apple.ZipMetadata.plist"))
        {
          if ((unint64_t)objc_msgSend(*v11, "recordsProcessed") > 3
            || strcmp(v65, "META-INF/com.apple.FixedZipMetadata.bin"))
          {
            if ((objc_msgSend(*v11, "currentLFMode") & 0xF000) == 0xA000)
            {
              objc_msgSend(v464, "stringByAppendingPathComponent:", v64);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(*v11, "storeCurrentFileInMemory"))
              {
                objc_msgSend(*v11, "inMemoryFileData");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v69)
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1496, "_currentState.inMemoryFileData");

                objc_msgSend(*v11, "inMemoryFileData");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_126;
              }
              v473 = 0;
              objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithContentsOfFile:options:error:", v68, 3, &v473);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = v473;
              if (v70)
              {
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "removeItemAtPath:error:", v68, 0);

LABEL_126:
                v472 = 0;
                objc_msgSend(v70, "appendBytes:length:", &v472, 1);
                v108 = objc_retainAutorelease(v70);
                v109 = (const char *)objc_msgSend(v108, "bytes");
                v87 = objc_retainAutorelease(v68);
                v110 = (const char *)-[NSObject fileSystemRepresentation](v87, "fileSystemRepresentation");
                if (objc_msgSend(*v11, "denyInvalidSymlinks"))
                {
                  if (*v109 == 47)
                  {
                    SZGetLoggingHandle();
                    v111 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                    {
                      v551.st_dev = v453;
                      *(_QWORD *)&v551.st_mode = v110;
                      WORD2(v551.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v109;
                      _os_log_error_impl(&dword_1D4E55000, v111, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s (absolute symlinks are forbidden)", (uint8_t *)&v551, 0x16u);
                    }

                    v515 = v461;
                    v516 = v87;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v516, &v515, 1);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1520, CFSTR("SZExtractorErrorDomain"), 5, 0, v112, CFSTR("Invalid symlink: %s -> %s (absolute symlinks are forbidden)"), v113, (uint64_t)v110);
LABEL_324:
                    v73 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_325;
                  }
                  v547 = 0;
                  v508 = 0;
                  if (!_GetAndValidatePathDepth((const char *)objc_msgSend(objc_retainAutorelease(v64), "fileSystemRepresentation"), 0, (int *)&v508)|| !_GetAndValidatePathDepth(v109, v508, (int *)&v547))
                  {
                    SZGetLoggingHandle();
                    v240 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
                    {
                      v551.st_dev = v453;
                      *(_QWORD *)&v551.st_mode = v110;
                      WORD2(v551.st_ino) = 2080;
                      *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v109;
                      _os_log_error_impl(&dword_1D4E55000, v240, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s", (uint8_t *)&v551, 0x16u);
                    }

                    v513 = v461;
                    v514 = v87;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v514, &v513, 1);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1533, CFSTR("SZExtractorErrorDomain"), 5, 0, v112, CFSTR("Invalid symlink: %s -> %s"), v241, (uint64_t)v110);
                    goto LABEL_324;
                  }
                }
                if (symlink(v109, v110))
                {
                  v221 = v108;
                  v222 = *__error();
                  SZGetLoggingHandle();
                  v223 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
                  {
                    v263 = strerror(v222);
                    v551.st_dev = v449;
                    *(_QWORD *)&v551.st_mode = v110;
                    WORD2(v551.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v109;
                    HIWORD(v551.st_gid) = 2080;
                    *(_QWORD *)&v551.st_rdev = v263;
                    _os_log_error_impl(&dword_1D4E55000, v223, OS_LOG_TYPE_ERROR, "Failed to create symlink at %s to %s: %s", (uint8_t *)&v551, 0x20u);
                  }

                  v511 = v461;
                  v512 = v87;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v512, &v511, 1);
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  strerror(v222);
                  _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1541, v457, v222, 0, v224, CFSTR("Failed to create symlink at %s to %s: %s"), v225, (uint64_t)v110);
                  v73 = (id)objc_claimAutoreleasedReturnValue();

                  v108 = v221;
                  goto LABEL_325;
                }
                lchmod(v110, objc_msgSend(*v11, "currentLFMode"));
                if (objc_msgSend(*v11, "denyInvalidSymlinks"))
                {
                  v465 = v108;
                  v237 = a1;
                  v238 = v467;
                  v471 = v467;
                  v239 = _CheckRealpathHasBasePrefix(v87, v464, &v471);
                  v73 = v471;

                  a1 = v237;
                  v108 = (char *)v465;
                  v467 = v73;
                  if (!v239)
                  {
LABEL_325:

LABEL_326:
LABEL_337:
                    v56 = 2;
                    v13 = v463;
LABEL_358:

                    v9 = v73;
                    goto LABEL_359;
                  }
                }
                if (v63)
                {
                  *(_QWORD *)&v551.st_dev = *((unsigned int *)v63 + 1);
                  LODWORD(v551.st_ino) = 0;
                  *(_QWORD *)&v551.st_uid = *((unsigned int *)v63 + 2);
                }
                else
                {
                  *(_QWORD *)&v551.st_dev = DOS2UNIXTime(*(_DWORD *)(objc_msgSend(*v11, "currentLFRecord") + 10));
                  LODWORD(v551.st_ino) = 0;
                  *(_QWORD *)&v551.st_uid = *(_QWORD *)&v551.st_dev;
                }
                v551.st_rdev = 0;
                lutimes(v110, (const timeval *)&v551);

                goto LABEL_343;
              }
              SZGetLoggingHandle();
              v226 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
              {
                v551.st_dev = v456;
                *(_QWORD *)&v551.st_mode = v68;
                _os_log_error_impl(&dword_1D4E55000, v226, OS_LOG_TYPE_ERROR, "Failed to read symlink path from %@", (uint8_t *)&v551, 0xCu);
              }

              v517 = v461;
              v518 = v68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v518, &v517, 1);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateError((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1502, CFSTR("SZExtractorErrorDomain"), 5, v106, v227, CFSTR("Failed to read symlink path from %@"), v228, (uint64_t)v68);
              v73 = (id)objc_claimAutoreleasedReturnValue();

LABEL_336:
              goto LABEL_337;
            }
            if ((objc_msgSend(*v11, "storeCurrentFileInMemory") & 1) != 0)
            {
              SZGetLoggingHandle();
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                v551.st_dev = v456;
                *(_QWORD *)&v551.st_mode = v64;
                _os_log_debug_impl(&dword_1D4E55000, v87, OS_LOG_TYPE_DEBUG, "Not doing anything with data for file %@", (uint8_t *)&v551, 0xCu);
              }
            }
            else
            {
              if (v63)
              {
                v114 = *((unsigned int *)v63 + 1);
                v115 = *((unsigned int *)v63 + 2);
              }
              else
              {
                v114 = DOS2UNIXTime(*(_DWORD *)(objc_msgSend(*v11, "currentLFRecord") + 10));
                v115 = v114;
              }
              v229 = objc_msgSend(*v11, "currentLFRecord");
              if (*(_BYTE *)(*(unsigned __int16 *)(v229 + 26) + v229 + 29) != 47)
              {
                v231 = a1;
                objc_msgSend(*v11, "fileWriter");
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v232)
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1582, "_currentState.fileWriter");

                objc_msgSend(*v11, "fileWriter");
                v233 = (void *)objc_claimAutoreleasedReturnValue();
                v234 = objc_msgSend(*v11, "currentLFMode");
                v235 = v467;
                v470 = v467;
                v236 = objc_msgSend(v233, "finalizeFileWithAccessTime:modTime:mode:error:", v114, 0, v115, 0, v234, &v470);
                v73 = v470;

                if ((v236 & 1) == 0)
                  goto LABEL_74;
                a1 = v231;
                goto LABEL_344;
              }
              objc_msgSend(v464, "stringByAppendingPathComponent:", v64);
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v551.st_dev = v114;
              v551.st_ino = 0;
              *(_QWORD *)&v551.st_uid = v115;
              *(_QWORD *)&v551.st_rdev = 0;
              v87 = objc_retainAutorelease(v230);
              lutimes((const char *)-[NSObject fileSystemRepresentation](v87, "fileSystemRepresentation"), (const timeval *)&v551);
            }
LABEL_343:

            v73 = v467;
            v13 = v463;
LABEL_344:
            SZGetTraceHandle();
            v251 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v251))
            {
              v551.st_dev = v456;
              *(_QWORD *)&v551.st_mode = v64;
              _os_signpost_emit_with_name_impl(&dword_1D4E55000, v251, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction completed successfully for file %@", (uint8_t *)&v551, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 64), "setPerformingExtraction:", 0);
            v252 = v64;
            if ((*(_BYTE *)(a1 + 80) & 2) != 0)
            {
              objc_msgSend((id)a1, "xpcConnection");
              v253 = (void *)objc_claimAutoreleasedReturnValue();
              v254 = v253;
              if (v253)
              {
                objc_msgSend(v253, "remoteObjectProxy");
                v255 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v255, "extractionCompleteAtArchivePath:", v252);
              }
              else
              {
                objc_msgSend((id)a1, "inProcessExtractorDelegate");
                v256 = (void *)a1;
                v255 = (id)objc_claimAutoreleasedReturnValue();
                if (v255)
                {
                  objc_msgSend(v256, "inProcessDelegateQueue");
                  v257 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v257)
                  {
                    objc_msgSend(v256, "inProcessDelegateQueue");
                    v258 = objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&v551.st_dev = MEMORY[0x1E0C809B0];
                    v551.st_ino = 3221225472;
                    *(_QWORD *)&v551.st_uid = __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke;
                    *(_QWORD *)&v551.st_rdev = &unk_1E98B11B0;
                    v255 = v255;
                    v551.st_atimespec.tv_sec = (__darwin_time_t)v255;
                    v551.st_atimespec.tv_nsec = (uint64_t)v252;
                    dispatch_async(v258, &v551);

                  }
                }
                v11 = v468;
              }

              a1 = v466;
            }

            objc_msgSend(*v11, "setStreamState:", 0);
            if (!objc_msgSend(*v11, "totalUncompressedBytes") && objc_msgSend(*v11, "totalRecordCount"))
              -[StreamingUnzipper _sendExtractionProgress:](a1, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "recordsProcessed")/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalRecordCount"));
            v56 = 3;
            goto LABEL_358;
          }
          if (objc_msgSend(*v11, "storeCurrentFileInMemory"))
          {
            objc_msgSend(*v11, "inMemoryFileData");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v116)
              __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1452, "_currentState.inMemoryFileData");

            objc_msgSend(*v11, "inMemoryFileData");
            v87 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v464, "stringByAppendingPathComponent:", v64);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v502 = 0;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v211, 3, &v502);
            v87 = objc_claimAutoreleasedReturnValue();
            v212 = v502;
            if (!v87)
            {
              SZGetLoggingHandle();
              v213 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
              {
                v551.st_dev = v455;
                *(_QWORD *)&v551.st_mode = v211;
                WORD2(v551.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v551.st_ino + 6) = (__darwin_ino64_t)v212;
                _os_log_error_impl(&dword_1D4E55000, v213, OS_LOG_TYPE_ERROR, "Failed to read fixed stream metadata from %@: %@", (uint8_t *)&v551, 0x16u);
              }

            }
          }
          if (!v87)
            goto LABEL_343;
          v214 = objc_retainAutorelease(v87);
          v215 = -[NSObject bytes](v214, "bytes");
          v216 = -[NSObject length](v214, "length");
          if (v216 < 7 || *(_DWORD *)v215 != 2017879117)
          {
            SZGetLoggingHandle();
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v551.st_dev = v458;
              *(_QWORD *)&v551.st_mode = v216;
              _os_log_error_impl(&dword_1D4E55000, v122, OS_LOG_TYPE_ERROR, "Got a fixed metadata file that did not match expected content (length %lu). Ignoring.", (uint8_t *)&v551, 0xCu);
            }
LABEL_298:

            goto LABEL_343;
          }
          v248 = *v11;
          if (*v11)
          {
            objc_msgSend(v248, "hashContext");
            v248 = *v11;
            v249 = v488 + 1;
            if (v248)
            {
              v248 = (id)objc_msgSend(v248, "hashContext");
              v250 = v474;
              goto LABEL_364;
            }
            v261 = 0uLL;
          }
          else
          {
            v501 = 0;
            v261 = 0uLL;
            v499 = 0u;
            v500 = 0u;
            v497 = 0u;
            v498 = 0u;
            v495 = 0u;
            v496 = 0u;
            v493 = 0u;
            v494 = 0u;
            v491 = 0u;
            v492 = 0u;
            v489 = 0u;
            v490 = 0u;
            v249 = 1;
            v488 = 0u;
          }
          v250 = 0;
          v487 = 0;
          v485 = v261;
          v486 = v261;
          v483 = v261;
          v484 = v261;
          v481 = v261;
          v482 = v261;
          v480 = v261;
          v478 = v261;
          v479 = v261;
          v476 = v261;
          v477 = v261;
          v474 = v261;
          v475 = v261;
LABEL_364:
          v266 = gHashDigestSizes[v250];
          LOWORD(v547) = v266;
          v267 = *(unsigned __int8 *)(v215 + 4) == v249;
          v11 = v468;
          if (!v267)
            goto LABEL_343;
          if (*(unsigned __int16 *)(v215 + 5) != (unsigned __int16)v547)
            goto LABEL_343;
          v268 = (unsigned __int16)v266;
          if (v216 < (unint64_t)(unsigned __int16)v266 + 7)
            goto LABEL_343;
          MEMORY[0x1E0C80A78](v248);
          v270 = (char *)&v446 - v269;
          bzero((char *)&v446 - v269, v268);
          v271 = (unsigned __int8 *)(v215 + 7);
          if (!memcmp(v270, v271, v268))
          {
            SZGetLoggingHandle();
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_debug_impl(&dword_1D4E55000, v122, OS_LOG_TYPE_DEBUG, "Found last chunk partial hash data but the hash was not computed.", (uint8_t *)&v551, 2u);
            }
          }
          else
          {
            StringFromDigest(v271, v268);
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v11, "setLastChunkPartialHash:", v272);

            SZGetLoggingHandle();
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(*v11, "lastChunkPartialHash");
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              v551.st_dev = v456;
              *(_QWORD *)&v551.st_mode = v273;
              _os_log_debug_impl(&dword_1D4E55000, v122, OS_LOG_TYPE_DEBUG, "Got last chunk partial hash %@", (uint8_t *)&v551, 0xCu);

            }
          }
          goto LABEL_298;
        }
        if (objc_msgSend(*v11, "storeCurrentFileInMemory"))
        {
          objc_msgSend(*v11, "inMemoryFileData");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v88)
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1396, "_currentState.inMemoryFileData");

          objc_msgSend(*v11, "inMemoryFileData");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v504 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v68, 0, 0, &v504);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v504;
          objc_msgSend(*v11, "setStreamInfoDict:", v89);

          objc_msgSend(*v11, "streamInfoDict");
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v91)
          {
            SZGetLoggingHandle();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl(&dword_1D4E55000, v92, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v12);
            v73 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_74;
          }
LABEL_141:

          SZGetLoggingHandle();
          v119 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(*v11, "streamInfoDict");
            v262 = (void *)objc_claimAutoreleasedReturnValue();
            v551.st_dev = v456;
            *(_QWORD *)&v551.st_mode = v262;
            _os_log_debug_impl(&dword_1D4E55000, v119, OS_LOG_TYPE_DEBUG, "Got stream metadata: %@", (uint8_t *)&v551, 0xCu);

          }
          objc_msgSend(*v11, "streamInfoDict");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "objectForKey:", CFSTR("Version"));
          v87 = objc_claimAutoreleasedReturnValue();

          if (!v87
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || -[NSObject intValue](v87, "intValue") != 2)
          {
            SZGetLoggingHandle();
            v210 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v551.st_dev) = 0;
              _os_log_impl(&dword_1D4E55000, v210, OS_LOG_TYPE_DEFAULT, "Stream metadata was incompatible version or not present; entering passthrough mode",
                (uint8_t *)&v551,
                2u);
            }

            -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v12);
            v73 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_326;
          }
          objc_msgSend(*v11, "setUnsureData:", 0);
          objc_msgSend(*v11, "streamInfoDict");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "objectForKey:", CFSTR("RecordCount"));
          v122 = objc_claimAutoreleasedReturnValue();

          if (v122)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(*v11, "setTotalRecordCount:", -[NSObject unsignedLongLongValue](v122, "unsignedLongLongValue"));
          }
          objc_msgSend(*v11, "streamInfoDict");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "objectForKey:", CFSTR("TotalUncompressedBytes"));
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          if (v124)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(*v11, "setTotalUncompressedBytes:", objc_msgSend(v124, "unsignedLongLongValue"));
          }

          goto LABEL_298;
        }
        objc_msgSend(v464, "stringByAppendingPathComponent:", v64);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", v68);
        v106 = (id)objc_claimAutoreleasedReturnValue();
        if (v106)
        {
          v503 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v106, 0, 0, &v503);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v503;
          objc_msgSend(*v11, "setStreamInfoDict:", v117);

          objc_msgSend(*v11, "streamInfoDict");
          v118 = (void *)objc_claimAutoreleasedReturnValue();

          if (v118)
          {

            goto LABEL_141;
          }
          SZGetLoggingHandle();
          v247 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v551.st_dev) = 0;
            _os_log_impl(&dword_1D4E55000, v247, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
              (uint8_t *)&v551,
              2u);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v12);
          v73 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          SZGetLoggingHandle();
          v242 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
          {
            v551.st_dev = v456;
            *(_QWORD *)&v551.st_mode = v68;
            _os_log_impl(&dword_1D4E55000, v242, OS_LOG_TYPE_DEFAULT, "Failed to read stream metadata from %@; entering passthrough mode",
              (uint8_t *)&v551,
              0xCu);
          }

          -[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:](a1, (uint64_t)v510, v12);
          v73 = (id)objc_claimAutoreleasedReturnValue();
          v90 = v467;
        }

        goto LABEL_336;
      case 4:
        goto LABEL_58;
      case 5:
        objc_msgSend(*v11, "fileWriter");
        v300 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v300)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1612, "_currentState.fileWriter");

        objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v12);
        v301 = *v11;
        v302 = objc_msgSend(*v11, "currentOffset");
        objc_msgSend(v301, "updateHashFromOffset:withBytes:length:", v302 - v12, v510, v12);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_463;
        objc_msgSend(*v11, "fileWriter");
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        v469 = 0;
        v15 = objc_msgSend(v303, "writeBuffer:length:error:", v510, v509, &v469);
        v9 = v469;

        if (!(_DWORD)v15)
          goto LABEL_511;
        v25 = *v11;
        goto LABEL_400;
      case 6:
        if (objc_msgSend(*v11, "hashedChunkSize"))
        {
          v304 = objc_msgSend(*v11, "hashedChunkSize");
          v305 = objc_msgSend(*v11, "bytesHashedInChunk");
          if (v304 - v305 < v12)
            v12 = v304 - v305;
        }
        v306 = *v11;
        v307 = objc_msgSend(*v11, "currentOffset");
        objc_msgSend(v306, "updateHashFromOffset:withBytes:length:onlyFinishCurrentChunk:", v307, v510, v12, 1);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v11, "setCurrentOffset:", objc_msgSend(*v11, "currentOffset") + v12);
        if (v16)
          goto LABEL_463;
        if (!objc_msgSend(*v11, "bytesHashedInChunk"))
          goto LABEL_509;
        if (v12 != v509)
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1645, "lengthToRead == length");
        goto LABEL_407;
      case 7:
        goto LABEL_511;
      case 8:
        goto LABEL_510;
      default:
        SZGetLoggingHandle();
        v440 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
        {
          v441 = objc_msgSend(*v468, "streamState");
          v551.st_dev = 67109120;
          *(_DWORD *)&v551.st_mode = v441;
          _os_log_error_impl(&dword_1D4E55000, v440, OS_LOG_TYPE_ERROR, "Invalid unzip state encountered: %hhu", (uint8_t *)&v551, 8u);
        }

        __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1658, "false");
    }
  }
}

- (id)_beginNonStreamablePassthroughWithRemainingBytes:(uint64_t)a3 length:
{
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 buf;
  uint64_t (*v47)(uint64_t);
  void *v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 64), "unzipPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(a1 + 96);
  if (v7)
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend(*(id *)(a1 + 64), "performingExtraction"))
  {
    SZGetTraceHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4E55000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction entered passthrough mode", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 64), "setPerformingExtraction:", 0);
  }
  SZGetLoggingHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D4E55000, v9, OS_LOG_TYPE_DEFAULT, "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  SZGetTraceHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1D4E55000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PASSTHROUGH_MODE", "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeItemAtPath:error:", v6, 0);

  v12 = objc_msgSend(*(id *)(a1 + 64), "performCachedWrites");
  v39 = 0;
  +[StreamingFileWriter synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:](StreamingFileWriter, "synchronousFileWriterForPath:withOpenFlags:mode:quarantineInfo:performCachedWrites:error:", v6, 1537, 384, 0, v12, &v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;
  if (!v13)
  {
    SZGetLoggingHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_1D4E55000, v25, OS_LOG_TYPE_ERROR, "Failed to open passthrough output file at %@", (uint8_t *)&buf, 0xCu);
    }

    v44 = *MEMORY[0x1E0CB2AA0];
    v45 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 196, CFSTR("SZExtractorErrorDomain"), 1, v14, v26, CFSTR("Failed to open passthrough output file at %@"), v27, (uint64_t)v6);
    goto LABEL_33;
  }
  objc_msgSend(v13, "setIncompleteExtractionAttribute");
  objc_msgSend(*(id *)(a1 + 64), "unsureData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  objc_msgSend(*(id *)(a1 + 64), "unsureData");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v38 = v14;
  v18 = objc_msgSend(v13, "writeBuffer:length:error:", objc_msgSend(v17, "bytes"), v16, &v38);
  v19 = v38;

  if ((v18 & 1) != 0)
  {
    if (!a3)
    {
LABEL_16:
      objc_msgSend(*(id *)(a1 + 64), "setFileWriter:", v13);
      objc_msgSend(*(id *)(a1 + 64), "setCurrentOffset:", v16 + a3);
      objc_msgSend(*(id *)(a1 + 64), "updateHashFromOffset:withBytes:length:", v16, a2, a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(*(id *)(a1 + 64), "setStreamState:", 5);
        if ((*(_BYTE *)(a1 + 80) & 4) != 0)
        {
          objc_msgSend((id)a1, "xpcConnection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "remoteObjectProxy");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "extractionEnteredPassThroughMode");
          }
          else
          {
            objc_msgSend((id)a1, "inProcessExtractorDelegate");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend((id)a1, "inProcessDelegateQueue");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                objc_msgSend((id)a1, "inProcessDelegateQueue");
                v35 = objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                *((_QWORD *)&buf + 1) = 3221225472;
                v47 = __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke;
                v48 = &unk_1E98B11D8;
                v24 = v24;
                v49 = v24;
                dispatch_async(v35, &buf);

              }
            }
          }

        }
        objc_msgSend(*(id *)(a1 + 64), "serializeState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_35;
      }
LABEL_34:
      -[StreamingUnzipper _setErrorState](a1);
      goto LABEL_35;
    }
    v37 = v19;
    v20 = objc_msgSend(v13, "writeBuffer:length:error:", a2, a3, &v37);
    v14 = v37;

    if ((v20 & 1) != 0)
    {
      v19 = v14;
      goto LABEL_16;
    }
    SZGetLoggingHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D4E55000, v31, OS_LOG_TYPE_ERROR, "Failed to write remaining initial data to passthrough output file", (uint8_t *)&buf, 2u);
    }

    v40 = *MEMORY[0x1E0CB2AA0];
    v41 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 211, CFSTR("SZExtractorErrorDomain"), 1, v14, v26, CFSTR("Failed to write remaining initial data to passthrough output file"), v32, v36);
LABEL_33:
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_35;
    goto LABEL_34;
  }
  SZGetLoggingHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1D4E55000, v28, OS_LOG_TYPE_ERROR, "Failed to write initial data to passthrough output file", (uint8_t *)&buf, 2u);
  }

  v42 = *MEMORY[0x1E0CB2AA0];
  v43 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 205, CFSTR("SZExtractorErrorDomain"), 1, v19, v29, CFSTR("Failed to write initial data to passthrough output file"), v30, v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_34;
LABEL_35:

  return v21;
}

- (void)_sendExtractionProgress:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  double v11;

  if ((*(_BYTE *)(a1 + 80) & 1) != 0 && a2 - *(double *)(a1 + 88) >= 0.00999999978)
  {
    *(double *)(a1 + 88) = a2;
    objc_msgSend((id)a1, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "remoteObjectProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExtractionProgress:", a2);
    }
    else
    {
      objc_msgSend((id)a1, "inProcessExtractorDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend((id)a1, "inProcessDelegateQueue");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend((id)a1, "inProcessDelegateQueue");
          v8 = objc_claimAutoreleasedReturnValue();
          v9[0] = MEMORY[0x1E0C809B0];
          v9[1] = 3221225472;
          v9[2] = __45__StreamingUnzipper__sendExtractionProgress___block_invoke;
          v9[3] = &unk_1E98B1188;
          v10 = v6;
          v11 = a2;
          dispatch_async(v8, v9);

        }
      }
    }

  }
}

uint64_t __58__StreamingUnzipper__sendExtractionCompleteAtArchivePath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "extractionCompleteAtArchivePath:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__StreamingUnzipper__sendExtractionProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExtractionProgress:", *(double *)(a1 + 40));
}

uint64_t __54__StreamingUnzipper__extractionEnteredPassThroughMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "extractionEnteredPassThroughMode");
}

@end
