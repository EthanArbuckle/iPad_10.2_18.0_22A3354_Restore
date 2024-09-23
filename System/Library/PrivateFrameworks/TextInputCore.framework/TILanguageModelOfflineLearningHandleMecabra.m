@implementation TILanguageModelOfflineLearningHandleMecabra

- (void)updateAdaptationContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v7 = a3;
  -[TILanguageModelOfflineLearningHandleMecabra wordSearch](self, "wordSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLanguageModelAdaptationContext:", v7);
    -[TILanguageModelOfflineLearningHandle setCurrentAdaptationContext:](self, "setCurrentAdaptationContext:", v7);
    -[TILanguageModelOfflineLearningHandle lastAdaptationDate](self, "lastAdaptationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = v5;
      TIDispatchSync();

    }
  }

}

- (void)load
{
  void *v3;
  void *v4;
  id v5;

  +[TIWordSearchController sharedWordSearchController](TIWordSearchController, "sharedWordSearchController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wordSearchForInputMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelOfflineLearningHandleMecabra setWordSearch:](self, "setWordSearch:", v4);

}

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TILanguageModelOfflineLearningHandleMecabra wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[TILanguageModelOfflineLearningHandle currentAdaptationContext](self, "currentAdaptationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adaptOfflineToParagraph:adaptationContext:timeStamp:", v9, v8, a4);

  }
}

- (void)didFinishLearning
{
  id v2;

  -[TILanguageModelOfflineLearningHandleMecabra wordSearch](self, "wordSearch");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushDynamicData");

}

- (TIWordSearch)wordSearch
{
  return self->_wordSearch;
}

- (void)setWordSearch:(id)a3
{
  objc_storeStrong((id *)&self->_wordSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

void __71__TILanguageModelOfflineLearningHandleMecabra_updateAdaptationContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mecabra");
  MecabraGetLastOfflineAdaptationTime();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastAdaptationDate:", v2);

}

@end
