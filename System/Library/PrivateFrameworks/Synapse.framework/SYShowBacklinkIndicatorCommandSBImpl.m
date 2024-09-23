@implementation SYShowBacklinkIndicatorCommandSBImpl

- (SYShowBacklinkIndicatorCommandSBImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6;
  id v7;
  SYShowBacklinkIndicatorCommandSBImpl *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  SBSSystemNotesPresentationHandle *handle;
  objc_super v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SYShowBacklinkIndicatorCommandSBImpl;
  v8 = -[SYShowBacklinkIndicatorCommandSBImpl init](&v20, sel_init);
  if (v8 && objc_msgSend(v7, "count"))
  {
    SYMakeEditNoteUserActivity(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v10 = (void *)getSBSSystemNotesPresentationConfigurationClass_softClass;
    v24 = getSBSSystemNotesPresentationConfigurationClass_softClass;
    if (!getSBSSystemNotesPresentationConfigurationClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSBSSystemNotesPresentationConfigurationClass_block_invoke;
      v26 = &unk_1E757B260;
      v27 = &v21;
      __getSBSSystemNotesPresentationConfigurationClass_block_invoke((uint64_t)buf);
      v10 = (void *)v22[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v21, 8);
    v12 = (void *)objc_msgSend([v11 alloc], "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:", CFSTR("com.apple.mobilenotes"), v9, 1);
    v13 = os_log_create("com.apple.synapse", "BacklinkMonitor");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Creating notes presentation handle with link identifier count: %ld.", buf, 0x16u);
    }

    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v15 = (void *)getSBSSystemNotesPresentationHandleClass_softClass;
    v24 = getSBSSystemNotesPresentationHandleClass_softClass;
    if (!getSBSSystemNotesPresentationHandleClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSBSSystemNotesPresentationHandleClass_block_invoke;
      v26 = &unk_1E757B260;
      v27 = &v21;
      __getSBSSystemNotesPresentationHandleClass_block_invoke((uint64_t)buf);
      v15 = (void *)v22[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v21, 8);
    v17 = objc_msgSend([v16 alloc], "initWithConfiguration:", v12);
    handle = v8->__handle;
    v8->__handle = (SBSSystemNotesPresentationHandle *)v17;

    -[SBSSystemNotesPresentationHandle addObserver:](v8->__handle, "addObserver:", v8);
  }

  return v8;
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[SYShowBacklinkIndicatorCommandSBImpl _handle](self, "_handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)runWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  SYShowBacklinkIndicatorCommandSBImpl *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[SYShowBacklinkIndicatorCommandSBImpl _handle](self, "_handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Sending notes presentation handle with link identifiers.", (uint8_t *)&v8, 0xCu);
    }

    -[SYShowBacklinkIndicatorCommandSBImpl _handle](self, "_handle");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject activate](v6, "activate");
  }
  else if (v7)
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Not sending notes presentation request, no link identifiers.", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
    v4[2](v4);

}

- (void)invalidate
{
  id v2;

  -[SYShowBacklinkIndicatorCommandSBImpl _handle](self, "_handle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)systemNotesPresentationHandle:(id)a3 didChangePresentationMode:(int64_t)a4
{
  NSObject *v6;
  int v7;
  SYShowBacklinkIndicatorCommandSBImpl *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = a4;
    _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "BackLinkIndicatorCommand %p: Notes presentation request changed mode to %ld.", (uint8_t *)&v7, 0x16u);
  }

}

- (SBSSystemNotesPresentationHandle)_handle
{
  return self->__handle;
}

- (void)set_handle:(id)a3
{
  objc_storeStrong((id *)&self->__handle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__handle, 0);
}

@end
