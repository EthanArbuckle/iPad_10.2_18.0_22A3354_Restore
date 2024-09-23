@implementation ICSLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance;
}

void __27__ICSLogger_sharedInstance__block_invoke()
{
  ICSLogger *v0;
  void *v1;

  v0 = objc_alloc_init(ICSLogger);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 format:(id)a5 args:(char *)a6
{
  id v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  ICSLoggingDelegate *loggingDelegate;
  void *v17;
  void *v18;
  void *v19;
  int logCount;
  ICSLoggingDelegate *v21;
  void *v22;
  id v23;

  v23 = a4;
  v10 = a5;
  if (!self->_loggingDelegate || self->_logCount > 199)
    goto LABEL_13;
  if (!v23)
    goto LABEL_10;
  v11 = objc_msgSend(v23, "printedICS");
  if (a3 == 3 && (v11 & 1) == 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v23, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("ICS Error for file: %@"), v13);

    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), CFSTR("%%"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSLoggingDelegate logICSMessage:atLevel:](self->_loggingDelegate, "logICSMessage:atLevel:", v15, 3);
    objc_msgSend(v23, "setPrintedICS:", 1);
    ++self->_logCount;

  }
  if ((int)objc_msgSend(v23, "logCount") <= 4)
  {
    objc_msgSend(v23, "setLogCount:", objc_msgSend(v23, "logCount") + 1);
    if ((int)objc_msgSend(v23, "logCount") >= 5)
    {
      loggingDelegate = self->_loggingDelegate;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hit Max ICS log messages for file! (%i)"), 200);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSLoggingDelegate logICSMessage:atLevel:](loggingDelegate, "logICSMessage:atLevel:", v17, 3);

    }
LABEL_10:
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, a6);
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), CFSTR("%%"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSLoggingDelegate logICSMessage:atLevel:](self->_loggingDelegate, "logICSMessage:atLevel:", v19, a3);
    logCount = self->_logCount;
    self->_logCount = logCount + 1;
    if (logCount >= 199)
    {
      v21 = self->_loggingDelegate;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hit Max ICS log messages (%i), disabling logging!"), 200);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSLoggingDelegate logICSMessage:atLevel:](v21, "logICSMessage:atLevel:", v22, 3);

    }
  }
LABEL_13:

}

+ (void)logAtLevel:(int64_t)a3 forTokenizer:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = a5;
  v8 = a4;
  +[ICSLogger sharedInstance](ICSLogger, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logAtLevel:forTokenizer:format:args:", a3, v8, v7, &v10);

}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_loggingDelegate, a3);
}

+ (void)setDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ICSLogger sharedInstance](ICSLogger, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingDelegate, 0);
}

@end
