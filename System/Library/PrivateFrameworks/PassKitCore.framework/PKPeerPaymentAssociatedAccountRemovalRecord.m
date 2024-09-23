@implementation PKPeerPaymentAssociatedAccountRemovalRecord

- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentAssociatedAccountRemovalRecord *v5;
  uint64_t v6;
  NSString *altDSID;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  uint64_t v18;
  NSDate *date;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountRemovalRecord;
  v5 = -[PKPeerPaymentAssociatedAccountRemovalRecord init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("removalReason"));
    v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    if (v8 == CFSTR("closed") || !v8)
      goto LABEL_12;
    v11 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("closed"));

    if ((v11 & 1) == 0)
    {
      v12 = v9;
      if (v12 == CFSTR("graduation")
        || (v13 = v12,
            v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("graduation")),
            v13,
            (v14 & 1) != 0))
      {
        v10 = 1;
        goto LABEL_12;
      }
      v15 = v13;
      if (v15 == CFSTR("deletedInvite")
        || (v16 = v15,
            v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("deletedInvite")),
            v16,
            v17))
      {
        v10 = 2;
        goto LABEL_12;
      }
    }
    v10 = 0;
LABEL_12:

    v5->_reason = v10;
    objc_msgSend(v4, "PKDateForKey:", CFSTR("removalDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v18;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAssociatedAccountRemovalRecord *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentAssociatedAccountRemovalRecord;
  v5 = -[PKPeerPaymentAssociatedAccountRemovalRecord init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_hasPresentedNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPresentedNotification"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasPresentedNotification, CFSTR("hasPresentedNotification"));

}

- (id)description
{
  void *v3;
  int64_t reason;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  reason = self->_reason;
  v5 = CFSTR("closed");
  if (reason == 1)
    v5 = CFSTR("graduation");
  if (reason == 2)
    v6 = CFSTR("deletedInvite");
  else
    v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("reason: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("date: '%@'; "), self->_date);
  if (self->_hasPresentedNotification)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasPresentedNotification: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  NSDate *date;
  NSDate *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v5 = (void *)v4[2];
  v6 = self->_altDSID;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_14;
    }
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_14;
  }
  if (self->_reason == v4[3])
  {
    date = self->_date;
    v11 = (NSDate *)v4[4];
    if (date && v11)
    {
      if ((-[NSDate isEqual:](date, "isEqual:") & 1) != 0)
        goto LABEL_17;
    }
    else if (date == v11)
    {
LABEL_17:
      v12 = self->_hasPresentedNotification == *((unsigned __int8 *)v4 + 8);
      goto LABEL_15;
    }
  }
LABEL_14:
  v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_date);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_reason - v4 + 32 * v4;
  v6 = self->_hasPresentedNotification - v5 + 32 * v5;

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasPresentedNotification
{
  return self->_hasPresentedNotification;
}

- (void)setHasPresentedNotification:(BOOL)a3
{
  self->_hasPresentedNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
