@implementation PGPublicEventCriteriaFactory

- (PGPublicEventCriteriaFactory)initWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v7;
  id v8;
  PGPublicEventCriteriaFactory *v9;
  PGPublicEventCriteriaFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPublicEventCriteriaFactory;
  v9 = -[PGPublicEventCriteriaFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_sceneTaxonomy, a4);
  }

  return v10;
}

- (id)_publicEventCriteriaByCategory
{
  void *v3;
  void *v4;
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
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteriaFactory _sportsCriteriaArray](self, "_sportsCriteriaArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "sports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  -[PGPublicEventCriteriaFactory _musicConcertsCriteriaArray](self, "_musicConcertsCriteriaArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  -[PGPublicEventCriteriaFactory _nightLifeCriteriaArray](self, "_nightLifeCriteriaArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  -[PGPublicEventCriteriaFactory _festivalsAndFairsCriteriaArray](self, "_festivalsAndFairsCriteriaArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

  -[PGPublicEventCriteriaFactory _theaterCriteriaArray](self, "_theaterCriteriaArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "theater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

  -[PGPublicEventCriteriaFactory _danceCriteriaArray](self, "_danceCriteriaArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "dance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v15);

  -[PGPublicEventCriteriaFactory _artsAndMuseumsCriteriaArray](self, "_artsAndMuseumsCriteriaArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);

  -[PGPublicEventCriteriaFactory _appleEventsCriteriaArray](self, "_appleEventsCriteriaArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v19);

  return v3;
}

- (NSDictionary)highConfidenceCriteriaByEventCategory
{
  NSDictionary *highConfidenceCriteriaByEventCategory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;
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
  _QWORD v26[2];
  _QWORD v27[6];
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  highConfidenceCriteriaByEventCategory = self->_highConfidenceCriteriaByEventCategory;
  if (!highConfidenceCriteriaByEventCategory)
  {
    v27[0] = CFSTR("Performance");
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0D4B228], "dance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v18;
    v27[1] = CFSTR("Concert");
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v16;
    v27[2] = CFSTR("Festival");
    objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v5;
    v27[3] = CFSTR("SportEvent");
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v7;
    v27[4] = CFSTR("NightOut");
    objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v9;
    v27[5] = CFSTR("Museum");
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPublicEventCriteriaFactory _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:](self, "_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:", v12, 0);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_highConfidenceCriteriaByEventCategory;
    self->_highConfidenceCriteriaByEventCategory = v13;

    highConfidenceCriteriaByEventCategory = self->_highConfidenceCriteriaByEventCategory;
  }
  return highConfidenceCriteriaByEventCategory;
}

- (NSDictionary)disambiguationCriteriaByEventCategory
{
  NSDictionary *disambiguationCriteriaByEventCategory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  disambiguationCriteriaByEventCategory = self->_disambiguationCriteriaByEventCategory;
  if (!disambiguationCriteriaByEventCategory)
  {
    v17[0] = CFSTR("SportEvent");
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v17[1] = CFSTR("Concert");
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    v17[2] = CFSTR("Museum");
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPublicEventCriteriaFactory _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:](self, "_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:", v10, 1);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->_disambiguationCriteriaByEventCategory;
    self->_disambiguationCriteriaByEventCategory = v11;

    disambiguationCriteriaByEventCategory = self->_disambiguationCriteriaByEventCategory;
  }
  return disambiguationCriteriaByEventCategory;
}

- (NSDictionary)prohibitedCriteriaByEventCategory
{
  NSDictionary *prohibitedCriteriaByEventCategory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PGPublicEventCriteriaFactory *v44;
  _QWORD v45[3];
  _QWORD v46[7];
  _QWORD v47[7];
  _QWORD v48[7];
  _QWORD v49[7];
  _QWORD v50[5];
  _QWORD v51[7];

  v51[5] = *MEMORY[0x1E0C80C00];
  prohibitedCriteriaByEventCategory = self->_prohibitedCriteriaByEventCategory;
  if (!prohibitedCriteriaByEventCategory)
  {
    v50[0] = CFSTR("Dinner");
    v44 = self;
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v43;
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v42;
    objc_msgSend(MEMORY[0x1E0D4B228], "dance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v41;
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v40;
    objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v39;
    objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49[5] = v38;
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[6] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v36;
    v50[1] = CFSTR("Lunch");
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v35;
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v34;
    objc_msgSend(MEMORY[0x1E0D4B228], "dance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v33;
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v32;
    objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v31;
    objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v30;
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48[6] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v28;
    v50[2] = CFSTR("Breakfast");
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v27;
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v26;
    objc_msgSend(MEMORY[0x1E0D4B228], "dance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v25;
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v24;
    objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v23;
    objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v22;
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v20;
    v50[3] = CFSTR("Wedding");
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v18;
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v17;
    objc_msgSend(MEMORY[0x1E0D4B228], "dance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v4;
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v5;
    objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v6;
    objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v7;
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v9;
    v50[4] = CFSTR("Celebration");
    objc_msgSend(MEMORY[0x1E0D4B228], "theater");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v10;
    objc_msgSend(MEMORY[0x1E0D4B228], "sports");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v11;
    objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGPublicEventCriteriaFactory _meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:](v44, "_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:inferenceType:", v19, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v44->_prohibitedCriteriaByEventCategory;
    v44->_prohibitedCriteriaByEventCategory = (NSDictionary *)v14;

    prohibitedCriteriaByEventCategory = v44->_prohibitedCriteriaByEventCategory;
  }
  return prohibitedCriteriaByEventCategory;
}

- (id)_meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories:(id)a3 inferenceType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:](PGMeaningfulEventRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:", v7, a4, self->_graph, self->_sceneTaxonomy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__PGPublicEventCriteriaFactory__meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories_inferenceType___block_invoke;
  v15[3] = &unk_1E842F5D8;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)_sportsCriteriaArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  PGPublicEventCriteria *v15;
  void *v16;
  void *v17;
  PGPublicEventCriteria *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "sports");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteriaFactory disambiguationCriteriaByEventCategory](self, "disambiguationCriteriaByEventCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v5, "count");
  if (v10)
  {
    v11 = v10;
    if (v10 != 2)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v25 = 2;
        _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Number of sports disambiguation criteria must be %lu", buf, 0xCu);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
    v15 = objc_alloc_init(PGPublicEventCriteria);
    -[PGPublicEventCriteria setEventCategory:](v15, "setEventCategory:", v3);
    -[PGPublicEventCriteria setMinimumTimeAttendance:](v15, "setMinimumTimeAttendance:", 1200.0);
    -[PGPublicEventCriteria setMaximumDistance:](v15, "setMaximumDistance:", 500.0);
    -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v15, "setAllowsExpandingTimeAttendance:", 1);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPublicEventCriteria setDisambiguationCriteria:](v15, "setDisambiguationCriteria:", v17);

    -[PGPublicEventCriteria setHighConfidenceCriteria:](v15, "setHighConfidenceCriteria:", v7);
    -[PGPublicEventCriteria setProhibitedCriteria:](v15, "setProhibitedCriteria:", v9);
    -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v15, "setPromoteToHighConfidenceBasedOnCategory:", 1);
    objc_msgSend(v14, "addObject:", v15);
    if (v11 >= 2)
    {
      v18 = objc_alloc_init(PGPublicEventCriteria);
      -[PGPublicEventCriteria setEventCategory:](v18, "setEventCategory:", v3);
      -[PGPublicEventCriteria setMinimumTimeAttendance:](v18, "setMinimumTimeAttendance:", 300.0);
      -[PGPublicEventCriteria setMaximumDistance:](v18, "setMaximumDistance:", 750.0);
      -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v18, "setAllowsExpandingTimeAttendance:", 1);
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPublicEventCriteria setDisambiguationCriteria:](v18, "setDisambiguationCriteria:", v20);

      -[PGPublicEventCriteria setHighConfidenceCriteria:](v18, "setHighConfidenceCriteria:", v7);
      -[PGPublicEventCriteria setProhibitedCriteria:](v18, "setProhibitedCriteria:", v9);
      -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v18, "setPromoteToHighConfidenceBasedOnCategory:", 1);
      objc_msgSend(v14, "addObject:", v18);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)_musicConcertsCriteriaArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGPublicEventCriteria *v8;
  void *v9;
  void *v10;
  PGPublicEventCriteria *v11;
  PGPublicEventCriteria *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v8, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v8, "setMinimumTimeAttendance:", 2700.0);
  -[PGPublicEventCriteria setMaximumDistance:](v8, "setMaximumDistance:", 100.0);
  -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v8, "setAllowsExpandingTimeAttendance:", 1);
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v8, "setHighConfidenceCriteria:", v5);
  -[PGPublicEventCriteria setProhibitedCriteria:](v8, "setProhibitedCriteria:", v7);
  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v8, "setPromoteToHighConfidenceBasedOnCategory:", 0);
  -[PGPublicEventCriteriaFactory disambiguationCriteriaByEventCategory](self, "disambiguationCriteriaByEventCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(PGPublicEventCriteria);
    -[PGPublicEventCriteria setEventCategory:](v11, "setEventCategory:", v3);
    -[PGPublicEventCriteria setMinimumTimeAttendance:](v11, "setMinimumTimeAttendance:", 1200.0);
    -[PGPublicEventCriteria setMaximumDistance:](v11, "setMaximumDistance:", 250.0);
    -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v11, "setAllowsExpandingTimeAttendance:", 1);
    -[PGPublicEventCriteria setDisambiguationCriteria:](v11, "setDisambiguationCriteria:", v10);
    -[PGPublicEventCriteria setHighConfidenceCriteria:](v11, "setHighConfidenceCriteria:", v5);
    -[PGPublicEventCriteria setProhibitedCriteria:](v11, "setProhibitedCriteria:", v7);
    -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v11, "setPromoteToHighConfidenceBasedOnCategory:", 0);
    v12 = objc_alloc_init(PGPublicEventCriteria);
    -[PGPublicEventCriteria setEventCategory:](v12, "setEventCategory:", v3);
    -[PGPublicEventCriteria setMinimumTimeAttendance:](v12, "setMinimumTimeAttendance:", 1200.0);
    -[PGPublicEventCriteria setMaximumDistance:](v12, "setMaximumDistance:", 750.0);
    -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v12, "setAllowsExpandingTimeAttendance:", 1);
    -[PGPublicEventCriteria setDisambiguationCriteria:](v12, "setDisambiguationCriteria:", v10);
    -[PGPublicEventCriteria setHighConfidenceCriteria:](v12, "setHighConfidenceCriteria:", v5);
    -[PGPublicEventCriteria setProhibitedCriteria:](v12, "setProhibitedCriteria:", v7);
    -[PGPublicEventCriteria setMinimumAttendance:](v12, "setMinimumAttendance:", 10000);
    -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v12, "setPromoteToHighConfidenceBasedOnCategory:", 0);
    v15[0] = v8;
    v15[1] = v11;
    v15[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_theaterCriteriaArray
{
  void *v3;
  PGPublicEventCriteria *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "theater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v4, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v4, "setMinimumTimeAttendance:", 2700.0);
  -[PGPublicEventCriteria setMaximumDistance:](v4, "setMaximumDistance:", 100.0);
  -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v4, "setAllowsExpandingTimeAttendance:", 1);
  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v4, "setHighConfidenceCriteria:", v6);

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setProhibitedCriteria:](v4, "setProhibitedCriteria:", v8);

  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v4, "setPromoteToHighConfidenceBasedOnCategory:", 0);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_danceCriteriaArray
{
  void *v3;
  PGPublicEventCriteria *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "dance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v4, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v4, "setMinimumTimeAttendance:", 2700.0);
  -[PGPublicEventCriteria setMaximumDistance:](v4, "setMaximumDistance:", 100.0);
  -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v4, "setAllowsExpandingTimeAttendance:", 1);
  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v4, "setHighConfidenceCriteria:", v6);

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setProhibitedCriteria:](v4, "setProhibitedCriteria:", v8);

  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v4, "setPromoteToHighConfidenceBasedOnCategory:", 0);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_nightLifeCriteriaArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGPublicEventCriteria *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v8, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v8, "setMinimumTimeAttendance:", 2700.0);
  -[PGPublicEventCriteria setMaximumDistance:](v8, "setMaximumDistance:", 100.0);
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v8, "setHighConfidenceCriteria:", v5);
  -[PGPublicEventCriteria setProhibitedCriteria:](v8, "setProhibitedCriteria:", v7);
  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v8, "setPromoteToHighConfidenceBasedOnCategory:", 0);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_artsAndMuseumsCriteriaArray
{
  void *v3;
  PGPublicEventCriteria *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v4, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v4, "setMinimumTimeAttendance:", 3600.0);
  -[PGPublicEventCriteria setMaximumDistance:](v4, "setMaximumDistance:", 100.0);
  -[PGPublicEventCriteriaFactory disambiguationCriteriaByEventCategory](self, "disambiguationCriteriaByEventCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setDisambiguationCriteria:](v4, "setDisambiguationCriteria:", v6);

  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v4, "setHighConfidenceCriteria:", v8);

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setProhibitedCriteria:](v4, "setProhibitedCriteria:", v10);

  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v4, "setPromoteToHighConfidenceBasedOnCategory:", 1);
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_festivalsAndFairsCriteriaArray
{
  void *v3;
  PGPublicEventCriteria *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v4, "setEventCategory:", v3);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v4, "setMinimumTimeAttendance:", 12600.0);
  -[PGPublicEventCriteria setMaximumDistance:](v4, "setMaximumDistance:", 1000.0);
  -[PGPublicEventCriteria setMinimumAttendance:](v4, "setMinimumAttendance:", 15000);
  -[PGPublicEventCriteriaFactory highConfidenceCriteriaByEventCategory](self, "highConfidenceCriteriaByEventCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setHighConfidenceCriteria:](v4, "setHighConfidenceCriteria:", v6);

  -[PGPublicEventCriteriaFactory prohibitedCriteriaByEventCategory](self, "prohibitedCriteriaByEventCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPublicEventCriteria setProhibitedCriteria:](v4, "setProhibitedCriteria:", v8);

  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v4, "setPromoteToHighConfidenceBasedOnCategory:", 1);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_appleEventsCriteriaArray
{
  void *v2;
  PGPublicEventCriteria *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PGPublicEventCriteria);
  -[PGPublicEventCriteria setEventCategory:](v3, "setEventCategory:", v2);
  -[PGPublicEventCriteria setMinimumTimeAttendance:](v3, "setMinimumTimeAttendance:", 300.0);
  -[PGPublicEventCriteria setMaximumDistance:](v3, "setMaximumDistance:", 2000.0);
  -[PGPublicEventCriteria setAllowsExpandingTimeAttendance:](v3, "setAllowsExpandingTimeAttendance:", 1);
  -[PGPublicEventCriteria setPromoteToHighConfidenceBasedOnCategory:](v3, "setPromoteToHighConfidenceBasedOnCategory:", 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_highConfidenceCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_disambiguationCriteriaByEventCategory, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __115__PGPublicEventCriteriaFactory__meaningCriteriaByEventCategoryForMeaningIdentifierByEventCategories_inferenceType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (id)publicEventCriteriaByCategoryForGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v5;
  id v6;
  PGPublicEventCriteriaFactory *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[PGPublicEventCriteriaFactory initWithGraph:sceneTaxonomy:]([PGPublicEventCriteriaFactory alloc], "initWithGraph:sceneTaxonomy:", v6, v5);

  -[PGPublicEventCriteriaFactory _publicEventCriteriaByCategory](v7, "_publicEventCriteriaByCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
