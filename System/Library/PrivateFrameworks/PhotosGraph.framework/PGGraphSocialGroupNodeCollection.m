@implementation PGGraphSocialGroupNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphSocialGroupNode momentOfSocialGroup](PGGraphSocialGroupNode, "momentOfSocialGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphSocialGroupMemberNodeCollection)memberNodes
{
  void *v3;
  void *v4;

  +[PGGraphSocialGroupNode memberOfSocialGroup](PGGraphSocialGroupNode, "memberOfSocialGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSocialGroupMemberNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSocialGroupMemberNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodes
{
  PGGraphPersonNodeCollection *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PGGraphPersonNodeCollection *v9;

  v3 = [PGGraphPersonNodeCollection alloc];
  -[MAElementCollection graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupNodeCollection memberNodes](self, "memberNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodesMatchingFilter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v3, "initWithGraph:elementIdentifiers:", v4, v8);

  return v9;
}

- (PGGraphPetNodeCollection)petNodes
{
  PGGraphPetNodeCollection *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PGGraphPetNodeCollection *v9;

  v3 = [PGGraphPetNodeCollection alloc];
  -[MAElementCollection graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupNodeCollection memberNodes](self, "memberNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPetNode filter](PGGraphPetNode, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodesMatchingFilter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v3, "initWithGraph:elementIdentifiers:", v4, v8);

  return v9;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (void)enumerateImportancesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraphSocialGroupNodeCollection_enumerateImportancesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("importance"), v6);

}

- (void)enumerateSocialGroupIdentifiersUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__PGGraphSocialGroupNodeCollection_enumerateSocialGroupIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E8431D70;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateIntegerPropertyValuesForKey:withBlock:](self, "enumerateIntegerPropertyValuesForKey:withBlock:", CFSTR("id"), v6);

}

uint64_t __78__PGGraphSocialGroupNodeCollection_enumerateSocialGroupIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PGGraphSocialGroupNodeCollection_enumerateImportancesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)socialGroupNodeForSocialGroupIdentifier:(int64_t)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphSocialGroupNode filterWithSocialGroupIdentifier:](PGGraphSocialGroupNode, "filterWithSocialGroupIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphSocialGroupNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)userVerifiedSocialGroupNodesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PGGraphSocialGroupNode filterWithIsUserVerified:](PGGraphSocialGroupNode, "filterWithIsUserVerified:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphSocialGroupNodeCollection, "nodesMatchingFilter:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)socialGroupNodesForPersistedUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[PGGraphSocialGroupNode filter](PGGraphSocialGroupNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("persistedUUID");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
