@implementation TIMecabraEnvironmentContextWrapper

- (TIMecabraEnvironmentContextWrapper)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4
{
  TIMecabraEnvironmentContextWrapper *v5;
  TIMecabraEnvironmentContextWrapper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIMecabraEnvironmentContextWrapper;
  v5 = -[TIMecabraEnvironmentContextWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_mecabraEngine = a3;
    v5->_mecabraContext = (__MecabraContext *)MecabraContextCreateMutable();
    *(int64x2_t *)&v6->_candidateIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(_QWORD *)&v6->_textContentType = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  MecabraContextRelease();
  v3.receiver = self;
  v3.super_class = (Class)TIMecabraEnvironmentContextWrapper;
  -[TIMecabraEnvironmentContextWrapper dealloc](&v3, sel_dealloc);
}

- (void)setTextContentType:(int)a3
{
  self->_textContentType = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextSetTextContentType();
}

- (void)setShuangpinType:(int)a3
{
  self->_shuangpinType = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextSetShuangpinType();
}

- (void)addContextCandidate:(void *)a3 accept:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextAddInlineCandidate();
  if (v4)
  {
    -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
    -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
    MecabraAcceptInlineCandidates();
  }
}

- (void)addContextStringCandidate:(void *)a3
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextAddCandidate();
}

- (void)addEnvironmentCandidate:(void *)a3 atIndex:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    a4 = v8;
  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 >= v8)
    objc_msgSend(v9, "addObject:", a3);
  else
    objc_msgSend(v9, "insertObject:atIndex:", a3, a4);

}

- (unint64_t)contextCandidateCount
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  return MecabraContextGetCandidateCount();
}

- (NSArray)contextCandidates
{
  void *v3;
  uint64_t CandidateCount;
  uint64_t v5;
  uint64_t i;
  uint64_t CandidateAtIndex;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  CandidateCount = MecabraContextGetCandidateCount();
  if (CandidateCount)
  {
    v5 = CandidateCount;
    for (i = 0; i != v5; ++i)
    {
      -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
      CandidateAtIndex = MecabraContextGetCandidateAtIndex();
      if (CandidateAtIndex)
        objc_msgSend(v3, "addObject:", CandidateAtIndex);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)contextCandidateStrings
{
  void *v2;
  void *v3;

  -[TIMecabraEnvironmentContextWrapper contextCandidates](self, "contextCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mecabraCandidateSurfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)clearContext
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  -[TIMecabraEnvironmentContextWrapper contextCandidateCount](self, "contextCandidateCount");
  MecabraContextRemoveCandidatesInRange();
}

- (void)clearInline
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextGetInlineCandidateCount();
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextRemoveInlineCandidatesInRange();
}

- (void)clearAll
{
  void *v3;

  -[TIMecabraEnvironmentContextWrapper clearContext](self, "clearContext");
  -[TIMecabraEnvironmentContextWrapper clearInline](self, "clearInline");
  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIMecabraEnvironmentContextWrapper setCandidateIndex:](self, "setCandidateIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)declareEndOfSentence
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraDeclareEndOfSentence();
  -[TIMecabraEnvironmentContextWrapper clearAll](self, "clearAll");
}

- (NSMutableArray)environmentCandidates
{
  NSMutableArray *environmentCandidates;
  NSMutableArray *v4;
  NSMutableArray *v5;

  environmentCandidates = self->_environmentCandidates;
  if (!environmentCandidates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_environmentCandidates;
    self->_environmentCandidates = v4;

    environmentCandidates = self->_environmentCandidates;
  }
  return environmentCandidates;
}

- (NSArray)environmentCandidateStrings
{
  void *v2;
  void *v3;

  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mecabraCandidateSurfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)inlineCandidates
{
  void *v3;
  uint64_t InlineCandidateCount;
  uint64_t v5;
  uint64_t i;
  uint64_t InlineCandidateAtIndex;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  InlineCandidateCount = MecabraContextGetInlineCandidateCount();
  if (InlineCandidateCount)
  {
    v5 = InlineCandidateCount;
    for (i = 0; i != v5; ++i)
    {
      -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
      InlineCandidateAtIndex = MecabraContextGetInlineCandidateAtIndex();
      if (InlineCandidateAtIndex)
        objc_msgSend(v3, "addObject:", InlineCandidateAtIndex);
    }
  }
  return (NSArray *)v3;
}

- (void)acceptInlineCandidates
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraAcceptInlineCandidates();
}

- (void)removeCandidatesInRange:(_NSRange)a3
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextRemoveCandidatesInRange();
}

- (void)revertInlineCandidate
{
  void *v3;
  uint64_t v4;

  -[TIMecabraEnvironmentContextWrapper inlineCandidates](self, "inlineCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
    MecabraContextRemoveInlineCandidatesInRange();
  }
}

- (void)revertLearningForCandidate:(void *)a3
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraRevertLearningForCandidate();
}

- (void)syncEnvironmentAndContextCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[TIMecabraEnvironmentContextWrapper temporaryCandidates](self, "temporaryCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIMecabraEnvironmentContextWrapper contextCandidates](self, "contextCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deletionRangesWithElementsToKeep:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext", (_QWORD)v31);
        objc_msgSend(v12, "rangeValue");
        MecabraContextRemoveCandidatesInRange();
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v9);
  }

  -[TIMecabraEnvironmentContextWrapper clearContext](self, "clearContext");
  v13 = -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex");
  v14 = -[TIMecabraEnvironmentContextWrapper candidateInternalIndex](self, "candidateInternalIndex");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex");
      v18 = v14 == 0x7FFFFFFFFFFFFFFFLL ? v17 + 1 : v17;
      if (v18)
      {
        for (j = 0; j != v18; ++j)
        {
          -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext", (_QWORD)v31);
          -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", j);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          MecabraContextAddCandidate();

        }
      }
    }
  }
  -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates", (_QWORD)v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v14 != 0x7FFFFFFFFFFFFFFFLL
    && v23
    && -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex") < v23)
  {
    -[TIMecabraEnvironmentContextWrapper environmentCandidates](self, "environmentCandidates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MecabraCandidateGetSurface();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "substringToIndex:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[TIMecabraEnvironmentContextWrapper createMecabraCandidateFromString:](self, "createMecabraCandidateFromString:", v27);
    if (v28)
    {
      v29 = v28;
      -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
      MecabraContextAddCandidate();

      -[TIMecabraEnvironmentContextWrapper temporaryCandidates](self, "temporaryCandidates");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v29);

    }
  }

}

- (NSMutableArray)temporaryCandidates
{
  NSMutableArray *temporaryCandidates;
  NSMutableArray *v4;
  NSMutableArray *v5;

  temporaryCandidates = self->_temporaryCandidates;
  if (!temporaryCandidates)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_temporaryCandidates;
    self->_temporaryCandidates = v4;

    temporaryCandidates = self->_temporaryCandidates;
  }
  return temporaryCandidates;
}

- (id)contextString:(id)a3 forRightContext:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t LengthForContextString;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  LengthForContextString = MecabraGetLengthForContextString();
  if (v4)
    objc_msgSend(v6, "substringToIndex:", LengthForContextString);
  else
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - LengthForContextString);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPrivateMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  MecabraContextSetOption();
}

- (id)findSupplementalLexiconCandidatesSurroundingCursor
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  return (id)MecabraFindSupplementalLexiconCandidatesWithinContext();
}

- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4
{
  id v5;
  int v6;

  v5 = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  v6 = MecabraAnalyzeStringWithContext();

  return v6 != 0;
}

- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  uint64_t RemainingGestures;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  char v25;

  v5 = a3;
  v25 = 0;
  objc_msgSend(v5, "asMecabraGestures:", &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v5, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "composingInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remainingMecabraInputs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
        -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
        RemainingGestures = MecabraCreateRemainingGestures();
        v10 = (void *)RemainingGestures;
        v12 = RemainingGestures ? RemainingGestures : MEMORY[0x1E0C9AA60];
        objc_msgSend(v9, "setRemainingMecabraInputs:", v12);
        if (!objc_msgSend(v10, "count"))
          -[TIMecabraEnvironmentContextWrapper completelyCommitInlineCandidate:](self, "completelyCommitInlineCandidate:", 0);
      }

      v6 = v10;
    }
  }
  -[TIMecabraEnvironmentContextWrapper lastAnalyzeInputDate](self, "lastAnalyzeInputDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v5, "composingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v5, "composingInput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraEnvironmentContextWrapper lastAnalyzeInputDate](self, "lastAnalyzeInputDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      v21 = v20;

      if (objc_msgSend(v17, "isDrawing") && v21 * 1000.0 < 40.0)
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", (40.0 - v21 * 1000.0) / 1000.0);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironmentContextWrapper setLastAnalyzeInputDate:](self, "setLastAnalyzeInputDate:", v22);

  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  v23 = MecabraAnalyzeGesturesWithContext() != 0;

  return v23;
}

- (BOOL)predictionCandidatesWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  return MecabraPredictionAnalyzeWithContext() != 0;
}

- (void)commitPredictionCandidate:(void *)a3
{
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraPredictionAcceptCandidateWithContext();
}

- (void)partiallyCommitInlineCandidate:(void *)a3
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextAddInlineCandidate();
}

- (void)completelyCommitInlineCandidate:(void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
    MecabraContextAddInlineCandidate();
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TIMecabraEnvironmentContextWrapper inlineCandidates](self, "inlineCandidates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        -[TIMecabraEnvironmentContextWrapper setCandidateIndex:](self, "setCandidateIndex:", -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex") + 1);
        -[TIMecabraEnvironmentContextWrapper addEnvironmentCandidate:atIndex:](self, "addEnvironmentCandidate:atIndex:", v9, -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraAcceptInlineCandidates();
}

- (void)setAppContext:(id)a3
{
  NSString *v4;
  NSString *appContext;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_appContext) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    appContext = self->_appContext;
    self->_appContext = v4;

    -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
    MecabraContextSetAppContext();
  }

}

- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4
{
  -[TIMecabraEnvironmentContextWrapper mecabraContext](self, "mecabraContext");
  MecabraContextSetGeometryModel();
}

- (void)setKeyboardLayout:(id)a3
{
  id v4;

  v4 = a3;
  -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
  MecabraSetKeyboardLayout();

}

- (void)createMecabraCandidateFromString:(id)a3
{
  id v4;
  void *CandidateFromContextString;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TIMecabraEnvironmentContextWrapper mecabraEngine](self, "mecabraEngine");
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
  }
  else
  {
    CandidateFromContextString = 0;
  }

  return CandidateFromContextString;
}

- (NSString)appContext
{
  return self->_appContext;
}

- (unint64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (void)setCandidateIndex:(unint64_t)a3
{
  self->_candidateIndex = a3;
}

- (unint64_t)candidateInternalIndex
{
  return self->_candidateInternalIndex;
}

- (void)setCandidateInternalIndex:(unint64_t)a3
{
  self->_candidateInternalIndex = a3;
}

- (void)setEnvironmentCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_environmentCandidates, a3);
}

- (unint64_t)environmentCandidateCount
{
  return self->_environmentCandidateCount;
}

- (__Mecabra)mecabraEngine
{
  return self->_mecabraEngine;
}

- (__MecabraContext)mecabraContext
{
  return self->_mecabraContext;
}

- (void)setMecabraContext:(__MecabraContext *)a3
{
  self->_mecabraContext = a3;
}

- (void)setTemporaryCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryCandidates, a3);
}

- (int)textContentType
{
  return self->_textContentType;
}

- (int)shuangpinType
{
  return self->_shuangpinType;
}

- (NSDate)lastAnalyzeInputDate
{
  return self->_lastAnalyzeInputDate;
}

- (void)setLastAnalyzeInputDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAnalyzeInputDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalyzeInputDate, 0);
  objc_storeStrong((id *)&self->_temporaryCandidates, 0);
  objc_storeStrong((id *)&self->_environmentCandidates, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end
