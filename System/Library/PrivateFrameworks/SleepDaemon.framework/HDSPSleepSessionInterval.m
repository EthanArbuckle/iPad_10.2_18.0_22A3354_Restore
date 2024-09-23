@implementation HDSPSleepSessionInterval

+ (id)sleepSessionIntervalWithInterval:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInterval:type:", v6, a4);

  return v7;
}

- (HDSPSleepSessionInterval)initWithInterval:(id)a3 type:(unint64_t)a4
{
  id v7;
  HDSPSleepSessionInterval *v8;
  HDSPSleepSessionInterval *v9;
  HDSPSleepSessionInterval *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepSessionInterval;
  v8 = -[HDSPSleepSessionInterval init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interval, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *interval;
  id v5;

  interval = self->_interval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interval, CFSTR("SleepSessionInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("SleepSessionType"));

}

- (HDSPSleepSessionInterval)initWithCoder:(id)a3
{
  id v4;
  HDSPSleepSessionInterval *v5;
  uint64_t v6;
  NSDateInterval *interval;
  HDSPSleepSessionInterval *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPSleepSessionInterval;
  v5 = -[HDSPSleepSessionInterval init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SleepSessionInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SleepSessionType"));
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HDSPSleepSessionInterval *v4;
  HDSPSleepSessionInterval *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HDSPSleepSessionInterval *v9;
  id v10;
  unint64_t v11;
  HDSPSleepSessionInterval *v12;
  id v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  HDSPSleepSessionInterval *v20;
  _QWORD v21[4];
  HDSPSleepSessionInterval *v22;

  v4 = (HDSPSleepSessionInterval *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepSessionInterval interval](self, "interval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x24BDAC760];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __36__HDSPSleepSessionInterval_isEqual___block_invoke;
      v21[3] = &unk_24D4E5EE0;
      v9 = v5;
      v22 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", v7, v21);

      v11 = -[HDSPSleepSessionInterval type](self, "type");
      v16 = v8;
      v17 = 3221225472;
      v18 = __36__HDSPSleepSessionInterval_isEqual___block_invoke_2;
      v19 = &unk_24D4E5F30;
      v20 = v9;
      v12 = v9;
      v13 = (id)objc_msgSend(v6, "appendUnsignedInteger:counterpart:", v11, &v16);
      v14 = objc_msgSend(v6, "isEqual", v16, v17, v18, v19);

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

uint64_t __36__HDSPSleepSessionInterval_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interval");
}

uint64_t __36__HDSPSleepSessionInterval_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPSleepSessionInterval succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPSleepSessionInterval type](self, "type");
  if (v4 > 5)
    v5 = 0;
  else
    v5 = off_24D4E5FE8[v4];
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  -[HDSPSleepSessionInterval interval](self, "interval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("interval"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPSleepSessionInterval descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
