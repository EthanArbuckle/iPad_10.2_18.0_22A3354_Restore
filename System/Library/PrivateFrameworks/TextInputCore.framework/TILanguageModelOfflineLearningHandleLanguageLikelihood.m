@implementation TILanguageModelOfflineLearningHandleLanguageLikelihood

- (void)updateAdaptationContext:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v5 = a3;
  -[TILanguageModelOfflineLearningHandle setCurrentAdaptationContext:](self, "setCurrentAdaptationContext:");
  -[TILanguageModelOfflineLearningHandle lastAdaptationDate](self, "lastAdaptationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = v5;
    TIDispatchSync();

  }
}

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  id v5;
  id v6;

  v6 = a3;
  v5 = v6;
  TIDispatchSync();

}

void __100__TILanguageModelOfflineLearningHandleLanguageLikelihood_adaptToParagraph_timeStamp_adaptationType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "currentAdaptationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipientNameDigest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "currentAdaptationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEvidence:timestamp:adaptationType:forRecipient:app:language:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), v6, v4, 0, *(double *)(a1 + 48));

}

void __82__TILanguageModelOfflineLearningHandleLanguageLikelihood_updateAdaptationContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastOfflineAdaptationTimeForApp:", v3);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastAdaptationDate:", v6);

}

@end
