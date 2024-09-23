@implementation VSCredentialEntryAppDocumentController

- (void)_startObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialEntryAppDocumentController;
  -[VSAppDocumentController _startObservingViewModel:](&v15, sel__startObservingViewModel_, v4);
  -[VSCredentialEntryAppDocumentController _credentialEntryViewModelWithViewModel:](self, "_credentialEntryViewModelWithViewModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "credentialEntryFields", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "addObserver:forKeyPath:options:context:", self, CFSTR("text"), 3, kVSKeyValueObservingContext_CredentialEntryFieldText);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)_stopObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialEntryAppDocumentController;
  -[VSAppDocumentController _stopObservingViewModel:](&v15, sel__stopObservingViewModel_, v4);
  -[VSCredentialEntryAppDocumentController _credentialEntryViewModelWithViewModel:](self, "_credentialEntryViewModelWithViewModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "credentialEntryFields", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "removeObserver:forKeyPath:context:", self, CFSTR("text"), kVSKeyValueObservingContext_CredentialEntryFieldText);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (id)_newViewModel
{
  VSCredentialEntryViewModel *v3;

  v3 = objc_alloc_init(VSCredentialEntryViewModel);
  -[VSCredentialEntryViewModel setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  v13.receiver = self;
  v13.super_class = (Class)VSCredentialEntryAppDocumentController;
  -[VSAppDocumentController _updateViewModel:error:](&v13, sel__updateViewModel_error_, v6, a4);
  -[VSCredentialEntryAppDocumentController _credentialEntryViewModelWithViewModel:](self, "_credentialEntryViewModelWithViewModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAppDocumentController appDocument](self, "appDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = 0;
    v10 = -[VSCredentialEntryAppDocumentController _updateCredentialEntryViewModel:error:](self, "_updateCredentialEntryViewModel:error:", v7, &v12);
    v9 = v12;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v9);
LABEL_6:

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[16];

  v10 = a4;
  if ((void *)kVSKeyValueObservingContext_CredentialEntryFieldText == a6)
  {
    v12 = a5;
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "Text field text did change.", buf, 2u);
    }

    v11 = v10;
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "associatedTextFieldElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v16, OS_LOG_TYPE_DEFAULT, "Will update keyboard text.", buf, 2u);
    }

    objc_msgSend(v15, "keyboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v14);

    VSDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v18, OS_LOG_TYPE_DEFAULT, "Did update keyboard text.", buf, 2u);
    }

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VSCredentialEntryAppDocumentController;
    v11 = a5;
    -[VSAppDocumentController observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, v11, a6);
  }

}

- (id)_credentialEntryViewModelWithViewModel:(id)a3
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
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, viewModel was %@, instead of VSCredentialEntryViewModel."), v7);

  }
  return v3;
}

- (BOOL)_updateCredentialEntryViewModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
  -[VSAppDocumentController templateElement](self, "templateElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "vs_elementType") == 161)
  {
    v11 = 0;
    v8 = -[VSCredentialEntryAppDocumentController _updateCredentialEntryViewModel:withTemplate:error:](self, "_updateCredentialEntryViewModel:withTemplate:error:", v6, v7, &v11);
    v9 = v11;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  VSPrivateError();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a4)
LABEL_7:
    *a4 = objc_retainAutorelease(v9);
LABEL_8:

  return v8;
}

- (BOOL)_updateCredentialEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VSCredentialEntryAppDocumentController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  VSITMLCredentialEntryField *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  VSCredentialEntryPickerItem *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  VSCredentialEntryPicker *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  objc_class *v92;
  void *v93;
  uint64_t v94;
  VSCredentialEntryAppDocumentController *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  uint64_t v103;
  VSCredentialEntryButton *v104;
  void *v105;
  id *v107;
  void *v108;
  void *v109;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  id obj;
  id obja;
  id v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  objc_super v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t buf;
  _BYTE v131[15];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _QWORD v141[2];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t *)MEMORY[0x24BDBCAB8];
  v115 = v7;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v89 = v8;
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The viewModel parameter must not be nil."));
    v8 = v89;
    if (v89)
      goto LABEL_3;
  }
  v90 = v8;
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v9, CFSTR("The templateElement parameter must not be nil."));
  v8 = v90;
LABEL_3:
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v108 = v8;
  objc_msgSend(v8, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v136, v144, 16);
  v107 = a5;
  if (v11)
  {
    v12 = v11;
    v112 = 0;
    v13 = *(_QWORD *)v137;
    v116 = *v9;
    v14 = self;
    v109 = v10;
    v111 = *(_QWORD *)v137;
    while (1)
    {
      v15 = 0;
      v113 = v12;
      do
      {
        if (*(_QWORD *)v137 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v15);
        v17 = objc_msgSend(v16, "vs_elementType");
        if (v17 <= 156)
        {
          if (v17 == 49)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v58 = v15;
              v59 = (void *)MEMORY[0x24BDBCE88];
              v60 = (objc_class *)objc_opt_class();
              NSStringFromClass(v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v59;
              v15 = v58;
              objc_msgSend(v62, "raise:format:", v116, CFSTR("Unexpectedly, childElement was %@, instead of IKImageElement."), v61);

            }
            -[VSAppDocumentController _imageItemProviderWithImageElement:](v14, "_imageItemProviderWithImageElement:", v16);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "setLogoProvider:", v38);
          }
          else
          {
            if (v17 != 138)
              goto LABEL_74;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v40 = v15;
              v41 = (void *)MEMORY[0x24BDBCE88];
              v42 = (objc_class *)objc_opt_class();
              NSStringFromClass(v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v41;
              v15 = v40;
              objc_msgSend(v44, "raise:format:", v116, CFSTR("Unexpectedly, childElement was %@, instead of IKTextElement."), v43);

            }
            v38 = v16;
            objc_msgSend(v38, "elementName");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v45, "isEqual:", CFSTR("description")))
            {
              objc_msgSend(v38, "text");
              v46 = v38;
              v47 = v15;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "string");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = v47;
              v38 = v46;
              objc_msgSend(v115, "setAdditionalMessage:", v49);

            }
          }
        }
        else if (v17 == 157)
        {
          v50 = v15;
          objc_msgSend(v16, "attributes");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKey:", CFSTR("label"));
          v52 = objc_claimAutoreleasedReturnValue();

          v53 = (void *)v52;
          objc_msgSend(v115, "setLinkTitle:", v52);
          objc_msgSend(v16, "attributes");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKey:", CFSTR("src"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
              objc_msgSend(v115, "setLinkURL:", v56);

          }
          v15 = v50;
          v38 = v53;
        }
        else
        {
          v114 = v15;
          if (v17 != 158)
          {
            if (v17 == 160)
            {
              objc_msgSend(v115, "credentialEntryFields");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18)
              {
                v119 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v16, "vs_itemElementsOfType:", 140);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v135 = 0u;
                obj = v19;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
                if (!v20)
                  goto LABEL_35;
                v21 = v20;
                v22 = *(_QWORD *)v133;
                while (1)
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v133 != v22)
                      objc_enumerationMutation(obj);
                    v24 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
                    objc_msgSend(v24, "attributes");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "objectForKey:", CFSTR("label"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v26, "length"))
                    {
                      if (!v26)
                        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v116, CFSTR("The fieldTitleOrNil parameter must not be nil."));
                      v27 = v26;
                      v28 = objc_alloc_init(VSITMLCredentialEntryField);
                      objc_msgSend(v24, "attributes");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "objectForKey:", CFSTR("required"));
                      v30 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v30)
                        -[VSCredentialEntryField setRequired:](v28, "setRequired:", 1);

                      -[VSITMLCredentialEntryField setAssociatedTextFieldElement:](v28, "setAssociatedTextFieldElement:", v24);
                      -[VSCredentialEntryField setTitle:](v28, "setTitle:", v27);
                      objc_msgSend(v24, "text");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "string");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      -[VSCredentialEntryField setPlaceholder:](v28, "setPlaceholder:", v32);
                      objc_msgSend(v24, "attributes");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "objectForKey:", CFSTR("type"));
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_msgSend(v34, "isEqualToString:", CFSTR("emailAddress")) & 1) != 0)
                      {
                        v35 = 7;
                        goto LABEL_29;
                      }
                      if (objc_msgSend(v34, "isEqualToString:", CFSTR("numberPad")))
                      {
                        v35 = 4;
LABEL_29:
                        -[VSCredentialEntryField setKeyboardType:](v28, "setKeyboardType:", v35);
                      }
                      objc_msgSend(v24, "attributes");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "objectForKey:", CFSTR("secure"));
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v37)
                      {
                        -[VSCredentialEntryField setSecure:](v28, "setSecure:", 1);
                        -[VSCredentialEntryField setKeyboardType:](v28, "setKeyboardType:", 1);
                        -[VSCredentialEntryField setAutocapitalizationType:](v28, "setAutocapitalizationType:", 0);
                      }
                      -[VSCredentialEntryField setAutocorrectionType:](v28, "setAutocorrectionType:", 1);
                      objc_msgSend(v119, "addObject:", v28);

                      goto LABEL_33;
                    }
                    VSErrorLogObject();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      -[VSCredentialEntryAppDocumentController _updateCredentialEntryViewModel:withTemplate:error:].cold.1(&buf, v131, v27);
LABEL_33:

                  }
                  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
                  if (!v21)
                  {
LABEL_35:
                    v38 = v119;
                    if (objc_msgSend(v119, "count"))
                    {
                      v39 = (void *)objc_msgSend(v119, "copy");
                      objc_msgSend(v115, "setCredentialEntryFields:", v39);

                      v112 += objc_msgSend(v119, "count");
                    }
                    v10 = v109;
                    v14 = self;
                    v13 = v111;
                    v12 = v113;
                    v15 = v114;

                    goto LABEL_73;
                  }
                }
              }
            }
LABEL_51:
            v15 = v114;
            goto LABEL_74;
          }
          -[VSCredentialEntryAppDocumentController pickerElement](v14, "pickerElement");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
            goto LABEL_51;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v63 = (void *)MEMORY[0x24BDBCE88];
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "raise:format:", v116, CFSTR("Unexpectedly, childElement was %@, instead of VSIKItemGroupElement."), v65);

          }
          v66 = v16;
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "attributes");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectForKey:", CFSTR("title"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v120 = v66;
          if (v69)
          {
            obja = v69;
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            objc_msgSend(v66, "children");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v127;
              do
              {
                for (j = 0; j != v72; ++j)
                {
                  if (*(_QWORD *)v127 != v73)
                    objc_enumerationMutation(v70);
                  v75 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                  v76 = objc_alloc_init(VSCredentialEntryPickerItem);
                  objc_msgSend(v75, "text");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "string");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VSCredentialEntryPickerItem setItemName:](v76, "setItemName:", v78);

                  objc_msgSend(v75, "attributes");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "objectForKey:", CFSTR("value"));
                  v80 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v80)
                  {
                    -[VSCredentialEntryPickerItem setItemValue:](v76, "setItemValue:", v80);
                    objc_msgSend(v75, "elementID");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    -[VSCredentialEntryPickerItem setItemId:](v76, "setItemId:", v81);

                    objc_msgSend(v67, "addObject:", v76);
                  }

                }
                v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v126, v142, 16);
              }
              while (v72);
            }

            v82 = objc_msgSend(v120, "vs_selectedChildElementIndex");
            if (objc_msgSend(v67, "count"))
            {
              v83 = objc_alloc_init(VSCredentialEntryPicker);
              v84 = obja;
              -[VSCredentialEntryPicker setTitle:](v83, "setTitle:", obja);
              -[VSCredentialEntryPicker setPickerItems:](v83, "setPickerItems:", v67);
              -[VSCredentialEntryPicker setSelectedIndex:](v83, "setSelectedIndex:", v82);
              v14 = self;
              -[VSCredentialEntryAppDocumentController setPickerElement:](self, "setPickerElement:", v120);
              -[VSCredentialEntryAppDocumentController pickerElement](self, "pickerElement");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "itemGroup");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "setSelectedItemIndex:", v82);

              -[VSCredentialEntryAppDocumentController pickerElement](self, "pickerElement");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "itemGroup");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setDelegate:", self);

              objc_msgSend(v115, "setPicker:", v83);
              ++v112;

              v10 = v109;
              v15 = v114;
            }
            else
            {
              v10 = v109;
              v14 = self;
              v15 = v114;
              v84 = obja;
            }

          }
          else
          {
            v15 = v114;
          }

          v13 = v111;
          v12 = v113;
          v38 = v120;
        }
LABEL_73:

LABEL_74:
        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v136, v144, 16);
      if (!v12)
        goto LABEL_80;
    }
  }
  v112 = 0;
  v14 = self;
LABEL_80:

  v91 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v92 = (objc_class *)objc_opt_class();
  NSStringFromClass(v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = CFSTR("title");
  v141[1] = CFSTR("text");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 2);
  v94 = objc_claimAutoreleasedReturnValue();
  v95 = v14;
  v96 = (void *)v94;
  v125.receiver = v95;
  v125.super_class = (Class)VSCredentialEntryAppDocumentController;
  -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:](&v125, sel__getSupportedButtonTextsforTemplate_andElementKeys_supportedCount_, v93, v94, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v98 = v97;
  v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v122;
    do
    {
      for (k = 0; k != v100; ++k)
      {
        if (*(_QWORD *)v122 != v101)
          objc_enumerationMutation(v98);
        v103 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * k);
        v104 = objc_alloc_init(VSCredentialEntryButton);
        -[VSCredentialEntryButton setTitle:](v104, "setTitle:", v103);
        -[VSCredentialEntryButton setOwningViewModel:](v104, "setOwningViewModel:", v115);
        objc_msgSend(v91, "addObject:", v104);

      }
      v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
    }
    while (v100);
  }

  objc_msgSend(v115, "setButtons:", v91);
  if (v112)
  {
    v105 = 0;
  }
  else
  {
    VSPrivateError();
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v107)
    *v107 = objc_retainAutorelease(v105);

  return v105 == 0;
}

- (void)itemGroup:(id)a3 selectedItemIndexDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  -[VSAppDocumentController viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self viewModel] parameter must not be nil."));
  -[VSAppDocumentController viewModel](self, "viewModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, genericViewModel was %@, instead of VSCredentialEntryViewModel."), v10);

  }
  objc_msgSend(v12, "picker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedIndex:", a4);

}

- (void)viewModel:(id)a3 buttonTappedAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self filteredButtonLockupElements] parameter must not be nil."));
  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);
}

- (void)viewModel:(id)a3 pickerDidSelectRow:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[VSCredentialEntryAppDocumentController pickerElement](self, "pickerElement", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[self pickerElement] children] parameter must not be nil."));
  -[VSCredentialEntryAppDocumentController pickerElement](self, "pickerElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[VSCredentialEntryAppDocumentController pickerElement](self, "pickerElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedItemIndex:", a4);

  objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);
}

- (VSIKItemGroupElement)pickerElement
{
  return self->_pickerElement;
}

- (void)setPickerElement:(id)a3
{
  objc_storeStrong((id *)&self->_pickerElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerElement, 0);
}

- (void)_updateCredentialEntryViewModel:(uint8_t *)buf withTemplate:(_BYTE *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "Ignoring text element with empty title", buf, 2u);
}

@end
