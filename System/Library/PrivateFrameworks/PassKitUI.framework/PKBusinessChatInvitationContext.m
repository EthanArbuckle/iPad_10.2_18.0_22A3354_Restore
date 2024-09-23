@implementation PKBusinessChatInvitationContext

- (PKBusinessChatInvitationContext)initWithBusinessChatIdentifier:(id)a3 account:(id)a4 invitation:(id)a5 pendingInvitations:(id)a6 featureApplications:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKBusinessChatInvitationContext *v17;
  uint64_t v18;
  NSString *businessChatIdentifier;
  uint64_t v20;
  NSArray *pendingInvitations;
  uint64_t v22;
  NSArray *featureApplications;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKBusinessChatInvitationContext;
  v17 = -[PKBusinessChatInvitationContext init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    businessChatIdentifier = v17->_businessChatIdentifier;
    v17->_businessChatIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_account, a4);
    objc_storeStrong((id *)&v17->_invitation, a5);
    objc_msgSend(v15, "pk_objectsPassingTest:", &__block_literal_global_25);
    v20 = objc_claimAutoreleasedReturnValue();
    pendingInvitations = v17->_pendingInvitations;
    v17->_pendingInvitations = (NSArray *)v20;

    objc_msgSend(v16, "pk_objectsPassingTest:", &__block_literal_global_487);
    v22 = objc_claimAutoreleasedReturnValue();
    featureApplications = v17->_featureApplications;
    v17->_featureApplications = (NSArray *)v22;

  }
  return v17;
}

uint64_t __124__PKBusinessChatInvitationContext_initWithBusinessChatIdentifier_account_invitation_pendingInvitations_featureApplications___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "applicationState");
  return PKFeatureApplicationStateIsTerminal() ^ 1;
}

uint64_t __124__PKBusinessChatInvitationContext_initWithBusinessChatIdentifier_account_invitation_pendingInvitations_featureApplications___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "applicationState");
  return PKFeatureApplicationStateIsTerminal() ^ 1;
}

- (id)businessIdentifier
{
  return self->_businessChatIdentifier;
}

- (id)intentParameters
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("wallet_invite_contactsupport"), CFSTR("targetDialog"));
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accountID"));

  -[PKFeatureApplication invitationDetails](self->_invitation, "invitationDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accountUserAccessLevel");
  v7 = CFSTR("participant");
  if (v6 != 2)
    v7 = 0;
  if (v6 == 1)
    v8 = CFSTR("owner");
  else
    v8 = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accountRole"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_featureApplications, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("pendingApplicationCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_pendingInvitations, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("pendingInvitationCount"));

  -[NSArray pk_objectsPassingTest:](self->_pendingInvitations, "pk_objectsPassingTest:", &__block_literal_global_490);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pendingOwnerInvitationCount"));

  -[NSArray pk_objectsPassingTest:](self->_pendingInvitations, "pk_objectsPassingTest:", &__block_literal_global_491);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("pendingParticipantInvitationCount"));

  v21 = (void *)objc_msgSend(v3, "copy");
  return v21;
}

BOOL __51__PKBusinessChatInvitationContext_intentParameters__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "invitationDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountUserAccessLevel") == 1;

  return v3;
}

BOOL __51__PKBusinessChatInvitationContext_intentParameters__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "invitationDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountUserAccessLevel") == 2;

  return v3;
}

- (id)groupParameters
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("domain");
  v3[1] = CFSTR("origin");
  v4[0] = CFSTR("apple_pay");
  v4[1] = CFSTR("Wallet");
  v3[2] = CFSTR("page");
  v4[2] = CFSTR("wallet::invite::contactsupport");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)PKLocalizedFeatureStringWithDefaultValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
}

@end
