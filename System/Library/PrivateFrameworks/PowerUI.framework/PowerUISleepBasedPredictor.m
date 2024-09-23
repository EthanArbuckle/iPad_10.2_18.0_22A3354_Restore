@implementation PowerUISleepBasedPredictor

- (PowerUISleepBasedPredictor)initWithLog:(id)a3
{
  id v5;
  PowerUISleepBasedPredictor *v6;
  PowerUISleepBasedPredictor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PowerUISleepBasedPredictor;
  v6 = -[PowerUISleepBasedPredictor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_log, a3);

  return v7;
}

- (unint64_t)predictorType
{
  return 4;
}

- (unint64_t)modelVersion
{
  return 1;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *log;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v36;
  double v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:", CFSTR("com.apple.das.smartcharging"));
  objc_msgSend(v4, "currentSleepScheduleWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "currentSleepScheduleStateWithError:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextEventDueAfterDate:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 3)
    {
      objc_msgSend(v8, "dueDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceNow");
      v11 = v10;

      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 134217984;
        v37 = v11;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Currently in winddown, offset until sleep starts: %f", (uint8_t *)&v36, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nextEventDueAfterDate:error:", v13, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v14;
    }
    objc_msgSend(v8, "dueDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "dateByAddingTimeInterval:", -1800.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 138412546;
        v37 = *(double *)&v16;
        v38 = 2112;
        v39 = v17;
        _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Wake up time set to: %@ - Target (adjusted) deadline: %@", (uint8_t *)&v36, 0x16u);
      }
    }
    else
    {
      v27 = self->_log;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[PowerUISleepBasedPredictor predictFullChargeDateWithBatteryLevel:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[PowerUISleepBasedPredictor predictFullChargeDateWithBatteryLevel:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (BOOL)shouldUseSleepPredictorWithLog:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9950]), "initWithIdentifier:", CFSTR("com.apple.das.smartcharging"));
  v14 = 0;
  objc_msgSend(v4, "currentSleepScheduleWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (!v5)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      v10 = "No sleep schedule found, use regular model. Error: %@";
      v11 = v3;
      v12 = 12;
LABEL_9:
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v4, "currentSleepScheduleStateWithError:", 0) & 0xFFFFFFFFFFFFFFFELL;
  v8 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v7 != 2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      v10 = "Not in winddown or sleep schedule, use regular model.";
      v11 = v3;
      v12 = 2;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    v9 = 1;
    _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_INFO, "In winddown or sleep schedule, use sleep schedule for OBC.", buf, 2u);
  }
  else
  {
    v9 = 1;
  }
LABEL_11:

  return v9;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)predictFullChargeDateWithBatteryLevel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215A71000, a1, a3, "No sleep schedule found while searching for sleep schedule wake up time", a5, a6, a7, a8, 0);
}

- (void)predictFullChargeDateWithBatteryLevel:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215A71000, a1, a3, "No dueDate found for wakeup event", a5, a6, a7, a8, 0);
}

@end
