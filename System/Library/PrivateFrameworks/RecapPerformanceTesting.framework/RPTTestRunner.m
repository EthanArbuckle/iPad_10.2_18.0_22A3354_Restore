@implementation RPTTestRunner

+ (void)runTestWithParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[RPTInteractionOptions defaultForPlatform](RPTInteractionOptions, "defaultForPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "initWithInteractionOptions:", v6);

  objc_msgSend(v7, "runTestWithParameters:", v4);
}

- (RCPInlinePlayer)inlinePlayer
{
  return self->_inlinePlayer;
}

+ (BOOL)isRecapAvailable
{
  return RecapLibraryCore() != 0;
}

+ (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  +[RPTInteractionOptions defaultForPlatform](RPTInteractionOptions, "defaultForPlatform");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithInteractionOptions:", v10);
  objc_msgSend(v9, "playInteraction:completionHandler:", v7, v6);

}

+ (void)runTestWithParameters:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  +[RPTInteractionOptions defaultForPlatform](RPTInteractionOptions, "defaultForPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "initWithInteractionOptions:", v9);

  objc_msgSend(v10, "runTestWithParameters:resultHandler:", v7, v6);
}

+ (void)runTestWithParameters:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  +[RPTInteractionOptions defaultForPlatform](RPTInteractionOptions, "defaultForPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "initWithInteractionOptions:", v9);

  objc_msgSend(v10, "setDelegate:", v6);
  objc_msgSend(v10, "runTestWithParameters:", v7);

}

- (RPTTestRunner)initWithInteractionOptions:(id)a3
{
  id v4;
  RPTTestRunner *v5;
  RPTInteractionOptions *v6;
  RPTInteractionOptions *interactionOptions;
  uint64_t v8;
  RPTSettings *settings;
  RCPInlinePlayer *v10;
  RCPInlinePlayer *inlinePlayer;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RPTTestRunner;
  v5 = -[RPTTestRunner init](&v14, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (RPTInteractionOptions *)v4;
    }
    else
    {
      +[RPTInteractionOptions defaultForPlatform](RPTInteractionOptions, "defaultForPlatform");
      v6 = (RPTInteractionOptions *)objc_claimAutoreleasedReturnValue();
    }
    interactionOptions = v5->_interactionOptions;
    v5->_interactionOptions = v6;

    +[RPTSettings processEnvironment](RPTSettings, "processEnvironment");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (RPTSettings *)v8;

    v10 = (RCPInlinePlayer *)objc_alloc_init((Class)getRCPInlinePlayerClass());
    inlinePlayer = v5->_inlinePlayer;
    v5->_inlinePlayer = v10;

    RPTLogTestRunning();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1B1773000, v12, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner initWithOptions: %{public}@]", buf, 0xCu);
    }

  }
  return v5;
}

- (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v5;

  +[RPTInteractionTestParameters interactionTestParametersWithTestName:interaction:duration:completionHandler:](RPTInteractionTestParameters, "interactionTestParametersWithTestName:interaction:duration:completionHandler:", 0, a3, a4, 1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RPTTestRunner runTestWithParameters:](self, "runTestWithParameters:", v5);

}

- (BOOL)_isReadyForRunningParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a3;
  -[RPTTestRunner delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[RPTTestRunner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "testRunner:isReadyForRunningParameters:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_runTestWithParameters:(id)a3 retries:(int64_t)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  v7 = -[RPTTestRunner _isReadyForRunningParameters:error:](self, "_isReadyForRunningParameters:error:", v6, &v17);
  v8 = v17;
  v9 = v8;
  if (v7)
  {
    -[RPTTestRunner _runTestWithParameters:](self, "_runTestWithParameters:", v6);
  }
  else if (a4 < 1)
  {
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D68];
      v18[0] = *MEMORY[0x1E0CB2D60];
      v18[1] = v12;
      v19[0] = CFSTR("App not ready to test");
      v19[1] = CFSTR("Client reported not ready to test.");
      v18[2] = *MEMORY[0x1E0CB2D80];
      v19[2] = CFSTR("Check your client code.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.RecapPerformanceTesting"), 4, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[RPTTestRunner _failWithParameters:error:](self, "_failWithParameters:error:", v6, v9);
  }
  else
  {
    v10 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__RPTTestRunner__runTestWithParameters_retries___block_invoke;
    block[3] = &unk_1E635D2E0;
    block[4] = self;
    v15 = v6;
    v16 = a4;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __48__RPTTestRunner__runTestWithParameters_retries___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runTestWithParameters:retries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) - 1);
}

- (void)runTestWithParameters:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = a3;
  v5 = -[RPTTestRunner _startSerializedRunnerWithError:](self, "_startSerializedRunnerWithError:", &v7);
  v6 = v7;
  if (v5)
    -[RPTTestRunner _runTestWithParameters:retries:](self, "_runTestWithParameters:retries:", v4, 10);
  else
    -[RPTTestRunner _failWithParameters:error:](self, "_failWithParameters:error:", v4, v6);

}

- (void)_runTestWithParameters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id RCPSyntheticEventStreamClass;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  RPTTestRunner *v31;
  id v32;
  id v33;
  __int128 *v34;
  BOOL v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 *p_buf;
  BOOL v40;
  id v41;
  __int128 buf;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RPTLogTestRunning();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B1773000, v5, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner runTestWithParameters: %{public}@]", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v4, "testName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTTestRunner settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recapOverrideFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  RPTLogTestRunning();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", "<testName>=%{public, name=testName}@", (uint8_t *)&buf, 0xCu);
  }

  v41 = 0;
  v11 = -[RPTTestRunner checkTestRequirementsWithError:](self, "checkTestRequirementsWithError:", &v41);
  v12 = v41;
  v27 = v12;
  if (v11)
  {
    RPTLogTestRunning();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "testName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: PrepareForTest begin %{public}@", (uint8_t *)&buf, 0xCu);

    }
    RPTLogTestRunning();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_signpost_emit_with_name_impl(&dword_1B1773000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrepareForTest", "<testName>=%{public, name=testName}@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__0;
    v45 = __Block_byref_object_dispose__0;
    v46 = 0;
    makeRCPPlayerPlaybackOptions();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    v18 = v9;
    -[RPTTestRunner interactionOptions](self, "interactionOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v21 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke;
    v36[3] = &unk_1E635D308;
    v40 = v9;
    p_buf = &buf;
    v22 = v19;
    v37 = v22;
    v23 = v4;
    v38 = v23;
    objc_msgSend(RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPTTestRunner inlinePlayer](self, "inlinePlayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2;
    v28[3] = &unk_1E635D3F8;
    v29 = v23;
    v30 = 0;
    v35 = v18;
    v31 = self;
    v34 = &buf;
    v26 = v22;
    v32 = v26;
    v33 = v17;
    objc_msgSend(v25, "playEventStream:options:completion:", v24, v16, v28);

    v6 = v17;
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    -[RPTTestRunner _failWithParameters:error:](self, "_failWithParameters:error:", v4, v12);
  }

}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!*(_BYTE *)(result + 56))
  {
    v2 = result;
    v3 = a2;
    v4 = -[RPTDefaultPointerAndFingerInteroppingComposer initFromWrapping:interactionOptions:]([RPTDefaultPointerAndFingerInteroppingComposer alloc], "initFromWrapping:interactionOptions:", v3, *(_QWORD *)(v2 + 32));
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(*(id *)(v2 + 32), "senderProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSenderProperties:", v7);

    return objc_msgSend(*(id *)(v2 + 40), "prepareWithComposer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40));
  }
  return result;
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "testName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v3;
    _os_log_impl(&dword_1B1773000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PrepareForTest end %{public}@", buf, 0xCu);

  }
  RPTLogTestRunning();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrepareForTest", (const char *)&unk_1B1784A2E, buf, 2u);
  }

  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_77;
  block[3] = &unk_1E635D3F8;
  v6 = *(id *)(a1 + 40);
  v17 = *(_BYTE *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v13 = v8;
  v16 = v9;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_77(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id RCPEventStreamClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id RCPSyntheticEventStreamClass;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  makeRCPPlayerPlaybackOptions();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 80))
  {
    RCPEventStreamClass = getRCPEventStreamClass();
    objc_msgSend(*(id *)(a1 + 40), "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recapOverrideFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(RCPEventStreamClass, "eventStreamWithFileURL:error:", v6, &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;

    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_failWithParameters:error:", *(_QWORD *)(a1 + 48), v8);
      goto LABEL_13;
    }

  }
  else
  {
    RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2_78;
    v26[3] = &unk_1E635D330;
    v29 = *(_QWORD *)(a1 + 72);
    v27 = *(id *)(a1 + 56);
    v28 = *(id *)(a1 + 48);
    objc_msgSend(RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  RPTLogTestRunning();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "testName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v11;
    _os_log_impl(&dword_1B1773000, v10, OS_LOG_TYPE_DEFAULT, "RPT: PrewarmForTest begin %{public}@", buf, 0xCu);

  }
  RPTLogTestRunning();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    v13 = *(void **)(a1 + 64);
    v14 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 80))
      v14 = CFSTR("NO");
    *(_DWORD *)buf = 138543618;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrewarmForTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "inlinePlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_83;
  v19[3] = &unk_1E635D3D0;
  v16 = *(id *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v20 = v16;
  v21 = v17;
  v18 = *(id *)(a1 + 64);
  v25 = *(_BYTE *)(a1 + 80);
  v22 = v18;
  v23 = v7;
  v24 = v2;
  v8 = v7;
  objc_msgSend(v15, "prewarmForEventStream:completion:", v8, v19);

LABEL_13:
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_2_78(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "setForwardingTarget:", v4);
  objc_msgSend(*(id *)(a1 + 32), "senderProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderProperties:", v5);

  objc_msgSend(*(id *)(a1 + 40), "composerBlock");
  v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v6[2](v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  RPTLogTestRunning();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "testName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_1B1773000, v4, OS_LOG_TYPE_DEFAULT, "RPT: PrewarmForTest end %{public}@", buf, 0xCu);

  }
  RPTLogTestRunning();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrewarmForTest", (const char *)&unk_1B1784A2E, buf, 2u);
  }

  v7 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v7, "_failWithParameters:error:", *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    if (objc_msgSend(v7, "_managePPTLifetimeEvent:forParameters:", 0, *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startedTest:", *(_QWORD *)(a1 + 48));

    }
    RPTLogTestRunning();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "testName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_impl(&dword_1B1773000, v9, OS_LOG_TYPE_DEFAULT, "RPT: PerformTest begin %{public}@", buf, 0xCu);

    }
    RPTLogTestRunning();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      v12 = *(void **)(a1 + 48);
      v13 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 72))
        v13 = CFSTR("NO");
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2114;
      v28 = v13;
      _os_signpost_emit_with_name_impl(&dword_1B1773000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerformTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@ isAnimation=YES ", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "inlinePlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_85;
    v20[3] = &unk_1E635D3A8;
    v17 = *(id *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v14, "playEventStream:options:completion:", v15, v16, v20);

  }
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_85(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v2 = MEMORY[0x1E0C809B0];
  v24 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2_86;
  v16[3] = &unk_1E635D358;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1B5E1F6E0](v16);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    RPTLogTestRunning();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "testName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v8;
      _os_log_impl(&dword_1B1773000, v7, OS_LOG_TYPE_DEFAULT, "RPT: PostEventStreamPerformTest begin %{public}@", buf, 0xCu);

    }
    RPTLogTestRunning();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      v10 = *(void **)(a1 + 48);
      v11 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 56))
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_signpost_emit_with_name_impl(&dword_1B1773000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PostEventStreamPerformTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@", buf, 0x16u);
    }

    v12 = *(void **)(a1 + 32);
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_89;
    v13[3] = &unk_1E635D380;
    v14 = v12;
    v15 = v6;
    objc_msgSend(v14, "waitForPostEventStreamDelayWithHandler:", v13);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke_2_86(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "testName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1B1773000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PerformTest end %{public}@", (uint8_t *)&v12, 0xCu);

  }
  RPTLogTestRunning();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerformTest", (const char *)&unk_1B1784A2E, (uint8_t *)&v12, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "_managePPTLifetimeEvent:forParameters:", 1, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishedTest:waitForCommit:extraResults:", *(_QWORD *)(a1 + 48), 1, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
  RPTLogTestRunning();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "testName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1B1773000, v8, OS_LOG_TYPE_DEFAULT, "RPT: RunTestWithParameters end %{public}@", (uint8_t *)&v12, 0xCu);

  }
  RPTLogTestRunning();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", (const char *)&unk_1B1784A2E, (uint8_t *)&v12, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_finishWithParameters:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke_89(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "testName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B1773000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PostEventStreamPerformTest end %{public}@", (uint8_t *)&v6, 0xCu);

  }
  RPTLogTestRunning();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PostEventStreamPerformTest", (const char *)&unk_1B1784A2E, (uint8_t *)&v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)runTestWithParameters:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  if (a4)
  {
    v6 = a4;
    a4 = (id)objc_opt_new();
    objc_msgSend(a4, "setResultsHandler:", v6);

  }
  -[RPTTestRunner setDelegate:](self, "setDelegate:", a4);
  -[RPTTestRunner runTestWithParameters:](self, "runTestWithParameters:", v7);

}

- (BOOL)_startSerializedRunnerWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  ++_testIsRunning;
  objc_sync_exit(v4);

  -[RPTTestRunner delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, "RPTTestRunner_delegateKey", v5, (void *)0x301);

  return 1;
}

- (void)_endSerializedRunner
{
  id obj;

  objc_setAssociatedObject(self, "RPTTestRunner_delegateKey", 0, (void *)0x301);
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  --_testIsRunning;
  objc_sync_exit(obj);

}

- (void)_finishWithParameters:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RPTTestRunner delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[RPTTestRunner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "testRunner:didFinishRunningParameters:", self, v4);

  }
  RPTLogTestRunning();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1B1773000, v8, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner _finishWithParameters: %{public}@]", (uint8_t *)&v9, 0xCu);
  }

  -[RPTTestRunner _endSerializedRunner](self, "_endSerializedRunner");
}

- (void)_failWithParameters:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "testName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[RPTTestRunner _managePPTLifetimeEvent:forParameters:](self, "_managePPTLifetimeEvent:forParameters:", 2, v6);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "testName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "failedTest:withFailure:", v12, v13);

    }
  }
  RPTLogTestRunning();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    objc_msgSend(v7, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B1773000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", "<failure?>=%@", (uint8_t *)&v20, 0xCu);

  }
  -[RPTTestRunner delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[RPTTestRunner delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "testRunner:didFailRunningParameters:withError:", self, v6, v7);

  }
  RPTLogTestRunning();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[RPTTestRunner _failWithParameters:error:].cold.1((uint64_t)v6, (uint64_t)v7, v19);

  -[RPTTestRunner _endSerializedRunner](self, "_endSerializedRunner");
}

- (BOOL)_managePPTLifetimeEvent:(int64_t)a3 forParameters:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LODWORD(a3) = objc_msgSend(v6, "managesTestStartAndEnd") ^ 1;
  }
  else
  {
    -[RPTTestRunner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[RPTTestRunner delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a3) = objc_msgSend(v9, "testRunner:shouldManagePPTLifetimeEvent:forParamaters:", self, a3, v6);

    }
    else
    {
      objc_msgSend(v6, "testName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a3) = v10 != 0;

    }
  }

  return a3;
}

- (BOOL)checkTestRequirementsWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!RecapLibraryCore())
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D68];
    v22[0] = *MEMORY[0x1E0CB2D60];
    v22[1] = v6;
    v23[0] = CFSTR("Recap.framework is unavaliable.");
    v23[1] = CFSTR("The framework failed to be loaded in via soft-linking.");
    v22[2] = *MEMORY[0x1E0CB2D80];
    v23[2] = CFSTR("Check you are on a supported platform.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.RecapPerformanceTesting"), 3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  +[RPTEntitlementChecker checkerForCurrentProcess](RPTEntitlementChecker, "checkerForCurrentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v19 = 0;
    v11 = objc_msgSend(v9, "checkWithError:", &v19);
    v12 = v19;
    if ((v11 & 1) == 0)
      objc_msgSend(v4, "addObject:", v12);
    v13 = objc_msgSend(v4, "count");
    v14 = v13 == 0;
    if (a3 && v13)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2F70];
      v20[0] = *MEMORY[0x1E0CB2D60];
      v20[1] = v16;
      v21[0] = CFSTR("Test running requirements failed.");
      v21[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.RecapPerformanceTesting"), 1, v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
    }
  }
  else
  {
    RPTLogTestRunning();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RPTTestRunner checkTestRequirementsWithError:].cold.1(v12);
    v14 = 1;
  }

  return v14;
}

- (RPTInteractionOptions)interactionOptions
{
  return self->_interactionOptions;
}

- (void)setInteractionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_interactionOptions, a3);
}

- (RPTTestRunnerDelegate)delegate
{
  return (RPTTestRunnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RPTSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlinePlayer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactionOptions, 0);
}

- (void)_failWithParameters:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B1773000, log, OS_LOG_TYPE_ERROR, "RPT: -[RPTTestRunner _failWithParameters: %{public}@ error: %{public}@]", (uint8_t *)&v3, 0x16u);
}

- (void)checkTestRequirementsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B1773000, log, OS_LOG_TYPE_ERROR, "Could not verify process' entitlements but will try anyways. Likely an XPCService or Daemon. If nothing works, please check your entitlements.", v1, 2u);
}

@end
