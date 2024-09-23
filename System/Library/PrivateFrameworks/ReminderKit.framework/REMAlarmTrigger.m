@implementation REMAlarmTrigger

- (REMAlarmTrigger)initWithObjectID:(id)a3
{
  id v5;
  REMAlarmTrigger *v6;
  void *v7;
  REMAlarmTrigger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmTrigger;
  v6 = -[REMAlarmTrigger init](&v10, sel_init);
  if (!v6)
    goto LABEL_5;
  v7 = (void *)objc_opt_class();
  if (!objc_msgSend(v7, "isEqual:", objc_opt_class()))
  {
    objc_storeStrong((id *)&v6->_objectID, a3);
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Attempting to instantiate an abstract class. Please use a subclass of REMAlarmTrigger."));
  v8 = 0;
LABEL_6:

  return v8;
}

- (REMAlarmTrigger)initWithAlarmTrigger:(id)a3 objectID:(id)a4
{
  REMObjectID *v6;
  REMAlarmTrigger *v7;
  REMObjectID *objectID;

  v6 = (REMObjectID *)a4;
  objc_msgSend(a3, "_deepCopy");
  v7 = (REMAlarmTrigger *)objc_claimAutoreleasedReturnValue();

  objectID = v7->_objectID;
  v7->_objectID = v6;

  return v7;
}

- (REMAlarmTrigger)init
{
  void *v3;
  REMAlarmTrigger *v4;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "newObjectID");
  v4 = -[REMAlarmTrigger initWithObjectID:](self, "initWithObjectID:", v3);

  return v4;
}

- (REMAlarmTrigger)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMAlarmTrigger *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMAlarmTrigger initWithObjectID:](self, "initWithObjectID:", v5);
  return v6;
}

- (BOOL)isTemporal
{
  return 0;
}

- (id)_deepCopy
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Abstract method called -[%@ %@]"), v5, v6);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMAlarmTrigger objectID](self, "objectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

}

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
  return (NSString *)CFSTR("REMCDAlarmTrigger");
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
