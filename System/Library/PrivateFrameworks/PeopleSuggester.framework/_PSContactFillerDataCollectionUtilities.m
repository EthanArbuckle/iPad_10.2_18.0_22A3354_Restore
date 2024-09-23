@implementation _PSContactFillerDataCollectionUtilities

+ (id)resolveUniqueContactIdGivenInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "targetBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message")))
  {

LABEL_4:
    objc_msgSend(v3, "domainIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v6)
    goto LABEL_4;
  objc_msgSend(v3, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  if (v11 || objc_msgSend(v3, "mechanism") != 13 && objc_msgSend(v3, "mechanism") != 4)
  {
    v12 = (void *)MEMORY[0x1E0D158B8];
    objc_msgSend(v3, "recipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateConversationIdFromInteractionRecipients:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v3, "derivedIntentIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;
LABEL_6:

  return v8;
}

+ (id)getListOfContactsFromCashedMessagesInteraction:(id)a3 cashedShareInteractions:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v5;
  v36[0] = v5;
  v36[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  v8 = 0;
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v9;
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              v16 = v8;
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:](_PSContactFillerDataCollectionUtilities, "resolveUniqueContactIdGivenInteraction:", v17);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              if (v8)
              {
                objc_msgSend(v7, "objectForKey:", v8);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v18)
                {
                  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v19, "addObject:", v17);
                  objc_msgSend(v7, "setObject:forKey:", v19, v8);

                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v13);
        }

        v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v25);
  }

  v20 = (void *)objc_msgSend(v7, "copy");
  return v20;
}

+ (id)getListOfContactsInteractedInTheLastNumberOfDays:(int)a3 interactionStore:(id)a4 limit:(int)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  _BYTE v62[128];
  uint8_t v63[4];
  uint64_t v64;
  uint8_t buf[4];
  id v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v46 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "dateByAddingTimeInterval:", (double)(-86400 * a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v45 = a5;
  if (a5 < 101)
  {
LABEL_24:
    v40 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v9 = 0;
    v10 = 100;
    v44 = v7;
    while (1)
    {
      v47 = v10;
      v53 = MEMORY[0x1A1AFCA24]();
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@)"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442AC88);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      v52 = v11;
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@)"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E442C8E0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442C8F8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

      v51 = v15;
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v55 = (void *)v14;
      objc_msgSend(v20, "addObject:", v14);
      objc_msgSend(v20, "addObject:", v19);
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v48 = v9;
      objc_msgSend(v46, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v21, v23, 100, v9, &v61);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v61;

      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v54 = v24;
      v49 = (void *)v21;
      v50 = v20;
      if (v24)
      {
        v7 = v44;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v24;
          _os_log_error_impl(&dword_1A07F4000, v26, OS_LOG_TYPE_ERROR, "Unable to query interaction store: %@", buf, 0xCu);
        }
        v28 = v52;
        v27 = (void *)v53;
        v29 = v51;
        v30 = v55;
      }
      else
      {
        v43 = v19;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          +[_PSContactFillerDataCollectionUtilities getListOfContactsInteractedInTheLastNumberOfDays:interactionStore:limit:].cold.1(v63, v56, &v64, v26);

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v26 = v56;
        v31 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        v30 = v55;
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              v36 = v33;
              if (*(_QWORD *)v58 != v34)
                objc_enumerationMutation(v26);
              v37 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
              +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:](_PSContactFillerDataCollectionUtilities, "resolveUniqueContactIdGivenInteraction:", v37);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v8, "objectForKey:", v33);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v38)
                {
                  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v39, "addObject:", v37);
                  objc_msgSend(v8, "setObject:forKey:", v39, v33);

                }
              }
            }
            v32 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
          }
          while (v32);

          v7 = v44;
          v28 = v52;
          v27 = (void *)v53;
          v30 = v55;
        }
        else
        {
          v7 = v44;
          v28 = v52;
          v27 = (void *)v53;
        }
        v29 = v51;
        v19 = v43;
      }

      objc_autoreleasePoolPop(v27);
      if (v54)
        break;
      v9 = v48 + 100;
      v10 = v47 + 100;
      if (v47 + 100 >= v45)
        goto LABEL_24;
    }

    v40 = 0;
  }

  return v40;
}

+ (id)getBehaviorRulesGivenContext:(id)a3 behaviorRetriever:(id)a4
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

  v5 = a4;
  v6 = a3;
  objc_msgSend(getBMRetrievalFilterClass(), "filterWithOperand:inclusionOperator:items:", 1, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getBMItemTypeClass(), "interactionRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass(), "interactionTargetBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMRetrievalFilterClass(), "filterWithOperand:inclusionOperator:types:", 2, 2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retrieveRulesWithSupport:confidence:filters:", v12, 0.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)calculateNormContantsGivenInteractionStore:(id)a3 normConstants:(id)a4
{
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
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v39 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v41 = a4;
  objc_msgSend(v6, "setWithObjects:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442ACD0, &unk_1E442ACE8, &unk_1E442ACB8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism IN %@"), v7, v8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442ACA0, &unk_1E442ACB8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442ACD0, &unk_1E442ACE8, &unk_1E442ACB8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism IN %@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mechanism == %@"), &unk_1E442AC88);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442AD00, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442AD00, &unk_1E442AD18, &unk_1E442AD30, &unk_1E442AD48, &unk_1E442AD60, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism IN %@"), v14, v15);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442ACA0, &unk_1E442ACB8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442AD00, &unk_1E442AD18, &unk_1E442AD30, &unk_1E442AD48, &unk_1E442AD60, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism IN %@"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  v40 = objc_msgSend(v39, "countInteractionsUsingPredicate:error:", v12, &v49);
  v20 = v49;
  if (v20)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.5();

  }
  v48 = v20;
  v22 = objc_msgSend(v39, "countInteractionsUsingPredicate:error:", v44, &v48);
  v23 = v48;

  if (v23)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.4();

  }
  v47 = v23;
  v25 = objc_msgSend(v39, "countInteractionsUsingPredicate:error:", v43, &v47);
  v26 = v47;

  if (v26)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.3();

  }
  v46 = v26;
  v28 = objc_msgSend(v39, "countInteractionsUsingPredicate:error:", v42, &v46);
  v29 = v46;

  if (v29)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.1();

  }
  v45 = v29;
  v31 = objc_msgSend(v39, "countInteractionsUsingPredicate:error:", v19, &v45);
  v32 = v45;

  if (v32)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v22);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setIncomingTextTotal:", v34);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v40);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setOutgoingTextTotal:", v35);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setShareTotal:", v36);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v28);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setIncomingCallTotal:", v37);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v31);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setOutgoingCallTotal:", v38);

}

+ (void)extractUserFeaturesIntoPETMessage:(id)a3 normConstants:(id)a4 behaviorRetriever:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "outgoingTextTotal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextInteractionsSent:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v11, "unsignedLongValue")));

  objc_msgSend(v9, "incomingTextTotal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextInteractionsReceived:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v12, "unsignedLongValue")));

  v26 = v9;
  objc_msgSend(v9, "shareTotal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShareInteractionsSent:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v13, "unsignedLongValue")));

  v25 = v10;
  objc_msgSend(v10, "retrieveRulesWithFilters:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v22, "confidence");
        if (v23 <= 0.75)
        {
          objc_msgSend(v22, "confidence");
          if (v24 <= 0.25)
            ++v18;
          else
            ++v17;
        }
        else
        {
          ++v19;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  objc_msgSend(v8, "setLowConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v18));
  objc_msgSend(v8, "setMediumConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v17));
  objc_msgSend(v8, "setHighConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v19));

}

+ (unsigned)contactFillerBucketedValue:(unint64_t)a3
{
  unsigned int result;
  __int16 v4;
  __int16 v5;

  result = a3;
  if (a3 > 0xA)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7)
      {
        if (a3 >> 4 > 0x270)
          return 10000;
        v4 = (unsigned __int16)a3 / 0x3E8u;
        v5 = 1000;
      }
      else
      {
        v4 = (unsigned __int16)a3 / 0x64u;
        v5 = 100;
      }
      return a3 - (unsigned __int16)(a3 - v4 * v5);
    }
    return a3 - a3 % 0xAu;
  }
  return result;
}

+ (id)calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7
{
  id v11;
  double v12;
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
  unint64_t v23;
  id v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v31;

  v11 = a4;
  if (a3)
  {
    v12 = (double)(-86400 * a5);
    v13 = a7;
    v14 = a6;
    v15 = a3;
    objc_msgSend(v14, "dateByAddingTimeInterval:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate < %@)"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addObject:", v19);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E442C910);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442AC88);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);

    objc_msgSend(v17, "addObject:", v15);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v23 = objc_msgSend(v13, "countInteractionsUsingPredicate:error:", v22, &v31);

    v24 = v31;
    if (v24)
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.3();

    }
    objc_msgSend(v11, "doubleValue");
    if (v26 == 0.0)
    {
      v28 = 0.0;
    }
    else
    {
      objc_msgSend(v11, "doubleValue");
      v28 = (double)v23 / v27;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = &unk_1E442AD78;
  }

  return v29;
}

+ (id)calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8
{
  id v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  NSObject *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v34;

  v13 = a4;
  if (a3)
  {
    v14 = (double)(-86400 * a5);
    v15 = a8;
    v16 = a7;
    v17 = a6;
    v18 = a3;
    objc_msgSend(v17, "dateByAddingTimeInterval:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate < %@)"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v22);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v23);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442C928);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v24);

    objc_msgSend(v20, "addObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v26 = objc_msgSend(v16, "countInteractionsUsingPredicate:error:", v25, &v34);

    v27 = v34;
    if (v27)
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:].cold.1();

    }
    objc_msgSend(v13, "doubleValue");
    if (v29 == 0.0)
    {
      v31 = 0.0;
    }
    else
    {
      objc_msgSend(v13, "doubleValue");
      v31 = (double)v26 / v30;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = &unk_1E442AD78;
  }

  return v32;
}

+ (id)calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8
{
  id v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  id v27;
  NSObject *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v34;

  v13 = a4;
  if (a3)
  {
    v14 = (double)(-86400 * a5);
    v15 = a8;
    v16 = a7;
    v17 = a6;
    v18 = a3;
    objc_msgSend(v17, "dateByAddingTimeInterval:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate < %@)"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v22);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v23);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442C940);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v24);

    objc_msgSend(v20, "addObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v26 = objc_msgSend(v16, "countInteractionsUsingPredicate:error:", v25, &v34);

    v27 = v34;
    if (v27)
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:].cold.1();

    }
    objc_msgSend(v13, "doubleValue");
    if (v29 == 0.0)
    {
      v31 = 0.0;
    }
    else
    {
      objc_msgSend(v13, "doubleValue");
      v31 = (double)v26 / v30;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = &unk_1E442AD78;
  }

  return v32;
}

+ (int)calculateTimeSinceLastCallForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6
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
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    v34 = v11;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442C958);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    v36 = v9;
    objc_msgSend(v13, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v33 = v12;
    objc_msgSend(v12, "interactions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v16;
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v25, "startDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "compare:", v27);

          if (v28 == 1)
          {
            v29 = v25;

            v19 = v29;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v22);
    }

    v11 = v34;
    v30 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:timeOfShareInteraction:](_PSContactFillerDataCollectionUtilities, "calculateTimeBucketGivenInteraction:timeOfShareInteraction:", v19, v34);

    v10 = v35;
    v9 = v36;
    v12 = v33;
  }
  else
  {
    v30 = 11;
  }

  return v30;
}

+ (int)calculateTimeBucketGivenInteraction:(id)a3 timeOfShareInteraction:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a4;
  objc_msgSend(a3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  if (v8 < 120.0)
    return 0;
  if (v8 < 300.0)
    return 1;
  if (v8 < 600.0)
    return 2;
  if (v8 < 1800.0)
    return 3;
  if (v8 < 3600.0)
    return 4;
  if (v8 < 7200.0)
    return 5;
  if (v8 < 14400.0)
    return 6;
  if (v8 < 21600.0)
    return 7;
  if (v8 < 43200.0)
    return 8;
  if (v8 >= 86400.0)
    return 10;
  return 9;
}

+ (int)calculateTimeSinceLastShareForContactGivenContactIdPredicate:(id)a3 timeOfShareInteraction:(id)a4 interactionCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  int v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v31 = v8;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E442C970);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442AC88);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    v32 = v7;
    objc_msgSend(v10, "addObject:", v7);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v30 = v9;
    objc_msgSend(v9, "interactions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v13;
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v22, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "compare:", v24);

          if (v25 == 1)
          {
            v26 = v22;

            v16 = v26;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v8 = v31;
    v27 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:timeOfShareInteraction:](_PSContactFillerDataCollectionUtilities, "calculateTimeBucketGivenInteraction:timeOfShareInteraction:", v16, v31);

    v7 = v32;
    v9 = v30;
  }
  else
  {
    v27 = 11;
  }

  return v27;
}

+ (int)calculateTimeSinceLastTextForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6
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
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    v34 = v11;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = v10;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442C988);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    v36 = v9;
    objc_msgSend(v13, "addObject:", v9);
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    v33 = v12;
    objc_msgSend(v12, "interactions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v16;
    objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v25, "startDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "compare:", v27);

          if (v28 == 1)
          {
            v29 = v25;

            v19 = v29;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v22);
    }

    v11 = v34;
    v30 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:timeOfShareInteraction:](_PSContactFillerDataCollectionUtilities, "calculateTimeBucketGivenInteraction:timeOfShareInteraction:", v19, v34);

    v10 = v35;
    v9 = v36;
    v12 = v33;
  }
  else
  {
    v30 = 11;
  }

  return v30;
}

+ (id)filterRulesBasedOnInteractionGivenRuleList:(id)a3 interaction:(id)a4
{
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *j;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v18;
  id obj;
  uint64_t v20;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  objc_msgSend(getBMItemTypeClass(), "interactionTargetBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v8, "consequent", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v13, "type");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", v6);

              if (v15)
              {
                objc_msgSend(v13, "value");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_16;
              }
            }
            v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v10)
              continue;
            break;
          }
        }
LABEL_16:

        if (objc_msgSend(a1, "recipientPredictedCorrectlyByRule:interaction:bundleId:", v8, v22, v10))
          objc_msgSend(v18, "addObject:", v8);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

+ (BOOL)recipientPredictedCorrectlyByRule:(id)a3 interaction:(id)a4 bundleId:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "consequent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsPassingTest:", &__block_literal_global_17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.MobileSMS"));
  if ((_DWORD)v9)
  {
    objc_msgSend(v7, "domainIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v17 = (void *)v12;
    goto LABEL_8;
  }
  objc_msgSend(v7, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  if (!v14)
  {
    objc_msgSend(v7, "derivedIntentIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v15 = (void *)MEMORY[0x1E0D158B8];
  objc_msgSend(v7, "recipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generateConversationIdFromInteractionRecipients:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_8:
    v18 = objc_msgSend(v11, "containsObject:", v17);
    goto LABEL_9;
  }
  v18 = 0;
LABEL_9:

  return v18;
}

+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 contextItems:(id)a5 ruleRankingModel:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v9, "scoresOnRules:contextItems:", v10, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  +[_PSContactFillerDataCollectionUtilities extractFeaturesFromBehaviorRulesIntoPETMessage:behaviorRules:MLModelScores:](_PSContactFillerDataCollectionUtilities, "extractFeaturesFromBehaviorRulesIntoPETMessage:behaviorRules:MLModelScores:", v11, v10, v13);
}

+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 MLModelScores:(id)a5
{
  id v7;
  id v8;
  _PSContactFillerDataCollectionStatistics *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  _PSContactFillerDataCollectionStatistics *v29;
  _PSContactFillerDataCollectionStatistics *v30;
  _PSContactFillerDataCollectionStatistics *v31;
  _PSContactFillerDataCollectionStatistics *v32;
  _PSContactFillerDataCollectionStatistics *v33;
  _PSContactFillerDataCollectionStatistics *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35 = a5;
  v9 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v35);
  -[_PSContactFillerDataCollectionStatistics avg](v9, "avg");
  objc_msgSend(v7, "setAverageBehavioralRuleMLScore:");
  -[_PSContactFillerDataCollectionStatistics max](v9, "max");
  objc_msgSend(v7, "setMaximumBehavioralRuleMLScore:");
  -[_PSContactFillerDataCollectionStatistics min](v9, "min");
  objc_msgSend(v7, "setMinimumBehavioralRuleMLScore:");
  v34 = v9;
  -[_PSContactFillerDataCollectionStatistics stdev](v9, "stdev");
  v36 = v7;
  objc_msgSend(v7, "setStdevBehavioralRuleMLScore:");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "confidence");
        objc_msgSend(v19, "numberWithDouble:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "conviction");
        objc_msgSend(v21, "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v22);

        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "rulePowerFactor");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v24);

        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "support");
        objc_msgSend(v25, "numberWithDouble:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v26);

        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v18, "lift");
        objc_msgSend(v27, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v28);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v15);
  }

  v33 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v10);
  -[_PSContactFillerDataCollectionStatistics avg](v33, "avg");
  objc_msgSend(v36, "setAverageBehavioralRuleConfidence:");
  -[_PSContactFillerDataCollectionStatistics max](v33, "max");
  objc_msgSend(v36, "setMaximumBehavioralRuleConfidence:");
  -[_PSContactFillerDataCollectionStatistics min](v33, "min");
  objc_msgSend(v36, "setMinimumBehavioralRuleConfidence:");
  -[_PSContactFillerDataCollectionStatistics stdev](v33, "stdev");
  objc_msgSend(v36, "setStdevBehavioralRuleConfidence:");
  v29 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v11);
  -[_PSContactFillerDataCollectionStatistics avg](v29, "avg");
  objc_msgSend(v36, "setAverageBehavioralRuleConviction:");
  -[_PSContactFillerDataCollectionStatistics max](v29, "max");
  objc_msgSend(v36, "setMaximumBehavioralRuleConviction:");
  -[_PSContactFillerDataCollectionStatistics min](v29, "min");
  objc_msgSend(v36, "setMinimumBehavioralRuleConviction:");
  -[_PSContactFillerDataCollectionStatistics stdev](v29, "stdev");
  objc_msgSend(v36, "setStdevBehavioralRuleConviction:");
  v30 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v12);
  -[_PSContactFillerDataCollectionStatistics avg](v30, "avg");
  objc_msgSend(v36, "setAverageBehavioralRuleLift:");
  -[_PSContactFillerDataCollectionStatistics max](v30, "max");
  objc_msgSend(v36, "setMaximumBehavioralRuleLift:");
  -[_PSContactFillerDataCollectionStatistics min](v30, "min");
  objc_msgSend(v36, "setMinimumBehavioralRuleLift:");
  -[_PSContactFillerDataCollectionStatistics stdev](v30, "stdev");
  objc_msgSend(v36, "setStdevBehavioralRuleLift:");
  v31 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v37);
  -[_PSContactFillerDataCollectionStatistics avg](v31, "avg");
  objc_msgSend(v36, "setAverageBehavioralRuleSupport:");
  -[_PSContactFillerDataCollectionStatistics max](v31, "max");
  objc_msgSend(v36, "setMaximumBehavioralRuleSupport:");
  -[_PSContactFillerDataCollectionStatistics min](v31, "min");
  objc_msgSend(v36, "setMinimumBehavioralRuleSupport:");
  -[_PSContactFillerDataCollectionStatistics stdev](v31, "stdev");
  objc_msgSend(v36, "setStdevBehavioralRuleSupport:");
  v32 = -[_PSContactFillerDataCollectionStatistics initWithList:]([_PSContactFillerDataCollectionStatistics alloc], "initWithList:", v38);
  -[_PSContactFillerDataCollectionStatistics avg](v32, "avg");
  objc_msgSend(v36, "setAverageBehavioralRulePowerFactor:");
  -[_PSContactFillerDataCollectionStatistics max](v32, "max");
  objc_msgSend(v36, "setMaximumBehavioralRulePowerFactor:");
  -[_PSContactFillerDataCollectionStatistics min](v32, "min");
  objc_msgSend(v36, "setMinimumBehavioralRulePowerFactor:");
  -[_PSContactFillerDataCollectionStatistics stdev](v32, "stdev");
  objc_msgSend(v36, "setStdevBehavioralRulePowerFactor:");

}

+ (double)enforceOneSignificantFigureForDouble:(double)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.01f"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

+ (unsigned)enforceOneSignificantFigureForSmallDouble:(double)a3
{
  return +[_PSContactFillerDataCollectionUtilities contactFillerBucketedValue:](_PSContactFillerDataCollectionUtilities, "contactFillerBucketedValue:", (unint64_t)(a3 * 10000.0));
}

+ (void)extractFrequencyRecencyFeaturesIntoPETMessage:(id)a3 recipientID:(id)a4 interaction:(id)a5 normConstants:(id)a6 numberOfDaysToLookBack:(int64_t)a7 interactionStore:(id)a8 timeOfShareInteraction:(id)a9 contactPropertyCache:(id)a10 interactionCache:(id)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
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
  void *v62;
  void *v63;
  void *v64;
  id v66;
  id v67;
  id v68;

  v68 = a3;
  v14 = a5;
  v67 = a6;
  v66 = a8;
  v15 = a9;
  v16 = a10;
  v17 = a11;
  +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:](_PSContactFillerDataCollectionUtilities, "resolveUniqueContactIdGivenInteraction:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "targetBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Message")))
  {

LABEL_4:
    v22 = CFSTR("domainIdentifier == %@");
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v22, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v14, "bundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if ((v21 & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v14, "mechanism") == 13 || objc_msgSend(v14, "mechanism") == 4)
  {
    v22 = CFSTR("derivedIntentIdentifier == %@");
    goto LABEL_8;
  }
  v23 = 0;
LABEL_9:
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedShareFrequency"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedShareFrequency"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v67, "shareTotal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSContactFillerDataCollectionUtilities calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:](_PSContactFillerDataCollectionUtilities, "calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:", v23, v28, a7, v15, v66);
    v29 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v29;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedShareFrequency"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKey:", v27, v18);
  }

  v62 = v27;
  objc_msgSend(v27, "doubleValue");
  objc_msgSend(v68, "setNormalizedShareFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingTextFrequency"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueForKey:", v18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingTextFrequency"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v67, "incomingTextTotal");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:](_PSContactFillerDataCollectionUtilities, "calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:", v23, v34, a7, v15, v66, &unk_1E442C9A0);
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v35;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingTextFrequency"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forKey:", v33, v18);
  }

  v61 = v33;
  objc_msgSend(v33, "doubleValue");
  objc_msgSend(v68, "setNormalizedIncomingTextFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingTextFrequency"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "valueForKey:", v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v14;
  if (v37)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingTextFrequency"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v67, "outgoingTextTotal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:](_PSContactFillerDataCollectionUtilities, "calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:", v23, v40, a7, v15, v66, &unk_1E442C9B8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v64;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingTextFrequency"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", v39, v18);
  }

  objc_msgSend(v39, "doubleValue");
  objc_msgSend(v68, "setNormalizedOutgoingTextFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v68, "setTimeSinceLastContactViaShare:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastShareForContactGivenContactIdPredicate:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastShareForContactGivenContactIdPredicate:timeOfShareInteraction:interactionCache:", v23, v15, v17));
  objc_msgSend(v68, "setTimeSinceLastContactViaIncomingText:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v23, &unk_1E442C9D0, v15, v17));
  objc_msgSend(v68, "setTimeSinceLastContactViaOutgoingText:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v23, &unk_1E442C9E8, v15, v17));

  objc_msgSend(v14, "bundleId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.InCallService"));

  if (v42)
  {
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier CONTAINS %@"), v18);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v44);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.identifier CONTAINS %@"), v18);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingCallFrequency"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "valueForKey:", v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = v15;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingCallFrequency"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKeyedSubscript:", v18);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v67, "outgoingCallTotal");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v15;
    +[_PSContactFillerDataCollectionUtilities calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:](_PSContactFillerDataCollectionUtilities, "calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:", v46, v52, a7, v15, v66, &unk_1E442CA00);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedOutgoingCallFrequency"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setValue:forKey:", v51, v18);
  }
  v60 = v39;
  v63 = v17;

  objc_msgSend(v51, "doubleValue");
  objc_msgSend(v68, "setNormalizedOutgoingCallFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingCallFrequency"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "valueForKey:", v18);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingCallFrequency"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", v18);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v66;
    v58 = v67;
  }
  else
  {
    v58 = v67;
    objc_msgSend(v67, "incomingCallTotal");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v66;
    +[_PSContactFillerDataCollectionUtilities calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:](_PSContactFillerDataCollectionUtilities, "calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:", v46, v59, a7, v49, v66, &unk_1E442CA18);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("normalizedIncomingCallFrequency"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setValue:forKey:", v56, v18);
  }

  objc_msgSend(v56, "doubleValue");
  objc_msgSend(v68, "setNormalizedIncomingCallFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v68, "setTimeSinceLastContactViaIncomingCall:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v46, &unk_1E442CA30, v49, v63));
  objc_msgSend(v68, "setTimeSinceLastContactViaOutgoingCall:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v46, &unk_1E442CA48, v49, v63));

}

+ (BOOL)doesTheRecipientsMatchInInteraction1:(id)a3 interaction2:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:](_PSContactFillerDataCollectionUtilities, "resolveUniqueContactIdGivenInteraction:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:](_PSContactFillerDataCollectionUtilities, "resolveUniqueContactIdGivenInteraction:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);
  return (char)v5;
}

+ (id)getInteractionModelScoreForSuggestions:(id)a3 forInteractionRecipients:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v6;
    v7 = v6;
    v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v24)
    {
      v22 = *(_QWORD *)v26;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v7);
          v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
          v10 = 0.0;
          if (objc_msgSend(v5, "count", v21))
          {
            v11 = 1;
            while (1)
            {
              objc_msgSend(v5, "objectAtIndexedSubscript:", v11 - 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v9);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "firstObject");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:withInteraction:](_PSContactFillerDataCollectionUtilities, "doesSuggestionProxyMatch:withInteraction:", v12, v14);

              if (v15)
                break;
              if (objc_msgSend(v5, "count") <= v11++)
                goto LABEL_15;
            }
            v17 = v11;
            if (v11 >= 0xCuLL)
              v17 = 12;
            v10 = (double)(13 - v17) / 12.0;
          }
LABEL_15:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v18, v9);

          ++v8;
        }
        while (v8 != v24);
        v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v24);
    }

    v6 = v21;
  }
  v19 = (void *)objc_msgSend(v23, "copy", v21);

  return v19;
}

+ (id)getInteractionModelScoreForEvent:(id)a3 forInteractionRecipients:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t i;
  uint64_t v21;
  double v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "modelSuggestionProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v9, &v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v46;
    v17 = v16;
    if (v15)
    {
      v37 = v16;
      v38 = v15;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("knnSuggestionProxies"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v33 = v14;
        v34 = v9;
        v35 = v7;
        v36 = v5;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v19 = v6;
        v41 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v41)
        {
          v39 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v43 != v39)
                objc_enumerationMutation(v19);
              v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              v22 = 0.0;
              if (objc_msgSend(v18, "count"))
              {
                v23 = 1;
                while (1)
                {
                  objc_msgSend(v18, "objectAtIndexedSubscript:", v23 - 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "firstObject");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:withInteraction:](_PSContactFillerDataCollectionUtilities, "doesSuggestionProxyMatch:withInteraction:", v24, v26);

                  if (v27)
                    break;
                  if (objc_msgSend(v18, "count") <= v23++)
                    goto LABEL_17;
                }
                v29 = v23;
                if (v23 >= 0xCuLL)
                  v29 = 12;
                v22 = (double)(13 - v29) / 12.0;
              }
LABEL_17:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setObject:forKey:", v30, v21);

            }
            v41 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
          }
          while (v41);
        }

        v5 = v36;
        v9 = v34;
        v7 = v35;
        v14 = v33;
      }

      v17 = v37;
      v15 = v38;
    }

  }
  v31 = (void *)objc_msgSend(v40, "copy");

  return v31;
}

+ (BOOL)doesSuggestionProxyMatch:(id)a3 withInteraction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "interactionRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v5, "contactID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v14 = 0;
      goto LABEL_10;
    }
  }
  +[_PSContactFillerDataCollectionUtilities getInteractionRecipientFromInteraction:](_PSContactFillerDataCollectionUtilities, "getInteractionRecipientFromInteraction:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactionRecipients");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v5, "interactionRecipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v9);

    if ((v13 & 1) != 0)
      goto LABEL_6;
  }
  objc_msgSend(v5, "interactionRecipients");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "contactID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17
    && (v18 = (void *)v17,
        objc_msgSend(v5, "handle"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    objc_msgSend(v6, "recipients");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_8;
    v29 = (void *)v28;
    objc_msgSend(v6, "recipients");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 != 1)
      goto LABEL_8;
    objc_msgSend(v6, "recipients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_8;
    objc_msgSend(v5, "contactID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "personId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqualToString:", v35);

    if ((v36 & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(v6, "recipients");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_8;
    v21 = (void *)v20;
    objc_msgSend(v6, "recipients");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 != 1)
      goto LABEL_8;
    objc_msgSend(v6, "recipients");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_8;
    objc_msgSend(v5, "contactID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "personId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqualToString:", v27))
    {

    }
    else
    {
      objc_msgSend(v5, "handle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToString:", v38);

      if ((v39 & 1) == 0)
        goto LABEL_8;
    }
  }
LABEL_6:
  v14 = 1;
LABEL_9:

LABEL_10:
  return v14;
}

+ (id)getInteractionRecipientFromInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "mechanism") == 4 || objc_msgSend(v4, "mechanism") == 13))
  {
    if (objc_msgSend(v4, "mechanism") == 13)
    {
      objc_msgSend(v4, "targetBundleId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
    }
    else
    {
      objc_msgSend(v4, "bundleId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
      objc_msgSend(v4, "domainIdentifier");
    else
      objc_msgSend(v4, "derivedIntentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)initContactPropertyCache:(id)a3 timeOfShareInteraction:(id)a4 interactionStore:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("normalizedShareFrequency"));

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("normalizedIncomingTextFrequency"));

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("normalizedOutgoingTextFrequency"));

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("normalizedOutgoingCallFrequency"));

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("normalizedIncomingCallFrequency"));

  objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate < %@)"), v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", v18);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E442CA60);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@)"), &unk_1E442CA78);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __108___PSContactFillerDataCollectionUtilities_initContactPropertyCache_timeOfShareInteraction_interactionStore___block_invoke;
  v24[3] = &unk_1E44004A8;
  v25 = &unk_1E442CA60;
  v26 = &unk_1E442CA78;
  +[_PSInteractionStoreUtils interactionCacheFromStore:size:queryPredicate:filterBlock:](_PSInteractionStoreUtils, "interactionCacheFromStore:size:queryPredicate:filterBlock:", v7, 500, v21, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (void)getListOfContactsInteractedInTheLastNumberOfDays:(_QWORD *)a3 interactionStore:(NSObject *)a4 limit:.cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A07F4000, a4, OS_LOG_TYPE_DEBUG, "getListOfContactsInteractedInTheLastNumberOfDays - Number of interactions : %@", a1, 0xCu);

}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Interaction store retrieval error. Sent call query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Interaction store retrieval error. Shares query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Interaction store retrieval error. Recieved messages query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Interaction store retrieval error. Sent messages query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Interaction store retrieval error. Texting query: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
