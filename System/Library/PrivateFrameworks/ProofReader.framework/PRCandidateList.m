@implementation PRCandidateList

- (PRCandidateList)initWithMaxCount:(unint64_t)a3 defaultReplacementRange:(_NSRange)a4 customErrorModel:(id)a5 capitalizationDictionaryArray:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  PRCandidateList *v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)PRCandidateList;
  v11 = -[PRCandidateList init](&v13, sel_init);
  if (v11)
  {
    v11->_candidates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11->_maxCount = a3;
    v11->_defaultReplacementRange.location = location;
    v11->_defaultReplacementRange.length = length;
    v11->_errorModel = -[PRErrorModel initWithCustomErrorModel:]([PRErrorModel alloc], "initWithCustomErrorModel:", a5);
    v11->_capitalizationDictionaryArray = (NSArray *)objc_msgSend(a6, "copy");
  }
  return v11;
}

- (id)description
{
  return (id)-[NSMutableArray componentsJoinedByString:](self->_candidates, "componentsJoinedByString:", CFSTR("/"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRCandidateList;
  -[PRCandidateList dealloc](&v3, sel_dealloc);
}

- (void)addCandidate:(id)a3
{
  NSMutableArray *candidates;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && !-[PRCandidateList isFull](self, "isFull"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    candidates = self->_candidates;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(candidates);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(a3, "string"), "isEqualToString:", objc_msgSend(v10, "string")))
          {
            if ((objc_msgSend(a3, "hasCustomErrorScore") & 1) != 0)
            {
              objc_msgSend(a3, "errorScore");
              objc_msgSend(v10, "setErrorScore:");
              objc_msgSend(v10, "setCustomErrorScore:", 1);
            }
            else
            {
              objc_msgSend(v10, "errorScore");
              v12 = v11;
              objc_msgSend(a3, "errorScore");
              if (v12 < v13)
              {
                objc_msgSend(a3, "errorScore");
                objc_msgSend(v10, "setErrorScore:");
              }
            }
            return;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    -[NSMutableArray addObject:](self->_candidates, "addObject:", a3);
  }
}

- (void)addCandidateWithWords:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5
{
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate candidateWithWords:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithWords:replacementRange:errorType:errorModel:", a3, a4.location, a4.length, a5, self->_errorModel));
}

- (void)addCandidateWithString:(id)a3 replacementRange:(_NSRange)a4 errorType:(unint64_t)a5
{
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate candidateWithString:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithString:replacementRange:errorType:errorModel:", a3, a4.location, a4.length, a5, self->_errorModel));
}

- (void)addCandidateWithString:(id)a3 errorType:(unint64_t)a4
{
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate candidateWithString:replacementRange:errorType:errorModel:](PRCandidate, "candidateWithString:replacementRange:errorType:errorModel:", a3, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a4, self->_errorModel));
}

- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 errorType:(unint64_t)a5
{
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:](PRCandidate, "candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, 0, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a5, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (void)addCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 errorType:(unint64_t)a6
{
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:](PRCandidate, "candidateWithBuffer:encoding:transform:replacementRange:errorType:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (void)addReplacementCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedCharacter:(unsigned __int16)a6 actualCharacter:(unsigned __int16)a7
{
  uint64_t v7;

  LOWORD(v7) = a7;
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate replacementCandidateWithBuffer:encoding:transform:replacementRange:intendedCharacter:actualCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "replacementCandidateWithBuffer:encoding:transform:replacementRange:intendedCharacter:actualCharacter:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v7, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (void)addTranspositionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedFirstCharacter:(unsigned __int16)a6 intendedSecondCharacter:(unsigned __int16)a7
{
  uint64_t v7;

  LOWORD(v7) = a7;
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate transpositionCandidateWithBuffer:encoding:transform:replacementRange:intendedFirstCharacter:intendedSecondCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "transpositionCandidateWithBuffer:encoding:transform:replacementRange:intendedFirstCharacter:intendedSecondCharacter:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v7, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (void)addInsertionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 insertedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8
{
  uint64_t v8;

  WORD1(v8) = a8;
  LOWORD(v8) = a7;
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate insertionCandidateWithBuffer:encoding:transform:replacementRange:intendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "insertionCandidateWithBuffer:encoding:transform:replacementRange:intendedPrecedingCharacter:insertedCharacter:intendedFollowingCharacter:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v8, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (void)addOmissionCandidateWithBuffer:(char *)a3 encoding:(unsigned int)a4 transform:(unint64_t)a5 intendedPrecedingCharacter:(unsigned __int16)a6 omittedCharacter:(unsigned __int16)a7 intendedFollowingCharacter:(unsigned __int16)a8
{
  uint64_t v8;

  WORD1(v8) = a8;
  LOWORD(v8) = a7;
  -[PRCandidateList addCandidate:](self, "addCandidate:", +[PRCandidate omissionCandidateWithBuffer:encoding:transform:replacementRange:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:errorModel:capitalizationDictionaryArray:](PRCandidate, "omissionCandidateWithBuffer:encoding:transform:replacementRange:intendedPrecedingCharacter:omittedCharacter:intendedFollowingCharacter:errorModel:capitalizationDictionaryArray:", a3, *(_QWORD *)&a4, a5, self->_defaultReplacementRange.location, self->_defaultReplacementRange.length, a6, v8, self->_errorModel, self->_capitalizationDictionaryArray));
}

- (id)candidates
{
  return self->_candidates;
}

- (id)candidateStrings
{
  void *v3;
  NSMutableArray *candidates;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  candidates = self->_candidates;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(candidates);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "string"));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_candidates, "count");
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (BOOL)isFull
{
  unint64_t v3;

  v3 = -[PRCandidateList count](self, "count");
  return v3 >= -[PRCandidateList maxCount](self, "maxCount");
}

- (_NSRange)defaultReplacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_defaultReplacementRange.length;
  location = self->_defaultReplacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)candidateWithString:(id)a3
{
  NSMutableArray *candidates;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  candidates = self->_candidates;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(candidates);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "string"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](candidates, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
