@implementation PKServiceProviderPurchaseAction

+ (id)actionWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (PKServiceProviderPurchaseAction)initWithDictionary:(id)a3
{
  id v4;
  PKServiceProviderPurchaseAction *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *localizedTitle;
  void *v12;
  uint64_t v13;
  NSString *localizedDescription;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKServiceProviderPurchaseAction;
  v5 = -[PKServiceProviderPurchaseAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchaseAction)initWithCoder:(id)a3
{
  id v4;
  PKServiceProviderPurchaseAction *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *localizedTitle;
  void *v12;
  uint64_t v13;
  NSString *localizedDescription;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKServiceProviderPurchaseAction;
  v5 = -[PKServiceProviderPurchaseAction init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDescription);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PKServiceProviderPurchaseAction isEqualToServiceProviderPurchaseAction:](self, "isEqualToServiceProviderPurchaseAction:", v4);

  return v5;
}

- (BOOL)isEqualToServiceProviderPurchaseAction:(id)a3
{
  PKServiceProviderPurchaseAction *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *localizedTitle;
  NSString *v10;
  NSString *localizedDescription;
  NSString *v12;

  v4 = (PKServiceProviderPurchaseAction *)a3;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_19;
  }
  identifier = self->_identifier;
  v6 = v4->_identifier;
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_18;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_18;
  }
  localizedTitle = self->_localizedTitle;
  v10 = v4->_localizedTitle;
  if (!localizedTitle || !v10)
  {
    if (localizedTitle == v10)
      goto LABEL_14;
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0)
    goto LABEL_18;
LABEL_14:
  localizedDescription = self->_localizedDescription;
  v12 = v4->_localizedDescription;
  if (localizedDescription && v12)
    v8 = -[NSString isEqual:](localizedDescription, "isEqual:");
  else
    v8 = localizedDescription == v12;
LABEL_19:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_localizedTitle)
    objc_msgSend(v4, "appendFormat:", CFSTR("localizedTitle: '%@'; "), self->_localizedTitle);
  if (self->_localizedDescription)
    objc_msgSend(v4, "appendFormat:", CFSTR("localizedDescription: %@; "), self->_localizedDescription);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
