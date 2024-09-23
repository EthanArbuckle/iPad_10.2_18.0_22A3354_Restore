@implementation ICCreateDayOneEntryAction

- (BOOL)inputRequired
{
  return 0;
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  ICCreateDayOneEntryAction *v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__ICCreateDayOneEntryAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v22[3] = &unk_1E7AFA620;
  v23 = v13;
  v24 = v12;
  v27 = v15;
  v28 = v16;
  v25 = v14;
  v26 = self;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v12;
  v21 = v13;
  -[ICCreateDayOneEntryAction getImagesFromInput:completionHandler:](self, "getImagesFromInput:completionHandler:", v20, v22);

}

- (void)getImagesFromInput:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D13E58];
  v6 = a4;
  v7 = a3;
  v22[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestForCoercingToContentClasses:completionHandler:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E40];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "orderedSetWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D13E50];
  v15 = *MEMORY[0x1E0D14160];
  v19 = v13;
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "optionsWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOptions:", v18);

  objc_msgSend(v7, "performCoercion:", v9);
}

void __105__ICCreateDayOneEntryAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v6 = objc_msgSend(v4, "numberOfItems");

  if (v6)
    objc_msgSend(v5, "setObject:forKey:", CFSTR("1"), CFSTR("imageClipboard"));
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v11.receiver = *(id *)(a1 + 56);
  v11.super_class = (Class)ICCreateDayOneEntryAction;
  objc_msgSendSuper2(&v11, sel_performActionWithInput_parameters_userInterface_successHandler_errorHandler_, v7, v5, v8, v9, v10);

}

@end
