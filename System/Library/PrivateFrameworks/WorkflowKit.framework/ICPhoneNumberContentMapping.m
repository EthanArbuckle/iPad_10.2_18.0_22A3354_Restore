@implementation ICPhoneNumberContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF0CF8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v10, a4, a5);

}

void __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "numberOfItems"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
      v17[3] = &unk_1E7AF3258;
      v9 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v9;
      objc_msgSend(v8, "getObjectRepresentations:forClass:", v17, objc_opt_class());

    }
    else
    {
      objc_msgSend(v6, "getStringRepresentation:", *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "destinationType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("URLQueryValue"));

    if (!v7 && (v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB28A8];
      v19[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Error"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v14;
      v19[1] = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("No phone numbers were passed into this action."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 260, v16);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __76__ICPhoneNumberContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v10 = (_QWORD *)getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
  v33 = getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
  if (!getCNLabelPhoneNumberiPhoneSymbolLoc_ptr)
  {
    v11 = ContactsLibrary();
    v10 = dlsym(v11, "CNLabelPhoneNumberiPhone");
    v31[3] = (uint64_t)v10;
    getCNLabelPhoneNumberiPhoneSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v30, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberiPhone(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("ICPhoneNumberContentMapping.m"), 14, CFSTR("%s"), dlerror());
LABEL_19:

    __break(1u);
    return;
  }
  objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("label"), *v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v13 = (_QWORD *)getCNLabelPhoneNumberMobileSymbolLoc_ptr;
  v33 = getCNLabelPhoneNumberMobileSymbolLoc_ptr;
  if (!getCNLabelPhoneNumberMobileSymbolLoc_ptr)
  {
    v14 = ContactsLibrary();
    v13 = dlsym(v14, "CNLabelPhoneNumberMobile");
    v31[3] = (uint64_t)v13;
    getCNLabelPhoneNumberMobileSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v30, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNLabelPhoneNumberMobile(void)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("ICPhoneNumberContentMapping.m"), 15, CFSTR("%s"), dlerror());
    goto LABEL_19;
  }
  objc_msgSend(v7, "objectMatchingKey:value:", CFSTR("label"), *v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v12)
    v17 = v12;
  else
    v17 = (void *)v15;
  v29 = v8;
  if (v17)
  {
    v18 = v17;
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v20 = a1;
  objc_msgSend(*(id *)(a1 + 32), "definition");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("UseNormalizedNumber"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "BOOLValue") & 1) != 0)
    objc_msgSend(v19, "normalizedPhoneNumber");
  else
    objc_msgSend(v19, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsSeparatedByCharactersInSet:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", &stru_1E7AFA810);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(v20 + 40) + 16))();
}

@end
