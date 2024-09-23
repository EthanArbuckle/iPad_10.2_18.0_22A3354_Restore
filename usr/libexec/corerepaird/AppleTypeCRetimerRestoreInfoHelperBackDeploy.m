@implementation AppleTypeCRetimerRestoreInfoHelperBackDeploy

- (AppleTypeCRetimerRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerRestoreInfoHelperBackDeploy *v9;
  AppleTypeCRetimerRestoreInfoHelperBackDeploy *v10;
  objc_class *v11;
  NSString *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AppleTypeCRetimerRestoreInfoHelperBackDeploy;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperBackDeploy init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy verboseLog:](v10, "verboseLog:", CFSTR("%@: options = %@"), v12, v8);

  }
  return v10;
}

- (void)logInternal:(id)a3 arguments:(char *)a4
{
  id v6;
  id v7;
  void *logContext;
  void (*logFunction)(void *, id);
  id v10;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:arguments:", v6, a4);

  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  logFunction = (void (*)(void *, id))self->_logFunction;
  logContext = self->_logContext;
  v10 = objc_retainAutorelease(v7);
  logFunction(logContext, objc_msgSend(v10, "UTF8String"));

}

- (void)log:(id)a3
{
  uint64_t v3;

  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
