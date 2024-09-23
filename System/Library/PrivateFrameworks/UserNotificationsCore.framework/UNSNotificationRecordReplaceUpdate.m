@implementation UNSNotificationRecordReplaceUpdate

+ (id)updateWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNotificationRecord:replacedNotificationRecord:shouldRepost:", v9, v8, v5);

  return v10;
}

- (id)_initWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5
{
  id v9;
  id *v10;
  id *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  v10 = -[UNCNotificationRecordUpdate _initWithNotificationRecord:shouldSync:](&v13, sel__initWithNotificationRecord_shouldSync_, a3, 1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 4, a4);
    *((_BYTE *)v11 + 24) = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  if (-[UNCNotificationRecordUpdate isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[UNSNotificationRecordReplaceUpdate replacedNotificationRecord](self, "replacedNotificationRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replacedNotificationRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = UNEqualObjects();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNCNotificationRecordUpdate hash](&v10, sel_hash));
  -[UNSNotificationRecordReplaceUpdate replacedNotificationRecord](self, "replacedNotificationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  v7 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecordReplaceUpdate shouldRepost](self, "shouldRepost"));
  v8 = objc_msgSend(v3, "hash");

  return v8;
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
  v6.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  v4 = a3;
  -[UNCNotificationRecordUpdate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UNSNotificationRecordReplaceUpdate replacedNotificationRecord](self, "replacedNotificationRecord", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("replacedNotificationRecord"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UNSNotificationRecordReplaceUpdate shouldRepost](self, "shouldRepost"), CFSTR("shouldRepost"));
}

- (UNSNotificationRecordReplaceUpdate)initWithCoder:(id)a3
{
  id v4;
  UNSNotificationRecordReplaceUpdate *v5;
  uint64_t v6;
  UNSNotificationRecord *replacedNotificationRecord;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  v5 = -[UNCNotificationRecordUpdate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacedNotificationRecord"));
    v6 = objc_claimAutoreleasedReturnValue();
    replacedNotificationRecord = v5->_replacedNotificationRecord;
    v5->_replacedNotificationRecord = (UNSNotificationRecord *)v6;

    v5->_shouldRepost = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRepost"));
  }

  return v5;
}

- (UNSNotificationRecord)replacedNotificationRecord
{
  return self->_replacedNotificationRecord;
}

- (BOOL)shouldRepost
{
  return self->_shouldRepost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedNotificationRecord, 0);
}

@end
