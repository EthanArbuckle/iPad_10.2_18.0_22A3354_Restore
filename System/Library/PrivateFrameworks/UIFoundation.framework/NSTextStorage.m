@implementation NSTextStorage

- (void)setEnsuresFixingAttributes:(BOOL)a3
{
  self->_ensuresFixingAttributes = a3;
}

- (BOOL)ensuresFixingAttributes
{
  return self->_ensuresFixingAttributes;
}

- (NSTextStorageEditActions)editedMask
{
  return (NSTextStorageEditActions)self->_flags;
}

- (void)coordinateEditing:(id)a3
{
  -[NSTextStorage beginEditing](self, "beginEditing");
  (*((void (**)(id, NSTextStorage *))a3 + 2))(a3, self);
  -[NSTextStorage endEditing](self, "endEditing");
}

- (void)beginEditing
{
  $476B385495589A9445B0874D003C362D flags;

  -[NSTextStorage _lockForWriting](self, "_lockForWriting");
  flags = self->_flags;
  if (!HIWORD(*(unsigned int *)&flags))
  {
    objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "beginEditingTransaction");
    flags = self->_flags;
  }
  self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&flags + 0x10000);
}

- (BOOL)_lockForWriting
{
  return -[NSTextStorage _lockForWritingWithExceptionHandler:](self, "_lockForWritingWithExceptionHandler:", 1);
}

- (void)endEditing
{
  $476B385495589A9445B0874D003C362D flags;

  flags = self->_flags;
  if (*(unsigned int *)&flags >> 17)
  {
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&flags - 0x10000);
  }
  else
  {
    if (self->_editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_flags = ($476B385495589A9445B0874D003C362D)((unsigned __int16)*(_DWORD *)&self->_flags | 0x10000);
      -[NSTextStorage processEditing](self, "processEditing");
      self->_editedRange.location = 0x7FFFFFFFFFFFFFFFLL;
      self->_editedDelta = 0;
      flags = self->_flags;
    }
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_WORD *)&flags & 0xFF00);
    objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "endEditingTransaction");
  }
  -[NSTextStorage _unlock](self, "_unlock");
}

- (id)textStorageObserver
{
  return objc_loadWeak((id *)&self->_textStorageObserver);
}

- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3
{
  return 0;
}

- (void)ensureAttributesAreFixedInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *sideData;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  BOOL v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  unint64_t v24;
  NSUInteger v25;
  _BOOL4 v26;
  $476B385495589A9445B0874D003C362D flags;
  int64_t editedDelta;
  char v29;
  _QWORD *v30;
  unint64_t v31;
  _NSRange editedRange;
  _NSRange v33;

  length = range.length;
  location = range.location;
  if ((*(_DWORD *)&self->_flags < 0x10000u || -[NSTextStorage _forceFixAttributes](self, "_forceFixAttributes"))
    && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    sideData = self->_sideData;
    v7 = sideData[2];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = sideData[3];
      if (location <= v7)
        v9 = v7;
      else
        v9 = location;
      v10 = location + length;
      v11 = v8 + v7;
      if (location + length >= v8 + v7)
        v10 = v8 + v7;
      v12 = v10 > v9;
      v13 = v10 - v9;
      if (v12)
        v14 = v13;
      else
        v14 = 0;
      if (v12)
        v15 = v9;
      else
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = v15 - v7;
        if (v15 > v7)
        {
          v12 = v11 > v15 + v14;
          v17 = v11 - (v15 + v14);
          if (v12 && v17 >= v16)
          {
            v14 += v16;
            v15 = v7;
          }
          else
          {
            v18 = -[NSTextStorage _rangeByEstimatingAttributeFixingForRange:](self, "_rangeByEstimatingAttributeFixingForRange:", v15);
            v19 = self->_sideData;
            v7 = v19[2];
            v8 = v19[3];
            if (v18 <= v7)
              v15 = v7;
            else
              v15 = v18;
            v14 = v8 + v7 - v15;
          }
        }
        v20 = v8 + v7;
        v21 = v20 - v15;
        v12 = v15 + 0x10000 > v20;
        v22 = 0x10000;
        if (v12)
          v22 = v21;
        if (v14 >> 16)
          v23 = v14;
        else
          v23 = v22;
        v24 = -[NSTextStorage length](self, "length");
        if (v23 + v15 <= v24)
          v25 = v23;
        else
          v25 = v24 - v15;
        v26 = -[NSTextStorage _lockForWriting](self, "_lockForWriting");
        flags = self->_flags;
        *((_WORD *)&self->_flags + 1) = ((*(_DWORD *)&flags & 0xFFFF0000) + 0x10000) >> 16;
        editedRange = self->_editedRange;
        editedDelta = self->_editedDelta;
        v29 = (char)flags;
        self->_editedRange.location = v15;
        self->_editedRange.length = v25;
        self->_editedDelta = 0;
        v30 = self->_sideData;
        v31 = v30[2];
        if (v15 <= v31)
        {
          if (v25 == v30[3])
          {
            *((_OWORD *)v30 + 1) = xmmword_18D6CBB80;
          }
          else
          {
            v30[2] = v31 + v25;
            *((_QWORD *)self->_sideData + 3) -= v25;
          }
        }
        else
        {
          v30[3] = v15 - v31;
        }
        -[NSTextStorage _setForceFixAttributes:](self, "_setForceFixAttributes:", 0, editedRange);
        -[NSTextStorage _fixAttributesInRange:](self, "_fixAttributesInRange:", v15, v25);
        -[NSTextStorage _setForceFixAttributes:](self, "_setForceFixAttributes:", 1);
        *((_WORD *)&self->_flags + 1) = ((*((unsigned __int16 *)&self->_flags + 1) << 16) - 0x10000) >> 16;
        self->_editedRange = v33;
        self->_editedDelta = editedDelta;
        *(_BYTE *)&self->_flags = v29;
        if (v26)
          -[NSTextStorage _unlock](self, "_unlock");
      }
    }
  }
}

- (void)fixGlyphInfoAttributeInRange:(_NSRange)a3
{
  objc_super v3;

  if (self->_fontFixingDisabledCount <= 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextStorage;
    -[NSMutableAttributedString fixGlyphInfoAttributeInRange:](&v3, sel_fixGlyphInfoAttributeInRange_, a3.location, a3.length);
  }
}

- (void)fixFontAttributeInRange:(_NSRange)a3
{
  objc_super v3;

  if (self->_fontFixingDisabledCount <= 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextStorage;
    -[NSMutableAttributedString fixFontAttributeInRange:](&v3, sel_fixFontAttributeInRange_, a3.location, a3.length);
  }
}

- (Class)_intentResolver
{
  Class result;
  objc_super v4;

  result = self->_intentResolver;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTextStorage;
    return -[NSTextStorage _intentResolver](&v4, sel__intentResolver);
  }
  return result;
}

- (NSRange)editedRange
{
  _NSRange *p_editedRange;
  NSUInteger location;
  NSUInteger length;
  NSRange result;

  p_editedRange = &self->_editedRange;
  location = self->_editedRange.location;
  length = p_editedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (NSInteger)changeInLength
{
  return self->_editedDelta;
}

- (void)addLayoutManager:(NSLayoutManager *)aLayoutManager
{
  uint64_t v5;

  v5 = -[NSMutableArray count](self->_layoutManagers, "count");
  -[NSMutableArray addObject:](self->_layoutManagers, "addObject:", aLayoutManager);
  -[NSLayoutManager setTextStorage:](aLayoutManager, "setTextStorage:", self);
  if (!v5 && !-[NSAttributedString _isStringDrawingTextStorage](self, "_isStringDrawingTextStorage"))
    -[NSMutableArray count](self->_layoutManagers, "count");
}

- (void)edited:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta
{
  _NSRange *p_editedRange;
  NSUInteger location;
  NSInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _QWORD *sideData;
  NSUInteger v12;
  _QWORD *v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _QWORD *v18;
  NSUInteger v19;
  $476B385495589A9445B0874D003C362D flags;
  $476B385495589A9445B0874D003C362D v21;

  p_editedRange = &self->_editedRange;
  location = self->_editedRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_editedRange->location = editedRange.location;
    self->_editedRange.length = editedRange.length + delta;
    v8 = delta;
  }
  else
  {
    if (editedRange.location >= location)
      v9 = self->_editedRange.location;
    else
      v9 = editedRange.location;
    v10 = self->_editedRange.length + location;
    if (editedRange.location + editedRange.length > v10)
      v10 = editedRange.location + editedRange.length;
    p_editedRange->location = v9;
    self->_editedRange.length = delta - v9 + v10;
    v8 = self->_editedDelta + delta;
  }
  self->_editedDelta = v8;
  if (delta)
  {
    sideData = self->_sideData;
    v13 = sideData + 2;
    v12 = sideData[2];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = editedRange.location + editedRange.length;
      if (editedRange.location + editedRange.length > v12)
      {
        v15 = sideData[3];
        if (v15 + v12 <= editedRange.location)
          goto LABEL_22;
        if (v12 >= editedRange.location)
          v16 = editedRange.location;
        else
          v16 = sideData[2];
        if (v15 + v12 > v14)
          v14 = v15 + v12;
        v17 = v14 - v16;
        if (editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v16;
          v15 = v17;
        }
        sideData[2] = v12;
        sideData[3] = v15;
        v18 = self->_sideData;
        v19 = v18[3];
        v13 = v18 + 3;
        v12 = v19;
      }
      *v13 = v12 + delta;
    }
  }
LABEL_22:
  flags = self->_flags;
  v21 = ($476B385495589A9445B0874D003C362D)(*(unsigned int *)&flags | editedMask);
  self->_flags = v21;
  if (!HIWORD(*(unsigned int *)&flags))
  {
    if (p_editedRange->location != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_flags = ($476B385495589A9445B0874D003C362D)((unsigned __int16)(*(_WORD *)&flags | editedMask) | 0x10000);
      -[NSTextStorage processEditing](self, "processEditing");
      p_editedRange->location = 0x7FFFFFFFFFFFFFFFLL;
      self->_editedDelta = 0;
      v21 = self->_flags;
    }
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&v21 & 0xFFFFFF00);
  }
}

- (void)processEditing
{
  uint64_t v3;
  void *v4;
  NSUInteger location;
  NSUInteger length;

  v3 = -[NSMutableArray count](self->_layoutManagers, "count");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NSTextStorageWillProcessEditingNotification"), self);
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    objc_msgSend(-[NSTextStorage delegate](self, "delegate"), "textStorage:willProcessEditing:range:changeInLength:", self, *(_BYTE *)&self->_flags, self->_editedRange.location, self->_editedRange.length, self->_editedDelta);
  location = self->_editedRange.location;
  length = self->_editedRange.length;
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", location, length);
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("NSTextStorageDidProcessEditingNotification"), self);
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    objc_msgSend(-[NSTextStorage delegate](self, "delegate"), "textStorage:didProcessEditing:range:changeInLength:", self, *(_BYTE *)&self->_flags, self->_editedRange.location, self->_editedRange.length, self->_editedDelta);
  if (v3 || !-[NSMutableArray count](self->_layoutManagers, "count"))
    -[NSTextStorage _notifyEdited:range:changeInLength:invalidatedRange:](self, "_notifyEdited:range:changeInLength:invalidatedRange:", *(_BYTE *)&self->_flags, location, length, self->_editedDelta, self->_editedRange.location, self->_editedRange.length);
}

- (void)_notifyEdited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5 invalidatedRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v13;
  uint64_t v14;

  length = a6.length;
  location = a6.location;
  v9 = a4.length;
  v10 = a4.location;
  v13 = -[NSMutableArray count](self->_layoutManagers, "count");
  if (v13)
  {
    v14 = v13 - 1;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layoutManagers, "objectAtIndex:", v14--), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, a3, v10, v9, a5, location, length);
    while (v14 != -1);
  }
  objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, a3, v10, v9, a5, location, length);
}

- (void)invalidateAttributesInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *sideData;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;

  length = range.length;
  location = range.location;
  if (-[NSTextStorage fixesAttributesLazily](self, "fixesAttributesLazily")
    || !-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
  {
    sideData = self->_sideData;
    v7 = sideData[2];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      sideData[2] = location;
      sideData[3] = length;
    }
    else
    {
      v8 = sideData[3];
      if (v7 >= location)
        v9 = location;
      else
        v9 = sideData[2];
      v10 = v8 + v7;
      if (v8 + v7 <= location + length)
        v10 = location + length;
      v11 = v10 - v9;
      if (location == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = sideData[3];
      }
      else
      {
        v7 = v9;
        v12 = v11;
      }
      sideData[2] = v7;
      sideData[3] = v12;
    }
    if (-[NSTextStorage _isEditing](self, "_isEditing"))
    {
      v13 = self->_editedRange.location;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_editedRange.location = -[NSTextStorage _rangeByEstimatingAttributeFixingForRange:](self, "_rangeByEstimatingAttributeFixingForRange:", v13, self->_editedRange.length);
        self->_editedRange.length = v14;
      }
    }
  }
  else
  {
    -[NSTextStorage _fixAttributesInRange:](self, "_fixAttributesInRange:", location, length);
  }
}

- (void)_fixAttributesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  BOOL v6;

  length = a3.length;
  location = a3.location;
  v6 = -[NSTextStorage _shouldFixFontAttributes](self, "_shouldFixFontAttributes");
  if (!v6)
    ++self->_fontFixingDisabledCount;
  -[NSMutableAttributedString fixAttributesInRange:](self, "fixAttributesInRange:", location, length);
  if (!v6)
    --self->_fontFixingDisabledCount;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  NSArray *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  BOOL shouldSetOriginalFontAttribute;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  shouldSetOriginalFontAttribute = self->_shouldSetOriginalFontAttribute;
  if (-[NSTextStorage _attributeFixingInProgress](self, "_attributeFixingInProgress"))
  {
    v3 = -[NSTextStorage layoutManagers](self, "layoutManagers");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__NSTextStorage__shouldSetOriginalFontAttribute__block_invoke;
    v6[3] = &unk_1E2605A18;
    v6[4] = &v7;
    -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v6);
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_shouldFixFontAttributes
{
  if (!self->_ensuresFixingAttributes)
    return 0;
  if (self->_ensuresFixingFontAttributes
    || -[NSArray count](-[NSTextStorage layoutManagers](self, "layoutManagers"), "count"))
  {
    return 1;
  }
  return self->_textStorageObserver == 0;
}

- (NSArray)layoutManagers
{
  return &self->_layoutManagers->super;
}

- (void)coordinateReading:(id)a3
{
  _BOOL4 v5;

  v5 = -[NSTextStorage _lockForReading](self, "_lockForReading");
  (*((void (**)(id, NSTextStorage *))a3 + 2))(a3, self);
  if (v5)
    -[NSTextStorage _unlock](self, "_unlock");
}

- (void)dealloc
{
  NSMutableArray *layoutManagers;
  id *v4;
  objc_super v5;
  _QWORD v6[5];

  layoutManagers = self->_layoutManagers;
  if (layoutManagers)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __24__NSTextStorage_dealloc__block_invoke;
    v6[3] = &unk_1E26059F0;
    v6[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](layoutManagers, "enumerateObjectsUsingBlock:", v6);

  }
  -[NSTextStorage setTextStorageObserver:](self, "setTextStorageObserver:", 0, self);
  if (v4[6])
  {
    objc_msgSend(v4, "setDelegate:", 0);

  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v4);
  if ((unint64_t)objc_msgSend(v4, "retainCount") < 2)
  {
    v5.receiver = v4;
    v5.super_class = (Class)NSTextStorage;
    -[NSTextStorage dealloc](&v5, sel_dealloc);
  }
  else
  {

  }
}

- (void)setDelegate:(id)delegate
{
  id v5;
  id v6;
  id *sideData;
  id v8;
  int v9;
  int v10;

  v5 = -[NSTextStorage delegate](self, "delegate");
  if (v5 != delegate)
  {
    v6 = v5;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", v5, CFSTR("NSTextStorageWillProcessEditingNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", v6, CFSTR("NSTextStorageDidProcessEditingNotification"), self);
    sideData = (id *)self->_sideData;
    if (sideData)
      objc_storeWeak(sideData + 1, delegate);
    v8 = -[NSTextStorage delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_textStorageWillProcessEditing_, CFSTR("NSTextStorageWillProcessEditingNotification"), self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_textStorageDidProcessEditing_, CFSTR("NSTextStorageDidProcessEditingNotification"), self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 256;
    else
      v9 = 0;
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 512;
    else
      v10 = 0;
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v10);
  }
}

- (id)delegate
{
  id *sideData;

  sideData = (id *)self->_sideData;
  if (sideData)
    return objc_loadWeak(sideData + 1);
  else
    return 0;
}

- (NSTextStorage)init
{
  NSTextStorage *v2;
  NSTextStorage *v3;
  uint64_t v4;
  objc_class *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextStorage;
  v2 = -[NSTextStorage init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_layoutManagers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", -[NSTextStorage zone](v2, "zone")), "initWithCapacity:", 1);
    v3->_editedRange = (_NSRange)xmmword_18D6CBB80;
    v3->_flags = ($476B385495589A9445B0874D003C362D)(*((unsigned __int8 *)&v3->_flags + 1) << 8);
    v4 = objc_opt_new();
    v3->_sideData = (id)v4;
    objc_storeWeak((id *)(v4 + 8), 0);
    *((_OWORD *)v3->_sideData + 1) = xmmword_18D6CBB80;
    v5 = (objc_class *)objc_opt_class();
    if (-[NSString isEqualToString:](NSStringFromClass(v5), "isEqualToString:", CFSTR("SwiftUI.NSSwiftMutableAttributedString")))
    {
      -[NSTextStorage _setForceFixAttributes:](v3, "_setForceFixAttributes:", 0);
      -[NSTextStorage setEnsuresFixingAttributes:](v3, "setEnsuresFixingAttributes:", 0);
      -[NSTextStorage set_isSwiftAttributedString:](v3, "set_isSwiftAttributedString:", 1);
    }
    else
    {
      -[NSTextStorage _setForceFixAttributes:](v3, "_setForceFixAttributes:", 1);
      -[NSTextStorage setEnsuresFixingAttributes:](v3, "setEnsuresFixingAttributes:", 1);
    }
  }
  return v3;
}

- (void)setTextStorageObserver:(id)textStorageObserver
{
  objc_storeWeak((id *)&self->_textStorageObserver, textStorageObserver);
}

- (void)_setShouldSetOriginalFontAttribute:(BOOL)a3
{
  self->_shouldSetOriginalFontAttribute = a3;
}

- (BOOL)_isSwiftAttributedString
{
  return self->__isSwiftAttributedString;
}

+ (NSTextStorage)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1)
    v4 = (objc_class *)objc_opt_class();
  return (NSTextStorage *)NSAllocateObject(v4, 0, a3);
}

+ (void)initialize
{
  uint64_t v2;
  char v3;
  objc_class *v4;
  objc_method *InstanceMethod;
  objc_method *v6;
  void (*Implementation)(void);
  objc_method_description *Description;
  objc_class *v9;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = dyld_program_sdk_at_least();
    __NSAllowsMutableEditedRange = v3 ^ 1;
    if ((v3 & 1) == 0)
    {
      v4 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v4, sel__setEditedRange_);
      if (InstanceMethod)
      {
        v6 = InstanceMethod;
        Implementation = method_getImplementation(InstanceMethod);
        Description = method_getDescription(v6);
        v9 = (objc_class *)objc_opt_class();
        class_addMethod(v9, sel_setEditedRange_, Implementation, Description->types);
      }
    }
  }
}

- (void)_setIntentResolver:(Class)a3
{
  self->_intentResolver = a3;
}

uint64_t __48__NSTextStorage__shouldSetOriginalFontAttribute__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "allowsOriginalFontMetricsOverride");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)coordinateAccess:(id)a3
{
  -[NSTextStorage _lockForWriting](self, "_lockForWriting");
  (*((void (**)(id, NSTextStorage *))a3 + 2))(a3, self);
  -[NSTextStorage _unlock](self, "_unlock");
}

- (BOOL)fixesAttributesLazily
{
  return 0;
}

- (BOOL)_lockForReading
{
  return 0;
}

- (BOOL)_attributeFixingInProgress
{
  return 0;
}

- (void)_setEditedRange:(_NSRange)a3
{
  if (__NSAllowsMutableEditedRange)
    self->_editedRange = a3;
}

uint64_t __24__NSTextStorage_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(a2, "textStorage");
  if (v3 == result)
    return objc_msgSend(a2, "setTextStorage:", 0);
  return result;
}

- (void)finalize
{
  objc_super v3;

  if (self->_sideData)
    -[NSTextStorage setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NSTextStorage;
  -[NSTextStorage finalize](&v3, sel_finalize);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  objc_super v6;
  objc_super v7;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[NSTextStorage delegate](self, "delegate");
    v6.receiver = self;
    v6.super_class = (Class)NSTextStorage;
    -[NSTextStorage encodeWithCoder:](&v6, sel_encodeWithCoder_, a3);
    objc_msgSend(a3, "encodeConditionalObject:forKey:", v5, CFSTR("NSDelegate"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSTextStorage;
    -[NSTextStorage encodeWithCoder:](&v7, sel_encodeWithCoder_, a3);
  }
}

- (NSTextStorage)initWithCoder:(id)a3
{
  NSTextStorage *v5;
  uint64_t v6;
  objc_super v8;
  objc_super v9;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)NSTextStorage;
    v5 = -[NSTextStorage initWithCoder:](&v8, sel_initWithCoder_, a3);
    v6 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSDelegate"));
    if (v6)
      -[NSTextStorage setDelegate:](v5, "setDelegate:", v6);
    -[NSTextStorage setEnsuresFixingAttributes:](v5, "setEnsuresFixingAttributes:", 1);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSTextStorage;
    return -[NSTextStorage initWithCoder:](&v9, sel_initWithCoder_, a3);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)removeLayoutManager:(NSLayoutManager *)aLayoutManager
{
  NSTextStorage *v5;
  NSLayoutManager *v6;
  uint64_t v7;

  v5 = self;
  -[NSLayoutManager setTextStorage:](aLayoutManager, "setTextStorage:", 0);
  v6 = aLayoutManager;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_layoutManagers, "indexOfObjectIdenticalTo:", aLayoutManager);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_layoutManagers, "removeObjectAtIndex:", v7);
  -[NSMutableArray count](self->_layoutManagers, "count");
}

- (BOOL)_forceFixAttributes
{
  return 0;
}

- (BOOL)_isEditing
{
  return *((_WORD *)&self->_flags + 1) != 0;
}

- (void)setEditedMask:(unint64_t)a3
{
  *(_BYTE *)&self->_flags = a3;
}

- (_NSRange)_rangeByEstimatingAttributeFixingForRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend((id)-[NSTextStorage string](self, "string"), "paragraphRangeForRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)fontSetChanged
{
  _BOOL4 v3;

  v3 = -[NSTextStorage _lockForWriting](self, "_lockForWriting");
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", 0, -[NSTextStorage length](self, "length"));
  if (v3)
    -[NSTextStorage _unlock](self, "_unlock");
}

- (id)cuiCatalog
{
  return 0;
}

- (id)cuiStyleEffects
{
  return 0;
}

- (BOOL)_usesSimpleTextEffects
{
  return 0;
}

- (BOOL)ensuresFixingFontAttributes
{
  return self->_ensuresFixingFontAttributes;
}

- (void)setEnsuresFixingFontAttributes:(BOOL)a3
{
  self->_ensuresFixingFontAttributes = a3;
}

- (void)set_isSwiftAttributedString:(BOOL)a3
{
  self->__isSwiftAttributedString = a3;
}

@end
