@implementation PRCandidate

- (PRCandidate)initWithCandidateWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  NSUInteger length;
  NSUInteger location;
  PRCandidate *v9;
  objc_super v11;

  length = a4.length;
  location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)PRCandidate;
  v9 = -[PRCandidate init](&v11, sel_init);
  if (v9)
  {
    v9->_candidateWords = (NSArray *)objc_msgSend(a3, "copy");
    v9->_replacementRange.location = location;
    v9->_replacementRange.length = length;
    v9->_errorScore = a5;
    v9->_linguisticScore = 0.0;
    v9->_lexiconScore = 0.0;
    v9->_blocklisted = 0;
  }
  return v9;
}

- (PRCandidate)initWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  return -[PRCandidate initWithCandidateWords:replacementRange:errorScore:](self, "initWithCandidateWords:replacementRange:errorScore:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", (id)objc_msgSend(a3, "copy")), a4.location, a4.length, a5);
}

+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  NSUInteger length;
  NSUInteger location;

  if (a3 && (length = a4.length, location = a4.location, objc_msgSend(a3, "count")))
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCandidateWords:replacementRange:errorScore:", a3, location, length, a5);
  else
    return 0;
}

+ (id)candidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;

  if (!a3)
    return 0;
  length = a4.length;
  location = a4.location;
  if (!objc_msgSend(a3, "count"))
    return 0;
  v12 = objc_alloc((Class)a1);
  objc_msgSend(a6, "errorScoreForType:", a5);
  return (id)objc_msgSend(v12, "initWithCandidateWords:replacementRange:errorScore:", a3, location, length);
}

+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorScore:(double)a5
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:replacementRange:errorScore:", a3, a4.location, a4.length, a5);
  else
    return 0;
}

+ (id)candidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5 errorModel:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;

  if (!a3)
    return 0;
  length = a4.length;
  location = a4.location;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(a6, "errorScoreForType:", a5);
  return (id)objc_msgSend(v11, "initWithString:replacementRange:errorScore:", a3, location, length);
}

+ (id)replacementCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedCharacter:(unsigned __int16)a5 actualCharacter:(unsigned __int16)a6 errorModel:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;

  if (!a3)
    return 0;
  v8 = a6;
  v9 = a5;
  length = a4.length;
  location = a4.location;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(a7, "replacementErrorScoreForIntendedCharacter:actualCharacter:", v9, v8);
  v14 = (id)objc_msgSend(v13, "initWithString:replacementRange:errorScore:", a3, location, length);
  if (v14 && objc_msgSend(a7, "hasCustomReplacementErrorScores"))
    objc_msgSend(v14, "setCustomErrorScore:", 1);
  return v14;
}

+ (id)transpositionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedFirstCharacter:(unsigned __int16)a5 intendedSecondCharacter:(unsigned __int16)a6 errorModel:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;

  if (!a3)
    return 0;
  v8 = a6;
  v9 = a5;
  length = a4.length;
  location = a4.location;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(a7, "transpositionErrorScoreForIntendedFirstCharacter:intendedSecondCharacter:", v9, v8);
  v14 = (id)objc_msgSend(v13, "initWithString:replacementRange:errorScore:", a3, location, length);
  if (v14 && objc_msgSend(a7, "hasCustomTranspositionErrorScores"))
    objc_msgSend(v14, "setCustomErrorScore:", 1);
  return v14;
}

+ (id)insertionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 insertedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;

  if (!a3)
    return 0;
  v8 = a7;
  v9 = a6;
  v10 = a5;
  length = a4.length;
  location = a4.location;
  v14 = objc_alloc((Class)a1);
  objc_msgSend(a8, "insertionErrorScoreForIntendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:", v10, v9, v8);
  v15 = (id)objc_msgSend(v14, "initWithString:replacementRange:errorScore:", a3, location, length);
  if (v15 && objc_msgSend(a8, "hasCustomInsertionErrorScores"))
    objc_msgSend(v15, "setCustomErrorScore:", 1);
  return v15;
}

+ (id)omissionCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 intendedPrecedingCharacter:(unsigned __int16)a5 omittedCharacter:(unsigned __int16)a6 intendedFollowingCharacter:(unsigned __int16)a7 errorModel:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;

  if (!a3)
    return 0;
  v8 = a7;
  v9 = a6;
  v10 = a5;
  length = a4.length;
  location = a4.location;
  v14 = objc_alloc((Class)a1);
  objc_msgSend(a8, "omissionErrorScoreForIntendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", v10, v9, v8);
  v15 = (id)objc_msgSend(v14, "initWithString:replacementRange:errorScore:", a3, location, length);
  if (v15 && objc_msgSend(a8, "hasCustomOmissionErrorScores"))
    objc_msgSend(v15, "setCustomErrorScore:", 1);
  return v15;
}

+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorScore:(double)a7 capitalizationDictionaryArray:(id)a8
{
  NSUInteger location;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger length;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  length = a6.length;
  location = a6.location;
  v30 = *MEMORY[0x1E0C80C00];
  v14 = (id)CFStringCreateWithCString(0, a3, a4);
  v15 = -[__CFString lowercaseString](v14, "lowercaseString");
  v16 = 0;
  if (a4 == 1284 && a5 >= 2)
  {
    v16 = candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale;
    if (!candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("tr"));
      candidateWithBuffer_encoding_transform_replacementRange_errorScore_capitalizationDictionaryArray__turkishLocale = v16;
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
LABEL_7:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v19)
        objc_enumerationMutation(a8);
      v21 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v20), "objectForKey:", v15);
      if (v21)
        goto LABEL_20;
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v18)
          goto LABEL_7;
        break;
      }
    }
  }
  switch(a5)
  {
    case 3uLL:
      v21 = initialCapitalizedString(v14, v16);
LABEL_20:
      v22 = v21;
      return (id)objc_msgSend(a1, "candidateWithString:replacementRange:errorScore:", v22, location, length, a7);
    case 2uLL:
      v21 = uppercasedString(v14, v16);
      goto LABEL_20;
    case 1uLL:
      v22 = v15;
      break;
    default:
      v22 = (uint64_t)v14;
      break;
  }
  return (id)objc_msgSend(a1, "candidateWithString:replacementRange:errorScore:", v22, location, length, a7);
}

+ (id)candidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 errorType:(unint64_t)a7 errorModel:(id)a8 capitalizationDictionaryArray:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;

  length = a6.length;
  location = a6.location;
  v12 = *(_QWORD *)&a4;
  objc_msgSend(a8, "errorScoreForType:", a7);
  return (id)objc_msgSend(a1, "candidateWithBuffer:encoding:transform:replacementRange:errorScore:capitalizationDictionaryArray:", a3, v12, a5, location, length, a9);
}

+ (id)replacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedCharacter:(unsigned __int16)a7 actualCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v13;
  void *v16;

  length = a6.length;
  location = a6.location;
  v13 = *(_QWORD *)&a4;
  objc_msgSend(a9, "replacementErrorScoreForIntendedCharacter:actualCharacter:", a7, a8);
  v16 = (void *)objc_msgSend(a1, "candidateWithBuffer:encoding:transform:replacementRange:errorScore:capitalizationDictionaryArray:", a3, v13, a5, location, length, a10);
  if (v16 && objc_msgSend(a9, "hasCustomReplacementErrorScores"))
    objc_msgSend(v16, "setCustomErrorScore:", 1);
  return v16;
}

+ (id)transpositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedFirstCharacter:(unsigned __int16)a7 intendedSecondCharacter:(unsigned __int16)a8 errorModel:(id)a9 capitalizationDictionaryArray:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v13;
  void *v16;

  length = a6.length;
  location = a6.location;
  v13 = *(_QWORD *)&a4;
  objc_msgSend(a9, "transpositionErrorScoreForIntendedFirstCharacter:intendedSecondCharacter:", a7, a8);
  v16 = (void *)objc_msgSend(a1, "candidateWithBuffer:encoding:transform:replacementRange:errorScore:capitalizationDictionaryArray:", a3, v13, a5, location, length, a10);
  if (v16 && objc_msgSend(a9, "hasCustomTranspositionErrorScores"))
    objc_msgSend(v16, "setCustomErrorScore:", 1);
  return v16;
}

+ (id)insertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 insertedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  void *v17;

  length = a6.length;
  location = a6.location;
  v14 = *(_QWORD *)&a4;
  objc_msgSend(a10, "insertionErrorScoreForIntendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:", a7, a8, a9);
  v17 = (void *)objc_msgSend(a1, "candidateWithBuffer:encoding:transform:replacementRange:errorScore:capitalizationDictionaryArray:", a3, v14, a5, location, length, a11);
  if (v17 && objc_msgSend(a10, "hasCustomInsertionErrorScores"))
    objc_msgSend(v17, "setCustomErrorScore:", 1);
  return v17;
}

+ (id)omissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 replacementRange:(_NSRange)a6 intendedPrecedingCharacter:(unsigned __int16)a7 omittedCharacter:(unsigned __int16)a8 intendedFollowingCharacter:(unsigned __int16)a9 errorModel:(id)a10 capitalizationDictionaryArray:(id)a11
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  void *v17;

  length = a6.length;
  location = a6.location;
  v14 = *(_QWORD *)&a4;
  objc_msgSend(a10, "omissionErrorScoreForIntendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:", a7, a8, a9);
  v17 = (void *)objc_msgSend(a1, "candidateWithBuffer:encoding:transform:replacementRange:errorScore:capitalizationDictionaryArray:", a3, v14, a5, location, length, a11);
  if (v17 && objc_msgSend(a10, "hasCustomOmissionErrorScores"))
    objc_msgSend(v17, "setCustomErrorScore:", 1);
  return v17;
}

- (id)description
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PRCandidate string](self, "string");
  -[PRCandidate errorScore](self, "errorScore");
  v6 = v5;
  -[PRCandidate linguisticScore](self, "linguisticScore");
  v8 = v7;
  v9 = -[PRCandidate isBlocklisted](self, "isBlocklisted");
  -[PRCandidate score](self, "score");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%.2g,%.2g,%d;%.2g)"), v4, v6, v8, v9, v10);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRCandidate;
  -[PRCandidate dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfWords
{
  return -[NSArray count](self->_candidateWords, "count");
}

- (NSString)string
{
  NSUInteger v3;
  NSArray *candidateWords;

  v3 = -[NSArray count](self->_candidateWords, "count");
  candidateWords = self->_candidateWords;
  if (v3 == 1)
    return (NSString *)-[NSArray firstObject](candidateWords, "firstObject");
  else
    return -[NSArray componentsJoinedByString:](candidateWords, "componentsJoinedByString:", CFSTR(" "));
}

- (double)score
{
  return self->_errorScore + self->_linguisticScore;
}

- (NSArray)candidateWords
{
  return self->_candidateWords;
}

- (_NSRange)replacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_replacementRange.length;
  location = self->_replacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (double)errorScore
{
  return self->_errorScore;
}

- (void)setErrorScore:(double)a3
{
  self->_errorScore = a3;
}

- (double)linguisticScore
{
  return self->_linguisticScore;
}

- (void)setLinguisticScore:(double)a3
{
  self->_linguisticScore = a3;
}

- (double)lexiconScore
{
  return self->_lexiconScore;
}

- (void)setLexiconScore:(double)a3
{
  self->_lexiconScore = a3;
}

- (BOOL)isBlocklisted
{
  return self->_blocklisted;
}

- (void)setBlocklisted:(BOOL)a3
{
  self->_blocklisted = a3;
}

- (BOOL)hasCustomErrorScore
{
  return self->_hasCustomErrorScore;
}

- (void)setCustomErrorScore:(BOOL)a3
{
  self->_hasCustomErrorScore = a3;
}

@end
