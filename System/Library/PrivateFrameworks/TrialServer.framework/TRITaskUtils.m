@implementation TRITaskUtils

+ (void)addAttribution:(id)a3 toTaskTags:(id)a4
{
  id v7;
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
  id v19;

  v19 = a3;
  v7 = a4;
  if (v19)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRITaskUtils.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tags"));

    }
    objc_msgSend(v19, "teamIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v19, "teamIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("teamId=%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "networkOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("netopt.cellular=%d"), objc_msgSend(v13, "allowsCellularAccess"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "networkOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("netopt.discretion=%lu"), objc_msgSend(v16, "discretionaryBehavior"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v17);

  }
}

+ (id)_experimentStateForAnalyticsFromInternalState:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];
  _QWORD v9[9];

  v3 = a3;
  v9[8] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E9363B10;
  v8[1] = &unk_1E9363B28;
  v9[0] = CFSTR("exp_st_AL");
  v9[1] = CFSTR("exp_st_FE");
  v8[2] = &unk_1E9363B40;
  v8[3] = &unk_1E9363B58;
  v9[2] = CFSTR("exp_st_AC");
  v9[3] = CFSTR("exp_st_DE");
  v8[4] = &unk_1E9363B70;
  v8[5] = &unk_1E9363B88;
  v9[4] = CFSTR("exp_st_AL_F");
  v9[5] = CFSTR("exp_st_FE_F");
  v8[6] = &unk_1E9363BA0;
  v8[7] = &unk_1E9363BB8;
  v9[6] = CFSTR("exp_st_AC_F");
  v9[7] = CFSTR("exp_st_DE_F");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 context:(id)a9
{
  return objc_msgSend(a1, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:categoricalMetric:context:", a3, a4, a5, *(_QWORD *)&a6, a7, a8, 0, a9);
}

+ (BOOL)updateExperimentHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forExperiment:(id)a4 treatment:(id)a5 deployment:(int)a6 experimentRecord:(id)a7 isBecomingObsolete:(BOOL)a8 categoricalMetric:(id)a9 context:(id)a10
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __CFString *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  int v59;
  NSObject *v60;
  void *v61;
  void *v62;
  char v63;
  NSObject *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  __CFString *v81;
  __CFString *v82;
  char v83;
  NSObject *v84;
  void *v86;
  _BOOL4 log;
  NSObject *loga;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  unsigned int v97;
  id v98;
  unsigned int v99;
  NSObject *v100;
  id v101;
  uint64_t v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  void *v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  _BYTE v112[20];
  _BYTE v113[6];
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  _QWORD v118[2];
  _QWORD v119[2];
  _BYTE v120[128];
  uint64_t v121;

  log = a8;
  v99 = a3;
  v121 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a9;
  v101 = a10;
  v17 = v13;
  v18 = v14;
  v19 = v18;
  v98 = v15;
  if (v15)
  {
    v20 = (uint64_t)v17;
    if (!v17)
    {
      objc_msgSend(v15, "experimentDeployment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "experimentId");
      v20 = objc_claimAutoreleasedReturnValue();

    }
    v22 = (uint64_t)v19;
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("unspecified-or-default-treatment")))
    {
      objc_msgSend(v15, "treatmentId");
      v22 = objc_claimAutoreleasedReturnValue();

    }
    v102 = v20;
    v89 = v19;
    v91 = v16;
    v93 = v17;
    if (a6 == -1)
    {
      objc_msgSend(v15, "experimentDeployment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      a6 = objc_msgSend(v23, "deploymentId");

    }
    v97 = a6;
    v96 = objc_msgSend(v15, "deploymentEnvironment");
    v24 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "namespaces");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend(v15, "namespaces");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v105 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          v33 = objc_alloc(MEMORY[0x1E0DC0BB0]);
          objc_msgSend(v32, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v33, "initWithName:compatibilityVersion:", v34, objc_msgSend(v32, "compatibilityVersion"));

          objc_msgSend(v26, "addObject:", v35);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      }
      while (v29);
    }

    v16 = v91;
    v17 = v93;
    v19 = v89;
    v36 = (id)v102;
  }
  else
  {
    v97 = a6;
    v26 = 0;
    v96 = 0;
    v22 = (uint64_t)v18;
    v36 = v17;
  }
  v37 = v101;
  v103 = v36;
  if (v36)
  {
    if (v22)
      v38 = (__CFString *)v22;
    else
      v38 = CFSTR("unspecified-or-default-treatment");
    v39 = objc_alloc(MEMORY[0x1E0DC0A40]);
    v40 = (void *)objc_opt_new();
    v41 = objc_msgSend(v39, "initWithEventDate:eventType:deploymentEnvironment:experimentId:deploymentId:treatmentId:errorOrDeactivationReason:namespaces:", v40, v99, v96, v36, v97, v38, 0, v26);

    v42 = v41;
    objc_msgSend(v101, "experimentHistoryDatabase");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "getAllAllocationStatusesForExperimentId:deploymentId:treatmentId:", v36, v97, v38);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v101, "experimentHistoryDatabase");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "addRecord:", v42);

    if ((v45 & 1) == 0)
    {
      TRILogCategory_Server();
      v60 = objc_claimAutoreleasedReturnValue();
      v46 = v98;
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
LABEL_57:

        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x1E0DC0988], "categoricalValueForExperimentAllocationStatus:", v99);
      loga = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v110 = (uint64_t)v61;
      v111 = 2112;
      *(_QWORD *)v112 = v38;
      *(_WORD *)&v112[8] = 2114;
      *(_QWORD *)&v112[10] = v103;
      *(_WORD *)&v112[18] = 1024;
      *(_DWORD *)v113 = v97;
      _os_log_error_impl(&dword_1D207F000, loga, OS_LOG_TYPE_ERROR, "Failed to update experiment history database while marking %{public}@ of treatment %@ : experiment %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x26u);

LABEL_38:
      v60 = loga;
      goto LABEL_57;
    }
    v83 = v45;
    v46 = v98;
    v84 = v42;
    if (log)
    {
      v47 = v95;
      if (!objc_msgSend(v95, "count"))
      {
        loga = 0;
        goto LABEL_36;
      }
      v118[0] = &unk_1E9363B10;
      v116 = &unk_1E9363B58;
      v117 = CFSTR("exp_st_AL_O");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v81 = v38;
      v48 = v19;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = &unk_1E9363B28;
      v119[0] = v49;
      v114 = &unk_1E9363B58;
      v115 = CFSTR("exp_st_FE_O");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
      v50 = v16;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v119[1] = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v50;
      objc_msgSend(v95, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v99);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKey:", v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v19 = v48;
      v38 = v81;
      if (!v56)
      {
        TRILogCategory_Server();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v95, "objectAtIndexedSubscript:", 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "intValue");
          *(_DWORD *)buf = 138413314;
          v110 = (uint64_t)v103;
          v111 = 2112;
          *(_QWORD *)v112 = v81;
          *(_WORD *)&v112[8] = 1024;
          *(_DWORD *)&v112[10] = v97;
          *(_WORD *)&v112[14] = 1024;
          *(_DWORD *)&v112[16] = v59;
          *(_WORD *)v113 = 1024;
          *(_DWORD *)&v113[2] = v99;
          _os_log_impl(&dword_1D207F000, v57, OS_LOG_TYPE_DEFAULT, "Experiment - Treatment - Deployment: %@ - %@ - %d. Previous state: %d, Current state: %d", buf, 0x28u);

        }
      }
      loga = v56;

      v37 = v101;
    }
    else
    {
      loga = 0;
    }
    v47 = v95;
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v99);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v47, "containsObject:", v62);

    if ((v63 & 1) == 0)
    {
      if (loga)
      {
        v64 = loga;
      }
      else
      {
        objc_msgSend(a1, "_experimentStateForAnalyticsFromInternalState:", v99);
        v64 = objc_claimAutoreleasedReturnValue();
        v42 = v84;
        if (!v64)
        {
          v60 = 0;
          v45 = v83;
          goto LABEL_57;
        }
      }
      v90 = v19;
      v100 = v64;
      if (v16)
        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", v64, v16);
      else
        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v64);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_opt_new();
      objc_msgSend(v65, "ensureExperimentFields");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setClientExperimentId:", v103);

      if (v38 == CFSTR("unspecified-or-default-treatment"))
        v67 = 0;
      else
        v67 = v38;
      objc_msgSend(v65, "ensureExperimentFields");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setClientTreatmentId:", v67);

      if (v97 == -1)
      {
        v69 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v94 = v17;
      objc_msgSend(v69, "stringValue");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setClientDeploymentId:", v70);

      if (v97 != -1)
      v82 = v38;
      v92 = v16;
      TRIDeploymentEnvironment_EnumDescriptor();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "textFormatNameForValue:", v96);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)v96);
      objc_msgSend(v65, "setClientDeploymentEnv:", v72);
      v37 = v101;
      objc_msgSend(v101, "client");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "logger");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "client");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "trackingId");
      v76 = v65;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v77, v78, 0, v76);

      v16 = v92;
      v17 = v94;
      v60 = loga;
      v19 = v90;
      v38 = v82;
      v42 = v84;
      v45 = v83;
      v46 = v98;
      goto LABEL_57;
    }
    v42 = v84;
    v45 = v83;
    goto LABEL_38;
  }
  TRILogCategory_Server();
  v42 = objc_claimAutoreleasedReturnValue();
  v46 = v98;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0DC0988], "categoricalValueForExperimentAllocationStatus:", v99);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = (__CFString *)v22;
    v110 = v22;
    v111 = 1024;
    *(_DWORD *)v112 = v97;
    *(_WORD *)&v112[4] = 2114;
    *(_QWORD *)&v112[6] = v80;
    _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "ExperimentID was found to be empty while creating a record for the Experiment History Database. Treatment %@ : Deployment %d; Allocation Status: %{public}@",
      buf,
      0x1Cu);

  }
  else
  {
    v38 = (__CFString *)v22;
  }
  v45 = 0;
LABEL_58:

  return v45;
}

+ (id)_rolloutStateForAnalyticsFromInternalState:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];
  _QWORD v9[9];

  v3 = a3;
  v9[8] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E9363B10;
  v8[1] = &unk_1E9363B40;
  v9[0] = CFSTR("roll_st_AL");
  v9[1] = CFSTR("roll_st_FE");
  v8[2] = &unk_1E9363B58;
  v8[3] = &unk_1E9363B28;
  v9[2] = CFSTR("roll_st_AC");
  v9[3] = CFSTR("roll_st_DE");
  v8[4] = &unk_1E9363BD0;
  v8[5] = &unk_1E9363B70;
  v9[4] = CFSTR("roll_st_AL_F");
  v9[5] = CFSTR("roll_st_FE_F");
  v8[6] = &unk_1E9363B88;
  v8[7] = &unk_1E9363BA0;
  v9[6] = CFSTR("roll_st_AC_F");
  v9[7] = CFSTR("roll_st_DE_F");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)updateRolloutHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forRollout:(id)a4 ramp:(id)a5 deployment:(int)a6 fps:(id)a7 namespaces:(id)a8 telemetryMetric:(id)a9 rolloutRecord:(id)a10 isBecomingObsolete:(BOOL)a11 context:(id)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  unint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  unsigned int v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  int v100;
  uint64_t v101;

  v77 = a3;
  v101 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a12;
  v22 = v15;
  v23 = v16;
  v24 = v17;
  v25 = v23;
  if (v17)
  {
    TRIValidateFactorPackSetId();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
  }
  v26 = v18;
  v79 = v26;
  if (!v20)
  {
    v32 = v26;
    v82 = v25;
    v27 = v22;
    if (!v22)
      goto LABEL_44;
LABEL_18:
    v74 = v25;
    v35 = v24;
    v36 = objc_alloc(MEMORY[0x1E0DC0B70]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v32;
    v38 = objc_msgSend(v36, "initWithEventLogTime:eventType:rolloutId:rampId:factorPackSetId:deploymentId:namespaces:", v37, v77, v27, v82, v83, a6, v32);

    objc_msgSend(v21, "rolloutHistoryDatabase");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "getAllAllocationStatusesForRolloutId:rampId:deploymentId:factorPackSetId:", v27, v82, a6, v83);
    v40 = v21;
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = v40;
    objc_msgSend(v40, "rolloutHistoryDatabase");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)v38;
    LOBYTE(v40) = objc_msgSend(v42, "addRecord:", v38);

    if ((v40 & 1) == 0)
    {
      TRILogCategory_Server();
      v43 = objc_claimAutoreleasedReturnValue();
      v24 = v35;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0DC0988], "categoricalValueForRolloutAllocationStatus:", v77);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v92 = v67;
        v93 = 2112;
        v94 = v83;
        v95 = 2114;
        v96 = v27;
        v97 = 2114;
        v98 = v82;
        v99 = 1024;
        v100 = a6;
        _os_log_error_impl(&dword_1D207F000, v43, OS_LOG_TYPE_ERROR, "Failed to update rollout history database while marking %{public}@ of fps %@ : rollout %{public}@ : ramp %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x30u);

      }
      v25 = v74;
      goto LABEL_43;
    }
    v68 = v22;
    v69 = v35;
    v43 = objc_opt_new();
    if (objc_msgSend(v41, "count"))
    {
      v44 = 0;
      do
      {
        objc_msgSend(v41, "objectAtIndexedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(&unk_1E9363750, "containsObject:", v45);

        if ((v46 & 1) != 0)
          break;
        objc_msgSend(v41, "objectAtIndexedSubscript:", v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v43, "addObject:", v47);

        ++v44;
      }
      while (objc_msgSend(v41, "count") > v44);
    }
    if (v19)
    {
      v24 = v35;
      v32 = v73;
      v25 = v74;
    }
    else
    {
      v24 = v35;
      v32 = v73;
      v25 = v74;
      if (a11)
      {
        if (-[NSObject count](v43, "count"))
        {
          v87 = &unk_1E9363B28;
          v88 = CFSTR("roll_st_AL_O");
          v89[0] = &unk_1E9363B10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = v48;
          v89[1] = &unk_1E9363B40;
          v85 = &unk_1E9363B28;
          v86 = CFSTR("roll_st_FE_O");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v90[1] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject objectAtIndexedSubscript:](v43, "objectAtIndexedSubscript:", 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectForKeyedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v77);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKey:", v52);
          v19 = (id)objc_claimAutoreleasedReturnValue();

          v32 = v73;
          v24 = v69;
          v25 = v74;
        }
        else
        {
          v19 = 0;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v77);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[NSObject containsObject:](v43, "containsObject:", v53);

    if ((v54 & 1) != 0)
    {
      v22 = v68;
LABEL_43:

      v21 = v72;
      goto LABEL_44;
    }
    if (v19)
    {
      v55 = v19;
    }
    else
    {
      objc_msgSend(a1, "_rolloutStateForAnalyticsFromInternalState:", v77);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v68;
      if (!v55)
      {
        v19 = 0;
        goto LABEL_43;
      }
    }
    v78 = v55;
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_opt_new();
    objc_msgSend(v57, "ensureRolloutFields");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setClientRolloutId:", v27);

    objc_msgSend(v57, "ensureRolloutFields");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setClientRampId:", v82);

    objc_msgSend(v57, "ensureRolloutFields");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setClientFactorPackSetId:", v83);

    if (a6 == -1)
    {
      v61 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v76 = v19;
    objc_msgSend(v61, "stringValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setClientDeploymentId:", v62);

    if (a6 != -1)
    objc_msgSend(v72, "client");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "logger");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "client");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "trackingId");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v65, v66, 0, v57);

    v22 = v68;
    v24 = v69;
    v25 = v74;
    v19 = v76;
    v32 = v73;
    goto LABEL_43;
  }
  v27 = v22;
  if (!v22)
  {
    objc_msgSend(v20, "deployment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rolloutId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v82 = v25;
  if (!v25)
  {
    objc_msgSend(v20, "rampId");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!a6)
  {
    objc_msgSend(v20, "deployment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    a6 = objc_msgSend(v29, "deploymentId");

  }
  if (!v83)
  {
    objc_msgSend(v20, "activeFactorPackSetId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v20, "activeFactorPackSetId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackSetId();
      v83 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v83 = 0;
    }
  }
  v33 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v20, "namespaces");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrayWithArray:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    goto LABEL_18;
LABEL_44:

}

+ (id)_bmltStateForAnalyticsFromStatusType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[10];
  _QWORD v9[11];

  v3 = a3;
  v9[10] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E9363B40;
  v8[1] = &unk_1E9363B58;
  v9[0] = CFSTR("bmlt_st_AL_F");
  v9[1] = CFSTR("bmlt_st_AL");
  v8[2] = &unk_1E9363BD0;
  v8[3] = &unk_1E9363B70;
  v9[2] = CFSTR("bmlt_st_FE_F");
  v9[3] = CFSTR("bmlt_st_FE");
  v8[4] = &unk_1E9363B88;
  v8[5] = &unk_1E9363BA0;
  v9[4] = CFSTR("bmlt_st_AC_F");
  v9[5] = CFSTR("bmlt_st_AC");
  v8[6] = &unk_1E9363BB8;
  v8[7] = &unk_1E9363BE8;
  v9[6] = CFSTR("bmlt_st_DE_F");
  v9[7] = CFSTR("bmlt_st_DE");
  v8[8] = &unk_1E9363C00;
  v8[9] = &unk_1E9363C18;
  v9[8] = CFSTR("bmlt_st_AL_O");
  v9[9] = CFSTR("bmlt_st_FE_O");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)updateBMLTHistoryDatabaseWithAllocationStatus:(unsigned __int8)a3 forBMLT:(id)a4 deployment:(int)a5 fps:(id)a6 bmltRecord:(id)a7 context:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  unsigned int v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v11 = *(_QWORD *)&a5;
  v12 = a3;
  v67 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v14;
  if (v15)
  {
    TRIValidateFactorPackSetId();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = v18;
  if (!v16)
    goto LABEL_13;
  if (v18)
  {
    if ((_DWORD)v11)
      goto LABEL_7;
LABEL_10:
    objc_msgSend(v16, "bmltDeployment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v22, "deploymentId");

    if (v19)
      goto LABEL_13;
    goto LABEL_11;
  }
  objc_msgSend(v16, "bmltDeployment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "backgroundMLTaskId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v11)
    goto LABEL_10;
LABEL_7:
  if (v19)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(v16, "activeFactorPackSetId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v19 = 0;
    if (!v20)
      goto LABEL_33;
LABEL_14:
    v50 = a1;
    v54 = v18;
    v55 = v15;
    v25 = objc_alloc(MEMORY[0x1E0DC09B8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v12;
    v56 = (void *)objc_msgSend(v25, "initWithEventDate:eventType:backgroundMLTaskId:deploymentId:factorPackSetId:", v26, v12, v20, v11, v19);

    v57 = v17;
    objc_msgSend(v17, "bmltHistoryDatabase");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getAllAllocationStatusesForBMLTId:deploymentId:factorPackSetId:", v20, v11, v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_opt_new();
    if (objc_msgSend(v28, "count"))
    {
      v30 = 0;
      do
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(&unk_1E9363768, "containsObject:", v31);

        if ((v32 & 1) != 0)
          break;
        objc_msgSend(v28, "objectAtIndexedSubscript:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v33);

        ++v30;
      }
      while (objc_msgSend(v28, "count") > v30);
    }
    objc_msgSend(v57, "bmltHistoryDatabase");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "addRecord:", v56);

    if ((v35 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v52);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v29, "containsObject:", v36);

      if ((v37 & 1) != 0)
      {
LABEL_32:

        v18 = v54;
        v15 = v55;
        v17 = v57;
        goto LABEL_33;
      }
      objc_msgSend(v50, "_bmltStateForAnalyticsFromStatusType:", v52);
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", v38);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_opt_new();
        objc_msgSend(v39, "ensureBMLTFields");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setClientBmltId:", v20);

        objc_msgSend(v39, "ensureBMLTFields");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setClientBmltFactorPackSetId:", v19);

        if ((_DWORD)v11 == -1)
        {
          v42 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v42, "stringValue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v39;
        objc_msgSend(v39, "setClientDeploymentId:", v44);

        if ((_DWORD)v11 != -1)
        objc_msgSend(v57, "client");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logger");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "client");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "trackingId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v46, v47, 0, v51);

      }
    }
    else
    {
      TRILogCategory_Server();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v50, "_bmltStateForAnalyticsFromStatusType:", v52);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v43;
        v61 = 2112;
        v62 = v19;
        v63 = 2114;
        v64 = v20;
        v65 = 1024;
        v66 = v11;
        _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "Failed to update BMLT history database while marking %{public}@ of fps %@ : bmlt %{public}@ : deployment %d. Note: this allocation status will not be logged to analytics.", buf, 0x26u);

      }
    }

    goto LABEL_32;
  }
  objc_msgSend(v16, "activeFactorPackSetId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateFactorPackSetId();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  if (v20)
    goto LABEL_14;
LABEL_33:

}

@end
