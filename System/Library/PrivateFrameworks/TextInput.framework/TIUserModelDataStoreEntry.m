@implementation TIUserModelDataStoreEntry

- (TIUserModelDataStoreEntry)initWithTimestamp:(id)a3 withKey:(id)a4 withInputMode:(id)a5 withValue:(id)a6 withSecondaryValue:(id)a7 withRealValue:(id)a8 withProperties:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  TIUserModelDataStoreEntry *v22;
  TIUserModelDataStoreEntry *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v25.receiver = self;
  v25.super_class = (Class)TIUserModelDataStoreEntry;
  v22 = -[TIUserModelDataStoreEntry init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    -[TIUserModelDataStoreEntry setTimestamp:](v22, "setTimestamp:", v15);
    -[TIUserModelDataStoreEntry setKey:](v23, "setKey:", v16);
    -[TIUserModelDataStoreEntry setInputMode:](v23, "setInputMode:", v17);
    -[TIUserModelDataStoreEntry setValue:](v23, "setValue:", v18);
    -[TIUserModelDataStoreEntry setSecondaryValue:](v23, "setSecondaryValue:", v19);
    -[TIUserModelDataStoreEntry setRealValue:](v23, "setRealValue:", v20);
    -[TIUserModelDataStoreEntry setProperties:](v23, "setProperties:", v21);
  }

  return v23;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)inputMode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)secondaryValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecondaryValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)realValue
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRealValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)properties
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_realValue, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
