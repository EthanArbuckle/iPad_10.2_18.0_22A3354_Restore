@implementation PKImageDescriptorSymbol

+ (id)createForName:(id)a3 withTintColor:(int64_t)a4
{
  return (id)objc_msgSend(a1, "createForName:withTintColor:hasBackground:", a3, a4, 0);
}

+ (id)createForName:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  if (!a3)
    return 0;
  v7 = a3;
  v8 = +[PKImageDescriptor _createForType:withTintColor:hasBackground:]((uint64_t)PKImageDescriptor, 1, a4, a5);
  v9 = objc_msgSend(v7, "copy");

  v10 = (void *)v8[4];
  v8[4] = v9;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptorSymbol)initWithCoder:(id)a3
{
  id v4;
  PKImageDescriptorSymbol *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKImageDescriptorSymbol;
  v5 = -[PKImageDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKImageDescriptorSymbol;
  v4 = a3;
  -[PKImageDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"), v5.receiver, v5.super_class);

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
