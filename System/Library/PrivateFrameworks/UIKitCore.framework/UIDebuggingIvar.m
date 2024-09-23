@implementation UIDebuggingIvar

+ (id)ivarWithObjcIvar:(objc_ivar *)a3 forObject:(id)a4
{
  id v6;
  uint64_t v7;
  const char *TypeEncoding;
  const __CFString *v9;
  id Ivar;

  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", ivar_getName(a3), 4);
  TypeEncoding = ivar_getTypeEncoding(a3);
  v9 = _UIDebugObjectTypeDescription(TypeEncoding);
  Ivar = object_getIvar(a4, a3);
  objc_msgSend(v6, "setObject:", a4);
  objc_msgSend(v6, "setObjcIvar:", a3);
  objc_msgSend(v6, "setName:", v7);
  objc_msgSend(v6, "setTypeEncoding:", ivar_getTypeEncoding(a3));
  objc_msgSend(v6, "setTypeDescription:", v9);
  objc_msgSend(v6, "setValue:", Ivar);
  return v6;
}

- (NSString)valueDescription
{
  NSObject *v3;
  __CFString *v4;

  v3 = -[UIDebuggingIvar object](self, "object");
  v4 = (__CFString *)((char *)v3 + ivar_getOffset(-[UIDebuggingIvar objcIvar](self, "objcIvar")));
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), _UIDebugIvarValue(v4, (char *)-[UIDebuggingIvar typeEncoding](self, "typeEncoding"), 0));
}

- (BOOL)isObject
{
  char v3;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", -[UIDebuggingIvar typeEncoding](self, "typeEncoding"), 4), "containsString:", CFSTR("@"));
  if (-[UIDebuggingIvar value](self, "value"))
    return v3;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  self->_object = 0;

  self->_name = 0;
  self->_typeDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingIvar;
  -[UIDebuggingIvar dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  self->_value = a3;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  self->_object = a3;
}

- (objc_ivar)objcIvar
{
  return self->_objcIvar;
}

- (void)setObjcIvar:(objc_ivar *)a3
{
  self->_objcIvar = a3;
}

- (const)typeEncoding
{
  return self->_typeEncoding;
}

- (void)setTypeEncoding:(const char *)a3
{
  self->_typeEncoding = a3;
}

@end
