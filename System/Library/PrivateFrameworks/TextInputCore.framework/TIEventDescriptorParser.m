@implementation TIEventDescriptorParser

- (TIEventDescriptorParser)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIEventDescriptorParser;
  return -[TIDescriptorParser initWithErrorCode:](&v3, sel_initWithErrorCode_, 1);
}

- (void)parseEventDescriptors:(id)a3 andEventSpecs:(id)a4 fromConfig:(id)a5 errors:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  const __CFString *v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  v10 = a5;
  v23 = a6;
  v11 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v10, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[TIDescriptorParser context](self, "context", v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = CFSTR("event");
        v34 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDictionary:", v18);

        -[TIDescriptorParser parseDictionaryForKey:fromConfig:required:errors:](self, "parseDictionaryForKey:fromConfig:required:errors:", v16, v10, 1, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v27 = 0;
          v28 = 0;
          -[TIEventDescriptorParser parseEventDescriptor:andEventSpec:withName:fromConfig:errors:](self, "parseEventDescriptor:andEventSpec:withName:fromConfig:errors:", &v28, &v27, v16, v19, v11);
          v20 = v28;
          v21 = v27;
          v22 = v21;
          if (v20 && v21)
          {
            objc_msgSend(v25, "setObject:forKey:", v20, v16);
            objc_msgSend(v24, "setObject:forKey:", v22, v16);
          }
        }
        else
        {
          v20 = 0;
          v22 = 0;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v13);
  }

  objc_msgSend(v23, "addObjectsFromArray:", v11);
}

- (void)parseEventDescriptor:(id *)a3 andEventSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  unsigned int v42;
  void *v43;
  void *v44;
  id obj;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("eventDescription"), v13, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseBooleanForKey:fromConfig:required:errors:](self, "parseBooleanForKey:fromConfig:required:errors:", CFSTR("includeTestingParameters"), v13, 0, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v17, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);

  -[TIDescriptorParser parseDictionaryForKey:fromConfig:required:errors:](self, "parseDictionaryForKey:fromConfig:required:errors:", CFSTR("fieldDescriptors"), v13, 1, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_opt_new();
  v43 = (void *)objc_opt_new();
  v46 = (void *)objc_opt_new();
  v47 = v18;
  if (!v18)
    goto LABEL_18;
  v37 = a3;
  v38 = v16;
  v39 = a4;
  v40 = v14;
  v41 = v13;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v18, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (!v19)
    goto LABEL_15;
  v20 = v19;
  v21 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v51 != v21)
        objc_enumerationMutation(obj);
      v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
      -[TIDescriptorParser context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      objc_msgSend(v24, "setObject:forKey:", v12, CFSTR("event"));

      -[TIDescriptorParser parseDictionaryForKey:fromConfig:required:errors:](self, "parseDictionaryForKey:fromConfig:required:errors:", v23, v47, 1, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v48 = 0;
        v49 = 0;
        -[TIEventDescriptorParser parseFieldDescriptor:andFieldSpec:withName:fromConfig:errors:](self, "parseFieldDescriptor:andFieldSpec:withName:fromConfig:errors:", &v49, &v48, v23, v26, v15);
        v27 = v49;
        v28 = v48;
        v29 = v28;
        if (v27 && v28)
        {
          objc_msgSend(v44, "setObject:forKey:", v27, v23);
          objc_msgSend(v43, "setObject:forKey:", v29, v23);
          goto LABEL_13;
        }
      }
      else
      {
        v29 = 0;
        v27 = 0;
      }
      objc_msgSend(v46, "addObject:", v23);
LABEL_13:

      v12 = v25;
    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  }
  while (v20);
LABEL_15:

  v14 = v40;
  v13 = v41;
  v16 = v38;
  a4 = v39;
  a3 = v37;
  if (!objc_msgSend(v44, "count") && !objc_msgSend(v46, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain at least one value."), CFSTR("fieldDescriptors"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v30, v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v31);

  }
LABEL_18:
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v14, "addObjectsFromArray:", v15);
    v33 = v43;
    v32 = v44;
  }
  else
  {
    v32 = v44;
    objc_msgSend(v44, "allValues");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIEventDescriptor eventDescriptorWithEventName:eventDescription:fieldDescriptors:includeTestingParameters:](TIEventDescriptor, "eventDescriptorWithEventName:eventDescription:fieldDescriptors:includeTestingParameters:", v12, v16, v34, v42);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0DBDB18];
    v33 = v43;
    objc_msgSend(v43, "allValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "eventSpecWithName:inputModeRequired:fieldSpecs:", v12, 0, v36);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void)parseFieldDescriptor:(id *)a3 andFieldSpec:(id *)a4 withName:(id)a5 fromConfig:(id)a6 errors:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v24;

  v24 = a5;
  v10 = a6;
  v11 = a7;
  v12 = (void *)objc_opt_new();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("fieldDescription"), v10, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("metricName"), v10, 1, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("metricType"), v10, 1, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("dataType"), v10, 1, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser parseDictionaryForKey:fromConfig:required:errors:](self, "parseDictionaryForKey:fromConfig:required:errors:", CFSTR("constraints"), v10, 0, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("string")))
  {
    -[TIDescriptorParser parseStringForKey:fromConfig:required:errors:](self, "parseStringForKey:fromConfig:required:errors:", CFSTR("inactiveValue"), v10, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEventDescriptorParser parseStringFieldSpecWithName:fromConfig:errors:](self, "parseStringFieldSpecWithName:fromConfig:errors:", v24, v17, v12);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v20 = (void *)v19;
    goto LABEL_10;
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("integer")))
  {
    -[TIDescriptorParser parseIntegerForKey:fromConfig:required:errors:](self, "parseIntegerForKey:fromConfig:required:errors:", CFSTR("inactiveValue"), v10, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEventDescriptorParser parseIntegerFieldSpecWithName:fromConfig:errors:](self, "parseIntegerFieldSpecWithName:fromConfig:errors:", v24, v17, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("float")))
  {
    -[TIDescriptorParser parseNumberForKey:fromConfig:required:errors:](self, "parseNumberForKey:fromConfig:required:errors:", CFSTR("inactiveValue"), v10, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEventDescriptorParser parseFloatFieldSpecWithName:fromConfig:errors:](self, "parseFloatFieldSpecWithName:fromConfig:errors:", v24, v17, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("BOOLean")))
  {
    -[TIDescriptorParser parseBooleanForKey:fromConfig:required:errors:](self, "parseBooleanForKey:fromConfig:required:errors:", CFSTR("inactiveValue"), v10, 0, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEventDescriptorParser parseBooleanFieldSpecWithName:fromConfig:errors:](self, "parseBooleanFieldSpecWithName:fromConfig:errors:", v24, v17, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[TIDescriptorParser invalidValueErrorForKey:withValue:](self, "invalidValueErrorForKey:withValue:", CFSTR("dataType"), v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v21);

  v18 = 0;
  v20 = 0;
LABEL_10:
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v11, "addObjectsFromArray:", v12);
  }
  else
  {
    +[TIFieldDescriptor fieldDescriptorWithFieldName:fieldDescription:metricName:metricType:inactiveValue:](TIFieldDescriptor, "fieldDescriptorWithFieldName:fieldDescription:metricName:metricType:inactiveValue:", v24, v13, v14, v15, v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = objc_retainAutorelease(v20);
  }

}

- (id)parseStringFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v9)
  {
    -[TIDescriptorParser parseArrayForKey:fromConfig:required:errors:](self, "parseArrayForKey:fromConfig:required:errors:", CFSTR("allowedValues"), v9, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "count"))
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v13;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          v25 = v8;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              if (!objc_msgSend(MEMORY[0x1E0DBDB38], "isString:", v18) || !objc_msgSend(v18, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' values must all be strings."), CFSTR("allowedValues"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v19, v13);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v20);

                v8 = v25;
                goto LABEL_17;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            v8 = v25;
            if (v15)
              continue;
            break;
          }
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' must contain at least one value."), CFSTR("allowedValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v21, v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v22);

      }
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_17:
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "addObjectsFromArray:", v11);
    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:allowedValues:", v8, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)parseIntegerFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v9)
  {
    -[TIDescriptorParser parseIntegerForKey:fromConfig:required:errors:](self, "parseIntegerForKey:fromConfig:required:errors:", CFSTR("minValue"), v9, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser parseIntegerForKey:fromConfig:required:errors:](self, "parseIntegerForKey:fromConfig:required:errors:", CFSTR("maxValue"), v9, 0, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser parseIntegerForKey:fromConfig:required:errors:](self, "parseIntegerForKey:fromConfig:required:errors:", CFSTR("significantDigits"), v9, 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "addObjectsFromArray:", v11);
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", v8, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)parseFloatFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v9)
  {
    -[TIDescriptorParser parseFloatForKey:fromConfig:required:errors:](self, "parseFloatForKey:fromConfig:required:errors:", CFSTR("minValue"), v9, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser parseFloatForKey:fromConfig:required:errors:](self, "parseFloatForKey:fromConfig:required:errors:", CFSTR("maxValue"), v9, 0, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDescriptorParser parseIntegerForKey:fromConfig:required:errors:](self, "parseIntegerForKey:fromConfig:required:errors:", CFSTR("significantDigits"), v9, 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "addObjectsFromArray:", v11);
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDB20], "floatFieldSpecWithName:minValue:maxValue:significantDigits:", v8, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)parseBooleanFieldSpecWithName:(id)a3 fromConfig:(id)a4 errors:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", a3, a4, a5);
}

@end
