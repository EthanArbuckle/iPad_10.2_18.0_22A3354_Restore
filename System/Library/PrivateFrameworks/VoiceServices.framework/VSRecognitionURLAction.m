@implementation VSRecognitionURLAction

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionURLAction;
  -[VSRecognitionAction dealloc](&v3, sel_dealloc);
}

- (int)completionType
{
  return 0;
}

- (void)setURL:(id)a3
{
  NSURL *url;

  url = self->_url;
  if (url != a3)
  {

    self->_url = (NSURL *)a3;
  }
}

- (id)URL
{
  return self->_url;
}

- (id)perform
{
  NSObject *v3;
  NSURL *url;
  id v5;
  NSURL *v6;
  CFErrorRef v7;
  const __CFAllocator *v8;
  __CFError *v9;
  _QWORD v11[5];
  _BYTE buf[12];
  void *userInfoValues[2];

  userInfoValues[1] = *(void **)MEMORY[0x1E0C80C00];
  if (self->_url)
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = url;
      _os_log_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_INFO, "Dispatching open URL: %@", buf, 0xCu);
    }
    v5 = -[VSRecognitionAction _session](self, "_session");
    v6 = self->_url;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__VSRecognitionURLAction_perform__block_invoke;
    v11[3] = &unk_1EA8AF948;
    v11[4] = self;
    objc_msgSend(v5, "_notifyDelegateOpenURL:completion:", v6, v11);
    return 0;
  }
  else
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_QWORD *)buf = *MEMORY[0x1E0C9AFB0];
    userInfoValues[0] = CFSTR("no URL to launch");
    v7 = CFErrorCreateWithUserInfoKeysAndValues(v8, CFSTR("VSErrorDomain"), -4005, (const void *const *)buf, (const void *const *)userInfoValues, 1);
    -[VSRecognitionAction completeWithNextAction:error:](self, "completeWithNextAction:error:", 0, v7);
    v9 = v7;
  }
  return v7;
}

void __33__VSRecognitionURLAction_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VSRecognitionURLAction_perform__block_invoke_2;
  v3[3] = &unk_1EA8AFFE0;
  v2 = *(_QWORD *)(a1 + 32);
  v3[4] = a2;
  v3[5] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __33__VSRecognitionURLAction_perform__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = VSGetLogDefault();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    v4 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_ERROR, "Open URL failed: %@", (uint8_t *)&v6, 0xCu);
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "completeWithNextAction:error:", 0, v4);
}

@end
