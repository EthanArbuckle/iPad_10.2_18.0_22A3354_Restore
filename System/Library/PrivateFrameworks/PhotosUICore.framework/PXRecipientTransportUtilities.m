@implementation PXRecipientTransportUtilities

+ (BOOL)px_IsValidEmailAddress:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D1E6D0], "parseEmailAddressString:displayName:localPart:domain:groupList:", a3, 0, 0, 0, 0);
}

+ (BOOL)px_IsEmailAddress:(id)a3 equalToEmailAddress:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v5 = (objc_class *)MEMORY[0x1E0D1E6B8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithString:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v6);
  if (v8 == v9)
    v10 = 1;
  else
    v10 = objc_msgSend(v8, "isEqual:", v9);

  return v10;
}

+ (id)px_validPhoneNumberFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (px_validPhoneNumberFromString__onceToken != -1)
  {
    dispatch_once(&px_validPhoneNumberFromString__onceToken, &__block_literal_global_216127);
    if (v4)
      goto LABEL_3;
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if (!v3)
    goto LABEL_16;
LABEL_3:
  objc_msgSend((id)px_validPhoneNumberFromString__phoneDetector, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "resultType") == 2048)
        {
          objc_msgSend(v11, "phoneNumber");
          v12 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

LABEL_17:
  return v8;
}

+ (int64_t)px_recipientKindFromString:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  objc_msgSend(a1, "px_validPhoneNumberFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 2;
  else
    v6 = objc_msgSend(a1, "px_IsValidEmailAddress:", v4);

  return v6;
}

+ (id)px_bestMessagingTransportForContact:(id)a3
{
  id v3;
  PXRecipient *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PXRecipientTransport *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXRecipientTransportUtilities.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v4 = -[PXRecipient initWithContact:address:nameComponents:recipientKind:]([PXRecipient alloc], "initWithContact:address:nameComponents:recipientKind:", v3, 0, 0, 0);
  -[PXRecipient allEmails](v4, "allEmails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipient unformattedAllPhones](v4, "unformattedAllPhones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v8 = (void *)get_CDInteractionAdvisorClass_softClass;
    v29 = get_CDInteractionAdvisorClass_softClass;
    if (!get_CDInteractionAdvisorClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __get_CDInteractionAdvisorClass_block_invoke;
      v31 = &unk_1E51482E0;
      v32 = &v26;
      __get_CDInteractionAdvisorClass_block_invoke((uint64_t)buf);
      v8 = (void *)v27[3];
    }
    v9 = v8;
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v9, "interactionAdvisor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v11 = (void *)get_CDInteractionAdvisorSettingsClass_softClass;
    v29 = get_CDInteractionAdvisorSettingsClass_softClass;
    if (!get_CDInteractionAdvisorSettingsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __get_CDInteractionAdvisorSettingsClass_block_invoke;
      v31 = &unk_1E51482E0;
      v32 = &v26;
      __get_CDInteractionAdvisorSettingsClass_block_invoke((uint64_t)buf);
      v11 = (void *)v27[3];
    }
    v12 = v11;
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v12, "interactionAdvisorSettingsDefault");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstrainIdentifiers:", v7);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E53EEA48, &unk_1E53EEA60, &unk_1E53EEA78, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstrainMechanisms:", v14);

    objc_msgSend(v7, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rankCandidateContacts:usingSettings:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", v17) & 1) != 0)
    {
      v18 = 1;
      if (!v17)
      {
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXRecipientTransportUtilities.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bestAddress"));

      }
    }
    else
    {
      if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
      {
        PLUIGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v3;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "The result for best messaging transport address:%@ for contact:%@ is invalid", buf, 0x16u);
        }

        v19 = 0;
        goto LABEL_18;
      }
      v18 = 2;
      if (!v17)
        goto LABEL_20;
    }
    v19 = -[PXRecipientTransport initWithAddress:addressKind:]([PXRecipientTransport alloc], "initWithAddress:addressKind:", v17, v18);
LABEL_18:

    goto LABEL_19;
  }
  -[PXRecipient suggestedTransport](v4, "suggestedTransport");
  v19 = (PXRecipientTransport *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v19;
}

void __63__PXRecipientTransportUtilities_px_validPhoneNumberFromString___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2048, &v4);
  v1 = v4;
  v2 = (void *)px_validPhoneNumberFromString__phoneDetector;
  px_validPhoneNumberFromString__phoneDetector = v0;

  if (!px_validPhoneNumberFromString__phoneDetector)
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "Invitation Recipient can't instantiate detector for phone %@", buf, 0xCu);
    }

  }
}

@end
