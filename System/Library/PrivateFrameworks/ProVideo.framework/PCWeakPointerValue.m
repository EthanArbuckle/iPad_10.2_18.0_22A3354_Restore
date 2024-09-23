@implementation PCWeakPointerValue

- (PCWeakPointerValue)initWithNonretainedObject:(id)a3
{
  PCWeakPointerValue *v4;
  PCWeakPointerValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCWeakPointerValue;
  v4 = -[PCWeakPointerValue init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pointerValue = a3;
    objc_storeWeak(&v4->_zeroingWeakValue, a3);
    v5->_hasZeroingWeakReference = 1;
  }
  return v5;
}

- (PCWeakPointerValue)initWithPointer:(void *)a3
{
  PCWeakPointerValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PCWeakPointerValue;
  result = -[PCWeakPointerValue init](&v5, sel_init);
  if (result)
  {
    result->_pointerValue = a3;
    result->_zeroingWeakValue = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasZeroingWeakReference)
    objc_storeWeak(&self->_zeroingWeakValue, 0);
  v3.receiver = self;
  v3.super_class = (Class)PCWeakPointerValue;
  -[PCWeakPointerValue dealloc](&v3, sel_dealloc);
}

+ (id)valueWithNonretainedObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNonretainedObject:", a3);
}

+ (id)valueWithPointer:(void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPointer:", a3);
}

- (id)nonretainedObjectValue
{
  return objc_loadWeak(&self->_zeroingWeakValue);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  v5 = objc_opt_class();
  return v5 == objc_opt_class() && self->_pointerValue == (id)*((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  return (unint64_t)self->_pointerValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PCWeakPointerValue initWithNonretainedObject:](+[PCWeakPointerValue allocWithZone:](PCWeakPointerValue, "allocWithZone:", a3), "initWithNonretainedObject:", -[PCWeakPointerValue nonretainedObjectValue](self, "nonretainedObjectValue"));
  *((_QWORD *)result + 1) = self->_pointerValue;
  return result;
}

+ (id)weakPointerValueArrayFromArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", +[PCWeakPointerValue valueWithNonretainedObject:](PCWeakPointerValue, "valueWithNonretainedObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)arrayFromWeakPointerValueArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "nonretainedObjectValue");
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)weakPointerValueSetFromSet:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", +[PCWeakPointerValue valueWithNonretainedObject:](PCWeakPointerValue, "valueWithNonretainedObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

+ (id)setFromWeakPointerValueSet:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "nonretainedObjectValue");
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)pointerValue
{
  return self->_pointerValue;
}

@end
