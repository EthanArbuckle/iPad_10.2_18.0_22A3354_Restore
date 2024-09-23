@implementation WFURLStringParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "variablesOfType:", CFSTR("Ask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)WFURLStringParameterState;
    -[WFVariableStringParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v18, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    -[WFVariableStringParameterState variableString](self, "variableString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[WFVariableStringParameterState variableString](self, "variableString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __86__WFURLStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v16[3] = &unk_1E7AEEDA8;
      v17 = v10;
      objc_msgSend(v15, "processWithContext:completionHandler:", v8, v16);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }

}

void __86__WFURLStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v7 = a2;
  v8 = a5;
  if (objc_msgSend(v7, "length"))
  {
    v11 = v8;
    +[WFURLStringParameterState forceStringToURL:error:](WFURLStringParameterState, "forceStringToURL:error:", v7, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = v10;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)forceStringToURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!objc_msgSend(MEMORY[0x1E0D140C8], "stringMatchesExactly:", v7))
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0D140C8], "URLsInString:error:", v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "absoluteString");
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = v11;
    v7 = (void *)v12;
  }

LABEL_5:
  if (!v8)
  {
    if (objc_msgSend(v5, "rangeOfString:", CFSTR(":")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "stringByAddingPercentEscapesUsingEncoding:", 4);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)v17;
      if (v8)
        goto LABEL_6;
    }
LABEL_13:
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB32E8];
    v25 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Invalid URL: %@"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", v21, v5, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, -1000, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    goto LABEL_14;
  }
LABEL_6:
  if ((objc_msgSend(MEMORY[0x1E0D140C8], "stringMatchesExactly:", v7) & 1) == 0)
  {
    objc_msgSend(v8, "scheme");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_13;
    v14 = (void *)v13;
    v15 = objc_msgSend(v5, "rangeOfString:", CFSTR(":"));

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
  }
  v8 = v8;
  v16 = v8;
LABEL_14:

  return v16;
}

@end
