@implementation REMAlarmLocationTrigger

+ (id)cdEntityName
{
  return CFSTR("REMCDAlarmLocationTrigger");
}

- (REMAlarmLocationTrigger)initWithObjectID:(id)a3 structuredLocation:(id)a4 proximity:(int64_t)a5
{
  id v8;
  REMAlarmLocationTrigger *v9;
  REMAlarmLocationTrigger *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAlarmLocationTrigger;
  v9 = -[REMAlarmTrigger initWithObjectID:](&v12, sel_initWithObjectID_, a3);
  v10 = v9;
  if (v9)
  {
    -[REMAlarmLocationTrigger setStructuredLocation:](v9, "setStructuredLocation:", v8);
    -[REMAlarmLocationTrigger setProximity:](v10, "setProximity:", a5);
  }

  return v10;
}

- (REMAlarmLocationTrigger)initWithStructuredLocation:(id)a3 proximity:(int64_t)a4
{
  id v6;
  REMAlarmLocationTrigger *v7;
  REMAlarmLocationTrigger *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmLocationTrigger;
  v7 = -[REMAlarmTrigger init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[REMAlarmLocationTrigger setStructuredLocation:](v7, "setStructuredLocation:", v6);
    -[REMAlarmLocationTrigger setProximity:](v8, "setProximity:", a4);
  }

  return v8;
}

- (REMAlarmLocationTrigger)initWithCoder:(id)a3
{
  id v4;
  REMAlarmLocationTrigger *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REMAlarmLocationTrigger;
  v5 = -[REMAlarmTrigger initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("structuredLocation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAlarmLocationTrigger setStructuredLocation:](v5, "setStructuredLocation:", v6);

    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proximity"));
    if (v7 >= 3)
    {
      v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[REMAlarmLocationTrigger initWithCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

      v7 = 0;
    }
    -[REMAlarmLocationTrigger setProximity:](v5, "setProximity:", v7);
  }

  return v5;
}

- (id)_deepCopy
{
  REMAlarmLocationTrigger *v3;
  void *v4;
  void *v5;
  REMAlarmLocationTrigger *v6;

  v3 = [REMAlarmLocationTrigger alloc];
  -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = -[REMAlarmLocationTrigger initWithStructuredLocation:proximity:](v3, "initWithStructuredLocation:proximity:", v5, -[REMAlarmLocationTrigger proximity](self, "proximity"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[REMAlarmLocationTrigger proximity](self, "proximity");
      v9 = v8 == objc_msgSend(v5, "proximity");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "structuredLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isContentEqual:", v7))
    {
      v8 = -[REMAlarmLocationTrigger proximity](self, "proximity");
      v9 = v8 == objc_msgSend(v5, "proximity");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isTemporal
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation");
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
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmLocationTrigger;
  -[REMAlarmLocationTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {structuredLocation = %@; proximity = %ld;}"),
    v4,
    v5,
    -[REMAlarmLocationTrigger proximity](self, "proximity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMAlarmLocationTrigger;
  v4 = a3;
  -[REMAlarmTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[REMAlarmLocationTrigger structuredLocation](self, "structuredLocation", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("structuredLocation"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAlarmLocationTrigger proximity](self, "proximity"), CFSTR("proximity"));
}

- (REMStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredLocation, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMAlarmProximity %ld", a5, a6, a7, a8, 0);
}

@end
