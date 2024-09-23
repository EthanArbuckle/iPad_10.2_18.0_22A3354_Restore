@implementation __NSImmutableTextStorage

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

+ (__NSImmutableTextStorage)allocWithZone:(_NSZone *)a3
{
  int v5;
  __NSImmutableTextStorage *v6;
  objc_super v8;

  os_unfair_lock_lock_with_options();
  v5 = __NSImmutableTextStorageCacheNextIndex;
  if (!__NSImmutableTextStorageCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS_____NSImmutableTextStorage;
    return (__NSImmutableTextStorage *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSImmutableTextStorageCacheNextIndex;
  v6 = (__NSImmutableTextStorage *)__NSImmutableTextStorageCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
  if (!v6)
    goto LABEL_5;
  return v6;
}

- (void)release
{
  uint64_t v3;
  objc_super v4;

  os_unfair_lock_lock_with_options();
  if (-[__NSImmutableTextStorage retainCount](self, "retainCount") == 1
    && (v3 = __NSImmutableTextStorageCacheNextIndex,
        __NSImmutableTextStorageCacheNextIndex <= 4))
  {
    ++__NSImmutableTextStorageCacheNextIndex;
    __NSImmutableTextStorageCache[v3] = self;

    self->_contents = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
    v4.receiver = self;
    v4.super_class = (Class)__NSImmutableTextStorage;
    -[__NSImmutableTextStorage release](&v4, sel_release);
  }
}

- (__NSImmutableTextStorage)initWithAttributedString:(id)a3
{
  __NSImmutableTextStorage *v4;
  __NSImmutableTextStorage *v6;
  NSLayoutManager *v7;
  NSTextContainer *v8;
  NSTextContainer *v9;
  objc_super v10;

  v4 = self;
  if (!self->_layoutManager)
  {
    v10.receiver = self;
    v10.super_class = (Class)__NSImmutableTextStorage;
    v6 = -[NSTextStorage init](&v10, sel_init);
    v4 = v6;
    if (!v6)
      return v4;
    if (!v6->_layoutManager)
    {
      v7 = objc_alloc_init(NSLayoutManager);
      v4->_layoutManager = v7;
      -[NSLayoutManager setAllowsNonContiguousLayout:](v7, "setAllowsNonContiguousLayout:", 0);
      -[NSLayoutManager setBackgroundLayoutEnabled:](v4->_layoutManager, "setBackgroundLayoutEnabled:", 0);
      -[NSLayoutManager setLimitsLayoutForSuspiciousContents:](v4->_layoutManager, "setLimitsLayoutForSuspiciousContents:", 1);
      -[NSTextStorage addLayoutManager:](v4, "addLayoutManager:", v4->_layoutManager);
      v8 = [NSTextContainer alloc];
      v9 = -[NSTextContainer initWithSize:](v8, "initWithSize:", *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8));
      v4->_textContainer = v9;
      -[NSTextContainer setLineFragmentPadding:](v9, "setLineFragmentPadding:", 0.0);
      -[NSLayoutManager addTextContainer:](v4->_layoutManager, "addTextContainer:", v4->_textContainer);

    }
  }
  v4->_contents = (NSAttributedString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSImmutableTextStorage;
  -[NSTextStorage dealloc](&v3, sel_dealloc);
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (id)string
{
  return -[NSAttributedString string](self->_contents, "string");
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[NSAttributedString attributesAtIndex:effectiveRange:](self->_contents, "attributesAtIndex:effectiveRange:", a3, a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return -[NSAttributedString attribute:atIndex:effectiveRange:](self->_contents, "attribute:atIndex:effectiveRange:", a3, a4, a5);
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  return -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, a5.location, a5.length);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Mutable operation requested to __NSImmutableTextStorage: %@"), a4, self);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Mutable operation requested to __NSImmutableTextStorage: %@"), a4.length, self);
}

@end
