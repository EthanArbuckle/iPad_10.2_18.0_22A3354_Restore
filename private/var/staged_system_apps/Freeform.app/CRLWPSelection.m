@implementation CRLWPSelection

- (unint64_t)insertionChar
{
  return self->_range.location;
}

- (_NSRange)range
{
  _NSRange *p_leadingCharIndex;
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  if (-[CRLWPSelection isVisual](self, "isVisual")
    && -[CRLWPSelection isInsertionPoint](self, "isInsertionPoint")
    && !self->_leadingEdge)
  {
    length = 0;
    p_leadingCharIndex = (_NSRange *)&self->_leadingCharIndex;
  }
  else
  {
    p_leadingCharIndex = &self->_range;
    length = self->_range.length;
  }
  location = p_leadingCharIndex->location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)insertionEdge
{
  return -[CRLWPSelection leadingEdge](self, "leadingEdge") ^ 1;
}

- (void)setInsertionEdge:(unint64_t)a3
{
  self->_leadingEdge = a3 == 0;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9
{
  NSUInteger length;
  NSUInteger location;
  CRLWPSelection *v14;
  CRLWPSelection *v15;
  __int128 *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  CRLWPSelection *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  _NSRange v32;

  length = a4.length;
  location = a4.location;
  v32 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CRLWPSelection;
  v14 = -[CRLWPSelection init](&v31, "init");
  v15 = v14;
  if (!v14)
    goto LABEL_34;
  v14->_type = a3;
  v14->_range.location = location;
  v14->_range.length = length;
  if (length)
    a8 = 1;
  v14->_leadingEdge = a8;
  if (length)
    a9 = 0x7FFFFFFFFFFFFFFFLL;
  v14->_leadingCharIndex = a9;
  v14->_styleInsertionBehavior = a5;
  v14->_caretAffinity = a6;
  if (a3 == 6)
  {
    v18 = (__int128 *)&v32;
  }
  else
  {
    v18 = &xmmword_100EEE418;
    if (a7.location != 0x7FFFFFFFFFFFFFFFLL || a7.length)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E0E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E34A78();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E108);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 143, 0, "Non smartfield selection has smartField range");

      v18 = &xmmword_100EEE418;
    }
  }
  v15->_smartFieldRange = (_NSRange)*v18;
  v15->_validVisualRanges = 0;
  v15->_headCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  v15->_tailCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  v15->_tailCursorAffinity = 1;
  if (length)
    v22 = 2;
  else
    v22 = 1;
  v15->_headCursorAffinity = v22;
  if (length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E128);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E349F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E148);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 157, 0, "illegal range length");

  }
  if ((location & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E168);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34978();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E188);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 158, 0, "illegal range location");

    goto LABEL_44;
  }
  if (length > 0x7FFFFFFFFFFFFFFELL)
  {
LABEL_44:
    v26 = 0;
    goto LABEL_45;
  }
LABEL_34:
  v26 = v15;
LABEL_45:

  return v26;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CRLWPSelection *v19;
  uint64_t v21;

  length = a4.length;
  location = a4.location;
  v13 = a9;
  v14 = v13;
  if (a3 == 7 && !v13 && !a8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E1A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34AF8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E1C8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 169, 0, "Selection has a leading edge but no storage to get the leading char");

    goto LABEL_17;
  }
  if (a3 != 7 || !v13 || a8)
  {
LABEL_17:
    v18 = (id)location;
    goto LABEL_18;
  }
  v18 = objc_msgSend(v13, "nextCharacterIndex:", location);
LABEL_18:
  LOBYTE(v21) = a8;
  v19 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", a3, location, length, a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0, v21, v18);

  return v19;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", a3, a4.location, a4.length, *(_QWORD *)&a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0, v7, 0);
}

- (CRLWPSelection)initWithRange:(_NSRange)a3
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  return -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, a3.location, a3.length, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v4, 0);
}

- (CRLWPSelection)initWithRangeArray:(id)a3
{
  id v5;
  CRLWPSelection *v6;
  NSUInteger v7;
  uint64_t v9;

  v5 = a3;
  LOBYTE(v9) = 1;
  v6 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, v9, 0x7FFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if (objc_msgSend(v5, "rangeCount"))
    {
      v6->_range.location = (NSUInteger)objc_msgSend(v5, "superRange");
      v6->_range.length = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v6->_visualRanges, a3);
        v6->_validVisualRanges = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;
  uint64_t v9;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  v7 = objc_msgSend(v6, "allocWithZone:", a3, v5);
  LOBYTE(v9) = self->_leadingEdge;
  return objc_msgSend(v7, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v9, self->_leadingCharIndex);
}

+ (CRLWPSelection)selectionWithRange:(_NSRange)a3
{
  return (CRLWPSelection *)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
}

+ (CRLWPSelection)selectionWithRange:(_NSRange)a3 type:(unint64_t)a4 leadingEdge:(BOOL)a5 storage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  v11 = a6;
  LOBYTE(v14) = a5;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", a4, location, length, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v14, v11);

  return (CRLWPSelection *)v12;
}

+ (id)selectionFromWPSelection:(id)a3
{
  id *v4;
  id *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v4 = (id *)a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, a1) & 1) != 0)
    {
      return v5;
    }
    else
    {
      v10 = objc_alloc((Class)a1);
      v11 = objc_msgSend(v5, "type");
      v12 = objc_msgSend(v5, "rawRange");
      v14 = v13;
      v15 = objc_msgSend(v5, "styleInsertionBehavior");
      v16 = objc_msgSend(v5, "caretAffinity");
      v17 = objc_msgSend(v5, "smartFieldRange");
      v19 = v18;
      LOBYTE(v21) = objc_msgSend(v5, "leadingEdge");
      v20 = objc_msgSend(v10, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v11, v12, v14, v15, v16, v17, v19, v21, objc_msgSend(v5, "leadingCharIndex"));
      *((_QWORD *)v20 + 4) = v5[4];
      *((_QWORD *)v20 + 5) = v5[5];
      *((_BYTE *)v20 + 64) = *((_BYTE *)v5 + 64);
      objc_storeStrong((id *)v20 + 12, v5[12]);

      return v20;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E1E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34B78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E208);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPSelection selectionFromWPSelection:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 227, 0, "invalid nil value for '%{public}s'", "wpSelection");

    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  return -[CRLWPSelection p_isEqual:](self, "p_isEqual:", a3);
}

- (BOOL)p_isEqual:(id)a3
{
  uint64_t v4;
  CRLWPSelection *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;

  v5 = (CRLWPSelection *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class(CRLWPSelection, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)v8;
    v12 = 0;
    if (v8)
    {
      v10 = self->_range.location == *(_QWORD *)(v8 + 16) && self->_range.length == *(_QWORD *)(v8 + 24);
      if (v10
        && self->_type == *(_QWORD *)(v8 + 8)
        && self->_styleInsertionBehavior == *(_DWORD *)(v8 + 68)
        && self->_caretAffinity == *(_QWORD *)(v8 + 72))
      {
        v11 = self->_smartFieldRange.location == *(_QWORD *)(v8 + 80)
           && self->_smartFieldRange.length == *(_QWORD *)(v8 + 88);
        if (v11
          && self->_leadingEdge == *(unsigned __int8 *)(v8 + 48)
          && self->_leadingCharIndex == *(_QWORD *)(v8 + 56)
          && self->_validVisualRanges == *(unsigned __int8 *)(v8 + 64)
          && (!self->_validVisualRanges
           || -[CRLWPRangeArray isEqualToRangeArray:](self->_visualRanges, "isEqualToRangeArray:", *(_QWORD *)(v8 + 96))))
        {
          v12 = 1;
        }
      }
    }

  }
  return v12;
}

- (unint64_t)hash
{
  CRLHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(CRLHasher);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_range.location);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_range.length);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_type);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_styleInsertionBehavior);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_caretAffinity);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_smartFieldRange.location);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_smartFieldRange.length);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_leadingCharIndex);
  -[CRLHasher addUnsignedInteger:](v3, "addUnsignedInteger:", self->_validVisualRanges);
  -[CRLHasher addBool:](v3, "addBool:", self->_leadingEdge);
  v4 = -[CRLHasher hashValue](v3, "hashValue");

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int64_t v10;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v4 = a3;
  objc_opt_class(CRLWPSelection, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8 && -[CRLWPSelection isValid](self, "isValid") && objc_msgSend(v8, "isValid"))
  {
    v9 = -[CRLWPSelection range](self, "range");
    if (v9 >= objc_msgSend(v8, "range"))
    {
      v12 = -[CRLWPSelection range](self, "range");
      if (v12 > objc_msgSend(v8, "range"))
      {
        v10 = 1;
        goto LABEL_7;
      }
      -[CRLWPSelection range](self, "range");
      v14 = v13;
      objc_msgSend(v8, "range");
      if (v14 >= v15)
      {
        -[CRLWPSelection range](self, "range");
        v17 = v16;
        objc_msgSend(v8, "range");
        v10 = v17 > v18;
        goto LABEL_7;
      }
    }
    v10 = -1;
  }
  else
  {
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (BOOL)isVisual
{
  return self->_type == 7;
}

- (BOOL)isRange
{
  return self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isInsertionPoint
{
  return !self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValid
{
  return self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEmpty
{
  return !-[CRLWPSelection isValid](self, "isValid");
}

- (BOOL)allowsKeyCommandCaching
{
  return 1;
}

- (BOOL)isEquivalentForInsertionStyle:(id)a3
{
  uint64_t v4;
  CRLWPSelection *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = (CRLWPSelection *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class(CRLWPSelection, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = -[CRLWPSelection range](self, "range");
      v9 = v8;
      v11 = 0;
      if (v7 == -[CRLWPSelection range](v5, "range") && v9 == v10)
        v11 = self->_type == v5->_type;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithNewType:(unint64_t)a3 smartFieldRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  Class v8;
  id v9;
  uint64_t v11;

  length = a4.length;
  location = a4.location;
  objc_opt_class(self, a2);
  v9 = [v8 alloc];
  LOBYTE(v11) = self->_leadingEdge;
  return objc_msgSend(v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", a3, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v11, self->_leadingCharIndex);
}

- (id)copyWithNewType:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSRange *p_smartFieldRange;
  NSUInteger v9;
  NSUInteger v10;
  Class v11;
  id v12;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  if (a3 == 6)
    p_smartFieldRange = &self->_smartFieldRange;
  else
    p_smartFieldRange = (_NSRange *)&xmmword_100EEE418;
  v9 = p_smartFieldRange->location;
  v10 = p_smartFieldRange->length;
  objc_opt_class(self, a2);
  v12 = [v11 alloc];
  LOBYTE(v14) = self->_leadingEdge;
  return objc_msgSend(v12, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", a3, location, length, self->_styleInsertionBehavior, self->_caretAffinity, v9, v10, v14, location);
}

- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  Class v10;
  id v11;
  id v12;
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  objc_opt_class(self, a2);
  v11 = [v10 alloc];
  LOBYTE(v14) = self->_leadingEdge;
  v12 = objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, location, length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v14, self->_leadingCharIndex);
  objc_msgSend(v12, "setHeadCharIndex:tailCharIndex:", a4, a5);
  return v12;
}

- (id)copyWithNewType:(unint64_t)a3
{
  _NSRange *p_smartFieldRange;
  NSUInteger location;
  NSUInteger length;
  Class v8;
  id v9;
  uint64_t v11;

  if (a3 == 6)
    p_smartFieldRange = &self->_smartFieldRange;
  else
    p_smartFieldRange = (_NSRange *)&xmmword_100EEE418;
  location = p_smartFieldRange->location;
  length = p_smartFieldRange->length;
  objc_opt_class(self, a2);
  v9 = [v8 alloc];
  LOBYTE(v11) = self->_leadingEdge;
  return objc_msgSend(v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", a3, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v11, self->_leadingCharIndex);
}

- (id)copyWithNewRange:(_NSRange)a3
{
  return -[CRLWPSelection copyWithNewRange:newCaretAffinity:](self, "copyWithNewRange:newCaretAffinity:", a3.location, a3.length, self->_caretAffinity);
}

- (id)copyWithNewRange:(_NSRange)a3 newCaretAffinity:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  Class v8;
  _QWORD *v9;
  void *v10;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  objc_opt_class(self, a2);
  LOBYTE(v13) = 1;
  v9 = objc_msgSend([v8 alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, location, length, self->_styleInsertionBehavior, a4, self->_smartFieldRange.location, self->_smartFieldRange.length, v13, location);
  v10 = v9;
  if (v9)
  {
    if (location == self->_range.location && length == self->_range.length)
    {
      if (self->_type == 7 && self->_validVisualRanges)
      {
        objc_msgSend(v9, "i_setVisualRanges:", self->_visualRanges);
        objc_msgSend(v10, "setHeadCharIndex:tailCharIndex:", self->_headCharIndex, self->_tailCharIndex);
      }
    }
    else
    {
      v9[9] = 0;
    }
  }
  return v10;
}

- (id)copyWithNewStyleInsertionBehavior:(int)a3 newCaretAffinity:(unint64_t)a4
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  BOOL leadingEdge;
  Class v10;
  uint64_t v12;

  v5 = *(_QWORD *)&a3;
  location = self->_range.location;
  length = self->_range.length;
  leadingEdge = self->_leadingEdge;
  if (!a4 && self->_caretAffinity == 1)
  {
    if (-[CRLWPSelection isInsertionPoint](self, "isInsertionPoint"))
      location = self->_leadingCharIndex;
    leadingEdge = 1;
  }
  objc_opt_class(self, a2);
  LOBYTE(v12) = leadingEdge;
  return objc_msgSend([v10 alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, location, length, v5, a4, self->_smartFieldRange.location, self->_smartFieldRange.length, v12, self->_leadingCharIndex);
}

- (id)constrainToRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPSelection *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  CRLWPSelection *v15;
  NSRange v17;
  NSRange v18;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v17.location = (NSUInteger)-[CRLWPSelection range](v5, "range");
  v6 = v17.location;
  v7 = v17.length;
  v18.location = location;
  v18.length = length;
  v8 = sub_1001E966C(v17, v18, 1);
  if (v8 != v6 || v9 != v7)
  {
    v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
    v11 = v9 == 0;
    if (v6 + v7 <= location + length)
      v12 = location;
    else
      v12 = location + length;
    if (v10 && v11)
      v13 = v12;
    else
      v13 = v8;
    if (v10 && v11)
      v14 = 0;
    else
      v14 = v9;
    v15 = -[CRLWPSelection copyWithNewRange:](v5, "copyWithNewRange:", v13, v14);

    v5 = v15;
  }
  return v5;
}

- (id)copyWithNewVisualRanges:(id)a3
{
  id v4;
  uint64_t v5;
  Class v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v4 = a3;
  objc_opt_class(self, v5);
  v7 = [v6 alloc];
  v8 = objc_msgSend(v4, "superRange");
  LOBYTE(v12) = self->_leadingEdge;
  v10 = objc_msgSend(v7, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, v8, v9, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v12, self->_leadingCharIndex);
  objc_msgSend(v10, "i_setVisualRanges:", v4);

  return v10;
}

- (id)copyWithVisualRanges:(id)a3 headCharIndex:(unint64_t)a4 tailCharIndex:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  Class v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  _BOOL4 v23;

  v23 = a7;
  v7 = a6;
  v12 = a3;
  if (self->_type != 7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E228);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34C1C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E248);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection copyWithVisualRanges:headCharIndex:tailCharIndex:rightToLeft:sameLine:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 482, 0, "Selection type must be visual");

  }
  objc_opt_class(self, v11);
  v17 = [v16 alloc];
  LOBYTE(v22) = self->_leadingEdge;
  v18 = objc_msgSend(v17, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v22, self->_leadingCharIndex);
  objc_msgSend(v18, "i_setVisualRanges:", v12);
  if (v23 && v7)
    v19 = a5;
  else
    v19 = a4;
  if (v23 && v7)
    v20 = a4;
  else
    v20 = a5;
  objc_msgSend(v18, "setHeadCharIndex:tailCharIndex:", v19, v20);

  return v18;
}

- (unint64_t)end
{
  return self->_range.length + self->_range.location;
}

- (_NSRange)superRange
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  if (self->_type == 7
    && -[CRLWPSelection isRange](self, "isRange")
    && -[CRLWPRangeArray rangeCount](self->_visualRanges, "rangeCount"))
  {
    v3 = -[CRLWPRangeArray superRange](self->_visualRanges, "superRange");
  }
  else
  {
    v3 = -[CRLWPSelection range](self, "range");
  }
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (void)i_setVisualRanges:(id)a3
{
  CRLWPRangeArray *v4;
  CRLWPRangeArray *visualRanges;
  id v6;

  v6 = a3;
  v4 = (CRLWPRangeArray *)objc_msgSend(v6, "copy");
  visualRanges = self->_visualRanges;
  self->_visualRanges = v4;

  -[CRLWPRangeArray enumerateRanges:](self->_visualRanges, "enumerateRanges:", &stru_10125E288);
  self->_validVisualRanges = 1;

}

- (id)visualRanges
{
  return self->_visualRanges;
}

- (id)i_visualRanges
{
  return self->_visualRanges;
}

- (id)visualRangesArray
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  CRLWPRangeArray *visualRanges;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  if (self->_type == 7 && !self->_validVisualRanges && -[CRLWPSelection isRange](self, "isRange"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E2E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E34D1C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125E308);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection visualRangesArray]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 544, 0, "Visual ranges have not been calculated");

  }
  v6 = -[CRLWPRangeArray rangeCount](self->_visualRanges, "rangeCount");
  if (v6 < 2)
  {
    v11 = -[CRLWPSelection superRange](self, "superRange", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v11, v12));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v10));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
    visualRanges = self->_visualRanges;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10043E3DC;
    v14[3] = &unk_10125E330;
    v9 = v7;
    v15 = v9;
    -[CRLWPRangeArray enumerateRanges:](visualRanges, "enumerateRanges:", v14);
    v10 = v15;
  }

  return v9;
}

- (void)setHeadCharIndex:(unint64_t)a3 tailCharIndex:(unint64_t)a4
{
  self->_headCharIndex = a3;
  self->_tailCharIndex = a4;
}

- (unint64_t)visualRangeCount
{
  return -[CRLWPRangeArray rangeCount](self->_visualRanges, "rangeCount");
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  NSUInteger location;
  NSUInteger v4;
  BOOL v5;

  location = self->_range.location;
  v5 = a3 >= location;
  v4 = a3 - location;
  v5 = !v5 || v4 >= self->_range.length;
  return !v5;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPSelection visualRangesArray](self, "visualRangesArray"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "rangeValue", (_QWORD)v14);
        if (sub_1001B2980(a3, 0, (uint64_t)v10, v11, v4))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)intersectsRange:(_NSRange)a3
{
  _NSRange *p_range;
  NSRange v4;
  NSUInteger location;
  BOOL v8;
  BOOL v9;

  p_range = &self->_range;
  v4.length = self->_range.length;
  if (v4.length)
  {
    v4.location = p_range->location;
    return NSIntersectionRange(v4, a3).length != 0;
  }
  else
  {
    location = p_range->location;
    v8 = location >= a3.location && location - a3.location < a3.length;
    v9 = location == a3.location;
    if (a3.length)
      return v8;
    else
      return v9;
  }
}

- (BOOL)isAtEndOfLine
{
  return self->_caretAffinity == 1;
}

- (id)description
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  unint64_t type;
  NSString *v9;
  void *v10;
  _BOOL4 validVisualRanges;
  __CFString *v12;
  unsigned int v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;

  objc_opt_class(self, a2);
  v5 = v4;
  v6 = sub_10043BBD4(self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  type = self->_type;
  v9 = NSStringFromRange(self->_range);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  validVisualRanges = self->_validVisualRanges;
  if (self->_validVisualRanges)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSelection visualRangesArray](self, "visualRangesArray"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));
  }
  else
  {
    v12 = CFSTR("not set");
  }
  v13 = -[CRLWPSelection isAtEndOfLine](self, "isAtEndOfLine");
  v14 = -[CRLWPSelection insertionEdge](self, "insertionEdge");
  v15 = CFSTR(".start");
  if (v13)
    v15 = CFSTR(".end");
  v16 = CFSTR(".trailing");
  if (!v14)
    v16 = CFSTR(".leading");
  if (self->_leadingEdge)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@*) %p: type: %@(%lu), %@, visual ranges: %@, caretAffinity: %@, insertionEdge: %@, leadingEdge: %@"), v5, self, v7, type, v10, v12, v15, v16, v17));
  if (validVisualRanges)
  {

  }
  return v18;
}

- (_NSRange)rawRange
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (_NSRange)smartFieldRange
{
  _NSRange *p_smartFieldRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_smartFieldRange = &self->_smartFieldRange;
  location = self->_smartFieldRange.location;
  length = p_smartFieldRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)headCharIndex
{
  return self->_headCharIndex;
}

- (void)setHeadCharIndex:(unint64_t)a3
{
  self->_headCharIndex = a3;
}

- (unint64_t)tailCharIndex
{
  return self->_tailCharIndex;
}

- (void)setTailCharIndex:(unint64_t)a3
{
  self->_tailCharIndex = a3;
}

- (BOOL)leadingEdge
{
  return self->_leadingEdge;
}

- (unint64_t)leadingCharIndex
{
  return self->_leadingCharIndex;
}

- (BOOL)validVisualRanges
{
  return self->_validVisualRanges;
}

- (int)styleInsertionBehavior
{
  return self->_styleInsertionBehavior;
}

- (unint64_t)caretAffinity
{
  return self->_caretAffinity;
}

- (unint64_t)headCursorAffinity
{
  return self->_headCursorAffinity;
}

- (void)setHeadCursorAffinity:(unint64_t)a3
{
  self->_headCursorAffinity = a3;
}

- (unint64_t)tailCursorAffinity
{
  return self->_tailCursorAffinity;
}

- (void)setTailCursorAffinity:(unint64_t)a3
{
  self->_tailCursorAffinity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualRanges, 0);
}

@end
