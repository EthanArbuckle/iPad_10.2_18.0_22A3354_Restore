@implementation WFFileStorageUtilities

uint64_t __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "checkPromisedItemIsReachableAndReturnError:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB3620];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4, 0, 0);
}

void __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  +[WFFileStorageUtilities documentsDirectoryWithError:](WFFileStorageUtilities, "documentsDirectoryWithError:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR(".WorkflowHiddenFile"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v2 = (void *)objc_opt_new();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_2;
  v3[3] = &unk_1E7AF0FB0;
  v3[4] = &v4;
  objc_msgSend(v2, "coordinateReadingItemAtURL:options:error:byAccessor:", v1, 4, 0, v3);
  if (!*((_BYTE *)v5 + 24))
    objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", v1, 0, 0, &__block_literal_global_118_31679);

  _Block_object_dispose(&v4, 8);
}

+ (id)documentsDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForUbiquityContainerIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, a3), v12, a3 = 0, v13))
    {
      a3 = v8;
    }
  }
  else if (a3)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB28A8];
    v19 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("The iCloud Container could not be found."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 4, v17);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

+ (id)containerIdentifier
{
  return (id)*MEMORY[0x1E0D14348];
}

+ (void)createDocumentsDirectoryIfNecessary
{
  NSObject *v2;
  NSObject *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v3 = dispatch_queue_create("com.apple.shortcuts.WFFileStorageUtilities", attr);
  dispatch_async(v3, &__block_literal_global_31676);

}

@end
