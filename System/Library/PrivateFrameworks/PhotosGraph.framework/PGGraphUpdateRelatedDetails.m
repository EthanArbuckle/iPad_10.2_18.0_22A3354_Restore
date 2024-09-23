@implementation PGGraphUpdateRelatedDetails

- (PGGraphUpdateRelatedDetails)init
{
  PGGraphUpdateRelatedDetails *v2;
  NSMutableSet *v3;
  NSMutableSet *accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
  NSMutableSet *v5;
  NSMutableSet *accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
  uint64_t v7;
  NSMutableSet *accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGGraphUpdateRelatedDetails;
  v2 = -[PGGraphUpdateRelatedDetails init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons = v2->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
    v2->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons = v2->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
    v2->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons = v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments = v2->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
    v2->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments = (NSMutableSet *)v7;

  }
  return v2;
}

- (NSSet)identifiersForMomentRelatedToUpdatedPersons
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons](self, "accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)identifiersForMomentRelatedToDeletedPersons
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons](self, "accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)identifiersForMemoriesRelatedToDeletedMoments
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments](self, "accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)accumulateDetailsForUpdatedPersonNode:(id)a3 personChange:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a4, "propertyNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (searchIndexProcessorIsInterestedInChangedPersonProperties_onceToken != -1)
    dispatch_once(&searchIndexProcessorIsInterestedInChangedPersonProperties_onceToken, &__block_literal_global_25091);
  v7 = objc_msgSend(v6, "intersectsSet:", searchIndexProcessorIsInterestedInChangedPersonProperties_personPropertiesOfInterest);

  if (v7)
  {
    -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons](self, "accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuids");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v11);

  }
}

- (void)accumulateDetailsForDeletedPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons](self, "accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uuids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v6);

}

- (void)accumulateDetailsForDeletedMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PGGraphUpdateRelatedDetails accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments](self, "accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "memoryNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueMemoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v6);

}

- (void)_accumulateMomentIdentifiersInto:(id)a3 forPersonNodes:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "momentNodes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

}

- (id)_momentNodesFromPersonNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "collection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "momentNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __59__PGGraphUpdateRelatedDetails__momentNodesFromPersonNodes___block_invoke;
        v14[3] = &unk_1E8436408;
        v15 = v4;
        objc_msgSend(v12, "enumerateNodesUsingBlock:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons
{
  return self->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons;
}

- (void)setAccumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons, a3);
}

- (NSMutableSet)accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons
{
  return self->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons;
}

- (void)setAccumulatedIdentifiersForMomentNodesRelatedToDeletedPersons:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons, a3);
}

- (NSMutableSet)accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments
{
  return self->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments;
}

- (void)setAccumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMemoryNodesRelatedToDeletedMoments, 0);
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToDeletedPersons, 0);
  objc_storeStrong((id *)&self->_accumulatedIdentifiersForMomentNodesRelatedToUpdatedPersons, 0);
}

uint64_t __59__PGGraphUpdateRelatedDetails__momentNodesFromPersonNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
