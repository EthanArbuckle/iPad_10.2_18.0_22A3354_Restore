@implementation _NSCachedAttributedString

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  int64_t length;
  $46F502DC38217A82D4112E7F869769E9 *runs;
  BOOL v6;
  NSUInteger v7;
  NSUInteger *p_var1;
  NSUInteger v9;
  unint64_t v10;
  NSAttributeDictionary *baseAttributes;

  length = self->_length;
  runs = self->_runs;
  if (runs)
    v6 = length < 1;
  else
    v6 = 1;
  if (v6)
  {
LABEL_8:
    v7 = 0;
  }
  else
  {
    v7 = 0;
    p_var1 = (NSUInteger *)&runs->var1;
    while (1)
    {
      v9 = *p_var1;
      v10 = *p_var1 + v7;
      if (v10 > a3)
        break;
      p_var1 += 2;
      v7 = v10;
      if ((uint64_t)v10 >= length)
        goto LABEL_8;
    }
    baseAttributes = (NSAttributeDictionary *)*(p_var1 - 1);
    if (baseAttributes)
    {
      if (a4)
      {
        a4->location = v7;
        a4->length = v9;
      }
      return baseAttributes;
    }
    length = v9;
  }
  baseAttributes = self->_baseAttributes;
  if (!baseAttributes)
    return (id)objc_msgSend(self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, v7);
  if (a4)
  {
    a4->location = v7;
    a4->length = length;
    return self->_baseAttributes;
  }
  return baseAttributes;
}

- (BOOL)_isStringDrawingTextStorage
{
  return 1;
}

- (id)copyCachedInstance
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  id v12;
  uint64_t v13;

  if (__NSCachedAttrStringShortTermCacheSize >= 1)
  {
    os_unfair_lock_lock_with_options();
    if (__NSCachedAttrStringShortTermCache)
    {
      v3 = (_QWORD *)objc_msgSend((id)__NSCachedAttrStringShortTermCache, "member:", self);
      v4 = v3;
      if (v3)
        v5 = v3;
    }
    else
    {
      v4 = 0;
    }
    if (__NSCachedAttrStringLongTermCacheSize >= 1)
    {
      if (v4)
      {
        v6 = v4[8] + 1;
        v4[8] = v6;
        if (v6 >= __NSCachedAttrStringLongTermPromotionThreshold)
        {
          if (__NSCachedAttrStringLongTermStack)
          {
            v7 = (id)__NSCachedAttrStringLongTermCache;
          }
          else
          {
            __NSCachedAttrStringLongTermStack = NSAllocateScannedUncollectable();
            v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            __NSCachedAttrStringLongTermCache = (uint64_t)v7;
          }
          if (!objc_msgSend(v7, "member:", v4))
          {
            v10 = *(void **)(__NSCachedAttrStringLongTermStack + 8 * __NSCachedAttrStringLongTermStackIndex);
            if (v10)
            {
              v12 = v10;
              objc_msgSend((id)__NSCachedAttrStringLongTermCache, "removeObject:", v10);
            }
            objc_msgSend((id)__NSCachedAttrStringLongTermCache, "addObject:", v4);
            v13 = __NSCachedAttrStringLongTermStackIndex++;
            *(_QWORD *)(__NSCachedAttrStringLongTermStack + 8 * v13) = v4;
            if (v13 + 1 >= __NSCachedAttrStringLongTermCacheSize)
              __NSCachedAttrStringLongTermStackIndex = 0;
            goto LABEL_19;
          }
        }
      }
      else if (__NSCachedAttrStringLongTermCache)
      {
        v8 = (_QWORD *)objc_msgSend((id)__NSCachedAttrStringLongTermCache, "member:", self);
        v4 = v8;
        if (v8)
          v9 = v8;
      }
      else
      {
        v4 = 0;
      }
    }
    v10 = 0;
LABEL_19:
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);

    return v4;
  }
  return 0;
}

- (BOOL)hasColorGlyphsInRange:(_NSRange)a3
{
  NSUInteger v3;
  int64_t v5;
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t length;
  int64_t var1;
  int64_t v9;
  uint64_t v10;
  NSAttributeDictionary *var0;
  BOOL result;

  v3 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    v5 = 0;
    runs = self->_runs;
    while (1)
    {
      if (runs && (length = self->_length, v5 < length))
      {
        while (1)
        {
          var1 = runs->var1;
          v9 = var1 + v5;
          if (var1 + v5 > a3.location)
            break;
          ++runs;
          v5 += var1;
          if (v9 >= length)
          {
            var1 = 0;
            v10 = 0x7FFFFFFFFFFFFFFFLL;
            v5 = v9;
            goto LABEL_9;
          }
        }
        var0 = (NSAttributeDictionary *)runs->var0;
        v10 = v5;
        if (runs->var0)
          goto LABEL_12;
      }
      else
      {
        var1 = 0;
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_9:
      var0 = self->_baseAttributes;
      if (!var0)
        var0 = (NSAttributeDictionary *)objc_msgSend(self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3.location, 0, a3.location, v3 - a3.location);
LABEL_12:
      result = objc_msgSend((id)-[NSAttributeDictionary objectForKeyedSubscript:](var0, "objectForKeyedSubscript:", CFSTR("NSFont")), "_hasColorGlyphs");
      if (!result)
      {
        a3.location = v10 + var1;
        if (v10 + var1 < v3)
          continue;
      }
      return result;
    }
  }
  return 0;
}

- (void)cache
{
  unint64_t v3;
  void *v4;
  id v5;

  if (__NSCachedAttrStringShortTermCacheSize >= 1 && self->_runs)
  {
    os_unfair_lock_lock_with_options();
    if ((objc_msgSend((id)__NSCachedAttrStringShortTermCache, "containsObject:", self) & 1) != 0
      || (objc_msgSend((id)__NSCachedAttrStringLongTermCache, "containsObject:", self) & 1) != 0)
    {
      v5 = 0;
LABEL_15:
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);

      return;
    }
    if (__NSCachedAttrStringShortTermCache)
    {
      v3 = objc_msgSend((id)__NSCachedAttrStringShortTermCache, "count");
      v4 = (void *)__NSCachedAttrStringShortTermCache;
      if (v3 >= __NSCachedAttrStringShortTermCacheSize)
      {
        __NSCachedAttrStringShortTermCache = 0;
        v5 = v4;
      }
      else
      {
        v5 = 0;
        if (__NSCachedAttrStringShortTermCache)
        {
LABEL_14:
          objc_msgSend(v4, "addObject:", self);
          goto LABEL_15;
        }
      }
    }
    else
    {
      v5 = 0;
    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    __NSCachedAttrStringShortTermCache = (uint64_t)v4;
    goto LABEL_14;
  }
}

- (id)string
{
  NSAttributeDictionary *baseAttributes;
  id result;

  baseAttributes = self->_baseAttributes;
  result = self->_contents;
  if (!baseAttributes)
    return (id)objc_msgSend(result, "string");
  return result;
}

- (void)release
{
  uint64_t v3;
  objc_class *Class;
  id contents;
  NSAttributeDictionary *baseAttributes;
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t numRuns;
  objc_class *v9;
  size_t InstanceSize;
  void **p_var0;
  void *v12;
  NSZone *v13;
  objc_super v14;

  if (-[_NSCachedAttributedString retainCount](self, "retainCount") != 1)
    goto LABEL_9;
  os_unfair_lock_lock_with_options();
  v3 = __NSCachedAttrStringCacheNextIndex;
  if (__NSCachedAttrStringCacheNextIndex >= 3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
LABEL_9:
    v14.receiver = self;
    v14.super_class = (Class)_NSCachedAttributedString;
    -[_NSCachedAttributedString release](&v14, sel_release);
    return;
  }
  ++__NSCachedAttrStringCacheNextIndex;
  __NSCachedAttrStringCache[v3] = self;
  Class = object_getClass(self);
  contents = self->_contents;
  baseAttributes = self->_baseAttributes;
  runs = self->_runs;
  numRuns = self->_numRuns;
  v9 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v9);
  bzero(self, InstanceSize);
  object_setClass(self, Class);
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);

  if (runs)
  {
    if (numRuns >= 1)
    {
      p_var0 = &runs->var0;
      do
      {
        v12 = *p_var0;
        p_var0 += 2;

      }
      while (p_var0 < &runs[numRuns].var0);
    }
    v13 = (NSZone *)MEMORY[0x18D7913AC](runs);
    NSZoneFree(v13, runs);
  }
}

- (void)dealloc
{
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t numRuns;
  $46F502DC38217A82D4112E7F869769E9 *v5;
  $46F502DC38217A82D4112E7F869769E9 *v6;
  id var0;
  NSZone *v8;
  objc_super v9;

  runs = self->_runs;
  if (runs)
  {
    numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      v5 = &runs[numRuns];
      v6 = self->_runs;
      do
      {
        var0 = v6->var0;
        ++v6;

      }
      while (v6 < v5);
    }
    v8 = (NSZone *)MEMORY[0x18D7913AC](runs);
    NSZoneFree(v8, runs);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSCachedAttributedString;
  -[_NSCachedAttributedString dealloc](&v9, sel_dealloc);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int64_t v7;
  int64_t v8;
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  $46F502DC38217A82D4112E7F869769E9 *v15;
  id *p_var0;
  unint64_t v17;
  int64_t v18;
  $46F502DC38217A82D4112E7F869769E9 *v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  void **v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  BOOL v29;
  uint64_t v30;
  int64_t numRuns;
  int64_t allocedRunsSize;
  int64_t v33;
  int64_t v34;
  id v35;

  if (!a3)
    return;
  length = a4.length;
  if (!a4.length)
    return;
  location = a4.location;
  v7 = a4.location + a4.length;
  v8 = self->_length;
  if (a4.location + a4.length > v8 || v8 < 1)
    return;
  runs = self->_runs;
  if (!runs)
  {
    runs = ($46F502DC38217A82D4112E7F869769E9 *)NSAllocateScannedUncollectable();
    self->_runs = runs;
    v12 = self->_length;
    runs->var0 = 0;
    runs->var1 = v12;
    self->_numRuns = 1;
    self->_allocedRunsSize = 5;
    v8 = self->_length;
  }
  v13 = 0;
  v14 = 0;
  v15 = runs;
LABEL_10:
  p_var0 = 0;
  while (2)
  {
    v17 = v14;
    v18 = v14;
    v19 = ($46F502DC38217A82D4112E7F869769E9 *)p_var0;
    while (1)
    {
      if (v13 >= v8)
      {
        v21 = 0;
        goto LABEL_19;
      }
      v14 = v18;
      if (v19)
        break;
      v20 = v15->var1 + v13;
      v18 = v13;
      v19 = v15;
      if (location >= v20)
      {
        ++v15;
        v13 = v20;
        goto LABEL_10;
      }
    }
    v13 += v19->var1;
    v21 = v13 - v7;
    if (v13 < v7)
    {
      p_var0 = &v19[1].var0;
      continue;
    }
    break;
  }
  v17 = v18;
  p_var0 = &v19->var0;
LABEL_19:
  if (location > v17)
  {
    v15->var1 = location - v17;
    ++v15;
  }
  if (p_var0 > (id *)v15)
  {
    if (v21 >= 1)
    {
      p_var0[1] = (id)v21;
      p_var0 -= 2;
    }
    goto LABEL_26;
  }
  if (v15 != ($46F502DC38217A82D4112E7F869769E9 *)p_var0 || v21 >= 1)
  {
    if (!p_var0)
      return;
    v27 = p_var0 < (id *)v15;
    v28 = v21 > 0;
    v29 = v27 && v28;
    if (v27 && v28)
      v30 = 2;
    else
      v30 = 1;
    numRuns = self->_numRuns;
    allocedRunsSize = self->_allocedRunsSize;
    if (numRuns + v30 > allocedRunsSize)
    {
      v33 = (char *)v15 - (char *)runs;
      v34 = (char *)p_var0 - (char *)runs;
      self->_allocedRunsSize = allocedRunsSize + 5;
      runs = ($46F502DC38217A82D4112E7F869769E9 *)NSReallocateScannedUncollectable();
      self->_runs = runs;
      v15 = ($46F502DC38217A82D4112E7F869769E9 *)((char *)runs + v33);
      p_var0 = (id *)((char *)&runs->var0 + v34);
      numRuns = self->_numRuns;
    }
    memmove(&p_var0[2 * v30], p_var0, (char *)&runs[numRuns] - (char *)p_var0);
    if (v29)
    {
      v35 = *p_var0;
    }
    else if (v21 < 1)
    {
LABEL_44:
      v15->var0 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", a3);
      v15->var1 = length;
      self->_numRuns += v30;
      return;
    }
    p_var0[2 * v30 + 1] = (id)v21;
    goto LABEL_44;
  }
LABEL_26:
  if (v15 <= ($46F502DC38217A82D4112E7F869769E9 *)p_var0)
  {
    v22 = 0;
    v23 = &v15->var0;
    do
    {
      ++v22;
      v24 = *v23;
      v23 += 2;

    }
    while (v23 <= p_var0);
  }
  else
  {
    v22 = 0;
    v23 = &v15->var0;
  }
  v15->var0 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", a3);
  v15->var1 = length;
  if (v22 >= 2)
  {
    v25 = self->_numRuns;
    v26 = (char *)&self->_runs[v25] - (char *)v23;
    if (v26 >= 1)
    {
      memmove(&v15[1], v23, v26);
      v25 = self->_numRuns;
    }
    self->_numRuns = v25 - ((uint64_t)(16 * v22 - 16) >> 4);
  }
}

- (_NSCachedAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  _NSCachedAttributedString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSCachedAttributedString;
  v6 = -[_NSCachedAttributedString init](&v8, sel_init);
  if (v6)
  {
    v6->_contents = (id)objc_msgSend(a3, "copyWithZone:", 0);
    v6->_baseAttributes = (NSAttributeDictionary *)+[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", a4);
    v6->_length = objc_msgSend(a3, "length");
  }
  return v6;
}

- (unint64_t)length
{
  return self->_length;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  int v5;
  void *v6;
  objc_super v8;

  os_unfair_lock_lock_with_options();
  v5 = __NSCachedAttrStringCacheNextIndex;
  if (!__NSCachedAttrStringCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS____NSCachedAttributedString;
    return objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSCachedAttrStringCacheNextIndex;
  v6 = (void *)__NSCachedAttrStringCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
  if (!v6)
    goto LABEL_5;
  return v6;
}

- (_NSCachedAttributedString)initWithAttributedString:(id)a3
{
  _NSCachedAttributedString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSCachedAttributedString;
  v4 = -[_NSCachedAttributedString init](&v6, sel_init);
  if (v4)
  {
    v4->_contents = (id)objc_msgSend(a3, "copyWithZone:", 0);
    v4->_length = objc_msgSend(a3, "length");
  }
  return v4;
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_msgSend(v2, "integerForKey:", CFSTR("NSStringDrawingLongTermCacheSize"));
    if (v3)
      __NSCachedAttrStringLongTermCacheSize = v3 & ~(v3 >> 63);
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("NSStringDrawingLongTermThreshold"));
    if (v4 >= 1)
      __NSCachedAttrStringLongTermPromotionThreshold = v4;
    v5 = objc_msgSend(v2, "integerForKey:", CFSTR("NSStringDrawingShortTermCacheSize"));
    if (v5)
      __NSCachedAttrStringShortTermCacheSize = v5 & ~(v5 >> 63);
  }
}

- (BOOL)_baselineMode
{
  return 1;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t length;
  NSRange v10;
  NSUInteger *p_var1;
  NSUInteger v12;
  NSRange v13;
  id result;

  runs = self->_runs;
  if (!runs)
    goto LABEL_10;
  length = self->_length;
  if (length < 1)
    goto LABEL_10;
  v10.location = 0;
  p_var1 = (NSUInteger *)&runs->var1;
  while (1)
  {
    v12 = *p_var1 + v10.location;
    if (v12 > a3)
      break;
    p_var1 += 2;
    v10.location = v12;
    if ((uint64_t)v12 >= length)
      goto LABEL_10;
  }
  v10.length = *p_var1;
  v13 = NSIntersectionRange(v10, a5);
  a5 = v13;
  result = (id)*(p_var1 - 1);
  if (result)
  {
    if (a4)
      *a4 = v13;
  }
  else
  {
LABEL_10:
    result = self->_baseAttributes;
    if (result)
    {
      if (a4)
      {
        *a4 = a5;
        return self->_baseAttributes;
      }
    }
    else
    {
      return (id)objc_msgSend(self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, a5.location, a5.length);
    }
  }
  return result;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (_NSCachedAttributedString)initWithString:(id)a3
{
  return -[_NSCachedAttributedString initWithString:attributes:](self, "initWithString:attributes:", a3, 0);
}

- (_NSCachedAttributedString)init
{
  _NSCachedAttributedString *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSCachedAttributedString;
  v2 = -[_NSCachedAttributedString init](&v4, sel_init);
  v2->_contents = (id)objc_msgSend(&stru_1E260C7D0, "copyWithZone:", 0);
  v2->_baseAttributes = (NSAttributeDictionary *)+[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", 0);
  return v2;
}

- (void)finalize
{
  $46F502DC38217A82D4112E7F869769E9 *runs;
  int64_t numRuns;
  $46F502DC38217A82D4112E7F869769E9 *v5;
  $46F502DC38217A82D4112E7F869769E9 *v6;
  id var0;
  NSZone *v8;
  objc_super v9;

  runs = self->_runs;
  if (runs)
  {
    numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      v5 = &runs[numRuns];
      v6 = self->_runs;
      do
      {
        var0 = v6->var0;
        ++v6;

      }
      while (v6 < v5);
    }
    v8 = (NSZone *)MEMORY[0x18D7913AC](runs, a2);
    NSZoneFree(v8, runs);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSCachedAttributedString;
  -[_NSCachedAttributedString finalize](&v9, sel_finalize);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;
  uint64_t v6;
  unint64_t hashValue;
  NSAttributeDictionary *baseAttributes;

  if (a3 == self)
    return 1;
  if (!isEqual___NSCachedAttributedStringClass)
    isEqual___NSCachedAttributedStringClass = objc_opt_class();
  if (objc_opt_class() != isEqual___NSCachedAttributedStringClass)
    return 0;
  if (self->_hashValue)
    -[_NSCachedAttributedString hash](self, "hash");
  v6 = *((_QWORD *)a3 + 4);
  if (v6)
  {
    objc_msgSend(a3, "hash");
    v6 = *((_QWORD *)a3 + 4);
  }
  hashValue = self->_hashValue;
  v5 = hashValue == v6;
  if (hashValue == v6)
  {
    baseAttributes = self->_baseAttributes;
    if (baseAttributes != *((NSAttributeDictionary **)a3 + 2)
      && !-[NSAttributeDictionary isEqual:](baseAttributes, "isEqual:"))
    {
      return 0;
    }
    if (!objc_msgSend(self->_contents, "isEqual:", *((_QWORD *)a3 + 1)))
      return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;

  result = self->_hashValue;
  if (!result)
  {
    v4 = objc_msgSend(self->_contents, "hash");
    result = -[NSAttributeDictionary hash](self->_baseAttributes, "hash") + v4;
    self->_hashValue = result;
  }
  return result;
}

@end
