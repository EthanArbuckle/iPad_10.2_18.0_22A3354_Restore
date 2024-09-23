@implementation UITextInputSessionEfficacyAccumulator

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v8 = _UITextInputActionsSessionActionsEnumValueFromSource(a3);
    v23 = v8;
    if (v8 == 1)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_2;
      v14[3] = &unk_1E16E7718;
      v9 = *(_QWORD *)(a1 + 56);
      v18 = a3;
      v19 = v9;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v17 = &v20;
      v14[4] = v10;
      v15 = v11;
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0], v8);
      if (objc_msgSend(*(id *)(a1 + 48), "sessionHasOnlyPrimaryInput"))
        v12 = objc_msgSend(*(id *)(a1 + 32), "isPrimaryInput:", v21[3]);
      else
        v12 = 0;
      objc_msgSend(*(id *)(a1 + 48), "setSessionHasOnlyPrimaryInput:", v12);
      v13 = (objc_msgSend(*(id *)(a1 + 48), "sessionHasDictation") & 1) != 0 || v21[3] == 3;
      objc_msgSend(*(id *)(a1 + 48), "setSessionHasDictation:", v13);
    }
    _Block_object_dispose(&v20, 8);
  }

}

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = _UITextInputActionsSessionActionsEnumValueFromSourceAndType(*(_QWORD *)(a1 + 64), a3);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("UITextInputSessionEfficacyAccumulator.m"), 484, CFSTR("Received sessionActions of NotYetKnown despite providing action type"));

    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0]);
    if (objc_msgSend(*(id *)(a1 + 48), "sessionHasOnlyPrimaryInput"))
      v9 = objc_msgSend(*(id *)(a1 + 32), "isPrimaryInput:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    else
      v9 = 0;
    objc_msgSend(*(id *)(a1 + 48), "setSessionHasOnlyPrimaryInput:", v9);
    v10 = (objc_msgSend(*(id *)(a1 + 48), "sessionHasDictation") & 1) != 0
       || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 3;
    objc_msgSend(*(id *)(a1 + 48), "setSessionHasDictation:", v10);
  }
}

void __79___UITextInputSessionEfficacyAccumulator_computeSessionActionsStringOnSession___block_invoke_71(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v10 = v5;
    v7 = objc_msgSend(v5, "BOOLValue");
    v6 = v10;
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      _UITextInputActionsSessionActionsStringFromEnumValue(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:", v9);

      v6 = v10;
    }
  }

}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12[2];
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "computeSessionActionsStringOnSession:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_2;
  v13[3] = &unk_1E16E7808;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v9 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v12 = *(_OWORD *)(a1 + 40);
  v15 = v8;
  v17 = v9;
  v10 = v12[0];
  v16 = *(_OWORD *)v12;
  v11 = v8;
  v12[0] = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_3;
    v13[3] = &unk_1E16E77E0;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v18 = a3;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 72);
    v15 = v8;
    v17 = v9;
    v11 = *(_OWORD *)(a1 + 56);
    v10 = (id)v11;
    v16 = v11;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v14 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v14, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_4;
    v15[3] = &unk_1E16E77B8;
    v7 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 80);
    v16 = v8;
    v20 = v9;
    v21 = a3;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 72);
    v17 = v10;
    v19 = v11;
    v13 = *(_OWORD *)(a1 + 56);
    v12 = (id)v13;
    v18 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_5;
    v13[3] = &unk_1E16E7790;
    v7 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v7;
    v18 = a3;
    v19 = *(_OWORD *)(a1 + 80);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 72);
    v15 = v8;
    v17 = v9;
    v11 = *(_OWORD *)(a1 + 56);
    v10 = (id)v11;
    v16 = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
}

void __77___UITextInputSessionEfficacyAccumulator_enumerateTextInputActionsAnalytics___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[26];
  _QWORD v56[28];

  v56[26] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isAllZeroes") & 1) == 0)
  {
    v52 = v5;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("|"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cleanIdForPublishing:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 80) & 1;
    v10 = (*(_QWORD *)(a1 + 80) >> 2) & 1;
    v43 = objc_alloc(MEMORY[0x1E0C99E08]);
    v55[0] = CFSTR("src");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v48;
    v55[1] = CFSTR("type");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v47;
    v55[2] = CFSTR("netChars");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "netCharacters"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v46;
    v55[3] = CFSTR("usrRmChars");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "userRemovedCharacters"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v45;
    v55[4] = CFSTR("netEmojis");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "netEmojiCharacters"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v44;
    v55[5] = CFSTR("usrRmEmojis");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "userRemovedEmojiCharacters"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v42;
    v55[6] = CFSTR("isEmojiSearch");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v41;
    v55[7] = CFSTR("isMarkedText");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v40;
    v55[8] = CFSTR("inputActionCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "inputActions"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[8] = v39;
    v55[9] = CFSTR("largestSessionInsertion");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v11)
    {
      if (v11 >= 0xA)
      {
        if (v11 >> 4 < 0x271)
          v13 = 4;
        else
          v13 = 5;
        if (v11 >= 0x3E8)
          v14 = v13;
        else
          v14 = 3;
        if (v11 >= 0x64)
          v12 = v14;
        else
          v12 = 2;
      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[9] = v38;
    v55[10] = CFSTR("largestSessionDeletion");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v51 = v6;
    if (v15)
    {
      if (v15 >= 0xA)
      {
        if (v15 >> 4 < 0x271)
          v17 = 4;
        else
          v17 = 5;
        if (v15 >= 0x3E8)
          v18 = v17;
        else
          v18 = 3;
        if (v15 >= 0x64)
          v16 = v18;
        else
          v16 = 2;
      }
      else
      {
        v16 = 1;
      }
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56[10] = v37;
    v55[11] = CFSTR("sessionNetChars");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _UITextInputActionsNSIntegerToLog10Integer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88)));
    v19 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v19;
    v20 = MEMORY[0x1E0C9AAA0];
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
      v20 = MEMORY[0x1E0C9AAB0];
    v56[11] = v19;
    v56[12] = v20;
    v55[12] = CFSTR("sessionStartedWithDeletion");
    v55[13] = CFSTR("initialUsrRmChars");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[13] = v35;
    v55[14] = CFSTR("initialUsrRmEmojis");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 112));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56[14] = v34;
    v55[15] = CFSTR("sessionIsModeless");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v56[15] = v33;
    v55[16] = CFSTR("sessionActions");
    objc_msgSend(*(id *)(a1 + 48), "sessionActionString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56[16] = v32;
    v55[17] = CFSTR("sessionHasPrimaryInput");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "sessionHasOnlyPrimaryInput"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[17] = v21;
    v55[18] = CFSTR("sessionHasDictation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "sessionHasDictation"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[18] = v22;
    v55[19] = CFSTR("language");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v56[19] = v23;
    v55[20] = CFSTR("region");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v56[20] = v24;
    v55[21] = CFSTR("kbVariant");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56[21] = v25;
    v55[22] = CFSTR("kbLayout");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56[22] = v26;
    v55[23] = CFSTR("kbType");
    v50 = v7;
    objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v56[23] = v27;
    v49 = (void *)v8;
    v56[24] = v8;
    v55[24] = CFSTR("bundleId");
    v55[25] = CFSTR("internalProcId");
    v56[25] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v43, "initWithDictionary:", v28);

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
      objc_msgSend(v29, "addEntriesFromDictionary:");
    v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v6 = v51;
    v5 = v52;
    if (v30)
    {
      v53 = CFSTR("errors");
      v54 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addEntriesFromDictionary:", v31);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

@end
