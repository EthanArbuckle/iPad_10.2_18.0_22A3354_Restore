@implementation REMTemplateContentAttributes

- (REMTemplateContentAttributes)initWithReminderCount:(int64_t)a3 hasDisplayDate:(BOOL)a4 hasHashtags:(BOOL)a5 hasLocationTriggersOrVehicleEventTriggers:(BOOL)a6 hasImageAttachments:(BOOL)a7
{
  REMTemplateContentAttributes *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)REMTemplateContentAttributes;
  result = -[REMTemplateContentAttributes init](&v13, sel_init);
  if (result)
  {
    result->_reminderCount = a3;
    result->_hasDisplayDate = a4;
    result->_hasHashtags = a5;
    result->_hasLocationTriggersOrVehicleEventTriggers = a6;
    result->_hasImageAttachments = a7;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMTemplateContentAttributes reminderCount](self, "reminderCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p reminderCount: %@, hasDisplayDate: %@, hasHashtags: %@, hasLocationTriggersOrVehicleEventTriggers: %@, hasImageAttachments: %@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[REMTemplateContentAttributes reminderCount](self, "reminderCount"),
        v5 == objc_msgSend(v4, "reminderCount"))
    && (v6 = -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"),
        v6 == objc_msgSend(v4, "hasDisplayDate"))
    && (v7 = -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"),
        v7 == objc_msgSend(v4, "hasHashtags"))
    && (v8 = -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"), v8 == objc_msgSend(v4, "hasLocationTriggersOrVehicleEventTriggers")))
  {
    v11 = -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments");
    v9 = v11 ^ objc_msgSend(v4, "hasImageAttachments") ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[REMTemplateContentAttributes initWithReminderCount:hasDisplayDate:hasHashtags:hasLocationTriggersOrVehicleEventTriggers:hasImageAttachments:]([REMTemplateContentAttributes alloc], "initWithReminderCount:hasDisplayDate:hasHashtags:hasLocationTriggersOrVehicleEventTriggers:hasImageAttachments:", -[REMTemplateContentAttributes reminderCount](self, "reminderCount"), -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"), -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"), -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"), -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplateContentAttributes)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reminderCount"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDisplayDate"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasHashtags"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasLocationTriggersOrVehicleEventTriggers"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasImageAttachments"));

  return -[REMTemplateContentAttributes initWithReminderCount:hasDisplayDate:hasHashtags:hasLocationTriggersOrVehicleEventTriggers:hasImageAttachments:](self, "initWithReminderCount:hasDisplayDate:hasHashtags:hasLocationTriggersOrVehicleEventTriggers:hasImageAttachments:", v5, v6, v7, v8, v9);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMTemplateContentAttributes reminderCount](self, "reminderCount"), CFSTR("reminderCount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasDisplayDate](self, "hasDisplayDate"), CFSTR("hasDisplayDate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasHashtags](self, "hasHashtags"), CFSTR("hasHashtags"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasLocationTriggersOrVehicleEventTriggers](self, "hasLocationTriggersOrVehicleEventTriggers"), CFSTR("hasLocationTriggersOrVehicleEventTriggers"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplateContentAttributes hasImageAttachments](self, "hasImageAttachments"), CFSTR("hasImageAttachments"));

}

- (int64_t)reminderCount
{
  return self->_reminderCount;
}

- (BOOL)hasDisplayDate
{
  return self->_hasDisplayDate;
}

- (BOOL)hasHashtags
{
  return self->_hasHashtags;
}

- (BOOL)hasLocationTriggersOrVehicleEventTriggers
{
  return self->_hasLocationTriggersOrVehicleEventTriggers;
}

- (BOOL)hasImageAttachments
{
  return self->_hasImageAttachments;
}

@end
