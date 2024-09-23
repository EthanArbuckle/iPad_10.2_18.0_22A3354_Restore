@implementation PLState

- (BOOL)updateWithValue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (v4
    && (-[PLState currValue](self, "currValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqual:", v5),
        v5,
        (v6 & 1) == 0))
  {
    -[PLState currValue](self, "currValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLState setLastValue:](self, "setLastValue:", v8);

    -[PLState setCurrValue:](self, "setCurrValue:", v4);
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLState updateWithValue:].cold.1(self, v9);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)currValue
{
  return objc_getProperty(self, a2, 16, 1);
}

+ (void)load
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_class();
  if (objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class()))
  {
    v3 = objc_opt_class();
    if (v3 != objc_opt_class())
      +[PLStateTrackingComposition registerState:](PLStateTrackingComposition, "registerState:", objc_opt_class());
  }
}

- (PLState)initWithStateId:(unint64_t)a3 entryKey:(id)a4 currValue:(id)a5
{
  id v9;
  id v10;
  PLState *v11;
  PLState *v12;
  uint64_t v13;
  NSDate *stateChangeTime;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLState;
  v11 = -[PLState init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_stateId = a3;
    objc_storeStrong((id *)&v11->_entryKey, a4);
    objc_storeStrong(&v12->_lastValue, a5);
    objc_storeStrong(&v12->_currValue, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v13 = objc_claimAutoreleasedReturnValue();
    stateChangeTime = v12->_stateChangeTime;
    v12->_stateChangeTime = (NSDate *)v13;

  }
  return v12;
}

- (void)updateWithLastEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLState entryKey](self, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    -[PLState updateWithEntry:](self, "updateWithEntry:", v8);
    -[PLState currValue](self, "currValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLState setLastValue:](self, "setLastValue:", v7);

    v6 = v8;
  }

}

- (BOOL)updateWithEntry:(id)a3
{
  return 0;
}

- (id)lastValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setLastValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setCurrValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)stateChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateChangeTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)stateId
{
  return self->_stateId;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKey, 0);
  objc_storeStrong((id *)&self->_stateChangeTime, 0);
  objc_storeStrong(&self->_currValue, 0);
  objc_storeStrong(&self->_lastValue, 0);
}

- (void)updateWithValue:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "%@ Last:%@ Curr:%@", (uint8_t *)&v8, 0x20u);

}

@end
