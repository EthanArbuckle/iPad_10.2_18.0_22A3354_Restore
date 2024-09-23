@implementation SVXClientSessionService

- (void)handleWillChangeStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  SVXPerforming *performer;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionService handleWillChangeStateFrom:to:]";
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__SVXClientSessionService_handleWillChangeStateFrom_to___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (void)handleDidChangeStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  SVXPerforming *performer;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]";
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__SVXClientSessionService_handleDidChangeStateFrom_to___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (void)handleWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientSessionService handleWillPresentFeedbackWithDialogIdentifier:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s dialogIdentifier = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__SVXClientSessionService_handleWillPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)handleWillStartSoundWithID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  SVXPerforming *performer;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 6)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D238[a3];
    v8 = v7;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientSessionService handleWillStartSoundWithID:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__SVXClientSessionService_handleWillStartSoundWithID___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)handleDidStartSoundWithID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  SVXPerforming *performer;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 6)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24D238[a3];
    v8 = v7;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientSessionService handleDidStartSoundWithID:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__SVXClientSessionService_handleDidStartSoundWithID___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)handleDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  SVXPerforming *performer;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 6)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24D238[a3];
    v10 = v9;
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXClientSessionService handleDidStopSoundWithID:error:]";
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s soundID = %@, error = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__SVXClientSessionService_handleDidStopSoundWithID_error___block_invoke;
  v13[3] = &unk_24D24ECE8;
  v14 = v6;
  v15 = a3;
  v13[4] = self;
  v12 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)handleWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionService handleWillBecomeActiveWithActivationContext:turnID:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__SVXClientSessionService_handleWillBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)handleDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionService handleDidBecomeActiveWithActivationContext:turnID:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__SVXClientSessionService_handleDidBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)handleWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  SVXPerforming *performer;
  _QWORD v11[7];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    SVXSessionResignActiveOptionsGetNames(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v13 = "-[SVXClientSessionService handleWillResignActiveWithOptions:duration:]";
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s options = %@, duration = %f", buf, 0x20u);

  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__SVXClientSessionService_handleWillResignActiveWithOptions_duration___block_invoke;
  v11[3] = &unk_24D24ED50;
  v11[4] = self;
  v11[5] = a3;
  *(double *)&v11[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);
}

- (void)handleDidResignActiveWithDeactivationContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientSessionService handleDidResignActiveWithDeactivationContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deactivationContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SVXClientSessionService_handleDidResignActiveWithDeactivationContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (SVXClientSessionService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientSessionService *v10;
  SVXClientSessionService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSessionService;
  v10 = -[SVXClientSessionService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)clientServiceDidChange:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  SVXClientServiceProviding *clientServiceProvider;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  -[SVXClientSessionService fetchStateWithCompletion:](self, "fetchStateWithCompletion:", 0);
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke;
  v12[3] = &unk_24D24EAA8;
  v12[4] = self;
  v5 = (void *)MEMORY[0x2199D950C](v12);
  clientServiceProvider = self->_clientServiceProvider;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_3;
  v10[3] = &unk_24D24D908;
  v11 = v5;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_20;
  v8[3] = &unk_24D24DCA0;
  v9 = v11;
  v7 = v11;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v10, v8);

}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  SVXClientServiceProviding *clientServiceProvider;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SVXClientSessionService fetchStateWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke;
  v11[3] = &unk_24D24DAD8;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_4;
  v9[3] = &unk_24D24DCA0;
  v10 = v12;
  v8 = v12;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v11, v9);

}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  SVXClientServiceProviding *clientServiceProvider;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  clientServiceProvider = self->_clientServiceProvider;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v11[3] = &unk_24D24D908;
  v12 = v4;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_25;
  v9[3] = &unk_24D24DCA0;
  v10 = v12;
  v8 = v12;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v11, v9);

}

- (void)_setCurrentState:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  int64_t currentState;
  id WeakRetained;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    if ((unint64_t)a3 > 4)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24E7A8[a3];
    v9 = v8;
    v21 = 136315394;
    v22 = "-[SVXClientSessionService _setCurrentState:]";
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s currentState = %@", (uint8_t *)&v21, 0x16u);

  }
  currentState = self->_currentState;
  if (currentState != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sessionService:willChangeStateFrom:to:", self, currentState, a3);

    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v13 = self->_currentState;
      v14 = v12;
      if (v13 > 4)
        v15 = CFSTR("(unknown)");
      else
        v15 = off_24D24E7A8[v13];
      v16 = v15;
      v21 = 136315394;
      v22 = "-[SVXClientSessionService _setCurrentState:]";
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v21, 0x16u);

      v12 = *v5;
    }
    self->_currentState = a3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = v12;
      if ((unint64_t)a3 > 4)
        v18 = CFSTR("(unknown)");
      else
        v18 = off_24D24E7A8[a3];
      v19 = v18;
      v21 = 136315394;
      v22 = "-[SVXClientSessionService _setCurrentState:]";
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v21, 0x16u);

    }
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "sessionService:didChangeStateFrom:to:", self, currentState, a3);

  }
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (SVXClientSessionServiceDelegate)delegate
{
  return (SVXClientSessionServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v3[3] = &unk_24D24D930;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchAlarmAndTimerFiringContextWithCompletion:", v3);

}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __73__SVXClientSessionService_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v6
    && (v8 = *MEMORY[0x24BE08FB0], os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR)))
  {
    v11 = 136315394;
    v12 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_2";
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v11, 0x16u);
    if (!v5)
      goto LABEL_6;
  }
  else if (!v5)
  {
    goto LABEL_6;
  }
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SVXClientSessionService fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s alarmAndTimerFiringContext = %@", (uint8_t *)&v11, 0x16u);
  }
LABEL_6:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);

}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DAB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "fetchSessionStateWithCompletion:", v4);

}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[SVXClientSessionService fetchStateWithCompletion:]_block_invoke_4";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  if (a3)
    a2 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_3;
  v9[3] = &unk_24D24EB40;
  v9[4] = v5;
  v11 = a2;
  v10 = v6;
  v8 = a3;
  objc_msgSend(v7, "performBlock:", v9);

}

uint64_t __52__SVXClientSessionService_fetchStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __50__SVXClientSessionService_clientServiceDidChange___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];
  char v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_2;
  v5[3] = &unk_24D24DDE0;
  v5[4] = v2;
  v6 = a2;
  return objc_msgSend(v3, "performBlock:", v5);
}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__SVXClientSessionService_clientServiceDidChange___block_invoke_4;
  v3[3] = &unk_24D24D8E0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchSessionActivityStateWithCompletion:", v3);

}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SVXClientSessionService clientServiceDidChange:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SVXClientSessionService clientServiceDidChange:]_block_invoke_4";
      v8 = 2112;
      v9 = v4;
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__SVXClientSessionService_clientServiceDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  id WeakRetained;
  char v5;
  id v6;
  int v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 24) != v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 40));
    if (v2)
    {
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
        objc_msgSend(v6, "sessionService:didBecomeActiveWithActivationContext:", *(_QWORD *)(a1 + 32), 0);
LABEL_7:

      }
    }
    else
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
        objc_msgSend(v6, "sessionService:didResignActiveWithDeactivationContext:", *(_QWORD *)(a1 + 32), 0);
        goto LABEL_7;
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = *(_BYTE *)(a1 + 40);
  }
}

void __72__SVXClientSessionService_handleDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 0;
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[SVXClientSessionService handleDidResignActiveWithDeactivationContext:]_block_invoke";
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is inactive when end resigning active.", (uint8_t *)&v7, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v6, "sessionService:didResignActiveWithDeactivationContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __70__SVXClientSessionService_handleWillResignActiveWithOptions_duration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 24))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[SVXClientSessionService handleWillResignActiveWithOptions:duration:]_block_invoke";
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is inactive when begin resigning active.", (uint8_t *)&v5, 0xCu);
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
  objc_msgSend(WeakRetained, "sessionService:willResignActiveWithOptions:duration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));

}

void __77__SVXClientSessionService_handleDidBecomeActiveWithActivationContext_turnID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[SVXClientSessionService handleDidBecomeActiveWithActivationContext:turnID:]_block_invoke";
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is active when end becoming active.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(v2 + 24) = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)(a1[4] + 40));
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "sessionService:didBecomeActiveWithActivationContext:turnID:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      return;
    v7 = objc_loadWeakRetained((id *)(a1[4] + 40));
    objc_msgSend(v7, "sessionService:didBecomeActiveWithActivationContext:", a1[4], a1[5]);
  }

}

void __78__SVXClientSessionService_handleWillBecomeActiveWithActivationContext_turnID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[SVXClientSessionService handleWillBecomeActiveWithActivationContext:turnID:]_block_invoke";
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Client session activity state is active when begin becoming active.", (uint8_t *)&v9, 0xCu);
      v2 = a1[4];
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)(a1[4] + 40));
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "sessionService:willBecomeActiveWithActivationContext:turnID:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
      return;
    v7 = objc_loadWeakRetained((id *)(a1[4] + 40));
    objc_msgSend(v7, "sessionService:willBecomeActiveWithActivationContext:", a1[4], a1[5]);
  }

}

void __58__SVXClientSessionService_handleDidStopSoundWithID_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 40));
    objc_msgSend(v4, "sessionService:didStopSoundWithID:error:", a1[4], a1[6], a1[5]);

  }
}

void __53__SVXClientSessionService_handleDidStartSoundWithID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "sessionService:didStartSoundWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __54__SVXClientSessionService_handleWillStartSoundWithID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v4, "sessionService:willStartSoundWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __73__SVXClientSessionService_handleWillPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "sessionService:willPresentFeedbackWithDialogIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __55__SVXClientSessionService_handleDidChangeStateFrom_to___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  id WeakRetained;
  int v15;
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)a1[4];
  v3 = v2[4];
  if (v3 == a1[5])
  {
    v4 = (NSObject **)MEMORY[0x24BE08FB0];
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      if (v3 > 4)
        v7 = CFSTR("(unknown)");
      else
        v7 = off_24D24E7A8[v3];
      v8 = v7;
      v15 = 136315394;
      v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v15, 0x16u);

      v2 = (_QWORD *)a1[4];
      v5 = *v4;
    }
    v2[4] = a1[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1[4] + 32);
      v10 = v5;
      if (v9 > 4)
        v11 = CFSTR("(unknown)");
      else
        v11 = off_24D24E7A8[v9];
      v12 = v11;
      v15 = 136315394;
      v16 = "-[SVXClientSessionService handleDidChangeStateFrom:to:]_block_invoke";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v15, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
    objc_msgSend(WeakRetained, "sessionService:didChangeStateFrom:to:", a1[4], a1[5], a1[6]);

    v2 = (_QWORD *)a1[4];
  }
  return objc_msgSend(v2, "_setCurrentState:", a1[6]);
}

void __56__SVXClientSessionService_handleWillChangeStateFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) == *(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    objc_msgSend(WeakRetained, "sessionService:willChangeStateFrom:to:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

@end
