@implementation PGGraphMeaningNode

- (PGGraphMeaningNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphMeaningNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMeaningNode;
  v5 = -[PGGraphNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (unsigned)domain
{
  return 700;
}

- (void)enumerateMeaningfulEventsUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 700, a3);
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PGGraphMeaningNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E842C4C8;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 700, v6);

}

- (void)enumerateMomentAlternativeEdgesAndNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PGGraphMeaningNode_enumerateMomentAlternativeEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E842C4F0;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 702, v6);

}

- (void)enumerateSubmeaningsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMeaningNode_enumerateSubmeaningsUsingBlock___block_invoke;
  v6[3] = &unk_1E842C520;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SUBMEANING_OF"), 700, v6);

}

- (void)traverseSubmeaningHierarchyUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMeaningNode_traverseSubmeaningHierarchyUsingBlock___block_invoke;
  v6[3] = &unk_1E842C548;
  v7 = v4;
  v5 = v4;
  -[PGGraphMeaningNode enumerateSubmeaningsUsingBlock:](self, "enumerateSubmeaningsUsingBlock:", v6);

}

- (void)traverseParentMeaningHierarchyUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[PGGraphMeaningNode parentMeaningNode](self, "parentMeaningNode");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = v6;
      v4[2](v4, v6, &v8);
      objc_msgSend(v6, "parentMeaningNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v6 && !v8);

  }
}

- (PGGraphMeaningNode)parentMeaningNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMeaningNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentMeaningNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNode *)v4;
}

- (BOOL)isVeryMeaningful
{
  int64_t isVeryMeaningfulCachedValue;
  int v3;
  void *v5;
  unint64_t v6;
  void *v7;
  int64_t v8;

  isVeryMeaningfulCachedValue = self->_isVeryMeaningfulCachedValue;
  if (isVeryMeaningfulCachedValue)
  {
    LOBYTE(v3) = isVeryMeaningfulCachedValue == 1;
  }
  else
  {
    -[PGGraphMeaningNode label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PGGraph meaningForMeaningLabel:](PGGraph, "meaningForMeaningLabel:", v5);

    +[PGGraph veryMeaningfulMeanings](PGGraph, "veryMeaningfulMeanings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "containsIndex:", v6);
    v8 = 1;
    if (!v3)
      v8 = -1;
    self->_isVeryMeaningfulCachedValue = v8;

  }
  return v3;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[PGGraphMeaningNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedNameForLabel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSArray)localizedSynonyms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[PGGraphMeaningNode label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizationKeyForMeaningLabel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)associatedNodesForRemoval
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMeaningNode parentMeaningNode](self, "parentMeaningNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PGGraphMeaningNode parentMeaningNode](self, "parentMeaningNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "countOfEdgesWithLabel:domain:", CFSTR("MEANING"), 700)
      && objc_msgSend(v5, "countOfEdgesWithLabel:domain:", CFSTR("SUBMEANING_OF"), 700) == 1)
    {
      objc_msgSend(v3, "addObject:", v5);
    }

  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PGGraphMeaningNode_associatedNodesForRemoval__block_invoke;
    v7[3] = &unk_1E842C590;
    v8 = v3;
    -[PGGraphMeaningNode enumerateSubmeaningsUsingBlock:](self, "enumerateSubmeaningsUsingBlock:", v7);

  }
  return v3;
}

- (PGGraphMeaningNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphMeaningNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 13;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMeaningNode label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)label
{
  return self->_label;
}

- (int64_t)isVeryMeaningfulCachedValue
{
  return self->_isVeryMeaningfulCachedValue;
}

- (void)setIsVeryMeaningfulCachedValue:(int64_t)a3
{
  self->_isVeryMeaningfulCachedValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

uint64_t __47__PGGraphMeaningNode_associatedNodesForRemoval__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __60__PGGraphMeaningNode_traverseSubmeaningHierarchyUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*a4)
    objc_msgSend(v6, "traverseSubmeaningHierarchyUsingBlock:", *(_QWORD *)(a1 + 32));

}

void __53__PGGraphMeaningNode_enumerateSubmeaningsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v8, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSameNodeAsNode:", v5);

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__PGGraphMeaningNode_enumerateMomentAlternativeEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Moment"));

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __61__PGGraphMeaningNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Moment"));

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 700);
}

+ (id)_localizedNameForLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_localizationKeyForMeaningLabel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, v3, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_localizationKeyForMeaningLabel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _localizationKeyForMeaningLabel__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_localizationKeyForMeaningLabel__onceToken, &__block_literal_global_29070);
  objc_msgSend((id)_localizationKeyForMeaningLabel__searchKeyByLabel, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (MARelation)childMeaningOfMeaning
{
  void *v2;
  void *v3;

  +[PGGraphSubmeaningOfEdge filter](PGGraphSubmeaningOfEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)parentMeaningOfMeaning
{
  void *v2;
  void *v3;

  +[PGGraphSubmeaningOfEdge filter](PGGraphSubmeaningOfEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)eventOfMeaning
{
  void *v2;
  void *v3;

  +[PGGraphMeaningEdge filter](PGGraphMeaningEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)eventOfReliableMeaning
{
  void *v2;
  void *v3;

  +[PGGraphMeaningEdge reliableFilter](PGGraphMeaningEdge, "reliableFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentOfMeaning
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "eventOfMeaning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (MARelation)momentOfReliableMeaning
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "eventOfReliableMeaning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (id)filterWithMeaning:(unint64_t)a3
{
  void *v3;
  void *v4;

  PGMeaningLabelForMeaning(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", v3, 700);
  else
    v4 = 0;

  return v4;
}

void __54__PGGraphMeaningNode__localizationKeyForMeaningLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[26];
  _QWORD v3[27];

  v3[26] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Activity");
  v2[1] = CFSTR("Hiking");
  v3[0] = CFSTR("PGMeaningActivitySearchableText");
  v3[1] = CFSTR("PGMeaningHikingSearchableText");
  v2[2] = CFSTR("Beaching");
  v2[3] = CFSTR("Diving");
  v3[2] = CFSTR("PGMeaningBeachingSearchableText");
  v3[3] = CFSTR("PGMeaningDivingSearchableText");
  v2[4] = CFSTR("WinterSport");
  v2[5] = CFSTR("Climbing");
  v3[4] = CFSTR("PGMeaningWinterSportSearchableText");
  v3[5] = CFSTR("PGMeaningClimbingSearchableText");
  v2[6] = CFSTR("Entertainment");
  v2[7] = CFSTR("AmusementPark");
  v3[6] = CFSTR("PGMeaningEntertainmentSearchableText");
  v3[7] = CFSTR("PGMeaningAmusementParkSearchableText");
  v2[8] = CFSTR("Performance");
  v2[9] = CFSTR("Concert");
  v3[8] = CFSTR("PGMeaningPerformanceSearchableText");
  v3[9] = CFSTR("PGMeaningConcertSearchableText");
  v2[10] = CFSTR("Festival");
  v2[11] = CFSTR("Theater");
  v3[10] = CFSTR("PGMeaningFestivalSearchableText");
  v3[11] = CFSTR("PGMeaningTheaterSearchableText");
  v2[12] = CFSTR("Dance");
  v2[13] = CFSTR("SportEvent");
  v3[12] = CFSTR("PGMeaningDanceSearchableText");
  v3[13] = CFSTR("PGMeaningSportEventSearchableText");
  v2[14] = CFSTR("NightOut");
  v2[15] = CFSTR("Museum");
  v3[14] = CFSTR("PGMeaningNightOutSearchableText");
  v3[15] = CFSTR("PGMeaningMuseumSearchableText");
  v2[16] = CFSTR("Celebration");
  v2[17] = CFSTR("Birthday");
  v3[16] = CFSTR("PGMeaningCelebrationSearchableText");
  v3[17] = CFSTR("PGMeaningBirthdaySearchableText");
  v2[18] = CFSTR("Anniversary");
  v2[19] = CFSTR("Wedding");
  v3[18] = CFSTR("PGMeaningAnniversarySearchableText");
  v3[19] = CFSTR("PGMeaningWeddingSearchableText");
  v2[20] = CFSTR("HolidayEvent");
  v2[21] = CFSTR("Gathering");
  v3[20] = CFSTR("PGMeaningHolidayEventSearchableText");
  v3[21] = CFSTR("PGMeaningGatheringSearchableText");
  v2[22] = CFSTR("Restaurant");
  v2[23] = CFSTR("Breakfast");
  v3[22] = CFSTR("PGMeaningRestaurantSearchableText");
  v3[23] = CFSTR("PGMeaningBreakfastSearchableText");
  v2[24] = CFSTR("Lunch");
  v2[25] = CFSTR("Dinner");
  v3[24] = CFSTR("PGMeaningLunchSearchableText");
  v3[25] = CFSTR("PGMeaningDinnerSearchableText");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 26);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localizationKeyForMeaningLabel__searchKeyByLabel;
  _localizationKeyForMeaningLabel__searchKeyByLabel = v0;

}

@end
