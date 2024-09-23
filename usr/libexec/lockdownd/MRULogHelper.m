@implementation MRULogHelper

- (MRULogHelper)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  MRULogHelper *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRULogHelper;
  result = -[MRULogHelper init](&v8, "init", a3);
  if (result)
  {
    result->_logFunction = a4;
    result->_logContext = a5;
    result->_verbose = 1;
  }
  return result;
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

  -[MRULogHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

- (void)verboseLog:(id)a3
{
  uint64_t v3;

  if (self->_verbose)
    -[MRULogHelper logInternal:arguments:](self, "logInternal:arguments:", a3, &v3);
}

@end
