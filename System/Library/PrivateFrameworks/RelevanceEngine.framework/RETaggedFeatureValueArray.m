@implementation RETaggedFeatureValueArray

- (RETaggedFeatureValueArray)init
{
  return -[RETaggedFeatureValueArray initWithCapacity:](self, "initWithCapacity:", 0);
}

- (RETaggedFeatureValueArray)initWithCapacity:(unint64_t)a3
{
  RETaggedFeatureValueArray *v4;
  RETaggedFeatureValueArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RETaggedFeatureValueArray;
  v4 = -[RETaggedFeatureValueArray init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_array = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &kTaggedFeatureValueCallbacks);
  }
  return v5;
}

- (RETaggedFeatureValueArray)initWithFeatureValues:(id)a3
{
  id v4;
  RETaggedFeatureValueArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[RETaggedFeatureValueArray initWithCapacity:](self, "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (const void *)RECreateFeatureValueTaggedPointer(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
          -[RETaggedFeatureValueArray addFeatureValue:](v5, "addFeatureValue:", v11, (_QWORD)v13);
          REReleaseFeatureValueTaggedPointer(v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (RETaggedFeatureValueArray)initWithValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  RETaggedFeatureValueArray *v6;
  uint64_t v7;

  v4 = a4;
  v6 = -[RETaggedFeatureValueArray initWithCapacity:](self, "initWithCapacity:", a4);
  if (v6 && v4)
  {
    do
    {
      v7 = *a3++;
      -[RETaggedFeatureValueArray addFeatureValue:](v6, "addFeatureValue:", v7);
      --v4;
    }
    while (v4);
  }
  return v6;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFRelease(self->_array);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)RETaggedFeatureValueArray;
  -[RETaggedFeatureValueArray dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  os_unfair_lock_s *p_lock;
  CFHashCode v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CFHash(self->_array);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RETaggedFeatureValueArray *v4;
  os_unfair_lock_s *p_lock;
  RETaggedFeatureValueArray *v6;
  __CFArray *array;
  __CFArray *v8;
  BOOL v9;

  v4 = (RETaggedFeatureValueArray *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      p_lock = &self->_lock;
      v6 = v4;
      os_unfair_lock_lock(&self->_lock);
      array = self->_array;
      v8 = v6->_array;

      v9 = CFEqual(array, v8) != 0;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[RETaggedFeatureValueArray _locked_count](self, "_locked_count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)featureValueAtIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[RETaggedFeatureValueArray _locked_featureValueAtIndex:](self, "_locked_featureValueAtIndex:", a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addFeatureValue:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayAppendValue(self->_array, (const void *)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)insertFeatureValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayInsertValueAtIndex(self->_array, a4, (const void *)a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeFeatureValueAtIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayRemoveValueAtIndex(self->_array, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllFeatureValues
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArrayRemoveAllValues(self->_array);
  os_unfair_lock_unlock(p_lock);
}

- (void)replaceFeatureValueAtIndex:(unint64_t)a3 withValue:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFArraySetValueAtIndex(self->_array, a3, (const void *)a4);
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)firstFeatureValue
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[RETaggedFeatureValueArray _locked_count](self, "_locked_count"))
    v4 = -[RETaggedFeatureValueArray _locked_featureValueAtIndex:](self, "_locked_featureValueAtIndex:", 0);
  else
    v4 = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)lastFeatureValue
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[RETaggedFeatureValueArray _locked_count](self, "_locked_count");
  if (v4)
    v5 = -[RETaggedFeatureValueArray _locked_featureValueAtIndex:](self, "_locked_featureValueAtIndex:", v4 - 1);
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4;
  __CFArray *array;
  id v6[2];
  CFRange v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6[1] = 0;
  v6[0] = (id)MEMORY[0x2199B2434](v4);
  array = self->_array;
  v7.length = -[RETaggedFeatureValueArray _locked_count](self, "_locked_count");
  v7.location = 0;
  CFArrayApplyFunction(array, v7, (CFArrayApplierFunction)kTaggedFeatureCFApplier, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__RETaggedFeatureValueArray_copyWithZone___block_invoke;
  v7[3] = &unk_24CF8D470;
  v5 = v4;
  v8 = v5;
  -[RETaggedFeatureValueArray enumerateFeatureValuesUsingBlock:](self, "enumerateFeatureValuesUsingBlock:", v7);

  return v5;
}

uint64_t __42__RETaggedFeatureValueArray_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFeatureValue:", a2);
}

- (unint64_t)_locked_count
{
  return CFArrayGetCount(self->_array);
}

- (unint64_t)_locked_featureValueAtIndex:(unint64_t)a3
{
  return (unint64_t)CFArrayGetValueAtIndex(self->_array, a3);
}

@end
