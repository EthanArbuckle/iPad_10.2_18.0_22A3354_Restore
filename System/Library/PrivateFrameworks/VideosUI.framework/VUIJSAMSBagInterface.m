@implementation VUIJSAMSBagInterface

- (id)stringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generateResponseDictionary:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v5, CFSTR("value"), 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    if (v6)
    {
      +[VUIJSAMSBagInterface convertNSErrorIntoDict:](VUIJSAMSBagInterface, "convertNSErrorIntoDict:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("error"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("error is nil"), CFSTR("error"), 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (NSDictionary)VUIAMSBagValueTypes
{
  if (VUIAMSBagValueTypes_onceToken != -1)
    dispatch_once(&VUIAMSBagValueTypes_onceToken, &__block_literal_global_62);
  return (NSDictionary *)(id)VUIAMSBagValueTypes_sVUIAMSBagValueTypes;
}

void __43__VUIJSAMSBagInterface_VUIAMSBagValueTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Array");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v9[1] = CFSTR("Bool");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v9[2] = CFSTR("Double");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v9[3] = CFSTR("Integer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = CFSTR("String");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = CFSTR("URL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v9[6] = CFSTR("Dictionary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)VUIAMSBagValueTypes_sVUIAMSBagValueTypes;
  VUIAMSBagValueTypes_sVUIAMSBagValueTypes = v7;

}

- (id)arrayForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BOOLeanForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)doubleForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)integerForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DB1840];
  v4 = a3;
  objc_msgSend(v3, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)arrayForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIJSAMSBagInterface_arrayForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __51__VUIJSAMSBagInterface_arrayForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

- (void)BOOLForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BOOLeanForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__VUIJSAMSBagInterface_BOOLForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __50__VUIJSAMSBagInterface_BOOLForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

- (void)doubleForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__VUIJSAMSBagInterface_doubleForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __52__VUIJSAMSBagInterface_doubleForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

- (void)integerForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "integerForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__VUIJSAMSBagInterface_integerForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __53__VUIJSAMSBagInterface_integerForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

- (void)stringForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__VUIJSAMSBagInterface_stringForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __52__VUIJSAMSBagInterface_stringForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

- (void)URLForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "urlForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__VUIJSAMSBagInterface_URLForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __49__VUIJSAMSBagInterface_URLForKeyWithCompletion::__block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[4], "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "callWithArguments:", v6);

  objc_msgSend(a1[6], "removeManagedReference:withOwner:", a1[4], WeakRetained);
}

- (void)dictionaryForKeyWithCompletion:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "virtualMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addManagedReference:withOwner:", v8, self);
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__VUIJSAMSBagInterface_dictionaryForKeyWithCompletion::__block_invoke;
  v17[3] = &unk_1E9F9DDF8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v13, "evaluate:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __56__VUIJSAMSBagInterface_dictionaryForKeyWithCompletion::__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIJSAMSBagInterface generateResponseDictionary:withError:](VUIJSAMSBagInterface, "generateResponseDictionary:withError:", *(_QWORD *)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "callWithArguments:", v5);

  objc_msgSend(*(id *)(a1 + 48), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
}

+ (id)convertNSErrorIntoDict:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a3;
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v6, CFSTR("code"), v7, CFSTR("domain"), v8, CFSTR("description"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v9;
}

@end
