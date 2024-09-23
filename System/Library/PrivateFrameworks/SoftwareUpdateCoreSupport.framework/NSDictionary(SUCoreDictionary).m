@implementation NSDictionary(SUCoreDictionary)

- (id)safeDictionaryForKey:()SUCoreDictionary fromBase:withKeyDescription:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = v11;
  }
  else
  {
    objc_msgSend(a1, "_logReturningNil:forKey:valueType:fromBase:withKeyDescription:", v11, v8, CFSTR("dictionary"), v9, v10);
    v12 = 0;
  }

  return v12;
}

- (void)_logReturningNil:()SUCoreDictionary forKey:valueType:fromBase:withKeyDescription:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v11)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v15)
      {
        if (v18)
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138544386;
          v28 = v14;
          v29 = 2114;
          v30 = v12;
          v31 = 2114;
          v32 = v15;
          v33 = 2114;
          v34 = v20;
          v35 = 2114;
          v36 = v13;
          v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' (%{public}@) references value of the incorrect class (%"
                "{public}@), returning %{public}@ value: nil";
          v22 = v17;
          v23 = 52;
LABEL_14:
          _os_log_error_impl(&dword_1B05B8000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, v23);

        }
LABEL_15:

        goto LABEL_16;
      }
      if (!v18)
        goto LABEL_15;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v14;
      v29 = 2114;
      v30 = v12;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v13;
      v21 = "[SUCoreDictionary] [%{public}@] key '%{public}@' references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }
    else
    {
      if (!v15)
      {
        if (v18)
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v12;
          v29 = 2114;
          v30 = v20;
          v31 = 2114;
          v32 = v13;
          v21 = "[SUCoreDictionary] key '%{public}@' references value of the incorrect class (%{public}@), returning %{pu"
                "blic}@ value: nil";
          v22 = v17;
          v23 = 32;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (!v18)
        goto LABEL_15;
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v12;
      v29 = 2114;
      v30 = v15;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v13;
      v21 = "[SUCoreDictionary] key '%{public}@' (%{public}@) references value of the incorrect class (%{public}@), retur"
            "ning %{public}@ value: nil";
    }
    v22 = v17;
    v23 = 42;
    goto LABEL_14;
  }
LABEL_16:

}

- (uint64_t)safeDictionaryForKey:()SUCoreDictionary
{
  return objc_msgSend(a1, "safeDictionaryForKey:fromBase:withKeyDescription:", a3, 0, 0);
}

- (id)safeStringForKey:()SUCoreDictionary
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(a1, "_logReturningNil:forKey:valueType:", v5, v4, CFSTR("string"));
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_logReturningNil:()SUCoreDictionary forKey:valueType:
{
  return objc_msgSend(a1, "_logReturningNil:forKey:valueType:fromBase:withKeyDescription:", a3, a4, a5, 0, 0);
}

- (uint64_t)safeBooleanForKey:()SUCoreDictionary
{
  return objc_msgSend(a1, "safeBooleanForKey:defaultValue:", a3, 0);
}

- (uint64_t)safeBooleanForKey:()SUCoreDictionary defaultValue:
{
  id v6;
  void *v7;
  const __CFString *v8;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    if ((_DWORD)a4)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(a1, "_logReturningDefault:forKey:valueType:defaultValueName:", v7, v6, CFSTR("BOOLean"), v8);
  }

  return a4;
}

- (uint64_t)safeLLForKey:()SUCoreDictionary
{
  return objc_msgSend(a1, "safeLLForKey:defaultValue:", a3, 0);
}

- (uint64_t)safeLLForKey:()SUCoreDictionary defaultValue:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = objc_msgSend(v7, "longLongValue");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a4);
    objc_msgSend(a1, "_logReturningDefault:forKey:valueType:defaultValueName:", v7, v6, CFSTR("ll"), v8);

  }
  return a4;
}

- (uint64_t)safeULLForKey:()SUCoreDictionary
{
  return objc_msgSend(a1, "safeULLForKey:defaultValue:", a3, 0);
}

- (uint64_t)safeULLForKey:()SUCoreDictionary defaultValue:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = objc_msgSend(v7, "unsignedLongLongValue");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), a4);
    objc_msgSend(a1, "_logReturningDefault:forKey:valueType:defaultValueName:", v7, v6, CFSTR("ull"), v8);

  }
  return a4;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "safeIntegerForKey:defaultValue:", v4, objc_msgSend(&unk_1E612B8F0, "integerValue"));

  return v5;
}

- (uint64_t)safeIntegerForKey:()SUCoreDictionary defaultValue:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), a4);
    objc_msgSend(a1, "_logReturningDefault:forKey:valueType:defaultValueName:", v7, v6, CFSTR("integer"), v8);

  }
  return a4;
}

- (uint64_t)safeTriStateForKey:()SUCoreDictionary
{
  return objc_msgSend(a1, "safeTriStateForKey:defaultValue:", a3, 2);
}

- (unint64_t)safeTriStateForKey:()SUCoreDictionary defaultValue:
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "integerValue");
      if (v8 < 2)
        goto LABEL_12;
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:].cold.2((uint64_t)v6, (uint64_t)v7, v10);

    }
  }
  if (a4 >= 3)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSDictionary(SUCoreDictionary) safeTriStateForKey:defaultValue:].cold.1((uint64_t)v6, a4, v12);

    a4 = 2;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), a4);
  objc_msgSend(a1, "_logReturningDefault:forKey:valueType:defaultValueName:", v7, v6, CFSTR("integer"), v13);

  v8 = a4;
LABEL_12:

  return v8;
}

- (id)safeDataForKey:()SUCoreDictionary
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 1)) == 0)
  {
LABEL_6:
    objc_msgSend(a1, "_logReturningNil:forKey:valueType:", v5, v4, CFSTR("data"));
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (id)safeDateForKey:()SUCoreDictionary
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      objc_msgSend(v7, "dateFromString:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          goto LABEL_10;
        }
      }

    }
LABEL_9:
    objc_msgSend(a1, "_logReturningNil:forKey:valueType:", v5, v4, CFSTR("date"));
    v6 = 0;
    goto LABEL_10;
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (id)safeObjectForKey:()SUCoreDictionary ofClass:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    if (a4)
    {
      NSStringFromClass(a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        NSStringFromClass(a4);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("nil-object-class");
      }

    }
    else
    {
      v10 = CFSTR("nil-object-class");
    }
    objc_msgSend(a1, "_logReturningNil:forKey:valueType:", v7, v6, v10);

    v8 = 0;
  }

  return v8;
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary
{
  return objc_msgSend(a1, "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:", a3, 0, 3, 0, 0, 0);
}

- (uint64_t)safeDescriptionWithName:()SUCoreDictionary maxNestedLevel:withMaxValueLength:providingSubstitutionMap:
{
  return objc_msgSend(a1, "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:", a3, 0, a4, 0, a5, a6);
}

- (id)_safeDescriptionWithName:()SUCoreDictionary atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:
{
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  __CFString *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v14 = a3;
  v15 = a8;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByPaddingToLength:withString:startingAtIndex:", 4 * a4, CFSTR(" "), 0);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a6)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ <sub-dictionary>:\n%@{>>>\n"), v17, v14, v17);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@{>>>\n"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v45[5];
    v45[5] = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <dictionary>:\n{>>>\n"), v14);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v45[5];
    v45[5] = v19;
    v17 = &stru_1E611E1C8;
  }

  v21 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke;
  v39[3] = &unk_1E611C780;
  v39[4] = &v40;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v39);
  if (v41[3])
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%llu]"), a4);
    v30[0] = v21;
    v30[1] = 3221225472;
    v30[2] = __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2;
    v30[3] = &unk_1E611C7A8;
    v34 = &v40;
    v36 = a4;
    v37 = a5;
    v38 = a7;
    v31 = v15;
    v35 = &v44;
    v23 = v22;
    v32 = v23;
    v33 = v17;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v30);

  }
  v24 = (void *)v45[5];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<<<}"), v17);
  objc_msgSend(v24, "stringByAppendingString:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v45[5];
  v45[5] = v26;

  v28 = (id)v45[5];
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v28;
}

- (id)safeSubDescriptionAtNestedLevel:()SUCoreDictionary instanceAtLevel:withMaxValueLength:providingSubstitutionMap:
{
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a6;
  if (a3 == 1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke;
    v14[3] = &unk_1E611C7D0;
    v14[4] = v15;
    v14[5] = &v22;
    v14[6] = &v16;
    v14[7] = a4;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v14);
    v11 = (void *)v17[5];
    if (v11)
    {
      objc_msgSend(v11, "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:", v23[5], 1, 3, 1, a5, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_safeKeyName:()SUCoreDictionary paddedToLength:
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = v5;
  v8 = v7;
  v9 = a4 >= v6;
  v10 = a4 - v6;
  if (v10 != 0 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByPaddingToLength:withString:startingAtIndex:", v10, CFSTR(" "), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v12, v8);
LABEL_6:

    goto LABEL_7;
  }
  v13 = v7;
  if (!v9)
  {
    objc_msgSend(v7, "substringWithRange:", 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

+ (__CFString)_safeValueName:()SUCoreDictionary ofMaxFieldLength:providingSubstitutionMap:
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  unint64_t v17;
  void *v18;
  objc_class *v20;

  v7 = a3;
  v8 = a5;
  if (!v7)
  {
    v9 = CFSTR("<nil>");
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!a4 || objc_msgSend(v7, "length") <= a4)
      {
        v9 = (__CFString *)v7;
        goto LABEL_37;
      }
      if (!v8)
      {
        if (a4 < 8)
        {
          v9 = CFSTR("<NSString>");
          goto LABEL_37;
        }
        v17 = a4 - 2;
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "substringWithRange:", 0, v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.."), v11);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      +[SUCore limitString:toMaxLength:providingSubstitutionMap:](SUCore, "limitString:toMaxLength:providingSubstitutionMap:", v7, a4, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10 || objc_msgSend(v10, "length") > a4)
      {
        v9 = CFSTR("<NSString>");
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v7, "unsignedLongLongValue");
        if (!v12)
        {
          v9 = CFSTR("0[NO]");
          goto LABEL_37;
        }
        if (v12 == 1)
        {
          v9 = CFSTR("1[YES]");
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "descriptionWithLocale:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v9 = CFSTR("<NSNumber>");
          goto LABEL_36;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v11, "setDateFormat:", CFSTR("dd-MM-yyyy-hh-mm-ss"));
          objc_msgSend(v11, "stringFromDate:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            v9 = v13;
          else
            v9 = CFSTR("<NSDate>");

          goto LABEL_36;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = CFSTR("<NSDictionary>");
          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = CFSTR("<NSData>");
          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = CFSTR("<NSArray>");
          goto LABEL_37;
        }
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v9 = CFSTR("(not shown)");
          goto LABEL_36;
        }
      }
    }
    v16 = v11;
LABEL_35:
    v9 = v16;
    goto LABEL_36;
  }
  v9 = CFSTR("<NSNull>");
LABEL_37:

  return v9;
}

- (id)safeSummary
{
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = CFSTR("{");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke;
  v5[3] = &unk_1E611C7F8;
  v5[4] = v6;
  v5[5] = &v8;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_msgSend((id)v9[5], "stringByAppendingString:", CFSTR("}"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v9[5];
  v9[5] = v1;

  v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

+ (__CFString)safeSummaryForDictionary:()SUCoreDictionary
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "safeSummary");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("NOT-DICTIONARY");
    }
  }
  else
  {
    v4 = CFSTR("NONE");
  }

  return v4;
}

- (void)_logReturningDefault:()SUCoreDictionary forKey:valueType:defaultValueName:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (a3)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_ERROR, "[SUCoreDictionary] key '%{public}@' is the incorrect class, returning %{public}@ default value: %{public}@", (uint8_t *)&v14, 0x20u);
    }

  }
}

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_1B05B8000, a3, v6, "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning SUCoreTriStateNotSet", (uint8_t *)&v7);

}

- (void)safeTriStateForKey:()SUCoreDictionary defaultValue:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0_3(&dword_1B05B8000, a3, (uint64_t)a3, "[SUCoreDictionary] key '%{public}@' is invalid value: %{public}@, returning default value", (uint8_t *)&v3);
}

@end
