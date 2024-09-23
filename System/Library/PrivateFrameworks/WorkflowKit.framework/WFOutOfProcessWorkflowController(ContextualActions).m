@implementation WFOutOfProcessWorkflowController(ContextualActions)

+ (id)computeFinderResizedSizesForImages:()ContextualActions inSizes:error:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C18]), "initWithEnvironment:runningContext:presentationMode:", 0, 0, 0);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  v13 = v11;
  v34 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v32 = 0;
  objc_msgSend(v13, "synchronousRunnerWithError:reason:", &v32, CFSTR("computing finder resized image"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v32;
  if (v15)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__13582;
    v37 = __Block_byref_object_dispose__13583;
    v38 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__13582;
    v30 = __Block_byref_object_dispose__13583;
    v31 = 0;
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_112;
    v20[3] = &unk_1E7AEDAB8;
    v21 = v10;
    v22 = &v26;
    v24 = a2;
    v25 = a1;
    v23 = buf;
    objc_msgSend(v15, "computeFinderResizedSizesForImages:inSizes:completion:", v9, v21, v20);
    if (a5)
      *a5 = objc_retainAutorelease((id)v27[5]);
    v17 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    getWFXPCRunnerLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFOutOfProcessWorkflowController(ContextualActions) computeFinderResizedSizesForImages:inSizes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Unable to connect to runner: %@", buf, 0x16u);
    }

    v17 = 0;
  }

  v14[2](v14);
  return v17;
}

@end
