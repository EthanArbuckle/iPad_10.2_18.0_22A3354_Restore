@implementation WFSmartPromptStringGenerator

+ (id)localizedPromptForWorkflowName:(id)a3 attributionSet:(id)a4 contentCollection:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v17, "promptingBehaviour") == 2)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(a1, "contentDescriptionWithAttributionSet:contentItemCache:", v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "localizedTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0D13EE0], "webpagesLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v17, "isEqual:", v21);

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      if (v19)
      {
        WFLocalizedString(CFSTR("Allow “%1$@” to access %2$@ while loading web content?"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringWithFormat:", v24, v14, v19);
      }
      else
      {
        WFLocalizedString(CFSTR("Allow “%1$@” to load web content?"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringWithFormat:", v24, v14, v29);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      if (v19)
      {
        WFLocalizedString(CFSTR("Allow “%1$@” to access %2$@ while loading web content on “%3$@”?"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringWithFormat:", v24, v14, v19, v26);
      }
      else
      {
        WFLocalizedString(CFSTR("Allow “%1$@” to load web content on “%2$@”?"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringWithFormat:", v24, v14, v26, v30);
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  objc_msgSend(v18, "smartPromptWithContentDescription:contentDestination:workflowName:", v19, v20, v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v27;
}

+ (id)localizedSubtitleForWorkflowName:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 contentDestination:(id)a7 action:(id)a8 isWebpageCoercion:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  char v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  objc_msgSend(a1, "contentDescriptionWithAttributionSet:contentItemCache:", v16, v18);
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v17;
  if (v17)
  {
    objc_msgSend(a1, "contentDescriptionWithAttributionSet:contentItemCache:", v17, v18);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "localizedTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v20;
  v48 = v17;
  v53 = v15;
  objc_msgSend(v20, "smartPromptSubtitleWithPreviousContentDescription:contentDestination:workflowName:", v17, v23, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
    objc_msgSend(v22, "addObject:", v24);
  v47 = v24;
  if (!a9)
  {
    objc_msgSend(MEMORY[0x1E0D13EE0], "webpagesLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqual:", v25))
    {

    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_19;
    }
  }
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();
  v28 = (void *)MEMORY[0x1E0CB3940];
  if ((v27 & 1) != 0)
  {
    if (v21)
      v29 = CFSTR("This might allow “%1$@” to share this content with “%2$@”.");
    else
      v29 = CFSTR("This might allow “%1$@” to share content with “%2$@”.");
    WFLocalizedString(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v31, v53, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v33);

  }
  else
  {
    if (v21)
      v30 = CFSTR("This might allow “%1$@” to share this content with any website.");
    else
      v30 = CFSTR("This might allow “%1$@” to share content with any website.");
    WFLocalizedString(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v31, v53);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v32);
  }

LABEL_19:
  v49 = v19;
  v34 = (void *)v21;
  v51 = v18;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v35 = v16;
  objc_msgSend(v16, "attributions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v55 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "disclosureWarnings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "if_map:", &__block_literal_global_38637);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "unionOrderedSet:", v42);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v38);
  }

  if (objc_msgSend(v22, "count"))
  {
    v43 = (void *)MEMORY[0x1E0CB3738];
    objc_msgSend(v22, "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringByJoiningStrings:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }

  return v45;
}

+ (id)contentDescriptionWithAttributionSet:(id)a3 contentItemCache:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v63 = v5;
  objc_msgSend(v5, "attributions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v80 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "privateItemIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "set");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    }
    while (v11);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v76 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v6, "contentItemForUUID:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_opt_class();
        if (v22)
          objc_msgSend(v7, "addObject:", v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v18);
  }

  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __86__WFSmartPromptStringGenerator_contentDescriptionWithAttributionSet_contentItemCache___block_invoke;
  v73[3] = &unk_1E7AF3190;
  v23 = v7;
  v74 = v23;
  objc_msgSend(v23, "if_map:", v73);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v25 = (void *)MEMORY[0x1E0CB3738];
    objc_msgSend(v24, "allObjects");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringByJoiningStrings:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedLowercaseString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_56:

    goto LABEL_57;
  }
  v61 = v23;
  v62 = v24;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  objc_msgSend(v63, "attributions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v70 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(v34, "origin");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          v37 = objc_msgSend(v34, "disclosureLevel");

          if (v37 == 1)
          {
            if (objc_msgSend(v34, "count"))
            {
              v38 = 0;
              do
              {
                objc_msgSend(v34, "origin");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v39);

                ++v38;
              }
              while (objc_msgSend(v34, "count") > v38);
            }
          }
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
    }
    while (v31);
  }

  if (objc_msgSend(v26, "count"))
  {
    v60 = v16;
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v26 = v26;
    v40 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v87, 16);
    v41 = v26;
    v24 = v62;
    if (v40)
    {
      v42 = v40;
      v64 = v27;
      v43 = 0;
      v44 = *(_QWORD *)v66;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v66 != v44)
            objc_enumerationMutation(v26);
          v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * m);
          v47 = objc_msgSend(v26, "countForObject:", v46);
          objc_msgSend(v46, "localizedTitle");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v49 = (void *)MEMORY[0x1E0CB3940];
            if (v47 == 1)
            {
              WFLocalizedString(CFSTR("1 %1$@ item"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "localizedStringWithFormat:", v50, v48);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v51);

            }
            else
            {
              WFLocalizedString(CFSTR("%1$d %2$@ items"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "localizedStringWithFormat:", v53, v47, v48);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "addObject:", v54);

            }
          }
          else
          {
            getWFSecurityLogObject();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v84 = "+[WFSmartPromptStringGenerator contentDescriptionWithAttributionSet:contentItemCache:]";
              v85 = 2112;
              v86 = v46;
              _os_log_impl(&dword_1C15B3000, v52, OS_LOG_TYPE_INFO, "%s Could not get localizedTitle for origin %@", buf, 0x16u);
            }

            v43 += v47;
          }

        }
        v42 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v87, 16);
      }
      while (v42);

      v24 = v62;
      v27 = v64;
      if (!v43)
        goto LABEL_52;
      if (v43 == 1)
      {
        WFLocalizedString(CFSTR("1 item"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v41);
      }
      else
      {
        v55 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("%1$d items"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringWithFormat:", v41, v43);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addObject:", v56);

      }
    }

LABEL_52:
    if (objc_msgSend(v27, "count"))
    {
      v57 = (void *)MEMORY[0x1E0CB3738];
      objc_msgSend(v27, "array");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringByJoiningStrings:", v58);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = 0;
    }
    v16 = v60;
    v23 = v61;
    goto LABEL_56;
  }
  v28 = 0;
  v23 = v61;
  v24 = v62;
LABEL_57:

  return v28;
}

+ (id)localizedOutputContentDescriptionWithContentCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_opt_class();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __87__WFSmartPromptStringGenerator_localizedOutputContentDescriptionWithContentCollection___block_invoke;
  v23 = &unk_1E7AF3190;
  v11 = v4;
  v24 = v11;
  objc_msgSend(v11, "if_map:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)MEMORY[0x1E0CB3738];
    objc_msgSend(v12, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringByJoiningStrings:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedLowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedPluralString(CFSTR("%1$d items"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "numberOfItems");
    objc_msgSend(v17, "localizedStringWithFormat:", v14, v18, v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

id __87__WFSmartPromptStringGenerator_localizedOutputContentDescriptionWithContentCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a2, "localizedCountDescriptionWithValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "countDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __86__WFSmartPromptStringGenerator_contentDescriptionWithAttributionSet_contentItemCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a2, "localizedCountDescriptionWithValue:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "countDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __162__WFSmartPromptStringGenerator_localizedSubtitleForWorkflowName_attributionSet_previousAttributions_contentItemCache_contentDestination_action_isWebpageCoercion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedMessage");
}

@end
