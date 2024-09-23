@implementation PNPersonDeduperLocationStep

- (id)name
{
  return CFSTR("Location Deduping");
}

- (id)metricsKey
{
  __CFString *v2;

  v2 = CFSTR("numberOfGraphMergeCandidatesAddedByLocationStep");
  return CFSTR("numberOfGraphMergeCandidatesAddedByLocationStep");
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  uint64_t v6;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  float v16;

  v6 = a6;
  -[PNPersonDeduperStep profile](self, "profile", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldRelaxThreshold");
  -[PNPersonDeduperStep profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
    objc_msgSend(v11, "fuzzyMaximumDistance");
  else
    objc_msgSend(v11, "normalMaximumDistance");
  v14 = v13;

  *(float *)&v14 = v14;
  LODWORD(v15) = LODWORD(v14);
  -[PNPersonDeduperStep adjustedThreshold:forMinAgeType:](self, "adjustedThreshold:forMinAgeType:", v6, v15);
  return v16 > a5;
}

- (id)momentWithBestLocationForPersons:(id)a3 andOtherPersons:(id)a4 personsByMomentLocalIdentifiersCache:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  PNPersonDeduperLocationStep *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  PNPersonDeduperLocationStep *v36;
  void *v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v36 = self;
  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  objc_msgSend(v9, "addObjectsFromArray:", v7);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v9;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v11, "backingMomentIdentifiers", v36);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "unionSet:", v12);

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v11, "backingMomentIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v47 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v19)
              {
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v18);
              }
              objc_msgSend(v19, "addObject:", v11);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v15);
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v41);
  }

  v20 = v36;
  -[PNPersonDeduperStep personClusterManager](v36, "personClusterManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pn_fetchMomentsWithLocalIdentifiers:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
        objc_msgSend(v30, "approximateCoordinate", v36);
        if (v32 != 0.0
          && v31 != 0.0
          && CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v31)
          && (objc_msgSend(v30, "isCoarse") & 1) == 0)
        {
          objc_msgSend(v24, "addObject:", v30);
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v27);
  }

  -[PNPersonDeduperStep delegate](v20, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "densityClusteringForObjects:maximumDistance:minimumNumberOfObjects:withDistanceBlock:", v24, 3, &__block_literal_global_2821, 500.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  PNPersonDeduperLocationStep *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void (**v81)(id, void *, void *);
  void *v82;
  void *v83;
  void *v84;
  void *context;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  id obj;
  id obja;
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
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v91 = a5;
  v12 = (void (**)(id, void *, void *))a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperLocationStep.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persons"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperLocationStep.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherPersons"));

LABEL_3:
  if (v91)
  {
    if (v12)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperLocationStep.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

    if (v12)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperLocationStep.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

LABEL_5:
  +[PNPersonClusterManager personProcessingSortDescriptors](PNPersonClusterManager, "personProcessingSortDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v16;
  -[PNPersonDeduperLocationStep momentWithBestLocationForPersons:andOtherPersons:personsByMomentLocalIdentifiersCache:](self, "momentWithBestLocationForPersons:andOtherPersons:personsByMomentLocalIdentifiersCache:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
  if (v20)
  {
    v87 = v10;
    v88 = 0;
    v22 = *(_QWORD *)v120;
    v23 = (float)v18;
    v86 = v11;
    v80 = v13;
    v81 = v12;
    v83 = v15;
    v84 = v14;
    v82 = v19;
    v77 = *(_QWORD *)v120;
    while (2)
    {
      v24 = 0;
      v76 = v20;
      do
      {
        if (*(_QWORD *)v120 != v22)
        {
          v25 = v24;
          objc_enumerationMutation(v19);
          v24 = v25;
        }
        v78 = v24;
        v26 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v24);
        *(float *)&v21 = (float)v88 / v23;
        -[PNPersonDeduperStep setProgress:](self, "setProgress:", v21);
        context = (void *)MEMORY[0x249506444]();
        objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        obj = v26;
        v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
        if (v95)
        {
          v92 = *(_QWORD *)v116;
          do
          {
            for (i = 0; i != v95; ++i)
            {
              if (*(_QWORD *)v116 != v92)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i), "localIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v113 = 0u;
              v114 = 0u;
              v111 = 0u;
              v112 = 0u;
              v31 = v30;
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v112;
                do
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v112 != v34)
                      objc_enumerationMutation(v31);
                    v36 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j);
                    objc_msgSend(v27, "objectForKey:", v36);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v38 = objc_msgSend(v37, "unsignedIntegerValue");

                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38 + 1);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKey:", v39, v36);

                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
                }
                while (v33);
              }

            }
            v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
          }
          while (v95);
        }

        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        objc_msgSend(v27, "keyEnumerator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v108;
          do
          {
            for (k = 0; k != v43; ++k)
            {
              if (*(_QWORD *)v108 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * k);
              objc_msgSend(v27, "objectForKey:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "unsignedIntegerValue");

              if ((float)((float)v48 / (float)(unint64_t)objc_msgSend(obj, "count")) >= 0.0)
                objc_msgSend(v40, "addObject:", v46);
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
          }
          while (v43);
        }

        v10 = v87;
        v49 = (void *)objc_msgSend(v87, "mutableCopy");
        v11 = v86;
        v50 = (void *)objc_msgSend(v86, "mutableCopy");
        v51 = v89;
        if (objc_msgSend(v89, "count"))
        {
          objc_msgSend(v89, "allObjects");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "removeObjectsInArray:", v52);
          objc_msgSend(v49, "removeObjectsInArray:", v52);

        }
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v53 = v49;
        v54 = self;
        v96 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
        if (v96)
        {
          v79 = *(_QWORD *)v104;
          v75 = v50;
          v93 = v53;
          do
          {
            v55 = 0;
            v56 = v79;
            do
            {
              if (*(_QWORD *)v104 != v56)
                objc_enumerationMutation(v53);
              v57 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v55);
              objc_msgSend(v50, "removeObject:", v57);
              if (objc_msgSend(v40, "containsObject:", v57))
              {
                v101 = 0u;
                v102 = 0u;
                v99 = 0u;
                v100 = 0u;
                obja = v50;
                v58 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
                if (v58)
                {
                  v59 = v58;
                  v60 = *(_QWORD *)v100;
                  while (2)
                  {
                    for (m = 0; m != v59; ++m)
                    {
                      if (*(_QWORD *)v100 != v60)
                        objc_enumerationMutation(obja);
                      v62 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m);
                      if (-[PNPersonDeduperStep shouldStop](v54, "shouldStop")
                        || -[PNPersonDeduperStep shouldStopWithUpdateBlock:](v54, "shouldStopWithUpdateBlock:", v91))
                      {
                        v50 = obja;

                        v53 = v93;
                        v11 = v86;
                        v10 = v87;
                        goto LABEL_60;
                      }
                      if (objc_msgSend(v40, "containsObject:", v62))
                      {
                        v63 = MEMORY[0x249506444]();
                        -[PNPersonDeduperStep addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:](self, "addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:", v57, v62, v91);
                        v64 = (void *)v63;
                        v54 = self;
                        objc_autoreleasePoolPop(v64);
                      }
                    }
                    v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
                    v50 = v75;
                    v56 = v79;
                    if (v59)
                      continue;
                    break;
                  }
                }

                v53 = v93;
              }
              ++v55;
            }
            while (v55 != v96);
            v11 = v86;
            v10 = v87;
            v51 = v89;
            v96 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
          }
          while (v96);
        }

        if (-[PNPersonDeduperStep shouldStop](v54, "shouldStop"))
        {
LABEL_60:
          v13 = v80;
          v12 = v81;

          objc_autoreleasePoolPop(context);
          v70 = v82;
          v15 = v83;
          v66 = v82;
          v14 = v84;
          v69 = v89;
          goto LABEL_61;
        }
        ++v88;
        -[PNPersonDeduperStep mergeCandidatePersonsWithUpdateBlock:](v54, "mergeCandidatePersonsWithUpdateBlock:", v91);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "unionSet:", v65);

        objc_autoreleasePoolPop(context);
        v22 = v77;
        v24 = v78 + 1;
        v13 = v80;
        v12 = v81;
        v15 = v83;
        v14 = v84;
        v19 = v82;
      }
      while (v78 + 1 != v76);
      v20 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
      v22 = v77;
      if (v20)
        continue;
      break;
    }
  }

  v66 = (void *)objc_msgSend(v10, "mutableCopy");
  v67 = v19;
  v68 = (void *)objc_msgSend(v11, "mutableCopy");
  v69 = v89;
  objc_msgSend(v66, "minusSet:", v89);
  objc_msgSend(v68, "minusSet:", v89);
  v12[2](v12, v66, v68);

  v70 = v67;
LABEL_61:

}

uint64_t __117__PNPersonDeduperLocationStep_momentWithBestLocationForPersons_andOtherPersons_personsByMomentLocalIdentifiersCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "approximateCoordinate");
  objc_msgSend(v4, "approximateCoordinate");

  return CLLocationCoordinate2DGetDistanceFrom();
}

@end
