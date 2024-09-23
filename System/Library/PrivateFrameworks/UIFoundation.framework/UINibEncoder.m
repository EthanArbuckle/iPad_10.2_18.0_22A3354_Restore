@implementation UINibEncoder

- (id)initForWritingWithMutableData:(id)a3
{
  UINibEncoder *v4;
  id v5;
  CFSetCallBacks v7;
  CFArrayCallBacks v8;
  CFSetCallBacks callBacks;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UINibEncoder;
  v4 = -[UINibEncoder init](&v12, sel_init);
  if (v4)
  {
    v4->data = (NSMutableData *)a3;
    memset(&keyCallBacks, 0, sizeof(keyCallBacks));
    UIRetainedIdentityKeyDictionaryCallbacks((uint64_t)&keyCallBacks);
    memset(&valueCallBacks, 0, sizeof(valueCallBacks));
    UIRetainedIdentityValueDictionaryCallbacks((uint64_t)&valueCallBacks);
    v4->objectsToObjectIDs = CFDictionaryCreateMutable(0, 0, &keyCallBacks, MEMORY[0x1E0C9B3A0]);
    v4->objectIDsToObjects = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], &valueCallBacks);
    v4->replacements = CFDictionaryCreateMutable(0, 0, &keyCallBacks, &valueCallBacks);
    v4->values = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    memset(&callBacks, 0, sizeof(callBacks));
    UIRetainedIdentitySetCallbacks((uint64_t)&callBacks);
    v4->encodedObjects = CFSetCreateMutable(0, 0, &callBacks);
    memset(&v8, 0, sizeof(v8));
    UIRetainedIdentityArrayCallbacks((uint64_t)&v8);
    v4->encodedOrderedObjects = CFArrayCreateMutable(0, 0, &v8);
    memset(&v7, 0, sizeof(v7));
    UIRetainedValueUniquingSetCallbacks((uint64_t)&v7);
    v4->objectsUniquedByValue = CFSetCreateMutable(0, 0, &v7);
    v4->objectsReplacedWithNil = CFSetCreateMutable(0, 0, &callBacks);
    v4->_unorderedCollectionSortingEnabled = 1;
    v5 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    CFSetAddValue(v4->encodedObjects, v5);
    CFArrayAppendValue(v4->encodedOrderedObjects, v5);
    v4->recursiveState.currentObjectID = UINibArchiveIndexFromNumber(-[UINibEncoder assignObjectIDForObject:](v4, "assignObjectIDForObject:", v5));

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->objectsToObjectIDs);
  CFRelease(self->objectIDsToObjects);
  CFRelease(self->values);
  CFRelease(self->replacements);
  CFRelease(self->encodedObjects);
  CFRelease(self->encodedOrderedObjects);
  CFRelease(self->objectsReplacedWithNil);

  CFRelease(self->objectsUniquedByValue);
  v3.receiver = self;
  v3.super_class = (Class)UINibEncoder;
  -[UINibEncoder dealloc](&v3, sel_dealloc);
}

- (id)objectIDForObject:(id)a3
{
  return (id)CFDictionaryGetValue(self->objectsToObjectIDs, a3);
}

- (id)assignObjectIDForObject:(id)a3
{
  const void *v5;

  v5 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->nextObjectID);
  CFDictionarySetValue(self->objectsToObjectIDs, a3, v5);
  CFDictionarySetValue(self->objectIDsToObjects, v5, a3);
  ++self->nextObjectID;
  return (id)v5;
}

- (BOOL)previouslyCodedObject:(id)a3
{
  return -[UINibEncoder objectIDForObject:](self, "objectIDForObject:", a3) != 0;
}

- (void)appendValue:(id)a3
{
  CFArrayAppendValue(self->values, a3);
}

- (Class)encodedClassForObject:(id)a3
{
  Class result;

  result = (Class)objc_msgSend(a3, "classForKeyedArchiver");
  if (!result)
    return (Class)objc_opt_class();
  return result;
}

- (id)encodedClassNameForClass:(Class)a3
{
  return NSStringFromClass(a3);
}

- (id)encodedClassNameForObject:(id)a3
{
  return -[UINibEncoder encodedClassNameForClass:](self, "encodedClassNameForClass:", -[UINibEncoder encodedClassForObject:](self, "encodedClassForObject:", a3));
}

- (BOOL)object:(id)a3 encodesWithCoderFromClass:(Class)a4
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_encodeWithCoder_);
  return v5 == -[objc_class instanceMethodForSelector:](a4, "instanceMethodForSelector:", sel_encodeWithCoder_);
}

- (BOOL)object:(id)a3 encodesAsMemberAndWithCoderOfClass:(Class)a4
{
  return (Class)objc_msgSend(a3, "classForKeyedArchiver") == a4
      && -[UINibEncoder object:encodesWithCoderFromClass:](self, "object:encodesWithCoderFromClass:", a3, a4);
}

- (BOOL)shouldUniqueObjectByValue:(id)a3
{
  return -[UINibEncoder object:encodesAsMemberAndWithCoderOfClass:](self, "object:encodesAsMemberAndWithCoderOfClass:", a3, objc_opt_class())|| -[UINibEncoder object:encodesAsMemberAndWithCoderOfClass:](self, "object:encodesAsMemberAndWithCoderOfClass:", a3, objc_opt_class());
}

- (id)replacementObjectForObject:(id)a3 forKey:(id)a4
{
  const void *Value;
  char v9;
  __CFDictionary *objectIDsToObjects;
  const void *v11;
  const void *v12;
  id delegate;
  uint64_t v14;

  if (CFSetContainsValue(self->objectsReplacedWithNil, a3) || CFDictionaryContainsKey(self->replacements, a3))
    return (id)CFDictionaryGetValue(self->replacements, a3);
  if (!-[UINibEncoder objectIDForObject:](self, "objectIDForObject:", a3))
  {
    if (-[UINibEncoder shouldUniqueObjectByValue:](self, "shouldUniqueObjectByValue:", a3))
    {
      Value = CFSetGetValue(self->objectsUniquedByValue, a3);
      if (Value)
        goto LABEL_10;
      CFSetAddValue(self->objectsUniquedByValue, a3);
    }
    Value = (const void *)objc_msgSend(a3, "replacementObjectForCoder:", self);
    if (!Value)
    {
LABEL_17:
      CFSetAddValue(self->objectsReplacedWithNil, a3);
      return 0;
    }
LABEL_10:
    if (!self->delegate
      || ((v9 = objc_opt_respondsToSelector(),
           objectIDsToObjects = self->objectIDsToObjects,
           v11 = (const void *)UINumberWithNibArchiveIndex(self->recursiveState.currentObjectID),
           v12 = CFDictionaryGetValue(objectIDsToObjects, v11),
           delegate = self->delegate,
           (v9 & 1) == 0)
        ? (v14 = objc_msgSend(delegate, "nibCoder:willEncodeObject:", self, Value, v12))
        : (v14 = objc_msgSend(delegate, "nibCoder:willEncodeObject:forObject:forKey:", self, Value, v12, a4)),
          (Value = (const void *)v14) != 0))
    {
      CFDictionarySetValue(self->replacements, a3, Value);
      if (!-[UINibEncoder objectIDForObject:](self, "objectIDForObject:", Value))
        -[UINibEncoder assignObjectIDForObject:](self, "assignObjectIDForObject:", Value);
      return (id)Value;
    }
    goto LABEL_17;
  }
  return a3;
}

- (void)serializeArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UINibEncoder encodeBool:forKey:](self, "encodeBool:forKey:", 1, CFSTR("NSInlinedValue"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CFSTR("UINibEncoderEmptyKey"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)serializeDictionary:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "allKeys");
  if (-[UINibEncoder isUnorderedCollectionSortingEnabled](self, "isUnorderedCollectionSortingEnabled")
    && UIAreObjectsSortableForEncoding(v5))
  {
    v5 = (void *)objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  }
  -[UINibEncoder encodeBool:forKey:](self, "encodeBool:forKey:", 1, CFSTR("NSInlinedValue"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", v10, CFSTR("UINibEncoderEmptyKey"));
        -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", objc_msgSend(a3, "objectForKey:", v10), CFSTR("UINibEncoderEmptyKey"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
}

- (void)serializeSet:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "allObjects");
  if (-[UINibEncoder isUnorderedCollectionSortingEnabled](self, "isUnorderedCollectionSortingEnabled")
    && UIAreObjectsSortableForEncoding(v4))
  {
    v4 = (void *)objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  }
  -[UINibEncoder encodeBool:forKey:](self, "encodeBool:forKey:", 1, CFSTR("NSInlinedValue"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), CFSTR("UINibEncoderEmptyKey"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)serializeObject:(id)a3
{
  if (-[UINibEncoder object:encodesWithCoderFromClass:](self, "object:encodesWithCoderFromClass:", a3, objc_opt_class()))
  {
    -[UINibEncoder serializeArray:](self, "serializeArray:", a3);
  }
  else if (-[UINibEncoder object:encodesWithCoderFromClass:](self, "object:encodesWithCoderFromClass:", a3, objc_opt_class()))
  {
    -[UINibEncoder serializeDictionary:](self, "serializeDictionary:", a3);
  }
  else if (-[UINibEncoder object:encodesWithCoderFromClass:](self, "object:encodesWithCoderFromClass:", a3, objc_opt_class()))
  {
    -[UINibEncoder serializeSet:](self, "serializeSet:", a3);
  }
  else
  {
    objc_msgSend(a3, "encodeWithCoder:", self);
  }
}

+ (id)archivedDataWithRootObject:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = (id)objc_msgSend(objc_alloc((Class)a1), "initForWritingWithMutableData:", v5);
  objc_msgSend(v6, "encodeObject:forKey:", a3, CFSTR("object"));
  objc_msgSend(v6, "finishEncoding");
  return v5;
}

+ (BOOL)archiveRootObject:(id)a3 toFile:(id)a4
{
  return objc_msgSend((id)objc_msgSend(a1, "archivedDataWithRootObject:", a3), "writeToFile:atomically:", a4, 1);
}

- (void)finishEncoding
{
  __assert_rtn("-[UINibEncoder finishEncoding]", "UINibEncoder.m", 279, "finalScopeID && \"Why didn't this get remapped.\");
}

- (unsigned)systemVersion
{
  return 2000;
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3;

  v3 = NSClassFromString((NSString *)a3);
  if (v3)
    return -[objc_class version](v3, "version");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v7;
  const void *v8;
  id v9;
  id v10;
  $A9CBA455BC7A2AE8D47C2198228CD350 recursiveState;

  if (!a3
    || (v7 = -[UINibEncoder replacementObjectForObject:forKey:](self, "replacementObjectForObject:forKey:", a3, a4)) == 0)
  {
    v10 = +[UINibCoderValue nibValueRepresentingNilReferenceForKey:scope:](UINibCoderValue, "nibValueRepresentingNilReferenceForKey:scope:", a4, self->recursiveState.currentObjectID);
    goto LABEL_8;
  }
  v8 = v7;
  v9 = -[UINibEncoder objectIDForObject:](self, "objectIDForObject:", v7);
  if (!v9)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibEncoder.m"), 357, CFSTR("This should have been assigned in replacementObjectForObject:forKey:"));
  if (CFSetContainsValue(self->encodedObjects, v8))
  {
    v10 = +[UINibCoderValue nibValueForObjectReference:key:scope:](UINibCoderValue, "nibValueForObjectReference:key:scope:", UINibArchiveIndexFromNumber(v9), a4, self->recursiveState.currentObjectID);
LABEL_8:
    -[UINibEncoder appendValue:](self, "appendValue:", v10);
    return;
  }
  CFSetAddValue(self->encodedObjects, v8);
  CFArrayAppendValue(self->encodedOrderedObjects, v8);
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForObjectReference:key:scope:](UINibCoderValue, "nibValueForObjectReference:key:scope:", UINibArchiveIndexFromNumber(v9), a4, self->recursiveState.currentObjectID));
  recursiveState = self->recursiveState;
  self->recursiveState = 0;
  self->recursiveState.currentObjectID = UINibArchiveIndexFromNumber(v9);
  -[UINibEncoder serializeObject:](self, "serializeObject:", v8);
  self->recursiveState = recursiveState;
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (!a3)
    goto LABEL_9;
  if (-[UINibEncoder shouldUniqueObjectByValue:](self, "shouldUniqueObjectByValue:"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    if (!objc_msgSend(v8, "stringWithFormat:", CFSTR("This coder does not support conditional encoding of %@."), NSStringFromClass(v9)))objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibEncoder.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));
  }
  v10 = -[UINibEncoder replacementObjectForObject:forKey:](self, "replacementObjectForObject:forKey:", a3, a4);
  if (v10)
  {
    v11 = v10;
    v12 = -[UINibEncoder objectIDForObject:](self, "objectIDForObject:", v10);
    if (!v12)
      v12 = -[UINibEncoder assignObjectIDForObject:](self, "assignObjectIDForObject:", v11);
    v13 = +[UINibCoderValue nibValueForObjectReference:key:scope:](UINibCoderValue, "nibValueForObjectReference:key:scope:", UINibArchiveIndexFromNumber(v12), a4, self->recursiveState.currentObjectID);
  }
  else
  {
LABEL_9:
    v13 = +[UINibCoderValue nibValueRepresentingNilReferenceForKey:scope:](UINibCoderValue, "nibValueRepresentingNilReferenceForKey:scope:", a4, self->recursiveState.currentObjectID);
  }
  -[UINibEncoder appendValue:](self, "appendValue:", v13);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForBoolean:key:scope:](UINibCoderValue, "nibValueForBoolean:key:scope:", a3, a4, self->recursiveState.currentObjectID));
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForInteger:key:scope:](UINibCoderValue, "nibValueForInteger:key:scope:", a3, a4, self->recursiveState.currentObjectID));
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForInteger:key:scope:](UINibCoderValue, "nibValueForInteger:key:scope:", a3, a4, self->recursiveState.currentObjectID));
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForInteger:key:scope:](UINibCoderValue, "nibValueForInteger:key:scope:", a3, a4, self->recursiveState.currentObjectID));
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForInteger:key:scope:](UINibCoderValue, "nibValueForInteger:key:scope:", a3, a4, self->recursiveState.currentObjectID));
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForFloat:key:scope:](UINibCoderValue, "nibValueForFloat:key:scope:", a4, self->recursiveState.currentObjectID));
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForDouble:key:scope:](UINibCoderValue, "nibValueForDouble:key:scope:", a4, self->recursiveState.currentObjectID, a3));
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  -[UINibEncoder appendValue:](self, "appendValue:", +[UINibCoderValue nibValueForBytes:length:key:scope:](UINibCoderValue, "nibValueForBytes:length:key:scope:", a3, a4, a5, self->recursiveState.currentObjectID));
}

- (void)encodeArrayOfDoubles:(double *)a3 count:(int64_t)a4 forKey:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v12 = 7;
  objc_msgSend(v9, "appendBytes:length:", &v12, 1);
  if (a4 >= 1)
  {
    do
    {
      v10 = *(_QWORD *)a3++;
      v11 = v10;
      objc_msgSend(v9, "appendBytes:length:", &v11, 8);
      --a4;
    }
    while (a4);
  }
  -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), a5);
}

- (void)encodeArrayOfFloats:(float *)a3 count:(int64_t)a4 forKey:(id)a5
{
  void *v9;
  int v10;
  int v11;
  char v12;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v12 = 6;
  objc_msgSend(v9, "appendBytes:length:", &v12, 1);
  if (a4 >= 1)
  {
    do
    {
      v10 = *(_DWORD *)a3++;
      v11 = v10;
      objc_msgSend(v9, "appendBytes:length:", &v11, 4);
      --a4;
    }
    while (a4);
  }
  -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), a5);
}

- (void)encodeCGPoint:(CGPoint)a3 forKey:(id)a4
{
  CGPoint v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINibEncoder encodeArrayOfCGFloats:count:forKey:](self, "encodeArrayOfCGFloats:count:forKey:", &v4, 2, a4);
}

- (void)encodeCGSize:(CGSize)a3 forKey:(id)a4
{
  CGSize v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINibEncoder encodeArrayOfCGFloats:count:forKey:](self, "encodeArrayOfCGFloats:count:forKey:", &v4, 2, a4);
}

- (void)encodeCGRect:(CGRect)a3 forKey:(id)a4
{
  CGRect v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINibEncoder encodeArrayOfCGFloats:count:forKey:](self, "encodeArrayOfCGFloats:count:forKey:", &v4, 4, a4);
}

- (void)encodeCGAffineTransform:(CGAffineTransform *)a3 forKey:(id)a4
{
  __int128 v4;
  _OWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[UINibEncoder encodeArrayOfCGFloats:count:forKey:](self, "encodeArrayOfCGFloats:count:forKey:", v5, 6, a4);
}

- (void)encodeUIEdgeInsets:(UIEdgeInsets)a3 forKey:(id)a4
{
  UIEdgeInsets v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UINibEncoder encodeArrayOfCGFloats:count:forKey:](self, "encodeArrayOfCGFloats:count:forKey:", &v4, 4, a4);
}

- (id)nextGenericKey
{
  void *v2;
  uint64_t nextAnonymousKey;

  v2 = (void *)MEMORY[0x1E0CB3940];
  nextAnonymousKey = self->recursiveState.nextAnonymousKey;
  self->recursiveState.nextAnonymousKey = nextAnonymousKey + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("$%ld"), nextAnonymousKey);
}

- (void)encodeObject:(id)a3
{
  -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeRootObject:(id)a3
{
  -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeBycopyObject:(id)a3
{
  -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeByrefObject:(id)a3
{
  -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", a3, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeConditionalObject:(id)a3
{
  -[UINibEncoder encodeConditionalObject:forKey:](self, "encodeConditionalObject:forKey:", a3, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibEncoder.m"), 512, &stru_1E260C7D0);
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UINibEncoder.m"), 516, &stru_1E260C7D0);
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", a3, a4, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  unsigned int v7;
  NSString *v8;
  NSString *v9;
  double v10;

  if (strlen(a3) != 1)
    -[UINibEncoder encodeValueOfObjCType:at:].cold.2();
  v7 = *(unsigned __int8 *)a3;
  if (v7 <= 0x63)
  {
    if (*(unsigned __int8 *)a3 > 0x3Fu)
    {
      if (v7 != 64)
      {
        if (v7 == 66)
        {
          -[UINibEncoder encodeBool:forKey:](self, "encodeBool:forKey:", *(unsigned __int8 *)a4, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
          return;
        }
        goto LABEL_27;
      }
      v9 = *(NSString **)a4;
    }
    else
    {
      if (v7 == 42)
      {
        -[UINibEncoder encodeBytes:length:forKey:](self, "encodeBytes:length:forKey:", *(_QWORD *)a4, strlen(*(const char **)a4) + 1, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
        return;
      }
      if (v7 != 58)
        goto LABEL_27;
      v9 = NSStringFromSelector(*(SEL *)a4);
    }
    -[UINibEncoder encodeObject:forKey:](self, "encodeObject:forKey:", v9, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
  }
  else
  {
    if (*(unsigned __int8 *)a3 > 0x68u)
    {
      switch(v7)
      {
        case 'i':
          v8 = (NSString *)*(int *)a4;
          goto LABEL_20;
        case 'q':
          v8 = *(NSString **)a4;
          goto LABEL_20;
        case 's':
          v8 = (NSString *)*(__int16 *)a4;
LABEL_20:
          -[UINibEncoder encodeInteger:forKey:](self, "encodeInteger:forKey:", v8, -[UINibEncoder nextGenericKey](self, "nextGenericKey"));
          return;
      }
LABEL_27:
      -[UINibEncoder encodeValueOfObjCType:at:].cold.1();
    }
    if (v7 == 100)
    {
      v10 = *(double *)a4;
    }
    else
    {
      if (v7 != 102)
        goto LABEL_27;
      v10 = *(float *)a4;
    }
    -[UINibEncoder encodeDouble:forKey:](self, "encodeDouble:forKey:", -[UINibEncoder nextGenericKey](self, "nextGenericKey"), v10);
  }
}

- (id)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = a3;
}

- (BOOL)isUnorderedCollectionSortingEnabled
{
  return self->_unorderedCollectionSortingEnabled;
}

- (void)setUnorderedCollectionSortingEnabled:(BOOL)a3
{
  self->_unorderedCollectionSortingEnabled = a3;
}

- (void)encodeValueOfObjCType:at:.cold.1()
{
  __assert_rtn("-[UINibEncoder encodeValueOfObjCType:at:]", "UINibEncoder.m", 556, "NO && \"The UINibEncoder can't encode this type.\");
}

- (void)encodeValueOfObjCType:at:.cold.2()
{
  __assert_rtn("-[UINibEncoder encodeValueOfObjCType:at:]", "UINibEncoder.m", 559, "NO && \"The UINibEncoder can't encode this type.\");
}

@end
