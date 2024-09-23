@implementation PKPeerPaymentFamilyMemberRowModel

+ (id)sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:(id)a3 peerPaymentAccount:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PKPeerPaymentFamilyMemberRowModel *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isMe", (_QWORD)v20) & 1) == 0 && (objc_msgSend(v13, "isOrganizer") & 1) == 0)
        {
          objc_msgSend(v13, "altDSID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "peerPaymentAccountWithAltDSID:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "accountInvitationWithAltDSID:", v14);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16 | v15 || objc_msgSend(v13, "memberType") == 2 || objc_msgSend(v13, "memberType") == 1)
          {
            v17 = -[PKPeerPaymentFamilyMemberRowModel initWithFamilyMember:]([PKPeerPaymentFamilyMemberRowModel alloc], "initWithFamilyMember:", v13);
            -[PKPeerPaymentFamilyMemberRowModel setAccount:](v17, "setAccount:", v15);
            -[PKPeerPaymentFamilyMemberRowModel setInvitation:](v17, "setInvitation:", v16);
            objc_msgSend(v7, "addObject:", v17);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortUsingSelector:", sel_compare_);
  v18 = (void *)objc_msgSend(v7, "copy");

  return v18;
}

- (PKPeerPaymentFamilyMemberRowModel)initWithFamilyMember:(id)a3
{
  id v5;
  PKPeerPaymentFamilyMemberRowModel *v6;
  PKPeerPaymentFamilyMemberRowModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentFamilyMemberRowModel;
  v6 = -[PKPeerPaymentFamilyMemberRowModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_familyMember, a3);

  return v7;
}

- (unint64_t)state
{
  PKPeerPaymentAccount *account;
  BOOL v4;
  unint64_t v5;

  account = self->_account;
  if (account)
  {
    v4 = -[PKPeerPaymentAccount isParticipantAccountLockedByOwner](account, "isParticipantAccountLockedByOwner") == 0;
    v5 = 1;
  }
  else
  {
    v4 = self->_invitation == 0;
    v5 = 3;
  }
  if (v4)
    return v5;
  else
    return v5 + 1;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v4 = a3;
  v5 = -[PKPeerPaymentFamilyMemberRowModel state](self, "state");
  v6 = objc_msgSend(v4, "state");
  if (v5 > 4)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = qword_19DF16658[v5];
  if (v6 > 4)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v8 = qword_19DF16658[v6];
  if (v7 == v8)
  {
    -[PKFamilyMember labelName](self->_familyMember, "labelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "familyMember");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "labelName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "compare:", v11);

  }
  else if (v7 < v8)
  {
    v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (int64_t)accessoryType
{
  return -[PKPeerPaymentFamilyMemberRowModel state](self, "state") - 1 < 3;
}

- (int64_t)cellStyle
{
  return 1;
}

- (NSString)titleText
{
  return (NSString *)-[PKFamilyMember labelName](self->_familyMember, "labelName");
}

- (NSString)detailText
{
  unint64_t v2;
  void *v3;

  v2 = -[PKPeerPaymentFamilyMemberRowModel state](self, "state") - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    PKLocalizedPaymentString(&off_1E3E6EC78[v2]->isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
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

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKPeerPaymentAccountInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
