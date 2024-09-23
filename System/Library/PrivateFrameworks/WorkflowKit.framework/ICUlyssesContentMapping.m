@implementation ICUlyssesContentMapping

- (id)contentItemClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E40];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, objc_opt_class(), 0);
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, const __CFString *, _QWORD);

  v11 = (void (**)(id, const __CFString *, _QWORD))a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("UlyssesAttachmentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("Keywords")))
  {
    v11[2](v11, &stru_1E7AFA810, 0);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Image")))
  {
    -[ICUlyssesContentMapping getImageURLQueryString:withInput:parameters:](self, "getImageURLQueryString:withInput:parameters:", v11, v8, v9);
  }
  else
  {
    -[ICUlyssesContentMapping getTextURLQueryString:withInput:parameters:](self, "getTextURLQueryString:withInput:parameters:", v11, v8, v9);
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
  v10[2] = __70__ICUlyssesContentMapping_getTextURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF96D8;
  v11 = v8;
  v9 = v8;
  -[ICUlyssesContentMapping getTextRepresentation:withInput:parameters:](self, "getTextRepresentation:withInput:parameters:", v10, a4, a5);

}

- (void)getTextRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  char v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("UlyssesTextFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Markdown"));
  v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("HTML"));
  objc_msgSend(v9, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectsMatchingClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && ((v12 | v13) & 1) != 0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke;
    v18[3] = &unk_1E7AF4C30;
    v19 = v8;
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC518], v18[0], 3221225472, __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke, &unk_1E7AF4C30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getFileRepresentation:forType:", v18, v17);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICUlyssesContentMapping;
    -[ICContentMapping getStringRepresentation:withInput:parameters:](&v21, sel_getStringRepresentation_withInput_parameters_, v8, v9, v10);
  }

}

- (void)getImageURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF7100;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClass:completionHandler:", v8, v10);

}

void __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke_2;
    v8[3] = &unk_1E7AF78F8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "getFileRepresentation:forType:", v8, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
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
    v11[0] = CFSTR("image");
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

void __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void (*v14)(void);
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_stringWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v14();
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  v9 = objc_alloc(MEMORY[0x1E0D13FA8]);
  objc_msgSend(v15, "originalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithBaseURL:", v10);

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "handleHTML:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

LABEL_7:
}

void __70__ICUlyssesContentMapping_getTextURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

@end
