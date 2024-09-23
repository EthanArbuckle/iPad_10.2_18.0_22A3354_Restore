@implementation ICSkypeCallContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__ICSkypeCallContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v14[3] = &unk_1E7AF68D0;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v14, v12, v11);

}

- (void)getStringRepresentationWithoutContact:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICSkypeCallContentMapping *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__ICSkypeCallContentMapping_getStringRepresentationWithoutContact_withInput_parameters___block_invoke;
  v14[3] = &unk_1E7AF9A70;
  v16 = self;
  v17 = v8;
  v15 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "generateCollectionByCoercingToItemClasses:completionHandler:", v11, v14);

}

id __88__ICSkypeCallContentMapping_getStringRepresentationWithoutContact_withInput_parameters___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)ICSkypeCallContentMapping;
  return objc_msgSendSuper2(&v5, sel_getStringRepresentation_withInput_parameters_, v2, a2, v3);
}

void __74__ICSkypeCallContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v41 = a3;
  v43 = a4;
  v40 = v7;
  if (objc_msgSend(v7, "numberOfItems"))
  {
    v38 = a1;
    objc_msgSend(v7, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "numberOfItems"))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v42, "items");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v37)
      {
        v8 = *(_QWORD *)v50;
        v35 = *(_QWORD *)v50;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v50 != v8)
            {
              v10 = v9;
              objc_enumerationMutation(obj);
              v9 = v10;
            }
            v36 = v9;
            v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(v11, "contact");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "instantMessageAddresses");
            v44 = (id)objc_claimAutoreleasedReturnValue();

            v13 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v46 != v14)
                    objc_enumerationMutation(v44);
                  v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  objc_msgSend(v16, "value");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "service");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = 0;
                  v55 = &v54;
                  v56 = 0x2020000000;
                  v19 = (id *)getCNInstantMessageServiceSkypeSymbolLoc_ptr;
                  v57 = getCNInstantMessageServiceSkypeSymbolLoc_ptr;
                  if (!getCNInstantMessageServiceSkypeSymbolLoc_ptr)
                  {
                    v53[0] = MEMORY[0x1E0C809B0];
                    v53[1] = 3221225472;
                    v53[2] = __getCNInstantMessageServiceSkypeSymbolLoc_block_invoke;
                    v53[3] = &unk_1E7AF9520;
                    v53[4] = &v54;
                    __getCNInstantMessageServiceSkypeSymbolLoc_block_invoke(v53);
                    v19 = (id *)v55[3];
                  }
                  _Block_object_dispose(&v54, 8);
                  if (!v19)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCNInstantMessageServiceSkype(void)");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("ICSkypeCallContentMapping.m"), 14, CFSTR("%s"), dlerror());

                    __break(1u);
                  }
                  v20 = *v19;
                  if ((objc_msgSend(v18, "isEqualToString:", v20) & 1) != 0)
                  {
                    objc_msgSend(v16, "value");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "username");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "length") == 0;

                    if (!v23)
                    {
                      v30 = *(_QWORD *)(v38 + 56);
                      objc_msgSend(v16, "value");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "username");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      (*(void (**)(uint64_t, void *, _QWORD))(v30 + 16))(v30, v32, 0);

                      goto LABEL_30;
                    }
                  }
                  else
                  {

                  }
                }
                v13 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
              }
              while (v13);
            }

            v9 = v36 + 1;
            v8 = v35;
          }
          while (v36 + 1 != v37);
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          v8 = v35;
        }
        while (v37);
      }

    }
    objc_msgSend(*(id *)(v38 + 32), "getStringRepresentationWithoutContact:withInput:parameters:", *(_QWORD *)(v38 + 56), *(_QWORD *)(v38 + 40), *(_QWORD *)(v38 + 48));
LABEL_30:

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "destinationType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("URLQueryValue"));

    if (!v43 && (v25 & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v60[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Error"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v27;
      v60[1] = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("No phone numbers or Skype usernames were passed into this action."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v29);
      v43 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end
