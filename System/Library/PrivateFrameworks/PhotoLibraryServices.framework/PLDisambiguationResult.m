@implementation PLDisambiguationResult

- (PLDisambiguationResult)initWithDisambiguation:(id)a3 personLookupIdentifiers:(id)a4 locationNames:(id)a5 genericLocationTuples:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PLDisambiguationResult *v16;
  PLDisambiguationResult *v17;
  uint64_t v18;
  NSArray *personLookupIdentifiers;
  uint64_t v20;
  NSArray *locationNames;
  uint64_t v22;
  NSArray *genericLocationTuples;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDisambiguationResult.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("disambiguation"));

  }
  v26.receiver = self;
  v26.super_class = (Class)PLDisambiguationResult;
  v16 = -[PLDisambiguationResult init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_disambiguation, a3);
    v18 = objc_msgSend(v13, "copy");
    personLookupIdentifiers = v17->_personLookupIdentifiers;
    v17->_personLookupIdentifiers = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    locationNames = v17->_locationNames;
    v17->_locationNames = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    genericLocationTuples = v17->_genericLocationTuples;
    v17->_genericLocationTuples = (NSArray *)v22;

  }
  return v17;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disambiguation: %@, personLookupIdentifiers: %@, locationNames: %@, genericLocationDict: %@"), self->_disambiguation, self->_personLookupIdentifiers, self->_locationNames, self->_genericLocationTuples);
}

- (PLDisambiguation)disambiguation
{
  return self->_disambiguation;
}

- (NSArray)personLookupIdentifiers
{
  return self->_personLookupIdentifiers;
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (NSArray)genericLocationTuples
{
  return self->_genericLocationTuples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericLocationTuples, 0);
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_personLookupIdentifiers, 0);
  objc_storeStrong((id *)&self->_disambiguation, 0);
}

@end
