@implementation TUContinuityFavorite

- (TUContinuityFavorite)initWithContact:(id)a3 contactIdentifier:(id)a4 anonym:(id)a5 actionType:(id)a6 bundleIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  TUContinuityFavorite *v17;
  TUContinuityFavorite *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUContinuityFavorite;
  v17 = -[TUContinuityFavorite init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contact, a3);
    objc_storeStrong((id *)&v18->_contactIdentifier, a4);
    objc_storeStrong((id *)&v18->_anonym, a5);
    objc_storeStrong((id *)&v18->_actionType, a6);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a7);
  }

  return v18;
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
  objc_msgSend(v6, "appendFormat:", CFSTR(" anonym=%@"), self->_anonym);
  objc_msgSend(v6, "appendFormat:", CFSTR(" actionType=%@"), self->_actionType);
  objc_msgSend(v6, "appendFormat:", CFSTR(" bundleIdentifier=%@"), self->_bundleIdentifier);
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

  -[TUContinuityFavorite contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[TUContinuityFavorite contact](self, "contact");
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

- (TUContinuityFavorite)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  TUContinuityFavorite *v20;

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

  v11 = objc_opt_class();
  NSStringFromSelector(sel_anonym);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_actionType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  NSStringFromSelector(sel_bundleIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[TUContinuityFavorite initWithContact:contactIdentifier:anonym:actionType:bundleIdentifier:](self, "initWithContact:contactIdentifier:anonym:actionType:bundleIdentifier:", v7, v10, v13, v16, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  CNContact *contact;
  id v5;
  void *v6;
  NSString *contactIdentifier;
  void *v8;
  TUContinuityHandleAnonym *anonym;
  void *v10;
  NSString *actionType;
  void *v12;
  NSString *bundleIdentifier;
  id v14;

  contact = self->_contact;
  v5 = a3;
  NSStringFromSelector(sel_contact);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", contact, v6);

  contactIdentifier = self->_contactIdentifier;
  NSStringFromSelector(sel_contactIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", contactIdentifier, v8);

  anonym = self->_anonym;
  NSStringFromSelector(sel_anonym);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", anonym, v10);

  actionType = self->_actionType;
  NSStringFromSelector(sel_actionType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", actionType, v12);

  bundleIdentifier = self->_bundleIdentifier;
  NSStringFromSelector(sel_bundleIdentifier);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, v14);

}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (TUContinuityHandleAnonym)anonym
{
  return self->_anonym;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_anonym, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
