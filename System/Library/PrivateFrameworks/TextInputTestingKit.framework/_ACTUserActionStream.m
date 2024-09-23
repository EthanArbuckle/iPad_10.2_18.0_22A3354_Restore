@implementation _ACTUserActionStream

- (_ACTUserActionStream)initWithParameters:(id)a3 delegate:(id)a4
{
  id v6;
  ACTUserActionStreamDelegate *v7;
  _ACTUserActionStream *v8;
  ACTUserMentalCursor *v9;
  ACTUserMentalCursor *cursor;
  NSString *partialCandidateSuffix;
  NSString *partialCandidateIntendedChunk;
  objc_super v14;

  v6 = a3;
  v7 = (ACTUserActionStreamDelegate *)a4;
  v14.receiver = self;
  v14.super_class = (Class)_ACTUserActionStream;
  v8 = -[_ACTUserActionStream init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(ACTUserMentalCursor);
    cursor = v8->_cursor;
    v8->_cursor = v9;

    v8->_lastCursorPositionForTransliteratedCandidate = -1;
    partialCandidateSuffix = v8->_partialCandidateSuffix;
    v8->_partialCandidateSuffix = 0;

    partialCandidateIntendedChunk = v8->_partialCandidateIntendedChunk;
    v8->_partialCandidateIntendedChunk = 0;

    v8->_delegate = v7;
  }
  -[_ACTUserActionStream configureWithParameters:](v8, "configureWithParameters:", v6);

  return v8;
}

- (void)configureWithParameters:(id)a3
{
  TIKeyboardTyperUserModel *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  UserPathManager *v10;
  id v11;

  v11 = a3;
  v4 = -[TIKeyboardTyperUserModel initWithModel:]([TIKeyboardTyperUserModel alloc], "initWithModel:", v11);
  -[_ACTUserActionStream setUserModel:](self, "setUserModel:", v4);

  +[TIErrorGenerator errorGeneratorWithAttributes:](TIErrorGenerator, "errorGeneratorWithAttributes:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream setErrorGenerator:](self, "setErrorGenerator:", v5);

  -[_ACTUserActionStream userModel](self, "userModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "prefersContinuousPath");

  if (v7)
  {
    +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:](TTKDefaultContinuousPathGenerator, "pathGeneratorWithAttributes:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream setPathGenerator:](self, "setPathGenerator:", v8);

  }
  objc_msgSend(v11, "objectForKey:", CFSTR("USER_PATH_FILE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = -[UserPathManager initWithPathFile:]([UserPathManager alloc], "initWithPathFile:", v9);
    -[_ACTUserActionStream setUserPathManager:](self, "setUserPathManager:", v10);

  }
}

- (BOOL)inPartialCandidateSelection
{
  return self->_partialCandidateSuffix != 0;
}

- (NSString)intendedText
{
  void *v2;
  void *v3;

  -[_ACTUserActionStream cursor](self, "cursor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intendedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  self->_randomNumberSeed = a3;
  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRandomNumberSeed:", v3);

  -[_ACTUserActionStream pathGenerator](self, "pathGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRandomNumberSeed:", v3);

  -[_ACTUserActionStream userPathManager](self, "userPathManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRandomNumberSeed:", v3);

}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  if (-[_ACTUserActionStream shouldTypeInternalString](self, "shouldTypeInternalString"))
  {
    -[_ACTUserActionStream delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalStringToInternal:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[_ACTUserActionStream preferBaseKeyForVariants](self, "preferBaseKeyForVariants"))
  {
    -[_ACTUserActionStream delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splitDigraphsInString:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (void)resetForIntendedText:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_ACTUserActionStream userModel](self, "userModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersContinuousPath");
  -[_ACTUserActionStream delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "inputSegmentsForContinuousPathString:", v4);
  else
    objc_msgSend(v7, "inputSegmentsForString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[_ACTUserActionStream externalStringToInternal:](self, "externalStringToInternal:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v10, "copy");
  -[_ACTUserActionStream resetForIntendedSegments:expectedSegments:](self, "resetForIntendedSegments:expectedSegments:", v17, v11);

}

- (void)resetForIntendedSegments:(id)a3 expectedSegments:(id)a4
{
  id v6;
  id v7;
  ACTUserMentalCursor *v8;

  v6 = a4;
  v7 = a3;
  -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", 0.0);
  -[_ACTUserActionStream setLastActionSuppressesError:](self, "setLastActionSuppressesError:", 0);
  -[_ACTUserActionStream setSegmentEditHorizon:](self, "setSegmentEditHorizon:", 0);
  -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:](self, "setLastCursorPositionForTransliteratedCandidate:", -1);
  v8 = -[ACTUserMentalCursor initWithInternalSegments:externalSegments:]([ACTUserMentalCursor alloc], "initWithInternalSegments:externalSegments:", v7, v6);

  -[_ACTUserActionStream setCursor:](self, "setCursor:", v8);
}

- (BOOL)advanceSegmentCursor
{
  void *v3;
  char v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "advanceSegmentCursor");

  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "segmentCursor");
  v7 = -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  if (v6 >= v7)
    -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

- (BOOL)rewindSegmentCursor
{
  void *v2;
  char v3;

  -[_ACTUserActionStream cursor](self, "cursor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rewindSegmentCursor");

  return v3;
}

- (void)advancePositionByString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advancePositionByString:", v4);

  -[_ACTUserActionStream cursor](self, "cursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "segmentCursor");
  v8 = -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  if (v7 >= v8)
    -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)rewindPositionByString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rewindPositionByString:", v4);

}

- (BOOL)advancePositionByAcceptingCandidate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  unint64_t v18;

  v4 = a3;
  -[_ACTUserActionStream userModel](self, "userModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersTransliteration");

  if (v6)
  {
    if (!self->_partialCandidateSuffix)
      -[_ACTUserActionStream advanceSegmentCursor](self, "advanceSegmentCursor");
    goto LABEL_13;
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfInputSegmentsForCandidate:", v4);
  v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v8 + v10;
    -[_ACTUserActionStream cursor](self, "cursor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 >= objc_msgSend(v12, "segmentCursor"))
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == objc_msgSend(v13, "segmentCursor"))
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "positionInCurrentInternalSegment");

        if (v15)
          goto LABEL_9;
      }
      else
      {

      }
      while (1)
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "segmentCursor");

        if (v18 >= v11)
          break;
        -[_ACTUserActionStream advanceSegmentCursor](self, "advanceSegmentCursor");
      }
LABEL_13:
      v16 = 1;
      goto LABEL_14;
    }

  }
LABEL_9:
  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)hasDesiredAutocorrection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  -[_ACTUserActionStream delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isAutocorrection"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfInputSegmentsForCandidate:", v4);

    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)currentAndNextKeysAreTransposable
{
  void *v3;
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
  BOOL v19;
  BOOL v21;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutUtils");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyplane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exactKeyForString:keyplane:includeSecondaryStrings:", v4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextLongCharacter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutUtils");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyplane");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "exactKeyForString:keyplane:includeSecondaryStrings:", v12, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v19 = v18 == 0;
  else
    v19 = 1;
  v21 = !v19 && v10 != v18;

  return v21;
}

- (BOOL)lastAndCurrentKeysAreSame
{
  void *v3;
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
  BOOL v19;
  BOOL v21;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutUtils");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyplane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exactKeyForString:keyplane:includeSecondaryStrings:", v4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentLongCharacter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyboardController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutUtils");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyplane");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "exactKeyForString:keyplane:includeSecondaryStrings:", v12, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v19 = v18 == 0;
  else
    v19 = 1;
  v21 = !v19 && v10 == v18;

  return v21;
}

- (BOOL)shouldTypeInternalString
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "decomposeInputString");

  return v3;
}

- (double)averageActionInterval
{
  void *v2;
  float v3;
  float v4;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageKeyTapsPerSecond");
  v4 = v3;

  return (float)(1.0 / v4);
}

- (BOOL)preferManualShift
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersAutocorrectForCaps") ^ 1;

  return v3;
}

- (BOOL)preferBaseKeyForVariants
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "baseKeyForVariants");

  return v3;
}

- (BOOL)preferPredictionSelection
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersPredictionSelection");

  return v3;
}

- (BOOL)preferInlineSelection
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersInlineSelection");

  return v3;
}

- (BOOL)preferManualCorrection
{
  void *v2;
  char v3;

  -[_ACTUserActionStream userModel](self, "userModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "prefersToCorrectErrors");

  return v3;
}

- (BOOL)shouldIgnoreCurrentCharacter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  BOOL v16;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "positionInCurrentInternalSegment"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "positionInCurrentInternalSegment");
    v8 = objc_msgSend(v4, "length") + v7;
    -[_ACTUserActionStream cursor](self, "cursor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentInternalSegment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8 >= objc_msgSend(v10, "length");

  }
  else
  {
    v11 = 1;
  }

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("'")) & 1) != 0)
    LOBYTE(v12) = 0;
  else
    v12 = objc_msgSend(v4, "isEqualToString:", CFSTR("’")) ^ 1;
  -[_ACTUserActionStream userModel](self, "userModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "prefersAutocorrectForApostrophes");

  v15 = v14 & !-[_ACTUserActionStream isRetyping](self, "isRetyping");
  if (((v11 | v12) & 1) != 0)
    v16 = 0;
  else
    v16 = v15;

  return v16;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[_ACTUserActionStream delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyboardController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutUtils");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = a6;
  objc_msgSend(v14, "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:", v11, v10, v7, -[_ACTUserActionStream isRetyping](self, "isRetyping"), -[_ACTUserActionStream preferBaseKeyForVariants](self, "preferBaseKeyForVariants"), -[_ACTUserActionStream preferManualShift](self, "preferManualShift"), v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)randomActionInterval
{
  void *v3;
  double v4;
  float v5;
  double v6;

  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniformRandomNumber");
  v5 = v4;

  -[_ACTUserActionStream averageActionInterval](self, "averageActionInterval");
  *(float *)&v6 = v6;
  *(float *)&v6 = (v5 + 0.5) * *(float *)&v6;
  return *(float *)&v6;
}

- (float)probabilityOfTransposition
{
  float v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;

  v3 = 0.0;
  if (-[_ACTUserActionStream currentAndNextKeysAreTransposable](self, "currentAndNextKeysAreTransposable"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentLongCharacter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream cursor](self, "cursor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextLongCharacter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_isLetterKey(v5) && _isLetterKey(v7))
    {
      -[_ACTUserActionStream userModel](self, "userModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "probTransposeLetters");
    }
    else
    {
      if ((!_isLetterKey(v5) || !_isSpaceKey(v7))
        && (!_isSpaceKey(v5) || !_isLetterKey(v7)))
      {
        goto LABEL_11;
      }
      -[_ACTUserActionStream userModel](self, "userModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "probTransposeLetterAndSpace");
    }
    v3 = v9;

LABEL_11:
  }
  return v3;
}

- (float)probabilityOfSkippedKey
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_isLetterKey(v4))
  {
    if (-[_ACTUserActionStream lastAndCurrentKeysAreSame](self, "lastAndCurrentKeysAreSame"))
    {
      -[_ACTUserActionStream userModel](self, "userModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "probSkipRepeatLetter");
    }
    else
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "positionInCurrentInternalSegment");

      -[_ACTUserActionStream userModel](self, "userModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      if (v9)
        objc_msgSend(v10, "probSkipLetter");
      else
        objc_msgSend(v10, "probSkipInitialLetter");
    }
    goto LABEL_9;
  }
  v7 = 0.0;
  if (_isSpaceKey(v4))
  {
    -[_ACTUserActionStream userModel](self, "userModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "probSkipSpace");
LABEL_9:
    v7 = v6;

  }
  return v7;
}

- (float)probabilityOfDoubledKey
{
  void *v3;
  void *v4;
  BOOL v5;
  float v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_isLetterKey(v4))
  {

    v6 = 0.0;
LABEL_8:

    return v6;
  }
  v5 = -[_ACTUserActionStream lastAndCurrentKeysAreSame](self, "lastAndCurrentKeysAreSame");

  v6 = 0.0;
  if (!v5)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "positionInCurrentInternalSegment");

    -[_ACTUserActionStream userModel](self, "userModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    if (v8)
      objc_msgSend(v9, "probDoubleTapLetter");
    else
      objc_msgSend(v9, "probDoubleTapInitialLetter");
    v6 = v10;
    goto LABEL_8;
  }
  return v6;
}

- (float)probabilityOfSubstituteKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v7)
  {
    if (_isLetterKey(v4))
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "positionInCurrentInternalSegment");

      -[_ACTUserActionStream userModel](self, "userModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
        objc_msgSend(v11, "probSubstituteLetter");
      else
        objc_msgSend(v11, "probSubstituteInitialLetter");
      goto LABEL_8;
    }
    if (_isSpaceKey(v4))
    {
      -[_ACTUserActionStream userModel](self, "userModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "probSubstituteSpace");
LABEL_8:
      v8 = v13;

    }
  }

  return v8;
}

- (float)probabilityOfExtraneousKey
{
  void *v3;
  void *v4;
  int isLetterKey;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  int v16;
  float v17;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  isLetterKey = _isLetterKey(v4);
  -[_ACTUserActionStream cursor](self, "cursor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "positionInCurrentInternalSegment");

  -[_ACTUserActionStream cursor](self, "cursor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previousLongCharacter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = _isLetterKey(v9);
  -[_ACTUserActionStream cursor](self, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "positionInCurrentInternalSegment");

  if (isLetterKey)
  {
    -[_ACTUserActionStream userModel](self, "userModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v7)
      objc_msgSend(v13, "probExtraneousKey");
    else
      objc_msgSend(v13, "probExtraneousInitialKey");
    goto LABEL_10;
  }
  if (v12)
    v16 = 0;
  else
    v16 = v10;
  v17 = 0.0;
  if (v16 == 1)
  {
    -[_ACTUserActionStream userModel](self, "userModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "probExtraneousFinalKey");
LABEL_10:
    v17 = v15;

  }
  return v17;
}

- (id)nextUserAction
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v7;
  uint64_t v8;
  char v9;

  -[_ACTUserActionStream advancePositionForAutospace](self, "advancePositionForAutospace");
  v9 = 0;
  -[_ACTUserActionStream tryAcceptCandidate](self, "tryAcceptCandidate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[_ACTUserActionStream tryRejectCandidate](self, "tryRejectCandidate"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 0);
  }
  else
  {
    -[_ACTUserActionStream tryBackspacing](self, "tryBackspacing");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v4 = (void *)v7;
      v5 = 1;
      -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 1);
      v9 = 1;
      goto LABEL_5;
    }
    -[_ACTUserActionStream setIsBackspacing:](self, "setIsBackspacing:", 0);
    -[_ACTUserActionStream tryPeriodShortcut](self, "tryPeriodShortcut");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[_ACTUserActionStream tryTypingWillSuppressError:](self, "tryTypingWillSuppressError:", &v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9 != 0;
      goto LABEL_5;
    }
    v4 = (void *)v8;
  }
  v5 = 0;
LABEL_5:
  -[_ACTUserActionStream setLastActionSuppressesError:](self, "setLastActionSuppressesError:", v5);
  return v4;
}

- (BOOL)isFinished
{
  void *v2;
  char v3;

  -[_ACTUserActionStream cursor](self, "cursor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "atEndOfText");

  return v3;
}

- (id)tryAcceptCandidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL isSpaceKey;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v31;

  if (!-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection")
    && !-[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection"))
  {
    v25 = 0;
    return v25;
  }
  -[_ACTUserActionStream delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictionBarCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineCompletionCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream userModel](self, "userModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "prefersTransliteration");

  if (v8)
  {
    if (self->_partialCandidateSuffix)
      -[_ACTUserActionStream findPartialCandidate](self, "findPartialCandidate");
    else
      -[_ACTUserActionStream transliterationCandidate:](self, "transliterationCandidate:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!objc_msgSend(v6, "count"))
  {
LABEL_17:
    if (-[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection"))
    {
      v26 = 0;
      goto LABEL_27;
    }
    -[_ACTUserActionStream candidateToSelectFromCandidates:](self, "candidateToSelectFromCandidates:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v26 = (void *)v9;
    if (v9)
      goto LABEL_22;
    goto LABEL_27;
  }
  v31 = v4;
  objc_msgSend(v6, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputSegmentsForString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (!v14)
  {
LABEL_16:

    v4 = v31;
    goto LABEL_17;
  }
  for (i = v14 - 1; ; --i)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isSpaceKey = _isSpaceKey(v16);

    if (isSpaceKey)
      goto LABEL_13;
    v18 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v13, "subarrayWithRange:", 0, i + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", &stru_24FD49B78);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "candidateByReplacingWithCandidate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v22, "addObject:", v21);
    -[_ACTUserActionStream candidateToSelectFromCandidates:](self, "candidateToSelectFromCandidates:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
      break;
    v24 = -[_ACTUserActionStream preferInlineSelection](self, "preferInlineSelection");

    if (v24)
      goto LABEL_16;
LABEL_13:
    if (!i)
      goto LABEL_16;
  }
  v26 = (void *)v23;

  v4 = v31;
LABEL_22:
  if ((objc_msgSend(v26, "isAutocorrection") & 1) != 0)
    goto LABEL_26;
  -[_ACTUserActionStream userModel](self, "userModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "prefersTransliteration"))
  {

    goto LABEL_26;
  }
  -[_ACTUserActionStream userModel](self, "userModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "prefersContinuousPath");

  if (v29)
  {
LABEL_26:
    -[_ACTUserActionStream tryAcceptingCandidate:](self, "tryAcceptingCandidate:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_27:
  v25 = 0;
LABEL_28:

  return v25;
}

- (id)matchTransliterationCandidateToSegment:(id)a3 withCursorAt:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 < 0
    || (-[_ACTUserActionStream cursor](self, "cursor"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "externalSegments"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9 <= a4))
  {
    v16 = 0;
  }
  else
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalSegments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v6;
    v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v24 = v12;
      v25 = v6;
      v17 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v19, "candidate", v24, v25, (_QWORD)v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v22, "isEqualToString:", v14) & 1) != 0)
          {
            v16 = v19;

            goto LABEL_14;
          }

        }
        v16 = (id)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
          continue;
        break;
      }
LABEL_14:
      v12 = v24;
      v6 = v25;
    }

  }
  return v16;
}

- (id)findPartialCandidate
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  NSUInteger v15;
  NSString *v16;
  NSString *v17;
  NSString *partialCandidateSuffix;
  void *partialCandidateIntendedChunk;
  void *v20;
  NSString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[_ACTUserActionStream delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predictionBarCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {

LABEL_15:
    objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, self->_partialCandidateSuffix);
    partialCandidateSuffix = self->_partialCandidateSuffix;
    self->_partialCandidateSuffix = 0;

    objc_msgSend(v5, "firstObject");
    partialCandidateIntendedChunk = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(partialCandidateIntendedChunk, "input");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithCandidate:forInput:", CFSTR("NO_PARTIAL_CANDIDATE"), v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v12, "candidate", (_QWORD)v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString hasPrefix:](self->_partialCandidateSuffix, "hasPrefix:", v13) && objc_msgSend(v13, "length") > v9)
      {
        v9 = objc_msgSend(v13, "length");
        v14 = v12;

        v8 = v14;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);

  if (!v8)
    goto LABEL_15;
  v15 = -[NSString length](self->_partialCandidateSuffix, "length");
  v16 = self->_partialCandidateSuffix;
  if (v9 == v15)
  {
    v17 = 0;
  }
  else
  {
    -[NSString substringFromIndex:](v16, "substringFromIndex:", v9);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_partialCandidateSuffix;
  }
  self->_partialCandidateSuffix = v17;

  objc_msgSend(v8, "candidate");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
  self->_partialCandidateIntendedChunk = v21;
LABEL_18:

  return v8;
}

- (id)transliterationCandidate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *partialCandidateSuffix;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  char v52;

  v4 = a3;
  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "segmentCursor");

  -[_ACTUserActionStream cursor](self, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "positionInCurrentInternalSegment"))
    goto LABEL_2;
  -[_ACTUserActionStream cursor](self, "cursor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "segmentCursor"))
  {

LABEL_2:
    goto LABEL_3;
  }
  v13 = v6 - 1;
  v14 = -[_ACTUserActionStream lastCursorPositionForTransliteratedCandidate](self, "lastCursorPositionForTransliteratedCandidate");

  if (v14 < v13)
  {
    -[_ACTUserActionStream matchTransliterationCandidateToSegment:withCursorAt:](self, "matchTransliterationCandidateToSegment:withCursorAt:", v4, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_34:
      -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:](self, "setLastCursorPositionForTransliteratedCandidate:", v13);
      -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
      goto LABEL_5;
    }
    -[_ACTUserActionStream cursor](self, "cursor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internalSegments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream cursor](self, "cursor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "externalSegments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "caseInsensitiveCompare:", v20);

    if (-[TIKeyboardTyperUserModel usePartialCandidates](self->_userModel, "usePartialCandidates") && v21)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "externalSegments");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (NSString *)objc_msgSend(v24, "copy");
      partialCandidateSuffix = self->_partialCandidateSuffix;
      self->_partialCandidateSuffix = v25;

      -[_ACTUserActionStream findPartialCandidate](self, "findPartialCandidate");
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_33:
      v9 = (void *)v27;
      goto LABEL_34;
    }
    if (v21)
    {
      -[_ACTUserActionStream delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyboardController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "inputMode");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "normalizedIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "hasSuffix:", CFSTR("-Translit"))
        && (unint64_t)objc_msgSend(v4, "count") >= 2)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
            v27 = objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
LABEL_32:
          objc_msgSend(v4, "firstObject");
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }

      }
      goto LABEL_32;
    }
    objc_msgSend(v4, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream cursor](self, "cursor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "internalSegments");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndex:", v13);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "input");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "length"))
    {
      v40 = objc_msgSend(v38, "length");
      objc_msgSend(v35, "input");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40 > objc_msgSend(v41, "length"))
      {
        objc_msgSend(v38, "lowercaseString");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "input");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "lowercaseString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v42, "hasSuffix:", v44);

        if ((v52 & 1) != 0)
        {
          objc_msgSend(v35, "input");
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v46 = 0;
LABEL_26:
          -[_ACTUserActionStream cursor](self, "cursor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "externalSegments");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectAtIndex:", v13);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            v50 = v49;
          }
          else
          {
            objc_msgSend(v49, "substringFromIndex:", objc_msgSend(v49, "length") - objc_msgSend(v45, "length"));
            v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          v51 = v50;
          objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithCandidate:forInput:", v50, v45);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_34;
        }
LABEL_25:
        v45 = v38;
        v46 = 1;
        goto LABEL_26;
      }

    }
    goto LABEL_25;
  }
LABEL_3:
  -[_ACTUserActionStream cursor](self, "cursor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream matchTransliterationCandidateToSegment:withCursorAt:](self, "matchTransliterationCandidateToSegment:withCursorAt:", v4, objc_msgSend(v8, "segmentCursor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:](self, "setLastCursorPositionForTransliteratedCandidate:", objc_msgSend(v10, "segmentCursor"));

  }
LABEL_5:

  return v9;
}

- (id)candidateToSelectFromCandidates:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke;
  v9[3] = &unk_24FD490C8;
  v9[4] = self;
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_5172);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tryAcceptingCandidate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *partialCandidateIntendedChunk;
  NSString *v16;
  NSString *v17;
  ACTAcceptCandidate *v18;
  void *v19;

  v4 = a3;
  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  v6 = v5;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  v8 = v6 + v7;
  -[_ACTUserActionStream userModel](self, "userModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "prefersTransliteration");

  if (!v10)
  {
    v18 = -[ACTAcceptCandidate initWithCandidate:timestamp:]([ACTAcceptCandidate alloc], "initWithCandidate:timestamp:", v4, v8);
    if (!v18)
      goto LABEL_10;
    goto LABEL_7;
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "externalSegments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream cursor](self, "cursor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "segmentCursor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
  if (partialCandidateIntendedChunk)
  {
    v16 = partialCandidateIntendedChunk;

    v17 = self->_partialCandidateIntendedChunk;
    self->_partialCandidateIntendedChunk = 0;

    v14 = v16;
  }
  v18 = -[ACTAcceptCandidate initWithCandidate:timestamp:intendedCandidate:]([ACTAcceptCandidate alloc], "initWithCandidate:timestamp:intendedCandidate:", v4, v14, v8);

  if (v18)
  {
LABEL_7:
    -[_ACTUserActionStream cursor](self, "cursor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction setInputSegment:](v18, "setInputSegment:", objc_msgSend(v19, "segmentCursor"));

    if (-[_ACTUserActionStream advancePositionByAcceptingCandidate:](self, "advancePositionByAcceptingCandidate:", v4))
    {
      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v8);
    }
    else
    {

      v18 = 0;
    }
  }
LABEL_10:

  return v18;
}

- (id)tryRejectCandidate
{
  void *v3;
  void *v4;
  void *v5;
  ACTRejectCandidate *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  -[_ACTUserActionStream delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_14;
  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "positionInCurrentInternalSegment"))
    goto LABEL_3;
  if (-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection"))
  {

  }
  else
  {
    v7 = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");

    if (!v7)
    {
LABEL_14:
      v6 = 0;
      goto LABEL_15;
    }
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfInputSegmentsForCandidate:", v4);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  v10 = (void *)MEMORY[0x24BEB4E20];
  objc_msgSend(v4, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateWithUnchangedInput:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "rangeOfInputSegmentsForCandidate:", v5);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL
    && -[_ACTUserActionStream shouldRejectBadAutocorrection](self, "shouldRejectBadAutocorrection"))
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v15 = v14;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v17 = v15 + v16;
    v6 = -[ACTRejectCandidate initWithCandidate:timestamp:]([ACTRejectCandidate alloc], "initWithCandidate:timestamp:", v4, v17);
    if (v6)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "segmentCursor"))
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", objc_msgSend(v19, "segmentCursor") - 1);

      }
      else
      {
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", 1);
      }

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v17);
    }
    goto LABEL_4;
  }
LABEL_3:
  v6 = 0;
LABEL_4:

LABEL_15:
  return v6;
}

- (BOOL)isRetyping
{
  BOOL v3;
  void *v4;
  unint64_t v5;

  if (-[_ACTUserActionStream isBackspacing](self, "isBackspacing")
    || -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing") == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "segmentCursor");
  v3 = v5 < -[_ACTUserActionStream segmentCursorBeforeBackspacing](self, "segmentCursorBeforeBackspacing");

  return v3;
}

- (_NSRange)documentEditRangeWithSegmentRangePtr:(_NSRange *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  void *v34;
  _NSRange *v35;
  _NSRange result;

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  -[_ACTUserActionStream cursor](self, "cursor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "segmentAnchorRangeForCursor:withDocumentBefore:", v8, v6);
  v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
    *a3 = (_NSRange)xmmword_22FAC90B0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v35 = a3;
    -[_ACTUserActionStream cursor](self, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "externalSegments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subarrayWithRange:", v9, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", &stru_24FD49B78);
    v17 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v17;
    v18 = objc_msgSend(v6, "rangeOfString:options:", v17, 4);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      v20 = 0;
    else
      v20 = v19;
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      v21 = 0;
    else
      v21 = v18;
    v13 = v20 + v21;
    v12 = objc_msgSend(v6, "length") - (v20 + v21);
    v22 = v9 + v11;
    -[_ACTUserActionStream cursor](self, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "segmentCursor");
    -[_ACTUserActionStream cursor](self, "cursor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "externalSegments");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    -[_ACTUserActionStream cursor](self, "cursor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v24 >= v27)
    {
      objc_msgSend(v28, "externalSegments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v31, "count");

    }
    else
    {
      v30 = objc_msgSend(v28, "segmentCursor") + 1;
    }

    v35->location = v22;
    v35->length = v30 - v22;

  }
  v32 = v13;
  v33 = v12;
  result.length = v33;
  result.location = v32;
  return result;
}

- (BOOL)canBeginBackspacing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[_ACTUserActionStream isBackspacing](self, "isBackspacing"))
    return 0;
  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "segmentCursor");

  if (!v4)
    return 0;
  -[_ACTUserActionStream cursor](self, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "positionInCurrentInternalSegment");

  return !v6 && -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
}

- (BOOL)canContinueBackspacing
{
  _BOOL4 v3;

  v3 = -[_ACTUserActionStream isBackspacing](self, "isBackspacing");
  if (v3)
    LOBYTE(v3) = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
  return v3;
}

- (BOOL)shouldBeginCorrectingAfterWord
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  double v7;
  float v8;

  -[_ACTUserActionStream userModel](self, "userModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "probBeginCorrectingAfterWord");
  v5 = v4;

  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniformRandomNumber");
  v8 = v7;

  return v5 > v8;
}

- (BOOL)shouldBeginCorrectingAfterWordTerminator
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  double v7;
  float v8;

  -[_ACTUserActionStream userModel](self, "userModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "probBeginCorrectingAfterWordTerminator");
  v5 = v4;

  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniformRandomNumber");
  v8 = v7;

  return v5 > v8;
}

- (BOOL)shouldRejectBadAutocorrection
{
  _BOOL4 v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  double v8;
  float v9;

  if (-[_ACTUserActionStream preferPredictionSelection](self, "preferPredictionSelection"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[_ACTUserActionStream preferManualCorrection](self, "preferManualCorrection");
    if (v3)
    {
      -[_ACTUserActionStream userModel](self, "userModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "probRejectBadAutocorrection");
      v6 = v5;

      -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniformRandomNumber");
      v9 = v8;

      LOBYTE(v3) = v6 > v9;
    }
  }
  return v3;
}

- (id)tryBackspacing
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  ACTBackspaceMentalCursor *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  _BOOL4 v70;
  unint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  ACTKeyTap *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  unint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  int v111;
  _BOOL4 v112;
  void *v113;
  __int128 v114;

  v3 = -[_ACTUserActionStream canBeginBackspacing](self, "canBeginBackspacing");
  v4 = -[_ACTUserActionStream canContinueBackspacing](self, "canContinueBackspacing");
  v5 = v4;
  if (!v3 && !v4)
  {
LABEL_3:
    v6 = 0;
    goto LABEL_4;
  }
  if (v3)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "segmentCursor");
    -[_ACTUserActionStream userModel](self, "userModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "maxPriorSegmentsCheckedForErrors");

    if (v15 <= v17)
    {
      v21 = 0;
    }
    else
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "segmentCursor");
      -[_ACTUserActionStream userModel](self, "userModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19 - objc_msgSend(v20, "maxPriorSegmentsCheckedForErrors");

    }
    v37 = -[_ACTUserActionStream segmentEditHorizon](self, "segmentEditHorizon");
    if (v37 <= v21)
      v38 = v21;
    else
      v38 = v37;
    -[_ACTUserActionStream setSegmentEditHorizon:](self, "setSegmentEditHorizon:", v38);
  }
  v114 = xmmword_22FAC90B0;
  v39 = -[_ACTUserActionStream documentEditRangeWithSegmentRangePtr:](self, "documentEditRangeWithSegmentRangePtr:", &v114);
  if (v39 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_30;
  v41 = v114;
  if ((_QWORD)v114 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_30;
  v42 = v39;
  v43 = v40;
  if (v41 < -[_ACTUserActionStream segmentEditHorizon](self, "segmentEditHorizon")
    || -[_ACTUserActionStream hasDesiredAutocorrection](self, "hasDesiredAutocorrection"))
  {
    goto LABEL_30;
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "segmentCursor"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "positionInCurrentInternalSegment"))
    {
      v112 = 0;
    }
    else
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "externalSegments");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream cursor](self, "cursor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndex:", objc_msgSend(v50, "segmentCursor") - 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = !_isWordEndingKey(v51);

    }
  }
  else
  {
    v112 = 0;
  }

  -[_ACTUserActionStream cursor](self, "cursor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "segmentCursor"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "externalSegments");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream cursor](self, "cursor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndex:", objc_msgSend(v55, "segmentCursor") - 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v110) = _isWordEndingKey(v56);

  }
  else
  {
    LODWORD(v110) = 0;
  }

  -[_ACTUserActionStream cursor](self, "cursor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "atEndOfText"))
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "externalSegments");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "lastObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = !_isWordEndingKey(v60);

  }
  else
  {
    v61 = 0;
  }

  if (!v43)
  {
    if (*((_QWORD *)&v114 + 1))
      v70 = v3;
    else
      v70 = 0;
    if (v70)
    {
      v71 = v114;
      -[_ACTUserActionStream cursor](self, "cursor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "segmentCursor");

      if (v71 < v73
        && ((v112 || v61)
         && -[_ACTUserActionStream shouldBeginCorrectingAfterWord](self, "shouldBeginCorrectingAfterWord")
         || (v110 | v61) == 1
         && -[_ACTUserActionStream shouldBeginCorrectingAfterWordTerminator](self, "shouldBeginCorrectingAfterWordTerminator")))
      {
        v6 = objc_alloc_init(ACTBackspaceMentalCursor);
        -[_ACTUserActionStream cursor](self, "cursor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", objc_msgSend(v74, "segmentCursor"));

        while (1)
        {
          -[_ACTUserActionStream cursor](self, "cursor", v110);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "segmentCursor");
          v77 = v114;

          if (v76 <= v77)
            break;
          -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
        }
        -[_ACTUserActionStream cursor](self, "cursor");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", objc_msgSend(v101, "segmentCursor"));

        -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
        v103 = v102;
        -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
        -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v103 + v104);
        goto LABEL_4;
      }
    }
    goto LABEL_3;
  }
  -[_ACTUserActionStream delegate](self, "delegate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "document");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "substringWithRange:", v42, v43);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "externalSegments");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "subarrayWithRange:", v114);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "componentsJoinedByString:", &stru_24FD49B78);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v64, "length") && (objc_msgSend(v68, "hasPrefix:", v64) & 1) == 0)
  {
    if (!v3)
      goto LABEL_62;
    if ((v112 || v61) && -[_ACTUserActionStream shouldBeginCorrectingAfterWord](self, "shouldBeginCorrectingAfterWord"))
    {
      v69 = 1;
LABEL_64:
      LODWORD(v110) = v69;
      -[_ACTUserActionStream delegate](self, "delegate", v110);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "keyboardController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "layoutUtils");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream delegate](self, "delegate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "keyplane");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "exactKeyForString:keyplane:includeSecondaryStrings:", CFSTR("Delete"), v82, 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v84 = v83;
      -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
      v86 = v85;
      -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
      v88 = v86 + v87;
      -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "paddedFrame");
      objc_msgSend(v89, "errorForKeyString:rect:", CFSTR("Delete"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream delegate](self, "delegate");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "pointForAttemptedTapOnKey:withError:", v83, v90);
      v93 = v92;
      v95 = v94;

      -[_ACTUserActionStream delegate](self, "delegate");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream delegate](self, "delegate");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "keyplane");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "keyContainingPoint:inKeyplane:", v98, v93, v95);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (v99)
        v100 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v84, v99, v90, 0, v93, v95, v88);
      else
        v100 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]([ACTSkipKeyTap alloc], "initWithIntendedKey:timestamp:", v84, v88);
      v6 = (ACTBackspaceMentalCursor *)v100;
      v113 = v84;
      if (v111)
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", objc_msgSend(v105, "segmentCursor"));

      }
      while (1)
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v106, "segmentCursor");
        v108 = v114;

        if (v107 <= v108)
          break;
        -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
      }
      -[_ACTUserActionStream cursor](self, "cursor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTUserAction setInputSegment:](v6, "setInputSegment:", objc_msgSend(v109, "segmentCursor"));

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v88);
      goto LABEL_67;
    }
    if ((v110 | v61) == 1)
      v69 = -[_ACTUserActionStream shouldBeginCorrectingAfterWordTerminator](self, "shouldBeginCorrectingAfterWordTerminator");
    else
LABEL_62:
      v69 = 0;
    if (v5 || v69)
      goto LABEL_64;
  }
  v6 = 0;
LABEL_67:

LABEL_4:
  if (v6)
    v7 = 0;
  else
    v7 = v5;
  if (v7)
  {
    v114 = xmmword_22FAC90B0;
    v8 = -[_ACTUserActionStream documentEditRangeWithSegmentRangePtr:](self, "documentEditRangeWithSegmentRangePtr:", &v114);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentInternalSegment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream cursor](self, "cursor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "substringToIndex:", objc_msgSend(v12, "positionInCurrentInternalSegment"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream rewindPositionByString:](self, "rewindPositionByString:", v13);
    }
    else
    {
      v22 = v8;
      v23 = v9;
      -[_ACTUserActionStream delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "document");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "substringWithRange:", v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream externalStringToInternal:](self, "externalStringToInternal:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");
      -[_ACTUserActionStream cursor](self, "cursor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "positionInCurrentInternalSegment");

      -[_ACTUserActionStream cursor](self, "cursor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "currentInternalSegment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 <= v29)
      {
        v46 = objc_msgSend(v26, "length");
        -[_ACTUserActionStream cursor](self, "cursor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "substringWithRange:", v46, objc_msgSend(v47, "positionInCurrentInternalSegment") - objc_msgSend(v26, "length"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[_ACTUserActionStream rewindPositionByString:](self, "rewindPositionByString:", v36);
      }
      else
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "positionInCurrentInternalSegment");
        v34 = objc_msgSend(v26, "length");
        -[_ACTUserActionStream cursor](self, "cursor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "substringWithRange:", v33, v34 - objc_msgSend(v35, "positionInCurrentInternalSegment"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v36);
      }

    }
LABEL_30:
    v6 = 0;
  }
  return v6;
}

- (id)tryPeriodShortcut
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ACTDoubleKeyTap *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  ACTKeyTap *v45;
  ACTKeyTap *v46;
  ACTKeyTap *v47;
  _BOOL4 v48;
  ACTDoubleKeyTap *v49;
  ACTKeyTap *v50;
  void *v51;
  void *v53;
  void *v54;
  ACTKeyTap *v55;

  -[_ACTUserActionStream userModel](self, "userModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersSpaceBarDoubleTap");

  if (v4)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLongCharacter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream cursor](self, "cursor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextLongCharacter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!v6 || !v8)
      goto LABEL_26;
    objc_msgSend(v6, "stringByAppendingString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR(". ")))
    {
      v9 = 0;
LABEL_25:

LABEL_26:
      return v9;
    }
    -[_ACTUserActionStream delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyboardController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutUtils");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyplane");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exactKeyForString:keyplane:", CFSTR(" "), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v9 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v18 = v17;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v20 = v18 + v19;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paddedFrame");
    objc_msgSend(v21, "errorForKeyString:rect:", CFSTR(" "));
    v22 = objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pointForAttemptedTapOnKey:withError:", v16, v22);
    v25 = v24;
    v27 = v26;

    -[_ACTUserActionStream delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "keyplane");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "keyContainingPoint:inKeyplane:", v30, v25, v27);
    v31 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v31;
    v54 = (void *)v22;
    if (v31)
      v55 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v16, v31, v22, 0, v25, v27, v20);
    else
      v55 = 0;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v33 = v20 + v32 * 0.5;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paddedFrame");
    objc_msgSend(v34, "errorForKeyString:rect:", CFSTR(" "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pointForAttemptedTapOnKey:withError:", v16, v35);
    v38 = v37;
    v40 = v39;

    -[_ACTUserActionStream delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "keyplane");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "keyContainingPoint:inKeyplane:", v43, v38, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", 0, v44, v35, 0, v38, v40, v33);
      v46 = v45;
      v47 = v55;
      v48 = v55 != 0;
      if (v55 && v45)
      {
        v49 = -[ACTDoubleKeyTap initWithFirstTap:secondTap:]([ACTDoubleKeyTap alloc], "initWithFirstTap:secondTap:", v55, v45);
        goto LABEL_21;
      }
    }
    else
    {
      v46 = 0;
      v47 = v55;
      v48 = v55 != 0;
    }
    if (v48)
      v50 = v47;
    else
      v50 = v46;
    v49 = v50;
LABEL_21:
    v9 = v49;
    if (v49)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTUserAction setInputSegment:](v9, "setInputSegment:", objc_msgSend(v51, "segmentCursor"));

      v47 = v55;
      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v10);
      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v33);
    }

    goto LABEL_24;
  }
  v9 = 0;
  return v9;
}

- (id)tryTypingWillSuppressError:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  void *v24;
  void *v25;
  char v26;
  float v27;
  float v28;
  float v29;

  *a3 = 0;
  if (-[_ACTUserActionStream shouldIgnoreCurrentCharacter](self, "shouldIgnoreCurrentCharacter"))
  {
    do
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLongCharacter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v6);
    }
    while (-[_ACTUserActionStream shouldIgnoreCurrentCharacter](self, "shouldIgnoreCurrentCharacter"));
  }
  -[_ACTUserActionStream cursor](self, "cursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "atEndOfText");

  if ((v8 & 1) == 0)
  {
    -[_ACTUserActionStream userModel](self, "userModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "prefersContinuousPath") & 1) != 0)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "positionInCurrentInternalSegment");

      if (!v12)
      {
        -[_ACTUserActionStream tryContinuousPath](self, "tryContinuousPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {

    }
    v9 = 0;
LABEL_10:
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniformRandomNumber");
    v15 = v14;

    if (v9)
      return v9;
    v16 = v15;
    v17 = 0.0;
    if (!-[_ACTUserActionStream isRetyping](self, "isRetyping")
      && !-[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      && !-[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      -[_ACTUserActionStream userModel](self, "userModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "prefersTransliteration") & 1) != 0)
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "nextLongCharacterEndsSegment");

        if ((v26 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      -[_ACTUserActionStream probabilityOfTransposition](self, "probabilityOfTransposition");
      v17 = v29 + 0.0;
      if (v16 >= 0.0 && v17 > v16)
      {
        -[_ACTUserActionStream tryTransposedKeyTaps](self, "tryTransposedKeyTaps");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_53;
      }
    }
LABEL_14:
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      v18 = v17;
    }
    else
    {
      -[_ACTUserActionStream probabilityOfSkippedKey](self, "probabilityOfSkippedKey");
      v18 = v17 + v27;
      if (v17 <= v16 && v18 > v16)
      {
        -[_ACTUserActionStream trySkipKeyTap](self, "trySkipKeyTap");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_53;
      }
    }
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError"))
    {
      v19 = v18;
    }
    else
    {
      -[_ACTUserActionStream probabilityOfSubstituteKey](self, "probabilityOfSubstituteKey");
      v19 = v18 + v23;
      if (v18 <= v16 && v19 > v16)
      {
        -[_ACTUserActionStream trySubstituteKeyTap](self, "trySubstituteKeyTap");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_53;
      }
    }
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      v20 = v19;
    }
    else
    {
      -[_ACTUserActionStream probabilityOfExtraneousKey](self, "probabilityOfExtraneousKey");
      v20 = v19 + v28;
      if (v19 <= v16 && v20 > v16)
      {
        -[_ACTUserActionStream tryExtraKeyTap](self, "tryExtraKeyTap");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_53;
      }
    }
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString")
      || (-[_ACTUserActionStream probabilityOfDoubledKey](self, "probabilityOfDoubledKey"), v20 > v16)
      || (float)(v20 + v21) <= v16
      || (-[_ACTUserActionStream tryDoubleKeyTap](self, "tryDoubleKeyTap"),
          (v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[_ACTUserActionStream tryKeyTap](self, "tryKeyTap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        return v9;
      -[_ACTUserActionStream tryChangeKeyplane](self, "tryChangeKeyplane");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        -[_ACTUserActionStream trySelectPopupVariant](self, "trySelectPopupVariant");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        return v9;
      }
    }
LABEL_53:
    v9 = (void *)v22;
    *a3 = 1;
    return v9;
  }
  v9 = 0;
  return v9;
}

- (id)tryTransposedKeyTaps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ACTTransposeKeyTaps *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  ACTKeyTap *v43;
  ACTKeyTap *v44;
  ACTKeyTap *v45;
  void *v46;
  void *v48;
  void *v49;
  ACTKeyTap *v50;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream cursor](self, "cursor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextLongCharacter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyplane");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v9, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v4 && v7 && v9 && v12)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v15 = v14;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v17 = v15 + v16;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paddedFrame");
    objc_msgSend(v18, "errorForKeyString:rect:", v9);
    v19 = objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pointForAttemptedTapOnKey:withError:", v12, v19);
    v22 = v21;
    v24 = v23;

    -[_ACTUserActionStream delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "keyplane");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyContainingPoint:inKeyplane:", v27, v22, v24);
    v28 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v28;
    v49 = (void *)v19;
    if (v28)
      v50 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v12, v28, v19, 0, v22, v24, v17);
    else
      v50 = 0;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v30 = v29;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paddedFrame");
    objc_msgSend(v31, "errorForKeyString:rect:", v4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pointForAttemptedTapOnKey:withError:", v7, v32);
    v35 = v34;
    v37 = v36;

    -[_ACTUserActionStream delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "keyplane");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "keyContainingPoint:inKeyplane:", v40, v35, v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = v17 + v30 * 0.5;
      v43 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v41, v32, 0, v35, v37, v42);
      v44 = v43;
      v13 = 0;
      v45 = v50;
      if (v50)
      {
        if (v43)
        {
          v13 = -[ACTTransposeKeyTaps initWithFirstTap:secondTap:]([ACTTransposeKeyTaps alloc], "initWithFirstTap:secondTap:", v50, v43);
          if (v13)
          {
            -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v42);
            -[_ACTUserActionStream cursor](self, "cursor");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACTUserAction setInputSegment:](v13, "setInputSegment:", objc_msgSend(v46, "segmentCursor"));

            v45 = v50;
            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v9);
          }
        }
      }
    }
    else
    {
      v13 = 0;
      v44 = 0;
      v45 = v50;
    }

  }
  return v13;
}

- (id)trySkipKeyTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  ACTSkipKeyTap *v10;
  void *v11;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  v9 = v8;
  v10 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]([ACTSkipKeyTap alloc], "initWithIntendedKey:timestamp:", v7, v8);
  if (v10)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction setInputSegment:](v10, "setInputSegment:", objc_msgSend(v11, "segmentCursor"));

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v9);
  }

  return v10;
}

- (id)trySubstituteKeyTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  ACTSubstituteKeyTap *v35;
  double v36;
  void *v37;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  v9 = v8;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  v11 = v10;
  -[_ACTUserActionStream delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniformRandomPointInRect:", v15, v17, v19, v21);
  v24 = v23;
  v26 = v25;

  -[_ACTUserActionStream delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "keyplane");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "keyContainingPoint:inKeyplane:", v29, v24, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream userModel](self, "userModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "prefersTransliteration"))
    goto LABEL_6;
  objc_msgSend(v30, "representedString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[_ACTUserActionStream userModel](self, "userModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "spacesBetweenTransliterations");

  if (v34)
  {
    -[_ACTUserActionStream tryAcceptCandidate](self, "tryAcceptCandidate");
    v35 = (ACTSubstituteKeyTap *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_7:
  v36 = v9 + v11;
  v35 = -[ACTSubstituteKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:]([ACTSubstituteKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:", v7, v30, 0, v24, v26, v36);
  if (v35)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction setInputSegment:](v35, "setInputSegment:", objc_msgSend(v37, "segmentCursor"));

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v36);
  }
LABEL_9:

  return v35;
}

- (id)tryExtraKeyTap
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ACTExtraKeyTap *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  v4 = v3;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  v6 = v4 + v5;
  -[_ACTUserActionStream delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniformRandomPointInRect:", v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;

  -[_ACTUserActionStream delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "keyplane");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "keyContainingPoint:inKeyplane:", v24, v19, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[ACTExtraKeyTap initWithTouchedKey:location:timestamp:]([ACTExtraKeyTap alloc], "initWithTouchedKey:location:timestamp:", v25, v19, v21, v6);
  if (v26)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v27, "positionInCurrentInternalSegment"))
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currentExternalSegment");
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v33 = (void *)v32;
        -[_ACTUserActionStream cursor](self, "cursor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentExternalSegment");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", CFSTR(" "));

        if ((v36 & 1) != 0)
        {
          -[_ACTUserActionStream cursor](self, "cursor");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "segmentCursor") - 1;
          goto LABEL_5;
        }
LABEL_4:
        -[_ACTUserActionStream cursor](self, "cursor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "segmentCursor");
LABEL_5:
        -[ACTUserAction setInputSegment:](v26, "setInputSegment:", v29);

        -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v6);
        goto LABEL_6;
      }

    }
    goto LABEL_4;
  }
LABEL_6:

  return v26;
}

- (id)tryDoubleKeyTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ACTDoubleKeyTap *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ACTKeyTap *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  ACTKeyTap *v39;
  ACTKeyTap *v40;
  void *v41;
  void *v43;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v7 && v4)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v10 = v9;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v12 = v10 + v11;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paddedFrame");
    objc_msgSend(v13, "errorForKeyString:rect:", v4);
    v14 = objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointForAttemptedTapOnKey:withError:", v7, v14);
    v17 = v16;
    v19 = v18;

    -[_ACTUserActionStream delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "keyplane");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)v14;
    if (v23)
      v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v23, v14, 0, v17, v19, v12);
    else
      v24 = 0;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v26 = v25;
    -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paddedFrame");
    objc_msgSend(v27, "errorForKeyString:rect:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ACTUserActionStream delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "pointForAttemptedTapOnKey:withError:", v7, v28);
    v31 = v30;
    v33 = v32;

    -[_ACTUserActionStream delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "keyplane");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "keyContainingPoint:inKeyplane:", v36, v31, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = v12 + v26;
      v39 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", 0, v37, v28, 0, v31, v33, v38);
      v40 = v39;
      v8 = 0;
      if (v24)
      {
        if (v39)
        {
          v8 = -[ACTDoubleKeyTap initWithFirstTap:secondTap:]([ACTDoubleKeyTap alloc], "initWithFirstTap:secondTap:", v24, v39);
          if (v8)
          {
            -[_ACTUserActionStream cursor](self, "cursor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACTUserAction setInputSegment:](v8, "setInputSegment:", objc_msgSend(v41, "segmentCursor"));

            -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
            -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v38);
          }
        }
      }
    }
    else
    {
      v8 = 0;
      v40 = 0;
    }

  }
  return v8;
}

- (id)tryKeyTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ACTKeyTap *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyplane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v4, v6, -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || !_isLetterKey(v4)
      || (-[_ACTUserActionStream cursor](self, "cursor"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "atBeginningOfText"),
          v14,
          (v15 & 1) != 0))
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_15;
    }
    -[_ACTUserActionStream delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "locale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseStringWithLocale:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "isEqualToString:", v4);
    -[_ACTUserActionStream delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "keyplane");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isShiftKeyplane");

    v7 = 0;
    if (v33 && v36)
    {
      -[_ACTUserActionStream delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "locale");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "capitalizedStringWithLocale:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "keyplane");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:](self, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v39, v41, -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v8 = 0;
  if (v7 && v4)
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v10 = v9;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v12 = v11;
    if (-[_ACTUserActionStream isRetyping](self, "isRetyping"))
    {
      +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "representedString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paddedFrame");
      objc_msgSend(v16, "errorForKeyString:rect:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = v10 + v12;
    -[_ACTUserActionStream delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pointForAttemptedTapOnKey:withError:", v7, v13);
    v21 = v20;
    v23 = v22;

    -[_ACTUserActionStream delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyplane");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "keyContainingPoint:inKeyplane:", v26, v21, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v8 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v27, v13, -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"), v21, v23, v18);
      -[_ACTUserActionStream isRetyping](self, "isRetyping");
      if (!v8)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v8 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]([ACTSkipKeyTap alloc], "initWithIntendedKey:timestamp:", v7, v18);
      if (!v8)
        goto LABEL_14;
    }
    -[_ACTUserActionStream cursor](self, "cursor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction setInputSegment:](v8, "setInputSegment:", objc_msgSend(v28, "segmentCursor"));

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v18);
    -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 0);
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (id)tryContinuousPath
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  ACTPathWord *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  ACTPathWord *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  __CFString *v56;
  _ACTUserActionStream *v57;
  id v58;
  _QWORD *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  _QWORD v70[5];
  id v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInternalSegment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream userModel](self, "userModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "expectsAppendedSpaceToContinuousPath");

  if ((v6 & 1) != 0
    || !objc_msgSend(v4, "isEqualToString:", CFSTR(" "))
    || (-[_ACTUserActionStream cursor](self, "cursor"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "positionInCurrentInternalSegment"),
        v7,
        v8))
  {
    v9 = 0;
  }
  else
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "advanceSegmentCursor");

    -[_ACTUserActionStream cursor](self, "cursor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentInternalSegment");
    v31 = objc_claimAutoreleasedReturnValue();

    v9 = 1;
    v4 = (void *)v31;
  }
  if ((objc_msgSend((id)objc_opt_class(), "isPathableWord:", v4) & 1) != 0)
  {
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__5151;
    v70[4] = __Block_byref_object_dispose__5152;
    v71 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ACTUserActionStream cursor](self, "cursor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __41___ACTUserActionStream_tryContinuousPath__block_invoke;
    v55[3] = &unk_24FD49130;
    v56 = CFSTR("'’׳״-");
    v57 = self;
    v12 = v10;
    v58 = v12;
    v59 = v70;
    v60 = &v66;
    v61 = &v62;
    objc_msgSend(v11, "enumerateRemainingLongCharactersForCurrentSegment:", v55);

    if (*((_BYTE *)v63 + 24) || !*((_BYTE *)v67 + 24))
    {
      v13 = 0;
    }
    else
    {
      -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
      v15 = v14;
      -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
      v17 = v16;
      -[_ACTUserActionStream delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "keyboardController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "layoutUtils");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "keyplane");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createTTKPlane:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream userPathManager](self, "userPathManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_16;
      -[_ACTUserActionStream userPathManager](self, "userPathManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "keyboardController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lookup:keyboardController:", v4, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = 1;
      }
      else
      {
LABEL_16:
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v33 = v12;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v52 != v35)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "representedString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "appendString:", v37);

            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
          }
          while (v34);
        }

        -[_ACTUserActionStream pathGenerator](self, "pathGenerator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "generatePathFromString:layout:", v32, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0;
      }
      v39 = -[ACTPathWord initWithPath:intendedString:keyplane:fromUserData:]([ACTPathWord alloc], "initWithPath:intendedString:keyplane:fromUserData:", v27, v4, v22, v28);
      -[_ACTUserActionStream cursor](self, "cursor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTUserAction setInputSegment:](v39, "setInputSegment:", objc_msgSend(v40, "segmentCursor"));

      -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v15 + v17);
      -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 0);
      -[_ACTUserActionStream cursor](self, "cursor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "currentInternalSegment");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ACTUserActionStream cursor](self, "cursor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v43, "positionInCurrentInternalSegment"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v44);
      -[_ACTUserActionStream userModel](self, "userModel");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = objc_msgSend(v45, "expectsAppendedSpaceToContinuousPath");

      if ((_DWORD)v41)
      {
        -[_ACTUserActionStream cursor](self, "cursor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "currentInternalSegment");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR(" "));

        if (v48)
          -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", CFSTR(" "));
      }
      v13 = v39;

    }
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(v70, 8);

  }
  else
  {
    if (v9)
      -[_ACTUserActionStream rewindSegmentCursor](self, "rewindSegmentCursor");
    v13 = 0;
  }

  return v13;
}

- (id)tryChangeKeyplane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ACTKeyTap *v24;
  ACTKeyTap *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLongCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shiftKeyToAccessKeyplaneCloserToKeyString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_ACTUserActionStream setLastActionUseSecondaryString:](self, "setLastActionUseSecondaryString:", 1);
  }
  else
  {
    -[_ACTUserActionStream delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyToAccessKeyplaneCloserToKeyString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[_ACTUserActionStream delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyboardController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutUtils");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "baseKeyForString:", v4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[_ACTUserActionStream delegate](self, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "keyToAccessKeyplaneCloserToKeyString:", v31);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          goto LABEL_4;
      }
      else
      {
        v6 = 0;
      }
      v25 = 0;
      goto LABEL_10;
    }
  }
LABEL_4:
  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  v9 = v8;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  v11 = v9 + v10;
  -[_ACTUserActionStream errorGenerator](self, "errorGenerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paddedFrame");
  objc_msgSend(v12, "errorForKeyString:rect:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ACTUserActionStream delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pointForAttemptedTapOnKey:withError:", v6, v14);
  v17 = v16;
  v19 = v18;

  -[_ACTUserActionStream delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ACTUserActionStream delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyplane");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v6, v23, v14, 0, v17, v19, v11);
  else
    v24 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]([ACTSkipKeyTap alloc], "initWithIntendedKey:timestamp:", v6, v11);
  v25 = v24;
  if (v24)
  {
    -[_ACTUserActionStream cursor](self, "cursor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTUserAction setInputSegment:](v25, "setInputSegment:", objc_msgSend(v26, "segmentCursor"));

    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v11);
  }

LABEL_10:
  return v25;
}

- (id)trySelectPopupVariant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  ACTSelectPopupVariant *v10;
  void *v11;

  -[_ACTUserActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentComposedCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[_ACTUserActionStream cursor](self, "cursor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "currentLongCharacter"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
    v7 = v6;
    -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
    v9 = v7 + v8;
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v9);
    v10 = -[ACTSelectPopupVariant initWithIntendedKey:timestamp:]([ACTSelectPopupVariant alloc], "initWithIntendedKey:timestamp:", v4, v9);
    if (v10)
    {
      -[_ACTUserActionStream cursor](self, "cursor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTUserAction setInputSegment:](v10, "setInputSegment:", objc_msgSend(v11, "segmentCursor"));

      -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ACTUserActionStreamDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACTUserActionStreamDelegate *)a3;
}

- (TIErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_errorGenerator, a3);
}

- (TIKeyboardTyperUserModel)userModel
{
  return self->_userModel;
}

- (void)setUserModel:(id)a3
{
  objc_storeStrong((id *)&self->_userModel, a3);
}

- (unsigned)randomNumberSeed
{
  return self->_randomNumberSeed;
}

- (ACTUserMentalCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (BOOL)isBackspacing
{
  return self->_isBackspacing;
}

- (void)setIsBackspacing:(BOOL)a3
{
  self->_isBackspacing = a3;
}

- (unint64_t)segmentCursorBeforeBackspacing
{
  return self->_segmentCursorBeforeBackspacing;
}

- (void)setSegmentCursorBeforeBackspacing:(unint64_t)a3
{
  self->_segmentCursorBeforeBackspacing = a3;
}

- (unint64_t)segmentEditHorizon
{
  return self->_segmentEditHorizon;
}

- (void)setSegmentEditHorizon:(unint64_t)a3
{
  self->_segmentEditHorizon = a3;
}

- (int64_t)lastCursorPositionForTransliteratedCandidate
{
  return self->_lastCursorPositionForTransliteratedCandidate;
}

- (void)setLastCursorPositionForTransliteratedCandidate:(int64_t)a3
{
  self->_lastCursorPositionForTransliteratedCandidate = a3;
}

- (BOOL)lastActionSuppressesError
{
  return self->_lastActionSuppressesError;
}

- (void)setLastActionSuppressesError:(BOOL)a3
{
  self->_lastActionSuppressesError = a3;
}

- (BOOL)lastActionUseSecondaryString
{
  return self->_lastActionUseSecondaryString;
}

- (void)setLastActionUseSecondaryString:(BOOL)a3
{
  self->_lastActionUseSecondaryString = a3;
}

- (TTKDefaultContinuousPathGenerator)pathGenerator
{
  return self->_pathGenerator;
}

- (void)setPathGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_pathGenerator, a3);
}

- (UserPathManager)userPathManager
{
  return self->_userPathManager;
}

- (void)setUserPathManager:(id)a3
{
  objc_storeStrong((id *)&self->_userPathManager, a3);
}

- (NSString)partialCandidateSuffix
{
  return self->_partialCandidateSuffix;
}

- (void)setPartialCandidateSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_partialCandidateSuffix, a3);
}

- (NSString)partialCandidateIntendedChunk
{
  return self->_partialCandidateIntendedChunk;
}

- (void)setPartialCandidateIntendedChunk:(id)a3
{
  objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, 0);
  objc_storeStrong((id *)&self->_partialCandidateSuffix, 0);
  objc_storeStrong((id *)&self->_userPathManager, 0);
  objc_storeStrong((id *)&self->_pathGenerator, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  _ACTUserActionStream *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_ACTUserActionStream initWithParameters:delegate:]([_ACTUserActionStream alloc], "initWithParameters:delegate:", v6, v5);

  return v7;
}

+ (_NSRange)segmentAnchorRangeForCursor:(id)a3 withDocumentBefore:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  _BOOL4 v19;
  unint64_t v20;
  BOOL v21;
  char v22;
  int v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  _NSRange result;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "segmentCursor");
  if (v7 < 0)
    goto LABEL_27;
  v8 = v7;
  while (2)
  {
    v9 = 0;
    v26 = v8;
    while (1)
    {
      objc_msgSend(v5, "externalSegments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subarrayWithRange:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", &stru_24FD49B78);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v6, "rangeOfString:options:", v12, 4);
      v15 = v14;
      v16 = objc_msgSend(v12, "length");
      v17 = !v8 || v16 >= 6;
      v18 = !v17;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (!v8)
        goto LABEL_16;
      v19 = 0;
LABEL_19:
      v17 = v8-- != 0;
      v22 = v17;
      v23 = v18 || v19;

      if (v23 == 1)
      {
        ++v9;
        if ((v22 & 1) != 0)
          continue;
      }
      goto LABEL_26;
    }
    v20 = objc_msgSend(v6, "length") - (v13 + v15);
    v21 = v20 >= 0x15;
    v19 = v20 < 0x15;
    if (v8 || !v21)
    {
LABEL_18:
      if (!v18 && v19)
      {

        goto LABEL_29;
      }
      goto LABEL_19;
    }
LABEL_16:
    if (!objc_msgSend(v12, "length"))
    {
      v19 = (unint64_t)objc_msgSend(v6, "length") < 0x15;
      goto LABEL_18;
    }

LABEL_26:
    v8 = v26 - 1;
    if (v26 > 0)
      continue;
    break;
  }
LABEL_27:
  v9 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:

  v24 = v8;
  v25 = v9;
  result.length = v25;
  result.location = v24;
  return result;
}

+ (BOOL)isPathableWord:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v3 = (void *)MEMORY[0x24BDD1690];
  v4 = a3;
  objc_msgSend(v3, "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCharactersInString:", CFSTR("'’׳״-"));
  objc_msgSend(v5, "removeCharactersInString:", CFSTR("œŒß"));
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");

  v8 = v7 >= 2 && objc_msgSend(v6, "length") == 0;
  return v8;
}

@end
