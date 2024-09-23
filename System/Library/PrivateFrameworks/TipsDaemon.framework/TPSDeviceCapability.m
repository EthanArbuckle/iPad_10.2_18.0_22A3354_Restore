@implementation TPSDeviceCapability

- (int64_t)type
{
  return self->_type;
}

- (TPSDeviceCapability)initWithDictionary:(id)a3
{
  id v4;
  TPSDeviceCapability *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSDeviceCapability;
  v5 = -[TPSCapability initWithDictionary:](&v7, sel_initWithDictionary_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "TPSSafeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)TPSDeviceCapability;
  -[TPSCapability debugDescription](&v7, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %ld"), CFSTR("type"), -[TPSDeviceCapability type](self, "type"));
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
