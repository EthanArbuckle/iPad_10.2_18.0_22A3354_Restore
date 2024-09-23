@implementation ICSchemeAction

- (ICSchemeAction)initWithDefinition:(id)a3 scheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ICSchemeAction *v9;
  ICSchemeAction *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "app");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICAction initWithDefinition:app:](self, "initWithDefinition:app:", v7, v8);

  if (v9)
  {
    objc_storeWeak((id *)&v9->_scheme, v6);
    v10 = v9;
  }

  return v9;
}

- (NSString)formatString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  -[ICAction definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (v5)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v6 = 0;
LABEL_15:
    v9 = v6;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    objc_msgSend(v10, "objectForKey:", CFSTR("Phone"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_3;
    goto LABEL_14;
  }
  -[ICAction definition](self, "definition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Format"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v11 = v9;

  return (NSString *)v11;
}

- (id)formatKeys
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[ICSchemeAction formatString](self, "formatString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\[\\[(.*?)\\]\\]"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__ICSchemeAction_formatKeys__block_invoke;
  v8[3] = &unk_1E7AF6FC0;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "if_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCallbackAction
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[ICSchemeAction scheme](self, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCallbackScheme"))
  {
    -[ICAction definition](self, "definition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("CallbackUnsupported"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)defersCompletionUntilReturn
{
  void *v2;
  void *v3;

  -[ICAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DeferCompletion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  ICSchemeAction *v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  v31 = a5;
  v29 = a6;
  v30 = a7;
  v12 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v32 = self;
  -[ICAction outputMapping](self, "outputMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v18, "sourceType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ResultPlaceholder"));

        if (v20)
        {
          objc_msgSend(v18, "sourceKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "destinationKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v24, v21);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v15);
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v35[3] = &unk_1E7AF7070;
  v35[4] = v32;
  v36 = v31;
  v38 = v30;
  v39 = v29;
  v37 = v12;
  v25 = v12;
  v26 = v29;
  v27 = v31;
  v28 = v30;
  -[ICAction processInput:parameters:completionHandler:](v32, "processInput:parameters:completionHandler:", v34, v33, v35);

}

- (ICScheme)scheme
{
  return (ICScheme *)objc_loadWeakRetained((id *)&self->_scheme);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scheme);
}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    v13[2](v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v40 = a4;
    v42 = v13;
    v41 = a1;
    objc_msgSend(*(id *)(a1 + 32), "formatString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v11, "keyEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[[%@]]"), v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", v25, v24, 0, 0, objc_msgSend(v16, "length"));

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAddingValuesFromQueryDictionary:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v41 + 32), "scheme");
    v28 = objc_claimAutoreleasedReturnValue();
    v38 = *(_QWORD *)(v41 + 40);
    v39 = (void *)v28;
    objc_msgSend(*(id *)(v41 + 32), "scheme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "app");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2;
    v46[3] = &unk_1E7AF7020;
    v33 = v42;
    v46[4] = *(_QWORD *)(v41 + 32);
    v47 = v33;
    v48 = *(id *)(v41 + 64);
    v43[0] = v32;
    v43[1] = 3221225472;
    v43[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_4;
    v43[3] = &unk_1E7AF7048;
    v44 = v33;
    v45 = *(id *)(v41 + 56);
    +[_ICURLRequest requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:](_ICURLRequest, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v27, v39, v38, v31, v46, v43);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(v41 + 48), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "dc_queryStringWithQueryDictionary:addingPercentEscapes:", *(_QWORD *)(v41 + 48), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSuccessURLQueryString:", v35);

    }
    if ((v40 & 1) != 0 || (objc_msgSend(*(id *)(v41 + 32), "isCallbackAction") & 1) == 0)
      objc_msgSend(v34, "setCallbackRequest:", 0);
    objc_msgSend(*(id *)(v41 + 32), "defersCompletionUntilReturn");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void (**)(_QWORD))v42;
    if (v36 || (objc_msgSend(v34, "isCallbackRequest") & 1) == 0)
      objc_msgSend(v34, "setDeferCompletionUntilReturn:", objc_msgSend(v36, "BOOLValue"));
    +[ICManager sharedManager](ICManager, "sharedManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "performRequest:", v34);

    v14 = 0;
  }

}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v20 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = a1;
  objc_msgSend(*(id *)(a1 + 32), "outputMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "destinationType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Output"));

        if (v13)
        {
          objc_msgSend(v11, "sourceKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v11, "contentItemClasses");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "array");
            v17 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "addObject:", v15);
            v8 = (void *)v17;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v20, "numberOfItems"))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3;
    v21[3] = &unk_1E7AF6FF8;
    v22 = *(id *)(v18 + 48);
    v23 = a3;
    objc_msgSend(v20, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(v18 + 48) + 16))();
  }

}

void __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __94__ICSchemeAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __28__ICSchemeAction_formatKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeAtIndex:", 1);
  return objc_msgSend(v2, "substringWithRange:", v3, v4);
}

@end
