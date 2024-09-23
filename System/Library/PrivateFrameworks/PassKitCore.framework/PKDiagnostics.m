@implementation PKDiagnostics

+ (void)generateDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a4;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke;
  v8[3] = &unk_1E2ABDCC0;
  v10 = a3;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  PKPaymentService *v6;
  PKAsyncUnaryOperationComposer *v7;
  uint64_t v8;
  id v9;
  PKPaymentService *v10;
  id v11;
  id v12;
  id v13;
  PKPaymentService *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  PKPaymentService *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  PKPaymentService *v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", &unk_1E2C3F190, CFSTR("diagnosticsVersion"));
  if (*(_BYTE *)(a1 + 40))
  {
    +[PKDiagnostics _allPasses](PKDiagnostics, "_allPasses");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("passes"));

  }
  if (PKSecureElementIsAvailable())
  {
    +[PKDiagnostics _secureElementData](PKDiagnostics, "_secureElementData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("secureElement"));

  }
  PKCurrentRegion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("PKCurrentRegion"));

  v6 = objc_alloc_init(PKPaymentService);
  v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_27;
  v33[3] = &unk_1E2ACF778;
  v9 = v2;
  v34 = v9;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v33);
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_3;
  v30[3] = &unk_1E2AC8040;
  v10 = v6;
  v31 = v10;
  v11 = v9;
  v32 = v11;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v30);
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_5;
  v28[3] = &unk_1E2ACF778;
  v12 = v11;
  v29 = v12;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v28);
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_7;
  v25[3] = &unk_1E2AC8040;
  v26 = v10;
  v13 = v12;
  v27 = v13;
  v14 = v10;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v25);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_9;
  v23[3] = &unk_1E2ACF778;
  v15 = v13;
  v24 = v15;
  -[PKAsyncUnaryOperationComposer addOperation:](v7, "addOperation:", v23);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_12;
  v19[3] = &unk_1E2AD3AC0;
  v20 = v15;
  v22 = *(_BYTE *)(a1 + 40);
  v21 = *(id *)(a1 + 32);
  v17 = v15;
  v18 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v7, "evaluateWithInput:completion:", v16, v19);

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_2;
  v14[3] = &unk_1E2AD39D0;
  v15 = v8;
  v10 = *(id *)(a1 + 32);
  v17 = v6;
  v18 = v7;
  v16 = v10;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v9, "accountsWithCompletion:", v14);

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
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
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "accountIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("identifier"));

        }
        PKFeatureIdentifierToString(objc_msgSend(v7, "feature"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("feature"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("feature"));

        }
        PKAccountTypeToString(objc_msgSend(v7, "type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("type"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("type"));

        }
        PKAccountStateToString(objc_msgSend(v7, "state"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("state"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("state"));

        }
        objc_msgSend(v7, "accountBaseURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "absoluteString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("accountBaseURL"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("accountBaseURL"));

        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("accounts"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_4;
  v14[3] = &unk_1E2AD39F8;
  v15 = v8;
  v9 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v7;
  v16 = v10;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v9, "featureApplicationsWithCompletion:", v14);

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "applicationIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("identifier"));

        }
        PKFeatureIdentifierToString(objc_msgSend(v7, "feature"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("feature"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("feature"));

        }
        PKFeatureApplicationStateToString(objc_msgSend(v7, "applicationState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("state"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("state"));

        }
        PKFeatureApplicationStateReasonToString(objc_msgSend(v7, "applicationStateReason"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("stateReason"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("stateReason"));

        }
        if (objc_msgSend(v7, "applicationStateReason"))
          v17 = MEMORY[0x1E0C9AAB0];
        else
          v17 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("stateDirty"));
        objc_msgSend(v7, "coreIDVServiceProviderName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("coreIDVServiceProviderName"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("coreIDVServiceProviderName"));

        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("applications"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_6;
  v12[3] = &unk_1E2AD3A20;
  v9 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v7;
  v13 = v9;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "spotlightStatusWithCompletion:", v12);

}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_6(uint64_t a1, const __CFString *a2)
{
  void *v3;
  const __CFString *v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
    v4 = a2;
  else
    v4 = CFSTR("Error retrieving diagnostics");
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("spotlight"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_8;
  v12[3] = &unk_1E2AD3A48;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v13 = v9;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "generateUnderlyingKeyReportWithCompletion:", v12);

}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_8(uint64_t a1, const __CFString *a2)
{
  void *v3;
  const __CFString *v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
    v4 = a2;
  else
    v4 = CFSTR("Error retrieving diagnostics");
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("underlyingKeys"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  PKSearchService *v8;
  id v9;
  id v10;
  id v11;
  PKSearchService *v12;
  _QWORD v13[4];
  PKSearchService *v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(PKSearchService);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_10;
  v13[3] = &unk_1E2AD3A98;
  v14 = v8;
  v9 = *(id *)(a1 + 32);
  v16 = v6;
  v17 = v7;
  v15 = v9;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  -[PKSearchService transactionsMissingRegionsWithCompletion:](v12, "transactionsMissingRegionsWithCompletion:", v13);

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_11;
    v7[3] = &unk_1E2AD3A70;
    v8 = v4;
    v5 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, CFSTR("transactionsMissingRegions"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

uint64_t __70__PKDiagnostics_generateDiagnosticsPackageWithPassLibrary_completion___block_invoke_12(uint64_t a1)
{
  return +[PKDiagnostics _createDiagnosticJsonWithDictionary:hasLibrary:completion:](PKDiagnostics, "_createDiagnosticJsonWithDictionary:hasLibrary:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (void)generateZippedDiagnosticsPackageWithPassLibrary:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PKDiagnostics_generateZippedDiagnosticsPackageWithPassLibrary_completion___block_invoke;
  v7[3] = &unk_1E2AD3AE8;
  v8 = v5;
  v6 = v5;
  +[PKDiagnostics generateDiagnosticsPackageWithPassLibrary:completion:](PKDiagnostics, "generateDiagnosticsPackageWithPassLibrary:completion:", v4, v7);

}

void __76__PKDiagnostics_generateZippedDiagnosticsPackageWithPassLibrary_completion___block_invoke(uint64_t a1, NSURL *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (a2)
  {
    PKArchiverZipData(a2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("WalletDiagnostics-%f.zip"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PKLibraryDirectoryPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Logs/CrashReporter/DiagnosticLogs/Wallet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createFileAtPath:contents:attributes:", v10, v14, 0);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

+ (id)generateUbiquityDiagnosticsFile:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  BOOL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForUbiquityContainerIdentifier:", CFSTR("com.apple.shoebox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Could not resolve ubiquity container. This may be a bug.", buf, 2u);
    }

  }
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("UbiquitousCards"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v16, "hasSuffix:", CFSTR(".pkpass")))
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v17, "appendString:", CFSTR("\n-------\n\n"));
    objc_msgSend(v17, "appendFormat:", CFSTR("Passes count: %lu \n"), objc_msgSend(v10, "count"));
    objc_msgSend(v7, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendFormat:", CFSTR("Passes path: %@ \n"), v18);

    objc_msgSend(v17, "appendString:", CFSTR("\n-------\n\n"));
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__PKDiagnostics_generateUbiquityDiagnosticsFile___block_invoke;
    v25[3] = &unk_1E2AD3B10;
    v26 = v17;
    v27 = v7;
    v28 = a1;
    v29 = a3;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v25);

  }
  else
  {
    objc_msgSend(v17, "appendString:", CFSTR("No passes"));
  }
  NSTemporaryDirectory();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("wallet_ubiquity.txt"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createFileAtPath:contents:attributes:", v20, v21, 0);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __49__PKDiagnostics_generateUbiquityDiagnosticsFile___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
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
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ \n"), v4);
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "_metadataForCardAtURL:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\t %@ \n"), v8);
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("serialNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\t Serial Number: %@ \n"), v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKey:", CFSTR("passTypeIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("\t Path Type Identifier: %@ \n"), v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKey:", CFSTR("description"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("\t Description: %@ \n"), v13);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKey:", CFSTR("organizationName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendFormat:", CFSTR("\t Organization Name: %@ \n"), v15);

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKey:", CFSTR("expirationDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR("\t Expiration Date: %@ \n"), v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

+ (id)_secureElementData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t dsema;
  PKSecureElement *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  dispatch_semaphore_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc_init(PKSecureElement);
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKSecureElement secureElementIdentifiers](v18, "secureElementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v2, CFSTR("seid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKSecureElement isProductionSigned](v18, "isProductionSigned"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v3, CFSTR("prodSigned"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKSecureElement isInRestrictedMode](v18, "isInRestrictedMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v4, CFSTR("restrictedMode"));

  -[PKSecureElement primaryRegionTopic](v18, "primaryRegionTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v5, CFSTR("primaryRegionTopic"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__49;
  v31 = __Block_byref_object_dispose__49;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __35__PKDiagnostics__secureElementData__block_invoke;
  v24[3] = &unk_1E2AC35A8;
  v26 = &v27;
  dsema = v7;
  v25 = dsema;
  -[PKSecureElement allAppletsWithCompletion:](v18, "allAppletsWithCompletion:", v24);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (id)v28[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v33 = CFSTR("state");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "lifecycleState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v14, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    }
    while (v9);
  }

  objc_msgSend(v19, "setObject:forKey:", v6, CFSTR("applets"));
  _Block_object_dispose(&v27, 8);

  return v19;
}

void __35__PKDiagnostics__secureElementData__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)_allPasses
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKHomeDirectoryPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Cards"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "pathExtension", (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("pkpass"));

        if (v14)
        {
          objc_msgSend(v4, "stringByAppendingPathComponent:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("pass.json"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v18);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v2;
}

+ (id)_metadataForCardAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("pass.json"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v7, 0))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v7);
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 4, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (void)saveTransitState:(id)a3 forPaymentApplication:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKDiagnostics_saveTransitState_forPaymentApplication___block_invoke;
  block[3] = &unk_1E2ABE0F8;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void __56__PKDiagnostics_saveTransitState_forPaymentApplication___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLocale:](v5, "setLocale:", v6);

    -[NSObject setDateFormat:](v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(*(id *)(a1 + 40), "paymentNetworkIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      PKSharedCacheDirectoryPath();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("TransitState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v21);
      v12 = v21;
      v13 = v12;
      if (v11)
      {
        v20 = v12;
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate:](v5, "stringFromDate:", *(_QWORD *)(a1 + 48));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@.state"), v7, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByAppendingPathComponent:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "createFileAtPath:contents:attributes:", v18, v3, 0);
        PKLogFacilityTypeGetObject(0xCuLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Saved transit state to %@", buf, 0xCu);
        }

        v13 = v20;
      }

    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Unable to archive transit state. Error %@", buf, 0xCu);
    }
  }

}

+ (void)_createDiagnosticJsonWithDictionary:(id)a3 hasLibrary:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  uint64_t v12;
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
  int v26;
  NSURL *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v5 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = (void (**)(id, void *))a5;
  v10 = a3;
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("WalletDiagnostics-%f"), v12);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("diagnostics.json"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createFileAtPath:contents:attributes:", v18, v16, 0);

  if (v5)
  {
    PKHomeDirectoryPath();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("passes23.sqlite"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("passes.sqlite"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "copyItemAtPath:toPath:error:", v20, v22, 0);

  }
  PKPayLaterFinancingPlanUpdatesDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "fileExistsAtPath:", v24);

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
    v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
    PKArchiverZipData(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("PayLaterPlanUpdates.zip"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createFileAtPath:contents:attributes:", v29, v28, 0);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v31);

}

@end
