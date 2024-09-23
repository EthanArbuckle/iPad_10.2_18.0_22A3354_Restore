@implementation _UILibArchiveStreamingExtractor

- (id)initForExtractingArchivePath:(id)a3
{
  id v5;
  _UILibArchiveStreamingExtractor *v6;
  _UILibArchiveStreamingExtractor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILibArchiveStreamingExtractor;
  v6 = -[_UILibArchiveStreamingExtractor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_archivePath, a3);

  return v7;
}

+ (id)archiveSubpathByStandardizingArchiveSubpath:(id)a3
{
  void *v3;
  __CFString *v4;
  uint64_t v6;

  objc_msgSend(a3, "stringByStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    v4 = CFSTR(".");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR(".")) & 1) == 0)
    {
      if (objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
      {
        objc_msgSend(v3, "substringFromIndex:", 1);
        v6 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v6;
      }
      v4 = v3;
      v3 = v4;
    }
  }
  else
  {
    v4 = CFSTR(".");
  }

  return v4;
}

+ (BOOL)shouldExtractPathInArchive:(id)a3 forExtractionRootedAtStandardizedSubpathInArchive:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR(".")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "stringByStandardizingPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v8, "hasPrefix:", v6);
    v5 = v8;
  }

  return v7;
}

- (BOOL)extractArchivePath:(id)a3 toDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  char v70[8];
  char *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  bzero(v70, 0x400uLL);
  v9 = objc_retainAutorelease(v8);
  v10 = a3;
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v9, "fileSystemRepresentation"), v70))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v70);
    v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = v9;
  }

  objc_msgSend((id)objc_opt_class(), "archiveSubpathByStandardizingArchiveSubpath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_UILibArchiveStreamingReader initForReadingArchivePath:]([_UILibArchiveStreamingReader alloc], "initForReadingArchivePath:", self->_archivePath);
  if ((objc_msgSend(v12, "open") & 1) != 0)
  {
    ui_archive_write_disk_new();
    v14 = v13;
    ui_archive_write_disk_set_standard_lookup(v13);
    ui_archive_write_disk_set_options(v14, 772);
    *(_QWORD *)v70 = 0;
    v71 = v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__67;
    v74 = __Block_byref_object_dispose__67;
    v75 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __72___UILibArchiveStreamingExtractor_extractArchivePath_toDirectory_error___block_invoke;
    v45[3] = &unk_1E16C3958;
    v50 = &v58;
    v45[4] = self;
    v16 = v11;
    v46 = v16;
    v51 = &v54;
    v17 = v43;
    v47 = v17;
    v52 = v70;
    v53 = v14;
    v18 = v15;
    v48 = v18;
    v19 = obj;
    v49 = v19;
    v44 = 0;
    objc_msgSend(v12, "readAllItemsWithBlock:error:", v45, &v44);
    v42 = v44;
    ui_archive_write_close(v14);
    ui_archive_write_finish(v14);
    objc_msgSend(v12, "close");
    if (*((_QWORD *)v71 + 5))
      goto LABEL_17;
    v20 = v59[3];
    if (v20)
    {
      if (v55[3])
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No items found at requested subpath %@ in archive %@"), v16, self->_archivePath);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v66 = *MEMORY[0x1E0CB2D50];
        v67 = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("_UIArchiveExtractorErrorDomain"), -1, v38);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)*((_QWORD *)v71 + 5);
        *((_QWORD *)v71 + 5) = v39;

        v20 = *((_QWORD *)v71 + 5);
        if (v20)
          goto LABEL_15;
      }
    }
    if (v42)
    {
      v21 = _MergedGlobals_1013;
      if (!_MergedGlobals_1013)
      {
        v21 = __UILogCategoryGetNode("DocumentInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&_MergedGlobals_1013);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v42;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "encountered reading error: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Extractor encountered error reading source archive %@"), self->_archivePath);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v62[0] = *MEMORY[0x1E0CB3388];
      v62[1] = v25;
      v63[0] = v42;
      v63[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("_UIArchiveExtractorErrorDomain"), -1, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)*((_QWORD *)v71 + 5);
      *((_QWORD *)v71 + 5) = v27;

      v20 = *((_QWORD *)v71 + 5);
    }
LABEL_15:
    if (!v20)
    {
      objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, obj);
      if (!*((_QWORD *)v71 + 5))
      {
LABEL_23:
        _UIAppleDoubleMergeAppleDoubleItemsIntoRealFiles(v18, v17);
        LOBYTE(a5) = *((_QWORD *)v71 + 5) == 0;

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v58, 8);

        _Block_object_dispose(v70, 8);
        goto LABEL_26;
      }
    }
LABEL_17:
    v29 = qword_1ECD7D6F0;
    if (!qword_1ECD7D6F0)
    {
      v29 = __UILogCategoryGetNode("DocumentInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v29, (unint64_t *)&qword_1ECD7D6F0);
    }
    v30 = *(NSObject **)(v29 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)*((_QWORD *)v71 + 5);
      *(_DWORD *)buf = 138412290;
      v65 = v31;
      _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "encountered writing error: %@", buf, 0xCu);
    }
    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v71 + 5));
    goto LABEL_23;
  }
  if (a5)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open source archive %@ for extracting"), self->_archivePath);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("_UIArchiveExtractorErrorDomain"), -1, v34);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
LABEL_26:

  return (char)a5;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (NSArray)extractedContentAbsolutePaths
{
  return self->_extractedContentAbsolutePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
}

@end
