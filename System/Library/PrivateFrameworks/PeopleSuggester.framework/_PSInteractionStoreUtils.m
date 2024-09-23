@implementation _PSInteractionStoreUtils

+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 singleRecipient:(BOOL)a10 fetchLimit:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  LOBYTE(v26) = a10;
  objc_msgSend((id)objc_opt_class(), "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v23, v22, 0, v21, v20, v19, v18, v17, v26, a11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 singleRecipient:(BOOL)a11 fetchLimit:(unint64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;

  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  LOBYTE(v28) = a11;
  objc_msgSend((id)objc_opt_class(), "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:withNsUserName:singleRecipient:fetchLimit:", v25, v24, v23, v22, v21, v20, v19, v18, 0, v28, a12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 fetchLimit:(unint64_t)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;

  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  LOBYTE(v31) = 0;
  BYTE1(v30) = 1;
  LOBYTE(v30) = a12;
  objc_msgSend((id)objc_opt_class(), "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:withNsUserName:singleRecipient:excludeAnonymousTemporaryRecipients:fetchLimit:fetchOffset:sortAscending:", v27, v26, v25, v24, v23, v22, v21, v20, v19, v30, a13, 0, v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 excludeAnonymousTemporaryRecipients:(BOOL)a13 fetchLimit:(unint64_t)a14 fetchOffset:(unint64_t)a15 sortAscending:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = v21;
  v56 = v23;
  v55 = a7;
  v54 = a8;
  v53 = a9;
  v25 = a10;
  v26 = a11;
  v27 = (void *)MEMORY[0x1E0C99DE8];
  v28 = a3;
  objc_msgSend(v27, "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate <= %@)"), v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v31);

  }
  if (v56)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), v56);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v32);

  }
  if (v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v54);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v33);

  }
  if (v55)
  {
    v34 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v55);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "predicateWithFormat:", CFSTR("(account IN %@)"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "addObject:", v36);
  }
  if (v53)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(targetBundleId IN %@)"), v53);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v37);

  }
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v25);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v38);

  }
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(nsUserName == nil OR nsUserName == %@ OR nsUserName == %@)"), CFSTR("root"), v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v39);

  }
  v40 = v25;
  if (a12)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(recipientCount == 1)"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v41);

  }
  v42 = v22;
  v52 = v24;
  if (a13)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.identifier BEGINSWITH %@).@count == 0)"), CFSTR("temp:"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v43);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v29);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), a16);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v28, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v44, v46, a14, a15, &v57);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v57;
  if (v48)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v50 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v50 = v47;
  }

  return v50;
}

+ (id)recentInteractionsFromStore:(id)a3 bundleIDs:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(NOT derivedIntentIdentifier == NULL)"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442B5A0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v38 = (void *)v9;
  v39 = (void *)v8;
  v45[0] = v9;
  v45[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442B5B8);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(targetBundleId IN %@)"), v6);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3528];
  v35 = (void *)v14;
  v36 = (void *)v13;
  v44[0] = v13;
  v44[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3528];
  v37 = (void *)v12;
  v43[0] = v12;
  v43[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CD78);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateWithFormat:", CFSTR("(direction IN %@)"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0CB3528];
  v42[0] = v20;
  v42[1] = v34;
  v42[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v7, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v26, v28, 500, &v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v40;
  if (v30)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v32 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v32 = v29;
  }

  return v32;
}

+ (id)interactionCacheFromStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v9, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D158D0]), "initWithInteractionStore:size:queryPredicate:filterBlock:", v12, a4, v14, v10);

  return v15;
}

+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 fetchLimit:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  LOBYTE(v25) = 0;
  objc_msgSend((id)objc_opt_class(), "interactionsFromStore:referenceDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v22, v21, v20, v19, v18, v17, v16, v25, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)interactionsHyperRecentFromReferenceDate:(id)a3 bundleIds:(id)a4 recencyMargin:(double)a5 store:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v12 = a6;
  objc_msgSend(v11, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, -a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("(startDate >= %@)"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, -0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("(startDate <= %@)"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3528];
    v34[0] = v17;
    v34[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v23);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v12, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v24, v26, 1, &v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v32;
  if (v28)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v30 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v30 = v27;
  }

  return v30;
}

+ (id)mostRecentInteractionWithSenderOrRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];

  v6 = a6;
  v36[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v6)
      v12 = CFSTR("recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0");
    else
      v12 = CFSTR("recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v12, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.personId == %@"), v9);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v30 = (void *)v14;
    v31 = (void *)v13;
    v36[0] = v14;
    v36[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442CD90);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3528];
    v35[0] = v17;
    v35[1] = v18;
    v35[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v11, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v22, v24, 1, &v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v33;

    if (v26)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v28 = 0;
    }
    else
    {
      objc_msgSend(v25, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10 = v32;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)mostRecentInteractionWithRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];

  v6 = a6;
  v29[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v6)
      v12 = CFSTR("recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0");
    else
      v12 = CFSTR("recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v12, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442CDA8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3528];
    v26 = (void *)v13;
    v29[0] = v13;
    v29[1] = v14;
    v29[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v11, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v18, v20, 1, &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v27;

    if (v22)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v24 = 0;
    }
    else
    {
      objc_msgSend(v21, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)mostRecentInteractionWithSingleRecipientMatchingContactIdentifier:(id)a3 store:(id)a4
{
  id v5;
  id v6;
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
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3880];
    +[_PSConstants eligibleShareSheetTargets](_PSConstants, "eligibleShareSheetTargets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3528];
    v23[0] = v7;
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v6, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v13, v15, 500, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;

    if (v17)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v19 = 0;
    }
    else
    {
      objc_msgSend(v16, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)mostRecentInteractionWithSingleRecipientMatchingHandle:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "length"))
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v9, 0, &unk_1E442CDC0, 0, 0, v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  _QWORD v73[3];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v66 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v65 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v21);
  }
  if (v66)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("(account IN %@)"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v24);
  }
  if (v15)
  {
    v25 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", CFSTR("(direction IN %@)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v27);
  }
  v28 = 0x1E0CB3000;
  v29 = 0x1E0C99000;
  if (v14)
  {
    v62 = v17;
    v63 = v16;
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0C99E60];
    v61 = v30;
    objc_msgSend(v30, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "mutableCopy");

    v60 = (void *)v34;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v34);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domainIdentifier IN %@"), v14);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_opt_new();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v64 = v14;
    v36 = v14;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v69 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringByAddingPercentEncodingWithAllowedCharacters:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIdentifier(%@)"), v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v44);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v38);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("derivedIntentIdentifier IN %@"), v35);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0CB3528];
    v73[0] = v58;
    v73[1] = v59;
    v73[2] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "orPredicateWithSubpredicates:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v48);

    v29 = 0x1E0C99000uLL;
    v28 = 0x1E0CB3000uLL;

    v14 = v64;
    v17 = v62;
    v16 = v63;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism IN %@"), v16);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v49);

  }
  v50 = v18;
  objc_msgSend(*(id *)(v28 + 1320), "andPredicateWithSubpredicates:", v18);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v52;
  objc_msgSend(*(id *)(v29 + 3360), "arrayWithObjects:count:", &v72, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  objc_msgSend(v65, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v51, v53, a9, &v67);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v67;

  if (v55)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:].cold.1();
    v56 = 0;
  }
  else
  {
    v56 = v54;
  }

  return v56;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void *v55;
  _QWORD v56[3];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = 0x1E0CB3000;
  v15 = 0x1E0C99000;
  if (v9)
  {
    v46 = a5;
    v47 = (void *)v12;
    v48 = v10;
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E60];
    v45 = v16;
    objc_msgSend(v16, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");

    v44 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v20);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domainIdentifier IN %@"), v9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v49 = v9;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAddingPercentEncodingWithAllowedCharacters:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIdentifier(%@)"), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v30);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v24);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("derivedIntentIdentifier IN %@"), v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0x1E0CB3000uLL;
    v32 = (void *)MEMORY[0x1E0CB3528];
    v56[0] = v42;
    v56[1] = v43;
    v56[2] = v31;
    v15 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "orPredicateWithSubpredicates:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v47;
    objc_msgSend(v47, "addObject:", v34);

    v10 = v48;
    v9 = v49;
    a5 = v46;
  }
  objc_msgSend(*(id *)(v14 + 1320), "andPredicateWithSubpredicates:", v13);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "interactions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "filteredArrayUsingPredicate:", v35);
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v36;
    objc_msgSend(*(id *)(v15 + 3360), "arrayWithObjects:count:", &v55, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v10, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v35, v38, a5, &v50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v50;

    if (v40)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:].cold.1();
      v37 = 0;
    }
    else
    {
      v37 = v39;
    }

  }
  return v37;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8 singleRecipientOnly:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v44;
  id v45;
  id v46;
  void *v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v45 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v17 = a7;
  objc_msgSend(v16, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v19 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v21);
  }
  if (v14)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("(account IN %@)"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v24);
  }
  if (v45)
  {
    v25 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", CFSTR("(direction IN %@)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v27);
  }
  v44 = v14;
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recipientCount == 1"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v28);

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domainIdentifier IN %@"), v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3528];
    v48[0] = v30;
    v48[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "orPredicateWithSubpredicates:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v33);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v17, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v34, v36, a8, &v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v46;
  if (v38)
  {
    v39 = v45;
    v40 = v15;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:].cold.1();
    v41 = 0;
  }
  else
  {
    v41 = v37;
    v39 = v45;
    v40 = v15;
  }

  return v41;
}

+ (id)allAirDropInteractionsFromStore:(id)a3 fetchLimit:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(targetBundleId == %@)"), CFSTR("com.apple.UIKit.activity.AirDrop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442B5B8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v20[0] = v8;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v11, v13, a4, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v18;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:].cold.1();
    v16 = 0;
  }
  else
  {
    v16 = v14;
  }

  return v16;
}

+ (id)interactionsMatchingAnySender:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.identifier IN %@"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "interactions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v10, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v14, v18, a5, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;

    if (v20)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v16 = 0;
    }
    else
    {
      v16 = v19;
    }

  }
  return v16;
}

+ (id)interactionsMatchingAnyHandles:(id)a3 directions:(id)a4 mechanisms:(id)a5 interactionDuration:(double)a6 store:(id)a7 fetchLimit:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v16, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("(direction IN %@)"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v24);
  }
  objc_msgSend(v20, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v20, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v28);
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism IN %@"), v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v29);

  }
  if (a6 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("endDate - startDate >= %f"), *(_QWORD *)&a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v30);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v15, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v31, v33, a8, &v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v39;
  if (v35)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v37 = 0;
  }
  else
  {
    v37 = v34;
  }

  return v37;
}

+ (id)interactionsMatchingAnyHandles:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9 messageInteractionCache:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v45 = a6;
  v18 = a7;
  v44 = a8;
  v19 = a10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v23);
  }
  v24 = v16;
  if (v16)
  {
    v25 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", CFSTR("(account IN %@)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v16;
    objc_msgSend(v20, "addObject:", v27);

  }
  if (v17)
  {
    v28 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:", CFSTR("(direction IN %@)"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v16;
    objc_msgSend(v20, "addObject:", v30);

  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v31);

  }
  v43 = v15;
  v32 = v17;
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism IN %@"), v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v33);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v19, "interactions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "filteredArrayUsingPredicate:", v34);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v44, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v34, v38, a9, &v46);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v46;

    if (v40)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v36 = 0;
    }
    else
    {
      v36 = v39;
    }

    v24 = v16;
    v32 = v17;
  }

  return v36;
}

+ (id)interactionsMatchingAnyHandlesOrContactIds:(id)a3 identifiers:(id)a4 account:(id)a5 directions:(id)a6 mechanisms:(id)a7 bundleIds:(id)a8 store:(id)a9 fetchLimit:(unint64_t)a10 messageInteractionCache:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  void *v83;
  _QWORD v84[2];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v76 = a9;
  v75 = a11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0x1E0CB3000;
  if (v21)
  {
    v24 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v26);
    v23 = 0x1E0CB3000;
  }
  if (v18)
  {
    v27 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "predicateWithFormat:", CFSTR("(account IN %@)"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v29);
    v23 = 0x1E0CB3000;
  }
  if (v19)
  {
    v30 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "predicateWithFormat:", CFSTR("(direction IN %@)"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addObject:", v32);
    v23 = 0x1E0CB3000uLL;
  }
  v33 = 0x1E0CB3000;
  v77 = v22;
  v73 = v21;
  v74 = v20;
  if (v16)
  {
    v69 = v19;
    v70 = v18;
    v71 = v17;
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v16);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v23;
    v36 = (void *)MEMORY[0x1E0C99E60];
    v68 = v34;
    objc_msgSend(v34, "allValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "mutableCopy");

    v67 = (void *)v39;
    objc_msgSend(*(id *)(v35 + 2176), "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v39);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_opt_new();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v72 = v16;
    v41 = v16;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v80 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringByAddingPercentEncodingWithAllowedCharacters:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIdentifier(%@)"), v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v49);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      }
      while (v43);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("derivedIntentIdentifier IN %@"), v40);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0CB3528];
    v84[0] = v66;
    v84[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "orPredicateWithSubpredicates:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addObject:", v53);

    v22 = v77;
    v23 = 0x1E0CB3000uLL;

    v33 = 0x1E0CB3000uLL;
    v17 = v71;
    v16 = v72;
    v19 = v69;
    v18 = v70;
  }
  if (v17)
  {
    objc_msgSend(*(id *)(v23 + 2176), "predicateWithFormat:", CFSTR("ANY recipients.personId IN %@"), v17);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v54);

  }
  if (v20)
  {
    objc_msgSend(*(id *)(v23 + 2176), "predicateWithFormat:", CFSTR("mechanism IN %@"), v20);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v55);

  }
  objc_msgSend(*(id *)(v33 + 1320), "andPredicateWithSubpredicates:", v22);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v75;
  if (v75)
  {
    objc_msgSend(v75, "interactions");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "filteredArrayUsingPredicate:", v56);
    v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = v19;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(v76, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v56, v61, a10, &v78);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v78;

    if (v63)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v59 = 0;
    }
    else
    {
      v59 = v62;
    }
    v57 = 0;

    v19 = v60;
    v21 = v73;
    v20 = v74;
  }

  return v59;
}

+ (id)interactionsContainingSearchStringInDisplayName:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v17 = a7;
  objc_msgSend(v16, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v19 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v21);
  }
  if (v13)
  {
    v22 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateWithFormat:", CFSTR("(account IN %@)"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v24);
  }
  if (v14)
  {
    v25 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", CFSTR("(direction IN %@)"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v27);
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.displayName CONTAINS[cd] %@).@count > 0"), v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v28);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v17, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v29, v31, a8, &v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v38;
  if (v33)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v35 = 0;
  }
  else
  {
    v35 = v32;
  }

  return v35;
}

+ (id)groupInteractionsContainingSearchStringInDisplayName:(id)a3 excludingInteractionUUIDs:(id)a4 account:(id)a5 directions:(id)a6 bundleIds:(id)a7 excludedDomainIdentifiers:(id)a8 startDate:(id)a9 store:(id)a10 fetchLimit:(unint64_t)a11 offset:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v65 = a6;
  v67 = a7;
  v66 = a8;
  v20 = a9;
  v62 = a10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB3880];
  NSUserName();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithFormat:", CFSTR("(nsUserName = %@)"), v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v61 = (void *)v24;
  objc_msgSend(v21, "addObject:", v24);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@)"), v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v25);

  }
  v63 = v20;
  if (objc_msgSend(v18, "count"))
  {
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("(uuid != %@)"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v28);
  }
  v29 = v65;
  if (v67)
  {
    v30 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v32);
  }
  if (v19)
  {
    v33 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "predicateWithFormat:", CFSTR("(account IN %@)"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v35);
  }
  if (v65)
  {
    v36 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v65);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "predicateWithFormat:", CFSTR("(direction IN %@)"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v38);
  }
  v64 = v19;
  if (v66)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(domainIdentifier IN %@)"), v66);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v39);

  }
  v40 = 0x1E0CB3000;
  v41 = 0x1E0C99000;
  if (v17)
  {
    v42 = (void *)MEMORY[0x1A1AFCA24]();
    objc_msgSend(CFSTR(" "), "stringByAppendingString:", v17);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(   (recipientCount > 1)   OR    (recipientCount >= 1 AND sender != nil)) AND(  (SUBQUERY(recipients, $recipient, ANY $recipient.displayName BEGINSWITH[cd] %@).@count > 0)   OR    (direction != %d AND sender != nil AND sender.displayName BEGINSWITH[cd] %@))"), v17, 1, v17);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("(^|.*(?w:\\b))(?:.\\N{VARIATION SELECTOR-16})?\\P{alnum}+(?i)%@.*"), v46);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(groupName BEGINSWITH[cd] %@ OR groupName CONTAINS[cd] %@ OR groupName MATCHES %@)"), v17, v43, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1E0CB3528];
    v70[0] = v48;
    v70[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v50 = v18;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "orPredicateWithSubpredicates:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v52);

    v18 = v50;
    v29 = v65;

    v41 = 0x1E0C99000uLL;
    objc_autoreleasePoolPop(v42);
    v40 = 0x1E0CB3000uLL;
  }
  objc_msgSend(*(id *)(v40 + 1320), "andPredicateWithSubpredicates:", v21);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v54;
  objc_msgSend(*(id *)(v41 + 3360), "arrayWithObjects:count:", &v69, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v62, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v53, v55, a11, a12, &v68);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v68;

  if (v57)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v59 = 0;
  }
  else
  {
    v59 = v56;
  }

  return v59;
}

+ (id)interactionsMostRecentForBundleId:(id)a3 store:(id)a4 resultLimit:(unint64_t)a5 interactions:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v46 = v10;
    v13 = (void *)MEMORY[0x1E0CB3880];
    v14 = (void *)MEMORY[0x1E0C99E60];
    v44 = v9;
    v55[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CDD8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("(direction IN %@)"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v45 = v11;
    v42 = (void *)v21;
    v43 = (void *)v20;
    if (v11)
    {
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
    }
    else
    {
      v23 = v21;
      v24 = (void *)MEMORY[0x1E0CB3528];
      v54[0] = v17;
      v54[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v46, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v26, v27, 500, &v51);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v51;

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = v22;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v48;
LABEL_7:
      v32 = 0;
      while (1)
      {
        v33 = v17;
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        v34 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v32);
        objc_msgSend(v34, "domainIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v34, "domainIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v12, "containsObject:", v36);

          if ((v37 & 1) == 0)
          {
            objc_msgSend(v34, "domainIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v38);

          }
        }
        v17 = v33;
        if (objc_msgSend(v12, "count") >= a5)
          break;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          if (v30)
            goto LABEL_7;
          break;
        }
      }
    }

    v11 = v45;
    v10 = v46;
    v9 = v44;
  }
  v39 = (void *)objc_msgSend(v12, "copy");

  return v39;
}

+ (id)conversationIdFromInteraction:(id)a3 bundleIds:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {

    }
    else
    {
      objc_msgSend(v6, "targetBundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
      {
        objc_msgSend(v6, "bundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v17))
        {

        }
        else
        {
          objc_msgSend(v6, "targetBundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (!v20)
          {
            objc_msgSend(v6, "bundleId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v7, "containsObject:", v23))
            {

            }
            else
            {
              objc_msgSend(v6, "targetBundleId");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v7, "containsObject:", v24);

              if (!v25)
              {
                v14 = 0;
                goto LABEL_8;
              }
            }
            objc_msgSend(v6, "derivedIntentIdentifier");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
        }
        v21 = (void *)MEMORY[0x1E0D158B8];
        objc_msgSend(v6, "recipients");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "generateConversationIdFromInteractionRecipients:", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    objc_msgSend(v6, "domainIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "conversationIdFromInteraction:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v14 = (void *)v10;
LABEL_8:

  return v14;
}

+ (id)conversationIdFromInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {

  }
  else
  {
    objc_msgSend(v3, "targetBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v8)
    {
      objc_msgSend(v3, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {

      }
      else
      {
        objc_msgSend(v3, "targetBundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (!v16)
        {
          objc_msgSend(v3, "derivedIntentIdentifier");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
      }
      v17 = (void *)MEMORY[0x1E0D158B8];
      objc_msgSend(v3, "recipients");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "generateConversationIdFromInteractionRecipients:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  objc_msgSend(v3, "domainIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v10 = (void *)v9;
LABEL_6:

  return v10;
}

+ (id)interactionsWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(a3, "mutableCopy");
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "removeObject:", v11);
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v31);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("recipientCount > 1 AND SUBQUERY(recipients, $recipient, $recipient.personId IN %@).@count > 1"), v13);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CDF0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("(direction IN %@)"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = v20;
    v35[1] = v16;
    v29 = (void *)v17;
    v30 = (void *)v16;
    v35[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v21);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    v33 = 0;
    objc_msgSend(v9, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v22, v24, 1000, &v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v33;

    if (v26)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v14 = 0;
    }
    else
    {
      v14 = v25;
    }

    v9 = v32;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)conversationIdWithMaximalIntersectionWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  __objc2_class **v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id obj;
  void *v48;
  unint64_t v49;
  int v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = off_1E43FD000;
  v45 = v9;
  +[_PSInteractionStoreUtils interactionsWithContactIdentifiers:store:bundleIds:meContactIdentifier:](_PSInteractionStoreUtils, "interactionsWithContactIdentifiers:store:bundleIds:meContactIdentifier:", v9, a4, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = v14;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v16)
    {
      v17 = v16;
      v50 = 0;
      v18 = *(_QWORD *)v57;
      v49 = 1;
      v43 = v15;
      v44 = v10;
      v42 = *(_QWORD *)v57;
      do
      {
        v19 = 0;
        v46 = v17;
        do
        {
          if (*(_QWORD *)v57 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v19);
          -[__objc2_class conversationIdFromInteraction:bundleIds:](v12[1], "conversationIdFromInteraction:bundleIds:", v20, v10, v40);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 && (objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
          {
            v51 = v21;
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v48 = v20;
            objc_msgSend(v20, "recipients");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v53 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                  objc_msgSend(v28, "personId");
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (v29)
                  {
                    v30 = (void *)v29;
                    objc_msgSend(v28, "personId");
                    v31 = (id)objc_claimAutoreleasedReturnValue();

                    if (v31 != v11)
                    {
                      objc_msgSend(v28, "personId");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "addObject:", v32);

                    }
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              }
              while (v25);
            }

            objc_msgSend(v22, "intersectSet:", v45);
            v33 = objc_msgSend(v22, "count");
            v34 = objc_msgSend(v45, "count");
            if (objc_msgSend(v22, "count") <= v49)
            {
              v37 = v33 != v34;
              v15 = v43;
              v10 = v44;
              v12 = off_1E43FD000;
              v18 = v42;
              v17 = v46;
              v21 = v51;
              if (((v50 | v37) & 1) == 0)
              {
                objc_msgSend(v48, "bundleId");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v51, v38);

                v49 = objc_msgSend(v22, "count");
                v50 = 1;
              }
            }
            else
            {
              v35 = v33 == v34;
              objc_msgSend(v48, "bundleId");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v51;
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v51, v36);

              v49 = objc_msgSend(v22, "count");
              v50 |= v35;
              v15 = v43;
              v10 = v44;
              v12 = off_1E43FD000;
              v18 = v42;
              v17 = v46;
            }
            objc_msgSend(v15, "addObject:", v21);

          }
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v17);
    }

    v14 = v40;
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

+ (id)conversationIdWithExactMatchWithContactHandles:(id)a3 store:(id)a4 bundleIds:(id)a5 messageInteractionCache:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __objc2_class **v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v51 = v9;
  objc_msgSend(v9, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v14, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = off_1E43FD000;
  objc_msgSend(v18, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v20, 0, 0, 0, v11, v10, 500, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && objc_msgSend(v21, "count"))
  {
    v42 = v18;
    v43 = v14;
    v44 = v12;
    v45 = v10;
    v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v41 = v21;
    obj = v21;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v58;
      v48 = v22;
      v49 = v11;
      v47 = *(_QWORD *)v58;
      while (2)
      {
        v26 = 0;
        v50 = v24;
        do
        {
          if (*(_QWORD *)v58 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v26);
          -[__objc2_class conversationIdFromInteraction:bundleIds:](v19[1], "conversationIdFromInteraction:bundleIds:", v27, v11);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28 && (objc_msgSend(v22, "containsObject:", v28) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            objc_msgSend(v27, "recipients");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v54 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                  objc_msgSend(v35, "handle");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                  {
                    objc_msgSend(v35, "handle");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "addObject:", v37);

                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
              }
              while (v32);
            }

            if ((objc_msgSend(v29, "isEqualToSet:", v51) & 1) != 0)
            {
              objc_msgSend(v27, "bundleId");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v28, v39);

              v22 = v48;
              v11 = v49;
              goto LABEL_26;
            }
            v22 = v48;
            objc_msgSend(v48, "addObject:", v28);

            v11 = v49;
            v24 = v50;
            v19 = off_1E43FD000;
            v25 = v47;
          }

          ++v26;
        }
        while (v26 != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_26:

    v12 = v44;
    v10 = v45;
    v18 = v42;
    v14 = v43;
    v38 = v46;
    v21 = v41;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

+ (id)someIMessageInteractionInvolvingContactIdentifier:(id)a3 store:(id)a4 contactType:(unint64_t)a5 afterStartDate:(id)a6
{
  void *v9;
  id v10;
  id v11;
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
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  id v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(startDate >= %@)"), a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("(bundleId = %@)"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(domainIdentifier BEGINSWITH 'iMessage')"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3880];
  NSUserName();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("(nsUserName = nil OR nsUserName = %@ OR nsUserName = %@)"), CFSTR("root"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99DE8];
  v32[0] = v12;
  v32[1] = v15;
  v32[2] = v16;
  v32[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 - 1 > 1)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId = %@).@count > 0)"), v11, v30);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId = %@ AND $recipient.type = %d).@count > 0)"), v11, a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addObject:", v23);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v10, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v24, MEMORY[0x1E0C9AA60], 1, &v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v31;
  if (v26)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v28 = 0;
  }
  else
  {
    objc_msgSend(v25, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

+ (id)someInteractionWithMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5 afterStartDate:(id)a6
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
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
  id v24;
  NSObject *v25;
  void *v26;
  id v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "setWithArray:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(recipientCount == 1)"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId = %@ OR $recipient.identifier = %@).@count == 1)"), v13, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99DE8];
  v29[0] = v15;
  v29[1] = v16;
  v29[2] = v17;
  v29[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v12, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v22, MEMORY[0x1E0C9AA60], 1, &v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v28;
  if (v24)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v26 = 0;
  }
  else
  {
    objc_msgSend(v23, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

+ (id)mostRecentInteractionInvolvingMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
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
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "setWithArray:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId = %@ or $recipient.identifier = %@).@count > 0)"), v10, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99DE8];
  v27[0] = v12;
  v27[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v9, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v17, v19, 1, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v25;
  if (v21)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

    v23 = 0;
  }
  else
  {
    objc_msgSend(v20, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

+ (id)mostRecentInteractionWithExactMatchingIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[5];
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  v14 = v13;
  v15 = v13;
  if (v12)
  {
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "removeObject:", v12);

  }
  if (objc_msgSend(v15, "count"))
  {
    v53 = v12;
    v54 = v14;
    v55 = v11;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@)"), v52);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction = %@)"), &unk_1E442B5E8);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3880];
    v56 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("(recipientCount = %@)"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId IN %@ or $recipient.identifier IN %@).@count = %d)"), v15, v15, objc_msgSend(v15, "count"));
    v48 = (void *)v21;
    v49 = (void *)v18;
    v61[0] = v18;
    v61[1] = v16;
    v61[2] = v21;
    v62 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v22);

    v50 = v17;
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction = %@)"), &unk_1E442B600);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count") - 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "predicateWithFormat:", CFSTR("(recipientCount = %@)"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(SUBQUERY(recipients, $recipient, $recipient.personId IN %@ or $recipient.identifier IN %@).@count = %d)"), v15, v15, objc_msgSend(v15, "count") - 1);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((sender.personId IN %@) OR (sender.identifier IN %@))"), v15, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v29;
    v45 = (void *)v25;
    v60[0] = v25;
    v60[1] = v16;
    v31 = (void *)v28;
    v51 = (void *)v16;
    v60[2] = v28;
    v60[3] = v29;
    v60[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObjectsFromArray:", v32);

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0CB3528];
    v46 = (void *)v23;
    v59[0] = v23;
    v59[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orPredicateWithSubpredicates:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v56, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v36, v38, 1, &v57);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v57;

    if (v40)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:].cold.1();

      v42 = 0;
    }
    else
    {
      objc_msgSend(v39, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v11 = v55;
    v10 = v56;
    v12 = v53;
    v14 = v54;
  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (int64_t)getHandleTypeFromHandleString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int64_t v11;
  void *v12;
  _BOOL4 v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v4 = (void *)getCNHandleStringClassifierClass_softClass;
    v19 = getCNHandleStringClassifierClass_softClass;
    if (!getCNHandleStringClassifierClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getCNHandleStringClassifierClass_block_invoke;
      v15[3] = &unk_1E43FEA00;
      v15[4] = &v16;
      __getCNHandleStringClassifierClass_block_invoke((uint64_t)v15);
      v4 = (void *)v17[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v16, 8);
    v20[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classificationOfHandleStrings:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (objc_msgSend(v7, "emailAddresses"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count") == 0,
          v9,
          v8,
          v10))
    {
      objc_msgSend(v7, "phoneNumbers");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "phoneNumbers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count") == 0;

        if (v13)
          v11 = 0;
        else
          v11 = 2;
      }
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)metadataFromFeedbackEvent:(id)a3
{
  id v3;
  id v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "derivedIntentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "derivedIntentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "derivedIntentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
  objc_msgSend(v3, "targetBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "targetBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "targetBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

  }
  objc_msgSend(v3, "extensionContextUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "extensionContextUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "extensionContextUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

  }
  objc_msgSend(v3, "attachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "attachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "attachments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

  }
  objc_msgSend(v3, "locationUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "locationUUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "locationUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

  }
  objc_msgSend(v3, "photoSuggestedContacts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "photoSuggestedContacts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "photoSuggestedContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v22);

  }
  objc_msgSend(v3, "sourceBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v3, "sourceBundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "sourceBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v25);

  }
  objc_msgSend(v3, "modelSuggestionProxies");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "modelSuggestionProxies");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "modelSuggestionProxies");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v28);

  }
  objc_msgSend(v3, "adaptedModelRecipeID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v3, "adaptedModelRecipeID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "adaptedModelRecipeID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, v31);

  }
  objc_msgSend(v3, "supportedBundleIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "supportedBundleIDs");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "supportedBundleIDs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, v34);

  }
  objc_msgSend(v3, "reasonType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v3, "reasonType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "reasonType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, v37);

  }
  objc_msgSend(v3, "reason");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v3, "reason");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "reason");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, v40);

  }
  objc_msgSend(v3, "transportBundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v3, "transportBundleID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "transportBundleID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, v43);

  }
  objc_msgSend(v3, "trackingID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v3, "trackingID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15AE0], "trackingID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, v46);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAdaptedModelUsed"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "isAdaptedModelUsed");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, v48);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAdaptedModelCreated"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "isAdaptedModelCreated");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, v50);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "indexSelected"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "indexSelected");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, v52);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "engagementType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "engagementType");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, v54);

  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "numberOfVisibleSuggestions");
  objc_msgSend(v55, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "numberOfVisibleSuggestions");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, v57);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "iCloudFamilyInvocation"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "iCloudFamilyInvocation");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, v59);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "peopleSuggestionsDisabled"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "peopleSuggestionsDisabled");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, v61);

  return v4;
}

+ (void)recentInteractionsFromStore:bundleIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error querying interactions database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, MEMORY[0x1E0C81028], v0, "Error querying interactions database: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
