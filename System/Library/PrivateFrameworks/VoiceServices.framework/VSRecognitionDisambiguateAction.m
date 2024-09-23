@implementation VSRecognitionDisambiguateAction

- (void)dealloc
{
  void *context;
  objc_super v4;

  context = self->_context;
  if (context)
    CFRelease(context);
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionDisambiguateAction;
  -[VSRecognitionRecognizeAction dealloc](&v4, sel_dealloc);
}

- (int)completionType
{
  return 2;
}

- (void)setRepeatedSpokenFeedbackString:(id)a3
{
  NSString *repeatedSpokenFeedbackString;

  repeatedSpokenFeedbackString = self->_repeatedSpokenFeedbackString;
  if (repeatedSpokenFeedbackString != a3)
  {

    self->_repeatedSpokenFeedbackString = (NSString *)a3;
  }
}

- (id)repeatedSpokenFeedbackString
{
  return self->_repeatedSpokenFeedbackString;
}

- (id)sequenceTag
{
  return self->_sequenceTag;
}

- (void)setSequenceTag:(id)a3
{
  NSString *sequenceTag;

  sequenceTag = self->_sequenceTag;
  if (sequenceTag != a3)
  {

    self->_sequenceTag = (NSString *)a3;
  }
}

- (id)knownValueForClassIdentifier:(id)a3
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_knownValues, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v3, "lastObject");
  else
    return v3;
}

- (void)setKnownValue:(id)a3 phoneticValue:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9;
  NSMutableDictionary *knownValues;
  uint64_t v11;
  NSMutableDictionary *knownPhoneticValues;

  v9 = objc_msgSend(a3, "length");
  knownValues = self->_knownValues;
  if (!v9)
  {
    -[NSMutableDictionary removeObjectForKey:](knownValues, "removeObjectForKey:", a5);
    knownPhoneticValues = self->_knownPhoneticValues;
LABEL_9:
    -[NSMutableDictionary removeObjectForKey:](knownPhoneticValues, "removeObjectForKey:", a5);
    return;
  }
  if (!knownValues)
  {
    knownValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_knownValues = knownValues;
  }
  -[NSMutableDictionary setObject:forKey:](knownValues, "setObject:forKey:", a3, a5);
  v11 = objc_msgSend(a4, "length");
  knownPhoneticValues = self->_knownPhoneticValues;
  if (!v11)
    goto LABEL_9;
  if (!knownPhoneticValues)
  {
    knownPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_knownPhoneticValues = knownPhoneticValues;
  }
  -[NSMutableDictionary setObject:forKey:](knownPhoneticValues, "setObject:forKey:", a4, a5);
}

- (id)knownValuesForClassIdentifier:(id)a3
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_knownValues, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
  else
    return v3;
}

- (void)setKnownValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9;
  NSMutableDictionary *knownValues;
  uint64_t v11;
  NSMutableDictionary *knownPhoneticValues;

  v9 = objc_msgSend(a3, "count");
  knownValues = self->_knownValues;
  if (!v9)
  {
    -[NSMutableDictionary removeObjectForKey:](knownValues, "removeObjectForKey:", a5);
    knownPhoneticValues = self->_knownPhoneticValues;
LABEL_9:
    -[NSMutableDictionary removeObjectForKey:](knownPhoneticValues, "removeObjectForKey:", a5);
    return;
  }
  if (!knownValues)
  {
    knownValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_knownValues = knownValues;
  }
  -[NSMutableDictionary setObject:forKey:](knownValues, "setObject:forKey:", a3, a5);
  v11 = objc_msgSend(a4, "count");
  knownPhoneticValues = self->_knownPhoneticValues;
  if (!v11)
    goto LABEL_9;
  if (!knownPhoneticValues)
  {
    knownPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_knownPhoneticValues = knownPhoneticValues;
  }
  -[NSMutableDictionary setObject:forKey:](knownPhoneticValues, "setObject:forKey:", a4, a5);
}

- (id)ambiguousValuesForClassIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_ambiguousValues, "objectForKey:", a3);
}

- (void)setAmbiguousValues:(id)a3 phoneticValues:(id)a4 forClassIdentifier:(id)a5
{
  uint64_t v9;
  NSMutableDictionary *ambiguousValues;
  NSMutableDictionary *ambiguousPhoneticValues;

  v9 = objc_msgSend(a3, "count");
  ambiguousValues = self->_ambiguousValues;
  if (v9)
  {
    if (!ambiguousValues)
    {
      ambiguousValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_ambiguousValues = ambiguousValues;
    }
    -[NSMutableDictionary setObject:forKey:](ambiguousValues, "setObject:forKey:", a3, a5);
    if (objc_msgSend(a4, "count") == v9)
    {
      ambiguousPhoneticValues = self->_ambiguousPhoneticValues;
      if (!ambiguousPhoneticValues)
      {
        ambiguousPhoneticValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_ambiguousPhoneticValues = ambiguousPhoneticValues;
      }
      -[NSMutableDictionary setObject:forKey:](ambiguousPhoneticValues, "setObject:forKey:", a4, a5);
    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](ambiguousValues, "removeObjectForKey:", a5);
    -[NSMutableDictionary removeObjectForKey:](self->_ambiguousPhoneticValues, "removeObjectForKey:", a5);
  }
}

- (id)_keywords
{
  id result;
  id v4;
  NSArray *v5;
  NSMutableDictionary *ambiguousValues;
  NSMutableDictionary *knownValues;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  result = self->super._keywords;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ambiguousValues = self->_ambiguousValues;
    if (ambiguousValues)
      CFDictionaryApplyFunction((CFDictionaryRef)ambiguousValues, (CFDictionaryApplierFunction)_AddAmbiguousKeywords, v4);
    knownValues = self->_knownValues;
    if (knownValues)
      CFDictionaryApplyFunction((CFDictionaryRef)knownValues, (CFDictionaryApplierFunction)_AddKnownKeywords, v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v4);
          -[NSArray addObject:](v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
    self->super._keywords = v5;

    return self->super._keywords;
  }
  return result;
}

- (BOOL)_keywordIndexChanged
{
  return 0;
}

- (void)setKeywords:(id)a3
{
  NSArray *keywords;

  keywords = self->super._keywords;
  if (keywords != a3)
  {

    self->super._keywords = (NSArray *)a3;
  }
}

- (__VSRecognitionDisambiguationContext)_disambiguationContext
{
  if (!self->_context
    && -[NSString length](self->super._modelIdentifier, "length")
    && -[NSString length](self->_sequenceTag, "length")
    && -[NSMutableDictionary count](self->_knownValues, "count")
    && -[NSMutableDictionary count](self->_ambiguousValues, "count"))
  {
    self->_context = VSRecognitionDisambiguationContextCreate(*MEMORY[0x1E0C9AE00], self->super._modelIdentifier, self->_sequenceTag, (CFDictionaryRef)self->_knownValues, self->_knownPhoneticValues, self->_ambiguousValues, self->_ambiguousPhoneticValues);
  }
  return (__VSRecognitionDisambiguationContext *)self->_context;
}

- (__VSRecognition)_createRecognitionInstanceWithCallbacks:(id *)a3 info:(void *)a4
{
  const __CFString *v7;
  __VSRecognition *result;
  const __CFString *v9;

  v7 = -[VSRecognitionRecognizeAction modelIdentifier](self, "modelIdentifier");
  result = -[VSRecognitionDisambiguateAction _disambiguationContext](self, "_disambiguationContext");
  if (result)
  {
    if (v7)
      v9 = v7;
    else
      v9 = CFSTR("_default");
    return (__VSRecognition *)_VSRecognitionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v9, result, (__int128 *)a3, (uint64_t)a4);
  }
  return result;
}

- (id)_actionForEmptyResults
{
  -[VSRecognitionRecognizeAction _reset](self, "_reset");
  if (-[NSString length](self->_repeatedSpokenFeedbackString, "length"))
    -[VSRecognitionAction setSpokenFeedbackString:](self, "setSpokenFeedbackString:", self->_repeatedSpokenFeedbackString);
  return self;
}

@end
