@implementation PKAccountServiceInterface

void __PKAccountServiceInterface_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270B48);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECF22888;
  qword_1ECF22888 = v2;

  objc_msgSend((id)qword_1ECF22888, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_accountAdded_, 0, 0);
  objc_msgSend((id)qword_1ECF22888, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_accountChanged_, 0, 0);
  objc_msgSend((id)qword_1ECF22888, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_accountRemoved_, 0, 0);
  v4 = (void *)qword_1ECF22888;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_accountUsersChanged_forAccountIdentifier_, 0, 0);

  v8 = (void *)qword_1ECF22888;
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_physicalCardsChanged_forAccountIdentifier_, 0, 0);

  v12 = (void *)qword_1ECF22888;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_accountFinancingPlanAdded_accountIdentifier_, 0, 0);

  v14 = (void *)qword_1ECF22888;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier_, 0, 0);

  v16 = (void *)qword_1ECF22888;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier_, 1, 0);

  v18 = (void *)qword_1ECF22888;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_accountFinancingPlanRemoved_accountIdentifier_, 0, 0);

  v20 = (void *)qword_1ECF22888;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_payLaterCardMagnitudesChanged_forAccountIdentifier_, 0, 0);

  v22 = (void *)qword_1ECF22888;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_didUpdatePaymentFundingSources_accountIdentifier_, 0, 0);

  v26 = (void *)qword_1ECF22888;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_didUpdateAccountPromotions_accountIdentifier_, 0, 0);

  v30 = (void *)qword_1ECF22888;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_didUpdateAccountEnhancedMerchants_accountIdentifier_lastUpdate_, 0, 0);

  v34 = (void *)qword_1ECF22888;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_creditRecoveryPaymentPlansChangedForAccountIdentifier_, 0, 0);

}

@end
