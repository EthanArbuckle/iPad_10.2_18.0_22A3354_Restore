@implementation SHCompression

+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3
{
  return +[SHDataCompression supportedCompressionTypeFromFilePathExtension:](SHDataCompression, "supportedCompressionTypeFromFilePathExtension:", a3);
}

+ (int)supportedCompressionTypeFromFileURL:(id)a3
{
  return +[SHDataCompression supportedCompressionTypeFromFileURL:](SHDataCompression, "supportedCompressionTypeFromFileURL:", a3);
}

+ (BOOL)decompressFile:(id)a3 withAlgorithm:(int)a4 toLocation:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  SHDataStreamInput *v11;
  id v12;
  SHDataStreamOutput *v13;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(SHDataStreamInput);
  v12 = -[SHDataCompression initForDecompressionWithAlgorithm:]([SHDataCompression alloc], "initForDecompressionWithAlgorithm:", v7);
  -[SHDataStreamInput setNext:](v11, "setNext:", v12);
  v13 = -[SHDataStreamOutput initWithDestination:]([SHDataStreamOutput alloc], "initWithDestination:", v9);

  objc_msgSend(v12, "setNext:", v13);
  LOBYTE(a6) = -[SHDataStreamInput loadDataFromURL:error:](v11, "loadDataFromURL:error:", v10, a6);

  return (char)a6;
}

+ (BOOL)decompressAppleArchiveAtURL:(id)a3 toDirectoryURL:(id)a4 error:(id *)a5
{
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  AAByteStream_impl *v11;
  AAByteStream_impl *v12;
  AAByteStream_impl *v13;
  AAArchiveStream v14;
  AAArchiveStream_impl *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  AAArchiveStream_impl *v24;
  ssize_t v25;
  BOOL v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  unsigned __int8 v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  __CFString *v51;
  uint64_t v52;
  __CFString *v53;
  uint64_t v54;
  __CFString *v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to archive. Archive path %@ or destination path %@ is nil."), v7, v8);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v56 = *MEMORY[0x24BDD0BA0];
    v57[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v28);

    shcore_log_object();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v41 = v27;
LABEL_23:
    _os_log_impl(&dword_21AB5E000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    goto LABEL_24;
  }
  -[__CFString path](v7, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0, 0x1A4u);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open source apple archive file at %@."), v7);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v54 = *MEMORY[0x24BDD0BA0];
    v55 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v30);

    shcore_log_object();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
  v12 = AADecompressionInputStreamOpen(v11, 0, 0);
  if (!v12)
  {
    AAByteStreamClose(v11);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to open archive decompressed input stream at %@."), v7);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v52 = *MEMORY[0x24BDD0BA0];
    v53 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v31);

    shcore_log_object();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
  v13 = v12;
  v14 = AADecodeArchiveInputStreamOpen(v12, 0, 0, 0, 0);
  if (v14)
  {
    v15 = v14;
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, &v39);
    v19 = v39;

    if (!v18 || !v19)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v21 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v38);
      v22 = v38;

      if (!v21)
      {
        AAByteStreamClose(v13);
        AAByteStreamClose(v11);
        AAArchiveStreamClose(v15);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create directory at url %@."), v9);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v48 = *MEMORY[0x24BDD0BA0];
        v49 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, v22, v35);

        shcore_log_object();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_impl(&dword_21AB5E000, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        goto LABEL_34;
      }

    }
    objc_msgSend(v9, "path");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = AAExtractArchiveOutputStreamOpen((const char *)objc_msgSend(v23, "fileSystemRepresentation"), 0, 0, 1uLL, 0);

    if (v24)
    {
      v25 = AAArchiveStreamProcess(v15, v24, 0, 0, 0, 0);
      AAByteStreamClose(v13);
      AAByteStreamClose(v11);
      AAArchiveStreamClose(v15);
      AAArchiveStreamClose(v24);
      if ((v25 & 0x8000000000000000) == 0)
      {
        shcore_log_object();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v7;
          v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_21AB5E000, v22, OS_LOG_TYPE_DEBUG, "Extracted archive from %@ to destination: %@", buf, 0x16u);
        }
        v26 = 1;
        v27 = &stru_24DDB28B8;
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to decompress archive file %@ to destination directory %@. Stream processing failed."), v7, v9);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v44 = *MEMORY[0x24BDD0BA0];
      v45 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v37);

      shcore_log_object();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v27;
        goto LABEL_33;
      }
    }
    else
    {
      AAByteStreamClose(v13);
      AAByteStreamClose(v11);
      AAArchiveStreamClose(v15);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create output directory stream at %@ for decompression."), v9);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v46 = *MEMORY[0x24BDD0BA0];
      v47 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v34);

      shcore_log_object();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v27;
LABEL_33:
        _os_log_impl(&dword_21AB5E000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
LABEL_34:
    v26 = 0;
LABEL_35:

    goto LABEL_25;
  }
  AAByteStreamClose(v13);
  AAByteStreamClose(v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to decode archive decompressed stream at %@."), v7);
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v50 = *MEMORY[0x24BDD0BA0];
  v51 = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHCoreError annotateError:code:underlyingError:keyOverrides:](SHCoreError, "annotateError:code:underlyingError:keyOverrides:", a5, 302, 0, v32);

  shcore_log_object();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
LABEL_24:

  v26 = 0;
LABEL_25:

  return v26;
}

@end
