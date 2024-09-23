@implementation PKFamilyMember

- (PKFamilyMember)initWithFAFamilyMember:(id)a3
{
  id v5;
  PKFamilyMember *v6;
  PKFamilyMember *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  uint64_t v16;
  NSString *appleID;
  uint64_t v18;
  NSNumber *dsid;
  uint64_t v20;
  NSString *altDSID;
  uint64_t v22;
  NSString *firstName;
  uint64_t v24;
  NSString *lastName;
  uint64_t v26;
  NSDate *joinedDate;
  void *v28;
  uint64_t v29;
  NSSet *appleIDAliases;
  uint64_t v31;
  NSString *inviteEmail;
  uint64_t v33;
  NSDate *invitationDate;
  uint64_t v35;
  NSDate *dateOfBirth;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  NSDate *v41;
  unint64_t v42;
  uint64_t v43;
  objc_super v45;

  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKFamilyMember;
  v6 = -[PKFamilyMember init](&v45, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_18;
  objc_storeStrong((id *)&v6->_member, a3);
  objc_msgSend(v5, "statusString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == CFSTR("accepted"))
    goto LABEL_5;
  if (!v9)
    goto LABEL_9;
  v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("accepted"));

  if ((v11 & 1) != 0)
  {
LABEL_5:
    v12 = 2;
    goto LABEL_10;
  }
  v13 = v10;
  if (v13 == CFSTR("pending")
    || (v14 = v13,
        v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("pending")),
        v14,
        v15))
  {
    v12 = 1;
  }
  else
  {
LABEL_9:
    v12 = 0;
  }
LABEL_10:

  v7->_status = v12;
  v7->_me = objc_msgSend(v5, "isMe");
  objc_msgSend(v5, "appleID");
  v16 = objc_claimAutoreleasedReturnValue();
  appleID = v7->_appleID;
  v7->_appleID = (NSString *)v16;

  objc_msgSend(v5, "dsid");
  v18 = objc_claimAutoreleasedReturnValue();
  dsid = v7->_dsid;
  v7->_dsid = (NSNumber *)v18;

  objc_msgSend(v5, "altDSID");
  v20 = objc_claimAutoreleasedReturnValue();
  altDSID = v7->_altDSID;
  v7->_altDSID = (NSString *)v20;

  objc_msgSend(v5, "firstName");
  v22 = objc_claimAutoreleasedReturnValue();
  firstName = v7->_firstName;
  v7->_firstName = (NSString *)v22;

  objc_msgSend(v5, "lastName");
  v24 = objc_claimAutoreleasedReturnValue();
  lastName = v7->_lastName;
  v7->_lastName = (NSString *)v24;

  objc_msgSend(v5, "joinedDate");
  v26 = objc_claimAutoreleasedReturnValue();
  joinedDate = v7->_joinedDate;
  v7->_joinedDate = (NSDate *)v26;

  v7->_parentalControlsEnabled = objc_msgSend(v5, "hasParentalControlsEnabled");
  v7->_askToBuyEnabled = objc_msgSend(v5, "hasAskToBuyEnabled");
  v7->_parent = objc_msgSend(v5, "isParent");
  v7->_organizer = objc_msgSend(v5, "isOrganizer");
  objc_msgSend(v5, "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("member-appleID-aliases"));
  v29 = objc_claimAutoreleasedReturnValue();
  appleIDAliases = v7->_appleIDAliases;
  v7->_appleIDAliases = (NSSet *)v29;

  objc_msgSend(v5, "inviteEmail");
  v31 = objc_claimAutoreleasedReturnValue();
  inviteEmail = v7->_inviteEmail;
  v7->_inviteEmail = (NSString *)v31;

  objc_msgSend(v5, "invitationDate");
  v33 = objc_claimAutoreleasedReturnValue();
  invitationDate = v7->_invitationDate;
  v7->_invitationDate = (NSDate *)v33;

  if (PKPreferenceBOOLforKey(CFSTR("PKForceU13AccountKey")))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -378432000.0);
    v35 = objc_claimAutoreleasedReturnValue();
    dateOfBirth = v7->_dateOfBirth;
    v7->_dateOfBirth = (NSDate *)v35;

    v7->_childAccount = 1;
    v7->_memberType = 2;
    v7->_age = 12;
  }
  else
  {
    objc_msgSend(v5, "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", CFSTR("member-date-of-birth"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v38, "doubleValue");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v39 / 1000.0);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v7->_dateOfBirth;
      v7->_dateOfBirth = (NSDate *)v40;

    }
    v7->_childAccount = objc_msgSend(v5, "isChildAccount");
    v42 = objc_msgSend(v5, "memberType");
    if (v42 >= 3)
      v43 = -1;
    else
      v43 = v42;
    v7->_memberType = v43;
    v7->_age = objc_msgSend(v5, "age");

  }
LABEL_18:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFamilyMember)initWithCoder:(id)a3
{
  id v4;
  PKFamilyMember *v5;
  uint64_t v6;
  FAFamilyMember *member;
  uint64_t v8;
  NSString *appleID;
  uint64_t v10;
  NSNumber *dsid;
  uint64_t v12;
  NSString *altDSID;
  uint64_t v14;
  NSString *firstName;
  uint64_t v16;
  NSString *lastName;
  void *v18;
  uint64_t v19;
  NSDate *joinedDate;
  uint64_t v21;
  NSDate *dateOfBirth;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSSet *appleIDAliases;
  uint64_t v28;
  CNContact *contact;
  uint64_t v30;
  NSString *inviteEmail;
  uint64_t v32;
  NSDate *invitationDate;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKFamilyMember;
  v5 = -[PKFamilyMember init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("member"));
    v6 = objc_claimAutoreleasedReturnValue();
    member = v5->_member;
    v5->_member = (FAFamilyMember *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_me = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("me"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v10 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v12 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v16;

    v5->_age = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("age"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memberType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_memberType = PKFamilyMemberTypeFromString(v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("joinedDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    joinedDate = v5->_joinedDate;
    v5->_joinedDate = (NSDate *)v19;

    v5->_childAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("childAccount"));
    v5->_parentalControlsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parentalControlsEnabled"));
    v5->_askToBuyEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("askToBuyEnabled"));
    v5->_parent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parent"));
    v5->_organizer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("organizer"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOfBirth"));
    v21 = objc_claimAutoreleasedReturnValue();
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (NSDate *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("appleIDAliases"));
    v26 = objc_claimAutoreleasedReturnValue();
    appleIDAliases = v5->_appleIDAliases;
    v5->_appleIDAliases = (NSSet *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v28 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteEmail"));
    v30 = objc_claimAutoreleasedReturnValue();
    inviteEmail = v5->_inviteEmail;
    v5->_inviteEmail = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    invitationDate = v5->_invitationDate;
    v5->_invitationDate = (NSDate *)v32;

  }
  return v5;
}

- (CNContact)contact
{
  CNContact *contact;
  CNContact *v4;
  CNContact *v5;

  contact = self->_contact;
  if (!contact)
  {
    -[FAFamilyMember contact](self->_member, "contact");
    v4 = (CNContact *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contact;
    self->_contact = v4;

    contact = self->_contact;
  }
  return contact;
}

- (NSString)firstName
{
  NSString *firstName;
  NSString *v3;
  void *v4;

  firstName = self->_firstName;
  if (firstName)
  {
    v3 = firstName;
  }
  else
  {
    -[PKFamilyMember contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "givenName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)lastName
{
  NSString *lastName;
  NSString *v3;
  void *v4;

  lastName = self->_lastName;
  if (lastName)
  {
    v3 = lastName;
  }
  else
  {
    -[PKFamilyMember contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyName");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)labelName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[PKFamilyMember lastName](self, "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v4);

  -[PKFamilyMember firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v3, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canSharePeerPaymentAccount
{
  return self->_parent || self->_organizer;
}

- (BOOL)hasAppleIDAlias:(id)a3
{
  id v4;
  NSString *appleID;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  BOOL v10;

  v4 = a3;
  appleID = self->_appleID;
  v6 = (NSString *)v4;
  v7 = appleID;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = -[NSSet containsObject:](self->_appleIDAliases, "containsObject:", v6);
      goto LABEL_10;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t memberType;
  __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_member, CFSTR("member"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_me, CFSTR("me"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dsid, CFSTR("dsid"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_age, CFSTR("age"));
  memberType = self->_memberType;
  if (memberType > 2)
    v5 = 0;
  else
    v5 = off_1E2AD85F8[memberType];
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("memberType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_joinedDate, CFSTR("joinedDate"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_childAccount, CFSTR("childAccount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_parentalControlsEnabled, CFSTR("parentalControlsEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_askToBuyEnabled, CFSTR("askToBuyEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_parent, CFSTR("parent"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_organizer, CFSTR("organizer"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dateOfBirth, CFSTR("dateOfBirth"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appleIDAliases, CFSTR("appleIDAliases"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_invitationDate, CFSTR("invitationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_inviteEmail, CFSTR("inviteEmail"));

}

- (BOOL)isEqual:(id)a3
{
  PKFamilyMember *v4;
  PKFamilyMember *v5;
  BOOL v6;

  v4 = (PKFamilyMember *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKFamilyMember isEqualToFamilyMember:](self, "isEqualToFamilyMember:", v5);

  return v6;
}

- (BOOL)isEqualToFamilyMember:(id)a3
{
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  int64_t status;
  NSNumber *dsid;
  NSNumber *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v3 = 0;
    goto LABEL_16;
  }
  status = self->_status;
  if (status == 2)
  {
LABEL_5:
    dsid = self->_dsid;
    v9 = (NSNumber *)v6[6];
    if (dsid && v9)
      v3 = -[NSNumber isEqual:](dsid, "isEqual:");
    else
      v3 = dsid == v9;
    goto LABEL_16;
  }
  if (status != 1)
  {
    if (status)
      goto LABEL_16;
    goto LABEL_5;
  }
  v10 = (void *)v5[15];
  v11 = self->_inviteEmail;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    v3 = 1;
  }
  else
  {
    v3 = 0;
    if (v11 && v12)
      v3 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);
  }

LABEL_16:
  return v3 & 1;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t status;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  status = self->_status;
  if (status <= 2)
    objc_msgSend(v3, "safelyAddObject:", *(Class *)((char *)&self->super.isa + qword_190455FC8[status]));
  v6 = PKCombinedHash(17, v4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t memberType;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_me)
    objc_msgSend(v3, "appendFormat:", CFSTR("isMe: '%@'; "), CFSTR("YES"));
  memberType = self->_memberType;
  if (memberType > 2)
    v6 = 0;
  else
    v6 = off_1E2AD85F8[memberType];
  objc_msgSend(v4, "appendFormat:", CFSTR("memberType: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("dsid: '%@'; "), self->_dsid);
  objc_msgSend(v4, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  if (self->_childAccount)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("childAccount: '%@'; "), v7);
  if (self->_parent)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("parent: '%@'; "), v8);
  if (self->_organizer)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("organizer: '%@'; "), v9);
  if (self->_status == 1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("inviteEmail: '%@'; "), self->_inviteEmail);
    objc_msgSend(v4, "appendFormat:", CFSTR("invitationDate: '%@'; "), self->_invitationDate);
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)appleIDAliases
{
  return self->_appleIDAliases;
}

- (void)setAppleIDAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (unint64_t)age
{
  return self->_age;
}

- (void)setAge:(unint64_t)a3
{
  self->_age = a3;
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)memberType
{
  return self->_memberType;
}

- (void)setMemberType:(int64_t)a3
{
  self->_memberType = a3;
}

- (NSDate)joinedDate
{
  return self->_joinedDate;
}

- (void)setJoinedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)parentalControlsEnabled
{
  return self->_parentalControlsEnabled;
}

- (void)setParentalControlsEnabled:(BOOL)a3
{
  self->_parentalControlsEnabled = a3;
}

- (BOOL)askToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (void)setAskToBuyEnabled:(BOOL)a3
{
  self->_askToBuyEnabled = a3;
}

- (BOOL)isChildAccount
{
  return self->_childAccount;
}

- (void)setChildAccount:(BOOL)a3
{
  self->_childAccount = a3;
}

- (BOOL)isParent
{
  return self->_parent;
}

- (void)setParent:(BOOL)a3
{
  self->_parent = a3;
}

- (BOOL)isOrganizer
{
  return self->_organizer;
}

- (void)setOrganizer:(BOOL)a3
{
  self->_organizer = a3;
}

- (NSString)inviteEmail
{
  return self->_inviteEmail;
}

- (void)setInviteEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)invitationDate
{
  return self->_invitationDate;
}

- (void)setInvitationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationDate, 0);
  objc_storeStrong((id *)&self->_inviteEmail, 0);
  objc_storeStrong((id *)&self->_joinedDate, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end
