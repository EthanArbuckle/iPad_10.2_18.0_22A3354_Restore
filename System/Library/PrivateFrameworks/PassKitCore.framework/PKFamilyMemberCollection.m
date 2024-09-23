@implementation PKFamilyMemberCollection

- (PKFamilyMemberCollection)initWithFamilyMembers:(id)a3
{
  id v4;
  PKFamilyMemberCollection *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *familyMembersByAltDSID;
  uint64_t v16;
  NSArray *familyMembers;
  uint64_t v18;
  NSString *currentUserAltDSID;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKFamilyMemberCollection;
  v5 = -[PKFamilyMemberCollection init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "altDSID", (_QWORD)v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v12, v13);

          if (objc_msgSend(v12, "isMe"))
            objc_storeStrong((id *)&v5->_currentUser, v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v6, "copy");
    familyMembersByAltDSID = v5->_familyMembersByAltDSID;
    v5->_familyMembersByAltDSID = (NSDictionary *)v14;

    v16 = objc_msgSend(v7, "copy");
    familyMembers = v5->_familyMembers;
    v5->_familyMembers = (NSArray *)v16;

    PKCurrentUserAltDSID();
    v18 = objc_claimAutoreleasedReturnValue();
    currentUserAltDSID = v5->_currentUserAltDSID;
    v5->_currentUserAltDSID = (NSString *)v18;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKFamilyMemberCollection *v4;
  PKFamilyMemberCollection *v5;
  NSArray *familyMembers;
  NSArray *v7;
  char v8;

  v4 = (PKFamilyMemberCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    familyMembers = self->_familyMembers;
    v7 = v5->_familyMembers;
    if (familyMembers && v7)
      v8 = -[NSArray isEqual:](familyMembers, "isEqual:");
    else
      v8 = familyMembers == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)familyMemberForTransactionSource:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
    case 3:
      v5 = self->_currentUserAltDSID;
      if (!v5)
        goto LABEL_7;
      goto LABEL_3;
    case 1:
      objc_msgSend(v4, "peerPaymentAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(v4, "accountUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v8 = v7;
      objc_msgSend(v7, "altDSID");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_7;
LABEL_3:
      -[NSDictionary objectForKey:](self->_familyMembersByAltDSID, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_7:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)familyMemberForAltDSID:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_familyMembersByAltDSID, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)familyMembersByAltDSID
{
  return self->_familyMembersByAltDSID;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (NSString)currentUserAltDSID
{
  return self->_currentUserAltDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserAltDSID, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_familyMembersByAltDSID, 0);
}

@end
