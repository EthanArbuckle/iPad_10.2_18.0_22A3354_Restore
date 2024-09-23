@implementation CLDaemonClientAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLDaemonClientAdapter)initWithDaemonClient:(void *)a3
{
  CLDaemonClientAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLDaemonClientAdapter;
  result = -[CLDaemonClientAdapter init](&v5, "init");
  if (result)
    result->_client = a3;
  return result;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)client
{
  return self->_client;
}

- (void)setClient:(void *)a3
{
  self->_client = a3;
}

@end
