@implementation NSTextTab

- (void)release
{
  NSTextTab *Value;
  objc_super v5;

  os_unfair_lock_lock_with_options();
  if (-[NSTextTab retainCount](self, "retainCount") == 1
    && (NSTextTab *)__NSTextTabScratchInstance != self
    && (NSTextTab *)__NSTextTabAllocMarkerInstance != self
    && __NSTextTabTable != 0)
  {
    if (_NSTextTabTableIsCFSet == 1)
      Value = (NSTextTab *)CFSetGetValue((CFSetRef)__NSTextTabTable, self);
    else
      Value = (NSTextTab *)objc_msgSend((id)__NSTextTabTable, "member:", self);
    if (Value == self)
    {
      if (_NSTextTabTableIsCFSet == 1)
        CFSetRemoveValue((CFMutableSetRef)__NSTextTabTable, self);
      else
        objc_msgSend((id)__NSTextTabTable, "removeObject:", self);
    }
  }
  os_unfair_lock_unlock(&__NSTextTabLock);
  v5.receiver = self;
  v5.super_class = (Class)NSTextTab;
  -[NSTextTab release](&v5, sel_release);
}

- (NSTextTab)initWithTextAlignment:(NSTextAlignment)alignment location:(CGFloat)loc options:(NSDictionary *)options
{
  NSTextTab *v8;
  CTTextAlignment v9;
  uint64_t v10;
  CGFloat *Value;
  CGFloat *v12;
  CGFloat *v13;
  NSTextTab *v14;
  NSTextTab *v15;
  objc_super v17;

  if ((NSTextTab *)__NSTextTabAllocMarkerInstance == self)
  {
    os_unfair_lock_lock_with_options();
    v9 = NSTextAlignmentToCTTextAlignment(alignment);
    v10 = __NSTextTabScratchInstance;
    *(_DWORD *)(__NSTextTabScratchInstance + 8) = *(_DWORD *)(__NSTextTabScratchInstance + 8) & 0xFFFFFFF0 | v9 & 0xF;
    *(CGFloat *)(v10 + 16) = loc;
    *(_QWORD *)(v10 + 24) = options;
    if (_NSTextTabTableIsCFSet == 1)
      Value = (CGFloat *)CFSetGetValue((CFSetRef)__NSTextTabTable, (const void *)v10);
    else
      Value = (CGFloat *)objc_msgSend((id)__NSTextTabTable, "member:", v10);
    v12 = Value;
    if (Value)
    {
      v13 = Value;
    }
    else
    {
      v12 = (CGFloat *)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      *((_DWORD *)v12 + 2) = (_DWORD)v12[1] & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment(alignment) & 0xF;
      v12[2] = loc;
      *((_QWORD *)v12 + 3) = -[NSDictionary copyWithZone:](options, "copyWithZone:", -[CGFloat zone](v12, "zone"));
      if (_NSTextTabTableIsCFSet == 1)
        v14 = (NSTextTab *)CFSetGetValue((CFSetRef)__NSTextTabTable, v12);
      else
        v14 = (NSTextTab *)objc_msgSend((id)__NSTextTabTable, "member:", v12);
      v8 = v14;
      if (v14)
      {
        v15 = v14;
        os_unfair_lock_unlock(&__NSTextTabLock);

        return v8;
      }
      if (_NSTextTabTableIsCFSet == 1)
        CFSetSetValue((CFMutableSetRef)__NSTextTabTable, v12);
      else
        objc_msgSend((id)__NSTextTabTable, "addObject:", v12);
    }
    os_unfair_lock_unlock(&__NSTextTabLock);
    return (NSTextTab *)v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NSTextTab;
    v8 = -[NSTextTab init](&v17, sel_init);
    if (v8)
    {
      v8->_flags = ($E8CC2FB65D3C9415B1353094956A9E28)(*(_DWORD *)&v8->_flags & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment(alignment) & 0xF);
      v8->_location = loc;
      v8->_reserved = (id)-[NSDictionary copyWithZone:](options, "copyWithZone:", -[NSTextTab zone](v8, "zone"));
    }
  }
  return v8;
}

- (CGFloat)location
{
  return self->_location;
}

+ (void)initialize
{
  CFSetCallBacks v3;

  if ((id)objc_opt_class() == a1)
  {
    __NSTextTabClass = (uint64_t)a1;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("__NSDisableSharingTextTabInstance")) & 1) == 0)
    {
      __NSTextTabScratchInstance = (uint64_t)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      __NSTextTabAllocMarkerInstance = (uint64_t)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      _NSTextTabTableIsCFSet = 1;
      memset(&v3, 0, 32);
      *(_OWORD *)&v3.equal = xmmword_1E2604E00;
      __NSTextTabTable = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &v3);
    }
  }
}

- (void)dealloc
{
  objc_super v2;

  if ((NSTextTab *)__NSTextTabScratchInstance != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSTextTab;
    -[NSTextTab dealloc](&v2, sel_dealloc);
  }
}

+ (NSTextTab)allocWithZone:(_NSZone *)a3
{
  NSTextTab *result;
  BOOL v5;
  objc_super v6;

  result = (NSTextTab *)__NSTextTabAllocMarkerInstance;
  if (__NSTextTabAllocMarkerInstance)
    v5 = __NSTextTabClass == (_QWORD)a1;
  else
    v5 = 0;
  if (!v5)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSTextTab;
    return (NSTextTab *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
  return result;
}

- (NSTextTab)initWithType:(NSTextTabType)type location:(CGFloat)loc
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  double v9;
  NSTextTab *v10;

  if (type == NSDecimalTabStopType)
  {
    if (__NSDecimalTabAlignment)
      v5 = 2;
    else
      v5 = 4;
    if (__NSCachedDecimalTabAttribute_onceToken != -1)
    {
      v10 = self;
      v9 = loc;
      v8 = v5;
      dispatch_once(&__NSCachedDecimalTabAttribute_onceToken, &__block_literal_global_386);
      v5 = v8;
      self = v10;
      loc = v9;
    }
    v6 = __NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions;
  }
  else
  {
    v4 = 2;
    if (type != NSRightTabStopType)
      v4 = 0;
    if (type == NSCenterTabStopType)
      v5 = 1;
    else
      v5 = v4;
    v6 = 0;
  }
  return -[NSTextTab initWithTextAlignment:location:options:](self, "initWithTextAlignment:location:options:", v5, v6, loc);
}

- (NSTextTab)init
{
  return -[NSTextTab initWithTextAlignment:location:options:](self, "initWithTextAlignment:location:options:", 0, MEMORY[0x1E0C9AA70], 0.0);
}

+ (NSCharacterSet)columnTerminatorsForLocale:(NSLocale *)aLocale
{
  NSLocale *v3;
  __CFString *v4;
  __CFString *v5;
  unsigned int v6;
  uint64_t v7;
  int v8;

  v3 = aLocale;
  if (!aLocale)
    v3 = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v4 = -[NSLocale objectForKey:](v3, "objectForKey:", *MEMORY[0x1E0C997C8]);
  if (-[__CFString length](v4, "length"))
    v5 = v4;
  else
    v5 = CFSTR(".");
  v6 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", 0);
  v7 = v6;
  if ((v6 & 0xFC00) == 0xD800 && (unint64_t)-[__CFString length](v5, "length") >= 2)
  {
    v8 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", 1);
    if ((v8 & 0xFC00) == 0xDC00)
      v7 = (v8 + ((_DWORD)v7 << 10) - 56613888);
  }
  return (NSCharacterSet *)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", v7, 1);
}

- (NSTextAlignment)alignment
{
  return NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
}

- (NSDictionary)options
{
  if (self->_reserved)
    return (NSDictionary *)self->_reserved;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSTextTabType)tabStopType
{
  NSTextAlignment v3;
  uint64_t v4;
  uint64_t v5;
  id reserved;

  v3 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
  v4 = v3;
  v5 = 4;
  if (__NSDecimalTabAlignment)
    v5 = 2;
  if (v3 == v5)
  {
    reserved = self->_reserved;
    if (__NSCachedDecimalTabAttribute_onceToken != -1)
      dispatch_once(&__NSCachedDecimalTabAttribute_onceToken, &__block_literal_global_386);
    if ((objc_msgSend(reserved, "isEqualToDictionary:", __NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions) & 1) != 0)
      return 3;
  }
  if ((unint64_t)v4 < 3)
    return qword_18D6CBF28[v4];
  if (v4 > 4)
    return 0;
  return (unint64_t)(+[NSParagraphStyle _defaultWritingDirection](NSParagraphStyle, "_defaultWritingDirection") == 1);
}

- (NSTextTab)initWithCoder:(id)a3
{
  double v5;
  NSTextAlignment v6;
  double location;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;
  char v15;
  float v16;
  unsigned __int8 v17;

  v17 = 0;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSLocation"));
    self->_location = v5;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSTextAlignment")))
    {
      v6 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSTextAlignment")));
      location = self->_location;
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      return -[NSTextTab initWithTextAlignment:location:options:](self, "initWithTextAlignment:location:options:", v6, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("NSTabOptions")), location);
    }
    v15 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSType"));
    v14 = v15 & 0xF;
    v17 = v15 & 0xF;
  }
  else
  {
    v16 = 0.0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "Cf", &v17, &v16);
    self->_location = v16;
    v14 = v17;
  }
  return -[NSTextTab initWithType:location:](self, "initWithType:location:", v14);
}

- (void)encodeWithCoder:(id)a3
{
  unsigned __int8 v5;
  $E8CC2FB65D3C9415B1353094956A9E28 flags;
  id reserved;
  float location;
  float v9;
  unsigned __int8 v10;

  v5 = -[NSTextTab tabStopType](self, "tabStopType");
  v10 = v5;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    if (NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF)) > NSTextAlignmentCenter
      || self->_reserved && v5 != 3)
    {
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0xF) != 0)
        objc_msgSend(a3, "encodeInteger:forKey:", *(_BYTE *)&flags & 0xF, CFSTR("NSTextAlignment"));
      reserved = self->_reserved;
      if (reserved)
        objc_msgSend(a3, "encodeObject:forKey:", reserved, CFSTR("NSTabOptions"));
    }
    if (v5)
      objc_msgSend(a3, "encodeInteger:forKey:", v5, CFSTR("NSType"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSLocation"), self->_location);
  }
  else
  {
    location = self->_location;
    v9 = location;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "Cf", &v10, &v9);
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  NSTextAlignment v6;
  double location;
  double v8;

  if (!a3)
    return 0;
  if (a3 != self)
  {
    if (!__NSTextTabScratchInstance
      || (Class = object_getClass(a3), Class != object_getClass(self))
      || object_getClass(self) != (Class)__NSTextTabClass)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
        if (v6 == objc_msgSend(a3, "alignment"))
        {
          location = self->_location;
          objc_msgSend(a3, "location");
          if (location == v8)
            return objc_msgSend(self->_reserved, "isEqualToDictionary:", objc_msgSend(a3, "options"));
        }
      }
    }
    return 0;
  }
  return 1;
}

- (id)description
{
  char v3;
  void *v4;
  double location;
  const char *v6;
  const __CFString *reserved;

  v3 = -[NSTextTab tabStopType](self, "tabStopType");
  v4 = (void *)MEMORY[0x1E0CB3940];
  location = self->_location;
  if (v3 == 3)
  {
    v6 = "D";
  }
  else if (NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF)) <= NSTextAlignmentNatural)
  {
    v6 = __NSAlignmentTable[*(_DWORD *)&self->_flags & 0xF];
  }
  else
  {
    v6 = "?";
  }
  if (objc_msgSend(self->_reserved, "count"))
    reserved = (const __CFString *)self->_reserved;
  else
    reserved = &stru_1E260C7D0;
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%g%s%@"), *(_QWORD *)&location, v6, reserved);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
