@implementation WBSFormAutoFillParsecDomainPolicyProvider

- (WBSFormAutoFillParsecDomainPolicyProvider)initWithFeedbackAllowList:(id)a3
{
  id v5;
  WBSFormAutoFillParsecDomainPolicyProvider *v6;
  WBSFormAutoFillParsecDomainPolicyProvider *v7;
  WBSFormAutoFillParsecDomainPolicyProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillParsecDomainPolicyProvider;
  v6 = -[WBSFormAutoFillParsecDomainPolicyProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackAllowList, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setPoliciesWithJSONData:(id)a3 retrievalURLString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  WBSCrowdsourcedFeedbackAllowList *feedbackAllowList;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WBSFormAutoFillParsecDomainPolicyProvider *v15;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(v6, "copy");

  feedbackAllowList = self->_feedbackAllowList;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke;
  v12[3] = &unk_1E4B395C0;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  -[WBSCrowdsourcedFeedbackAllowList getLastAllowListRetrievalURLStringWithCompletionHandler:](feedbackAllowList, "getLastAllowListRetrievalURLStringWithCompletionHandler:", v12);

}

void __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  if ((objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    dispatch_get_global_queue(-32768, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke_2;
    block[3] = &unk_1E4B2A5F8;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = v4;
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

void __88__WBSFormAutoFillParsecDomainPolicyProvider_setPoliciesWithJSONData_retrievalURLString___block_invoke_2(_QWORD *a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a1[4], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "safari_arrayForKey:", CFSTR("tlds"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1[5] + 8), "replaceDomainAllowListWithDomains:retrievalURLString:completionHandler:", v4, a1[6], 0);

    v3 = v5;
  }

}

- (void)getLastPolicyRetrievalURLStringWithResultHandler:(id)a3
{
  id v4;
  WBSCrowdsourcedFeedbackAllowList *feedbackAllowList;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  feedbackAllowList = self->_feedbackAllowList;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke;
  v7[3] = &unk_1E4B39520;
  v8 = v4;
  v6 = v4;
  -[WBSCrowdsourcedFeedbackAllowList getLastAllowListRetrievalURLStringWithCompletionHandler:](feedbackAllowList, "getLastAllowListRetrievalURLStringWithCompletionHandler:", v7);

}

void __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __94__WBSFormAutoFillParsecDomainPolicyProvider_getLastPolicyRetrievalURLStringWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)autoFillFeedbackProcessor:(id)a3 determineWhetherToSendFeedbackForDomain:(id)a4 resultHandler:(id)a5
{
  id v7;
  WBSCrowdsourcedFeedbackAllowList *feedbackAllowList;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  feedbackAllowList = self->_feedbackAllowList;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __125__WBSFormAutoFillParsecDomainPolicyProvider_autoFillFeedbackProcessor_determineWhetherToSendFeedbackForDomain_resultHandler___block_invoke;
  v10[3] = &unk_1E4B395E8;
  v11 = v7;
  v9 = v7;
  -[WBSCrowdsourcedFeedbackAllowList getAllowListStatusForDomain:completionHandler:](feedbackAllowList, "getAllowListStatusForDomain:completionHandler:", a4, v10);

}

uint64_t __125__WBSFormAutoFillParsecDomainPolicyProvider_autoFillFeedbackProcessor_determineWhetherToSendFeedbackForDomain_resultHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2 || a2 == 2 || a2 == 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackAllowList, 0);
}

@end
