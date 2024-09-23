@implementation OSADateCounter

- (OSADateCounter)initWithIdentifier:(id)a3
{
  id v4;
  OSADateCounter *v5;
  uint64_t v6;
  NSString *dayKey;
  uint64_t v8;
  NSString *countKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OSADateCounter;
  v5 = -[OSADateCounter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Day"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    dayKey = v5->_dayKey;
    v5->_dayKey = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Count"), v4);
    v8 = objc_claimAutoreleasedReturnValue();
    countKey = v5->_countKey;
    v5->_countKey = (NSString *)v8;

  }
  return v5;
}

- (unint64_t)count
{
  void *v3;
  uint64_t v4;
  time_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", self->_dayKey);

  v5 = time(0);
  if (v5 >= 0)
    v6 = v5 / 0x15180uLL;
  else
    v6 = v5;
  if (v6 != v4)
  {
    -[OSADateCounter resetCount](self, "resetCount");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInteger:forKey:", v6, self->_dayKey);

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", self->_countKey);

  if ((v8 & 0x8000000000000000) != 0)
  {
    -[OSADateCounter resetCount](self, "resetCount");
    return 0;
  }
  return v8;
}

- (void)increment
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", -[OSADateCounter count](self, "count") + 1, self->_countKey);

}

- (void)resetCount
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", 0, self->_countKey);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countKey, 0);
  objc_storeStrong((id *)&self->_dayKey, 0);
}

@end
