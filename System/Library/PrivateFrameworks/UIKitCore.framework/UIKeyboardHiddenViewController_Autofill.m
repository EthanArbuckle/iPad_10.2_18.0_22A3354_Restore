@implementation UIKeyboardHiddenViewController_Autofill

- (void)setAutofillVC:(id)a3
{
  _SFPasswordViewController **p_autofillVC;
  id v6;

  p_autofillVC = &self->super._autofillVC;
  objc_storeStrong((id *)&self->super._autofillVC, a3);
  v6 = a3;
  -[_SFPasswordViewController setDelegate:](*p_autofillVC, "setDelegate:", self);

}

- (void)presentViewController:(BOOL)a3
{
  UIKeyboardHiddenViewController_Autofill *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
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
  uint64_t v32;
  UIKeyboardHiddenViewController_Autofill *v33;
  uint64_t v34;
  id v35;
  void *v36;
  UIKeyboardHiddenViewController_Autofill *v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  UIKeyboardHiddenViewController_Autofill *v41;
  BOOL v42;

  v4 = self;
  -[UIKeyboardHiddenViewController autofillVC](self, "autofillVC");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[UIKeyboardHiddenViewController autofillVC](v4, "autofillVC"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        get_SFAppAutoFillPasswordViewControllerClass(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    -[UIKeyboardHiddenViewController autofillVC](v4, "autofillVC");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_autofillContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("_WebViewURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWebViewURL:", v12);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_remoteAppId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRemoteAppID:", v14);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_remoteLocalizedAppName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRemoteLocalizedAppName:", v16);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_remoteUnlocalizedAppName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setRemoteUnlocalizedAppName:", v18);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_remoteAssociatedDomains");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:", v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v38 = a3;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_autofillContext");
    v37 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("_credential_type"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_autofillContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("_page_id"));
    v36 = v16;
    v26 = v12;
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_autofillContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("_frame_id"));
    v30 = v14;
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = v38;
    v4 = v37;
    objc_msgSend(v9, "setPageID:frameID:credentialType:", v27, v31, v23);

    v14 = v30;
    v12 = v26;
    v16 = v36;

  }
  v32 = -[UIKeyboardHiddenViewController shouldPresentAsPopover](v4, "shouldPresentAsPopover", v36);
  v33 = v4;
  v34 = v32;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke;
  v39[3] = &unk_1E16B7110;
  v40 = v9;
  v41 = v33;
  v42 = a3;
  v35 = v9;
  objc_msgSend(v35, "authenticateToPresentInPopover:completion:", v34, v39);

}

- (BOOL)isValidedString:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (qword_1ECD7F2E8 != -1)
  {
    dispatch_once(&qword_1ECD7F2E8, &__block_literal_global_389);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", _MergedGlobals_1158) == 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v5;
}

- (id)customInfoFromCredential:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardHiddenViewController_Autofill isValidedString:](self, "isValidedString:", v5))
  {
    objc_msgSend(v4, "user");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E16EDF20;
  }

  objc_msgSend(v4, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardHiddenViewController_Autofill isValidedString:](self, "isValidedString:", v7))
  {
    objc_msgSend(v4, "password");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E16EDF20;
  }

  v9 = *MEMORY[0x1E0DBE350];
  v12[0] = *MEMORY[0x1E0DBE370];
  v12[1] = v9;
  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  void *v4;
  id v5;

  -[UIKeyboardHiddenViewController_Autofill customInfoFromCredential:](self, "customInfoFromCredential:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processPayloadInfo:", v5);

}

@end
