@implementation SWLogMessageHandler

- (SWLogMessageHandler)initWithLogger:(id)a3
{
  id v5;
  SWLogMessageHandler *v6;
  SWLogMessageHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWLogMessageHandler;
  v6 = -[SWLogMessageHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logger, a3);

  return v7;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  objc_msgSend(a3, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("message"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = &stru_24DA0D700;
    if (v10)
      v6 = v10;
    v7 = v6;
    -[SWLogMessageHandler logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Logging message for WebContent embed: %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "log:", v9);
  }

}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
