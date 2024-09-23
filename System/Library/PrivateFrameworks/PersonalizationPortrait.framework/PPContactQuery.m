@implementation PPContactQuery

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPContactQuery i:'%@' n:'%@' e:'%@' ph:'%@' po:'%@' d:%d tbi:%@ c.len:%tu o:%d>"), self->_matchingIdentifiers, self->_matchingName, self->_matchingEmail, self->_matchingPhone, self->_matchingPostalAddress, self->_domain, self->_targetBundleIdentifier, -[NSString length](self->_context, "length"), self->_onlyQueryMostRelevantContacts);
}

- (BOOL)hasNoConstraints
{
  return !-[NSArray count](self->_matchingIdentifiers, "count")
      && !-[NSString length](self->_matchingName, "length")
      && !-[NSString length](self->_matchingEmail, "length")
      && !-[NSString length](self->_matchingPhone, "length")
      && -[NSString length](self->_matchingPostalAddress, "length") == 0;
}

- (PPContactQuery)initWithCoder:(id)a3
{
  id v4;
  PPContactQuery *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (PPContactQuery *)objc_opt_new();
  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setMatchingIdentifiers:](v5, "setMatchingIdentifiers:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnm"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setMatchingName:](v5, "setMatchingName:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setMatchingEmail:](v5, "setMatchingEmail:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mph"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setMatchingPhone:](v5, "setMatchingPhone:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mpo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setMatchingPostalAddress:](v5, "setMatchingPostalAddress:", v14);

  -[PPContactQuery setDomain:](v5, "setDomain:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dom")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tbi"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setTargetBundleIdentifier:](v5, "setTargetBundleIdentifier:", v15);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctx"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactQuery setContext:](v5, "setContext:", v16);

  -[PPContactQuery setOnlyQueryMostRelevantContacts:](v5, "setOnlyQueryMostRelevantContacts:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onq")));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *matchingIdentifiers;
  id v5;

  matchingIdentifiers = self->_matchingIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", matchingIdentifiers, CFSTR("mid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingName, CFSTR("mnm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingEmail, CFSTR("mem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingPhone, CFSTR("mph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchingPostalAddress, CFSTR("mpo"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_domain, CFSTR("dom"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetBundleIdentifier, CFSTR("tbi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("ctx"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onlyQueryMostRelevantContacts, CFSTR("onq"));

}

- (unint64_t)hash
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t domain;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_matchingIdentifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "hash", (_QWORD)v21) - v6 + 32 * v6;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
    v9 = 31 * v6;
  }
  else
  {
    v9 = 0;
  }

  v10 = -[NSString hash](self->_matchingName, "hash");
  v11 = -[NSString hash](self->_matchingEmail, "hash");
  v12 = -[NSString hash](self->_matchingPhone, "hash");
  v13 = -[NSString hash](self->_matchingPostalAddress, "hash");
  domain = self->_domain;
  v15 = -[NSString hash](self->_targetBundleIdentifier, "hash");
  v16 = -[NSString hash](self->_context, "hash");
  v17 = v11 - (v10 + v9) + 32 * (v10 + v9);
  v18 = v13 - (v12 - v17 + 32 * v17) + 32 * (v12 - v17 + 32 * v17);
  v19 = v15 - (domain - v18 + 32 * v18) + 32 * (domain - v18 + 32 * v18);
  return self->_onlyQueryMostRelevantContacts - (v16 - v19 + 32 * v19) + 32 * (v16 - v19 + 32 * v19);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_opt_new();
  v6 = (void *)-[NSArray copyWithZone:](self->_matchingIdentifiers, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingIdentifiers:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_matchingName, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingName:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_matchingEmail, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingEmail:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_matchingPhone, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingPhone:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_matchingPostalAddress, "copyWithZone:", a3);
  objc_msgSend(v5, "setMatchingPostalAddress:", v10);

  objc_msgSend(v5, "setDomain:", self->_domain);
  v11 = (void *)-[NSString copyWithZone:](self->_targetBundleIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setTargetBundleIdentifier:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_context, "copyWithZone:", a3);
  objc_msgSend(v5, "setContext:", v12);

  objc_msgSend(v5, "setOnlyQueryMostRelevantContacts:", self->_onlyQueryMostRelevantContacts);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PPContactQuery *v4;
  PPContactQuery *v5;
  BOOL v6;

  v4 = (PPContactQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPContactQuery isEqualToContactQuery:](self, "isEqualToContactQuery:", v5);

  return v6;
}

- (BOOL)isEqualToContactQuery:(id)a3
{
  id *v4;
  id *v5;
  NSArray *matchingIdentifiers;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  NSString *matchingName;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *matchingEmail;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *matchingPhone;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *matchingPostalAddress;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSString *targetBundleIdentifier;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *context;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  BOOL v41;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_29;
  matchingIdentifiers = self->_matchingIdentifiers;
  v7 = (NSArray *)v4[2];
  if (matchingIdentifiers == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = matchingIdentifiers;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_29;
  }
  matchingName = self->_matchingName;
  v12 = (NSString *)v5[3];
  if (matchingName == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = matchingName;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_29;
  }
  matchingEmail = self->_matchingEmail;
  v17 = (NSString *)v5[4];
  if (matchingEmail == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = matchingEmail;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_29;
  }
  matchingPhone = self->_matchingPhone;
  v22 = (NSString *)v5[5];
  if (matchingPhone == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = matchingPhone;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_29;
  }
  matchingPostalAddress = self->_matchingPostalAddress;
  v27 = (NSString *)v5[6];
  if (matchingPostalAddress == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = matchingPostalAddress;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_29;
  }
  if (self->_domain == *((unsigned __int8 *)v5 + 8))
  {
    targetBundleIdentifier = self->_targetBundleIdentifier;
    v32 = (NSString *)v5[7];
    if (targetBundleIdentifier == v32)
    {

    }
    else
    {
      v33 = v32;
      v34 = targetBundleIdentifier;
      v35 = -[NSString isEqual:](v34, "isEqual:", v33);

      if ((v35 & 1) == 0)
        goto LABEL_29;
    }
    context = self->_context;
    v37 = (NSString *)v5[8];
    if (context == v37)
    {

    }
    else
    {
      v38 = v37;
      v39 = context;
      v40 = -[NSString isEqual:](v39, "isEqual:", v38);

      if ((v40 & 1) == 0)
        goto LABEL_29;
    }
    v41 = self->_onlyQueryMostRelevantContacts == *((unsigned __int8 *)v5 + 9);
    goto LABEL_30;
  }
LABEL_29:
  v41 = 0;
LABEL_30:

  return v41;
}

- (NSArray)matchingIdentifiers
{
  return self->_matchingIdentifiers;
}

- (void)setMatchingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_matchingIdentifiers, a3);
}

- (NSString)matchingName
{
  return self->_matchingName;
}

- (void)setMatchingName:(id)a3
{
  objc_storeStrong((id *)&self->_matchingName, a3);
}

- (NSString)matchingEmail
{
  return self->_matchingEmail;
}

- (void)setMatchingEmail:(id)a3
{
  objc_storeStrong((id *)&self->_matchingEmail, a3);
}

- (NSString)matchingPhone
{
  return self->_matchingPhone;
}

- (void)setMatchingPhone:(id)a3
{
  objc_storeStrong((id *)&self->_matchingPhone, a3);
}

- (NSString)matchingPostalAddress
{
  return self->_matchingPostalAddress;
}

- (void)setMatchingPostalAddress:(id)a3
{
  objc_storeStrong((id *)&self->_matchingPostalAddress, a3);
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)setDomain:(unsigned __int8)a3
{
  self->_domain = a3;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (void)setTargetBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetBundleIdentifier, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)onlyQueryMostRelevantContacts
{
  return self->_onlyQueryMostRelevantContacts;
}

- (void)setOnlyQueryMostRelevantContacts:(BOOL)a3
{
  self->_onlyQueryMostRelevantContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_matchingPostalAddress, 0);
  objc_storeStrong((id *)&self->_matchingPhone, 0);
  objc_storeStrong((id *)&self->_matchingEmail, 0);
  objc_storeStrong((id *)&self->_matchingName, 0);
  objc_storeStrong((id *)&self->_matchingIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
