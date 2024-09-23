@implementation PGGraphHighlightNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphHighlightNode momentInHighlight](PGGraphHighlightNode, "momentInHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes
{
  void *v3;
  void *v4;

  +[PGGraphHighlightNode highlightGroupOfHighlight](PGGraphHighlightNode, "highlightGroupOfHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightGroupNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightGroupNodeCollection *)v4;
}

- (id)sceneNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightNodeCollection momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)highConfidenceSceneNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightNodeCollection momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highConfidenceSceneNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchConfidenceSceneNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightNodeCollection momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchConfidenceSceneNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (void)enumerateUUIDs:(id)a3
{
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), a3);
}

- (NSSet)uuids
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraphHighlightNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[PGGraphHighlightNodeCollection enumerateUUIDs:](self, "enumerateUUIDs:", v6);

  return (NSSet *)v4;
}

- (NSSet)localIdentifiers
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphHighlightNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[PGGraphHighlightNodeCollection enumerateUUIDs:](self, "enumerateUUIDs:", v6);

  return (NSSet *)v4;
}

- (id)highlightNodeAsCollectionByHighlightUUID
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PGGraphHighlightNodeCollection_highlightNodeAsCollectionByHighlightUUID__block_invoke;
  v8[3] = &unk_1E8432508;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)highlightNodeByHighlightUUID
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PGGraphHighlightNodeCollection_highlightNodeByHighlightUUID__block_invoke;
  v6[3] = &unk_1E842F948;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return v4;
}

- (PGGraphHighlightNodeCollection)subsetWithSharedAssets
{
  void *v3;
  void *v4;

  +[PGGraphHighlightNode highlightWithSharedAssetsOfHighlight](PGGraphHighlightNode, "highlightWithSharedAssetsOfHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)subsetWithPrivateAssets
{
  void *v3;
  void *v4;

  +[PGGraphHighlightNode highlightWithPrivateAssetsOfHighlight](PGGraphHighlightNode, "highlightWithPrivateAssetsOfHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)subsetWithBothPrivateAndSharedAssets
{
  void *v3;
  void *v4;

  +[PGGraphHighlightNode highlightWithPrivateAndSharedAssetsOfHighlight](PGGraphHighlightNode, "highlightWithPrivateAndSharedAssetsOfHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v4;
}

void __62__PGGraphHighlightNodeCollection_highlightNodeByHighlightUUID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __74__PGGraphHighlightNodeCollection_highlightNodeAsCollectionByHighlightUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PGGraphHighlightNodeCollection *v6;
  void *v7;
  void *v8;
  PGGraphHighlightNodeCollection *v9;

  v5 = a3;
  v6 = [PGGraphHighlightNodeCollection alloc];
  objc_msgSend(*(id *)(a1 + 32), "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v6, "initWithGraph:elementIdentifiers:", v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
}

void __50__PGGraphHighlightNodeCollection_localIdentifiers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1708], "localIdentifierWithUUID:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __39__PGGraphHighlightNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)highlightNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHighlightNode filterWithUUIDs:](PGGraphHighlightNode, "filterWithUUIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)highlightNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHighlightNode filterWithUUIDs:](PGGraphHighlightNode, "filterWithUUIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)highlightNodeForUUID:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHighlightNode filterWithUUID:](PGGraphHighlightNode, "filterWithUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)dayHighlightNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightNode filter](PGGraphHighlightNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)highlightNodeAsCollectionByHighlightUUIDForHighlightUUIDs:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForUUIDs:inGraph:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightNodeAsCollectionByHighlightUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)highlightNodeAsCollectionByHighlightUUIDForArrayOfHighlightUUIDs:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForArrayOfUUIDs:inGraph:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightNodeAsCollectionByHighlightUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
