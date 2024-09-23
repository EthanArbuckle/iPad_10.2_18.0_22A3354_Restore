@implementation SignpostSupportPIDFilter

- (SignpostSupportPIDFilter)init
{
  SignpostSupportPIDFilter *v2;
  uint64_t v3;
  NSSet *pidSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportPIDFilter;
  v2 = -[SignpostSupportPIDFilter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    pidSet = v2->_pidSet;
    v2->_pidSet = (NSSet *)v3;

  }
  return v2;
}

- (BOOL)passesPIDNumber:(id)a3
{
  return 0;
}

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (NSPredicate)predicateEquivalent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SignpostSupportPIDFilter pidSet](self, "pidSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E0CB3880];
        if (-[SignpostSupportPIDFilter _wantsNotEqual](self, "_wantsNotEqual"))
          v10 = CFSTR("processIdentifier != %llu");
        else
          v10 = CFSTR("processIdentifier == %llu");
        objc_msgSend(v9, "predicateWithFormat:", v10, objc_msgSend(v8, "unsignedLongLongValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", -[SignpostSupportPIDFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);
  return (NSPredicate *)v12;
}

- (void)addPIDNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportPIDFilter pidSet](self, "pidSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addPIDNumberSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportPIDFilter pidSet](self, "pidSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (NSSet)pidSet
{
  return self->_pidSet;
}

- (BOOL)_wantsNotEqual
{
  return self->__wantsNotEqual;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidSet, 0);
}

@end
