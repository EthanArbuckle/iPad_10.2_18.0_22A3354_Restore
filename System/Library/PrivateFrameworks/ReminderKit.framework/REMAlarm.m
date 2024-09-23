@implementation REMAlarm

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDAlarm");
}

- (REMAlarm)initWithTrigger:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  REMAlarm *v8;
  REMAlarm *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)REMAlarm;
  v8 = -[REMAlarm init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[REMAlarm setTrigger:](v8, "setTrigger:", v6);
    -[REMAlarm setObjectID:](v9, "setObjectID:", v7);
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAlarm setAlarmUID:](v9, "setAlarmUID:", v11);

  }
  return v9;
}

- (REMAlarm)initWithTrigger:(id)a3
{
  id v4;
  void *v5;
  REMAlarm *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "newObjectID");
  v6 = -[REMAlarm initWithTrigger:objectID:](self, "initWithTrigger:objectID:", v4, v5);

  return v6;
}

- (REMAlarm)initWithAlarm:(id)a3 objectID:(id)a4
{
  id v5;
  REMAlarmTrigger *v6;
  void *v7;
  void *v8;
  void *v9;
  REMAlarmTrigger *v10;
  REMAlarm *v11;
  void *v12;

  v5 = a3;
  v6 = [REMAlarmTrigger alloc];
  objc_msgSend(v5, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend((id)objc_opt_class(), "newObjectID");
  v10 = -[REMAlarmTrigger initWithAlarmTrigger:objectID:](v6, "initWithAlarmTrigger:objectID:", v7, v9);

  v11 = -[REMAlarm initWithTrigger:](self, "initWithTrigger:", v10);
  objc_msgSend(v5, "acknowledgedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMAlarm setAcknowledgedDate:](v11, "setAcknowledgedDate:", v12);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAlarm)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMAlarm *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMAlarm initWithTrigger:objectID:](self, "initWithTrigger:objectID:", v5, v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acknowledgedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarm setAcknowledgedDate:](v7, "setAcknowledgedDate:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarm setAlarmUID:](v7, "setAlarmUID:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalAlarmUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMAlarm setOriginalAlarmUID:](v7, "setOriginalAlarmUID:", v10);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[REMAlarm trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trigger"));

  -[REMAlarm objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("objectID"));

  -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("acknowledgedDate"));

  -[REMAlarm alarmUID](self, "alarmUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("alarmUID"));

  -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("originalAlarmUID"));

}

- (BOOL)isEqual:(id)a3
{
  REMAlarm *v4;
  REMAlarm *v5;
  REMAlarm *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = (REMAlarm *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMAlarm objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMAlarm objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_18;
      }
      -[REMAlarm trigger](self, "trigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm trigger](v6, "trigger");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMAlarm trigger](self, "trigger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm trigger](v6, "trigger");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_18;
      }
      -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm acknowledgedDate](v6, "acknowledgedDate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm acknowledgedDate](v6, "acknowledgedDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_18;
      }
      -[REMAlarm alarmUID](self, "alarmUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm alarmUID](v6, "alarmUID");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMAlarm alarmUID](self, "alarmUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm alarmUID](v6, "alarmUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_18;
      }
      -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm originalAlarmUID](v6, "originalAlarmUID");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v33 == (void *)v34)
      {
        v13 = 1;
        v35 = v33;
      }
      else
      {
        v35 = (void *)v34;
        -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm originalAlarmUID](v6, "originalAlarmUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v36, "isEqual:", v37);

      }
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

- (BOOL)isContentEqual:(id)a3
{
  REMAlarm *v4;
  REMAlarm *v5;
  REMAlarm *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = (REMAlarm *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMAlarm trigger](self, "trigger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm trigger](v6, "trigger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMAlarm trigger](self, "trigger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm trigger](v6, "trigger");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isContentEqual:", v11);

        if (!v12)
          goto LABEL_14;
      }
      -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm acknowledgedDate](v6, "acknowledgedDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm acknowledgedDate](v6, "acknowledgedDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_14;
      }
      -[REMAlarm alarmUID](self, "alarmUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm alarmUID](v6, "alarmUID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMAlarm alarmUID](self, "alarmUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm alarmUID](v6, "alarmUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_14;
      }
      -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm originalAlarmUID](v6, "originalAlarmUID");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v27 == (void *)v28)
      {
        v13 = 1;
        v29 = v27;
      }
      else
      {
        v29 = (void *)v28;
        -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMAlarm originalAlarmUID](v6, "originalAlarmUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v30, "isEqual:", v31);

      }
      goto LABEL_15;
    }
LABEL_14:
    v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAlarm objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" (original-uid: %@)"), v5);
  }
  else
  {
    -[REMAlarm alarmUID](self, "alarmUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" (uid: %@)"), v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)REMAlarm;
  -[REMAlarm description](&v13, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarm objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarm trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ %@%@"), v8, v9, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isAcknowledged
{
  void *v2;
  BOOL v3;

  -[REMAlarm acknowledgedDate](self, "acknowledgedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isOriginal
{
  void *v2;
  BOOL v3;

  -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isSnooze
{
  void *v2;
  BOOL v3;

  -[REMAlarm originalAlarmUID](self, "originalAlarmUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (REMAlarmTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void)setAcknowledgedDate:(id)a3
{
  objc_storeStrong((id *)&self->_acknowledgedDate, a3);
}

- (NSString)alarmUID
{
  return self->_alarmUID;
}

- (void)setAlarmUID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmUID, a3);
}

- (NSString)originalAlarmUID
{
  return self->_originalAlarmUID;
}

- (void)setOriginalAlarmUID:(id)a3
{
  objc_storeStrong((id *)&self->_originalAlarmUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAlarmUID, 0);
  objc_storeStrong((id *)&self->_alarmUID, 0);
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end
