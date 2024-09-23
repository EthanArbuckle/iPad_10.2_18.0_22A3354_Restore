@implementation SKUIExplicitRestrictionAlertController

- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIExplicitRestrictionAlertController *v14;
  SKUIExplicitRestrictionAlertController *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIExplicitRestrictionAlertController initWithClientContext:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIExplicitRestrictionAlertController;
  v14 = -[SKUIExplicitRestrictionAlertController init](&v17, sel_init);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_clientContext, a3);

  return v15;
}

- (SKUIExplicitRestrictionAlertController)initWithClientContext:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SKUIExplicitRestrictionAlertController *v17;
  SKUIExplicitRestrictionAlertController *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        -[SKUIExplicitRestrictionAlertController initWithClientContext:presentingViewController:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIExplicitRestrictionAlertController;
  v17 = -[SKUIExplicitRestrictionAlertController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientContext, a3);
    objc_storeStrong((id *)&v18->_presentingViewController, a4);
  }

  return v18;
}

- (void)presentExplicitRestrictionAlertIfNeededOfType:(int64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DAF610];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke;
  v9[3] = &unk_1E73A5B88;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "shouldDisplayExplicitRestrictionAlertOfType:completionBlock:", a3, v9);

}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  uint64_t v18;

  v5 = a3;
  if (a2)
  {
    if ((objc_msgSend(MEMORY[0x1E0DAF610], "isActiveAccountAllowedToUpdateRestrictions") & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0DAF610];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_4;
      v13[3] = &unk_1E73A5B88;
      v7 = (void *)a1[5];
      v8 = a1[4];
      v15 = a1[6];
      v13[4] = v8;
      v14 = v7;
      objc_msgSend(v6, "isRestrictionsPasscodeSet:", v13);
      v9 = v14;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_2;
      block[3] = &unk_1E73A5B18;
      v12 = (void *)a1[5];
      v11 = a1[6];
      block[4] = a1[4];
      v18 = v11;
      v17 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v9 = v17;
    }

  }
  else
  {
    v10 = a1[5];
    if (v10)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, 0);
  }

}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:inTable:", CFSTR("EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE"), CFSTR("ExplicitByDefault"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1[4] + 8);
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("OK_BUTTON"), CFSTR("ExplicitByDefault"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("OK_BUTTON"), 0, CFSTR("ExplicitByDefault"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EXPLICIT_CONTENT_DISABLED_ALERT_MESSAGE"), &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON"), &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);
  objc_msgSend(v8, "setPreferredAction:", v9);
  v10 = *(id *)(a1[4] + 16);
  if (v10
    || (v12 = *(void **)(a1[4] + 8)) != 0
    && (objc_msgSend(v12, "_applicationController"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "rootViewController"),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v10))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_3;
    v15[3] = &unk_1E73A5AF0;
    v11 = (void *)a1[5];
    v17 = a1[6];
    v16 = v11;
    objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, v15);

  }
  else
  {
    v14 = a1[5];
    if (v14)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, 0, 0);
  }

}

uint64_t __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0DAF610], "didDisplayExplicitRestrictionAlertOfType:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_4(_QWORD *a1, char a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_5;
  v5[3] = &unk_1E73A5B60;
  v3 = (void *)a1[5];
  v2 = a1[6];
  v8 = a2;
  v4 = a1[4];
  v7 = v2;
  v5[4] = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_5(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  BOOL v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  char v36;

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      v2 = CFSTR("ON_LAUNCH_ALERT_TITLE");
      v3 = CFSTR("ON_LAUNCH_ALERT_MESSAGE");
      break;
    case 1:
      v2 = CFSTR("ON_CONTAINER_LOAD_ALERT_TITLE");
      v3 = CFSTR("ON_CONTAINER_LOAD_ALERT_MESSAGE");
      break;
    case 2:
      v4 = *(_BYTE *)(a1 + 56) == 0;
      if (*(_BYTE *)(a1 + 56))
        v3 = CFSTR("ON_PLAY_PASSCODE_SET_ALERT_MESSAGE");
      else
        v3 = CFSTR("ON_PLAY_ALERT_MESSAGE");
      v5 = CFSTR("ON_PLAY_PASSCODE_SET_ALERT_TITLE");
      v6 = CFSTR("ON_PLAY_ALERT_TITLE");
      goto LABEL_21;
    case 3:
      v4 = *(_BYTE *)(a1 + 56) == 0;
      if (*(_BYTE *)(a1 + 56))
        v3 = CFSTR("ON_PURCHASE_PASSCODE_SET_ALERT_MESSAGE");
      else
        v3 = CFSTR("ON_PURCHASE_ALERT_MESSAGE");
      v5 = CFSTR("ON_PURCHASE_PASSCODE_SET_ALERT_TITLE");
      v6 = CFSTR("ON_PURCHASE_ALERT_TITLE");
      goto LABEL_21;
    case 4:
      v4 = *(_BYTE *)(a1 + 56) == 0;
      if (*(_BYTE *)(a1 + 56))
        v3 = CFSTR("ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_MESSAGE");
      else
        v3 = CFSTR("ON_ADD_TO_LIBRARY_ALERT_MESSAGE");
      v5 = CFSTR("ON_ADD_TO_LIBRARY_PASSCODE_SET_ALERT_TITLE");
      v6 = CFSTR("ON_ADD_TO_LIBRARY_ALERT_TITLE");
      goto LABEL_21;
    case 5:
      v4 = *(_BYTE *)(a1 + 56) == 0;
      if (*(_BYTE *)(a1 + 56))
        v3 = CFSTR("ON_OPEN_PASSCODE_SET_ALERT_MESSAGE");
      else
        v3 = CFSTR("ON_OPEN_ALERT_MESSAGE");
      v5 = CFSTR("ON_OPEN_PASSCODE_SET_ALERT_TITLE");
      v6 = CFSTR("ON_OPEN_ALERT_TITLE");
LABEL_21:
      if (v4)
        v2 = v6;
      else
        v2 = v5;
      break;
    default:
      v3 = 0;
      v2 = 0;
      break;
  }
  if (*(_BYTE *)(a1 + 56))
    v7 = CFSTR("RESTRICTIONS_BUTTON");
  else
    v7 = CFSTR("ALLOW_EXPLICIT_BUTTON");
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v8)
  {
    objc_msgSend(v8, "localizedStringForKey:inTable:", v2, CFSTR("ExplicitByDefault"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v10)
      objc_msgSend(v10, "localizedStringForKey:inTable:", v3, CFSTR("ExplicitByDefault"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v3, 0, CFSTR("ExplicitByDefault"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v18)
      objc_msgSend(v18, "localizedStringForKey:inTable:", v7, CFSTR("ExplicitByDefault"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v7, 0, CFSTR("ExplicitByDefault"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v19)
      objc_msgSend(v19, "localizedStringForKey:inTable:", CFSTR("NOT_NOW_BUTTON"), CFSTR("ExplicitByDefault"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("NOT_NOW_BUTTON"), 0, CFSTR("ExplicitByDefault"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v2, &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v3, &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v7, &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOT_NOW_BUTTON"), &stru_1E73A9FB0, CFSTR("ExplicitByDefault"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v13, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_6;
  v35[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  v36 = *(_BYTE *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v15, 0, v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v22);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v23);
  objc_msgSend(v20, "setPreferredAction:", v23);
  v24 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if (v24)
    goto LABEL_40;
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v26)
    goto LABEL_44;
  objc_msgSend(v26, "_applicationController");
  v27 = v15;
  v28 = v13;
  v29 = v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rootViewController");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v29;
  v13 = v28;
  v15 = v27;
  v21 = MEMORY[0x1E0C809B0];
  if (v24)
  {
LABEL_40:
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_7;
    v32[3] = &unk_1E73A5AF0;
    v25 = *(void **)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    v33 = v25;
    objc_msgSend(v24, "presentViewController:animated:completion:", v20, 1, v32);

  }
  else
  {
LABEL_44:
    v31 = *(_QWORD *)(a1 + 40);
    if (v31)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v31 + 16))(v31, 0, 0);
  }

}

void __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 32))
  {
    v1 = SKUIMobileCoreServicesFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("LSApplicationWorkspace"), v1), "defaultWorkspace");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=RESTRICTIONS"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAF610], "setAllowExplicitContent");
  }
}

uint64_t __104__SKUIExplicitRestrictionAlertController_presentExplicitRestrictionAlertIfNeededOfType_completionBlock___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0DAF610], "didDisplayExplicitRestrictionAlertOfType:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithClientContext:(uint64_t)a3 presentingViewController:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
