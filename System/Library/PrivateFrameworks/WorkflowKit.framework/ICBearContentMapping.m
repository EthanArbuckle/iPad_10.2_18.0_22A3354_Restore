@implementation ICBearContentMapping

- (id)contentItemClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, objc_opt_class(), 0);
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("BearAttachmentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("File")))
      -[ICBearContentMapping getFileURLQueryString:withInput:parameters:](self, "getFileURLQueryString:withInput:parameters:", v8, v9, v10);
    else
      -[ICBearContentMapping getTextURLQueryString:withInput:parameters:](self, "getTextURLQueryString:withInput:parameters:", v8, v9, v10);
  }
  else
  {
    v23 = 0;
    objc_msgSend(v9, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_43037, &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    if (!objc_msgSend(v14, "numberOfItems"))
    {
      objc_msgSend(v13, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "numberOfItems"))
      {
        objc_msgSend(v15, "items");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addItem:", v17);
        objc_msgSend(v13, "removeItem:", v17);

      }
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v19[3] = &unk_1E7AF43D0;
    v22 = v8;
    v19[4] = self;
    v20 = v13;
    v21 = v10;
    v18 = v13;
    -[ICBearContentMapping getTextURLQueryString:withInput:parameters:](self, "getTextURLQueryString:withInput:parameters:", v19, v14, v21);

  }
}

- (void)getTextURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__ICBearContentMapping_getTextURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF96D8;
  v11 = v8;
  v9 = v8;
  -[ICBearContentMapping getTextRepresentation:withInput:parameters:](self, "getTextRepresentation:withInput:parameters:", v10, a4, a5);

}

- (void)getTextRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsMatchingClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__ICBearContentMapping_getTextRepresentation_withInput_parameters___block_invoke;
    v15[3] = &unk_1E7AF78F8;
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC518]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getFileRepresentation:forType:", v15, v14);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ICBearContentMapping;
    -[ICContentMapping getStringRepresentation:withInput:parameters:](&v17, sel_getStringRepresentation_withInput_parameters_, v8, v9, v10);
  }

}

- (void)getFileURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__ICBearContentMapping_getFileURLQueryString_withInput_parameters___block_invoke;
  v8[3] = &unk_1E7AF78F8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "getFileRepresentation:forType:", v8, 0);

}

void __67__ICBearContentMapping_getFileURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E98];
    v11[0] = CFSTR("file");
    v11[1] = CFSTR("filename");
    v12[0] = v6;
    objc_msgSend(v4, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dc_queryStringWithQueryDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __67__ICBearContentMapping_getTextRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_stringWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D13FA8]);
    objc_msgSend(v14, "originalURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithBaseURL:", v10);

    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "handleHTML:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __67__ICBearContentMapping_getTextURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    v9 = CFSTR("text");
    v10[0] = a2;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a2;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dc_queryStringWithQueryDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a3);
    v8 = 0;
  }

}

void __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
    v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_3;
    v12[3] = &unk_1E7AF43A8;
    v8 = *(id *)(a1 + 56);
    v13 = v6;
    v14 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = v6;
    objc_msgSend(v7, "getFileURLQueryString:withInput:parameters:", v12, v10, v9);

  }
}

void __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR("&"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

uint64_t __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3 & 1;
}

@end
