@implementation SOAlarmsSnapshot

- (SOAlarmsSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _SOAlarmsSnapshotMutation *);
  SOAlarmsSnapshot *v5;
  SOAlarmsSnapshot *v6;
  _SOAlarmsSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *date;
  void *v11;
  uint64_t v12;
  NSDictionary *alarmsByID;
  void *v14;
  uint64_t v15;
  NSOrderedSet *firingAlarmIDs;
  void *v17;
  uint64_t v18;
  NSOrderedSet *dismissedAlarmIDs;
  objc_super v21;

  v4 = (void (**)(id, _SOAlarmsSnapshotMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)SOAlarmsSnapshot;
  v5 = -[SOAlarmsSnapshot init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SOAlarmsSnapshotMutation initWithBase:]([_SOAlarmsSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SOAlarmsSnapshotMutation isDirty](v7, "isDirty"))
    {
      -[_SOAlarmsSnapshotMutation getDate](v7, "getDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v9;

      -[_SOAlarmsSnapshotMutation getAlarmsByID](v7, "getAlarmsByID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v12;

      -[_SOAlarmsSnapshotMutation getFiringAlarmIDs](v7, "getFiringAlarmIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      firingAlarmIDs = v6->_firingAlarmIDs;
      v6->_firingAlarmIDs = (NSOrderedSet *)v15;

      -[_SOAlarmsSnapshotMutation getDismissedAlarmIDs](v7, "getDismissedAlarmIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      dismissedAlarmIDs = v6->_dismissedAlarmIDs;
      v6->_dismissedAlarmIDs = (NSOrderedSet *)v18;

    }
  }

  return v6;
}

- (SOAlarmsSnapshot)init
{
  return -[SOAlarmsSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SOAlarmsSnapshot)initWithDate:(id)a3 alarmsByID:(id)a4 firingAlarmIDs:(id)a5 dismissedAlarmIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SOAlarmsSnapshot *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__SOAlarmsSnapshot_initWithDate_alarmsByID_firingAlarmIDs_dismissedAlarmIDs___block_invoke;
  v20[3] = &unk_24CE75AE8;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = -[SOAlarmsSnapshot initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (id)description
{
  return -[SOAlarmsSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SOAlarmsSnapshot;
  -[SOAlarmsSnapshot description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {date = %@, alarmsByID = %@, firingAlarmIDs = %@, dismissedAlarmIDs = %@}"), v5, self->_date, self->_alarmsByID, self->_firingAlarmIDs, self->_dismissedAlarmIDs);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSDate hash](self->_date, "hash");
  v4 = -[NSDictionary hash](self->_alarmsByID, "hash") ^ v3;
  v5 = -[NSOrderedSet hash](self->_firingAlarmIDs, "hash");
  return v4 ^ v5 ^ -[NSOrderedSet hash](self->_dismissedAlarmIDs, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SOAlarmsSnapshot *v4;
  SOAlarmsSnapshot *v5;
  NSDate *v6;
  NSDate *date;
  NSDictionary *v8;
  NSDictionary *alarmsByID;
  NSOrderedSet *v10;
  NSOrderedSet *firingAlarmIDs;
  NSOrderedSet *v12;
  NSOrderedSet *dismissedAlarmIDs;
  BOOL v14;

  v4 = (SOAlarmsSnapshot *)a3;
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
      -[SOAlarmsSnapshot date](v5, "date");
      v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
      date = self->_date;
      if (date == v6 || -[NSDate isEqual:](date, "isEqual:", v6))
      {
        -[SOAlarmsSnapshot alarmsByID](v5, "alarmsByID");
        v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        alarmsByID = self->_alarmsByID;
        if (alarmsByID == v8 || -[NSDictionary isEqual:](alarmsByID, "isEqual:", v8))
        {
          -[SOAlarmsSnapshot firingAlarmIDs](v5, "firingAlarmIDs");
          v10 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
          firingAlarmIDs = self->_firingAlarmIDs;
          if (firingAlarmIDs == v10 || -[NSOrderedSet isEqual:](firingAlarmIDs, "isEqual:", v10))
          {
            -[SOAlarmsSnapshot dismissedAlarmIDs](v5, "dismissedAlarmIDs");
            v12 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
            dismissedAlarmIDs = self->_dismissedAlarmIDs;
            v14 = dismissedAlarmIDs == v12 || -[NSOrderedSet isEqual:](dismissedAlarmIDs, "isEqual:", v12);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (SOAlarmsSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SOAlarmsSnapshot *v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SOAlarmsSnapshot::date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SOAlarmsSnapshot::alarmsByID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SOAlarmsSnapshot::firingAlarmIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("SOAlarmsSnapshot::dismissedAlarmIDs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SOAlarmsSnapshot initWithDate:alarmsByID:firingAlarmIDs:dismissedAlarmIDs:](self, "initWithDate:alarmsByID:firingAlarmIDs:dismissedAlarmIDs:", v5, v10, v14, v18);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("SOAlarmsSnapshot::date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alarmsByID, CFSTR("SOAlarmsSnapshot::alarmsByID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firingAlarmIDs, CFSTR("SOAlarmsSnapshot::firingAlarmIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissedAlarmIDs, CFSTR("SOAlarmsSnapshot::dismissedAlarmIDs"));

}

- (NSDate)date
{
  return self->_date;
}

- (NSDictionary)alarmsByID
{
  return self->_alarmsByID;
}

- (NSOrderedSet)firingAlarmIDs
{
  return self->_firingAlarmIDs;
}

- (NSOrderedSet)dismissedAlarmIDs
{
  return self->_dismissedAlarmIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissedAlarmIDs, 0);
  objc_storeStrong((id *)&self->_firingAlarmIDs, 0);
  objc_storeStrong((id *)&self->_alarmsByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

void __77__SOAlarmsSnapshot_initWithDate_alarmsByID_firingAlarmIDs_dismissedAlarmIDs___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setDate:", v3);
  objc_msgSend(v4, "setAlarmsByID:", a1[5]);
  objc_msgSend(v4, "setFiringAlarmIDs:", a1[6]);
  objc_msgSend(v4, "setDismissedAlarmIDs:", a1[7]);

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
  void (**v4)(id, _SOAlarmsSnapshotMutation *);
  _SOAlarmsSnapshotMutation *v5;
  SOAlarmsSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSDate *date;
  void *v10;
  uint64_t v11;
  NSDictionary *alarmsByID;
  void *v13;
  uint64_t v14;
  NSOrderedSet *firingAlarmIDs;
  void *v16;
  uint64_t v17;
  NSOrderedSet *dismissedAlarmIDs;

  v4 = (void (**)(id, _SOAlarmsSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_SOAlarmsSnapshotMutation initWithBase:]([_SOAlarmsSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SOAlarmsSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SOAlarmsSnapshot);
      -[_SOAlarmsSnapshotMutation getDate](v5, "getDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      date = v6->_date;
      v6->_date = (NSDate *)v8;

      -[_SOAlarmsSnapshotMutation getAlarmsByID](v5, "getAlarmsByID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      alarmsByID = v6->_alarmsByID;
      v6->_alarmsByID = (NSDictionary *)v11;

      -[_SOAlarmsSnapshotMutation getFiringAlarmIDs](v5, "getFiringAlarmIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      firingAlarmIDs = v6->_firingAlarmIDs;
      v6->_firingAlarmIDs = (NSOrderedSet *)v14;

      -[_SOAlarmsSnapshotMutation getDismissedAlarmIDs](v5, "getDismissedAlarmIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      dismissedAlarmIDs = v6->_dismissedAlarmIDs;
      v6->_dismissedAlarmIDs = (NSOrderedSet *)v17;

    }
    else
    {
      v6 = (SOAlarmsSnapshot *)-[SOAlarmsSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (SOAlarmsSnapshot *)-[SOAlarmsSnapshot copy](self, "copy");
  }

  return v6;
}

@end
