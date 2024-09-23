@implementation SFSDirectoryCompressor

+ (BOOL)compressDirectoryAtURL:(id)a3 intoURL:(id)a4 withDenylist:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  _Unwind_Exception *v36;
  _Unwind_Exception *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = soft_AAFileStreamOpenWithPath(objc_msgSend(v12, "fileSystemRepresentation"), 513);

  if (!v13)
    goto LABEL_29;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v14 = getAACompressionOutputStreamOpenSymbolLoc_ptr;
  v45 = getAACompressionOutputStreamOpenSymbolLoc_ptr;
  if (!getAACompressionOutputStreamOpenSymbolLoc_ptr)
  {
    v15 = (void *)libAppleArchiveLibrary();
    v14 = dlsym(v15, "AACompressionOutputStreamOpen");
    v43[3] = (uint64_t)v14;
    getAACompressionOutputStreamOpenSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v42, 8);
  if (!v14)
  {
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
LABEL_32:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
LABEL_33:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    goto LABEL_34;
  }
  v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))v14)(v13, 2049, 0x100000, 0, 0);
  if (!v16)
  {
LABEL_28:
    soft_AAByteStreamClose(v13);
    goto LABEL_29;
  }
  v17 = v16;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v18 = getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr;
  v45 = getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr;
  if (!getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr)
  {
    v19 = (void *)libAppleArchiveLibrary();
    v18 = dlsym(v19, "AAEncodeArchiveOutputStreamOpen");
    v43[3] = (uint64_t)v18;
    getAAEncodeArchiveOutputStreamOpenSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(&v42, 8);
  if (!v18)
    goto LABEL_32;
  v20 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v18)(v17, 0, 0, 0, 0);
  if (!v20)
  {
LABEL_27:
    soft_AAByteStreamClose(v17);
    goto LABEL_28;
  }
  v21 = v20;
  v22 = objc_msgSend(CFSTR("TYP,PAT,LNK,DEV,DAT,UID,GID,MOD,FLG,MTM,BTM,CTM"), "UTF8String");
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v23 = getAAFieldKeySetCreateWithStringSymbolLoc_ptr;
  v45 = getAAFieldKeySetCreateWithStringSymbolLoc_ptr;
  if (!getAAFieldKeySetCreateWithStringSymbolLoc_ptr)
  {
    v24 = (void *)libAppleArchiveLibrary();
    v23 = dlsym(v24, "AAFieldKeySetCreateWithString");
    v43[3] = (uint64_t)v23;
    getAAFieldKeySetCreateWithStringSymbolLoc_ptr = v23;
  }
  _Block_object_dispose(&v42, 8);
  if (!v23)
    goto LABEL_33;
  v40 = ((uint64_t (*)(uint64_t))v23)(v22);
  if (!v40)
  {
LABEL_26:
    soft_AAArchiveStreamClose(v21);
    goto LABEL_27;
  }
  objc_msgSend(v9, "path");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = objc_msgSend(v25, "fileSystemRepresentation");
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v27 = getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr;
  v45 = getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr;
  if (!getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr)
  {
    v28 = (void *)libAppleArchiveLibrary();
    v27 = dlsym(v28, "AAPathListCreateWithDirectoryContents");
    v43[3] = (uint64_t)v27;
    getAAPathListCreateWithDirectoryContentsSymbolLoc_ptr = v27;
  }
  _Block_object_dispose(&v42, 8);
  if (!v27)
  {
LABEL_34:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
LABEL_35:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    goto LABEL_36;
  }
  v29 = ((uint64_t (*)(uint64_t, _QWORD, id, BOOL (*)(void *, uint64_t, uint64_t), _QWORD, _QWORD))v27)(v26, 0, v11, filter_denylist, 0, 0);

  if (!v29)
    goto LABEL_26;
  objc_msgSend(v9, "path");
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v38 = objc_msgSend(v39, "fileSystemRepresentation");
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v30 = getAAArchiveStreamWritePathListSymbolLoc_ptr;
  v45 = getAAArchiveStreamWritePathListSymbolLoc_ptr;
  if (!getAAArchiveStreamWritePathListSymbolLoc_ptr)
  {
    v31 = (void *)libAppleArchiveLibrary();
    v30 = dlsym(v31, "AAArchiveStreamWritePathList");
    v43[3] = (uint64_t)v30;
    getAAArchiveStreamWritePathListSymbolLoc_ptr = v30;
  }
  _Block_object_dispose(&v42, 8);
  if (!v30)
    goto LABEL_35;
  v41 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, BOOL (*)(void *, uint64_t, uint64_t), _QWORD, _QWORD))v30)(v21, v29, v40, v38, v11, filter_denylist, 0, 0);

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v32 = getAAPathListDestroySymbolLoc_ptr;
  v45 = getAAPathListDestroySymbolLoc_ptr;
  if (!getAAPathListDestroySymbolLoc_ptr)
  {
    v33 = (void *)libAppleArchiveLibrary();
    v32 = dlsym(v33, "AAPathListDestroy");
    v43[3] = (uint64_t)v32;
    getAAPathListDestroySymbolLoc_ptr = v32;
  }
  _Block_object_dispose(&v42, 8);
  if (!v32)
  {
LABEL_36:
    +[SFSDirectoryCompressor compressDirectoryAtURL:intoURL:withDenylist:error:].cold.1();
    v37 = v36;
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v37);
  }
  ((void (*)(uint64_t))v32)(v29);
  soft_AAArchiveStreamClose(v21);
  soft_AAByteStreamClose(v17);
  soft_AAByteStreamClose(v13);
  if (v41)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -1, 0);
    v34 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v34 = 1;
LABEL_30:

  return v34;
}

+ (void)compressDirectoryAtURL:intoURL:withDenylist:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;

  dlerror();
  v0 = abort_report_np();
  +[SFSSymbolAssetInfo localeAgnosticInfo:allowsPrivate:].cold.1(v0, v1);
}

@end
