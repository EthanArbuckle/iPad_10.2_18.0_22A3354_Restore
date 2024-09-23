@implementation UILinearForceLevelClassifier

id __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__102;
  v15 = __Block_byref_object_dispose__102;
  v16 = 0;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_11;
    v9[3] = &unk_1E16C97D0;
    v9[4] = WeakRetained;
    v9[5] = &v11;
    v10 = *(_OWORD *)(a1 + 40);
    objc_msgSend(a2, "ifObservation:ifReset:", v9, 0);
    v6 = (void *)v12[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_11(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = (void *)a1[4];
  objc_msgSend(a2, "touchForce");
  objc_msgSend(v4, "_calculateProgressOfTouchForceValue:toForceLevel:minimumRequiredForceLevel:", a1[6], a1[7]);
  objc_msgSend(v3, "numberWithDouble:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
