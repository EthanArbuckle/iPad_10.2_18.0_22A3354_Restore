@implementation VSCredentialEntryViewModel

- (void)_unbindField:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "vs_unbind:", CFSTR("recentsTitle"));
  objc_msgSend(v3, "vs_unbind:", CFSTR("recentsMessage"));

}

- (void)_bindField:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  VSMainConcurrencyBindingOptions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vs_bind:toObject:withKeyPath:options:", CFSTR("recentsTitle"), self, CFSTR("recentsTitle"), v5);

  VSMainConcurrencyBindingOptions();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vs_bind:toObject:withKeyPath:options:", CFSTR("recentsMessage"), self, CFSTR("recentsMessage"), v6);

}

- (NSString)linkTitle
{
  NSString *linkTitle;
  NSString *v3;
  void *v4;

  linkTitle = self->_linkTitle;
  if (linkTitle)
  {
    v3 = linkTitle;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_FOOTER_LINK"), 0, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setCredentialEntryFields:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_credentialEntryFields, a3);
  objc_msgSend(v7, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [credentialEntryFields firstObject] parameter must not be nil."));
  objc_msgSend(v7, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCredentialEntryViewModel _bindField:](self, "_bindField:", v6);

  -[VSCredentialEntryViewModel validateCredentialEntryFields](self, "validateCredentialEntryFields");
}

- (void)configureWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  objc_super v26;

  v4 = a3;
  -[VSViewModel identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = v7;
  objc_msgSend(v8, "vs_frameworkBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_MESSAGE"), 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_FOOTER"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "appendString:", CFSTR(" "));
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_FOOTER_IOS"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v16);

  -[VSViewModel setTitle:](self, "setTitle:", v9);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_BUTTON_TITLE"), 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSCuratedViewModel setBeginValidationButtonTitle:](self, "setBeginValidationButtonTitle:", v18);
  -[VSCuratedViewModel setMessage:](self, "setMessage:", v11);
  -[VSViewModel identityProvider](self, "identityProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSCuratedViewModel setIdentityProviderDisplayName:](self, "setIdentityProviderDisplayName:", v20);

  -[VSCuratedViewModel setShowFooter:](self, "setShowFooter:", objc_msgSend(v14, "length") != 0);
  -[VSCuratedViewModel setFooterText:](self, "setFooterText:", v14);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("RECENT_ACCOUNT_TITLE_FORMAT"), 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v22, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSCredentialEntryViewModel setRecentsTitle:](self, "setRecentsTitle:", v23);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("RECENT_ACCOUNT_INSTRUCTIONS"), 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSCredentialEntryViewModel setRecentsMessage:](self, "setRecentsMessage:", v25);
  v26.receiver = self;
  v26.super_class = (Class)VSCredentialEntryViewModel;
  -[VSCuratedViewModel configureWithRequest:](&v26, sel_configureWithRequest_, v4);

}

- (void)validateCredentialEntryFields
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSCredentialEntryViewModel credentialEntryFields](self, "credentialEntryFields", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isRequired"))
        {
          objc_msgSend(v9, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length") != 0;

          v7 &= v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  -[VSCuratedViewModel setBeginValidationButtonEnabled:](self, "setBeginValidationButtonEnabled:", v7 & 1);
}

- (void)buttonTappedAtIndex:(unint64_t)a3
{
  id v5;

  -[VSCredentialEntryViewModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel:buttonTappedAtIndex:", self, a3);

}

- (void)pickerDidSelectRow:(unint64_t)a3
{
  id v5;

  -[VSCredentialEntryViewModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel:pickerDidSelectRow:", self, a3);

}

- (void)clearFieldsAfterUsername
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  -[VSCredentialEntryViewModel credentialEntryFields](self, "credentialEntryFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    v5 = *MEMORY[0x24BDBCAB8];
    v6 = 1;
    do
    {
      -[VSCredentialEntryViewModel credentialEntryFields](self, "credentialEntryFields");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v5, CFSTR("The [[self credentialEntryFields] objectAtIndex:i] parameter must not be nil."));
      -[VSCredentialEntryViewModel credentialEntryFields](self, "credentialEntryFields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setText:", &stru_24FE1B848);
      ++v6;
      -[VSCredentialEntryViewModel credentialEntryFields](self, "credentialEntryFields");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v6 < v12);
  }
}

- (NSArray)credentialEntryFields
{
  return self->_credentialEntryFields;
}

- (VSCredentialEntryPicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
  objc_storeStrong((id *)&self->_picker, a3);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)recentsTitle
{
  return self->_recentsTitle;
}

- (void)setRecentsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)recentsMessage
{
  return self->_recentsMessage;
}

- (void)setRecentsMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)additionalMessage
{
  return self->_additionalMessage;
}

- (void)setAdditionalMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (VSCredentialEntryViewModelDelegate)delegate
{
  return (VSCredentialEntryViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSExpressionEvaluator)buttonExpressionEvaluator
{
  return self->_buttonExpressionEvaluator;
}

- (void)setButtonExpressionEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalMessage, 0);
  objc_storeStrong((id *)&self->_recentsMessage, 0);
  objc_storeStrong((id *)&self->_recentsTitle, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_linkTitle, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_credentialEntryFields, 0);
}

@end
