@implementation PRPinyinContext

- (PRPinyinContext)init
{
  PRPinyinContext *v3;
  objc_super v5;

  if (!_sharedChecker)
    _sharedChecker = objc_alloc_init(AppleSpell);
  v5.receiver = self;
  v5.super_class = (Class)PRPinyinContext;
  v3 = -[PRPinyinContext init](&v5, sel_init);
  v3->_modifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_addedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_removedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_addedRemovedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_prefixes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_buffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0xEEEC5DC3uLL);
  v3->_altBuffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x59673B63uLL);
  v3->_altBufferScores = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0xFEEA568FuLL);
  v3->_geometryDataArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3->_syllableLengthArray = (unint64_t *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  v3->_connection = (void *)objc_msgSend((id)_sharedChecker, "databaseConnectionForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN")));
  v3->_romanization = 0;
  v3->_validSequenceCorrectionThreshold = 0.0;
  -[PRPinyinContext reset](v3, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_buffer);
  free(self->_altBuffer);
  free(self->_altBufferScores);

  free(self->_syllableLengthArray);
  v3.receiver = self;
  v3.super_class = (Class)PRPinyinContext;
  -[PRPinyinContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nmodifications:  %@\nprefixes:  %@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_buffer), self->_modifications, self->_prefixes);
}

- (int)romanization
{
  return self->_romanization;
}

- (void)setValidSequenceCorrectionThreshold:(double)a3
{
  self->_validSequenceCorrectionThreshold = a3;
}

- (double)validSequenceCorrectionThreshold
{
  return self->_validSequenceCorrectionThreshold;
}

- (void)_removeModificationsAndMoveStartingPoint
{
  uint64_t v3;
  unint64_t startingPoint;
  unint64_t length;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  double v17;
  unsigned __int8 *v18;
  unsigned int v19;
  BOOL v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  size_t v34;
  unint64_t v35;
  const char *v36;
  unint64_t v37;
  _BOOL4 v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unsigned __int8 *v42;
  uint64_t v43;

  v3 = -[NSMutableArray count](self->_modifications, "count");
  startingPoint = self->_startingPoint;
  v43 = 0;
  length = self->_length;
  v37 = startingPoint;
  if (length <= startingPoint)
  {
    v38 = 0;
  }
  else
  {
    v38 = 0;
    if (findPinyin((unsigned __int8 *)&self->_buffer[startingPoint], length - startingPoint, self->_romanization, 0, 0, 0, 0, 0, &v43, 0, 0, 0, 0, 0, 0, 0, 0, 0))v38 = v43 + self->_startingPoint == self->_length;
  }
  if (v3)
  {
    v6 = 0;
    v7 = v3 - 1;
    while (1)
    {
      v39 = v6;
      v8 = (void *)-[NSMutableArray objectAtIndex:](self->_modifications, "objectAtIndex:", v7);
      v9 = objc_msgSend(v8, "modificationType");
      v10 = objc_msgSend(v8, "syllableRange");
      v12 = v10 + v11;
      if (self->_startingPoint < v10 + v11)
      {
        v13 = self->_length;
        if (v13 > v12)
          break;
      }
      v6 = v39;
LABEL_42:
      if (--v7 == -1)
        goto LABEL_68;
    }
    v14 = v10;
    v42 = 0;
    v15 = next_pinyin((unsigned __int8 *)&self->_buffer[v12], v13 - v12, self->_romanization, 0, &v42, 0);
    v40 = 0;
    v41 = 0;
    if (v15)
      v16 = (unsigned __int8 *)(v42 - v15);
    else
      v16 = 0;
    if ((objc_msgSend(v8, "producesPartialSyllable") & 1) != 0)
      goto LABEL_40;
    if ((objc_msgSend(v8, "isTemporary") & 1) != 0)
      goto LABEL_40;
    if (v38 && self->_startingPoint <= v14 && v9 != 5)
    {
      objc_msgSend(v8, "modificationScore");
      if (v17 > self->_validSequenceCorrectionThreshold)
        goto LABEL_40;
    }
    if (v16)
    {
      if (v16 == (unsigned __int8 *)1 && self->_length - v12 > 1)
        goto LABEL_40;
    }
    else
    {
      v18 = (unsigned __int8 *)&self->_buffer[v12];
      v19 = *v18;
      v22 = v19 <= 0xF7 && v19 - 216 >= 0x1F && v19 - 192 >= 0x17 && (v19 & 0xFFFFFFDF) - 65 >= 0x1A;
      if (!v22
        || ((v23 = v19 - 138, v24 = v23 > 0x15, v25 = (1 << v23) & 0x350015, !v24) ? (v26 = v25 == 0) : (v26 = 1), !v26))
      {
        if (!is_partial_pinyin(v18, self->_length - v12, self->_romanization, 0))
          goto LABEL_40;
      }
    }
    if (!objc_msgSend(v8, "_shouldAppendLetter:romanization:", self->_buffer[v12], self->_romanization))
    {
      if ((unint64_t)v16 < 2
        || !findPinyin((unsigned __int8 *)&self->_buffer[v12], self->_length - v12, self->_romanization, 0, 0, 0, 0, 0, &v41, 0, &v40, 0, 0, 0, 0, 0, 0, self->_syllableLengthArray))
      {
        goto LABEL_41;
      }
      v28 = v41;
      v29 = self->_length;
      if (v41 + v12 >= v29)
      {
        if (v40 >= 3)
        {
          v35 = v29 - 1;
          if (self->_altBuffer[v35])
          {
            LOBYTE(v27) = self->_altBufferScores[v35];
            if ((double)v27 / 100.0 <= self->_validSequenceCorrectionThreshold)
            {
LABEL_58:
              v6 = v39;
              if (v28 > v39 || v39 && v28 == v39 && v12 < v37)
              {
                v6 = v28;
                v37 = v12;
              }
              goto LABEL_42;
            }
          }
        }
        goto LABEL_41;
      }
      if (v40 > 1 || v29 - v12 >= 8 && v40 == 1)
        goto LABEL_58;
      v30 = *self->_syllableLengthArray;
      if (v30 == 3)
      {
        v36 = &self->_buffer[v12];
        if (!strncmp(v36, "dei", 3uLL))
          goto LABEL_58;
        v32 = v36;
        v33 = "gei";
        v34 = 3;
      }
      else
      {
        if (v30 != 2)
          goto LABEL_41;
        v31 = &self->_buffer[v12];
        if (!strncmp(v31, "de", 2uLL) || !strncmp(v31, "ge", 2uLL))
          goto LABEL_58;
        v32 = v31;
        v33 = "he";
        v34 = 2;
      }
      if (!strncmp(v32, v33, v34))
        goto LABEL_58;
      goto LABEL_41;
    }
LABEL_40:
    -[NSMutableArray addObject:](self->_removedModifications, "addObject:", v8);
    -[NSMutableArray removeObjectAtIndex:](self->_modifications, "removeObjectAtIndex:", v7);
LABEL_41:
    v6 = v39;
    goto LABEL_42;
  }
LABEL_68:
  self->_startingPoint = v37;
}

- (void)_advanceIndexes
{
  unint64_t *nextIndexes;
  unint64_t v4;
  unint64_t *lastIndexes;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t length;
  char *buffer;
  unint64_t v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;

  v23 = 0;
  v24 = 0;
  v22 = 0;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  nextIndexes = self->_nextIndexes;
  v4 = self->_nextIndexes[0];
  lastIndexes = self->_lastIndexes;
  v6 = self->_lastIndexes[0];
  v18 = 0;
  findPinyin((unsigned __int8 *)&self->_buffer[self->_startingPoint], self->_length - self->_startingPoint, self->_romanization, 1, &v24, &v23, &v22, &v21, &v20, &v19, 0, &v18, 0, 0, 0, 0, 0, 0);
  *lastIndexes = v21 + self->_startingPoint;
  lastIndexes[1] = (unint64_t)&v22[self->_startingPoint];
  lastIndexes[2] = (unint64_t)&v23[self->_startingPoint];
  lastIndexes[3] = v24 + self->_startingPoint;
  *nextIndexes = v20 + self->_startingPoint;
  nextIndexes[1] = v19 + self->_startingPoint;
  v7 = lastIndexes[2];
  v8 = lastIndexes[3];
  if (v7 == v8 && v4 < v8)
  {
    if (lastIndexes[1] == v7 && v6 < v4)
    {
      lastIndexes[2] = v4;
      v4 = v6;
    }
    lastIndexes[3] = v4;
  }
  v9 = *nextIndexes;
  self->_startIndex = *nextIndexes;
  v10 = nextIndexes[1];
  if (v10 < v9 && v10 > self->_startingPoint)
    v9 = nextIndexes[1];
  self->_startIndex = v9;
  if (v9 > *lastIndexes)
    self->_startIndex = v9 - 1;
  v12 = *nextIndexes;
  v13 = *nextIndexes + 7;
  self->_endIndex = v13;
  length = self->_length;
  if (v13 < length)
  {
    buffer = self->_buffer;
    if (buffer[v13] == 39)
    {
      v16 = v12 + 8;
      do
      {
        v13 = v16;
        self->_endIndex = v16;
        length = self->_length;
        if (v16 >= length)
          break;
        v17 = buffer[v16++];
      }
      while (v17 == 39);
    }
  }
  if (v13 > length)
  {
    self->_endIndex = length;
    length = self->_length;
  }
  if ((isFullOrAbbreviatedPinyin((uint64_t)&self->_buffer[*lastIndexes], length - *lastIndexes, self->_romanization, &self->_abbreviatedSyllableCount) & 1) == 0)self->_abbreviatedSyllableCount = 0;
  self->_lastSyllableIsPartial = v18;
}

- (BOOL)_addEnglishWordForRange:(_NSRange)a3 quickly:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  void *connection;
  void *v9;
  void *v10;
  NSMutableArray *modifications;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t i;
  unint64_t v23;
  NSUInteger v24;
  PRPinyinModification *v25;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3.length - 2 > 0xC)
  {
LABEL_32:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  length = a3.length;
  location = a3.location;
  a3.location += (NSUInteger)self->_buffer;
  if (a4)
    connection = 0;
  else
    connection = self->_connection;
  v9 = (void *)objc_msgSend((id)_sharedChecker, "englishStringsFromWordBuffer:length:connection:", a3.location, a3.length, connection);
  if (v9)
  {
    v10 = v9;
    v9 = (void *)objc_msgSend(v9, "count");
    if (v9)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      modifications = self->_modifications;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v34;
LABEL_9:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(modifications);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
          if (objc_msgSend(v16, "modificationType") == 5 && location == objc_msgSend(v16, "range") && length == v17)
            goto LABEL_32;
          if (v13 == ++v15)
          {
            v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v13)
              goto LABEL_9;
            break;
          }
        }
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v9 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v9)
      {
        v19 = (uint64_t)v9;
        obj = v10;
        v20 = a4;
        v21 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(obj);
            v23 = self->_length;
            v24 = length;
            if (length + location < v23)
            {
              v24 = length;
              while (self->_buffer[location + v24] == 39)
              {
                ++v24;
                if (location + v24 >= v23)
                {
                  v24 = v23 - location;
                  break;
                }
              }
            }
            LOBYTE(v27) = v20;
            v25 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:isTemporary:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:isTemporary:", location, length, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), 5, location, v24, 1.0, v27);
            -[NSMutableArray addObject:](self->_modifications, "addObject:", v25);
            -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v25);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v19);
        LOBYTE(v9) = 1;
      }
    }
  }
  return (char)v9;
}

- (BOOL)_addEnglishWordsEndingAtIndex:(unint64_t)a3 quickly:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t *lastIndexes;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unsigned __int8 *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int8 *v20;

  v4 = a4;
  v20 = 0;
  lastIndexes = self->_lastIndexes;
  v8 = self->_lastIndexes[2];
  v9 = self->_lastIndexes[3];
  if (v9 >= v8)
  {
    v10 = 0;
  }
  else
  {
    v10 = -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", self->_lastIndexes[3], a3 - v9, a4);
    v8 = lastIndexes[2];
    v9 = lastIndexes[3];
  }
  if (v9 + 2 < v8)
  {
    v11 = next_pinyin((unsigned __int8 *)&self->_buffer[v9], v8 + ~v9, self->_romanization, 0, &v20, 0);
    v8 = lastIndexes[2];
    if (v11)
    {
      if ((unsigned __int8 *)&self->_buffer[v8 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8 - 1, a3 - v8 + 1, v4);
        v8 = lastIndexes[2];
      }
    }
  }
  v12 = lastIndexes[1];
  if (v8 < v12)
  {
    v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8, a3 - v8, v4);
    v12 = lastIndexes[1];
    v8 = lastIndexes[2];
  }
  if (v8 + 2 < v12)
  {
    v13 = next_pinyin((unsigned __int8 *)&self->_buffer[v8], v12 + ~v8, self->_romanization, 0, &v20, 0);
    v12 = lastIndexes[1];
    if (v13)
    {
      if ((unsigned __int8 *)&self->_buffer[v12 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v12 - 1, a3 - v12 + 1, v4);
        v12 = lastIndexes[1];
      }
    }
  }
  v14 = *lastIndexes;
  if (v12 < *lastIndexes)
  {
    v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v12, a3 - v12, v4);
    v14 = *lastIndexes;
    v12 = lastIndexes[1];
  }
  if (v12 + 2 < v14)
  {
    v15 = next_pinyin((unsigned __int8 *)&self->_buffer[v12], v14 + ~v12, self->_romanization, 0, &v20, 0);
    v14 = *lastIndexes;
    if (v15)
    {
      if ((unsigned __int8 *)&self->_buffer[v14 - 1] == v20)
      {
        v10 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v14 - 1, a3 - v14 + 1, v4);
        v14 = *lastIndexes;
      }
    }
  }
  v16 = -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v14, a3 - v14, v4) | v10;
  v17 = self->_nextIndexes[0];
  if (v17 != *lastIndexes)
  {
    v16 |= -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v17, a3 - v17, v4);
    v17 = self->_nextIndexes[0];
  }
  v18 = self->_nextIndexes[1];
  if (v18 != v17 && v18 != *lastIndexes)
    return -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", self->_nextIndexes[1], a3 - v18, v4) | v16;
  return v16;
}

- (void)_addEnglishWordsQuickly:(BOOL)a3
{
  unint64_t lengthBeforeApostrophes;

  -[PRPinyinContext _addEnglishWordsEndingAtIndex:quickly:](self, "_addEnglishWordsEndingAtIndex:quickly:", self->_lengthBeforeApostrophes, a3);
  if (!a3)
  {
    lengthBeforeApostrophes = self->_lengthBeforeApostrophes;
    if (lengthBeforeApostrophes)
    {
      if (self->_previouslyAnalyzedLength < lengthBeforeApostrophes - 1)
      {
        if (is_partial_pinyin((unsigned __int8 *)&self->_buffer[lengthBeforeApostrophes - 1], 1uLL, self->_romanization, 0))-[PRPinyinContext _addEnglishWordsEndingAtIndex:quickly:](self, "_addEnglishWordsEndingAtIndex:quickly:", self->_lengthBeforeApostrophes - 1, 0);
      }
    }
  }
}

- (void)_addSpecialEnglishWords
{
  unint64_t lengthBeforeApostrophes;
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t *lastIndexes;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  unsigned __int8 *v21;

  lengthBeforeApostrophes = self->_lengthBeforeApostrophes;
  if (lengthBeforeApostrophes >= 8)
    v3 = lengthBeforeApostrophes - 8;
  else
    v3 = 0;
  if (v3 + 3 >= lengthBeforeApostrophes)
    return;
  v5 = 8;
  if (lengthBeforeApostrophes < 8)
    v5 = self->_lengthBeforeApostrophes;
  v6 = -(uint64_t)v5;
  v7 = &self->_buffer[-v5];
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v9 = v7[lengthBeforeApostrophes];
    ++v3;
    v10 = v7[lengthBeforeApostrophes + 1];
    if (v9 == 105)
    {
      v11 = 0;
      if (v7[lengthBeforeApostrophes + 1] > 0x6Cu)
      {
        if (v10 == 109)
        {
LABEL_31:
          if (v7[lengthBeforeApostrophes + 2] == 97 && v7[lengthBeforeApostrophes + 3] == 99)
            goto LABEL_33;
        }
        else
        {
          if (v10 != 112)
            goto LABEL_47;
LABEL_22:
          v12 = v7[lengthBeforeApostrophes + 2];
          if ((v12 == 111 || v12 == 97) && v7[lengthBeforeApostrophes + 3] == 100)
          {
LABEL_33:
            v11 = 4;
            goto LABEL_34;
          }
          v11 = 0;
          if (lengthBeforeApostrophes + v6 + 5 >= lengthBeforeApostrophes || v12 != 104)
            goto LABEL_47;
          if (v7[lengthBeforeApostrophes + 3] == 111
            && v7[lengthBeforeApostrophes + 4] == 110
            && v7[lengthBeforeApostrophes + 5] == 101)
          {
            v11 = 6;
LABEL_34:
            if (lengthBeforeApostrophes + v11 + v6 < lengthBeforeApostrophes)
              v11 |= v7[lengthBeforeApostrophes + v11] == 115;
LABEL_36:
            v8 = lengthBeforeApostrophes + v6;
            goto LABEL_47;
          }
        }
LABEL_46:
        v11 = 0;
        goto LABEL_47;
      }
      if (v10 == 77)
        goto LABEL_31;
      if (v10 == 80)
        goto LABEL_22;
    }
    else if ((v10 | 0x20) == 0x6D)
    {
      if (v7[lengthBeforeApostrophes + 2] != 97 || v7[lengthBeforeApostrophes + 3] != 99)
        goto LABEL_46;
      if (lengthBeforeApostrophes + v6 + 4 >= lengthBeforeApostrophes)
      {
        v11 = 3;
      }
      else
      {
        v11 = 3;
        if (v7[lengthBeforeApostrophes + 4] == 115)
          v11 = 4;
      }
      v8 = v3;
    }
    else
    {
      if (lengthBeforeApostrophes + v6 + 7 >= lengthBeforeApostrophes || (v9 | 0x20) != 0x66)
        goto LABEL_41;
      if (strncmp(&v7[lengthBeforeApostrophes + 1], "acebook", 7uLL))
      {
        if (!strncmp(&v7[lengthBeforeApostrophes + 1], "acetime", 7uLL))
        {
          v11 = 8;
          goto LABEL_36;
        }
LABEL_41:
        if (lengthBeforeApostrophes + v6 + 5 < lengthBeforeApostrophes && (v9 | 0x20) == 0x72)
        {
          v13 = strncmp(&v7[lengthBeforeApostrophes + 1], "etina", 5uLL);
          v11 = 6;
          if (v13)
            v11 = 0;
          else
            v8 = lengthBeforeApostrophes + v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      v11 = 8;
      v8 = lengthBeforeApostrophes + v6;
    }
LABEL_47:
    if (v8 + v11 >= lengthBeforeApostrophes)
      v14 = v11;
    else
      v14 = 0;
    if (v8 + v11 < lengthBeforeApostrophes)
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (lengthBeforeApostrophes + v6 + 4 >= lengthBeforeApostrophes)
      break;
    ++v6;
    ++v7;
  }
  while (!v14);
  if (v14)
  {
    v15 = 0;
    v21 = 0;
    lastIndexes = self->_lastIndexes;
    while (1)
    {
      v17 = lastIndexes[v15];
      if (v8 == v17 || v15 <= 1 && v8 == self->_nextIndexes[v15])
        break;
      if (v8 > v17 + 1
        && next_pinyin((unsigned __int8 *)&self->_buffer[v17], v8 - v17, self->_romanization, 0, &v21, 0)
        && (unsigned __int8 *)&self->_buffer[v8] == v21)
      {
        break;
      }
      v18 = lastIndexes[v15];
      if (v18 > v8 + 1
        && next_pinyin((unsigned __int8 *)&self->_buffer[v8], v18 - v8, self->_romanization, 0, &v21, 0))
      {
        v19 = &self->_buffer[lastIndexes[v15]] == (char *)v21;
        if ((unsigned __int8 *)&self->_buffer[lastIndexes[v15]] == v21)
          goto LABEL_74;
      }
      else
      {
        v19 = 0;
      }
      if (v15++ >= 3)
      {
LABEL_74:
        if (!v19)
          return;
        break;
      }
    }
    -[PRPinyinContext _addEnglishWordForRange:quickly:](self, "_addEnglishWordForRange:quickly:", v8, v14, 0, 80);
  }
}

- (void)_addTranspositions
{
  unint64_t *lastIndexes;
  unint64_t startIndex;
  unint64_t v4;
  unint64_t endIndex;
  unint64_t v7;
  unint64_t v8;
  char *buffer;
  int v10;
  unsigned int v11;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *syllableLengthArray;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  NSMutableArray *modifications;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v40;
  PRPinyinModification *v41;
  PRPinyinModification *v42;
  uint64_t v43;
  unint64_t *v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _WORD v55[2];
  char v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  lastIndexes = self->_lastIndexes;
  if (self->_lastIndexes[1] >= self->_startIndex)
    startIndex = self->_startIndex;
  else
    startIndex = self->_lastIndexes[1];
  v4 = startIndex + 1;
  endIndex = self->_endIndex;
  if (startIndex + 1 < endIndex)
  {
    v7 = 0x1F043A000uLL;
    v44 = self->_lastIndexes;
    while (1)
    {
      v8 = startIndex;
      startIndex = v4;
      buffer = self->_buffer;
      v10 = buffer[v8];
      v11 = buffer[startIndex];
      if ((v10 - 65) < 0x1A || v11 - 65 < 0x1A)
        return;
      v13 = *(int *)(v7 + 1896);
      v14 = v10 == 97 && *(_DWORD *)((char *)&self->super.super.isa + v13) == 1;
      if ((!v14 || v11 != 105) && (v10 - 97) <= 0x19 && v11 >= 0x61 && v11 <= 0x7A)
        break;
LABEL_80:
      v4 = startIndex + 1;
      if (startIndex + 1 >= endIndex)
        return;
    }
    v59 = 0;
    v57 = 0;
    v58 = 0;
    v56 = 0;
    v55[0] = v11;
    v55[1] = v10;
    buffer[v8] = v11;
    self->_buffer[startIndex] = v10;
    if (v8 >= *lastIndexes)
    {
      if (findPinyin((unsigned __int8 *)&self->_buffer[*lastIndexes], self->_endIndex - *lastIndexes, *(_DWORD *)((char *)&self->super.super.isa + v13), 0, 0, 0, 0, &v59, &v58, 0, &v57, &v56, 0, 0, 0, 0, 0, self->_syllableLengthArray))
      {
        v15 = *lastIndexes;
        if (v58 + *lastIndexes == self->_endIndex && (!v56 || v8 < v59 + v15))
        {
          v16 = v57;
          if (v57)
          {
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v20 = 0;
            syllableLengthArray = self->_syllableLengthArray;
            v22 = 0x7FFFFFFFFFFFFFFFLL;
            while (1)
            {
              v23 = syllableLengthArray[v17];
              v24 = v23 + v15;
              if (v8 >= v15)
              {
                if (startIndex < v24)
                {
                  if (v56 && v57 - 1 == v17)
                    v18 = 1;
                  v20 = syllableLengthArray[v17];
                  v25 = v15;
                  goto LABEL_39;
                }
                if (v8 < v24)
                {
                  v20 = syllableLengthArray[v17 + 1];
                  if (v56 && v57 - 2 == v17)
                    v18 = 1;
                  v22 = v15;
                  v19 = syllableLengthArray[v17];
                  v25 = v23 + v15;
                  goto LABEL_39;
                }
              }
              v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:
              if (v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                ++v17;
                v15 = v24;
                if (v17 < v57)
                  continue;
              }
              goto LABEL_83;
            }
          }
          goto LABEL_82;
        }
      }
    }
    v26 = lastIndexes[1];
    if (v8 < v26
      || !findPinyin((unsigned __int8 *)&self->_buffer[v26], self->_endIndex - v26, *(_DWORD *)((char *)&self->super.super.isa + v13), 0, 0, 0, 0, &v59, &v58, 0, &v57, &v56, 0, 0, 0, 0, 0, self->_syllableLengthArray)|| (v27 = lastIndexes[1], v58 + v27 != self->_length)
      || v56 && v8 >= v59 + v27)
    {
      v50 = 0;
      v48 = 0;
      v49 = 0;
      v45 = 0;
      v46 = 0x7FFFFFFFFFFFFFFFLL;
      v47 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      modifications = self->_modifications;
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v52;
LABEL_67:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v52 != v35)
            objc_enumerationMutation(modifications);
          v37 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v36);
          if (objc_msgSend(v37, "modificationType") == 2 && v8 == objc_msgSend(v37, "range") && v38 == 2)
            break;
          if (v34 == ++v36)
          {
            v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            if (v34)
              goto LABEL_67;
            goto LABEL_77;
          }
        }
      }
      else
      {
LABEL_77:
        if (v50)
        {
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v55, 2);
          v41 = [PRPinyinModification alloc];
          BYTE1(v43) = self->_length == 3;
          LOBYTE(v43) = v45;
          v42 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](v41, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", v8, 2, v40, 2, 1.0, v47, v48, v49, &self->_buffer[v46], v43);
          -[NSMutableArray addObject:](self->_modifications, "addObject:", v42);
          -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v42);

        }
      }
      self->_buffer[v8] = v10;
      self->_buffer[startIndex] = v11;
      lastIndexes = v44;
      endIndex = self->_endIndex;
      v7 = 0x1F043A000;
      goto LABEL_80;
    }
    v16 = v57 - 1;
    if (!v57)
    {
LABEL_82:
      v18 = 0;
      v20 = 0;
      v19 = 0;
      v22 = 0x7FFFFFFFFFFFFFFFLL;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_83:
      v46 = v25;
      v47 = v22;
      v48 = v19;
      v49 = v16;
      v50 = v20;
      v45 = v18 & 1;
      goto LABEL_65;
    }
    v28 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v29 = self->_syllableLengthArray;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v30 = v29[v28];
      v31 = v30 + v27;
      if (v8 >= v27)
      {
        if (startIndex < v31)
        {
          if (v56 && v16 == v28)
            v18 = 1;
          v20 = v29[v28];
          v25 = v27;
          goto LABEL_61;
        }
        if (v8 < v31)
        {
          v20 = v29[v28 + 1];
          if (v56 && v57 - 2 == v28)
            v18 = 1;
          v22 = v27;
          v19 = v29[v28];
          v25 = v30 + v27;
          goto LABEL_61;
        }
      }
      v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_61:
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v28;
        v27 = v31;
        if (v28 < v57)
          continue;
      }
      goto LABEL_83;
    }
  }
}

- (void)_addReplacements
{
  double v2;
  unint64_t startIndex;
  unint64_t endIndex;
  int v6;
  uint64_t v7;
  char v8;
  double v9;
  int v10;
  char *buffer;
  unint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *syllableLengthArray;
  uint64_t v17;
  unint64_t v18;
  NSMutableArray *modifications;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v27;
  void *v28;
  PRPinyinModification *v29;
  PRPinyinModification *v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned __int16 v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  endIndex = self->_endIndex;
  if (startIndex >= endIndex)
    return;
  do
  {
    v6 = self->_buffer[startIndex];
    if ((v6 - 65) < 0x1A)
      return;
    if ((v6 - 97) > 0x19)
      goto LABEL_48;
    v7 = 0;
    v33 = v6 - 97;
    v34 = self->_buffer[startIndex];
    do
    {
      if (v7 != 6)
      {
        v10 = adjacentMatchesChinese[6 * v33 + v7];
        v8 = v10;
        v9 = 1.0;
        if (!(_BYTE)v10)
          goto LABEL_46;
LABEL_9:
        v42 = 0;
        v43 = 0;
        v41 = 0;
        v40 = 0;
        buffer = self->_buffer;
        v39 = v10;
        buffer[startIndex] = v8;
        if (findPinyin((unsigned __int8 *)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0], self->_romanization, 0, 0, 0, 0, &v43, &v42, 0, &v41, &v40, 0, 0, 0, 0, 0, self->_syllableLengthArray))
        {
          v12 = self->_lastIndexes[0];
          if (v42 + v12 == self->_endIndex && (!v40 || startIndex < v43 + v12))
          {
            if (v41)
            {
              v13 = 0;
              v14 = 0;
              v15 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (startIndex < v12)
              {
                v17 = 0x7FFFFFFFFFFFFFFFLL;
                if (v40)
                  goto LABEL_24;
LABEL_25:
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v12 += syllableLengthArray[v15++];
                  if (v15 < v41)
                    continue;
                }
                goto LABEL_29;
              }
              v18 = syllableLengthArray[v15];
              if (startIndex >= v18 + v12)
                v17 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v17 = v12;
              if (startIndex < v18 + v12)
                v14 = syllableLengthArray[v15];
              if (!v40)
                goto LABEL_25;
LABEL_24:
              v13 |= v41 - 1 == v15;
              goto LABEL_25;
            }
            v14 = 0;
            v13 = 0;
            v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v32 = v14;
            modifications = self->_modifications;
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v36;
LABEL_31:
              v23 = 0;
              while (1)
              {
                if (*(_QWORD *)v36 != v22)
                  objc_enumerationMutation(modifications);
                v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v23);
                if (objc_msgSend(v24, "modificationType") == 1 && startIndex == objc_msgSend(v24, "range") && v25 == 1)
                {
                  v27 = objc_msgSend((id)objc_msgSend(v24, "replacementString"), "characterAtIndex:", 0);
                  if (v27 == v39)
                    break;
                }
                if (v21 == ++v23)
                {
                  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
                  if (v21)
                    goto LABEL_31;
                  goto LABEL_43;
                }
              }
            }
            else
            {
LABEL_43:
              if (v32)
              {
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v39, 1);
                v29 = [PRPinyinModification alloc];
                BYTE1(v31) = self->_length == 3;
                LOBYTE(v31) = v13 & 1;
                v30 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](v29, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", startIndex, 1, v28, 1, v17, v32, v9, v41, &self->_buffer[v17], v31);
                -[NSMutableArray addObject:](self->_modifications, "addObject:", v30);
                -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v30);

              }
            }
          }
        }
        self->_buffer[startIndex] = v34;
        goto LABEL_46;
      }
      v8 = self->_altBuffer[startIndex];
      LOBYTE(v2) = self->_altBufferScores[startIndex];
      v2 = (double)*(unint64_t *)&v2;
      v9 = v2 / 100.0;
      LOBYTE(v10) = v8;
      if (v8)
        goto LABEL_9;
LABEL_46:
      ++v7;
    }
    while (v7 != 7);
    endIndex = self->_endIndex;
LABEL_48:
    ++startIndex;
  }
  while (startIndex < endIndex);
}

- (void)_addValidSequenceReplacements
{
  double v2;
  unint64_t v3;
  unint64_t startIndex;
  unint64_t v5;
  unint64_t endIndex;
  unint64_t v8;
  char *buffer;
  int v10;
  unsigned int v11;
  double v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *syllableLengthArray;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSMutableArray *modifications;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v28;
  uint64_t v29;
  void *v31;
  PRPinyinModification *v32;
  PRPinyinModification *v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned __int16 v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = self->_lastIndexes[1];
  if (v3 >= self->_startIndex)
    startIndex = self->_startIndex;
  else
    startIndex = self->_lastIndexes[1];
  if (v3 >= self->_lastIndexes[0])
    v5 = self->_lastIndexes[0];
  else
    v5 = self->_lastIndexes[1];
  v36 = v5;
  endIndex = self->_endIndex;
  if (startIndex < endIndex)
  {
    v8 = 0x1F043A000uLL;
    do
    {
      buffer = self->_buffer;
      v10 = buffer[startIndex];
      if ((v10 - 65) < 0x1A)
        return;
      if ((v10 - 97) <= 0x19)
      {
        v11 = self->_altBuffer[startIndex];
        if (v11 >= 0x61 && v11 <= 0x7A)
        {
          LOBYTE(v2) = self->_altBufferScores[startIndex];
          v12 = (double)*(unint64_t *)&v2 / 100.0;
          v2 = *(double *)((char *)&self->super.super.isa + *(int *)(v8 + 1900));
          if (v12 <= v2)
          {
            v44 = 0;
            v45 = 0;
            v43 = 0;
            v42 = 0;
            v41 = v11;
            buffer[startIndex] = v11;
            if (findPinyin((unsigned __int8 *)&self->_buffer[v36], self->_endIndex - v36, self->_romanization, 0, 0, 0, 0, &v45, &v44, 0, &v43, &v42, 0, 0, 0, 0, 0, self->_syllableLengthArray)&& v44 + v36 == self->_endIndex
              && (!v42 || startIndex < v45 + v36))
            {
              if (v43)
              {
                v13 = 0;
                v14 = 0;
                v15 = 0;
                syllableLengthArray = self->_syllableLengthArray;
                v17 = v36;
                while (startIndex < v17)
                {
                  v18 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v42)
                    goto LABEL_29;
LABEL_30:
                  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v17 += syllableLengthArray[v15++];
                    if (v15 < v43)
                      continue;
                  }
                  goto LABEL_34;
                }
                v19 = syllableLengthArray[v15];
                if (startIndex >= v19 + v17)
                  v18 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v18 = v17;
                if (startIndex < v19 + v17)
                  v14 = syllableLengthArray[v15];
                if (!v42)
                  goto LABEL_30;
LABEL_29:
                v13 |= v43 - 1 == v15;
                goto LABEL_30;
              }
              v14 = 0;
              v13 = 0;
              v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
              v35 = v13;
              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              modifications = self->_modifications;
              v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v38;
LABEL_36:
                v24 = 0;
                while (1)
                {
                  if (*(_QWORD *)v38 != v23)
                    objc_enumerationMutation(modifications);
                  v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v24);
                  if (objc_msgSend(v25, "modificationType") == 1
                    && startIndex == objc_msgSend(v25, "range")
                    && v26 == 1)
                  {
                    v28 = objc_msgSend((id)objc_msgSend(v25, "replacementString"), "characterAtIndex:", 0);
                    if (v28 == v41 && v18 == objc_msgSend(v25, "syllableRange") && v14 == v29)
                      break;
                  }
                  if (v22 == ++v24)
                  {
                    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
                    if (v22)
                      goto LABEL_36;
                    goto LABEL_52;
                  }
                }
              }
              else
              {
LABEL_52:
                if (v14)
                {
                  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v41, 1);
                  v32 = [PRPinyinModification alloc];
                  LOWORD(v34) = v35 & 1;
                  v33 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](v32, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", startIndex, 1, v31, 1, v18, v14, v12, v43, &self->_buffer[v18], v34);
                  -[NSMutableArray addObject:](self->_modifications, "addObject:", v33);
                  -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v33);

                }
              }
            }
            self->_buffer[startIndex] = v10;
            endIndex = self->_endIndex;
            v8 = 0x1F043A000;
          }
        }
      }
      ++startIndex;
    }
    while (startIndex < endIndex);
  }
}

- (void)_addInsertions
{
  unint64_t startIndex;
  int v4;
  unint64_t length;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *syllableLengthArray;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSMutableArray *modifications;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v27;
  void *v28;
  PRPinyinModification *v29;
  PRPinyinModification *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unsigned int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unsigned __int16 v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  if (startIndex >= self->_endIndex)
    return;
  do
  {
    v4 = self->_buffer[startIndex];
    if ((v4 - 65) < 0x1A)
      return;
    if ((v4 - 97) >= 0x1A)
    {
      v8 = startIndex + 1;
      goto LABEL_49;
    }
    length = self->_length;
    if (length + 1 > startIndex)
    {
      do
        self->_buffer[length + 1] = self->_buffer[length];
      while (length-- > startIndex);
    }
    v7 = 0;
    v36 = v4 - 97;
    v34 = startIndex;
    v8 = startIndex + 1;
    do
    {
      v9 = insertionFollowers[6 * v36 + v7];
      if ((_BYTE)v9)
      {
        v44 = 0;
        v45 = 0;
        v43 = 0;
        v42 = 0;
        v41 = v9;
        self->_buffer[v8] = v9;
        if (findPinyin((unsigned __int8 *)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0] + 1, self->_romanization, 0, 0, 0, 0, &v45, &v44, 0, &v43, &v42, 0, 0, 0, 0, 0, self->_syllableLengthArray))
        {
          v10 = self->_lastIndexes[0];
          if (v44 + v10 == self->_endIndex + 1 && (!v42 || v8 < v45 + v10))
          {
            if (v43)
            {
              v11 = 0;
              v12 = 0;
              v13 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (v8 < v10)
              {
                v15 = 0x7FFFFFFFFFFFFFFFLL;
                if (v42)
                  goto LABEL_23;
LABEL_24:
                if (v15 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v10 += syllableLengthArray[v13++];
                  if (v13 < v43)
                    continue;
                }
                goto LABEL_28;
              }
              v16 = syllableLengthArray[v13];
              v17 = v16 + v10;
              v18 = v16 - 1;
              if (v8 >= v17)
                v15 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v15 = v10;
              if (v8 < v17)
                v12 = v18;
              if (!v42)
                goto LABEL_24;
LABEL_23:
              v11 |= v43 - 1 == v13;
              goto LABEL_24;
            }
            v12 = 0;
            v11 = 0;
            v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_28:
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v35 = v12;
            modifications = self->_modifications;
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v38;
LABEL_30:
              v23 = 0;
              while (1)
              {
                if (*(_QWORD *)v38 != v22)
                  objc_enumerationMutation(modifications);
                v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
                if (objc_msgSend(v24, "modificationType") == 3 && v8 == objc_msgSend(v24, "range") && v25 == 0)
                {
                  v27 = objc_msgSend((id)objc_msgSend(v24, "replacementString"), "characterAtIndex:", 0);
                  if (v27 == v41)
                    break;
                }
                if (v21 == ++v23)
                {
                  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
                  if (v21)
                    goto LABEL_30;
                  goto LABEL_42;
                }
              }
            }
            else
            {
LABEL_42:
              if (v35)
              {
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v41, 1);
                v29 = [PRPinyinModification alloc];
                LOBYTE(v33) = v11 & 1;
                v30 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v29, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v8, 0, v28, 3, v15, v35, 1.0, v43, &self->_buffer[v15], v33);
                -[NSMutableArray addObject:](self->_modifications, "addObject:", v30);
                -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v30);

              }
            }
          }
        }
      }
      ++v7;
    }
    while (v7 != 6);
    v31 = v34;
    if (v34 < self->_length)
    {
      do
      {
        self->_buffer[v31 + 1] = self->_buffer[v31 + 2];
        v32 = v31 + 2;
        ++v31;
      }
      while (v32 <= self->_length);
    }
LABEL_49:
    startIndex = v8;
  }
  while (v8 < self->_endIndex);
}

- (void)_addDeletions
{
  unint64_t startIndex;
  unint64_t v3;
  unint64_t endIndex;
  unint64_t v6;
  unint64_t v7;
  char *buffer;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t *syllableLengthArray;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  PRPinyinModification *v45;
  PRPinyinModification *v46;
  unint64_t i;
  uint64_t v48;
  char v49;
  unint64_t v50;
  NSMutableArray *obj;
  unint64_t v52;
  unint64_t v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  v3 = startIndex + 2;
  endIndex = self->_endIndex;
  if (startIndex + 2 < endIndex)
  {
    v6 = startIndex + 1;
    while (1)
    {
      v7 = v6;
      v6 = v3;
      buffer = self->_buffer;
      v9 = buffer[v7];
      if ((v9 - 65) < 0x1A)
        return;
      v10 = buffer[v7 - 1];
      if ((v10 - 65) < 0x1A)
        return;
      v11 = buffer[v6];
      if ((v11 - 65) < 0x1A)
        return;
      if ((v9 - 97) <= 0x19)
      {
        if (v9 == v10 || self->_abbreviatedSyllableCount == 0)
          break;
        v13 = v9 - 97;
        v14 = adjacentMatchesChinese[6 * (v9 - 97)];
        if (v14 == v10)
          break;
        v15 = adjacentMatchesChinese[6 * v13 + 1];
        if (v15 == v10)
          break;
        v16 = adjacentMatchesChinese[6 * v13 + 2];
        if (v16 == v10)
          break;
        v17 = adjacentMatchesChinese[6 * v13 + 3];
        if (v17 == v10)
          break;
        v18 = adjacentMatchesChinese[6 * v13 + 4];
        if (v18 == v10)
          break;
        v19 = adjacentMatchesChinese[6 * v13 + 5];
        v20 = v19 == v10 || v9 == v11;
        v21 = v20 || v14 == v11;
        v22 = v21 || v15 == v11;
        v23 = v22 || v16 == v11;
        v24 = v23 || v17 == v11;
        v25 = v24 || v18 == v11;
        if (v25 || v19 == v11)
          break;
      }
LABEL_86:
      v3 = v6 + 1;
      ++startIndex;
      if (v6 + 1 >= endIndex)
        return;
    }
    v54 = buffer[v7 - 1];
    v53 = v6;
    v61 = 0;
    v62 = 0;
    v60 = 0;
    v59 = 0;
    if (v7 < self->_length)
    {
      v27 = startIndex;
      do
      {
        self->_buffer[v27 + 1] = self->_buffer[v27 + 2];
        v28 = v27 + 2;
        ++v27;
      }
      while (v28 < self->_length);
      buffer = self->_buffer;
      endIndex = self->_endIndex;
    }
    v52 = startIndex;
    if (findPinyin((unsigned __int8 *)&buffer[self->_lastIndexes[0]], endIndex + ~self->_lastIndexes[0], self->_romanization, 0, 0, 0, 0, &v62, &v61, 0, &v60, &v59, 0, 0, 0, 0, 0, self->_syllableLengthArray))
    {
      v29 = self->_lastIndexes[0];
      if (v61 + v29 == self->_endIndex - 1 && (!v59 || v53 <= v62 + v29))
      {
        if (v60)
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          syllableLengthArray = self->_syllableLengthArray;
          while (v7 < v29)
          {
            v34 = 0x7FFFFFFFFFFFFFFFLL;
            if (v59)
              goto LABEL_58;
LABEL_59:
            if (v34 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v29 += syllableLengthArray[v32++];
              if (v32 < v60)
                continue;
            }
            goto LABEL_63;
          }
          v35 = syllableLengthArray[v32];
          if (v7 >= v35 + v29)
            v34 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v34 = v29;
          if (v7 < v35 + v29)
            v31 = v35 + 1;
          if (!v59)
            goto LABEL_59;
LABEL_58:
          v30 |= v60 - 1 == v32;
          goto LABEL_59;
        }
        v31 = 0;
        v30 = 0;
        v34 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_63:
        v49 = v30;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v50 = v31;
        obj = self->_modifications;
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v56;
LABEL_65:
          v39 = 0;
          while (1)
          {
            if (*(_QWORD *)v56 != v38)
              objc_enumerationMutation(obj);
            v40 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v39);
            if (objc_msgSend(v40, "modificationType") == 4)
            {
              v41 = objc_msgSend(v40, "range");
              if (v7 == v41 && v42 == 1)
                break;
              if (v9 == v54 && v42 == 1 && v41 + 1 == v7)
                break;
            }
            if (v37 == ++v39)
            {
              v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              if (v37)
                goto LABEL_65;
              goto LABEL_80;
            }
          }
        }
        else
        {
LABEL_80:
          if (v50 >= 3)
          {
            v45 = [PRPinyinModification alloc];
            LOBYTE(v48) = v49 & 1;
            v46 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v45, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 1, &stru_1EA8D8440, 4, v34, v50, 1.0, v60, &self->_buffer[v34], v48);
            -[NSMutableArray addObject:](self->_modifications, "addObject:", v46);
            -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v46);

          }
        }
      }
    }
    for (i = self->_length; --i > v7; self->_buffer[i] = self->_buffer[i - 1])
      ;
    self->_buffer[v7] = v9;
    v6 = v53;
    endIndex = self->_endIndex;
    startIndex = v52;
    goto LABEL_86;
  }
}

- (void)_filterModifications
{
  PRPinyinContext *v2;
  uint64_t v3;
  NSMutableArray *addedModifications;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *modifications;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  BOOL v39;
  unint64_t v42;
  BOOL v43;
  _BOOL4 v44;
  NSMutableArray *removedModifications;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSMutableArray *addedRemovedModifications;
  uint64_t v59;
  PRPinyinContext *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v2 = self;
  v88 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_addedModifications, "count");
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  addedModifications = v2->_addedModifications;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addedModifications, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v81 != v8)
          objc_enumerationMutation(addedModifications);
        v10 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "syllableCountScore");
        v12 = objc_msgSend(v10, "modificationType");
        if (v7 - 1 >= v11 && v12 != 5)
          v7 = v11;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addedModifications, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    }
    while (v6);
    if (v7)
      v14 = v3 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      v15 = v3 - 1;
      do
      {
        v16 = (void *)-[NSMutableArray objectAtIndex:](v2->_addedModifications, "objectAtIndex:", v15);
        v17 = objc_msgSend(v16, "syllableCountScore");
        if (objc_msgSend(v16, "modificationType") != 5 && v17 > v7)
        {
          -[NSMutableArray removeObjectIdenticalTo:](v2->_modifications, "removeObjectIdenticalTo:", v16);
          -[NSMutableArray removeObjectAtIndex:](v2->_addedModifications, "removeObjectAtIndex:", v15);
        }
        --v15;
      }
      while (v15 != -1);
    }
  }
  v19 = -[NSMutableArray count](v2->_modifications, "count");
  if (v19)
  {
    v20 = v19;
    v60 = v2;
    do
    {
      while (1)
      {
        v61 = v20 - 1;
        v21 = (void *)-[NSMutableArray objectAtIndex:](v2->_modifications, "objectAtIndex:", v20 - 1);
        v22 = objc_msgSend(v21, "modificationType");
        v66 = objc_msgSend(v21, "range");
        v62 = v23;
        v65 = objc_msgSend(v21, "combinedSyllableRange");
        v25 = v24;
        v67 = objc_msgSend(v21, "syllableCountScore");
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        modifications = v2->_modifications;
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v77;
          v63 = v66 + v62;
          v64 = v65 + v25;
          while (2)
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v77 != v29)
                objc_enumerationMutation(modifications);
              v31 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
              if (v31 != v21)
              {
                v32 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "modificationType");
                v33 = objc_msgSend(v31, "combinedSyllableRange");
                v35 = v34;
                v36 = objc_msgSend(v31, "syllableCountScore");
                if (v22 == 5 || (v32 != 5 ? (v37 = v36 >= v67) : (v37 = 1), v37))
                {
                  if (v22 != 5 && (v32 == 5 ? (v39 = v66 >= v33) : (v39 = 0), v39))
                  {
                    if (v35 >= 3 && v63 <= v33 + v35)
                    {
LABEL_92:
                      v2 = v60;
                      v56 = -[NSMutableArray indexOfObjectIdenticalTo:](v60->_addedModifications, "indexOfObjectIdenticalTo:", v21);
                      if (v56 == 0x7FFFFFFFFFFFFFFFLL)
                        -[NSMutableArray addObject:](v60->_removedModifications, "addObject:", v21);
                      else
                        -[NSMutableArray removeObjectAtIndex:](v60->_addedModifications, "removeObjectAtIndex:", v56);
                      v20 = v61;
                      goto LABEL_102;
                    }
                  }
                  else if (v22 == 5 && v32 == 5 && v66 >= v33)
                  {
                    v42 = v33 + v35;
                    v43 = v62 >= 3 || v63 >= v42;
                    v44 = !v43;
                    if (v66 + v62 + 1 < v42 || v44)
                      goto LABEL_92;
                  }
                }
                else if (v65 < v33 + v35 && v64 > v33)
                {
                  goto LABEL_92;
                }
              }
            }
            v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
            if (v28)
              continue;
            break;
          }
        }
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v2 = v60;
        removedModifications = v60->_removedModifications;
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](removedModifications, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        v20 = v61;
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v73;
          while (2)
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v73 != v49)
                objc_enumerationMutation(removedModifications);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "isEqual:", v21))
              {
                v57 = -[NSMutableArray indexOfObjectIdenticalTo:](v60->_addedModifications, "indexOfObjectIdenticalTo:", v21);
                if (v57 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[NSMutableArray removeObjectAtIndex:](v60->_addedModifications, "removeObjectAtIndex:", v57);
                  addedRemovedModifications = v60->_addedRemovedModifications;
LABEL_100:
                  -[NSMutableArray addObject:](addedRemovedModifications, "addObject:", v21);
                }
                goto LABEL_102;
              }
            }
            v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](removedModifications, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            if (v48)
              continue;
            break;
          }
        }
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v51 = v60->_addedRemovedModifications;
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
        if (v52)
          break;
LABEL_90:
        if (!v61)
          return;
      }
      v53 = v52;
      v54 = *(_QWORD *)v69;
LABEL_84:
      v55 = 0;
      while (1)
      {
        if (*(_QWORD *)v69 != v54)
          objc_enumerationMutation(v51);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v55), "isEqual:", v21))
          break;
        if (v53 == ++v55)
        {
          v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
          if (v53)
            goto LABEL_84;
          goto LABEL_90;
        }
      }
      v59 = -[NSMutableArray indexOfObjectIdenticalTo:](v60->_addedModifications, "indexOfObjectIdenticalTo:", v21);
      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
      {
        addedRemovedModifications = v60->_removedModifications;
        goto LABEL_100;
      }
      -[NSMutableArray removeObjectAtIndex:](v60->_addedModifications, "removeObjectAtIndex:", v59);
LABEL_102:
      -[NSMutableArray removeObjectAtIndex:](v2->_modifications, "removeObjectAtIndex:", v20);
    }
    while (v20);
  }
}

- (void)_addPrefixes
{
  unint64_t length;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  PRPinyinModification *v11;
  unint64_t v12;
  char *buffer;
  PRPinyinModification *v14;
  BOOL v15;
  unint64_t v16;
  char *v17;
  PRPinyinModification *v18;
  unint64_t v19;
  char *v20;
  PRPinyinModification *v21;
  unint64_t v22;
  char *v23;
  PRPinyinModification *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  length = self->_length;
  if (length - 3 <= 0xB)
  {
    v4 = (void *)objc_msgSend((id)_sharedChecker, "englishStringsFromWordBuffer:length:connection:", self->_buffer);
    if (v4)
    {
      v5 = v4;
      if (objc_msgSend(v4, "count"))
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v26 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v10, "length");
              v11 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, self->_length, v10, 5, 0, self->_length, 1.0);
              -[NSMutableArray addObject:](self->_prefixes, "addObject:", v11);

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v7);
        }
      }
    }
    length = self->_length;
  }
  if (length == 2)
  {
    v12 = 0;
    do
    {
      buffer = self->_buffer;
      if (additionalTwoLetterWords[v12] == *buffer && additionalTwoLetterWords[v12 + 1] == buffer[1])
      {
        v14 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 2, (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, 2, 12), 5, 0, 2, 1.0);
        -[NSMutableArray addObject:](self->_prefixes, "addObject:", v14);

      }
      v15 = v12 >= 0x2E;
      v12 += 2;
    }
    while (!v15);
    v16 = 0;
    do
    {
      v17 = self->_buffer;
      if (additionalTwoLetterAcronyms[v16] == *v17 && additionalTwoLetterAcronyms[v16 + 1] == v17[1])
      {
        v18 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 2, objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, 2, 12), "uppercaseString"), 5, 0, 2, 1.0);
        -[NSMutableArray addObject:](self->_prefixes, "addObject:", v18);

      }
      v15 = v16 >= 8;
      v16 += 2;
    }
    while (!v15);
    length = self->_length;
  }
  if (length == 3)
  {
    v19 = 0;
    do
    {
      v20 = self->_buffer;
      if (additionalThreeLetterWords[v19] == *v20
        && additionalThreeLetterWords[v19 + 1] == v20[1]
        && additionalThreeLetterWords[v19 + 2] == v20[2])
      {
        v21 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 3, (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, 3, 12), 5, 0, 3, 1.0);
        -[NSMutableArray addObject:](self->_prefixes, "addObject:", v21);

      }
      v15 = v19 >= 0x12F;
      v19 += 3;
    }
    while (!v15);
    v22 = 0;
    do
    {
      v23 = self->_buffer;
      if (additionalThreeLetterAcronyms[v22] == *v23
        && additionalThreeLetterAcronyms[v22 + 1] == v23[1]
        && additionalThreeLetterAcronyms[v22 + 2] == v23[2])
      {
        v24 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, 3, objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, 3, 12), "uppercaseString"), 5, 0, 3, 1.0);
        -[NSMutableArray addObject:](self->_prefixes, "addObject:", v24);

      }
      v15 = v22 >= 0xC;
      v22 += 3;
    }
    while (!v15);
  }
}

- (void)_removePrefixes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t length;
  BOOL v9;
  unint64_t v10;

  v3 = -[NSMutableArray count](self->_prefixes, "count");
  if (v3)
  {
    v4 = v3 - 1;
    do
    {
      v5 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_prefixes, "objectAtIndex:", v4), "range");
      v7 = v5 + v6;
      length = self->_length;
      v9 = length >= v5 + v6;
      v10 = length - (v5 + v6);
      if (v10 != 0
        && v9
        && !next_pinyin((unsigned __int8 *)&self->_buffer[v7], v10, self->_romanization, 0, 0, 0)
        && !is_partial_pinyin((unsigned __int8 *)&self->_buffer[v7], self->_length - v7, self->_romanization, 0))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_prefixes, "removeObjectAtIndex:", v4);
      }
      --v4;
    }
    while (v4 != -1);
  }
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5
{
  unsigned int v6;
  unint64_t length;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float *v13;
  float v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  float v21;
  int v22;
  float v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t startingPoint;

  v6 = a3;
  -[NSMutableArray removeAllObjects](self->_addedModifications, "removeAllObjects", a3, a4);
  -[NSMutableArray removeAllObjects](self->_removedModifications, "removeAllObjects");
  length = self->_length;
  if (length <= 0xFE)
  {
    if (v6 >= 0x100)
      v9 = 127;
    else
      v9 = v6;
    self->_buffer[length] = v9;
    if (a5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = objc_msgSend(a5, "bytes");
      v11 = objc_msgSend(a5, "length");
      -[NSMutableArray addObject:](self->_geometryDataArray, "addObject:", a5);
      if (v11 >= 8)
      {
        v12 = v11 >> 3;
        v13 = (float *)(v10 + 4);
        v14 = -100.0;
        v15 = 1;
        do
        {
          if (*((unsigned __int16 *)v13 - 2) == v6)
          {
            v16 = v15 - 1;
            v14 = *v13;
          }
          else
          {
            v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v15 >= v12)
            break;
          v13 += 2;
          ++v15;
        }
        while (v16 == 0x7FFFFFFFFFFFFFFFLL);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = 0;
          v18 = v12 <= 1 ? 1 : v11 >> 3;
          v19 = (float *)(v10 + 4);
          v20 = 0x7FFFFFFFFFFFFFFFLL;
          v21 = -100.0;
          do
          {
            v22 = *((unsigned __int16 *)v19 - 2);
            if (v22 != v6 && (v22 - 1) <= 0xFE && *v19 > v21)
            {
              v20 = v17;
              v21 = *v19;
            }
            v19 += 2;
            ++v17;
          }
          while (v18 != v17);
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            self->_altBuffer[self->_length] = *(_BYTE *)(v10 + 8 * v20);
            v23 = v14 - v21;
            if (v23 <= 0.0)
            {
              LOBYTE(v24) = 0;
              goto LABEL_31;
            }
            if (v23 <= 2.5)
            {
              v24 = (int)(v23 * 100.0);
LABEL_31:
              self->_altBufferScores[self->_length] = v24;
              v25 = self->_length + 1;
              self->_length = v25;
              if (v6 != 39)
                self->_lengthBeforeApostrophes = v25;
              -[PRPinyinContext _removeModificationsAndMoveStartingPoint](self, "_removeModificationsAndMoveStartingPoint");
              -[PRPinyinContext _advanceIndexes](self, "_advanceIndexes");
              -[PRPinyinContext _addSpecialEnglishWords](self, "_addSpecialEnglishWords");
              if (self->_nextIndexes[0] >= self->_length)
              {
                if (self->_lastSyllableIsPartial)
                  -[PRPinyinContext _addEnglishWordsQuickly:](self, "_addEnglishWordsQuickly:", 1);
                -[PRPinyinContext _addValidSequenceReplacements](self, "_addValidSequenceReplacements");
                goto LABEL_50;
              }
              -[PRPinyinContext _addEnglishWordsQuickly:](self, "_addEnglishWordsQuickly:", 0);
              v26 = self->_length;
              startingPoint = self->_startingPoint;
              if (v26 - startingPoint >= 3)
              {
                -[PRPinyinContext _addTranspositions](self, "_addTranspositions");
                v26 = self->_length;
                startingPoint = self->_startingPoint;
                if (v26 - startingPoint > 3)
                  goto LABEL_42;
              }
              if (v26 != 3)
                goto LABEL_43;
              if (self->_abbreviatedSyllableCount)
              {
                v26 = 3;
              }
              else
              {
LABEL_42:
                -[PRPinyinContext _addReplacements](self, "_addReplacements");
                v26 = self->_length;
                startingPoint = self->_startingPoint;
              }
LABEL_43:
              if (self->_romanization != 1 && v26 + 1 <= 0xFE && v26 - startingPoint >= 4)
              {
                -[PRPinyinContext _addInsertions](self, "_addInsertions");
                v26 = self->_length;
                startingPoint = self->_startingPoint;
              }
              if (v26 - startingPoint >= 5)
                -[PRPinyinContext _addDeletions](self, "_addDeletions");
              -[PRPinyinContext _filterModifications](self, "_filterModifications");
              self->_previouslyAnalyzedLength = self->_lengthBeforeApostrophes;
LABEL_50:
              -[PRPinyinContext _removePrefixes](self, "_removePrefixes");
              -[PRPinyinContext _addPrefixes](self, "_addPrefixes");

              self->_guesses = 0;
              self->_completions = 0;

              self->_corrections = 0;
              return;
            }
LABEL_30:
            LOBYTE(v24) = -1;
            goto LABEL_31;
          }
        }
      }
    }
    else
    {
      -[NSMutableArray addObject:](self->_geometryDataArray, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
    }
    self->_altBuffer[self->_length] = 0;
    goto LABEL_30;
  }
}

- (void)removeNumberOfInputCharacters:(unint64_t)a3
{
  unint64_t length;
  unint64_t v4;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  length = self->_length;
  if (length >= a3)
    v4 = length - a3;
  else
    v4 = 0;
  if (a3 && length)
  {
    v7 = (unsigned __int8 *)malloc_type_calloc(0x100uLL, 1uLL, 0xD94633CCuLL);
    v8 = v7;
    if (length > a3)
    {
      v9 = 0;
      do
      {
        v7[v9] = self->_buffer[v9];
        ++v9;
      }
      while (v9 < v4);
    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_geometryDataArray);
    v10 = objc_msgSend(v14, "count");
    -[PRPinyinContext reset](self, "reset");
    if (length > a3)
    {
      v11 = 0;
      do
      {
        if (v11 >= v10)
          v12 = 0;
        else
          v12 = objc_msgSend(v14, "objectAtIndex:", v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        -[PRPinyinContext addInputCharacter:geometryModel:geometryData:](self, "addInputCharacter:geometryModel:geometryData:", v8[v11++], 0, v13);
      }
      while (v11 < v4);
    }
    free(v8);

  }
}

- (void)reset
{
  char *buffer;
  char *altBuffer;
  char *altBufferScores;

  buffer = self->_buffer;
  *(_OWORD *)buffer = 0u;
  *((_OWORD *)buffer + 1) = 0u;
  *((_OWORD *)buffer + 2) = 0u;
  *((_OWORD *)buffer + 3) = 0u;
  *((_OWORD *)buffer + 4) = 0u;
  *((_OWORD *)buffer + 5) = 0u;
  *((_OWORD *)buffer + 6) = 0u;
  *((_OWORD *)buffer + 7) = 0u;
  *((_OWORD *)buffer + 8) = 0u;
  *((_OWORD *)buffer + 9) = 0u;
  *((_OWORD *)buffer + 10) = 0u;
  *((_OWORD *)buffer + 11) = 0u;
  *((_OWORD *)buffer + 12) = 0u;
  *((_OWORD *)buffer + 13) = 0u;
  *((_OWORD *)buffer + 14) = 0u;
  *((_OWORD *)buffer + 15) = 0u;
  altBuffer = self->_altBuffer;
  *(_OWORD *)altBuffer = 0u;
  *((_OWORD *)altBuffer + 1) = 0u;
  *((_OWORD *)altBuffer + 2) = 0u;
  *((_OWORD *)altBuffer + 3) = 0u;
  *((_OWORD *)altBuffer + 4) = 0u;
  *((_OWORD *)altBuffer + 5) = 0u;
  *((_OWORD *)altBuffer + 6) = 0u;
  *((_OWORD *)altBuffer + 7) = 0u;
  *((_OWORD *)altBuffer + 8) = 0u;
  *((_OWORD *)altBuffer + 9) = 0u;
  *((_OWORD *)altBuffer + 10) = 0u;
  *((_OWORD *)altBuffer + 11) = 0u;
  *((_OWORD *)altBuffer + 12) = 0u;
  *((_OWORD *)altBuffer + 13) = 0u;
  *((_OWORD *)altBuffer + 14) = 0u;
  *((_OWORD *)altBuffer + 15) = 0u;
  altBufferScores = self->_altBufferScores;
  *(_OWORD *)altBufferScores = 0u;
  *((_OWORD *)altBufferScores + 1) = 0u;
  *((_OWORD *)altBufferScores + 2) = 0u;
  *((_OWORD *)altBufferScores + 3) = 0u;
  *((_OWORD *)altBufferScores + 4) = 0u;
  *((_OWORD *)altBufferScores + 5) = 0u;
  *((_OWORD *)altBufferScores + 6) = 0u;
  *((_OWORD *)altBufferScores + 7) = 0u;
  *((_OWORD *)altBufferScores + 8) = 0u;
  *((_OWORD *)altBufferScores + 9) = 0u;
  *((_OWORD *)altBufferScores + 10) = 0u;
  *((_OWORD *)altBufferScores + 11) = 0u;
  *((_OWORD *)altBufferScores + 12) = 0u;
  *((_OWORD *)altBufferScores + 13) = 0u;
  *((_OWORD *)altBufferScores + 14) = 0u;
  *((_OWORD *)altBufferScores + 15) = 0u;
  -[NSMutableArray removeAllObjects](self->_addedModifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_removedModifications, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_removedModifications, "addObjectsFromArray:", self->_modifications);
  -[NSMutableArray removeAllObjects](self->_modifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_prefixes, "removeAllObjects");

  self->_guesses = 0;
  self->_completions = 0;

  self->_corrections = 0;
  -[NSMutableArray removeAllObjects](self->_geometryDataArray, "removeAllObjects");
  self->_previouslyAnalyzedLength = 0;
  self->_abbreviatedSyllableCount = 0;
  self->_endIndex = 0;
  self->_startIndex = 0;
  self->_nextIndexes[0] = 0;
  self->_nextIndexes[1] = 0;
  *(_OWORD *)self->_lastIndexes = 0u;
  *(_OWORD *)&self->_lastIndexes[2] = 0u;
  self->_startingPoint = 0;
  self->_lengthBeforeApostrophes = 0;
  self->_length = 0;
  self->_lastSyllableIsPartial = 0;
}

- (id)currentModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_modifications, self->super._modificationMask, 0);
}

- (id)addedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_addedModifications, self->super._modificationMask, self->_length);
}

- (id)removedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_removedModifications, self->super._modificationMask, self->_length);
}

- (id)prefixes
{
  return self->_prefixes;
}

- (id)guesses
{
  id v3;
  void *v4;
  unint64_t length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PRPinyinModification *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_guesses)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, self->_length, 12);
    v4 = (void *)objc_msgSend((id)_sharedChecker, "spellServer:suggestGuessesForWordRange:inString:language:options:", 0, 0, objc_msgSend(v3, "length"), v3, CFSTR("en_CN"), 0);
    length = self->_length;
    self->_guesses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), 5, 0, length, 1.0);
          -[NSMutableArray addObject:](self->_guesses, "addObject:", v10);

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return self->_guesses;
}

- (id)completions
{
  id v3;
  void *v4;
  unint64_t length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PRPinyinModification *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_completions)
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, self->_length, 12);
    v4 = (void *)objc_msgSend((id)_sharedChecker, "languageModelCompletionsForPartialWord:languageObject:sender:appIdentifier:", v3, +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", CFSTR("en_CN")), 0, 0);
    length = self->_length;
    self->_completions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), 5, 0, length, 1.0);
          -[NSMutableArray addObject:](self->_completions, "addObject:", v10);

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return self->_completions;
}

- (id)correction
{
  NSMutableArray *corrections;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t length;
  PRPinyinModification *v9;
  PRPinyinModification *v10;
  uint64_t v12;

  corrections = self->_corrections;
  if (!corrections)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_buffer, self->_length, 12);
    v12 = 0;
    v5 = objc_msgSend((id)_sharedChecker, "spellServer:findMisspelledWordInString:language:wordCount:countOnly:correction:", 0, v4, CFSTR("en_CN"), 0, 0, &v12);
    v7 = v6;
    length = self->_length;
    self->_corrections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v12 && !v5 && v7 == objc_msgSend(v4, "length"))
    {
      v9 = [PRPinyinModification alloc];
      v10 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:](v9, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:", 0, length, v12, 5, 0, length, 1.0);
      -[NSMutableArray addObject:](self->_corrections, "addObject:", v10);

    }
    corrections = self->_corrections;
  }
  return (id)-[NSMutableArray firstObject](corrections, "firstObject");
}

@end
