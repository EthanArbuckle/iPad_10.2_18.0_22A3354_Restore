@implementation PGGraphSocialGroupMemberNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)socialGroupOfMember
{
  void *v2;
  void *v3;

  +[PGGraphBelongsToEdge filter](PGGraphBelongsToEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)localIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupMemberNodeCollection personNodes](self, "personNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[PGGraphSocialGroupMemberNodeCollection petNodes](self, "petNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  return (NSSet *)v3;
}

- (NSSet)uuids
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupMemberNodeCollection personNodes](self, "personNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[PGGraphSocialGroupMemberNodeCollection petNodes](self, "petNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  return (NSSet *)v3;
}

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  void *v3;
  void *v4;

  -[PGGraphSocialGroupMemberNodeCollection socialGroupOfMember](self, "socialGroupOfMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSocialGroupNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSocialGroupNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodes
{
  return (PGGraphPersonNodeCollection *)+[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", self);
}

- (PGGraphPetNodeCollection)petNodes
{
  return (PGGraphPetNodeCollection *)+[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", self);
}

- (NSArray)names
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphSocialGroupMemberNodeCollection_names__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSArray *)v4;
}

- (id)memberNodeByLocalIdentifier
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PGGraphSocialGroupMemberNodeCollection_memberNodeByLocalIdentifier__block_invoke;
  v6[3] = &unk_1E8436520;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return v4;
}

void __69__PGGraphSocialGroupMemberNodeCollection_memberNodeByLocalIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __47__PGGraphSocialGroupMemberNodeCollection_names__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  const __CFString *v4;
  __CFString *v5;

  v5 = a3;
  if (-[__CFString length](v5, "length"))
    v4 = v5;
  else
    v4 = CFSTR("Unnamed");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (id)memberNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PGGraphSocialGroupMemberNodeCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  PGGraphSocialGroupMemberNodeCollection *v13;

  v5 = a4;
  v6 = a3;
  +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPetNodeCollection petNodesForLocalIdentifiers:inGraph:](PGGraphPetNodeCollection, "petNodesForLocalIdentifiers:inGraph:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PGGraphSocialGroupMemberNodeCollection alloc];
  objc_msgSend(v7, "elementIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elementIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifierSetByFormingUnion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MAElementCollection initWithGraph:elementIdentifiers:](v9, "initWithGraph:elementIdentifiers:", v5, v12);

  return v13;
}

+ (id)memberNodesForLocalIdentifier:(id)a3 inGraph:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v14 = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v10, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "memberNodesForLocalIdentifiers:inGraph:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
