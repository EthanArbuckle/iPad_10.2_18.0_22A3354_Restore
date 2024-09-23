@implementation TITypologyStatisticRankCandidatesAccepted

- (TITypologyStatisticRankCandidatesAccepted)init
{
  TITypologyStatisticRankCandidatesAccepted *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *histogram;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypologyStatisticRankCandidatesAccepted;
  v2 = -[TITypologyStatisticRankCandidatesAccepted init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    histogram = v2->_histogram;
    v2->_histogram = v3;

  }
  return v2;
}

- (id)structuredReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[TITypologyStatisticRankCandidatesAccepted histogram](self, "histogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v9[0] = CFSTR("Length Accepted Candidates");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lengthOfSelectedCandidates);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("Length Accepted Predictions");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lengthOfSelectedPredictions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  return v4;
}

- (unint64_t)rankOfCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[TITypologyStatisticCurrentAutocorrections autocorrections](self, "autocorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyStatisticCurrentAutocorrections autocorrections](self, "autocorrections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "shouldAcceptTopCandidate");

  if ((_DWORD)v5)
  {
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__TITypologyStatisticRankCandidatesAccepted_rankOfCandidate___block_invoke;
  v12[3] = &unk_1E2439CE8;
  v13 = v4;
  v14 = &v15;
  v9 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)addLengthOfSelectedCandidate:(id)a3
{
  id v4;

  objc_msgSend(a3, "candidate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_lengthOfSelectedCandidates += objc_msgSend(v4, "length");

}

- (void)addLengthOfSelectedPrediction:(id)a3
{
  id v4;

  objc_msgSend(a3, "candidate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_lengthOfSelectedPredictions += objc_msgSend(v4, "length");

}

- (void)countSelectedAutocorrection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("%@ == %@"), CFSTR("Candidates Accepted With Rank"), CFSTR("A"));
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v8, v9);

  -[TITypologyStatisticRankCandidatesAccepted addLengthOfSelectedCandidate:](self, "addLengthOfSelectedCandidate:", v5);
}

- (void)countSelectedInputString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ == %@"), CFSTR("Candidates Accepted With Rank"), CFSTR("I"));
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v5, v6);

}

- (void)countSelectedInputStringToRejectAutocorrection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ == %@"), CFSTR("Candidates Accepted With Rank"), CFSTR("R"));
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v5, v6);

}

- (BOOL)isCandidatePrediction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = a3;
  if (isCandidatePrediction__onceToken != -1)
    dispatch_once(&isCandidatePrediction__onceToken, &__block_literal_global_4786);
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "characterAtIndex:", v5 - 1);

    v8 = objc_msgSend((id)isCandidatePrediction__charactersAllowingNextWordPrediction, "characterIsMember:", v7);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)countSelectedPrediction:(id)a3 withRank:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v11 = (id)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@ == %@%lu"), CFSTR("Candidates Accepted With Rank"), CFSTR("NP"), a4);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v10, v11);

  -[TITypologyStatisticRankCandidatesAccepted addLengthOfSelectedPrediction:](self, "addLengthOfSelectedPrediction:", v7);
}

- (void)countSelectedCandidate:(id)a3 withRank:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v6;
    -[TITypologyStatisticCurrentAutocorrections autocorrections](self, "autocorrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldAcceptTopCandidate");

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v8)
      v10 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@ == %@%lu"), CFSTR("Candidates Accepted With Rank"), CFSTR("CA"), a4);
    else
      v10 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@ == %lu"), CFSTR("Candidates Accepted With Rank"), a4, v15);
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v14, v11);

    if (-[TITypologyStatisticRankCandidatesAccepted isCandidatePrediction:](self, "isCandidatePrediction:", v16))
      -[TITypologyStatisticRankCandidatesAccepted countSelectedPrediction:withRank:](self, "countSelectedPrediction:withRank:", v16, a4);
    -[TITypologyStatisticRankCandidatesAccepted addLengthOfSelectedCandidate:](self, "addLengthOfSelectedCandidate:", v16);

    v6 = v16;
  }

}

- (void)rankAndCountSelectedCandidate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  -[TITypologyStatisticCurrentAutocorrections autocorrections](self, "autocorrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldAcceptTopCandidate"))
  {
    -[TITypologyStatisticCurrentAutocorrections autocorrections](self, "autocorrections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(v14, "isAutocorrection"))
  {
    if (v7 && objc_msgSend(v14, "isEqual:", v7))
      -[TITypologyStatisticRankCandidatesAccepted countSelectedAutocorrection:](self, "countSelectedAutocorrection:", v14);
    else
      -[TITypologyStatisticRankCandidatesAccepted countSelectedCandidate:withRank:](self, "countSelectedCandidate:withRank:", v14, -[TITypologyStatisticRankCandidatesAccepted rankOfCandidate:](self, "rankOfCandidate:", v14));
  }
  else
  {
    objc_msgSend(v14, "candidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      if (v7
        && (objc_msgSend(v14, "candidate"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v7, "candidate"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "isEqualToString:", v12),
            v12,
            v11,
            (v13 & 1) == 0))
      {
        -[TITypologyStatisticRankCandidatesAccepted countSelectedInputStringToRejectAutocorrection](self, "countSelectedInputStringToRejectAutocorrection");
      }
      else
      {
        -[TITypologyStatisticRankCandidatesAccepted countSelectedInputString](self, "countSelectedInputString");
      }
    }
  }

}

- (void)visitRecordKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptedCandidate");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isSynthesizedByAcceptingCandidate");
  if ((_DWORD)v4)
    -[TITypologyStatisticRankCandidatesAccepted rankAndCountSelectedCandidate:](self, "rankAndCountSelectedCandidate:", v7);

}

- (NSDictionary)histogram
{
  return &self->_histogram->super;
}

- (int64_t)lengthOfSelectedCandidates
{
  return self->_lengthOfSelectedCandidates;
}

- (int64_t)lengthOfSelectedPredictions
{
  return self->_lengthOfSelectedPredictions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);
}

void __67__TITypologyStatisticRankCandidatesAccepted_isCandidatePrediction___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" \n\t\"(.,?!:;)"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isCandidatePrediction__charactersAllowingNextWordPrediction;
  isCandidatePrediction__charactersAllowingNextWordPrediction = v0;

}

uint64_t __61__TITypologyStatisticRankCandidatesAccepted_rankOfCandidate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

@end
