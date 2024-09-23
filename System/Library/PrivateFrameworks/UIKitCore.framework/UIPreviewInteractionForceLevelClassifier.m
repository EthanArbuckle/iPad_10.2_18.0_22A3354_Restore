@implementation UIPreviewInteractionForceLevelClassifier

id __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__103;
  v14 = __Block_byref_object_dispose__103;
  v15 = 0;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_4;
    v9[3] = &unk_1E16C9838;
    v9[4] = WeakRetained;
    v9[5] = &v10;
    v9[6] = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "ifObservation:ifReset:", v9, 0);
    v6 = (void *)v11[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(a1[4] + 64);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    if ((unint64_t)(a1[6] - 1) >= 3)
      v4 = 0;
    else
      v4 = a1[6];
    objc_msgSend(v2, "currentProgressToState:", v4);
    objc_msgSend(v3, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

@end
