@implementation PGMoodKeywordComputer

- (id)moodKeywordsForTriggeredMemory:(id)a3 suggestedMood:(unint64_t)a4 inGraph:(id)a5 locationHelper:(id)a6
{
  __int16 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  PGMoodKeywordComputer *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v33;
  id v34;
  void *v35;
  BOOL v36;
  PGSpecialPOIResolver *v37;
  void *v38;
  double v39;
  int v40;
  void *v41;
  void *v42;
  PGMoodKeywordComputer *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  id v49;
  void *v50;
  unint64_t v51;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((v8 & 0x3EF) == 0)
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_79;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "memoryMomentNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryFeatureNodes");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "memoryCategory");
  v51 = PGMemorySourceTypeFromCategory(v15) - 1;
  objc_msgSend(v14, "frequentLocationNodes");
  v16 = (PGMoodKeywordComputer *)objc_claimAutoreleasedReturnValue();
  v17 = -[PGMoodKeywordComputer count](v16, "count");

  v49 = v11;
  if (v15 == 10 || v15 == 28)
  {
    objc_msgSend(v13, "addObject:", CFSTR("Pets"));
  }
  else if (v15 == 11)
  {
    objc_msgSend(v13, "addObject:", CFSTR("Babies"));
    v48 = 0;
    v18 = 0;
    goto LABEL_34;
  }
  v18 = v15 == 16;
  if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 0x10)
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v50);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "meaningLabels");
    v16 = (PGMoodKeywordComputer *)objc_claimAutoreleasedReturnValue();
    if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("SportEvent")))
      objc_msgSend(v13, "addObject:", CFSTR("Sports"));
    if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Anniversary")))
      objc_msgSend(v13, "addObject:", CFSTR("Anniversary"));
    if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Wedding")))
      objc_msgSend(v13, "addObject:", CFSTR("Wedding"));
    if ((-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("NightOut")) & 1) != 0
      || -[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Performance")))
    {
      objc_msgSend(v13, "addObject:", CFSTR("Party"));
    }
    if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Birthday")))
      objc_msgSend(v13, "addObject:", CFSTR("Birthday"));
    if (!v17)
    {
      if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Beaching")))
        objc_msgSend(v13, "addObject:", CFSTR("Beach"));
      if (-[PGMoodKeywordComputer containsObject:](v16, "containsObject:", CFSTR("Hiking"))
        && !-[PGMoodKeywordComputer _isCrowdedForMomentNodes:](self, "_isCrowdedForMomentNodes:", v14))
      {
        objc_msgSend(v13, "addObject:", CFSTR("Nature"));
      }
    }
    v46 = v17;
    +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", v50);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    v48 = v21 != 0;

    if (v21)
    {
      v44 = self;
      objc_msgSend(v14, "dateNodes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "seasonNodes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "names");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", CFSTR("Winter"));

      if (v25)
        objc_msgSend(v13, "addObject:", CFSTR("Winter Holiday"));
      self = v44;
      -[PGMoodKeywordComputer _celebratedHolidayKeywordsForMomentNodes:inGraph:](v44, "_celebratedHolidayKeywordsForMomentNodes:inGraph:", v14, v49);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unionSet:", v26);

    }
    v18 = v15 == 16;
    v17 = v46;
  }
  else
  {
    if (v15 == 19)
    {
      -[PGMoodKeywordComputer _shortTripTypeNodeCollectionInGraph:](self, "_shortTripTypeNodeCollectionInGraph:", v49);
      v47 = v17;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v50);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "typeNodes");
      v16 = self;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v29, "intersectsCollection:", v27);

      self = v16;
      v17 = v47;
    }
    v48 = 0;
  }
LABEL_34:
  v30 = objc_msgSend(v14, "count");
  v33 = (v15 == 14 || v51 < 2) && v17 == 0;
  if (v30 == 1)
  {
    if (!v33)
    {
      v18 = 1;
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  if (v33)
  {
    if ((v18 & 1) == 0)
    {
      v16 = -[MAElementCollection initWithGraph:]([PGGraphPOINodeCollection alloc], "initWithGraph:", v49);
      v18 = 0;
      goto LABEL_50;
    }
LABEL_48:
    objc_msgSend(v14, "poiNodes");
    v16 = (PGMoodKeywordComputer *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
LABEL_50:
    if (!-[PGMoodKeywordComputer count](v16, "count"))
    {
      v34 = v12;
      -[PGMoodKeywordComputer _natureMomentNodesInGraph:](self, "_natureMomentNodesInGraph:", v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "intersectsCollection:", v14) & 1) != 0)
      {
        v36 = -[PGMoodKeywordComputer _isCrowdedForMomentNodes:](self, "_isCrowdedForMomentNodes:", v14);

        v12 = v34;
        if (!v36)
          objc_msgSend(v13, "addObject:", CFSTR("Nature"));
      }
      else
      {

        v12 = v34;
      }
    }

  }
LABEL_56:
  if (v15 == 15 || v51 <= 1)
  {
    v37 = [PGSpecialPOIResolver alloc];
    objc_msgSend(v14, "temporaryArray");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PGSpecialPOIResolver initWithMomentNodes:](v37, "initWithMomentNodes:", v38);

    if (v18)
      v39 = 0.6;
    else
      v39 = 0.9;
    if (-[PGMoodKeywordComputer momentsContainSpecialPOI:withMomentRatio:](v16, "momentsContainSpecialPOI:withMomentRatio:", 1, v39))objc_msgSend(v13, "addObject:", CFSTR("Disney"));
    if (-[PGMoodKeywordComputer momentsContainSpecialPOI:withMomentRatio:](v16, "momentsContainSpecialPOI:withMomentRatio:", 2, v39))objc_msgSend(v13, "addObject:", CFSTR("Universal"));

  }
  v40 = 1;
  if ((unint64_t)(v15 - 5) >= 2)
  {
    v11 = v49;
    if (v15 != 219)
    {
      objc_msgSend(v10, "triggerTypes");
      v16 = (PGMoodKeywordComputer *)objc_claimAutoreleasedReturnValue();
      v40 = -[PGMoodKeywordComputer containsIndex:](v16, "containsIndex:", 3) | v48;
    }
  }
  else
  {
    v11 = v49;
  }
  if ((unint64_t)(v15 - 5) >= 2 && v15 != 219)

  if (v40)
  {
    -[PGMoodKeywordComputer _gatheringAndFamilyKeywordsForTriggeredMemory:isMeaningfulEventHoliday:inGraph:](self, "_gatheringAndFamilyKeywordsForTriggeredMemory:isMeaningfulEventHoliday:inGraph:", v10, v48, v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", v41);

  }
  if ((unint64_t)(v15 - 12) < 3 || v51 <= 1)
  {
    -[PGMoodKeywordComputer _locationTripKeywordsForMomentNodes:locationHelper:](self, "_locationTripKeywordsForMomentNodes:locationHelper:", v14, v12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionSet:", v42);

  }
  -[PGMoodKeywordComputer _keywordsSortedByPriority:](self, "_keywordsSortedByPriority:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_79:
  return v19;
}

- (NSOrderedSet)orderedKeywords
{
  NSOrderedSet *orderedKeywords;
  void *v4;
  void *v5;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  _QWORD v9[20];

  v9[19] = *MEMORY[0x1E0C80C00];
  orderedKeywords = self->_orderedKeywords;
  if (!orderedKeywords)
  {
    v4 = (void *)MEMORY[0x1E0C99E40];
    v9[0] = CFSTR("Wedding");
    v9[1] = CFSTR("Disney");
    v9[2] = CFSTR("Universal");
    v9[3] = CFSTR("Paris");
    v9[4] = CFSTR("New York City");
    v9[5] = CFSTR("London");
    v9[6] = CFSTR("Hawaii");
    v9[7] = CFSTR("ChineseLunarNewYear");
    v9[8] = CFSTR("Babies");
    v9[9] = CFSTR("Pets");
    v9[10] = CFSTR("Birthday");
    v9[11] = CFSTR("Anniversary");
    v9[12] = CFSTR("Winter Holiday");
    v9[13] = CFSTR("Beach");
    v9[14] = CFSTR("Family");
    v9[15] = CFSTR("Nature");
    v9[16] = CFSTR("Sports");
    v9[17] = CFSTR("Party");
    v9[18] = CFSTR("Gathering");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedSetWithArray:", v5);
    v6 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedKeywords;
    self->_orderedKeywords = v6;

    orderedKeywords = self->_orderedKeywords;
  }
  return orderedKeywords;
}

- (id)_keywordsSortedByPriority:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGMoodKeywordComputer orderedKeywords](self, "orderedKeywords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3928];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PGMoodKeywordComputer__keywordsSortedByPriority___block_invoke;
  v12[3] = &unk_1E84340E8;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:comparator:", 0, 1, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_isCrowdedForMomentNodes:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "subsetWithTotalNumberOfPersonsGreaterThanOrEqualTo:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_bestSocialGroupNodesInGraph:(id)a3
{
  PGGraphSocialGroupNodeCollection *bestSocialGroupNodes;
  id v5;
  PGGraphSocialGroupNodeCollection *v6;
  void *v7;
  PGGraphSocialGroupNodeCollection *v8;
  PGGraphSocialGroupNodeCollection *v9;

  bestSocialGroupNodes = self->_bestSocialGroupNodes;
  if (!bestSocialGroupNodes)
  {
    v5 = a3;
    v6 = [PGGraphSocialGroupNodeCollection alloc];
    objc_msgSend(v5, "bestSocialGroupNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MAElementCollection initWithArray:graph:](v6, "initWithArray:graph:", v7, v5);

    v9 = self->_bestSocialGroupNodes;
    self->_bestSocialGroupNodes = v8;

    bestSocialGroupNodes = self->_bestSocialGroupNodes;
  }
  return bestSocialGroupNodes;
}

- (id)_shortTripTypeNodeCollectionInGraph:(id)a3
{
  PGGraphHighlightTypeNodeCollection *shortTripTypeNodeCollection;
  PGGraphHighlightTypeNodeCollection *v5;
  PGGraphHighlightTypeNodeCollection *v6;

  shortTripTypeNodeCollection = self->_shortTripTypeNodeCollection;
  if (!shortTripTypeNodeCollection)
  {
    +[PGGraphHighlightTypeNodeCollection shortTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "shortTripTypeNodesInGraph:", a3);
    v5 = (PGGraphHighlightTypeNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_shortTripTypeNodeCollection;
    self->_shortTripTypeNodeCollection = v5;

    shortTripTypeNodeCollection = self->_shortTripTypeNodeCollection;
  }
  return shortTripTypeNodeCollection;
}

- (NSArray)keywordsRegions
{
  NSArray *keywordsRegions;
  id v4;
  CLLocationCoordinate2D v5;
  void *v6;
  id v7;
  CLLocationCoordinate2D v8;
  void *v9;
  id v10;
  CLLocationCoordinate2D v11;
  void *v12;
  id v13;
  CLLocationCoordinate2D v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  keywordsRegions = self->_keywordsRegions;
  if (!keywordsRegions)
  {
    v4 = objc_alloc(MEMORY[0x1E0C9E368]);
    v5 = CLLocationCoordinate2DMake(40.7004225, -73.9530945);
    v6 = (void *)objc_msgSend(v4, "initWithCenter:radius:identifier:", CFSTR("New York City"), v5.latitude, v5.longitude, 26000.0);
    v19[0] = v6;
    v7 = objc_alloc(MEMORY[0x1E0C9E368]);
    v8 = CLLocationCoordinate2DMake(51.5001944, -0.118103027);
    v9 = (void *)objc_msgSend(v7, "initWithCenter:radius:identifier:", CFSTR("London"), v8.latitude, v8.longitude, 15000.0);
    v19[1] = v9;
    v10 = objc_alloc(MEMORY[0x1E0C9E368]);
    v11 = CLLocationCoordinate2DMake(48.8583905, 2.34352112);
    v12 = (void *)objc_msgSend(v10, "initWithCenter:radius:identifier:", CFSTR("Paris"), v11.latitude, v11.longitude, 10000.0);
    v19[2] = v12;
    v13 = objc_alloc(MEMORY[0x1E0C9E368]);
    v14 = CLLocationCoordinate2DMake(26.7259868, -157.631836);
    v15 = (void *)objc_msgSend(v13, "initWithCenter:radius:identifier:", CFSTR("Hawaii"), v14.latitude, v14.longitude, 1460000.0);
    v19[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_keywordsRegions;
    self->_keywordsRegions = v16;

    keywordsRegions = self->_keywordsRegions;
  }
  return keywordsRegions;
}

- (id)_locationTripKeywordsForMomentNodes:(id)a3 locationHelper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v30;
  id v31;
  void *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v32 = v6;
  objc_msgSend(v6, "temporaryArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(v7, "relevantAddressNodesForMomentNodes:applyDensestCloseLocationNode:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[PGMoodKeywordComputer keywordsRegions](self, "keywordsRegions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v40;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v40 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_msgSend(v14, "coordinate");
              if (objc_msgSend(v20, "containsCoordinate:"))
              {
                objc_msgSend(v20, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "addObject:", v21);

                goto LABEL_16;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }

  v22 = objc_msgSend(obj, "count");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v23 = v34;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k);
        if (objc_msgSend(v23, "countForObject:", v28) == v22)
          objc_msgSend(v31, "addObject:", v28);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v25);
  }

  return v31;
}

- (id)_lunarNewYearHolidayNodesInGraph:(id)a3
{
  PGGraphHolidayNodeCollection *lunarNewYearHolidayNodes;
  PGGraphHolidayNodeCollection *v5;
  PGGraphHolidayNodeCollection *v6;

  lunarNewYearHolidayNodes = self->_lunarNewYearHolidayNodes;
  if (!lunarNewYearHolidayNodes)
  {
    +[PGGraphHolidayNodeCollection holidayNodesWithNames:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithNames:inGraph:", &unk_1E84E9760, a3);
    v5 = (PGGraphHolidayNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lunarNewYearHolidayNodes;
    self->_lunarNewYearHolidayNodes = v5;

    lunarNewYearHolidayNodes = self->_lunarNewYearHolidayNodes;
  }
  return lunarNewYearHolidayNodes;
}

- (id)_celebratedHolidayKeywordsForMomentNodes:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  -[PGMoodKeywordComputer _lunarNewYearHolidayNodesInGraph:](self, "_lunarNewYearHolidayNodesInGraph:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "celebratedHolidayNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = objc_msgSend(v7, "intersectsCollection:", v8);
    objc_msgSend(v8, "collectionBySubtracting:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 && !v12)
      objc_msgSend(v9, "addObject:", CFSTR("ChineseLunarNewYear"));
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v9;
}

- (id)_gatheringAndFamilyKeywordsForTriggeredMemory:(id)a3 isMeaningfulEventHoliday:(BOOL)a4 inGraph:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  objc_class *v20;
  id v21;
  id v22;
  void *v24;
  void *v25;
  unint64_t v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "triggerTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsIndex:", 3);

  if (v11 && objc_msgSend(v8, "memoryCategory") != 6 && objc_msgSend(v8, "memoryCategory") != 5)
  {
    objc_msgSend(v8, "memoryMomentNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "personNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v13, "count");
    if (v15)
      goto LABEL_9;
LABEL_11:
    v20 = (objc_class *)MEMORY[0x1E0C99E60];
    goto LABEL_12;
  }
  objc_msgSend(v8, "memoryFeatureNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (!v14)
    goto LABEL_11;
  v15 = v14;
  if ((v11 & 1) == 0)
  {
    -[PGMoodKeywordComputer _bestSocialGroupNodesInGraph:](self, "_bestSocialGroupNodesInGraph:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "socialGroupNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "intersectsCollection:", v17);

    if (!v18)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99E60]);

      goto LABEL_14;
    }

  }
LABEL_9:
  if (v15 <= 2 && v6)
    goto LABEL_11;
  -[PGMoodKeywordComputer _familyOrPartnerPersonNodesInGraph:](self, "_familyOrPartnerPersonNodesInGraph:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "collectionByIntersecting:", v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  v20 = (objc_class *)MEMORY[0x1E0C99E60];
  if ((double)v15 * 0.5 <= (double)v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("Family"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_12:
  v21 = objc_alloc_init(v20);
LABEL_13:
  v22 = v21;
LABEL_14:

  return v22;
}

- (id)_familyOrPartnerPersonNodesInGraph:(id)a3
{
  PGGraphPersonNodeCollection *familyOrPartnerPersonNodes;
  void *v5;
  void *v6;
  void *v7;
  PGGraphPersonNodeCollection *v8;
  PGGraphPersonNodeCollection *v9;

  familyOrPartnerPersonNodes = self->_familyOrPartnerPersonNodes;
  if (!familyOrPartnerPersonNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "partnerPersonNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyPersonNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionByFormingUnionWith:", v7);
    v8 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    v9 = self->_familyOrPartnerPersonNodes;
    self->_familyOrPartnerPersonNodes = v8;

    familyOrPartnerPersonNodes = self->_familyOrPartnerPersonNodes;
  }
  return familyOrPartnerPersonNodes;
}

- (id)_natureMomentNodesInGraph:(id)a3
{
  PGGraphMomentNodeCollection *natureMomentNodes;
  void *v5;
  PGGraphMomentNodeCollection *v6;
  PGGraphMomentNodeCollection *v7;

  natureMomentNodes = self->_natureMomentNodes;
  if (!natureMomentNodes)
  {
    +[PGGraphROINodeCollection roiNodesOfType:inGraph:](PGGraphROINodeCollection, "roiNodesOfType:inGraph:", 4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodes");
    v6 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v7 = self->_natureMomentNodes;
    self->_natureMomentNodes = v6;

    natureMomentNodes = self->_natureMomentNodes;
  }
  return natureMomentNodes;
}

- (void)setOrderedKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeywords, a3);
}

- (void)setKeywordsRegions:(id)a3
{
  objc_storeStrong((id *)&self->_keywordsRegions, a3);
}

- (PGGraphHolidayNodeCollection)lunarNewYearHolidayNodes
{
  return self->_lunarNewYearHolidayNodes;
}

- (void)setLunarNewYearHolidayNodes:(id)a3
{
  objc_storeStrong((id *)&self->_lunarNewYearHolidayNodes, a3);
}

- (PGGraphHighlightTypeNodeCollection)shortTripTypeNodeCollection
{
  return self->_shortTripTypeNodeCollection;
}

- (void)setShortTripTypeNodeCollection:(id)a3
{
  objc_storeStrong((id *)&self->_shortTripTypeNodeCollection, a3);
}

- (PGGraphPersonNodeCollection)familyOrPartnerPersonNodes
{
  return self->_familyOrPartnerPersonNodes;
}

- (void)setFamilyOrPartnerPersonNodes:(id)a3
{
  objc_storeStrong((id *)&self->_familyOrPartnerPersonNodes, a3);
}

- (PGGraphSocialGroupNodeCollection)bestSocialGroupNodes
{
  return self->_bestSocialGroupNodes;
}

- (void)setBestSocialGroupNodes:(id)a3
{
  objc_storeStrong((id *)&self->_bestSocialGroupNodes, a3);
}

- (PGGraphMomentNodeCollection)natureMomentNodes
{
  return self->_natureMomentNodes;
}

- (void)setNatureMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_natureMomentNodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natureMomentNodes, 0);
  objc_storeStrong((id *)&self->_bestSocialGroupNodes, 0);
  objc_storeStrong((id *)&self->_familyOrPartnerPersonNodes, 0);
  objc_storeStrong((id *)&self->_shortTripTypeNodeCollection, 0);
  objc_storeStrong((id *)&self->_lunarNewYearHolidayNodes, 0);
  objc_storeStrong((id *)&self->_keywordsRegions, 0);
  objc_storeStrong((id *)&self->_orderedKeywords, 0);
}

uint64_t __51__PGMoodKeywordComputer__keywordsSortedByPriority___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);

  if (v7 < v8)
    return -1;
  else
    return v7 > v8;
}

@end
