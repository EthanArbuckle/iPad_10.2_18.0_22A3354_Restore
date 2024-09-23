@implementation UIWKDocumentContext

- (UIWKDocumentContext)init
{
  UIWKDocumentContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentContext;
  result = -[UIWKDocumentContext init](&v3, sel_init);
  if (result)
  {
    result->_selectedRangeInMarkedText = (_NSRange)xmmword_186679030;
    result->_rectsAreInCharacterOrder = 1;
    result->_lastRectRange = (_NSRange)xmmword_186679030;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentContext;
  -[UIWKDocumentContext dealloc](&v3, sel_dealloc);
}

- (NSString)_contextBeforeString
{
  char isKindOfClass;
  NSObject *contextBefore;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  contextBefore = self->_contextBefore;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSString *)-[NSObject string](self->_contextBefore, "string");
    return 0;
  }
  return (NSString *)&contextBefore->isa;
}

- (NSString)_selectedTextString
{
  char isKindOfClass;
  NSObject *selectedText;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  selectedText = self->_selectedText;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSString *)-[NSObject string](self->_selectedText, "string");
    return 0;
  }
  return (NSString *)&selectedText->isa;
}

- (NSString)_contextAfterString
{
  char isKindOfClass;
  NSObject *contextAfter;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  contextAfter = self->_contextAfter;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSString *)-[NSObject string](self->_contextAfter, "string");
    return 0;
  }
  return (NSString *)&contextAfter->isa;
}

- (NSString)_markedTextString
{
  char isKindOfClass;
  NSObject *markedText;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  markedText = self->_markedText;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (NSString *)-[NSObject string](self->_markedText, "string");
    return 0;
  }
  return (NSString *)&markedText->isa;
}

- (_NSRange)selectedTextRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  _NSRange result;

  v3 = -[NSString length](-[UIWKDocumentContext _contextBeforeString](self, "_contextBeforeString"), "length");
  v4 = -[NSString length](-[UIWKDocumentContext _selectedTextString](self, "_selectedTextString"), "length");
  if (v4)
  {
    length = v4;
  }
  else
  {
    location = self->_selectedRangeInMarkedText.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      length = 0;
    }
    else
    {
      v3 += location;
      length = self->_selectedRangeInMarkedText.length;
    }
  }
  v7 = v3;
  result.length = length;
  result.location = v7;
  return result;
}

- (_NSRange)markedTextRange
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[NSString length](-[UIWKDocumentContext _contextBeforeString](self, "_contextBeforeString"), "length");
  v4 = v3 - -[UIWKDocumentContext selectedRangeInMarkedText](self, "selectedRangeInMarkedText");
  v5 = -[NSString length](-[UIWKDocumentContext _markedTextString](self, "_markedTextString"), "length");
  v6 = v4;
  result.length = v5;
  result.location = v6;
  return result;
}

- (void)resetTextRects
{
  -[UIWKDocumentContext set_selectionRects:](self, "set_selectionRects:", 0);
  self->_rectsAreInCharacterOrder = 1;
  self->_lastRectRange = (_NSRange)xmmword_186679030;
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger v11;
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[UIWKDocumentContext _selectionRects](self, "_selectionRects"))
    -[UIWKDocumentContext set_selectionRects:](self, "set_selectionRects:", objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 960));
  -[NSMutableData appendBytes:length:](-[UIWKDocumentContext _selectionRects](self, "_selectionRects", *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, location, length), "appendBytes:length:", &v12, 48);
  if (self->_rectsAreInCharacterOrder)
  {
    v11 = self->_lastRectRange.location;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && location <= v11)
      self->_rectsAreInCharacterOrder = 0;
  }
  self->_lastRectRange.location = location;
  self->_lastRectRange.length = length;
}

- (void)sortTextRectsByCharacterRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_rectsAreInCharacterOrder)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke;
    v16[3] = &unk_1E16C6EE0;
    v16[4] = v3;
    -[UIWKDocumentContext enumerateLayoutRects:](self, "enumerateLayoutRects:", v16);
    objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_217);
    -[UIWKDocumentContext resetTextRects](self, "resetTextRects");
    -[UIWKDocumentContext set_selectionRects:](self, "set_selectionRects:", objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 48 * objc_msgSend(v3, "count")));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          v10 = 0u;
          v11 = 0u;
          v9 = 0u;
          objc_msgSend(v8, "getValue:size:", &v9, 48);
          -[UIWKDocumentContext addTextRect:forCharacterRange:](self, "addTextRect:forCharacterRange:", v11, v9, v10);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v5);
    }
  }
}

uint64_t __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  _QWORD v8[6];

  *(double *)v8 = a4;
  *(double *)&v8[1] = a5;
  *(double *)&v8[2] = a6;
  *(double *)&v8[3] = a7;
  v8[4] = a2;
  v8[5] = a3;
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v8, "{?={CGRect={CGPoint=dd}{CGSize=dd}}{_NSRange=QQ}}"));
}

uint64_t __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;

  v8 = 0u;
  v6 = 0u;
  memset(v7, 0, sizeof(v7));
  objc_msgSend(a2, "getValue:size:", v7, 48, 0, 0, 0, 0);
  objc_msgSend(a3, "getValue:size:", &v5, 48);
  if ((unint64_t)v8 < (unint64_t)v6)
    return -1;
  if ((unint64_t)v8 > (unint64_t)v6)
    return 1;
  if (*((_QWORD *)&v8 + 1) >= *((_QWORD *)&v6 + 1))
    return *((_QWORD *)&v8 + 1) > *((_QWORD *)&v6 + 1);
  return -1;
}

- (unint64_t)closestCharacterIndexForPoint:(CGPoint)a3
{
  unint64_t v3;
  _QWORD v5[6];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FEFFFFFFFFFFFFFLL;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v10 = &unk_18685B0AF;
  v11 = xmmword_186679030;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__UIWKDocumentContext_closestCharacterIndexForPoint___block_invoke;
  v5[3] = &unk_1E16C6F28;
  v6 = a3;
  v5[4] = v12;
  v5[5] = &v7;
  -[UIWKDocumentContext enumerateLayoutRects:](self, "enumerateLayoutRects:", v5);
  v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v12, 8);
  return v3;
}

BOOL __53__UIWKDocumentContext_closestCharacterIndexForPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _BOOL8 result;
  double v11;
  uint64_t v12;

  result = UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), a4, a5, a6, a7);
  if (v11 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v12 + 32) = a2;
    *(_QWORD *)(v12 + 40) = a3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
  }
  return result;
}

- (id)characterRectsForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  _QWORD v8[5];

  length = a3.length;
  location = a3.location;
  -[UIWKDocumentContext sortTextRectsByCharacterRange](self, "sortTextRectsByCharacterRange");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIWKDocumentContext_characterRectsForCharacterRange___block_invoke;
  v8[3] = &unk_1E16C6EE0;
  v8[4] = v6;
  -[UIWKDocumentContext enumerateLayoutRectsWithOptions:characterRange:block:](self, "enumerateLayoutRectsWithOptions:characterRange:block:", 0, location, length, v8);
  return v6;
}

uint64_t __55__UIWKDocumentContext_characterRectsForCharacterRange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:"));
}

- (_NSRange)rangeContainedWithinRect:(CGRect)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _QWORD v7[5];
  CGRect v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  _NSRange result;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = &unk_18685B0AF;
  v13 = xmmword_186679030;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UIWKDocumentContext_rangeContainedWithinRect___block_invoke;
  v7[3] = &unk_1E16C6F50;
  v8 = a3;
  v7[4] = &v9;
  -[UIWKDocumentContext enumerateLayoutRects:](self, "enumerateLayoutRects:", v7);
  v3 = v10[4];
  v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  v5 = v3;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

NSUInteger __48__UIWKDocumentContext_rangeContainedWithinRect___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  NSRange v10;
  uint64_t v11;
  NSRange v13;
  CGRect v14;

  v14.size.height = a7;
  v14.size.width = a6;
  v14.origin.y = a5;
  v14.origin.x = a4;
  v10.location = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v14);
  if (LODWORD(v10.location))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10.location = *(_QWORD *)(v11 + 32);
    if (v10.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v11 + 32) = a2;
      *(_QWORD *)(v11 + 40) = a3;
    }
    else
    {
      v10.length = *(_QWORD *)(v11 + 40);
      v13.location = a2;
      v13.length = a3;
      v10 = NSUnionRange(v10, v13);
      *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v10;
    }
  }
  return v10.location;
}

- (id)stringContainedWithinRect:(CGRect)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[UIWKDocumentContext rangeContainedWithinRect:](self, "rangeContainedWithinRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSString substringWithRange:](-[UIWKDocumentContext fullText](self, "fullText"), "substringWithRange:", v4, v5);
}

- (NSString)fullText
{
  NSString *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSString *v6;
  const __CFString *v7;
  NSString *v8;
  __CFString *v9;
  NSString *v10;
  void *v11;
  __CFString *v12;

  v3 = -[UIWKDocumentContext _contextBeforeString](self, "_contextBeforeString");
  v4 = &stru_1E16EDF20;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E16EDF20;
  v6 = -[UIWKDocumentContext _selectedTextString](self, "_selectedTextString");
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1E16EDF20;
  v8 = -[UIWKDocumentContext _markedTextString](self, "_markedTextString");
  if (v8)
    v9 = (__CFString *)v8;
  else
    v9 = &stru_1E16EDF20;
  v10 = -[UIWKDocumentContext _contextAfterString](self, "_contextAfterString");
  if (v10)
    v4 = (const __CFString *)v10;
  v11 = (void *)MEMORY[0x1E0CB3940];
  if (-[__CFString length](v9, "length"))
    v12 = v9;
  else
    v12 = (__CFString *)v7;
  return (NSString *)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), v5, v12, v4);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)directionalRangeForSelectionRange:(_NSRange)a3
{
  int64_t v3;
  int64_t v4;
  NSUInteger length;
  uint64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    length = a3.length;
    v4 = a3.location - -[UIWKDocumentContext selectedTextRange](self, "selectedTextRange");
    v3 = length - v6;
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (void)enumerateLayoutRects:(id)a3
{
  -[UIWKDocumentContext enumerateLayoutRectsWithOptions:characterRange:block:](self, "enumerateLayoutRectsWithOptions:characterRange:block:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, a3);
}

- (void)enumerateLayoutRectsWithOptions:(unint64_t)a3 characterRange:(_NSRange)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  char v8;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  NSRange v32;
  NSRange v33;

  if (a5)
  {
    length = a4.length;
    location = a4.location;
    v8 = a3;
    if (a4.location == 0x7FFFFFFFFFFFFFFFLL || a4.length)
    {
      if (a4.location != 0x7FFFFFFFFFFFFFFFLL)
        -[UIWKDocumentContext sortTextRectsByCharacterRange](self, "sortTextRectsByCharacterRange");
      v10 = -[NSMutableData length](-[UIWKDocumentContext _selectionRects](self, "_selectionRects"), "length");
      v11 = v10 / 0x30;
      v12 = -[NSMutableData bytes](-[UIWKDocumentContext _selectionRects](self, "_selectionRects"), "bytes");
      v31 = 0;
      if ((v8 & 2) != 0)
      {
        if (v10 >= 0x30)
        {
          v23 = 0;
          v24 = v12 + 48 * v11 - 24;
          do
          {
            v25 = *(double *)(v24 - 24);
            v26 = *(double *)(v24 - 16);
            v27 = *(double *)(v24 - 8);
            v28 = *(double *)v24;
            v29 = *(_QWORD *)(v24 + 8);
            v30 = *(_QWORD *)(v24 + 16);
            if (location == 0x7FFFFFFFFFFFFFFFLL
              || (v33.location = location, v33.length = length, NSIntersectionRange(v33, *(NSRange *)(v24 + 8)).length))
            {
              (*((void (**)(id, uint64_t, uint64_t, char *, double, double, double, double))a5 + 2))(a5, v29, v30, &v31, v25, v26, v27, v28);
              v23 = 1;
            }
            else if ((v23 & 1) != 0)
            {
              v23 = 1;
              v31 = 1;
            }
            else
            {
              v23 = 0;
            }
            if (v11 < 2)
              break;
            v24 -= 48;
            --v11;
          }
          while (!v31);
        }
      }
      else if (v10 >= 0x30)
      {
        v13 = 0;
        v14 = v12 + 24;
        v15 = 1;
        do
        {
          v16 = *(double *)(v14 - 24);
          v17 = *(double *)(v14 - 16);
          v18 = *(double *)(v14 - 8);
          v19 = *(double *)v14;
          v20 = *(_QWORD *)(v14 + 8);
          v21 = *(_QWORD *)(v14 + 16);
          if (location == 0x7FFFFFFFFFFFFFFFLL
            || (v32.location = location, v32.length = length, NSIntersectionRange(v32, *(NSRange *)(v14 + 8)).length))
          {
            (*((void (**)(id, uint64_t, uint64_t, char *, double, double, double, double))a5 + 2))(a5, v20, v21, &v31, v16, v17, v18, v19);
            v13 = 1;
          }
          else if ((v13 & 1) != 0)
          {
            v13 = 1;
            v31 = 1;
          }
          else
          {
            v13 = 0;
          }
          v14 += 48;
          if (v31)
            v22 = 1;
          else
            v22 = v15 >= v11;
          ++v15;
        }
        while (!v22);
      }
    }
  }
}

- (NSMutableData)_selectionRects
{
  return self->_selectionRects;
}

- (void)set_selectionRects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSObject)contextBefore
{
  return self->_contextBefore;
}

- (void)setContextBefore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSObject)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSObject)contextAfter
{
  return self->_contextAfter;
}

- (void)setContextAfter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSObject)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRangeInMarkedText.length;
  location = self->_selectedRangeInMarkedText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRangeInMarkedText:(_NSRange)a3
{
  self->_selectedRangeInMarkedText = a3;
}

- (NSArray)autocorrectedRanges
{
  return self->_autocorrectedRanges;
}

- (void)setAutocorrectedRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSAttributedString)annotatedText
{
  return self->_annotatedText;
}

- (void)setAnnotatedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
