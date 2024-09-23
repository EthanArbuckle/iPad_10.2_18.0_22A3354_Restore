@implementation AWDObserver

- (AWDObserver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDObserver;
  return -[AWDObserver init](&v3, sel_init);
}

- (void)setDelegate:(id)a3 queue:(dispatch_queue_s *)a4
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
}

- (void)setConfiguration:(id)a3 callback:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v9, 2u);
  }
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("Wireless Diagnostics is deprecated and has been removed. Please migrate to Core Analytics.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.awd"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v8);

}

@end
