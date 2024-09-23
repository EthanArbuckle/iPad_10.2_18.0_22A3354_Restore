@implementation SCLSimpleSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLSimpleSchedule)init
{
  SCLSimpleSchedule *v2;
  SCLScheduleTime *v3;
  SCLScheduleTime *startTime;
  SCLScheduleTime *v5;
  SCLScheduleTime *endTime;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCLSimpleSchedule;
  v2 = -[SCLSimpleSchedule init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleTime);
    startTime = v2->_startTime;
    v2->_startTime = v3;

    v5 = objc_alloc_init(SCLScheduleTime);
    endTime = v2->_endTime;
    v2->_endTime = v5;

    v2->_repeatSchedule = 0;
  }
  return v2;
}

- (SCLSimpleSchedule)initWithSimpleSchedule:(id)a3
{
  id v4;
  SCLSimpleSchedule *v5;
  void *v6;
  uint64_t v7;
  SCLScheduleTime *startTime;
  void *v9;
  uint64_t v10;
  SCLScheduleTime *endTime;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCLSimpleSchedule;
  v5 = -[SCLSimpleSchedule init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v7;

    objc_msgSend(v4, "endTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v10;

    v5->_repeatSchedule = objc_msgSend(v4, "repeatSchedule");
  }

  return v5;
}

- (SCLSimpleSchedule)initWithCoder:(id)a3
{
  id v4;
  SCLSimpleSchedule *v5;
  uint64_t v6;
  SCLScheduleTime *startTime;
  uint64_t v8;
  SCLScheduleTime *endTime;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLSimpleSchedule;
  v5 = -[SCLSchedule initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v8;

    v5->_repeatSchedule = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatSchedule"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SCLScheduleTime *startTime;
  id v5;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startTime, CFSTR("startTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("endTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repeatSchedule, CFSTR("repeatSchedule"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLSimpleSchedule initWithSimpleSchedule:]([SCLMutableSimpleSchedule alloc], "initWithSimpleSchedule:", self);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[SCLSimpleSchedule startTime](self, "startTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCLSimpleSchedule endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[SCLSimpleSchedule repeatSchedule](self, "repeatSchedule");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "repeatSchedule");
    if (v6 == -[SCLSimpleSchedule repeatSchedule](self, "repeatSchedule"))
    {
      objc_msgSend(v5, "startTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLSimpleSchedule startTime](self, "startTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        objc_msgSend(v5, "endTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLSimpleSchedule endTime](self, "endTime");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setLocale:", v4);
  v6 = -[SCLSimpleSchedule repeatSchedule](self, "repeatSchedule");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __32__SCLSimpleSchedule_description__block_invoke;
  v17[3] = &unk_24E29B6B8;
  v7 = v3;
  v18 = v7;
  v19 = v5;
  v8 = v5;
  SCLEnumerateDaysInRepeatSchedule(v6, (uint64_t)v17);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("(none)");
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSimpleSchedule startTime](self, "startTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSimpleSchedule endTime](self, "endTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p; startTime=%@; endTime=%@, repeatSchedule=%@>"),
    v12,
    self,
    v13,
    v14,
    v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __32__SCLSimpleSchedule_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "weekdaySymbols");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a2 - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (id)recurrences
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SCLSimpleSchedule repeatSchedule](self, "repeatSchedule");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__SCLSimpleSchedule_recurrences__block_invoke;
  v9[3] = &unk_24E29B6B8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  SCLEnumerateDaysInRepeatSchedule(v4, (uint64_t)v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __32__SCLSimpleSchedule_recurrences__block_invoke(uint64_t a1, uint64_t a2)
{
  SCLTimeInterval *v4;
  void *v5;
  void *v6;
  SCLScheduleRecurrence *v7;
  SCLTimeInterval *v8;

  v4 = [SCLTimeInterval alloc];
  objc_msgSend(*(id *)(a1 + 32), "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SCLTimeInterval initWithStartTime:endTime:](v4, "initWithStartTime:endTime:", v5, v6);

  v7 = -[SCLScheduleRecurrence initWithTimeInterval:day:]([SCLScheduleRecurrence alloc], "initWithTimeInterval:day:", v8, a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (SCLScheduleTime)startTime
{
  return self->_startTime;
}

- (SCLScheduleTime)endTime
{
  return self->_endTime;
}

- (int64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
