@implementation VSAutoAuthenticationAppDocumentController

- (id)_newViewModel
{
  VSAutoAuthenticationViewModel *v3;

  v3 = objc_alloc_init(VSAutoAuthenticationViewModel);
  -[VSAutoAuthenticationViewModel setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  v13.receiver = self;
  v13.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  -[VSAppDocumentController _updateViewModel:error:](&v13, sel__updateViewModel_error_, v6, a4);
  -[VSAppDocumentController appDocument](self, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[VSAutoAuthenticationAppDocumentController _autoAuthenticationViewModelWithViewModel:](self, "_autoAuthenticationViewModelWithViewModel:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = -[VSAutoAuthenticationAppDocumentController _updateAutoAuthenticationViewModel:error:](self, "_updateAutoAuthenticationViewModel:error:", v11, &v12);
    v8 = v12;

    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v8);
LABEL_6:

  return v9;
}

- (void)autoAuthenticationViewModelDidManualSignInButton:(id)a3
{
  id v4;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The autoAuthenticationViewModel parameter must not be nil."));
  -[VSAutoAuthenticationAppDocumentController buttonLockupElement](self, "buttonLockupElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (id)_autoAuthenticationViewModelWithViewModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, viewModel was %@, instead of VSAutoAuthenticationViewModel."), v7);

  }
  return v3;
}

- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  -[VSAppDocumentController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "vs_elementType") == 162)
  {
    v8 = -[VSAutoAuthenticationAppDocumentController _updateAutoAuthenticationViewModel:withTemplate:](self, "_updateAutoAuthenticationViewModel:withTemplate:", v6, v7);
    v9 = 0;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  VSPrivateError();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a4)
LABEL_7:
    *a4 = objc_retainAutorelease(v9);
LABEL_8:

  return v8;
}

- (BOOL)_updateAutoAuthenticationViewModel:(id)a3 withTemplate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  objc_super v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  const __CFString *v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v8, CFSTR("The templateElement parameter must not be nil."));
LABEL_3:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v7;
  objc_msgSend(v7, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    v13 = *v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "vs_elementType");
        if (v16 == 138)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (void *)MEMORY[0x24BDBCE88];
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "raise:format:", v13, CFSTR("Unexpectedly, childElement was %@, instead of IKTextElement."), v23);

          }
          v24 = v15;
          objc_msgSend(v24, "text");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "string");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "elementName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "isEqualToString:", CFSTR("title")))
          {
            objc_msgSend(v5, "setMessageTitle:", v20);
          }
          else if (objc_msgSend(v26, "isEqualToString:", CFSTR("accountName")))
          {
            objc_msgSend(v5, "setAccountName:", v20);
          }
          else if (objc_msgSend(v26, "isEqualToString:", CFSTR("description")))
          {
            objc_msgSend(v5, "setMessage:", v20);
          }

        }
        else
        {
          if (v16 != 49)
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = (void *)MEMORY[0x24BDBCE88];
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "raise:format:", v13, CFSTR("Unexpectedly, childElement was %@, instead of IKImageElement."), v19);

          }
          -[VSAppDocumentController _imageItemProviderWithImageElement:](self, "_imageItemProviderWithImageElement:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setLogoProvider:", v20);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v11);
  }

  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAutoAuthenticationAppDocumentController setButtonLockupElement:](self, "setButtonLockupElement:", v28);

  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = CFSTR("title");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43.receiver = self;
  v43.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:](&v43, sel__getSupportedButtonTextsforTemplate_andElementKeys_supportedCount_, v30, v31, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = CFSTR("text");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)VSAutoAuthenticationAppDocumentController;
  -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:](&v42, sel__getSupportedButtonTextsforTemplate_andElementKeys_supportedCount_, v35, v36, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setManualSignInTitle:", v33);
  objc_msgSend(v5, "setManualSignInButtonText:", v38);

  return 1;
}

- (IKViewElement)buttonLockupElement
{
  return self->_buttonLockupElement;
}

- (void)setButtonLockupElement:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLockupElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLockupElement, 0);
}

@end
