@implementation NSDictionary

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v5, "length");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v3 > *(_QWORD *)(v4 + 24))
      *(_QWORD *)(v4 + 24) = v3;
  }

}

void __152__NSDictionary_SUCoreDictionary___safeDescriptionWithName_atNestedLevel_maxNestedLevel_showingSubLevelName_withMaxValueLength_providingSubstitutionMap___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "_safeKeyName:paddedToLength:", CFSTR("?"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@%@: ?\n"), a1[5], a1[6], v8, v23);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "_safeKeyName:paddedToLength:", v24, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18 = a1[5];
    v17 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D80], "_safeValueName:ofMaxFieldLength:providingSubstitutionMap:", v5, a1[11], a1[4]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@ %@%@: %@\n"), v18, v17, v8, v11);
LABEL_9:
    v14 = (void *)v19;
    objc_msgSend(v15, "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1[8] + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    goto LABEL_10;
  }
  if ((unint64_t)(a1[9] + 1) <= a1[10])
  {
    objc_msgSend(v5, "_safeDescriptionWithName:atNestedLevel:maxNestedLevel:showingSubLevelName:withMaxValueLength:providingSubstitutionMap:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@%@: <sub-dictionary>:\n%@\n"), a1[5], a1[6], v8, v11);
    goto LABEL_9;
  }
  v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@%@: <sub-dictionary> at depth=%llu\n"), a1[5], a1[6], v8, a1[9]);
LABEL_6:
  v11 = (void *)v10;
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[8] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;
LABEL_10:

}

void __126__NSDictionary_SUCoreDictionary__safeSubDescriptionAtNestedLevel_instanceAtLevel_withMaxValueLength_providingSubstitutionMap___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v11 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = *(_QWORD *)(a1[4] + 8);
      v10 = *(_QWORD *)(v9 + 24);
      if (v10 >= a1[7])
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
        *a4 = 1;
      }
      else
      {
        *(_QWORD *)(v9 + 24) = v10 + 1;
      }
    }
  }

}

void __45__NSDictionary_SUCoreDictionary__safeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingString:", CFSTR(","));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  if ((isKindOfClass & 1) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:"), v18);
    objc_msgSend(v11, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    objc_msgSend(*(id *)(v10 + 40), "stringByAppendingString:", CFSTR("?:"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

@end
