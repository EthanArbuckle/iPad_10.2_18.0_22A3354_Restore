@implementation VUIJSSportsKitInterface

- (VUIJSSportsKitInterface)initWithAppContext:(id)a3
{
  id v4;
  VUIJSSportsKitInterface *v5;
  VUIJSSportsKitJavascriptInterface *v6;
  void *v7;
  uint64_t v8;
  VUIJSSportsKitJavascriptInterface *implementation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIJSSportsKitInterface;
  v5 = -[VUIJSObject initWithAppContext:](&v11, sel_initWithAppContext_, v4);
  if (v5)
  {
    v6 = [VUIJSSportsKitJavascriptInterface alloc];
    objc_msgSend(v4, "jsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VUIJSSportsKitJavascriptInterface initWithContext:](v6, "initWithContext:", v7);
    implementation = v5->_implementation;
    v5->_implementation = (VUIJSSportsKitJavascriptInterface *)v8;

  }
  return v5;
}

- (id)checkActivityExists:(id)a3
{
  return -[VUIJSSportsKitJavascriptInterface checkActivityExistsFor:](self->_implementation, "checkActivityExistsFor:", a3);
}

- (id)registerForSportsCanonical:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  VUIJSSportsKitJavascriptInterface *implementation;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v8 = a4;
  v9 = a5;
  implementation = self->_implementation;
  v22 = v9;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__VUIJSSportsKitInterface_registerForSportsCanonical_::__block_invoke;
  v23[3] = &unk_1E9F9E150;
  v24 = v8;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __56__VUIJSSportsKitInterface_registerForSportsCanonical_::__block_invoke_2;
  v21 = &unk_1E9F9E178;
  v11 = v9;
  v12 = v8;
  -[VUIJSSportsKitJavascriptInterface registerWithRequest:successHandler:errorHandler:](implementation, "registerWithRequest:successHandler:errorHandler:", a3, v23, &v18);
  v13 = (void *)MEMORY[0x1E0CBE108];
  -[VUIJSObject appContext](self, "appContext", v18, v19, v20, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueWithObject:inContext:", CFSTR("test_identifier"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __56__VUIJSSportsKitInterface_registerForSportsCanonical_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "callWithArguments:", v6);

  }
  else
  {
    v8 = (id)objc_msgSend(v5, "callWithArguments:", MEMORY[0x1E0C9AA60]);
  }

}

void __56__VUIJSSportsKitInterface_registerForSportsCanonical_::__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v2, "callWithArguments:", v4);

  }
  else
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", MEMORY[0x1E0C9AA60]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
}

@end
