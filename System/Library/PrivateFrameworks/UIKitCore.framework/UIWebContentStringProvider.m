@implementation UIWebContentStringProvider

+ (NSArray)additionalLeadingReadableTypeIdentifiersForItemProvider
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSArray)additionalTrailingReadableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 requestedClass:(Class)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", a4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC658]))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v12 = *(_QWORD *)off_1E16792B8;
    v13 = *(_QWORD *)off_1E1678DC8;
    v27[0] = *(_QWORD *)off_1E1678CE0;
    v27[1] = v13;
    v28[0] = v12;
    v28[1] = MEMORY[0x1E0C9AAA0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v28;
    v16 = v27;
  }
  else
  {
    if (!objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC518]))
    {
      v23 = 0;
      goto LABEL_10;
    }
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v17 = *(_QWORD *)off_1E1678DD0;
    v18 = *(_QWORD *)off_1E1678DC8;
    v25[0] = *(_QWORD *)off_1E1678CE0;
    v25[1] = v18;
    v26[0] = v17;
    v26[1] = MEMORY[0x1E0C9AAA0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v26;
    v16 = v25;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v11, "_initWithHTMLData:options:documentAttributes:error:", v9, v19, 0, a6);

  if (v20)
  {
    v21 = [a5 alloc];
    objc_msgSend(v20, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithString:", v22);

  }
  else
  {
    v23 = 0;
  }

LABEL_10:
  return v23;
}

@end
