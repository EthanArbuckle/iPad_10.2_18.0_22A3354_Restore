@implementation PETTestLoggingOutlet

- (PETTestLoggingOutlet)init
{
  PETTestLoggingOutlet *v2;
  uint64_t v3;
  NSMutableArray *allLoggedKeys;
  uint64_t v5;
  NSMutableArray *allLoggedValues;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyValues;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PETTestLoggingOutlet;
  v2 = -[PETTestLoggingOutlet init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    allLoggedKeys = v2->_allLoggedKeys;
    v2->_allLoggedKeys = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    allLoggedValues = v2->_allLoggedValues;
    v2->_allLoggedValues = (NSMutableArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyValues = v2->_keyValues;
    v2->_keyValues = v7;

  }
  return v2;
}

- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  void *v9;
  void *v10;
  NSString *lastLoggedKey;
  id v12;
  NSMutableArray *allLoggedValues;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v9;
      v20 = 1024;
      v21 = 255;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v18, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), CFSTR("key exceeds max length"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  lastLoggedKey = self->_lastLoggedKey;
  self->_previousLoggedScalarValue = self->_lastLoggedScalarValue;
  self->_lastLoggedKey = (NSString *)v9;
  v12 = v9;

  self->_lastLoggedScalarValue = a3;
  -[NSMutableArray addObject:](self->_allLoggedKeys, "addObject:", v12);
  allLoggedValues = self->_allLoggedValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allLoggedValues, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyValues, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyValues, "setObject:forKeyedSubscript:", v17, v12);

}

- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  void *v9;
  void *v10;
  NSString *lastLoggedKey;
  id v12;
  NSMutableArray *allLoggedValues;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 1024;
      v19 = 255;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v16, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), CFSTR("key exceeds max length"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  lastLoggedKey = self->_lastLoggedKey;
  self->_previousLoggedScalarValue = self->_lastLoggedScalarValue;
  self->_lastLoggedKey = (NSString *)v9;
  v12 = v9;

  self->_lastLoggedScalarValue = a3;
  -[NSMutableArray addObject:](self->_allLoggedKeys, "addObject:", v12);
  allLoggedValues = self->_allLoggedValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allLoggedValues, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyValues, "setObject:forKeyedSubscript:", v15, v12);

}

- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  void *v9;
  void *v10;
  NSString *lastLoggedKey;
  id v12;
  NSMutableArray *allLoggedValues;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") >= 0x100)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412546;
      v20 = v9;
      v21 = 1024;
      v22 = 255;
      _os_log_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AggD key %@ exceeds max length of %d. Try to shorten the event/property names", (uint8_t *)&v19, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), CFSTR("key exceeds max length"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  objc_storeStrong((id *)&self->_previousLoggedKey, self->_lastLoggedKey);
  self->_previousLoggedDistributionValue = self->_lastLoggedDistributionValue;
  lastLoggedKey = self->_lastLoggedKey;
  self->_lastLoggedKey = (NSString *)v9;
  v12 = v9;

  self->_lastLoggedDistributionValue = a3;
  -[NSMutableArray addObject:](self->_allLoggedKeys, "addObject:", v12);
  allLoggedValues = self->_allLoggedValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](allLoggedValues, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyValues, "objectForKeyedSubscript:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v15, "numberWithDouble:", v17 + a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyValues, "setObject:forKeyedSubscript:", v18, v12);

}

- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("PETEventTrackingException"), a5, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise");

}

- (void)reset
{
  NSString *previousLoggedKey;
  NSString *lastLoggedKey;
  NSMutableArray *v5;
  NSMutableArray *allLoggedKeys;
  NSMutableArray *v7;
  NSMutableArray *allLoggedValues;

  previousLoggedKey = self->_previousLoggedKey;
  self->_previousLoggedKey = 0;

  self->_previousLoggedDistributionValue = 0.0;
  lastLoggedKey = self->_lastLoggedKey;
  self->_lastLoggedKey = 0;

  self->_lastLoggedDistributionValue = 0.0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  allLoggedKeys = self->_allLoggedKeys;
  self->_allLoggedKeys = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  allLoggedValues = self->_allLoggedValues;
  self->_allLoggedValues = v7;

}

- (id)getValueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_keyValues, "objectForKeyedSubscript:", a3);
}

- (NSString)lastLoggedKey
{
  return self->_lastLoggedKey;
}

- (unint64_t)lastLoggedScalarValue
{
  return self->_lastLoggedScalarValue;
}

- (double)lastLoggedDistributionValue
{
  return self->_lastLoggedDistributionValue;
}

- (NSString)previousLoggedKey
{
  return self->_previousLoggedKey;
}

- (unint64_t)previousLoggedScalarValue
{
  return self->_previousLoggedScalarValue;
}

- (double)previousLoggedDistributionValue
{
  return self->_previousLoggedDistributionValue;
}

- (NSMutableArray)allLoggedKeys
{
  return self->_allLoggedKeys;
}

- (NSMutableArray)allLoggedValues
{
  return self->_allLoggedValues;
}

- (NSMutableDictionary)keyValues
{
  return self->_keyValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValues, 0);
  objc_storeStrong((id *)&self->_allLoggedValues, 0);
  objc_storeStrong((id *)&self->_allLoggedKeys, 0);
  objc_storeStrong((id *)&self->_previousLoggedKey, 0);
  objc_storeStrong((id *)&self->_lastLoggedKey, 0);
}

@end
