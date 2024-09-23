@implementation PGMeaningfulEventCriteria

- (PGMeaningfulEventCriteria)initWithGraph:(id)a3
{
  id v5;
  PGMeaningfulEventCriteria *v6;
  PGMeaningfulEventCriteria *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMeaningfulEventCriteria;
  v6 = -[PGMeaningfulEventCriteria init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graph, a3);
    v7->_debug = 0;
  }

  return v7;
}

- (PGMeaningfulEventSceneCollectionTrait)scenesTrait
{
  return self->_scenesTrait;
}

- (PGMeaningfulEventCollectionTrait)roisTrait
{
  PGMeaningfulEventCollectionTrait *roisTrait;
  PGMeaningfulEventCollectionTrait *v4;
  PGGraphNodeCollection *v5;
  PGMeaningfulEventCollectionTrait *v6;
  PGMeaningfulEventCollectionTrait *v7;

  roisTrait = self->_roisTrait;
  if (!roisTrait)
  {
    v4 = [PGMeaningfulEventCollectionTrait alloc];
    v5 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", self->_graph);
    v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v4, "initWithNodes:", v5);
    v7 = self->_roisTrait;
    self->_roisTrait = v6;

    roisTrait = self->_roisTrait;
  }
  return roisTrait;
}

- (PGMeaningfulEventCollectionTrait)poisTrait
{
  PGMeaningfulEventCollectionTrait *poisTrait;
  PGMeaningfulEventCollectionTrait *v4;
  PGGraphNodeCollection *v5;
  PGMeaningfulEventCollectionTrait *v6;
  PGMeaningfulEventCollectionTrait *v7;

  poisTrait = self->_poisTrait;
  if (!poisTrait)
  {
    v4 = [PGMeaningfulEventCollectionTrait alloc];
    v5 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", self->_graph);
    v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v4, "initWithNodes:", v5);
    v7 = self->_poisTrait;
    self->_poisTrait = v6;

    poisTrait = self->_poisTrait;
  }
  return poisTrait;
}

- (PGMeaningfulEventLocationCollectionTrait)locationsTrait
{
  PGMeaningfulEventLocationCollectionTrait *locationsTrait;
  PGMeaningfulEventLocationCollectionTrait *v4;
  PGMeaningfulEventLocationCollectionTrait *v5;

  locationsTrait = self->_locationsTrait;
  if (!locationsTrait)
  {
    v4 = -[PGMeaningfulEventCollectionTrait initWithNodes:]([PGMeaningfulEventLocationCollectionTrait alloc], "initWithNodes:", 0);
    v5 = self->_locationsTrait;
    self->_locationsTrait = v4;

    locationsTrait = self->_locationsTrait;
  }
  return locationsTrait;
}

- (PGMeaningfulEventCollectionTrait)datesTrait
{
  PGMeaningfulEventCollectionTrait *datesTrait;
  PGMeaningfulEventCollectionTrait *v4;
  PGGraphNodeCollection *v5;
  PGMeaningfulEventCollectionTrait *v6;
  PGMeaningfulEventCollectionTrait *v7;

  datesTrait = self->_datesTrait;
  if (!datesTrait)
  {
    v4 = [PGMeaningfulEventCollectionTrait alloc];
    v5 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", self->_graph);
    v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v4, "initWithNodes:", v5);
    v7 = self->_datesTrait;
    self->_datesTrait = v6;

    datesTrait = self->_datesTrait;
  }
  return datesTrait;
}

- (PGMeaningfulEventCollectionTrait)peopleTrait
{
  PGMeaningfulEventCollectionTrait *peopleTrait;
  PGMeaningfulEventCollectionTrait *v4;
  PGGraphNodeCollection *v5;
  PGMeaningfulEventCollectionTrait *v6;
  PGMeaningfulEventCollectionTrait *v7;

  peopleTrait = self->_peopleTrait;
  if (!peopleTrait)
  {
    v4 = [PGMeaningfulEventCollectionTrait alloc];
    v5 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", self->_graph);
    v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v4, "initWithNodes:", v5);
    v7 = self->_peopleTrait;
    self->_peopleTrait = v6;

    peopleTrait = self->_peopleTrait;
  }
  return peopleTrait;
}

- (PGMeaningfulEventNumberTrait)numberOfPeopleTrait
{
  PGMeaningfulEventNumberTrait *numberOfPeopleTrait;
  PGMeaningfulEventNumberTrait *v4;
  PGMeaningfulEventNumberTrait *v5;

  numberOfPeopleTrait = self->_numberOfPeopleTrait;
  if (!numberOfPeopleTrait)
  {
    v4 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 0.0);
    v5 = self->_numberOfPeopleTrait;
    self->_numberOfPeopleTrait = v4;

    numberOfPeopleTrait = self->_numberOfPeopleTrait;
  }
  return numberOfPeopleTrait;
}

- (PGMeaningfulEventCollectionTrait)socialGroupsTrait
{
  PGMeaningfulEventCollectionTrait *socialGroupsTrait;
  PGMeaningfulEventCollectionTrait *v4;
  PGGraphNodeCollection *v5;
  PGMeaningfulEventCollectionTrait *v6;
  PGMeaningfulEventCollectionTrait *v7;

  socialGroupsTrait = self->_socialGroupsTrait;
  if (!socialGroupsTrait)
  {
    v4 = [PGMeaningfulEventCollectionTrait alloc];
    v5 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", self->_graph);
    v6 = -[PGMeaningfulEventCollectionTrait initWithNodes:](v4, "initWithNodes:", v5);
    v7 = self->_socialGroupsTrait;
    self->_socialGroupsTrait = v6;

    socialGroupsTrait = self->_socialGroupsTrait;
  }
  return socialGroupsTrait;
}

- (PGMeaningfulEventPartOfDayTrait)significantPartsOfDayTrait
{
  PGMeaningfulEventPartOfDayTrait *significantPartsOfDayTrait;
  PGMeaningfulEventPartOfDayTrait *v4;
  PGMeaningfulEventPartOfDayTrait *v5;

  significantPartsOfDayTrait = self->_significantPartsOfDayTrait;
  if (!significantPartsOfDayTrait)
  {
    v4 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 1);
    v5 = self->_significantPartsOfDayTrait;
    self->_significantPartsOfDayTrait = v4;

    significantPartsOfDayTrait = self->_significantPartsOfDayTrait;
  }
  return significantPartsOfDayTrait;
}

- (PGMeaningfulEventPartOfDayTrait)allPartsOfDayTrait
{
  PGMeaningfulEventPartOfDayTrait *allPartsOfDayTrait;
  PGMeaningfulEventPartOfDayTrait *v4;
  PGMeaningfulEventPartOfDayTrait *v5;

  allPartsOfDayTrait = self->_allPartsOfDayTrait;
  if (!allPartsOfDayTrait)
  {
    v4 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", 1);
    v5 = self->_allPartsOfDayTrait;
    self->_allPartsOfDayTrait = v4;

    allPartsOfDayTrait = self->_allPartsOfDayTrait;
  }
  return allPartsOfDayTrait;
}

- (PGMeaningfulEventLocationMobilityTrait)locationMobilityTrait
{
  PGMeaningfulEventLocationMobilityTrait *locationMobilityTrait;
  PGMeaningfulEventLocationMobilityTrait *v4;
  PGMeaningfulEventLocationMobilityTrait *v5;

  locationMobilityTrait = self->_locationMobilityTrait;
  if (!locationMobilityTrait)
  {
    v4 = -[PGMeaningfulEventLocationMobilityTrait initWithMobility:]([PGMeaningfulEventLocationMobilityTrait alloc], "initWithMobility:", 0);
    v5 = self->_locationMobilityTrait;
    self->_locationMobilityTrait = v4;

    locationMobilityTrait = self->_locationMobilityTrait;
  }
  return locationMobilityTrait;
}

- (PGMeaningfulEventNumberTrait)minimumDurationTrait
{
  PGMeaningfulEventNumberTrait *minimumDurationTrait;
  PGMeaningfulEventNumberTrait *v4;
  PGMeaningfulEventNumberTrait *v5;

  minimumDurationTrait = self->_minimumDurationTrait;
  if (!minimumDurationTrait)
  {
    v4 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 0.0);
    v5 = self->_minimumDurationTrait;
    self->_minimumDurationTrait = v4;

    minimumDurationTrait = self->_minimumDurationTrait;
  }
  return minimumDurationTrait;
}

- (PGMeaningfulEventNumberTrait)maximumDurationTrait
{
  PGMeaningfulEventNumberTrait *maximumDurationTrait;
  PGMeaningfulEventNumberTrait *v4;
  PGMeaningfulEventNumberTrait *v5;

  maximumDurationTrait = self->_maximumDurationTrait;
  if (!maximumDurationTrait)
  {
    v4 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", 0.0);
    v5 = self->_maximumDurationTrait;
    self->_maximumDurationTrait = v4;

    maximumDurationTrait = self->_maximumDurationTrait;
  }
  return maximumDurationTrait;
}

- (id)_debugDescriptionWithMomentNode:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
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
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(void *, const __CFString *, void *);
  id v24;
  id v25;
  void (**v26)(void *, const __CFString *, void *);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isSmartInteresting"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (objc_msgSend(v4, "isInteresting"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tsmartInteresting: %@, interesting: %@"), v6, v7);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tassetCount: %lu,"), objc_msgSend(v4, "numberOfAssets"));
  -[PGMeaningfulEventCriteria significantPartsOfDayTrait](self, "significantPartsOfDayTrait");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescriptionWithMomentNode:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tsignificantPartsOfDay: %@,"), v9);

  -[PGMeaningfulEventCriteria allPartsOfDayTrait](self, "allPartsOfDayTrait");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugDescriptionWithMomentNode:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tallPartsOfDay: %@,"), v11);

  -[PGMeaningfulEventCriteria minimumDurationTrait](self, "minimumDurationTrait");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "debugDescriptionWithMomentNode:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tminDuration: %@,"), v13);

  -[PGMeaningfulEventCriteria maximumDurationTrait](self, "maximumDurationTrait");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "debugDescriptionWithMomentNode:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tmaxDuration: %@,"), v15);

  -[PGMeaningfulEventCriteria numberOfPeopleTrait](self, "numberOfPeopleTrait");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "debugDescriptionWithMomentNode:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tnumberOfPeople: %@,"), v17);

  -[PGMeaningfulEventCriteria locationMobilityTrait](self, "locationMobilityTrait");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "debugDescriptionWithMomentNode:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tlocationMobility: %@,"), v19);

  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke;
  aBlock[3] = &unk_1E842B870;
  v21 = v5;
  v41 = v21;
  v22 = v4;
  v42 = v22;
  v23 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  v37[0] = v20;
  v37[1] = 3221225472;
  v37[2] = __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke_2;
  v37[3] = &unk_1E842B870;
  v24 = v21;
  v38 = v24;
  v39 = v22;
  v25 = v22;
  v26 = (void (**)(void *, const __CFString *, void *))_Block_copy(v37);
  -[PGMeaningfulEventCriteria datesTrait](self, "datesTrait");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("dates"), v27);

  -[PGMeaningfulEventCriteria peopleTrait](self, "peopleTrait");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("people"), v28);

  -[PGMeaningfulEventCriteria socialGroupsTrait](self, "socialGroupsTrait");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("socialGroups"), v29);

  -[PGMeaningfulEventCriteria locationsTrait](self, "locationsTrait");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("locations"), v30);

  -[PGMeaningfulEventCriteria poisTrait](self, "poisTrait");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("pois"), v31);

  -[PGMeaningfulEventCriteria roisTrait](self, "roisTrait");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("rois"), v32);

  -[PGMeaningfulEventCriteria scenesTrait](self, "scenesTrait");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2](v26, CFSTR("scenes"), v33);

  -[PGMeaningfulEventCriteria publicEventCategoriesTrait](self, "publicEventCategoriesTrait");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, CFSTR("publicEvents"), v34);

  v35 = v24;
  return v35;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void)setScenesTrait:(id)a3
{
  objc_storeStrong((id *)&self->_scenesTrait, a3);
}

- (void)setRoisTrait:(id)a3
{
  objc_storeStrong((id *)&self->_roisTrait, a3);
}

- (void)setPoisTrait:(id)a3
{
  objc_storeStrong((id *)&self->_poisTrait, a3);
}

- (void)setLocationsTrait:(id)a3
{
  objc_storeStrong((id *)&self->_locationsTrait, a3);
}

- (void)setDatesTrait:(id)a3
{
  objc_storeStrong((id *)&self->_datesTrait, a3);
}

- (void)setPeopleTrait:(id)a3
{
  objc_storeStrong((id *)&self->_peopleTrait, a3);
}

- (void)setNumberOfPeopleTrait:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfPeopleTrait, a3);
}

- (void)setSocialGroupsTrait:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroupsTrait, a3);
}

- (void)setMinimumDurationTrait:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDurationTrait, a3);
}

- (void)setMaximumDurationTrait:(id)a3
{
  objc_storeStrong((id *)&self->_maximumDurationTrait, a3);
}

- (void)setSignificantPartsOfDayTrait:(id)a3
{
  objc_storeStrong((id *)&self->_significantPartsOfDayTrait, a3);
}

- (void)setAllPartsOfDayTrait:(id)a3
{
  objc_storeStrong((id *)&self->_allPartsOfDayTrait, a3);
}

- (void)setLocationMobilityTrait:(id)a3
{
  objc_storeStrong((id *)&self->_locationMobilityTrait, a3);
}

- (PGMeaningfulEventCollectionTrait)publicEventCategoriesTrait
{
  return self->_publicEventCategoriesTrait;
}

- (void)setPublicEventCategoriesTrait:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventCategoriesTrait, a3);
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoriesTrait, 0);
  objc_storeStrong((id *)&self->_locationMobilityTrait, 0);
  objc_storeStrong((id *)&self->_allPartsOfDayTrait, 0);
  objc_storeStrong((id *)&self->_significantPartsOfDayTrait, 0);
  objc_storeStrong((id *)&self->_maximumDurationTrait, 0);
  objc_storeStrong((id *)&self->_minimumDurationTrait, 0);
  objc_storeStrong((id *)&self->_socialGroupsTrait, 0);
  objc_storeStrong((id *)&self->_numberOfPeopleTrait, 0);
  objc_storeStrong((id *)&self->_peopleTrait, 0);
  objc_storeStrong((id *)&self->_datesTrait, 0);
  objc_storeStrong((id *)&self->_locationsTrait, 0);
  objc_storeStrong((id *)&self->_poisTrait, 0);
  objc_storeStrong((id *)&self->_roisTrait, 0);
  objc_storeStrong((id *)&self->_scenesTrait, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "debugDescriptionWithMomentNode:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("\n\t%@: %@"), v10, v9);

  }
}

void __61__PGMeaningfulEventCriteria__debugDescriptionWithMomentNode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "debugDescriptionWithMomentNode:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("\n\t%@: %@"), v10, v9);

  }
}

@end
