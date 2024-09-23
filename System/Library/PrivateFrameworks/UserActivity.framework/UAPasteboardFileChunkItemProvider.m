@implementation UAPasteboardFileChunkItemProvider

- (UAPasteboardFileChunkItemProvider)initWithType:(id)a3 fileHandle:(id)a4 offsetInFile:(id)a5 size:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  UAPasteboardFileChunkItemProvider *v13;
  UAPasteboardFileChunkItemProvider *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UAPasteboardFileChunkItemProvider;
  v13 = -[UAPasteboardFileChunkItemProvider init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[UAPasteboardFileChunkItemProvider setDataFile:](v13, "setDataFile:", v11);
    -[UAPasteboardFileChunkItemProvider setOffsetInFile:](v14, "setOffsetInFile:", v12);
    -[UAPasteboardFileChunkItemProvider setChunkSize:](v14, "setChunkSize:", a6);
    -[UAPasteboardFileChunkItemProvider setType:](v14, "setType:", v10);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardFileChunkItemProvider setUuid:](v14, "setUuid:", v15);

  }
  return v14;
}

- (void)getDataWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  UAFileChunkInputStream *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  UAFileChunkInputStream *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  -[UAPasteboardFileChunkItemProvider dataFile](self, "dataFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UASharedPasteboardIRManager sharedIRManager](UASharedPasteboardIRManager, "sharedIRManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardFileChunkItemProvider type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "converterForType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _uaGetLogForCategory(CFSTR("pasteboard-client"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        -[UAPasteboardFileChunkItemProvider type](self, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        v39 = 2112;
        v40 = (id)objc_opt_class();
        v12 = v40;
        _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] Found converter for type: %{public}@ -> %@", buf, 0x16u);

      }
      -[UAPasteboardFileChunkItemProvider dataFile](self, "dataFile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAPasteboardFileChunkItemProvider offsetInFile](self, "offsetInFile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "seekToFileOffset:", objc_msgSend(v14, "unsignedLongLongValue"));

      -[UAPasteboardFileChunkItemProvider dataFile](self, "dataFile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "readDataOfLength:", -[UAPasteboardFileChunkItemProvider chunkSize](self, "chunkSize"));
      v16 = (UAFileChunkInputStream *)objc_claimAutoreleasedReturnValue();

      if (v16 && -[UAFileChunkInputStream length](v16, "length"))
      {
        objc_msgSend(v8, "convertIRDataToPlatform:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
LABEL_22:

          v4[2](v4, v19, v20);
          goto LABEL_23;
        }
        _uaGetLogForCategory(CFSTR("pasteboard-client"));
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v28, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Zero length data from converter", buf, 2u);
        }

        v29 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = CFSTR("Zero length data from converter");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        _uaGetLogForCategory(CFSTR("pasteboard-client"));
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF7EB000, v22, OS_LOG_TYPE_ERROR, "[Local Pasteboard] ERROR: Zero length data to convert", buf, 2u);
        }

        v23 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D50];
        v36 = CFSTR("Zero length data to convert");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = 0;
      goto LABEL_22;
    }
    if (v10)
    {
      -[UAPasteboardFileChunkItemProvider type](self, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v24;
      _os_log_impl(&dword_1AF7EB000, v9, OS_LOG_TYPE_INFO, "[Local Pasteboard] No converter for type, using file stream: %@", buf, 0xCu);

    }
    v25 = [UAFileChunkInputStream alloc];
    -[UAPasteboardFileChunkItemProvider dataFile](self, "dataFile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAPasteboardFileChunkItemProvider offsetInFile](self, "offsetInFile");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UAFileChunkInputStream initWithFileHandle:offsetInFile:size:](v25, "initWithFileHandle:offsetInFile:size:", v26, v27, -[UAPasteboardFileChunkItemProvider chunkSize](self, "chunkSize"));

    v4[2](v4, v16, 0);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("File Provider does not have a backing file");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("UAContinuityErrorDomain"), -124, v8);
    v16 = (UAFileChunkInputStream *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v16);
  }
LABEL_23:

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDataFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)offsetInFile
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffsetInFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetInFile, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
