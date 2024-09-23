@implementation SiriLongPressButtonConfiguration

- (SiriLongPressButtonConfiguration)initWithButtonIdentifier:(int64_t)a3
{
  SiriLongPressButtonConfiguration *v4;
  SiriLongPressButtonConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriLongPressButtonConfiguration;
  v4 = -[SiriLongPressButtonConfiguration init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_buttonIdentifer = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v7;

    v5->_longPressBehavior = 0;
  }
  return v5;
}

- (double)longPressInterval
{
  double result;

  if (self->_longPressBehavior == 1)
    return 0.65;
  result = 0.4;
  if (self->_buttonIdentifer == 9)
    return 0.25;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SiriLongPressButtonConfiguration *v4;
  SiriLongPressButtonConfiguration *v5;

  v4 = -[SiriLongPressButtonConfiguration initWithButtonIdentifier:]([SiriLongPressButtonConfiguration alloc], "initWithButtonIdentifier:", self->_buttonIdentifer);
  -[SiriLongPressButtonConfiguration setLongPressBehavior:](v4, "setLongPressBehavior:", -[SiriLongPressButtonConfiguration longPressBehavior](self, "longPressBehavior"));
  v5 = self;

  return v5;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)buttonIdentifer
{
  return self->_buttonIdentifer;
}

- (int64_t)longPressBehavior
{
  return self->_longPressBehavior;
}

- (void)setLongPressBehavior:(int64_t)a3
{
  self->_longPressBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
