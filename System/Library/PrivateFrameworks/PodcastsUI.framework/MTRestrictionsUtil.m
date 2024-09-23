@implementation MTRestrictionsUtil

+ (void)presentExplicitRestrictionAlertIfNeededOfType:(int)a3 actionCompletion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke;
  v8[3] = &unk_1EA0C6108;
  v10 = v4;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "shouldDisplayExplicitRestrictionAlertOfType:completionBlock:", v4, v8);

}

void __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;
  int v4;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke_2;
    v2[3] = &unk_1EA0C60E0;
    v4 = *(_DWORD *)(a1 + 40);
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v2);

  }
}

void __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  int v23;

  v2 = *(_DWORD *)(a1 + 40);
  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("RESTRICTIONS_ON_PURCHASE");
  }
  else
  {
    if (v2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("RESTRICTIONS_ON_PLAY");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA0D7620, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RESTRICTIONS_MESSAGE"), &stru_1EA0D7620, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA0D7620, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke_3;
  v21 = &unk_1EA0C60B8;
  v22 = *(id *)(a1 + 32);
  v23 = *(_DWORD *)(a1 + 40);
  objc_msgSend(v12, "actionWithTitle:style:handler:", v10, 0, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v13, v18, v19, v20, v21);
  objc_msgSend(v11, "setPreferredAction:", v13);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rootViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __85__MTRestrictionsUtil_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

+ (void)shouldDisplayExplicitRestrictionAlertOfType:(int)a3 completionBlock:(id)a4
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(MEMORY[0x1E0D7F288], "isExplicitContentAllowed"))
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F200], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BOOLForKey:", CFSTR("ExplicitOffAndPreferencesDisabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__MTRestrictionsUtil_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke;
    v7[3] = &unk_1EA0C6130;
    v8 = v4;
    objc_msgSend(v6, "valueWithCompletion:", v7);

  }
}

uint64_t __82__MTRestrictionsUtil_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "BOOLValue") ^ 1);
}

@end
