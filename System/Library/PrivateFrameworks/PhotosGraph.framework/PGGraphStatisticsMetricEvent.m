@implementation PGGraphStatisticsMetricEvent

- (PGGraphStatisticsMetricEvent)initWithGraphManager:(id)a3
{
  id v5;
  PGGraphStatisticsMetricEvent *v6;
  PGGraphStatisticsMetricEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphStatisticsMetricEvent;
  v6 = -[PGGraphStatisticsMetricEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_manager, a3);

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.GraphStatistics");
}

- (BOOL)shouldReportMetrics
{
  return -[PGManager isReady](self->_manager, "isReady");
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  PGManager *manager;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PGGraphStatisticsMetricEvent *v11;
  id v12;

  v4 = a3;
  -[PGManager enrichmentLoggingConnection](self->_manager, "enrichmentLoggingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  manager = self->_manager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PGGraphStatisticsMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E8436320;
  v11 = self;
  v12 = v4;
  v10 = v5;
  v7 = v5;
  v8 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](manager, "performSynchronousConcurrentGraphReadUsingBlock:", v9);

}

- (void)_fillGenericStatisticsWithGraph:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  unint64_t librarySize;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "infoNode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  self->_librarySize = objc_msgSend(v9, "numberOfAssets");
  v5 = objc_msgSend(v4, "librarySizeRange");

  self->_librarySizeRange = v5;
  v6 = objc_msgSend(v9, "numberOfSelfies");
  self->_numberOfSelfies = v6;
  librarySize = self->_librarySize;
  if (librarySize)
    v8 = (double)v6 / (double)librarySize;
  else
    v8 = *(double *)&PGMetricsUnavailableDoubleValue;
  self->_ratioOfSelfies = v8;

}

- (void)_fillMomentStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t numberOfMoments;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v4, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfMoments = objc_msgSend(v6, "count");
  objc_msgSend(v4, "meNodeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PGGraphStatisticsMetricEvent__fillMomentStatisticsWithGraph___block_invoke;
  v14[3] = &unk_1E8436348;
  v16 = &v37;
  v8 = v7;
  v15 = v8;
  v17 = &v33;
  v18 = &v29;
  v19 = &v25;
  v20 = &v21;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v14);
  self->_numberOfMomentsWithAtLeastOneGemAsset = v38[3];
  v9 = v34;
  self->_numberOfMomentsAtMyHome = v34[3];
  v10 = v30;
  self->_numberOfMomentsAtMyWork = v30[3];
  v11 = v22;
  self->_numberOfMomentsInTrip = v22[3];
  numberOfMoments = self->_numberOfMoments;
  if (numberOfMoments)
  {
    self->_ratioOfMomentsWithAtLeastOneGemAsset = (double)self->_numberOfMomentsWithAtLeastOneGemAsset
                                                / (double)numberOfMoments;
    self->_ratioOfMomentsAtMyHome = (double)(unint64_t)v9[3] / (double)numberOfMoments;
    self->_ratioOfMomentsAtMyWork = (double)(unint64_t)v10[3] / (double)numberOfMoments;
    self->_ratioOfMomentsAtAFrequentLocation = (double)(unint64_t)v26[3] / (double)numberOfMoments;
    v13 = (double)(unint64_t)v11[3] / (double)numberOfMoments;
  }
  else
  {
    *(_QWORD *)&self->_ratioOfMomentsWithAtLeastOneGemAsset = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfMomentsAtMyHome = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfMomentsAtMyWork = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfMomentsAtAFrequentLocation = PGMetricsUnavailableDoubleValue;
    v13 = *(double *)&PGMetricsUnavailableDoubleValue;
  }
  self->_ratioOfMomentsInTrip = v13;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  objc_autoreleasePoolPop(v5);
}

- (void)_fillMeaningfulEventsStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  PGGraphMomentNodeCollection *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t numberOfMoments;
  double v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v13, "meaningfulEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v7 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v5, v13);
  -[PGGraphMomentNodeCollection meaningNodes](v7, "meaningNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meaningLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  self->_numberOfMeaningfulMomentsGathering = objc_msgSend(v6, "countForObject:", CFSTR("Gathering"));
  self->_numberOfMeaningfulMomentsActivity = objc_msgSend(v6, "countForObject:", CFSTR("Activity"));
  self->_numberOfMeaningfulMomentsActivityBeach = objc_msgSend(v6, "countForObject:", CFSTR("Beaching"));
  self->_numberOfMeaningfulMomentsActivityDiving = objc_msgSend(v6, "countForObject:", CFSTR("Diving"));
  self->_numberOfMeaningfulMomentsActivityHiking = objc_msgSend(v6, "countForObject:", CFSTR("Hiking"));
  self->_numberOfMeaningfulMomentsActivityWinterSport = objc_msgSend(v6, "countForObject:", CFSTR("WinterSport"));
  self->_numberOfMeaningfulMomentsEntertainment = objc_msgSend(v6, "countForObject:", CFSTR("Entertainment"));
  self->_numberOfMeaningfulMomentsEntertainmentNightOut = objc_msgSend(v6, "countForObject:", CFSTR("NightOut"));
  self->_numberOfMeaningfulMomentsEntertainmentPerformance = objc_msgSend(v6, "countForObject:", CFSTR("Performance"));
  self->_numberOfMeaningfulMomentsEntertainmentSportEvent = objc_msgSend(v6, "countForObject:", CFSTR("SportEvent"));
  self->_numberOfMeaningfulMomentsEntertainmentConcert = objc_msgSend(v6, "countForObject:", CFSTR("Concert"));
  self->_numberOfMeaningfulMomentsEntertainmentDance = objc_msgSend(v6, "countForObject:", CFSTR("Dance"));
  self->_numberOfMeaningfulMomentsEntertainmentAmusementPark = objc_msgSend(v6, "countForObject:", CFSTR("AmusementPark"));
  self->_numberOfMeaningfulMomentsEntertainmentFestival = objc_msgSend(v6, "countForObject:", CFSTR("Festival"));
  self->_numberOfMeaningfulMomentsEntertainmentMuseum = objc_msgSend(v6, "countForObject:", CFSTR("Museum"));
  self->_numberOfMeaningfulMomentsEntertainmentTheater = objc_msgSend(v6, "countForObject:", CFSTR("Theater"));
  self->_numberOfMeaningfulMomentsCelebration = objc_msgSend(v6, "countForObject:", CFSTR("Celebration"));
  self->_numberOfMeaningfulMomentsCelebrationAnniversary = objc_msgSend(v6, "countForObject:", CFSTR("Anniversary"));
  self->_numberOfMeaningfulMomentsCelebrationBirthday = objc_msgSend(v6, "countForObject:", CFSTR("Birthday"));
  self->_numberOfMeaningfulMomentsCelebrationHolidayEvent = objc_msgSend(v6, "countForObject:", CFSTR("HolidayEvent"));
  self->_numberOfMeaningfulMomentsCelebrationWedding = objc_msgSend(v6, "countForObject:", CFSTR("Wedding"));
  self->_numberOfMeaningfulMomentsRestaurant = objc_msgSend(v6, "countForObject:", CFSTR("Restaurant"));
  self->_numberOfMeaningfulMomentsRestaurantBreakfast = objc_msgSend(v6, "countForObject:", CFSTR("Breakfast"));
  self->_numberOfMeaningfulMomentsRestaurantLunch = objc_msgSend(v6, "countForObject:", CFSTR("Lunch"));
  self->_numberOfMeaningfulMomentsRestaurantDinner = objc_msgSend(v6, "countForObject:", CFSTR("Dinner"));
  v10 = objc_msgSend(v5, "count");
  self->_numberOfMeaningfulMoments = v10;
  numberOfMoments = self->_numberOfMoments;
  if (numberOfMoments)
    v12 = (double)v10 / (double)numberOfMoments;
  else
    v12 = *(double *)&PGMetricsUnavailableDoubleValue;
  self->_ratioOfMeaningfulMoments = v12;

  objc_autoreleasePoolPop(v4);
}

- (void)_fillBusinessStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t numberOfMoments;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __65__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph___block_invoke;
  v14 = &unk_1E8436430;
  v16 = &v17;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v4, "enumerateBusinessNodesUsingBlock:", &v11);
  self->_numberOfBusinessNodes = v18[3];
  v8 = objc_msgSend(v7, "count", v11, v12, v13, v14);
  self->_numberOfMomentsLinkedToABusinessNode = v8;
  numberOfMoments = self->_numberOfMoments;
  if (numberOfMoments)
    v10 = (double)v8 / (double)numberOfMoments;
  else
    v10 = *(double *)&PGMetricsUnavailableDoubleValue;
  self->_ratioOfMomentsLinkedToABusinessNode = v10;

  _Block_object_dispose(&v17, 8);
  objc_autoreleasePoolPop(v5);

}

- (void)_fillPublicEventStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t numberOfMoments;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke;
  v26[3] = &unk_1E8436480;
  v29 = &v30;
  v8 = v7;
  v27 = v8;
  v9 = v6;
  v28 = v9;
  objc_msgSend(v4, "enumeratePublicEventNodesUsingBlock:", v26);
  self->_numberOfPublicEvents = v31[3];
  v10 = objc_msgSend(v9, "count");
  self->_numberOfMomentsLinkedToAPublicEvent = v10;
  numberOfMoments = self->_numberOfMoments;
  if (numberOfMoments)
    v12 = (double)v10 / (double)numberOfMoments;
  else
    v12 = *(double *)&PGMetricsUnavailableDoubleValue;
  self->_ratioOfMomentsLinkedToAPublicEvent = v12;
  objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryMusicConcerts = objc_msgSend(v8, "countForObject:", v13);

  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryNightLife = objc_msgSend(v8, "countForObject:", v14);

  objc_msgSend(MEMORY[0x1E0D4B228], "theater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryTheater = objc_msgSend(v8, "countForObject:", v15);

  objc_msgSend(MEMORY[0x1E0D4B228], "dance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryDance = objc_msgSend(v8, "countForObject:", v16);

  objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryFestivalsAndFairs = objc_msgSend(v8, "countForObject:", v17);

  objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryArtsAndMuseums = objc_msgSend(v8, "countForObject:", v18);

  objc_msgSend(MEMORY[0x1E0D4B228], "sports");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategorySports = objc_msgSend(v8, "countForObject:", v19);

  objc_msgSend(MEMORY[0x1E0D4B228], "businessAndTechnology");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryBusinessAndTechnology = objc_msgSend(v8, "countForObject:", v20);

  objc_msgSend(MEMORY[0x1E0D4B228], "community");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryCommunity = objc_msgSend(v8, "countForObject:", v21);

  objc_msgSend(MEMORY[0x1E0D4B228], "educational");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryEducational = objc_msgSend(v8, "countForObject:", v22);

  objc_msgSend(MEMORY[0x1E0D4B228], "familyEvents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryFamilyEvents = objc_msgSend(v8, "countForObject:", v23);

  objc_msgSend(MEMORY[0x1E0D4B228], "tours");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryTours = objc_msgSend(v8, "countForObject:", v24);

  objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPublicEventsCategoryAppleEvents = objc_msgSend(v8, "countForObject:", v25);

  _Block_object_dispose(&v30, 8);
  objc_autoreleasePoolPop(v5);

}

- (void)_fillPeopleStatisticsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  void *v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  unint64_t v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t j;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  unint64_t numberOfSocialGroups;
  void *context;
  void *v38;
  void *v39;
  id obj;
  unint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v39 = v3;
  objc_msgSend(v3, "meNode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasMeNode = v38 != 0;
  objc_msgSend(v38, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasNamedMeNode = objc_msgSend(v4, "length") != 0;

  objc_msgSend(v3, "personNodesIncludingMe:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfPeople = objc_msgSend(v5, "count");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v6)
  {
    v42 = 0;
    v43 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isFavorite");
        objc_msgSend(v12, "contactIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length") == 0;

        if (v15)
        {
          v49 = 0;
          v50 = &v49;
          v51 = 0x2020000000;
          v52 = 0;
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __63__PGGraphStatisticsMetricEvent__fillPeopleStatisticsWithGraph___block_invoke;
          v48[3] = &unk_1E84364A8;
          v48[4] = &v49;
          objc_msgSend(v12, "enumerateContactSuggestionsSortedByConfidenceMatchingQuery:usingBlock:", 1, v48);
          v42 += *((unsigned __int8 *)v50 + 24);
          _Block_object_dispose(&v49, 8);
        }
        else
        {
          objc_msgSend(v12, "birthdayDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 != 0;

          objc_msgSend(v12, "potentialBirthdayDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 != 0;

          ++v8;
          v7 += v17;
          v43 += v19;
        }
        v9 += v13;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v6);
    v20 = (double)v9;
  }
  else
  {
    v42 = 0;
    v43 = 0;
    v7 = 0;
    v8 = 0;
    v20 = 0.0;
  }

  v21 = objc_msgSend(obj, "count");
  self->_numberOfPeople = v21;
  if (v21)
  {
    v22 = (double)v8 / (double)v21;
    self->_ratioOfPeopleLinkedToContact = v22;
    self->_ratioOfPeopleNotLinkedToContact = 1.0 - v22;
    self->_ratioOfFavoritedPeople = v20 / (double)v21;
    self->_ratioOfPeopleWithExplicitBirthdayDate = (double)v7 / (double)v21;
    self->_ratioOfPeopleWithInferredBirthdayDate = (double)(v43 / v21);
    self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = (double)v42 / (double)(v21 - v8);
    objc_msgSend(v39, "socialGroupNodesSortedByImportance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfSocialGroups = objc_msgSend(v23, "count");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v26)
    {
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v45;
      v30 = 0.0;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "personNodes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "unionSet:", v32);
          v33 = objc_msgSend(v32, "count");
          v34 = v33;
          if (v33 == 1)
            ++v27;
          if (v33 > v28)
            v28 = v33;

          v30 = v30 + (double)v34;
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v26);
      v35 = (double)v27;
    }
    else
    {
      v28 = 0;
      v35 = 0.0;
      v30 = 0.0;
    }

    self->_ratioOfPeoplePartOfASocialGroup = (double)(unint64_t)objc_msgSend(v24, "count")
                                           / (double)self->_numberOfPeople;
    numberOfSocialGroups = self->_numberOfSocialGroups;
    if (numberOfSocialGroups)
    {
      self->_ratioOfTwoPeopleSocialGroup = v35 / (double)numberOfSocialGroups;
      self->_averageSocialGroupSize = v30 / (double)numberOfSocialGroups;
    }
    else
    {
      *(_QWORD *)&self->_ratioOfTwoPeopleSocialGroup = PGMetricsUnavailableDoubleValue;
      *(_QWORD *)&self->_averageSocialGroupSize = PGMetricsUnavailableDoubleValue;
      v28 = PGMetricsUnavailableIntegerValue;
    }
    self->_maximumSocialGroupSize = v28;

  }
  else
  {
    *(_QWORD *)&self->_ratioOfPeopleLinkedToContact = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfPeopleNotLinkedToContact = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfFavoritedPeople = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfPeopleWithExplicitBirthdayDate = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfPeopleWithInferredBirthdayDate = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfPeoplePartOfASocialGroup = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_ratioOfTwoPeopleSocialGroup = PGMetricsUnavailableDoubleValue;
    *(_QWORD *)&self->_averageSocialGroupSize = PGMetricsUnavailableDoubleValue;
    self->_maximumSocialGroupSize = PGMetricsUnavailableIntegerValue;
  }

  objc_autoreleasePoolPop(context);
}

- (void)_fillMusicStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  unint64_t numberOfMusicSessions;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PGGraphStatisticsMetricEvent__fillMusicStatisticsWithGraph___block_invoke;
  v7[3] = &unk_1E84364D0;
  v7[4] = &v16;
  v7[5] = &v8;
  v7[6] = &v12;
  objc_msgSend(v4, "enumerateMusicSessionNodesUsingBlock:", v7);
  self->_numberOfMusicSessions = v17[3];
  self->_maximumMusicSessionSize = v13[3];
  numberOfMusicSessions = self->_numberOfMusicSessions;
  self->_hasMusicData = numberOfMusicSessions != 0;
  if (numberOfMusicSessions)
    self->_averageMusicSessionSize = (double)(unint64_t)v9[3] / (double)numberOfMusicSessions;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  objc_autoreleasePoolPop(v5);

}

- (void)_fillHolidaysStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t numberOfMoments;
  double v16;
  void *context;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v18 = v4;
  objc_msgSend(v4, "celebratedHolidayNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfCelebratedHolidays = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v19[0] = v11;
        v19[1] = 3221225472;
        v19[2] = __65__PGGraphStatisticsMetricEvent__fillHolidaysStatisticsWithGraph___block_invoke;
        v19[3] = &unk_1E8436408;
        v20 = v6;
        objc_msgSend(v13, "enumerateCelebratingMomentNodesUsingBlock:", v19);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v14 = objc_msgSend(v6, "count");
  self->_numberOfMomentsCelebratingAHoliday = v14;
  numberOfMoments = self->_numberOfMoments;
  if (numberOfMoments)
    v16 = (double)v14 / (double)numberOfMoments;
  else
    v16 = *(double *)&PGMetricsUnavailableDoubleValue;
  self->_ratioOfMomentsCelebratingAHoliday = v16;

  objc_autoreleasePoolPop(context);
}

- (void)_fillPetStatisticsWithGraph:(id)a3
{
  id v4;

  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_numberOfPetNodes = objc_msgSend(v4, "count");

}

- (void)_fillHomeWorkStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "meNodeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasMeHomeNode = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v4, "meNodeCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "workNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasMeWorkNode = objc_msgSend(v7, "count") != 0;

}

- (void)_fillFrequentLocationsStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "supersets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfFrequentLocations = objc_msgSend(v5, "count");

  objc_msgSend(v4, "supersetCityNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfFrequentLocationsCities = objc_msgSend(v6, "count");

  objc_msgSend(v4, "supersetCountryNodes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  self->_numberOfFrequentLocationsCountries = objc_msgSend(v7, "count");
}

- (void)_fillTripStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "longTripNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfLongTrips = objc_msgSend(v5, "count");

  objc_msgSend(v4, "shortTripNodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  self->_numberOfShortTrips = objc_msgSend(v6, "count");
}

- (id)payload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("librarySize"), self->_librarySize, v3);
  +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:](PGCuratedLibraryIntelligenceMetricEvent, "librarySizeRangeDescriptionForLibrarySizeRange:", self->_librarySizeRange);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphStatisticsMetricEvent _saveKey:stringValue:payload:](self, "_saveKey:stringValue:payload:", CFSTR("librarySizeRange"), v4, v3);

  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfSelfies"), self->_numberOfSelfies, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfSelfies"), v3, self->_ratioOfSelfies);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMoments"), self->_numberOfMoments, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfBusinessNodes"), self->_numberOfBusinessNodes, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsLinkedToABusinessNode"), self->_numberOfMomentsLinkedToABusinessNode, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsLinkedToABusinessNode"), v3, self->_ratioOfMomentsLinkedToABusinessNode);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMoments"), self->_numberOfMeaningfulMoments, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMeaningfulMoments"), v3, self->_ratioOfMeaningfulMoments);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsGathering"), self->_numberOfMeaningfulMomentsGathering, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivity"), self->_numberOfMeaningfulMomentsActivity, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivityBeach"), self->_numberOfMeaningfulMomentsActivityBeach, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivityDiving"), self->_numberOfMeaningfulMomentsActivityDiving, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivityHiking"), self->_numberOfMeaningfulMomentsActivityHiking, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivityClimbing"), self->_numberOfMeaningfulMomentsActivityClimbing, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsActivityWinterSport"), self->_numberOfMeaningfulMomentsActivityWinterSport, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainment"), self->_numberOfMeaningfulMomentsEntertainment, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentAmusementPark"), self->_numberOfMeaningfulMomentsEntertainmentAmusementPark, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentNightOut"), self->_numberOfMeaningfulMomentsEntertainmentNightOut, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentPerformance"), self->_numberOfMeaningfulMomentsEntertainmentPerformance, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentConcert"), self->_numberOfMeaningfulMomentsEntertainmentConcert, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentFestival"), self->_numberOfMeaningfulMomentsEntertainmentFestival, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentTheater"), self->_numberOfMeaningfulMomentsEntertainmentTheater, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentDance"), self->_numberOfMeaningfulMomentsEntertainmentDance, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentMuseum"), self->_numberOfMeaningfulMomentsEntertainmentMuseum, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsEntertainmentSportEvent"), self->_numberOfMeaningfulMomentsEntertainmentSportEvent, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsCelebration"), self->_numberOfMeaningfulMomentsCelebration, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsCelebrationAnniversary"), self->_numberOfMeaningfulMomentsCelebrationAnniversary, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsCelebrationBirthday"), self->_numberOfMeaningfulMomentsCelebrationBirthday, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsCelebrationHolidayEvent"), self->_numberOfMeaningfulMomentsCelebrationHolidayEvent, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsCelebrationWedding"), self->_numberOfMeaningfulMomentsCelebrationWedding, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsRestaurant"), self->_numberOfMeaningfulMomentsRestaurant, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsRestaurantBreakfast"), self->_numberOfMeaningfulMomentsRestaurantBreakfast, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsRestaurantLunch"), self->_numberOfMeaningfulMomentsRestaurantLunch, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMeaningfulMomentsRestaurantDinner"), self->_numberOfMeaningfulMomentsRestaurantDinner, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEvents"), self->_numberOfPublicEvents, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryMusicConcerts"), self->_numberOfPublicEventsCategoryMusicConcerts, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryNightLife"), self->_numberOfPublicEventsCategoryNightLife, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryTheater"), self->_numberOfPublicEventsCategoryTheater, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryDance"), self->_numberOfPublicEventsCategoryDance, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryFestivalsAndFairs"), self->_numberOfPublicEventsCategoryFestivalsAndFairs, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryArtsAndMuseums"), self->_numberOfPublicEventsCategoryArtsAndMuseums, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategorySports"), self->_numberOfPublicEventsCategorySports, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryBusinessAndTechnology"), self->_numberOfPublicEventsCategoryBusinessAndTechnology, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryCommunity"), self->_numberOfPublicEventsCategoryCommunity, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryEducational"), self->_numberOfPublicEventsCategoryEducational, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryFamilyEvents"), self->_numberOfPublicEventsCategoryFamilyEvents, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryTours"), self->_numberOfPublicEventsCategoryTours, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPublicEventsCategoryAppleEvents"), self->_numberOfPublicEventsCategoryAppleEvents, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsLinkedToAPublicEvent"), self->_numberOfMomentsLinkedToAPublicEvent, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsLinkedToAPublicEvent"), v3, self->_ratioOfMomentsLinkedToAPublicEvent);
  -[PGGraphStatisticsMetricEvent _saveKey:BOOLValue:payload:](self, "_saveKey:BOOLValue:payload:", CFSTR("hasMeNode"), self->_hasMeNode, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:BOOLValue:payload:](self, "_saveKey:BOOLValue:payload:", CFSTR("hasNamedMeNode"), self->_hasNamedMeNode, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPeople"), self->_numberOfPeople, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeopleLinkedToContact"), v3, self->_ratioOfPeopleLinkedToContact);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeopleNotLinkedToContact"), v3, self->_ratioOfPeopleNotLinkedToContact);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion"), v3, self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfFavoritedPeople"), v3, self->_ratioOfFavoritedPeople);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeopleWithExplicitBirthdayDate"), v3, self->_ratioOfPeopleWithExplicitBirthdayDate);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeopleWithInferredBirthdayDate"), v3, self->_ratioOfPeopleWithInferredBirthdayDate);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfSocialGroups"), self->_numberOfSocialGroups, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPeoplePartOfASocialGroup"), v3, self->_ratioOfPeoplePartOfASocialGroup);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfTwoPeopleSocialGroup"), v3, self->_ratioOfTwoPeopleSocialGroup);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageSocialGroupSize"), v3, self->_averageSocialGroupSize);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("maximumSocialGroupSize"), self->_maximumSocialGroupSize, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:BOOLValue:payload:](self, "_saveKey:BOOLValue:payload:", CFSTR("hasMusicData"), self->_hasMusicData, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMusicSessions"), self->_numberOfMusicSessions, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("maximumMusicSessionSize"), self->_maximumMusicSessionSize, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageMusicSessionSize"), v3, self->_averageMusicSessionSize);
  -[PGGraphStatisticsMetricEvent _saveKey:BOOLValue:payload:](self, "_saveKey:BOOLValue:payload:", CFSTR("hasMeHomeNode"), self->_hasMeHomeNode, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:BOOLValue:payload:](self, "_saveKey:BOOLValue:payload:", CFSTR("hasMeWorkNode"), self->_hasMeWorkNode, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsAtMyHome"), self->_numberOfMomentsAtMyHome, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsAtMyWork"), self->_numberOfMomentsAtMyWork, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsAtMyHome"), v3, self->_ratioOfMomentsAtMyHome);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsAtMyWork"), v3, self->_ratioOfMomentsAtMyWork);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsAtAFrequentLocation"), v3, self->_ratioOfMomentsAtAFrequentLocation);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfFrequentLocations"), self->_numberOfFrequentLocations, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfFrequentLocationsCities"), self->_numberOfFrequentLocationsCities, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfFrequentLocationsCountries"), self->_numberOfFrequentLocationsCountries, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfPetNodes"), self->_numberOfPetNodes, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfCelebratedHolidays"), self->_numberOfCelebratedHolidays, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsCelebratingAHoliday"), self->_numberOfMomentsCelebratingAHoliday, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsCelebratingAHoliday"), v3, self->_ratioOfMomentsCelebratingAHoliday);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfShortTrips"), self->_numberOfShortTrips, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfLongTrips"), self->_numberOfLongTrips, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsInTrip"), self->_numberOfMomentsInTrip, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsInTrip"), v3, self->_ratioOfMomentsInTrip);
  -[PGGraphStatisticsMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMomentsWithAtLeastOneGemAsset"), self->_numberOfMomentsWithAtLeastOneGemAsset, v3);
  -[PGGraphStatisticsMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfMomentsWithAtLeastOneGemAsset"), v3, self->_ratioOfMomentsWithAtLeastOneGemAsset);
  return v3;
}

- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  if (*(double *)&PGMetricsUnavailableDoubleValue != a4)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a5;
    v9 = a3;
    objc_msgSend(v7, "numberWithDouble:", a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)_saveKey:(id)a3 BOOLValue:(BOOL)a4 payload:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "numberWithBool:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  if (PGMetricsUnavailableIntegerValue != a4)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a5;
    v9 = a3;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5
{
  objc_msgSend(a5, "setObject:forKeyedSubscript:", a4, a3);
}

- (PGManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (unint64_t)librarySize
{
  return self->_librarySize;
}

- (void)setLibrarySize:(unint64_t)a3
{
  self->_librarySize = a3;
}

- (int64_t)librarySizeRange
{
  return self->_librarySizeRange;
}

- (void)setLibrarySizeRange:(int64_t)a3
{
  self->_librarySizeRange = a3;
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (unint64_t)numberOfBusinessNodes
{
  return self->_numberOfBusinessNodes;
}

- (void)setNumberOfBusinessNodes:(unint64_t)a3
{
  self->_numberOfBusinessNodes = a3;
}

- (unint64_t)numberOfMomentsLinkedToABusinessNode
{
  return self->_numberOfMomentsLinkedToABusinessNode;
}

- (void)setNumberOfMomentsLinkedToABusinessNode:(unint64_t)a3
{
  self->_numberOfMomentsLinkedToABusinessNode = a3;
}

- (double)ratioOfMomentsLinkedToABusinessNode
{
  return self->_ratioOfMomentsLinkedToABusinessNode;
}

- (void)setRatioOfMomentsLinkedToABusinessNode:(double)a3
{
  self->_ratioOfMomentsLinkedToABusinessNode = a3;
}

- (unint64_t)numberOfMeaningfulMoments
{
  return self->_numberOfMeaningfulMoments;
}

- (void)setNumberOfMeaningfulMoments:(unint64_t)a3
{
  self->_numberOfMeaningfulMoments = a3;
}

- (double)ratioOfMeaningfulMoments
{
  return self->_ratioOfMeaningfulMoments;
}

- (void)setRatioOfMeaningfulMoments:(double)a3
{
  self->_ratioOfMeaningfulMoments = a3;
}

- (unint64_t)numberOfMeaningfulMomentsGathering
{
  return self->_numberOfMeaningfulMomentsGathering;
}

- (void)setNumberOfMeaningfulMomentsGathering:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsGathering = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivity
{
  return self->_numberOfMeaningfulMomentsActivity;
}

- (void)setNumberOfMeaningfulMomentsActivity:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivity = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityBeach
{
  return self->_numberOfMeaningfulMomentsActivityBeach;
}

- (void)setNumberOfMeaningfulMomentsActivityBeach:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityBeach = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityDiving
{
  return self->_numberOfMeaningfulMomentsActivityDiving;
}

- (void)setNumberOfMeaningfulMomentsActivityDiving:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityDiving = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityHiking
{
  return self->_numberOfMeaningfulMomentsActivityHiking;
}

- (void)setNumberOfMeaningfulMomentsActivityHiking:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityHiking = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityClimbing
{
  return self->_numberOfMeaningfulMomentsActivityClimbing;
}

- (void)setNumberOfMeaningfulMomentsActivityClimbing:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityClimbing = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityWinterSport
{
  return self->_numberOfMeaningfulMomentsActivityWinterSport;
}

- (void)setNumberOfMeaningfulMomentsActivityWinterSport:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityWinterSport = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainment
{
  return self->_numberOfMeaningfulMomentsEntertainment;
}

- (void)setNumberOfMeaningfulMomentsEntertainment:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainment = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentAmusementPark
{
  return self->_numberOfMeaningfulMomentsEntertainmentAmusementPark;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentAmusementPark:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentAmusementPark = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentNightOut
{
  return self->_numberOfMeaningfulMomentsEntertainmentNightOut;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentNightOut:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentNightOut = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentPerformance
{
  return self->_numberOfMeaningfulMomentsEntertainmentPerformance;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentPerformance:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentPerformance = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentConcert
{
  return self->_numberOfMeaningfulMomentsEntertainmentConcert;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentConcert:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentConcert = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentFestival
{
  return self->_numberOfMeaningfulMomentsEntertainmentFestival;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentFestival:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentFestival = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentTheater
{
  return self->_numberOfMeaningfulMomentsEntertainmentTheater;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentTheater:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentTheater = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentDance
{
  return self->_numberOfMeaningfulMomentsEntertainmentDance;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentDance:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentDance = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentMuseum
{
  return self->_numberOfMeaningfulMomentsEntertainmentMuseum;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentMuseum:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentMuseum = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentSportEvent
{
  return self->_numberOfMeaningfulMomentsEntertainmentSportEvent;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentSportEvent:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentSportEvent = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebration
{
  return self->_numberOfMeaningfulMomentsCelebration;
}

- (void)setNumberOfMeaningfulMomentsCelebration:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebration = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationAnniversary
{
  return self->_numberOfMeaningfulMomentsCelebrationAnniversary;
}

- (void)setNumberOfMeaningfulMomentsCelebrationAnniversary:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationAnniversary = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationBirthday
{
  return self->_numberOfMeaningfulMomentsCelebrationBirthday;
}

- (void)setNumberOfMeaningfulMomentsCelebrationBirthday:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationBirthday = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationHolidayEvent
{
  return self->_numberOfMeaningfulMomentsCelebrationHolidayEvent;
}

- (void)setNumberOfMeaningfulMomentsCelebrationHolidayEvent:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationHolidayEvent = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationWedding
{
  return self->_numberOfMeaningfulMomentsCelebrationWedding;
}

- (void)setNumberOfMeaningfulMomentsCelebrationWedding:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationWedding = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurant
{
  return self->_numberOfMeaningfulMomentsRestaurant;
}

- (void)setNumberOfMeaningfulMomentsRestaurant:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurant = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantBreakfast
{
  return self->_numberOfMeaningfulMomentsRestaurantBreakfast;
}

- (void)setNumberOfMeaningfulMomentsRestaurantBreakfast:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantBreakfast = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantLunch
{
  return self->_numberOfMeaningfulMomentsRestaurantLunch;
}

- (void)setNumberOfMeaningfulMomentsRestaurantLunch:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantLunch = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantDinner
{
  return self->_numberOfMeaningfulMomentsRestaurantDinner;
}

- (void)setNumberOfMeaningfulMomentsRestaurantDinner:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantDinner = a3;
}

- (unint64_t)numberOfPublicEvents
{
  return self->_numberOfPublicEvents;
}

- (void)setNumberOfPublicEvents:(unint64_t)a3
{
  self->_numberOfPublicEvents = a3;
}

- (unint64_t)numberOfPublicEventsCategoryMusicConcerts
{
  return self->_numberOfPublicEventsCategoryMusicConcerts;
}

- (void)setNumberOfPublicEventsCategoryMusicConcerts:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryMusicConcerts = a3;
}

- (unint64_t)numberOfPublicEventsCategoryNightLife
{
  return self->_numberOfPublicEventsCategoryNightLife;
}

- (void)setNumberOfPublicEventsCategoryNightLife:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryNightLife = a3;
}

- (unint64_t)numberOfPublicEventsCategoryTheater
{
  return self->_numberOfPublicEventsCategoryTheater;
}

- (void)setNumberOfPublicEventsCategoryTheater:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryTheater = a3;
}

- (unint64_t)numberOfPublicEventsCategoryDance
{
  return self->_numberOfPublicEventsCategoryDance;
}

- (void)setNumberOfPublicEventsCategoryDance:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryDance = a3;
}

- (unint64_t)numberOfPublicEventsCategoryFestivalsAndFairs
{
  return self->_numberOfPublicEventsCategoryFestivalsAndFairs;
}

- (void)setNumberOfPublicEventsCategoryFestivalsAndFairs:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryFestivalsAndFairs = a3;
}

- (unint64_t)numberOfPublicEventsCategoryArtsAndMuseums
{
  return self->_numberOfPublicEventsCategoryArtsAndMuseums;
}

- (void)setNumberOfPublicEventsCategoryArtsAndMuseums:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryArtsAndMuseums = a3;
}

- (unint64_t)numberOfPublicEventsCategorySports
{
  return self->_numberOfPublicEventsCategorySports;
}

- (void)setNumberOfPublicEventsCategorySports:(unint64_t)a3
{
  self->_numberOfPublicEventsCategorySports = a3;
}

- (unint64_t)numberOfPublicEventsCategoryBusinessAndTechnology
{
  return self->_numberOfPublicEventsCategoryBusinessAndTechnology;
}

- (void)setNumberOfPublicEventsCategoryBusinessAndTechnology:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryBusinessAndTechnology = a3;
}

- (unint64_t)numberOfPublicEventsCategoryCommunity
{
  return self->_numberOfPublicEventsCategoryCommunity;
}

- (void)setNumberOfPublicEventsCategoryCommunity:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryCommunity = a3;
}

- (unint64_t)numberOfPublicEventsCategoryEducational
{
  return self->_numberOfPublicEventsCategoryEducational;
}

- (void)setNumberOfPublicEventsCategoryEducational:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryEducational = a3;
}

- (unint64_t)numberOfPublicEventsCategoryFamilyEvents
{
  return self->_numberOfPublicEventsCategoryFamilyEvents;
}

- (void)setNumberOfPublicEventsCategoryFamilyEvents:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryFamilyEvents = a3;
}

- (unint64_t)numberOfPublicEventsCategoryTours
{
  return self->_numberOfPublicEventsCategoryTours;
}

- (void)setNumberOfPublicEventsCategoryTours:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryTours = a3;
}

- (unint64_t)numberOfPublicEventsCategoryAppleEvents
{
  return self->_numberOfPublicEventsCategoryAppleEvents;
}

- (void)setNumberOfPublicEventsCategoryAppleEvents:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryAppleEvents = a3;
}

- (unint64_t)numberOfMomentsLinkedToAPublicEvent
{
  return self->_numberOfMomentsLinkedToAPublicEvent;
}

- (void)setNumberOfMomentsLinkedToAPublicEvent:(unint64_t)a3
{
  self->_numberOfMomentsLinkedToAPublicEvent = a3;
}

- (double)ratioOfMomentsLinkedToAPublicEvent
{
  return self->_ratioOfMomentsLinkedToAPublicEvent;
}

- (void)setRatioOfMomentsLinkedToAPublicEvent:(double)a3
{
  self->_ratioOfMomentsLinkedToAPublicEvent = a3;
}

- (unint64_t)numberOfSignificantMoments
{
  return self->_numberOfSignificantMoments;
}

- (void)setNumberOfSignificantMoments:(unint64_t)a3
{
  self->_numberOfSignificantMoments = a3;
}

- (double)ratioOfSignificantMoments
{
  return self->_ratioOfSignificantMoments;
}

- (void)setRatioOfSignificantMoments:(double)a3
{
  self->_ratioOfSignificantMoments = a3;
}

- (double)ratioOfDaysWithASignificantEventPastYear
{
  return self->_ratioOfDaysWithASignificantEventPastYear;
}

- (void)setRatioOfDaysWithASignificantEventPastYear:(double)a3
{
  self->_ratioOfDaysWithASignificantEventPastYear = a3;
}

- (double)averageDurationBetweenTwoSignificantEvents
{
  return self->_averageDurationBetweenTwoSignificantEvents;
}

- (void)setAverageDurationBetweenTwoSignificantEvents:(double)a3
{
  self->_averageDurationBetweenTwoSignificantEvents = a3;
}

- (BOOL)hasMeNode
{
  return self->_hasMeNode;
}

- (void)setHasMeNode:(BOOL)a3
{
  self->_hasMeNode = a3;
}

- (BOOL)hasNamedMeNode
{
  return self->_hasNamedMeNode;
}

- (void)setHasNamedMeNode:(BOOL)a3
{
  self->_hasNamedMeNode = a3;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (double)ratioOfPeopleLinkedToContact
{
  return self->_ratioOfPeopleLinkedToContact;
}

- (void)setRatioOfPeopleLinkedToContact:(double)a3
{
  self->_ratioOfPeopleLinkedToContact = a3;
}

- (double)ratioOfPeopleNotLinkedToContact
{
  return self->_ratioOfPeopleNotLinkedToContact;
}

- (void)setRatioOfPeopleNotLinkedToContact:(double)a3
{
  self->_ratioOfPeopleNotLinkedToContact = a3;
}

- (double)ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion
{
  return self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion;
}

- (void)setRatioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion:(double)a3
{
  self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = a3;
}

- (double)ratioOfFavoritedPeople
{
  return self->_ratioOfFavoritedPeople;
}

- (void)setRatioOfFavoritedPeople:(double)a3
{
  self->_ratioOfFavoritedPeople = a3;
}

- (double)ratioOfPeopleWithExplicitBirthdayDate
{
  return self->_ratioOfPeopleWithExplicitBirthdayDate;
}

- (void)setRatioOfPeopleWithExplicitBirthdayDate:(double)a3
{
  self->_ratioOfPeopleWithExplicitBirthdayDate = a3;
}

- (double)ratioOfPeopleWithInferredBirthdayDate
{
  return self->_ratioOfPeopleWithInferredBirthdayDate;
}

- (void)setRatioOfPeopleWithInferredBirthdayDate:(double)a3
{
  self->_ratioOfPeopleWithInferredBirthdayDate = a3;
}

- (unint64_t)numberOfSocialGroups
{
  return self->_numberOfSocialGroups;
}

- (void)setNumberOfSocialGroups:(unint64_t)a3
{
  self->_numberOfSocialGroups = a3;
}

- (double)ratioOfPeoplePartOfASocialGroup
{
  return self->_ratioOfPeoplePartOfASocialGroup;
}

- (void)setRatioOfPeoplePartOfASocialGroup:(double)a3
{
  self->_ratioOfPeoplePartOfASocialGroup = a3;
}

- (double)ratioOfTwoPeopleSocialGroup
{
  return self->_ratioOfTwoPeopleSocialGroup;
}

- (void)setRatioOfTwoPeopleSocialGroup:(double)a3
{
  self->_ratioOfTwoPeopleSocialGroup = a3;
}

- (unint64_t)maximumSocialGroupSize
{
  return self->_maximumSocialGroupSize;
}

- (void)setMaximumSocialGroupSize:(unint64_t)a3
{
  self->_maximumSocialGroupSize = a3;
}

- (double)averageSocialGroupSize
{
  return self->_averageSocialGroupSize;
}

- (void)setAverageSocialGroupSize:(double)a3
{
  self->_averageSocialGroupSize = a3;
}

- (BOOL)hasMusicData
{
  return self->_hasMusicData;
}

- (void)setHasMusicData:(BOOL)a3
{
  self->_hasMusicData = a3;
}

- (unint64_t)numberOfMusicSessions
{
  return self->_numberOfMusicSessions;
}

- (void)setNumberOfMusicSessions:(unint64_t)a3
{
  self->_numberOfMusicSessions = a3;
}

- (unint64_t)maximumMusicSessionSize
{
  return self->_maximumMusicSessionSize;
}

- (void)setMaximumMusicSessionSize:(unint64_t)a3
{
  self->_maximumMusicSessionSize = a3;
}

- (double)averageMusicSessionSize
{
  return self->_averageMusicSessionSize;
}

- (void)setAverageMusicSessionSize:(double)a3
{
  self->_averageMusicSessionSize = a3;
}

- (BOOL)hasMeHomeNode
{
  return self->_hasMeHomeNode;
}

- (void)setHasMeHomeNode:(BOOL)a3
{
  self->_hasMeHomeNode = a3;
}

- (BOOL)hasMeWorkNode
{
  return self->_hasMeWorkNode;
}

- (void)setHasMeWorkNode:(BOOL)a3
{
  self->_hasMeWorkNode = a3;
}

- (unint64_t)numberOfMomentsAtMyHome
{
  return self->_numberOfMomentsAtMyHome;
}

- (void)setNumberOfMomentsAtMyHome:(unint64_t)a3
{
  self->_numberOfMomentsAtMyHome = a3;
}

- (unint64_t)numberOfMomentsAtMyWork
{
  return self->_numberOfMomentsAtMyWork;
}

- (void)setNumberOfMomentsAtMyWork:(unint64_t)a3
{
  self->_numberOfMomentsAtMyWork = a3;
}

- (double)ratioOfMomentsAtMyHome
{
  return self->_ratioOfMomentsAtMyHome;
}

- (void)setRatioOfMomentsAtMyHome:(double)a3
{
  self->_ratioOfMomentsAtMyHome = a3;
}

- (double)ratioOfMomentsAtMyWork
{
  return self->_ratioOfMomentsAtMyWork;
}

- (void)setRatioOfMomentsAtMyWork:(double)a3
{
  self->_ratioOfMomentsAtMyWork = a3;
}

- (double)ratioOfMomentsAtAFrequentLocation
{
  return self->_ratioOfMomentsAtAFrequentLocation;
}

- (void)setRatioOfMomentsAtAFrequentLocation:(double)a3
{
  self->_ratioOfMomentsAtAFrequentLocation = a3;
}

- (unint64_t)numberOfFrequentLocations
{
  return self->_numberOfFrequentLocations;
}

- (void)setNumberOfFrequentLocations:(unint64_t)a3
{
  self->_numberOfFrequentLocations = a3;
}

- (unint64_t)numberOfFrequentLocationsCities
{
  return self->_numberOfFrequentLocationsCities;
}

- (void)setNumberOfFrequentLocationsCities:(unint64_t)a3
{
  self->_numberOfFrequentLocationsCities = a3;
}

- (unint64_t)numberOfFrequentLocationsCountries
{
  return self->_numberOfFrequentLocationsCountries;
}

- (void)setNumberOfFrequentLocationsCountries:(unint64_t)a3
{
  self->_numberOfFrequentLocationsCountries = a3;
}

- (unint64_t)numberOfPetNodes
{
  return self->_numberOfPetNodes;
}

- (void)setNumberOfPetNodes:(unint64_t)a3
{
  self->_numberOfPetNodes = a3;
}

- (unint64_t)numberOfCelebratedHolidays
{
  return self->_numberOfCelebratedHolidays;
}

- (void)setNumberOfCelebratedHolidays:(unint64_t)a3
{
  self->_numberOfCelebratedHolidays = a3;
}

- (unint64_t)numberOfMomentsCelebratingAHoliday
{
  return self->_numberOfMomentsCelebratingAHoliday;
}

- (void)setNumberOfMomentsCelebratingAHoliday:(unint64_t)a3
{
  self->_numberOfMomentsCelebratingAHoliday = a3;
}

- (double)ratioOfMomentsCelebratingAHoliday
{
  return self->_ratioOfMomentsCelebratingAHoliday;
}

- (void)setRatioOfMomentsCelebratingAHoliday:(double)a3
{
  self->_ratioOfMomentsCelebratingAHoliday = a3;
}

- (unint64_t)numberOfShortTrips
{
  return self->_numberOfShortTrips;
}

- (void)setNumberOfShortTrips:(unint64_t)a3
{
  self->_numberOfShortTrips = a3;
}

- (unint64_t)numberOfLongTrips
{
  return self->_numberOfLongTrips;
}

- (void)setNumberOfLongTrips:(unint64_t)a3
{
  self->_numberOfLongTrips = a3;
}

- (unint64_t)numberOfMomentsInTrip
{
  return self->_numberOfMomentsInTrip;
}

- (void)setNumberOfMomentsInTrip:(unint64_t)a3
{
  self->_numberOfMomentsInTrip = a3;
}

- (double)ratioOfMomentsInTrip
{
  return self->_ratioOfMomentsInTrip;
}

- (void)setRatioOfMomentsInTrip:(double)a3
{
  self->_ratioOfMomentsInTrip = a3;
}

- (unint64_t)numberOfMomentsWithAtLeastOneGemAsset
{
  return self->_numberOfMomentsWithAtLeastOneGemAsset;
}

- (void)setNumberOfMomentsWithAtLeastOneGemAsset:(unint64_t)a3
{
  self->_numberOfMomentsWithAtLeastOneGemAsset = a3;
}

- (double)ratioOfMomentsWithAtLeastOneGemAsset
{
  return self->_ratioOfMomentsWithAtLeastOneGemAsset;
}

- (void)setRatioOfMomentsWithAtLeastOneGemAsset:(double)a3
{
  self->_ratioOfMomentsWithAtLeastOneGemAsset = a3;
}

- (unint64_t)numberOfSelfies
{
  return self->_numberOfSelfies;
}

- (void)setNumberOfSelfies:(unint64_t)a3
{
  self->_numberOfSelfies = a3;
}

- (double)ratioOfSelfies
{
  return self->_ratioOfSelfies;
}

- (void)setRatioOfSelfies:(double)a3
{
  self->_ratioOfSelfies = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

uint64_t __65__PGGraphStatisticsMetricEvent__fillHolidaysStatisticsWithGraph___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __62__PGGraphStatisticsMetricEvent__fillMusicStatisticsWithGraph___block_invoke(_QWORD *a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_msgSend(a2, "trackNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v3;
  v4 = *(_QWORD *)(a1[6] + 8);
  if (v3 > *(_QWORD *)(v4 + 24))
    *(_QWORD *)(v4 + 24) = v3;

}

uint64_t __63__PGGraphStatisticsMetricEvent__fillPeopleStatisticsWithGraph___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

void __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = MEMORY[0x1E0C809B0];
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke_2;
  v10[3] = &unk_1E8436458;
  v11 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "enumeratePublicEventCategoryNodesUsingBlock:", v10);
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke_3;
  v8[3] = &unk_1E8436408;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v8);

}

void __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __68__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(a2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph___block_invoke_2;
  v5[3] = &unk_1E8436408;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v5);

}

uint64_t __65__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __63__PGGraphStatisticsMetricEvent__fillMomentStatisticsWithGraph___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(v4, "numberOfShinyGemAssets");
  if (v3 + objc_msgSend(v4, "numberOfRegularGemAssets"))
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (objc_msgSend(v4, "happensPartiallyAtHomeOfPersonNodes:", a1[4]))
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (objc_msgSend(v4, "happensPartiallyAtWorkOfPersonNodes:", a1[4]))
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  if (objc_msgSend(v4, "happensAtFrequentLocation"))
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  if (objc_msgSend(v4, "isPartOfTrip"))
    ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);

}

void __63__PGGraphStatisticsMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  double Current;
  NSObject *v14;
  const char *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint32_t denom;
  uint32_t numer;
  NSObject *v23;
  NSObject *v24;
  uint32_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  char v30;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v33[18];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    objc_msgSend(v3, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(id *)(a1 + 32);
    v9 = os_signpost_id_generate(v8);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GraphStatisticsMetrics", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v12 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillGenericStatisticsWithGraph:", v7);
    if (v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.1);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 173;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
LABEL_67:
            v25 = 18;
LABEL_68:
            _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, v15, buf, v25);
            goto LABEL_69;
          }
          goto LABEL_69;
        }
        v5 = Current;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillMomentStatisticsWithGraph:", v7);
      v17 = CFAbsoluteTimeGetCurrent();
      if (v17 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.2);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 177;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v17;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillBusinessStatisticsWithGraph:", v7);
      v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.3);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 181;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v18;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillMeaningfulEventsStatisticsWithGraph:", v7);
      v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.4);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 185;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v19;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillPublicEventStatisticsWithGraph:", v7);
      v26 = CFAbsoluteTimeGetCurrent();
      if (v26 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.5);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 189;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v26;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillPeopleStatisticsWithGraph:", v7);
      v27 = CFAbsoluteTimeGetCurrent();
      if (v27 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.6);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 193;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v27;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillTripStatisticsWithGraph:", v7);
      v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.7);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 197;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v28;
      }
      objc_msgSend(*(id *)(a1 + 40), "_fillHolidaysStatisticsWithGraph:", v7);
      v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.8);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 201;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
          goto LABEL_69;
        }
        v5 = v29;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_fillMomentStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillBusinessStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillMeaningfulEventsStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillPublicEventStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillPeopleStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillTripStatisticsWithGraph:", v7);
      objc_msgSend(*(id *)(a1 + 40), "_fillHolidaysStatisticsWithGraph:", v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "_fillPetStatisticsWithGraph:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_fillHomeWorkStatisticsWithGraph:", v7);
    if (v4)
    {
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v5 >= 0.01)
      {
        v30 = 0;
        v4[2](v4, &v30, 0.9);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v33 = 208;
            *(_WORD *)&v33[4] = 2080;
            *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
            v14 = MEMORY[0x1E0C81028];
            v15 = "Cancelled at line %d in file %s";
            goto LABEL_67;
          }
LABEL_69:

          goto LABEL_70;
        }
        v5 = v16;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_fillMusicStatisticsWithGraph:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_fillFrequentLocationsStatisticsWithGraph:", v7);
    if (!v4 || CFAbsoluteTimeGetCurrent() - v5 < 0.01 || (v30 = 0, v4[2](v4, &v30, 1.0), !v30))
    {
      v20 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v23 = v11;
      v24 = v23;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, v9, "GraphStatisticsMetrics", ", buf, 2u);
      }

      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_69;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v33 = "GraphStatisticsMetrics";
      *(_WORD *)&v33[8] = 2048;
      *(double *)&v33[10] = (float)((float)((float)((float)(v20 - v12) * (float)numer) / (float)denom) / 1000000.0);
      v15 = "[Performance] %s: %f ms";
      v14 = v24;
      v25 = 22;
      goto LABEL_68;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v33 = 215;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
      v14 = MEMORY[0x1E0C81028];
      v15 = "Cancelled at line %d in file %s";
      goto LABEL_67;
    }
    goto LABEL_69;
  }
  LOBYTE(info.numer) = 0;
  ((void (**)(void *, mach_timebase_info *, double))v4)[2](v4, &info, 0.0);
  if (!LOBYTE(info.numer))
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = 165;
    *(_WORD *)&v33[4] = 2080;
    *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_70:

}

@end
