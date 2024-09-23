@implementation PNPersonDeduperSocialGroupTimeWarpingStep

- (id)name
{
  return CFSTR("Social Group Time Warping");
}

- (id)metricsKey
{
  __CFString *v2;

  v2 = CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupTimeWarpingStep");
  return CFSTR("numberOfGraphMergeCandidatesAddedBySocialGroupTimeWarpingStep");
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  PNPersonDeduperSocialGroupTimeWarpingStep *v27;
  id v28;
  void (**v29)(void *, void *, void *);
  unint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  void *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  SEL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  void *context;
  void (**v70)(_QWORD, _QWORD, _QWORD);
  void *v71;
  void *v72;
  unint64_t v73;
  id obj;
  PNPersonDeduperSocialGroupTimeWarpingStep *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD aBlock[4];
  id v86;
  PNPersonDeduperSocialGroupTimeWarpingStep *v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_45:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupTimeWarpingStep.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherPersons"));

    if (v13)
      goto LABEL_4;
    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupTimeWarpingStep.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("verifiedPersons"));

  if (!v12)
    goto LABEL_45;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupTimeWarpingStep.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

LABEL_4:
  v70 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperSocialGroupTimeWarpingStep.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

  }
  v62 = a2;
  v71 = v12;
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = self;
  -[PNPersonDeduperStep personClusterManager](self, "personClusterManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performSocialGroupsIdentifiersWithPersonClusterManager:forPersons:overTheYearsComputation:updateBlock:", v17, v15, 1, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v20 = v15;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v91 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v25, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
    }
    while (v22);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PNPersonDeduperSocialGroupTimeWarpingStep_dedupePersons_withOtherPersons_updateBlock_resultBlock___block_invoke;
  aBlock[3] = &unk_251480398;
  v68 = v19;
  v27 = v75;
  v86 = v68;
  v87 = v75;
  v76 = v13;
  v89 = v76;
  v28 = v11;
  v88 = v28;
  v29 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v30 = objc_msgSend(v18, "count");
  v31 = (void *)objc_msgSend(v18, "mutableCopy");
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v32 = v18;
  v64 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
  v72 = v31;
  if (v64)
  {
    v73 = 0;
    v33 = *(_QWORD *)v82;
    v34 = (float)v30;
    v66 = v32;
    v67 = v28;
    v63 = *(_QWORD *)v82;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v82 != v33)
          objc_enumerationMutation(v32);
        v65 = v35;
        v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v35);
        context = (void *)MEMORY[0x249506444]();
        *(float *)&v37 = (float)v73 / v34;
        -[PNPersonDeduperStep setProgress:](v27, "setProgress:", v37);
        objc_msgSend(v31, "removeObject:", v36);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        obj = v31;
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v78;
          while (2)
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v78 != v40)
                objc_enumerationMutation(obj);
              v42 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
              if (-[PNPersonDeduperStep shouldStop](v27, "shouldStop")
                || -[PNPersonDeduperStep shouldStopWithUpdateBlock:](v27, "shouldStopWithUpdateBlock:", v76))
              {

                objc_autoreleasePoolPop(context);
                v32 = v66;
                v28 = v67;
                v53 = v66;
                goto LABEL_42;
              }
              v43 = (void *)objc_msgSend(v36, "mutableCopy");
              objc_msgSend(v43, "intersectSet:", v42);
              v44 = objc_msgSend(v36, "count");
              v45 = objc_msgSend(v42, "count");
              if (v44 >= v45)
                v46 = v45;
              else
                v46 = v44;
              v47 = vcvtmd_u64_f64((double)v46 * 0.5);
              if (v47 <= 2)
                v48 = 2;
              else
                v48 = v47;
              if (objc_msgSend(v43, "count") >= v48)
              {
                v49 = (void *)MEMORY[0x249506444]();
                v50 = (void *)objc_msgSend(v36, "mutableCopy");
                objc_msgSend(v50, "minusSet:", v43);
                v29[2](v29, v50, v42);
                v51 = (void *)objc_msgSend(v42, "mutableCopy");

                objc_msgSend(v51, "minusSet:", v43);
                v29[2](v29, v51, v36);

                objc_autoreleasePoolPop(v49);
              }

              v27 = v75;
            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
            v32 = v66;
            v28 = v67;
            if (v39)
              continue;
            break;
          }
        }
        ++v73;

        objc_autoreleasePoolPop(context);
        v35 = v65 + 1;
        v31 = v72;
        v33 = v63;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
    }
    while (v64);
  }

  v52 = v71;
  if (!-[PNPersonDeduperStep shouldStop](v27, "shouldStop"))
  {
    -[PNPersonDeduperStep mergeCandidatePersonsWithUpdateBlock:](v27, "mergeCandidatePersonsWithUpdateBlock:", v76);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v28, "mutableCopy");
    if (objc_msgSend(v54, "intersectsSet:", v53))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v60 = v32;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", v62, v27, CFSTR("PNPersonDeduperSocialGroupTimeWarpingStep.m"), 139, CFSTR("Cannot dedup verified persons"));

      v32 = v60;
    }
    v55 = (void *)objc_msgSend(v71, "mutableCopy");
    objc_msgSend(v55, "minusSet:", v53);
    ((void (**)(_QWORD, void *, void *))v70)[2](v70, v54, v55);

LABEL_42:
    v52 = v71;
  }

}

void __100__PNPersonDeduperSocialGroupTimeWarpingStep_dedupePersons_withOtherPersons_updateBlock_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v8 = *(_QWORD *)v27;
    v21 = v6;
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v6;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              if ((objc_msgSend(*(id *)(a1 + 40), "shouldStop") & 1) != 0
                || (objc_msgSend(*(id *)(a1 + 40), "shouldStopWithUpdateBlock:", *(_QWORD *)(a1 + 56)) & 1) != 0)
              {

                v6 = v21;
                goto LABEL_22;
              }
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10)
                || (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v17) & 1) == 0)
              {
                v18 = (void *)MEMORY[0x249506444]();
                objc_msgSend(*(id *)(a1 + 40), "addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:", v10, v17, *(_QWORD *)(a1 + 56));
                objc_autoreleasePoolPop(v18);
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            v6 = v21;
            v8 = v19;
            if (v13)
              continue;
            break;
          }
        }

      }
      v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }
LABEL_22:

}

@end
