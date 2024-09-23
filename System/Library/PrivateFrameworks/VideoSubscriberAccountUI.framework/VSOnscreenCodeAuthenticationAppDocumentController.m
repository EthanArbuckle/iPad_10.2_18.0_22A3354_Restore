@implementation VSOnscreenCodeAuthenticationAppDocumentController

- (id)_onscreenCodeViewModelWithViewModel:(id)a3
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
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, viewModel was %@, instead of VSOnscreenCodeViewModel."), v7);

  }
  return v3;
}

- (BOOL)_updateOnscreenCodeViewModel:(id)a3 error:(id *)a4
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
  if (objc_msgSend(v7, "vs_elementType") == 164)
  {
    v8 = -[VSOnscreenCodeAuthenticationAppDocumentController _updateOnscreenCodeViewModel:withTemplate:](self, "_updateOnscreenCodeViewModel:withTemplate:", v6, v7);
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

- (BOOL)_updateOnscreenCodeViewModel:(id)a3 withTemplate:(id)a4
{
  id v5;
  id v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v41 = v6;
  objc_msgSend(v6, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    v12 = *v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "vs_elementType");
        if (v15 == 157)
        {
          objc_msgSend(v14, "attributes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", CFSTR("label"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 && (objc_msgSend(v19, "isEqualToString:", &stru_24FE1B848) & 1) == 0)
            objc_msgSend(v5, "setWebPageLabel:", v19);
          objc_msgSend(v14, "attributes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", CFSTR("src"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "vs_URLWithString:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
              objc_msgSend(v5, "setWebPageURL:", v28);

          }
          goto LABEL_25;
        }
        if (v15 == 138)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = (void *)MEMORY[0x24BDBCE88];
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "raise:format:", v12, CFSTR("Unexpectedly, childElement was %@, instead of IKTextElement."), v22);

          }
          v23 = v14;
          objc_msgSend(v23, "text");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "string");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "elementName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "isEqualToString:", CFSTR("onscreenCode")))
            objc_msgSend(v5, "setOnscreenCode:", v19);
LABEL_25:

          goto LABEL_26;
        }
        if (v15 != 49)
          continue;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = (void *)MEMORY[0x24BDBCE88];
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "raise:format:", v12, CFSTR("Unexpectedly, childElement was %@, instead of IKImageElement."), v18);

        }
        -[VSAppDocumentController _imageItemProviderWithImageElement:](self, "_imageItemProviderWithImageElement:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLogoProvider:", v19);
LABEL_26:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ONSCREEN_CODE_REGENERATION_BUTTON_TITLE"), 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSOnscreenCodeAuthenticationAppDocumentController setButtonLockupViewElement:](self, "setButtonLockupViewElement:", v34);

    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = CFSTR("title");
    v48[1] = CFSTR("text");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43.receiver = self;
    v43.super_class = (Class)VSOnscreenCodeAuthenticationAppDocumentController;
    -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:](&v43, sel__getSupportedButtonTextsforTemplate_andElementKeys_supportedCount_, v36, v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v39 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v39;
  }
  objc_msgSend(v5, "setButtonLockupTitle:", v30);
  objc_msgSend(v5, "setShowButtonLockup:", v32 != 0);

  return 1;
}

- (void)onscreenCodeViewModelButtonLockupPressed
{
  id v2;

  -[VSOnscreenCodeAuthenticationAppDocumentController buttonLockupViewElement](self, "buttonLockupViewElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

}

- (id)_newViewModel
{
  VSOnscreenCodeViewModel *v3;

  v3 = objc_alloc_init(VSOnscreenCodeViewModel);
  -[VSOnscreenCodeViewModel setDelegate:](v3, "setDelegate:", self);
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
  v13.super_class = (Class)VSOnscreenCodeAuthenticationAppDocumentController;
  -[VSAppDocumentController _updateViewModel:error:](&v13, sel__updateViewModel_error_, v6, a4);
  -[VSAppDocumentController appDocument](self, "appDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[VSOnscreenCodeAuthenticationAppDocumentController _onscreenCodeViewModelWithViewModel:](self, "_onscreenCodeViewModelWithViewModel:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = -[VSOnscreenCodeAuthenticationAppDocumentController _updateOnscreenCodeViewModel:error:](self, "_updateOnscreenCodeViewModel:error:", v11, &v12);
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

- (IKViewElement)buttonLockupViewElement
{
  return self->_buttonLockupViewElement;
}

- (void)setButtonLockupViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLockupViewElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLockupViewElement, 0);
}

@end
