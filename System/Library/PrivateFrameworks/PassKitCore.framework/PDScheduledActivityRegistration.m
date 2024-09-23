@implementation PDScheduledActivityRegistration

- (PDScheduledActivityRegistration)initWithActivityCriteria:(id)a3 activityContext:(id)a4
{
  id v7;
  id v8;
  PDScheduledActivityRegistration *v9;
  PDScheduledActivityRegistration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDScheduledActivityRegistration;
  v9 = -[PDScheduledActivityRegistration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityCriteria, a3);
    if (v8)
    {
      if (NSClassFromString(CFSTR("PDUserNotification")) && (objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v10->_activityContext, a4);
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_activityCriteria);
  objc_msgSend(v3, "safelyAddObject:", self->_activityContext);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PDScheduledActivityRegistration *v4;
  PDScheduledActivityRegistration *v5;
  BOOL v6;

  v4 = (PDScheduledActivityRegistration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PDScheduledActivityRegistration isEqualToScheduledActivityRegistration:](self, "isEqualToScheduledActivityRegistration:", v5);

  return v6;
}

- (BOOL)isEqualToScheduledActivityRegistration:(id)a3
{
  _QWORD *v4;
  PDScheduledActivityCriteria *activityCriteria;
  PDScheduledActivityCriteria *v6;
  BOOL v7;
  char v8;
  NSObject *activityContext;
  NSObject *v10;

  v4 = a3;
  activityCriteria = self->_activityCriteria;
  v6 = (PDScheduledActivityCriteria *)v4[1];
  if (activityCriteria)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PDScheduledActivityCriteria isEqual:](activityCriteria, "isEqual:"))
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (activityCriteria != v6)
    goto LABEL_7;
LABEL_9:
  activityContext = self->_activityContext;
  v10 = v4[2];
  if (activityContext && v10)
    v8 = -[NSObject isEqual:](activityContext, "isEqual:");
  else
    v8 = activityContext == v10;
LABEL_13:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityRegistration)initWithCoder:(id)a3
{
  id v4;
  PDScheduledActivityRegistration *v5;
  uint64_t v6;
  PDScheduledActivityCriteria *activityCriteria;
  void *v8;
  Class v9;
  uint64_t v10;
  NSObject *activityContext;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityRegistration;
  v5 = -[PDScheduledActivityRegistration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityCritera"));
    v6 = objc_claimAutoreleasedReturnValue();
    activityCriteria = v5->_activityCriteria;
    v5->_activityCriteria = (PDScheduledActivityCriteria *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityContextData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = NSClassFromString(CFSTR("PDUserNotification"));
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", v9, v8, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        activityContext = v5->_activityContext;
        v5->_activityContext = v10;
      }
      else
      {
        activityContext = v5->_activityContext;
        v5->_activityContext = 0;
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *activityContext;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_activityCriteria, CFSTR("activityCritera"));
  activityContext = self->_activityContext;
  if (activityContext)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", activityContext, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("activityContextData"));

  }
}

- (PDScheduledActivityCriteria)activityCriteria
{
  return self->_activityCriteria;
}

- (NSObject)activityContext
{
  return self->_activityContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityContext, 0);
  objc_storeStrong((id *)&self->_activityCriteria, 0);
}

@end
