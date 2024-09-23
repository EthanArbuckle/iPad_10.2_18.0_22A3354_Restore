@implementation TIKeyboardInputManager

uint64_t __89__TIKeyboardInputManager_zh_Toneless_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke(uint64_t a1, void *a2)
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
    v6 = &stru_25012F088;
  v7 = objc_msgSend(v3, "isEqualToString:", v6) ^ 1;

  return v7;
}

uint64_t __96__TIKeyboardInputManager_zh_RetroCorrection_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void __61__TIKeyboardInputManager_zh_SegmentPicker_setPhraseBoundary___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(a2, "surface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v7, "length");

  if (a1[6] <= *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_QWORD *)(a1[4] + 800) = a3;
    *a4 = 1;
  }
}

void __94__TIKeyboardInputManager_zh_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputForMarkedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateMarkedText");
    objc_msgSend(*(id *)(a1 + 32), "markedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUncommittedText:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "pushCandidateResultSet:", v6);

}

void __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setWholePhraseCandidateResultSet:", v1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_notifyUpdateCandidates");

}

void __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "addProactiveTriggers:withCompletionHandler:", v4, *(_QWORD *)(a1 + 32));

}

uint64_t __113__TIKeyboardInputManager_zh_Candidates_candidateResultSetFromCandidateResultSet_lastCharacterCandidateResultSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "autoSelectCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

@end
