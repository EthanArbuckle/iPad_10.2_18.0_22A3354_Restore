@implementation REMReminderFetchOptions

+ (REMReminderFetchOptions)defaultFetchOptions
{
  return (REMReminderFetchOptions *)(id)objc_opt_new();
}

+ (id)fetchOptionsIncludingConcealed
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIncludeConcealed:", 1);
  return v2;
}

+ (id)fetchOptionsIncludingDueDateDeltaAlerts
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIncludeDueDateDeltaAlerts:", 1);
  return v2;
}

- (id)fetchOptionsIncludingConcealed
{
  void *v2;

  v2 = (void *)-[REMReminderFetchOptions copy](self, "copy");
  objc_msgSend(v2, "setIncludeConcealed:", 1);
  return v2;
}

- (id)fetchOptionsIncludingDueDateDeltaAlerts
{
  void *v2;

  v2 = (void *)-[REMReminderFetchOptions copy](self, "copy");
  objc_msgSend(v2, "setIncludeDueDateDeltaAlerts:", 1);
  return v2;
}

- (unint64_t)hash
{
  _BOOL4 v3;

  v3 = -[REMReminderFetchOptions includeConcealed](self, "includeConcealed");
  return v3 ^ -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchOptions)initWithCoder:(id)a3
{
  id v4;
  REMReminderFetchOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchOptions;
  v5 = -[REMReminderFetchOptions init](&v7, sel_init);
  if (v5)
  {
    v5->_includeConcealed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeConcealed"));
    v5->_includeDueDateDeltaAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDueDateDeltaAlerts"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderFetchOptions includeConcealed](self, "includeConcealed"), CFSTR("includeConcealed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts"), CFSTR("includeDueDateDeltaAlerts"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIncludeConcealed:", -[REMReminderFetchOptions includeConcealed](self, "includeConcealed"));
  objc_msgSend(v4, "setIncludeDueDateDeltaAlerts:", -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REMReminderFetchOptions *v4;
  REMReminderFetchOptions *v5;
  REMReminderFetchOptions *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (REMReminderFetchOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7 = -[REMReminderFetchOptions includeConcealed](self, "includeConcealed"),
          v7 == -[REMReminderFetchOptions includeConcealed](v6, "includeConcealed")))
    {
      v9 = -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts");
      v8 = v9 ^ -[REMReminderFetchOptions includeDueDateDeltaAlerts](v6, "includeDueDateDeltaAlerts") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  return v8;
}

- (BOOL)includeConcealed
{
  return self->_includeConcealed;
}

- (void)setIncludeConcealed:(BOOL)a3
{
  self->_includeConcealed = a3;
}

- (BOOL)includeDueDateDeltaAlerts
{
  return self->_includeDueDateDeltaAlerts;
}

- (void)setIncludeDueDateDeltaAlerts:(BOOL)a3
{
  self->_includeDueDateDeltaAlerts = a3;
}

@end
