@implementation WBSPasswordPickerHintStringGenerator

+ (void)getHintStringsForAppID:(id)a3 appNames:(id)a4 matchedSites:(id)a5 urlString:(id)a6 outServiceNameHintStrings:(id *)a7 outDomainHintStrings:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void *)MEMORY[0x1E0C9AA60];
  v44 = a7;
  *a7 = (id)MEMORY[0x1E0C9AA60];
  *a8 = v17;
  v18 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v16, "safari_stringByTrimmingWhitespace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataUsingEncoding:", 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_lp_URLWithData:baseURL:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "host");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "host");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v23, "safari_highLevelDomainFromHost");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
  {
    v50[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    *a8 = v27;
    goto LABEL_8;
  }
  if (v23)
    goto LABEL_8;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "safari_mapObjectsUsingBlock:", &__block_literal_global_44);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {
    v38 = 0;
    v39 = 0;
    v40 = v22;
    v41 = v16;
    v42 = v15;
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v43 = v14;
    v29 = v14;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if (objc_msgSend(v34, "length", v38, v39, v40, v41, v42))
          {
            objc_msgSend(v28, "addObject:", v34);
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "invertedSet");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "safari_stringByRemovingCharactersInSet:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v34, "isEqualToString:", v37) & 1) == 0)
              objc_msgSend(v28, "addObject:", v37);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v31);
    }

    objc_msgSend(v28, "allObjects");
    *v44 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v43;
    v16 = v41;
    v15 = v42;
    v23 = v39;
    v22 = v40;
    v26 = v38;
  }
LABEL_8:

}

id __142__WBSPasswordPickerHintStringGenerator_getHintStringsForAppID_appNames_matchedSites_urlString_outServiceNameHintStrings_outDomainHintStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "safari_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

@end
