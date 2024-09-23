@implementation PGMemoryTriggerFeatureCentricHoliday

+ (id)_relationshipForHolidayName:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mother’s Day")) & 1) != 0)
  {
    v4 = kPGGraphEdgePeopleMother;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Father’s Day")) & 1) != 0)
  {
    v4 = kPGGraphEdgePeopleFather;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Valentine’s Day")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = kPGGraphEdgePeoplePartner;
  }
  v5 = *v4;
LABEL_8:

  return v5;
}

- (unint64_t)triggerType
{
  return 3;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  PGGraphMemoryNodeCollection *v21;
  void *v22;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PGMemoryTriggerFeatureCentricHoliday *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v30 = 36;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerFeatureCentricHoliday.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v9, "infoNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    -[PGHolidayMemoryTrigger holidayService](self, "holidayService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "countryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = 3221225472;
    v25[2] = __93__PGMemoryTriggerFeatureCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v25[3] = &unk_1E842C318;
    v24 = v9;
    v25[0] = MEMORY[0x1E0C809B0];
    v19 = v9;
    v26 = v19;
    v20 = v14;
    v27 = v20;
    v28 = self;
    objc_msgSend(v15, "enumerateEventRulesBetweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", v16, v17, v18, v25);

    v21 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", v19, v20);
    objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v30 = 67;
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerFeatureCentricHoliday.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v21, v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v24;

  }
  return v11;
}

- (id)personNodesForRelationship:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  PGGraphPersonNodeCollection *v7;
  void *v8;
  uint64_t v9;
  PGGraphPersonNodeCollection *v10;

  v5 = a3;
  v6 = a4;
  v7 = -[MAElementCollection initWithGraph:]([PGGraphPersonNodeCollection alloc], "initWithGraph:", v6);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MOTHER")))
  {
    objc_msgSend(v6, "meNodeCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "motherPersonNodes");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (PGGraphPersonNodeCollection *)v9;

    v7 = v10;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("FATHER")))
  {
    objc_msgSend(v6, "meNodeCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fatherPersonNodes");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PARTNER")))
  {
    objc_msgSend(v6, "meNodeCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "partnerPersonNodes");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

void __93__PGMemoryTriggerFeatureCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("National Dog Day"));

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 2;
LABEL_5:
    +[PGGraphPetNodeCollection petNodesForSpecies:inGraph:](PGGraphPetNodeCollection, "petNodesForSpecies:inGraph:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = v9;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v9, "featureNodeCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "memoryNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "elementIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unionWithIdentifierSet:", v14);
    goto LABEL_7;
  }
  objc_msgSend(v21, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("National Cat Day"));

  if (v8)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v21, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Earth Day"));

  if (v16)
  {
    +[PGGraphROINodeCollection roiNodesOfType:inGraph:](PGGraphROINodeCollection, "roiNodesOfType:inGraph:", 4, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v17 = (void *)objc_opt_class();
  objc_msgSend(v21, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_relationshipForHolidayName:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 48), "personNodesForRelationship:inGraph:", v10, *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(void **)(a1 + 40);
  objc_msgSend(v12, "featureNodeCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "memoryNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "elementIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionWithIdentifierSet:", v20);

LABEL_7:
LABEL_8:

}

@end
