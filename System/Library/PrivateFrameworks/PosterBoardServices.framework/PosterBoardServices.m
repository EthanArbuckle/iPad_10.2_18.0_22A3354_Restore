void sub_1A4998618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PaperBoardUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4D425B8;
    v5 = 0;
    PaperBoardUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PaperBoardUILibraryCore_frameworkLibrary)
    __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)PaperBoardUILibraryCore_frameworkLibrary, "PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                         + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id PRSLogCommon()
{
  if (PRSLogCommon_onceToken != -1)
    dispatch_once(&PRSLogCommon_onceToken, &__block_literal_global_0);
  return (id)PRSLogCommon___logObj;
}

id PRSLogObserver()
{
  if (PRSLogObserver_onceToken != -1)
    dispatch_once(&PRSLogObserver_onceToken, &__block_literal_global_3);
  return (id)PRSLogObserver___logObj;
}

id PRSLogPosterContents()
{
  if (PRSLogPosterContents_onceToken != -1)
    dispatch_once(&PRSLogPosterContents_onceToken, &__block_literal_global_5);
  return (id)PRSLogPosterContents___logObj;
}

id PRSLogArchiver()
{
  if (PRSLogArchiver_onceToken != -1)
    dispatch_once(&PRSLogArchiver_onceToken, &__block_literal_global_7);
  return (id)PRSLogArchiver___logObj;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void PRSAppleArchiveCompressDirectory(void *a1, void *a2)
{
  AAByteStream_impl *v3;
  AAByteStream_impl *v4;
  AAArchiveStream v5;
  AAArchiveStream_impl *v6;
  id v7;
  AAPathList v8;
  AAPathList_impl *v9;
  AAFieldKeySet_impl *v10;
  AAFieldKeySet_impl *v11;
  id v12;

  v12 = a1;
  v3 = AAFileStreamOpenWithPath((const char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation"), 514, 0x1A4u);
  if (v3)
  {
    v4 = v3;
    v5 = AAEncodeArchiveOutputStreamOpen(v3, 0, 0, 0, 0);
    if (v5)
    {
      v6 = v5;
      v7 = objc_retainAutorelease(v12);
      v8 = AAPathListCreateWithDirectoryContents((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0, 0, 0, 0, 0);
      if (v8)
      {
        v9 = v8;
        v10 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
        if (v10)
        {
          v11 = v10;
          AAArchiveStreamWritePathList(v6, v9, v10, (const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), 0, 0, 0, 0);
          AAFieldKeySetDestroy(v11);
        }
        AAPathListDestroy(v9);
      }
      AAArchiveStreamClose(v6);
    }
    AAByteStreamClose(v4);
  }

}

uint64_t PRSZipArchiverCompressDirectory(void *a1, void *a2, void *a3)
{
  NSURL *v5;
  id v6;
  NSFileManager *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  PRSArchiverZipData(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PRSLogArchiver();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      PRSZipArchiverCompressDirectory_cold_1();
    goto LABEL_11;
  }
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PFPosterPathFileAttributes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v11 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, v10, &v16);
  v12 = v16;

  if (!v11)
  {
    PRSLogArchiver();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      PRSZipArchiverCompressDirectory_cold_3();
    goto LABEL_10;
  }
  v13 = 1;
  if ((objc_msgSend(v8, "writeToURL:atomically:", v6, 1) & 1) == 0)
  {
    PRSLogArchiver();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      PRSZipArchiverCompressDirectory_cold_2();
LABEL_10:

LABEL_11:
    v13 = 0;
  }

  return v13;
}

uint64_t PRSUnarchiverZip(NSURL *a1, NSURL *a2)
{
  NSURL *v3;
  NSURL *v4;
  NSURL *v5;
  uint64_t v6;
  NSURL *v7;
  int v8;
  int v9;
  NSObject *v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (!v3 || !v4)
    goto LABEL_14;
  if (!-[NSURL isFileURL](v3, "isFileURL"))
  {
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();
    goto LABEL_12;
  }
  v7 = objc_retainAutorelease(v3);
  v8 = open(-[NSURL fileSystemRepresentation](v7, "fileSystemRepresentation"), 4);
  if (v8 < 0)
  {
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip((uint64_t)v7, v10);
LABEL_12:
    v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v9 = v8;
  v6 = PRSUnarchiverZip(v8, v5, 0);
  if (close(v9))
  {
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

uint64_t PRSUnarchiverZip(NSData *a1, NSURL *a2)
{
  NSData *v3;
  NSURL *v4;
  NSData *v5;
  const void *v6;
  unint64_t v7;
  uint64_t v8;

  if (!a1 || !a2)
    return 0;
  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = v3;
  v6 = -[NSData bytes](v5, "bytes");
  v7 = -[NSData length](v5, "length");

  v8 = PRSUnarchiverZip(v6, v7, v4, 0);
  return v8;
}

id PRSArchiverZipData(NSURL *a1, NSFileManager *a2)
{
  NSURL *v3;
  NSFileManager *v4;
  NSURL *v5;
  uint64_t disk_new;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  NSObject *v26;
  size_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  int next_header;
  int v39;
  NSObject *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  int v51;
  char v52;
  BOOL v53;
  const char *v54;
  int v55;
  void *v56;
  ssize_t v57;
  NSObject *v58;
  NSObject *v59;
  int *v60;
  char *v61;
  int *v62;
  char *v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  size_t v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  NSObject *v75;
  id v76;
  unint64_t v77;
  int v78;
  size_t v79;
  uint64_t v80;
  int v81;
  NSObject *v82;
  void *v83;
  void *v84;
  id v85;
  _QWORD v86[6];
  id v87[2];
  stat buf;
  uint64_t v89;
  _QWORD v90[7];

  v90[5] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v3)
  {
    v5 = 0;
LABEL_8:
    v9 = 0;
    goto LABEL_65;
  }
  if (!-[NSURL isFileURL](v3, "isFileURL"))
  {
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();
    v9 = 0;
    goto LABEL_64;
  }
  -[NSURL URLByStandardizingPath](v3, "URLByStandardizingPath");
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();

  disk_new = archive_read_disk_new();
  if (!disk_new)
    goto LABEL_8;
  v7 = disk_new;
  if (archive_read_disk_set_standard_lookup())
  {
    PRSLogArchiver();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v7, v8);
    goto LABEL_15;
  }
  if (archive_read_disk_set_symlink_physical())
  {
    PRSLogArchiver();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v7, v8);
LABEL_15:

    if (archive_read_free())
    {
      PRSLogArchiver();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        PRSArchiverZipData();
      v9 = 0;
      v3 = v5;
      goto LABEL_64;
    }
    goto LABEL_8;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_retainAutorelease(v5);
  v12 = (void *)objc_msgSend(v11, "initWithUTF8String:", -[NSURL fileSystemRepresentation](v3, "fileSystemRepresentation"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v12);
  -[NSObject UTF8String](v10, "UTF8String");
  if (archive_read_disk_open())
  {
    PRSLogArchiver();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v7, v14);
    v9 = 0;
    goto LABEL_59;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.zip"), v16);
  v14 = objc_claimAutoreleasedReturnValue();

  -[NSFileManager temporaryDirectory](v4, "temporaryDirectory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.PosterBoardServices"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v14, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = *MEMORY[0x1E0CB2AA8];
  v90[0] = &unk_1E4D53320;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = 0;
  v21 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, v20, v87);
  v85 = v87[0];

  if (!v21)
  {
    PRSLogArchiver();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();

  }
  v23 = objc_retainAutorelease(v19);
  v24 = open((const char *)objc_msgSend(v23, "fileSystemRepresentation"), 2566, 384);
  if (v24 < 0)
  {
    PRSLogArchiver();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData((uint64_t)v23, v31);

    v9 = 0;
    goto LABEL_54;
  }
  v25 = v24;
  v84 = v18;
  v26 = v10;
  if (!v26 || (v27 = NSPageSize(), (v28 = malloc_type_malloc(v27, 0xB4BA19F7uLL)) == 0))
  {
LABEL_48:

    v9 = 0;
    v18 = v84;
    goto LABEL_49;
  }
  v79 = v27;
  v83 = v28;
  v29 = archive_write_new();
  if (!v29)
  {
LABEL_47:
    free(v83);
    goto LABEL_48;
  }
  v82 = v26;
  v80 = v29;
  if (archive_write_set_format_zip())
  {
    PRSLogArchiver();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v80, v30);
LABEL_43:

    v26 = v82;
    if (archive_write_free())
    {
      PRSLogArchiver();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        PRSArchiverZipData();

      v26 = v82;
    }
    goto LABEL_47;
  }
  if (archive_write_set_format_option())
  {
    PRSLogArchiver();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v80, v30);
    goto LABEL_43;
  }
  if (archive_write_open_fd())
  {
    PRSLogArchiver();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();
    goto LABEL_43;
  }
  v74 = v13;
  v75 = v14;
  v76 = v23;
  v81 = v25;
  -[NSObject pathComponents](v26, "pathComponents");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v37, "count");

  while (1)
  {
    v87[1] = 0;
    next_header = archive_read_next_header();
    if (next_header)
    {
      v39 = next_header;
      if (next_header == 1)
      {
        v65 = 1;
        goto LABEL_120;
      }
      PRSLogArchiver();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        PRSArchiverZipData();

      if (v39 != -20)
        goto LABEL_119;
    }
    archive_read_disk_descend();
    v41 = archive_entry_filetype();
    v42 = (void *)MEMORY[0x1A85A43E4]();
    v43 = archive_entry_pathname_utf8();
    if (!v43)
      break;
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v43);
    objc_msgSend(v44, "pathComponents");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");
    v47 = v44;
    if (!objc_msgSend(v44, "hasPrefix:", v82) || v46 < v77)
      PRSArchiverZipData();
    objc_msgSend(v45, "subarrayWithRange:", v77, v46 - v77);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v41;
    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v49, "length"))
      {
        if (v49)
        {
          v50 = objc_retainAutorelease(v49);
          -[NSObject fileSystemRepresentation](v50, "fileSystemRepresentation");
          archive_entry_update_pathname_utf8();
          v51 = 1;
LABEL_85:

          v52 = 0;
          goto LABEL_86;
        }
        v41 = v78;
      }
      else
      {

        v41 = v78;
      }
    }
    archive_entry_update_pathname_utf8();
    if (v41 != 0x4000)
    {
      PRSLogArchiver();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        buf.st_dev = 138412290;
        *(_QWORD *)&buf.st_mode = v82;
        _os_log_error_impl(&dword_1A4996000, v50, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: non-directory archive target path %@.", (uint8_t *)&buf, 0xCu);
      }
      v51 = 0;
      goto LABEL_85;
    }
    v52 = 1;
    v51 = 1;
LABEL_86:

    objc_autoreleasePoolPop(v42);
    if (!v51)
      goto LABEL_119;
    if ((v52 & 1) == 0)
    {
      if (archive_write_header())
      {
        PRSLogArchiver();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          PRSArchiverZipData(v80, v66);
        goto LABEL_118;
      }
      v53 = 0;
      if (v78 != 0x4000 && v78 != 40960)
      {
        v54 = (const char *)archive_entry_sourcepath();
        v55 = open(v54, 0x200000);
        v56 = v83;
        if (v55 < 0)
        {
          PRSLogArchiver();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            PRSArchiverZipData();
          goto LABEL_118;
        }
        while (1)
        {
          v57 = read(v55, v56, v79);
          v53 = v57 != 0;
          if (!v57)
            break;
          if (v57 < 0)
          {
            PRSLogArchiver();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v62 = __error();
              v63 = strerror(*v62);
              buf.st_dev = 67240450;
              *(_DWORD *)&buf.st_mode = v55;
              LOWORD(buf.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)v63;
              _os_log_error_impl(&dword_1A4996000, v58, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: unable to read file data from descriptor %{public}d for header - %{public}s.", (uint8_t *)&buf, 0x12u);
            }
            goto LABEL_100;
          }
          v56 = v83;
          if (archive_write_data() < 0)
          {
            PRSLogArchiver();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              PRSArchiverZipData();
LABEL_100:

            break;
          }
        }
        if (close(v55))
        {
          PRSLogArchiver();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v60 = __error();
            v61 = strerror(*v60);
            buf.st_dev = 67240450;
            *(_DWORD *)&buf.st_mode = v55;
            LOWORD(buf.st_ino) = 2082;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = (__darwin_ino64_t)v61;
            _os_log_error_impl(&dword_1A4996000, v59, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: unable to close file descriptor %{public}d for header (leaking) - %{public}s.", (uint8_t *)&buf, 0x12u);
          }

        }
      }
      if (archive_write_finish_entry())
      {
        PRSLogArchiver();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          PRSArchiverZipData(v80, v66);
LABEL_118:

        goto LABEL_119;
      }
      if (v53)
        goto LABEL_119;
    }
  }
  PRSLogArchiver();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    PRSArchiverZipData();

  objc_autoreleasePoolPop(v42);
LABEL_119:
  v65 = 0;
LABEL_120:
  free(v83);
  if (archive_write_close())
  {
    PRSLogArchiver();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v80, v67);

    v65 = 0;
  }
  if (archive_write_free())
  {
    PRSLogArchiver();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();

    if ((v65 & 1) == 0)
    {
LABEL_134:
      v9 = 0;
      goto LABEL_135;
    }
  }
  else
  {

    if (!v65)
      goto LABEL_134;
  }
  memset(&buf, 0, sizeof(buf));
  if (fstat(v81, &buf))
  {
    PRSLogArchiver();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();
LABEL_133:

    goto LABEL_134;
  }
  if (buf.st_size < 1)
    goto LABEL_134;
  v70 = buf.st_size & ~(buf.st_size >> 63);
  v71 = mmap(0, v70, 1, 2, v81, 0);
  if (v71 == (void *)-1)
  {
    PRSLogArchiver();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();
    goto LABEL_133;
  }
  v72 = v71;
  v73 = objc_alloc(MEMORY[0x1E0C99D50]);
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke;
  v86[3] = &__block_descriptor_48_e12_v24__0_v8Q16l;
  v86[4] = v72;
  v86[5] = v70;
  v9 = (void *)objc_msgSend(v73, "initWithBytesNoCopy:length:deallocator:", v72, v70, v86);
LABEL_135:
  v25 = v81;
  v14 = v75;
  v23 = v76;
  v18 = v84;
  v13 = v74;
LABEL_49:
  if (close(v25))
  {
    PRSLogArchiver();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();

  }
  unlink((const char *)objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation"));
LABEL_54:
  if (archive_read_close())
  {
    PRSLogArchiver();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData(v7, v34);

  }
LABEL_59:

  if (archive_read_free())
  {
    PRSLogArchiver();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      PRSArchiverZipData();

  }
LABEL_64:

  v5 = v3;
LABEL_65:

  return v9;
}

uint64_t ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = munmap(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke_cold_1();
  return result;
}

uint64_t PRSUnarchiverZip(int a1, NSURL *a2)
{
  return PRSUnarchiverZip(a1, a2, 0);
}

uint64_t PRSUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3)
{
  return PRSUnarchiverZip(a1, a2, a3, 0);
}

uint64_t PRSUnarchiverZip(int a1, NSURL *a2, unint64_t a3)
{
  NSURL *v5;
  NSURL *v6;
  uint64_t v7;
  uint64_t Archive;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a2;
  v6 = v5;
  v7 = 0;
  if (a1 < 0 || !v5)
    goto LABEL_17;
  Archive = PRSZipCreateReadArchive();
  if (!Archive)
  {
    v7 = 0;
    goto LABEL_17;
  }
  v9 = Archive;
  NSPageSize();
  if (archive_read_open_fd())
  {
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip(v9, v10);
    v7 = 0;
  }
  else
  {
    v7 = PRSZipUnarchive(v9, v6, a3);
    if (!archive_read_close())
      goto LABEL_13;
    PRSLogArchiver();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip(v9, v10);
  }

LABEL_13:
  if (archive_read_free())
  {
    PRSLogArchiver();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();

  }
LABEL_17:

  return v7;
}

uint64_t PRSZipCreateReadArchive()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  int support_filter_all;
  int v5;
  NSObject *v6;

  v0 = archive_read_new();
  if (!v0)
    return v0;
  if (archive_read_support_format_zip())
  {
    PRSLogArchiver();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      PRSZipCreateReadArchive_cold_3(v0, v1);

LABEL_6:
    if (archive_read_free())
    {
      PRSLogArchiver();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        PRSUnarchiverZip();

    }
    return 0;
  }
  support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20)
  {
    v5 = support_filter_all;
    if (support_filter_all)
    {
      PRSLogArchiver();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        PRSZipCreateReadArchive_cold_2(v0, v6);

      if (v5)
        goto LABEL_6;
    }
  }
  return v0;
}

uint64_t PRSZipUnarchive(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v18;
  __int128 v19;
  char *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  int next_header;
  int v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  int data_block;
  NSObject *v39;
  size_t v40;
  NSObject *v41;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v47;
  NSObject *v48;
  __int128 v49;
  id v50[3];
  _BYTE buf[12];
  __int16 v52;
  size_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    PRSLogArchiver();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      PRSZipUnarchive_cold_16();
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x1E0CB2AA8];
  v55[0] = &unk_1E4D53320;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = 0;
  v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 0, v7, v50);
  v9 = v50[0];

  if ((v8 & 1) != 0)
    goto LABEL_5;
  -[NSObject domain](v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_12;
  }
  v11 = -[NSObject code](v9, "code");

  if (v11 != 516)
  {
LABEL_12:
    PRSLogArchiver();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      PRSZipUnarchive_cold_15();

    goto LABEL_21;
  }
LABEL_5:

  v12 = archive_write_disk_new();
  if (!v12)
    goto LABEL_24;
  v13 = v12;
  if (archive_write_disk_set_standard_lookup())
  {
    PRSLogArchiver();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      PRSZipUnarchive_cold_14(v13, v14);
  }
  else
  {
    if (!archive_write_disk_set_options())
    {
      objc_msgSend(v5, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v9 = objc_retainAutorelease(v18);
        v20 = realpath_DARWIN_EXTSN((const char *)-[NSObject fileSystemRepresentation](v9, "fileSystemRepresentation"), 0);
        if (v20)
        {
          v21 = v20;
          v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v20);

          free(v21);
          v9 = v22;
        }
        else
        {
          PRSLogArchiver();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            PRSZipUnarchive_cold_11((uint64_t)v9, v23);

        }
      }
      else
      {
        v9 = 0;
      }
      *(_QWORD *)&v19 = 134218240;
      v49 = v19;
      while (1)
      {
        next_header = archive_read_next_header();
        if (next_header)
        {
          if (next_header == 1)
          {
            v16 = 1;
            goto LABEL_82;
          }
          PRSLogArchiver();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            PRSZipUnarchive_cold_3(a1, v41);
          goto LABEL_66;
        }
        v25 = archive_entry_filetype();
        v26 = (void *)MEMORY[0x1A85A43E4]();
        v27 = archive_entry_pathname_utf8();
        if (!v27)
          break;
        v28 = (const char *)v27;
        v29 = 0;
        do
          v30 = *(unsigned __int8 *)(v27 + v29++);
        while (v30 == 47);
        v31 = v29 - 1;
        if (v29 != 1)
        {
          PRSLogArchiver();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v40 = strlen(v28);
            *(_DWORD *)buf = v49;
            *(_QWORD *)&buf[4] = v31;
            v52 = 2048;
            v53 = v40;
            _os_log_error_impl(&dword_1A4996000, v32, OS_LOG_TYPE_ERROR, "PRSPosterArchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
          }

        }
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", &v28[v31]);
        v34 = objc_msgSend(v33, "length");
        if (!v34 && v25 != 0x4000)
        {
          PRSLogArchiver();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            PRSZipUnarchive_cold_10();

          goto LABEL_73;
        }
        -[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v33, v49, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_retainAutorelease(v35);
        objc_msgSend(v36, "fileSystemRepresentation");
        archive_entry_update_pathname_utf8();

        objc_autoreleasePoolPop(v26);
        archive_entry_perm();
        archive_entry_set_perm();
        if (v34)
        {
          if (archive_write_header())
          {
            PRSLogArchiver();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              PRSArchiverZipData(v13, v45);
LABEL_80:

            goto LABEL_81;
          }
          v37 = archive_entry_size();
          if (archive_entry_size_is_set())
          {
            if (v37 >= 1)
            {
              if (!a3 || v37 <= a3)
              {
                while (1)
                {
                  v50[2] = 0;
                  *(_QWORD *)buf = 0;
                  v50[1] = 0;
                  data_block = archive_read_data_block();
                  if (data_block)
                    break;
                  if (archive_write_data_block() < 0)
                  {
                    PRSLogArchiver();
                    v41 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                      PRSZipUnarchive_cold_8(v13, v41);
                    goto LABEL_66;
                  }
                }
                if (data_block == 1)
                  goto LABEL_56;
                PRSLogArchiver();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  PRSZipUnarchive_cold_7(a1, v41);
LABEL_66:

                goto LABEL_81;
              }
              PRSLogArchiver();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                PRSZipUnarchive_cold_6();
              goto LABEL_80;
            }
          }
          else
          {
            PRSLogArchiver();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4996000, v39, OS_LOG_TYPE_INFO, "PRSPosterArchiver: not writing archive_entry with unknown size", buf, 2u);
            }

          }
LABEL_56:
          if (archive_write_finish_entry())
          {
            PRSLogArchiver();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              PRSArchiverZipData(v13, v45);
            goto LABEL_80;
          }
        }
      }
      PRSLogArchiver();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        PRSArchiverZipData();

LABEL_73:
      objc_autoreleasePoolPop(v26);
LABEL_81:
      v16 = 0;
LABEL_82:
      if (archive_write_close())
      {
        PRSLogArchiver();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          PRSZipUnarchive_cold_2(v13, v47);

        v16 = 0;
      }
      if (archive_write_free())
      {
        PRSLogArchiver();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          PRSZipUnarchive_cold_1();

      }
      goto LABEL_22;
    }
    PRSLogArchiver();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      PRSZipUnarchive_cold_13(v13, v14);
  }

  if (!archive_write_free())
  {
LABEL_24:
    v16 = 0;
    goto LABEL_23;
  }
  PRSLogArchiver();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    PRSZipUnarchive_cold_1();
LABEL_21:
  v16 = 0;
LABEL_22:

LABEL_23:
  return v16;
}

uint64_t PRSUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3, unint64_t a4)
{
  NSURL *v6;
  NSURL *v7;
  uint64_t v8;
  uint64_t Archive;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (!a1 || !v6)
    goto LABEL_17;
  Archive = PRSZipCreateReadArchive();
  if (!Archive)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v10 = Archive;
  if (archive_read_open_memory())
  {
    PRSLogArchiver();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip(v10, v11);
    v8 = 0;
  }
  else
  {
    v8 = PRSZipUnarchive(v10, v7, a4);
    if (!archive_read_close())
      goto LABEL_13;
    PRSLogArchiver();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip(v10, v11);
  }

LABEL_13:
  if (archive_read_free())
  {
    PRSLogArchiver();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      PRSUnarchiverZip();

  }
LABEL_17:

  return v8;
}

BOOL PRSAppleArchiveDecompressStream(AAByteStream_impl *a1, void *a2)
{
  id v3;
  AAByteStream_impl *v4;
  AAByteStream_impl *v5;
  AAArchiveStream v6;
  AAArchiveStream_impl *v7;
  AAArchiveStream_impl *v8;
  AAArchiveStream_impl *v9;
  ssize_t v10;

  v3 = a2;
  if (a1)
  {
    v4 = AADecompressionInputStreamOpen(a1, 0, 0);
    if (v4)
    {
      v5 = v4;
      v6 = AADecodeArchiveInputStreamOpen(v4, 0, 0, 0, 0);
      if (v6)
      {
        v7 = v6;
        v8 = AAExtractArchiveOutputStreamOpen((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 0, 0, 0, 0);
        if (v8)
        {
          v9 = v8;
          v10 = AAArchiveStreamProcess(v7, v8, 0, 0, 0, 0);
          AAArchiveStreamClose(v9);
        }
        else
        {
          v10 = -1;
        }
        AAArchiveStreamClose(v7);
      }
      else
      {
        v10 = -1;
      }
      AAByteStreamClose(v5);
    }
    else
    {
      v10 = -1;
    }
    AAByteStreamClose(a1);
  }
  else
  {
    v10 = -1;
  }

  return v10 >= 0;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return archive_error_string();
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

char *OUTLINED_FUNCTION_14(int *a1)
{
  return strerror(*a1);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return archive_error_string();
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_19()
{
  return __error();
}

int *OUTLINED_FUNCTION_22()
{
  return __error();
}

id soft_PUIIOSurfaceFromCGImage(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  v10 = getPUIIOSurfaceFromCGImageSymbolLoc_ptr;
  if (!getPUIIOSurfaceFromCGImageSymbolLoc_ptr)
  {
    v5 = (void *)PosterUIFoundationLibrary();
    v4 = dlsym(v5, "PUIIOSurfaceFromCGImage");
    v8[3] = (uint64_t)v4;
    getPUIIOSurfaceFromCGImageSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    soft_PUIIOSurfaceFromCGImage_cold_1();
  ((void (*)(uint64_t, uint64_t))v4)(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1A49A16FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A49A2900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPUIImageEncoderErrorDomain()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  v6 = getPUIImageEncoderErrorDomainSymbolLoc_ptr;
  if (!getPUIImageEncoderErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)PosterUIFoundationLibrary();
    v0 = (id *)dlsym(v1, "PUIImageEncoderErrorDomain");
    v4[3] = (uint64_t)v0;
    getPUIImageEncoderErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getPUIImageEncoderErrorDomain_cold_1();
  return *v0;
}

void sub_1A49A29A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterUIFoundationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4D42810;
    v3 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
    PosterUIFoundationLibrary_cold_1(&v1);
  return PosterUIFoundationLibraryCore_frameworkLibrary;
}

Class __getPUIImageOnDiskFormatClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIImageOnDiskFormat");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPUIImageOnDiskFormatClass_block_invoke_cold_1();
  getPUIImageOnDiskFormatClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id NSStringFromPRSPosterSnapshotOptions(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void *(*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  char v15;

  v2 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __NSStringFromPRSPosterSnapshotOptions_block_invoke;
  v13 = &unk_1E4D42848;
  v3 = v2;
  v14 = v3;
  v4 = &v10;
  if (a1)
  {
    v15 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(uint64_t *))v12)(v4);
          if (v15)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "), v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL PRSPosterSnapshotOptionsIsFloatingLayerOnly(char a1)
{
  return (a1 & 0x38) == 32;
}

BOOL PRSPosterSnapshotOptionsAllowTransparency(char a1)
{
  return (a1 & 0x10) == 0;
}

void sub_1A49AE410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  uint64_t v15;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_1A49AE828(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A49AF9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1A49B0860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49B08D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49B0BAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return objc_opt_class();
}

void sub_1A49B2360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __clientDescription(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = a3;
  v8 = a2;
  v9 = a1;
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend(v9, "pid");

  PRSWallpaperObserverLocationsDescription(a4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v10)
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@:%d:%@:%p %@>"), v10, v12, v8, v7, v13);
  else
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%d:%@:%p %@>"), v12, v8, v7, v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_1A49B259C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A49B4DD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49B54E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id getPRPosterPathUtilitiesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPRPosterPathUtilitiesClass_softClass;
  v7 = getPRPosterPathUtilitiesClass_softClass;
  if (!getPRPosterPathUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRPosterPathUtilitiesClass_block_invoke;
    v3[3] = &unk_1E4D42598;
    v3[4] = &v4;
    __getPRPosterPathUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A49B55DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterPathUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterKitLibrary();
  result = objc_getClass("PRPosterPathUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRPosterPathUtilitiesClass_block_invoke_cold_1();
  getPRPosterPathUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PosterKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4D42CC8;
    v2 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary)
    PosterKitLibrary_cold_1(&v0);
}

Class __getPRPosterMutableConfiguredPropertiesClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterKitLibrary();
  result = objc_getClass("PRPosterMutableConfiguredProperties");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRPosterMutableConfiguredPropertiesClass_block_invoke_cold_1();
  getPRPosterMutableConfiguredPropertiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PRSWallpaperObserverLocationsDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("sl"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("sh"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(v3, "addObject:", CFSTR("al"));
  if ((a1 & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("ah"));
LABEL_6:
  if ((a1 & 0xFFFFFFFFFFFFFFF0) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a1 & 0xFFFFFFFFFFFFFFF0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("none"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL PRSWallpaperObserverLocationsIndexIsValid(unsigned int a1)
{
  return a1 < 4;
}

uint64_t PRSWallpaperObserverLocationsToIndex(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1) & 1) != 0)
    return dword_1A49D71D0[v1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown location (%li)"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    PRSWallpaperObserverLocationsToIndex_cold_1();
  objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRSWallpaperObserverLocationsFromIndex(uint64_t a1)
{
  uint64_t result;
  void *v2;

  if (a1 < 4)
    return qword_1A49D71F0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown index (%i)"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    PRSWallpaperObserverLocationsFromIndex_cold_1();
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRSWallpaperObserverLocationsLockIndexIfHomeIndex(uint64_t a1)
{
  uint64_t result;
  void *v2;

  if (a1 < 4)
    return dword_1A49D7210[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown index (%i)"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    PRSWallpaperObserverLocationsLockIndexIfHomeIndex_cold_1();
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

id PRSDictionaryFromXPCObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD applier[4];
  id v7;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __PRSDictionaryFromXPCObject_block_invoke;
  applier[3] = &unk_1E4D42CE8;
  v7 = v2;
  v3 = v2;
  xpc_dictionary_apply(v1, applier);

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

id PRSXPCDictionaryFromDictionary(void *a1)
{
  id v1;
  xpc_object_t empty;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  const char *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    empty = xpc_dictionary_create_empty();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "keyEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i));
          v9 = (const char *)objc_msgSend(v8, "UTF8String");
          objc_msgSend(v1, "objectForKey:", v8);
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_dictionary_set_string(empty, v9, (const char *)objc_msgSend(v10, "UTF8String"));

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  else
  {
    empty = 0;
  }

  return empty;
}

__CFString *PRSPosterUpdateAmbientWidgetsIdentifiers(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "bs_safeObjectForKey:ofType:", CFSTR("AMUIIconStateKey"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_safeObjectForKey:ofType:", CFSTR("iconLists"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      v13 = v11;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

    }
    if (v10 | v15)
    {
      v38 = (void *)v15;
      v37 = v2;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v36 = v10;
      objc_msgSend((id)v10, "bs_safeObjectForKey:ofType:", CFSTR("elements"), objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(v17);
            v22 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "bs_safeObjectForKey:ofType:", CFSTR("uniqueIdentifier"), objc_opt_class());
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", CFSTR("lead-%@"), v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bs_safeAddObject:", v24);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v19);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v38, "bs_safeObjectForKey:ofType:", CFSTR("elements"), objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v40 != v28)
              objc_enumerationMutation(v25);
            v30 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "bs_safeObjectForKey:ofType:", CFSTR("uniqueIdentifier"), objc_opt_class());
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("trail-%@"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bs_safeAddObject:", v32);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        }
        while (v27);
      }

      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("ambient widget identifiers; %@"), v34);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v2 = v37;
      v10 = v36;
      v15 = (unint64_t)v38;
    }
    else
    {
      v9 = CFSTR("(elements did not return an array; bailing)");
    }

  }
  else
  {
    v9 = CFSTR("(no stacks)");
  }

  return v9;
}

void _validateUserInfo(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v1, "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_self();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v15 = CFSTR("contains non-string key");
          goto LABEL_13;
        }
        objc_msgSend(v1, "objectForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_isKindOfClass();

        if ((v12 & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E0C99DA0];
          v14 = *MEMORY[0x1E0C99778];
          v15 = CFSTR("contains non-string val");
LABEL_13:
          objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, v1);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v16);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

const __CFString *PRSErrorCodeToDebugDescription(uint64_t a1)
{
  if (a1)
    return CFSTR("the 'currentConfiguration' argument was invalid.");
  else
    return CFSTR("Unknown error.");
}

const __CFString *NSStringFromPRSPosterUpdateType(unint64_t a1)
{
  if (a1 > 0xF)
    return CFSTR("(unknown update type)");
  else
    return off_1E4D42D10[a1];
}

id PRSPosterGallerySuggestedComplicationErrorCreateWithCodeAndDescription(void *a1)
{
  id v1;
  void *v2;
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v5, 1, v2);

  return v6;
}

id getkPaperboardIOSurfaceDeviceOrientationPropertiesKey()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr;
  v6 = getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr;
  if (!getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke;
    v2[3] = &unk_1E4D42598;
    v2[4] = &v3;
    __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getkPaperboardIOSurfaceDeviceOrientationPropertiesKey_cold_1();
  return *v0;
}

void sub_1A49C063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E4D42E48;
    v5 = 0;
    PosterUIFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!PosterUIFoundationLibraryCore_frameworkLibrary_0)
    __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)PosterUIFoundationLibraryCore_frameworkLibrary_0, "kPaperboardIOSurfaceDeviceOrientationPropertiesKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t descriptorsForPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_mapNoNulls:", &__block_literal_global_12);
}

id __descriptorsForPath_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[PRSPosterDescriptor _initWithPath:]([PRSPosterDescriptor alloc], "_initWithPath:", v2);

  return v3;
}

uint64_t configurationsForPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_mapNoNulls:", &__block_literal_global_22_0);
}

id __configurationsForPath_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v2);

  return v3;
}

void sub_1A49C1498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A49C15E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t PRSDefaultServiceQuality()
{
  return objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
}

id PRSWallpaperObserverInterface()
{
  if (PRSWallpaperObserverInterface_onceToken != -1)
    dispatch_once(&PRSWallpaperObserverInterface_onceToken, &__block_literal_global_14);
  return (id)PRSWallpaperObserverInterface___interface;
}

id PRSServiceInterface()
{
  if (PRSServiceInterface_onceToken != -1)
    dispatch_once(&PRSServiceInterface_onceToken, &__block_literal_global_59);
  return (id)PRSServiceInterface___interface;
}

void sub_1A49CB968(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49CBCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

Class __getPFPosterConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4D434F8;
    v5 = 0;
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
    __getPFPosterConfigurationClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PFPosterConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPFPosterConfigurationClass_block_invoke_cold_2();
  getPFPosterConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PaperBoardUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PRSPosterConfigurationCacheProvider.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void PRSZipArchiverCompressDirectory_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: data for %@ is nil", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSZipArchiverCompressDirectory_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to write data to url %@", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSZipArchiverCompressDirectory_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to create directory for URL %@", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSUnarchiverZip(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(v3);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_1A4996000, a2, v4, "PRSPosterArchiver: unable to open file %@ - %{public}s.", v5);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to close archive_read - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to open archive_read - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSUnarchiverZip()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15();
  v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A4996000, v1, v2, "PRSPosterArchiver: unable to close file descriptor %{public}d for %@ (leaking) - %{public}s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to open non-file URL %@.", v2);
  OUTLINED_FUNCTION_4_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to free archive_read (leaking) - %p.", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSArchiverZipData()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to free read disk archive (leaking) - %p.", v2);
  OUTLINED_FUNCTION_4_0();
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15();
  v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A4996000, v1, v2, "PRSPosterArchiver: unable to mmap file descriptor %{public}d for %@ - %{public}s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15();
  v0 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_1A4996000, v1, v2, "PRSPosterArchiver: unable to fstat %{public}d for %@ - %{public}s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_13();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to free archive_write (leaking) - %p.", v2);
  OUTLINED_FUNCTION_4_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: archive_entry with no path encountered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

{
  uint64_t *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_17();
  *v1 = 136446210;
  *v0 = v2;
  OUTLINED_FUNCTION_16(&dword_1A4996000, v3, v4, "PRSPosterArchiver: archive_write_data failed - %{public}s.");
  OUTLINED_FUNCTION_23();
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18(&dword_1A4996000, v1, v2, "PRSPosterArchiver: failed to open file for header of type %{public}ud - %{public}s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

{
  __assert_rtn("PRSZipArchive", "PRSPosterArchiver.m", 617, "NO");
}

{
  uint64_t *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_17();
  *v1 = 136446210;
  *v0 = v2;
  OUTLINED_FUNCTION_16(&dword_1A4996000, v3, v4, "PRSPosterArchiver: archive_read_next_header failed - %{public}s.");
  OUTLINED_FUNCTION_23();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_18(&dword_1A4996000, v0, v1, "PRSPosterArchiver: archive_write unable to open file descriptor %{public}d - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "PRSPosterArchiver: failed to create temporary directory at %{public}@ - %@.");
  OUTLINED_FUNCTION_4_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to free archive_read_disk (leaking) - %p.", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSArchiverZipData(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to close read disk archive - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to close archive_write - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_write_finish_entry failed - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_write_header failed - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to set archive_write supported compression formats - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to set archive_write supported formats - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(v3);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_8(&dword_1A4996000, a2, v4, "PRSPosterArchiver: unable to create output file %@ - %{public}s.", v5);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to open read disk archive - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read_disk unable to set reader symlink mode - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read_disk unable to set lookup functions - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void ___Z18PRSArchiverZipDataP5NSURLP13NSFileManager_block_invoke_cold_1()
{
  __assert_rtn("PRSArchiverZipData_block_invoke", "PRSPosterArchiver.m", 794, "NO");
}

void PRSZipCreateReadArchive_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read unable to set supported compression formats - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipCreateReadArchive_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read unable to set supported formats - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to free archive_write_disk (leaking) - %p.", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSZipUnarchive_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: unable to close archive_write_disk - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read_next_header failed - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: archive_entry greater than allowed size of %{public}zu.", v2);
  OUTLINED_FUNCTION_4_0();
}

void PRSZipUnarchive_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_read_data_block failed - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_8(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_write_data_block failed - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: archive_entry with no path after sanitization encountered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void PRSZipUnarchive_cold_11(uint64_t a1, NSObject *a2)
{
  int *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;

  v4 = OUTLINED_FUNCTION_22();
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = OUTLINED_FUNCTION_14(v4);
  OUTLINED_FUNCTION_8(&dword_1A4996000, a2, v5, "PRSPosterArchiver: unable to resolve physical path for destination path %@ - %s.", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_13(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_write_disk unable to set options - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_14(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, a2, v3, "PRSPosterArchiver: archive_write_disk unable to set lookup functions - %{public}s.", v4);
  OUTLINED_FUNCTION_1_1();
}

void PRSZipUnarchive_cold_15()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "PRSPosterArchiver: failed to create directory at %@ - %@.");
  OUTLINED_FUNCTION_4_0();
}

void PRSZipUnarchive_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "PRSPosterArchiver: unable to write to non-file URL %@.", v2);
  OUTLINED_FUNCTION_4_0();
}

void soft_PUIIOSurfaceFromCGImage_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOSurface *soft_PUIIOSurfaceFromCGImage(CGImageRef, BOOL)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 39, CFSTR("%s"), dlerror());

  __break(1u);
}

void getPUIImageEncoderErrorDomain_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPUIImageEncoderErrorDomain(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 38, CFSTR("%s"), dlerror());

  __break(1u);
}

void PosterUIFoundationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterUIFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PBUICodableImage.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPUIImageOnDiskFormatClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPUIImageOnDiskFormatClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PBUICodableImage.m"), 37, CFSTR("Unable to find class %s"), "PUIImageOnDiskFormat");

  __break(1u);
}

void __getPRPosterPathUtilitiesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRPosterPathUtilitiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PRSPosterUpdater.m"), 22, CFSTR("Unable to find class %s"), "PRPosterPathUtilities");

  __break(1u);
}

void PosterKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PRSPosterUpdater.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRPosterMutableConfiguredPropertiesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRPosterMutableConfiguredPropertiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PRSPosterUpdater.m"), 23, CFSTR("Unable to find class %s"), "PRPosterMutableConfiguredProperties");

  __break(1u);
}

void PRSWallpaperObserverLocationsToIndex_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int PRSWallpaperObserverLocationsToIndex(PRSWallpaperObserverLocations)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_3(&dword_1A4996000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_2();
}

void PRSWallpaperObserverLocationsFromIndex_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PRSWallpaperObserverLocations PRSWallpaperObserverLocationsFromIndex(int)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_3(&dword_1A4996000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_2();
}

void PRSWallpaperObserverLocationsLockIndexIfHomeIndex_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int PRSWallpaperObserverLocationsLockIndexIfHomeIndex(int)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_3(&dword_1A4996000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_2();
}

void getkPaperboardIOSurfaceDeviceOrientationPropertiesKey_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkPaperboardIOSurfaceDeviceOrientationPropertiesKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PRSPosterSnapshotCollection.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getkPaperboardIOSurfaceDeviceOrientationPropertiesKeySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterUIFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PRSPosterSnapshotCollection.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPFPosterConfigurationClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosFormatsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PRSExternalSystemService.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPFPosterConfigurationClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;
  AAArchiveStream v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPFPosterConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PRSExternalSystemService.m"), 22, CFSTR("Unable to find class %s"), "PFPosterConfiguration");

  __break(1u);
  AAArchiveStreamClose(v2);
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x1E0DDE370](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1E0DDE378](istream, ostream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1E0DDE3A0](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1E0DDE3B0](s);
}

AAArchiveStream AADecodeArchiveInputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1E0DDE410](stream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAByteStream AADecompressionInputStreamOpen(AAByteStream compressed_stream, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1E0DDE418](compressed_stream, flags, *(_QWORD *)&n_threads);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1E0DDE420](stream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1E0DDE428](dir, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x1E0DDE430](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
  MEMORY[0x1E0DDE438](key_set);
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1E0DDE448](*(_QWORD *)&fd, *(_QWORD *)&automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x1E0DDE450](path, *(_QWORD *)&open_flags, open_mode);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x1E0DDE4B0](dir, path, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
  MEMORY[0x1E0DDE4B8](path_list);
}

uint64_t BSAbsoluteMachTimeNow()
{
  return MEMORY[0x1E0D010C0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSInterfaceOrientationIsPortrait()
{
  return MEMORY[0x1E0D01350]();
}

uint64_t BSSystemSharedDirectoryForIdentifier()
{
  return MEMORY[0x1E0D01628]();
}

uint64_t BSSystemSharedResourcesDirectoryForIdentifier()
{
  return MEMORY[0x1E0D01630]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CGImageCopyJPEGData()
{
  return MEMORY[0x1E0CBC288]();
}

uint64_t CGImageCopySourceData()
{
  return MEMORY[0x1E0CBC290]();
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

uint64_t CGImageGetHash()
{
  return MEMORY[0x1E0CBC370]();
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1E0C9CC68]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F8](isrc);
}

uint64_t CHSWidgetFamilyFromString()
{
  return MEMORY[0x1E0D0FF28]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1E0D0FF30]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1E0CBBB10](aSurface);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBD48](xobj);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF90]();
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x1E0D7F908]();
}

uint64_t PFPosterPathFileAttributes()
{
  return MEMORY[0x1E0D7F918]();
}

uint64_t PFPosterRoleDefaultRoleForCurrentExtensionProcess()
{
  return MEMORY[0x1E0D7F930]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x1E0D7F948]();
}

uint64_t PFTemporaryDirectory()
{
  return MEMORY[0x1E0D7F988]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1E0DE3DC0]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x1E0DE3DE0]();
}

uint64_t archive_entry_perm()
{
  return MEMORY[0x1E0DE3DE8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1E0DE3E20]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1E0DE3E38]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1E0DE3E40]();
}

uint64_t archive_entry_sourcepath()
{
  return MEMORY[0x1E0DE3E48]();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return MEMORY[0x1E0DE3E50]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1E0DE3E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_disk_descend()
{
  return MEMORY[0x1E0DE3EA8]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x1E0DE3EB8]();
}

uint64_t archive_read_disk_open()
{
  return MEMORY[0x1E0DE3EC0]();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3ED0]();
}

uint64_t archive_read_disk_set_symlink_physical()
{
  return MEMORY[0x1E0DE3ED8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_fd()
{
  return MEMORY[0x1E0DE3F20]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1E0DE3F30]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1E0DE3F48]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1E0DE3F90]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1E0DE3FD0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1E0DE3FE0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3FE8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1E0DE3FF8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x1E0DE4020]();
}

uint64_t archive_write_set_format_option()
{
  return MEMORY[0x1E0DE4048]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x1E0DE4068]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

