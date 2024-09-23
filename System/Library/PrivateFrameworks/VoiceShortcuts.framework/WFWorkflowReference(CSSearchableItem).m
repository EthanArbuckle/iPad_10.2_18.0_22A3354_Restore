@implementation WFWorkflowReference(CSSearchableItem)

- (uint64_t)spotlightHash
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "combineContentsOfPropertyListObject:", v3);

  objc_msgSend(a1, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v2, "combineContentsOfPropertyListObject:", v6);

  }
  objc_msgSend(a1, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v2, "combineInteger:", objc_msgSend(v8, "glyphCharacter"));

  objc_msgSend(a1, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v2, "combineInteger:", objc_msgSend(v10, "backgroundColorValue"));

  v12 = (id)objc_msgSend(v2, "combineInteger:", 4);
  objc_msgSend(a1, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v2, "combineContentsOfPropertyListObject:", v13);

  objc_msgSend(a1, "modificationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v2, "combineContentsOfPropertyListObject:", v15);

  objc_msgSend(a1, "lastRunDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = (id)objc_msgSend(v2, "combineContentsOfPropertyListObject:", v17);
  v19 = objc_msgSend(v2, "finalize");

  return v19;
}

- (id)searchableItemRepresentationWithIconDrawerContext:()CSSearchableItem
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v4 = (objc_class *)MEMORY[0x1E0CA6B48];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayName:", v8);

  objc_msgSend(v7, "setContentDescription:", &stru_1E7AA8740);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB28]), "initWithWorkflowReference:includeIcon:iconDrawerContext:", a1, 1, v5);

  objc_msgSend(v9, "configureAttributeSet:includingData:", v7, 0);
  objc_msgSend(v7, "setContentDescription:", 0);
  v10 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v7, "setUserOwned:", MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v7, "setUserCurated:", v10);
  objc_msgSend(v7, "setUserCreated:", v10);
  objc_msgSend(a1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUniqueIdentifier:", v11);

  objc_msgSend(v7, "setDomainIdentifier:", *MEMORY[0x1E0DC8018]);
  objc_msgSend(a1, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentCreationDate:", v12);

  objc_msgSend(a1, "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentModificationDate:", v13);

  objc_msgSend(a1, "lastRunDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLastUsedDate:", v14);

  objc_msgSend(a1, "runEventsCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayCount:", v15);

  objc_msgSend(a1, "associatedAppBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v7, "wf_associateWithBundleIdentifier:", v16);
  objc_msgSend(a1, "icon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "glyphCharacter");

  WFSystemImageNameForGlyphCharacter();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    WFSpotlightResultRunnableAccessorySystemImageNameKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forCustomKey:", v18, v19);

  }
  v20 = objc_alloc(MEMORY[0x1E0DC7E30]);
  objc_msgSend(a1, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "color");
  v24 = objc_msgSend(a1, "glyphCharacter");
  objc_msgSend(a1, "associatedAppBundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v20, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:", v21, v22, v23, v24, v25);

  objc_msgSend(v7, "setWorkflowReferenceForDisplayRepresentation:", v26);
  objc_msgSend(v7, "associateWithAppEntityForDescriptor:", v26);

  return v6;
}

@end
