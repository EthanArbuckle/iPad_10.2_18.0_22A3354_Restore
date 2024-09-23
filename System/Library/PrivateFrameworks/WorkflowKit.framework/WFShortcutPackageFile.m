@implementation WFShortcutPackageFile

- (NSString)fileName
{
  void *v2;
  void *v3;

  -[WFShortcutPackageFile sanitizedName](self, "sanitizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("shortcut"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)directoryName
{
  void *v2;
  void *v3;

  -[WFShortcutPackageFile sanitizedName](self, "sanitizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathExtension:", CFSTR("shortcuts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sanitizedName
{
  NSString *sanitizedName;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  sanitizedName = self->_sanitizedName;
  if (!sanitizedName)
  {
    -[WFShortcutPackageFile shortcutName](self, "shortcutName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "rangeOfString:options:", CFSTR("^[\\.](?=.*)"), 1024) && v5)
    {
      objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("_"), 0, 0, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E7AFA810);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_sanitizedName;
    self->_sanitizedName = v8;

    sanitizedName = self->_sanitizedName;
  }
  return sanitizedName;
}

- (WFShortcutPackageFile)initWithShortcutData:(id)a3 shortcutName:(id)a4
{
  id v7;
  id v8;
  WFShortcutPackageFile *v9;
  WFShortcutPackageFile *v10;
  WFShortcutPackageFile *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  v9 = -[WFShortcutPackageFile init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shortcutData, a3);
    objc_storeStrong((id *)&v10->_shortcutName, a4);
    -[WFShortcutPackageFile commonInit](v10, "commonInit");
    v11 = v10;
  }

  return v10;
}

- (WFShortcutPackageFile)initWithSignedShortcutData:(id)a3 shortcutName:(id)a4
{
  id v7;
  id v8;
  WFShortcutPackageFile *v9;
  WFShortcutPackageFile *v10;
  WFShortcutPackageFile *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  v9 = -[WFShortcutPackageFile init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signedShortcutData, a3);
    objc_storeStrong((id *)&v10->_shortcutName, a4);
    -[WFShortcutPackageFile commonInit](v10, "commonInit");
    v11 = v10;
  }

  return v10;
}

- (WFShortcutPackageFile)initWithSignedShortcutFileURL:(id)a3
{
  id v5;
  WFShortcutPackageFile *v6;
  WFShortcutPackageFile *v7;
  void *v8;
  uint64_t v9;
  NSString *shortcutName;
  WFShortcutPackageFile *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutPackageFile;
  v6 = -[WFShortcutPackageFile init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signedShortcutFileURL, a3);
    objc_msgSend(v5, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = objc_claimAutoreleasedReturnValue();
    shortcutName = v7->_shortcutName;
    v7->_shortcutName = (NSString *)v9;

    -[WFShortcutPackageFile commonInit](v7, "commonInit");
    v11 = v7;
  }

  return v7;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  NSURL *v6;
  NSURL *temporaryWorkingDirectoryURL;
  NSFileManager *v8;
  NSFileManager *fileManager;
  void *v10;
  void *v11;
  id v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *executionQueue;
  id v15;

  v3 = (void *)MEMORY[0x1E0D140A0];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createTemporaryDirectoryWithFilename:", v5);
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  temporaryWorkingDirectoryURL = self->_temporaryWorkingDirectoryURL;
  self->_temporaryWorkingDirectoryURL = v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (NSFileManager *)objc_claimAutoreleasedReturnValue();
  fileManager = self->_fileManager;
  self->_fileManager = v8;

  -[WFShortcutPackageFile fileManager](self, "fileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutPackageFile temporaryWorkingDirectoryURL](self, "temporaryWorkingDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 0, 0, &v15);
  v12 = v15;

  v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.shorcut-package-file.execution-queue", 0);
  executionQueue = self->_executionQueue;
  self->_executionQueue = v13;

}

- (id)extractShortcutFileRepresentationWithError:(id *)a3
{
  return -[WFShortcutPackageFile extractShortcutFileRepresentationWithSigningMethod:error:](self, "extractShortcutFileRepresentationWithSigningMethod:error:", 0, a3);
}

- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 error:(id *)a4
{
  return -[WFShortcutPackageFile extractShortcutFileRepresentationWithSigningMethod:iCloudIdentifier:error:](self, "extractShortcutFileRepresentationWithSigningMethod:iCloudIdentifier:error:", a3, 0, a4);
}

- (id)extractShortcutFileRepresentationWithSigningMethod:(int64_t *)a3 iCloudIdentifier:(id *)a4 error:(id *)a5
{
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  intptr_t v12;
  BOOL v13;
  int v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v9 = dispatch_semaphore_create(0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18056;
  v43 = __Block_byref_object_dispose__18057;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__18056;
  v37 = __Block_byref_object_dispose__18057;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18056;
  v31 = __Block_byref_object_dispose__18057;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__WFShortcutPackageFile_extractShortcutFileRepresentationWithSigningMethod_iCloudIdentifier_error___block_invoke;
  v17[3] = &unk_1E7AEE4F8;
  v19 = &v39;
  v20 = &v33;
  v21 = &v23;
  v22 = &v27;
  v10 = v9;
  v18 = v10;
  -[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:](self, "preformShortcutDataExtractionWithCompletion:", v17);
  v11 = dispatch_time(0, 30000000000);
  v12 = dispatch_semaphore_wait(v10, v11);
  if (v40[5])
    v13 = v12 == 0;
  else
    v13 = 0;
  v14 = !v13;
  if (a5 && v14)
    *a5 = objc_retainAutorelease((id)v34[5]);
  if (a3)
    *a3 = v24[3];
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  v15 = (id)v40[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v15;
}

- (void)extractShortcutFileRepresentationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFShortcutPackageFile executionQueue](self, "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WFShortcutPackageFile_extractShortcutFileRepresentationWithCompletion___block_invoke;
  v7[3] = &unk_1E7AF76F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)preformShortcutDataExtractionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  AAByteStream_impl *v11;
  AEAContext_impl *v12;
  AEAContext_impl *v13;
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  WFShortcutPackageFile *v22;
  id v23;
  AEAContext_impl *v24;
  AAByteStream_impl *v25;
  _BYTE buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFSecurityLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Extracting Signed Shortcut Data", buf, 0xCu);
  }

  -[WFShortcutPackageFile signedShortcutData](self, "signedShortcutData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[WFShortcutPackageFile signedShortcutFileURL](self, "signedShortcutFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  -[WFShortcutPackageFile signedShortcutData](self, "signedShortcutData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFShortcutPackageFile signedShortcutData](self, "signedShortcutData");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "bytes");
    -[WFShortcutPackageFile signedShortcutData](self, "signedShortcutData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "length");
    v11 = (AAByteStream_impl *)AAMemoryInputStreamOpen();

  }
  else
  {
    -[WFShortcutPackageFile signedShortcutFileURL](self, "signedShortcutFileURL");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0, 0x1A4u);
  }

  if (!v11 || (v12 = AEAContextCreateWithEncryptedStream(v11)) == 0)
  {
    WFShortcutPackageFileInvalidShortcutFileError();
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v17 = (void *)v16;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v4 + 2))(v4, 0, 0, 0, v16);

    goto LABEL_20;
  }
  v13 = v12;
  *(_QWORD *)buf = 0;
  if (!AEAContextGetFieldBlob(v12, 5u, 0, 0, 0, (size_t *)buf) && *(_QWORD *)buf)
  {
    v14 = (uint8_t *)malloc_type_malloc(*(size_t *)buf, 0x1DD451A4uLL);
    if (!AEAContextGetFieldBlob(v13, 5u, 0, *(size_t *)buf, v14, 0))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v14, *(_QWORD *)buf);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFShortcutSigningContext contextWithAuthData:](WFShortcutSigningContext, "contextWithAuthData:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke;
        v20[3] = &unk_1E7AEE520;
        v23 = v4;
        v21 = v18;
        v22 = self;
        v24 = v13;
        v25 = v11;
        objc_msgSend(v21, "validateWithCompletion:", v20);

        v19 = v23;
      }
      else
      {
        WFShortcutPackageFileInvalidShortcutFileError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v19);
      }

      goto LABEL_16;
    }
    free(v14);
  }
  WFShortcutPackageFileInvalidShortcutFileError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, 0, v15);
LABEL_16:

LABEL_20:
}

- (id)generateSignedShortcutFileRepresentationWithPrivateKey:(__SecKey *)a3 signingContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AEAContext v12;
  AEAContext_impl *v13;
  void (**v14)(_QWORD);
  void *v15;
  CFDataRef v16;
  const __CFData *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  AAFieldKeySet v25;
  AAFieldKeySet_impl *v26;
  id v27;
  AAPathList v28;
  AAPathList_impl *v29;
  AAArchiveStream_impl *v30;
  AAArchiveStream_impl *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v36)(_QWORD);
  AAByteStream_impl *s;
  void (**v38)(_QWORD);
  AAByteStream_impl *stream;
  id v40;
  CFDataRef v41;
  _QWORD v42[5];
  _QWORD v43[5];
  CFErrorRef error;
  _QWORD aBlock[5];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "generateAuthData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[WFShortcutPackageFile temporaryWorkingDirectoryURL](self, "temporaryWorkingDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShortcutPackageFile generateDirectoryStructureInDirectory:error:](self, "generateDirectoryStructureInDirectory:error:", v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_11;
    v12 = AEAContextCreateWithProfile(0);
    if (v12)
    {
      v13 = v12;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v12;
      v14 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (AEAContextSetFieldUInt(v13, 3u, 0x801uLL))
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_40;
      }
      error = 0;
      v16 = SecKeyCopyExternalRepresentation(a3, &error);
      v41 = v16;
      if (!v16)
      {
        if (a5)
        {
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v46[0] = *MEMORY[0x1E0CB2D50];
          WFLocalizedString(CFSTR("Failed to sign shortcut"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46[1] = *MEMORY[0x1E0CB3388];
          v47[0] = v19;
          v47[1] = error;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 4, v20);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_20;
      }
      v17 = objc_retainAutorelease(v16);
      if (AEAContextSetFieldBlob(v13, 8u, 1u, (const uint8_t *)-[__CFData bytes](v17, "bytes"), -[__CFData length](v17, "length")))
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:

LABEL_40:
          v14[2](v14);

          goto LABEL_41;
        }
LABEL_20:
        v15 = 0;
        goto LABEL_39;
      }
      v21 = objc_retainAutorelease(v9);
      AEAContextSetFieldBlob(v13, 5u, 0, (const uint8_t *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
      -[WFShortcutPackageFile temporaryWorkingDirectoryURL](self, "temporaryWorkingDirectoryURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFShortcutPackageFile fileName](self, "fileName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLByAppendingPathComponent:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_retainAutorelease(v24);
      s = AAFileStreamOpenWithPath((const char *)objc_msgSend(v40, "fileSystemRepresentation"), 514, 0x1A4u);
      stream = AEAEncryptionOutputStreamOpen(s, v13, 0, 0);
      v25 = AAFieldKeySetCreateWithString("TYP,PAT,LNK,DEV,DAT,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
      v26 = v25;
      if (!v25)
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_38;
      }
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_2;
      v43[3] = &__block_descriptor_40_e5_v8__0l;
      v43[4] = v25;
      v38 = (void (**)(_QWORD))_Block_copy(v43);
      v27 = objc_retainAutorelease(v11);
      v28 = AAPathListCreateWithDirectoryContents((const char *)objc_msgSend(v27, "fileSystemRepresentation"), 0, 0, 0, 0, 0);
      v29 = v28;
      if (!v28)
      {
        if (a5)
        {
          WFShortcutPackageFileFailedToSignShortcutFileError();
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_37;
      }
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_3;
      v42[3] = &__block_descriptor_40_e5_v8__0l;
      v42[4] = v28;
      v36 = (void (**)(_QWORD))_Block_copy(v42);
      v30 = AAEncodeArchiveOutputStreamOpen(stream, 0, 0, 0, 0);
      if (v30)
      {
        v31 = v30;
        if (!AAArchiveStreamWritePathList(v30, v29, v26, (const char *)objc_msgSend(objc_retainAutorelease(v27), "fileSystemRepresentation"), 0, 0, 0, 0))
        {
          AAArchiveStreamClose(v31);
          AAByteStreamClose(stream);
          AAByteStreamClose(s);
          v32 = (void *)MEMORY[0x1E0D13F78];
          -[WFShortcutPackageFile sanitizedName](self, "sanitizedName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "fileWithURL:options:ofType:proposedFilename:", v40, 3, 0, v33);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFShortcutPackageFile fileManager](self, "fileManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeItemAtURL:error:", v40, 0);

          goto LABEL_36;
        }
        if (a5)
          goto LABEL_32;
      }
      else if (a5)
      {
LABEL_32:
        WFShortcutPackageFileFailedToSignShortcutFileError();
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
        v36[2](v36);

LABEL_37:
        v38[2](v38);

LABEL_38:
        goto LABEL_39;
      }
      v15 = 0;
      goto LABEL_36;
    }
    if (a5)
    {
      WFShortcutPackageFileFailedToSignShortcutFileError();
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_11:
      v15 = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
  if (a5)
  {
    WFShortcutPackageFileInvalidShortcutFileError();
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_42:

  return v15;
}

- (id)generateSignedShortcutFileRepresentationWithAccount:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  SecKeyRef RandomKey;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFSecurityLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Generating Signed Shortcut Data with AppleID information", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6A50], *MEMORY[0x1E0CD6A38]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7B8B368, *MEMORY[0x1E0CD6A20]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD69D8]);
  RandomKey = SecKeyCreateRandomKey((CFDictionaryRef)v8, 0);
  +[WFShortcutSigningContext contextWithAppleIDAccount:signingKey:](WFShortcutSigningContext, "contextWithAppleIDAccount:signingKey:", v6, RandomKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  -[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithPrivateKey:signingContext:error:](self, "generateSignedShortcutFileRepresentationWithPrivateKey:signingContext:error:", RandomKey, v10, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  getWFSecurityLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_INFO, "%s Generated Signed Shortcut Data with AppleID information Successfully", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFShortcutPackageFile generateSignedShortcutFileRepresentationWithAccount:error:]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to generate Signed Shortcut Data with AppleID information: %@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (id)generateDirectoryStructureInDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[WFShortcutPackageFile shortcutData](self, "shortcutData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFShortcutPackageFile directoryName](self, "directoryName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFShortcutPackageFile fileManager](self, "fileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, 0, a4);

    v12 = 0;
    if (v11)
    {
      objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("Shortcut.wflow"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFShortcutPackageFile shortcutData](self, "shortcutData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "writeToURL:atomically:", v13, 1);

      v12 = v9;
    }

  }
  else if (a4)
  {
    WFShortcutPackageFileFailedToSignShortcutFileError();
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSData)shortcutData
{
  return self->_shortcutData;
}

- (void)setShortcutData:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutData, a3);
}

- (NSData)signedShortcutData
{
  return self->_signedShortcutData;
}

- (void)setSignedShortcutData:(id)a3
{
  objc_storeStrong((id *)&self->_signedShortcutData, a3);
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSURL)signedShortcutFileURL
{
  return self->_signedShortcutFileURL;
}

- (NSURL)temporaryWorkingDirectoryURL
{
  return self->_temporaryWorkingDirectoryURL;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_temporaryWorkingDirectoryURL, 0);
  objc_storeStrong((id *)&self->_signedShortcutFileURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);
  objc_storeStrong((id *)&self->_signedShortcutData, 0);
  objc_storeStrong((id *)&self->_shortcutData, 0);
  objc_storeStrong((id *)&self->_sanitizedName, 0);
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke(uint64_t a1)
{
  AEAContextDestroy(*(AEAContext *)(a1 + 32));
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_2(uint64_t a1)
{
  AAFieldKeySetDestroy(*(AAFieldKeySet *)(a1 + 32));
}

void __101__WFShortcutPackageFile_generateSignedShortcutFileRepresentationWithPrivateKey_signingContext_error___block_invoke_3(uint64_t a1)
{
  AAPathListDestroy(*(AAPathList *)(a1 + 32));
}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  __SecKey *v11;
  uint64_t v12;
  CFDataRef v13;
  AEAContext_impl *v14;
  const __CFData *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void (**v27)(_QWORD);
  AAArchiveStream_impl *v28;
  NSObject *v29;
  ssize_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  ssize_t v41;
  AAByteStream_impl *s;
  void *v43;
  void *v44;
  AAArchiveStream_impl *istream;
  void (**v46)(void);
  _QWORD v47[5];
  id v48;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  ssize_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((a2 & 1) != 0)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "copyPublicKey");
    if (v10)
    {
      v11 = (__SecKey *)v10;
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v10;
      v46 = (void (**)(void))_Block_copy(aBlock);
      v13 = SecKeyCopyExternalRepresentation(v11, 0);
      v14 = *(AEAContext_impl **)(a1 + 56);
      v15 = objc_retainAutorelease(v13);
      if (AEAContextSetFieldBlob(v14, 7u, 1u, (const uint8_t *)-[__CFData bytes](v15, "bytes"), -[__CFData length](v15, "length")))
      {
        v16 = *(_QWORD *)(a1 + 48);
        WFShortcutPackageFileFailedToExtractShortcutFileError();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v16 + 16))(v16, 0, 0, 0, v17);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "temporaryWorkingDirectoryURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "directoryName");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URLByAppendingPathComponent:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "fileManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v21) = objc_msgSend(v23, "fileExistsAtPath:isDirectory:", v24, 0);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "fileManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 0, 0, 0);

        }
        v47[0] = v12;
        v47[1] = 3221225472;
        v47[2] = __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_3;
        v47[3] = &unk_1E7AF92C0;
        v47[4] = *(_QWORD *)(a1 + 40);
        v26 = v22;
        v48 = v26;
        v27 = (void (**)(_QWORD))_Block_copy(v47);
        v17 = objc_retainAutorelease(v26);
        v28 = AAExtractArchiveOutputStreamOpen((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0, 0, 1uLL, 0);
        if (v28)
        {
          s = AEADecryptionInputStreamOpen(*(AAByteStream *)(a1 + 64), *(AEAContext *)(a1 + 56), 0, 0);
          istream = AADecodeArchiveInputStreamOpen(s, 0, 0, 0, 0);
          getWFSecurityLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v51 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
            _os_log_impl(&dword_1C15B3000, v29, OS_LOG_TYPE_INFO, "%s Extracting Signed Shortcut Data", buf, 0xCu);
          }

          v30 = AAArchiveStreamProcess(istream, v28, 0, 0, 0, 0);
          if (v30 < 0 || AAArchiveStreamClose(v28) < 0)
          {
            getWFSecurityLogObject();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v51 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
              v52 = 2050;
              v53 = v30;
              _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to extract signed shortcut data with %{public}zd entries", buf, 0x16u);
            }

            v36 = *(_QWORD *)(a1 + 48);
            WFShortcutPackageFileFailedToExtractShortcutFileError();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v36 + 16))(v36, 0, 0, 0, v31);
          }
          else
          {
            v41 = v30;
            objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("Shortcut.wflow"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x1E0D13F78];
            objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", CFSTR("com.apple.shortcuts.workflow-file"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "fileName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "fileWithURL:options:ofType:proposedFilename:", v31, 3, v32, v33);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              getWFSecurityLogObject();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v51 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
                v52 = 2048;
                v53 = v41;
                _os_log_impl(&dword_1C15B3000, v34, OS_LOG_TYPE_INFO, "%s Signed Shortcut Data Extracted Successfully with %zd entries", buf, 0x16u);
              }

              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
              AAArchiveStreamClose(istream);
              AAByteStreamClose(s);
            }
            else
            {
              getWFSecurityLogObject();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v51 = "-[WFShortcutPackageFile preformShortcutDataExtractionWithCompletion:]_block_invoke";
                _os_log_impl(&dword_1C15B3000, v38, OS_LOG_TYPE_ERROR, "%s Could not find the main shortcut Shortcut.wflow file in the archive", buf, 0xCu);
              }

              v39 = *(_QWORD *)(a1 + 48);
              WFShortcutPackageFileInvalidShortcutFileError();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v39 + 16))(v39, 0, 0, 0, v40);

            }
          }
        }
        else
        {
          v37 = *(_QWORD *)(a1 + 48);
          WFShortcutPackageFileFailedToExtractShortcutFileError();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v37 + 16))(v37, 0, 0, 0, v31);
        }

        v27[2](v27);
      }

      v46[2]();
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 48);
      WFShortcutPackageFileInvalidShortcutFileError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v18 + 16))(v18, 0, 0, 0, v19);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __69__WFShortcutPackageFile_preformShortcutDataExtractionWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

}

uint64_t __73__WFShortcutPackageFile_extractShortcutFileRepresentationWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preformShortcutDataExtractionWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __99__WFShortcutPackageFile_extractShortcutFileRepresentationWithSigningMethod_iCloudIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v20 = v9;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v11;
  v16 = v11;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v10;
  v19 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
