@implementation PVObject

- (PVObject)initWithLocalIdentifier:(id)a3
{
  id v4;
  PVObject *v5;
  uint64_t v6;
  NSString *localIdentifier;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PVObject;
  v5 = -[PVObject init](&v10, sel_init);
  if (v5)
  {
    if (-[PVObject isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("AbstractClass"), CFSTR("'PVObject' cannot be directly instantiated. Use a subclass."), 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v9);
    }
    v6 = objc_msgSend(v4, "copy");
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalIdentifier:", self->_localIdentifier);
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n%@ <%p>:\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  localIdentifier        : %@\n"), self->_localIdentifier);
  return v3;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
