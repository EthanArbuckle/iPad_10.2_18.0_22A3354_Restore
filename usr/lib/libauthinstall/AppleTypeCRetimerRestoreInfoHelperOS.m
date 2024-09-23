@implementation AppleTypeCRetimerRestoreInfoHelperOS

- (AppleTypeCRetimerRestoreInfoHelperOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerRestoreInfoHelperOS *v9;
  AppleTypeCRetimerRestoreInfoHelperOS *v10;
  objc_class *v11;
  NSString *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AppleTypeCRetimerRestoreInfoHelperOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](v10, "verboseLog:", CFSTR("%@: options = %@"), v12, v8);

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

  -[AppleTypeCRetimerRestoreInfoHelperOS logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[AppleTypeCRetimerRestoreInfoHelperOS logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
