@implementation TIWordEntry

- (id)documentContextBeforeInput
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[TIUserAction documentState](self, "documentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextBeforeInput");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_1EA1081D0;
  return v4;
}

- (id)trimmedDocumentContextBeforeInput
{
  void *v2;
  void *v3;
  void *v4;

  -[TIWordEntry documentContextBeforeInput](self, "documentContextBeforeInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TIWordEntry)init
{
  TIWordEntry *v2;
  uint64_t v3;
  NSMutableArray *allKeyboardInputsM;
  uint64_t v5;
  NSMutableArray *allTouchesM;
  uint64_t v7;
  NSMutableArray *candidatesOfferedM;
  uint64_t v9;
  NSMutableArray *touchLayoutsM;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TIWordEntry;
  v2 = -[TIUserAction initWithTIKeyboardState:](&v12, sel_initWithTIKeyboardState_, 0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    allKeyboardInputsM = v2->_allKeyboardInputsM;
    v2->_allKeyboardInputsM = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    allTouchesM = v2->_allTouchesM;
    v2->_allTouchesM = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    candidatesOfferedM = v2->_candidatesOfferedM;
    v2->_candidatesOfferedM = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    touchLayoutsM = v2->_touchLayoutsM;
    v2->_touchLayoutsM = (NSMutableArray *)v9;

    v2->_unfinishedWordEntryTreatment = 0;
    v2->_origin = 0;
    -[TIUserAction setActionType:](v2, "setActionType:", 0);
  }
  return v2;
}

- (TIWordEntry)initWithCoder:(id)a3
{
  id v4;
  TIWordEntry *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *allKeyboardInputsM;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *allTouchesM;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *touchLayoutsM;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSMutableArray *candidatesOfferedM;
  uint64_t v26;
  NSString *acceptedString;
  uint64_t v28;
  TIKeyboardCandidate *acceptedCandidate;
  uint64_t v30;
  NSString *originalAcceptedString;
  uint64_t v32;
  TIKeyboardCandidate *originalCandidate;
  uint64_t v34;
  NSString *orientation;
  uint64_t v36;
  NSString *inputStem;
  uint64_t v38;
  NSString *inputContext;
  uint64_t v40;
  TIKeyboardInput *inputTriggeredTextAccepted;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)TIWordEntry;
  v5 = -[TIUserAction initWithCoder:](&v43, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("allKeyboardInputsM"));
    v9 = objc_claimAutoreleasedReturnValue();
    allKeyboardInputsM = v5->_allKeyboardInputsM;
    v5->_allKeyboardInputsM = (NSMutableArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("allTouchesM"));
    v14 = objc_claimAutoreleasedReturnValue();
    allTouchesM = v5->_allTouchesM;
    v5->_allTouchesM = (NSMutableArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("touchLayoutsM"));
    v19 = objc_claimAutoreleasedReturnValue();
    touchLayoutsM = v5->_touchLayoutsM;
    v5->_touchLayoutsM = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("candidatesOffered"));
    v24 = objc_claimAutoreleasedReturnValue();
    candidatesOfferedM = v5->_candidatesOfferedM;
    v5->_candidatesOfferedM = (NSMutableArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptedString"));
    v26 = objc_claimAutoreleasedReturnValue();
    acceptedString = v5->_acceptedString;
    v5->_acceptedString = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptedCandidate"));
    v28 = objc_claimAutoreleasedReturnValue();
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalAcceptedString"));
    v30 = objc_claimAutoreleasedReturnValue();
    originalAcceptedString = v5->_originalAcceptedString;
    v5->_originalAcceptedString = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalCandidate"));
    v32 = objc_claimAutoreleasedReturnValue();
    originalCandidate = v5->_originalCandidate;
    v5->_originalCandidate = (TIKeyboardCandidate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orientation"));
    v34 = objc_claimAutoreleasedReturnValue();
    orientation = v5->_orientation;
    v5->_orientation = (NSString *)v34;

    v5->_wordEntryType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("wordEntryType"));
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
    v5->_cancelled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelled"));
    v5->_includesCursorEdits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includesCursorEdits"));
    v5->_includesOrientationChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includesOrientationChange"));
    v5->_extendsPriorWord = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extendsPriorWord"));
    v5->_isRetrocorrection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRetrocorrection"));
    v5->_isMultilingual = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMultilingual"));
    v5->_isOOV = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOOV"));
    v5->_isContinuousPathCompletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContinuousPathCompletion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputStem"));
    v36 = objc_claimAutoreleasedReturnValue();
    inputStem = v5->_inputStem;
    v5->_inputStem = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputContext"));
    v38 = objc_claimAutoreleasedReturnValue();
    inputContext = v5->_inputContext;
    v5->_inputContext = (NSString *)v38;

    v5->_layoutID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutID"));
    v5->_candidateIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("candidateIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputTriggeredTextAccepted"));
    v40 = objc_claimAutoreleasedReturnValue();
    inputTriggeredTextAccepted = v5->_inputTriggeredTextAccepted;
    v5->_inputTriggeredTextAccepted = (TIKeyboardInput *)v40;

    v5->_isPunctuationEntryFollowingAWord = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPunctuationEntryFollowingAWord"));
    v5->_unfinishedWordEntryTreatment = objc_msgSend(v4, "decodeIntForKey:", CFSTR("unfinishedWordEntryTreatment"));
    v5->_originalWordInAlignment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("originalWordInAlignment"));
    v5->_origin = objc_msgSend(v4, "decodeIntForKey:", CFSTR("origin"));
    -[TIUserAction setActionType:](v5, "setActionType:", 0);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIWordEntry;
  v4 = a3;
  -[TIUserAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allKeyboardInputsM, CFSTR("allKeyboardInputsM"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allTouchesM, CFSTR("allTouchesM"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchLayoutsM, CFSTR("touchLayoutsM"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidatesOfferedM, CFSTR("candidatesOfferedM"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_acceptedString, CFSTR("acceptedString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_acceptedCandidate, CFSTR("acceptedCandidate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalAcceptedString, CFSTR("originalAcceptedString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalCandidate, CFSTR("originalCandidate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_orientation, CFSTR("orientation"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_wordEntryType, CFSTR("wordEntryType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_cancelled, CFSTR("cancelled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesCursorEdits, CFSTR("includesCursorEdits"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesOrientationChange, CFSTR("includesOrientationChange"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_extendsPriorWord, CFSTR("extendsPriorWord"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRetrocorrection, CFSTR("isRetrocorrection"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isMultilingual, CFSTR("isMultilingual"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isContinuousPathCompletion, CFSTR("isContinuousPathCompletion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputStem, CFSTR("inputStem"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputContext, CFSTR("inputContext"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_layoutID, CFSTR("layoutID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_candidateIndex, CFSTR("candidateIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputTriggeredTextAccepted, CFSTR("inputTriggeredTextAccepted"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isPunctuationEntryFollowingAWord, CFSTR("isPunctuationEntryFollowingAWord"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_unfinishedWordEntryTreatment, CFSTR("unfinishedWordEntryTreatment"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_originalWordInAlignment, CFSTR("originalWordInAlignment"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_origin, CFSTR("origin"));

}

- (NSMutableArray)allEdits
{
  NSMutableArray *allEdits;
  NSMutableArray *v4;
  NSMutableArray *v5;

  allEdits = self->_allEdits;
  if (!allEdits)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allEdits;
    self->_allEdits = v4;

    allEdits = self->_allEdits;
  }
  return allEdits;
}

- (TIWordEntry)editedEntry
{
  void *v2;
  void *v3;

  -[TIWordEntry allEdits](self, "allEdits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIWordEntry *)v3;
}

- (id)description
{
  void *v3;
  __CFString *v4;

  -[TIWordEntry acceptedString](self, "acceptedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIWordEntry acceptedString](self, "acceptedString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EA1081D0;
  }
  return v4;
}

- (id)descriptionWithContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TIUserAction documentState](self, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordEntry acceptedString](self, "acceptedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addKeyInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIWordEntry allKeyboardInputsM](self, "allKeyboardInputsM");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)clearKeyInputs
{
  id v2;

  -[TIWordEntry allKeyboardInputsM](self, "allKeyboardInputsM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)addCandidateOffered:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TIWordEntry candidatesOfferedM](self, "candidatesOfferedM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TIWordEntry candidatesOfferedM](self, "candidatesOfferedM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)clearCandidatesOffered
{
  id v2;

  -[TIWordEntry candidatesOfferedM](self, "candidatesOfferedM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)addTouchEvent:(id)a3 withLayoutId:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[TIWordEntry allTouchesM](self, "allTouchesM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[TIWordEntry touchLayoutsM](self, "touchLayoutsM");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

}

- (void)clearTouches
{
  void *v3;
  id v4;

  -[TIWordEntry allTouchesM](self, "allTouchesM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIWordEntry touchLayoutsM](self, "touchLayoutsM");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSArray)allKeyboardInputs
{
  void *v2;
  void *v3;

  -[TIWordEntry allKeyboardInputsM](self, "allKeyboardInputsM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)allTouches
{
  void *v2;
  void *v3;

  -[TIWordEntry allTouchesM](self, "allTouchesM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)candidatesOffered
{
  void *v2;
  void *v3;

  -[TIWordEntry candidatesOfferedM](self, "candidatesOfferedM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)touchLayouts
{
  void *v2;
  void *v3;

  -[TIWordEntry touchLayoutsM](self, "touchLayoutsM");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)startsWithNewLine
{
  int v2;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  unint64_t v20;
  char v21;

  -[TIWordEntry acceptedString](self, "acceptedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
LABEL_12:
    v21 = 0;
    return v21 & v2;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      break;
LABEL_11:

    ++v7;
    -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 <= v7)
      goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x1E0CB3500];
  objc_msgSend(v11, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "characterSetWithCharactersInString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v16, "isSupersetOfSet:", v15);

  if (v2)
  {
    if ((v9 & 1) == 0)
      goto LABEL_14;
    v9 = 1;
    v8 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSupersetOfSet:", v15);

  if (v8 & 1 | ((v18 & 1) == 0))
  {
    v9 |= v18;
LABEL_10:

    goto LABEL_11;
  }
LABEL_14:

  v21 = 1;
  return v21 & v2;
}

- (BOOL)endsWithNewLine
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;

  -[TIWordEntry acceptedString](self, "acceptedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v6 = (v5 - 1);
    if (v5 - 1 >= 0)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3500];
          objc_msgSend(v10, "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "characterSetWithCharactersInString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isSupersetOfSet:", v14);

          if (v16)
          {
            if ((v8 & 1) == 0)
              goto LABEL_15;
            v8 = 1;
            v7 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isSupersetOfSet:", v14);

            if (!(v7 & 1 | ((v18 & 1) == 0)))
            {
LABEL_15:

              return v16;
            }
            v8 |= v18;
          }

        }
      }
      while (v6-- > 0);
    }
  }
  LOBYTE(v16) = 0;
  return v16;
}

- (BOOL)isPeriodFromDoubleSpaceEntry
{
  void *v3;
  void *v4;
  char v5;

  -[TIKeyboardCandidate candidate](self->_acceptedCandidate, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR(".")))
  {
    -[TIKeyboardCandidate input](self->_acceptedCandidate, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR(" "));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addUserEdit:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[TIWordEntry origin](self, "origin") == 1)
  {
    -[TIWordEntry allEdits](self, "allEdits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[TIWordEntry acceptedString](self, "acceptedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "acceptedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
        v9 = 2;
      else
        v9 = 3;
      objc_msgSend(v11, "setOrigin:", v9);
    }
  }
  -[TIWordEntry allEdits](self, "allEdits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)setEditActionType:(int)a3
{
  if (a3)
    self->_editActionType = a3;
}

- (BOOL)candidateContainsEmoji
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TIWordEntry allKeyboardInputsM](self, "allKeyboardInputsM", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "string");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_containsEmoji");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)resolveBackspacesInKeyboardInputs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TIWordEntry allKeyboardInputs](self, "allKeyboardInputs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(v3, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && objc_msgSend(v9, "isBackspace") && (objc_msgSend(v10, "isBackspace") & 1) == 0)
          objc_msgSend(v3, "removeLastObject");
        else
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v11;
    }
    while (v11);
  }

  return v3;
}

- (void)trimLeadingAndTrailingCharacters:(id)a3 fromResolvedInputs:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v5 = a4;
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      if ((objc_msgSend(v7, "isBackspace") & 1) != 0)
        break;
      objc_msgSend(v7, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
        break;
      objc_msgSend(v5, "removeObject:", v7);
      objc_msgSend(v5, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    while (v11);

  }
  objc_msgSend(v5, "lastObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      if ((objc_msgSend(v13, "isBackspace") & 1) != 0)
        break;
      objc_msgSend(v13, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
        break;
      objc_msgSend(v5, "removeObject:", v13);
      objc_msgSend(v5, "lastObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    while (v17);

  }
}

- (int)leadingBackspaceCountFromResolvedKeyboardInputs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      v9 = v6 + v5;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "isBackspace", (_QWORD)v11))
        {
          v9 = v6 + v8;
          goto LABEL_12;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (id)textFromResolvedKeyboardInputs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isBackspace", (_QWORD)v16) & 1) == 0)
        {
          -[TIWordEntry inputTriggeredTextAccepted](self, "inputTriggeredTextAccepted");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v12)
          {
            objc_msgSend(v11, "string");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "appendString:", v13);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (BOOL)wasRevised
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TIWordEntry allEdits](self, "allEdits", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "acceptedString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIWordEntry acceptedString](self, "acceptedString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (!v10)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)acceptedString
{
  return self->_acceptedString;
}

- (void)setAcceptedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)originalAcceptedString
{
  return self->_originalAcceptedString;
}

- (void)setOriginalAcceptedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)wordEntryType
{
  return self->_wordEntryType;
}

- (void)setWordEntryType:(int)a3
{
  self->_wordEntryType = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)extendsPriorWord
{
  return self->_extendsPriorWord;
}

- (void)setExtendsPriorWord:(BOOL)a3
{
  self->_extendsPriorWord = a3;
}

- (BOOL)includesCursorEdits
{
  return self->_includesCursorEdits;
}

- (void)setIncludesCursorEdits:(BOOL)a3
{
  self->_includesCursorEdits = a3;
}

- (BOOL)includesOrientationChange
{
  return self->_includesOrientationChange;
}

- (void)setIncludesOrientationChange:(BOOL)a3
{
  self->_includesOrientationChange = a3;
}

- (BOOL)isRetrocorrection
{
  return self->_isRetrocorrection;
}

- (void)setIsRetrocorrection:(BOOL)a3
{
  self->_isRetrocorrection = a3;
}

- (BOOL)isMultilingual
{
  return self->_isMultilingual;
}

- (void)setIsMultilingual:(BOOL)a3
{
  self->_isMultilingual = a3;
}

- (BOOL)isOOV
{
  return self->_isOOV;
}

- (void)setIsOOV:(BOOL)a3
{
  self->_isOOV = a3;
}

- (BOOL)isFromStaticLexicon
{
  return self->_isFromStaticLexicon;
}

- (void)setIsFromStaticLexicon:(BOOL)a3
{
  self->_isFromStaticLexicon = a3;
}

- (BOOL)isContinuousPathCompletion
{
  return self->_isContinuousPathCompletion;
}

- (void)setIsContinuousPathCompletion:(BOOL)a3
{
  self->_isContinuousPathCompletion = a3;
}

- (TIKeyboardInput)inputTriggeredTextAccepted
{
  return self->_inputTriggeredTextAccepted;
}

- (void)setInputTriggeredTextAccepted:(id)a3
{
  objc_storeStrong((id *)&self->_inputTriggeredTextAccepted, a3);
}

- (int)wordAlignmentConf
{
  return self->_wordAlignmentConf;
}

- (void)setWordAlignmentConf:(int)a3
{
  self->_wordAlignmentConf = a3;
}

- (int)touchAlignmentConf
{
  return self->_touchAlignmentConf;
}

- (void)setTouchAlignmentConf:(int)a3
{
  self->_touchAlignmentConf = a3;
}

- (int64_t)layoutID
{
  return self->_layoutID;
}

- (void)setLayoutID:(int64_t)a3
{
  self->_layoutID = a3;
}

- (NSMutableArray)allKeyboardInputsM
{
  return self->_allKeyboardInputsM;
}

- (void)setAllKeyboardInputsM:(id)a3
{
  objc_storeStrong((id *)&self->_allKeyboardInputsM, a3);
}

- (NSMutableArray)allTouchesM
{
  return self->_allTouchesM;
}

- (void)setAllTouchesM:(id)a3
{
  objc_storeStrong((id *)&self->_allTouchesM, a3);
}

- (NSMutableArray)candidatesOfferedM
{
  return self->_candidatesOfferedM;
}

- (void)setCandidatesOfferedM:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesOfferedM, a3);
}

- (NSMutableArray)touchLayoutsM
{
  return self->_touchLayoutsM;
}

- (void)setTouchLayoutsM:(id)a3
{
  objc_storeStrong((id *)&self->_touchLayoutsM, a3);
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setAcceptedCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedCandidate, a3);
}

- (TIKeyboardCandidate)originalCandidate
{
  return self->_originalCandidate;
}

- (void)setOriginalCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_originalCandidate, a3);
}

- (NSString)inputStem
{
  return self->_inputStem;
}

- (void)setInputStem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)inputContext
{
  return self->_inputContext;
}

- (void)setInputContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)followsContinuousPath
{
  return self->_followsContinuousPath;
}

- (void)setFollowsContinuousPath:(BOOL)a3
{
  self->_followsContinuousPath = a3;
}

- (int)unfinishedWordEntryTreatment
{
  return self->_unfinishedWordEntryTreatment;
}

- (void)setUnfinishedWordEntryTreatment:(int)a3
{
  self->_unfinishedWordEntryTreatment = a3;
}

- (int)editActionType
{
  return self->_editActionType;
}

- (BOOL)editActionExtendsPriorWord
{
  return self->_editActionExtendsPriorWord;
}

- (void)setEditActionExtendsPriorWord:(BOOL)a3
{
  self->_editActionExtendsPriorWord = a3;
}

- (void)setAllEdits:(id)a3
{
  objc_storeStrong((id *)&self->_allEdits, a3);
}

- (unint64_t)sessionIndex
{
  return self->_sessionIndex;
}

- (void)setSessionIndex:(unint64_t)a3
{
  self->_sessionIndex = a3;
}

- (unint64_t)alignmentConflicts
{
  return self->_alignmentConflicts;
}

- (void)setAlignmentConflicts:(unint64_t)a3
{
  self->_alignmentConflicts = a3;
}

- (int64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (void)setCandidateIndex:(int64_t)a3
{
  self->_candidateIndex = a3;
}

- (BOOL)isPunctuationEntryFollowingAWord
{
  return self->_isPunctuationEntryFollowingAWord;
}

- (void)setIsPunctuationEntryFollowingAWord:(BOOL)a3
{
  self->_isPunctuationEntryFollowingAWord = a3;
}

- (BOOL)originalWordInAlignment
{
  return self->_originalWordInAlignment;
}

- (void)setOriginalWordInAlignment:(BOOL)a3
{
  self->_originalWordInAlignment = a3;
}

- (int)origin
{
  return self->_origin;
}

- (void)setOrigin:(int)a3
{
  self->_origin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEdits, 0);
  objc_storeStrong((id *)&self->_inputContext, 0);
  objc_storeStrong((id *)&self->_inputStem, 0);
  objc_storeStrong((id *)&self->_originalCandidate, 0);
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
  objc_storeStrong((id *)&self->_touchLayoutsM, 0);
  objc_storeStrong((id *)&self->_candidatesOfferedM, 0);
  objc_storeStrong((id *)&self->_allTouchesM, 0);
  objc_storeStrong((id *)&self->_allKeyboardInputsM, 0);
  objc_storeStrong((id *)&self->_inputTriggeredTextAccepted, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
  objc_storeStrong((id *)&self->_originalAcceptedString, 0);
  objc_storeStrong((id *)&self->_acceptedString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
