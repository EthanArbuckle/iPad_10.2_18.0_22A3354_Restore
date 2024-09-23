@implementation PBSaveResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBSaveResponse)initWithNotificationState:(unint64_t)a3 changeCount:(int64_t)a4 sharingToken:(id)a5
{
  id v9;
  PBSaveResponse *v10;
  PBSaveResponse *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PBSaveResponse;
  v10 = -[PBSaveResponse init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_notificationState = a3;
    v10->_changeCount = a4;
    objc_storeStrong((id *)&v10->_sharingToken, a5);
  }

  return v11;
}

- (PBSaveResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PBSaveResponse *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("notificationState"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PBSaveResponse initWithNotificationState:changeCount:sharingToken:](self, "initWithNotificationState:changeCount:sharingToken:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t notificationState;
  id v5;

  notificationState = self->_notificationState;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", notificationState, CFSTR("notificationState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeCount, CFSTR("changeCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingToken, CFSTR("sharingToken"));

}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (UISPasteSharingToken)sharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingToken, 0);
}

@end
