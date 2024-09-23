@implementation SOTimersSnapshot

- (SOTimersSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _SOTimersSnapshotMutation *);
  SOTimersSnapshot *v5;
  SOTimersSnapshot *v6;
  _SOTimersSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *date;
  void *v11;
  uint64_t v12;
  NSDictionary *timersByID;
  objc_super v15;

  v4 = (void (**)(id, _SOTimersSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)SOTimersSnapshot;
  v5 = -[SOTimersSnapshot init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SOTimersSnapshotMutation initWithBase:]([_SOTimersSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SOTimersSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_SOTimersSnapshotMutation getDate](v7, "getDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      -[_SOTimersSnapshotMutation getTimersByID](v7, "getTimersByID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v12;

    }
  }

  return v6;
}

- (SOTimersSnapshot)init
{
  return -[SOTimersSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SOTimersSnapshot)initWithDate:(id)a3 timersByID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  SOTimersSnapshot *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SOTimersSnapshot_initWithDate_timersByID___block_invoke;
  v12[3] = &unk_24CE76218;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[SOTimersSnapshot initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[SOTimersSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SOTimersSnapshot;
  -[SOTimersSnapshot description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {date = %@, timersByID = %@}"), v5, self->_date, self->_timersByID);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_date, "hash");
  return -[NSDictionary hash](self->_timersByID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  SOTimersSnapshot *v4;
  SOTimersSnapshot *v5;
  NSDate *v6;
  NSDate *date;
  NSDictionary *v8;
  NSDictionary *timersByID;
  BOOL v10;

  v4 = (SOTimersSnapshot *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SOTimersSnapshot date](v5, "date");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      date = self->_date;
      if (date == v6 || -[NSDate isEqual:](date, "isEqual:", v6))
      {
        -[SOTimersSnapshot timersByID](v5, "timersByID");
        v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        timersByID = self->_timersByID;
        v10 = timersByID == v8 || -[NSDictionary isEqual:](timersByID, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (SOTimersSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SOTimersSnapshot *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOTimersSnapshot::date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SOTimersSnapshot::timersByID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SOTimersSnapshot initWithDate:timersByID:](self, "initWithDate:timersByID:", v5, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("SOTimersSnapshot::date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timersByID, CFSTR("SOTimersSnapshot::timersByID"));

}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)timersByID
{
  return self->_timersByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __44__SOTimersSnapshot_initWithDate_timersByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDate:", v3);
  objc_msgSend(v4, "setTimersByID:", *(_QWORD *)(a1 + 40));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SOTimersSnapshotMutation *);
  _SOTimersSnapshotMutation *v5;
  SOTimersSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSDate *date;
  void *v10;
  uint64_t v11;
  NSDictionary *timersByID;

  v4 = (void (**)(id, _SOTimersSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_SOTimersSnapshotMutation initWithBase:]([_SOTimersSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SOTimersSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SOTimersSnapshot);
      -[_SOTimersSnapshotMutation getDate](v5, "getDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      -[_SOTimersSnapshotMutation getTimersByID](v5, "getTimersByID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      timersByID = v6->_timersByID;
      v6->_timersByID = (NSDictionary *)v11;

    }
    else
    {
      v6 = (SOTimersSnapshot *)-[SOTimersSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (SOTimersSnapshot *)-[SOTimersSnapshot copy](self, "copy");
  }

  return v6;
}

@end
