@implementation SVXServiceCommandHandlerFallback

- (SVXServiceCommandHandlerFallback)initWithResult:(id)a3
{
  id v4;
  SVXServiceCommandHandlerFallback *v5;
  uint64_t v6;
  SVXServiceCommandResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXServiceCommandHandlerFallback;
  v5 = -[SVXServiceCommandHandlerFallback init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = v5->_result;
    v5->_result = (SVXServiceCommandResult *)v6;

  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.SiriVOXService.service-command.fallback");
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, SVXServiceCommandResult *);
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, SVXServiceCommandResult *))a6;
  v14 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315394;
    v19 = "-[SVXServiceCommandHandlerFallback handleCommand:withContext:taskTracker:completion:]";
    v20 = 2112;
    v21 = v17;
    _os_log_error_impl(&dword_214934000, v15, OS_LOG_TYPE_ERROR, "%s Service command handler is missing for %@. Please file a radar.", (uint8_t *)&v18, 0x16u);

    if (!v13)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v13)
LABEL_3:
    v13[2](v13, self->_result);
LABEL_4:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

+ (Class)supportedCommandClass
{
  return 0;
}

@end
