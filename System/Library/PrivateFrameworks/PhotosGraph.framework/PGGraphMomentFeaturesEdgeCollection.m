@implementation PGGraphMomentFeaturesEdgeCollection

- (unint64_t)numberOfRelevantAssets
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PGGraphMomentFeaturesEdgeCollection_numberOfRelevantAssets__block_invoke;
  v4[3] = &unk_1E84345C8;
  v4[4] = &v5;
  -[MAEdgeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("rlvacnt"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSSet)allRelevantAssetUUIDs
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMomentFeaturesEdgeCollection_allRelevantAssetUUIDs__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MAEdgeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("rlvaids"), v6);

  return (NSSet *)v4;
}

- (NSSet)allRelevantAssetLocalIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PGGraphMomentFeaturesEdgeCollection allRelevantAssetUUIDs](self, "allRelevantAssetUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

void __60__PGGraphMomentFeaturesEdgeCollection_allRelevantAssetUUIDs__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[PGGraphMomentFeaturesEdge relevantAssetUUIDsFromAllAssetUUIDs:](PGGraphMomentFeaturesEdge, "relevantAssetUUIDsFromAllAssetUUIDs:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

uint64_t __61__PGGraphMomentFeaturesEdgeCollection_numberOfRelevantAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)momentFeaturesEdgesFromMomentNodes:(id)a3 toFeatureNodes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[PGGraphMomentFeaturesEdge filter](PGGraphMomentFeaturesEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesOfType:betweenNodes:andNodes:matchingFilter:](PGGraphMomentFeaturesEdgeCollection, "edgesOfType:betweenNodes:andNodes:matchingFilter:", 2, v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
