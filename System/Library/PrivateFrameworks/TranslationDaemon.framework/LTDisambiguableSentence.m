@implementation LTDisambiguableSentence

id __89___LTDisambiguableSentence_Daemon__sentenceFromFTSpeechResponse_sourceText_censorSpeech___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF63D8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "alternative_descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodeFromFTSpeechTranslationPhrase:descriptions:sourceText:censorSpeech:", v5, v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __63___LTDisambiguableSentence_Daemon__sentenceFromOspreyResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF63D8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "alternative_descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodeFromFTTranslationPhrase:descriptions:sourceText:", v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68___LTDisambiguableSentence_Daemon__sentenceFromOspreyBatchSentence___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF63D8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "alternative_descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodeFromOspreyBatchPhrase:descriptions:sourceText:", v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
