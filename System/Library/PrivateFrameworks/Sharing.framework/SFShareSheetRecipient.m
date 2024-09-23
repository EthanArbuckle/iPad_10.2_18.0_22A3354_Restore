@implementation SFShareSheetRecipient

- (SFShareSheetRecipient)init
{

  return 0;
}

- (SFShareSheetRecipient)initWithNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFShareSheetRecipient *v9;

  v4 = a3;
  objc_msgSend(v4, "realName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SFShareSheetRecipient initWithRealName:displayName:formattedHandles:contactIdentifier:](self, "initWithRealName:displayName:formattedHandles:contactIdentifier:", v5, v6, v7, v8);
  return v9;
}

- (SFShareSheetRecipient)initWithAirDropNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFShareSheetRecipient *v9;

  v4 = a3;
  objc_msgSend(v4, "realName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SFShareSheetRecipient initWithRealName:displayName:formattedHandles:contactIdentifier:](self, "initWithRealName:displayName:formattedHandles:contactIdentifier:", v5, v6, v7, v8);
  return v9;
}

- (SFShareSheetRecipient)initWithPerson:(id)a3 handleValidationBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFShareSheetRecipient *v12;

  v6 = a3;
  -[SFShareSheetRecipient _handleFromPerson:withHandleValidationBlock:](self, "_handleFromPerson:withHandleValidationBlock:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SFShareSheetRecipient initWithRealName:displayName:formattedHandles:contactIdentifier:](self, "initWithRealName:displayName:formattedHandles:contactIdentifier:", v9, v10, v8, v11);
  return v12;
}

- (SFShareSheetRecipient)initWithRealName:(id)a3 displayName:(id)a4 formattedHandles:(id)a5 contactIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SFShareSheetRecipient *v14;
  uint64_t v15;
  NSString *realName;
  uint64_t v17;
  NSString *displayName;
  uint64_t v19;
  NSSet *formattedHandles;
  uint64_t v21;
  NSString *contactIdentifier;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SFShareSheetRecipient;
  v14 = -[SFShareSheetRecipient init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    realName = v14->_realName;
    v14->_realName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    formattedHandles = v14->_formattedHandles;
    v14->_formattedHandles = (NSSet *)v19;

    v21 = objc_msgSend(v13, "copy");
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v21;

  }
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (IsAppleInternalBuild())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v8.receiver = self;
    v8.super_class = (Class)SFShareSheetRecipient;
    -[SFShareSheetRecipient description](&v8, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ realName:%@ displayName:%@ contactIdentifier:%@ formattedHandles:%@>"), v4, self->_realName, self->_displayName, self->_contactIdentifier, self->_formattedHandles);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFShareSheetRecipient;
    -[SFShareSheetRecipient description](&v7, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShareSheetRecipient)initWithCoder:(id)a3
{
  id v4;
  SFShareSheetRecipient *v5;
  uint64_t v6;
  NSString *realName;
  uint64_t v8;
  NSString *displayName;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *formattedHandles;
  uint64_t v15;
  NSString *contactIdentifier;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFShareSheetRecipient;
  v5 = -[SFShareSheetRecipient init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("realName"));
    v6 = objc_claimAutoreleasedReturnValue();
    realName = v5->_realName;
    v5->_realName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("formattedHandles"));
    v13 = objc_claimAutoreleasedReturnValue();
    formattedHandles = v5->_formattedHandles;
    v5->_formattedHandles = (NSSet *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *realName;
  id v5;

  realName = self->_realName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", realName, CFSTR("realName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formattedHandles, CFSTR("formattedHandles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));

}

- (id)_handleFromPerson:(id)a3 withHandleValidationBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  objc_msgSend(v5, "personHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (!v6
     || (objc_msgSend(v5, "personHandle"),
         v9 = (void *)objc_claimAutoreleasedReturnValue(),
         v10 = v6[2](v6, v9),
         v9,
         v10)))
  {
    objc_msgSend(v5, "personHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "aliases", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        if (!v6 || v6[2](v6, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17)))
        {
          objc_msgSend(v18, "value");
          v19 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v19;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  return v12;
}

- (NSString)realName
{
  return self->_realName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSSet)formattedHandles
{
  return self->_formattedHandles;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_realName, 0);
}

@end
