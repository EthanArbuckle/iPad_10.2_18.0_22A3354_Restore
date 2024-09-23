@implementation PSFamilyRecommender

uint64_t __59___PSFamilyRecommender_fetchAllContactIdsFromContactStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

uint64_t __48___PSFamilyRecommender_indexToInsertDate_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  double v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  if (v6 >= 0.0)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v8 > 0.0;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __37___PSFamilyRecommender_currentFamily__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id CNContactClass_1;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v37 = a3;
  if (v37)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___PSFamilyRecommender_currentFamily__block_invoke_cold_1();

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v38, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v51;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v51 != v40)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v42 = v5;
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v5);
        objc_msgSend(v7, "dictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("member-phone-numbers"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v44, "length") >= 2)
        {
          objc_msgSend(v44, "componentsSeparatedByString:", CFSTR(", "));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v47;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v47 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                objc_msgSend(*(id *)(a1 + 32), "contactStore");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                CNContactClass_1 = getCNContactClass_1();
                v55 = 0;
                v56 = &v55;
                v57 = 0x2050000000;
                v16 = (void *)getCNPhoneNumberClass_softClass_0;
                v58 = getCNPhoneNumberClass_softClass_0;
                if (!getCNPhoneNumberClass_softClass_0)
                {
                  v54[0] = MEMORY[0x1E0C809B0];
                  v54[1] = 3221225472;
                  v54[2] = __getCNPhoneNumberClass_block_invoke_0;
                  v54[3] = &unk_1E43FEA00;
                  v54[4] = &v55;
                  __getCNPhoneNumberClass_block_invoke_0((uint64_t)v54);
                  v16 = (void *)v56[3];
                }
                v17 = objc_retainAutorelease(v16);
                _Block_object_dispose(&v55, 8);
                objc_msgSend(v17, "phoneNumberWithStringValue:", v13);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CNContactClass_1, "predicateForContactsMatchingPhoneNumber:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "contactKeysToFetch");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "unifiedContactsMatchingPredicate:keysToFetch:error:", v19, v20, 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "firstObject");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v22);

                  goto LABEL_29;
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
              if (v10)
                continue;
              break;
            }
          }
LABEL_29:

          goto LABEL_30;
        }
        objc_msgSend(v7, "appleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 32), "contactStore");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = getCNContactClass_1();
          objc_msgSend(v7, "appleID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "predicateForContactsMatchingEmailAddress:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "contactKeysToFetch");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "unifiedContactsMatchingPredicate:keysToFetch:error:", v27, v28, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_24;
        }
        objc_msgSend(v7, "inviteEmail");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(*(id *)(a1 + 32), "contactStore");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = getCNContactClass_1();
          objc_msgSend(v7, "inviteEmail");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "predicateForContactsMatchingEmailAddress:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "contactKeysToFetch");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "unifiedContactsMatchingPredicate:keysToFetch:error:", v34, v35, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "firstObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
LABEL_24:
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
LABEL_30:

          }
        }

        v5 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v41);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        v9 = *(void **)(a1 + 48);
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "containsObject:", v10) ^ 1;

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 72) + 16))())
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
          v12 = *(void **)(a1 + 64);
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          v6[2](v6, v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_320(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFamilyHeuristic:", 1);
}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_324(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPhotosInference:", 1);
  objc_msgSend(v2, "setFamilyHeuristic:", 0);

}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_326(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPhotosInference:", 1);
  objc_msgSend(v2, "setFamilyHeuristic:", 0);

}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_338(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_343(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "doubleValue");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_348(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFamilyHeuristic:", 1);
}

void __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke_cold_1(a1 + 40, v5);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __78___PSFamilyRecommender_logFeedbackForFamilyRecommenderCallHasRecommendations___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __37___PSFamilyRecommender_currentFamily__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "FAFamilyMember request error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "Fetched emergency contacts %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
