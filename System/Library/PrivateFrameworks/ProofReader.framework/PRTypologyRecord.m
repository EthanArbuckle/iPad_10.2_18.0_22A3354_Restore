@implementation PRTypologyRecord

- (PRTypologyRecord)initWithString:(id)a3 offset:(unint64_t)a4 range:(_NSRange)a5 languageObject:(id)a6 languages:(id)a7 topLanguages:(id)a8 autocorrect:(BOOL)a9 initialCapitalize:(BOOL)a10 autocapitalize:(BOOL)a11 keyEventArray:(id)a12 appIdentifier:(id)a13 selectedRangeValue:(id)a14
{
  NSUInteger length;
  NSUInteger location;
  PRTypologyRecord *v20;
  uint64_t v21;
  objc_super v23;

  length = a5.length;
  location = a5.location;
  v23.receiver = self;
  v23.super_class = (Class)PRTypologyRecord;
  v20 = -[PRTypologyRecord init](&v23, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(a3, "copy");
    v20->_offset = a4;
    v20->_string = (NSString *)v21;
    v20->_range.location = location;
    v20->_range.length = length;
    v20->_langObj = (PRLanguage *)objc_msgSend(a6, "copy");
    v20->_languages = (NSArray *)objc_msgSend(a7, "copy");
    v20->_appIdentifier = (NSString *)objc_msgSend(a13, "copy");
    v20->_selectedRangeValue = (NSValue *)objc_msgSend(a14, "copy");
    v20->_topLanguages = (NSArray *)objc_msgSend(a8, "copy");
    v20->_keyEventArray = (NSArray *)objc_msgSend(a12, "copy");
    v20->_typologyCorrections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20->_typologyCandidates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20->_autocorrect = a9;
    v20->_initialCapitalize = a10;
    v20->_autocapitalize = a11;
    v20->_isOpen = 1;
    v20->_openTime = CFAbsoluteTimeGetCurrent();
  }
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRTypologyRecord;
  -[PRTypologyRecord dealloc](&v3, sel_dealloc);
}

+ (id)openTypologyRecordWithString:(id)a3 range:(_NSRange)a4 languageObject:(id)a5 languages:(id)a6 topLanguages:(id)a7 autocorrect:(BOOL)a8 initialCapitalize:(BOOL)a9 autocapitalize:(BOOL)a10 keyEventArray:(id)a11 appIdentifier:(id)a12 selectedRangeValue:(id)a13
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v19;
  PRTypologyRecord *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  _QWORD block[5];

  length = a4.length;
  location = a4.location;
  v19 = objc_msgSend(a3, "length");
  if (openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue__onceToken != -1)
    dispatch_once(&openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue__onceToken, &__block_literal_global_127);
  v20 = 0;
  if ((_enabledLogTypes & 0x400) != 0 && _typologyRecords && _typologyRecordsSerialQueue && v19)
  {
    v21 = location - 64;
    if (location < 0x40)
      v21 = 0;
    v22 = length + location + 64;
    if (v22 >= v19 || v21 >= v22)
      v22 = v19;
    v24 = v22 - v21;
    if (v24 >= 0x400)
      v24 = 1024;
    if (v21 >= v19)
      v25 = v19 - 1;
    else
      v25 = v21;
    if (v24 + v25 <= v19)
      v26 = v24;
    else
      v26 = v19 - v25;
    BYTE2(v28) = a10;
    LOWORD(v28) = __PAIR16__(a9, a8);
    v20 = -[PRTypologyRecord initWithString:offset:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:]([PRTypologyRecord alloc], "initWithString:offset:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:", objc_msgSend(a3, "substringWithRange:", v25, v26), v25, location, length, a5, a6, a7, v28, a11, a12, a13);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke_2;
    block[3] = &unk_1EA8CCB00;
    block[4] = v20;
    dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
  }
  return v20;
}

dispatch_queue_t __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke()
{
  dispatch_queue_t result;

  _typologyRecords = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  result = dispatch_queue_create("com.apple.ProofReader.typologyRecordsSerialQueue", 0);
  _typologyRecordsSerialQueue = (uint64_t)result;
  return result;
}

unint64_t __185__PRTypologyRecord_openTypologyRecordWithString_range_languageObject_languages_topLanguages_autocorrect_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue___block_invoke_2(uint64_t a1)
{
  unint64_t result;

  objc_msgSend((id)_typologyRecords, "addObject:", *(_QWORD *)(a1 + 32));
  for (result = objc_msgSend((id)_typologyRecords, "count");
        result > _numTypologyRecords;
        result = objc_msgSend((id)_typologyRecords, "count"))
  {
    objc_msgSend((id)_typologyRecords, "removeObjectAtIndex:", 0);
  }
  return result;
}

+ (id)currentTypologyRecord
{
  void *v2;
  BOOL v3;
  id v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v2 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords)
      v3 = _typologyRecordsSerialQueue == 0;
    else
      v3 = 1;
    if (!v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__PRTypologyRecord_currentTypologyRecord__block_invoke;
      block[3] = &unk_1EA8CCF40;
      block[4] = &v7;
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
      v2 = (void *)v8[5];
    }
  }
  v4 = v2;
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __41__PRTypologyRecord_currentTypologyRecord__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)_typologyRecords, "lastObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)addCorrection:(id)a3
{
  if (self->_isOpen)
    -[NSMutableArray addObject:](self->_typologyCorrections, "addObject:", a3);
}

- (void)addCandidate:(id)a3
{
  if (self->_isOpen)
    -[NSMutableArray addObject:](self->_typologyCandidates, "addObject:", a3);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *string;
  NSValue *selectedRangeValue;
  PRLanguage *langObj;
  NSArray *languages;
  NSArray *topLanguages;
  NSString *appIdentifier;
  NSArray *keyEventArray;
  NSMutableArray *typologyCorrections;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSMutableArray *typologyCandidates;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;
  NSRange v38;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  string = self->_string;
  if (string)
    objc_msgSend(v3, "setObject:forKey:", string, CFSTR("StringToCheck"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_offset), CFSTR("Offset"));
  objc_msgSend(v4, "setObject:forKey:", NSStringFromRange(self->_range), CFSTR("Range"));
  selectedRangeValue = self->_selectedRangeValue;
  if (selectedRangeValue)
  {
    v38.location = -[NSValue rangeValue](selectedRangeValue, "rangeValue");
    objc_msgSend(v4, "setObject:forKey:", NSStringFromRange(v38), CFSTR("SelectedRange"));
  }
  langObj = self->_langObj;
  if (langObj)
    objc_msgSend(v4, "setObject:forKey:", -[PRLanguage identifier](langObj, "identifier"), CFSTR("Language"));
  languages = self->_languages;
  if (languages)
    objc_msgSend(v4, "setObject:forKey:", languages, CFSTR("Languages"));
  topLanguages = self->_topLanguages;
  if (topLanguages)
    objc_msgSend(v4, "setObject:forKey:", topLanguages, CFSTR("TopLanguages"));
  appIdentifier = self->_appIdentifier;
  if (appIdentifier)
    objc_msgSend(v4, "setObject:forKey:", appIdentifier, CFSTR("AppIdentifier"));
  keyEventArray = self->_keyEventArray;
  if (keyEventArray)
    objc_msgSend(v4, "setObject:forKey:", -[NSArray description](keyEventArray, "description"), CFSTR("KeyEventArray"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autocorrect), CFSTR("Autocorrect"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_initialCapitalize), CFSTR("InitialCapitalize"));
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autocapitalize), CFSTR("Autocapitalize"));
  typologyCorrections = self->_typologyCorrections;
  if (typologyCorrections && -[NSMutableArray count](typologyCorrections, "count"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = self->_typologyCorrections;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v16);
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Corrections"));
  }
  typologyCandidates = self->_typologyCandidates;
  if (typologyCandidates && -[NSMutableArray count](typologyCandidates, "count"))
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = self->_typologyCandidates;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v23);
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Candidates"));
  }
  if (!self->_isOpen)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_closeTime - self->_openTime), CFSTR("Time"));
  return v4;
}

+ (void)writeTypologyRecords
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  NSString *v5;
  void *v6;
  _QWORD block[5];
  uint64_t v8;

  v2 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords)
      v3 = _typologyRecordsSerialQueue == 0;
    else
      v3 = 1;
    if (!v3)
    {
      v4 = v2;
      v5 = -[NSString stringByAppendingPathComponent:](_NSSpellingDictDirectoryPath2(), "stringByAppendingPathComponent:", CFSTR("typology.plist"));
      v8 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__PRTypologyRecord_writeTypologyRecords__block_invoke;
      block[3] = &unk_1EA8CCB00;
      block[4] = v4;
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, block);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 100, 0, &v8);
      if (v6)
        objc_msgSend(v6, "writeToFile:options:error:", v5, 1, &v8);
      else
        NSLog((NSString *)CFSTR("typology error: %@"), v8);
    }
  }
}

uint64_t __40__PRTypologyRecord_writeTypologyRecords__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)_typologyRecords;
  result = objc_msgSend((id)_typologyRecords, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "dictionaryRepresentation"));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)resetTypologyRecords
{
  BOOL v2;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", -[NSString stringByAppendingPathComponent:](_NSSpellingDictDirectoryPath2(), "stringByAppendingPathComponent:", CFSTR("typology.plist")), 0);
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords)
      v2 = _typologyRecordsSerialQueue == 0;
    else
      v2 = 1;
    if (!v2)
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, &__block_literal_global_160);
  }
}

uint64_t __40__PRTypologyRecord_resetTypologyRecords__block_invoke()
{
  return objc_msgSend((id)_typologyRecords, "removeAllObjects");
}

+ (void)setTypologyRecordsLimit:(unint64_t)a3
{
  BOOL v3;

  _numTypologyRecords = a3;
  if ((_enabledLogTypes & 0x400) != 0)
  {
    if (_typologyRecords)
      v3 = _typologyRecordsSerialQueue == 0;
    else
      v3 = 1;
    if (!v3)
      dispatch_sync((dispatch_queue_t)_typologyRecordsSerialQueue, &__block_literal_global_161);
  }
}

unint64_t __44__PRTypologyRecord_setTypologyRecordsLimit___block_invoke()
{
  unint64_t result;

  for (result = objc_msgSend((id)_typologyRecords, "count");
        result > _numTypologyRecords;
        result = objc_msgSend((id)_typologyRecords, "count"))
  {
    objc_msgSend((id)_typologyRecords, "removeObjectAtIndex:", 0);
  }
  return result;
}

- (void)closeTypologyRecordWithResults:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_results = (NSArray *)objc_msgSend(a3, "copy");
    self->_isOpen = 0;
  }
}

@end
