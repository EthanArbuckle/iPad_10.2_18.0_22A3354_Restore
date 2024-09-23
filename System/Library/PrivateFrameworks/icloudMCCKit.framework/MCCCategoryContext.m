@implementation MCCCategoryContext

- (MCCCategoryContext)initWithCoder:(id)a3
{
  id v4;
  MCCCategoryContext *v5;
  uint64_t v6;
  NSString *senderName;
  uint64_t v8;
  NSString *senderEmail;
  uint64_t v10;
  NSString *receiverEmail;
  uint64_t v12;
  NSString *emailSubject;
  uint64_t v14;
  NSString *localRuleCategory;

  v4 = a3;
  v5 = -[MCCCategoryContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_senderNAme"));
    v6 = objc_claimAutoreleasedReturnValue();
    senderName = v5->_senderName;
    v5->_senderName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_senderEmail"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderEmail = v5->_senderEmail;
    v5->_senderEmail = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recipientEmail"));
    v10 = objc_claimAutoreleasedReturnValue();
    receiverEmail = v5->_receiverEmail;
    v5->_receiverEmail = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subject"));
    v12 = objc_claimAutoreleasedReturnValue();
    emailSubject = v5->_emailSubject;
    v5->_emailSubject = (NSString *)v12;

    v5->_isUnsubscribeHeaderPresent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_unsubscribed"));
    v5->_isSenderVIP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isVIP"));
    v5->_isSenderInAddressBook = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_inAddressBook"));
    v5->_isSenderRecentContact = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_recentContact"));
    v5->_isSenderPrimary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_senderPrimary"));
    v5->_isNonPersonalAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isNonPersonalAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localRuleCategory"));
    v14 = objc_claimAutoreleasedReturnValue();
    localRuleCategory = v5->_localRuleCategory;
    v5->_localRuleCategory = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *senderName;
  id v5;

  senderName = self->_senderName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", senderName, CFSTR("_senderNAme"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderEmail, CFSTR("_senderEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receiverEmail, CFSTR("_recipientEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailSubject, CFSTR("_subject"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUnsubscribeHeaderPresent, CFSTR("_unsubscribed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSenderVIP, CFSTR("_isVIP"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSenderInAddressBook, CFSTR("_inAddressBook"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSenderRecentContact, CFSTR("_recentContact"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSenderPrimary, CFSTR("_senderPrimary"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNonPersonalAccount, CFSTR("_isNonPersonalAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localRuleCategory, CFSTR("_localRuleCategory"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_senderName, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_senderEmail, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_receiverEmail, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSString copy](self->_emailSubject, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  *(_BYTE *)(v4 + 8) = self->_isUnsubscribeHeaderPresent;
  *(_BYTE *)(v4 + 9) = self->_isSenderVIP;
  *(_BYTE *)(v4 + 10) = self->_isSenderInAddressBook;
  *(_BYTE *)(v4 + 11) = self->_isSenderRecentContact;
  *(_BYTE *)(v4 + 12) = self->_isSenderPrimary;
  *(_BYTE *)(v4 + 13) = self->_isNonPersonalAccount;
  v13 = -[NSString copy](self->_localRuleCategory, "copy");
  v14 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v13;

  return (id)v4;
}

- (id)stringValue
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v2 = "yes";
  if (self->_isUnsubscribeHeaderPresent)
    v3 = "yes";
  else
    v3 = "no";
  if (self->_isSenderVIP)
    v4 = "yes";
  else
    v4 = "no";
  if (self->_isSenderInAddressBook)
    v5 = "yes";
  else
    v5 = "no";
  if (self->_isSenderRecentContact)
    v6 = "yes";
  else
    v6 = "no";
  if (self->_isSenderPrimary)
    v7 = "yes";
  else
    v7 = "no";
  if (!self->_isNonPersonalAccount)
    v2 = "no";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("senderName:    %@\nsenderEmail:   %@\nreceiverEmail: %@\nemailSubject:  %@\nunsub header:  %s\nsender VIP:    %s\nsender in book:%s\nsender recent: %s\nsender primary:%s\nnon personal account:%s\nlocal rule category:%@\n"), *(_OWORD *)&self->_senderName, self->_receiverEmail, self->_emailSubject, v3, v4, v5, v6, v7, v2, self->_localRuleCategory);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)senderEmail
{
  return self->_senderEmail;
}

- (void)setSenderEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)receiverEmail
{
  return self->_receiverEmail;
}

- (void)setReceiverEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)emailSubject
{
  return self->_emailSubject;
}

- (void)setEmailSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isUnsubscribeHeaderPresent
{
  return self->_isUnsubscribeHeaderPresent;
}

- (void)setIsUnsubscribeHeaderPresent:(BOOL)a3
{
  self->_isUnsubscribeHeaderPresent = a3;
}

- (BOOL)isSenderVIP
{
  return self->_isSenderVIP;
}

- (void)setIsSenderVIP:(BOOL)a3
{
  self->_isSenderVIP = a3;
}

- (BOOL)isSenderInAddressBook
{
  return self->_isSenderInAddressBook;
}

- (void)setIsSenderInAddressBook:(BOOL)a3
{
  self->_isSenderInAddressBook = a3;
}

- (BOOL)isSenderRecentContact
{
  return self->_isSenderRecentContact;
}

- (void)setIsSenderRecentContact:(BOOL)a3
{
  self->_isSenderRecentContact = a3;
}

- (BOOL)isSenderPrimary
{
  return self->_isSenderPrimary;
}

- (void)setIsSenderPrimary:(BOOL)a3
{
  self->_isSenderPrimary = a3;
}

- (BOOL)isNonPersonalAccount
{
  return self->_isNonPersonalAccount;
}

- (void)setIsNonPersonalAccount:(BOOL)a3
{
  self->_isNonPersonalAccount = a3;
}

- (NSString)localRuleCategory
{
  return self->_localRuleCategory;
}

- (void)setLocalRuleCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRuleCategory, 0);
  objc_storeStrong((id *)&self->_emailSubject, 0);
  objc_storeStrong((id *)&self->_receiverEmail, 0);
  objc_storeStrong((id *)&self->_senderEmail, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
}

@end
