@implementation SignpostSupportUniquePIDFilter

- (NSPredicate)predicateEquivalent
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SignpostSupportUniquePIDFilter uniquePidSet](self, "uniquePidSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1E0CB3880];
        -[SignpostSupportUniquePIDFilter _wantsNotEqual](self, "_wantsNotEqual");
        objc_msgSend(v10, "predicateWithFormat:", CFSTR("creatorProcessUniqueIdentifier != %llu"), objc_msgSend(v9, "unsignedLongLongValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", -[SignpostSupportUniquePIDFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);
  return (NSPredicate *)v12;
}

- (BOOL)_wantsNotEqual
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 1;
}

- (SignpostSupportUniquePIDFilter)init
{
  SignpostSupportUniquePIDFilter *v2;
  uint64_t v3;
  NSSet *uniquePidSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportUniquePIDFilter;
  v2 = -[SignpostSupportUniquePIDFilter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    uniquePidSet = v2->_uniquePidSet;
    v2->_uniquePidSet = (NSSet *)v3;

  }
  return v2;
}

- (BOOL)passesUniquePIDNumber:(id)a3
{
  return 0;
}

- (void)addUniquePIDNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportUniquePIDFilter uniquePidSet](self, "uniquePidSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addUniquePIDNumberSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportUniquePIDFilter uniquePidSet](self, "uniquePidSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (NSSet)uniquePidSet
{
  return self->_uniquePidSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquePidSet, 0);
}

@end
