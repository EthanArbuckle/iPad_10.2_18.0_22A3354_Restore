@implementation PKAccountPendingFamilyMember

- (PKAccountPendingFamilyMember)initWithPendingFamilyMember:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  PKAccountPendingFamilyMember *v8;
  PKAccountPendingFamilyMember *v9;
  uint64_t v10;
  NSDate *inviteDate;
  uint64_t v12;
  NSString *inviteEmail;
  uint64_t v14;
  NSString *altDSID;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountPendingFamilyMember;
  v8 = -[PKAccountPendingFamilyMember init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a4);
    objc_msgSend(v6, "invitationDate");
    v10 = objc_claimAutoreleasedReturnValue();
    inviteDate = v9->_inviteDate;
    v9->_inviteDate = (NSDate *)v10;

    objc_msgSend(v6, "inviteEmail");
    v12 = objc_claimAutoreleasedReturnValue();
    inviteEmail = v9->_inviteEmail;
    v9->_inviteEmail = (NSString *)v12;

    v9->_displayedNotification = 0;
    objc_msgSend(v6, "altDSID");
    v14 = objc_claimAutoreleasedReturnValue();
    altDSID = v9->_altDSID;
    v9->_altDSID = (NSString *)v14;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountPendingFamilyMember *v4;
  PKAccountPendingFamilyMember *v5;
  BOOL v6;

  v4 = (PKAccountPendingFamilyMember *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountPendingFamilyMember _isEqualToAccountPendingFamilyMember:](self, "_isEqualToAccountPendingFamilyMember:", v5);

  return v6;
}

- (BOOL)_isEqualToAccountPendingFamilyMember:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDate *inviteDate;
  NSDate *v12;
  void *v13;
  NSString *v14;
  NSString *altDSID;
  void *v16;
  NSString *v17;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  v6 = (void *)*((_QWORD *)v4 + 3);
  v7 = self->_inviteEmail;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
      goto LABEL_26;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_27;
  }
  inviteDate = self->_inviteDate;
  v12 = (NSDate *)*((_QWORD *)v5 + 4);
  if (inviteDate && v12)
  {
    if ((-[NSDate isEqual:](inviteDate, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (inviteDate != v12)
  {
    goto LABEL_19;
  }
  if (self->_displayedNotification == v5[8])
  {
    v13 = (void *)*((_QWORD *)v5 + 2);
    v7 = self->_accountIdentifier;
    v14 = v13;
    if (v7 == v14)
    {

LABEL_21:
      altDSID = self->_altDSID;
      v16 = (void *)*((_QWORD *)v5 + 5);
      v7 = altDSID;
      v17 = v16;
      if (v7 == v17)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v17;
        LOBYTE(v10) = 0;
        if (v7 && v17)
          LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v17);
      }
      goto LABEL_26;
    }
    v9 = v14;
    LOBYTE(v10) = 0;
    if (v7 && v14)
    {
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);

      if (!v10)
        goto LABEL_27;
      goto LABEL_21;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_19:
  LOBYTE(v10) = 0;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_inviteEmail);
  objc_msgSend(v3, "safelyAddObject:", self->_inviteDate);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_displayedNotification - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPendingFamilyMember)initWithCoder:(id)a3
{
  id v4;
  PKAccountPendingFamilyMember *v5;
  uint64_t v6;
  NSDate *inviteDate;
  uint64_t v8;
  NSString *inviteEmail;
  uint64_t v10;
  NSString *accountIdentifier;
  uint64_t v12;
  NSString *altDSID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPendingFamilyMember;
  v5 = -[PKAccountPendingFamilyMember init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    inviteDate = v5->_inviteDate;
    v5->_inviteDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteEmail"));
    v8 = objc_claimAutoreleasedReturnValue();
    inviteEmail = v5->_inviteEmail;
    v5->_inviteEmail = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v10;

    v5->_displayedNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayedNotification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v12 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 displayedNotification;
  id v5;

  displayedNotification = self->_displayedNotification;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", displayedNotification, CFSTR("displayedNotification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inviteEmail, CFSTR("inviteEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inviteDate, CFSTR("inviteDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));

}

- (id)description
{
  void *v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("inviteEmail: '%@'; "), self->_inviteEmail);
  objc_msgSend(v3, "appendFormat:", CFSTR("inviteDate: '%@'; "), self->_inviteDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  if (self->_displayedNotification)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("displayedNotification: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)inviteEmail
{
  return self->_inviteEmail;
}

- (void)setInviteEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)inviteDate
{
  return self->_inviteDate;
}

- (void)setInviteDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)displayedNotification
{
  return self->_displayedNotification;
}

- (void)setDisplayedNotification:(BOOL)a3
{
  self->_displayedNotification = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_inviteDate, 0);
  objc_storeStrong((id *)&self->_inviteEmail, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
