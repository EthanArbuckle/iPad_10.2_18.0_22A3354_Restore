@implementation SSFindMyResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.people.findMy");
}

- (id)fmfPunchoutURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSContactResultBuilder contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0D20258];
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v9), "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleWithId:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "phoneNumbers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v17), "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0D20258], "handleWithId:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v3, "addObject:", v20);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v15);
  }

  v21 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = v3;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v34;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "identifier", (_QWORD)v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v28);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = &stru_1E6E549F0;
  }
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setScheme:", CFSTR("findmy"));
  objc_msgSend(v30, "setHost:", CFSTR("fr"));
  objc_msgSend(v30, "setPath:", v29);
  objc_msgSend(v30, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)resultIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SSContactResultBuilder contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSFindMyResultBuilder;
  -[SSContactResultBuilder buildResult](&v13, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultBundleId:", CFSTR("com.apple.people.findMy"));
  objc_msgSend(v3, "setApplicationBundleIdentifier:", CFSTR("com.apple.findmy"));
  -[SSContactResultBuilder contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v5);

  -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonIdentifier:", v6);

  -[SSFindMyResultBuilder buildInlineCard](self, "buildInlineCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInlineCard:", v7);

  -[SSFindMyResultBuilder resultIdentifier](self, "resultIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.findmy"), "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v11);

  return v3;
}

- (id)buildInlineCard
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SSFindMyResultBuilder buildHorizontallyScrollingCardSection](self, "buildHorizontallyScrollingCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCardSections:", v4);

  }
  return v3;
}

- (id)buildHorizontallyScrollingCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[SSContactResultBuilder contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifier:", v5);

  -[SSContactResultBuilder personIdentifier](self, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonIdentifier:", v6);

  -[SSContactResultBuilder fullName](self, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v7);

  v8 = (void *)MEMORY[0x1E0D8C5E0];
  -[SSFindMyResultBuilder fmfPunchoutURL](self, "fmfPunchoutURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "punchoutWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setPunchout:", v10);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setPerson:", v3);
  objc_msgSend(v12, "setCardSectionId:", CFSTR("com.apple.people.findMy"));
  objc_msgSend(v12, "setCommand:", v11);
  -[SSFindMyResultBuilder resultIdentifier](self, "resultIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResultIdentifier:", v13);

  return v12;
}

@end
