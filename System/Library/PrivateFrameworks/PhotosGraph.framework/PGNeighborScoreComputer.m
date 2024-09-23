@implementation PGNeighborScoreComputer

- (PGNeighborScoreComputer)init
{
  PGNeighborScoreComputer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *momentNodeCachedValuesByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGNeighborScoreComputer;
  v2 = -[PGNeighborScoreComputer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    momentNodeCachedValuesByIdentifier = v2->_momentNodeCachedValuesByIdentifier;
    v2->_momentNodeCachedValuesByIdentifier = v3;

    v2->_numberOfMomentNodesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)_momentNodeCachedValuesForIdentifier:(unint64_t)a3
{
  NSMutableDictionary *momentNodeCachedValuesByIdentifier;
  void *v6;
  PGMomentNodeCachedValues *v7;
  NSMutableDictionary *v8;
  void *v9;

  momentNodeCachedValuesByIdentifier = self->_momentNodeCachedValuesByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](momentNodeCachedValuesByIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (PGMomentNodeCachedValues *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(PGMomentNodeCachedValues);
    v8 = self->_momentNodeCachedValuesByIdentifier;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (double)neighborScoreWithMomentNode:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "neighborScore");
  v7 = v6;

  return v7;
}

- (double)neighborScoreWithHighlightNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v4, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PGNeighborScoreComputer_neighborScoreWithHighlightNode___block_invoke;
  v9[3] = &unk_1E8433E30;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (double)maximumNeighborScoreWithMomentNodes:(id)a3
{
  id v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PGNeighborScoreComputer_maximumNeighborScoreWithMomentNodes___block_invoke;
  v7[3] = &unk_1E8433E30;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (double)_densityScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andNumberOfAssets:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double (**v11)(void *, unint64_t);
  double v12;
  double (**v13)(void *, unint64_t);
  double v14;
  double v15;
  _QWORD v17[4];
  double (**v18)(void *, unint64_t);
  _QWORD aBlock[5];
  _QWORD v20[5];
  _QWORD v21[4];

  v8 = a3;
  v9 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v21[3] = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke;
  v20[3] = &unk_1E842FA68;
  v20[4] = v21;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_2;
  aBlock[3] = &unk_1E842CEC0;
  aBlock[4] = v21;
  v11 = (double (**)(void *, unint64_t))_Block_copy(aBlock);
  v12 = v11[2](v11, a5);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_3;
  v17[3] = &unk_1E842CEE8;
  v13 = v11;
  v18 = v13;
  -[PGNeighborScoreComputer _calculateScoreWithNeighborMomentNodes:referenceDate:referenceDistance:andDistanceBlock:](self, "_calculateScoreWithNeighborMomentNodes:referenceDate:referenceDistance:andDistanceBlock:", v8, v9, v17, v12);
  v15 = v14;

  _Block_object_dispose(v21, 8);
  return v15;
}

- (double)_peopleScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andPersonLocalIdentifiers:(id)a5
{
  id v7;
  id v8;
  double v9;
  id v10;
  double v11;
  double v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v8 = a3;
  v9 = (double)(unint64_t)objc_msgSend(v7, "count");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__PGNeighborScoreComputer__peopleScoreWithNeighborMomentNodes_referenceDate_andPersonLocalIdentifiers___block_invoke;
  v14[3] = &unk_1E842CF10;
  v14[4] = self;
  v15 = v7;
  v10 = v7;
  -[PGNeighborScoreComputer _calculateScoreWithNeighborMomentNodes:referenceDate:referenceDistance:andDistanceBlock:](self, "_calculateScoreWithNeighborMomentNodes:referenceDate:referenceDistance:andDistanceBlock:", v8, 0, v14, v9);
  v12 = v11;

  return v12;
}

- (double)_locationScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andLocationCoordinate:(const CLLocationCoordinate2D *)a5
{
  double result;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__PGNeighborScoreComputer__locationScoreWithNeighborMomentNodes_referenceDate_andLocationCoordinate___block_invoke;
  v6[3] = &unk_1E842CF38;
  v6[4] = self;
  v6[5] = a5;
  -[PGNeighborScoreComputer _calculateScoreWithNeighborMomentNodes:referenceDate:andDistanceBlock:](self, "_calculateScoreWithNeighborMomentNodes:referenceDate:andDistanceBlock:", a3, a4, v6);
  return result;
}

- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 andDistanceBlock:(id)a5
{
  id v7;
  id v8;
  double (**v9)(id, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v26;
  double v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (double (**)(id, void *))a5;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v13 = 0.0;
    v14 = 1.79769313e308;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v7);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v18 = v9[2](v9, v17);
        v19 = v18;
        if (v8)
        {
          objc_msgSend(v17, "localStartDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "timeIntervalSinceDate:", v20);
          v22 = floor(fabs(v21) / 86400.0);

          v18 = v19 / fmax((double)(unint64_t)v22 * 0.5, 1.0);
        }
        if (v13 < v19)
          v13 = v19;
        if (v14 >= v19)
          v14 = v19;
        v15 = v15 + v18;
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
    v14 = 1.79769313e308;
    v15 = 0.0;
  }
  v23 = v15 / (double)(unint64_t)objc_msgSend(v7, "count");
  if (v23 == 0.0 || v13 <= v14)
  {
    if (v13 >= 1.0 && v14 == v13)
      v26 = 1.0;
    else
      v26 = 0.0;
  }
  else
  {
    v27 = (v23 - v14) / (v13 - v14);
    if (v27 > 1.0)
      v27 = 1.0;
    v26 = fmax(v27, 0.0);
  }

  return v26;
}

- (double)_calculateScoreWithNeighborMomentNodes:(id)a3 referenceDate:(id)a4 referenceDistance:(double)a5 andDistanceBlock:(id)a6
{
  id v9;
  id v10;
  double (**v11)(id, void *);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v31[6];
  uint64_t v32;
  double *v33;
  uint64_t v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  double *v41;
  uint64_t v42;
  double v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (double (**)(id, void *))a6;
  v12 = (void *)objc_opt_new();
  v40 = 0;
  v41 = (double *)&v40;
  v42 = 0x2020000000;
  v43 = a5;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v18 = v11[2](v11, v17);
        if (v10)
        {
          objc_msgSend(v17, "localStartDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSinceDate:", v19);
          v21 = v20;

          v18 = v18 / fmax((double)vcvtmd_u64_f64(fabs(v21) / 86400.0) * 0.5, 1.0);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v22);

        v41[3] = v18 + v41[3];
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v14);
  }

  v23 = objc_msgSend(v13, "count");
  v24 = v41[3] / (double)(unint64_t)(v23 + 1);
  v41[3] = v24;
  v32 = 0;
  v33 = (double *)&v32;
  v34 = 0x2020000000;
  v35 = (a5 - v24) * (a5 - v24);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __115__PGNeighborScoreComputer__calculateScoreWithNeighborMomentNodes_referenceDate_referenceDistance_andDistanceBlock___block_invoke;
  v31[3] = &unk_1E842CF60;
  v31[4] = &v32;
  v31[5] = &v40;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v31);
  v25 = sqrt(v33[3] / (double)(unint64_t)(objc_msgSend(v13, "count") + 1));
  v33[3] = v25;
  v26 = 0.0;
  if (v25 > 0.0)
  {
    v27 = v41[3];
    v28 = v27 - v25;
    v29 = v25 + v27;
    if (v25 + v27 >= a5)
      v29 = a5;
    if (v28 < v29)
      v28 = v29;
    v26 = (v25 + v28 - v27) / (v25 + v25);
  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v40, 8);

  return v26;
}

- (id)_personLocalIdentifiersForMomentNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personLocalIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPersonLocalIdentifiers:", v6);
  }

  return v6;
}

- (CLLocationCoordinate2D)_bestLocationCoordinateForMomentNode:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CLLocationCoordinate2D result;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestLocationCoordinate");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.longitude = v11;
  result.latitude = v10;
  return result;
}

- (id)_previousMomentNodeForMomentNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousMomentNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v4, "previousMomentNode");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setPreviousMomentNode:", v8);
    v6 = (void *)v8;
  }

  return v6;
}

- (id)_nextMomentNodeForMomentNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextMomentNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v4, "nextMomentNode");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setNextMomentNode:", v8);
    v6 = (void *)v8;
  }

  return v6;
}

- (BOOL)_hasAddressNodesForMomentNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PGNeighborScoreComputer _momentNodeCachedValuesForIdentifier:](self, "_momentNodeCachedValuesForIdentifier:", objc_msgSend(v4, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasAddressNodesIsSet"))
  {
    LOBYTE(v6) = objc_msgSend(v5, "hasAddressNodes");
  }
  else
  {
    v6 = objc_msgSend(v4, "hasAddressNodes");
    objc_msgSend(v5, "setHasAddressNodes:", v6);
    objc_msgSend(v5, "setHasAddressNodesIsSet:", 1);
  }

  return v6;
}

- (id)neighborsFromMomentNode:(id)a3 count:(unint64_t)a4 locationRequired:(BOOL)a5 minDayDuration:(unint64_t)a6 maxDayDuration:(unint64_t)a7
{
  id v12;
  id v13;
  unint64_t numberOfMomentNodes;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(void *, uint64_t);
  id v20;
  _QWORD v22[4];
  id v23;
  PGNeighborScoreComputer *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;

  v12 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  os_unfair_lock_lock(&self->_numberOfMomentNodesLock);
  numberOfMomentNodes = self->_numberOfMomentNodes;
  if (!numberOfMomentNodes)
  {
    objc_msgSend(v12, "graph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfMomentNodes = objc_msgSend(v16, "count");

    numberOfMomentNodes = self->_numberOfMomentNodes;
  }
  os_unfair_lock_unlock(&self->_numberOfMomentNodesLock);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__PGNeighborScoreComputer_neighborsFromMomentNode_count_locationRequired_minDayDuration_maxDayDuration___block_invoke;
  v22[3] = &unk_1E842CF88;
  v26 = a6;
  v27 = a4;
  v28 = a7;
  v29 = numberOfMomentNodes;
  v23 = v12;
  v24 = self;
  v30 = a5;
  v17 = v13;
  v25 = v17;
  v18 = v12;
  v19 = (void (**)(void *, uint64_t))_Block_copy(v22);
  v19[2](v19, 1);
  v19[2](v19, 0);
  v20 = v17;

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodeCachedValuesByIdentifier, 0);
}

void __104__PGNeighborScoreComputer_neighborsFromMomentNode_count_locationRequired_minDayDuration_maxDayDuration___block_invoke(uint64_t a1, char a2)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  v4 = *(id *)(a1 + 32);
  v5 = 0;
  v6 = 0;
  v7 = 0;
LABEL_2:
  v8 = v4;
  while (v5 < *(_QWORD *)(a1 + 56) || v7 < *(_QWORD *)(a1 + 64))
  {
    if (v5 >= *(_QWORD *)(a1 + 72) || v8 == 0)
      break;
    if ((unint64_t)++v6 > *(_QWORD *)(a1 + 80))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Too many iterations thru Moments's NEXT chain, triggering graph rebuild and bailing out", buf, 2u);
      }

      __assert_rtn("-[PGNeighborScoreComputer neighborsFromMomentNode:count:locationRequired:minDayDuration:maxDayDuration:]_block_invoke", "PGNeighborScoreComputer.m", 393, "NO");
    }
    v10 = *(void **)(a1 + 40);
    v16 = v8;
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "_previousMomentNodeForMomentNode:", v8);
    else
      objc_msgSend(v10, "_nextMomentNodeForMomentNode:", v8);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "localStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v12);
      v5 = vcvtmd_u64_f64(fabs(v13) / 86400.0);

      if (*(_QWORD *)(a1 + 72) > v5
        && (!*(_BYTE *)(a1 + 88) || objc_msgSend(*(id *)(a1 + 40), "_hasAddressNodesForMomentNode:", v4)))
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
        ++v7;
      }
      goto LABEL_2;
    }
  }

}

double __115__PGNeighborScoreComputer__calculateScoreWithNeighborMomentNodes_referenceDate_referenceDistance_andDistanceBlock___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  double result;

  objc_msgSend(a2, "doubleValue");
  v4 = v3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 * v4 + *(double *)(v5 + 24);
  *(double *)(v5 + 24) = result;
  return result;
}

uint64_t __101__PGNeighborScoreComputer__locationScoreWithNeighborMomentNodes_referenceDate_andLocationCoordinate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_bestLocationCoordinateForMomentNode:", a2);
  return CLLocationCoordinate2DGetDistanceFrom();
}

double __103__PGNeighborScoreComputer__peopleScoreWithNeighborMomentNodes_referenceDate_andPersonLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_personLocalIdentifiersForMomentNode:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
    v9 = (double)v6;
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

unint64_t __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t result;
  unint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "numberOfAssets");
  if (v3 <= result)
    v5 = result;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

double __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (a2)
    return round(atan((double)a2 / 19.0985932) * 19.0985932);
  else
    return 0.0;
}

uint64_t __96__PGNeighborScoreComputer__densityScoreWithNeighborMomentNodes_referenceDate_andNumberOfAssets___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "numberOfAssets"));
}

uint64_t __63__PGNeighborScoreComputer_maximumNeighborScoreWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4)
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;
  return result;
}

uint64_t __58__PGNeighborScoreComputer_neighborScoreWithHighlightNode___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", a2);
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

@end
