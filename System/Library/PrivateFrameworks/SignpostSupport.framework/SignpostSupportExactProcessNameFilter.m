@implementation SignpostSupportExactProcessNameFilter

- (SignpostSupportExactProcessNameFilter)init
{
  SignpostSupportExactProcessNameFilter *v2;
  uint64_t v3;
  NSSet *processNameSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SignpostSupportExactProcessNameFilter;
  v2 = -[SignpostSupportExactProcessNameFilter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    processNameSet = v2->_processNameSet;
    v2->_processNameSet = (NSSet *)v3;

  }
  return v2;
}

- (BOOL)passesProcessName:(id)a3
{
  return 0;
}

- (void)addProcessName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportExactProcessNameFilter processNameSet](self, "processNameSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addProcessNameSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostSupportExactProcessNameFilter processNameSet](self, "processNameSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (NSPredicate)predicateEquivalent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  -[SignpostSupportExactProcessNameFilter processNameSet](self, "processNameSet");
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
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1E0CB3880];
        if (-[SignpostSupportExactProcessNameFilter _wantsNotEqual](self, "_wantsNotEqual"))
          v10 = CFSTR("process != %@");
        else
          v10 = CFSTR("process == %@");
        objc_msgSend(v9, "predicateWithFormat:", v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", -[SignpostSupportExactProcessNameFilter _compoundPredicateType](self, "_compoundPredicateType"), v3);
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

- (NSSet)processNameSet
{
  return self->_processNameSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processNameSet, 0);
}

@end
