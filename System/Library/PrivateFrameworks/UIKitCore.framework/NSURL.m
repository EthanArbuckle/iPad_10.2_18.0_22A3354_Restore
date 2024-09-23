@implementation NSURL

void __51__NSURL_UIDocumentPicker__ui_cloudDocsContainerURL__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v0 = (void *)qword_1ECD7D6D8;
  v19 = qword_1ECD7D6D8;
  if (!qword_1ECD7D6D8)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = (uint64_t)__getBRContainerClass_block_invoke;
    v14 = &unk_1E16B14C0;
    v15 = &v16;
    __getBRContainerClass_block_invoke((uint64_t)&v11);
    v0 = (void *)v17[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v1, "allContainersByContainerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = (uint64_t)&v11;
  v13 = 0x2020000000;
  v3 = (_QWORD *)qword_1ECD7D6E0;
  v14 = (void *)qword_1ECD7D6E0;
  if (!qword_1ECD7D6E0)
  {
    v4 = CloudDocsLibrary();
    v3 = dlsym(v4, "BRUbiquitousDefaultContainerID");
    *(_QWORD *)(v12 + 24) = v3;
    qword_1ECD7D6E0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v11, 8);
  if (v3)
  {
    objc_msgSend(v2, "objectForKey:", *v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "documentsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)_MergedGlobals_1012;
    _MergedGlobals_1012 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBRUbiquitousDefaultContainerID(void)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSURL+UIDocumentPicker.m"), 33, CFSTR("%s"), dlerror(), v11);

    __break(1u);
  }
}

void __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__65;
    v18 = __Block_byref_object_dispose__65;
    v19 = 0;
    v6 = *(_QWORD *)(a1 + 32);
    obj = 0;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke_21;
    v10 = &unk_1E16C3548;
    v11 = v3;
    v12 = &v14;
    objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 1, &obj, &v7);
    objc_storeStrong(&v19, obj);
    if (v15[5])
      NSLog(CFSTR("Failed to clean up incoming doc picker file, %@"), v15[5], v7, v8, v9, v10);

    _Block_object_dispose(&v14, 8);
  }

}

void __48__NSURL_UIDocumentPicker__ui_scheduleForCleanup__block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "removeItemAtURL:error:", a2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

@end
