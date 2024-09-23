@implementation WBSSavedAccountMatchResult

- (WBSSavedAccountMatchResult)initWithExactMatches:(id)a3 potentialMatches:(id)a4 associatedDomainMatches:(id)a5 nearbyDeviceOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WBSSavedAccountMatchResult *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  WBSSavedAccountMatchResult *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WBSSavedAccountMatchResult;
  v14 = -[WBSSavedAccountMatchResult init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)v15;
    v17 = (void *)MEMORY[0x1E0C9AA60];
    if (v15)
      v18 = (void *)v15;
    else
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v14->_exactMatches, v18);

    v19 = objc_msgSend(v11, "copy");
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = v17;
    objc_storeStrong((id *)&v14->_potentialMatches, v21);

    v22 = objc_msgSend(v12, "copy");
    v23 = (void *)v22;
    if (v22)
      v24 = (void *)v22;
    else
      v24 = v17;
    objc_storeStrong((id *)&v14->_associatedDomainMatches, v24);

    objc_storeStrong((id *)&v14->_nearbyDeviceOptions, a6);
    v25 = v14;
  }

  return v14;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; exactMatches = %@; potentialMatches = %@; associatedDomainMatches = %@; nearbyDevice = %@ >"),
    v5,
    self,
    self->_exactMatches,
    self->_potentialMatches,
    self->_associatedDomainMatches,
    self->_nearbyDeviceOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)matchesForPasswordAutoFill
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSArray *associatedDomainMatches;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObjectsFromArray:", self->_exactMatches);
  objc_msgSend(v3, "addObjectsFromArray:", self->_potentialMatches);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_54);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  associatedDomainMatches = self->_associatedDomainMatches;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke_2;
  v12[3] = &unk_1E649F170;
  v13 = v6;
  v8 = v6;
  -[NSArray safari_filterObjectsUsingBlock:](associatedDomainMatches, "safari_filterObjectsUsingBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

WBSPair *__56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPair *v3;
  void *v4;
  void *v5;
  WBSPair *v6;

  v2 = a2;
  v3 = [WBSPair alloc];
  objc_msgSend(v2, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSPair initWithFirst:second:](v3, "initWithFirst:second:", v4, v5);
  return v6;
}

uint64_t __56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  WBSPair *v4;
  void *v5;
  void *v6;
  WBSPair *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [WBSPair alloc];
  objc_msgSend(v3, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "password");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSPair initWithFirst:second:](v4, "initWithFirst:second:", v5, v6);
  v8 = objc_msgSend(v2, "containsObject:", v7) ^ 1;

  return v8;
}

- (id)orderedMatches
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObjectsFromArray:", self->_exactMatches);
  objc_msgSend(v3, "addObjectsFromArray:", self->_potentialMatches);
  objc_msgSend(v3, "addObjectsFromArray:", self->_associatedDomainMatches);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)addUniqueHostUserToMatches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSArray *v9;
  NSArray *exactMatches;
  NSArray *v11;
  NSArray *potentialMatches;
  NSArray *v13;
  NSArray *associatedDomainMatches;
  _QWORD aBlock[4];
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3550];
  -[WBSSavedAccountMatchResult orderedMatches](self, "orderedMatches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_7_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke_2;
  aBlock[3] = &unk_1E649F1B8;
  v16 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  -[NSArray safari_mapObjectsUsingBlock:](self->_exactMatches, "safari_mapObjectsUsingBlock:", v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  exactMatches = self->_exactMatches;
  self->_exactMatches = v9;

  -[NSArray safari_mapObjectsUsingBlock:](self->_potentialMatches, "safari_mapObjectsUsingBlock:", v8);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  potentialMatches = self->_potentialMatches;
  self->_potentialMatches = v11;

  -[NSArray safari_mapObjectsUsingBlock:](self->_associatedDomainMatches, "safari_mapObjectsUsingBlock:", v8);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  associatedDomainMatches = self->_associatedDomainMatches;
  self->_associatedDomainMatches = v13;

}

WBSPair *__56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSPair *v3;
  void *v4;
  void *v5;
  WBSPair *v6;

  v2 = a2;
  v3 = [WBSPair alloc];
  objc_msgSend(v2, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSPair initWithFirst:second:](v3, "initWithFirst:second:", v4, v5);
  return v6;
}

id __56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  WBSPair *v5;
  void *v6;
  void *v7;
  WBSPair *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [WBSPair alloc];
  objc_msgSend(v3, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSPair initWithFirst:second:](v5, "initWithFirst:second:", v6, v7);
  objc_msgSend(v3, "setHasUniqueHostAndUser:", (unint64_t)objc_msgSend(v4, "countForObject:", v8) < 2);

  return v3;
}

- (NSArray)exactMatches
{
  return self->_exactMatches;
}

- (NSArray)potentialMatches
{
  return self->_potentialMatches;
}

- (NSArray)associatedDomainMatches
{
  return self->_associatedDomainMatches;
}

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)nearbyDeviceOptions
{
  return self->_nearbyDeviceOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceOptions, 0);
  objc_storeStrong((id *)&self->_associatedDomainMatches, 0);
  objc_storeStrong((id *)&self->_potentialMatches, 0);
  objc_storeStrong((id *)&self->_exactMatches, 0);
}

@end
