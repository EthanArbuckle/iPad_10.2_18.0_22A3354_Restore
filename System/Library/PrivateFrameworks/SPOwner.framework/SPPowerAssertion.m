@implementation SPPowerAssertion

- (SPPowerAssertion)initWithReason:(id)a3 type:(unint64_t)a4 timeout:(double)a5
{
  id v9;
  SPPowerAssertion *v10;
  SPPowerAssertion *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPPowerAssertion;
  v10 = -[SPPowerAssertion init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reason, a3);
    v11->_type = a4;
    v11->_timeout = a5;
    v11->_powerAssertionId = 0;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v16;

  }
  return v11;
}

- (void)hold
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SPPowerAssertion_hold__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __24__SPPowerAssertion_hold__block_invoke(uint64_t a1)
{
  void *v2;
  const __CFDictionary *v3;
  IOReturn v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  const __CFDictionary *v10;
  __int16 v11;
  IOReturn v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = (void *)MEMORY[0x1AF455E74]();
    objc_msgSend(*(id *)(a1 + 32), "powerAssertionOption");
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    AssertionID = 0;
    v4 = IOPMAssertionCreateWithProperties(v3, &AssertionID);
    if (v4)
    {
      LogCategory_PowerManagement();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v10 = v3;
        v11 = 1024;
        v12 = v4;
        _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "IOPMAssertionCreateWithProperties %@ failed with error: (%d)", buf, 0x12u);
      }

    }
    else
    {
      LogCategory_PowerManagement();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "assertionName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        __24__SPPowerAssertion_hold__block_invoke_cold_1(v7, (int *)&AssertionID, buf, v6);
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = AssertionID;
    }

    objc_autoreleasePoolPop(v2);
  }
}

- (id)powerAssertionOption
{
  void *v3;
  double timeout;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_timeout >= 1.0)
    timeout = self->_timeout;
  else
    timeout = 1.0;
  -[SPPowerAssertion assertionType](self, "assertionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AssertType"));

  -[SPPowerAssertion assertionName](self, "assertionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AssertName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", timeout);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("TimeoutSeconds"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("TimeoutActionTurnOff"), CFSTR("TimeoutAction"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5E35E60, CFSTR("AssertLevel"));
  return v3;
}

- (id)assertionName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), v5, CFSTR("SPOwner"), self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assertionType
{
  if (self->_type == 1)
    return CFSTR("BackgroundTask");
  else
    return CFSTR("RequiresDisplayAudio");
}

- (void)drop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SPPowerAssertion_drop__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __24__SPPowerAssertion_drop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drop");
}

- (void)_drop
{
  IOPMAssertionID powerAssertionId;
  IOReturn v4;
  IOReturn v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  powerAssertionId = self->_powerAssertionId;
  if (powerAssertionId)
  {
    v4 = IOPMAssertionRelease(powerAssertionId);
    if (v4)
    {
      v5 = v4;
      LogCategory_PowerManagement();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109120;
        v7[1] = v5;
        _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "IOPMAssertionRelease failed with error: (%d)", (uint8_t *)v7, 8u);
      }

    }
    else
    {
      self->_powerAssertionId = 0;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SPPowerAssertion _drop](self, "_drop");
  v3.receiver = self;
  v3.super_class = (Class)SPPowerAssertion;
  -[SPPowerAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unsigned)powerAssertionId
{
  return self->_powerAssertionId;
}

- (void)setPowerAssertionId:(unsigned int)a3
{
  self->_powerAssertionId = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

void __24__SPPowerAssertion_hold__block_invoke_cold_1(void *a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v5;

  v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1AEA79000, log, OS_LOG_TYPE_DEBUG, "Successfully created assertion %@ with ID 0x%x", buf, 0x12u);

}

@end
