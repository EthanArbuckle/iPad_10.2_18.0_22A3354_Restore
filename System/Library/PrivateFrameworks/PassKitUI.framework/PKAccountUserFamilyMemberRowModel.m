@implementation PKAccountUserFamilyMemberRowModel

+ (id)sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:(id)a3 account:(id)a4 accountUserCollection:(id)a5 invitations:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  PKAccountUserFamilyMemberRowModel *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKAccountUserFamilyMemberRowModel *v29;
  void *v30;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v32 = a6;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v9;
  objc_msgSend(v9, "accountUsers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v16, "altDSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "familyMemberForAltDSID:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accountState");
        if ((objc_msgSend(v16, "isCurrentUser") & 1) == 0
          && (PKAccountStateIsTerminal() & 1) == 0
          && (objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
        {
          v19 = -[PKAccountUserFamilyMemberRowModel initWithFamilyMember:]([PKAccountUserFamilyMemberRowModel alloc], "initWithFamilyMember:", v18);
          -[PKAccountUserFamilyMemberRowModel setAccountUser:](v19, "setAccountUser:", v16);
          -[PKAccountUserFamilyMemberRowModel setAccountUserCollection:](v19, "setAccountUserCollection:", v33);
          objc_msgSend(v34, "addObject:", v19);
          objc_msgSend(v10, "addObject:", v17);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v13);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v32;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v25, "invitationDetails");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "accountUserAltDSID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "familyMemberForAltDSID:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsObject:", v27) & 1) == 0)
        {
          v29 = -[PKAccountUserFamilyMemberRowModel initWithFamilyMember:]([PKAccountUserFamilyMemberRowModel alloc], "initWithFamilyMember:", v28);
          -[PKAccountUserFamilyMemberRowModel setInvitation:](v29, "setInvitation:", v25);
          objc_msgSend(v34, "addObject:", v29);
          objc_msgSend(v10, "addObject:", v27);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v22);
  }

  objc_msgSend(v34, "sortUsingSelector:", sel_compare_);
  v30 = (void *)objc_msgSend(v34, "copy");

  return v30;
}

- (PKAccountUserFamilyMemberRowModel)initWithFamilyMember:(id)a3
{
  id v5;
  PKAccountUserFamilyMemberRowModel *v6;
  PKAccountUserFamilyMemberRowModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserFamilyMemberRowModel;
  v6 = -[PKAccountUserFamilyMemberRowModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_familyMember, a3);

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  v5 = PKAccountUserFamilyRowPriorityFromRow(self);
  v6 = PKAccountUserFamilyRowPriorityFromRow(v4);
  if (v5 == v6)
  {
    -[PKFamilyMember labelName](self->_familyMember, "labelName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyMember");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "compare:", v9);

  }
  else if (v5 < v6)
  {
    v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (int64_t)accessoryType
{
  return 1;
}

- (int64_t)cellStyle
{
  return 0;
}

- (NSString)titleText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKAccountUser nameComponents](self->_accountUser, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKFeatureApplication invitationDetails](self->_invitation, "invitationDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountUserNameComponents");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D66C60], "contactForFamilyMember:nameComponents:imageData:", self->_familyMember, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkFullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)detailText
{
  PKAccountUser *accountUser;
  uint64_t v4;
  __CFString *v5;
  void *invitation;
  uint64_t v7;

  accountUser = self->_accountUser;
  if (accountUser)
  {
    v4 = -[PKAccountUser accessLevel](accountUser, "accessLevel");
    if (v4 == 2)
    {
      v5 = CFSTR("ACCOUNT_USER_PARTICIPANT_SUBTITLE");
LABEL_17:
      PKLocalizedMadisonString(&v5->isa);
      invitation = (void *)objc_claimAutoreleasedReturnValue();
      return (NSString *)invitation;
    }
    if (v4 == 1)
    {
      if (-[PKAccountUserCollection isCoOwner](self->_accountUserCollection, "isCoOwner"))
        v5 = CFSTR("ACCOUNT_USER_CO_OWNER_SUBTITLE");
      else
        v5 = CFSTR("ACCOUNT_USER_OWNER_SUBTITLE");
      goto LABEL_17;
    }
    invitation = 0;
  }
  else
  {
    invitation = self->_invitation;
    if (invitation)
    {
      v7 = objc_msgSend(invitation, "applicationState");
      if (v7 == 6)
      {
        v5 = CFSTR("ACCOUNT_USER_OFFER_READY");
      }
      else if (v7 == 5)
      {
        if (-[PKFeatureApplication applicationStateReason](self->_invitation, "applicationStateReason") == 9)
          v5 = CFSTR("ACCOUNT_USER_INVITATION_SENT");
        else
          v5 = CFSTR("ACCOUNT_USER_INVITATION_PENDING");
      }
      else
      {
        v5 = CFSTR("ACCOUNT_USER_INVITATION_PENDING");
      }
      goto LABEL_17;
    }
  }
  return (NSString *)invitation;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
  objc_storeStrong((id *)&self->_accountUser, a3);
}

- (PKFeatureApplication)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
