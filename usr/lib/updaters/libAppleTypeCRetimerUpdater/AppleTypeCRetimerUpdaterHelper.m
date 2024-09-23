@implementation AppleTypeCRetimerUpdaterHelper

- (AppleTypeCRetimerUpdaterHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  AppleTypeCRetimerUpdaterHelper *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AppleTypeCRetimerUpdaterHelper;
  result = -[AppleTypeCRetimerUpdaterHelper init](&v8, sel_init, a3);
  if (result)
  {
    result->_logFunction = a4;
    result->_logContext = a5;
  }
  return result;
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

  -[AppleTypeCRetimerUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[AppleTypeCRetimerUpdaterHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
