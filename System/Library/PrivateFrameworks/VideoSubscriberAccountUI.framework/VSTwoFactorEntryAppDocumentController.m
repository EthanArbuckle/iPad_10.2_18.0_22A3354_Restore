@implementation VSTwoFactorEntryAppDocumentController

- (void)_startObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  -[VSAppDocumentController _startObservingViewModel:](&v6, sel__startObservingViewModel_, v4);
  objc_msgSend(v4, "twoFactorTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("text"), 3, kVSKeyValueObservingContext_TwoFactorText);

}

- (void)_stopObservingViewModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  -[VSAppDocumentController _stopObservingViewModel:](&v6, sel__stopObservingViewModel_, v4);
  objc_msgSend(v4, "twoFactorTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("text"), kVSKeyValueObservingContext_TwoFactorText);

}

- (id)_newViewModel
{
  VSTwoFactorEntryViewModel *v3;

  v3 = objc_alloc_init(VSTwoFactorEntryViewModel);
  -[VSTwoFactorEntryViewModel setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v12;
  id v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSTwoFactorEntryAppDocumentController;
  -[VSAppDocumentController _updateViewModel:error:](&v14, sel__updateViewModel_error_, v6, a4);
  v7 = v6;
  -[VSAppDocumentController appDocument](self, "appDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
    if (a4)
LABEL_3:
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    -[VSAppDocumentController templateElement](self, "templateElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "vs_elementType") == 165)
    {
      v13 = 0;
      v10 = -[VSTwoFactorEntryAppDocumentController _updateTwoFactorEntryViewModel:withTemplate:error:](self, "_updateTwoFactorEntryViewModel:withTemplate:error:", v7, v12, &v13);
      v9 = v13;
    }
    else
    {
      VSPrivateError();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }

    if (a4)
      goto LABEL_3;
  }

  return v10;
}

- (BOOL)_updateTwoFactorEntryViewModel:(id)a3 withTemplate:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  VSITMLTwoFactorEntryField *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  VSTwoFactorEntryButton *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  id v72;
  id obj;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80;
  char v81[15];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[128];
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(a4, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v87;
    v65 = *MEMORY[0x24BDBCAB8];
    v66 = *(_QWORD *)v87;
    v67 = v6;
    do
    {
      v10 = 0;
      v69 = v8;
      do
      {
        if (*(_QWORD *)v87 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "vs_elementType");
        if (v12 != 160)
        {
          if (v12 != 138)
          {
            if (v12 == 49)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = (void *)MEMORY[0x24BDBCE88];
                v14 = (objc_class *)objc_opt_class();
                NSStringFromClass(v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "raise:format:", v65, CFSTR("Unexpectedly, element was %@, instead of IKImageElement."), v15);

              }
              -[VSAppDocumentController _imageItemProviderWithImageElement:](self, "_imageItemProviderWithImageElement:", v11);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setLogoProvider:", v16);
              goto LABEL_59;
            }
            goto LABEL_60;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = (void *)MEMORY[0x24BDBCE88];
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "raise:format:", v65, CFSTR("Unexpectedly, element was %@, instead of IKTextElement."), v19);

          }
          v16 = v11;
          objc_msgSend(v16, "elementName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqual:", CFSTR("title")))
          {
            objc_msgSend(v16, "text");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "string");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setHeaderText:", v22);
            goto LABEL_34;
          }
          if (objc_msgSend(v20, "isEqual:", CFSTR("description")))
          {
            objc_msgSend(v16, "text");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "string");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setMessage:", v22);
LABEL_34:

          }
          goto LABEL_59;
        }
        v71 = v10;
        objc_msgSend(v11, "vs_itemElementsOfType:", 140);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v16 = v23;
        v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        if (!v24)
          goto LABEL_58;
        v25 = v24;
        v26 = *(_QWORD *)v83;
        obj = v16;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v83 != v26)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            objc_msgSend(v28, "attributes");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", CFSTR("label"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "attributes");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKey:", CFSTR("length"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "attributes");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKey:", CFSTR("type"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "attributes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKey:", CFSTR("autocapitalize"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "attributes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKey:", CFSTR("autoshowkeyboard"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32 && objc_msgSend(v32, "integerValue") > 0)
            {
              if (!v34)
              {
                v40 = 0;
                v16 = obj;
                if (!v36)
                  goto LABEL_50;
                goto LABEL_43;
              }
              v16 = obj;
              if ((objc_msgSend(v34, "isEqual:", CFSTR("default")) & 1) != 0)
                goto LABEL_30;
              if ((objc_msgSend(v34, "isEqual:", CFSTR("emailAddress")) & 1) != 0)
              {
                v40 = 7;
                if (!v36)
                  goto LABEL_50;
LABEL_43:
                if (objc_msgSend(v28, "vs_BOOLAttributeValueForKey:", CFSTR("autocapitalize")))
                  v41 = 3;
                else
                  v41 = 0;
                if (v38)
                {
LABEL_47:
                  v70 = objc_msgSend(v28, "vs_BOOLAttributeValueForKey:", CFSTR("autoshowkeyboard"));
LABEL_52:
                  v42 = objc_alloc_init(VSITMLTwoFactorEntryField);
                  -[VSITMLTwoFactorEntryField setAssociatedTextFieldElement:](v42, "setAssociatedTextFieldElement:", v28);
                  -[VSTwoFactorEntryTextField setKeyboardType:](v42, "setKeyboardType:", v40);
                  -[VSTwoFactorEntryTextField setAutocapitalizationType:](v42, "setAutocapitalizationType:", v41);
                  -[VSTwoFactorEntryTextField setAutoShowKeyboard:](v42, "setAutoShowKeyboard:", v70);
                  -[VSTwoFactorEntryTextField setLabel:](v42, "setLabel:", v30);
                  if (objc_msgSend(v32, "integerValue") < 9)
                  {
                    v44 = objc_msgSend(v32, "integerValue");
                  }
                  else
                  {
                    VSErrorLogObject();
                    v43 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    {
                      v46 = objc_msgSend(v32, "integerValue");
                      *(_DWORD *)buf = 134218240;
                      v92 = v46;
                      v93 = 2048;
                      v94 = 8;
                      _os_log_error_impl(&dword_2303C5000, v43, OS_LOG_TYPE_ERROR, "Attempted to use TFA with %ld digits, limit is %ld", buf, 0x16u);
                    }

                    v44 = 8;
                  }
                  -[VSTwoFactorEntryTextField setExpectedLength:](v42, "setExpectedLength:", v44);
                  objc_msgSend(v72, "setTwoFactorTextField:", v42);

                  goto LABEL_58;
                }
              }
              else
              {
                if ((objc_msgSend(v34, "isEqual:", CFSTR("numberPad")) & 1) != 0)
                {
                  v40 = 4;
                  if (!v36)
                    goto LABEL_50;
                  goto LABEL_43;
                }
                if ((objc_msgSend(v34, "isEqual:", CFSTR("url")) & 1) != 0)
                {
                  v40 = 3;
                  if (!v36)
                    goto LABEL_50;
                  goto LABEL_43;
                }
                VSErrorLogObject();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  -[VSTwoFactorEntryAppDocumentController _updateTwoFactorEntryViewModel:withTemplate:error:].cold.1(&v80, v81, v45);

LABEL_30:
                v40 = 0;
                if (v36)
                  goto LABEL_43;
LABEL_50:
                v41 = 0;
                if (v38)
                  goto LABEL_47;
              }
              v70 = 1;
              goto LABEL_52;
            }
            VSDefaultLogObject();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2303C5000, v39, OS_LOG_TYPE_DEFAULT, "Ignoring text field due to missing or invalid length attribute.", buf, 2u);
            }

          }
          v16 = obj;
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
          if (v25)
            continue;
          break;
        }
LABEL_58:

        v9 = v66;
        v6 = v67;
        v8 = v69;
        v10 = v71;
LABEL_59:

LABEL_60:
        ++v10;
      }
      while (v10 != v8);
      v47 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      v8 = v47;
    }
    while (v47);
  }

  v75 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v77;
    v74 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v77 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        objc_msgSend(v53, "vs_itemElementsOfType:", 138);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "firstObject");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v55, "text");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "string");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = objc_alloc_init(VSTwoFactorEntryButton);
          if (!v57)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v74, CFSTR("The buttonText parameter must not be nil."));
          -[VSTwoFactorEntryButton setText:](v58, "setText:", v57);
          objc_msgSend(v53, "attributes");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKey:", CFSTR("type"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
            -[VSTwoFactorEntryButton setType:](v58, "setType:", v60);
          objc_msgSend(v75, "addObject:", v58);

        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    }
    while (v50);
  }

  objc_msgSend(v72, "setButtons:", v75);
  objc_msgSend(v72, "twoFactorTextField");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    v62 = 0;
  }
  else
  {
    VSPrivateError();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*a5)
    *a5 = objc_retainAutorelease(v62);

  return v62 == 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[16];

  v10 = a4;
  if ((void *)kVSKeyValueObservingContext_TwoFactorText == a6)
  {
    v12 = a5;
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v13, OS_LOG_TYPE_DEFAULT, "Two factor text field did change.", buf, 2u);
    }

    v14 = *MEMORY[0x24BDD0E70];
    v15 = v10;
    objc_msgSend(v12, "objectForKey:", v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "associatedTextFieldElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "keyboard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v11);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VSTwoFactorEntryAppDocumentController;
    v11 = a5;
    -[VSAppDocumentController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, v11, a6);
  }

}

- (void)twoFactorEntryViewModel:(id)a3 didPressButtonAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[VSAppDocumentController filteredButtonLockupElements](self, "filteredButtonLockupElements", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_2303C5000, v7, OS_LOG_TYPE_DEFAULT, "Sending select event for button %@.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
  }
  else
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VSTwoFactorEntryAppDocumentController twoFactorEntryViewModel:didPressButtonAtIndex:].cold.1(a4, v8);

  }
}

- (void)_updateTwoFactorEntryViewModel:(uint8_t *)buf withTemplate:(_BYTE *)a2 error:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "Invalid keyboard type provided, using default.", buf, 2u);
}

- (void)twoFactorEntryViewModel:(uint64_t)a1 didPressButtonAtIndex:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Two factor button with index %lu does not exist.", (uint8_t *)&v2, 0xCu);
}

@end
