@implementation PNPersonDeduperSocialGroupOverlaps

- (id)name
{
  return CFSTR("Social Group Overlaps");
}

- (id)metricsKey
{
  __CFString *v2;

  v2 = CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupOverlapStep");
  return CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupOverlapStep");
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

- (void)mergePersons:(id)a3 otherPersonLocalIdentifiers:(id)a4 personsFetchResult:(id)a5 mergeSocialGroupPersonIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *context;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count") && objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_opt_new();
    v49 = (void *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v43 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v62 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v19, "localIdentifier", v43);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v9, "containsObject:", v20);
          v22 = v13;
          if ((v21 & 1) != 0 || (v23 = objc_msgSend(v10, "containsObject:", v20), v22 = v49, v23))
            objc_msgSend(v22, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v16);
    }
    v44 = v10;
    v45 = v9;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v13;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v58;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(obj);
          v51 = v24;
          v25 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v24);
          context = (void *)MEMORY[0x249506444]();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v52 = v49;
          v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v54;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v54 != v28)
                  objc_enumerationMutation(v52);
                v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
                objc_msgSend(v30, "localIdentifier", v43);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "localIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v31, "isEqualToString:", v32);

                if ((v33 & 1) == 0)
                {
                  v34 = (void *)MEMORY[0x249506444]();
                  objc_msgSend(v25, "localIdentifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "objectForKeyedSubscript:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v36)
                  {
                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "localIdentifier");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, v37);

                  }
                  objc_msgSend(v30, "localIdentifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "addObject:", v38);

                  objc_msgSend(v30, "localIdentifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "objectForKeyedSubscript:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v40)
                  {
                    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "localIdentifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, v41);

                  }
                  objc_msgSend(v25, "localIdentifier");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "addObject:", v42);

                  objc_autoreleasePoolPop(v34);
                }
              }
              v27 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
            }
            while (v27);
          }

          objc_autoreleasePoolPop(context);
          v24 = v51 + 1;
        }
        while (v51 + 1 != v48);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v48);
    }

    v10 = v44;
    v9 = v45;
    v11 = v43;
  }

}

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  PNPersonDeduperSocialGroupOverlaps *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  char *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  PNPersonDeduperSocialGroupOverlaps *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  char *v76;
  void (**v77)(_QWORD, _QWORD, _QWORD);
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id obj;
  id obja;
  void *v90;
  void *contexta;
  void *context;
  id v93;
  __int128 v95;
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
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v93 = a5;
  v12 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v62 = v12;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupOverlaps.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persons"));

    v12 = v62;
    if (v11)
      goto LABEL_3;
  }
  v64 = v12;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupOverlaps.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherPersons"));

  v12 = v64;
LABEL_3:
  if (!v93)
  {
    v66 = v12;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupOverlaps.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

    v12 = v66;
  }
  v77 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupOverlaps.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

  }
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v13, "unionSet:", v11);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep personClusterManager](self, "personClusterManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v13;
  objc_msgSend(v14, "performSocialGroupsIdentifiersWithPersonClusterManager:forPersons:overTheYearsComputation:updateBlock:", v15, v13, 0, v93);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v18 = v16;
  v70 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
  if (v70)
  {
    v19 = *(_QWORD *)v108;
    v80 = v11;
    v82 = v10;
    v78 = v17;
    v84 = v18;
    v69 = *(_QWORD *)v108;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v108 != v19)
        {
          v21 = v20;
          objc_enumerationMutation(v18);
          v20 = v21;
        }
        v72 = v20;
        v22 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v20);
        v75 = (void *)MEMORY[0x249506444]();
        objc_msgSend(v17, "removeObject:", v22);
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        obj = v17;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
        v24 = self;
        if (v23)
        {
          v25 = v23;
          v26 = *(_QWORD *)v104;
          v86 = *(_QWORD *)v104;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v104 != v26)
                objc_enumerationMutation(obj);
              v28 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
              if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](v24, "shouldStopWithUpdateBlock:", v93))
              {

                objc_autoreleasePoolPop(v75);
                v10 = v82;
                v18 = v84;
                v42 = v84;
                v17 = v78;
                v11 = v80;
                goto LABEL_53;
              }
              v29 = (void *)objc_msgSend(v22, "mutableCopy");
              objc_msgSend(v29, "intersectSet:", v28);
              v30 = objc_msgSend(v22, "count");
              v31 = objc_msgSend(v28, "count");
              if (v30 >= v31)
                v32 = v31;
              else
                v32 = v30;
              v33 = vcvtmd_u64_f64((double)v32 * 0.5);
              if (v33 <= 2)
                v34 = 2;
              else
                v34 = v33;
              if (objc_msgSend(v29, "count") >= v34)
              {
                contexta = (void *)MEMORY[0x249506444]();
                v35 = v25;
                v36 = (void *)objc_msgSend(v22, "mutableCopy");
                objc_msgSend(v36, "unionSet:", v28);
                -[PNPersonDeduperStep personClusterManager](v24, "personClusterManager");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "allObjects");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "pn_fetchPersonsWithLocalIdentifiers:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                v40 = (void *)objc_msgSend(v22, "mutableCopy");
                objc_msgSend(v40, "minusSet:", v29);
                -[PNPersonDeduperSocialGroupOverlaps mergePersons:otherPersonLocalIdentifiers:personsFetchResult:mergeSocialGroupPersonIdentifiers:](self, "mergePersons:otherPersonLocalIdentifiers:personsFetchResult:mergeSocialGroupPersonIdentifiers:", v40, v28, v39, v90);
                v41 = (void *)objc_msgSend(v28, "mutableCopy");

                objc_msgSend(v41, "minusSet:", v29);
                -[PNPersonDeduperSocialGroupOverlaps mergePersons:otherPersonLocalIdentifiers:personsFetchResult:mergeSocialGroupPersonIdentifiers:](self, "mergePersons:otherPersonLocalIdentifiers:personsFetchResult:mergeSocialGroupPersonIdentifiers:", v41, v22, v39, v90);

                v24 = self;
                v25 = v35;
                v26 = v86;
                objc_autoreleasePoolPop(contexta);
              }

            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
            if (v25)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(v75);
        v20 = v72 + 1;
        v11 = v80;
        v10 = v82;
        v17 = v78;
        v18 = v84;
        v19 = v69;
      }
      while (v72 + 1 != v70);
      v70 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
    }
    while (v70);
  }

  v42 = (void *)objc_msgSend(v11, "mutableCopy");
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v43 = v10;
  v73 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  if (v73)
  {
    v44 = *(_QWORD *)v100;
    v81 = v11;
    v83 = v10;
    v79 = v17;
    v85 = v18;
    v87 = v42;
    obja = v43;
    v71 = *(_QWORD *)v100;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v100 != v44)
          objc_enumerationMutation(v43);
        v76 = v45;
        v46 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v45);
        context = (void *)MEMORY[0x249506444]();
        objc_msgSend(v42, "removeObject:", v46);
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v47 = v42;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v96;
          while (2)
          {
            v51 = 0;
            v52 = self;
            do
            {
              if (*(_QWORD *)v96 != v50)
                objc_enumerationMutation(v47);
              v53 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v51);
              if (-[PNPersonDeduperStep shouldStop](v52, "shouldStop")
                || -[PNPersonDeduperStep shouldStopWithUpdateBlock:](v52, "shouldStopWithUpdateBlock:", v93))
              {

                objc_autoreleasePoolPop(context);
                v11 = v81;
                v10 = v83;
                v17 = v79;
                v18 = v85;
                v42 = v87;
                v59 = obja;
                goto LABEL_52;
              }
              objc_msgSend(v46, "localIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKeyedSubscript:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "localIdentifier");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v55, "containsObject:", v56);

              v52 = self;
              if (v57)
              {
                v58 = (void *)MEMORY[0x249506444]();
                -[PNPersonDeduperStep addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:](self, "addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:", v46, v53, v93);
                objc_autoreleasePoolPop(v58);
              }
              ++v51;
            }
            while (v49 != v51);
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
            v11 = v81;
            v10 = v83;
            v17 = v79;
            v42 = v87;
            if (v49)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(context);
        v45 = v76 + 1;
        v44 = v71;
        v18 = v85;
        v43 = obja;
      }
      while (v76 + 1 != (char *)v73);
      v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    }
    while (v73);
  }

  if (!-[PNPersonDeduperStep shouldStop](self, "shouldStop"))
  {
    -[PNPersonDeduperStep mergeCandidatePersonsWithUpdateBlock:](self, "mergeCandidatePersonsWithUpdateBlock:", v93);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v43, "mutableCopy");
    v61 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v60, "minusSet:", v59);
    objc_msgSend(v61, "minusSet:", v59);
    ((void (**)(_QWORD, void *, void *))v77)[2](v77, v60, v61);

LABEL_52:
  }
LABEL_53:

}

@end
