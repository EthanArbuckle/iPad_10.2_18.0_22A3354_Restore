@implementation PGPeopleAssetFilter

- (PGPeopleAssetFilter)initWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3
{
  PGPeopleAssetFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGPeopleAssetFilter;
  result = -[PGPeopleAssetFilter init](&v5, sel_init);
  if (result)
    result->_maximumNumberOfOtherFacesPresent = a3;
  return result;
}

- (id)initForPetWithMaximumNumberOfOtherFacesPresent:(unint64_t)a3
{
  id result;

  result = -[PGPeopleAssetFilter initWithMaximumNumberOfOtherFacesPresent:](self, "initWithMaximumNumberOfOtherFacesPresent:", a3);
  if (result)
    *((_BYTE *)result + 8) = 1;
  return result;
}

- (id)filteredAssetsFromAssets:(id)a3 withPersonOrPetLocalIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[PGPeopleAssetFilter asset:passesForPersonOrPetLocalIdentifier:](self, "asset:passesForPersonOrPetLocalIdentifier:", v14, v7, (_QWORD)v16))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)asset:(id)a3 passesForPersonOrPetLocalIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  _BOOL4 petFilter;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  char v15;
  BOOL v16;
  unsigned int v17;

  v6 = a3;
  v7 = a4;
  if (self->_petFilter)
  {
    objc_msgSend(v6, "clsPetLocalIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
      goto LABEL_3;
LABEL_7:
    v16 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "clsConsolidatedPersonLocalIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v7);

  if ((v15 & 1) == 0)
    goto LABEL_7;
LABEL_3:
  if (self->_maximumNumberOfOtherFacesPresent == -1)
  {
    v16 = 1;
  }
  else
  {
    petFilter = self->_petFilter;
    objc_msgSend(v6, "clsFaceInformationSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (petFilter)
      v13 = objc_msgSend(v11, "numberOfFacesIncludingPets");
    else
      v13 = objc_msgSend(v11, "numberOfFaces");
    v17 = v13;

    v16 = self->_maximumNumberOfOtherFacesPresent + 1 >= v17;
  }
LABEL_11:

  return v16;
}

- (PGPeopleAssetFilter)initWithCoder:(id)a3
{
  return -[PGPeopleAssetFilter initWithMaximumNumberOfOtherFacesPresent:](self, "initWithMaximumNumberOfOtherFacesPresent:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("maximumNumberOfOtherFacesPresent")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_maximumNumberOfOtherFacesPresent, CFSTR("maximumNumberOfOtherFacesPresent"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGPeopleAssetFilter;
  -[PGPeopleAssetFilter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@: %d"), v4, CFSTR("maximumNumberOfOtherFacesPresent"), self->_maximumNumberOfOtherFacesPresent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  PGPeopleAssetFilter *v4;
  unint64_t maximumNumberOfOtherFacesPresent;
  BOOL v6;

  v4 = (PGPeopleAssetFilter *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      maximumNumberOfOtherFacesPresent = self->_maximumNumberOfOtherFacesPresent;
      v6 = maximumNumberOfOtherFacesPresent == -[PGPeopleAssetFilter maximumNumberOfOtherFacesPresent](v4, "maximumNumberOfOtherFacesPresent");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)maximumNumberOfOtherFacesPresent
{
  return self->_maximumNumberOfOtherFacesPresent;
}

+ (NSString)name
{
  return (NSString *)CFSTR("People");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
