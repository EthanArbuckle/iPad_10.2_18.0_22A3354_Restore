@implementation TITraceLogCandidateGroup

- (TITraceLogCandidateGroup)init
{
  TITraceLogCandidateGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *candidates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITraceLogCandidateGroup;
  v2 = -[TITraceLogCandidateGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    candidates = v2->_candidates;
    v2->_candidates = v3;

  }
  return v2;
}

- (void)addCandidate:(id)a3
{
  -[NSMutableArray addObject:](self->_candidates, "addObject:", a3);
}

- (NSArray)candidates
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_candidates, "copy");
}

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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", CFSTR("TITraceLogCandidateGroup"), CFSTR("_sourceClass"));
  -[TITraceLogCandidateGroup sequenceString](self, "sequenceString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sequenceString"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidateGroup probability](self, "probability");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("probability"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidateGroup omegaWordScore](self, "omegaWordScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("omegaWordScore"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidateGroup omegaLanguagePowerScore](self, "omegaLanguagePowerScore");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("omegaLanguagePowerScore"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidateGroup omegaTypingScore](self, "omegaTypingScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("omegaTypingScore"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[TITraceLogCandidateGroup omegaGeometryScore](self, "omegaGeometryScore");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("omegaGeometryScore"));

  -[TITraceLogCandidateGroup omegaFactorsString](self, "omegaFactorsString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TITraceLogCandidateGroup omegaFactorsString](self, "omegaFactorsString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("omegaFactorsString"));

  }
  v17 = (void *)MEMORY[0x1E0C99DE8];
  -[TITraceLogCandidateGroup candidates](self, "candidates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TITraceLogCandidateGroup candidates](self, "candidates", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "dictionaryRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("candidates"));
  return (NSDictionary *)v3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (NSString)sequenceString
{
  return self->_sequenceString;
}

- (void)setSequenceString:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceString, a3);
}

- (NSString)omegaFactorsString
{
  return self->_omegaFactorsString;
}

- (void)setOmegaFactorsString:(id)a3
{
  objc_storeStrong((id *)&self->_omegaFactorsString, a3);
}

- (double)omegaWordScore
{
  return self->_omegaWordScore;
}

- (void)setOmegaWordScore:(double)a3
{
  self->_omegaWordScore = a3;
}

- (double)omegaLanguagePowerScore
{
  return self->_omegaLanguagePowerScore;
}

- (void)setOmegaLanguagePowerScore:(double)a3
{
  self->_omegaLanguagePowerScore = a3;
}

- (double)omegaTypingScore
{
  return self->_omegaTypingScore;
}

- (void)setOmegaTypingScore:(double)a3
{
  self->_omegaTypingScore = a3;
}

- (double)omegaGeometryScore
{
  return self->_omegaGeometryScore;
}

- (void)setOmegaGeometryScore:(double)a3
{
  self->_omegaGeometryScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_omegaFactorsString, 0);
  objc_storeStrong((id *)&self->_sequenceString, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

+ (id)groupFromGroupString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  TITraceLogCandidateGroup *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;

  v51 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v51);
  v57 = 0;
  objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v57);
  v4 = v57;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\[(.+)\\] ln\\(omega\\) (.+) = \\[(.+)\\] .+"), 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  v7 = objc_msgSend(v5, "rangeAtIndex:", 1);
  objc_msgSend(v4, "substringWithRange:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "rangeAtIndex:", 2);
  objc_msgSend(v4, "substringWithRange:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "rangeAtIndex:", 3);
  objc_msgSend(v4, "substringWithRange:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(TITraceLogCandidateGroup);
  v53 = (void *)v9;
  -[TITraceLogCandidateGroup setSequenceString:](v16, "setSequenceString:", v9);
  v52 = v12;
  objc_msgSend(v12, "doubleValue");
  -[TITraceLogCandidateGroup setProbability:](v16, "setProbability:");
  v17 = v15;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(-?[0-9]+\\.[0-9]+)\\*\\(W (-?[0-9]+\\.[0-9]+)+ \\+ T (-?[0-9]+\\.[0-9]+)\\) \\+ G (-?[0-9]+\\.[0-9]+)$"), 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "matchesInString:options:range:", v17, 0, 0, objc_msgSend(v17, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = 0.0;
  if (v19)
  {
    if (objc_msgSend(v20, "numberOfRanges") == 5)
    {
      v23 = objc_msgSend(v21, "rangeAtIndex:", 1);
      objc_msgSend(v17, "substringWithRange:", v23, v24);
      v50 = v5;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "rangeAtIndex:", 2);
      objc_msgSend(v17, "substringWithRange:", v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v21, "rangeAtIndex:", 3);
      objc_msgSend(v17, "substringWithRange:", v29, v30);
      v49 = v18;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v21, "rangeAtIndex:", 4);
      objc_msgSend(v17, "substringWithRange:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v22 = v35;
      objc_msgSend(v28, "doubleValue");
      v37 = v36;
      objc_msgSend(v31, "doubleValue");
      v39 = v38;
      objc_msgSend(v34, "doubleValue");
      v41 = v40;

      v18 = v49;
      v5 = v50;
      v6 = 0;
      goto LABEL_6;
    }
    v6 = 1;
  }
  v37 = 0.0;
  v39 = 0.0;
  v41 = 0.0;
LABEL_6:

  if ((v6 & 1) == 0)
  {
    -[TITraceLogCandidateGroup setOmegaFactorsString:](v16, "setOmegaFactorsString:", v17);
    -[TITraceLogCandidateGroup setOmegaLanguagePowerScore:](v16, "setOmegaLanguagePowerScore:", v22);
    -[TITraceLogCandidateGroup setOmegaWordScore:](v16, "setOmegaWordScore:", v37);
    -[TITraceLogCandidateGroup setOmegaTypingScore:](v16, "setOmegaTypingScore:", v39);
    -[TITraceLogCandidateGroup setOmegaGeometryScore:](v16, "setOmegaGeometryScore:", v41);
  }
  v56 = v4;
  v42 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v56);
  v43 = v56;

  if (v42)
  {
    v44 = v51;
    do
    {
      +[TITraceLogCandidate candidateFromCandidateString:](TITraceLogCandidate, "candidateFromCandidateString:", v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
        -[TITraceLogCandidateGroup addCandidate:](v16, "addCandidate:", v45);

      v56 = v43;
      v46 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v56);
      v47 = v56;

      v43 = v47;
    }
    while ((v46 & 1) != 0);
  }
  else
  {
    v47 = v43;
    v44 = v51;
  }

  return v16;
}

@end
