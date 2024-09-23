@implementation PLXPCGenericObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PLXPCGenericObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PLXPCGenericObject *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("_xpcObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[PLXPCObject initWithXPCObject:](self, "initWithXPCObject:", v5);

  return v6;
}

@end
