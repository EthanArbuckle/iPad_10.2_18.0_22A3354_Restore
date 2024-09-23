@implementation PKApplicationMessageNodeMultipleGroupBranch

- (id)createSummary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  uint64_t v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_children, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v51 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), v40);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    while (1)
    {
      objc_msgSend(v3, "lastObject", v40);
      v9 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeLastObject");
      v10 = objc_msgSend(v9, "type");
      if (v10 == 2)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        if (v9)
          v22 = (void *)objc_msgSend(v9[5], "copy");
        else
          v22 = 0;
        objc_msgSend(v22, "reverseObjectEnumerator");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v47 != v25)
                objc_enumerationMutation(v15);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
            }
            v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v24);
        }
        goto LABEL_35;
      }
      if (v10 != 1)
        break;
      if (v9)
      {
        v15 = v9[6];
        v12 = (id *)objc_msgSend(v9[5], "copy");
      }
      else
      {
        v15 = 0;
        v12 = 0;
      }
      v16 = objc_msgSend(v12, "count");
LABEL_20:

      if (v15)
      {
        objc_msgSend(v41, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = (void *)MEMORY[0x1E0CB37E8];
          v20 = objc_msgSend(v17, "unsignedIntegerValue") + v16;
          v21 = v19;
        }
        else
        {
          objc_msgSend(v40, "addObject:", v15);
          v21 = (void *)MEMORY[0x1E0CB37E8];
          v20 = v16;
        }
        objc_msgSend(v21, "numberWithUnsignedInteger:", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v27, v15);

LABEL_35:
      }
LABEL_36:

      if (!objc_msgSend(v3, "count"))
        goto LABEL_43;
    }
    if (v10)
      goto LABEL_36;
    if (v9)
    {
      v11 = (id *)v9[5];
      v12 = v11;
      if (v11)
      {
        v13 = (id *)v11[2];
        v14 = v13;
        if (v13)
        {
          v15 = v13[2];
LABEL_16:

          v16 = 1;
          goto LABEL_20;
        }
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    v15 = 0;
    goto LABEL_16;
  }
LABEL_43:
  v28 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = v40;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
    v33 = 1;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
        if ((v33 & 1) == 0)
          objc_msgSend(v28, "appendString:", CFSTR(", "));
        objc_msgSend(v41, "objectForKeyedSubscript:", v35, v40);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v36, "unsignedIntegerValue") > 1)
          objc_msgSend(v35, "pluralSummary");
        else
          objc_msgSend(v35, "singularSummary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "appendString:", v37);
        if ((v33 & 1) != 0)
          v33 = 0;

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v31);
  }

  v38 = (void *)objc_msgSend(v28, "copy");
  return v38;
}

uint64_t __61__PKApplicationMessageNodeMultipleGroupBranch__sortWithDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a3;
  v6 = -[PKApplicationMessageNodeGroupBranch _primaryRegistration](a2);
  v7 = -[PKApplicationMessageNodeGroupBranch _primaryRegistration]((uint64_t)v5);

  v8 = PKApplicationMessageRegistrationComparison(v6, v7, *(void **)(a1 + 32));
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
