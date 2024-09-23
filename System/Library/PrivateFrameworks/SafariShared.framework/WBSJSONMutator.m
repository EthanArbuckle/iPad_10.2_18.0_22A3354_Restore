@implementation WBSJSONMutator

- (WBSJSONMutator)initWithSource:(id)a3 protectedFields:(id)a4
{
  id v7;
  id v8;
  WBSJSONMutator *v9;
  WBSJSONMutator *v10;
  WBSJSONMutator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSJSONMutator;
  v9 = -[WBSJSONMutator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_originalJSONSource, a3);
    *(_OWORD *)&v10->_fieldDeletionProbability = xmmword_1A3F5BC60;
    *(_OWORD *)&v10->_fieldTypeChangeProbability = xmmword_1A3F5BC70;
    objc_storeStrong((id *)&v10->_protectedFields, a4);
    v11 = v10;
  }

  return v10;
}

- (id)mutatedJSONProtectingRootObject:(BOOL)a3
{
  _BOOL8 v3;
  char isKindOfClass;
  id originalJSONSource;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  originalJSONSource = self->_originalJSONSource;
  if ((isKindOfClass & 1) != 0)
    -[WBSJSONMutator _mutatedDictionaryField:shouldProtectRootObject:](self, "_mutatedDictionaryField:shouldProtectRootObject:", originalJSONSource, v3);
  else
    -[WBSJSONMutator _mutatedArrayField:shouldProtectRootObject:](self, "_mutatedArrayField:shouldProtectRootObject:", originalJSONSource, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_mutatedArrayField:(id)a3 shouldProtectRootObject:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];

  v6 = a3;
  if (a4 || -[WBSJSONMutator _actionToPerformOnFieldOfType:](self, "_actionToPerformOnFieldOfType:", 0))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__WBSJSONMutator__mutatedArrayField_shouldProtectRootObject___block_invoke;
    v9[3] = &unk_1E4B3CB10;
    v9[4] = self;
    objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __61__WBSJSONMutator__mutatedArrayField_shouldProtectRootObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mutatedCollectionField:", a2);
}

- (id)_mutatedDictionaryField:(id)a3 shouldProtectRootObject:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];

  v6 = a3;
  if (a4 || -[WBSJSONMutator _actionToPerformOnFieldOfType:](self, "_actionToPerformOnFieldOfType:", 0))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__WBSJSONMutator__mutatedDictionaryField_shouldProtectRootObject___block_invoke;
    v9[3] = &unk_1E4B3CB38;
    v9[4] = self;
    objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __66__WBSJSONMutator__mutatedDictionaryField_shouldProtectRootObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", a2))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_mutatedCollectionField:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_mutatedCollectionField:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSJSONMutator _mutatedArrayField:shouldProtectRootObject:](self, "_mutatedArrayField:shouldProtectRootObject:", v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v7 = v5;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSJSONMutator _mutatedDictionaryField:shouldProtectRootObject:](self, "_mutatedDictionaryField:shouldProtectRootObject:", v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v6 = -[WBSJSONMutator _actionToPerformOnFieldOfType:](self, "_actionToPerformOnFieldOfType:", 1);
  if (v6)
  {
    if (v6 == 2)
    {
      -[WBSJSONMutator _randomFieldTypeChanger](self, "_randomFieldTypeChanger");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v6 == 1)
    {
      -[WBSJSONMutator _randomValueForField:](self, "_randomValueForField:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (int64_t)_actionToPerformOnFieldOfType:(int64_t)a3
{
  double collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;

  collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = 1.0;
  if (!a3)
    collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = self->_collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldDeletionProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1))
    return 0;
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldValueChangeProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1))
    return 1;
  if (collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults * (self->_fieldTypeChangeProbability * 1000.0) >= (double)(arc4random_uniform(0x3E8u) + 1))
    return 2;
  return 3;
}

- (id)_randomValueForField:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    if (v5 == 1.0 || v5 == 0.0)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v8 = objc_msgSend(v4, "intValue");
      if (v8 >= 1)
        v9 = (v8 - 1);
      else
        v9 = (1 - v8);
      v6 = objc_msgSend(v7, "initWithInt:", v9);
    }
    else
    {
      if (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "objCType") == 105)
        -[WBSJSONMutator _randomIntegerGenerator](self, "_randomIntegerGenerator");
      else
        -[WBSJSONMutator _randomNumberGenerator](self, "_randomNumberGenerator");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSJSONMutator _randomStringGenerator](self, "_randomStringGenerator");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v10 = (void *)v6;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSJSONMutator _randomDateGenerator](self, "_randomDateGenerator");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (id)_randomFieldTypeChanger
{
  uint32_t v3;
  void *v4;

  v3 = arc4random_uniform(3u);
  if (v3 == 2)
  {
    -[WBSJSONMutator _randomStringGenerator](self, "_randomStringGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[WBSJSONMutator _randomNumberGenerator](self, "_randomNumberGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      -[WBSJSONMutator _randomDateGenerator](self, "_randomDateGenerator");
    else
      -[WBSJSONMutator _randomIntegerGenerator](self, "_randomIntegerGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_randomIntegerGenerator
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", rand());
}

- (id)_randomNumberGenerator
{
  id v2;
  double v3;

  v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v3 = (float)random();
  return (id)objc_msgSend(v2, "initWithFloat:", v3);
}

- (id)_randomStringGenerator
{
  id v2;
  uint32_t v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = arc4random_uniform(0x64u);
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%c"), (char)(arc4random_uniform(0x5Du) + 33));
      --v4;
    }
    while (v4);
  }
  return v2;
}

- (id)_randomDateGenerator
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", (double)rand());
}

- (double)fieldDeletionProbability
{
  return self->_fieldDeletionProbability;
}

- (void)setFieldDeletionProbability:(double)a3
{
  self->_fieldDeletionProbability = a3;
}

- (double)fieldValueChangeProbability
{
  return self->_fieldValueChangeProbability;
}

- (void)setFieldValueChangeProbability:(double)a3
{
  self->_fieldValueChangeProbability = a3;
}

- (double)fieldTypeChangeProbability
{
  return self->_fieldTypeChangeProbability;
}

- (void)setFieldTypeChangeProbability:(double)a3
{
  self->_fieldTypeChangeProbability = a3;
}

- (double)collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults
{
  return self->_collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults;
}

- (void)setCollectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults:(double)a3
{
  self->_collectionFieldSkewFactorToDecreaseProbabilityOfInvalidResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedFields, 0);
  objc_storeStrong(&self->_originalJSONSource, 0);
}

@end
