@implementation PLJournal

- (BOOL)appendUpdatePayloadWithPayloadID:(id)a3 rawAttributes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v10 = -[PLJournal payloadClass](self, "payloadClass");
    v11 = (void *)objc_msgSend([v10 alloc], "initWithPayloadID:payloadVersion:nilAttributes:", v8, -[objc_class payloadVersion](v10, "payloadVersion"), 0);
    objc_msgSend(v11, "setRawPayloadAttributes:", v9);
    v12 = -[PLJournalEntry initForUpdateWithPayload:]([PLJournalEntry alloc], "initForUpdateWithPayload:", v11);
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLJournal appendChangeEntries:error:](self, "appendChangeEntries:error:", v13, a5);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (PLJournal)initWithBaseURL:(id)a3 payloadClass:(Class)a4
{
  id v6;
  void *v7;
  PLJournal *v8;

  v6 = a3;
  -[objc_class payloadClassID](a4, "payloadClassID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLJournal initWithBaseURL:name:payloadClass:hasMetadata:](self, "initWithBaseURL:name:payloadClass:hasMetadata:", v6, v7, a4, 1);

  return v8;
}

- (PLJournal)initWithBaseURL:(id)a3 name:(id)a4 payloadClass:(Class)a5 hasMetadata:(BOOL)a6
{
  id v11;
  id v12;
  PLJournal *v13;
  PLJournal *v14;
  PLJournalFile *v15;
  void *v16;
  uint64_t v17;
  PLJournalFile *snapshotJournal;
  PLJournalFile *v19;
  void *v20;
  uint64_t v21;
  PLJournalFile *changeJournal;
  PLJournalFile *v23;
  void *v24;
  uint64_t v25;
  PLJournalFile *pendingSnapshotJournal;
  PLJournalFile *v27;
  void *v28;
  uint64_t v29;
  PLJournalFile *pendingChangeJournal;
  PLJournalFile *v31;
  void *v32;
  uint64_t v33;
  PLJournalFile *prepareMarker;
  objc_super v36;

  v11 = a3;
  v12 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PLJournal;
  v13 = -[PLJournal init](&v36, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_baseURL, a3);
    v14->_payloadClass = a5;
    v14->_hasMetadata = a6;
    v15 = [PLJournalFile alloc];
    objc_msgSend((id)objc_opt_class(), "journalURLForBaseURL:name:journalType:", v11, v12, CFSTR("snapshot"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PLJournalFile initWithURL:payloadClass:](v15, "initWithURL:payloadClass:", v16, a5);
    snapshotJournal = v14->_snapshotJournal;
    v14->_snapshotJournal = (PLJournalFile *)v17;

    v19 = [PLJournalFile alloc];
    objc_msgSend((id)objc_opt_class(), "journalURLForBaseURL:name:journalType:", v11, v12, CFSTR("change"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PLJournalFile initWithURL:payloadClass:](v19, "initWithURL:payloadClass:", v20, a5);
    changeJournal = v14->_changeJournal;
    v14->_changeJournal = (PLJournalFile *)v21;

    v23 = [PLJournalFile alloc];
    objc_msgSend((id)objc_opt_class(), "journalURLForBaseURL:name:journalType:", v14->_baseURL, v12, CFSTR("pending-snapshot"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PLJournalFile initWithURL:payloadClass:](v23, "initWithURL:payloadClass:", v24, a5);
    pendingSnapshotJournal = v14->_pendingSnapshotJournal;
    v14->_pendingSnapshotJournal = (PLJournalFile *)v25;

    v27 = [PLJournalFile alloc];
    objc_msgSend((id)objc_opt_class(), "journalURLForBaseURL:name:journalType:", v14->_baseURL, v12, CFSTR("pending-change"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[PLJournalFile initWithURL:payloadClass:](v27, "initWithURL:payloadClass:", v28, a5);
    pendingChangeJournal = v14->_pendingChangeJournal;
    v14->_pendingChangeJournal = (PLJournalFile *)v29;

    v31 = [PLJournalFile alloc];
    objc_msgSend((id)objc_opt_class(), "journalURLForBaseURL:name:journalType:", v14->_baseURL, v12, CFSTR("prepare-marker"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PLJournalFile initWithURL:payloadClass:](v31, "initWithURL:payloadClass:", v32, a5);
    prepareMarker = v14->_prepareMarker;
    v14->_prepareMarker = (PLJournalFile *)v33;

  }
  return v14;
}

- (Class)payloadClass
{
  return self->_payloadClass;
}

- (void)removeMetadata
{
  -[PLJournal _removeMetadataPending:error:](self, "_removeMetadataPending:error:", 0, 0);
  -[PLJournal _removeMetadataPending:error:](self, "_removeMetadataPending:error:", 1, 0);
}

- (NSDictionary)metadata
{
  void *v3;
  _BOOL8 v4;

  if (-[PLJournal _isPendingJournalAuthoritative](self, "_isPendingJournalAuthoritative"))
  {
    -[PLJournal metadataURLPending:](self, "metadataURLPending:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PLJournalFile fileExistsAtURL:](PLJournalFile, "fileExistsAtURL:", v3);

  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)-[PLJournal _readMetadataPending:](self, "_readMetadataPending:", v4);
}

- (id)metadataURLPending:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSURL *baseURL;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  baseURL = self->_baseURL;
  -[objc_class payloadClassID](self->_payloadClass, "payloadClassID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataURLForBaseURL:payloadClassId:pending:", baseURL, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_removeMetadataPending:(BOOL)a3 error:(id *)a4
{
  void *v5;

  -[PLJournal metadataURLPending:](self, "metadataURLPending:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PLJournalFile removeURL:error:](PLJournalFile, "removeURL:error:", v5, a4);

  return (char)a4;
}

- (BOOL)_replaceMetadataWithPendingMetadataError:(id *)a3
{
  void *v5;
  void *v6;

  -[PLJournal metadataURLPending:](self, "metadataURLPending:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLJournal metadataURLPending:](self, "metadataURLPending:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[PLJournalFile moveURL:toURL:error:](PLJournalFile, "moveURL:toURL:error:", v5, v6, a3);

  return (char)a3;
}

- (id)_readMetadataPending:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLJournal metadataURLPending:](self, "metadataURLPending:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, &v12, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("snapshotPayloadVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "integerValue") <= 0)
      {

      }
      else
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("snapshotDate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = v7;
LABEL_9:

          goto LABEL_10;
        }
      }
    }
    v10 = 0;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_updateMetadataWithMetadata:(id)a3 replace:(BOOL)a4 pending:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v7 = a5;
  v10 = a3;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!a4)
  {
    -[PLJournal _readMetadataPending:](self, "_readMetadataPending:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  }
  if (v10)
    objc_msgSend(v11, "addEntriesFromDictionary:", v10);
  -[PLJournal metadataURLPending:](self, "metadataURLPending:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 100, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_baseURL, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, 0);

  v17 = +[PLJournalFile writeData:toURL:atomically:error:](PLJournalFile, "writeData:toURL:atomically:error:", v14, v13, v7 ^ 1, a6);
  return v17;
}

- (BOOL)removeJournalFilesWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[PLJournalFile removeFileWithError:](self->_snapshotJournal, "removeFileWithError:");
  if (v5)
    LOBYTE(v5) = -[PLJournalFile removeFileWithError:](self->_changeJournal, "removeFileWithError:", a3);
  return v5;
}

- (BOOL)_isPendingJournalAuthoritative
{
  char v3;

  v3 = objc_msgSend((id)objc_opt_class(), "snapshotFinishMarkerExistsForBaseURL:", self->_baseURL);
  return !-[PLJournalFile fileExists](self->_prepareMarker, "fileExists") | v3;
}

- (BOOL)_recoverJournalWithError:(id *)a3
{
  NSFileHandle *fileHandleForAppendingUpdates;
  _BOOL4 v6;
  PLJournalFile *pendingSnapshotJournal;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  PLJournalFile *v13;
  void *v14;
  int v15;
  PLJournalFile *pendingChangeJournal;
  void *v17;

  fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
  self->_fileHandleForAppendingUpdates = 0;

  v6 = -[PLJournal _isPendingJournalAuthoritative](self, "_isPendingJournalAuthoritative");
  pendingSnapshotJournal = self->_pendingSnapshotJournal;
  if (v6)
  {
    v8 = -[PLJournalFile fileExists](pendingSnapshotJournal, "fileExists");
    v9 = -[PLJournalFile fileExists](self->_pendingChangeJournal, "fileExists");
    -[PLJournal metadataURLPending:](self, "metadataURLPending:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[PLJournalFile fileExistsAtURL:](PLJournalFile, "fileExistsAtURL:", v10);

    if (!v8 && !v9 && !v11)
      goto LABEL_5;
    if (v8)
    {
      v12 = -[PLJournal removeJournalFilesWithError:](self, "removeJournalFilesWithError:", a3);
      if (!v12)
        return v12;
      v13 = self->_pendingSnapshotJournal;
      -[PLJournalFile url](self->_snapshotJournal, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLJournalFile moveToURL:error:](v13, "moveToURL:error:", v14, a3);

    }
    else
    {
      v15 = 1;
    }
    if ((v15 & v9) == 1)
    {
      pendingChangeJournal = self->_pendingChangeJournal;
      -[PLJournalFile url](self->_changeJournal, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLJournalFile moveToURL:error:](pendingChangeJournal, "moveToURL:error:", v17, a3);

    }
    if ((v15 & v11) == 1)
    {
      if (!-[PLJournal _replaceMetadataWithPendingMetadataError:](self, "_replaceMetadataWithPendingMetadataError:", a3))goto LABEL_20;
LABEL_5:
      -[PLJournalFile removeFileWithError:](self->_prepareMarker, "removeFileWithError:", 0);
      LOBYTE(v12) = 1;
      return v12;
    }
    if (v15)
      goto LABEL_5;
LABEL_20:
    LOBYTE(v12) = 0;
    return v12;
  }
  v12 = -[PLJournalFile removeFileWithError:](pendingSnapshotJournal, "removeFileWithError:", a3);
  if (v12)
  {
    v12 = -[PLJournalFile removeFileWithError:](self->_pendingChangeJournal, "removeFileWithError:", a3);
    if (v12)
    {
      if (-[PLJournal _removeMetadataPending:error:](self, "_removeMetadataPending:error:", 1, a3))
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  return v12;
}

- (BOOL)_prepareForSnapshotWithMode:(unsigned __int8)a3 error:(id *)a4
{
  int v5;
  _BOOL4 v7;
  PLJournalFile *changeJournal;
  void *v9;
  BOOL v10;
  void *v12;
  id v13;

  v5 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 1065, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotMode != PLJournalSnapshotModeNone"));

  }
  if (self->_snapshotMode)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), CFSTR("Cannot prepare snapshot more than once without finishing"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  v7 = -[PLJournal _recoverJournalWithError:](self, "_recoverJournalWithError:", a4);
  if (v7)
  {
    v7 = -[PLJournalFile createEmptyFileWithError:](self->_prepareMarker, "createEmptyFileWithError:", a4);
    if (v5 == 2 && v7)
    {
      changeJournal = self->_changeJournal;
      -[PLJournalFile url](self->_pendingChangeJournal, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PLJournalFile copyToURL:error:](changeJournal, "copyToURL:error:", v9, a4);

      if (!v10)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
    }
    else if (!v7)
    {
      return v7;
    }
    self->_snapshotMode = v5;
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_finishSnapshotWithMode:(unsigned __int8)a3 snapshotSuccess:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  int v7;
  _BOOL4 v9;
  PLJournalFile *pendingChangeJournal;
  PLJournalFile *changeJournal;
  void *v12;
  BOOL v13;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 1083, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotMode != PLJournalSnapshotModeNone"));

  }
  if (self->_snapshotMode != v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), CFSTR("Cannot finish snapshot without preparing first using the same snapshot mode"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  if (v6)
  {
    v9 = -[PLJournalFile removeFileWithError:](self->_prepareMarker, "removeFileWithError:", a5);
    if (v7 == 2)
    {
      if (!v9)
        goto LABEL_25;
      pendingChangeJournal = self->_pendingChangeJournal;
      changeJournal = self->_changeJournal;
      goto LABEL_16;
    }
    if (v7 != 1)
    {
      if (!v9)
        goto LABEL_25;
LABEL_22:
      LOBYTE(v9) = !self->_hasMetadata
                || -[PLJournal _replaceMetadataWithPendingMetadataError:](self, "_replaceMetadataWithPendingMetadataError:", a5);
      goto LABEL_25;
    }
    if (v9)
    {
      v9 = -[PLJournalFile removeFileWithError:](self->_changeJournal, "removeFileWithError:", a5);
      if (v9)
      {
        pendingChangeJournal = self->_pendingSnapshotJournal;
        changeJournal = self->_snapshotJournal;
LABEL_16:
        -[PLJournalFile url](changeJournal, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PLJournalFile moveToURL:error:](pendingChangeJournal, "moveToURL:error:", v12, a5);

        if (!v13)
        {
LABEL_17:
          LOBYTE(v9) = 0;
          goto LABEL_25;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (v7 == 1)
    {
      v9 = -[PLJournalFile removeFileWithError:](self->_pendingSnapshotJournal, "removeFileWithError:", a5);
      if (!v9)
        goto LABEL_25;
    }
    else if (v7 != 2 || !-[PLJournalFile removeFileWithError:](self->_pendingChangeJournal, "removeFileWithError:", a5))
    {
      goto LABEL_17;
    }
    v9 = -[PLJournal _removeMetadataPending:error:](self, "_removeMetadataPending:error:", 1, a5);
    if (v9)
      LOBYTE(v9) = -[PLJournalFile removeFileWithError:](self->_prepareMarker, "removeFileWithError:", a5);
  }
LABEL_25:
  self->_snapshotMode = 0;
  return v9;
}

- (BOOL)_performSnapshotWithMode:(unsigned __int8)a3 usingNextEntryBlock:(id)a4 createOnlyIfNecessary:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v11;
  _BOOL4 v12;
  int v13;
  PLJournalChecksumContext *v14;
  uint64_t v15;
  void *v16;
  PLJournalChecksumContext *v17;
  id v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  PLJournalChecksumContext *v47;
  id v48;
  id *v49;
  uint64_t v50;
  const __CFString *v51;
  _QWORD v52[3];
  _QWORD v53[5];

  v7 = a5;
  v8 = a3;
  v53[3] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  if (!(_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLJournal.m"), 1136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotMode != PLJournalSnapshotModeNone"));

  }
  if (self->_snapshotMode)
  {
    if (self->_snapshotMode != (_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), CFSTR("Must perform snapshot in the same mode as it was prepared"), 0);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v41);
    }
    v12 = 0;
    v13 = 1;
  }
  else
  {
    v12 = -[PLJournal _prepareForSnapshotWithMode:error:](self, "_prepareForSnapshotWithMode:error:", v8, a6);
    v13 = v12;
  }
  v14 = 0;
  if ((_DWORD)v8 == 1 && v7)
    v14 = objc_alloc_init(PLJournalChecksumContext);
  if (!v13)
    goto LABEL_19;
  v15 = 72;
  if ((_DWORD)v8 == 1)
    v15 = 64;
  v16 = *(Class *)((char *)&self->super.isa + v15);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __86__PLJournal__performSnapshotWithMode_usingNextEntryBlock_createOnlyIfNecessary_error___block_invoke;
  v46[3] = &unk_1E366E558;
  v48 = v11;
  v46[4] = self;
  v17 = v14;
  v47 = v17;
  v49 = a6;
  v18 = v16;
  v19 = objc_msgSend(v18, "openForWritingUsingBlock:error:", v46, a6);

  if (!v19)
  {
LABEL_19:
    v26 = 0;
    if (!v12)
      goto LABEL_33;
    goto LABEL_20;
  }
  if (!self->_hasMetadata)
  {
    v26 = 1;
    if (!v12)
      goto LABEL_33;
    goto LABEL_20;
  }
  v44 = v11;
  v20 = -[objc_class payloadVersion](self->_payloadClass, "payloadVersion");
  v42 = objc_alloc(MEMORY[0x1E0C99E08]);
  v52[0] = CFSTR("snapshotPayloadVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v43;
  v52[1] = CFSTR("snapshotDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v21;
  v52[2] = CFSTR("currentPayloadVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v42, "initWithDictionary:", v23);

  if (v17)
  {
    -[PLJournalChecksumContext finalizedChecksum](v17, "finalizedChecksum");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("snapshotChecksum"));

  }
  v26 = -[PLJournal _updateMetadataWithMetadata:replace:pending:error:](self, "_updateMetadataWithMetadata:replace:pending:error:", v24, 1, 1, a6);

  v11 = v44;
  if (v12)
  {
LABEL_20:
    if (v14)
    {
      -[PLJournal metadata](self, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("snapshotChecksum"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLJournalChecksumContext finalizedChecksum](v14, "finalizedChecksum");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0D74498];
        v50 = *MEMORY[0x1E0CB2938];
        v51 = CFSTR("Existing snapshot is the same as the pending one");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 51012, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (a6)
          *a6 = objc_retainAutorelease(v34);

        v26 = 0;
      }

    }
    v45 = 0;
    v36 = -[PLJournal _finishSnapshotWithMode:snapshotSuccess:error:](self, "_finishSnapshotWithMode:snapshotSuccess:error:", v8, v26, &v45);
    v37 = v45;
    v38 = v37;
    if (!v36 && v26)
    {
      LOBYTE(v26) = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v37);
    }

  }
LABEL_33:

  return v26;
}

- (BOOL)prepareForCreateSnapshotWithError:(id *)a3
{
  return -[PLJournal _prepareForSnapshotWithMode:error:](self, "_prepareForSnapshotWithMode:error:", 1, a3);
}

- (BOOL)finishCreateSnapshot:(BOOL)a3 error:(id *)a4
{
  return -[PLJournal _finishSnapshotWithMode:snapshotSuccess:error:](self, "_finishSnapshotWithMode:snapshotSuccess:error:", 1, a3, a4);
}

- (BOOL)createSnapshotUsingNextPayloadBlock:(id)a3 createOnlyIfNecessary:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PLJournal_createSnapshotUsingNextPayloadBlock_createOnlyIfNecessary_error___block_invoke;
  v11[3] = &unk_1E366E580;
  v12 = v8;
  v9 = v8;
  LOBYTE(a5) = -[PLJournal _performSnapshotWithMode:usingNextEntryBlock:createOnlyIfNecessary:error:](self, "_performSnapshotWithMode:usingNextEntryBlock:createOnlyIfNecessary:error:", 1, v11, v6, a5);

  return (char)a5;
}

- (BOOL)appendSnapshotUsingNextEntryBlock:(id)a3 error:(id *)a4
{
  return -[PLJournal _performSnapshotWithMode:usingNextEntryBlock:createOnlyIfNecessary:error:](self, "_performSnapshotWithMode:usingNextEntryBlock:createOnlyIfNecessary:error:", 2, a3, 0, a4);
}

- (BOOL)coalesceChangesToSnapshotWithError:(id *)a3
{
  int v5;
  PLJournalFile *pendingSnapshotJournal;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[6];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  if (self->_snapshotMode)
  {
    if (self->_snapshotMode != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), CFSTR("Must perform coalesce after preparing in create mode"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v5 = 0;
  }
  else
  {
    v5 = 1;
    if (!-[PLJournal _prepareForSnapshotWithMode:error:](self, "_prepareForSnapshotWithMode:error:", 1, a3))
    {
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  pendingSnapshotJournal = self->_pendingSnapshotJournal;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke;
  v19[3] = &unk_1E366E5D0;
  v19[4] = self;
  v19[5] = a3;
  v7 = -[PLJournalFile openForWritingUsingBlock:error:](pendingSnapshotJournal, "openForWritingUsingBlock:error:", v19, a3);
  if ((_DWORD)v7 && self->_hasMetadata)
  {
    v8 = -[objc_class payloadVersion](self->_payloadClass, "payloadVersion");
    v20[0] = CFSTR("coalescePayloadVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v20[1] = CFSTR("coalesceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    v20[2] = CFSTR("currentPayloadVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = CFSTR("snapshotChecksum");
    v21[2] = v11;
    v21[3] = &stru_1E36789C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLJournal _updateMetadataWithMetadata:replace:pending:error:](self, "_updateMetadataWithMetadata:replace:pending:error:", v12, 0, 1, a3);

    if ((v5 & 1) == 0)
      return v7;
  }
  else if (!v5)
  {
    return v7;
  }
  v18 = 0;
  v13 = -[PLJournal _finishSnapshotWithMode:snapshotSuccess:error:](self, "_finishSnapshotWithMode:snapshotSuccess:error:", 1, v7, &v18);
  v14 = v18;
  v15 = v14;
  if (!v13)
  {
    if ((_DWORD)v7)
    {
      LOBYTE(v7) = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v14);
    }
  }

  return v7;
}

- (BOOL)appendChangeEntries:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[PLJournal _recoverJournalWithError:](self, "_recoverJournalWithError:", a4))
  {
    if (!self->_hasMetadata)
      goto LABEL_4;
    v12 = CFSTR("currentPayloadVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[objc_class payloadVersion](self->_payloadClass, "payloadVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLJournal _updateMetadataWithMetadata:replace:pending:error:](self, "_updateMetadataWithMetadata:replace:pending:error:", v8, 0, 0, a4);

    v10 = 0;
    if (v9)
LABEL_4:
      v10 = -[PLJournalFile appendEntries:error:](self->_changeJournal, "appendEntries:error:", v6, a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)prepareForAppendChangeEntriesWithError:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  NSFileHandle *v8;
  NSFileHandle *fileHandleForAppendingUpdates;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PLJournal _recoverJournalWithError:](self, "_recoverJournalWithError:");
  if (v5)
  {
    if (!self->_hasMetadata
      || (v11 = CFSTR("currentPayloadVersion"),
          v12[0] = &unk_1E375FA68,
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = -[PLJournal _updateMetadataWithMetadata:replace:pending:error:](self, "_updateMetadataWithMetadata:replace:pending:error:", v6, 0, 0, a3), v6, LOBYTE(v5) = 0, v7))
    {
      -[PLJournalFile fileHandleForWritingWithError:](self->_changeJournal, "fileHandleForWritingWithError:", a3);
      v8 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
      fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
      self->_fileHandleForAppendingUpdates = v8;

      LOBYTE(v5) = self->_fileHandleForAppendingUpdates != 0;
    }
  }
  return v5;
}

- (BOOL)appendChangeEntryAfterPrepare:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  char v9;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  if (!self->_fileHandleForAppendingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), CFSTR("Call prepareForAppendChangeEntriesWithError before appendChangeEntryAfterPrepare"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v7 = v6;
  v8 = (objc_class *)objc_msgSend(v6, "payloadClass");
  if (v8 != -[PLJournal payloadClass](self, "payloadClass"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload classes don't match: %@, %@"), objc_msgSend(v7, "payloadClass"), -[PLJournal payloadClass](self, "payloadClass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v9 = objc_msgSend(v7, "writeToFileHandle:checksumContext:error:", self->_fileHandleForAppendingUpdates, 0, a4);

  return v9;
}

- (BOOL)finishAppendChangeEntriesWithError:(id *)a3
{
  NSFileHandle *fileHandleForAppendingUpdates;
  void *v6;
  void *v7;
  BOOL v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  fileHandleForAppendingUpdates = self->_fileHandleForAppendingUpdates;
  if (!fileHandleForAppendingUpdates)
    return 1;
  self->_fileHandleForAppendingUpdates = 0;

  if (!self->_hasMetadata)
    return 1;
  v10 = CFSTR("currentPayloadVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[objc_class payloadVersion](self->_payloadClass, "payloadVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLJournal _updateMetadataWithMetadata:replace:pending:error:](self, "_updateMetadataWithMetadata:replace:pending:error:", v7, 0, 0, a3);

  return v8;
}

- (BOOL)snapshotJournalFileSize:(unint64_t *)a3 changeJournalFileSize:(unint64_t *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  char v11;

  -[PLJournal changeJournal](self, "changeJournal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = 0;
  -[PLJournal snapshotJournal](self, "snapshotJournal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "fileSize:error:", a3, a5))
  {
    if (v9)
      v11 = objc_msgSend(v9, "fileSize:error:", a4, a5);
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PLJournalFile)snapshotJournal
{
  PLJournalFile **p_snapshotJournal;

  if (!-[PLJournal _isPendingJournalAuthoritative](self, "_isPendingJournalAuthoritative")
    || (p_snapshotJournal = &self->_pendingSnapshotJournal,
        !-[PLJournalFile fileExists](self->_pendingSnapshotJournal, "fileExists")))
  {
    p_snapshotJournal = &self->_snapshotJournal;
  }
  return *p_snapshotJournal;
}

- (PLJournalFile)changeJournal
{
  PLJournalFile **p_changeJournal;
  PLJournalFile **p_pendingChangeJournal;
  PLJournalFile *pendingChangeJournal;
  _BOOL4 v7;
  PLJournalFile *v8;

  if (-[PLJournal _isPendingJournalAuthoritative](self, "_isPendingJournalAuthoritative"))
  {
    if (-[PLJournalFile fileExists](self->_pendingSnapshotJournal, "fileExists"))
      return (PLJournalFile *)0;
    pendingChangeJournal = self->_pendingChangeJournal;
    p_pendingChangeJournal = &self->_pendingChangeJournal;
    v7 = -[PLJournalFile fileExists](pendingChangeJournal, "fileExists");
    p_changeJournal = p_pendingChangeJournal - 5;
    if (v7)
      p_changeJournal = p_pendingChangeJournal;
  }
  else
  {
    p_changeJournal = &self->_changeJournal;
  }
  v8 = *p_changeJournal;
  return v8;
}

- (BOOL)enumeratePayloadsUsingBlock:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PLJournal_enumeratePayloadsUsingBlock_error___block_invoke;
  v9[3] = &unk_1E366E5F8;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[PLJournal enumerateEntriesUsingBlock:decodePayload:error:](self, "enumerateEntriesUsingBlock:decodePayload:error:", v9, 1, a4);

  return (char)a4;
}

- (unint64_t)countOfInsertEntriesWithError:(id *)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PLJournal_countOfInsertEntriesWithError___block_invoke;
  v5[3] = &unk_1E366E620;
  v5[4] = &v6;
  -[PLJournal enumerateEntriesUsingBlock:decodePayload:error:](self, "enumerateEntriesUsingBlock:decodePayload:error:", v5, 0, a3);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)currentPayloadVersionWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PLJournal metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentPayloadVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v19 = v7;
  v8 = v17[3];
  if (!v8)
  {
    -[PLJournal changeJournal](self, "changeJournal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9
      && (v15[0] = MEMORY[0x1E0C809B0],
          v15[1] = 3221225472,
          v15[2] = __44__PLJournal_currentPayloadVersionWithError___block_invoke,
          v15[3] = &unk_1E366E648,
          v15[4] = &v16,
          (objc_msgSend(v9, "enumerateEntriesUsingBlock:decodePayload:error:", v15, 0, a3) & 1) == 0))
    {
      v17[3] = 0;
    }
    else if (!v17[3])
    {
      -[PLJournal snapshotJournal](self, "snapshotJournal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__PLJournal_currentPayloadVersionWithError___block_invoke_2;
      v14[3] = &unk_1E366E648;
      v14[4] = &v16;
      v12 = objc_msgSend(v11, "enumerateEntriesUsingBlock:decodePayload:error:", v14, 0, a3);

      if (v12)
      {
        if (a3 && !v17[3])
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51006, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }

    v8 = v17[3];
  }
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  id *v14;
  id *v15;
  id *v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  id v21;
  uint64_t (**v22)(_QWORD, _QWORD);
  void *v23;
  char v24;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  id *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  PLJournal *v36;
  id v37;
  _QWORD *v38;
  uint64_t *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  id *v45;
  BOOL v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  BOOL v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[3];
  char v68;
  _QWORD v69[5];
  id v70;
  id v71;
  _QWORD v72[2];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;

  v8 = a3;
  -[PLJournal snapshotJournal](self, "snapshotJournal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__60767;
  v81 = __Block_byref_object_dispose__60768;
  -[PLJournal changeJournal](self, "changeJournal");
  v82 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v11 = (void *)v78[5];
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke;
    v69[3] = &unk_1E366E670;
    v69[4] = self;
    v72[1] = &v73;
    v70 = v10;
    v71 = v33;
    v72[0] = v32;
    v13 = objc_msgSend(v11, "enumerateEntriesUsingBlock:decodePayload:error:", v69, 0, a5);
    v30 = &v71;
    v31 = &v70;
    v14 = (id *)v72;
    if (v74[3])
    {
      if (a5)
      {
        -[PLJournal _payloadTooNewErrorWithPayloadVersion:](self, "_payloadTooNewErrorWithPayloadVersion:");
        v16 = &v71;
        v15 = &v70;
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
LABEL_10:
      v17 = 0;
      v16 = &v71;
      v15 = &v70;
      goto LABEL_13;
    }
    if (!v13)
      goto LABEL_10;
    v26 = (id *)v72;
    v27 = v10;
    v28 = v9;
    v29 = v8;
    v12 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v27 = v10;
    v28 = v9;
    v29 = v8;
  }
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 1;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__60767;
  v65[4] = __Block_byref_object_dispose__60768;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__60767;
  v59[4] = __Block_byref_object_dispose__60768;
  v60 = 0;
  v47[0] = v12;
  v47[1] = 3221225472;
  v18 = v12;
  v47[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_2;
  v47[3] = &unk_1E366E6C0;
  v47[4] = self;
  v52 = &v73;
  v48 = v32;
  v53 = v61;
  v49 = v33;
  v54 = v59;
  v19 = a4;
  v58 = a4;
  v50 = v27;
  v55 = v67;
  v56 = v65;
  v51 = v29;
  v57 = v63;
  v20 = (void *)MEMORY[0x19AEC174C](v47);
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_4;
  v34[3] = &unk_1E366E6E8;
  v38 = v59;
  v35 = v28;
  v21 = v20;
  v46 = v19;
  v36 = self;
  v37 = v21;
  v39 = &v73;
  v40 = v67;
  v41 = v65;
  v42 = v63;
  v43 = v61;
  v44 = &v77;
  v45 = a5;
  v22 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v34);
  v23 = (void *)v78[5];
  if (v23)
    v24 = objc_msgSend(v23, "openForReadingUsingBlock:error:", v22, a5);
  else
    v24 = v22[2](v22, 0);
  v16 = v30;
  v15 = v31;
  v14 = v26;
  v17 = v24;
  v9 = v28;
  v8 = v29;

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
  v10 = v27;
  if (v11)
    goto LABEL_13;
LABEL_14:
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v77, 8);
  return v17;
}

- (id)_payloadTooNewErrorWithPayloadVersion:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D74498];
  v13 = *MEMORY[0x1E0CB2D50];
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[objc_class payloadClassID](self->_payloadClass, "payloadClassID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Payload (%@) too new, payload version %lu greater than payload class version %u"), v8, a3, -[objc_class payloadVersion](self->_payloadClass, "payloadVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 51007, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (PLJournalFile)pendingSnapshotJournal
{
  return self->_pendingSnapshotJournal;
}

- (PLJournalFile)pendingChangeJournal
{
  return self->_pendingChangeJournal;
}

- (PLJournalFile)prepareMarker
{
  return self->_prepareMarker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareMarker, 0);
  objc_storeStrong((id *)&self->_pendingChangeJournal, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotJournal, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileHandleForAppendingUpdates, 0);
  objc_storeStrong((id *)&self->_changeJournal, 0);
  objc_storeStrong((id *)&self->_snapshotJournal, 0);
}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;

  v14 = a2;
  v7 = objc_msgSend(v14, "payloadVersion");
  if (v7 <= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "payloadVersion"))
  {
    objc_msgSend(v14, "payloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v14, "header");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "entryType");

    if (v11 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v13, v8);
    }
    else
    {
      if (v11 != 1)
      {
        if (v11)
        {
LABEL_12:

          goto LABEL_13;
        }
        v12 = *(id *)(a1 + 48);

        v9 = v12;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", v8);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v8);
      }
      objc_msgSend(v13, "addIndex:", a3);
    }

    goto LABEL_12;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v14, "payloadVersion");
  *a4 = 1;
LABEL_13:

}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;

  v20 = a2;
  objc_msgSend(v20, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "entryType");

  v9 = v20;
  if (!v8)
  {
    v10 = objc_msgSend(v20, "payloadVersion");
    if (v10 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "payloadVersion"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v20, "payloadVersion");
      *a4 = 1;
LABEL_25:
      v9 = v20;
      goto LABEL_26;
    }
    objc_msgSend(v20, "payloadID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      if (objc_msgSend(v12, "unsignedLongLongValue") > a3)
        goto LABEL_24;
    }
    else if (v12)
    {
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      if (!objc_msgSend(v14, "containsIndex:", a3) || objc_msgSend(v15, "lastIndex") > a3)
        goto LABEL_23;
    }
    else if (v14)
    {
LABEL_23:

      goto LABEL_24;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) && *(_BYTE *)(a1 + 120))
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v21[1] = 3221225472;
        v18 = *(_OWORD *)(a1 + 96);
        v24 = *(_OWORD *)(a1 + 80);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[2] = __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_3;
        v21[3] = &unk_1E366E698;
        v26 = a3;
        v21[4] = *(_QWORD *)(a1 + 32);
        v25 = v18;
        v22 = v16;
        v23 = v20;
        objc_msgSend(v17, "enumerateIndexesUsingBlock:", v21);

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      objc_msgSend(v20, "payload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "migrateMergedPayloadWithUpdatePayloads:", v16);

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      if (*a4)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    }
    else
    {
      *a4 = 1;
    }

    goto LABEL_23;
  }
LABEL_26:

}

uint64_t __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v5 = objc_msgSend(*(id *)(a1 + 32), "enumerateEntriesUsingBlock:decodePayload:error:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v6 = v5;
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || !*(_QWORD *)(a1 + 112))
    {
      if (!(_DWORD)v5)
        goto LABEL_11;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
LABEL_9:
        v6 = v7 != 0;
        goto LABEL_11;
      }
    }
    else
    {
      **(_QWORD **)(a1 + 112) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      if (!(_DWORD)v6)
        goto LABEL_11;
      v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        goto LABEL_9;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v7 = 1;
    }
    else
    {
      v7 = 1;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
        objc_msgSend(*(id *)(a1 + 40), "changeJournal");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
        if (v12)
          v6 = objc_msgSend(v12, "enumerateEntriesUsingBlock:decodePayload:error:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 112));
        else
          v6 = 1;
        v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || !*(_QWORD *)(a1 + 112))
        {
          if (!(_DWORD)v6)
            goto LABEL_11;
        }
        else
        {
          **(_QWORD **)(a1 + 112) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
          if (!(_DWORD)v6)
            goto LABEL_11;
          v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        }
      }
    }
    goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 112))
  {
    objc_msgSend(*(id *)(a1 + 40), "_payloadTooNewErrorWithPayloadVersion:");
    v6 = 0;
    **(_QWORD **)(a1 + 112) = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_11:

  return v6;
}

void __60__PLJournal_enumerateEntriesUsingBlock_decodePayload_error___block_invoke_3(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  PLJournalEntry *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) || *(_QWORD *)(a1 + 88) < a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "seekToFileOffset:", a2);
    v5 = objc_alloc_init(PLJournalEntry);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v7 = objc_msgSend(*(id *)(a1 + 32), "payloadClass");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v8 + 40);
    LOBYTE(v6) = -[PLJournalEntry readFromFileHandle:decodePayload:payloadClass:entryOffset:error:](v5, "readFromFileHandle:decodePayload:payloadClass:entryOffset:error:", v6, 1, v7, 0, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      -[PLJournalEntry payload](v5, "payload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = *(void **)(a1 + 40);
        -[PLJournalEntry payload](v5, "payload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        objc_msgSend(*(id *)(a1 + 48), "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLJournalEntry payload](v5, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mergePayload:", v13);

      }
    }
    else
    {
      *a3 = 1;
    }

  }
}

void __44__PLJournal_currentPayloadVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < (unint64_t)objc_msgSend(v3, "payloadVersion"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "payloadVersion");

}

uint64_t __44__PLJournal_currentPayloadVersionWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "payloadVersion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a4 = 1;
  return result;
}

uint64_t __43__PLJournal_countOfInsertEntriesWithError___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __47__PLJournal_enumeratePayloadsUsingBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "payloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      v11 = "Skipping nil payloadID on enumeration for entry: %@";
LABEL_8:
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      v11 = "Skipping nil payload on enumeration for entry: %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, a3);

LABEL_10:
}

BOOL __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v3 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__60767;
  v17 = __Block_byref_object_dispose__60768;
  v18 = 0;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke_2;
  v9[3] = &unk_1E366E5A8;
  v11 = &v19;
  v5 = v3;
  v10 = v5;
  v12 = &v13;
  v6 = objc_msgSend(v4, "enumeratePayloadsUsingBlock:error:", v9, *(_QWORD *)(a1 + 40));
  if (!*((_BYTE *)v20 + 24) && *(_QWORD *)(a1 + 40))
    **(_QWORD **)(a1 + 40) = objc_retainAutorelease((id)v14[5]);
  if (v6)
    v7 = *((_BYTE *)v20 + 24) != 0;
  else
    v7 = 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __48__PLJournal_coalesceChangesToSnapshotWithError___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  v5 = a2;
  v6 = (void *)MEMORY[0x19AEC1554]();
  v7 = -[PLJournalEntry initForInsertWithPayload:]([PLJournalEntry alloc], "initForInsertWithPayload:", v5);
  v8 = a1[4];
  v9 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v7, "writeToFileHandle:checksumContext:error:", v8, 0, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;
  if ((v10 & 1) == 0)
    *a3 = 1;

  objc_autoreleasePoolPop(v6);
}

id __77__PLJournal_createSnapshotUsingNextPayloadBlock_createOnlyIfNecessary_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = -[PLJournalEntry initForInsertWithPayload:]([PLJournalEntry alloc], "initForInsertWithPayload:", v1);
  else
    v2 = 0;

  return v2;
}

uint64_t __86__PLJournal__performSnapshotWithMode_usingNextEntryBlock_createOnlyIfNecessary_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v24;

  v3 = a2;
  v24 = 0;
  (*(void (**)(void))(a1[6] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v4, "payload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      v11 = *(_QWORD *)(a1[4] + 8);

      if (v10 != v11)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "payload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Payload classes don't match: %@, %@"), objc_opt_class(), *(_QWORD *)(a1[4] + 8));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), v21, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v22);
      }
      v12 = a1[5];
      v23 = v7;
      v13 = objc_msgSend(v4, "writeToFileHandle:checksumContext:error:", v3, v12, &v23);
      v5 = v23;

      if (!v13)
        break;
      (*(void (**)(void))(a1[6] + 16))();
      v14 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v8);
      if (v14)
        v15 = v24 == 0;
      else
        v15 = 0;
      v4 = (void *)v14;
      v7 = v5;
      if (!v15)
      {
        LODWORD(v6) = 1;
        v4 = (void *)v14;
        goto LABEL_13;
      }
    }
    objc_autoreleasePoolPop(v8);
    v6 = a1[7];
    if (v6)
    {
      v5 = objc_retainAutorelease(v5);
      LODWORD(v6) = 0;
      *(_QWORD *)a1[7] = v5;
    }
  }
  else
  {
    v5 = 0;
    LODWORD(v6) = 1;
  }
LABEL_13:
  if (v24)
    v16 = 0;
  else
    v16 = v6;

  return v16;
}

+ (id)journalURLForBaseURL:(id)a3 name:(id)a4 journalType:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("plj"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)metadataURLForBaseURL:(id)a3 payloadClassId:(id)a4 pending:(BOOL)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = a3;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-pending"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = a3;
    objc_msgSend(v11, "URLByAppendingPathComponent:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)snapshotFinishMarkerURLForBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("SnapshotFinishMarker"));
}

+ (BOOL)createSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a1, "snapshotFinishMarkerURLForBaseURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PLJournalFile createEmptyURL:error:](PLJournalFile, "createEmptyURL:error:", v5, a4);

  return (char)a4;
}

+ (BOOL)removeSnapshotFinishMarkerForBaseURL:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a1, "snapshotFinishMarkerURLForBaseURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[PLJournalFile removeURL:error:](PLJournalFile, "removeURL:error:", v5, a4);

  return (char)a4;
}

+ (BOOL)snapshotFinishMarkerExistsForBaseURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "snapshotFinishMarkerURLForBaseURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0);

  return v4;
}

+ (BOOL)recoverJournalsIfNecessaryForBaseURL:(id)a3 payloadClasses:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  PLJournal *v15;
  _BOOL4 v16;
  char v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "snapshotFinishMarkerExistsForBaseURL:", v8))
  {
    v19 = a1;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v16 = -[PLJournal _recoverJournalWithError:](v15, "_recoverJournalWithError:", a5);

          if (!v16)
          {

            v17 = 0;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }

    v17 = objc_msgSend(v19, "removeSnapshotFinishMarkerForBaseURL:error:", v8, a5);
  }
  else
  {
    v17 = 1;
  }
LABEL_13:

  return v17;
}

+ (BOOL)createSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 createOnlyIfNecessary:(BOOL)a6 error:(id *)a7
{
  return objc_msgSend(a1, "_performSnapshotsForBaseURL:snapshotMode:payloadClasses:snapshotJournalBlock:createOnlyIfNecessary:error:", a3, 1, a4, a5, a6, a7);
}

+ (BOOL)appendSnapshotsForBaseURL:(id)a3 payloadClasses:(id)a4 snapshotJournalBlock:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "_performSnapshotsForBaseURL:snapshotMode:payloadClasses:snapshotJournalBlock:createOnlyIfNecessary:error:", a3, 2, a4, a5, 0, a6);
}

+ (BOOL)_performSnapshotsForBaseURL:(id)a3 snapshotMode:(unsigned __int8)a4 payloadClasses:(id)a5 snapshotJournalBlock:(id)a6 createOnlyIfNecessary:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  char v18;
  int v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  BOOL v29;
  id v30;
  id v31;
  BOOL v32;
  void *v34;
  id v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  char v47;
  id obj;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  _QWORD v60[2];

  v9 = a7;
  v12 = a4;
  v60[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (!(_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLJournal.m"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotMode != PLJournalSnapshotModeNone"));

  }
  v53 = 0;
  v54 = (id *)&v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__60767;
  v57 = __Block_byref_object_dispose__60768;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  obj = 0;
  v18 = objc_msgSend(a1, "recoverJournalsIfNecessaryForBaseURL:payloadClasses:error:", v15, v16, &obj);
  objc_storeStrong(&v58, obj);
  v52 = v18;
  v19 = *((unsigned __int8 *)v50 + 24);
  if (*((_BYTE *)v50 + 24))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke;
    v41[3] = &unk_1E366E508;
    v22 = v15;
    v42 = v22;
    v45 = &v49;
    v47 = v12;
    v46 = &v53;
    v23 = v20;
    v43 = v23;
    v44 = v17;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v41);
    if ((_DWORD)v12 == 1 && v9)
    {
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 1;
      v36[0] = v21;
      v36[1] = 3221225472;
      v36[2] = __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke_2;
      v36[3] = &unk_1E366E530;
      v36[4] = &v37;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v36);
      if (*((_BYTE *)v38 + 24))
      {
        *((_BYTE *)v50 + 24) = 0;
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v59 = *MEMORY[0x1E0CB2938];
        v60[0] = CFSTR("All existing snapshots are the same as the pending ones");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 51012, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v54[5];
        v54[5] = (id)v26;

      }
      _Block_object_dispose(&v37, 8);
    }
    v28 = *((unsigned __int8 *)v50 + 24);
    v35 = 0;
    v29 = +[PLJournal _finishFullSnapshotForBaseURL:snapshotSucceeded:snapshotMode:journals:error:](PLJournal, "_finishFullSnapshotForBaseURL:snapshotSucceeded:snapshotMode:journals:error:", v22, v28, v12, v23, &v35);
    v30 = v35;
    v31 = v35;
    if (!v29 && *((_BYTE *)v50 + 24))
    {
      objc_storeStrong(v54 + 5, v30);
      *((_BYTE *)v50 + 24) = v29;
    }

    v19 = *((unsigned __int8 *)v50 + 24);
  }
  if (a8 && !v19)
  {
    *a8 = objc_retainAutorelease(v54[5]);
    v19 = *((unsigned __int8 *)v50 + 24);
  }
  v32 = v19 != 0;
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v32;
}

+ (BOOL)_finishFullSnapshotForBaseURL:(id)a3 snapshotSucceeded:(BOOL)a4 snapshotMode:(unsigned __int8)a5 journals:(id)a6 error:(id *)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  SEL v27;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v9 = a5;
  v10 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  if ((_DWORD)v9)
  {
    if (!v10)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLJournal.m"), 920, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotMode != PLJournalSnapshotModeNone"));

    if (!v10)
      goto LABEL_4;
  }
  if (!objc_msgSend(a1, "createSnapshotFinishMarkerForBaseURL:error:", v13, a7))
  {
    v24 = 0;
    goto LABEL_18;
  }
LABEL_4:
  v27 = a2;
  v28 = a1;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = v14;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v19, "baseURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v13);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "baseURL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, CFSTR("PLJournal.m"), 928, CFSTR("Journal base URL: %@ not the same as provided baseURL: %@"), v23, v13);

        }
        if (!objc_msgSend(v19, "_finishSnapshotWithMode:snapshotSuccess:error:", v9, v10, a7))
        {

          v24 = 0;
          goto LABEL_16;
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v16)
        continue;
      break;
    }
  }

  v24 = objc_msgSend(v28, "removeSnapshotFinishMarkerForBaseURL:error:", v13, a7);
LABEL_16:
  v14 = v29;
LABEL_18:

  return v24;
}

void __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  PLJournal *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id obj;

  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", *(_QWORD *)(a1 + 32), a2);
  v9 = *(unsigned __int8 *)(a1 + 72);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  v11 = -[PLJournal _prepareForSnapshotWithMode:error:](v8, "_prepareForSnapshotWithMode:error:", v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 40), "addObject:", v8),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))()) == 0))
  {
    *a4 = 1;
  }

  objc_autoreleasePoolPop(v7);
}

void __118__PLJournal__performSnapshotsForBaseURL_snapshotMode_payloadClasses_snapshotJournalBlock_createOnlyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v6 = a2;
  objc_msgSend(v6, "_readMetadataPending:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_readMetadataPending:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("snapshotChecksum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("snapshotChecksum")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", v8),
        v9,
        (v10 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
