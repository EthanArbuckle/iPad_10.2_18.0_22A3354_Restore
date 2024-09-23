@implementation STFamilyMember

- (STFamilyMember)initWithDSID:(id)a3 altDSID:(id)a4 appleID:(id)a5 memberType:(id)a6 firstName:(id)a7 lastName:(id)a8 isMe:(BOOL)a9 isParent:(BOOL)a10 isOrganizer:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  STFamilyMember *v23;
  uint64_t v24;
  NSNumber *DSID;
  uint64_t v26;
  NSString *altDSID;
  uint64_t v28;
  NSString *appleID;
  uint64_t v30;
  NSString *memberType;
  uint64_t v32;
  NSString *firstName;
  uint64_t v34;
  NSString *lastName;
  objc_super v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)STFamilyMember;
  v23 = -[STFamilyMember init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    DSID = v23->_DSID;
    v23->_DSID = (NSNumber *)v24;

    v26 = objc_msgSend(v18, "copy");
    altDSID = v23->_altDSID;
    v23->_altDSID = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    appleID = v23->_appleID;
    v23->_appleID = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    memberType = v23->_memberType;
    v23->_memberType = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    firstName = v23->_firstName;
    v23->_firstName = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    lastName = v23->_lastName;
    v23->_lastName = (NSString *)v34;

    v23->_isMe = a9;
    v23->_isParent = a10;
    v23->_isOrganizer = a11;
  }

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STFamilyMember firstName](self, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyMember lastName](self, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyMember DSID](self, "DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyMember altDSID](self, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyMember appleID](self, "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STFamilyMember memberType](self, "memberType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Name: %@ %@ DSID: %@, altDSID: %@, AppleID: %@ MemberType: %@ Me: %d Parent: %d, Organizer: %d"), v4, v5, v6, v7, v8, v9, -[STFamilyMember isMe](self, "isMe"), -[STFamilyMember isParent](self, "isParent"), -[STFamilyMember isOrganizer](self, "isOrganizer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)memberType
{
  return self->_memberType;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (void)setIsParent:(BOOL)a3
{
  self->_isParent = a3;
}

- (BOOL)isOrganizer
{
  return self->_isOrganizer;
}

- (void)setIsOrganizer:(BOOL)a3
{
  self->_isOrganizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_memberType, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end
