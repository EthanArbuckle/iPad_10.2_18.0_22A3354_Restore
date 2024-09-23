@implementation SCLInterruptBehaviorResolutionRecord

+ (id)resolutionRecordForDate:(id)a3 eventBehavior:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithUUID:date:eventBehavior:clientIdentifier:", v12, v10, v9, v8);

  return v13;
}

- (id)_initWithUUID:(id)a3 date:(id)a4 eventBehavior:(id)a5 clientIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SCLInterruptBehaviorResolutionRecord *v14;
  uint64_t v15;
  NSUUID *UUID;
  uint64_t v17;
  NSDate *date;
  uint64_t v19;
  SCLInterruptEventBehavior *eventBehavior;
  uint64_t v21;
  NSString *clientIdentifier;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SCLInterruptBehaviorResolutionRecord;
  v14 = -[SCLInterruptBehaviorResolutionRecord init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    date = v14->_date;
    v14->_date = (NSDate *)v17;

    v19 = objc_msgSend(v12, "copy");
    eventBehavior = v14->_eventBehavior;
    v14->_eventBehavior = (SCLInterruptEventBehavior *)v19;

    v21 = objc_msgSend(v13, "copy");
    clientIdentifier = v14->_clientIdentifier;
    v14->_clientIdentifier = (NSString *)v21;

  }
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLInterruptBehaviorResolutionRecord clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("clientIdentifier"));

  -[SCLInterruptBehaviorResolutionRecord UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("UUID"), 1);

  -[SCLInterruptBehaviorResolutionRecord date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("date"), 1);

  -[SCLInterruptBehaviorResolutionRecord eventBehavior](self, "eventBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("eventBehavior"), 1);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SCLInterruptBehaviorResolutionRecord UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SCLInterruptBehaviorResolutionRecord date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SCLInterruptBehaviorResolutionRecord eventBehavior](self, "eventBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SCLInterruptBehaviorResolutionRecord clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SCLInterruptBehaviorResolutionRecord *v4;
  SCLInterruptBehaviorResolutionRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (SCLInterruptBehaviorResolutionRecord *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SCLInterruptBehaviorResolutionRecord UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLInterruptBehaviorResolutionRecord UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SCLInterruptBehaviorResolutionRecord date](self, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLInterruptBehaviorResolutionRecord date](v5, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[SCLInterruptBehaviorResolutionRecord eventBehavior](self, "eventBehavior");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCLInterruptBehaviorResolutionRecord eventBehavior](v5, "eventBehavior");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqual:", v11))
          {
            -[SCLInterruptBehaviorResolutionRecord clientIdentifier](self, "clientIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SCLInterruptBehaviorResolutionRecord clientIdentifier](v5, "clientIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v15, "isEqualToString:", v12);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)date
{
  return self->_date;
}

- (SCLInterruptEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
