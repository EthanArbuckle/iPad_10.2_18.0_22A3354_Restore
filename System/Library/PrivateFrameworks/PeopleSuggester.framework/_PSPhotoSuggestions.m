@implementation _PSPhotoSuggestions

+ (id)sharedMADService
{
  if (sharedMADService__pasOnceToken1 != -1)
    dispatch_once(&sharedMADService__pasOnceToken1, &__block_literal_global_39);
  return (id)sharedMADService__pasExprOnceResult;
}

+ (id)allOutstandingRequestsLock
{
  if (allOutstandingRequestsLock__pasOnceToken2 != -1)
    dispatch_once(&allOutstandingRequestsLock__pasOnceToken2, &__block_literal_global_236);
  return (id)allOutstandingRequestsLock__pasExprOnceResult;
}

+ (id)phPersonIdentifiersOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 withCompletion:(id)a5
{
  return +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:](_PSPhotoSuggestions, "peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:", a3, a4, 0, a5);
}

+ (id)mdPersonIDsOfPeopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79___PSPhotoSuggestions_mdPersonIDsOfPeopleInSharedPhotoAttachments_forBundleID___block_invoke;
  v12[3] = &unk_1E43FEF00;
  v14 = &v15;
  v8 = v7;
  v13 = v8;
  v9 = +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:](_PSPhotoSuggestions, "peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:", v5, v6, 1, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

+ (id)peopleInSharedPhotoAttachments:(id)a3 forBundleID:(id)a4 shouldUseMDID:(BOOL)a5 withCompletion:(id)a6
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id obj;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  _BYTE *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t v69[128];
  _BYTE buf[24];
  void *v71;
  uint64_t *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v44 = a6;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_242);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count"))
  {
    +[_PSPhotoSuggestions allOutstandingRequestsLock](_PSPhotoSuggestions, "allOutstandingRequestsLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tryWithLockAcquired:", &__block_literal_global_245);

    v9 = objc_alloc(MEMORY[0x1E0D815F0]);
    v10 = (void *)objc_opt_new();
    v42 = (void *)objc_msgSend(v9, "initWithGuardedData:", v10);

    v64 = 0;
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v36, 0, &v64);
    v33 = v64;
    v11 = v35;
    if (!v35)
    {
      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[_PSPhotoSuggestions peopleInSharedPhotoAttachments:forBundleID:shouldUseMDID:withCompletion:].cold.1((uint64_t)v33, v12, v13);

      v11 = 0;
    }
    v14 = objc_msgSend(v11, "developerType", v33);
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14 == 1;
      _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_DEFAULT, "IDsOfPeopleInSharedPhotoAssets with attachments %{private}@, isFirstParty: %d", buf, 0x12u);
    }

    v43 = (id)objc_opt_new();
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v63[3] = objc_msgSend(v37, "count");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF8], *MEMORY[0x1E0D15C20], &unk_1E442D140);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v37;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v60;
      v18 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v21 = (void *)getMADPersonIdentificationRequestClass_softClass;
          v68 = getMADPersonIdentificationRequestClass_softClass;
          if (!getMADPersonIdentificationRequestClass_softClass)
          {
            *(_QWORD *)buf = v18;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getMADPersonIdentificationRequestClass_block_invoke;
            v71 = &unk_1E43FEA00;
            v72 = &v65;
            __getMADPersonIdentificationRequestClass_block_invoke((uint64_t)buf);
            v21 = (void *)v66[3];
          }
          v22 = objc_retainAutorelease(v21);
          _Block_object_dispose(&v65, 8);
          v23 = objc_alloc_init(v22);
          objc_msgSend(v23, "setMaximumFaceCount:", 4);
          objc_msgSend(v23, "setAllowOnDemand:", 1);
          objc_msgSend(v23, "setAllowUnverifiedIdentity:", 1);
          objc_msgSend(v23, "setUseLowResolutionPicture:", 1);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LODWORD(v71) = 0;
          v52[0] = v18;
          v52[1] = 3221225472;
          v52[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_254;
          v52[3] = &unk_1E4401DA0;
          v24 = v23;
          v53 = v24;
          v58 = a5;
          v54 = v42;
          v25 = v41;
          v55 = v25;
          v57 = v63;
          v56 = v44;
          v26 = (void *)MEMORY[0x1A1AFCBF8](v52);
          +[_PSPhotoSuggestions allOutstandingRequestsLock](_PSPhotoSuggestions, "allOutstandingRequestsLock");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v18;
          v45[1] = 3221225472;
          v45[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_261;
          v45[3] = &unk_1E4401E18;
          v28 = v26;
          v49 = v28;
          v50 = buf;
          v45[4] = v20;
          v51 = a1;
          v29 = v24;
          v46 = v29;
          v47 = v25;
          v48 = v43;
          objc_msgSend(v27, "runWithLockAcquired:", v45);

          _Block_object_dispose(buf, 8);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v16);
    }

    _Block_object_dispose(v63, 8);
    v30 = v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v44;
    (*((void (**)(id, void *))v44 + 2))(v44, v31);

    v43 = (id)MEMORY[0x1E0C9AA60];
  }

  return v43;
}

+ (void)cancelRequestWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *obj;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v39 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v38 = v5;
    if (-[NSObject count](v5, "count"))
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v6 = v5;
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v47 != v8)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                +[_PSPhotoSuggestions cancelRequestWithToken:].cold.1((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);

              goto LABEL_30;
            }
          }
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          if (v7)
            continue;
          break;
        }
      }

      v37 = -[NSObject count](v6, "count");
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v6;
      v10 = 0;
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v43 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            v15 = objc_msgSend(v14, "integerValue", v37);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v51 = __Block_byref_object_copy__266;
            v52 = __Block_byref_object_dispose__267;
            v53 = 0;
            objc_msgSend(a1, "allOutstandingRequestsLock");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __46___PSPhotoSuggestions_cancelRequestWithToken___block_invoke;
            v41[3] = &unk_1E4401E40;
            v41[4] = v14;
            v41[5] = buf;
            objc_msgSend(v16, "runWithLockAcquired:", v41);

            v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            if (v17)
            {
              (*(void (**)(void))(v17 + 16))();
              objc_msgSend(a1, "sharedMADService");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "cancelRequestID:", v15);

              ++v10;
            }
            _Block_object_dispose(buf, 8);

          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        }
        while (v11);
      }

      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v37;
      v19 = "_PSPhotoSuggestions request cancelled (%tu of %tu attachments were still in-flight)";
      v20 = v6;
      v21 = 22;
    }
    else
    {
      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:

        v23 = v38;
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      v19 = "_PSPhotoSuggestions request cancelled (no-op because request was for 0 items)";
      v20 = v6;
      v21 = 2;
    }
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_30;
  }
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    +[_PSPhotoSuggestions cancelRequestWithToken:].cold.2((uint64_t)v39, v22, v24, v25, v26, v27, v28, v29);
    v23 = v22;
  }
LABEL_31:

}

+ (id)suggestionTemplateForPhotoContactIdWithMessages:(id)a3 cdInteraction:(id)a4 reason:(id)a5 reasonType:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  int v22;
  _PSSuggestionTemplate *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _PSSuggestionTemplate *v31;
  void *v32;
  _PSSuggestionTemplate *v33;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  void *v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "sender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v9);

  if (v15)
  {
    objc_msgSend(v10, "sender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v10, "recipients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v17)
    {
      v35 = v11;
      v18 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v20, "personId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", v9);

          if (v22)
          {
            objc_msgSend(v20, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v17 = (void *)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v17)
          continue;
        break;
      }
LABEL_13:
      v11 = v35;
    }
  }

  if (v17)
  {
    v23 = [_PSSuggestionTemplate alloc];
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v9;
    v42 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v27 = v10;
    v28 = v12;
    v29 = v11;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v23;
    v32 = (void *)v24;
    v33 = -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:](v31, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:", v24, v25, 0, 0, v26, 0, 0, 0, v30, v29, v28);

    v11 = v29;
    v12 = v28;
    v10 = v27;

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (void)peopleInSharedPhotoAttachments:(uint64_t)a3 forBundleID:shouldUseMDID:withCompletion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "appRecord lookup failed with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)cancelRequestWithToken:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a2, a3, "unexpected cancel token (some items are not NSNumber): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)cancelRequestWithToken:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a2, a3, "unexpected cancel token (not array): %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
