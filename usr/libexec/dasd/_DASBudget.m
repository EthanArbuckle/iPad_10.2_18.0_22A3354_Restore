@implementation _DASBudget

- (_DASBudget)initWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  id v12;
  id v13;
  _DASBudget *v14;
  _DASBudget *v15;
  objc_super v18;

  v12 = a3;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_DASBudget;
  v14 = -[_DASBudget init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    v15->_capacity = a4;
    v15->_balance = a5;
    v15->_allocationType = a6;
    objc_storeStrong((id *)&v15->_lastModulatedDate, a7);
    *(float64x2_t *)&v15->_maxBudgetValue = vmulq_n_f64((float64x2_t)xmmword_10011CE30, a4);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (_DASBudget)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _DASBudget *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  void *v22;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacity")));
    if (!v7)
    {
      v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v8 = (void *)v7;
    v9 = (_DASBudget *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("balance")));
    if (!v9)
    {
LABEL_11:

      goto LABEL_12;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationType")));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastModulatedDateInterval")));
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("capacity")));
      objc_msgSend(v8, "doubleValue");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("balance")));
      objc_msgSend(v16, "doubleValue");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allocationType")));
      v20 = objc_msgSend(v19, "intValue");
      v21 = v20;
      if (v13 <= 0.0)
      {
        self = -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:](self, "initWithName:capacity:balance:allocationType:lastModulatedDate:", v6, v20, 0, v15, v18);
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v13));
        self = -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:](self, "initWithName:capacity:balance:allocationType:lastModulatedDate:", v6, v21, v22, v15, v18);

      }
      v9 = self;
      goto LABEL_11;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 allocationType:(unsigned __int8)a5 lastModulatedDate:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithName:capacity:balance:allocationType:lastModulatedDate:", v11, v6, v10, a4, a4);

  return v12;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;

  v7 = a6;
  v12 = a7;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithName:capacity:balance:allocationType:lastModulatedDate:", v13, v7, v12, a4, a5);

  return v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](self, "name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[_DASBudget capacity](self, "capacity");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("capacity"));

  -[_DASBudget balance](self, "balance");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("balance"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[_DASBudget allocationType](self, "allocationType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("allocationType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget lastModulatedDate](self, "lastModulatedDate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget lastModulatedDate](self, "lastModulatedDate"));
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("lastModulatedDateInterval"));

  }
  v11 = objc_msgSend(v3, "copy");

  return v11;
}

- (void)registerSignificantBudgetChangeCallback:(id)a3
{
  id v4;
  id callback;

  v4 = objc_retainBlock(a3);
  callback = self->_callback;
  self->_callback = v4;

}

- (BOOL)isPositive
{
  return self->_balance > 0.0;
}

- (BOOL)unlockedDecrementBy:(double)a3 whileModulatingBudget:(BOOL)a4
{
  double balance;
  double maxBudgetValue;
  double minBudgetValue;
  NSDate *v8;
  NSDate *lastModulatedDate;

  balance = self->_balance;
  maxBudgetValue = balance - a3;
  if (self->_maxBudgetValue < maxBudgetValue)
    maxBudgetValue = self->_maxBudgetValue;
  if (self->_minBudgetValue >= maxBudgetValue)
    minBudgetValue = self->_minBudgetValue;
  else
    minBudgetValue = maxBudgetValue;
  self->_balance = minBudgetValue;
  if (a4)
  {
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    lastModulatedDate = self->_lastModulatedDate;
    self->_lastModulatedDate = v8;

  }
  return (balance > 0.0) ^ (minBudgetValue > 0.0);
}

- (void)decrementBy:(double)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v6;
  void (**callback)(id, _DASBudget *);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[_DASBudget unlockedDecrementBy:whileModulatingBudget:](self, "unlockedDecrementBy:whileModulatingBudget:", 0, a3);
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    callback = (void (**)(id, _DASBudget *))self->_callback;
    if (callback)
      callback[2](callback, self);
  }
}

- (void)incrementBy:(double)a3
{
  -[_DASBudget decrementBy:](self, "decrementBy:", -a3);
}

- (void)setBalance:(double)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v6;
  void (**callback)(id, _DASBudget *);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[_DASBudget unlockedDecrementBy:whileModulatingBudget:](self, "unlockedDecrementBy:whileModulatingBudget:", 1, self->_balance - a3);
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    callback = (void (**)(id, _DASBudget *))self->_callback;
    if (callback)
      callback[2](callback, self);
  }
}

- (void)setCapacity:(double)a3
{
  os_unfair_lock_s *p_lock;
  double v6;
  double balance;
  double v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = a3 * -1.2;
  balance = self->_balance;
  if (a3 * 1.5 < balance)
    balance = a3 * 1.5;
  self->_maxBudgetValue = a3 * 1.5;
  self->_minBudgetValue = v6;
  if (v6 >= balance)
    v8 = a3 * -1.2;
  else
    v8 = balance;
  self->_capacity = a3;
  self->_balance = v8;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAllocationType:(unsigned __int8)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allocationType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _DASBudget *v4;
  uint64_t v5;
  NSString *name;
  void *v7;
  unsigned __int8 v8;

  v4 = (_DASBudget *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      name = self->_name;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](v4, "name"));
      v8 = -[NSString isEqual:](name, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  unsigned int v3;
  NSString *name;
  double capacity;
  NSString *v6;
  uint64_t v8;

  v3 = -[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("com.apple.dasd.remoteWidget"));
  name = self->_name;
  capacity = self->_capacity;
  if (v3)
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<_DASBudget %@: %12.2lf/%12.2lf Last Modulated: %@>"), name, *(_QWORD *)&self->_balance, *(_QWORD *)&capacity, self->_lastModulatedDate);
  else
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<_DASBudget %@: %12.2lf/%12.2lf>"), name, *(_QWORD *)&self->_balance, *(_QWORD *)&capacity, v8);
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastModulatedDate;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("capacity"), self->_capacity);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("balance"), self->_balance);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_allocationType, CFSTR("type"));
  lastModulatedDate = self->_lastModulatedDate;
  if (lastModulatedDate)
    -[NSDate timeIntervalSinceReferenceDate](lastModulatedDate, "timeIntervalSinceReferenceDate");
  else
    v5 = 0.0;
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("lastModulatedDateInterval"), v5);

}

- (_DASBudget)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  unsigned __int8 v9;
  _DASBudget *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  double v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("capacity"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v6 || v8 != 0.0)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("balance"));
    v12 = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastModulatedDateInterval"));
    if (v13 <= 0.0)
    {
      v17 = objc_alloc((Class)objc_opt_class(self));
      if (v12 == 0.0)
        v18 = v8;
      else
        v18 = v12;
      v10 = (_DASBudget *)objc_msgSend(v17, "initWithName:capacity:balance:allocationType:lastModulatedDate:", v6, v9, 0, v8, v18);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v15 = objc_alloc((Class)objc_opt_class(self));
      if (v12 == 0.0)
        v16 = v8;
      else
        v16 = v12;
      v10 = (_DASBudget *)objc_msgSend(v15, "initWithName:capacity:balance:allocationType:lastModulatedDate:", v6, v9, v14, v8, v16);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (double)capacity
{
  return self->_capacity;
}

- (unsigned)allocationType
{
  return self->_allocationType;
}

- (double)balance
{
  return self->_balance;
}

- (NSDate)lastModulatedDate
{
  return self->_lastModulatedDate;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)maxBudgetValue
{
  return self->_maxBudgetValue;
}

- (void)setMaxBudgetValue:(double)a3
{
  self->_maxBudgetValue = a3;
}

- (double)minBudgetValue
{
  return self->_minBudgetValue;
}

- (void)setMinBudgetValue:(double)a3
{
  self->_minBudgetValue = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_lastModulatedDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
