@implementation PGTitleSpecPeopleArgument

- (id)_initWithPeopleType:(unint64_t)a3 personNodes:(id)a4
{
  id v7;
  PGTitleSpecPeopleArgument *v8;
  PGTitleSpecPeopleArgument *v9;

  v7 = a4;
  v8 = -[PGTitleSpecPeopleArgument initWithPeopleType:](self, "initWithPeopleType:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_personNodes, a4);

  return v9;
}

- (PGTitleSpecPeopleArgument)initWithPeopleType:(unint64_t)a3
{
  PGTitleSpecPeopleArgument *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGTitleSpecPeopleArgument;
  result = -[PGTitleSpecPeopleArgument init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PGTitleSpecPeopleArgument *v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  switch(self->_type)
  {
    case 0uLL:
      objc_msgSend(v7, "serviceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpecPeopleArgument _personTitleWithMomentNodes:serviceManager:](self, "_personTitleWithMomentNodes:serviceManager:", v6, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      v12 = self;
      v13 = v6;
      v14 = 1;
      goto LABEL_7;
    case 2uLL:
      v12 = self;
      v13 = v6;
      v14 = 8;
      goto LABEL_7;
    case 3uLL:
      v12 = self;
      v13 = v6;
      v14 = 2;
LABEL_7:
      -[PGTitleSpecPeopleArgument _groupTitleWithMomentNodes:allowedGroupsFormat:](v12, "_groupTitleWithMomentNodes:allowedGroupsFormat:", v13, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      objc_msgSend(v7, "serviceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleSpecPeopleArgument _birthdayTitleWithMomentNodes:serviceManager:](self, "_birthdayTitleWithMomentNodes:serviceManager:", v6, v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = (void *)v10;

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PGTitleSpecPeopleArgument *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v38 = a5;
  v36 = v8;
  objc_msgSend(v8, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v13)
  {
    v15 = v13;
    v16 = 0;
    v17 = *(_QWORD *)v40;
    v18 = &OBJC_IVAR___PGCuratorInvestigationItem__clsConsolidatedPersonLocalIdentifiers;
    *(_QWORD *)&v14 = 138412290;
    v35 = v14;
    v37 = v12;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "type", v35);
        if (v21 == 3)
        {
          if (*(Class *)((char *)&self->super.super.isa + v18[461]) != (Class)4)
            goto LABEL_25;
          if (-[NSSet count](self->_personNodes, "count") == 1)
            -[NSSet anyObject](self->_personNodes, "anyObject");
          else
            objc_msgSend(v20, "nodeInGraph:", v11);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v11;
          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "serviceManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", v29, 0, 0, 0, 0, v30);
            v31 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v31;
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "loggingConnection");
            v29 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v20, "description");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v35;
              v44 = v33;
              _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", buf, 0xCu);

            }
          }

          v11 = v28;
          v12 = v37;
          v18 = &OBJC_IVAR___PGCuratorInvestigationItem__clsConsolidatedPersonLocalIdentifiers;
        }
        else
        {
          if (v21 != 2)
            goto LABEL_25;
          v22 = *(uint64_t *)((char *)&self->super.super.isa + v18[461]);
          switch(v22)
          {
            case 3:
              v23 = self;
              v24 = v20;
              v25 = v11;
              v26 = 2;
              break;
            case 2:
              v23 = self;
              v24 = v20;
              v25 = v11;
              v26 = 8;
              break;
            case 1:
              v23 = self;
              v24 = v20;
              v25 = v11;
              v26 = 1;
              break;
            default:
              goto LABEL_25;
          }
          -[PGTitleSpecPeopleArgument _groupTitleWithFeature:graph:allowedGroupsFormat:](v23, "_groupTitleWithFeature:graph:allowedGroupsFormat:", v24, v25, v26);
          v27 = v16;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

LABEL_25:
        if (objc_msgSend(v16, "length"))
          goto LABEL_30;
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (!v15)
        goto LABEL_30;
    }
  }
  v16 = 0;
LABEL_30:

  return v16;
}

- (id)_birthdayTitleWithMomentNodes:(id)a3 serviceManager:(id)a4
{
  id v6;
  id v7;
  NSSet *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  void *v11;
  PGGraphMomentNodeCollection *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = self->_personNodes;
    if (!-[NSSet count](v8, "count"))
    {
      v9 = [PGGraphMomentNodeCollection alloc];
      objc_msgSend(v6, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "graph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MAElementCollection initWithSet:graph:](v9, "initWithSet:graph:", v6, v11);

      -[PGGraphMomentNodeCollection birthdayPersonNodes](v12, "birthdayPersonNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "temporarySet");
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (NSSet *)v14;
    }
    +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", v8, 0, 0, 0, 0, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_groupTitleWithMomentNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = a4 & 1;
  -[PGTitleSpecPeopleArgument _personNodesWithMomentNodes:](self, "_personNodesWithMomentNodes:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:fallbackToGeneric:](PGPeopleTitleUtility, "peopleGroupNameForPersonNodes:allowedGroupsFormat:fallbackToGeneric:", v6, a4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_groupTitleWithFeature:(id)a3 graph:(id)a4 allowedGroupsFormat:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "nodeInGraph:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "personNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:fallbackToGeneric:](PGPeopleTitleUtility, "peopleGroupNameForPersonNodes:allowedGroupsFormat:fallbackToGeneric:", v10, a5, a5 & 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", (uint8_t *)&v16, 0xCu);

    }
    v11 = 0;
  }

  return v11;
}

- (id)_personTitleWithMomentNodes:(id)a3 serviceManager:(id)a4
{
  id v6;
  id v7;
  NSSet *v8;
  NSSet *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (-[NSSet count](self->_personNodes, "count"))
  {
    v8 = self->_personNodes;
  }
  else
  {
    -[PGTitleSpecPeopleArgument _personNodesWithMomentNodes:](self, "_personNodesWithMomentNodes:", v6);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (-[NSSet count](v8, "count") > 2)
  {
    v10 = 0;
  }
  else
  {
    +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", v9, 0, 0, 0, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_personTitleWithFeature:(id)a3 graph:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NSSet count](self->_personNodes, "count") == 1)
    -[NSSet anyObject](self->_personNodes, "anyObject");
  else
    objc_msgSend(v8, "nodeInGraph:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleTitleUtility nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:](PGPeopleTitleUtility, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", v12, 0, 0, 0, 0, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "[PGTitleSpecPeopleArgument] Could not fetch node in graph for feature %@", (uint8_t *)&v18, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (id)_personNodesWithMomentNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "personNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v6)
        {
          objc_msgSend(v6, "intersectSet:", v9);
        }
        else if (objc_msgSend(v9, "count"))
        {
          v6 = (void *)objc_msgSend(v10, "mutableCopy");
        }
        else
        {
          v6 = 0;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSSet)personNodes
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNodes, 0);
}

+ (id)argumentWithPeopleType:(unint64_t)a3
{
  return -[PGTitleSpecPeopleArgument initWithPeopleType:]([PGTitleSpecPeopleArgument alloc], "initWithPeopleType:", a3);
}

+ (id)argumentWithPeopleType:(unint64_t)a3 personNodes:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = -[PGTitleSpecPeopleArgument _initWithPeopleType:personNodes:]([PGTitleSpecPeopleArgument alloc], "_initWithPeopleType:personNodes:", a3, v5);

  return v6;
}

@end
