@implementation PKAccountUserCollection

- (PKAccountUserCollection)initWithAccountUsers:(id)a3
{
  id v4;
  PKAccountUserCollection *v5;
  PKAccountUserCollection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountUserCollection;
  v5 = -[PKAccountUserCollection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKAccountUserCollection _updateWithAccountUsers:](v5, "_updateWithAccountUsers:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserCollection)initWithCoder:(id)a3
{
  id v4;
  PKAccountUserCollection *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserCollection;
  v5 = -[PKAccountUserCollection init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("accountUsers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccountUserCollection _updateWithAccountUsers:](v5, "_updateWithAccountUsers:", v9);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_accountUsers, CFSTR("accountUsers"));
}

- (BOOL)isEqual:(id)a3
{
  PKAccountUserCollection *v4;
  PKAccountUserCollection *v5;
  BOOL v6;

  v4 = (PKAccountUserCollection *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountUserCollection _isEqualToAccountUserCollection:](self, "_isEqualToAccountUserCollection:", v5);

  return v6;
}

- (BOOL)_isEqualToAccountUserCollection:(id)a3
{
  NSSet *accountUsers;
  NSSet *v4;
  BOOL v5;

  if (!a3)
    return 0;
  accountUsers = self->_accountUsers;
  v4 = (NSSet *)*((_QWORD *)a3 + 3);
  if (accountUsers)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return accountUsers == v4;
  else
    return -[NSSet isEqual:](accountUsers, "isEqual:");
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUsers);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSSet countByEnumeratingWithState:objects:count:](self->_accountUsers, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)accountUserWithAltDSID:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_accountUsersByAltDSID, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accountUserForTransaction:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PKAccountUserCollection accountUserWithAltDSID:](self, "accountUserWithAltDSID:", v4);
  else
    -[PKAccountUserCollection currentAccountUser](self, "currentAccountUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accountUsersExcludingCurrentAccountUser
{
  return -[NSSet objectsPassingTest:](self->_accountUsers, "objectsPassingTest:", &__block_literal_global_224);
}

uint64_t __66__PKAccountUserCollection_accountUsersExcludingCurrentAccountUser__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser") ^ 1;
}

- (id)activeAccountUsersExcludingCurrentAccountUser
{
  return -[NSSet objectsPassingTest:](self->_accountUsers, "objectsPassingTest:", &__block_literal_global_12_0);
}

uint64_t __72__PKAccountUserCollection_activeAccountUsersExcludingCurrentAccountUser__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  unint64_t v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isCurrentUser") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_msgSend(v2, "accountState");
    if (v4 <= 5)
      v3 = (0xFu >> v4) & 1;
    else
      v3 = 1;
  }

  return v3;
}

- (id)activeAccountUsers
{
  return -[NSSet objectsPassingTest:](self->_accountUsers, "objectsPassingTest:", &__block_literal_global_13_0);
}

uint64_t __45__PKAccountUserCollection_activeAccountUsers__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "accountState");
  return (v2 > 5) | (0xFu >> v2) & 1;
}

- (id)transactionSourceIdentifiers
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_accountUsers;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "transactionSourceIdentifiers", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("users: '%@'; "), self->_accountUsers);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)_updateWithAccountUsers:(id)a3
{
  NSSet *v4;
  NSSet *accountUsers;
  NSSet *v6;
  NSSet *v7;
  id v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *accountUsersByAltDSID;
  PKAccountUser *v18;
  PKAccountUser *currentAccountUser;
  PKAccountUser *v20;
  PKAccountUser *coOwnerAccountUser;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (NSSet *)a3;
  accountUsers = self->_accountUsers;
  if (v4 && accountUsers)
  {
    if ((-[NSSet isEqual:](accountUsers, "isEqual:", v4) & 1) != 0)
      goto LABEL_18;
  }
  else if (accountUsers == v4)
  {
    goto LABEL_18;
  }
  v6 = (NSSet *)-[NSSet copy](v4, "copy");
  v7 = self->_accountUsers;
  self->_accountUsers = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v4;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "altDSID", (_QWORD)v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v16 = (NSDictionary *)objc_msgSend(v8, "copy");
  accountUsersByAltDSID = self->_accountUsersByAltDSID;
  self->_accountUsersByAltDSID = v16;

  -[NSSet pk_anyObjectPassingTest:](v9, "pk_anyObjectPassingTest:", &__block_literal_global_24);
  v18 = (PKAccountUser *)objc_claimAutoreleasedReturnValue();
  currentAccountUser = self->_currentAccountUser;
  self->_currentAccountUser = v18;

  if (-[PKAccountUser accessLevel](self->_currentAccountUser, "accessLevel") == 1)
  {
    -[NSSet pk_anyObjectPassingTest:](v9, "pk_anyObjectPassingTest:", &__block_literal_global_25_1);
    v20 = (PKAccountUser *)objc_claimAutoreleasedReturnValue();
    coOwnerAccountUser = self->_coOwnerAccountUser;
    self->_coOwnerAccountUser = v20;

  }
  self->_coOwner = self->_coOwnerAccountUser != 0;

LABEL_18:
}

uint64_t __51__PKAccountUserCollection__updateWithAccountUsers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser");
}

BOOL __51__PKAccountUserCollection__updateWithAccountUsers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isCurrentUser") & 1) == 0 && objc_msgSend(v2, "accessLevel") == 1;

  return v3;
}

- (NSSet)accountUsers
{
  return self->_accountUsers;
}

- (PKAccountUser)currentAccountUser
{
  return self->_currentAccountUser;
}

- (PKAccountUser)coOwnerAccountUser
{
  return self->_coOwnerAccountUser;
}

- (BOOL)isCoOwner
{
  return self->_coOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coOwnerAccountUser, 0);
  objc_storeStrong((id *)&self->_currentAccountUser, 0);
  objc_storeStrong((id *)&self->_accountUsers, 0);
  objc_storeStrong((id *)&self->_accountUsersByAltDSID, 0);
}

@end
