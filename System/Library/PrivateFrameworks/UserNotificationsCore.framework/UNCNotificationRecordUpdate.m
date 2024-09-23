@implementation UNCNotificationRecordUpdate

- (id)_initWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4
{
  id v7;
  UNCNotificationRecordUpdate *v8;
  UNCNotificationRecordUpdate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNCNotificationRecordUpdate;
  v8 = -[UNCNotificationRecordUpdate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationRecord, a3);
    v9->_shouldSync = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  UNCNotificationRecordUpdate *v4;
  UNCNotificationRecordUpdate *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UNCNotificationRecordUpdate *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[UNCNotificationRecordUpdate notificationRecord](self, "notificationRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCNotificationRecordUpdate notificationRecord](v5, "notificationRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = UNEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCNotificationRecordUpdate notificationRecord](self, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UNCNotificationRecordUpdate notificationRecord](self, "notificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("notificationRecord"));

  objc_msgSend(v5, "encodeBool:forKey:", -[UNCNotificationRecordUpdate shouldSync](self, "shouldSync"), CFSTR("shouldSync"));
}

- (UNCNotificationRecordUpdate)initWithCoder:(id)a3
{
  id v4;
  UNCNotificationRecordUpdate *v5;
  uint64_t v6;
  UNSNotificationRecord *notificationRecord;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationRecordUpdate;
  v5 = -[UNCNotificationRecordUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationRecord"));
    v6 = objc_claimAutoreleasedReturnValue();
    notificationRecord = v5->_notificationRecord;
    v5->_notificationRecord = (UNSNotificationRecord *)v6;

    v5->_shouldSync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSync"));
  }

  return v5;
}

- (UNSNotificationRecord)notificationRecord
{
  return self->_notificationRecord;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRecord, 0);
}

@end
