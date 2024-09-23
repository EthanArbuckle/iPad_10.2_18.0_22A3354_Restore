@implementation SRSmartRepliesContactCaptionProvider

+ (SGSuggestionsServiceContactsProtocol)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global);
  return (SGSuggestionsServiceContactsProtocol *)(id)sharedService_sharedService;
}

void __53__SRSmartRepliesContactCaptionProvider_sharedService__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE28608], "serviceForContacts");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = v0;

  if (!sharedService_sharedService && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __53__SRSmartRepliesContactCaptionProvider_sharedService__block_invoke_cold_1();
}

+ (void)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  if (v8)
  {
    objc_msgSend(a1, "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", v11, 5, 0, v6, v8);
    else
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);

  }
}

+ (id)newestSuggestedContactForDestinationID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "destinationIdIsEmailAddress"))
  {
    objc_msgSend(a1, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v5, "contactMatchesByEmailAddress:error:", v4, &v32);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v32;

    if (!v6 && v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[SRSmartRepliesContactCaptionProvider newestSuggestedContactForDestinationID:].cold.1();
      goto LABEL_24;
    }
  }
  else
  {
    if (!objc_msgSend(v4, "destinationIdIsPhoneNumber"))
    {
      v7 = 0;
LABEL_24:
      v6 = 0;
      goto LABEL_25;
    }
    objc_msgSend(a1, "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v8, "contactMatchesByPhoneNumber:error:", v4, &v31);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v31;

    if (!v6 && v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[SRSmartRepliesContactCaptionProvider newestSuggestedContactForDestinationID:].cold.2();
      goto LABEL_24;
    }
  }
  if (!v6)
  {
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v6;
  v9 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v9)
  {
    v25 = v7;
    v26 = v4;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    v12 = -1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "contact", v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "recordId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "numericValue");

        if (v17 > v12)
        {
          objc_msgSend(v14, "contact");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "recordId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v19, "numericValue");

          v20 = v14;
          v10 = v20;
        }
      }
      v9 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v9);

    v7 = v25;
    if (v10)
    {
      v21 = (void *)MEMORY[0x24BDBACA0];
      objc_msgSend(v10, "contact");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactFromSuggestion:", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    v4 = v26;
  }
  else
  {

  }
LABEL_26:
  v23 = v9;

  return v23;
}

void __53__SRSmartRepliesContactCaptionProvider_sharedService__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2475DF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Service for contact determination is nil", v0, 2u);
}

+ (void)newestSuggestedContactForDestinationID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2475DF000, MEMORY[0x24BDACB70], v0, "Retrieving suggested contact matches by email address %@ failed with error %@.", v1, v2, v3, v4, v5);
}

+ (void)newestSuggestedContactForDestinationID:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2475DF000, MEMORY[0x24BDACB70], v0, "Retrieving suggested contact matches by phone number %@ failed with error %@.", v1, v2, v3, v4, v5);
}

@end
