@implementation OS_xpc_object

- (OS_xpc_object)init
{
  char *v2;

  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)dealloc
{
  objc_super v3;

  _xpc_dispose(self);
  v3.receiver = self;
  v3.super_class = (Class)OBJC_CLASS___OS_xpc_object;
  -[OS_xpc_object dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  NSString *result;
  NSString *v4;
  char *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;

  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    v4 = result;
    v5 = xpc_copy_description(self);
    v6 = -[NSString stringWithUTF8String:](v4, "stringWithUTF8String:", "<%s: %s>");
    v7 = (objc_class *)objc_opt_class();
    v8 = -[NSString stringWithFormat:](v4, "stringWithFormat:", v6, class_getName(v7), v5);
    free(v5);
    return v8;
  }
  return result;
}

- (NSString)debugDescription
{
  Class v3;
  char *v4;
  uint64_t v5;
  objc_class *v6;
  char __str[4096];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  v3 = objc_lookUpClass("NSString");
  if (v3)
  {
    bzero(__str, 0x1000uLL);
    _xpc_base_debug(self, __str, 0x1000uLL);
    v4 = xpc_copy_description(self);
    v5 = -[objc_class stringWithUTF8String:](v3, "stringWithUTF8String:", "<%s: %s %s>");
    v6 = (objc_class *)objc_opt_class();
    v3 = (Class)-[objc_class stringWithFormat:](v3, "stringWithFormat:", v5, class_getName(v6), __str, v4);
    free(v4);
  }
  return (NSString *)v3;
}

@end
