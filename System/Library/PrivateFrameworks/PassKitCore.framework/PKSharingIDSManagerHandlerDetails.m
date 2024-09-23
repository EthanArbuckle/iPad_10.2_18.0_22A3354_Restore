@implementation PKSharingIDSManagerHandlerDetails

- (PKSharingIDSManagerHandlerDetails)initWithFamilyMember:(id)a3
{
  id v5;
  PKSharingIDSManagerHandlerDetails *v6;
  PKSharingIDSManagerHandlerDetails *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingIDSManagerHandlerDetails;
  v6 = -[PKSharingIDSManagerHandlerDetails init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_familyMember, a3);

  return v7;
}

- (PKSharingIDSManagerHandlerDetails)initWithFamilyMember:(id)a3 accountUser:(id)a4
{
  id v7;
  id v8;
  PKSharingIDSManagerHandlerDetails *v9;
  PKSharingIDSManagerHandlerDetails *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingIDSManagerHandlerDetails;
  v9 = -[PKSharingIDSManagerHandlerDetails init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyMember, a3);
    objc_storeStrong((id *)&v10->_accountUser, a4);
  }

  return v10;
}

- (id)allHandles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKSharingIDSManagerHandlerDetails aliases](self, "aliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  -[PKSharingIDSManagerHandlerDetails primaryAppleID](self, "primaryAppleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(v4, "containsObject:", v6) & 1) == 0)
    objc_msgSend(v3, "insertObject:atIndex:", v6, 0);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)primaryAppleID
{
  void *familyMember;

  familyMember = self->_familyMember;
  if (familyMember || (familyMember = self->_accountUser) != 0)
  {
    objc_msgSend(familyMember, "appleID");
    familyMember = (void *)objc_claimAutoreleasedReturnValue();
  }
  return familyMember;
}

- (id)aliases
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PKFamilyMember appleIDAliases](self->_familyMember, "appleIDAliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "unionSet:", v4);
  -[PKAccountUser addressableHandles](self->_accountUser, "addressableHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "unionSet:", v5);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("familyMember: '%@'; "), self->_familyMember);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUser: '%@'; "), self->_accountUser);
  -[PKSharingIDSManagerHandlerDetails allHandles](self, "allHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("handles: '%@'; "), v4);

  return v3;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
