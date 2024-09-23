@implementation UIDictationSerializableResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationSerializableResults)init
{
  UIDictationSerializableResults *v2;
  UIDictationSerializableResults *v3;
  NSArray *phrases;
  NSArray *v5;
  NSArray *multilingualAlternatives;
  UIDictationSerializableResults *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDictationSerializableResults;
  v2 = -[UIDictationSerializableResults init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    phrases = v2->_phrases;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_phrases = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_fromKeyboard = 0;
    v3->_useServerCapitalization = 0;
    v3->_allowsAlternatives = 1;
    multilingualAlternatives = v3->_multilingualAlternatives;
    v3->_multilingualAlternatives = v5;
    v3->_transform = 0;

    v3->_showMultilingualAlternatives = 0;
    v7 = v3;
  }

  return v3;
}

- (UIDictationSerializableResults)initWithPhrases:(id)a3
{
  id v4;
  UIDictationSerializableResults *v5;
  uint64_t v6;
  NSArray *phrases;
  UIDictationSerializableResults *v8;

  v4 = a3;
  v5 = -[UIDictationSerializableResults init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (UIDictationSerializableResults)initWithDetectedPhrases:(id)a3 multilingualAlternatives:(id)a4
{
  id v6;
  id v7;
  UIDictationSerializableResults *v8;
  uint64_t v9;
  NSArray *phrases;
  uint64_t v11;
  NSArray *multilingualAlternatives;
  UIDictationSerializableResults *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[UIDictationSerializableResults init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    multilingualAlternatives = v8->_multilingualAlternatives;
    v8->_multilingualAlternatives = (NSArray *)v11;

    v8->_showMultilingualAlternatives = 1;
    v13 = v8;
  }

  return v8;
}

- (UIDictationSerializableResults)initWithArrayOfArrayOfStrings:(id)a3
{
  id v4;
  UIDictationSerializableResults *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSArray *phrases;
  UIDictationSerializableResults *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = -[UIDictationSerializableResults init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke;
    v15 = &unk_1E16D54B8;
    v16 = v4;
    v17 = v6;
    v7 = v6;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v12);
    v8 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

void __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  UIDictationInterpretation *v9;
  UIDictationInterpretation *v10;
  void *v11;
  UIDictationInterpretationGroup *v12;
  void *v13;
  UIDictationInterpretationGroup *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke_2;
  v18 = &unk_1E16D5490;
  v19 = v6;
  v22 = a3;
  v20 = *(id *)(a1 + 32);
  v21 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v15);
  v9 = [UIDictationInterpretation alloc];
  v10 = -[UIDictationInterpretation initWithTokens:score:](v9, "initWithTokens:score:", v8, 1.0, v15, v16, v17, v18);
  v11 = *(void **)(a1 + 40);
  v12 = [UIDictationInterpretationGroup alloc];
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIDictationInterpretationGroup initWithInterpretations:](v12, "initWithInterpretations:", v13);
  objc_msgSend(v11, "addObject:", v14);

}

void __64__UIDictationSerializableResults_initWithArrayOfArrayOfStrings___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  UIDictationScoredToken *v6;
  uint64_t v7;
  _BOOL8 v8;
  UIDictationScoredToken *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = [UIDictationScoredToken alloc];
  v7 = *(_QWORD *)(a1 + 56);
  v8 = v7 + 1 == objc_msgSend(*(id *)(a1 + 40), "count") && a3 + 1 == objc_msgSend(*(id *)(a1 + 48), "count");
  v9 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v6, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v10, (v7 | a3) == 0, v8, 1.0);
  objc_msgSend(v5, "addObject:", v9);

}

- (UIDictationSerializableResults)initWithCoder:(id)a3
{
  id v4;
  UIDictationSerializableResults *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *phrases;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *multilingualAlternatives;
  void *v16;
  __CFString *v17;
  UIDictationSerializableResults *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIDictationSerializableResults;
  v5 = -[UIDictationSerializableResults init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("phrases"));
    v9 = objc_claimAutoreleasedReturnValue();
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("multilingualAlternatives"));
    v14 = objc_claimAutoreleasedReturnValue();
    multilingualAlternatives = v5->_multilingualAlternatives;
    v5->_multilingualAlternatives = (NSArray *)v14;

    v5->_showMultilingualAlternatives = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showMultilingualAlternatives"));
    v5->_lowConfidenceAboutLanguageDetection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowConfidenceAboutLanguageDetection"));
    v5->_fromKeyboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromKeyboard"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transform"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)objc_msgSend(v16, "copy");
    v5->_transform = v17;

    v5->_useServerCapitalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useServerCapitalization"));
    v5->_allowsAlternatives = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsAlternatives"));
    v5->_isFinalResult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinalResult"));
    v5->_addTrailingSpace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("addTrailingSpace"));
    v18 = v5;

  }
  return v5;
}

- (void)dealloc
{
  __CFString *transform;
  objc_super v4;

  transform = self->_transform;
  if (transform)
  {
    CFRelease(transform);
    self->_transform = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIDictationSerializableResults;
  -[UIDictationSerializableResults dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_phrases, CFSTR("phrases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multilingualAlternatives, CFSTR("multilingualAlternatives"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showMultilingualAlternatives, CFSTR("showMultilingualAlternatives"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowConfidenceAboutLanguageDetection, CFSTR("lowConfidenceAboutLanguageDetection"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromKeyboard, CFSTR("fromKeyboard"));
  if (self->_transform)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->_transform);
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("transform"));

  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_useServerCapitalization, CFSTR("useServerCapitalization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsAlternatives, CFSTR("allowsAlternatives"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinalResult, CFSTR("isFinalResult"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_addTrailingSpace, CFSTR("addTrailingSpace"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIDictationSerializableResults *v4;
  void *v5;
  void *v6;
  __CFString *transform;
  CFStringRef Copy;
  void *v9;

  v4 = objc_alloc_init(UIDictationSerializableResults);
  v5 = (void *)-[NSArray copy](self->_phrases, "copy");
  -[UIDictationSerializableResults setPhrases:](v4, "setPhrases:", v5);

  v6 = (void *)-[NSArray copy](self->_multilingualAlternatives, "copy");
  -[UIDictationSerializableResults setMultilingualAlternatives:](v4, "setMultilingualAlternatives:", v6);

  -[UIDictationSerializableResults setShowMultilingualAlternatives:](v4, "setShowMultilingualAlternatives:", self->_showMultilingualAlternatives);
  -[UIDictationSerializableResults setLowConfidenceAboutLanguageDetection:](v4, "setLowConfidenceAboutLanguageDetection:", self->_lowConfidenceAboutLanguageDetection);
  -[UIDictationSerializableResults setFromKeyboard:](v4, "setFromKeyboard:", self->_fromKeyboard);
  transform = self->_transform;
  if (transform)
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], transform);
  else
    Copy = 0;
  -[UIDictationSerializableResults setTransform:](v4, "setTransform:", Copy);
  -[UIDictationSerializableResults setUseServerCapitalization:](v4, "setUseServerCapitalization:", self->_useServerCapitalization);
  -[UIDictationSerializableResults setAddTrailingSpace:](v4, "setAddTrailingSpace:", self->_addTrailingSpace);
  v9 = (void *)-[NSIndexPath copy](self->_indexPathOfInterpretations, "copy");
  -[UIDictationSerializableResults setIndexPathOfInterpretations:](v4, "setIndexPathOfInterpretations:", v9);

  -[UIDictationSerializableResults setIsFinalResult:](v4, "setIsFinalResult:", self->_isFinalResult);
  return v4;
}

- (void)setTransform:(__CFString *)a3
{
  __CFString *transform;

  transform = self->_transform;
  if (transform != a3)
  {
    if (transform)
      CFRelease(transform);
    self->_transform = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setIndexPathOfInterpretations:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *v6;
  uint64_t v7;
  NSIndexPath *indexPathOfInterpretations;
  void *v9;

  v5 = (NSIndexPath *)a3;
  v6 = v5;
  if (v5)
  {
    v7 = -[NSIndexPath length](v5, "length");
    if (v7 != -[NSArray count](self->_phrases, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDictationUtilities.m"), 1643, CFSTR("Incorrect number of interpretation indexes"));

    }
  }
  indexPathOfInterpretations = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = v6;

}

- (id)text
{
  void *v2;
  void *v3;

  -[UIDictationSerializableResults textArray](self, "textArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bestText
{
  void *v2;
  void *v3;

  -[UIDictationSerializableResults bestTextArray](self, "bestTextArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)secondBestText
{
  void *v2;
  void *v3;

  -[UIDictationSerializableResults secondBestTextArray](self, "secondBestTextArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)multilingualResultsByLanguageCode
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_multilingualAlternatives;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "dominantLanguage", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v9, v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)bestTextForMultilingualAlternatives
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSArray *obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_multilingualAlternatives;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "phrases");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationSerializableResults bestTextArrayForAlternatives:](self, "bestTextArrayForAlternatives:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "componentsJoinedByString:", &stru_1E16EDF20);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v10)
            v12 = (const __CFString *)v10;
          else
            v12 = &stru_1E16EDF20;
          v24[1] = CFSTR("language");
          v25[0] = v12;
          v24[0] = CFSTR("text");
          objc_msgSend(v7, "dominantLanguage");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = (const __CFString *)v13;
          else
            v15 = &stru_1E16EDF20;
          v25[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v16);

        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v4);
  }

  return v19;
}

- (id)textArray
{
  id v3;
  _BOOL8 fromKeyboard;
  _BOOL8 useServerCapitalization;
  NSUInteger v6;
  NSUInteger v7;
  int v8;
  uint64_t v9;
  NSIndexPath *indexPathOfInterpretations;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  fromKeyboard = self->_fromKeyboard;
  useServerCapitalization = self->_useServerCapitalization;
  v6 = -[NSArray count](self->_phrases, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v20 = useServerCapitalization || 2 * fromKeyboard;
    v19 = v20 | 4;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations)
        v11 = -[NSIndexPath indexAtPosition:](indexPathOfInterpretations, "indexAtPosition:", v9);
      else
        v11 = 0;
      -[NSArray objectAtIndex:](self->_phrases, "objectAtIndex:", v9, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "interpretations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v15 = v20;
      else
        v15 = v19;
      objc_msgSend(v14, "tokens");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v16, -[UIDictationSerializableResults transform](self, "transform"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && ((objc_msgSend(v14, "removeSpaceBefore") | v8) & 1) == 0)
        objc_msgSend(v3, "addObject:", CFSTR(" "));
      objc_msgSend(v3, "addObject:", v17);
      v8 = objc_msgSend(v14, "removeSpaceAfter");

      ++v9;
    }
    while (v7 != v9);
  }
  if (self->_addTrailingSpace)
    objc_msgSend(v3, "addObject:", CFSTR(" "));
  return v3;
}

- (id)textArrayForAlternatives:(id)a3
{
  id v4;
  id v5;
  _BOOL8 fromKeyboard;
  _BOOL8 useServerCapitalization;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  NSIndexPath *indexPathOfInterpretations;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  fromKeyboard = self->_fromKeyboard;
  useServerCapitalization = self->_useServerCapitalization;
  v22 = v4;
  v8 = objc_msgSend(v4, "count");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v21 = useServerCapitalization || 2 * fromKeyboard;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations)
        v13 = -[NSIndexPath indexAtPosition:](indexPathOfInterpretations, "indexAtPosition:", v11);
      else
        v13 = 0;
      objc_msgSend(v22, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "interpretations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v17 = v21;
      else
        v17 = v21 | 4;
      objc_msgSend(v16, "tokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v18, -[UIDictationSerializableResults transform](self, "transform"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && ((objc_msgSend(v16, "removeSpaceBefore") | v10) & 1) == 0)
        objc_msgSend(v5, "addObject:", CFSTR(" "));
      objc_msgSend(v5, "addObject:", v19);
      v10 = objc_msgSend(v16, "removeSpaceAfter");

      ++v11;
    }
    while (v9 != v11);
  }
  if (self->_addTrailingSpace)
    objc_msgSend(v5, "addObject:", CFSTR(" "));

  return v5;
}

- (id)bestTextArray
{
  NSIndexPath *v3;
  NSIndexPath *indexPathOfInterpretations;
  void *v5;
  NSIndexPath *v6;

  v3 = self->_indexPathOfInterpretations;
  indexPathOfInterpretations = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = 0;

  -[UIDictationSerializableResults textArray](self, "textArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_indexPathOfInterpretations;
  self->_indexPathOfInterpretations = v3;

  return v5;
}

- (id)secondBestTextArray
{
  id v3;
  _BOOL8 fromKeyboard;
  _BOOL8 useServerCapitalization;
  uint64_t v6;
  int v7;
  NSIndexPath *indexPathOfInterpretations;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v32;
  uint64_t v33;
  NSUInteger v34;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  fromKeyboard = self->_fromKeyboard;
  useServerCapitalization = self->_useServerCapitalization;
  v34 = -[NSArray count](self->_phrases, "count");
  if (v34)
  {
    v6 = 0;
    v32 = 0;
    v7 = 0;
    v33 = useServerCapitalization || 2 * fromKeyboard;
    do
    {
      indexPathOfInterpretations = self->_indexPathOfInterpretations;
      if (indexPathOfInterpretations)
        v9 = -[NSIndexPath indexAtPosition:](indexPathOfInterpretations, "indexAtPosition:", v6);
      else
        v9 = 0;
      -[NSArray objectAtIndex:](self->_phrases, "objectAtIndex:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "interpretations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 < 2)
        goto LABEL_12;
      v13 = 0;
      v14 = 0.0;
      v15 = 1;
      do
      {
        objc_msgSend(v10, "interpretations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "averageConfidenceScore");
        v19 = v18;

        if (v19 > v14)
        {
          objc_msgSend(v10, "interpretations");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndex:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "averageConfidenceScore");
          v14 = v22;

          objc_msgSend(v10, "interpretations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndex:", v15);
          v24 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v24;
        }
        ++v15;
        objc_msgSend(v10, "interpretations");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

      }
      while (v15 < v26);
      v32 = 1;
      if (!v13)
      {
LABEL_12:
        objc_msgSend(v10, "interpretations");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndex:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v6)
        v28 = v33;
      else
        v28 = v33 | 4;
      objc_msgSend(v13, "tokens");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v29, -[UIDictationSerializableResults transform](self, "transform"), v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && ((objc_msgSend(v13, "removeSpaceBefore") | v7) & 1) == 0)
        objc_msgSend(v3, "addObject:", CFSTR(" "));
      objc_msgSend(v3, "addObject:", v30);
      v7 = objc_msgSend(v13, "removeSpaceAfter");

      ++v6;
    }
    while (v6 != v34);
  }
  else
  {
    v32 = 0;
  }
  if (self->_addTrailingSpace)
    objc_msgSend(v3, "addObject:", CFSTR(" "));
  if ((v32 & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (id)bestTextArrayForAlternatives:(id)a3
{
  id v4;
  NSIndexPath *v5;
  NSIndexPath *indexPathOfInterpretations;
  void *v7;
  NSIndexPath *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = self->_indexPathOfInterpretations;
    indexPathOfInterpretations = self->_indexPathOfInterpretations;
    self->_indexPathOfInterpretations = 0;

    -[UIDictationSerializableResults textArrayForAlternatives:](self, "textArrayForAlternatives:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_indexPathOfInterpretations;
    self->_indexPathOfInterpretations = v5;

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)dictationPhraseArray
{
  void *v3;
  uint64_t v4;
  NSArray *phrases;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_useServerCapitalization | (2 * self->_fromKeyboard);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  phrases = self->_phrases;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke;
  v10[3] = &unk_1E16D5530;
  v14 = v4;
  v10[4] = self;
  v12 = v17;
  v6 = v3;
  v11 = v6;
  v13 = v15;
  -[NSArray enumerateObjectsUsingBlock:](phrases, "enumerateObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  return v8;
}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, uint64_t);
  void *v30;
  id v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[4];
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;

  v5 = a2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v6)
    v7 = objc_msgSend(v6, "indexAtPosition:", a3);
  else
    v7 = 0;
  objc_msgSend(v5, "interpretations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v58 = objc_msgSend(v9, "removeSpaceBefore");
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v54 = objc_msgSend(v9, "removeSpaceBefore");
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v50 = objc_msgSend(v9, "removeSpaceAfter");
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v46 = objc_msgSend(v9, "removeSpaceAfter");
  if (a3)
    v10 = *(_QWORD *)(a1 + 64);
  else
    v10 = *(_QWORD *)(a1 + 64) | 4;
  objc_msgSend(v9, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v11, objc_msgSend(*(id *)(a1 + 32), "transform"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "interpretations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {

    goto LABEL_11;
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "allowsAlternatives");

  if (!v14)
  {
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interpretations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_2;
  v35[3] = &unk_1E16D54E0;
  v38 = &v51;
  v39 = &v47;
  v40 = &v43;
  v41 = v7;
  v17 = *(_QWORD *)(a1 + 32);
  v37 = &v55;
  v35[4] = v17;
  v42 = v10;
  v18 = v15;
  v36 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v35);

LABEL_12:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) || *((_BYTE *)v56 + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && *((_BYTE *)v56 + 24) && !*((_BYTE *)v52 + 24))
    {
      if ((objc_msgSend(v9, "removeSpaceBefore") & 1) == 0)
      {
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v12);
        v23 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v23;
      }
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v34[3] = 0;
      objc_msgSend(v5, "interpretations");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_3;
      v30 = &unk_1E16D5508;
      v33 = v7;
      v31 = v18;
      v32 = v34;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", &v27);

      _Block_object_dispose(v34, 8);
    }
  }
  else if (a3)
  {
    v25 = *(void **)(a1 + 40);
    +[UIDictationPhrase phraseWithText:alternativeInterpretations:style:](UIDictationPhrase, "phraseWithText:alternativeInterpretations:style:", CFSTR(" "), 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance", v27, v28, v29, v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputModeOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldSupressShowingAlternativesAutomatically");

  +[UIDictationPhrase phraseWithText:alternativeInterpretations:style:](UIDictationPhrase, "phraseWithText:alternativeInterpretations:style:", v12, v18, objc_msgSend(v5, "isLowConfidence") & (v21 ^ 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *((_BYTE *)v48 + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *((_BYTE *)v44 + 24);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;

  if (*(_QWORD *)(a1 + 80) != a3)
  {
    v4 = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(v4, "removeSpaceBefore");
    v5 = objc_msgSend(v4, "removeSpaceBefore");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v6 + 24))
      v7 = v5;
    else
      v7 = 0;
    *(_BYTE *)(v6 + 24) = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= objc_msgSend(v4, "removeSpaceAfter");
    v8 = objc_msgSend(v4, "removeSpaceAfter");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (*(_BYTE *)(v9 + 24))
      v10 = v8;
    else
      v10 = 0;
    *(_BYTE *)(v9 + 24) = v10;
    objc_msgSend(v4, "tokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v11, objc_msgSend(*(id *)(a1 + 32), "transform"), *(_QWORD *)(a1 + 88));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
}

void __54__UIDictationSerializableResults_dictationPhraseArray__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 48) != a3)
  {
    if ((objc_msgSend(a2, "removeSpaceBefore") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);
      objc_msgSend(CFSTR(" "), "stringByAppendingString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
}

- (id)bestResults
{
  id v3;
  NSArray *phrases;
  id v5;
  UIDictationSerializableResults *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  phrases = self->_phrases;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__UIDictationSerializableResults_bestResults__block_invoke;
  v8[3] = &unk_1E16D5558;
  v9 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](phrases, "enumerateObjectsUsingBlock:", v8);
  v6 = -[UIDictationSerializableResults initWithPhrases:]([UIDictationSerializableResults alloc], "initWithPhrases:", v5);
  -[UIDictationSerializableResults setFromKeyboard:](v6, "setFromKeyboard:", self->_fromKeyboard);
  -[UIDictationSerializableResults setTransform:](v6, "setTransform:", self->_transform);
  -[UIDictationSerializableResults setUseServerCapitalization:](v6, "setUseServerCapitalization:", self->_useServerCapitalization);

  return v6;
}

void __45__UIDictationSerializableResults_bestResults__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  UIDictationInterpretationGroup *v4;
  void *v5;
  void *v6;
  UIDictationInterpretationGroup *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [UIDictationInterpretationGroup alloc];
  objc_msgSend(v3, "bestInterpretation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIDictationInterpretationGroup initWithInterpretations:](v4, "initWithInterpretations:", v6);
  objc_msgSend(v2, "addObject:", v7);

}

- (id)singleLineResult
{
  UIDictationSerializableResults *v2;
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  NSIndexPath *indexPathOfInterpretations;
  uint64_t v8;
  UIDictationInterpretationGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIDictationInterpretationGroup *v20;
  UIDictationInterpretationGroup *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UIDictationScoredToken *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIDictationScoredToken *v32;
  UIDictationInterpretation *v33;
  void *v34;
  UIDictationInterpretation *v35;
  UIDictationInterpretationGroup *v36;
  void *v37;
  uint64_t j;
  void *v39;
  UIDictationScoredToken *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIDictationScoredToken *v44;
  UIDictationInterpretation *v45;
  void *v46;
  UIDictationInterpretation *v47;
  UIDictationInterpretationGroup *v48;
  void *v49;
  UIDictationInterpretationGroup *v50;
  UIDictationSerializableResults *v51;
  UIDictationSerializableResults *v53;
  NSUInteger v54;
  UIDictationSerializableResults *v55;
  void *v56;
  UIDictationInterpretation *v57;
  UIDictationScoredToken *v58;
  UIDictationInterpretation *v59;
  _QWORD v60[2];

  v2 = self;
  v60[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_phrases, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v54 = v3;
    v55 = v2;
    while (1)
    {
      indexPathOfInterpretations = v2->_indexPathOfInterpretations;
      v8 = indexPathOfInterpretations
         ? -[NSIndexPath indexAtPosition:](indexPathOfInterpretations, "indexAtPosition:", v6)
         : 0;
      -[NSArray objectAtIndex:](v2->_phrases, "objectAtIndex:", v6);
      v9 = (UIDictationInterpretationGroup *)objc_claimAutoreleasedReturnValue();
      -[UIDictationInterpretationGroup interpretations](v9, "interpretations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
        break;
      v20 = 0;
      if (v5)
      {
LABEL_13:
        if (v20)
          v21 = v20;
        else
          v21 = v9;
        objc_msgSend(v5, "addObject:", v21);

        if (++v6 == v4)
        {
          v51 = -[UIDictationSerializableResults initWithPhrases:]([UIDictationSerializableResults alloc], "initWithPhrases:", v5);
          -[UIDictationSerializableResults setFromKeyboard:](v51, "setFromKeyboard:", v2->_fromKeyboard);
          -[UIDictationSerializableResults setTransform:](v51, "setTransform:", v2->_transform);
          -[UIDictationSerializableResults setUseServerCapitalization:](v51, "setUseServerCapitalization:", v2->_useServerCapitalization);

          return v51;
        }
      }
      else
      {
LABEL_33:

        if (++v6 == v4)
          return v2;
      }
    }
    v56 = v5;
    v14 = 0;
    while (1)
    {
      -[UIDictationInterpretationGroup bestInterpretation](v9, "bestInterpretation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tokens");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "rangeOfString:", CFSTR("\n"));

      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        break;

      if (v13 == ++v14)
      {
        v20 = 0;
        v5 = v56;
        if (v56)
          goto LABEL_13;
        goto LABEL_33;
      }
    }
    if (v14)
    {
      if (!v56)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          for (i = 0; i != v6; ++i)
          {
            -[NSArray objectAtIndex:](v55->_phrases, "objectAtIndex:", i);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addObject:", v23);

          }
        }
      }
      -[UIDictationInterpretationGroup bestInterpretation](v9, "bestInterpretation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "tokens");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "subarrayWithRange:", 0, v14 - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      v28 = [UIDictationScoredToken alloc];
      objc_msgSend(v17, "text");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "substringToIndex:", v19);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v17, "removeSpaceBefore");
      objc_msgSend(v17, "confidenceScore");
      v32 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v28, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v30, v31, 1);

      objc_msgSend(v27, "addObject:", v32);
      v33 = [UIDictationInterpretation alloc];
      v58 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "confidenceScore");
      v35 = -[UIDictationInterpretation initWithTokens:score:](v33, "initWithTokens:score:", v34);

      v36 = [UIDictationInterpretationGroup alloc];
      v57 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[UIDictationInterpretationGroup initWithInterpretations:](v36, "initWithInterpretations:", v37);

      v5 = v56;
    }
    else
    {
      if (!v56)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          for (j = 0; j != v6; ++j)
          {
            -[NSArray objectAtIndex:](v55->_phrases, "objectAtIndex:", j);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addObject:", v39);

          }
        }
      }
      if (v19)
      {
        v40 = [UIDictationScoredToken alloc];
        objc_msgSend(v17, "text");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "substringToIndex:", v19);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v17, "removeSpaceBefore");
        objc_msgSend(v17, "confidenceScore");
        v44 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v40, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v42, v43, 1);

        v45 = [UIDictationInterpretation alloc];
        v60[0] = v44;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "confidenceScore");
        v47 = -[UIDictationInterpretation initWithTokens:score:](v45, "initWithTokens:score:", v46);

        v48 = [UIDictationInterpretationGroup alloc];
        v59 = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[UIDictationInterpretationGroup initWithInterpretations:](v48, "initWithInterpretations:", v49);

        objc_msgSend(v56, "addObject:", v50);
      }
      v53 = -[UIDictationSerializableResults initWithPhrases:]([UIDictationSerializableResults alloc], "initWithPhrases:", v56);
      v20 = 0;
      v5 = v56;
    }

    if (!v14)
    {

      return v53;
    }
    v4 = v54;
    v2 = v55;
    if (v5)
      goto LABEL_13;
    goto LABEL_33;
  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationSerializableResults bestText](self, "bestText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ best=\"%@\">"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)multilingualAlternatives
{
  return self->_multilingualAlternatives;
}

- (void)setMultilingualAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)fromKeyboard
{
  return self->_fromKeyboard;
}

- (void)setFromKeyboard:(BOOL)a3
{
  self->_fromKeyboard = a3;
}

- (BOOL)showMultilingualAlternatives
{
  return self->_showMultilingualAlternatives;
}

- (void)setShowMultilingualAlternatives:(BOOL)a3
{
  self->_showMultilingualAlternatives = a3;
}

- (BOOL)lowConfidenceAboutLanguageDetection
{
  return self->_lowConfidenceAboutLanguageDetection;
}

- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3
{
  self->_lowConfidenceAboutLanguageDetection = a3;
}

- (__CFString)transform
{
  return self->_transform;
}

- (BOOL)useServerCapitalization
{
  return self->_useServerCapitalization;
}

- (void)setUseServerCapitalization:(BOOL)a3
{
  self->_useServerCapitalization = a3;
}

- (BOOL)addTrailingSpace
{
  return self->_addTrailingSpace;
}

- (void)setAddTrailingSpace:(BOOL)a3
{
  self->_addTrailingSpace = a3;
}

- (NSIndexPath)indexPathOfInterpretations
{
  return self->_indexPathOfInterpretations;
}

- (BOOL)allowsAlternatives
{
  return self->_allowsAlternatives;
}

- (BOOL)isFinalResult
{
  return self->_isFinalResult;
}

- (void)setIsFinalResult:(BOOL)a3
{
  self->_isFinalResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfInterpretations, 0);
  objc_storeStrong((id *)&self->_multilingualAlternatives, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end
