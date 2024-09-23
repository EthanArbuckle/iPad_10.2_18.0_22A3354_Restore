@implementation WPRanging

- (WPRanging)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  WPRanging *v8;
  WPRanging *v9;
  WPRanging *v10;
  NSObject *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (+[WPClient supportsRanging](WPClient, "supportsRanging"))
  {
    v13.receiver = self;
    v13.super_class = (Class)WPRanging;
    v8 = -[WPClient initWithQueue:machName:](&v13, sel_initWithQueue_machName_, v7, 0);
    v9 = v8;
    if (v8)
      objc_storeWeak((id *)&v8->_delegate, v6);
    self = v9;
    v10 = self;
  }
  else
  {
    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_2);
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR))
      -[WPRanging initWithDelegate:queue:].cold.1(v11);
    v10 = 0;
  }

  return v10;
}

- (id)clientAsString
{
  return CFSTR("WPRanging");
}

- (void)invalidate
{
  objc_super v3;

  -[WPRanging setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WPRanging;
  -[WPClient invalidate](&v3, sel_invalidate);
}

- (void)enableRanging:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_80);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "Ranging enableRanging:%d", buf, 8u);
  }
  v7[1] = 3221225472;
  v7[2] = __27__WPRanging_enableRanging___block_invoke_81;
  v7[3] = &unk_24C285E60;
  v7[4] = self;
  v8 = v3;
  v6.receiver = self;
  v6.super_class = (Class)WPRanging;
  v7[0] = MEMORY[0x24BDAC760];
  -[WPClient enableRanging:reply:](&v6, sel_enableRanging_reply_, v3, v7);
}

uint64_t __27__WPRanging_enableRanging___block_invoke_81(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rangingEnabled:withError:", *(unsigned __int8 *)(a1 + 40), a2);
}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_85);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v4;
    _os_log_impl(&dword_209E41000, v7, OS_LOG_TYPE_DEFAULT, "WPRanging enable ranging:%d with reply", buf, 8u);
  }
  v8.receiver = self;
  v8.super_class = (Class)WPRanging;
  -[WPClient enableRanging:reply:](&v8, sel_enableRanging_reply_, v4, v6);

}

- (void)isRangingEnabledReply:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v4 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_86);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209E41000, v5, OS_LOG_TYPE_DEFAULT, "WPRanging is ranging enabled?", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)WPRanging;
  -[WPClient isRangingEnabledReply:](&v6, sel_isRangingEnabledReply_, v4);

}

- (void)stateDidChange:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WPRanging;
  -[WPClient stateDidChange:](&v7, sel_stateDidChange_, a3);
  -[WPRanging delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WPRanging delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rangingDidUpdateState:", self);

  }
}

- (void)rangingEnabled:(BOOL)a3 withError:(id)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[WPRanging delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WPRanging delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ranging:enabled:withError:", self, v4, v9);

  }
}

- (WPRangingDelegate)delegate
{
  return (WPRangingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(os_log_t)log queue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E41000, log, OS_LOG_TYPE_ERROR, "Ranging is not supported on this platform", v1, 2u);
}

@end
