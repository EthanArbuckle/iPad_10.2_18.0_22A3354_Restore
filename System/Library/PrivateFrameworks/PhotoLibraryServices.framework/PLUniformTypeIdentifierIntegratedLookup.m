@implementation PLUniformTypeIdentifierIntegratedLookup

+ (signed)conformanceHintForIdentifier:(id)a3
{
  id v3;
  unsigned int v4;
  signed __int16 v5;
  __int16 v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;

  v3 = a3;
  v4 = PLFileTypeFromIdentifier(v3);
  if (v4)
  {
    v5 = 2;
    if (v4 <= 0x27)
    {
      if (((0xF800000uLL >> v4) & 1) != 0)
        v6 = 3;
      else
        v6 = 0;
      if (((0x1DEuLL >> v4) & 1) != 0)
        v6 = 1;
      if (v4 > 0x25)
        v6 = 1;
      if (((0x7FFE00uLL >> v4) & 1) != 0)
        v5 = 2;
      else
        v5 = v6;
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0CEC520];
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5B8]) & 1) != 0)
      {
        v5 = 2;
      }
      else if ((objc_msgSend(v10, "conformsToType:", v7) & 1) != 0)
      {
        v5 = 1;
      }
      else if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]))
      {
        v5 = 3;
      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

+ (id)compactRepresentationForIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = PLFileTypeFromIdentifier(v3), (_DWORD)v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)compactRepresentationsForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "compactRepresentationForIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)identifierFromCompactRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "length");
  if (v4)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("_"))
      && (unint64_t)v4 > objc_msgSend(CFSTR("_"), "length"))
    {
      objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("_"), "length"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v5 = objc_msgSend(v3, "intValue");
    if ((int)v5 < 1)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543362;
        v11 = v3;
        v8 = "Unable to decode compact UTI value (non natural number): %{public}@";
        goto LABEL_11;
      }
    }
    else
    {
      PLUTTypeFromUniformFileType(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        goto LABEL_13;
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543362;
        v11 = v3;
        v8 = "Unable to decode compact UTI value (not in list): %{public}@";
LABEL_11:
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0xCu);
      }
    }

    v4 = 0;
  }
LABEL_13:

  return v4;
}

@end
