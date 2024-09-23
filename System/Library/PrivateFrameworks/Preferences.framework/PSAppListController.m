@implementation PSAppListController

void __84__PSAppListController_specifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setProperty:forKey:", *(_QWORD *)(a1 + 32), CFSTR("AppBundleID"));
  objc_msgSend(v7, "setProperty:forKey:", *(_QWORD *)(a1 + 32), CFSTR("containerBundleID"));
  objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", CFSTR("AppSettingsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v3, CFSTR("AppSettingsBundle"));

  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isThirdPartyDetail"));
  objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", CFSTR("appGroupBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", CFSTR("appGroupBundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v5, CFSTR("containerBundleID"));

    objc_msgSend(*(id *)(a1 + 40), "propertyForKey:", CFSTR("appGroupBundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v6, CFSTR("appGroupBundleID"));

  }
}

+ (id)specifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v10, "objectForKey:", CFSTR("SupportedUserInterfaceIdioms"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v17 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    objc_msgSend(v12, "propertyForKey:", CFSTR("AppBundleID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17
      || (v19 ? (v21 = CFSTR("Pad")) : (v21 = CFSTR("Phone")), objc_msgSend(v17, "containsObject:", v21)))
    {
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSGroupSpecifier")))
      {
        objc_msgSend(a1, "groupSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSTextFieldSpecifier")))
      {
        objc_msgSend(a1, "textFieldSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSToggleSwitchSpecifier")))
      {
        objc_msgSend(a1, "toggleSwitchSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSSliderSpecifier")))
      {
        objc_msgSend(a1, "sliderSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSTitleValueSpecifier")))
      {
        objc_msgSend(a1, "titleValueSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSMultiValueSpecifier")))
      {
        objc_msgSend(a1, "multiValueSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSChildPaneSpecifier")))
      {
        objc_msgSend(a1, "childPaneSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_29:
        v25 = (void *)v22;
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __84__PSAppListController_specifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke;
          v28[3] = &unk_1E4A66780;
          v29 = v20;
          v30 = v12;
          v26 = v20;
          objc_msgSend(v24, "enumerateObjectsUsingBlock:", v28);

          goto LABEL_36;
        }
LABEL_34:
        v24 = 0;
        goto LABEL_35;
      }
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("PSRadioGroupSpecifier")))
      {
        objc_msgSend(a1, "radioGroupSpecifiersFromDictionary:stringsTable:parentSpecifier:target:", v10, v11, v12, v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        goto LABEL_35;
      }
    }
    v25 = 0;
    goto LABEL_34;
  }
  PKLogForCategory(2);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:].cold.1((uint64_t)a1, v23);

  v24 = (void *)MEMORY[0x1E0C9AA60];
LABEL_36:

  return v24;
}

+ (id)groupSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_opt_class();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_opt_class();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FooterText"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v10, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", v15, &stru_1E4A69238, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "localizedStringForKey:value:table:", v18, &stru_1E4A69238, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, v9, 0, 0, 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setProperty:forKey:", v22, CFSTR("footerText"));
  objc_msgSend(v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (!v25)
    objc_msgSend(v23, "setIdentifier:", v15);
  objc_msgSend(v23, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (!v27)
    objc_msgSend(v23, "setIdentifier:", v18);
  objc_msgSend(v23, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIdentifier:", v31);

  }
  return v23;
}

+ (id)textFieldSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v54;
  id v55;
  void *v56;
  __CFString *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v59 = a6;
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Title"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v12, "propertyForKey:", CFSTR("AppBundleID"));
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Key"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_msgSend(v10, "objectForKey:", CFSTR("DefaultValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57 = v16;
  v58 = v10;
  if (-[__CFString length](v16, "length") && objc_msgSend(v19, "length") && v20)
  {
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IsSecure"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v24 = objc_msgSend(v23, "BOOLValue");
    if (v24)
      v25 = 12;
    else
      v25 = 8;
    v55 = v12;
    objc_msgSend(v12, "propertyForKey:", CFSTR("AppSettingsBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v11;
    v28 = v26;
    v54 = v15;
    v56 = v27;
    objc_msgSend(v26, "localizedStringForKey:value:table:", v15, &stru_1E4A69238);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSTextFieldSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSTextFieldSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, v59, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, v25, 0);
    v30 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setProperty:forKey:", v16, CFSTR("defaults"));
    objc_msgSend(v30, "setProperty:forKey:", v19, CFSTR("key"));
    objc_msgSend(v30, "setProperty:forKey:", v20, CFSTR("default"));
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("KeyboardType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v33)
    {
      if ((objc_msgSend(v33, "isEqualToString:", CFSTR("Alphabet")) & 1) != 0)
      {
        v34 = 0;
      }
      else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("NumbersAndPunctuation")) & 1) != 0)
      {
        v34 = 2;
      }
      else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("NumberPad")) & 1) != 0)
      {
        v34 = 11;
      }
      else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("URL")) & 1) != 0)
      {
        v34 = 3;
      }
      else
      {
        if (!objc_msgSend(v33, "isEqualToString:", CFSTR("EmailAddress")))
          goto LABEL_38;
        v34 = 7;
      }
      v30[9] = v34;
    }
LABEL_38:
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AutocapitalizationType"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v46 = v45;
    else
      v46 = 0;
    v47 = v46;

    if (v47)
    {
      if ((objc_msgSend(v47, "isEqualToString:", CFSTR("None")) & 1) != 0)
      {
        v48 = 0;
      }
      else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("Sentences")) & 1) != 0)
      {
        v48 = 2;
      }
      else if ((objc_msgSend(v47, "isEqualToString:", CFSTR("Words")) & 1) != 0)
      {
        v48 = 1;
      }
      else
      {
        if (!objc_msgSend(v47, "isEqualToString:", CFSTR("AllCharacters")))
          goto LABEL_51;
        v48 = 3;
      }
      v30[10] = v48;
    }
LABEL_51:
    v39 = v19;
    objc_opt_class();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("AutocorrectionType"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v49;
    else
      v50 = 0;
    v51 = v50;

    v11 = v56;
    v35 = v54;
    if (!v51)
      goto LABEL_62;
    if ((objc_msgSend(v51, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    {
      v52 = 0;
    }
    else if ((objc_msgSend(v51, "isEqualToString:", CFSTR("No")) & 1) != 0)
    {
      v52 = 1;
    }
    else
    {
      if (!objc_msgSend(v51, "isEqualToString:", CFSTR("Yes")))
      {
LABEL_62:

        v12 = v55;
        goto LABEL_63;
      }
      v52 = 2;
    }
    v30[11] = v52;
    goto LABEL_62;
  }
  v35 = v15;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v37, objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v38, v40);

  PKLogForCategory(2);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = CFSTR("unknown");
    *(_DWORD *)buf = 138543874;
    v61 = v43;
    if (v57)
      v44 = v57;
    v62 = 2114;
    v63 = v44;
    v64 = 2114;
    v65 = v36;
    _os_log_error_impl(&dword_1A3819000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Could not create text-field specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

  }
  v30 = 0;
LABEL_63:

  return v30;
}

+ (id)toggleSwitchSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v38;
  void *v39;
  const __CFString *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v45 = a4;
  v10 = a5;
  v44 = a6;
  v11 = a3;
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v10, "propertyForKey:", CFSTR("AppBundleID"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v11, "objectForKey:", CFSTR("DefaultValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("TrueValue"));
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("FalseValue"));
  v42 = objc_claimAutoreleasedReturnValue();

  v41 = v10;
  if (objc_msgSend(v14, "length") && -[__CFString length](v15, "length") && objc_msgSend(v18, "length") && v19)
  {
    objc_msgSend(v10, "propertyForKey:", CFSTR("AppSettingsBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v45;
    objc_msgSend(v20, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v45);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v44;
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, v44, sel__setToggleSwitchSpecifierValue_specifier_, sel__readToggleSwitchSpecifierValue_, 0, 6, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v15;
    objc_msgSend(v24, "setProperty:forKey:", v15, CFSTR("defaults"));
    objc_msgSend(v24, "setProperty:forKey:", v18, CFSTR("key"));
    objc_msgSend(v24, "setProperty:forKey:", v19, CFSTR("default"));
    v26 = (void *)v43;
    if (v43)
      objc_msgSend(v24, "setProperty:forKey:", v43, CFSTR("TrueValue"));
    v27 = (void *)v42;
    if (v42)
      objc_msgSend(v24, "setProperty:forKey:", v42, CFSTR("FalseValue"));
    v28 = v41;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v30, objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v31, v32);

    v33 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Title"), v33, objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v34, v35);

    if (!v19)
      objc_msgSend(v29, "appendString:", CFSTR("\n\t DefaultValue is missing (must be set)."));
    PKLogForCategory(2);
    v36 = objc_claimAutoreleasedReturnValue();
    v21 = v45;
    v25 = v15;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v47 = v39;
      if (v15)
        v40 = v15;
      v48 = 2114;
      v49 = v40;
      v50 = 2114;
      v51 = v29;
      _os_log_error_impl(&dword_1A3819000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Could not create toggle switch specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v24 = 0;
    v28 = v41;
    v27 = (void *)v42;
    v26 = (void *)v43;
    v23 = v44;
  }

  return v24;
}

+ (id)childPaneSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  __CFString *v52;
  const __CFString *v53;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v57 = a4;
  v9 = a5;
  v10 = a6;
  v11 = a3;
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("File"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ShouldShowGDPR"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ShouldShowGDPRFromAppBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  v56 = v20;
  if (objc_msgSend(v20, "BOOLValue"))
  {
    objc_msgSend(v9, "propertyForKey:", CFSTR("AppBundleID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = +[PSAppListController canUseOnBoardingKitForPrivacyDisplayForBundleID:](PSAppListController, "canUseOnBoardingKitForPrivacyDisplayForBundleID:", v24);

  }
  else
  {
    v25 = 0;
  }
  v55 = v10;
  if (objc_msgSend(v23, "BOOLValue"))
  {
    objc_msgSend(v9, "propertyForKey:", CFSTR("AppBundleID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[PSAppListController canUseOnBoardingKitFOrPrivacyDisplayForBundleName:](PSAppListController, "canUseOnBoardingKitFOrPrivacyDisplayForBundleName:", v26);

  }
  else
  {
    v27 = 0;
  }
  v58 = v9;
  if (objc_msgSend(v14, "length"))
  {
    if (v25)
    {
      objc_msgSend(v9, "propertyForKey:", CFSTR("AppSettingsBundle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v57;
      objc_msgSend(v28, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v57);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v55;
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, v55, 0, 0, 0, 1, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
      objc_msgSend(v32, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("searchable"));
      objc_msgSend(v32, "setButtonAction:", sel_showPrivacyControllerForBundleID_);
      v33 = v17;
    }
    else
    {
      v29 = v57;
      v33 = v17;
      if (v27)
      {
        objc_msgSend(v9, "propertyForKey:", CFSTR("AppSettingsBundle"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v57);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v55;
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, v55, 0, 0, 0, 1, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("enabled"));
        objc_msgSend(v32, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("searchable"));
        objc_msgSend(v32, "setButtonAction:", sel_showPrivacyControllerForBundleName_);
      }
      else if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v9, "propertyForKey:", CFSTR("AppSettingsBundle"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v57);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v55;
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v45, v55, 0, 0, objc_opt_class(), 1, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setProperty:forKey:", v17, CFSTR("File"));
      }
      else
      {
        v32 = 0;
        v31 = v55;
      }
    }
    objc_msgSend(v32, "setProperty:forKey:", v14, CFSTR("id"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Title"), v35, objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v36, v37);

    v38 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("File"), v38, objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v39, v40);

    PKLogForCategory(2);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBundleID"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v50 = v49;
      else
        v50 = 0;
      v51 = v50;
      v52 = (__CFString *)v51;
      v53 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v60 = v48;
      if (v51)
        v53 = v51;
      v61 = 2114;
      v62 = v53;
      v63 = 2114;
      v64 = v34;
      _os_log_error_impl(&dword_1A3819000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Could not create child pane specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v32 = 0;
    v29 = v57;
    v31 = v55;
  }

  return v32;
}

+ (id)titleValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  objc_class *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v55;
  id v56;
  id v57;
  __CFString *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v56 = a4;
  v9 = a5;
  v57 = a6;
  v10 = a3;
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v55 = v9;
  objc_msgSend(v9, "propertyForKey:", CFSTR("AppBundleID"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v10, "objectForKey:", CFSTR("DefaultValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Values"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Titles"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  v58 = v14;
  if (-[__CFString length](v14, "length") && objc_msgSend(v17, "length") && v18)
  {
    v53 = v24;
    v25 = v55;
    objc_msgSend(v55, "propertyForKey:", CFSTR("AppSettingsBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v56;
    objc_msgSend(v26, "localizedStringForKey:value:table:", v13, &stru_1E4A69238, v56);
    v28 = v21;
    v29 = v18;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v57;
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, v57, 0, sel_readPreferenceValue_, 0, 4, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v29;
    v21 = v28;

    objc_msgSend(v32, "setProperty:forKey:", v58, CFSTR("defaults"));
    objc_msgSend(v32, "setProperty:forKey:", v17, CFSTR("key"));
    objc_msgSend(v32, "setProperty:forKey:", v18, CFSTR("default"));
    if (v28)
    {
      v24 = v53;
      if (v53 && objc_msgSend(v21, "count"))
      {
        v33 = objc_msgSend(v21, "count");
        if (v33 == objc_msgSend(v53, "count"))
        {
          objc_msgSend(a1, "localizedTitlesFromUnlocalizedTitles:stringsTable:parentSpecifier:", v53, v56, v55);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setValues:titles:shortTitles:", v21, v34, 0);

        }
        v31 = v57;
      }
    }
    else
    {
      v24 = v53;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v36, objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v37, v38);

    v39 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Title"), v39, objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v40, v41);

    v42 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Values"), v42, objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v43, v44);

    v45 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Titles"), v45, objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v46, v47);

    PKLogForCategory(2);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v60 = v51;
      if (v14)
        v52 = v14;
      v61 = 2114;
      v62 = v52;
      v63 = 2114;
      v64 = v35;
      _os_log_error_impl(&dword_1A3819000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Could not create title-value specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v32 = 0;
    v25 = v55;
    v27 = v56;
    v31 = v57;
  }

  return v32;
}

+ (id)multiValueSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  objc_class *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __CFString *v64;
  void *v65;
  void *v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v63 = a4;
  v10 = a5;
  v61 = a6;
  v11 = a3;
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v62 = v10;
  objc_msgSend(v10, "propertyForKey:", CFSTR("AppBundleID"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v67 = v17;

  objc_msgSend(v11, "objectForKey:", CFSTR("DefaultValue"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Values"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Titles"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ShortTitles"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v60 = v25;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DisplaySortedByTitle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  v29 = objc_msgSend(v28, "BOOLValue");
  v66 = v14;
  v64 = v15;
  if (objc_msgSend(v14, "length")
    && -[__CFString length](v15, "length")
    && objc_msgSend(v67, "length")
    && v65
    && v20
    && v23
    && objc_msgSend(v20, "count")
    && (v30 = objc_msgSend(v20, "count"), v30 == objc_msgSend(v23, "count")))
  {
    v31 = v10;
    objc_msgSend(v10, "propertyForKey:", CFSTR("AppSettingsBundle"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v63;
    objc_msgSend(v57, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v63);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v15;
    v34 = v61;
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v56, v61, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, objc_opt_class(), 2, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "setProperty:forKey:", v33, CFSTR("defaults"));
    objc_msgSend(v35, "setProperty:forKey:", v67, CFSTR("key"));
    objc_msgSend(v35, "setProperty:forKey:", v65, CFSTR("default"));
    objc_msgSend(a1, "localizedTitlesFromUnlocalizedTitles:stringsTable:parentSpecifier:", v23, v63, v62);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v60;
    if (v60 && (v58 = objc_msgSend(v60, "count"), v58 == objc_msgSend(v23, "count")))
    {
      objc_msgSend(a1, "localizedTitlesFromUnlocalizedTitles:stringsTable:parentSpecifier:", v60, v63, v62);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v35, "setValues:titles:shortTitles:usingLocalizedTitleSorting:", v20, v59, v37, v29);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v39, objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v67, "length"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v40, v41);

    v42 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Title"), v42, objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v43, v44);

    v45 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Values"), v45, objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v46, v47);

    v48 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Titles"), v48, objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v49, v50);

    PKLogForCategory(2);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v69 = v54;
      if (v64)
        v55 = v64;
      v70 = 2114;
      v71 = v55;
      v72 = 2114;
      v73 = v38;
      _os_log_error_impl(&dword_1A3819000, v51, OS_LOG_TYPE_ERROR, "%{public}@: Could not multi-value specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v35 = 0;
    v31 = v62;
    v32 = v63;
    v36 = v60;
    v34 = v61;
  }

  return v35;
}

+ (id)localizedTitlesFromUnlocalizedTitles:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v9, "propertyForKey:", CFSTR("AppSettingsBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1E4A69238, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

    }
  }

  return v11;
}

+ (id)sliderSpecifierFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  objc_class *v53;
  void *v54;
  const __CFString *v55;
  id v57;
  uint64_t v58;
  id v59;
  __CFString *v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v59 = a6;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v58 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("AppBundleID"));
  v10 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DefaultValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v61 = v15;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MinimumValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaximumValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MinimumValueImage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v57 = v23;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaximumValueImage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  v60 = (__CFString *)v10;
  v27 = (void *)v10;
  v28 = v13;
  if (objc_msgSend(v27, "length") && objc_msgSend(v13, "length") && v61 && v18 && v21)
  {
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, v59, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 5, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v60, CFSTR("defaults"));
    objc_msgSend(v29, "setProperty:forKey:", v13, CFSTR("key"));
    objc_msgSend(v29, "setProperty:forKey:", v61, CFSTR("default"));
    objc_msgSend(v29, "setProperty:forKey:", v18, CFSTR("min"));
    objc_msgSend(v29, "setProperty:forKey:", v21, CFSTR("max"));
    v30 = v57;
    if (v57)
    {
      v31 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "traitCollection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "imageNamed:inBundle:compatibleWithTraitCollection:", v57, v58, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
        objc_msgSend(v29, "setProperty:forKey:", v34, CFSTR("leftImage"));

      v28 = v13;
    }
    if (v26)
    {
      v35 = v28;
      v36 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "traitCollection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v58;
      objc_msgSend(v36, "imageNamed:inBundle:compatibleWithTraitCollection:", v26, v58, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        objc_msgSend(v29, "setProperty:forKey:", v40, CFSTR("rightImage"));

      v28 = v35;
    }
    else
    {
      v39 = (void *)v58;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v42, objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v43, v44);

    v45 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("DefaultValue"), v45, objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendFormat:", CFSTR("\n\t%@"), v46);

    v47 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("MinimumValue"), v47, objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendFormat:", CFSTR("\n\t%@"), v48);

    v49 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("MaximumValue"), v49, objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "appendFormat:", CFSTR("\n\t%@"), v50);

    PKLogForCategory(2);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v63 = v54;
      if (v60)
        v55 = v60;
      v64 = 2114;
      v65 = v55;
      v66 = 2114;
      v67 = v41;
      _os_log_error_impl(&dword_1A3819000, v51, OS_LOG_TYPE_ERROR, "%{public}@: Could not create slider specifier for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v29 = 0;
    v30 = v57;
    v39 = (void *)v58;
  }

  return v29;
}

- (id)_uiValueFromValue:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id *v7;
  int v8;
  id *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("TrueValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id *)MEMORY[0x1E0C9AE50];
  if (!v6)
    v6 = (id)*MEMORY[0x1E0C9AE50];
  v8 = objc_msgSend(v5, "isEqual:", v6);

  v9 = (id *)MEMORY[0x1E0C9AE40];
  if (v8)
    v9 = v7;
  v10 = *v9;

  return v10;
}

- (id)_valueFromUIValue:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "propertyForKey:", CFSTR("TrueValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("FalseValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v7 = (id)*MEMORY[0x1E0C9AE50];
    if (v8)
      goto LABEL_3;
  }
  v8 = (id)*MEMORY[0x1E0C9AE40];
LABEL_3:
  v9 = objc_msgSend(v6, "BOOLValue");

  if (v9)
    v10 = v7;
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (id)_readToggleSwitchSpecifierValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[PSViewController readPreferenceValue:](self, "readPreferenceValue:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "propertyForKey:", CFSTR("negate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "BOOLValue") ^ 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    objc_msgSend(v4, "setProperty:forKey:", v6, CFSTR("value"));
  }
  else
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("default"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = 0;
      goto LABEL_8;
    }
    v6 = (void *)v10;
    -[PSAppListController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v10, v4);
  }
  -[PSAppListController _uiValueFromValue:specifier:](self, "_uiValueFromValue:specifier:", v6, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v11, CFSTR("value"));

LABEL_8:
  return v11;
}

- (void)_setToggleSwitchSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PSAppListController _valueFromUIValue:specifier:](self, "_valueFromUIValue:specifier:", v12, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "propertyForKey:", CFSTR("defaults"));
  v9 = objc_msgSend(v6, "propertyForKey:", CFSTR("key"));
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0)
  {
    NSLog(CFSTR("ERROR: couldn't write %@ to %@ in %@"), v7, v9, v8);
  }
  else
  {
    -[PSAppListController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v12, v6);
    GSSendAppPreferencesChanged();
  }

}

- (void)showPrivacyControllerForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[PSAppListController onBoardingKitBundleIDDict](PSAppListController, "onBoardingKitBundleIDDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("AppBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithIdentifier:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPresentingViewController:", self);
    objc_msgSend(v7, "present");

  }
}

- (void)showPrivacyControllerForBundleName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[PSAppListController onBoardingKitBundleNameDict](PSAppListController, "onBoardingKitBundleNameDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyForKey:", CFSTR("AppBundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppSettingsBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getOBPrivacyPresenterClass(), "presenterForPrivacySplashWithBundleAtPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPresentingViewController:", self);
    objc_msgSend(v11, "present");

  }
}

+ (id)allowedPrivacyBundlesForID
{
  if (allowedPrivacyBundlesForID_onceToken != -1)
    dispatch_once(&allowedPrivacyBundlesForID_onceToken, &__block_literal_global_20);
  return (id)allowedPrivacyBundlesForID_allowedPrivacyBundlesForID;
}

void __49__PSAppListController_allowedPrivacyBundlesForID__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PSAppListController onBoardingKitBundleIDDict](PSAppListController, "onBoardingKitBundleIDDict");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedPrivacyBundlesForID_allowedPrivacyBundlesForID;
  allowedPrivacyBundlesForID_allowedPrivacyBundlesForID = v0;

}

+ (id)allowedPrivacyBundlesForName
{
  if (allowedPrivacyBundlesForName_onceToken != -1)
    dispatch_once(&allowedPrivacyBundlesForName_onceToken, &__block_literal_global_25);
  return (id)allowedPrivacyBundlesForName_allowedPrivacyBundlesForName;
}

void __51__PSAppListController_allowedPrivacyBundlesForName__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PSAppListController onBoardingKitBundleNameDict](PSAppListController, "onBoardingKitBundleNameDict");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedPrivacyBundlesForName_allowedPrivacyBundlesForName;
  allowedPrivacyBundlesForName_allowedPrivacyBundlesForName = v0;

}

+ (id)onBoardingKitBundleIDDict
{
  if (onBoardingKitBundleIDDict_onceToken != -1)
    dispatch_once(&onBoardingKitBundleIDDict_onceToken, &__block_literal_global_26);
  return (id)onBoardingKitBundleIDDict_dict;
}

void __48__PSAppListController_onBoardingKitBundleIDDict__block_invoke()
{
  void *v0;

  v0 = (void *)onBoardingKitBundleIDDict_dict;
  onBoardingKitBundleIDDict_dict = (uint64_t)&unk_1E4A93318;

}

+ (id)onBoardingKitBundleNameDict
{
  if (onBoardingKitBundleNameDict_onceToken != -1)
    dispatch_once(&onBoardingKitBundleNameDict_onceToken, &__block_literal_global_36);
  return (id)onBoardingKitBundleNameDict_dict;
}

void __50__PSAppListController_onBoardingKitBundleNameDict__block_invoke()
{
  void *v0;

  v0 = (void *)onBoardingKitBundleNameDict_dict;
  onBoardingKitBundleNameDict_dict = (uint64_t)&unk_1E4A93340;

}

+ (BOOL)canUseOnBoardingKitForPrivacyDisplayForBundleID:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[PSAppListController allowedPrivacyBundlesForID](PSAppListController, "allowedPrivacyBundlesForID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (BOOL)canUseOnBoardingKitFOrPrivacyDisplayForBundleName:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[PSAppListController allowedPrivacyBundlesForName](PSAppListController, "allowedPrivacyBundlesForName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)postThirdPartySettingDidChangeNotificationForSpecifier:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "propertyForKey:", CFSTR("AppBundleID"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    _CFPreferencesPostValuesChangedInDomains();
  }

}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSAppListController;
  v6 = a4;
  -[PSViewController setPreferenceValue:specifier:](&v7, sel_setPreferenceValue_specifier_, a3, v6);
  -[PSAppListController postThirdPartySettingDidChangeNotificationForSpecifier:](self, "postThirdPartySettingDidChangeNotificationForSpecifier:", v6, v7.receiver, v7.super_class);

}

+ (id)radioGroupSpecifiersFromDictionary:(id)a3 stringsTable:(id)a4 parentSpecifier:(id)a5 target:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  objc_class *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v61;
  void *v63;
  id v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v61 = a4;
  v10 = a5;
  v64 = a6;
  objc_opt_class();
  v60 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppBundleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v9, "objectForKey:", CFSTR("DefaultValue"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Values"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Titles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DisplaySortedByTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  v26 = objc_msgSend(v25, "BOOLValue");
  v59 = v13;
  v27 = (__CFString *)v13;
  v28 = v16;
  if (-[__CFString length](v27, "length")
    && objc_msgSend(v16, "length")
    && v65
    && v19
    && v22
    && objc_msgSend(v19, "count")
    && (v29 = objc_msgSend(v19, "count"), v29 == objc_msgSend(v22, "count")))
  {
    v30 = v61;
    v31 = v60;
    objc_msgSend(a1, "groupSpecifierFromDictionary:stringsTable:parentSpecifier:target:", v9, v61, v60, v64);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "propertyForKey:", CFSTR("AppBundleID"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setProperty:forKey:", v33, CFSTR("isRadioGroup"));

    objc_msgSend(v32, "setProperty:forKey:", v58, CFSTR("defaults"));
    objc_msgSend(v32, "setProperty:forKey:", v28, CFSTR("key"));
    objc_msgSend(v32, "setProperty:forKey:", v65, CFSTR("default"));
    objc_msgSend(v32, "setProperty:forKey:", v58, CFSTR("AppBundleID"));
    objc_msgSend(v32, "setProperty:forKey:", v58, CFSTR("containerBundleID"));
    objc_msgSend(a1, "localizedTitlesFromUnlocalizedTitles:stringsTable:parentSpecifier:", v22, v61, v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValues:titles:shortTitles:usingLocalizedTitleSorting:", v19, v63, 0, v26);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count") + 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v32);
    +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "values");
    v36 = v28;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __94__PSAppListController_radioGroupSpecifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke;
    v66[3] = &unk_1E4A67AB0;
    v67 = v32;
    v68 = v35;
    v38 = v34;
    v69 = v38;
    v39 = v32;
    v40 = v35;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v66);

    v28 = v36;
    v41 = v64;

    v42 = (__CFString *)v59;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Key"), v44, objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "appendFormat:", CFSTR("\n\t%@ String length is %@ (must be greater than 0)."), v45, v46);

    v47 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Values"), v47, objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v48, v49);

    v50 = objc_opt_class();
    objc_msgSend(a1, "_typeErrorStringForKeyWithName:expectedType:actualType:", CFSTR("Titles"), v50, objc_opt_class());
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "appendFormat:", CFSTR("\n\t%@ Number of items is %@ (must be greater than 0)."), v51, v52);

    PKLogForCategory(2);
    v53 = objc_claimAutoreleasedReturnValue();
    v42 = (__CFString *)v59;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = CFSTR("unknown");
      *(_DWORD *)buf = 138543874;
      v71 = v56;
      if (v59)
        v57 = v59;
      v72 = 2114;
      v73 = v57;
      v74 = 2114;
      v75 = v43;
      _os_log_error_impl(&dword_1A3819000, v53, OS_LOG_TYPE_ERROR, "%{public}@: Could not create radio group specifiers for application '%{public}@' due to invalid input. %{public}@", buf, 0x20u);

    }
    v38 = 0;
    v31 = v60;
    v30 = v61;
    v41 = v64;
  }

  return v38;
}

void __94__PSAppListController_radioGroupSpecifiersFromDictionary_stringsTable_parentSpecifier_target___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "titleDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, 0, 0, 0, 0, 3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProperty:forKey:", v4, CFSTR("value"));
  v7 = objc_msgSend(a1[5], "isEqual:", v4);

  if (v7)
    objc_msgSend(a1[4], "setProperty:forKey:", v8, CFSTR("radioGroupCheckedSpecifier"));
  objc_msgSend(a1[6], "addObject:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSAppListController;
  -[PSListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PSListController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("NOTIFICATIONS"));
  -[PSListController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("SIRI"));
  -[PSListController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("SEARCH"));
}

- (id)specifiers
{
  NSArray *specifiers;
  NSArray *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  PSSystemPolicyForApp *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  PSSpecifier *specifier;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  void *v44;
  NSArray *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  PSDriverPolicyForApp *v58;
  void *v59;
  void *v60;
  void *v61;
  PSSpecifier *v62;
  void *v63;
  void *v64;
  NSArray *v65;
  NSArray *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;

  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("isThirdPartyDetail"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v76 = v7;
    if ((v7 & 1) != 0)
    {
      v68 = 1;
    }
    else
    {
      -[PSAppListController appPolicy](self, "appPolicy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = -[PSSystemPolicyForApp initWithBundleIdentifier:]([PSSystemPolicyForApp alloc], "initWithBundleIdentifier:", v5);
        -[PSAppListController setAppPolicy:](self, "setAppPolicy:", v9);

        -[PSAppListController appPolicy](self, "appPolicy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDelegate:", self);

        -[PSAppListController appPolicy](self, "appPolicy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSAppListController setSystemPolicy:](self, "setSystemPolicy:", v11);

      }
      -[PSAppListController systemPolicy](self, "systemPolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "specifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = objc_msgSend(v13, "count") == 0;
      -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v13);

    }
    -[PSAppListController title](self, "title");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSListController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("KeyboardExtension"), self, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v71 = (void *)v16;
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v16);
    v72 = (void *)v14;
    -[PSListController setTitle:](self, "setTitle:", v14);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("File"));
    v18 = objc_claimAutoreleasedReturnValue();
    -[PSAppListController bundle](self, "bundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathForResource:ofType:", v18, CFSTR("plist"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "length"))
      NSLog(CFSTR("ERROR: Can't find plist %@ in bundle %@"), v18, v19);
    v69 = v19;
    v70 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0x1E0CB3000uLL;
    v73 = v20;
    v74 = v5;
    v75 = v21;
    if (v21)
    {
      objc_opt_class();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("StringsTable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
      v25 = v24;

      if (v25)
      {
        specifier = self->super.super._specifier;
        objc_msgSend(v25, "stringByDeletingPathExtension");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](specifier, "setProperty:forKey:", v27, CFSTR("StringsTable"));

      }
      v67 = v4;
      objc_opt_class();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ApplicationGroupContainerIdentifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = v29;

      if (v30)
      {
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "groupContainerURLs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[PSSpecifier setProperty:forKey:](self->super.super._specifier, "setProperty:forKey:", v30, CFSTR("appGroupBundleID"));
          -[PSSpecifier setProperty:forKey:](self->super.super._specifier, "setProperty:forKey:", v30, CFSTR("containerBundleID"));
        }

      }
      objc_opt_class();
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("PreferenceSpecifiers"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v35 = v34;
      else
        v35 = 0;
      v36 = v35;

      v37 = objc_msgSend(v36, "count");
      if (v37)
      {
        v38 = v37;
        for (i = 0; i != v38; ++i)
        {
          objc_msgSend(v36, "objectAtIndex:", i);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "specifiersFromDictionary:stringsTable:parentSpecifier:target:", v40, v25, self->super.super._specifier, self);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
            objc_msgSend(v17, "addObjectsFromArray:", v41);

        }
      }

      v4 = v67;
      v20 = v73;
      v5 = v74;
      v21 = v75;
      v22 = 0x1E0CB3000;
    }
    else
    {
      NSLog(CFSTR("ERROR: Couldn't load plist from %@"), v20);
    }
    v42 = objc_msgSend(v17, "count");
    v43 = v76;
    if (!v42)
      v43 = 1;
    if (((v43 | v68) & 1) == 0)
    {
      v44 = v5;
      v45 = v4;
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedName");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = *(void **)(v22 + 2368);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("APP_SETTINGS"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", v50, v47);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedUppercaseString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "firstObject");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "length");

      if (v55)
      {
        +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v52);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v45;
        -[NSArray addObject:](v45, "addObject:", v56);
      }
      else
      {
        objc_msgSend(v17, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setName:", v52);
        v4 = v45;
      }

      v20 = v73;
      v5 = v74;
      v21 = v75;
    }
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v17);
    if ((v76 & 1) == 0)
    {
      -[PSAppListController driverPolicy](self, "driverPolicy");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
        v58 = -[PSDriverPolicyForApp initWithBundleIdentifier:]([PSDriverPolicyForApp alloc], "initWithBundleIdentifier:", v5);
        -[PSAppListController setDriverPolicy:](self, "setDriverPolicy:", v58);

        -[PSAppListController driverPolicy](self, "driverPolicy");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setDelegate:", self);

      }
      -[PSAppListController driverPolicy](self, "driverPolicy");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "specifiers");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", v61);
    }
    v62 = self->super.super._specifier;
    if (v62)
    {
      -[PSSpecifier propertyForKey:](v62, "propertyForKey:", CFSTR("id"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v63)
      {
        -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("AppBundleID"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](self->super.super._specifier, "setProperty:forKey:", v64, CFSTR("id"));

      }
    }
    v65 = self->super._specifiers;
    self->super._specifiers = v4;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSAppListController;
  v6 = a4;
  -[PSListController tableView:didSelectRowAtIndexPath:](&v12, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = objc_msgSend(v6, "section", v12.receiver, v12.super_class);

  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexOfGroup:](self, "indexOfGroup:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("isRadioGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "BOOLValue");

  if ((_DWORD)v6)
  {
    objc_msgSend(v8, "propertyForKey:", CFSTR("radioGroupCheckedSpecifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSAppListController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v11, v8);

  }
}

- (id)bundle
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("AppSettingsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    v7 = v3;
  }
  else
  {
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("AppBundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSystemPolicyManager thirdPartyApplicationForBundleID:](PSSystemPolicyManager, "thirdPartyApplicationForBundleID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Settings.bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](self->super.super._specifier, "setProperty:forKey:", v7, CFSTR("AppSettingsBundle"));
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)_typeErrorStringForKeyWithName:(id)a3 expectedType:(Class)a4 actualType:(Class)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  NSStringFromClass(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("The type of the '%@' key is %@ (expected %@)"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PSSystemPolicyForApp)systemPolicy
{
  return self->_systemPolicy;
}

- (void)setSystemPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_systemPolicy, a3);
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_driverPolicy, a3);
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_appPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_systemPolicy, 0);
}

+ (void)specifiersFromDictionary:(uint64_t)a1 stringsTable:(NSObject *)a2 parentSpecifier:target:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Preference Items array contains an object that isn't a dictionary", (uint8_t *)&v5, 0xCu);

}

@end
