@implementation PCSMTTPoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCSMTTPoint)initWithMTT:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  PCSMTTPoint *v8;
  PCSMTTPoint *v9;
  uint64_t v10;
  NSDate *start;
  PCSMTTPoint *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PCSMTTPoint;
  v8 = -[PCSMTTPoint init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mtt, v6);
    objc_storeStrong((id *)&v9->_name, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    start = v9->_start;
    v9->_start = (NSDate *)v10;

    v12 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MTTPoint:%@:%d:%lf]"), self->_name, self->_success, *(_QWORD *)&self->_time);
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("name");
  -[PCSMTTPoint name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PCSMTTPoint success](self, "success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("time");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PCSMTTPoint time](self, "time");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)complete:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_start);
  v7 = v6;

  -[PCSMTTPoint complete:time:](self, "complete:time:", v3, v7);
}

- (void)complete:(BOOL)a3 time:(double)a4
{
  id WeakRetained;

  self->_success = a3;
  self->_time = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mtt);
  objc_msgSend(WeakRetained, "completePoint:", self);

}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  id v7;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_success);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_time);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("time"));

}

- (PCSMTTPoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PCSMTTPoint *v6;
  void *v7;
  void *v8;
  double v9;
  PCSMTTPoint *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PCSMTTPoint initWithMTT:name:](self, "initWithMTT:name:", 0, v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("success"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_success = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v6->_time = v9;

    v10 = v6;
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)time
{
  return self->_time;
}

- (BOOL)success
{
  return self->_success;
}

- (PCSMTT)mtt
{
  return (PCSMTT *)objc_loadWeakRetained((id *)&self->_mtt);
}

- (void)setMtt:(id)a3
{
  objc_storeWeak((id *)&self->_mtt, a3);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_destroyWeak((id *)&self->_mtt);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
