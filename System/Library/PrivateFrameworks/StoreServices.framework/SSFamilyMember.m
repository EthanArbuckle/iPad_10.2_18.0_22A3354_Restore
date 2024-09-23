@implementation SSFamilyMember

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ %@ %@ me:%d ic:%@ it:%@ atb:%d]"), self->_iCloudAccountName, self->_firstName, self->_lastName, self->_me, self->_iCloudIdentifier, self->_iTunesIdentifier, self->_askToBuy);
}

- (SSFamilyMember)initWithCacheRepresentation:(id)a3
{
  id v4;
  SSFamilyMember *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *firstName;
  void *v10;
  uint64_t v11;
  NSString *iCloudAccountName;
  void *v13;
  uint64_t v14;
  NSString *lastName;
  void *v16;
  uint64_t v17;
  NSNumber *iCloudIdentifier;
  void *v19;
  uint64_t v20;
  NSNumber *iTunesIdentifier;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)SSFamilyMember;
    v5 = -[SSFamilyMember init](&v25, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("askToBuy"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_askToBuy = objc_msgSend(v6, "BOOLValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("firstName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v7, "copy");
        firstName = v5->_firstName;
        v5->_firstName = (NSString *)v8;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("iCloudName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "copy");
        iCloudAccountName = v5->_iCloudAccountName;
        v5->_iCloudAccountName = (NSString *)v11;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("lastName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "copy");
        lastName = v5->_lastName;
        v5->_lastName = (NSString *)v14;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("iCloudID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        iCloudIdentifier = v5->_iCloudIdentifier;
        v5->_iCloudIdentifier = (NSNumber *)v17;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("iTunesID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_msgSend(v19, "copy");
        iTunesIdentifier = v5->_iTunesIdentifier;
        v5->_iTunesIdentifier = (NSNumber *)v20;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("isMe"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_me = objc_msgSend(v22, "BOOLValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("sharing"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_sharingPurchases = objc_msgSend(v23, "BOOLValue");

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)newCacheRepresentation
{
  id v3;
  void *v4;
  NSString *firstName;
  NSString *iCloudAccountName;
  NSNumber *iCloudIdentifier;
  NSNumber *iTunesIdentifier;
  NSString *lastName;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_askToBuy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("askToBuy"));

  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v3, "setObject:forKey:", firstName, CFSTR("firstName"));
  iCloudAccountName = self->_iCloudAccountName;
  if (iCloudAccountName)
    objc_msgSend(v3, "setObject:forKey:", iCloudAccountName, CFSTR("iCloudName"));
  iCloudIdentifier = self->_iCloudIdentifier;
  if (iCloudIdentifier)
    objc_msgSend(v3, "setObject:forKey:", iCloudIdentifier, CFSTR("iCloudID"));
  iTunesIdentifier = self->_iTunesIdentifier;
  if (iTunesIdentifier)
    objc_msgSend(v3, "setObject:forKey:", iTunesIdentifier, CFSTR("iTunesID"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v3, "setObject:forKey:", lastName, CFSTR("lastName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_me);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isMe"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharingPurchases);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sharing"));

  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_askToBuy);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "0", v4);

  SSXPCDictionarySetObject(v3, "1", self->_firstName);
  SSXPCDictionarySetObject(v3, "2", self->_iCloudAccountName);
  SSXPCDictionarySetObject(v3, "3", self->_iCloudIdentifier);
  SSXPCDictionarySetObject(v3, "4", self->_iTunesIdentifier);
  SSXPCDictionarySetObject(v3, "5", self->_lastName);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_me);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "6", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharingPurchases);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "7", v6);

  return v3;
}

- (SSFamilyMember)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSFamilyMember *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *firstName;
  uint64_t v14;
  uint64_t v15;
  NSString *iCloudAccountName;
  uint64_t v17;
  uint64_t v18;
  NSNumber *iCloudIdentifier;
  uint64_t v20;
  uint64_t v21;
  NSNumber *iTunesIdentifier;
  uint64_t v23;
  uint64_t v24;
  NSString *lastName;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v30.receiver = self;
    v30.super_class = (Class)SSFamilyMember;
    v6 = -[SSFamilyMember init](&v30, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      v10 = v9;
      if (v9)
        v6->_askToBuy = objc_msgSend(v9, "BOOLValue");
      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      firstName = v6->_firstName;
      v6->_firstName = (NSString *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      iCloudAccountName = v6->_iCloudAccountName;
      v6->_iCloudAccountName = (NSString *)v15;

      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v17);
      iCloudIdentifier = v6->_iCloudIdentifier;
      v6->_iCloudIdentifier = (NSNumber *)v18;

      v20 = objc_opt_class();
      v21 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v20);
      iTunesIdentifier = v6->_iTunesIdentifier;
      v6->_iTunesIdentifier = (NSNumber *)v21;

      v23 = objc_opt_class();
      v24 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v23);
      lastName = v6->_lastName;
      v6->_lastName = (NSString *)v24;

      v26 = objc_opt_class();
      v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "6", v26);

      v6->_me = objc_msgSend(v27, "BOOLValue");
      v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "7", v28);

      v6->_sharingPurchases = objc_msgSend(v29, "BOOLValue");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)iCloudAccountName
{
  return self->_iCloudAccountName;
}

- (void)setICloudAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudAccountName, a3);
}

- (NSNumber)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (void)setICloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudIdentifier, a3);
}

- (NSNumber)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (void)setITunesIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesIdentifier, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (BOOL)isSharingPurchases
{
  return self->_sharingPurchases;
}

- (void)setSharingPurchases:(BOOL)a3
{
  self->_sharingPurchases = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudAccountName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
