@implementation TIPlistFormattedAlignedTypingSequence

void __TIPlistFormattedAlignedTypingSequence_block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[6];

  v38[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inserted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_24FD49B78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v10;
  v35 = a1;
  v36 = v6;
  v33 = v9;
  if ((objc_msgSend(v10, "isAutocompleteTriggerForPreviousEntry") & 1) != 0
    || (objc_msgSend(v5, "isRevisedAutocompleteEntry") & 1) != 0)
  {
    TIAutocorrectionTypeForAutocorrectedAlignmentEntry(v6, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TIAutocorrectionTypeForNonAutocorrectedAlignmentEntry(v6, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v37[0] = CFSTR("intended");
  objc_msgSend(v5, "source", MEMORY[0x24BDBCED8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v14;
  v37[1] = CFSTR("touched");
  objc_msgSend(v5, "touched");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  plistFormattedTouchSequence(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v16;
  v37[2] = CFSTR("inserted");
  v34 = v8;
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v17;
  v37[3] = CFSTR("corrected");
  objc_msgSend(v5, "target");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = CFSTR("autocorrectionType");
  v38[3] = v19;
  v38[4] = v12;
  v31 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryWithDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(v35 + 48))
  {
    objc_msgSend(v5, "documentStates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("documentStates"));

  }
  objc_msgSend(v5, "sourceTransliteration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v5, "sourceTransliteration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("intendedTransliteration"));

  }
  if (*(_BYTE *)(v35 + 49))
  {
    objc_msgSend(v5, "predicted");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    plistFormattedPredictionSequence(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("predicted"));

  }
  if (*(_BYTE *)(v35 + 50))
  {
    objc_msgSend(v5, "inlineCompletions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    plistFormattedInlineCompletionsSequence(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("inlineCompletions"));

  }
  objc_msgSend(*(id *)(v35 + 40), "addObject:", v21);

}

@end
