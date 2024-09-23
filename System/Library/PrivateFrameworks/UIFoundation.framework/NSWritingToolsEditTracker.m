@implementation NSWritingToolsEditTracker

- (NSWritingToolsEditTracker)initWithContextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSWritingToolsEditTracker *v5;
  NSWritingToolsEditTracker *v6;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)NSWritingToolsEditTracker;
  v5 = -[NSWritingToolsEditTracker init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_currentContextRange.location = location;
    v5->_currentContextRange.length = length;
    v5->_contextRange.location = location;
    v5->_contextRange.length = length;
    v5->_capacity = 64;
    v5->_edits = (NSWritingToolsEdit *)malloc_type_calloc(0x20uLL, 0x40uLL, 0xA6A27410uLL);
    v6->_count = 0;
    v6->_uuidToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (NSWritingToolsEditTracker)init
{
  return -[NSWritingToolsEditTracker initWithContextRange:](self, "initWithContextRange:", 0, -1);
}

- (void)dealloc
{
  NSWritingToolsEdit *edits;
  objc_super v4;

  edits = self->_edits;
  if (edits)
  {
    free(edits);
    self->_edits = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NSWritingToolsEditTracker;
  -[NSWritingToolsEditTracker dealloc](&v4, sel_dealloc);
}

- (uint64_t)_addRange:(NSUInteger)a3 delta:(uint64_t)a4 uuid:(uint64_t)a5
{
  uint64_t v6;
  uint64_t v9;
  NSRange v10;
  NSUInteger length;
  NSUInteger v12;
  NSRange v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger *v22;
  uint64_t v23;
  NSRange v24;
  NSRange v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;

  if (result)
  {
    v6 = a4;
    v9 = result;
    if (a4 <= 0 && a2 + a3 < -a4)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__addRange_delta_uuid_, result, CFSTR("NSWritingToolsEditTracker.m"), 82, CFSTR("delta exceeds range length"));
    result = objc_msgSend(*(id *)(v9 + 16), "objectForKeyedSubscript:", a5);
    if (!result)
    {
      v10.location = *(_QWORD *)(v9 + 40);
      if (a3)
      {
        v10.length = *(_QWORD *)(v9 + 48);
        v24.location = a2;
        v24.length = a3;
        length = NSIntersectionRange(v24, v10).length;
        v27.length = *(_QWORD *)(v9 + 40);
        v25.location = a2;
        v25.length = a3;
        v27.location = 0;
        v12 = NSIntersectionRange(v25, v27).length;
        v28.location = *(_QWORD *)(v9 + 48) + *(_QWORD *)(v9 + 40);
        v28.length = ~v28.location;
        v26.location = a2;
        v26.length = a3;
        v13 = NSIntersectionRange(v26, v28);
        result = v13.location;
        if (v13.length && length)
        {
          if (v13.length >= -v6)
            v14 = 0;
          else
            v14 = v13.length;
          v15 = v14 + v6;
          if (v6 < 0)
            v6 = v15;
          else
            v6 = 0;
        }
        if (v12 && length)
        {
          v16 = 0;
          if ((v6 & 0x8000000000000000) == 0)
          {
            v17 = v6;
            goto LABEL_36;
          }
          v17 = v6;
          if (length < -v6)
          {
            v16 = v6 + length;
            v17 = -(uint64_t)length;
LABEL_36:
            v10.location = *(_QWORD *)(v9 + 40);
            goto LABEL_38;
          }
        }
        else
        {
          if (v12)
            v16 = v6;
          else
            v16 = 0;
          if (v12)
            v17 = 0;
          else
            v17 = v6;
        }
        if (!length && !v17 && !v12 && !v16)
          return result;
        goto LABEL_36;
      }
      if (a2 <= v10.location)
      {
        v17 = 0;
        v16 = v6;
        if (!v6)
          return result;
        goto LABEL_38;
      }
      v16 = 0;
      if (a2 >= *(_QWORD *)(v9 + 48) + v10.location)
        v17 = 0;
      else
        v17 = v6;
      if (v6)
      {
LABEL_38:
        v18 = v10.location + v16;
        v20 = *(_QWORD *)(v9 + 48);
        v19 = *(_QWORD *)(v9 + 56);
        *(_QWORD *)(v9 + 40) = v18;
        *(_QWORD *)(v9 + 48) = v20 + v17;
        if (v19 == *(_QWORD *)(v9 + 64))
        {
          v21 = v19 + 64;
          *(_QWORD *)(v9 + 64) = v21;
          result = (uint64_t)malloc_type_realloc(*(void **)(v9 + 8), 32 * v21, 0x108004019856BD9uLL);
          *(_QWORD *)(v9 + 8) = result;
          v19 = *(_QWORD *)(v9 + 56);
        }
        else
        {
          result = *(_QWORD *)(v9 + 8);
        }
        v22 = (NSUInteger *)(result + 32 * v19);
        *v22 = a2;
        v22[1] = a3;
        *(_QWORD *)(result + 32 * *(_QWORD *)(v9 + 56) + 16) = v6;
        v23 = *(_QWORD *)(v9 + 56);
        *(_QWORD *)(result + 32 * v23 + 24) = a5;
        if (a5)
        {
          result = objc_msgSend(*(id *)(v9 + 16), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), a5);
          v23 = *(_QWORD *)(v9 + 56);
        }
        *(_QWORD *)(v9 + 56) = v23 + 1;
      }
    }
  }
  return result;
}

- (id)_removeRange:(id *)result
{
  id *v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  id *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  unint64_t *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (!a2)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__removeRange_, result, CFSTR("NSWritingToolsEditTracker.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));
    result = (id *)objc_msgSend(v3[2], "objectForKeyedSubscript:", a2);
    if (result)
    {
      v4 = objc_msgSend(result, "unsignedIntValue");
      v5 = (char *)v3[7];
      if ((unint64_t)v5 <= v4)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__removeRange_, v3, CFSTR("NSWritingToolsEditTracker.m"), 178, CFSTR("index out of range"));
        v5 = (char *)v3[7];
      }
      v6 = v3[1];
      v7 = &v6[4 * v4];
      v8 = *v7;
      v9 = v7[2];
      if (&v5[~v4])
      {
        memmove(v7, v7 + 4, 32 * (_QWORD)&v5[~v4]);
        v5 = (char *)v3[7];
        v6 = v3[1];
      }
      v10 = v5 - 1;
      v3[7] = v10;
      v11 = &v6[4 * (_QWORD)v10];
      *v11 = 0;
      v11[1] = 0;
      v6[4 * (_QWORD)v3[7] + 2] = 0;
      v6[4 * (_QWORD)v3[7] + 3] = 0;
      objc_msgSend(v3[2], "removeObjectForKey:", a2);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = (void *)objc_msgSend(v3[2], "allKeys");
      result = (id *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (result)
      {
        v13 = result;
        v14 = *(_QWORD *)v21;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
            v17 = objc_msgSend((id)objc_msgSend(v3[2], "objectForKeyedSubscript:", v16), "unsignedIntValue");
            if (v4 < v17)
              objc_msgSend(v3[2], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 - 1), v16);
            v15 = (id *)((char *)v15 + 1);
          }
          while (v13 != v15);
          result = (id *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v13 = result;
        }
        while (result);
      }
      v18 = v3[7];
      if ((unint64_t)v18 > v4)
      {
        v19 = (unint64_t *)((char *)v3[1] + 32 * v4);
        do
        {
          if (v8 < *v19)
          {
            *v19 -= v9;
            v18 = v3[7];
          }
          ++v4;
          v19 += 4;
        }
        while (v4 < (unint64_t)v18);
      }
      v3[6] = (char *)v3[6] - v9;
    }
  }
  return result;
}

- (unint64_t)_adjustLocation:(unint64_t)a3
{
  unint64_t count;
  uint64_t v7;
  unint64_t v8;
  NSWritingToolsEdit *edits;
  uint64_t var1;

  count = self->_count;
  if (count)
  {
    v7 = 0;
    v8 = 0;
    edits = self->_edits;
    do
    {
      if (edits[v7].var0.length + edits[v7].var0.location <= a3)
      {
        var1 = edits[v7].var1;
        if (var1 <= 0 && a3 <= -var1)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 220, CFSTR("attempting to set range to a negative location."));
          edits = self->_edits;
          count = self->_count;
        }
        a3 += edits[v7].var1;
      }
      ++v8;
      ++v7;
    }
    while (v8 < count);
  }
  return a3;
}

- (uint64_t)_adjustRange:(uint64_t)a3 forUUID:(uint64_t)a4
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (!a1)
    return 0;
  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__adjustRange_forUUID_, a1, CFSTR("NSWritingToolsEditTracker.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));
  if (*(_QWORD *)(a1 + 56))
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)(a1 + 8);
    v11 = a2;
    while (1)
    {
      v12 = objc_msgSend(*(id *)(v10 + v8 + 24), "isEqual:", a4);
      v10 = *(_QWORD *)(a1 + 8);
      if (v12)
        break;
      v14 = *(_QWORD *)(v10 + v8);
      v15 = *(_QWORD *)(v10 + v8 + 8) + v14;
      if (v15 <= v11)
      {
        v13 = *(_QWORD *)(v10 + v8 + 16);
        v11 += v13;
        goto LABEL_20;
      }
      if (v14 <= a2 && v15 > a2)
        return 0x7FFFFFFFFFFFFFFFLL;
      if (a2 <= v14 && a2 + a3 > v14)
        return 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
      ++v9;
      v8 += 32;
      if (v9 >= *(_QWORD *)(a1 + 56))
        return v11;
    }
    v13 = *(_QWORD *)(v10 + v8 + 16);
LABEL_20:
    a2 += v13;
    goto LABEL_21;
  }
  return a2;
}

- (void)addEditForRange:(_NSRange)a3 lengthDelta:(int64_t)a4
{
  -[NSWritingToolsEditTracker _addRange:delta:uuid:]((uint64_t)self, a3.location, a3.length, a4, 0);
}

- (_NSRange)adjustRange:(_NSRange)a3
{
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v5 = a3.location + a3.length;
  v6 = -[NSWritingToolsEditTracker _adjustLocation:](self, "_adjustLocation:");
  v7 = -[NSWritingToolsEditTracker _adjustLocation:](self, "_adjustLocation:", v5);
  v8 = v7 - v6;
  if (v7 < v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 292, CFSTR("attempting to set range to a negative length."));
  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)addEditForSuggestionWithRange:(_NSRange)a3 lengthDelta:(int64_t)a4 UUID:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  length = a3.length;
  location = a3.location;
  if (!a5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));
  v11 = -[NSWritingToolsEditTracker _adjustRange:forUUID:]((uint64_t)self, self->_contextRange.location + location, length, (uint64_t)a5);
  v13 = v12;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 311, CFSTR("attempting to add a suggestion that has already been invalidated by previous edits."));
  -[NSWritingToolsEditTracker _addRange:delta:uuid:]((uint64_t)self, v11, v13, a4, (uint64_t)a5);
}

- (void)removeEditForSuggestionWithUUID:(id)a3
{
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));
  -[NSWritingToolsEditTracker _removeRange:]((id *)&self->super.isa, (uint64_t)a3);
}

- (_NSRange)rangeOfSuggestionWithRange:(_NSRange)a3 UUID:(id)a4 applyDelta:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v14;
  NSWritingToolsEdit *edits;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsEditTracker.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));
  v10 = -[NSWritingToolsEditTracker _adjustRange:forUUID:]((uint64_t)self, self->_contextRange.location + location, length, (uint64_t)a4);
  v12 = v11;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToIndex, "objectForKeyedSubscript:", a4);
    if (v14)
    {
      edits = self->_edits;
      v12 += edits[objc_msgSend(v14, "unsignedIntValue")].var1;
    }
  }
  v16 = v10;
  v17 = v12;
  result.length = v17;
  result.location = v16;
  return result;
}

- (_NSRange)currentContextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentContextRange.length;
  location = self->_currentContextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)_indirect_addRange:(_NSRange)a3 delta:(int64_t)a4 uuid:(id)a5
{
  -[NSWritingToolsEditTracker _addRange:delta:uuid:]((uint64_t)self, a3.location, a3.length, a4, (uint64_t)a5);
}

- (void)_indirect_removeRange:(id)a3
{
  -[NSWritingToolsEditTracker _removeRange:]((id *)&self->super.isa, (uint64_t)a3);
}

- (_NSRange)_indirect_adjustRange:(_NSRange)a3 forUUID:(id)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[NSWritingToolsEditTracker _adjustRange:forUUID:]((uint64_t)self, a3.location, a3.length, (uint64_t)a4);
  result.length = v5;
  result.location = v4;
  return result;
}

@end
