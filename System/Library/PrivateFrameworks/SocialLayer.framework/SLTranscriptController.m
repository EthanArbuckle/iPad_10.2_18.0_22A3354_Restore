@implementation SLTranscriptController

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLTranscriptController finished the extension request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLTranscriptController;
  -[SLTranscriptController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[SLTranscriptController isBeingDismissed](self, "isBeingDismissed"))
    sIsPresenting = 0;
}

- (BOOL)deviceIsiPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)presentTranscriptForMessageGUID:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char HasPublicEntitlement;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  SLTranscriptController *v35;
  id v36;
  id from;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (sIsPresenting == 1)
  {
    SLFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HasPublicEntitlement = SLAppHasPublicEntitlement();

    sIsPresenting = 1;
    if (!-[SLTranscriptController deviceIsiPad](self, "deviceIsiPad") || (HasPublicEntitlement & 1) != 0)
    {
      v42 = 0;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.MobileSMS.MessagesTranscriptExtension"), &v42);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v42;
      -[SLTranscriptController setExtension:](self, "setExtension:", v21);
      if (v21)
      {
        objc_initWeak(&location, self);
        v22 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_22;
        v38[3] = &unk_1E37941F8;
        objc_copyWeak(&v40, &location);
        v23 = v8;
        v39 = v23;
        objc_msgSend(v21, "setRequestInterruptionBlock:", v38);
        v24 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
        if (v23)
        {
          v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v25, "setObject:forKey:", v23, CFSTR("messageGUID"));
          if (v9)
            objc_msgSend(v25, "setObject:forKey:", v9, CFSTR("attachmentGUID"));
          objc_msgSend(v24, "setUserInfo:", v25);

        }
        objc_initWeak(&from, v10);
        objc_initWeak(&v36, v21);
        v26 = v22;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x3032000000;
        v34[3] = __Block_byref_object_copy_;
        v34[4] = __Block_byref_object_dispose_;
        v35 = self;
        v45 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v26;
        v29[1] = 3221225472;
        v29[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_28;
        v29[3] = &unk_1E3794270;
        objc_copyWeak(&v32, &from);
        objc_copyWeak(&v33, &v36);
        v31 = v34;
        v30 = v23;
        objc_msgSend(v21, "instantiateViewControllerWithInputItems:connectionHandler:", v27, v29);

        objc_destroyWeak(&v33);
        objc_destroyWeak(&v32);
        _Block_object_dispose(v34, 8);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);
      }
      else
      {
        SLFrameworkLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:].cold.2((uint64_t)v11, v28);

        sIsPresenting = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?message-guid=%@&overlay=1"), v8);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D23158];
      v17 = *MEMORY[0x1E0D22D78];
      v46[0] = *MEMORY[0x1E0DAB8B8];
      v46[1] = v17;
      v47[0] = *MEMORY[0x1E0DAB828];
      v47[1] = v14;
      v46[2] = *MEMORY[0x1E0D22DC8];
      v47[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "optionsWithDictionary:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke;
      v43[3] = &unk_1E37941A8;
      v44 = v14;
      v20 = v14;
      objc_msgSend(v15, "openApplication:withOptions:completion:", CFSTR("com.apple.MobileSMS"), v19, v43);

    }
  }

}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);

    sIsPresenting = 0;
  }

}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_22(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2;
  v2[3] = &unk_1E37941D0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_cold_1();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?message-guid=%@&overlay=1"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x1E0C9AA70], 0);

  sIsPresenting = 0;
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29;
  block[3] = &unk_1E3794248;
  v16 = v9;
  v10 = v9;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  objc_copyWeak(&v21, (id *)(a1 + 56));
  v17 = v7;
  v18 = v8;
  v14 = *(_OWORD *)(a1 + 32);
  v11 = (id)v14;
  v19 = v14;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);

}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29(uint64_t a1)
{
  uint64_t v1;
  NSObject *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id location;

  v1 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    SLFrameworkLogHandle();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_3(v1, WeakRetained, v3, v4, v5, v6, v7, v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRequestUUID:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRemoteViewController:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 48), "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAutoresizingMask:", 18);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 48), "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addChildViewController:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v23 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "requestUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_extensionContextForUUID:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      -[NSObject setMessageGUID:](v25, "setMessageGUID:", *(_QWORD *)(a1 + 56));
      objc_initWeak(&location, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_30;
      v34 = &unk_1E3794220;
      objc_copyWeak(&v35, &location);
      -[NSObject setDismissalRequestHandler:](v25, "setDismissalRequestHandler:", &v31);
      SLFrameworkLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_2();

      v27 = objc_loadWeakRetained(&location);
      -[NSObject presentViewController:animated:completion:](WeakRetained, "presentViewController:animated:completion:", v27, 1, 0, v31, v32, v33, v34);

      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = 0;

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    else
    {
      v30 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v30, "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));

      sIsPresenting = 0;
      SLFrameworkLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_1();
    }

  }
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_30(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_30_cold_1();

  }
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (_UIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLTranscriptController: not presenting because we're already presenting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentTranscriptForMessageGUID:(uint64_t)a1 attachmentGUID:(NSObject *)a2 presentingViewController:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("com.apple.MobileSMS.MessagesTranscriptExtension");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "SLTranscriptController failed to find extension %@ error: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "SLTranscriptController failed to present on iPad, error: %@, falling back to openURL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLTranscriptController: detected an interruption, dismissing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLTranscriptController: no presentingViewController, cancelling the extension request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLTranscriptController presenting the transcript", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_2_29_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_199EFF000, a2, a3, "SLTranscriptController failed to load remote view controller: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __98__SLTranscriptController_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLTranscriptController failed to dismiss because it's nil??", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
