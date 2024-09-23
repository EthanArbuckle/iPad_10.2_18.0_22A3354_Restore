@implementation NSURL(UIDocumentPicker)

- (uint64_t)ui_issueReadSandboxExtensionWithError:()UIDocumentPicker
{
  return objc_msgSend(a1, "ui_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E0C80000], a3);
}

- (uint64_t)ui_issueReadWriteSandboxExtensionWithError:()UIDocumentPicker
{
  return objc_msgSend(a1, "ui_issueSandboxExtensionOfClass:error:", *MEMORY[0x1E0C80008], a3);
}

- (id)ui_issueSandboxExtensionOfClass:()UIDocumentPicker error:
{
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");
  v8 = (const char *)sandbox_extension_issue_file();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v8, strlen(v8) + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2FE0];
      v12 = *__error();
      v19 = *MEMORY[0x1E0C9AFB0];
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = __error();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("couldn't issue sandbox extension %s for '%@': %s"), a3, v14, strerror(*v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }
  return v9;
}

- (uint64_t)ui_hasReadSandboxExtended
{
  return objc_msgSend(a1, "ui_hasSandboxExtendedForClass:", *MEMORY[0x1E0C80000]);
}

- (BOOL)ui_hasSandboxExtendedForClass:()UIDocumentPicker
{
  id v1;
  _BOOL8 v2;

  objc_msgSend(a1, "path");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "fileSystemRepresentation");
  v2 = sandbox_check() == 0;

  return v2;
}

- (void)ui_isFileProviderURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  v9 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPIsFileProviderBookmarkSymbolLoc_ptr)
  {
    v3 = FileProviderLibrary();
    v2 = dlsym(v3, "FPIsFileProviderBookmark");
    v7[3] = (uint64_t)v2;
    getFPIsFileProviderBookmarkSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (v2)
  {
    ((void (*)(uint64_t, _QWORD))v2)(a1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _FPIsFileProviderBookmark(CFURLRef, CFErrorRef *)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("NSURL+UIDocumentPicker.m"), 28, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)ui_setIsFileProviderURL:()UIDocumentPicker
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = getFPMarkAsFileProviderBookmarkSymbolLoc_ptr;
  v12 = getFPMarkAsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPMarkAsFileProviderBookmarkSymbolLoc_ptr)
  {
    v6 = FileProviderLibrary();
    v5 = dlsym(v6, "FPMarkAsFileProviderBookmark");
    v10[3] = (uint64_t)v5;
    getFPMarkAsFileProviderBookmarkSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v9, 8);
  if (v5)
  {
    ((void (*)(uint64_t, uint64_t))v5)(a1, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _FPMarkAsFileProviderBookmark(CFURLRef, BOOL)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSURL+UIDocumentPicker.m"), 27, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)ui_canOpenInPlace
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  if ((objc_msgSend(a1, "ui_isFileProviderURL") & 1) == 0)
  {
    v2 = a1;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v3 = getBRIsURLInMobileDocumentsSymbolLoc_ptr;
    v10 = getBRIsURLInMobileDocumentsSymbolLoc_ptr;
    if (!getBRIsURLInMobileDocumentsSymbolLoc_ptr)
    {
      v4 = CloudDocsLibrary();
      v3 = dlsym(v4, "BRIsURLInMobileDocuments");
      v8[3] = (uint64_t)v3;
      getBRIsURLInMobileDocumentsSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v7, 8);
    if (v3)
    {
      ((void (*)(id))v3)(v2);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _BRIsURLInMobileDocuments(NSURL *__strong)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("NSURL+UIDocumentPicker.m"), 32, CFSTR("%s"), dlerror());

      __break(1u);
    }
  }
}

- (uint64_t)ui_isUnfulfilledPromiseURL
{
  uint64_t result;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  stat v10;

  result = objc_msgSend(a1, "isFileURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v10);

    if (v4 < 0)
    {
      if (*__error() != 2)
        return 0;
      v5 = _CFURLPromiseCopyPhysicalURL();
      if (!v5)
        return 0;
      v6 = (void *)v5;
      v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      objc_msgSend(v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

      return (v9 & 1) != 0;
    }
    else
    {
      return (HIBYTE(v10.st_flags) >> 6) & 1;
    }
  }
  return result;
}

- (void)ui_setIsContentManaged:()UIDocumentPicker
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTemporaryResourceValue:forKey:", v2, CFSTR("com.apple.UIKit.isContentManaged"));

}

- (uint64_t)ui_isContentManaged
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, CFSTR("com.apple.UIKit.isContentManaged"), 0);
  return objc_msgSend(v2, "BOOLValue");
}

+ (id)ui_cloudDocsContainerURL
{
  if (qword_1ECD7D6D0 != -1)
    dispatch_once(&qword_1ECD7D6D0, &__block_literal_global_154);
  return (id)_MergedGlobals_1012;
}

- (id)ui_bookmarkForExportWithError:()UIDocumentPicker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[_UIDocumentPickerNSURLWrapper wrapperForExportWithURL:error:](_UIDocumentPickerNSURLWrapper, "wrapperForExportWithURL:error:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "encodeObject:forKey:", v3, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v4, "encodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)ui_URLFromExportBookmark:()UIDocumentPicker
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ui_incomingDirectory:()UIDocumentPicker
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  _UIMainBundleIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Inbox"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v21 = 0;
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v11, &v21);
    v13 = v21;

    if (v12)
      v14 = v13 == 0;
    else
      v14 = 1;
    if (v14)
    {
      objc_msgSend(v10, "removeItemAtURL:error:", v9, 0);
      v24 = *MEMORY[0x1E0CB2AD8];
      v25[0] = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, v15, &v20);
      v17 = v20;
    }
    else
    {
      v22 = *MEMORY[0x1E0CB2AD8];
      v23 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v15, v16, &v19);
      v17 = v19;

    }
  }

  return v9;
}

- (void)ui_scheduleForCleanup
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "ui_incomingDirectory:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hasPrefix:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+UIDocumentPicker.m"), 214, CFSTR("%@ called on URL (%@) not in incoming directory"), v11, a1);

  }
  v8 = dispatch_time(0, 60000000000);
  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = a1;
  dispatch_after(v8, v9, block);

}

- (id)ui_resolveOnDiskBookmarkAndPromise
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "br_isExternalDocumentReference"))
  {
    objc_msgSend(v1, "br_URLByResolvingExternalDocumentReferenceWithError:", 0);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  if (_CFURLIsItemPromiseAtURL())
  {
    v3 = _CFURLCopyLogicalURLOfPromiseAtURL();

    v1 = (id)v3;
  }
  return v1;
}

- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker
{
  return -[_UIDocumentActivityDownloadOperation initWithURL:scene:]([_UIDocumentActivityDownloadOperation alloc], "initWithURL:scene:", a1, 0);
}

- (_UIDocumentActivityDownloadOperation)ui_downloadOperationForActivity:()UIDocumentPicker inScene:
{
  id v5;
  _UIDocumentActivityDownloadOperation *v6;

  v5 = a4;
  v6 = -[_UIDocumentActivityDownloadOperation initWithURL:scene:]([_UIDocumentActivityDownloadOperation alloc], "initWithURL:scene:", a1, v5);

  return v6;
}

- (id)ui_URLByResolvingSymlinksAndCopyingSecurityScope
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a1, "URLByResolvingSymlinksInPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == a1)
  {
    v11 = a1;
    goto LABEL_10;
  }
  v3 = v2;
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasPrefix:", CFSTR("/private/var/")))
    goto LABEL_5;
  v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("/var/"));

  if (v6)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("/var/"), "length"), CFSTR("/private/var/"));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
LABEL_5:

  }
  v8 = objc_msgSend(a1, "hasDirectoryPath");
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x186DC87E8](a1);
  if (v10)
    +[_UIDocumentPickerNSURLWrapper assembleURL:sandbox:physicalURL:physicalSandbox:](_UIDocumentPickerNSURLWrapper, "assembleURL:sandbox:physicalURL:physicalSandbox:", v9, v10, 0, 0);
  v11 = v9;

LABEL_10:
  return v11;
}

@end
