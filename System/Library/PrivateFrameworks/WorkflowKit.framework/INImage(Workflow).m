@implementation INImage(Workflow)

- (id)wf_contentItemWithCodableAttribute:()Workflow
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0D13FB8];
  v2 = (void *)MEMORY[0x1E0D13F78];
  objc_msgSend(a1, "_imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileWithData:ofType:proposedFilename:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itemWithFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  Class (*v21)(uint64_t);
  void *v22;
  void **v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getINUIImageLoaderClass_softClass;
  v19 = getINUIImageLoaderClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getINUIImageLoaderClass_softClass)
  {
    *(_QWORD *)&v20 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v20 + 1) = 3221225472;
    v21 = __getINUIImageLoaderClass_block_invoke;
    v22 = &unk_1E7AF9520;
    v23 = &v16;
    __getINUIImageLoaderClass_block_invoke((uint64_t)&v20);
    v8 = v17[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  v11 = (id)objc_msgSend(v10, "registeredImageLoaderWithScreenDelegate");
  v16 = 0;
  if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    v20 = xmmword_1E7AF5938;
    v21 = 0;
    VoiceShortcutClientLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *VoiceShortcutClientLibrary(void)");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", a1, CFSTR("INImage+Workflow.m"), 16, CFSTR("%s"), v16);

    __break(1u);
    goto LABEL_9;
  }
  v12 = v16;
  if (v16)
LABEL_9:
    free(v12);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __73__INImage_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke;
  v14[3] = &unk_1E7AF5900;
  v15 = v7;
  v13 = v7;
  objc_msgSend(a1, "retrieveImageDataWithCompletion:", v14);

}

+ (uint64_t)wf_contentItemClass
{
  return objc_opt_class();
}

@end
