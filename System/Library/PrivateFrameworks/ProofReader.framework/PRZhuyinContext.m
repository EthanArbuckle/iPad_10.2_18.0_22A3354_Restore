@implementation PRZhuyinContext

- (PRZhuyinContext)init
{
  PRZhuyinContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRZhuyinContext;
  v2 = -[PRZhuyinContext init](&v4, sel_init);
  v2->_modifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_addedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_removedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_addedRemovedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_prefixes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_buffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x4C073188uLL);
  v2->_syllableLengthArray = (unint64_t *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  -[PRZhuyinContext reset](v2, "reset");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_buffer);
  free(self->_syllableLengthArray);
  v3.receiver = self;
  v3.super_class = (Class)PRZhuyinContext;
  -[PRZhuyinContext dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\nmodifications:  %@\nprefixes:  %@"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_buffer), self->_modifications, self->_prefixes);
}

- (void)_removeModificationsAndMoveStartingPoint
{
  uint64_t v3;
  unint64_t startingPoint;
  unint64_t length;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  size_t v24;
  const char *v25;
  _BOOL4 v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = -[NSMutableArray count](self->_modifications, "count");
  startingPoint = self->_startingPoint;
  v30 = 0;
  length = self->_length;
  v6 = 0x1F043A000uLL;
  if (length <= startingPoint)
  {
    v26 = 0;
  }
  else
  {
    v26 = 0;
    if (findZhuyin((unint64_t)&self->_buffer[startingPoint], length - startingPoint, 0, 1, 0, 0, 0, 0, &v30, 0, 0, 0))v26 = v30 + self->_startingPoint == self->_length;
  }
  if (v3)
  {
    v7 = 0;
    v8 = v3 - 1;
    while (1)
    {
      v9 = (void *)-[NSMutableArray objectAtIndex:](self->_modifications, "objectAtIndex:", v8);
      v10 = objc_msgSend(v9, "syllableRange");
      v12 = v10 + v11;
      if (self->_startingPoint >= v10 + v11)
        goto LABEL_23;
      v13 = self->_length;
      if (v13 <= v12)
        goto LABEL_23;
      v14 = v10;
      v29 = 0;
      v15 = *(int *)(v6 + 1732);
      v16 = next_zhuyin(*(unsigned __int8 **)((char *)&self->super.super.isa + v15) + v12, v13 - v12, 0, 1, &v29, 0);
      v27 = 0;
      v28 = 0;
      v17 = v16 ? v29 - (_QWORD)v16 : 0;
      if ((objc_msgSend(v9, "producesPartialSyllable") & 1) != 0 || v26 && self->_startingPoint <= v14)
        break;
      if (v17)
      {
        if (v17 == 1 && self->_length - v12 > 1)
          break;
      }
      else if (!is_partial_zhuyin(*(unsigned __int8 **)((char *)&self->super.super.isa + v15) + v12, self->_length - v12, 0))
      {
        break;
      }
      if (objc_msgSend(v9, "_shouldAppendLetter:", (*(unsigned __int8 **)((char *)&self->super.super.isa + v15))[v12]))break;
      if (v17 >= 2)
      {
        if (findZhuyin(*(unint64_t *)((char *)&self->super.super.isa + v15) + v12, self->_length - v12, 0, 1, 0, 0, 0, 0, &v28, &v27, 0, self->_syllableLengthArray))
        {
          v18 = v28;
          v19 = self->_length;
          if (v28 + v12 < v19)
          {
            if (v27 > 1 || v19 - v12 >= 8 && v27 == 1)
            {
LABEL_31:
              v6 = 0x1F043A000;
              if (v18 > v7 || v7 && v18 == v7 && v12 < startingPoint)
              {
                startingPoint = v12;
                v7 = v18;
              }
              goto LABEL_23;
            }
            v20 = *self->_syllableLengthArray;
            if (v20 == 3)
            {
              v25 = *(char **)((char *)&self->super.super.isa + v15) + v12;
              if (!strncmp(v25, "dei", 3uLL))
                goto LABEL_31;
              v22 = v25;
              v23 = "gei";
              v24 = 3;
LABEL_44:
              if (!strncmp(v22, v23, v24))
                goto LABEL_31;
              goto LABEL_22;
            }
            if (v20 == 2)
            {
              v21 = *(char **)((char *)&self->super.super.isa + v15) + v12;
              if (!strncmp(v21, "de", 2uLL) || !strncmp(v21, "ge", 2uLL))
                goto LABEL_31;
              v22 = v21;
              v23 = "he";
              v24 = 2;
              goto LABEL_44;
            }
          }
        }
      }
LABEL_22:
      v6 = 0x1F043A000;
LABEL_23:
      if (--v8 == -1)
        goto LABEL_46;
    }
    -[NSMutableArray addObject:](self->_removedModifications, "addObject:", v9);
    -[NSMutableArray removeObjectAtIndex:](self->_modifications, "removeObjectAtIndex:", v8);
    goto LABEL_22;
  }
LABEL_46:
  self->_startingPoint = startingPoint;
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
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;

  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  nextIndexes = self->_nextIndexes;
  v4 = self->_nextIndexes[0];
  lastIndexes = self->_lastIndexes;
  v6 = self->_lastIndexes[0];
  v18 = 0;
  findZhuyin((unint64_t)&self->_buffer[self->_startingPoint], self->_length - self->_startingPoint, 1, 1, &v23, &v22, &v21, &v20, &v19, 0, &v18, 0);
  *lastIndexes = v20 + self->_startingPoint;
  lastIndexes[1] = (unint64_t)&v21[self->_startingPoint];
  lastIndexes[2] = (unint64_t)&v22[self->_startingPoint];
  lastIndexes[3] = (unint64_t)&v23[self->_startingPoint];
  *nextIndexes = v19 + self->_startingPoint;
  nextIndexes[1] = self->_startingPoint;
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
    self->_endIndex = length;
  self->_lastSyllableIsPartial = v18;
}

- (void)_addTranspositions
{
  unint64_t *lastIndexes;
  unint64_t startIndex;
  unint64_t v4;
  unint64_t endIndex;
  PRZhuyinContext *v6;
  unint64_t v7;
  char *buffer;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t *syllableLengthArray;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
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
  PRZhuyinModification *v41;
  uint64_t v42;
  unint64_t *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
    v6 = self;
    v43 = self->_lastIndexes;
    while (1)
    {
      v7 = startIndex;
      startIndex = v4;
      buffer = v6->_buffer;
      v9 = buffer[v7];
      if ((v9 - 49) >= 5)
      {
        v11 = 0;
        while (adjacentMatchesForLetters[v11] != (_DWORD)v9)
        {
          v11 += 7;
          if (v11 == 259)
          {
            v12 = 0;
            goto LABEL_14;
          }
        }
        v10 = &adjacentMatchesForLetters[v11];
      }
      else
      {
        v10 = (int *)((char *)&adjacentMatchesForTones + 28 * (v9 - 49));
      }
      v12 = v10 + 1;
LABEL_14:
      v13 = buffer[startIndex];
      if ((v13 - 49) >= 5)
      {
        v25 = 0;
        while (adjacentMatchesForLetters[v25] != (_DWORD)v13)
        {
          v25 += 7;
          if (v25 == 259)
            goto LABEL_80;
        }
      }
      if (!v12)
        goto LABEL_80;
      v58 = 0;
      v59 = 0;
      v57 = 0;
      v56 = 0;
      v55[0] = externalZhuyinFromInternal(v13);
      v55[1] = externalZhuyinFromInternal(v9);
      v6->_buffer[v7] = v13;
      v6->_buffer[startIndex] = v9;
      v50 = startIndex;
      if (v7 >= *lastIndexes)
      {
        if (findZhuyin((unint64_t)&v6->_buffer[*lastIndexes], v6->_endIndex - *lastIndexes, 0, 0, 0, 0, 0, &v59, &v58, &v57, &v56, v6->_syllableLengthArray))
        {
          v14 = *lastIndexes;
          if (v58 + *lastIndexes == v6->_endIndex)
          {
            v15 = v57;
            if (v57)
            {
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v19 = 0;
              syllableLengthArray = v6->_syllableLengthArray;
              v21 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                v22 = syllableLengthArray[v16];
                v23 = v22 + v14;
                if (v7 >= v14)
                {
                  if (startIndex < v23)
                  {
                    if (v56 && v57 - 1 == v16)
                      v18 = 1;
                    v17 = syllableLengthArray[v16];
                    v24 = v14;
                    goto LABEL_33;
                  }
                  if (v7 < v23)
                  {
                    v17 = syllableLengthArray[v16 + 1];
                    if (v56 && v57 - 2 == v16)
                      v18 = 1;
                    v21 = v14;
                    v19 = syllableLengthArray[v16];
                    v24 = v22 + v14;
                    goto LABEL_33;
                  }
                }
                v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_33:
                if (v24 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  ++v16;
                  v14 += v22;
                  if (v16 < v57)
                    continue;
                }
                goto LABEL_64;
              }
            }
            goto LABEL_63;
          }
        }
      }
      v26 = lastIndexes[1];
      if (v7 >= v26)
      {
        if (findZhuyin((unint64_t)&v6->_buffer[v26], v6->_endIndex - v26, 0, 0, 0, 0, 0, &v59, &v58, &v57, &v56, v6->_syllableLengthArray))
        {
          v27 = lastIndexes[1];
          if (v58 + v27 == v6->_length && (!v56 || v7 < v59 + v27))
            break;
        }
      }
      v46 = 0;
      v47 = 0;
      v44 = 0;
      v49 = 0;
      v45 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      modifications = v6->_modifications;
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
          if (objc_msgSend(v37, "modificationType") == 2 && v7 == objc_msgSend(v37, "range") && v38 == 2)
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
        if (v49)
        {
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v55, 2);
          LOBYTE(v42) = v44;
          v41 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:]([PRZhuyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 2, v40, 2, v24, v49, 0.0, v45, v46, v47, &self->_buffer[v24], v42);
          -[NSMutableArray addObject:](self->_modifications, "addObject:", v41);
          -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v41);

        }
      }
      v6 = self;
      self->_buffer[v7] = v9;
      startIndex = v50;
      self->_buffer[v50] = v13;
      lastIndexes = v43;
      endIndex = self->_endIndex;
LABEL_80:
      v4 = startIndex + 1;
      if (startIndex + 1 >= endIndex)
        return;
    }
    v15 = v57 - 1;
    if (!v57)
    {
LABEL_63:
      v18 = 0;
      v19 = 0;
      v17 = 0;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_64:
      v45 = v21;
      v46 = v19;
      v49 = v17;
      v47 = v15;
      v44 = v18 & 1;
      goto LABEL_65;
    }
    v28 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v29 = v6->_syllableLengthArray;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v30 = v29[v28];
      v31 = v30 + v27;
      if (v7 >= v27)
      {
        if (startIndex < v31)
        {
          if (v56 && v15 == v28)
            v18 = 1;
          v17 = v29[v28];
          v24 = v27;
          goto LABEL_59;
        }
        if (v7 < v31)
        {
          v17 = v29[v28 + 1];
          if (v56 && v57 - 2 == v28)
            v18 = 1;
          v21 = v27;
          v19 = v29[v28];
          v24 = v30 + v27;
          goto LABEL_59;
        }
      }
      v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_59:
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v28;
        v27 += v30;
        if (v28 < v57)
          continue;
      }
      goto LABEL_64;
    }
  }
}

- (void)_addReplacements
{
  unint64_t startIndex;
  unint64_t endIndex;
  int v4;
  int *v5;
  uint64_t i;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *syllableLengthArray;
  uint64_t v16;
  unint64_t v17;
  NSMutableArray *modifications;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v26;
  void *v27;
  PRZhuyinModification *v28;
  PRZhuyinModification *v29;
  uint64_t v30;
  int *v31;
  int v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned __int16 v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  endIndex = self->_endIndex;
  while (startIndex < endIndex)
  {
    v4 = self->_buffer[startIndex];
    if ((v4 - 49) < 5)
    {
      v5 = (int *)((char *)&adjacentMatchesForTones + 28 * (v4 - 49));
      goto LABEL_9;
    }
    for (i = 0; i != 259; i += 7)
    {
      if (adjacentMatchesForLetters[i] == v4)
      {
        v5 = &adjacentMatchesForLetters[i];
LABEL_9:
        v7 = v5 + 1;
        v8 = 0;
        v32 = self->_buffer[startIndex];
        v31 = v5 + 1;
LABEL_10:
        v9 = LOBYTE(v7[v8]);
        if (LOBYTE(v7[v8]))
          v10 = (_DWORD)v9 == v4;
        else
          v10 = 1;
        if (!v10)
        {
          v41 = 0;
          v42 = 0;
          v40 = 0;
          v39 = 0;
          v38 = 0;
          v38 = externalZhuyinFromInternal(v9);
          self->_buffer[startIndex] = v9;
          if (findZhuyin((unint64_t)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0], 0, 0, 0, 0, 0, &v42, &v41, &v40, &v39, self->_syllableLengthArray))
          {
            v11 = self->_lastIndexes[0];
            if (v41 + v11 == self->_endIndex)
            {
              if (v40)
              {
                v12 = 0;
                v13 = 0;
                v14 = 0;
                syllableLengthArray = self->_syllableLengthArray;
                while (startIndex < v11)
                {
                  v16 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v39)
                    goto LABEL_27;
LABEL_28:
                  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v11 += syllableLengthArray[v14++];
                    if (v14 < v40)
                      continue;
                  }
                  goto LABEL_32;
                }
                v17 = syllableLengthArray[v14];
                if (startIndex >= v17 + v11)
                  v16 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v16 = v11;
                if (startIndex < v17 + v11)
                  v13 = syllableLengthArray[v14];
                if (!v39)
                  goto LABEL_28;
LABEL_27:
                v12 |= v40 - 1 == v14;
                goto LABEL_28;
              }
              v13 = 0;
              v12 = 0;
              v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              modifications = self->_modifications;
              v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v35;
LABEL_34:
                v22 = 0;
                while (1)
                {
                  if (*(_QWORD *)v35 != v21)
                    objc_enumerationMutation(modifications);
                  v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
                  if (objc_msgSend(v23, "modificationType") == 1
                    && startIndex == objc_msgSend(v23, "range")
                    && v24 == 1)
                  {
                    v26 = objc_msgSend((id)objc_msgSend(v23, "replacementString"), "characterAtIndex:", 0);
                    if (v26 == v38)
                      break;
                  }
                  if (v20 == ++v22)
                  {
                    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                    if (v20)
                      goto LABEL_34;
                    goto LABEL_46;
                  }
                }
              }
              else
              {
LABEL_46:
                if (v13)
                {
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v38, 1);
                  v28 = [PRZhuyinModification alloc];
                  LOBYTE(v30) = v12 & 1;
                  v29 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v28, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", startIndex, 1, v27, 1, v16, v13, 0.0, v40, &self->_buffer[v16], v30);
                  -[NSMutableArray addObject:](self->_modifications, "addObject:", v29);
                  -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v29);

                }
              }
            }
          }
          v4 = v32;
          self->_buffer[startIndex] = v32;
          v7 = v31;
        }
        if (++v8 == 6)
        {
          endIndex = self->_endIndex;
          break;
        }
        goto LABEL_10;
      }
    }
    ++startIndex;
  }
}

- (void)_addInsertions
{
  unint64_t startIndex;
  int v4;
  unint64_t v5;
  void *v6;
  _DWORD *v7;
  unint64_t length;
  uint64_t v10;
  int v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *syllableLengthArray;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSMutableArray *modifications;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v29;
  void *v30;
  PRZhuyinModification *v31;
  PRZhuyinModification *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned __int16 v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  if (startIndex >= self->_endIndex)
    return;
  do
  {
    v4 = self->_buffer[startIndex];
    if ((v4 - 49) <= 4)
    {
      v5 = startIndex + 1;
      goto LABEL_55;
    }
    if (v4 == 154 || v4 == 158)
    {
      v7 = &insertionFollowersForLetter_insertionFollowers1;
LABEL_11:
      v38 = v7;
      goto LABEL_12;
    }
    v38 = &insertionFollowersForLetter_insertionFollowers1;
    if (v4 != 231)
    {
      v6 = memchr("bpmfdtnlgkhjqxzcs", v4, 0x12uLL);
      v7 = &insertionFollowersForLetter_insertionFollowers1;
      if (!v6)
        v7 = &insertionFollowersForLetter_insertionFollowers2;
      goto LABEL_11;
    }
LABEL_12:
    length = self->_length;
    if (length + 1 > startIndex)
    {
      do
        self->_buffer[length + 1] = self->_buffer[length];
      while (length-- > startIndex);
    }
    v10 = 0;
    v36 = startIndex;
    v5 = startIndex + 1;
    do
    {
      v11 = v38[v10];
      if ((_BYTE)v11)
      {
        v46 = 0;
        v47 = 0;
        v45 = 0;
        v44 = 0;
        v43 = 0;
        v43 = externalZhuyinFromInternal(v11);
        self->_buffer[v5] = v11;
        if (findZhuyin((unint64_t)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0] + 1, 0, 0, 0, 0, 0, &v47, &v46, &v45, &v44, self->_syllableLengthArray))
        {
          v12 = self->_lastIndexes[0];
          if (v46 + v12 == self->_endIndex + 1 && (!v44 || v5 < v47 + v12))
          {
            if (v45)
            {
              v13 = 0;
              v14 = 0;
              v15 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (v5 < v12)
              {
                v17 = 0x7FFFFFFFFFFFFFFFLL;
                if (v44)
                  goto LABEL_31;
LABEL_32:
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v12 += syllableLengthArray[v15++];
                  if (v15 < v45)
                    continue;
                }
                goto LABEL_36;
              }
              v18 = syllableLengthArray[v15];
              v19 = v18 + v12;
              v20 = v18 - 1;
              if (v5 >= v19)
                v17 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v17 = v12;
              if (v5 < v19)
                v14 = v20;
              if (!v44)
                goto LABEL_32;
LABEL_31:
              v13 |= v45 - 1 == v15;
              goto LABEL_32;
            }
            v14 = 0;
            v13 = 0;
            v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_36:
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v37 = v14;
            modifications = self->_modifications;
            v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v40;
LABEL_38:
              v25 = 0;
              while (1)
              {
                if (*(_QWORD *)v40 != v24)
                  objc_enumerationMutation(modifications);
                v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v25);
                if (objc_msgSend(v26, "modificationType") == 3 && v5 == objc_msgSend(v26, "range") && v27 == 0)
                {
                  v29 = objc_msgSend((id)objc_msgSend(v26, "replacementString"), "characterAtIndex:", 0);
                  if (v29 == v43)
                    break;
                }
                if (v23 == ++v25)
                {
                  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](modifications, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
                  if (v23)
                    goto LABEL_38;
                  goto LABEL_50;
                }
              }
            }
            else
            {
LABEL_50:
              if (v37)
              {
                v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v43, 1);
                v31 = [PRZhuyinModification alloc];
                LOBYTE(v35) = v13 & 1;
                v32 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v31, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v5, 0, v30, 3, v17, v37, 0.0, v45, &self->_buffer[v17], v35);
                -[NSMutableArray addObject:](self->_modifications, "addObject:", v32);
                -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v32);

              }
            }
          }
        }
      }
      ++v10;
    }
    while (v10 != 5);
    v33 = v36;
    if (v36 < self->_length)
    {
      do
      {
        self->_buffer[v33 + 1] = self->_buffer[v33 + 2];
        v34 = v33 + 2;
        ++v33;
      }
      while (v34 <= self->_length);
    }
LABEL_55:
    startIndex = v5;
  }
  while (v5 < self->_endIndex);
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
  unsigned int v12;
  int *v13;
  uint64_t v14;
  uint64_t i;
  int *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *syllableLengthArray;
  uint64_t v25;
  unint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  PRZhuyinModification *v39;
  PRZhuyinModification *v40;
  unint64_t j;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  NSMutableArray *obj;
  unint64_t v48;
  unint64_t v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  startIndex = self->_startIndex;
  v3 = startIndex + 2;
  endIndex = self->_endIndex;
  if (startIndex + 2 < endIndex)
  {
    v6 = startIndex + 1;
    do
    {
      v7 = v6;
      v6 = v3;
      buffer = self->_buffer;
      v9 = buffer[v7];
      v10 = buffer[v7 - 1];
      v11 = buffer[v6];
      v12 = v9 - 49;
      if ((v9 - 49) >= 5)
      {
        v14 = 0;
        while (adjacentMatchesForLetters[v14] != v9)
        {
          v14 += 7;
          if (v14 == 259)
            goto LABEL_77;
        }
        if (v9 == v10)
        {
LABEL_11:
          v49 = v6;
          v50 = 1;
          goto LABEL_22;
        }
        for (i = 0; i != 259; i += 7)
        {
          if (adjacentMatchesForLetters[i] == v9)
          {
            v13 = &adjacentMatchesForLetters[i];
            goto LABEL_17;
          }
        }
LABEL_20:
        if (v9 != v11)
        {
          if (v12 >= 5)
          {
            v28 = 0;
            while (adjacentMatchesForLetters[v28] != v9)
            {
              v28 += 7;
              if (v28 == 259)
                goto LABEL_77;
            }
            v27 = &adjacentMatchesForLetters[v28];
          }
          else
          {
            v27 = (int *)((char *)&adjacentMatchesForTones + 28 * v12);
          }
          v42 = v27 + 1;
          v43 = 0;
          while (v42[v43] != v11)
          {
            if (++v43 == 6)
              goto LABEL_77;
          }
        }
      }
      else
      {
        if (v9 == v10)
          goto LABEL_11;
        v13 = (int *)((char *)&adjacentMatchesForTones + 28 * v12);
LABEL_17:
        v16 = v13 + 1;
        v17 = 0;
        while (v16[v17] != v10)
        {
          if (++v17 == 6)
            goto LABEL_20;
        }
      }
      v49 = v6;
      v50 = 0;
LABEL_22:
      v57 = 0;
      v58 = 0;
      v56 = 0;
      v55 = 0;
      if (v7 < self->_length)
      {
        v18 = startIndex;
        do
        {
          self->_buffer[v18 + 1] = self->_buffer[v18 + 2];
          v19 = v18 + 2;
          ++v18;
        }
        while (v19 < self->_length);
        buffer = self->_buffer;
        endIndex = self->_endIndex;
      }
      v48 = startIndex;
      if (findZhuyin((unint64_t)&buffer[self->_lastIndexes[0]], endIndex + ~self->_lastIndexes[0], 0, 0, 0, 0, 0, &v58, &v57, &v56, &v55, self->_syllableLengthArray))
      {
        v20 = self->_lastIndexes[0];
        if (v57 + v20 == self->_endIndex - 1 && (!v55 || v49 <= v58 + v20))
        {
          if (v56)
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            syllableLengthArray = self->_syllableLengthArray;
            while (v7 < v20)
            {
              v25 = 0x7FFFFFFFFFFFFFFFLL;
              if (v55)
                goto LABEL_41;
LABEL_42:
              if (v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v20 += syllableLengthArray[v23++];
                if (v23 < v56)
                  continue;
              }
              goto LABEL_52;
            }
            v26 = syllableLengthArray[v23];
            if (v7 >= v26 + v20)
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v25 = v20;
            if (v7 < v26 + v20)
              v22 = v26 + 1;
            if (!v55)
              goto LABEL_42;
LABEL_41:
            v21 |= v56 - 1 == v23;
            goto LABEL_42;
          }
          v22 = 0;
          v21 = 0;
          v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:
          v45 = v21;
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v46 = v22;
          obj = self->_modifications;
          v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v52;
LABEL_54:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v52 != v31)
                objc_enumerationMutation(obj);
              v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v32);
              if (objc_msgSend(v33, "modificationType") == 4)
              {
                v34 = objc_msgSend(v33, "range");
                if (v7 == v34 && v35 == 1)
                  break;
                v37 = v35 == 1 ? v50 : 0;
                if (v37 == 1 && v34 + 1 == v7)
                  break;
              }
              if (v30 == ++v32)
              {
                v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                if (v30)
                  goto LABEL_54;
                goto LABEL_71;
              }
            }
          }
          else
          {
LABEL_71:
            if (v46 >= 2)
            {
              v39 = [PRZhuyinModification alloc];
              LOBYTE(v44) = v45 & 1;
              v40 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v39, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 1, &stru_1EA8D8440, 4, v25, v46, 0.0, v56, &self->_buffer[v25], v44);
              -[NSMutableArray addObject:](self->_modifications, "addObject:", v40);
              -[NSMutableArray addObject:](self->_addedModifications, "addObject:", v40);

            }
          }
        }
      }
      for (j = self->_length; --j > v7; self->_buffer[j] = self->_buffer[j - 1])
        ;
      self->_buffer[v7] = v9;
      startIndex = v48;
      endIndex = self->_endIndex;
      v6 = v49;
LABEL_77:
      v3 = v6 + 1;
      ++startIndex;
    }
    while (v6 + 1 < endIndex);
  }
}

- (void)_filterModifications
{
  PRZhuyinContext *v2;
  uint64_t v3;
  NSMutableArray *addedModifications;
  uint64_t v5;
  uint64_t v6;
  PRZhuyinContext *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  BOOL v33;
  NSMutableArray *removedModifications;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableArray *addedRemovedModifications;
  uint64_t v47;
  PRZhuyinContext *v48;
  uint64_t v49;
  NSMutableArray *obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v2 = self;
  v71 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_addedModifications, "count");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  addedModifications = v2->_addedModifications;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addedModifications, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v5)
  {
    v6 = v5;
    v7 = v2;
    v8 = 0;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(addedModifications);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "syllableCountScore");
        if (v8 - 1 >= v11)
          v8 = v11;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addedModifications, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v6);
    if (v8)
      v12 = v3 == 0;
    else
      v12 = 1;
    v2 = v7;
    if (!v12)
    {
      v13 = v3 - 1;
      do
      {
        v14 = (void *)-[NSMutableArray objectAtIndex:](v7->_addedModifications, "objectAtIndex:", v13);
        if (objc_msgSend(v14, "syllableCountScore") > v8)
        {
          -[NSMutableArray removeObjectIdenticalTo:](v7->_modifications, "removeObjectIdenticalTo:", v14);
          -[NSMutableArray removeObjectAtIndex:](v7->_addedModifications, "removeObjectAtIndex:", v13);
        }
        --v13;
      }
      while (v13 != -1);
    }
  }
  v15 = -[NSMutableArray count](v2->_modifications, "count");
  if (v15)
  {
    v16 = v15;
    v48 = v2;
    do
    {
      while (1)
      {
        v49 = v16 - 1;
        v17 = (void *)-[NSMutableArray objectAtIndex:](v2->_modifications, "objectAtIndex:", v16 - 1);
        objc_msgSend(v17, "modificationType");
        objc_msgSend(v17, "range");
        v18 = objc_msgSend(v17, "combinedSyllableRange");
        v20 = v19;
        v21 = objc_msgSend(v17, "syllableCountScore");
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        obj = v2->_modifications;
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v60;
          v25 = v18 + v20;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v60 != v24)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
              if (v27 != v17)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "modificationType");
                v28 = v17;
                v29 = objc_msgSend(v27, "combinedSyllableRange");
                v31 = v30;
                v32 = objc_msgSend(v27, "syllableCountScore") >= v21 || v18 >= v29 + v31;
                v33 = !v32 && v25 > v29;
                v17 = v28;
                if (v33)
                {
                  v2 = v48;
                  v44 = -[NSMutableArray indexOfObjectIdenticalTo:](v48->_addedModifications, "indexOfObjectIdenticalTo:", v28);
                  if (v44 == 0x7FFFFFFFFFFFFFFFLL)
                    -[NSMutableArray addObject:](v48->_removedModifications, "addObject:", v28);
                  else
                    -[NSMutableArray removeObjectAtIndex:](v48->_addedModifications, "removeObjectAtIndex:", v44);
                  v16 = v49;
                  goto LABEL_63;
                }
              }
            }
            v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            if (v23)
              continue;
            break;
          }
        }
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v2 = v48;
        removedModifications = v48->_removedModifications;
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](removedModifications, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        v16 = v49;
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v56;
          while (2)
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v56 != v37)
                objc_enumerationMutation(removedModifications);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "isEqual:", v17))
              {
                v45 = -[NSMutableArray indexOfObjectIdenticalTo:](v48->_addedModifications, "indexOfObjectIdenticalTo:", v17);
                if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[NSMutableArray removeObjectAtIndex:](v48->_addedModifications, "removeObjectAtIndex:", v45);
                  addedRemovedModifications = v48->_addedRemovedModifications;
LABEL_61:
                  -[NSMutableArray addObject:](addedRemovedModifications, "addObject:", v17);
                }
                goto LABEL_63;
              }
            }
            v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](removedModifications, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
            if (v36)
              continue;
            break;
          }
        }
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v39 = v48->_addedRemovedModifications;
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        if (v40)
          break;
LABEL_51:
        if (!v49)
          return;
      }
      v41 = v40;
      v42 = *(_QWORD *)v52;
LABEL_45:
      v43 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v42)
          objc_enumerationMutation(v39);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v43), "isEqual:", v17))
          break;
        if (v41 == ++v43)
        {
          v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          if (v41)
            goto LABEL_45;
          goto LABEL_51;
        }
      }
      v47 = -[NSMutableArray indexOfObjectIdenticalTo:](v48->_addedModifications, "indexOfObjectIdenticalTo:", v17);
      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        addedRemovedModifications = v48->_removedModifications;
        goto LABEL_61;
      }
      -[NSMutableArray removeObjectAtIndex:](v48->_addedModifications, "removeObjectAtIndex:", v47);
LABEL_63:
      -[NSMutableArray removeObjectAtIndex:](v2->_modifications, "removeObjectAtIndex:", v16);
    }
    while (v16);
  }
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5
{
  unsigned int v5;
  char v7;
  char *buffer;
  unint64_t length;
  unint64_t v10;

  v5 = a3;
  -[NSMutableArray removeAllObjects](self->_addedModifications, "removeAllObjects", a3, a4, a5);
  -[NSMutableArray removeAllObjects](self->_removedModifications, "removeAllObjects");
  if (self->_length <= 0xFE)
  {
    v7 = internalFromExternalZhuyin(v5);
    buffer = self->_buffer;
    length = self->_length;
    self->_length = length + 1;
    buffer[length] = v7;
    if (v5 != 39)
      self->_lengthBeforeApostrophes = self->_length;
    -[PRZhuyinContext _removeModificationsAndMoveStartingPoint](self, "_removeModificationsAndMoveStartingPoint");
    -[PRZhuyinContext _advanceIndexes](self, "_advanceIndexes");
    v10 = self->_length;
    if (self->_nextIndexes[0] < v10)
    {
      if (v10 - self->_startingPoint >= 2)
      {
        -[PRZhuyinContext _addTranspositions](self, "_addTranspositions");
        if (self->_length - self->_startingPoint >= 2)
        {
          -[PRZhuyinContext _addReplacements](self, "_addReplacements");
          if (self->_length - self->_startingPoint >= 4)
            -[PRZhuyinContext _addDeletions](self, "_addDeletions");
        }
      }
      -[PRZhuyinContext _filterModifications](self, "_filterModifications");
    }
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

  length = self->_length;
  if (length >= a3)
    v4 = length - a3;
  else
    v4 = 0;
  if (a3 && length)
  {
    v7 = (unsigned __int8 *)malloc_type_calloc(0x100uLL, 1uLL, 0xB13B2EFuLL);
    v8 = v7;
    if (length <= a3)
    {
      -[PRZhuyinContext reset](self, "reset");
    }
    else
    {
      v9 = 0;
      do
      {
        v7[v9] = self->_buffer[v9];
        ++v9;
      }
      while (v9 < v4);
      -[PRZhuyinContext reset](self, "reset");
      v10 = 0;
      do
        -[PRZhuyinContext addInputCharacter:geometryModel:geometryData:](self, "addInputCharacter:geometryModel:geometryData:", v8[v10++], 0, 0);
      while (v10 < v4);
    }
    free(v8);
  }
}

- (void)reset
{
  char *buffer;

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
  -[NSMutableArray removeAllObjects](self->_addedModifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_removedModifications, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_removedModifications, "addObjectsFromArray:", self->_modifications);
  -[NSMutableArray removeAllObjects](self->_modifications, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_prefixes, "removeAllObjects");
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

@end
