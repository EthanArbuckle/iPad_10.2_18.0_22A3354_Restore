@implementation TUGroupTitle

- (TUGroupTitle)initWithString:(id)a3
{
  id v4;
  TUGroupTitle *v5;
  TUGroupTitle *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUGroupTitle;
  v5 = -[TUGroupTitle init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TUGroupTitle setValue:](v5, "setValue:", v4);

  return v6;
}

- (NSString)callerId
{
  return 0;
}

- (CNContact)backingContact
{
  return 0;
}

- (NSString)backingContactIdentifier
{
  return 0;
}

- (NSString)destinationId
{
  return 0;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1E38A53C8;
}

- (NSArray)handles
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (int64_t)mostRecentCallType
{
  return 0;
}

- (BOOL)mostRecentCallWasMissed
{
  return 0;
}

- (NSArray)idsCanonicalDestinations
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
