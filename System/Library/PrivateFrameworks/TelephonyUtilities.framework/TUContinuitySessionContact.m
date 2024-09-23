@implementation TUContinuitySessionContact

- (TUContinuitySessionContact)initWithContact:(id)a3 contactIdentifier:(id)a4 anonyms:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUContinuitySessionContact *v12;
  TUContinuitySessionContact *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUContinuitySessionContact;
  v12 = -[TUContinuitySessionContact init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_contactIdentifier, a4);
    objc_storeStrong((id *)&v13->_anonyms, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" contact=%@"), self->_contact);
  objc_msgSend(v6, "appendFormat:", CFSTR(" contactIdentifier=%@"), self->_contactIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(" anonyms=%@"), self->_anonyms);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  -[TUContinuitySessionContact contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[TUContinuitySessionContact contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "organizationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "length"))
      v5 = v7;
    else
      v5 = &stru_1E38A53C8;

  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuitySessionContact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  TUContinuitySessionContact *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_contact);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(sel_contactIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_anonyms);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[TUContinuitySessionContact initWithContact:contactIdentifier:anonyms:](self, "initWithContact:contactIdentifier:anonyms:", v7, v10, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *contact;
  id v5;
  void *v6;
  NSString *contactIdentifier;
  void *v8;
  NSSet *anonyms;
  id v10;

  contact = self->_contact;
  v5 = a3;
  NSStringFromSelector(sel_contact);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", contact, v6);

  contactIdentifier = self->_contactIdentifier;
  NSStringFromSelector(sel_contactIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, v8);

  anonyms = self->_anonyms;
  NSStringFromSelector(sel_anonyms);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", anonyms, v10);

}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSSet)anonyms
{
  return self->_anonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonyms, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
