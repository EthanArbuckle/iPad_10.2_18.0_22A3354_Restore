@implementation PLRegionsDensityClustering

- (PLRegionsDensityClustering)init
{
  PLRegionsDensityClustering *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLRegionsDensityClustering;
  result = -[PLRegionsDensityClustering init](&v3, sel_init);
  if (result)
  {
    result->_algorithm = 0;
    result->_includeDefiniteClusters = 1;
    result->_definiteClusterTimeIntervalDistance = 7200.0;
    result->_definiteClusterMaximumDistanceUnit = 20.0;
    result->_definiteClusterMinimumNumberOfObjectsPercent = 0.25;
    result->_definiteClusterMinimumNumberOfObjects = 4;
    result->_removeDefiniteClustersObjectsFromDataset = 1;
    result->_includeExtensiveClusters = 1;
    result->_extensiveClusterTimeIntervalDistance = 0.0;
    result->_extensiveClusterMaximumDistanceUnit = 250.0;
    result->_extensiveClusterMinimumNumberOfObjectsPercent = 0.15;
    result->_extensiveClusterMinimumNumberOfObjects = 3;
    result->_removeExtensiveClustersObjectsFromDataset = 1;
    result->_removeExtensiveClustersContainingDefiniteClusters = 1;
  }
  return result;
}

- (id)_locationBasedClusteringBlock
{
  return &__block_literal_global_83873;
}

- (id)_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:(double)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__PLRegionsDensityClustering__timeAndLocationBasedClusteringBlockWithTimeIntervalDistance___block_invoke;
  v6[3] = &__block_descriptor_40_e65_d24__0___PLRegionsClusteringItem__8___PLRegionsClusteringItem__16l;
  *(double *)&v6[4] = a3;
  v3 = (void *)MEMORY[0x19AEC174C](v6, a2);
  v4 = (void *)MEMORY[0x19AEC174C]();

  return v4;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double latitude;
  double longitude;
  _BOOL4 v15;
  void *v17;
  __objc2_class **v18;
  void *v19;
  unint64_t v20;
  unint64_t definiteClusterMinimumNumberOfObjects;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  __objc2_class **v29;
  void *v30;
  unint64_t v31;
  unint64_t extensiveClusterMinimumNumberOfObjects;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  uint64_t v65;
  uint64_t v66;
  double v67;
  void *v68;
  PLDBSCANClustering *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ii;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id obj;
  void *v93;
  void *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;
  CLLocationCoordinate2D v136;

  v135 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v125 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
        objc_msgSend(v12, "pl_coordinate");
        latitude = v136.latitude;
        longitude = v136.longitude;
        if (CLLocationCoordinate2DIsValid(v136))
        {
          v15 = latitude != 0.0;
          if (longitude != 0.0)
            v15 = 1;
          if (v15 && (latitude != 40.0 || longitude != -100.0))
            objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v124, v134, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_2_83866);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)objc_msgSend(v87, "mutableCopy");
    v88 = v6;
    if (self->_includeDefiniteClusters)
    {
      if (self->_definiteClusterTimeIntervalDistance == 0.0)
        -[PLRegionsDensityClustering _locationBasedClusteringBlock](self, "_locationBasedClusteringBlock");
      else
        -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_algorithm)
        v18 = off_1E365A540;
      else
        v18 = off_1E3659838;
      v19 = (void *)objc_msgSend(objc_alloc(*v18), "initWithDistanceBlock:", v17);
      objc_msgSend(v19, "setMaximumDistance:", self->_definiteClusterMaximumDistanceUnit);
      v20 = vcvtmd_u64_f64(self->_definiteClusterMinimumNumberOfObjectsPercent * (double)(unint64_t)objc_msgSend(v94, "count"));
      if (self->_definiteClusterMinimumNumberOfObjects <= v20)
        definiteClusterMinimumNumberOfObjects = v20;
      else
        definiteClusterMinimumNumberOfObjects = self->_definiteClusterMinimumNumberOfObjects;
      objc_msgSend(v19, "setMinimumNumberOfObjects:", definiteClusterMinimumNumberOfObjects);
      v86 = v19;
      objc_msgSend(v19, "performWithDataset:progressBlock:", v94, 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_removeDefiniteClustersObjectsFromDataset)
      {
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v22 = v90;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v121;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v121 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * j), "objects");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "removeObjectsInArray:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
          }
          while (v24);
        }

      }
    }
    else
    {
      v86 = 0;
      v90 = 0;
    }
    if (self->_includeExtensiveClusters && objc_msgSend(v94, "count"))
    {
      if (self->_extensiveClusterTimeIntervalDistance == 0.0)
        -[PLRegionsDensityClustering _locationBasedClusteringBlock](self, "_locationBasedClusteringBlock");
      else
        -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_algorithm)
        v29 = off_1E365A540;
      else
        v29 = off_1E3659838;
      v30 = (void *)objc_msgSend(objc_alloc(*v29), "initWithDistanceBlock:", v28);
      objc_msgSend(v30, "setMaximumDistance:", self->_extensiveClusterMaximumDistanceUnit);
      v31 = vcvtmd_u64_f64(self->_extensiveClusterMinimumNumberOfObjectsPercent* (double)(unint64_t)objc_msgSend(v94, "count"));
      if (self->_extensiveClusterMinimumNumberOfObjects <= v31)
        extensiveClusterMinimumNumberOfObjects = v31;
      else
        extensiveClusterMinimumNumberOfObjects = self->_extensiveClusterMinimumNumberOfObjects;
      objc_msgSend(v30, "setMinimumNumberOfObjects:", extensiveClusterMinimumNumberOfObjects);
      v85 = v30;
      objc_msgSend(v30, "performWithDataset:progressBlock:", v94, 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_removeExtensiveClustersObjectsFromDataset)
      {
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v33 = v89;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v117;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v117 != v36)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * k), "objects");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "removeObjectsInArray:", v38);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
          }
          while (v35);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v85);
    }
    else
    {
      v89 = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", 0);
    }
    v95 = (id)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_opt_new();
    if (self->_includeDefiniteClusters)
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v39 = v90;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v113;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v113 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
            objc_msgSend(v44, "objects");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "count");

            if (v46)
            {
              objc_msgSend(v44, "meanRegion:", 10.0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objects");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "setObject:forKeyedSubscript:", v48, v47);

              if (self->_removeExtensiveClustersContainingDefiniteClusters)
                objc_msgSend(v93, "addObject:", v47);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
        }
        while (v41);
      }

    }
    if (self->_includeExtensiveClusters)
    {
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v89;
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v109;
        do
        {
          v52 = 0;
          v91 = v50;
          do
          {
            if (*(_QWORD *)v109 != v51)
              objc_enumerationMutation(obj);
            v53 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v52);
            objc_msgSend(v53, "objects");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "count");

            if (v55)
            {
              objc_msgSend(v53, "meanRegion:", 100.0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = 0;
              v107 = 0;
              objc_msgSend(v56, "center");
              v106 = v57;
              v107 = v58;
              if (self->_removeExtensiveClustersContainingDefiniteClusters)
              {
                v104 = 0u;
                v105 = 0u;
                v102 = 0u;
                v103 = 0u;
                v59 = v93;
                v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v129, 16);
                if (v60)
                {
                  v61 = v60;
                  v62 = *(_QWORD *)v103;
                  while (2)
                  {
                    v63 = v51;
                    for (n = 0; n != v61; ++n)
                    {
                      if (*(_QWORD *)v103 != v62)
                        objc_enumerationMutation(v59);
                      objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * n), "center");
                      v100 = v65;
                      v101 = v66;
                      if ((objc_msgSend(v56, "containsCoordinate:") & 1) == 0)
                      {
                        CLLocationCoordinate2DGetDistanceFrom();
                        if (v67 > (self->_definiteClusterMaximumDistanceUnit
                                  + self->_extensiveClusterMaximumDistanceUnit)
                                 * 0.5)
                          continue;
                      }
                      v51 = v63;
                      v50 = v91;
                      goto LABEL_95;
                    }
                    v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v102, v129, 16);
                    v51 = v63;
                    v50 = v91;
                    if (v61)
                      continue;
                    break;
                  }
                }

              }
              objc_msgSend(v53, "objects");
              v59 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "setObject:forKeyedSubscript:", v59, v56);
LABEL_95:

            }
            ++v52;
          }
          while (v52 != v50);
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
        }
        while (v50);
      }

    }
    if (!objc_msgSend(v95, "count") && (unint64_t)objc_msgSend(v94, "count") >= 2)
    {
      if (self->_extensiveClusterTimeIntervalDistance == 0.0)
        -[PLRegionsDensityClustering _locationBasedClusteringBlock](self, "_locationBasedClusteringBlock");
      else
        -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[PLDataClustering initWithDistanceBlock:]([PLDBSCANClustering alloc], "initWithDistanceBlock:", v68);
      -[PLDataDensityClustering setMaximumDistance:](v69, "setMaximumDistance:", dbl_199B9FE00[objc_msgSend(v94, "count") > self->_definiteClusterMinimumNumberOfObjects]);
      -[PLDataDensityClustering setMinimumNumberOfObjects:](v69, "setMinimumNumberOfObjects:", 1);
      -[PLDBSCANClustering performWithDataset:progressBlock:](v69, "performWithDataset:progressBlock:", v94, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v96, v128, 16);
      if (v71)
      {
        v72 = v71;
        v73 = *(_QWORD *)v97;
        do
        {
          for (ii = 0; ii != v72; ++ii)
          {
            if (*(_QWORD *)v97 != v73)
              objc_enumerationMutation(v70);
            v75 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * ii);
            objc_msgSend(v75, "objects");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "count");

            if (v77)
            {
              objc_msgSend(v75, "meanRegion:", 500.0);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objects");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "setObject:forKeyedSubscript:", v79, v78);

            }
          }
          v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v96, v128, 16);
        }
        while (v72);
      }

    }
    v6 = v88;
    if (!objc_msgSend(v95, "count"))
    {
      +[PLDataCluster clusterWithObjects:](PLDataCluster, "clusterWithObjects:", v88);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "meanRegion:", 100.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v81)
      {
        objc_msgSend(v80, "objects");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "setObject:forKeyedSubscript:", v82, v81);

      }
    }

  }
  else
  {
    v95 = (id)MEMORY[0x1E0C9AA70];
  }

  return v95;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

- (BOOL)includeDefiniteClusters
{
  return self->_includeDefiniteClusters;
}

- (void)setIncludeDefiniteClusters:(BOOL)a3
{
  self->_includeDefiniteClusters = a3;
}

- (double)definiteClusterTimeIntervalDistance
{
  return self->_definiteClusterTimeIntervalDistance;
}

- (void)setDefiniteClusterTimeIntervalDistance:(double)a3
{
  self->_definiteClusterTimeIntervalDistance = a3;
}

- (double)definiteClusterMaximumDistanceUnit
{
  return self->_definiteClusterMaximumDistanceUnit;
}

- (void)setDefiniteClusterMaximumDistanceUnit:(double)a3
{
  self->_definiteClusterMaximumDistanceUnit = a3;
}

- (double)definiteClusterMinimumNumberOfObjectsPercent
{
  return self->_definiteClusterMinimumNumberOfObjectsPercent;
}

- (void)setDefiniteClusterMinimumNumberOfObjectsPercent:(double)a3
{
  self->_definiteClusterMinimumNumberOfObjectsPercent = a3;
}

- (unint64_t)definiteClusterMinimumNumberOfObjects
{
  return self->_definiteClusterMinimumNumberOfObjects;
}

- (void)setDefiniteClusterMinimumNumberOfObjects:(unint64_t)a3
{
  self->_definiteClusterMinimumNumberOfObjects = a3;
}

- (BOOL)removeDefiniteClustersObjectsFromDataset
{
  return self->_removeDefiniteClustersObjectsFromDataset;
}

- (void)setRemoveDefiniteClustersObjectsFromDataset:(BOOL)a3
{
  self->_removeDefiniteClustersObjectsFromDataset = a3;
}

- (BOOL)includeExtensiveClusters
{
  return self->_includeExtensiveClusters;
}

- (void)setIncludeExtensiveClusters:(BOOL)a3
{
  self->_includeExtensiveClusters = a3;
}

- (double)extensiveClusterTimeIntervalDistance
{
  return self->_extensiveClusterTimeIntervalDistance;
}

- (void)setExtensiveClusterTimeIntervalDistance:(double)a3
{
  self->_extensiveClusterTimeIntervalDistance = a3;
}

- (double)extensiveClusterMaximumDistanceUnit
{
  return self->_extensiveClusterMaximumDistanceUnit;
}

- (void)setExtensiveClusterMaximumDistanceUnit:(double)a3
{
  self->_extensiveClusterMaximumDistanceUnit = a3;
}

- (double)extensiveClusterMinimumNumberOfObjectsPercent
{
  return self->_extensiveClusterMinimumNumberOfObjectsPercent;
}

- (void)setExtensiveClusterMinimumNumberOfObjectsPercent:(double)a3
{
  self->_extensiveClusterMinimumNumberOfObjectsPercent = a3;
}

- (unint64_t)extensiveClusterMinimumNumberOfObjects
{
  return self->_extensiveClusterMinimumNumberOfObjects;
}

- (void)setExtensiveClusterMinimumNumberOfObjects:(unint64_t)a3
{
  self->_extensiveClusterMinimumNumberOfObjects = a3;
}

- (BOOL)removeExtensiveClustersObjectsFromDataset
{
  return self->_removeExtensiveClustersObjectsFromDataset;
}

- (void)setRemoveExtensiveClustersObjectsFromDataset:(BOOL)a3
{
  self->_removeExtensiveClustersObjectsFromDataset = a3;
}

- (BOOL)removeExtensiveClustersContainingDefiniteClusters
{
  return self->_removeExtensiveClustersContainingDefiniteClusters;
}

- (void)setRemoveExtensiveClustersContainingDefiniteClusters:(BOOL)a3
{
  self->_removeExtensiveClustersContainingDefiniteClusters = a3;
}

uint64_t __63__PLRegionsDensityClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "pl_date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

double __91__PLRegionsDensityClustering__timeAndLocationBasedClusteringBlockWithTimeIntervalDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "pl_coordinate");
  objc_msgSend(v5, "pl_coordinate");
  v16 = v7;
  v17 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  v10 = v9;
  objc_msgSend(v6, "pl_date", v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pl_date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = fabs(v13) / *(double *)(a1 + 32);

  return v10 + v14;
}

uint64_t __59__PLRegionsDensityClustering__locationBasedClusteringBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");

  return CLLocationCoordinate2DGetDistanceFrom();
}

@end
