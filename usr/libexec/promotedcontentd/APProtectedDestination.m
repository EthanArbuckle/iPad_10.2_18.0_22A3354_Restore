@implementation APProtectedDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSString)value
{
  return self->_value;
}

- (APProtectedDestination)initWithString:(id)a3
{
  id v4;
  APProtectedDestination *v5;
  uint64_t v6;
  NSString *value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APProtectedDestination;
  v5 = -[APProtectedDestination init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sha256hash"));
    value = v5->_value;
    v5->_value = (NSString *)v6;

  }
  return v5;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
