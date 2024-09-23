@implementation TPSSerializableObject

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
}

- (TPSSerializableObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSSerializableObject;
  return -[TPSSerializableObject init](&v4, sel_init, a3);
}

- (TPSSerializableObject)initWithDictionary:(id)a3
{
  id v4;
  TPSSerializableObject *v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    v7.receiver = self;
    v7.super_class = (Class)TPSSerializableObject;
    self = -[TPSSerializableObject init](&v7, sel_init);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: "), self);
}

@end
