@implementation PFAppleArchive

- (BOOL)openForWriting:(id *)a3
{
  _BOOL4 v5;
  AAArchiveStream_impl *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_archiveStream)
    _PFAssertFailHandler();
  v11.receiver = self;
  v11.super_class = (Class)PFAppleArchive;
  v5 = -[PFAppleArchiveStream openForWriting:](&v11, sel_openForWriting_);
  if (v5)
  {
    v6 = AAEncodeArchiveOutputStreamOpen(-[PFAppleArchiveStream _byteStreamToBeTargetedByArchiveEncodingStream](self, "_byteStreamToBeTargetedByArchiveEncodingStream"), 0, 0, 0, 0);
    self->_archiveStream = v6;
    LOBYTE(v5) = v6 != 0;
    if (a3)
    {
      if (!v6)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open archive stream"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (BOOL)openForReading:(id *)a3
{
  _BOOL4 v5;
  AAArchiveStream_impl *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_archiveStream)
    _PFAssertFailHandler();
  v11.receiver = self;
  v11.super_class = (Class)PFAppleArchive;
  v5 = -[PFAppleArchiveStream openForReading:](&v11, sel_openForReading_);
  if (v5)
  {
    v6 = AADecodeArchiveInputStreamOpen(-[PFAppleArchiveStream _byteStreamToBeReadByArchiveDecodingStream](self, "_byteStreamToBeReadByArchiveDecodingStream"), 0, 0, 0, 0);
    self->_archiveStream = v6;
    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open archive stream"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)encodeData:(id)a3 filename:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  AAHeader_impl *v11;
  AAHeader_impl *v12;
  AAFieldKey v13;
  int v14;
  const char *v15;
  size_t v16;
  AAFieldKey v17;
  int v18;
  uint64_t v19;
  AAFieldKey v20;
  int v21;
  int v22;
  AAArchiveStream_impl *archiveStream;
  id v24;
  const void *v25;
  size_t v26;
  AAFieldKey v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void **v37;
  uint64_t *v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
    goto LABEL_28;
  v10 = v9;
  if (!v9)
    goto LABEL_29;
  if (!self->_archiveStream || !self->super._outputStream)
  {
    _PFAssertFailHandler();
LABEL_28:
    _PFAssertFailHandler();
LABEL_29:
    _PFAssertFailHandler();
  }
  v11 = AAHeaderCreate();
  v12 = v11;
  if (!v11)
  {
    if (!a5)
      goto LABEL_26;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to create header"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v29;
    v33 = 8;
LABEL_25:
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v33, v31);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
    goto LABEL_26;
  }
  v13.ikey = 5265748;
  v14 = AAHeaderSetFieldUInt(v11, 0xFFFFFFFF, v13, 0x46uLL);
  if (v14 < 0)
  {
    if (!a5)
      goto LABEL_26;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v14;
    v48 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to set 'TYP' header field"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v30;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = &v49;
    v38 = &v48;
    goto LABEL_24;
  }
  v15 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
  v16 = strlen(v15);
  v17.ikey = 5521744;
  v18 = AAHeaderSetFieldString(v12, 0xFFFFFFFF, v17, v15, v16);
  if (v18 < 0)
  {
    if (!a5)
      goto LABEL_26;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v18;
    v46 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to set 'PAT' header field"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v30;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = &v47;
    v38 = &v46;
    goto LABEL_24;
  }
  v19 = objc_msgSend(v8, "length");
  v20.ikey = 5521732;
  v21 = AAHeaderSetFieldBlob(v12, 0xFFFFFFFF, v20, v19);
  if (v21 < 0)
  {
    if (!a5)
      goto LABEL_26;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v21;
    v44 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to set 'DAT' header field"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v30;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = &v45;
    v38 = &v44;
    goto LABEL_24;
  }
  v22 = AAArchiveStreamWriteHeader(self->_archiveStream, v12);
  if (v22 < 0)
  {
    if (!a5)
      goto LABEL_26;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v22;
    v42 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to write header"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v30;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = &v43;
    v38 = &v42;
    goto LABEL_24;
  }
  archiveStream = self->_archiveStream;
  v24 = objc_retainAutorelease(v8);
  v25 = (const void *)objc_msgSend(v24, "bytes");
  v26 = objc_msgSend(v24, "length");
  v27.ikey = 5521732;
  v28 = AAArchiveStreamWriteBlob(archiveStream, v27, v25, v26);
  if (v28 < 0)
  {
    if (!a5)
      goto LABEL_26;
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = v28;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to write 'DAT' blob"), *MEMORY[0x1E0CB2938]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v30;
    v36 = (void *)MEMORY[0x1E0C99D80];
    v37 = &v41;
    v38 = &v40;
LABEL_24:
    objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v34;
    v33 = v35;
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_26:
  AAHeaderDestroy(v12);

  return (char)a5;
}

- (BOOL)encodeContentOfDirectoryAtURL:(id)a3 entryPredicate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t (*v13)(uint64_t, uint64_t, const char *);
  PFAppleArchive **v14;
  AAPathList_impl *v15;
  AAFieldKeySet_impl *v16;
  int v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int *v34;
  void *v35;
  void *v36;
  PFAppleArchive *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!self->_archiveStream || !self->super._outputStream)
    _PFAssertFailHandler();
  v10 = v9;
  v38 = self;
  v39 = (id)MEMORY[0x1A1B0CFA4](v10);
  v40 = v8;
  v11 = objc_retainAutorelease(v40);
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  if (v10)
    v13 = PFAppleArchiveEntryMessageProc;
  else
    v13 = 0;
  if (v10)
    v14 = &v38;
  else
    v14 = 0;
  v15 = AAPathListCreateWithDirectoryContents(v12, 0, v14, (AAEntryMessageProc)v13, 0, 0);
  if (v15)
  {
    v16 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,ACL");
    if (v16)
    {
      v17 = AAArchiveStreamWritePathList(self->_archiveStream, v15, v16, (const char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"), 0, 0, 0, 0);
      v18 = v17 == 0;
      if (a5 && v17)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v45 = *MEMORY[0x1E0CB2938];
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = *__error();
        v22 = __error();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to create the archive for the directory contents. Error [%d]: %s"), v21, strerror(*v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v24);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      AAFieldKeySetDestroy(v16);
    }
    else
    {
      if (a5)
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2938];
        v32 = (void *)MEMORY[0x1E0CB3940];
        v33 = *__error();
        v34 = __error();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("Failed to create the field key set for directory contents. Error [%d]: %s"), v33, strerror(*v34));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v36);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
    }
    AAPathListDestroy(v15);
  }
  else
  {
    if (a5)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2938];
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = *__error();
      v28 = __error();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("Failed to create the path list for directory contents. Error [%d]: %s"), v27, strerror(*v28));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)decodeContentOfDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  AAArchiveStream_impl *v8;
  ssize_t v9;
  ssize_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[PFAppleArchiveStream archiveURL](self, "archiveURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = AAExtractArchiveOutputStreamOpen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0, 0, 0, 0);
  v9 = AAArchiveStreamProcess(self->_archiveStream, v8, 0, 0, 0, 0);
  v10 = v9;
  if (a3 && v9 < 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = *__error();
    v14 = __error();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to decode directory content archive. Error [%d]: %s"), v13, strerror(*v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v8 && AAArchiveStreamClose(v8))
  {
    if (a3)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2938];
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = *__error();
      v20 = __error();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to close directory content outStream. Error [%d]: %s"), v19, strerror(*v20));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a3) = 0;
    }
  }
  else
  {
    LOBYTE(a3) = v10 >= 0;
  }

  return (char)a3;
}

- (BOOL)decodeData:(id *)a3 filename:(id *)a4 error:(id *)a5
{
  AAArchiveStream_impl *archiveStream;
  int v10;
  AAHeader_impl *v11;
  AAFieldKey v12;
  uint32_t KeyIndex;
  unsigned int FieldUInt;
  int v15;
  AAHeader_impl *v16;
  AAFieldKey v17;
  uint32_t v18;
  unsigned int FieldString;
  int v20;
  id v21;
  void *v22;
  AAHeader_impl *v23;
  size_t v24;
  id v25;
  char *v26;
  AAFieldKey v27;
  uint32_t v28;
  unsigned int v29;
  int v30;
  id v31;
  id v32;
  uint64_t v33;
  AAHeader_impl *v34;
  AAFieldKey v35;
  uint32_t v36;
  unsigned int FieldBlob;
  int v38;
  id v39;
  void *v40;
  AAArchiveStream_impl *v41;
  id v42;
  void *v43;
  size_t v44;
  AAFieldKey v45;
  int Blob;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void **v55;
  uint64_t *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t offset;
  uint64_t size;
  size_t length;
  uint64_t value;
  AAHeader header;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
LABEL_59:
    _PFAssertFailHandler();
  archiveStream = self->_archiveStream;
  if (!archiveStream || !self->super._inputStream)
  {
    _PFAssertFailHandler();
    goto LABEL_59;
  }
  header = 0;
  v10 = AAArchiveStreamReadHeader(archiveStream, &header);
  if (v10 < 0)
  {
    if (!a5)
      goto LABEL_51;
    v51 = (void *)MEMORY[0x1E0CB35C8];
    v52 = v10;
    v88 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to read header"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v53;
    v54 = (void *)MEMORY[0x1E0C99D80];
    v55 = (void **)v89;
    v56 = &v88;
LABEL_39:
    objc_msgSend(v54, "dictionaryWithObjects:forKeys:count:", v55, v56, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v52, v62);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
    v42 = 0;
    goto LABEL_44;
  }
  if (!v10)
  {
    if (!a5)
      goto LABEL_51;
    v57 = (void *)MEMORY[0x1E0CB35C8];
    v86 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Reached end of archive"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v57;
    v61 = 9;
LABEL_42:
    objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v61, v59);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }
  value = 0;
  v11 = header;
  v12.ikey = 5265748;
  KeyIndex = AAHeaderGetKeyIndex(header, v12);
  if ((KeyIndex & 0x80000000) != 0)
  {
    v15 = 0;
LABEL_37:
    if (!a5)
      goto LABEL_51;
    v51 = (void *)MEMORY[0x1E0CB35C8];
    v52 = v15;
    v84 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Missing 'TYP' header field"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v53;
    v54 = (void *)MEMORY[0x1E0C99D80];
    v55 = &v85;
    v56 = &v84;
    goto LABEL_39;
  }
  FieldUInt = AAHeaderGetFieldUInt(v11, KeyIndex, &value);
  if (FieldUInt <= 1)
    v15 = 1;
  else
    v15 = FieldUInt;
  if (FieldUInt >= 2)
    goto LABEL_37;
  if (value != 70)
  {
    if (!a5)
      goto LABEL_51;
    v63 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Expected 'REG' entry type"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v63;
    v61 = 1;
    goto LABEL_42;
  }
  if (!a4)
    goto LABEL_24;
  length = 0;
  v16 = header;
  v17.ikey = 5521744;
  v18 = AAHeaderGetKeyIndex(header, v17);
  if ((v18 & 0x80000000) != 0)
  {
    v20 = 0;
LABEL_46:
    if (!a5)
      goto LABEL_43;
    v51 = (void *)MEMORY[0x1E0CB35C8];
    v52 = v20;
    v80 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Missing 'PAT' header field"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v53;
    v54 = (void *)MEMORY[0x1E0C99D80];
    v55 = &v81;
    v56 = &v80;
    goto LABEL_39;
  }
  FieldString = AAHeaderGetFieldString(v16, v18, 0, 0, &length);
  if (FieldString <= 1)
    v20 = 1;
  else
    v20 = FieldString;
  if (FieldString >= 2)
    goto LABEL_46;
  v21 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v22 = (void *)objc_msgSend(v21, "initWithLength:", length + 1);
  v23 = header;
  v24 = length;
  v25 = objc_retainAutorelease(v22);
  v26 = (char *)objc_msgSend(v25, "mutableBytes");
  v27.ikey = 5521744;
  v28 = AAHeaderGetKeyIndex(v23, v27);
  if ((v28 & 0x80000000) != 0)
  {
    v30 = 0;
LABEL_54:
    if (a5)
    {
      v65 = (void *)MEMORY[0x1E0CB35C8];
      v66 = v30;
      v78 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to read 'PAT' string"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v67;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v66, v68);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_43;
  }
  v29 = AAHeaderGetFieldString(v23, v28, v24 + 1, v26, 0);
  if (v29 <= 1)
    v30 = 1;
  else
    v30 = v29;
  if (v29 >= 2)
    goto LABEL_54;
  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  v32 = objc_retainAutorelease(v25);
  v33 = objc_msgSend(v32, "bytes");
  *a4 = (id)objc_msgSend(v31, "initWithBytes:length:encoding:", v33, length, 4);

LABEL_24:
  offset = 0;
  size = 0;
  v34 = header;
  v35.ikey = 5521732;
  v36 = AAHeaderGetKeyIndex(header, v35);
  if ((v36 & 0x80000000) != 0)
  {
    v38 = 0;
    goto LABEL_49;
  }
  FieldBlob = AAHeaderGetFieldBlob(v34, v36, &size, &offset);
  if (FieldBlob <= 1)
    v38 = 1;
  else
    v38 = FieldBlob;
  if (FieldBlob >= 2)
  {
LABEL_49:
    if (a5)
    {
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v52 = v38;
      v76 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Missing 'DAT' header field"), offset);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v53;
      v54 = (void *)MEMORY[0x1E0C99D80];
      v55 = &v77;
      v56 = &v76;
      goto LABEL_39;
    }
LABEL_51:
    v42 = 0;
    goto LABEL_52;
  }
  v39 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v40 = (void *)objc_msgSend(v39, "initWithLength:", size);
  v41 = self->_archiveStream;
  v42 = objc_retainAutorelease(v40);
  v43 = (void *)objc_msgSend(v42, "mutableBytes");
  v44 = objc_msgSend(v42, "length");
  v45.ikey = 5521732;
  Blob = AAArchiveStreamReadBlob(v41, v45, v43, v44);
  if (!Blob)
  {
    v42 = objc_retainAutorelease(v42);
    *a3 = v42;
    LOBYTE(a5) = 1;
    goto LABEL_52;
  }
  if (a5)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = Blob;
    v74 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to read 'DAT' blob"), offset);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v48, v50);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_44:
    LOBYTE(a5) = 0;
  }
LABEL_52:
  AAHeaderDestroy(header);

  return (char)a5;
}

- (BOOL)close:(id *)a3
{
  AAArchiveStream_impl *archiveStream;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  archiveStream = self->_archiveStream;
  if (!archiveStream)
    _PFAssertFailHandler();
  v6 = AAArchiveStreamClose(archiveStream);
  if (v6)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = v6;
      v13 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to close archive stream"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v8, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    self->_archiveStream = 0;
    v12.receiver = self;
    v12.super_class = (Class)PFAppleArchive;
    return -[PFAppleArchiveStream close:](&v12, sel_close_, a3);
  }
}

- (void)dealloc
{
  AAArchiveStream_impl *archiveStream;
  objc_super v4;

  archiveStream = self->_archiveStream;
  if (archiveStream)
  {
    AAArchiveStreamCancel(archiveStream);
    AAArchiveStreamClose(self->_archiveStream);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFAppleArchive;
  -[PFAppleArchiveStream dealloc](&v4, sel_dealloc);
}

@end
