@implementation _PSRecipient

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5
{
  return -[_PSRecipient initWithIdentifier:handle:displayName:contact:](self, "initWithIdentifier:handle:displayName:contact:", a3, a4, 0, a5);
}

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 displayName:(id)a5 contact:(id)a6
{
  return -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:](self, "initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:", a3, 0, a4, a5, a6, 0);
}

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5 mostRecentTransportBundleId:(id)a6
{
  return -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:](self, "initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:", a3, 0, a4, 0, a5, a6);
}

- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7
{
  return -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:](self, "initWithIdentifier:senderHandle:handle:displayName:contact:mostRecentTransportBundleId:", a3, a4, a5, a6, a7, 0);
}

- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7 mostRecentTransportBundleId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _PSRecipient *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *senderHandle;
  uint64_t v25;
  NSString *handle;
  uint64_t v27;
  NSString *displayName;
  uint64_t v29;
  NSString *mostRecentTransportBundleId;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)_PSRecipient;
  v20 = -[_PSRecipient init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    senderHandle = v20->_senderHandle;
    v20->_senderHandle = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    handle = v20->_handle;
    v20->_handle = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    objc_storeStrong((id *)&v20->_contact, a7);
    v29 = objc_msgSend(v19, "copy");
    mostRecentTransportBundleId = v20->_mostRecentTransportBundleId;
    v20->_mostRecentTransportBundleId = (NSString *)v29;

    v20->_handleType = +[_PSInteractionStoreUtils getHandleTypeFromHandleString:](_PSInteractionStoreUtils, "getHandleTypeFromHandleString:", v16);
  }

  return v20;
}

+ (id)recipientForINPerson:(id)a3 contactResolver:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(a4, "resolveContactFromINPerson:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v5, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v7, "initWithIdentifier:handle:displayName:contact:", v8, v10, v11, v6);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSRecipient)initWithCoder:(id)a3
{
  id v4;
  _PSRecipient *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *senderHandle;
  uint64_t v10;
  NSString *handle;
  uint64_t v12;
  NSString *displayName;
  uint64_t v14;
  NSString *givenName;
  uint64_t v16;
  NSString *familyName;
  void *v18;
  id v19;
  uint64_t v20;
  CNContact *contact;
  uint64_t v22;
  NSString *mostRecentTransportBundleId;
  _PSRecipient *v24;
  objc_super v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_PSRecipient;
  v5 = -[_PSRecipient init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderHandle = v5->_senderHandle;
    v5->_senderHandle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v10 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("givenName"));
    v14 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyName"));
    v16 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v16;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v18 = (void *)getCNContactClass_softClass_4;
    v31 = getCNContactClass_softClass_4;
    if (!getCNContactClass_softClass_4)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __getCNContactClass_block_invoke_4;
      v27[3] = &unk_1E43FEA00;
      v27[4] = &v28;
      __getCNContactClass_block_invoke_4((uint64_t)v27);
      v18 = (void *)v29[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v28, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contact"));
    v20 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentTransportBundleId"));
    v22 = objc_claimAutoreleasedReturnValue();
    mostRecentTransportBundleId = v5->_mostRecentTransportBundleId;
    v5->_mostRecentTransportBundleId = (NSString *)v22;

    v5->_handleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("handleType"));
    v24 = v5;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderHandle, CFSTR("senderHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenName, CFSTR("givenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyName, CFSTR("familyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentTransportBundleId, CFSTR("mostRecentTransportBundleId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_handleType, CFSTR("handleType"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_handle, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _PSRecipient *v4;
  _PSRecipient *v5;
  _PSRecipient *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (_PSRecipient *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[_PSRecipient identifier](self, "identifier");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          -[_PSRecipient handle](self, "handle");
          v9 = objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            v16 = 0;
LABEL_16:

            goto LABEL_17;
          }
          v10 = (void *)v9;
          -[_PSRecipient identifier](v6, "identifier");
          v11 = objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_14;
          v12 = (void *)v11;
          -[_PSRecipient handle](v6, "handle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[_PSRecipient identifier](self, "identifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSRecipient identifier](v6, "identifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "isEqualToString:", v10))
            {
              -[_PSRecipient handle](self, "handle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSRecipient handle](v6, "handle");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqualToString:", v15);

LABEL_15:
              goto LABEL_16;
            }
LABEL_14:
            v16 = 0;
            goto LABEL_15;
          }
        }
        v16 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v16 = 0;
  }
LABEL_18:

  return v16;
}

- (id)description
{
  return -[_PSRecipient descriptionRedacted:](self, "descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[_PSRecipient descriptionRedacted:](self, "descriptionRedacted:", 1);
}

- (id)descriptionRedacted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  v22 = (void *)MEMORY[0x1E0CB3940];
  v21 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0D158F0];
  -[_PSRecipient identifier](self, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionOfObject:redacted:", v24, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D158F0];
  -[_PSRecipient senderHandle](self, "senderHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionOfObject:redacted:", v23, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D158F0];
  -[_PSRecipient handle](self, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionOfObject:redacted:", v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D158F0];
  -[_PSRecipient displayName](self, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptionOfObject:redacted:", v13, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D158F0];
  -[_PSRecipient contact](self, "contact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionOfObject:redacted:", v16, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRecipient mostRecentTransportBundleId](self, "mostRecentTransportBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@ %p> identifier: %@, senderHandle: %@, handle: %@, displayName: %@, contact: %@ mostRecentTransportBundleId: %@"), v21, self, v6, v8, v11, v14, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)handleString
{
  return self->_handleString;
}

- (void)setHandleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)familyHeuristic
{
  return self->_familyHeuristic;
}

- (void)setFamilyHeuristic:(BOOL)a3
{
  self->_familyHeuristic = a3;
}

- (BOOL)photosInference
{
  return self->_photosInference;
}

- (void)setPhotosInference:(BOOL)a3
{
  self->_photosInference = a3;
}

- (NSString)mostRecentTransportBundleId
{
  return self->_mostRecentTransportBundleId;
}

- (void)setMostRecentTransportBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentTransportBundleId, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handleString, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
