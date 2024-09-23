@implementation POAnalytics

+ (void)analyticsForLoginConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __46__POAnalytics_analyticsForLoginConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  _QWORD v33[11];
  _QWORD v34[13];

  v34[11] = *MEMORY[0x24BDAC8D0];
  v33[0] = CFSTR("hasInvalidCredentialPredicate");
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "invalidCredentialPredicate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v32, "length") != 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v31;
  v33[1] = CFSTR("includePreviousRefreshTokenInLoginRequest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "includePreviousRefreshTokenInLoginRequest"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v30;
  v33[2] = CFSTR("kerberosTicketMappingsCount");
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "kerberosTicketMappings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v28;
  v33[3] = CFSTR("hasCustomNonceRequestValues");
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customNonceRequestValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v27, "count") != 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v26;
  v33[4] = CFSTR("hasCustomAssertionRequestHeaderClaims");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customAssertionRequestHeaderClaims");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v25, "count") != 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v24;
  v33[5] = CFSTR("hasCustomAssertionRequestBodyClaims");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customAssertionRequestBodyClaims");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v23, "count") != 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v22;
  v33[6] = CFSTR("hasCustomLoginRequestHeaderClaims");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customLoginRequestHeaderClaims");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v21, "count") != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v8;
  v33[7] = CFSTR("hasCustomLoginRequestBodyClaims");
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customLoginRequestBodyClaims");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "count") != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v11;
  v33[8] = CFSTR("hasCustomRefreshRequestHeaderClaims");
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customRefreshRequestHeaderClaims");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "count") != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v14;
  v33[9] = CFSTR("hasCustomRefreshRequestBodyClaims");
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 32), "customRefreshRequestBodyClaims");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "count") != 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v17;
  v33[10] = CFSTR("federationType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "federationType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (void)analyticsForLoginType:(id)a3 result:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  AnalyticsSendEventLazy();

}

id __44__POAnalytics_analyticsForLoginType_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("result");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)analyticsForPasswordChange:(BOOL)a3 credentialNeeded:(BOOL)a4 result:(BOOL)a5
{
  AnalyticsSendEventLazy();
}

id __66__POAnalytics_analyticsForPasswordChange_credentialNeeded_result___block_invoke(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("shouldChangePassword");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("credentialNeeded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[33]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1[34]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)analyticsForRegistrationType:(id)a3 options:(int64_t)a4 result:(int64_t)a5
{
  id v5;
  id v6;

  v6 = a3;
  v5 = v6;
  AnalyticsSendEventLazy();

}

id __59__POAnalytics_analyticsForRegistrationType_options_result___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v2 = a1[5];
  v8[0] = a1[4];
  v7[0] = CFSTR("type");
  v7[1] = CFSTR("options");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)analyticsForLoginManager:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __40__POAnalytics_analyticsForLoginManager___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)analyticsForTestMessages
{
  AnalyticsSendEventLazy();
}

void *__39__POAnalytics_analyticsForTestMessages__block_invoke()
{
  return &unk_251521130;
}

+ (void)analyticsForStatus
{
  AnalyticsSendEventLazy();
}

void *__33__POAnalytics_analyticsForStatus__block_invoke()
{
  return &unk_251521158;
}

@end
