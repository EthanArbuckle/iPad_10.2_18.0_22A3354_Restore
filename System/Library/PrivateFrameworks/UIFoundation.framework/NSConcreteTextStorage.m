@implementation NSConcreteTextStorage

- (unint64_t)length
{
  return -[NSConcreteMutableAttributedString length](self->_contents, "length");
}

- (id)string
{
  return -[NSConcreteMutableAttributedString string](self->_contents, "string");
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__NSConcreteTextStorage_replaceCharactersInRange_withAttributedString___block_invoke;
  v4[3] = &unk_1E2605A68;
  v4[4] = a4;
  v4[5] = self;
  v5 = a3;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__NSConcreteTextStorage_removeAttribute_range___block_invoke;
  v4[3] = &unk_1E2605A68;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NSConcreteTextStorage_setAttributes_range___block_invoke;
  v4[3] = &unk_1E2605A68;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  _QWORD v5[7];
  _NSRange v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NSConcreteTextStorage_addAttribute_value_range___block_invoke;
  v5[3] = &unk_1E2605AB8;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  v6 = a5;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v5);
}

uint64_t __50__NSConcreteTextStorage_addAttribute_value_range___block_invoke(uint64_t a1)
{
  __CFString *v2;
  char v3;
  uint64_t result;

  v2 = *(__CFString **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "_attributeFixingInProgress");
  if ((v3 & 1) == 0 && -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("NSOriginalFont")))
    v2 = CFSTR("NSFont");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "addAttribute:value:range:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if ((v3 & 1) == 0)
  {
    result = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("NSFont"));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeAttribute:range:", CFSTR("NSOriginalFont"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  return result;
}

- (BOOL)_attributeFixingInProgress
{
  return (*(_BYTE *)&self->_pFlags >> 3) & 1;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *v12;

  length = a5.length;
  location = a5.location;
  if (-[NSConcreteMutableAttributedString length](self->_contents, "length") <= a3)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem()), 0);
    objc_exception_throw(v12);
  }
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a3, 1);
  v10 = (void *)-[NSConcreteNotifyingMutableAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a4 || (*(_DWORD *)&self->_pFlags & 1) == 0)
      return v10;
  }
  else if (!a4)
  {
    return v10;
  }
  if (*((_QWORD *)self->super._sideData + 2) == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange())
    return v10;
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4->location, a4->length);
  return (id)-[NSConcreteNotifyingMutableAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7;
  _QWORD *sideData;
  unint64_t v9;
  unint64_t v10;
  void *v12;

  if (-[NSConcreteMutableAttributedString length](self->_contents, "length") <= a3)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem()), 0);
    objc_exception_throw(v12);
  }
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a3, 1);
  v7 = -[NSConcreteMutableAttributedString attributesAtIndex:effectiveRange:](self->_contents, "attributesAtIndex:effectiveRange:", a3, a4);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a4 || (*(_DWORD *)&self->_pFlags & 1) == 0)
      return v7;
  }
  else if (!a4)
  {
    return v7;
  }
  if (*((_QWORD *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
  {
    sideData = self->super._sideData;
    v9 = sideData[2];
    if (v9 <= a3)
    {
      v10 = sideData[3] + v9;
      if (v10 <= a3)
      {
        a4->length += a4->location - v10;
        a4->location = *((_QWORD *)self->super._sideData + 3) + *((_QWORD *)self->super._sideData + 2);
      }
    }
    else
    {
      a4->length = v9 - a4->location;
    }
  }
  return v7;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v14;

  length = a6.length;
  location = a6.location;
  if (-[NSConcreteMutableAttributedString length](self->_contents, "length") <= a4)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem()), 0);
    objc_exception_throw(v14);
  }
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4, 1);
  v12 = -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, location, length);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a5 || (*(_DWORD *)&self->_pFlags & 1) == 0)
      return v12;
  }
  else if (!a5)
  {
    return v12;
  }
  if (*((_QWORD *)self->super._sideData + 2) == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange())
    return v12;
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a5->location, a5->length);
  return -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, location, length);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v9;
  _QWORD *sideData;
  unint64_t v11;
  unint64_t v12;
  void *v14;

  if (-[NSConcreteMutableAttributedString length](self->_contents, "length") <= a4)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem()), 0);
    objc_exception_throw(v14);
  }
  if (-[NSTextStorage ensuresFixingAttributes](self, "ensuresFixingAttributes"))
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4, 1);
  v9 = -[NSConcreteMutableAttributedString attribute:atIndex:effectiveRange:](self->_contents, "attribute:atIndex:effectiveRange:", a3, a4, a5);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a5 || (*(_DWORD *)&self->_pFlags & 1) == 0)
      return v9;
  }
  else if (!a5)
  {
    return v9;
  }
  if (*((_QWORD *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
  {
    sideData = self->super._sideData;
    v11 = sideData[2];
    if (v11 <= a4)
    {
      v12 = sideData[3] + v11;
      if (v12 <= a4)
      {
        a5->length += a5->location - v12;
        a5->location = *((_QWORD *)self->super._sideData + 3) + *((_QWORD *)self->super._sideData + 2);
      }
    }
    else
    {
      a5->length = v11 - a5->location;
    }
  }
  return v9;
}

- (BOOL)_forceFixAttributes
{
  return *(_DWORD *)&self->_pFlags & 1;
}

- (void)_setAttributeFixingInProgress:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_pFlags = ($E9BC4BBA338FE356C86766C4523490AC)(*(_DWORD *)&self->_pFlags & 0xFFFFFFF7 | v3);
}

- (BOOL)_mayRequireIntentResolution
{
  return -[NSConcreteMutableAttributedString _mayRequireIntentResolution](self->_contents, "_mayRequireIntentResolution");
}

uint64_t __45__NSConcreteTextStorage_setAttributes_range___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[8];

  if ((objc_msgSend(*(id *)(a1 + 32), "_attributeFixingInProgress") & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setAttributes:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSOriginalFont"));
  if (!v2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setAttributes:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = v2;
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSFont"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __45__NSConcreteTextStorage_setAttributes_range___block_invoke_2;
  v9[3] = &unk_1E2605A90;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v5 + 96);
  v9[1] = 3221225472;
  v9[4] = v6;
  v9[5] = v3;
  v9[6] = v4;
  v9[7] = v5;
  return objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0x100000, v9);
}

uint64_t __47__NSConcreteTextStorage_removeAttribute_range___block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "_attributeFixingInProgress")
    && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("NSFont")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAttribute:range:", CFSTR("NSOriginalFont"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAttribute:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __71__NSConcreteTextStorage_replaceCharactersInRange_withAttributedString___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[5] + 96), "replaceCharactersInRange:withAttributedString:", a1[6], a1[7], a1[4]);

}

- (NSConcreteTextStorage)initWithAttributedString:(id)a3
{
  NSConcreteTextStorage *v4;
  NSConcreteTextStorage *v5;
  NSConcreteNotifyingMutableAttributedString *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSConcreteTextStorage;
  v4 = -[NSTextStorage init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSConcreteMutableAttributedString initWithAttributedString:](+[NSConcreteNotifyingMutableAttributedString allocWithZone:](NSConcreteNotifyingMutableAttributedString, "allocWithZone:", -[NSConcreteTextStorage zone](v4, "zone")), "initWithAttributedString:", a3);
    v5->_contents = v6;
    -[NSConcreteNotifyingMutableAttributedString setDelegate:](v6, "setDelegate:", v5);
    -[NSConcreteTextStorage _initLocks](v5, "_initLocks");
    v7 = -[NSConcreteTextStorage length](v5, "length");
    if (v7)
      -[NSTextStorage edited:range:changeInLength:](v5, "edited:range:changeInLength:", 3, 0, 0, v7);
  }
  return v5;
}

- (NSConcreteTextStorage)init
{
  NSConcreteTextStorage *v2;
  NSConcreteTextStorage *v3;
  NSConcreteNotifyingMutableAttributedString *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSConcreteTextStorage;
  v2 = -[NSTextStorage init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[NSConcreteMutableAttributedString initWithString:](+[NSConcreteNotifyingMutableAttributedString allocWithZone:](NSConcreteNotifyingMutableAttributedString, "allocWithZone:", -[NSConcreteTextStorage zone](v2, "zone")), "initWithString:", &stru_1E260C7D0);
    v3->_contents = v4;
    -[NSConcreteNotifyingMutableAttributedString setDelegate:](v4, "setDelegate:", v3);
    -[NSConcreteTextStorage _initLocks](v3, "_initLocks");
    v5 = -[NSConcreteTextStorage length](v3, "length");
    if (v5)
      -[NSTextStorage edited:range:changeInLength:](v3, "edited:range:changeInLength:", 3, 0, 0, v5);
  }
  return v3;
}

- (void)_initLocks
{
  if (!-[NSAttributedString _isStringDrawingTextStorage](self, "_isStringDrawingTextStorage"))
  {
    if ((*(_BYTE *)&self->_pFlags & 4) != 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextStorage.m"), 895, CFSTR("Lock is initialized!"));
    pthread_rwlock_init(&self->_lock, 0);
    pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey](NSConcreteTextStorage, "_writerCountTSDKey"), 0);
    *(_DWORD *)&self->_pFlags |= 4u;
  }
}

- (BOOL)fixesAttributesLazily
{
  void *v3;

  if ((fixesAttributesLazily_readDefault & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSAlwaysFixAttributesLazily")))
      fixesAttributesLazily_alwaysFixAttributesLazily = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSAlwaysFixAttributesLazily"));
    fixesAttributesLazily_readDefault = 1;
  }
  return fixesAttributesLazily_alwaysFixAttributesLazily
      || *((_QWORD *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL
      || self->super._editedRange.location == 0x7FFFFFFFFFFFFFFFLL
      || (self->super._editedRange.length & 0xFFFFFFFFFFFF0000) != 0;
}

- (BOOL)_lockForReading
{
  if ((*(_BYTE *)&self->_pFlags & 4) == 0
    || -[NSAttributedString _isStringDrawingTextStorage](self, "_isStringDrawingTextStorage"))
  {
    return 0;
  }
  pthread_rwlock_rdlock(&self->_lock);
  return 1;
}

- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3
{
  int v4;
  int v6;
  char *v7;

  if ((*(_BYTE *)&self->_pFlags & 4) == 0
    || -[NSAttributedString _isStringDrawingTextStorage](self, "_isStringDrawingTextStorage", a3))
  {
    return 0;
  }
  v4 = pthread_rwlock_trywrlock(&self->_lock);
  if (v4 != 11 && v4 != 0)
    return 0;
  v6 = v4;
  v7 = (char *)pthread_getspecific(+[NSConcreteTextStorage _writerCountTSDKey](NSConcreteTextStorage, "_writerCountTSDKey"));
  pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey](NSConcreteTextStorage, "_writerCountTSDKey"), v7 + 1);
  return v6 == 11 || v6 == 0;
}

- (void)_unlock
{
  char *v3;
  char *v4;

  if ((*(_BYTE *)&self->_pFlags & 4) != 0
    && !-[NSAttributedString _isStringDrawingTextStorage](self, "_isStringDrawingTextStorage"))
  {
    v3 = (char *)pthread_getspecific(+[NSConcreteTextStorage _writerCountTSDKey](NSConcreteTextStorage, "_writerCountTSDKey"));
    if (!v3
      || (v4 = v3 - 1,
          pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey](NSConcreteTextStorage, "_writerCountTSDKey"), v3 - 1), !v4))
    {
      pthread_rwlock_unlock(&self->_lock);
    }
  }
}

+ (unint64_t)_writerCountTSDKey
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSConcreteTextStorage__writerCountTSDKey__block_invoke;
  v3[3] = &unk_1E2605A40;
  v3[4] = a1;
  v3[5] = a2;
  if (_writerCountTSDKey_onceToken != -1)
    dispatch_once(&_writerCountTSDKey_onceToken, v3);
  return _writerCountTSDKey_key;
}

- (void)dealloc
{
  NSConcreteNotifyingMutableAttributedString *contents;
  objc_super v4;

  contents = self->_contents;
  if ((*(_BYTE *)&self->_pFlags & 4) != 0)
  {
    pthread_rwlock_destroy(&self->_lock);
    *(_DWORD *)&self->_pFlags &= ~4u;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSConcreteTextStorage;
  -[NSTextStorage dealloc](&v4, sel_dealloc);

}

- (void)_setForceFixAttributes:(BOOL)a3
{
  self->_pFlags = ($E9BC4BBA338FE356C86766C4523490AC)(*(_DWORD *)&self->_pFlags & 0xFFFFFFFE | a3);
}

uint64_t __43__NSConcreteTextStorage__writerCountTSDKey__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&_writerCountTSDKey_key, 0);
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("NSTextStorage.m"), 839, CFSTR("Unable to create TL key for r/w lock!"));
  return result;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSConcreteTextStorage)initWithString:(id)a3
{
  NSConcreteTextStorage *v4;
  NSConcreteTextStorage *v5;
  NSConcreteNotifyingMutableAttributedString *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSConcreteTextStorage;
  v4 = -[NSTextStorage init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSConcreteMutableAttributedString initWithString:](+[NSConcreteNotifyingMutableAttributedString allocWithZone:](NSConcreteNotifyingMutableAttributedString, "allocWithZone:", -[NSConcreteTextStorage zone](v4, "zone")), "initWithString:", a3);
    v5->_contents = v6;
    -[NSConcreteNotifyingMutableAttributedString setDelegate:](v6, "setDelegate:", v5);
    -[NSConcreteTextStorage _initLocks](v5, "_initLocks");
    v7 = -[NSConcreteTextStorage length](v5, "length");
    if (v7)
      -[NSTextStorage edited:range:changeInLength:](v5, "edited:range:changeInLength:", 3, 0, 0, v7);
  }
  return v5;
}

- (NSConcreteTextStorage)initWithString:(id)a3 attributes:(id)a4
{
  NSConcreteTextStorage *v6;
  NSConcreteTextStorage *v7;
  NSConcreteNotifyingMutableAttributedString *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSConcreteTextStorage;
  v6 = -[NSTextStorage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = -[NSConcreteMutableAttributedString initWithString:attributes:](+[NSConcreteNotifyingMutableAttributedString allocWithZone:](NSConcreteNotifyingMutableAttributedString, "allocWithZone:", -[NSConcreteTextStorage zone](v6, "zone")), "initWithString:attributes:", a3, a4);
    v7->_contents = v8;
    -[NSConcreteNotifyingMutableAttributedString setDelegate:](v8, "setDelegate:", v7);
    -[NSConcreteTextStorage _initLocks](v7, "_initLocks");
    v9 = -[NSConcreteTextStorage length](v7, "length");
    if (v9)
      -[NSTextStorage edited:range:changeInLength:](v7, "edited:range:changeInLength:", 3, 0, 0, v9);
  }
  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__NSConcreteTextStorage_replaceCharactersInRange_withString___block_invoke;
  v4[3] = &unk_1E2605A68;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __61__NSConcreteTextStorage_replaceCharactersInRange_withString___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 96), "replaceCharactersInRange:withString:", a1[6], a1[7], a1[5]);
}

void __45__NSConcreteTextStorage_setAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
  if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(a2, "objectForKey:", CFSTR("NSOriginalFont")))&& ((v10 = *(void **)(a1 + 48), v10 == (void *)v9) || (objc_msgSend(v10, "isEqual:", v9) & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("NSOriginalFont"));
    v11 = v8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 96), "setAttributes:range:", v8, a3, a4);

}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  _QWORD v4[6];
  _NSRange v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NSConcreteTextStorage_addAttributes_range___block_invoke;
  v4[3] = &unk_1E2605A68;
  v4[4] = self;
  v4[5] = a3;
  v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __45__NSConcreteTextStorage_addAttributes_range___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  __int128 v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "_attributeFixingInProgress") & 1) != 0
    || (v2 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSOriginalFont"))) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addAttributes:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("NSFont"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__NSConcreteTextStorage_addAttributes_range___block_invoke_2;
    v10[3] = &unk_1E2605A90;
    v10[4] = v3;
    v10[5] = v4;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v11 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0x100000, v10);
  }
  v6 = *(id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(a1 + 32), "_attributeFixingInProgress") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "objectForKey:", CFSTR("NSOriginalFont"));
    if (v7)
    {
      v8 = v7;
      v6 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("NSFont"));
      objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSOriginalFont"));
LABEL_9:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAttribute:range:", CFSTR("NSOriginalFont"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addAttributes:range:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    if (objc_msgSend(v6, "objectForKey:", CFSTR("NSFont")))
      goto LABEL_9;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addAttributes:range:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __45__NSConcreteTextStorage_addAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  uint64_t result;

  v8 = objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
  v10 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "objectForKey:", CFSTR("NSOriginalFont"))))
  {
    v9 = *(void **)(a1 + 40);
    if (v9 == (void *)v8 || (objc_msgSend(v9, "isEqual:", v8) & 1) != 0)
      v10 = 0;
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "addAttributes:range:", *(_QWORD *)(a1 + 56), a3, a4);
  if (v10)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "removeAttribute:range:", CFSTR("NSOriginalFont"), a3, a4);
  return result;
}

- (void)_markIntentsResolved
{
  -[NSConcreteMutableAttributedString _markIntentsResolved](self->_contents, "_markIntentsResolved");
}

@end
