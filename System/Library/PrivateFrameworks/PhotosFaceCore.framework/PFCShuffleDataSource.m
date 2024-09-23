@implementation PFCShuffleDataSource

- (PFCShuffleDataSource)initWithPhotoLibrary:(id)a3
{
  id v5;
  PFCShuffleDataSource *v6;
  PFCShuffleDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFCShuffleDataSource;
  v6 = -[PFCShuffleDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    -[PFCShuffleDataSource calculateAvailableShuffles](v7, "calculateAvailableShuffles");
  }

  return v7;
}

- (BOOL)hasSuggestionsForSubtype:(unsigned __int16)a3
{
  int v3;
  void *v5;
  BOOL v6;
  NSObject *v7;
  BOOL v8;

  v3 = a3;
  PHSuggestionStringWithSubtype();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v3)
  {
    case 801:
      v6 = -[PFCShuffleDataSource hasNature](self, "hasNature");
      goto LABEL_9;
    case 802:
      v6 = -[PFCShuffleDataSource hasCityscape](self, "hasCityscape");
      goto LABEL_9;
    case 803:
      v6 = -[PFCShuffleDataSource hasPets](self, "hasPets");
      goto LABEL_9;
    case 804:
      v6 = -[PFCShuffleDataSource hasPeople](self, "hasPeople");
LABEL_9:
      v8 = v6;
      break;
    default:
      pfc_shuffle_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PFCShuffleDataSource hasSuggestionsForSubtype:].cold.1((uint64_t)v5, v7);

      v8 = 0;
      break;
  }

  return v8;
}

- (unint64_t)numberOfSuggestionsForTopPerson:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:", 602, v4);

  return v5;
}

- (unint64_t)numberOfSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PFCShuffleDataSource baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:](self, "baseSuggestionFetchOptionsWithSubtype:personLocalIdentifiers:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithSubtype();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pfc_shuffle_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218498;
    v14 = objc_msgSend(v8, "count");
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_243C21000, v10, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Fetched (%lu) suggestions with subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v13, 0x20u);
  }

  v11 = objc_msgSend(v8, "count");
  return v11;
}

- (BOOL)hasSuggestionsForShuffleSubtype:(unsigned __int16)a3 persons:(id)a4 minimumCount:(int64_t)a5
{
  unint64_t v6;
  void *v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:");
  PHSuggestionStringWithSubtype();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 < a5)
  {
    pfc_shuffle_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218754;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2048;
      v15 = a5;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_243C21000, v8, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Found %lu %@ suggestions, required %lu, skipping creating shuffle descriptor for %@", (uint8_t *)&v10, 0x2Au);
    }

  }
  return v6 >= a5;
}

- (void)calculateAvailableShuffles
{
  self->_numberOfNatureSuggestions = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:", 801, 0);
  self->_numberOfPetSuggestions = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:", 803, 0);
  self->_numberOfCityscapeSuggestions = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self, "numberOfSuggestionsForShuffleSubtype:persons:", 802, 0);
  -[PFCShuffleDataSource calculatePeople](self, "calculatePeople");
}

- (void)calculatePeople
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSSet *v15;
  NSSet *ambientPeople;
  void *v17;
  void *v18;
  void *v19;
  NSSet *v20;
  NSSet *topAmbientPeople;
  NSObject *v22;
  NSUInteger v23;
  NSUInteger v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  NSUInteger v30;
  __int16 v31;
  NSUInteger v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE36A8]), "initWithPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v3, "personUUIDsWithNegativeFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10), (_QWORD)v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x24BDBCEF0];
  -[PFCShuffleDataSource fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:](self, "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 804, self->_photoLibrary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "minusSet:", v5);
  v15 = (NSSet *)objc_msgSend(v14, "copy");
  ambientPeople = self->_ambientPeople;
  self->_ambientPeople = v15;

  v17 = (void *)MEMORY[0x24BDBCEF0];
  -[PFCShuffleDataSource fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:](self, "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 602, self->_photoLibrary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "intersectSet:", v14);
  v20 = (NSSet *)objc_msgSend(v19, "copy");
  topAmbientPeople = self->_topAmbientPeople;
  self->_topAmbientPeople = v20;

  self->_numberOfPeopleSuggestions = -[NSSet count](self->_ambientPeople, "count");
  pfc_shuffle_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = -[NSSet count](self->_ambientPeople, "count");
    v24 = -[NSSet count](self->_topAmbientPeople, "count");
    *(_DWORD *)buf = 134218240;
    v30 = v23;
    v31 = 2048;
    v32 = v24;
    _os_log_impl(&dword_243C21000, v22, OS_LOG_TYPE_DEFAULT, "[PFCShuffleDataSource] Found %td ambient people, %td VIPs", buf, 0x16u);
  }

  -[PFCShuffleDataSource calculatePeopleCount](self, "calculatePeopleCount");
}

- (void)calculatePeopleCount
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *sortedTopAmbientPeople;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_topAmbientPeople;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PFCShuffleDataSource numberOfSuggestionsForTopPerson:](self, "numberOfSuggestionsForTopPerson:", v9, (_QWORD)v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedTopAmbientPeople = self->_sortedTopAmbientPeople;
  self->_sortedTopAmbientPeople = v11;

}

uint64_t __44__PFCShuffleDataSource_calculatePeopleCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)hasSuggestions
{
  return -[PFCShuffleDataSource hasPeople](self, "hasPeople")
      || -[PFCShuffleDataSource hasPets](self, "hasPets")
      || -[PFCShuffleDataSource hasNature](self, "hasNature")
      || -[PFCShuffleDataSource hasCityscape](self, "hasCityscape");
}

- (BOOL)hasPeople
{
  return -[NSSet count](self->_ambientPeople, "count") != 0;
}

- (BOOL)hasPets
{
  return self->_numberOfPetSuggestions != 0;
}

- (BOOL)hasNature
{
  return self->_numberOfNatureSuggestions != 0;
}

- (BOOL)hasCityscape
{
  return self->_numberOfCityscapeSuggestions != 0;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithArray:", v14);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("context"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v17);

  return v7;
}

- (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v4 = a3;
  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x24BDE3698], "fetchSuggestionsWithOptions:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v12;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSSet)ambientPeople
{
  return self->_ambientPeople;
}

- (NSSet)topAmbientPeople
{
  return self->_topAmbientPeople;
}

- (NSArray)sortedTopAmbientPeople
{
  return self->_sortedTopAmbientPeople;
}

- (unint64_t)numberOfPeopleSuggestions
{
  return self->_numberOfPeopleSuggestions;
}

- (unint64_t)numberOfNatureSuggestions
{
  return self->_numberOfNatureSuggestions;
}

- (unint64_t)numberOfPetSuggestions
{
  return self->_numberOfPetSuggestions;
}

- (unint64_t)numberOfCityscapeSuggestions
{
  return self->_numberOfCityscapeSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedTopAmbientPeople, 0);
  objc_storeStrong((id *)&self->_topAmbientPeople, 0);
  objc_storeStrong((id *)&self->_ambientPeople, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)hasSuggestionsForSubtype:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_243C21000, a2, OS_LOG_TYPE_ERROR, "[PFCShuffleDataSource] bad shuffle subtype: %@", (uint8_t *)&v2, 0xCu);
}

@end
