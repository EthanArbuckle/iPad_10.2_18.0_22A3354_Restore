@implementation SRUIFAceCommandRecord

- (SRUIFAceCommandRecord)initWithAceCommand:(id)a3 andCompletion:(id)a4
{
  id v7;
  id v8;
  SRUIFAceCommandRecord *v9;
  SRUIFAceCommandRecord *v10;
  uint64_t v11;
  id commandCompletion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFAceCommandRecord;
  v9 = -[SRUIFAceCommandRecord init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aceCommand, a3);
    v11 = MEMORY[0x220736DE0](v8);
    commandCompletion = v10->_commandCompletion;
    v10->_commandCompletion = (id)v11;

    v10->_result = 0;
  }

  return v10;
}

- (void)_setResult:(int64_t)a3
{
  id v4;

  if (self->_result != a3)
  {
    self->_result = a3;
    -[SRUIFAceCommandRecord delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceCommandRecordDidChangeResult:", self);

  }
}

- (void)_setNumberOfSuccessfullyCompletedActions:(int64_t)a3
{
  self->_numberOfSuccessfullyCompletedActions = a3;
}

- (void)_setNumberOfUnsuccessfullyCompletedActions:(int64_t)a3
{
  self->_numberOfUnsuccessfullyCompletedActions = a3;
}

- (void)_setNumberOfStoppedActions:(int64_t)a3
{
  self->_numberOfStoppedActions = a3;
}

- (void)incrementNumberOfStartedActions
{
  -[SRUIFAceCommandRecord _setNumberOfStartedActions:](self, "_setNumberOfStartedActions:", -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions") + 1);
}

- (void)incrementNumberOfStoppedActions
{
  -[SRUIFAceCommandRecord _setNumberOfStoppedActions:](self, "_setNumberOfStoppedActions:", -[SRUIFAceCommandRecord numberOfStoppedActions](self, "numberOfStoppedActions") + 1);
}

- (void)incrementNumberOfSuccessfullyCompletedActions
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  int64_t v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  int64_t v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SRUIFAceCommandRecord _setNumberOfSuccessfullyCompletedActions:](self, "_setNumberOfSuccessfullyCompletedActions:", -[SRUIFAceCommandRecord numberOfSuccessfullyCompletedActions](self, "numberOfSuccessfullyCompletedActions") + 1);
  v3 = -[SRUIFAceCommandRecord numberOfSuccessfullyCompletedActions](self, "numberOfSuccessfullyCompletedActions");
  v4 = -[SRUIFAceCommandRecord numberOfStoppedActions](self, "numberOfStoppedActions") + v3;
  v5 = -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions");
  if (-[SRUIFAceCommandRecord result](self, "result") != 2
    && -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions") == v4)
  {
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[SRUIFAceCommandRecord aceCommand](self, "aceCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 136316162;
      *(_QWORD *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 2048;
      v21 = -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions");
      *(_WORD *)v22 = 2048;
      *(_QWORD *)&v22[2] = -[SRUIFAceCommandRecord numberOfSuccessfullyCompletedActions](self, "numberOfSuccessfullyCompletedActions");
      *(_WORD *)&v22[10] = 2048;
      *(_QWORD *)&v22[12] = -[SRUIFAceCommandRecord numberOfStoppedActions](self, "numberOfStoppedActions");
      v10 = "%s #aceCommandRecord Marking ace command %@ as succeeded. %zd StartedActions == %zd SuccessfullyCompletedAct"
            "ions + %zd StoppedActions";
LABEL_9:
      _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, v10, v20, 0x34u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (-[SRUIFAceCommandRecord result](self, "result") != 2 && v4 - v5 == 1)
  {
    v11 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v11;
      -[SRUIFAceCommandRecord aceCommand](self, "aceCommand");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 136316162;
      *(_QWORD *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 2048;
      v21 = -[SRUIFAceCommandRecord numberOfSuccessfullyCompletedActions](self, "numberOfSuccessfullyCompletedActions");
      *(_WORD *)v22 = 2048;
      *(_QWORD *)&v22[2] = -[SRUIFAceCommandRecord numberOfStoppedActions](self, "numberOfStoppedActions");
      *(_WORD *)&v22[10] = 2048;
      *(_QWORD *)&v22[12] = -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions");
      v10 = "%s #aceCommandRecord Marking ace command %@ as succeeded while stopped. (%zd SuccessfullyCompletedActions + "
            "%zd StoppedActions) - %zd StartedActions == 1";
      goto LABEL_9;
    }
LABEL_10:
    -[SRUIFAceCommandRecord _setResult:](self, "_setResult:", 1, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, *(_OWORD *)v22, *(_QWORD *)&v22[16]);
    return;
  }
  v12 = -[SRUIFAceCommandRecord result](self, "result");
  v13 = (void *)*MEMORY[0x24BE08FB0];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v12 == 2)
  {
    if (!v14)
      return;
    v15 = v13;
    -[SRUIFAceCommandRecord aceCommand](self, "aceCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "aceId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 136315394;
    *(_QWORD *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
    *(_WORD *)&v20[12] = 2112;
    *(_QWORD *)&v20[14] = v17;
    _os_log_impl(&dword_219F26000, v15, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord Not marking ace command %@ as succeeded, because result is SRUIFAceCommandResultFailed.", v20, 0x16u);

  }
  else
  {
    if (!v14)
      return;
    v15 = v13;
    -[SRUIFAceCommandRecord aceCommand](self, "aceCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "aceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v20 = 136316162;
    *(_QWORD *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
    *(_WORD *)&v20[12] = 2112;
    *(_QWORD *)&v20[14] = v19;
    *(_WORD *)&v20[22] = 2048;
    v21 = -[SRUIFAceCommandRecord numberOfStartedActions](self, "numberOfStartedActions");
    *(_WORD *)v22 = 2048;
    *(_QWORD *)&v22[2] = -[SRUIFAceCommandRecord numberOfSuccessfullyCompletedActions](self, "numberOfSuccessfullyCompletedActions");
    *(_WORD *)&v22[10] = 2048;
    *(_QWORD *)&v22[12] = -[SRUIFAceCommandRecord numberOfStoppedActions](self, "numberOfStoppedActions");
    _os_log_impl(&dword_219F26000, v15, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord Not marking ace command %@ as succeeded. %zd StartedActions != %zd SuccessfullyCompletedActions + %zd StoppedActions", v20, 0x34u);

  }
}

- (void)incrementNumberOfUnsuccessfullyCompletedActions
{
  -[SRUIFAceCommandRecord _setNumberOfUnsuccessfullyCompletedActions:](self, "_setNumberOfUnsuccessfullyCompletedActions:", -[SRUIFAceCommandRecord numberOfUnsuccessfullyCompletedActions](self, "numberOfUnsuccessfullyCompletedActions") + 1);
  -[SRUIFAceCommandRecord _setResult:](self, "_setResult:", 2);
}

- (SAAceCommand)aceCommand
{
  return self->_aceCommand;
}

- (id)commandCompletion
{
  return self->_commandCompletion;
}

- (void)setCommandCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)result
{
  return self->_result;
}

- (int64_t)numberOfStartedActions
{
  return self->_numberOfStartedActions;
}

- (void)_setNumberOfStartedActions:(int64_t)a3
{
  self->_numberOfStartedActions = a3;
}

- (int64_t)numberOfSuccessfullyCompletedActions
{
  return self->_numberOfSuccessfullyCompletedActions;
}

- (int64_t)numberOfUnsuccessfullyCompletedActions
{
  return self->_numberOfUnsuccessfullyCompletedActions;
}

- (int64_t)numberOfStoppedActions
{
  return self->_numberOfStoppedActions;
}

- (SRUIFAceCommandRecordDelegate)delegate
{
  return (SRUIFAceCommandRecordDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_commandCompletion, 0);
  objc_storeStrong((id *)&self->_aceCommand, 0);
}

@end
