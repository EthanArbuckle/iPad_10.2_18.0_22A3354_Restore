@implementation _SWCSubstitutionVariableList

+ (_SWCSubstitutionVariableList)cheapBuiltInSubstitutionVariableList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___SWCSubstitutionVariableList_cheapBuiltInSubstitutionVariableList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED1B6138 != -1)
    dispatch_once(&qword_1ED1B6138, block);
  return (_SWCSubstitutionVariableList *)(id)qword_1ED1B6130;
}

+ (_SWCSubstitutionVariableList)expensiveBuiltInSubstitutionVariableList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___SWCSubstitutionVariableList_expensiveBuiltInSubstitutionVariableList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED1B6148 != -1)
    dispatch_once(&qword_1ED1B6148, block);
  return (_SWCSubstitutionVariableList *)(id)qword_1ED1B6140;
}

+ (_SWCSubstitutionVariableList)substitutionVariableListWithDictionary:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  char *Instance;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = (void *)MEMORY[0x1A85D4B3C](a1, a2);
  if ((_NSIsNSDictionary() & 1) != 0)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("substitutionVariables"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __71___SWCSubstitutionVariableList_substitutionVariableListWithDictionary___block_invoke;
      v13[3] = &unk_1E547CEA8;
      v8 = v7;
      v14 = v8;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
      if (qword_1ED1B6158 != -1)
        dispatch_once(&qword_1ED1B6158, &__block_literal_global_202);
      objc_msgSend(v8, "appendBytes:length:", &byte_1ED1B6129, SWCSubstitutionVariable::getSize((SWCSubstitutionVariable *)&byte_1ED1B6129));
      Instance = (char *)class_createInstance((Class)a1, objc_msgSend(v8, "length"));
      v10 = objc_retainAutorelease(v8);
      memcpy(Instance + 8, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));

    }
    else
    {
      Instance = 0;
    }

    v11 = Instance;
  }
  else
  {
    v11 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return (_SWCSubstitutionVariableList *)v11;
}

- (unint64_t)count
{
  SWCSubstitutionVariable *variables;
  unint64_t v3;

  variables = self->_variables;
  if ((*(_BYTE *)self->_variables & 1) != 0)
    return 0;
  v3 = 0;
  do
  {
    ++v3;
    variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
  }
  while ((*(_BYTE *)variables & 1) == 0);
  return v3;
}

- (void)enumerateSubstitutionVariablesWithBlock:(id)a3
{
  uint64_t v4;
  SWCSubstitutionVariable *variables;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = 0;
  variables = self->_variables;
  v9 = 0;
  do
  {
    if ((*(_BYTE *)variables & 1) != 0)
      break;
    v6 = (void *)MEMORY[0x1A85D4B3C]();
    SWCSubstitutionVariable::getNameNoCopy(variables);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SWCSubstitutionVariable::getValuesNoCopy(variables);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, uint64_t, char *))a3 + 2))(a3, v7, v8, v4, &v9);

    objc_autoreleasePoolPop(v6);
    ++v4;
    variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
  }
  while (!v9);
}

- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SWCSubstitutionVariable *variables;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _SWCSubstitutionVariableList *v21;
  _BOOL4 v22;
  void *v23;
  _QWORD v24[2];

  v4 = a4;
  v22 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = self;
  v8 = (char)self->_variables[0];
  variables = self->_variables;
  if ((v8 & 1) == 0)
  {
    if (v22)
      v9 = 11;
    else
      v9 = 10;
    do
    {
      if (v4)
      {
        objc_msgSend(v6, "addObject:", CFSTR("<private>"));
      }
      else
      {
        v10 = (void *)MEMORY[0x1A85D4B3C]();
        SWCSubstitutionVariable::getNameNoCopy(variables);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v11;
        SWCSubstitutionVariable::getValuesNoCopy(variables);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, v9, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
          objc_msgSend(v6, "addObject:", v15);

        }
        else
        {
          objc_msgSend(v6, "addObject:", CFSTR("?"));
        }

        objc_autoreleasePoolPop(v10);
      }
      variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
    }
    while ((*(_BYTE *)variables & 1) == 0);
  }
  if (v22)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = objc_opt_class();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("<%@ %p> %@"), v17, v21, v18);

  }
  else
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  SWCSubstitutionVariable *variables;
  char v6;
  SWCSubstitutionVariable *v7;
  size_t v8;
  SWCSubstitutionVariable *v9;
  uint64_t Size;
  uint64_t v11;
  SWCSubstitutionVariable *v12;
  uint64_t v13;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = (char)self->_variables[0];
  variables = self->_variables;
  v7 = (SWCSubstitutionVariable *)((char *)a3 + 8);
  v8 = 0;
  if ((v6 & 1) == 0)
  {
    v9 = variables;
    do
    {
      Size = SWCSubstitutionVariable::getSize(v9);
      v8 += Size;
      v9 = (SWCSubstitutionVariable *)((char *)v9 + Size);
    }
    while ((*(_BYTE *)v9 & 1) == 0);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v12 = v7;
    do
    {
      v13 = SWCSubstitutionVariable::getSize(v12);
      v11 += v13;
      v12 = (SWCSubstitutionVariable *)((char *)v12 + v13);
    }
    while ((*(_BYTE *)v12 & 1) == 0);
  }
  return v8 == v11 && memcmp(variables, v7, v8) == 0;
}

- (unint64_t)hash
{
  SWCSubstitutionVariable *variables;
  unint64_t v3;
  unint64_t Size;

  variables = self->_variables;
  if ((*(_BYTE *)self->_variables & 1) != 0)
    return 0;
  v3 = 0;
  do
  {
    Size = SWCSubstitutionVariable::getSize(variables);
    v3 ^= std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)variables, Size);
    variables = (SWCSubstitutionVariable *)((char *)variables + Size);
  }
  while ((*(_BYTE *)variables & 1) == 0);
  return v3;
}

- (id)description
{
  return -[_SWCSubstitutionVariableList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 0, 0);
}

- (id)debugDescription
{
  return -[_SWCSubstitutionVariableList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 1, 0);
}

- (id)redactedDescription
{
  return -[_SWCSubstitutionVariableList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 0, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;
  SWCSubstitutionVariable *variables;
  char v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1A85D4B3C](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (char)self->_variables[0];
  variables = self->_variables;
  if ((v8 & 1) == 0)
  {
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", variables, SWCSubstitutionVariable::getSize(variables), 0);
      if (v9)
        objc_msgSend(v6, "addObject:", v9);

      variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
    }
    while ((*(_BYTE *)variables & 1) == 0);
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("substitutionVariableData"));

  objc_autoreleasePoolPop(v5);
}

- (_SWCSubstitutionVariableList)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  size_t v12;
  uint64_t v13;
  SWCSubstitutionVariable *v14;
  SWCSubstitutionVariable *v15;
  uint64_t Size;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _SWCSubstitutionVariableList *v22;
  id v23;
  id v24;
  void *context;
  id v27;
  void *v28;
  _SWCSubstitutionVariableList *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  const __CFString *v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[1024];
  uint64_t v44;

  v29 = self;
  v44 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85D4B3C](self, a2);
  objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("substitutionVariableData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v36[0] = CFSTR("Line");
    v36[1] = CFSTR("Function");
    v37[0] = &unk_1E5480DC8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCSubstitutionVariableList initWithCoder:]");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v37[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865);
    objc_msgSend(a3, "failWithError:");
    v22 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v35;
  v28 = v6;
  if (v6)
  {
    if (_NSIsNSArray())
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (!v8)
        goto LABEL_22;
      v9 = *(_QWORD *)v32;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (_NSIsNSData())
          {
            v12 = objc_msgSend(v11, "length");
            v13 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
            if (v12)
            {
              v14 = (SWCSubstitutionVariable *)v13;
              if (v12 + 2 < 0x401)
              {
                v15 = (SWCSubstitutionVariable *)v43;
              }
              else
              {
                v15 = (SWCSubstitutionVariable *)malloc_type_malloc(v12 + 2, 0x7E3352D0uLL);
                if (!v15)
                  continue;
              }
              memcpy(v15, v14, v12);
              *(_WORD *)((char *)v15 + v12) = 0;
              Size = SWCSubstitutionVariable::getSize(v15);
              if (v15 != (SWCSubstitutionVariable *)v43)
                free(v15);
              v17 = Size == v12;
              v4 = v5;
              if (v17)
              {
                SWCSubstitutionVariable::getValuesNoCopy(v14);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                SWCSubstitutionVariable::getNameNoCopy(v14);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v18, v19);

              }
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        if (!v8)
        {
LABEL_22:

          v20 = (void *)objc_opt_class();
          v40 = CFSTR("substitutionVariables");
          v41 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "substitutionVariableListWithDictionary:", v21);
          v22 = (_SWCSubstitutionVariableList *)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
      }
    }

    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v38[0] = CFSTR("Line");
    v38[1] = CFSTR("Function");
    v39[0] = &unk_1E5480DB0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCSubstitutionVariableList initWithCoder:]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (_SWCSubstitutionVariableList *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v21);
    objc_msgSend(a3, "failWithError:");
    v22 = 0;
LABEL_26:

    goto LABEL_27;
  }

  objc_msgSend(a3, "failWithError:", v27);
  v22 = 0;

LABEL_28:
  objc_autoreleasePoolPop(context);
  return v22;
}

@end
