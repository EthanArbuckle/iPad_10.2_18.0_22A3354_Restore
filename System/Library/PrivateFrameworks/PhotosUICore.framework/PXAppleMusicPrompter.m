@implementation PXAppleMusicPrompter

uint64_t __59__PXAppleMusicPrompter__requestAppleMusicTCCAccessIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTCCAccessResult:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __59__PXAppleMusicPrompter__requestAppleMusicTCCAccessIfNeeded__block_invoke()
{
  return px_dispatch_on_main_queue();
}

- (void)_start
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 53, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter _start]");

  }
  -[PXAppleMusicPrompter _requestAppleMusicTCCAccessIfNeeded](self, "_requestAppleMusicTCCAccessIfNeeded");
}

- (void)_requestAppleMusicTCCAccessIfNeeded
{
  void *v4;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 58, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter _requestAppleMusicTCCAccessIfNeeded]");

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Checking Media Library TCC Access…", buf, 2u);
  }
  TCCAccessRequest();
}

- (void)_promptingFinished
{
  void *v4;
  void *v5;
  void (**v6)(void);

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 98, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter _promptingFinished]");

  }
  -[PXAppleMusicPrompter completion](self, "completion");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2]();
  v4 = (void *)_prompter;
  _prompter = 0;

}

- (void)_handleTCCAccessResult:(unsigned __int8)a3
{
  int v3;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint8_t buf[4];
  __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 68, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter _handleTCCAccessResult:]");

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("YES");
    if (!v3)
      v6 = CFSTR("NO");
    v7 = v6;
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Received Media Library TCC access request result: %@", buf, 0xCu);

  }
  if (v3)
  {
    -[PXAppleMusicPrompter _requestAppleMusicPlaybackStatus](self, "_requestAppleMusicPlaybackStatus");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Because TCC access is not granted, no further prompting is needed.", buf, 2u);
    }
    -[PXAppleMusicPrompter _promptingFinished](self, "_promptingFinished");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicStatusProvider, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (PXAppleMusicPrompter)initWithCompletion:(id)a3
{
  PXAppleMusicPrompter *v5;
  PXDefaultAppleMusicStatusProvider *v6;
  PXAppleMusicStatusProvider *appleMusicStatusProvider;
  void *v9;
  objc_super v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 44, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter initWithCompletion:]");

  }
  v10.receiver = self;
  v10.super_class = (Class)PXAppleMusicPrompter;
  v5 = -[PXAppleMusicPrompter init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(PXDefaultAppleMusicStatusProvider);
    appleMusicStatusProvider = v5->_appleMusicStatusProvider;
    v5->_appleMusicStatusProvider = (PXAppleMusicStatusProvider *)v6;

  }
  return v5;
}

- (void)_requestAppleMusicPlaybackStatus
{
  PXAppleMusicStatusProvider *appleMusicStatusProvider;
  _QWORD v4[5];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Checking Apple Music subscription status…", buf, 2u);
  }
  appleMusicStatusProvider = self->_appleMusicStatusProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke;
  v4[3] = &unk_1E511AFD0;
  v4[4] = self;
  -[PXAppleMusicStatusProvider requestStatusForCapability:handler:](appleMusicStatusProvider, "requestStatusForCapability:handler:", 1, v4);
}

- (void)_handleAppleMusicPlaybackStatus:(int64_t)a3 error:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicPrompter.m"), 88, CFSTR("%s must be called on the main thread"), "-[PXAppleMusicPrompter _handleAppleMusicPlaybackStatus:error:]");

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 2)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E5143FE8[a3 - 1];
    v9 = v8;
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Got Apple Music Playback Status: %@", buf, 0xCu);

  }
  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PXAppleMusicPrompter] Got Apple Music Playback Status Error: %@", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PXAppleMusicPrompter] Because Apple Music playback status is not enabled, no further prompting is needed.", buf, 2u);
  }
  -[PXAppleMusicPrompter _promptingFinished](self, "_promptingFinished");

}

- (id)completion
{
  return self->_completion;
}

- (PXAppleMusicStatusProvider)appleMusicStatusProvider
{
  return self->_appleMusicStatusProvider;
}

void __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __56__PXAppleMusicPrompter__requestAppleMusicPlaybackStatus__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAppleMusicPlaybackStatus:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (void)showPromptsIfNeededWithCompletion:(id)a3
{
  void *v5;
  PXAppleMusicPrompter *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAppleMusicPrompter.m"), 32, CFSTR("%s must be called on the main thread"), "+[PXAppleMusicPrompter showPromptsIfNeededWithCompletion:]");

  }
  if (!_prompter)
  {
    v6 = -[PXAppleMusicPrompter initWithCompletion:]([PXAppleMusicPrompter alloc], "initWithCompletion:", v9);
    v7 = (void *)_prompter;
    _prompter = (uint64_t)v6;

    objc_msgSend((id)_prompter, "_start");
    goto LABEL_7;
  }
  v5 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
LABEL_7:
    v5 = v9;
  }

}

@end
