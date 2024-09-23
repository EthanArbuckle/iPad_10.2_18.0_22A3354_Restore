@implementation PKXPCObject

+ (id)object:(id)a3
{
  id v3;
  PKXPCObject *v4;

  v3 = a3;
  v4 = -[PKXPCObject initWithObject:]([PKXPCObject alloc], "initWithObject:", v3);

  return v4;
}

- (PKXPCObject)initWithObject:(id)a3
{
  id v4;
  PKXPCObject *v5;
  PKXPCObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKXPCObject;
  v5 = -[PKXPCObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKXPCObject setObject:](v5, "setObject:", v4);

  return v6;
}

- (PKXPCObject)initWithCoder:(id)a3
{
  id v4;
  PKXPCObject *v5;
  void *v6;
  PKXPCObject *v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v9.receiver = self;
  v9.super_class = (Class)PKXPCObject;
  v5 = -[PKXPCObject init](&v9, sel_init);
  if (!v5
    || (objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("PlugInKit.object")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PKXPCObject setObject:](v5, "setObject:", v6),
        v6,
        -[PKXPCObject object](v5, "object"),
        v7 = (PKXPCObject *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."));
  -[PKXPCObject object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("PlugInKit.object"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_xpc_object)object
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
