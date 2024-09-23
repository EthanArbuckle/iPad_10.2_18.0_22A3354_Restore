@implementation TIMockUserModelDatabaseRow

- (TIMockUserModelDatabaseRow)initWithKey:(id)a3 inputMode:(id)a4 value:(id)a5 secondaryValue:(id)a6 realValue:(id)a7 properties:(id)a8 creationDate:(id)a9 lastUpdateDate:(id)a10
{
  id v17;
  TIMockUserModelDatabaseRow *v18;
  TIMockUserModelDatabaseRow *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TIMockUserModelDatabaseRow;
  v18 = -[TIMockUserModelDatabaseRow init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_inputMode, a4);
    objc_storeStrong((id *)&v19->_key, a3);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_secondaryValue, a6);
    objc_storeStrong((id *)&v19->_realValue, a7);
    objc_storeStrong((id *)&v19->_properties, a8);
    objc_storeStrong((id *)&v19->_creationDate, a9);
    objc_storeStrong((id *)&v19->_lastUpdateDate, a10);
  }

  return v19;
}

- (BOOL)isMatchSinceDate:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !v4 || -[NSDate compare:](self->_lastUpdateDate, "compare:", v4) == NSOrderedDescending;

  return v5;
}

- (BOOL)isMatchForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(a3, "isEqualToString:", self->_key)
     && (!v8 || objc_msgSend(v8, "isEqualToString:", self->_inputMode))
     && -[TIMockUserModelDatabaseRow isMatchSinceDate:](self, "isMatchSinceDate:", v9);

  return v10;
}

- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  unint64_t *v16;
  void *v17;
  _BOOL4 v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NSString hasPrefix:](self->_key, "hasPrefix:", v10)
    && (!v11 || objc_msgSend(v11, "isEqualToString:", self->_inputMode)))
  {
    -[NSString substringFromIndex:](self->_key, "substringFromIndex:", objc_msgSend(v10, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "containsObject:", v14);
    v16 = (unint64_t *)MEMORY[0x24BEB5258];
    if (!v15)
      v16 = (unint64_t *)MEMORY[0x24BEB5250];
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v13, -((double)(int)*MEMORY[0x24BEB5268] * (double)*v16));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIMockUserModelDatabaseRow isMatchSinceDate:](self, "isMatchSinceDate:", v17))
      v18 = !-[TIMockUserModelDatabaseRow isMatchSinceDate:](self, "isMatchSinceDate:", v13);
    else
      LOBYTE(v18) = 0;

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)isMatchForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a4;
  v9 = a5;
  v10 = -[NSString hasPrefix:](self->_key, "hasPrefix:", a3)
     && (!v8 || objc_msgSend(v8, "isEqualToString:", self->_inputMode))
     && -[TIMockUserModelDatabaseRow isMatchSinceDate:](self, "isMatchSinceDate:", v9);

  return v10;
}

- (NSString)inputMode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputMode:(id)a3
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

- (NSNumber)value
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)secondaryValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSecondaryValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)realValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRealValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSData)properties
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)lastUpdateDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_realValue, 0);
  objc_storeStrong((id *)&self->_secondaryValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
