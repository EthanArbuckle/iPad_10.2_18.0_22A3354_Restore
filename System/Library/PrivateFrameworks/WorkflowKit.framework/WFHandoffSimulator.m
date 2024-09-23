@implementation WFHandoffSimulator

+ (void)registerHandoffURLRequestHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  +[ICManager sharedManager](ICManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke;
  v9[3] = &unk_1E7AF6618;
  v10 = v5;
  v11 = a1;
  v7 = v5;
  objc_msgSend(v6, "registerHandler:forIncomingRequestsWithAction:scheme:", v9, CFSTR("continue-user-activity"), 0);

}

+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
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
  void *v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12 || !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInfo && handoffSource"));

  }
  v16 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB3418]);
  if (!v13 || !v16)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("type"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    if (v12)
    {
      objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v20;
      if (!v20)
      {
LABEL_12:

        goto LABEL_13;
      }
      v21 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(v20, "absoluteString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "queryItemWithName:value:", CFSTR("userInfoURL"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v23);

    }
    if (v13)
    {
      v24 = (void *)MEMORY[0x1E0CB39D8];
      objc_msgSend(v13, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "queryItemWithName:value:", CFSTR("webpageURL"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v26);

    }
    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setScheme:", *MEMORY[0x1E0D14340]);
    objc_msgSend(v27, "setHost:", CFSTR("continue-user-activity"));
    objc_msgSend(v27, "setQueryItems:", v18);
    objc_msgSend(v27, "URL");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v17 = v13;
LABEL_13:

  return v17;
}

+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state && handoffSource"));

  }
  v10 = *MEMORY[0x1E0D14248];
  v15[0] = *MEMORY[0x1E0D14258];
  v15[1] = v10;
  v16[0] = v7;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:", *MEMORY[0x1E0D14240], v11, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)temporaryFileURLBySerializingUserInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D140A0], "proposedSharedTemporaryFileURLForFilename:", CFSTR("URLHandoffUserInfo.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v16);
    v9 = v16;

  }
  v15 = v9;
  v11 = objc_msgSend(v3, "writeToURL:options:error:", v4, 0, &v15);
  v12 = v15;

  v13 = 0;
  if (v11)
    v13 = v4;

  return v13;
}

+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v22, "isFileURL")
    && (objc_msgSend(MEMORY[0x1E0D140A0], "sharedAppGroupDirectoryURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v22, "wf_isContainedByDirectoryAtURL:", v6),
        v6,
        (v7 & 1) != 0))
  {
    v8 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC5A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileWithURL:options:ofType:", v22, 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "addObject:", objc_opt_class());
    objc_msgSend(v18, "addObject:", objc_opt_class());
    v19 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(v10, "mappedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v20, v18, v5);

  }
  else
  {
    v5[2](v5, 0);
  }

}

+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D14248];
  v18[0] = *MEMORY[0x1E0D14258];
  v18[1] = v8;
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CA5920]);
    v12 = (void *)objc_msgSend(v11, "initWithActivityType:", *MEMORY[0x1E0D14240]);
    v16 = CFSTR("userInfoURL");
    objc_msgSend(v10, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInfo:", v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, void *, id);
  _QWORD v23[4];
  id v24;
  void (**v25)(id, void *, id);

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D14248]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x1E0DC8458];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D14258]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D14250]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
  {
    v7[2](v7, v12, v11);
  }
  else if (v13)
  {
    v15 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke;
    v23[3] = &unk_1E7AEC768;
    v25 = v7;
    v24 = v11;
    v17 = (id)objc_msgSend(v15, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v14, v16, v23);

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "objectForKey:", CFSTR("userInfoURL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke_2;
    v21[3] = &unk_1E7AEC790;
    v22 = v7;
    objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:", v20, v21);

  }
}

uint64_t __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __94__WFHandoffSimulator_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = *MEMORY[0x1E0D14248];
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E0DC8458];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D14258]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("webpageURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "objectForKey:", CFSTR("userInfoURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke_2;
  v13[3] = &unk_1E7AEC740;
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v15 = v5;
  v16 = v10;
  v14 = v4;
  v11 = v5;
  v12 = v4;
  objc_msgSend(v9, "deserializeUserInfoAtURL:completionHandler:", v8, v13);

}

uint64_t __55__WFHandoffSimulator_registerHandoffURLRequestHandler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

@end
