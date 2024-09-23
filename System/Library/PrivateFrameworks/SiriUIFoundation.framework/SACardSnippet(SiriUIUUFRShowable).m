@implementation SACardSnippet(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = a1;
  v32.super_class = (Class)&off_2550C8088;
  objc_msgSendSuper2(&v32, sel__uufrShownRequestedByInstrumentationManager_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardIDforSnippetAceID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardIDforSnippetAceID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setViewID:", v9);
  }
  else
  {
    objc_msgSend(a1, "siriui_card");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setViewID:", v10);

  }
  objc_msgSend(a1, "siriui_card");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(a1, "siriui_card");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backingCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cardSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cardSections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v23, "resultIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v23, "resultIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v25);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v20);
      }
      v26 = objc_alloc_init(MEMORY[0x24BE95B00]);
      objc_msgSend(v26, "setResultIdentifiers:", v17);
      objc_msgSend(v5, "setGridCardSection:", v26);

    }
  }

  return v5;
}

@end
