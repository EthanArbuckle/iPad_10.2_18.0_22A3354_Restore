@implementation PGDayHighlightTitleGenerator

- (PGDayHighlightTitleGenerator)initWithSummarizedFeatures:(id)a3 momentNodes:(id)a4 titleGenerationContext:(id)a5 loggingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGDayHighlightTitleGenerator *v15;
  PGDayHighlightTitleGenerator *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGDayHighlightTitleGenerator;
  v15 = -[PGDayHighlightTitleGenerator init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_summarizedFeatures, a3);
    objc_storeStrong((id *)&v16->_momentNodes, a4);
    objc_storeStrong((id *)&v16->_loggingConnection, a6);
    objc_storeStrong((id *)&v16->_titleGenerationContext, a5);
  }

  return v16;
}

- (PGTitleTuple)titleTuple
{
  PGTitleTuple *titleTuple;
  void *v4;
  void *v5;
  void *v6;
  PGTitleTuple *v7;
  PGTitleTuple *v8;

  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    -[PGDayHighlightTitleGenerator localizedTitleStringForSortedSummarizedFeatures:](self, "localizedTitleStringForSortedSummarizedFeatures:", self->_summarizedFeatures);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v4, 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", &stru_1E8436F28, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v5, v6);
      v8 = self->_titleTuple;
      self->_titleTuple = v7;

    }
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (id)localizedTitleStringForSortedSummarizedFeatures:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "type");
        v16 = v4;
        if (v15 == 1)
          goto LABEL_11;
        v17 = objc_msgSend(v14, "type");
        v16 = v5;
        if (v17 != 3)
        {
          v18 = objc_msgSend(v14, "type");
          v16 = v6;
          if (v18 != 2)
          {
            v19 = objc_msgSend(v14, "type");
            v16 = v7;
            if (v19 != 4)
            {
              v20 = objc_msgSend(v14, "type");
              v16 = v8;
              if (v20 != 5)
                continue;
            }
          }
        }
LABEL_11:
        objc_msgSend(v16, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v11);
  }

  -[PGDayHighlightTitleGenerator dayHighlightMeaningLabels](self, "dayHighlightMeaningLabels");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1
    || (objc_msgSend(v22, "meaningLabel"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v21, "containsObject:", v23),
        v23,
        !v24)
    || (-[PGDayHighlightTitleGenerator localizedTitleStringFromMeaningFeature:](self, "localizedTitleStringFromMeaningFeature:", v22), (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v8, "count") != 1
      || (objc_msgSend(v8, "firstObject"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PGDayHighlightTitleGenerator localizedTitleStringFromHolidayDateFeature:](self, "localizedTitleStringFromHolidayDateFeature:", v26), v25 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v25))
    {
      if (objc_msgSend(v7, "count") != 1
        || (objc_msgSend(v7, "firstObject"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PGDayHighlightTitleGenerator localizedTitleStringFromPublicEventFeature:](self, "localizedTitleStringFromPublicEventFeature:", v27), v25 = (void *)objc_claimAutoreleasedReturnValue(), v27, !v25))
      {
        if (objc_msgSend(v6, "count") != 1
          || (objc_msgSend(v6, "firstObject"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              -[PGDayHighlightTitleGenerator localizedTitleStringFromBusinessFeature:](self, "localizedTitleStringFromBusinessFeature:", v28), v25 = (void *)objc_claimAutoreleasedReturnValue(), v28, !v25))
        {
          if (objc_msgSend(v4, "count") == 1)
          {
            objc_msgSend(v4, "firstObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGDayHighlightTitleGenerator localizedTitleStringFromLocationFeature:](self, "localizedTitleStringFromLocationFeature:", v29);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = 0;
          }
        }
      }
    }
  }

  return v25;
}

- (id)nameFromLocationFeature:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "subtype");
  if ((v5 - 2) >= 4)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "locationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "locationNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)localizedTitleStringFromMeaningFeature:(id)a3
{
  id v4;
  PGSpecBasedHighlightTitleGenerator *v5;
  void *v6;
  void *v7;
  PGSpecBasedHighlightTitleGenerator *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [PGSpecBasedHighlightTitleGenerator alloc];
  -[MAElementCollection set](self->_momentNodes, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meaningLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PGSpecBasedHighlightTitleGenerator initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:](v5, "initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:", v6, v7, 0, self->_titleGenerationContext);
  -[PGTitleGenerator setLineBreakBehavior:](v8, "setLineBreakBehavior:", 2);
  -[PGTitleGenerator title](v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedTitleStringFromBusinessFeature:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "businessNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGDayHighlightTitleFormatOneBusinessLocation %@"), CFSTR("PGDayHighlightTitleFormatOneBusinessLocation %@"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedTitleStringFromPublicEventFeature:(id)a3
{
  id v4;
  PGSpecBasedHighlightTitleGenerator *v5;
  void *v6;
  void *v7;
  PGSpecBasedHighlightTitleGenerator *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [PGSpecBasedHighlightTitleGenerator alloc];
  -[MAElementCollection set](self->_momentNodes, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicEventLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PGSpecBasedHighlightTitleGenerator initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:](v5, "initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:", v6, v7, 0, self->_titleGenerationContext);
  -[PGTitleGenerator setLineBreakBehavior:](v8, "setLineBreakBehavior:", 2);
  -[PGTitleGenerator title](v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedTitleStringFromLocationFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *loggingConnection;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGDayHighlightTitleGenerator nameFromLocationFeature:](self, "nameFromLocationFeature:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("District"));

    if (v8)
    {
      -[PGDayHighlightTitleGenerator localizedTitleStringFromDistrictNode:districtName:](self, "localizedTitleStringFromDistrictNode:districtName:", v6, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGDayHighlightTitleFormatOneLocation %@"), CFSTR("PGDayHighlightTitleFormatOneLocation %@"), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithFormat:", v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = loggingConnection;
      objc_msgSend(v6, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v17;
      _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Nil beautified locationName for locationNode %@", buf, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

- (id)localizedTitleStringFromHolidayDateFeature:(id)a3
{
  id v4;
  PGTitleGeneratorDateMatching *v5;
  void *v6;
  PGTitleGenerationContext *titleGenerationContext;
  void *v8;
  PGTitleGeneratorDateMatching *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = [PGTitleGeneratorDateMatching alloc];
  -[MAElementCollection set](self->_momentNodes, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  titleGenerationContext = self->_titleGenerationContext;
  objc_msgSend(v4, "holidayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:](v5, "initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:", 4, 0, v6, titleGenerationContext, v8, 1);
  -[PGTitleGeneratorDateMatching setLineBreakBehavior:](v9, "setLineBreakBehavior:", 2);
  -[PGTitleGeneratorDateMatching title](v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedTitleStringFromDistrictNode:(id)a3 districtName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *loggingConnection;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cityNodeFromDistrictNode:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1)
  {
    v43 = v6;
    objc_msgSend(v9, "anyNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    v42 = (void *)v12;
    objc_msgSend(v13, "setString:", v12);
    objc_msgSend(v13, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    v18 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke;
    v47[3] = &unk_1E8428F70;
    v19 = v13;
    v48 = v19;
    v20 = v14;
    v49 = v20;
    objc_msgSend(v19, "enumerateTokensInRange:usingBlock:", 0, v17, v47);
    objc_msgSend(v19, "setString:", v7);
    objc_msgSend(v19, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    v44[0] = v18;
    v44[1] = 3221225472;
    v44[2] = __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke_2;
    v44[3] = &unk_1E8428F70;
    v23 = v19;
    v45 = v23;
    v24 = v15;
    v46 = v24;
    objc_msgSend(v23, "enumerateTokensInRange:usingBlock:", 0, v22, v44);
    v25 = objc_msgSend(v24, "count");
    v26 = objc_msgSend(v20, "count");
    v27 = v25 - v26;
    if (v25 < v26)
    {
LABEL_6:
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatOneDistrict %@ city %@"), CFSTR("PGLocationTitleFormatOneDistrict %@ city %@"), CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v42;
      objc_msgSend(v31, "localizedStringWithFormat:", v33, v7, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v50[0] = v7;
      v50[1] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithNoLineBreakSpaceForTitle:andUsedNames:", v35, v30);
      v36 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = v26;
      v29 = 0;
      while (1)
      {
        objc_msgSend(v24, "subarrayWithRange:", v29, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToArray:", v20))
          break;

        if (++v29 > v27)
          goto LABEL_6;
      }
      loggingConnection = self->_loggingConnection;
      v34 = v42;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v52 = v42;
        v53 = 2112;
        v54 = v7;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "Only city name %@ used for highlight subtitle, not using district name %@", buf, 0x16u);
      }
      v36 = v42;
    }
    v6 = v43;

  }
  else
  {
    v37 = self->_loggingConnection;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v40 = v37;
      objc_msgSend(v6, "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v41;
      v53 = 2112;
      v54 = v7;
      _os_log_error_impl(&dword_1CA237000, v40, OS_LOG_TYPE_ERROR, "cityNode from districtNode count is invalid for districtNode: %@ with name: %@", buf, 0x16u);

    }
    v36 = 0;
  }

  return v36;
}

- (id)dayHighlightMeaningLabels
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Entertainment");
  v3[1] = CFSTR("Theater");
  v3[2] = CFSTR("Dance");
  v3[3] = CFSTR("AmusementPark");
  v3[4] = CFSTR("SportEvent");
  v3[5] = CFSTR("Performance");
  v3[6] = CFSTR("Concert");
  v3[7] = CFSTR("Festival");
  v3[8] = CFSTR("Museum");
  v3[9] = CFSTR("Birthday");
  v3[10] = CFSTR("HolidayEvent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_summarizedFeatures, 0);
}

void __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

void __82__PGDayHighlightTitleGenerator_localizedTitleStringFromDistrictNode_districtName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

@end
