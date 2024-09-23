@implementation Ace3SoCRestoreInfoHelperBackDeploy

- (Ace3SoCRestoreInfoHelperBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  Ace3SoCRestoreInfoHelperBackDeploy *v9;
  Ace3SoCRestoreInfoHelperBackDeploy *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)Ace3SoCRestoreInfoHelperBackDeploy;
  v9 = -[Ace3SoCRestoreInfoHelperBackDeploy init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    v9->_logFunction = a4;
    v9->_logContext = a5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Options")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Verbose")));

    if (v12)
      v10->_verbose = 1;
    v13 = (objc_class *)objc_opt_class(v10);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[Ace3SoCRestoreInfoHelperBackDeploy verboseLog:](v10, "verboseLog:", CFSTR("%@: options = %@"), v15, v8);

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

  -[Ace3SoCRestoreInfoHelperBackDeploy logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[Ace3SoCRestoreInfoHelperBackDeploy logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
