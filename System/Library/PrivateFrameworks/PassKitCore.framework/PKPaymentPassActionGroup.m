@implementation PKPaymentPassActionGroup

- (PKPaymentPassActionGroup)initWithDictionary:(id)a3 localizations:(id)a4
{
  id v6;
  id v7;
  PKPaymentPassActionGroup *v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  uint64_t v16;
  NSString *actionGroupDescription;
  void *v18;
  uint64_t v19;
  NSArray *actionIdentifiers;
  PKPaymentPassActionRemoteConfiguration *v21;
  void *v22;
  uint64_t v23;
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;
  PKPaymentPassActionRemoteConfiguration *v25;
  PKPaymentPassActionRemoteConfiguration *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  PKPaymentPassAction *v34;
  uint64_t v35;
  NSArray *actions;
  NSString *v37;
  void *v38;
  NSString *v39;
  NSString *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentPassActionGroup;
  v8 = -[PKPaymentPassActionGroup init](&v50, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v13;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("description"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    actionGroupDescription = v8->_actionGroupDescription;
    v8->_actionGroupDescription = (NSString *)v16;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actionIdentifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    actionIdentifiers = v8->_actionIdentifiers;
    v8->_actionIdentifiers = (NSArray *)v19;

    v21 = [PKPaymentPassActionRemoteConfiguration alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("remoteContentConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKPaymentPassActionRemoteConfiguration initWithDictionary:](v21, "initWithDictionary:", v22);
    remoteContentConfiguration = v8->_remoteContentConfiguration;
    v8->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v23;

    if (!v8->_remoteContentConfiguration && objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasRemoteContent")))
    {
      v25 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", objc_msgSend(v6, "PKBoolForKey:", CFSTR("remoteContentRequiresAppletData")), 1);
      v26 = v8->_remoteContentConfiguration;
      v8->_remoteContentConfiguration = v25;

    }
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v27, "count"))
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v45 = v27;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v47;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v47 != v32)
              objc_enumerationMutation(v29);
            v34 = -[PKPaymentPassAction initWithDictionary:localizations:]([PKPaymentPassAction alloc], "initWithDictionary:localizations:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v33), v7);
            objc_msgSend(v28, "safelyAddObject:", v34);

            ++v33;
          }
          while (v31 != v33);
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v31);
      }

      v27 = v45;
    }
    v35 = objc_msgSend(v28, "copy");
    actions = v8->_actions;
    v8->_actions = (NSArray *)v35;

    v37 = v8->_actionGroupDescription;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](v37, "stringByTrimmingCharactersInSet:", v38);
    v39 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39 || (v41 = -[NSString length](v39, "length"), v40, !v41))
    {
      v42 = -[NSArray count](v8->_actions, "count");

      if (v42 != 1)
      {
LABEL_19:

        goto LABEL_20;
      }
      -[NSArray firstObject](v8->_actions, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "actionDescription");
      v43 = objc_claimAutoreleasedReturnValue();
      v40 = v8->_actionGroupDescription;
      v8->_actionGroupDescription = (NSString *)v43;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v8;
}

- (BOOL)hasRemoteContent
{
  return self->_remoteContentConfiguration != 0;
}

- (BOOL)remoteContentRequiresAppletData
{
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;

  remoteContentConfiguration = self->_remoteContentConfiguration;
  if (remoteContentConfiguration)
    LOBYTE(remoteContentConfiguration) = -[PKPaymentPassActionRemoteConfiguration requiresAppletData](remoteContentConfiguration, "requiresAppletData");
  return (char)remoteContentConfiguration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionGroupDescription, CFSTR("description"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionIdentifiers, CFSTR("actionIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletData, CFSTR("appletData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteContentConfiguration, CFSTR("remoteContentConfiguration"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentPassActionGroup hasRemoteContent](self, "hasRemoteContent"), CFSTR("hasRemoteContent"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKPaymentPassActionGroup remoteContentRequiresAppletData](self, "remoteContentRequiresAppletData"), CFSTR("remoteContentRequiresAppletData"));

}

- (PKPaymentPassActionGroup)initWithCoder:(id)a3
{
  id v4;
  PKPaymentPassActionGroup *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *actionGroupDescription;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *actionIdentifiers;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *actions;
  uint64_t v26;
  NSDictionary *appletData;
  uint64_t v28;
  PKPaymentPassActionRemoteConfiguration *remoteContentConfiguration;
  PKPaymentPassActionRemoteConfiguration *v30;
  PKPaymentPassActionRemoteConfiguration *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKPaymentPassActionGroup;
  v5 = -[PKPaymentPassActionGroup init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    actionGroupDescription = v5->_actionGroupDescription;
    v5->_actionGroupDescription = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("actionIdentifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    actionIdentifiers = v5->_actionIdentifiers;
    v5->_actionIdentifiers = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("actions"));
    v24 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletData"));
    v26 = objc_claimAutoreleasedReturnValue();
    appletData = v5->_appletData;
    v5->_appletData = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteContentConfiguration"));
    v28 = objc_claimAutoreleasedReturnValue();
    remoteContentConfiguration = v5->_remoteContentConfiguration;
    v5->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v28;

    if (!v5->_remoteContentConfiguration)
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRemoteContent")))
      {
        v30 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remoteContentRequiresAppletData")), 1);
        v31 = v5->_remoteContentConfiguration;
        v5->_remoteContentConfiguration = v30;

      }
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_actionGroupDescription, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSArray copyWithZone:](self->_actionIdentifiers, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSArray copyWithZone:](self->_actions, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[PKPaymentPassActionRemoteConfiguration copyWithZone:](self->_remoteContentConfiguration, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v18 = -[NSDictionary copyWithZone:](self->_appletData, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)actionGroupDescription
{
  return self->_actionGroupDescription;
}

- (void)setActionGroupDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)actionIdentifiers
{
  return self->_actionIdentifiers;
}

- (void)setActionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)appletData
{
  return self->_appletData;
}

- (void)setAppletData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration
{
  return self->_remoteContentConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentConfiguration, 0);
  objc_storeStrong((id *)&self->_appletData, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionIdentifiers, 0);
  objc_storeStrong((id *)&self->_actionGroupDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
