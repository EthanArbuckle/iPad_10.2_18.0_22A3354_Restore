@implementation PNPersonDeduperTimeStep

- (id)name
{
  return CFSTR("Time Deduping");
}

- (id)metricsKey
{
  __CFString *v2;

  v2 = CFSTR("numberOfGraphMergeCandidatesAddedByTimeStep");
  return CFSTR("numberOfGraphMergeCandidatesAddedByTimeStep");
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
    objc_msgSend(v11, "normalMaximumDistance");
  else
    objc_msgSend(v11, "strictMaximumDistance");
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
  void (**v14)(id, id, void *);
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (**v56)(id, id, void *);
  id v57;
  id v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, id, void *))a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperTimeStep.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persons"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_45:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperTimeStep.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

      if (v14)
        goto LABEL_5;
      goto LABEL_46;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperTimeStep.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherPersons"));

  if (!v13)
    goto LABEL_45;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperTimeStep.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultBlock"));

LABEL_5:
  +[PNPersonClusterManager personProcessingSortDescriptors](PNPersonClusterManager, "personProcessingSortDescriptors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingDescriptors:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = objc_msgSend(v11, "count");
  v19 = objc_msgSend(v12, "count");
  if (v18 <= v19)
    v20 = v19;
  else
    v20 = v18;
  v62 = v17;
  if (v20)
  {
    v60 = 0;
    v21 = (float)v20;
    v63 = v16;
    v64 = v15;
    v52 = v20;
    while (1)
    {
      v22 = (void *)objc_msgSend(v17, "mutableCopy");
      v23 = v66;
      if (objc_msgSend(v66, "count"))
      {
        objc_msgSend(v66, "allObjects");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectsInArray:", v24);
        objc_msgSend(v65, "removeObjectsInArray:", v24);

      }
      v61 = v22;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v25 = v65;
      v16 = v63;
      v15 = v64;
      v54 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v54)
      {
        v26 = *(_QWORD *)v72;
        v27 = 0.0;
        v28 = 0.0;
        v57 = v12;
        v58 = v11;
        v56 = v14;
        v59 = v25;
        v53 = *(_QWORD *)v72;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v72 != v26)
            {
              v30 = v29;
              objc_enumerationMutation(v25);
              v29 = v30;
            }
            v55 = v29;
            v31 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v29);
            objc_msgSend(v61, "removeObject:", v31);
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v32 = v61;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v68;
              while (2)
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v68 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
                  v38 = (void *)MEMORY[0x249506444]();
                  *(float *)&v39 = (float)((float)(v28 * v27) + (float)(v21 * (float)v60))
                                 / (float)(v21 * (float)(v60 + 2));
                  -[PNPersonDeduperStep setProgress:](self, "setProgress:", v39);
                  if (-[PNPersonDeduperStep shouldStop](self, "shouldStop")
                    || -[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v13))
                  {
                    objc_autoreleasePoolPop(v38);

                    v12 = v57;
                    v11 = v58;
                    v14 = v56;
                    v16 = v63;
                    v15 = v64;
                    v23 = v66;
                    v45 = v59;
                    goto LABEL_40;
                  }
                  v40 = (void *)MEMORY[0x249506444]();
                  -[PNPersonDeduperStep addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:](self, "addPotentialMergeCandidateForPerson:withOtherPerson:updateBlock:", v31, v37, v13);
                  objc_autoreleasePoolPop(v40);
                  v27 = v27 + 1.0;
                  objc_autoreleasePoolPop(v38);
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
                v12 = v57;
                v11 = v58;
                v14 = v56;
                v23 = v66;
                if (v34)
                  continue;
                break;
              }
            }

            v28 = v28 + 1.0;
            v29 = v55 + 1;
            v16 = v63;
            v15 = v64;
            v17 = v62;
            v25 = v59;
            v26 = v53;
          }
          while (v55 + 1 != v54);
          v41 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
          v26 = v53;
          v54 = v41;
        }
        while (v41);
      }

      if (-[PNPersonDeduperStep shouldStop](self, "shouldStop"))
        break;
      -[PNPersonDeduperStep mergeCandidatePersonsWithUpdateBlock:](self, "mergeCandidatePersonsWithUpdateBlock:", v13);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "count") && !-[PNPersonDeduperStep shouldStop](self, "shouldStop"))
      {
        objc_msgSend(v23, "unionSet:", v42);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v44 = objc_msgSend(v42, "count");
          *(_DWORD *)buf = 136315394;
          v76 = "-[PNPersonDeduperTimeStep dedupePersons:withOtherPersons:updateBlock:resultBlock:]";
          v77 = 2048;
          v78 = v44;
          _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s: Merged %lu persons -------- Re-running.", buf, 0x16u);
        }
        v43 = 1;
      }
      else
      {
        v43 = 0;
      }

      if (v43)
      {
        if (++v60 < v52)
          continue;
      }
      goto LABEL_39;
    }
    v47 = v65;
    v46 = v61;
  }
  else
  {
LABEL_39:
    v32 = (id)objc_msgSend(v11, "mutableCopy");
    v45 = (void *)objc_msgSend(v12, "mutableCopy");
    v23 = v66;
    objc_msgSend(v32, "minusSet:", v66);
    objc_msgSend(v45, "minusSet:", v66);
    v14[2](v14, v32, v45);
LABEL_40:

    v46 = v32;
    v17 = v62;
    v47 = v65;
  }

}

@end
