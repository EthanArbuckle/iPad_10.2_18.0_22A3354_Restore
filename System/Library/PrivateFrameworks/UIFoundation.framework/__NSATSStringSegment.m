@implementation __NSATSStringSegment

- (unint64_t)length
{
  return self->_range.length;
}

- (const)_setOriginalString:(uint64_t)a3 range:(char *)a4
{
  const __CFString *v7;
  const __CFString *info;

  if (!result)
    return result;
  v7 = result;
  info = (const __CFString *)result->info;
  result = cf;
  if (info == cf)
    goto LABEL_7;
  if (info)
    CFRelease(info);
  v7->info = (uint64_t)cf;
  if (cf)
  {
    CFRetain(cf);
    result = (const __CFString *)v7->info;
LABEL_7:
    if (result)
      result = (const __CFString *)CFStringGetLength(result);
    goto LABEL_10;
  }
  result = 0;
LABEL_10:
  v7->data = (char *)result;
  if (&a4[a3] > (char *)result)
    result = (const __CFString *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: Requested range {%ld, %ld} is out of bounds for \"%@\"), objc_opt_class(), a3, a4, cf);
  v7->length = a3;
  v7[1].isa = a4;
  return result;
}

- (const)initWithOriginalString:(uint64_t)a3 range:(char *)a4
{
  const __CFString *v7;
  const __CFString *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)__NSATSStringSegment;
  v7 = (const __CFString *)objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
    -[__NSATSStringSegment _setOriginalString:range:](v7, a2, a3, a4);
  return v8;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  int v5;
  void *v6;
  objc_super v8;

  os_unfair_lock_lock_with_options();
  v5 = __NSATSStringSegmentCacheNextIndex;
  if (!__NSATSStringSegmentCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSStringSegmentLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS_____NSATSStringSegment;
    return objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSATSStringSegmentCacheNextIndex;
  v6 = (void *)__NSATSStringSegmentCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSStringSegmentLock);
  if (!v6)
    goto LABEL_5;
  return v6;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  CFIndex length;
  NSUInteger location;
  $5CFEE62CA76FAE445C6F9DBCEE669C70 *p_range;
  const unsigned __int16 *CharactersPtr;
  CFRange v10;
  char *characters;
  CFRange v12;

  length = a4.length;
  location = a4.location;
  p_range = &self->_range;
  if (a4.location + a4.length > self->_range.length)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: Range or index out of bounds"), objc_opt_class());
  if (self->_originalStringLength >= 1)
  {
    CharactersPtr = CFStringGetCharactersPtr(self->_originalString);
    self->_characters = CharactersPtr;
    if (CharactersPtr)
    {
      self->_characters = &CharactersPtr[p_range->location];
    }
    else
    {
      v10.length = p_range->length;
      if (v10.length <= 128)
      {
        v10.location = p_range->location;
        CFStringGetCharacters(self->_originalString, v10, self->_buffer);
        CFRelease(self->_originalString);
        self->_originalString = 0;
      }
    }
    self->_originalStringLength = 0;
  }
  if (self->_originalString)
  {
    characters = (char *)self->_characters;
    if (characters)
    {
LABEL_12:
      memcpy(a3, &characters[2 * location], 2 * length);
      return;
    }
  }
  else
  {
    characters = (char *)self->_buffer;
    if (self != (__NSATSStringSegment *)-48)
      goto LABEL_12;
  }
  v12.location = p_range->location + location;
  v12.length = length;
  CFStringGetCharacters(self->_originalString, v12, a3);
}

- (void)release
{
  uint64_t v3;
  __CFString *originalString;
  objc_super v5;

  os_unfair_lock_lock_with_options();
  if (-[__NSATSStringSegment retainCount](self, "retainCount") == 1
    && (v3 = __NSATSStringSegmentCacheNextIndex, __NSATSStringSegmentCacheNextIndex <= 3))
  {
    ++__NSATSStringSegmentCacheNextIndex;
    __NSATSStringSegmentCache[v3] = self;
    originalString = self->_originalString;
    self->_originalString = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSStringSegmentLock);
    if (originalString)
      CFRelease(originalString);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSStringSegmentLock);
    v5.receiver = self;
    v5.super_class = (Class)__NSATSStringSegment;
    -[__NSATSStringSegment release](&v5, sel_release);
  }
}

- (void)dealloc
{
  __CFString *originalString;
  objc_super v4;

  originalString = self->_originalString;
  if (originalString)
    CFRelease(originalString);
  v4.receiver = self;
  v4.super_class = (Class)__NSATSStringSegment;
  -[__NSATSStringSegment dealloc](&v4, sel_dealloc);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  $5CFEE62CA76FAE445C6F9DBCEE669C70 *p_range;
  const unsigned __int16 *CharactersPtr;
  CFRange v7;
  _WORD *characters;

  p_range = &self->_range;
  if (self->_range.length <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: Range or index out of bounds"), objc_opt_class());
  if (self->_originalStringLength >= 1)
  {
    CharactersPtr = CFStringGetCharactersPtr(self->_originalString);
    self->_characters = CharactersPtr;
    if (CharactersPtr)
    {
      self->_characters = &CharactersPtr[p_range->location];
    }
    else
    {
      v7.length = p_range->length;
      if (v7.length <= 128)
      {
        v7.location = p_range->location;
        CFStringGetCharacters(self->_originalString, v7, self->_buffer);
        CFRelease(self->_originalString);
        self->_originalString = 0;
      }
    }
    self->_originalStringLength = 0;
  }
  if (self->_originalString)
  {
    characters = self->_characters;
    if (characters)
      return characters[a3];
  }
  else
  {
    characters = self->_buffer;
    if (self != (__NSATSStringSegment *)-48)
      return characters[a3];
  }
  return CFStringGetCharacterAtIndex(self->_originalString, p_range->location + a3);
}

@end
