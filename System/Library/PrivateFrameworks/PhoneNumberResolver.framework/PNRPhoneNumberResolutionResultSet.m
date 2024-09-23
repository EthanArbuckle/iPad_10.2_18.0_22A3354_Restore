@implementation PNRPhoneNumberResolutionResultSet

- (PNRPhoneNumberResolutionResultSet)init
{
  PNRPhoneNumberResolutionResultSet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *results;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNRPhoneNumberResolutionResultSet;
  v2 = -[PNRPhoneNumberResolutionResultSet init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    results = v2->_results;
    v2->_results = v3;

    v2->_resultsLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_results, "description");
}

- (void)enumerateResolutionsUsingBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_resultsLock;
  NSMutableDictionary *results;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_resultsLock = &self->_resultsLock;
  os_unfair_lock_lock(&self->_resultsLock);
  results = self->_results;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__PNRPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke;
  v8[3] = &unk_24F4D2748;
  v9 = v4;
  v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](results, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_resultsLock);

}

void __68__PNRPhoneNumberResolutionResultSet_enumerateResolutionsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, id, void *, void *, uint64_t);
  id v14;

  v7 = a3;
  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v10 = v7;
  else
    v10 = 0;
  if ((isKindOfClass & 1) != 0)
    v11 = 0;
  else
    v11 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void (**)(uint64_t, id, void *, void *, uint64_t))(v12 + 16);
  v14 = v7;
  v13(v12, v8, v10, v11, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setResult:(id)a3 resultDataSource:(int64_t)a4 forPhoneNumber:(id)a5
{
  id v8;
  id v9;
  PNRPhoneNumberResolutionResult *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PNRPhoneNumberResolutionResult initWithLocationName:locationDataSource:]([PNRPhoneNumberResolutionResult alloc], "initWithLocationName:locationDataSource:", v9, a4);

  os_unfair_lock_lock(&self->_resultsLock);
  -[NSMutableDictionary setObject:forKey:](self->_results, "setObject:forKey:", v10, v8);

  os_unfair_lock_unlock(&self->_resultsLock);
}

- (void)setError:(id)a3 forPhoneNumber:(id)a4
{
  os_unfair_lock_s *p_resultsLock;
  id v7;
  id v8;

  p_resultsLock = &self->_resultsLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_resultsLock);
  -[NSMutableDictionary setObject:forKey:](self->_results, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_resultsLock);
}

@end
