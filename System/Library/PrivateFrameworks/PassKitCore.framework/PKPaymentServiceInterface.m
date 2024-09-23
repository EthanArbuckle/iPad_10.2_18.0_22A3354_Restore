@implementation PKPaymentServiceInterface

void __PKPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE224E48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22D28;
  qword_1ECF22D28 = v0;

  v2 = (void *)qword_1ECF22D28;
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didUpdateApplicationMessages_, 0, 0);

  v6 = (void *)qword_1ECF22D28;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_passWithUniqueIdentifier_didUpdateTiles_forContext_, 1, 0);

  v10 = (void *)qword_1ECF22D28;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate_, 1, 0);

  v14 = (void *)qword_1ECF22D28;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_paymentPassWithUniqueIdentifier_didReceivePlanUpdate_, 1, 0);

  v20 = (void *)qword_1ECF22D28;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_transactionBatch_moreComing_readyForNextBatch_, 0, 0);

  v26 = (void *)qword_1ECF22D28;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_didUpdateFamilyMembers_, 0, 0);

  v30 = (void *)qword_1ECF22D28;
  v31 = objc_alloc(MEMORY[0x1E0C99E60]);
  v32 = objc_opt_class();
  v33 = (id)objc_msgSend(v31, "initWithObjects:", v32, objc_opt_class(), 0);
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_didReceivePendingProvisioningUpdate_, 0, 0);

}

@end
