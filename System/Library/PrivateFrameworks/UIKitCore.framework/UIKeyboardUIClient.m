@implementation UIKeyboardUIClient

+ (id)serviceInterface
{
  if (qword_1ECD7F208 != -1)
    dispatch_once(&qword_1ECD7F208, &__block_literal_global_3_13);
  return (id)qword_1ECD7F200;
}

void __38__UIKeyboardUIClient_serviceInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", 0x1E17722A0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE024B98);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE0CEA68);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_1ECD7F200;
  qword_1ECD7F200 = v2;

}

+ (id)sharedInstance
{
  if (qword_1ECD7F210 != -1)
    dispatch_once(&qword_1ECD7F210, &__block_literal_global_10_4);
  return (id)qword_1ECD7F218;
}

void __36__UIKeyboardUIClient_sharedInstance__block_invoke()
{
  UIKeyboardUIClient *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardUIClient);
  v1 = (void *)qword_1ECD7F218;
  qword_1ECD7F218 = (uint64_t)v0;

}

- (UIKeyboardUIClient)init
{
  UIKeyboardUIClient *v2;
  UIKeyboardUIClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardUIClient;
  v2 = -[UIKeyboardUIClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIKeyboardUIClient _initConnectionIfNeeded](v2, "_initConnectionIfNeeded");
  return v3;
}

- (void)dealloc
{
  BSServiceConnectionClient *connection;
  objc_super v4;

  -[BSServiceConnectionClient invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardUIClient;
  -[UIKeyboardUIClient dealloc](&v4, sel_dealloc);
}

- (void)_initConnectionIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  BSServiceConnectionClient *v6;
  BSServiceConnectionClient *connection;
  BSServiceConnectionClient *v8;
  NSObject *v9;
  void *v10;
  BSServiceConnectionClient *v11;
  void *v12;
  UIKeyboardUIServiceProtocol *v13;
  UIKeyboardUIServiceProtocol *remoteTarget;
  _QWORD v15[4];
  NSObject *v16;
  UIKeyboardUIClient *v17;
  id v18;
  uint8_t buf[8];
  void *v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (!self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0D23018], "endpointForMachName:service:instance:", 0x1E17722A0, 0x1E17722A0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "serviceInterface");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      KeyboardUIClientLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Trying to establish BSServiceConnection to keyboard UI service.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:", v3);
      v6 = (BSServiceConnectionClient *)objc_claimAutoreleasedReturnValue();
      connection = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke;
      v15[3] = &unk_1E16D8C70;
      v9 = v4;
      v16 = v9;
      v17 = self;
      objc_copyWeak(&v18, location);
      -[BSServiceConnectionClient configureConnection:](v8, "configureConnection:", v15);
      -[BSServiceConnectionClient activate](self->_connection, "activate");
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_connection;
      v20 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](v11, "remoteTargetWithLaunchingAssertionAttributes:", v12);
      v13 = (UIKeyboardUIServiceProtocol *)objc_claimAutoreleasedReturnValue();
      remoteTarget = self->_remoteTarget;
      self->_remoteTarget = v13;

      objc_destroyWeak(&v18);
      objc_destroyWeak(location);
    }
    else
    {
      KeyboardUIClientLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = CFSTR("com.apple.inputservice.keyboardui");
        _os_log_error_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Failed to create endpoint for %@", (uint8_t *)location, 0xCu);
      }
    }

  }
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0D23040], "userInteractive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_19_4);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_20;
  v8[3] = &unk_1E16D8C48;
  a1 += 48;
  objc_copyWeak(&v9, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_21;
  v6[3] = &unk_1E16D8C48;
  objc_copyWeak(&v7, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  KeyboardUIClientLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI is activated: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  KeyboardUIClientLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI was interrupted: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "invalidate");
    v7 = (void *)v6[1];
    v6[1] = 0;

    v8 = (void *)v6[2];
    v6[2] = 0;

  }
}

void __45__UIKeyboardUIClient__initConnectionIfNeeded__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  KeyboardUIClientLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "BSServiceConnection for keyboard UI was invalidated: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 1), "invalidate");
    v7 = (void *)v6[1];
    v6[1] = 0;

    v8 = (void *)v6[2];
    v6[2] = 0;

  }
}

- (id)snapshotViewForOptions:(unint64_t)a3
{
  UIKeyboardUIServiceProtocol *remoteTarget;
  void *v6;
  void *v7;
  UIKeyboardUISnapshotView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIKeyboardUISnapshotView *v13;
  NSObject *v14;
  NSObject *v15;
  UIView *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  -[UIKeyboardUIClient _initConnectionIfNeeded](self, "_initConnectionIfNeeded");
  remoteTarget = self->_remoteTarget;
  if (remoteTarget
    && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[UIKeyboardUIServiceProtocol snapshotForOptions:](remoteTarget, "snapshotForOptions:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    v8 = [UIKeyboardUISnapshotView alloc];
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "size");
    v13 = -[UIView initWithFrame:](v8, "initWithFrame:", v9, v10, v11, v12);
    -[UIKeyboardUISnapshotView setSnapshot:](v13, "setSnapshot:", v7);
    KeyboardUIClientLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Received keyboard snapshot", buf, 2u);
    }

  }
  else
  {
    KeyboardUIClientLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "Failed to retrieve snapshot.", v18, 2u);
    }

    v16 = [UIView alloc];
    v13 = -[UIView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  return v13;
}

- (void)setKeyboardAlpha:(double)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  UIKeyboardUIServiceProtocol *remoteTarget;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  KeyboardUIClientLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218240;
    v13 = a3;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f, force=%d", (uint8_t *)&v12, 0x12u);
  }

  remoteTarget = self->_remoteTarget;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardUIServiceProtocol setKeyboardAlpha:force:processId:](remoteTarget, "setKeyboardAlpha:force:processId:", v9, v10, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
