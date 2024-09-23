@implementation NSDictionary(MTLJSONKeyPath)

- (id)mtl_valueForJSONKeyPath:()MTLJSONKeyPath success:error:
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = objc_msgSend(v6, "characterAtIndex:", v11);
      if (v13 == 46)
      {
        objc_msgSend(v6, "substringWithRange:", v10, v11 - v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v9 & 1) != 0)
        {
          objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\."), CFSTR("."));
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v18;
        }
        if (v12)
          objc_msgSend(v12, "addObject:", v17);
        else
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);
        v14 = v11 + 1;

        v9 = 0;
        v10 = v11 + 1;
      }
      else if (v13 == 92)
      {
        v14 = v11 + 1;
        if (v11 + 1 < v8)
        {
          v15 = objc_msgSend(v6, "characterAtIndex:", v11 + 1);
          if (v15 == 46)
            v14 = v11 + 2;
          else
            v14 = v11;
          v9 |= v15 == 46;
        }
      }
      else
      {
        v14 = v11 + 1;
      }
      v11 = v14;
    }
    while (v14 < v8);
    if (v10)
    {
      objc_msgSend(v6, "substringWithRange:", v10, v8 - v10);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v6;
    }
    v20 = v19;
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\."), CFSTR("."));
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (id)v21;
    }
    if (v12)
    {
      objc_msgSend(v12, "addObject:", v20);
      v22 = v12;
      v23 = v22;
      goto LABEL_27;
    }
  }
  else
  {
    v20 = v6;
  }
  v52[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
LABEL_27:

  v24 = a1;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v46;
    v42 = v24;
    while (2)
    {
      v29 = 0;
      v30 = v24;
      do
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v25);
        if (!v30)
        {
          v24 = 0;
          goto LABEL_40;
        }
        v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v29);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v32 = (id)objc_claimAutoreleasedReturnValue();

        if (v30 == v32)
        {
          v24 = v30;
          goto LABEL_40;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a5)
          {
            v49[0] = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Invalid JSON dictionary"), &stru_1E7AFA810, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49[1] = *MEMORY[0x1E0CB2D68];
            v50[0] = v36;
            v37 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("JSON key path %1$@ could not resolved because an incompatible JSON dictionary was supplied: \"%2$@\"), &stru_1E7AFA810, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", v39, v6, v42);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v50[1] = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MTLJSONAdapterErrorDomain"), 3, v41);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          if (a4)
            *a4 = 0;

          v33 = 0;
          goto LABEL_43;
        }
        objc_msgSend(v30, "objectForKeyedSubscript:", v31);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        ++v29;
        v30 = v24;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v27)
        continue;
      break;
    }
  }
LABEL_40:

  if (a4)
    *a4 = 1;
  v30 = v24;
  v33 = v30;
LABEL_43:

  return v33;
}

@end
