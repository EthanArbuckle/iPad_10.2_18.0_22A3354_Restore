@implementation SFSDirectoryDecompressor

+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  _Unwind_Exception *v34;
  _Unwind_Exception *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = soft_AAFileStreamOpenWithPath(objc_msgSend(v9, "fileSystemRepresentation"), 0);

  if (!v10)
    goto LABEL_24;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v11 = getAADecompressionInputStreamOpenSymbolLoc_ptr;
  v39 = getAADecompressionInputStreamOpenSymbolLoc_ptr;
  if (!getAADecompressionInputStreamOpenSymbolLoc_ptr)
  {
    v12 = (void *)libAppleArchiveLibrary();
    v11 = dlsym(v12, "AADecompressionInputStreamOpen");
    v37[3] = (uint64_t)v11;
    getAADecompressionInputStreamOpenSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v36, 8);
  if (!v11)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
LABEL_27:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    goto LABEL_28;
  }
  v13 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD))v11)(v10, 0, 0);
  if (!v13)
  {
LABEL_23:
    soft_AAByteStreamClose(v10);
    goto LABEL_24;
  }
  v14 = v13;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v15 = getAADecodeArchiveInputStreamOpenSymbolLoc_ptr;
  v39 = getAADecodeArchiveInputStreamOpenSymbolLoc_ptr;
  if (!getAADecodeArchiveInputStreamOpenSymbolLoc_ptr)
  {
    v16 = (void *)libAppleArchiveLibrary();
    v15 = dlsym(v16, "AADecodeArchiveInputStreamOpen");
    v37[3] = (uint64_t)v15;
    getAADecodeArchiveInputStreamOpenSymbolLoc_ptr = v15;
  }
  _Block_object_dispose(&v36, 8);
  if (!v15)
    goto LABEL_27;
  v17 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v15)(v14, 0, 0, 0, 0);
  if (!v17)
  {
LABEL_22:
    soft_AAByteStreamClose(v14);
    goto LABEL_23;
  }
  v18 = v17;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, 0);

    if (!v23)
    {
LABEL_21:
      soft_AAArchiveStreamClose(v18);
      goto LABEL_22;
    }
  }
  objc_msgSend(v8, "path");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v24, "fileSystemRepresentation");
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v26 = getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr;
  v39 = getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr;
  if (!getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr)
  {
    v27 = (void *)libAppleArchiveLibrary();
    v26 = dlsym(v27, "AAExtractArchiveOutputStreamOpen");
    v37[3] = (uint64_t)v26;
    getAAExtractArchiveOutputStreamOpenSymbolLoc_ptr = v26;
  }
  _Block_object_dispose(&v36, 8);
  if (!v26)
  {
LABEL_28:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    goto LABEL_29;
  }
  v28 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))v26)(v25, 0, 0, 1, 0);

  if (!v28)
    goto LABEL_21;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v29 = getAAArchiveStreamProcessSymbolLoc_ptr;
  v39 = getAAArchiveStreamProcessSymbolLoc_ptr;
  if (!getAAArchiveStreamProcessSymbolLoc_ptr)
  {
    v30 = (void *)libAppleArchiveLibrary();
    v29 = dlsym(v30, "AAArchiveStreamProcess");
    v37[3] = (uint64_t)v29;
    getAAArchiveStreamProcessSymbolLoc_ptr = v29;
  }
  _Block_object_dispose(&v36, 8);
  if (!v29)
  {
LABEL_29:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    v35 = v34;
    _Block_object_dispose(&v36, 8);
    _Unwind_Resume(v35);
  }
  v31 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v29)(v18, v28, 0, 0, 0, 0);
  soft_AAArchiveStreamClose(v28);
  soft_AAArchiveStreamClose(v18);
  soft_AAByteStreamClose(v14);
  soft_AAByteStreamClose(v10);
  if (v31 < 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -1, 0, v36);
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v32 = 1;
LABEL_25:

  return v32;
}

@end
