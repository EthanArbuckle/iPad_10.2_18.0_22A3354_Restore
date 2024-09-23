@implementation CRFileTransferDataWriter

- (CRFileTransferDataWriter)initWithFileURL:(id)a3 chunkCount:(id)a4
{
  id v7;
  id v8;
  CRFileTransferDataWriter *v9;
  id *p_isa;
  CRFileTransferDataWriter *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRFileTransferDataWriter;
  v9 = -[CRFileTransferDataWriter init](&v13, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9
    && (objc_storeStrong((id *)&v9->_fileURL, a3),
        objc_storeStrong(p_isa + 2, a4),
        !objc_msgSend(p_isa, "_openFile")))
  {
    v11 = 0;
  }
  else
  {
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)_openFile
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter fileURL](self, "fileURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
        v8 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v4, 0, 0),
        v7,
        (v8 & 1) != 0))
  {
    v16 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingToURL:error:](NSFileHandle, "fileHandleForWritingToURL:error:", v3, &v16));
    v10 = v16;
    v11 = v9 != 0;
    if (v9)
    {
      -[CRFileTransferDataWriter setFileHandle:](self, "setFileHandle:", v9);
    }
    else
    {
      v12 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000685B4((uint64_t)v10, v13);

    }
  }
  else
  {
    v14 = sub_100056C84(4uLL);
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100068628(v10);
    v11 = 0;
  }

  return v11;
}

- (void)_closeFile
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter fileHandle](self, "fileHandle"));
  objc_msgSend(v3, "closeFile");

  -[CRFileTransferDataWriter setFileHandle:](self, "setFileHandle:", 0);
}

- (BOOL)saveData:(id)a3 forIndex:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter fileHandle](self, "fileHandle"));
  if (v8)
  {
    -[CRFileTransferDataWriter setCurrentChunkIndex:](self, "setCurrentChunkIndex:", v7);
    objc_msgSend(v8, "seekToEndReturningOffset:error:", 0, 0);
    v19 = 0;
    v9 = objc_msgSend(v8, "writeData:error:", v6, &v19);
    v10 = v19;
    if ((v9 & 1) != 0)
    {
      v11 = -[CRFileTransferDataWriter hasAllChunks](self, "hasAllChunks");
      v12 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (v14)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter chunkCount](self, "chunkCount"));
          *(_DWORD *)buf = 138412546;
          v21 = v7;
          v22 = 2112;
          v23 = v17;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "saved file chunk index %@ (total chunks: %@)", buf, 0x16u);

        }
        goto LABEL_13;
      }
      if (!v14)
      {
LABEL_9:

        -[CRFileTransferDataWriter _closeFile](self, "_closeFile");
LABEL_13:

        goto LABEL_14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter chunkCount](self, "chunkCount"));
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "saved final file chunk index %@ (total chunks: %@)", buf, 0x16u);
    }
    else
    {
      v16 = sub_100056C84(4uLL);
      v13 = objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter chunkCount](self, "chunkCount"));
      *(_DWORD *)buf = 138412802;
      v21 = v7;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to save file chunk %@ of %@: %@", buf, 0x20u);
    }

    goto LABEL_9;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)hasAllChunks
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter currentChunkIndex](self, "currentChunkIndex"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter currentChunkIndex](self, "currentChunkIndex"));
  v5 = (char *)objc_msgSend(v4, "unsignedIntegerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRFileTransferDataWriter chunkCount](self, "chunkCount"));
  v7 = v5 == (char *)objc_msgSend(v6, "unsignedIntegerValue") - 1;

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSNumber)chunkCount
{
  return self->_chunkCount;
}

- (NSNumber)currentChunkIndex
{
  return self->_currentChunkIndex;
}

- (void)setCurrentChunkIndex:(id)a3
{
  objc_storeStrong((id *)&self->_currentChunkIndex, a3);
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_currentChunkIndex, 0);
  objc_storeStrong((id *)&self->_chunkCount, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
