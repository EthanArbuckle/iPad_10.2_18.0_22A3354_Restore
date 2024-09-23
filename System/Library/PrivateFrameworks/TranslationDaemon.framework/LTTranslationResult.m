@implementation LTTranslationResult

id __98___LTTranslationResult_Osprey__initWithOspreySpeechTranslationMTResponse_sourceText_censorSpeech___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDF6488];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithOspreyMtResponsePhrase:locale:censorSpeech:", v4, v6, *(unsigned __int8 *)(a1 + 40));

  return v7;
}

id __55___LTTranslationResult_Osprey__initWithOspreyResponse___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDF6488];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithOspreyPhrase:", v3);

  return v4;
}

uint64_t __73___LTTranslationResult_Osprey__updateAlignmentWithSourceSpan_targetSpan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "targetRange");
  if (v6 == objc_msgSend(v5, "targetRange"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "targetRange");
    if (v8 < objc_msgSend(v5, "targetRange"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

@end
