@implementation WBUFormAutoFillPrompt

+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 makeFirstButtonSuggestedAction:(BOOL)a8 completionHandler:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  objc_msgSend(a1, "showAutoFillPromptInWebView:title:message:cancelButtonTitle:otherButtonTitles:cancelWhenAppEntersBackground:makeFirstButtonSuggestedAction:headerViewController:completionHandler:", a3, a4, a5, a6, a7, 0, v9, 0, a9);
}

+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 cancelWhenAppEntersBackground:(BOOL)a8 makeFirstButtonSuggestedAction:(BOOL)a9 headerViewController:(id)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  BOOL v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  BOOL v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  BOOL v55;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v22 = a11;
  v23 = v22;
  if (isShowingAlertController == 1)
  {
    if (v22)
      (*((void (**)(id, uint64_t))v22 + 2))(v22, -1);
  }
  else
  {
    v38 = a8;
    v39 = v19;
    objc_msgSend(v16, "webui_preventNavigationDuringAutoFillPrompt");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "webui_presentingViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "modalPresentationStyle") == 7)
      objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 0, 0);
    v40 = v18;
    v41 = v17;
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v21)
      objc_msgSend(v26, "setContentViewController:", v21);
    v28 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke;
    v49[3] = &unk_24CB8D440;
    v29 = v23;
    v53 = v29;
    v30 = v24;
    v54 = v30;
    v31 = v27;
    v50 = v31;
    v55 = a9;
    v51 = v21;
    v52 = v20;
    objc_msgSend(v52, "enumerateObjectsUsingBlock:", v49);
    v32 = (void *)MEMORY[0x24BDF67E8];
    v46[0] = v28;
    v46[1] = 3221225472;
    v46[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_3;
    v46[3] = &unk_24CB8D468;
    v47 = v29;
    v48 = v30;
    v33 = v30;
    v34 = v32;
    v19 = v39;
    objc_msgSend(v34, "actionWithTitle:style:handler:", v39, 1, v46);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAction:", v35);
    isShowingAlertController = 1;
    v42[0] = v28;
    v42[1] = 3221225472;
    v42[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_4;
    v42[3] = &unk_24CB8D4B8;
    v45 = v38;
    v43 = v31;
    v44 = v35;
    v36 = v35;
    v37 = v31;
    objc_msgSend(v25, "presentViewController:animated:completion:", v37, 1, v42);

    v18 = v40;
    v17 = v41;
  }

}

void __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v6 = (void *)MEMORY[0x24BDF67E8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_2;
  v8[3] = &unk_24CB8D418;
  v9 = *(id *)(a1 + 56);
  v11 = a3;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v6, "actionWithTitle:style:handler:", a2, 0, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addAction:", v7);
  if (!a3 && *(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setPreferredAction:", v7);
  if (*(_QWORD *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 48), "count") - 2 == a3)
    objc_msgSend(*(id *)(a1 + 32), "_addSectionDelimiter");

}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  isShowingAlertController = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", appWillEnterBackgroundObserver);

  v3 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = 0;

  v4 = a1[4];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, a1[6]);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  isShowingAlertController = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", appWillEnterBackgroundObserver);

  v3 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = 0;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, -1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF7528];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_5;
  v7[3] = &unk_24CB8D490;
  v10 = *(_BYTE *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, v4, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = v5;

}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_5(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_dismissWithAction:", *(_QWORD *)(result + 40));
  return result;
}

- (void)showAutoFillPromptForUsernameInWebView:(id)a3 title:(id)a4 message:(id)a5 suggestedUsername:(id)a6 password:(id)a7 isGeneratedPassword:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void (**v29)(id, _QWORD);
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  void (**v47)(id, _QWORD);
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  WBUFormAutoFillPrompt *v56;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = (void (**)(id, _QWORD))a9;
  if ((isShowingAlertController & 1) != 0 || !objc_msgSend(v19, "length"))
  {
    if (v20)
      v20[2](v20, 0);
  }
  else
  {
    objc_msgSend(v15, "webui_presentingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "modalPresentationStyle") == 7)
      objc_msgSend(v21, "dismissViewControllerAnimated:completion:", 0, 0);
    v43 = v17;
    v44 = v16;
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v16, v17, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_alertController, v22);
    v23 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke;
    v54[3] = &unk_24CB8D4E0;
    v42 = v18;
    v38 = v18;
    v55 = v38;
    v56 = self;
    objc_msgSend(v22, "addTextFieldWithConfigurationHandler:", v54);
    v52[0] = v23;
    v52[1] = 3221225472;
    v52[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_2;
    v52[3] = &unk_24CB8D508;
    v40 = v19;
    v53 = v19;
    objc_msgSend(v22, "addTextFieldWithConfigurationHandler:", v52);
    objc_msgSend(v15, "webui_preventNavigationDuringAutoFillPrompt");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v21;
    if (v9)
    {
      _WBSLocalizedString();
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = 2;
      v25 = (void *)v26;
    }
    else
    {
      v27 = 1;
    }
    v28 = (void *)MEMORY[0x24BDF67E8];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_3;
    v49[3] = &unk_24CB8D468;
    v29 = v20;
    v50 = v29;
    v30 = v24;
    v51 = v30;
    v39 = v25;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v25, v27, v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v31);

    v32 = (void *)MEMORY[0x24BDF67E8];
    _WBSLocalizedString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_4;
    v45[3] = &unk_24CB8D530;
    v45[4] = self;
    v34 = v38;
    v46 = v34;
    v47 = v29;
    v48 = v30;
    v35 = v30;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v45);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addAction:", v36);
    objc_msgSend(v22, "setPreferredAction:", v36);
    objc_msgSend(v36, "setEnabled:", objc_msgSend(v34, "length") != 0);
    isShowingAlertController = 1;
    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "didPresentUsernamePrompt");

    objc_msgSend(v41, "presentViewController:animated:completion:", v22, 1, 0);
    v16 = v44;
    v18 = v42;
    v17 = v43;
    v19 = v40;
  }

}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "setText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setKeyboardType:", 7);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__alertTextFieldDidChange_, 0x20000);

}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "substringToIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(*(id *)(a1 + 32), "length"), CFSTR("•"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v7);

}

uint64_t __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  isShowingAlertController = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  isShowingAlertController = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didSuggestUsernameInPromptAndUserKeptSuggestion:", objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)));

  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)_alertTextFieldDidChange:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  objc_msgSend(WeakRetained, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length") != 0;
  objc_msgSend(WeakRetained, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
}

@end
