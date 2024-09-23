@implementation PGPeopleMemoryTitleGenerator

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 type:(unint64_t)a5 titleGenerationContext:(id)a6
{
  return -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:](self, "initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:", a3, a4, 0, a5, a6);
}

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 timeTitleOptions:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v13;
  id v14;
  PGPeopleMemoryTitleGenerator *v15;
  PGPeopleMemoryTitleGenerator *v16;
  void *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPeopleMemoryTitleGenerator;
  v15 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v19, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, 0, 0, 0, 0, a7);
  v16 = v15;
  if (v15)
  {
    v15->_type = a6;
    objc_storeStrong((id *)&v15->_personNodes, a4);
    objc_storeStrong((id *)&v16->_timeTitleOptions, a5);
    -[PGTitleGenerator locale](v16, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setLocale:](v16->_timeTitleOptions, "setLocale:", v17);

  }
  return v16;
}

- (PGPeopleMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 seasonName:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v13;
  PGPeopleMemoryTitleGenerator *v14;
  PGPeopleMemoryTitleGenerator *v15;

  v13 = a5;
  v14 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:type:titleGenerationContext:](self, "initWithMomentNodes:personNodes:type:titleGenerationContext:", a3, a4, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_seasonName, a5);

  return v15;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(id, void *, void *);

  v11 = (void (**)(id, void *, void *))a3;
  if (self->_timeTitleOptions)
  {
    +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v4, 5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  switch(self->_type)
  {
    case 0uLL:
    case 1uLL:
      -[PGPeopleMemoryTitleGenerator _titleForPeople](self, "_titleForPeople");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2uLL:
      -[PGPeopleMemoryTitleGenerator _titleForSocialGroup](self, "_titleForSocialGroup");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3uLL:
      -[PGPeopleMemoryTitleGenerator _titleForEarlyMoments](self, "_titleForEarlyMoments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_18;
      -[PGPeopleMemoryTitleGenerator _timeTitleForEarlyMoments](self, "_timeTitleForEarlyMoments");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4uLL:
      -[PGPeopleMemoryTitleGenerator _titleForPeople](self, "_titleForPeople");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGSeasonMemoryTitleGenerator seasonSubtitleWithMomentNodes:seasonName:](PGSeasonMemoryTitleGenerator, "seasonSubtitleWithMomentNodes:seasonName:", v9, self->_seasonName);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
      goto LABEL_18;
    case 5uLL:
      -[PGPeopleMemoryTitleGenerator _titleForChildAndPerson](self, "_titleForChildAndPerson");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v7 = (void *)v6;
      if (v5)
        goto LABEL_18;
      -[PGPeopleMemoryTitleGenerator _timeTitleForPeople](self, "_timeTitleForPeople");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v5 = (void *)v8;
LABEL_18:
      if (v11)
        v11[2](v11, v7, v5);

      return;
    default:
      v7 = 0;
      goto LABEL_18;
  }
}

- (id)_titleForPeople
{
  NSSet *personNodes;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  personNodes = self->_personNodes;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:", personNodes, 0, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v5, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_titleForSocialGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  NSSet *personNodes;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[NSSet anyObject](self->_personNodes, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[NSSet containsObject:](self->_personNodes, "containsObject:", v6))
    {
      v7 = 1;
    }
    else
    {
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PGPeopleMemoryTitleGenerator _person:isPresentInAnyMomentOfMomentNodes:](self, "_person:isPresentInAnyMomentOfMomentNodes:", v6, v8);

    }
  }
  else
  {
    v7 = 0;
  }
  personNodes = self->_personNodes;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:", personNodes, v7, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v12, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_titleForChildAndPerson
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  NSSet *personNodes;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[NSSet anyObject](self->_personNodes, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[NSSet containsObject:](self->_personNodes, "containsObject:", v6);
  else
    v7 = 0;
  personNodes = self->_personNodes;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", personNodes, v7, 1, 1, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v11, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_titleForEarlyMoments
{
  PGSpecBasedTitleGenerator *v3;
  void *v4;
  NSSet *personNodes;
  void *v6;
  PGSpecBasedTitleGenerator *v7;
  void *v8;

  v3 = [PGSpecBasedTitleGenerator alloc];
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  personNodes = self->_personNodes;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGSpecBasedTitleGenerator initWithMomentNodes:personNodes:memoryCategory:subcategory:titleGenerationContext:](v3, "initWithMomentNodes:personNodes:memoryCategory:subcategory:titleGenerationContext:", v4, personNodes, 219, 0, v6);

  -[PGSpecBasedTitleGenerator title](v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_timeTitleForEarlyMoments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMomentNodes:", v4);

  objc_msgSend(v3, "setAllowedFormats:", 4);
  objc_msgSend(v3, "setFilterDates:", 0);
  -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFeaturedYearNodes:", v5);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_person:(id)a3 isPresentInAnyMomentOfMomentNodes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasEdgeFromNode:", v5, (_QWORD)v13) & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)_birthdayTitleForPeople
{
  NSSet *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v16;
  uint8_t buf[4];
  NSUInteger v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = self->_personNodes;
  if (-[NSSet count](self->_personNodes, "count") != 1)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v16 = -[NSSet count](self->_personNodes, "count");
      *(_DWORD *)buf = 134217984;
      v18 = v16;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Trying to create birthday title with %lu people. Choosing any person.", buf, 0xCu);
    }

    -[NSSet anyObject](self->_personNodes, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (NSSet *)v7;
    }

  }
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:insertLineBreaks:serviceManager:", v3, 0, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "length"))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_timeTitleForPeople
{
  void *v2;
  void *v3;
  void *v4;

  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTimeTitleUtility peopleTimeTitleWithEventNodes:](PGTimeTitleUtility, "peopleTimeTitleWithEventNodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSSet)personNodes
{
  return self->_personNodes;
}

- (PGTimeTitleOptions)timeTitleOptions
{
  return self->_timeTitleOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTitleOptions, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
}

+ (id)peopleOverTimeTimeTitleOptionsWithMomentNodes:(id)a3
{
  id v3;
  PGTimeTitleOptions *v4;

  v3 = a3;
  v4 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setMomentNodes:](v4, "setMomentNodes:", v3);

  -[PGTimeTitleOptions setAllowedFormats:](v4, "setAllowedFormats:", 20);
  -[PGTimeTitleOptions setUsePeopleSubtitleFormatWithYears:](v4, "setUsePeopleSubtitleFormatWithYears:", 1);
  -[PGTimeTitleOptions setFilterDates:](v4, "setFilterDates:", 0);
  return v4;
}

@end
