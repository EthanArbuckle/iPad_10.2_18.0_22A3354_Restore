@implementation TIMecabraIMLogger

+ (BOOL)isLoggingEnabled
{
  if (isLoggingEnabled_onceToken != -1)
    dispatch_once(&isLoggingEnabled_onceToken, &__block_literal_global_21046);
  return isLoggingEnabled_logLevel != 0;
}

CFIndex __37__TIMecabraIMLogger_isLoggingEnabled__block_invoke()
{
  CFIndex result;

  result = CFPreferencesGetAppIntegerValue(CFSTR("MecabraIMLogLevel"), CFSTR("com.apple.keyboard"), 0);
  isLoggingEnabled_logLevel = result;
  return result;
}

- (NSMutableString)loggedMessage
{
  NSMutableString *loggedMessage;
  NSMutableString *v4;
  NSMutableString *v5;

  loggedMessage = self->_loggedMessage;
  if (!loggedMessage)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v5 = self->_loggedMessage;
    self->_loggedMessage = v4;

    loggedMessage = self->_loggedMessage;
  }
  return loggedMessage;
}

- (void)beginLogging
{
  qword_1F0282EB8 = 0;
  xmmword_1F0282E98 = 0u;
  unk_1F0282EA8 = 0u;
  xmmword_1F0282E78 = 0u;
  unk_1F0282E88 = 0u;
  -[TIMecabraIMLogger markTime:](self, "markTime:", 0);
}

- (void)markTime:(unint64_t)a3
{
  unint64_t v3;

  if (a3 >= 0xA)
    v3 = 10;
  else
    v3 = a3;
  *(CFAbsoluteTime *)&gTimeStamps[v3] = CFAbsoluteTimeGetCurrent();
}

- (id)logFilePath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("mecabraIMLog.txt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)endLoggingForInput:(id)a3 atFinalTimeMark:(unint64_t)a4
{
  id v6;
  double v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  double *v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a3;
  if (a4 <= 0xA)
  {
    v22 = v6;
    -[TIMecabraIMLogger markTime:](self, "markTime:", a4);
    v7 = *(double *)gTimeStamps;
    v8 = 0.0;
    if (*(double *)gTimeStamps != 0.0)
    {
      v9 = *(double *)&gTimeStamps[a4];
      if (v9 != 0.0)
      {
        v7 = v9 - *(double *)gTimeStamps;
        *(float *)&v7 = v9 - *(double *)gTimeStamps;
        v8 = *(float *)&v7 * 1000.0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "string", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@; "), v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);

    if (a4)
    {
      v12 = (double *)&xmmword_1F0282E78;
      do
      {
        v13 = *(v12 - 1);
        v14 = 0.0;
        if (v13 != 0.0 && *v12 != 0.0)
          v14 = *v12 - v13;
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f(%.1f%%)"), (float)(v14 * 1000.0), (float)((float)((float)(v14 * 1000.0) / v8) * 100.0));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@; "), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendString:", v17);

        ++v12;
        --a4;
      }
      while (a4);
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f(%.1f%%)"), v8, (float)((float)(v8 / v8) * 100.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@\n"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v20);

    -[TIMecabraIMLogger loggedMessage](self, "loggedMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendString:", v10);

    v6 = v22;
  }

}

- (void)writeLogToFile
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TIMecabraIMLogger loggedMessage](self, "loggedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraIMLogger logFilePath](self, "logFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeToFile:atomically:encoding:error:", v4, 1, 4, 0);

  -[TIMecabraIMLogger setLoggedMessage:](self, "setLoggedMessage:", 0);
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      -[TIMecabraIMLogger logFilePath](self, "logFilePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%s TIMecabraIM: Log is written to file %@!"), "-[TIMecabraIMLogger writeLogToFile]", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

- (void)setLoggedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_loggedMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedMessage, 0);
}

@end
