@implementation HDSPSleepSession

+ (id)sleepSessionWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;

  v7 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDateInterval:sleepIntervals:endReason:metadata:requiresFirstUnlock:", v14, v13, a5, v12, v7);

  return v15;
}

- (HDSPSleepSession)initWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  HDSPSleepSession *v16;
  HDSPSleepSession *v17;
  HDSPSleepSession *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepSession;
  v16 = -[HDSPSleepSession init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_interval, a3);
    objc_storeStrong((id *)&v17->_sleepIntervals, a4);
    v17->_endReason = a5;
    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_requiresFirstUnlock = a7;
    v18 = v17;
  }

  return v17;
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
  objc_msgSend(v5, "encodeObject:forKey:", interval, CFSTR("SleepSessionDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sleepIntervals, CFSTR("SleepSessionSleepIntervals"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endReason, CFSTR("SleepSessionEndReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("SleepSessionMetadata"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresFirstUnlock, CFSTR("RequiresFirstUnlock"));

}

- (HDSPSleepSession)initWithCoder:(id)a3
{
  id v4;
  HDSPSleepSession *v5;
  uint64_t v6;
  NSDateInterval *interval;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *sleepIntervals;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *metadata;
  HDSPSleepSession *v18;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepSession;
  v5 = -[HDSPSleepSession init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SleepSessionDateInterval"));
    v6 = objc_claimAutoreleasedReturnValue();
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("SleepSessionSleepIntervals"));
    v11 = objc_claimAutoreleasedReturnValue();
    sleepIntervals = v5->_sleepIntervals;
    v5->_sleepIntervals = (NSArray *)v11;

    v5->_endReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SleepSessionEndReason"));
    v13 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("SleepSessionMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v16;

    v5->_requiresFirstUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresFirstUnlock"));
    v18 = v5;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HDSPSleepSession *v4;
  HDSPSleepSession *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HDSPSleepSession *v9;
  id v10;
  void *v11;
  HDSPSleepSession *v12;
  id v13;
  unint64_t v14;
  HDSPSleepSession *v15;
  id v16;
  void *v17;
  HDSPSleepSession *v18;
  id v19;
  _BOOL8 v20;
  HDSPSleepSession *v21;
  id v22;
  char v23;
  _QWORD v25[4];
  HDSPSleepSession *v26;
  _QWORD v27[4];
  HDSPSleepSession *v28;
  _QWORD v29[4];
  HDSPSleepSession *v30;
  _QWORD v31[4];
  HDSPSleepSession *v32;
  _QWORD v33[4];
  HDSPSleepSession *v34;

  v4 = (HDSPSleepSession *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepSession interval](self, "interval");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x24BDAC760];
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __28__HDSPSleepSession_isEqual___block_invoke;
      v33[3] = &unk_24D4E5EE0;
      v9 = v5;
      v34 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", v7, v33);

      -[HDSPSleepSession sleepIntervals](self, "sleepIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = __28__HDSPSleepSession_isEqual___block_invoke_2;
      v31[3] = &unk_24D4E5F08;
      v12 = v9;
      v32 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", v11, v31);

      v14 = -[HDSPSleepSession endReason](self, "endReason");
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = __28__HDSPSleepSession_isEqual___block_invoke_3;
      v29[3] = &unk_24D4E5F30;
      v15 = v12;
      v30 = v15;
      v16 = (id)objc_msgSend(v6, "appendUnsignedInteger:counterpart:", v14, v29);
      -[HDSPSleepSession metadata](self, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __28__HDSPSleepSession_isEqual___block_invoke_4;
      v27[3] = &unk_24D4E5F58;
      v18 = v15;
      v28 = v18;
      v19 = (id)objc_msgSend(v6, "appendObject:counterpart:", v17, v27);

      v20 = -[HDSPSleepSession requiresFirstUnlock](self, "requiresFirstUnlock");
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __28__HDSPSleepSession_isEqual___block_invoke_5;
      v25[3] = &unk_24D4E5F80;
      v26 = v18;
      v21 = v18;
      v22 = (id)objc_msgSend(v6, "appendBool:counterpart:", v20, v25);
      v23 = objc_msgSend(v6, "isEqual");

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interval");
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepIntervals");
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endReason");
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metadata");
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requiresFirstUnlock");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPSleepSession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  __CFString *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepSession interval](self, "interval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("interval"));

  -[HDSPSleepSession sleepIntervals](self, "sleepIntervals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v6, "count"), CFSTR("sleepIntervals"));

  v8 = -[HDSPSleepSession endReason](self, "endReason");
  if (v8 > 8)
    v9 = 0;
  else
    v9 = off_24D4E5FA0[v8];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("endReason"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPSleepSession requiresFirstUnlock](self, "requiresFirstUnlock"), CFSTR("requiresFirstUnlock"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPSleepSession descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSArray)sleepIntervals
{
  return self->_sleepIntervals;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)requiresFirstUnlock
{
  return self->_requiresFirstUnlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sleepIntervals, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
