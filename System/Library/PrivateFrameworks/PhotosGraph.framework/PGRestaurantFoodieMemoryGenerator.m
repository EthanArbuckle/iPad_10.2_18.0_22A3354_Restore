@implementation PGRestaurantFoodieMemoryGenerator

- (unint64_t)memoryCategorySubcategoryForOverTimeType:(unint64_t)a3
{
  int v3;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 6007;
  v3 = a3;
  if (a3 == 3)
    return 6008;
  -[PGMemoryGenerator loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v3;
    _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[%@] Returning PHMemoryCategorySubcategoryNone for PGOverTimeMemoryType %d, this should never happen", (uint8_t *)&v8, 0x12u);

  }
  return 0;
}

- (void)enumerateMomentNodesAndFeatureNodesInGraph:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v5 = a4;
  v6 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v6);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "homeOrWorkNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Food"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategory:inGraph:](PGGraphBusinessCategoryNodeCollection, "businessCategoryNodesForCategory:inGraph:", CFSTR("Restaurant"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "businessNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode businessOfMoment](PGGraphMomentNode, "businessOfMoment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adjacencyWithSources:relation:targetsClass:", v11, v15, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "intersectingTargetsWith:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:](PGFoodieMemoryGenerator, "incompatibleMomentNodesInGraph:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "subtractingSourcesWith:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "subtractingSourcesWith:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "sources");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v33[3] = &unk_1E8433910;
  v34 = v20;
  v23 = v20;
  objc_msgSend(v21, "filteredCollectionUsingBlock:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "intersectingSourcesWith:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "transposed");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  v30[1] = 3221225472;
  v30[2] = __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2;
  v30[3] = &unk_1E8433938;
  v31 = v10;
  v32 = v5;
  v27 = v5;
  v28 = v10;
  objc_msgSend(v26, "enumerateTargetsBySourceWithBlock:", v30);

}

BOOL __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSources:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 1;

  return v3;
}

void __91__PGRestaurantFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureNodeCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionByFormingUnionWith:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
