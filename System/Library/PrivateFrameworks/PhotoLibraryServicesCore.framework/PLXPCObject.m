@implementation PLXPCObject

+ (_xpc_type_s)type
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PLXPCObject)initWithXPCObject:(id)a3
{
  id v5;
  PLXPCObject *v6;
  PLXPCObject *v7;

  v5 = a3;
  v6 = -[PLXPCObject init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_object, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_object)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "encodeXPCObject:forKey:", self->_object, CFSTR("_xpcObject"));
  }

}

- (PLXPCObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PLXPCObject *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", objc_msgSend((id)objc_opt_class(), "type"), CFSTR("_xpcObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[PLXPCObject initWithXPCObject:](self, "initWithXPCObject:", v5);

  return v6;
}

- (OS_xpc_object)object
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
