@implementation PGLocationsFilterer

- (PGLocationsFilterer)initWithSortedMomentNodes:(id)a3 locationNodes:(id)a4 incompleteLocationResolver:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGLocationsFilterer *v12;
  PGLocationsFilterer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGLocationsFilterer;
  v12 = -[PGLocationsFilterer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_filteringType = 0;
    objc_storeStrong((id *)&v12->_sortedMomentNodes, a3);
    objc_storeStrong((id *)&v13->_locationNodes, a4);
    objc_storeStrong((id *)&v13->_incompleteLocationResolver, a5);
  }

  return v13;
}

- (NSArray)filteredLocationNodes
{
  NSArray *filteredLocationNodes;
  NSArray *v4;
  NSArray *v5;

  filteredLocationNodes = self->_filteredLocationNodes;
  if (!filteredLocationNodes)
  {
    -[PGLocationsFilterer _filteredSignificantLocationNodes](self, "_filteredSignificantLocationNodes");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_filteredLocationNodes;
    self->_filteredLocationNodes = v4;

    filteredLocationNodes = self->_filteredLocationNodes;
  }
  return filteredLocationNodes;
}

- (id)_filteredSignificantLocationNodes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t j;
  void *v23;
  float v24;
  float v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  float v39;
  float v40;
  double v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  NSArray *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t filteringType;
  float v50;
  float *v51;
  float v52;
  void *v53;
  uint64_t v54;
  float v55;
  float v56;
  uint64_t v57;
  float v58;
  uint64_t n;
  void *v60;
  float v61;
  float v62;
  float v63;
  unint64_t v64;
  float v65;
  float v66;
  float v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  uint64_t ii;
  uint64_t v73;
  void *v74;
  float v75;
  float v76;
  PGLocationsFilterer *v78;
  NSArray *v79;
  NSArray *obj;
  _BOOL4 v81;
  void *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  NSArray *v86;
  unint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  PGIncompleteLocationResolver *v91;
  uint64_t v92;
  void *context;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
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
  _QWORD v120[4];
  id v121;
  PGIncompleteLocationResolver *v122;
  id v123;
  id v124;
  uint64_t *v125;
  uint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  double *v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v86 = self->_locationNodes;
  v78 = self;
  v79 = self->_sortedMomentNodes;
  -[NSArray firstObject](v79, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = (unint64_t)objc_msgSend(v82, "version") >= 0xCE
     && +[PGUserDefaults useExtendedCurationAssetCountForLocationTitles](PGUserDefaults, "useExtendedCurationAssetCountForLocationTitles");
  v91 = v78->_incompleteLocationResolver;
  if (-[NSArray count](v86, "count"))
  {
    -[NSArray firstObject](v86, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v90);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v86, "count"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    obj = v79;
    v89 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
    if (v89)
    {
      v83 = 0;
      v85 = *(_QWORD *)v137;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v137 != v85)
          {
            v7 = v6;
            objc_enumerationMutation(obj);
            v6 = v7;
          }
          v92 = v6;
          v8 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v6);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = 0;
          v133 = (double *)&v132;
          v134 = 0x2020000000;
          v135 = 0;
          v128 = 0;
          v129 = &v128;
          v130 = 0x2020000000;
          v131 = 0;
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __56__PGLocationsFilterer__filteredSignificantLocationNodes__block_invoke;
          v120[3] = &unk_1E842C798;
          v121 = v90;
          v122 = v91;
          v127 = v87;
          v10 = v88;
          v123 = v10;
          v125 = &v128;
          v126 = &v132;
          v11 = v9;
          v124 = v11;
          objc_msgSend(v8, "enumerateAddressEdgesAndNodesUsingBlock:", v120);
          if (v133[3] > 0.0)
          {
            if (v81)
              v12 = objc_msgSend(v8, "numberOfAssetsInExtendedCuration");
            else
              v12 = objc_msgSend(v8, "numberOfAssets");
            if (!v12)
              v12 = objc_msgSend(v8, "numberOfAssets");
            v84 = v12;
            if (*((_BYTE *)v129 + 24))
            {
              v118 = 0u;
              v119 = 0u;
              v116 = 0u;
              v117 = 0u;
              objc_msgSend(v10, "allValues");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v116, v145, 16);
              if (v14)
              {
                v94 = *(_QWORD *)v117;
                do
                {
                  v95 = v14;
                  for (i = 0; i != v95; ++i)
                  {
                    if (*(_QWORD *)v117 != v94)
                      objc_enumerationMutation(v13);
                    v16 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
                    if ((unint64_t)objc_msgSend(v16, "count", v78) >= 2)
                    {
                      v114 = 0u;
                      v115 = 0u;
                      v112 = 0u;
                      v113 = 0u;
                      v17 = v16;
                      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v112, v144, 16);
                      if (v18)
                      {
                        v19 = *(_QWORD *)v113;
                        v20 = 0.0;
                        v21 = 0.0;
                        do
                        {
                          for (j = 0; j != v18; ++j)
                          {
                            if (*(_QWORD *)v113 != v19)
                              objc_enumerationMutation(v17);
                            objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j));
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v23, "floatValue");
                            v25 = v24;

                            v21 = v21 + v25;
                            if (v20 < v25)
                              v20 = v25;
                          }
                          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v112, v144, 16);
                        }
                        while (v18);
                      }
                      else
                      {
                        v20 = 0.0;
                        v21 = 0.0;
                      }

                      v133[3] = v133[3] - (v21 - v20);
                      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v11, "setObject:forKey:", v27, v26);

                      v110 = 0u;
                      v111 = 0u;
                      v108 = 0u;
                      v109 = 0u;
                      v28 = v17;
                      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v108, v143, 16);
                      if (v29)
                      {
                        v30 = *(_QWORD *)v109;
                        do
                        {
                          for (k = 0; k != v29; ++k)
                          {
                            if (*(_QWORD *)v109 != v30)
                              objc_enumerationMutation(v28);
                            v32 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
                            if ((objc_msgSend(v32, "isSameNodeAsNode:", v26) & 1) == 0)
                              objc_msgSend(v11, "removeObjectForKey:", v32);
                          }
                          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v108, v143, 16);
                        }
                        while (v29);
                      }

                    }
                  }
                  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v116, v145, 16);
                }
                while (v14);
              }

            }
            v106 = 0u;
            v107 = 0u;
            v104 = 0u;
            v105 = 0u;
            objc_msgSend(v11, "keyEnumerator", v78);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v142, 16);
            if (v34)
            {
              v35 = *(_QWORD *)v105;
              do
              {
                for (m = 0; m != v34; ++m)
                {
                  if (*(_QWORD *)v105 != v35)
                    objc_enumerationMutation(v33);
                  v37 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * m);
                  objc_msgSend(v11, "objectForKey:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "floatValue");
                  v40 = v39;

                  v41 = v133[3];
                  objc_msgSend(v5, "objectForKey:", v37);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "floatValue");
                  v44 = v43;

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40 / v41 * (double)v84 + v44);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKey:", v45, v37);

                }
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, v142, 16);
              }
              while (v34);
            }

            v83 += v84;
          }

          _Block_object_dispose(&v128, 8);
          _Block_object_dispose(&v132, 8);

          objc_autoreleasePoolPop(context);
          v6 = v92 + 1;
        }
        while (v92 + 1 != v89);
        v89 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
      }
      while (v89);
    }
    else
    {
      v83 = 0;
    }

    v46 = (NSArray *)-[NSArray mutableCopy](v86, "mutableCopy");
    v47 = objc_msgSend(v5, "count");
    v48 = v47;
    if (v47 < 2)
      goto LABEL_93;
    if (v47 == 3)
    {
      filteringType = v78->_filteringType;
      v50 = 0.0;
      if (filteringType <= 2)
      {
        v51 = (float *)&unk_1CA8ECA84;
        goto LABEL_67;
      }
    }
    else
    {
      if (v47 != 2)
      {
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        objc_msgSend(v5, "keyEnumerator");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v100, v141, 16);
        v55 = (float)v48;
        v56 = (float)v83 / (float)v48;
        if (v54)
        {
          v57 = *(_QWORD *)v101;
          v58 = 0.0;
          do
          {
            for (n = 0; n != v54; ++n)
            {
              if (*(_QWORD *)v101 != v57)
                objc_enumerationMutation(v53);
              objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * n), v78);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "floatValue");
              v62 = v61;

              v58 = v58 + (float)((float)(v62 - v56) * (float)(v62 - v56));
            }
            v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v100, v141, 16);
          }
          while (v54);
        }
        else
        {
          v58 = 0.0;
        }

        v63 = sqrtf(v58 / v55);
        v64 = v78->_filteringType;
        v65 = 0.0;
        if (v64 <= 2)
          v65 = flt_1CA8ECA90[v64];
        v66 = v56 - (float)(v65 * v63);
        v67 = v56 + v63;
        if (v66 >= 0.0)
          v67 = v66;
        v52 = floorf(v67);
        goto LABEL_83;
      }
      filteringType = v78->_filteringType;
      v50 = 0.0;
      if (filteringType <= 2)
      {
        v51 = (float *)&unk_1CA8ECA78;
LABEL_67:
        v50 = v51[filteringType];
      }
    }
    v52 = ceilf(v50 * (float)v83);
LABEL_83:
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    objc_msgSend(v5, "keyEnumerator", v78);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v96, v140, 16);
    if (v69)
    {
      v70 = *(_QWORD *)v97;
      v71 = (float)(unint64_t)v52;
      do
      {
        for (ii = 0; ii != v69; ++ii)
        {
          if (*(_QWORD *)v97 != v70)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * ii);
          objc_msgSend(v5, "objectForKey:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "floatValue");
          v76 = v75;

          if (v76 < v71)
            -[NSArray removeObject:](v46, "removeObject:", v73);
        }
        v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v96, v140, 16);
      }
      while (v69);
    }

LABEL_93:
    goto LABEL_94;
  }
  v46 = v86;
LABEL_94:

  return v46;
}

- (NSArray)sortedMomentNodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)locationNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return (PGIncompleteLocationResolver *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)filteringType
{
  return self->_filteringType;
}

- (void)setFilteringType:(unint64_t)a3
{
  self->_filteringType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredLocationNodes, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_locationNodes, 0);
  objc_storeStrong((id *)&self->_sortedMomentNodes, 0);
}

void __56__PGLocationsFilterer__filteredSignificantLocationNodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nearestDeepParentLocationNodesWithLabel:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (objc_msgSend(*(id *)(a1 + 40), "resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:", v6, *(_QWORD *)(a1 + 80)), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "containsObject:", v9) & 1) == 0)
      {
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v9);
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (unint64_t)objc_msgSend(v12, "count") > 1;
      objc_msgSend(v5, "relevance");
      v14 = v13;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      v18 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 + v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, v9);

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = 138412290;
        v23 = v9;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Location Node has no name! \"%@\", (uint8_t *)&v22, 0xCu);
      }

    }
  }

}

@end
