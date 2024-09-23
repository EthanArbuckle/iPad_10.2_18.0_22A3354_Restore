@implementation __NSTextSelectionLineFragmentInfo

- (NSTextRange)textRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 16, 1);
}

- (__NSTextSelectionLineFragmentInfo)initWithTextSelectionNavigation:(id)a3 range:(id)a4
{
  __NSTextSelectionLineFragmentInfo *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)__NSTextSelectionLineFragmentInfo;
  v6 = -[__NSTextSelectionLineFragmentInfo init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "textSelectionDataSource"), "offsetFromLocation:toLocation:", objc_msgSend(a4, "location"), objc_msgSend(a4, "endLocation"));
    v6->_offset = v7;
    if (v7 < 0x7FFFFFFFFFFFFFFFLL)
    {
      v6->_offset = v7 + 1;
      v6->_navigation = (NSTextSelectionNavigation *)a3;
      v6->_textRange = (NSTextRange *)a4;
      v6->_visualDirection = -1;
      v6->_baseDirection = -1;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)_fetchCaretOffsets
{
  id v3;
  BOOL v4;
  NSMapTable *v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v9[11];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FFFFFFFFFFFFFFFLL;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3690]);
  v4 = -[__NSTextSelectionLineFragmentInfo _baseWritingDirection](self, "_baseWritingDirection") == 1;
  v5 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  if (!self->_carets)
    self->_carets = ($8A3C5446200872A078FBC44726AE0FCF *)NSZoneCalloc(0, self->_offset, 0x20uLL);
  v6 = -[NSTextSelectionNavigation textSelectionDataSource](self->_navigation, "textSelectionDataSource");
  v7 = -[NSTextRange location](self->_textRange, "location");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55____NSTextSelectionLineFragmentInfo__fetchCaretOffsets__block_invoke;
  v9[3] = &unk_1E26034D0;
  v9[4] = self;
  v9[5] = v3;
  v10 = v4;
  v9[6] = v5;
  v9[7] = &v24;
  v9[8] = v23;
  v9[9] = &v11;
  v9[10] = &v17;
  objc_msgSend(v6, "enumerateCaretOffsetsInLineFragmentAtLocation:usingBlock:", v7, v9);
  v8 = v25[3];
  self->_numberOfCarets = v8;
  if (v8)
  {

    self->_primaryLocationTable = v5;
    self->_secondaryLocationTable = (NSMapTable *)v18[5];

    self->_otherLocations = (NSArray *)v12[5];
  }
  else
  {

    if (v12[5])
      __assert_rtn("-[__NSTextSelectionLineFragmentInfo _fetchCaretOffsets]", "NSTextSelectionNavigation.m", 293, "!otherTable");
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
}

- (int64_t)_baseWritingDirection
{
  int64_t result;

  result = self->_baseDirection;
  if (result == -1)
  {
    result = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self->_navigation, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", -[NSTextRange location](self->_textRange, "location"));
    self->_baseDirection = result;
    if (result == -1)
    {
      result = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
      self->_baseDirection = result;
    }
  }
  return result;
}

- (double)offsetForLocation:(id)a3
{
  int64_t v4;
  double v5;
  const $8A3C5446200872A078FBC44726AE0FCF *v6;

  v4 = -[__NSTextSelectionLineFragmentInfo caretIndexForPrimaryLocation:](self, "caretIndexForPrimaryLocation:", a3);
  v5 = -1.0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[__NSTextSelectionLineFragmentInfo caretPositionAtIndex:](self, "caretPositionAtIndex:", v4);
    if (v6)
      return v6->var0;
  }
  return v5;
}

- (int64_t)caretIndexForPrimaryLocation:(id)a3
{
  id v5;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  v5 = -[NSMapTable objectForKey:](self->_primaryLocationTable, "objectForKey:", a3);
  if (v5)
    return objc_msgSend(v5, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (const)caretPositionAtIndex:(int64_t)a3
{
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  if (a3 < 0 || self->_numberOfCarets <= a3)
    return 0;
  else
    return &self->_carets[a3];
}

- (void)_cache
{
  if (!self->_carets)
  {
    -[__NSTextSelectionLineFragmentInfo _fetchCaretOffsets](self, "_fetchCaretOffsets");
    if (self->_numberOfCarets)
    {
      -[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges](self, "_resolveTrailingEdges");
      -[__NSTextSelectionLineFragmentInfo _computeVisualDirection](self, "_computeVisualDirection");
      -[__NSTextSelectionLineFragmentInfo _invalidateSortedLocations](self, "_invalidateSortedLocations");
    }
  }
}

- (void)_resolveTrailingEdges
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges]", "NSTextSelectionNavigation.m", 307, "NULL != _carets");
}

- (void)_invalidateSortedLocations
{

  self->_sortedLocations = 0;
}

- (void)_computeVisualDirection
{
  unint64_t numberOfCarets;
  int v4;
  uint64_t v5;
  unint64_t v6;
  $8A3C5446200872A078FBC44726AE0FCF *v7;
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  $8A3C5446200872A078FBC44726AE0FCF *v9;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  self->_visualDirection = -1;
  numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets)
    return;
  v4 = -1;
  v5 = 25;
  v6 = self->_numberOfCarets;
  do
  {
    if (v4 == -1)
    {
      v4 = *((unsigned __int8 *)&self->_carets->var0 + v5);
      goto LABEL_8;
    }
    if (v4 == 2)
      break;
    if (v4 != *((unsigned __int8 *)&self->_carets->var0 + v5))
    {
      v4 = 2;
LABEL_8:
      self->_visualDirection = v4;
    }
    v5 += 32;
    --v6;
  }
  while (v6);
  if (numberOfCarets > 1 && v4 != 2)
  {
    if (v4 == 1)
    {
      v7 = &self->_carets[numberOfCarets];
      carets = v7 - 2;
      v9 = v7 - 1;
    }
    else
    {
      carets = self->_carets;
      v9 = carets + 1;
    }
    if (self->_visualDirection != (objc_msgSend(carets->var1, "compare:", v9->var1) == 1))
      self->_visualDirection = 2;
  }
}

- (void)dealloc
{
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  objc_super v4;

  carets = self->_carets;
  if (carets)
    NSZoneFree(0, carets);

  v4.receiver = self;
  v4.super_class = (Class)__NSTextSelectionLineFragmentInfo;
  -[__NSTextSelectionLineFragmentInfo dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  id var2;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("<%p %@"), self, objc_opt_class());
  if (self->_carets)
  {
    if (self->_numberOfCarets)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), objc_msgSend(self->_carets[v4].var1, "description"));
        carets = self->_carets;
        var2 = carets[v4].var2;
        if (var2)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("/%@"), objc_msgSend(var2, "description"));
          carets = self->_carets;
        }
        if (!carets[v4].var3)
        {
          objc_msgSend(v3, "appendString:", CFSTR("t"));
          carets = self->_carets;
        }
        objc_msgSend(v3, "appendFormat:", CFSTR("@%g"), *(_QWORD *)&carets[v4].var0);
        ++v5;
        ++v4;
      }
      while (v5 < self->_numberOfCarets);
    }
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" uncached"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)_sortedLocations
{
  NSArray *sortedLocations;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  objc_sync_enter(self);
  sortedLocations = self->_sortedLocations;
  if (!sortedLocations)
  {
    sortedLocations = -[NSArray sortedArrayUsingSelector:](NSAllMapTableKeys(self->_primaryLocationTable), "sortedArrayUsingSelector:", sel_compare_);
    self->_sortedLocations = sortedLocations;
  }
  objc_sync_exit(self);
  return sortedLocations;
}

- (int64_t)_sortedLocationIndexForLocation:(id)a3
{
  id v4;

  v4 = -[__NSTextSelectionLineFragmentInfo _sortedLocations](self, "_sortedLocations");
  return objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(v4, "count"), 1024, &__block_literal_global_3);
}

- (id)_findNextCaretLocationForLocation:(id)a3
{
  id v5;
  int64_t v6;
  int64_t v7;

  v5 = -[__NSTextSelectionLineFragmentInfo _sortedLocations](self, "_sortedLocations");
  v6 = -[__NSTextSelectionLineFragmentInfo _sortedLocationIndexForLocation:](self, "_sortedLocationIndexForLocation:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v6 + 1;
  if (v6 + 1 >= (unint64_t)objc_msgSend(v5, "count"))
    return 0;
  else
    return (id)objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
}

- (id)_secondaryLocationTable
{
  id result;

  result = self->_secondaryLocationTable;
  if (!result)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    self->_secondaryLocationTable = (NSMapTable *)result;
  }
  return result;
}

- (id)textRangeOfCharacterAtOffset:(double)a3 fractionOfDistanceThroughGlyph:(double *)a4
{
  unint64_t numberOfCarets;
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  double var0;
  unint64_t v10;
  BOOL *p_var4;
  uint64_t v12;
  id var1;
  id v15;
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets)
    return 0;
  carets = self->_carets;
  var0 = carets->var0;
  if (carets->var0 >= a3)
  {
    var1 = carets->var1;
    v15 = var1;
    if (numberOfCarets >= 2)
      v15 = carets[1].var1;
    if (!a4)
      goto LABEL_21;
  }
  else
  {
    v10 = numberOfCarets - 1;
    var0 = carets[numberOfCarets - 1].var0;
    if (var0 > a3)
    {
      if (numberOfCarets < 2)
LABEL_8:
        -[__NSTextSelectionLineFragmentInfo textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:].cold.1();
      p_var4 = &carets[1].var4;
      v12 = 1;
      while (1)
      {
        var0 = *(double *)(p_var4 - 25);
        if (var0 > a3)
          break;
        ++v12;
        p_var4 += 32;
        if (numberOfCarets == v12)
          goto LABEL_8;
      }
      if (*(p_var4 - 1) && *p_var4)
      {
        v18 = 1;
        v19 = v12--;
      }
      else
      {
        v18 = 0;
        v19 = v12 - 1;
      }
      v15 = carets[v12].var1;
      var1 = carets[v19].var1;
      if (!a4)
        goto LABEL_21;
      var0 = (a3 - *(double *)(p_var4 - 57)) / (var0 - *(double *)(p_var4 - 57));
      *a4 = var0;
      if (!v18)
        goto LABEL_21;
      var0 = 1.0 - var0;
      goto LABEL_20;
    }
    v15 = carets[v10].var1;
    var1 = v15;
    if (numberOfCarets >= 2)
      var1 = (id)*((_QWORD *)&carets[numberOfCarets - 1] - 3);
    if (!a4)
      goto LABEL_21;
    carets += v10;
  }
  var0 = 0.0;
  if (!carets->var3)
    var0 = 1.0;
LABEL_20:
  *a4 = var0;
LABEL_21:
  v16 = objc_msgSend(v15, "compare:", var1, var0);
  if (v16 == -1)
    v17 = v15;
  else
    v17 = var1;
  if (v16 == -1)
    v15 = var1;
  return -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v17, v15);
}

- (const)caretPositionClosestToOffset:(double)a3
{
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  unint64_t numberOfCarets;
  unint64_t v7;
  const $8A3C5446200872A078FBC44726AE0FCF *v8;
  const $8A3C5446200872A078FBC44726AE0FCF *result;
  double var0;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  carets = self->_carets;
  if (!carets)
    return 0;
  numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets)
    return 0;
  if (carets->var0 >= a3)
    return self->_carets;
  v7 = numberOfCarets - 1;
  v8 = &carets[numberOfCarets - 1];
  if (v8->var0 <= a3)
    return v8;
  if ((v7 & 0x8000000000000000) != 0)
    return 0;
  do
  {
    result = &carets[((char *)v8 - (char *)carets) >> 6];
    if (result->var0 == a3)
      break;
    if (result->var0 <= a3)
    {
      carets = ($8A3C5446200872A078FBC44726AE0FCF *)&result[1];
      var0 = result[1].var0;
      if (var0 > a3)
      {
        if (a3 - result->var0 > (var0 - result->var0) * 0.5)
          ++result;
        return result;
      }
    }
    else
    {
      v8 = result - 1;
    }
  }
  while (carets <= v8);
  return result;
}

- (const)logicalFirstCaret
{
  return -[__NSTextSelectionLineFragmentInfo caretPositionClosestToLocation:visualDirection:matchLocation:](self, "caretPositionClosestToLocation:visualDirection:matchLocation:", -[NSTextRange location](-[__NSTextSelectionLineFragmentInfo textRange](self, "textRange"), "location"), 1, 0);
}

- (const)logicalLastCaret
{
  return -[__NSTextSelectionLineFragmentInfo caretPositionClosestToLocation:visualDirection:matchLocation:](self, "caretPositionClosestToLocation:visualDirection:matchLocation:", -[NSTextRange endLocation](-[__NSTextSelectionLineFragmentInfo textRange](self, "textRange"), "endLocation"), 0, 0);
}

- (const)caretPositionClosestToLocation:(id)a3 visualDirection:(int64_t)a4 matchLocation:(BOOL *)a5
{
  int64_t v9;
  int visualDirection;
  id v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  const $8A3C5446200872A078FBC44726AE0FCF *v16;
  unint64_t numberOfCarets;
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  $8A3C5446200872A078FBC44726AE0FCF *v19;
  uint64_t v20;
  $8A3C5446200872A078FBC44726AE0FCF *v21;
  const $8A3C5446200872A078FBC44726AE0FCF *v22;
  uint64_t v23;
  const $8A3C5446200872A078FBC44726AE0FCF *v24;
  const $8A3C5446200872A078FBC44726AE0FCF *v25;
  uint64_t v26;
  const $8A3C5446200872A078FBC44726AE0FCF *v27;

  if (!-[NSTextRange containsLocation:](self->_textRange, "containsLocation:")
    && !objc_msgSend(-[NSTextRange endLocation](self->_textRange, "endLocation"), "isEqual:", a3))
  {
    return 0;
  }
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  v9 = -[__NSTextSelectionLineFragmentInfo caretIndexForPrimaryLocation:](self, "caretIndexForPrimaryLocation:", a3);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_29;
  visualDirection = self->_visualDirection;
  if (visualDirection == 2)
  {
    v11 = -[__NSTextSelectionLineFragmentInfo _sortedLocations](self, "_sortedLocations", 0x7FFFFFFFFFFFFFFFLL);
    v12 = -[__NSTextSelectionLineFragmentInfo _sortedLocationIndexForLocation:](self, "_sortedLocationIndexForLocation:", a3);
    v13 = v12 - 1;
    if ((unint64_t)(v12 - 1) > 0x7FFFFFFFFFFFFFFDLL)
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v14 = v12;
      if ((a4 == 2) != (-[__NSTextSelectionLineFragmentInfo _baseWritingDirection](self, "_baseWritingDirection") != 0))
      {
        if (v14 + 1 >= (unint64_t)objc_msgSend(v11, "count"))
          v15 = v14;
        else
          v15 = v14 + 1;
        v13 = v15 - 1;
      }
      v9 = -[__NSTextSelectionLineFragmentInfo caretIndexForPrimaryLocation:](self, "caretIndexForPrimaryLocation:", objc_msgSend(v11, "objectAtIndexedSubscript:", v13));
    }
    goto LABEL_29;
  }
  numberOfCarets = self->_numberOfCarets;
  if (numberOfCarets < 2)
  {
    v9 = 0;
LABEL_29:
    v27 = -[__NSTextSelectionLineFragmentInfo caretPositionAtIndex:](self, "caretPositionAtIndex:", v9);
    v16 = v27;
    if (a5 && v27 && objc_msgSend(v27->var2, "isEqual:", a3))
      *a5 = 0;
    return v16;
  }
  carets = self->_carets;
  v19 = &carets[numberOfCarets];
  if (visualDirection == 1)
    v20 = 0;
  else
    v20 = -1;
  v21 = &v19[v20];
  v22 = &carets[visualDirection == 1];
  if (visualDirection == 1)
    v23 = -1;
  else
    v23 = 1;
  v24 = v21 - 1;
  while (v22 <= v24)
  {
    v25 = &v22[((char *)v24 - (char *)v22) >> 6];
    v26 = objc_msgSend(a3, "compare:", v25->var1);
    if (v26 != -1 && objc_msgSend(v25[v23].var1, "compare:", a3) != -1)
    {
      if (visualDirection == 1)
        v22 = v25 - 1;
      else
        v22 += ((char *)v24 - (char *)v22) >> 6;
      if (visualDirection == 1)
        v24 = v25;
      else
        v24 = v25 + 1;
      break;
    }
    if (v26 == v23)
      v22 = v25 + 1;
    else
      v24 = v25 - 1;
  }
  if (v22 == v24 || a4 == 3)
    return v22;
  else
    return v24;
}

- (id)rangesBetweenStartingOffset:(double)a3 endOffset:(double)a4 continuous:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  const $8A3C5446200872A078FBC44726AE0FCF *v9;
  const $8A3C5446200872A078FBC44726AE0FCF *v10;
  BOOL v11;
  void *v12;
  const $8A3C5446200872A078FBC44726AE0FCF *v13;
  id var1;
  id v15;
  uint64_t v16;
  id v17;
  NSTextRange *v18;
  NSTextRange **v19;
  int visualDirection;
  int64_t v22;
  id v23;
  int v24;
  int var3;
  id var2;
  id v27;
  BOOL v28;
  _BOOL8 v29;
  unint64_t v30;
  NSTextRange *v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *, void *, int);
  void *v34;
  void *v35;
  NSTextRange *v36;
  NSTextRange *v37;
  _QWORD v38[2];

  v5 = a5;
  v38[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= a4)
    v7 = a4;
  else
    v7 = a3;
  if (a3 >= a4)
    v8 = a3;
  else
    v8 = a4;
  v9 = -[__NSTextSelectionLineFragmentInfo caretPositionClosestToOffset:](self, "caretPositionClosestToOffset:", v7);
  v10 = -[__NSTextSelectionLineFragmentInfo caretPositionClosestToOffset:](self, "caretPositionClosestToOffset:", v8);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = v10;
  if (v5)
  {
    var1 = v9->var1;
    v15 = v10->var1;
    v16 = objc_msgSend(var1, "compare:", v15);
    if (v16 == 1)
      v17 = v15;
    else
      v17 = var1;
    if (v16 != 1)
      var1 = v15;
    v18 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v17, var1);
    v38[0] = v18;
    v19 = (NSTextRange **)v38;
    goto LABEL_24;
  }
  visualDirection = self->_visualDirection;
  if (visualDirection == 1)
  {
    v18 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v10->var1, v9->var1);
    v36 = v18;
    v19 = &v36;
    goto LABEL_24;
  }
  if (!visualDirection)
  {
    v18 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v9->var1, v10->var1);
    v37 = v18;
    v19 = &v37;
LABEL_24:
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);

    return v12;
  }
  v22 = -[__NSTextSelectionLineFragmentInfo _baseWritingDirection](self, "_baseWritingDirection");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __86____NSTextSelectionLineFragmentInfo_rangesBetweenStartingOffset_endOffset_continuous___block_invoke;
  v34 = &unk_1E2603540;
  v35 = v12;
  if (v9 <= v13)
  {
    v23 = 0;
    v24 = v22 == 1;
    do
    {
      if (v9->var2)
      {
        var3 = v9->var3;
        if (var3 == v24)
          var2 = v9->var2;
        else
          var2 = v9->var1;
        if (v23)
        {
          if (var3 == v24)
            v27 = v9->var1;
          else
            v27 = v9->var2;
          v33((uint64_t)v32, v23, v27, 0);
        }
        v23 = var2;
      }
      else
      {
        var2 = v9->var1;
        if (!v23)
          v23 = v9->var1;
      }
      ++v9;
    }
    while (v9 <= v13);
    if (v23)
      v28 = var2 == 0;
    else
      v28 = 1;
    if (!v28)
    {
      v29 = objc_msgSend(v12, "count") == 0;
      v33((uint64_t)v32, v23, var2, v29);
    }
  }
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_218);
    if (objc_msgSend(v12, "count") != 1)
    {
      v30 = 0;
      do
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30), "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30 + 1), "location")))
        {
          v31 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30), "location"), objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30 + 1), "endLocation"));
          objc_msgSend(v12, "setObject:atIndexedSubscript:", v31, v30);
          objc_msgSend(v12, "removeObjectAtIndex:", v30 + 1);

        }
        else
        {
          ++v30;
        }
      }
      while (v30 < objc_msgSend(v12, "count") - 1);
    }
  }
  return v12;
}

- (int64_t)numberOfCaretPositions
{
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  return self->_numberOfCarets;
}

- (BOOL)isMonotonicDirection
{
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  return self->_visualDirection != 2;
}

- (int64_t)caretIndexForSecondaryLocation:(id)a3
{
  NSMapTable *secondaryLocationTable;
  id v6;

  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  secondaryLocationTable = self->_secondaryLocationTable;
  if (secondaryLocationTable && (v6 = -[NSMapTable objectForKey:](secondaryLocationTable, "objectForKey:", a3)) != 0)
    return objc_msgSend(v6, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)location:(id)a3 isLeading:(BOOL *)a4 trailing:(BOOL *)a5 inTextRanges:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(a6);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
      v15 = objc_msgSend((id)objc_msgSend(v14, "location"), "compare:", a3);
      if (v15 == 1)
        break;
      v16 = v15;
      v17 = objc_msgSend(a3, "compare:", objc_msgSend(v14, "endLocation"));
      if (v17 != 1)
      {
        *a4 = v17 == -1;
        *a5 = v16 == -1;
        return 1;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }
  result = 0;
  *a5 = 0;
  *a4 = 0;
  return result;
}

- (int64_t)caretIndexForLocation:(id)a3 inTextRanges:(id)a4 secondaryCaretIndex:(int64_t *)a5
{
  int64_t v8;
  int64_t v9;
  int64_t v10;
  _BOOL4 v11;
  $8A3C5446200872A078FBC44726AE0FCF *carets;
  _BOOL4 var3;
  BOOL v14;
  $8A3C5446200872A078FBC44726AE0FCF *v15;
  int64_t v16;
  _BOOL4 v17;
  $8A3C5446200872A078FBC44726AE0FCF *v18;
  int64_t v19;
  int v20;
  int64_t v21;
  __int16 v23;

  v23 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[__NSTextSelectionLineFragmentInfo location:isLeading:trailing:inTextRanges:](self, "location:isLeading:trailing:inTextRanges:", a3, (char *)&v23 + 1, &v23, a4))return v8;
  v9 = -[__NSTextSelectionLineFragmentInfo caretIndexForPrimaryLocation:](self, "caretIndexForPrimaryLocation:", a3);
  v10 = v9;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_3;
  if (!(HIBYTE(v23) | v23))
    goto LABEL_15;
  carets = self->_carets;
  if (!HIBYTE(v23))
  {
    if (!(_BYTE)v23 || (v15 = &carets[v9], v15->var3) && v15->var2)
    {
LABEL_3:
      v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  var3 = carets[v9].var3;
  v11 = var3;
  v14 = var3 || v23 == 0;
  if (!v14)
LABEL_15:
    v11 = 1;
LABEL_16:
  v16 = -[__NSTextSelectionLineFragmentInfo caretIndexForSecondaryLocation:](self, "caretIndexForSecondaryLocation:", a3);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = self->_carets;
    if (!v18[v16].var2)
      -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:].cold.1();
    if (HIBYTE(v23) && v18[v16].var3)
    {
      v17 = 1;
      goto LABEL_24;
    }
    if ((_BYTE)v23)
    {
      v17 = !v18[v16].var3;
      goto LABEL_24;
    }
  }
  v17 = 0;
LABEL_24:
  if (v11 || !v17)
    v19 = v10;
  else
    v19 = v16;
  v20 = v11 || v17;
  if (a5)
  {
    v14 = !v11 || !v17;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v14)
      v21 = v16;
    *a5 = v21;
  }
  if (v20)
    return v19;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_locationForEdgeCaretAtIndex:(unint64_t)a3 leftEdge:(BOOL)a4
{
  _BOOL4 v4;
  $8A3C5446200872A078FBC44726AE0FCF *v7;
  id *p_var2;

  v4 = a4;
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  v7 = &self->_carets[a3];
  if (v7->var2)
  {
    if ((-[__NSTextSelectionLineFragmentInfo _baseWritingDirection](self, "_baseWritingDirection") == 0) ^ v4 ^ !v7->var3)
      p_var2 = &v7->var2;
    else
      p_var2 = &v7->var1;
  }
  else
  {
    p_var2 = &v7->var1;
  }
  return *p_var2;
}

- (int64_t)caretIndexForEdgeLocationInTextRanges:(id)a3 leftEdge:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  id v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  -[__NSTextSelectionLineFragmentInfo _cache](self, "_cache");
  if (objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty"))
  {
    v7 = -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:](self, "caretIndexForLocation:inTextRanges:secondaryCaretIndex:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location"), a3, 0);
LABEL_13:
    v13 = v7;
    v23[3] = v7;
    goto LABEL_14;
  }
  if (self->_visualDirection == 2)
  {
    v8 = -[__NSTextSelectionLineFragmentInfo _sortedLocations](self, "_sortedLocations");
    v9 = -[__NSTextSelectionLineFragmentInfo _sortedLocationIndexForLocation:](self, "_sortedLocationIndexForLocation:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23[3] = 0x7FFFFFFFFFFFFFFFLL;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v18 = __84____NSTextSelectionLineFragmentInfo_caretIndexForEdgeLocationInTextRanges_leftEdge___block_invoke;
      v19 = &unk_1E2603568;
      v20 = &v22;
      v21 = v4;
      v10 = objc_msgSend(v8, "count");
      if (v9 < v10)
      {
        do
        {
          v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation"), "compare:", v11) == -1)
            break;
          v16 = 0x7FFFFFFFFFFFFFFFLL;
          v12 = -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:](self, "caretIndexForLocation:inTextRanges:secondaryCaretIndex:", v11, a3, &v16);
          v18((uint64_t)v17, v12);
          v18((uint64_t)v17, v16);
          ++v9;
        }
        while (v10 != v9);
      }
    }
  }
  v13 = v23[3];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((self->_visualDirection != 0) == v4)
      v14 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation");
    else
      v14 = objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location");
    v7 = -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:](self, "caretIndexForLocation:inTextRanges:secondaryCaretIndex:", v14, a3, 0);
    goto LABEL_13;
  }
LABEL_14:
  _Block_object_dispose(&v22, 8);
  return v13;
}

- (NSTextSelectionNavigation)textSelectionNavigation
{
  return self->_navigation;
}

- (void)textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:.cold.1()
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:]", "NSTextSelectionNavigation.m", 524, "leftCaret && rightCaret");
}

- (void)caretIndexForLocation:inTextRanges:secondaryCaretIndex:.cold.1()
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:]", "NSTextSelectionNavigation.m", 879, "secondaryCaret->secondaryLocation");
}

@end
