@implementation SUCoreDDMActivityScheduler

- (SUCoreDDMActivityScheduler)initWithDelegate:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  SUCoreDDMActivityScheduler *v9;
  id *p_isa;
  SUCoreDDMActivityScheduler *v11;
  void *v12;
  NSObject *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUCoreDDMActivityScheduler;
    v9 = -[SUCoreDDMActivityScheduler init](&v15, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_options, a4);
      objc_storeStrong(p_isa + 2, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SUCoreDDMActivityScheduler initWithDelegate:options:].cold.1();

    v11 = 0;
  }

  return v11;
}

- (BOOL)armActivitySchedulerWithDate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  xpc_object_t v25;
  time_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[5];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = (const char *)objc_opt_class();
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Arming", buf, 0xCu);
  }

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v10 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:].cold.2();
LABEL_9:

    v14 = 0;
    goto LABEL_28;
  }
  if (v7)
    -[SUCoreDDMActivityScheduler setOptions:](self, "setOptions:", v7);
  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 1);
  -[SUCoreDDMActivityScheduler setFireDate:](self, "setFireDate:", v6);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMActivityScheduler options](self, "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v43 = (const char *)v17;
    v44 = 2112;
    v45 = v18;
    v46 = 2112;
    v47 = v19;
    _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Fire date: %@, options: %@", buf, 0x20u);

  }
  if (-[SUCoreDDMActivityScheduler useXPC](self, "useXPC"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_1DDFDD000, v21, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using XPC alarm stream", buf, 0xCu);
    }

    -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceNow");
    v24 = v23;

    v25 = xpc_dictionary_create(0, 0, 0);
    v26 = time(0);
    xpc_dictionary_set_date(v25, "Date", (unint64_t)((v24 + (double)v26) * 1000000000.0));
    xpc_set_event();

  }
  if (-[SUCoreDDMActivityScheduler usePCSimpleTimer](self, "usePCSimpleTimer")
    && objc_opt_class()
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "oslog");
    v28 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using PCSimpleTimer", buf, 0xCu);
    }

    v29 = objc_alloc(MEMORY[0x1E0D70A40]);
    -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v30, CFSTR("com.apple.MobileSoftwareUpdate.DDMActivityScheduler"), self, sel__handleTimerFired_, 0);
    -[SUCoreDDMActivityScheduler setPcTimer:](self, "setPcTimer:", v31);

    -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scheduleInRunLoop:", v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "oslog");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_1DDFDD000, v35, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using NSTimer", buf, 0xCu);
    }

    v36 = objc_alloc(MEMORY[0x1E0C99E88]);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke;
    v41[3] = &unk_1EA8780D8;
    v41[4] = self;
    v37 = (void *)objc_msgSend(v36, "initWithFireDate:interval:repeats:block:", v6, 0, v41, 0.0);
    -[SUCoreDDMActivityScheduler setTimer:](self, "setTimer:", v37);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMActivityScheduler timer](self, "timer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addTimer:forMode:", v39, *MEMORY[0x1E0C99748]);

  }
  v14 = 1;
LABEL_28:

  return v14;
}

uint64_t __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTimerFired:", a2);
}

- (BOOL)armActivitySchedulerWithDate:(id)a3
{
  return -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:](self, "armActivitySchedulerWithDate:options:", a3, 0);
}

- (void)_handleTimerFired:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    -[SUCoreDDMActivityScheduler options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Fired with options: %@, fireDate: %@", (uint8_t *)&v11, 0x20u);

  }
  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 0);
  -[SUCoreDDMActivityScheduler delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMActivityScheduler options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeFiredForScheduler:withOptions:replyBlock:", self, v10, &__block_literal_global);

}

- (void)disarmActivityScheduler
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  if (-[SUCoreDDMActivityScheduler useXPC](self, "useXPC"))
    xpc_set_event();
  -[SUCoreDDMActivityScheduler timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUCoreDDMActivityScheduler timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[SUCoreDDMActivityScheduler setTimer:](self, "setTimer:", 0);
  }
  -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_opt_class())
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidate");

      -[SUCoreDDMActivityScheduler setPcTimer:](self, "setPcTimer:", 0);
    }
  }
  else
  {

  }
  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 0);
  -[SUCoreDDMActivityScheduler setFireDate:](self, "setFireDate:", 0);
}

- (SUCoreDDMActivitySchedulerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
}

- (BOOL)isArmed
{
  return self->_isArmed;
}

- (void)setIsArmed:(BOOL)a3
{
  self->_isArmed = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)usePCSimpleTimer
{
  return self->_usePCSimpleTimer;
}

- (void)setUsePCSimpleTimer:(BOOL)a3
{
  self->_usePCSimpleTimer = a3;
}

- (BOOL)useXPC
{
  return self->_useXPC;
}

- (void)setUseXPC:(BOOL)a3
{
  self->_useXPC = a3;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)pcTimer
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPcTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pcTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DDFDD000, v0, v1, "[DDM] %@: Can't init SUCoreDDMActivityScheduler with nil as delegate", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)armActivitySchedulerWithDate:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DDFDD000, v0, v1, "[DDM] %@: No custom date found to schedule update, bail", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)armActivitySchedulerWithDate:options:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DDFDD000, v0, v1, "[DDM] %@: Trying to schedule for a date earlier than now, bailing", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
