@implementation VUIMPMediaLibraryConnectOperation

- (VUIMPMediaLibraryConnectOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIMPMediaLibraryConnectOperation)initWithMediaLibrary:(id)a3
{
  id v5;
  VUIMPMediaLibraryConnectOperation *v6;
  VUIMPMediaLibraryConnectOperation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
  v9.receiver = self;
  v9.super_class = (Class)VUIMPMediaLibraryConnectOperation;
  v6 = -[VUIMPMediaLibraryConnectOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);

  return v7;
}

- (void)executionDidBegin
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMPMediaLibraryConnectOperation mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Starting connection to %@", buf, 0xCu);

  }
  -[VUIMPMediaLibraryConnectOperation _startProgressTimer](self, "_startProgressTimer");
  objc_initWeak((id *)buf, self);
  -[VUIMPMediaLibraryConnectOperation mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__VUIMPMediaLibraryConnectOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_1E9F9C880;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v6, "connectWithCompletionHandler:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __54__VUIMPMediaLibraryConnectOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSuccess:", v3 == 0);
    objc_msgSend(v5, "setError:", v3);
    objc_msgSend(v5, "_stopProgressTimer");
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "mediaLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      VUIBoolLogString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Connect attempt finished to %@ (Success = %@)", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v5, "finishExecutionIfPossible");
  }

}

- (void)_startProgressTimer
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  v4 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v3, v4, 0x1DCD6500uLL, 0);
  -[VUIMPMediaLibraryConnectOperation setProgressTimer:](self, "setProgressTimer:", v3);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VUIMPMediaLibraryConnectOperation__startProgressTimer__block_invoke;
  v5[3] = &unk_1E9F99C98;
  objc_copyWeak(&v6, &location);
  dispatch_source_set_event_handler(v3, v5);
  dispatch_activate(v3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __56__VUIMPMediaLibraryConnectOperation__startProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  int v4;
  double v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "mediaLibrary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "connectionProgress");
    v4 = v3;

    LODWORD(v5) = v4;
    objc_msgSend(v6, "_notifyClientOfProgress:", v5);
    WeakRetained = v6;
  }

}

- (void)_stopProgressTimer
{
  NSObject *source;

  -[VUIMPMediaLibraryConnectOperation progressTimer](self, "progressTimer");
  source = objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaLibraryConnectOperation setProgressTimer:](self, "setProgressTimer:", 0);
  dispatch_source_cancel(source);

}

- (void)_notifyClientOfProgress:(float)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMPMediaLibraryConnectOperation mediaLibrary](self, "mediaLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Connection progress to %@ (Progress = %@)", (uint8_t *)&v12, 0x16u);

  }
  -[VUIMPMediaLibraryConnectOperation progressBlock](self, "progressBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, float))(v10 + 16))(v10, a3);

}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (OS_dispatch_source)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
