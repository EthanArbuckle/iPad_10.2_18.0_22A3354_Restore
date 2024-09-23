@implementation TITraceLogCandidate

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", CFSTR("TITraceLogCandidate"), CFSTR("_sourceClass"));
  -[TITraceLogCandidate token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("token"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidate probability](self, "probability");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("probability"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidate contextProbability](self, "contextProbability");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("contextProbability"));

  -[TITraceLogCandidate filterName](self, "filterName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TITraceLogCandidate filterName](self, "filterName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("filterName"));

  }
  -[TITraceLogCandidate lexiconLocaleIdentifier](self, "lexiconLocaleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TITraceLogCandidate lexiconLocaleIdentifier](self, "lexiconLocaleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lexiconLocaleIdentifier"));

  }
  -[TITraceLogCandidate dynamicUsageCount](self, "dynamicUsageCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TITraceLogCandidate dynamicUsageCount](self, "dynamicUsageCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dynamicUsageCount"));

  }
  -[TITraceLogCandidate penalty](self, "penalty");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TITraceLogCandidate penalty](self, "penalty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("penalty"));

  }
  -[TITraceLogCandidate wordSources](self, "wordSources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TITraceLogCandidate wordSources](self, "wordSources");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("wordSources"));

  }
  -[TITraceLogCandidate priorContext](self, "priorContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TITraceLogCandidate priorContext](self, "priorContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("priorContext"));

  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v21;
}

- (unsigned)wordId
{
  return self->_wordId;
}

- (void)setWordId:(unsigned int)a3
{
  self->_wordId = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)contextProbability
{
  return self->_contextProbability;
}

- (void)setContextProbability:(double)a3
{
  self->_contextProbability = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSArray)wordSources
{
  return self->_wordSources;
}

- (void)setWordSources:(id)a3
{
  objc_storeStrong((id *)&self->_wordSources, a3);
}

- (NSNumber)dynamicUsageCount
{
  return self->_dynamicUsageCount;
}

- (void)setDynamicUsageCount:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicUsageCount, a3);
}

- (NSNumber)penalty
{
  return self->_penalty;
}

- (void)setPenalty:(id)a3
{
  objc_storeStrong((id *)&self->_penalty, a3);
}

- (NSString)lexiconLocaleIdentifier
{
  return self->_lexiconLocaleIdentifier;
}

- (void)setLexiconLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lexiconLocaleIdentifier, a3);
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void)setFilterName:(id)a3
{
  objc_storeStrong((id *)&self->_filterName, a3);
}

- (NSString)priorContext
{
  return self->_priorContext;
}

- (void)setPriorContext:(id)a3
{
  objc_storeStrong((id *)&self->_priorContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorContext, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_lexiconLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_penalty, 0);
  objc_storeStrong((id *)&self->_dynamicUsageCount, 0);
  objc_storeStrong((id *)&self->_wordSources, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

+ (id)_wordSourcesFromCandidateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  TITraceLogCandidateWordSource *v9;
  TITraceLogCandidateWordSource *v10;
  void *v11;
  __CFString *v13;
  double v14;
  double v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0.0;
  v15 = 0.0;
  objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("details=("), 0);
  objc_msgSend(v5, "scanString:intoString:", CFSTR("details=("), 0);
  v6 = &stru_1E243B990;
  if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
  {
    do
    {
      v7 = v6;
      v13 = v6;
      v8 = objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(": "), &v13);
      v6 = v13;

      if (v8
        && objc_msgSend(v5, "scanString:intoString:", CFSTR(": "), 0)
        && objc_msgSend(v5, "scanDouble:", &v15)
        && objc_msgSend(v5, "scanString:intoString:", CFSTR("+"), 0)
        && objc_msgSend(v5, "scanDouble:", &v14))
      {
        v9 = [TITraceLogCandidateWordSource alloc];
        v10 = -[TITraceLogCandidateWordSource initWithWordSource:probability:linguisticContextProbability:](v9, "initWithWordSource:probability:linguisticContextProbability:", v6, v15, v14);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v5, "scanString:intoString:", CFSTR(" "), 0);

      }
    }
    while (!objc_msgSend(v5, "isAtEnd"));
  }
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

+ (id)candidateFromRemovedCandidateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TITraceLogCandidate *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\[(.+)\\] removed by (.+)$"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(TITraceLogCandidate);
    -[TITraceLogCandidate setToken:](v14, "setToken:", v10);
    -[TITraceLogCandidate setFilterName:](v14, "setFilterName:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)candidateFromCandidateString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TITraceLogCandidate *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\[(.+)\\] word_id \\[(.+)\\](\\d+), ln P\\([^)]+\\) (-?\\d+\\.\\d+), ln P\\([^)]+\\) (-?\\d+\\.\\d+)(.*)$"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(TITraceLogCandidate);
    v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
    objc_msgSend(v4, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITraceLogCandidate setToken:](v8, "setToken:", v11);

    v12 = objc_msgSend(v7, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITraceLogCandidate setLexiconLocaleIdentifier:](v8, "setLexiconLocaleIdentifier:", v14);

    v15 = objc_msgSend(v7, "rangeAtIndex:", 3);
    objc_msgSend(v4, "substringWithRange:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITraceLogCandidate setWordId:](v8, "setWordId:", objc_msgSend(v17, "intValue"));

    v18 = objc_msgSend(v7, "rangeAtIndex:", 4);
    objc_msgSend(v4, "substringWithRange:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v7, "rangeAtIndex:", 5);
    objc_msgSend(v4, "substringWithRange:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    -[TITraceLogCandidate setProbability:](v8, "setProbability:");
    objc_msgSend(v23, "doubleValue");
    -[TITraceLogCandidate setContextProbability:](v8, "setContextProbability:");
    if ((unint64_t)objc_msgSend(v7, "numberOfRanges") >= 7)
    {
      v46 = v23;
      v47 = v20;
      v48 = a1;
      v24 = objc_msgSend(v7, "rangeAtIndex:", 6);
      objc_msgSend(v4, "substringWithRange:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR(".*sources=\\([^\\)]+, f=(\\d+)[^\\)]*\\)"), 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 0x1E0CB3000;
      if (v29)
      {
        v32 = objc_msgSend(v29, "rangeAtIndex:", 1);
        objc_msgSend(v26, "substringWithRange:", v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v34, "intValue"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITraceLogCandidate setDynamicUsageCount:](v8, "setDynamicUsageCount:", v35);

        v31 = 0x1E0CB3000uLL;
      }
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR(".*sources=\\([^\\)]+, p=(\\d+)[^\\)]*\\)"), 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "matchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v38 = objc_msgSend(v37, "rangeAtIndex:", 1);
        objc_msgSend(v26, "substringWithRange:", v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v31;
        v42 = v40;
        objc_msgSend(*(id *)(v41 + 2024), "numberWithInt:", objc_msgSend(v40, "intValue"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITraceLogCandidate setPenalty:](v8, "setPenalty:", v43);

      }
      v20 = v47;
      a1 = v48;
      v23 = v46;
    }
    if (objc_msgSend(v4, "containsString:", CFSTR("details=(")))
    {
      objc_msgSend(a1, "_wordSourcesFromCandidateString:", v4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITraceLogCandidate setWordSources:](v8, "setWordSources:", v44);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)candidateFromFinalCandidateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TITraceLogCandidate *v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^\\[(.+)\\] ln\\(omega\\) (.+) .+$"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    objc_msgSend(v3, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(TITraceLogCandidate);
    -[TITraceLogCandidate setToken:](v14, "setToken:", v10);
    objc_msgSend(v13, "doubleValue");
    -[TITraceLogCandidate setProbability:](v14, "setProbability:");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
