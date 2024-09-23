@implementation PGUpNextMemoryBasedMatchingInfo

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3
{
  id v5;
  void *v6;
  PGUpNextMemoryBasedMatchingInfo *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  v7 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:](&v9, sel_initWithMomentNodes_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_memoryNodeAsCollection, a3);

  return v7;
}

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4 personNodes:(id)a5 sceneNodes:(id)a6 meaningNodes:(id)a7 isTripMemory:(BOOL)a8 representativeLocation:(id)a9 representativeDate:(id)a10 memoryFeatureNodes:(id)a11
{
  _BOOL8 v11;
  PGUpNextMemoryBasedMatchingInfo *v18;
  PGUpNextMemoryBasedMatchingInfo *v19;
  id v21;
  id v22;
  objc_super v23;

  v11 = a8;
  v22 = a3;
  v21 = a11;
  v23.receiver = self;
  v23.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  v18 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:personNodes:sceneNodes:meaningNodes:isTripMemory:representativeLocation:representativeDate:](&v23, sel_initWithMomentNodes_personNodes_sceneNodes_meaningNodes_isTripMemory_representativeLocation_representativeDate_, a4, a5, a6, a7, v11, a9, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_memoryNodeAsCollection, a3);
    objc_storeStrong((id *)&v19->_memoryFeatureNodes, a11);
  }

  return v19;
}

- (PGUpNextMemoryBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3 momentNodes:(id)a4
{
  id v7;
  PGUpNextMemoryBasedMatchingInfo *v8;
  PGUpNextMemoryBasedMatchingInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGUpNextMemoryBasedMatchingInfo;
  v8 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:](&v11, sel_initWithMomentNodes_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_memoryNodeAsCollection, a3);

  return v9;
}

- (unint64_t)nodeIdentifier
{
  void *v2;
  unint64_t v3;

  -[MAElementCollection elementIdentifiers](self->_memoryNodeAsCollection, "elementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstElement");

  return v3;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  PGGraphFeatureNodeCollection *memoryFeatureNodes;
  void *v4;
  void *v5;
  void *v6;
  PGGraphFeatureNodeCollection *v7;
  PGGraphFeatureNodeCollection *v8;

  memoryFeatureNodes = self->_memoryFeatureNodes;
  if (!memoryFeatureNodes)
  {
    -[PGGraphMemoryNodeCollection featureNodes](self->_memoryNodeAsCollection, "featureNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAElementCollection graph](self->_memoryNodeAsCollection, "graph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphOverTheYearsNodeCollection, "nodesInGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionBySubtracting:", v6);
    v7 = (PGGraphFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();

    v8 = self->_memoryFeatureNodes;
    self->_memoryFeatureNodes = v7;

    memoryFeatureNodes = self->_memoryFeatureNodes;
  }
  return memoryFeatureNodes;
}

- (BOOL)_implIsTripMemory
{
  void *v2;
  void *v3;
  char v4;

  -[MANodeCollection labels](self->_memoryNodeAsCollection, "labels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (NSString)debugInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphMemoryNodeCollection uniqueMemoryIdentifiers](self->_memoryNodeAsCollection, "uniqueMemoryIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Memory unique identifier %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (PGGraphMemoryNodeCollection)memoryNodeAsCollection
{
  return self->_memoryNodeAsCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
}

+ (id)matchingInfosWithMemoryNodes:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "graph");
  v4 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMemoryNode momentOfMemory](PGGraphMemoryNode, "momentOfMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjacencyWithSources:relation:targetsClass:", v3, v6, v7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "targets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode personExcludingMeInMoment](PGGraphMomentNode, "personExcludingMeInMoment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v8, v10, v11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode sceneOfMoment](PGGraphMomentNode, "sceneOfMoment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjacencyWithSources:relation:targetsClass:", v8, v13, v14);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode meaningOfMoment](PGGraphMomentNode, "meaningOfMoment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "adjacencyWithSources:relation:targetsClass:", v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = CFSTR("Gathering");
  v77[0] = CFSTR("Gathering");
  v20 = CFSTR("HolidayEvent");
  v77[1] = CFSTR("HolidayEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v58, v4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "subtractingTargetsWith:", v55);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "adjacencyWithSources:relation:targetsClass:", v8, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMemoryNode featureOfMemory](PGGraphMemoryNode, "featureOfMemory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "adjacencyWithSources:relation:targetsClass:", v3, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)v4;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphOverTheYearsNodeCollection, "nodesInGraph:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "featureNodeCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "subtractingTargetsWith:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 19, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v24, "targets");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke;
  v75[3] = &unk_1E8434620;
  v36 = v33;
  v76 = v36;
  objc_msgSend(v34, "enumerateNodesUsingBlock:", v75);

  v73[0] = v35;
  v73[1] = 3221225472;
  v73[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_2;
  v73[3] = &unk_1E8434648;
  v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74 = v37;
  objc_msgSend(v8, "enumerateUniversalStartDatesUsingBlock:", v73);
  v71[0] = v35;
  v71[1] = 3221225472;
  v71[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_3;
  v71[3] = &unk_1E8434648;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v72 = v38;
  objc_msgSend(v8, "enumerateUniversalEndDatesUsingBlock:", v71);
  v60[0] = v35;
  v60[1] = 3221225472;
  v60[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_4;
  v60[3] = &unk_1E8434698;
  v61 = v54;
  v62 = v52;
  v63 = v51;
  v64 = v24;
  v65 = v36;
  v66 = v32;
  v67 = v37;
  v68 = v38;
  v69 = v31;
  v39 = v56;
  v70 = v39;
  v57 = v31;
  v40 = v38;
  v41 = v37;
  v50 = v32;
  v49 = v36;
  v48 = v24;
  v42 = v51;
  v43 = v52;
  v44 = v54;
  objc_msgSend(v59, "enumerateTargetsBySourceWithBlock:", v60);
  v45 = v70;
  v46 = v39;

  return v46;
}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "location");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "identifier");

  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  PGUpNextMemoryBasedMatchingInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "intersectingSourcesWith:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "intersectingSourcesWith:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "intersectingSourcesWith:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "targetsForSources:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v7;
  +[PGUpNextMomentCollectionBasedMatchingInfo representativePersonNodesForPersonNodesByMomentNode:](PGUpNextMomentCollectionBasedMatchingInfo, "representativePersonNodesForPersonNodesByMomentNode:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v8;
  +[PGUpNextMomentCollectionBasedMatchingInfo representativeSceneNodesForSceneNodesByMomentNode:](PGUpNextMomentCollectionBasedMatchingInfo, "representativeSceneNodesForSceneNodesByMomentNode:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v9;
  +[PGUpNextMomentCollectionBasedMatchingInfo representativeMeaningNodesForEligibleMeaningNodesByMomentNode:](PGUpNextMomentCollectionBasedMatchingInfo, "representativeMeaningNodesForEligibleMeaningNodesByMomentNode:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v10;
  objc_msgSend(v10, "elementIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_5;
  v49[3] = &unk_1E84348D0;
  v50 = a1[8];
  v14 = v11;
  v51 = v14;
  objc_msgSend(v12, "enumerateIdentifiersWithBlock:", v49);

  objc_msgSend(a1[9], "elementIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "elementIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v15, "containsIdentifier:", objc_msgSend(v16, "firstElement"));

  +[PGUpNextMomentCollectionBasedMatchingInfo representativeLocationForLocations:](PGUpNextMomentCollectionBasedMatchingInfo, "representativeLocationForLocations:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__62657;
  v47 = __Block_byref_object_dispose__62658;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__62657;
  v41 = __Block_byref_object_dispose__62658;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_139;
  v32[3] = &unk_1E8434670;
  v35 = &v43;
  v33 = a1[10];
  v36 = &v37;
  v34 = a1[11];
  objc_msgSend(v18, "enumerateIdentifiersWithBlock:", v32);

  v19 = objc_alloc(MEMORY[0x1E0CB3588]);
  v20 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v44[5], v38[5]);
  +[PGUpNextMomentCollectionBasedMatchingInfo representativeDateForMomentNodesUniversalDateInterval:](PGUpNextMomentCollectionBasedMatchingInfo, "representativeDateForMomentNodesUniversalDateInterval:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[12], "targetsForSources:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGUpNextMemoryBasedMatchingInfo initWithMemoryNodeAsCollection:momentNodes:personNodes:sceneNodes:meaningNodes:isTripMemory:representativeLocation:representativeDate:memoryFeatureNodes:]([PGUpNextMemoryBasedMatchingInfo alloc], "initWithMemoryNodeAsCollection:momentNodes:personNodes:sceneNodes:meaningNodes:isTripMemory:representativeLocation:representativeDate:memoryFeatureNodes:", v5, v6, v29, v31, v30, v28, v17, v21, v22);
  objc_msgSend(a1[13], "addObject:", v23);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

}

void __64__PGUpNextMemoryBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke_139(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  v12 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "laterDate:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[7] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

@end
