@implementation PSBiometricIdentity

+ (id)identities
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D02838], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identities:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)maximumIdentityCount
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0D02838], "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getMaxIdentityCount:", 1);

  return v3;
}

+ (void)removeIdentity:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D02838];
  v4 = a3;
  objc_msgSend(v3, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeIdentity:", v4);

}

+ (id)nameForIdentity:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

+ (void)setName:(id)a3 forIdentity:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setName:", a3);
  objc_msgSend(MEMORY[0x1E0D02838], "manager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateIdentity:", v5);

}

+ (id)nextIdentityName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  objc_msgSend(a1, "identities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "nameForIdentity:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }

  v9 = objc_msgSend(a1, "maximumIdentityCount");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v11, "setNumberStyle:", 0);
  if (v9)
  {
    for (i = 1; i <= v9; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromNumber:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CB3940];
      PSLocalizableMesaStringForKey(CFSTR("IDENTITY_NAME_FORMAT"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addObject:", v17);
    }
  }
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __39__PSBiometricIdentity_nextIdentityName__block_invoke;
  v31[3] = &unk_1E4A674D8;
  v19 = v3;
  v32 = v19;
  objc_msgSend(v10, "indexesOfObjectsPassingTest:", v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __39__PSBiometricIdentity_nextIdentityName__block_invoke_2;
  v24[3] = &unk_1E4A67500;
  v21 = v19;
  v25 = v21;
  v26 = &v27;
  objc_msgSend(v20, "enumerateRangesWithOptions:usingBlock:", 2, v24);
  if (v28[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndex:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v27, 8);
  return v22;
}

uint64_t __39__PSBiometricIdentity_nextIdentityName__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

unint64_t __39__PSBiometricIdentity_nextIdentityName__block_invoke_2(uint64_t a1, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= a2 && result - a2 < a3)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "count");
    a2 = result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

@end
