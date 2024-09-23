@implementation PNPersonDeduperSocialGroupComplementStep

- (id)name
{
  return CFSTR("Social Group Complement");
}

- (id)metricsKey
{
  __CFString *v2;

  v2 = CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupComplementStep");
  return CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupComplementStep");
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

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, void *, void *);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void (**v83)(_QWORD, void *, void *);
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  PNPersonDeduperSocialGroupComplementStep *v102;
  id v103;
  void *context;
  void *contexta;
  id obj;
  id obja;
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
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(_QWORD, void *, void *))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_78:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupComplementStep.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherPersons"));

    if (v13)
      goto LABEL_4;
    goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupComplementStep.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persons"));

  if (!v12)
    goto LABEL_78;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupComplementStep.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

LABEL_4:
  v83 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupComplementStep.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

  }
  v85 = v11;
  v15 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v15, "unionSet:", v12);
  -[PNPersonDeduperStep delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep personClusterManager](self, "personClusterManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performSocialGroupsIdentifiersWithPersonClusterManager:forPersons:overTheYearsComputation:updateBlock:", v17, v15, 0, v13);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v19 = v15;
  v102 = self;
  v103 = v13;
  v82 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
  v87 = v19;
  if (v82)
  {
    v84 = *(_QWORD *)v129;
    v90 = v12;
    while (2)
    {
      v20 = 0;
      v21 = v13;
      do
      {
        if (*(_QWORD *)v129 != v84)
          objc_enumerationMutation(v19);
        v22 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v20);
        v23 = (void *)MEMORY[0x249506444]();
        if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v21))
        {
LABEL_72:
          v13 = v21;
          objc_autoreleasePoolPop(v23);
          v59 = v19;
          v12 = v90;
          goto LABEL_73;
        }
        v89 = v23;
        v86 = v20;
        v24 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v22, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithObject:", v25);
        obj = (id)objc_claimAutoreleasedReturnValue();

        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v26 = v90;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
        v28 = v22;
        if (v27)
        {
          v29 = v27;
          v30 = *(_QWORD *)v125;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v125 != v30)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
              if (v32 != v28)
              {
                objc_msgSend(v28, "backingAssetIdentifiers");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "backingAssetIdentifiers");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v33, "intersectsSet:", v34);

                if (v35)
                {
                  objc_msgSend(v32, "localIdentifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obj, "addObject:", v36);

                }
              }
            }
            v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
          }
          while (v29);
        }
        v98 = v28;

        self = v102;
        v21 = v103;
        if (objc_msgSend(obj, "count"))
        {
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v37 = v88;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v121;
            v92 = *(_QWORD *)v121;
            v94 = v37;
            while (2)
            {
              v41 = 0;
              v96 = v39;
              do
              {
                if (*(_QWORD *)v121 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v41);
                v43 = (void *)MEMORY[0x249506444]();
                if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v21))
                {
                  objc_autoreleasePoolPop(v43);

                  v19 = v87;
                  v23 = v89;
                  goto LABEL_72;
                }
                context = v43;
                v44 = (void *)objc_msgSend(v42, "mutableCopy");
                objc_msgSend(v44, "intersectSet:", obj);
                v45 = objc_msgSend(v44, "count");
                if (v45 != objc_msgSend(v42, "count"))
                {
                  v46 = vcvtmd_u64_f64((double)(unint64_t)objc_msgSend(v42, "count") * 0.5);
                  v47 = v46 <= 2 ? 2 : v46;
                  if (objc_msgSend(v44, "count") >= v47)
                  {
                    v100 = v41;
                    objc_msgSend(v98, "localIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = (void *)objc_msgSend(v42, "mutableCopy");
                    objc_msgSend(v49, "minusSet:", v44);
                    v118 = 0u;
                    v119 = 0u;
                    v116 = 0u;
                    v117 = 0u;
                    v50 = v49;
                    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
                    v52 = v44;
                    if (v51)
                    {
                      v53 = v51;
                      v54 = *(_QWORD *)v117;
                      do
                      {
                        for (j = 0; j != v53; ++j)
                        {
                          if (*(_QWORD *)v117 != v54)
                            objc_enumerationMutation(v50);
                          v56 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j);
                          objc_msgSend(v18, "objectForKeyedSubscript:", v48);
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v57)
                          {
                            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v18, "setObject:forKeyedSubscript:", v57, v48);
                          }
                          objc_msgSend(v57, "addObject:", v56);
                          objc_msgSend(v18, "objectForKeyedSubscript:", v56);
                          v58 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v58)
                          {
                            objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v18, "setObject:forKeyedSubscript:", v58, v56);
                          }
                          objc_msgSend(v58, "addObject:", v48);

                        }
                        v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
                      }
                      while (v53);
                    }

                    self = v102;
                    v44 = v52;
                    v21 = v103;
                    v40 = v92;
                    v37 = v94;
                    v39 = v96;
                    v41 = v100;
                  }
                }

                objc_autoreleasePoolPop(context);
                ++v41;
              }
              while (v41 != v39);
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
              if (v39)
                continue;
              break;
            }
          }

        }
        objc_autoreleasePoolPop(v89);
        v19 = v87;
        v20 = v86 + 1;
      }
      while (v86 + 1 != v82);
      v13 = v21;
      v12 = v90;
      v82 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
      if (v82)
        continue;
      break;
    }
  }

  v59 = (void *)objc_msgSend(v12, "mutableCopy");
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v60 = v85;
  v95 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
  if (v95)
  {
    v61 = *(_QWORD *)v113;
    v91 = v12;
    v93 = *(_QWORD *)v113;
    v99 = v60;
    v101 = v59;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v113 != v61)
          objc_enumerationMutation(v60);
        v97 = v62;
        v63 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v62);
        contexta = (void *)MEMORY[0x249506444]();
        objc_msgSend(v59, "removeObject:", v63);
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        obja = v59;
        v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v109;
          while (2)
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v109 != v66)
                objc_enumerationMutation(obja);
              v68 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              if (-[PNPersonDeduperStep shouldStop](self, "shouldStop")
                || -[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v13))
              {

                objc_autoreleasePoolPop(contexta);
                v12 = v91;
                v74 = v99;
                v59 = v101;
                goto LABEL_75;
              }
              objc_msgSend(v63, "localIdentifier");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "localIdentifier");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v70, "containsObject:", v71);

              v13 = v103;
              self = v102;
              if (v72)
              {
                v73 = (void *)MEMORY[0x249506444]();
                -[PNPersonDeduperStep addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:](v102, "addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:", v63, v68, v103);
                objc_autoreleasePoolPop(v73);
              }
            }
            v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v108, v132, 16);
            v19 = v87;
            v60 = v99;
            v59 = v101;
            if (v65)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(contexta);
        v62 = v97 + 1;
        v12 = v91;
        v61 = v93;
      }
      while (v97 + 1 != v95);
      v95 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
    }
    while (v95);
  }

  if (-[PNPersonDeduperStep shouldStop](self, "shouldStop"))
  {
LABEL_73:
    v77 = v83;
  }
  else
  {
    -[PNPersonDeduperStep mergeCandidatePersonsWithUpdateBlock:](self, "mergeCandidatePersonsWithUpdateBlock:", v13);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v60, "mutableCopy");
    v76 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v75, "minusSet:", v74);
    objc_msgSend(v76, "minusSet:", v74);
    v83[2](v83, v75, v76);

LABEL_75:
    v77 = v83;
    v19 = v87;
  }

}

@end
