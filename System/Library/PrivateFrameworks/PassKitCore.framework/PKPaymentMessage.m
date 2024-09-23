@implementation PKPaymentMessage

+ (id)paymentMessageWithDictionary:(id)a3
{
  id v3;
  PKPaymentMessage *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentMessage);
  v5 = v3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", CFSTR("identifier"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("serviceIdentifier"));

  objc_msgSend(v6, "PKStringForKey:", CFSTR("serviceIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage setServiceIdentifier:](v4, "setServiceIdentifier:", v9);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage setContent:](v4, "setContent:", v10);

  objc_msgSend(v6, "PKDateForKey:", CFSTR("messageDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage setMessageDate:](v4, "setMessageDate:", v11);

  -[PKPaymentMessage setAllowDeepLink:](v4, "setAllowDeepLink:", objc_msgSend(v6, "PKBoolForKey:", CFSTR("allowDeepLink")));
  objc_msgSend(v6, "PKDateForKey:", CFSTR("expirationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage setExpirationDate:](v4, "setExpirationDate:", v12);

  return v4;
}

- (PKPaymentMessage)init
{
  PKPaymentMessage *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentMessage;
  v2 = -[PKPaymentMessage init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_content);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_messageDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_messageType - v4 + 32 * v4;
  v6 = self->_allowDeepLink - v5 + 32 * v5;
  v7 = self->_hasAssociatedPaymentApplication - v6 + 32 * v6;
  v8 = self->_archived - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentMessage *v4;
  PKPaymentMessage *v5;
  BOOL v6;

  v4 = (PKPaymentMessage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentMessage isEqualToPaymentMessage:](self, "isEqualToPaymentMessage:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentMessage:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  NSString *serviceIdentifier;
  NSString *v9;
  NSString *content;
  NSString *v11;
  NSDate *messageDate;
  NSDate *v13;
  NSDate *expirationDate;
  NSDate *v15;
  BOOL v16;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_33;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_33;
  }
  serviceIdentifier = self->_serviceIdentifier;
  v9 = (NSString *)v4[3];
  if (serviceIdentifier && v9)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (serviceIdentifier != v9)
  {
    goto LABEL_33;
  }
  content = self->_content;
  v11 = (NSString *)v4[4];
  if (content && v11)
  {
    if ((-[NSString isEqual:](content, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (content != v11)
  {
    goto LABEL_33;
  }
  messageDate = self->_messageDate;
  v13 = (NSDate *)v4[5];
  if (messageDate && v13)
  {
    if ((-[NSDate isEqual:](messageDate, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (messageDate != v13)
  {
    goto LABEL_33;
  }
  expirationDate = self->_expirationDate;
  v15 = (NSDate *)v4[6];
  if (!expirationDate || !v15)
  {
    if (expirationDate == v15)
      goto LABEL_29;
LABEL_33:
    v16 = 0;
    goto LABEL_34;
  }
  if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
    goto LABEL_33;
LABEL_29:
  if (self->_messageType != v4[7]
    || self->_allowDeepLink != *((unsigned __int8 *)v4 + 8)
    || self->_hasAssociatedPaymentApplication != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_33;
  }
  v16 = self->_archived == *((unsigned __int8 *)v4 + 10);
LABEL_34:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPaymentMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage serviceIdentifier](self, "serviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMessage content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Identifier: %@, Service Identifier: %@, Content: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentMessage)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMessage *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *serviceIdentifier;
  uint64_t v10;
  NSString *content;
  uint64_t v12;
  NSDate *messageDate;
  uint64_t v14;
  NSDate *expirationDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentMessage;
  v5 = -[PKPaymentMessage init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v10 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    messageDate = v5->_messageDate;
    v5->_messageDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_messageType = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("messageType"));
    v5->_allowDeepLink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowDeepLink"));
    v5->_hasAssociatedPaymentApplication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAssociatedPaymentApplication"));
    v5->_archived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("archived"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_content, CFSTR("content"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messageDate, CFSTR("messageDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_messageType != 0, CFSTR("messageType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowDeepLink, CFSTR("allowDeepLink"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAssociatedPaymentApplication, CFSTR("hasAssociatedPaymentApplication"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_archived, CFSTR("archived"));

}

- (BOOL)isValid
{
  BOOL v2;
  NSDate *expirationDate;
  void *v5;

  if (self->_archived || !-[NSString length](self->_content, "length"))
    return 0;
  expirationDate = self->_expirationDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[NSDate compare:](expirationDate, "compare:", v5) != NSOrderedAscending;

  return v2;
}

- (BOOL)archiveOnNextTransaction
{
  return self->_messageType == 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)messageDate
{
  return self->_messageDate;
}

- (void)setMessageDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unint64_t)a3
{
  self->_messageType = a3;
}

- (BOOL)allowDeepLink
{
  return self->_allowDeepLink;
}

- (void)setAllowDeepLink:(BOOL)a3
{
  self->_allowDeepLink = a3;
}

- (BOOL)hasAssociatedPaymentApplication
{
  return self->_hasAssociatedPaymentApplication;
}

- (void)setHasAssociatedPaymentApplication:(BOOL)a3
{
  self->_hasAssociatedPaymentApplication = a3;
}

- (BOOL)isArchived
{
  return self->_archived;
}

- (void)setArchived:(BOOL)a3
{
  self->_archived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_messageDate, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
