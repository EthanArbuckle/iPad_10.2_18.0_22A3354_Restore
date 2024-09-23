@implementation WBSPasswordPatternMatchSolver

- (WBSPasswordPatternMatchSolver)initWithPassword:(id)a3 patternMatches:(id)a4
{
  id v6;
  id v7;
  WBSPasswordPatternMatchSolver *v8;
  uint64_t v9;
  NSString *password;
  uint64_t v11;
  NSSet *patternMatches;
  NSMutableDictionary *v13;
  NSMutableDictionary *partialSolutions;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  NSMutableDictionary *v19;
  void *v20;
  WBSPasswordPatternMatchSolver *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordPatternMatchSolver;
  v8 = -[WBSPasswordPatternMatchSolver init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    password = v8->_password;
    v8->_password = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    patternMatches = v8->_patternMatches;
    v8->_patternMatches = (NSSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    partialSolutions = v8->_partialSolutions;
    v8->_partialSolutions = v13;

    v15 = objc_msgSend(v6, "length");
    if (v15)
    {
      v16 = v15;
      for (i = 0; i != v16; ++i)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v19 = v8->_partialSolutions;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

      }
    }
    v21 = v8;
  }

  return v8;
}

- (id)_partialSolutionWithEndIndex:(unint64_t)a3 patternCount:(unint64_t)a4
{
  NSMutableDictionary *partialSolutions;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  partialSolutions = self->_partialSolutions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](partialSolutions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setPartialSolution:(id)a3 withEndIndex:(unint64_t)a4 patternCount:(unint64_t)a5
{
  NSMutableDictionary *partialSolutions;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  partialSolutions = self->_partialSolutions;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](partialSolutions, "objectForKeyedSubscript:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

}

- (void)_enumeratePartialSolutionsWithEndIndex:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, uint64_t, _BYTE *);
  NSMutableDictionary *partialSolutions;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned __int8 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t, _BYTE *))a4;
  v21 = 0;
  partialSolutions = self->_partialSolutions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](partialSolutions, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v9, "allKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
      objc_msgSend(v9, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v16, objc_msgSend(v15, "unsignedLongValue"), &v21);
      LODWORD(v15) = v21;

      if ((_DWORD)v15)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_updatePartialSolutionsWithPatternMatch:(id)a3 patternCount:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  WBSPasswordPatternPartialSolution *v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = objc_msgSend(v6, "endIndex");
  objc_msgSend(v6, "guessesRequired");
  v9 = v8;
  if (a4 > 1)
  {
    -[WBSPasswordPatternMatchSolver _partialSolutionWithEndIndex:patternCount:](self, "_partialSolutionWithEndIndex:patternCount:", objc_msgSend(v6, "range") - 1, a4 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "guessesRequiredWithoutPatternCountPenalty");
    v9 = v9 * v11;

  }
  v12 = factorial(a4);
  v13 = pow(10000.0, (double)(a4 - 1)) + v9 * v12;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__WBSPasswordPatternMatchSolver__updatePartialSolutionsWithPatternMatch_patternCount___block_invoke;
  v15[3] = &unk_1E649E270;
  *(double *)&v15[6] = v13;
  v15[4] = &v16;
  v15[5] = a4;
  -[WBSPasswordPatternMatchSolver _enumeratePartialSolutionsWithEndIndex:usingBlock:](self, "_enumeratePartialSolutionsWithEndIndex:usingBlock:", v7, v15);
  if (!*((_BYTE *)v17 + 24))
  {
    v14 = -[WBSPasswordPatternPartialSolution initWithPatternMatch:guessesRequiredWithoutPatternCountPenalty:withPatternCountPenalty:]([WBSPasswordPatternPartialSolution alloc], "initWithPatternMatch:guessesRequiredWithoutPatternCountPenalty:withPatternCountPenalty:", v6, v9, v13);
    -[WBSPasswordPatternMatchSolver _setPartialSolution:withEndIndex:patternCount:](self, "_setPartialSolution:withEndIndex:patternCount:", v14, v7, a4);

  }
  _Block_object_dispose(&v16, 8);

}

void __86__WBSPasswordPatternMatchSolver__updatePartialSolutionsWithPatternMatch_patternCount___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  id v9;

  v7 = a2;
  if (*(_QWORD *)(a1 + 40) >= a3)
  {
    v9 = v7;
    objc_msgSend(v7, "guessesRequiredWithPatternCountPenalty");
    v7 = v9;
    if (v8 <= *(double *)(a1 + 48))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (id)_unwindSolution
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[NSString length](self->_password, "length") - 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0x7FEFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__WBSPasswordPatternMatchSolver__unwindSolution__block_invoke;
  v8[3] = &unk_1E649E298;
  v8[4] = v9;
  v8[5] = &v10;
  -[WBSPasswordPatternMatchSolver _enumeratePartialSolutionsWithEndIndex:usingBlock:](self, "_enumeratePartialSolutionsWithEndIndex:usingBlock:", v4, v8);
  while ((v4 & 0x8000000000000000) == 0)
  {
    -[WBSPasswordPatternMatchSolver _partialSolutionWithEndIndex:patternCount:](self, "_partialSolutionWithEndIndex:patternCount:", v4, v11[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "patternMatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertObject:atIndex:", v6, 0);
    v4 = objc_msgSend(v6, "range") - 1;
    --v11[3];

  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

uint64_t __48__WBSPasswordPatternMatchSolver__unwindSolution__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = objc_msgSend(a2, "guessesRequiredWithPatternCountPenalty");
  if (v6 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  }
  return result;
}

- (void)_updateExhaustiveSearchPartialSolutionsAtEndIndex:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  -[WBSPasswordPatternMatchSolver _exhaustiveSearchPatternWithStartIndex:endIndex:](self, "_exhaustiveSearchPatternWithStartIndex:endIndex:", 0, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordPatternMatchSolver _updatePartialSolutionsWithPatternMatch:patternCount:](self, "_updatePartialSolutionsWithPatternMatch:patternCount:", v5, 1);
  if (a3)
  {
    v6 = 1;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      -[WBSPasswordPatternMatchSolver _exhaustiveSearchPatternWithStartIndex:endIndex:](self, "_exhaustiveSearchPatternWithStartIndex:endIndex:", v6, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __83__WBSPasswordPatternMatchSolver__updateExhaustiveSearchPartialSolutionsAtEndIndex___block_invoke;
      v9[3] = &unk_1E649E2C0;
      v9[4] = self;
      v5 = v8;
      v10 = v5;
      -[WBSPasswordPatternMatchSolver _enumeratePartialSolutionsWithEndIndex:usingBlock:](self, "_enumeratePartialSolutionsWithEndIndex:usingBlock:", v6 - 1, v9);

      ++v6;
    }
    while (v6 <= a3);
  }

}

void __83__WBSPasswordPatternMatchSolver__updateExhaustiveSearchPartialSolutionsAtEndIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "patternMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_updatePartialSolutionsWithPatternMatch:patternCount:", *(_QWORD *)(a1 + 40), a3 + 1);
}

- (id)_exhaustiveSearchPatternWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;
  id v7;

  v5 = a4 - a3 + 1;
  -[NSString substringWithRange:](self->_password, "substringWithRange:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v6, a3, v5);

  return v7;
}

- (id)optimalEvaluation
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  WBSPasswordEvaluation *v18;
  NSUInteger v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self->_password, "length");
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", self->_patternMatches, &__block_literal_global_43);
  v20 = v3;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4, v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "range");
            if (v13)
            {
              v23[0] = v5;
              v23[1] = 3221225472;
              v23[2] = __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke_2;
              v23[3] = &unk_1E649E2C0;
              v23[4] = self;
              v23[5] = v12;
              -[WBSPasswordPatternMatchSolver _enumeratePartialSolutionsWithEndIndex:usingBlock:](self, "_enumeratePartialSolutionsWithEndIndex:usingBlock:", v13 - 1, v23);
            }
            else
            {
              -[WBSPasswordPatternMatchSolver _updatePartialSolutionsWithPatternMatch:patternCount:](self, "_updatePartialSolutionsWithPatternMatch:patternCount:", v12, 1);
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v9);
      }

      -[WBSPasswordPatternMatchSolver _updateExhaustiveSearchPartialSolutionsAtEndIndex:](self, "_updateExhaustiveSearchPartialSolutionsAtEndIndex:", v4++);
    }
    while (v4 != v20);
  }
  -[WBSPasswordPatternMatchSolver _unwindSolution](self, "_unwindSolution", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordPatternMatchSolver _partialSolutionWithEndIndex:patternCount:](self, "_partialSolutionWithEndIndex:patternCount:", v21 - 1, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "guessesRequiredWithPatternCountPenalty");
  v17 = v16;

  v18 = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:]([WBSPasswordEvaluation alloc], "initWithEvaluationType:password:patternMatches:guessesRequired:", 0, self->_password, v14, v17);
  return v18;
}

uint64_t __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "endIndex"));
}

uint64_t __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePartialSolutionsWithPatternMatch:patternCount:", *(_QWORD *)(a1 + 40), a3 + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSolutions, 0);
  objc_storeStrong((id *)&self->_patternMatches, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
