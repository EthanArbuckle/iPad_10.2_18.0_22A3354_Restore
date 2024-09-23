@implementation PKInboxMessage

- (PKInboxMessage)initWithType:(int64_t)a3 identifier:(id)a4
{
  id v6;
  PKInboxMessage *v7;
  PKInboxMessage *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKInboxMessage;
  v7 = -[PKInboxMessage init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

  }
  return v8;
}

+ (id)accountUserInvitationInboxMessageWithAccountUserInvitation:(id)a3 familyMember:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(v6, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "initWithType:identifier:", 0, v9);

  v11 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v6;
  v12 = v6;

  v13 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

  v14 = objc_msgSend(v12, "applicationState");
  *(_BYTE *)(v10 + 8) = v14 == 14;
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  PKInboxMessage *v4;
  PKInboxMessage *v5;
  BOOL v6;

  v4 = (PKInboxMessage *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKInboxMessage _isEqualToInboxMessage:](self, "_isEqualToInboxMessage:", v5);

  return v6;
}

- (BOOL)_isEqualToInboxMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_QWORD *)v4 + 2) && PKEqualObjects() && PKEqualObjects())
    v6 = PKEqualObjects();
  else
    v6 = 0;

  return v6;
}

- (BOOL)shouldBadge
{
  return !self->_type && -[PKFeatureApplication applicationState](self->_accountUserInvitation, "applicationState") == 1;
}

- (BOOL)isExpired
{
  return !self->_type
      && -[PKFeatureApplication applicationState](self->_accountUserInvitation, "applicationState") == 12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (PKFeatureApplication)accountUserInvitation
{
  return self->_accountUserInvitation;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUserInvitation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
