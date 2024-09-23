@implementation SVXAudioSessionAssertion

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXAudioSessionAssertion;
  -[SVXAudioSessionAssertion description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {reason = %@, audioSessionID = %lu, taskTracker = %@}"), v4, self->_reason, self->_audioSessionID, self->_taskTracker);

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SVXAudioSessionAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_taskTracker)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "-[SVXAudioSessionAssertion dealloc]";
      v7 = 2112;
      v8 = self;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@ is released without explicitly calling -relinquish.", buf, 0x16u);
    }
  }
  -[AFSafetyBlock invokeWithSignal:](self->_relinquishHandler, "invokeWithSignal:", -1);
  v4.receiver = self;
  v4.super_class = (Class)SVXAudioSessionAssertion;
  -[SVXAudioSessionAssertion dealloc](&v4, sel_dealloc);
}

- (SVXAudioSessionAssertion)initWithReason:(id)a3 audioSessionID:(unsigned int)a4 taskTracker:(id)a5 relinquishHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVXAudioSessionAssertion *v13;
  uint64_t v14;
  NSString *reason;
  id v16;
  uint64_t v17;
  AFSafetyBlock *relinquishHandler;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  SVXAudioSessionAssertion *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SVXAudioSessionAssertion;
  v13 = -[SVXAudioSessionAssertion init](&v23, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    v13->_audioSessionID = a4;
    objc_storeStrong((id *)&v13->_taskTracker, a5);
    v16 = objc_alloc(MEMORY[0x24BE09290]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __88__SVXAudioSessionAssertion_initWithReason_audioSessionID_taskTracker_relinquishHandler___block_invoke;
    v21[3] = &unk_24D24E950;
    v22 = v12;
    v17 = objc_msgSend(v16, "initWithBlock:", v21);
    relinquishHandler = v13->_relinquishHandler;
    v13->_relinquishHandler = (AFSafetyBlock *)v17;

    v19 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SVXAudioSessionAssertion initWithReason:audioSessionID:taskTracker:relinquishHandler:]";
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_214934000, v19, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

  }
  return v13;
}

- (void)relinquish
{
  NSObject *v3;
  SVXTaskTracking *taskTracker;
  int v5;
  const char *v6;
  __int16 v7;
  SVXAudioSessionAssertion *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[SVXAudioSessionAssertion relinquish]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  taskTracker = self->_taskTracker;
  self->_taskTracker = 0;

  -[AFSafetyBlock invokeWithSignal:](self->_relinquishHandler, "invokeWithSignal:", 0);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)reason
{
  return self->_reason;
}

- (SVXTaskTracking)taskTracker
{
  return self->_taskTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_relinquishHandler, 0);
}

uint64_t __88__SVXAudioSessionAssertion_initWithReason_audioSessionID_taskTracker_relinquishHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
