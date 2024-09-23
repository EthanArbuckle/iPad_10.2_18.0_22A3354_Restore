@implementation WFActionDrawerUtilities

+ (id)localizedAppNames
{
  if (localizedAppNames_onceToken != -1)
    dispatch_once(&localizedAppNames_onceToken, &__block_literal_global_41697);
  return (id)localizedAppNames_localizedAppNames;
}

+ (id)suggestionSectionsForDonations:(id)a3 excludingConvertedLinkActions:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__41680;
  v20 = __Block_byref_object_dispose__41681;
  v21 = 0;
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("sourceAppIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke;
  v12[3] = &unk_1E7AF3E28;
  v9 = v5;
  v13 = v9;
  v14 = &v16;
  v15 = a4;
  objc_msgSend(v7, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v8, v12);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)activitySectionsForDonations:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke;
  v18[3] = &unk_1E7AF3E50;
  v19 = v7;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);

  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke_2;
  v15[3] = &unk_1E7AF3E78;
  v16 = v9;
  v17 = a1;
  v12 = v9;
  objc_msgSend(v11, "if_compactMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v11;
    objc_msgSend(v8, "sourceAppIdentifierForDisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v9);
      }
      if ((unint64_t)objc_msgSend(v10, "count") > 9)
        *a4 = 1;
      else
        objc_msgSend(v10, "addObject:", v8);

    }
    v7 = v11;
  }

}

WFActionDrawerSection *__56__WFActionDrawerUtilities_activitySectionsForDonations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFActionDrawerSection *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "localizedAppNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = 0;
      goto LABEL_5;
    }
    objc_msgSend((id)objc_opt_class(), "localizedAppNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v3);

  }
  v9 = -[WFActionDrawerSection initWithLocalizedTitle:donations:bundleIdentifier:sectionType:]([WFActionDrawerSection alloc], "initWithLocalizedTitle:donations:bundleIdentifier:sectionType:", v6, v4, v3, 4);

LABEL_5:
  return v9;
}

void __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  char v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_2;
  v18[3] = &unk_1E7AF3DD8;
  v19 = v4;
  v20 = v3;
  v7 = v2;
  v21 = v7;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(v8, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_3;
  v15[3] = &unk_1E7AF3E00;
  v16 = v7;
  v17 = *(_BYTE *)(a1 + 48);
  v11 = v7;
  objc_msgSend(v10, "if_compactMap:", v15);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_2(id *a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v47;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_23;
  v5 = v47;
  objc_msgSend(v5, "interaction");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_keyParameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_codableDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyAttribute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = a1;
  if (v9)
  {
    objc_msgSend(v9, "propertyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "_isValidKey:", v10);

    if (v7)
      goto LABEL_7;
  }
  else
  {
    v11 = 0;
    if (v7)
    {
LABEL_7:
      objc_msgSend(v6, "_emptyCopy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v7, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "codableAttribute");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "propertyName");
        v15 = v9;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v13, v16);

        v9 = v15;
      }
      if (v11)
      {
        objc_msgSend(v9, "propertyName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertyName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v18, v19);

      }
      objc_msgSend(v46, "_setIntent:", v12);
      v20 = objc_alloc(MEMORY[0x1E0DC7938]);
      objc_msgSend(v5, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceAppIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "initWithIdentifier:sourceAppIdentifier:interaction:", v21, v22, v46);

      v5 = (id)v23;
      goto LABEL_12;
    }
  }
  if (v11)
    goto LABEL_7;
LABEL_12:
  objc_msgSend(v6, "typeName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceAppIdentifierForDisplay");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = (void *)MEMORY[0x1E0CB3940];
  v45 = v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v42 = v6;
    v43 = v5;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "codableAttribute");
    v32 = v26;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "metadata");
    v34 = v24;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_intents_readableTitleWithLocalizer:metadata:", v31, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@-%@"), v28, v36);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    v24 = v34;
    v26 = v32;

    v6 = v42;
    v5 = v43;

  }
  else
  {
    objc_msgSend(v5, "uniqueProperty");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@-%@-%@"), v24, v26, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v39;
    v28 = v37;
  }
  objc_msgSend(v44[4], "objectForKeyedSubscript:", v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    objc_msgSend(v44[4], "setObject:forKeyedSubscript:", v5, v37);
    objc_msgSend(v44[5], "addObject:", v28);
    if (objc_msgSend(v24, "length"))
    {
      objc_msgSend(v44[6], "objectForKey:", v28);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v44[6], "setObject:forKey:", v41, v28);
      }
      if ((unint64_t)objc_msgSend(v41, "count") <= 9)
        objc_msgSend(v41, "addObject:", v5);

    }
  }

  v4 = v47;
LABEL_23:

}

WFActionDrawerSection *__88__WFActionDrawerUtilities_suggestionSectionsForDonations_excludingConvertedLinkActions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFActionDrawerSection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t v24;
  WFActionDrawerSection *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v2 = a1;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replacementActionForDonatedIntent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (v9 = 0, objc_msgSend(v8, "visibleForUse:", 0)))
  {
    objc_msgSend(v4, "interaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_codableDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "localizedName");
    else
      objc_msgSend(v12, "localizedTitle");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_keyParameter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "codableAttribute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = v12;
    if (v14)
    {
      v29 = v3;
      objc_msgSend(v13, "codableAttribute");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "propertyName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "_isValidKey:", v16))
      {
        objc_msgSend(v13, "codableAttribute");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "propertyName");
        v28 = v2;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 != 0;

        v2 = v28;
      }
      else
      {
        v20 = 0;
      }

      v3 = v29;
    }
    else
    {
      v20 = 0;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && *(_BYTE *)(v2 + 40))
    {
      v9 = 0;
      v22 = v30;
      v23 = (void *)v31;
LABEL_24:

      goto LABEL_25;
    }
    if (!v14)
    {
      v24 = 2;
      v22 = v30;
      v23 = (void *)v31;
LABEL_23:
      v25 = [WFActionDrawerSection alloc];
      objc_msgSend(v4, "sourceAppIdentifierForDisplay");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[WFActionDrawerSection initWithLocalizedTitle:donations:bundleIdentifier:sectionType:](v25, "initWithLocalizedTitle:donations:bundleIdentifier:sectionType:", v23, v3, v26, v24);

      goto LABEL_24;
    }
    if (v20)
    {
      v23 = (void *)v31;
      if (v8)
      {
LABEL_18:
        v24 = 1;
LABEL_22:
        v22 = v30;
        goto LABEL_23;
      }
    }
    else
    {
      v23 = (void *)v31;
      if (!((v8 == 0) | isKindOfClass & 1))
        goto LABEL_18;
    }
    v24 = 2;
    goto LABEL_22;
  }
LABEL_25:

  return v9;
}

void __44__WFActionDrawerUtilities_localizedAppNames__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)localizedAppNames_localizedAppNames;
  localizedAppNames_localizedAppNames = (uint64_t)v0;

}

@end
