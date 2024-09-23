@implementation SVXAlarmAndTimerFiringContext

- (SVXAlarmAndTimerFiringContext)initWithOrderedFiringAlarms:(id)a3 orderedFiringTimers:(id)a4 hasOtherRunningTimers:(BOOL)a5
{
  id v8;
  id v9;
  SVXAlarmAndTimerFiringContext *v10;
  uint64_t v11;
  NSOrderedSet *orderedFiringAlarms;
  uint64_t v13;
  NSOrderedSet *orderedFiringTimers;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXAlarmAndTimerFiringContext;
  v10 = -[SVXAlarmAndTimerFiringContext init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    orderedFiringAlarms = v10->_orderedFiringAlarms;
    v10->_orderedFiringAlarms = (NSOrderedSet *)v11;

    v13 = objc_msgSend(v9, "copy");
    orderedFiringTimers = v10->_orderedFiringTimers;
    v10->_orderedFiringTimers = (NSOrderedSet *)v13;

    v10->_hasOtherRunningTimers = a5;
  }

  return v10;
}

- (id)description
{
  return -[SVXAlarmAndTimerFiringContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10.receiver = self;
  v10.super_class = (Class)SVXAlarmAndTimerFiringContext;
  -[SVXAlarmAndTimerFiringContext description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_hasOtherRunningTimers)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {orderedFiringAlarms = %@, orderedFiringTimers = %@, hasOtherRunningTimers = %@}"), v5, self->_orderedFiringAlarms, self->_orderedFiringTimers, v7);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSOrderedSet hash](self->_orderedFiringAlarms, "hash");
  v4 = -[NSOrderedSet hash](self->_orderedFiringTimers, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasOtherRunningTimers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXAlarmAndTimerFiringContext *v4;
  SVXAlarmAndTimerFiringContext *v5;
  _BOOL4 hasOtherRunningTimers;
  NSOrderedSet *v7;
  NSOrderedSet *orderedFiringAlarms;
  NSOrderedSet *v9;
  NSOrderedSet *orderedFiringTimers;
  BOOL v11;

  v4 = (SVXAlarmAndTimerFiringContext *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      hasOtherRunningTimers = self->_hasOtherRunningTimers;
      if (hasOtherRunningTimers == -[SVXAlarmAndTimerFiringContext hasOtherRunningTimers](v5, "hasOtherRunningTimers"))
      {
        -[SVXAlarmAndTimerFiringContext orderedFiringAlarms](v5, "orderedFiringAlarms");
        v7 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
        orderedFiringAlarms = self->_orderedFiringAlarms;
        if (orderedFiringAlarms == v7 || -[NSOrderedSet isEqual:](orderedFiringAlarms, "isEqual:", v7))
        {
          -[SVXAlarmAndTimerFiringContext orderedFiringTimers](v5, "orderedFiringTimers");
          v9 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
          orderedFiringTimers = self->_orderedFiringTimers;
          v11 = orderedFiringTimers == v9 || -[NSOrderedSet isEqual:](orderedFiringTimers, "isEqual:", v9);

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
  }

  return v11;
}

- (SVXAlarmAndTimerFiringContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SVXAlarmAndTimerFiringContext *v15;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("SVXAlarmAndTimerFiringContext::orderedFiringAlarms"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("SVXAlarmAndTimerFiringContext::orderedFiringTimers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXAlarmAndTimerFiringContext::hasOtherRunningTimers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "BOOLValue");
  v15 = -[SVXAlarmAndTimerFiringContext initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:](self, "initWithOrderedFiringAlarms:orderedFiringTimers:hasOtherRunningTimers:", v8, v12, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSOrderedSet *orderedFiringAlarms;
  id v5;
  id v6;

  orderedFiringAlarms = self->_orderedFiringAlarms;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orderedFiringAlarms, CFSTR("SVXAlarmAndTimerFiringContext::orderedFiringAlarms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderedFiringTimers, CFSTR("SVXAlarmAndTimerFiringContext::orderedFiringTimers"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasOtherRunningTimers);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("SVXAlarmAndTimerFiringContext::hasOtherRunningTimers"));

}

- (NSOrderedSet)orderedFiringAlarms
{
  return self->_orderedFiringAlarms;
}

- (NSOrderedSet)orderedFiringTimers
{
  return self->_orderedFiringTimers;
}

- (BOOL)hasOtherRunningTimers
{
  return self->_hasOtherRunningTimers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFiringTimers, 0);
  objc_storeStrong((id *)&self->_orderedFiringAlarms, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXAlarmAndTimerFiringContextMutation *);
  _SVXAlarmAndTimerFiringContextMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXAlarmAndTimerFiringContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXAlarmAndTimerFiringContextMutation initWithBaseModel:]([_SVXAlarmAndTimerFiringContextMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXAlarmAndTimerFiringContextMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXAlarmAndTimerFiringContext copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXAlarmAndTimerFiringContextMutation *);
  _SVXAlarmAndTimerFiringContextMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXAlarmAndTimerFiringContextMutation *))a3;
  v4 = objc_alloc_init(_SVXAlarmAndTimerFiringContextMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXAlarmAndTimerFiringContextMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
