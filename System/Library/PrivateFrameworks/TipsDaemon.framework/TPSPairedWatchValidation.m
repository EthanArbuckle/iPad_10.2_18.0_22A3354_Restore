@implementation TPSPairedWatchValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = (void *)MEMORY[0x1E0D51838];
  v5 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getActivePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSPairedWatchValidation capability](self, "capability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TPSPairedWatchValidation capability](self, "capability");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "supportsCapability:", v9);

    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSPairedWatchValidation validateWithCompletion:].cold.1(self, (char)v8, v10);

  v5[2](v5, v8, 0);
}

- (TPSPairedWatchValidation)initWithCapability:(id)a3
{
  id v5;
  TPSPairedWatchValidation *v6;
  TPSPairedWatchValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSPairedWatchValidation;
  v6 = -[TPSPairedWatchValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_capability, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capability, 0);
}

- (NSUUID)capability
{
  return self->_capability;
}

- (void)setCapability:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "capability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - capability: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

}

@end
