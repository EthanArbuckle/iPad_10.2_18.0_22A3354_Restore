@implementation SoCUpdaterHelper

- (SoCUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  SoCUpdaterHelper *v9;
  SoCUpdaterHelper *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SoCUpdaterHelper;
  v9 = -[SoCUpdaterHelper init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Verbose"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v10->_verbose = 1;

  }
  return v10;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *logContext;
  void (*logFunction)(void *, uint64_t);
  id v11;

  v6 = (objc_class *)MEMORY[0x24BDD16A8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a4);

  objc_msgSend(v8, "appendString:", CFSTR("\n"));
  logFunction = (void (*)(void *, uint64_t))self->_logFunction;
  logContext = self->_logContext;
  v11 = objc_retainAutorelease(v8);
  logFunction(logContext, objc_msgSend(v11, "UTF8String"));

}

- (void)log:(id)a3
{
  uint64_t v3;

  -[SoCUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[SoCUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
