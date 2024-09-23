@implementation WFUIRUserEvent

- (WFUIRUserEvent)initWithSerializedRepresentation:(id)a3
{
  id v4;
  WFUIRUserEvent *v5;
  id v6;
  uint64_t v7;
  NSString *actionName;
  uint64_t v9;
  NSString *localizedActionName;
  uint64_t v11;
  NSString *processName;
  uint64_t v13;
  NSString *userDescription;
  void *v15;
  double v16;
  void *v17;
  double v18;
  WFUIRUserEvent *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFUIRUserEvent;
  v5 = -[WFUIRUserEvent init](&v21, sel_init);
  if (v5)
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("actionName"));
      v7 = objc_claimAutoreleasedReturnValue();
      actionName = v5->_actionName;
      v5->_actionName = (NSString *)v7;

      objc_msgSend(v6, "objectForKey:", CFSTR("localizedActionName"));
      v9 = objc_claimAutoreleasedReturnValue();
      localizedActionName = v5->_localizedActionName;
      v5->_localizedActionName = (NSString *)v9;

      objc_msgSend(v6, "objectForKey:", CFSTR("processName"));
      v11 = objc_claimAutoreleasedReturnValue();
      processName = v5->_processName;
      v5->_processName = (NSString *)v11;

      objc_msgSend(v6, "objectForKey:", CFSTR("userDescription"));
      v13 = objc_claimAutoreleasedReturnValue();
      userDescription = v5->_userDescription;
      v5->_userDescription = (NSString *)v13;

      objc_msgSend(v6, "objectForKey:", CFSTR("delay"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v5->_delay = v16;

      objc_msgSend(v6, "objectForKey:", CFSTR("timeout"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v5->_timeout = v18;

      v19 = v5;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)serializedRepresentation
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

  v3 = (void *)objc_opt_new();
  -[WFUIRUserEvent actionName](self, "actionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("actionName"));

  -[WFUIRUserEvent localizedActionName](self, "localizedActionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("localizedActionName"));

  -[WFUIRUserEvent processName](self, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("processName"));

  -[WFUIRUserEvent userDescription](self, "userDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("userDescription"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[WFUIRUserEvent delay](self, "delay");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("delay"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[WFUIRUserEvent timeout](self, "timeout");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("timeout"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[WFUIRUserEvent localizedActionName](self, "localizedActionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedActionName"));

  -[WFUIRUserEvent actionName](self, "actionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionName"));

  -[WFUIRUserEvent processName](self, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("processName"));

  -[WFUIRUserEvent userDescription](self, "userDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("userDescription"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[WFUIRUserEvent delay](self, "delay");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("delay"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[WFUIRUserEvent timeout](self, "timeout");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("timeout"));

}

- (WFUIRUserEvent)initWithCoder:(id)a3
{
  id v4;
  WFUIRUserEvent *v5;
  uint64_t v6;
  NSString *localizedActionName;
  uint64_t v8;
  NSString *actionName;
  uint64_t v10;
  NSString *processName;
  uint64_t v12;
  NSString *userDescription;
  void *v14;
  double v15;
  void *v16;
  double v17;
  WFUIRUserEvent *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFUIRUserEvent;
  v5 = -[WFUIRUserEvent init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedActionName"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedActionName = v5->_localizedActionName;
    v5->_localizedActionName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionName"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processName"));
    v10 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delay"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_delay = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeout"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_timeout = v17;

    v18 = v5;
  }

  return v5;
}

- (NSData)screenCaptureData
{
  return self->_screenCaptureData;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (double)timeout
{
  return self->_timeout;
}

- (double)delay
{
  return self->_delay;
}

- (NSArray)uiEvents
{
  return self->_uiEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiEvents, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_screenCaptureData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
