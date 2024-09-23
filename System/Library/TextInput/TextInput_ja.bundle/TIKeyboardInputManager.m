@implementation TIKeyboardInputManager

void __68__TIKeyboardInputManager_ja_Kana_validCharacterSetForAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 12353, 84);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("、。？！"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet = v0;

}

void __87__TIKeyboardInputManager_ja_Inline_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "removeInlineCandidate:", v4);
  objc_msgSend(WeakRetained, "markedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUncommittedText:", v5);

  objc_msgSend(WeakRetained, "inlineCandidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultCandidate:", v6);

  objc_msgSend(*(id *)(a1 + 32), "pushCandidateResultSet:", v4);
}

uint64_t __58__TIKeyboardInputManager_ja_Inline_removeInlineCandidate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_250122EC0;
  v7 = objc_msgSend(v3, "isEqualToString:", v6) ^ 1;

  return v7;
}

BOOL __51__TIKeyboardInputManager_ja_Romaji__convertToKana___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

BOOL __51__TIKeyboardInputManager_ja_Romaji__convertToKana___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

void __70__TIKeyboardInputManager_ja_Romaji_validCharacterSetForAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 97, 26);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("ー、。？！「」()-/:@$&[]{}#%^*+=_;|<>”’€£.,？！・\\"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet = v0;

}

void __94__TIKeyboardInputManager_ja_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputForMarkedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "liveConversionSegments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildMarkedText");

    objc_msgSend(*(id *)(a1 + 32), "markedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUncommittedText:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "pushCandidateResultSet:", v7);

}

void __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  uint64_t v28;
  id v29;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateResultSetFromWordSearchCandidateResultSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(*(id *)(a1 + 32), "transliterationCandidatesCount");

  if (v6 > v7)
  {
    objc_msgSend(v4, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "transliterationCandidatesCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultCandidate:", v9);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "autoSelectTransliterateCandidate"))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "indexFromTransliterationType:", objc_msgSend(*(id *)(a1 + 32), "autoSelectTransliterateCandidate"));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      objc_msgSend(v4, "setInitialSelectedIndex:", v10);
      objc_msgSend(*(id *)(a1 + 32), "transliterationCandidates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDefaultCandidate:", v13);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "autoSelectCandidate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = objc_msgSend(v4, "initialSelectedIndex");

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke_2;
      v27 = &unk_250122A08;
      v28 = *(_QWORD *)(a1 + 32);
      v17 = v4;
      v29 = v17;
      v18 = (void *)MEMORY[0x2349027B0](&v24);
      objc_msgSend(v17, "sortMethodGroups", v24, v25, v26, v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UI-Sort-Common"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "candidates");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v18);

      }
      if (objc_msgSend(v17, "initialSelectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v17, "candidates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "enumerateObjectsUsingBlock:", v18);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "autoSelectFirstCandidate")
    && objc_msgSend(v4, "initialSelectedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setInitialSelectedIndex:", objc_msgSend(*(id *)(a1 + 32), "transliterationCandidatesCount"));
  }
  objc_msgSend(*(id *)(a1 + 32), "closeCandidateGenerationContextWithResults:", v4);

}

void __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "autoSelectCandidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setInitialSelectedIndex:", a3);
    objc_msgSend(*(id *)(a1 + 40), "setDefaultCandidate:", v10);
    *a4 = 1;
  }

}

void __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rawInputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateProactiveCandidatesForCandidateResultSet:withInput:", v3, v4);

  if (objc_msgSend(*(id *)(a1 + 32), "isTypologyEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "logInputString");
  objc_msgSend(*(id *)(a1 + 32), "setMarkedText");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "wordSearchCandidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateResultSetFromWordSearchCandidateResultSet:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "closeCandidateGenerationContextWithResults:", v7);
}

void __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addProactiveTriggers:withCompletionHandler:", v4, *(_QWORD *)(a1 + 32));

}

void __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "groupedCandidatesFromCandidates:usingSortingMethod:inputString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2;
  v6[3] = &unk_250122AD0;
  v4 = *(id *)(a1 + 64);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  objc_msgSend(v3, "addOperationWithBlock:", v6);

}

uint64_t __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __73__TIKeyboardInputManager_ja_addRecentlyCommittedCandidatesForReanalysis___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)MecabraCandidateGetSurface(), "_containsSubstring:", *(_QWORD *)(a1 + 32));
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_cold_1(v5);
  }
  else if ((a2 & 1) != 0)
  {
    if (notificationQueue(void)::onceToken != -1)
      dispatch_once(&notificationQueue(void)::onceToken, &__block_literal_global_331);
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    TIDispatchAsync();

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]_block_invoke";
    v10 = 2080;
    v11 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]_block_invoke";
    _os_log_impl(&dword_232303000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s  [%s]Notifications are disabled.", buf, 0x16u);
  }

}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_157(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v11, "setTitle:", CFSTR("Learning corruption detected"));
  objc_msgSend(v11, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v11, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v11, "setRelevanceScore:", 1.0);
  objc_msgSend(v11, "setInterruptionLevel:", 2);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEDC820]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEDC828]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We learned %@ as %@. If it's wrong, please report us."), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBody:", v6);

  v7 = (void *)MEMORY[0x24BDF8858];
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithIdentifier:content:trigger:", v9, v11, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addNotificationRequest:withCompletionHandler:", v10, &__block_literal_global_5);
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2_cold_1(v2);

}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_232303000, MEMORY[0x24BDACB70], v2, "%s  [%s]Error requesting notification authorization: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_232303000, MEMORY[0x24BDACB70], v2, "%s  [%s]Notification posted with error: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
