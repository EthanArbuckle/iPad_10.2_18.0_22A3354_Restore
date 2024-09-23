@implementation PKISO180135AcceptedFieldsFromElements

PKISO180135GroupRepresentation *__PKISO180135AcceptedFieldsFromElements_block_invoke(uint64_t a1, uint64_t a2)
{
  PKISO180135GroupRepresentation *v3;
  id v5;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  PKISO180135RepresentationDataForFieldGroup(&v7, &v6, &v5, a2);
  if (objc_msgSend(v7, "length"))
  {
    v3 = objc_alloc_init(PKISO180135GroupRepresentation);
    -[PKISO180135GroupRepresentation setGroup:](v3, "setGroup:", a2);
    -[PKISO180135GroupRepresentation setIcon:](v3, "setIcon:", v6);
    -[PKISO180135GroupRepresentation setLocalizedTitle:](v3, "setLocalizedTitle:", v7);
    -[PKISO180135GroupRepresentation setAnalyticsTag:](v3, "setAnalyticsTag:", v5);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __PKISO180135AcceptedFieldsFromElements_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id obj;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  PKISO180135AcceptedFieldsFromFields(a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKISO180135OrderedFieldGroupsFromFields(v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v25 = *(_QWORD *)v36;
    do
    {
      v9 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9), "unsignedIntegerValue") == 5)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v10 = v27;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v11)
          {
            v12 = v11;
            v29 = v9;
            v13 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v32 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "localizedTitle");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                PKStringWithValidatedFormat();
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "setLocalizedTitle:", v18, v15);
                v19 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v16, "analyticsTag");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%@"), v20, v15);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "setAnalyticsTag:", v21);
                if (v16)
                  objc_msgSend(v30, "addObject:", v16);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v12);
            v8 = v25;
            v7 = v26;
            v9 = v29;
          }
        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v30, "addObject:", v10);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  v22 = (void *)objc_msgSend(v30, "copy");
  return v22;
}

@end
