@implementation OS_os_transaction

- (OS_os_transaction)init
{
  char *v2;

  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)dealloc
{
  objc_super v3;

  _xpc_os_transaction_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_transaction;
  -[OS_os_transaction dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id result;
  id v4;
  uint64_t description;
  uint64_t v6;
  objc_class *v7;

  result = objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    description = os_transaction_get_description((uint64_t)self);
    v6 = objc_msgSend(v4, "stringWithUTF8String:", "<%s: %s>");
    v7 = (objc_class *)objc_opt_class();
    return (id)objc_msgSend(v4, "stringWithFormat:", v6, class_getName(v7), description);
  }
  return result;
}

@end
