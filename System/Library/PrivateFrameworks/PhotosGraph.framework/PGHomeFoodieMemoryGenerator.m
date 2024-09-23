@implementation PGHomeFoodieMemoryGenerator

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
    return 6009;
  v3 = a3;
  if (a3 == 3)
    return 6010;
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
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a4;
  v6 = a3;
  +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Food"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addressNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphAddressNode momentOfAddress](PGGraphAddressNode, "momentOfAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adjacencyWithSources:relation:targetsClass:", v10, v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "intersectingTargetsWith:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGFoodieMemoryGenerator incompatibleMomentNodesInGraph:](PGFoodieMemoryGenerator, "incompatibleMomentNodesInGraph:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "subtractingTargetsWith:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__PGHomeFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke;
  v20[3] = &unk_1E8431C60;
  v21 = v7;
  v22 = v5;
  v17 = v5;
  v18 = v7;
  objc_msgSend(v16, "enumerateTargetsBySourceWithBlock:", v20);

}

void __85__PGHomeFoodieMemoryGenerator_enumerateMomentNodesAndFeatureNodesInGraph_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
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
