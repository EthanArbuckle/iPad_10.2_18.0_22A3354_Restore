@implementation TRIMakeDefaultTask

- (int)taskType
{
  return 10;
}

- (TRIMakeDefaultTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v11;
  TRIMakeDefaultTask *v12;
  TRIMakeDefaultTask *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TRIMakeDefaultTask;
  v12 = -[TRIActivateTreatmentBaseTask initWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:](&v15, sel_initWithExperiment_treatmentId_taskAttributing_requiresTreatmentInstallation_, a3, a4, a5, 1);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_capabilityModifier, a6);

  return v13;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v13, v12, v11, v10);

  return v14;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 3)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "failed to activate treatment id %@", buf, 0xCu);

    }
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deploymentId");
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v6, v8, 1, 9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v11;
}

- (NSArray)dependencies
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[TRIMakeDefaultTask testingIgnoreDependencies](self, "testingIgnoreDependencies"))
    return (NSArray *)0;
  v4 = -[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](self, "requiresTreatmentInstallation");
  if (v4)
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v7 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchTreatmentTask taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:](TRIFetchTreatmentTask, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v5, v6, v7, self->_capabilityModifier);
  }
  else
  {
    v7 = TRIFetchExperimentTask;
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchExperimentTask taskWithExperimentDeployment:taskAttributing:](TRIFetchExperimentTask, "taskWithExperimentDeployment:taskAttributing:", v5, v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v8 = v7;
  }

  return (NSArray *)v9;
}

- (int)makeDefaultForNamespace:(id)a3 experiment:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  TRIClientTreatmentStorage *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  void *v25;
  TRIFBClientTreatmentStorage *v26;
  TRIMakeDefaultTask *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *p_super;
  TRIMakeDefaultTask *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  TRIMakeDefaultTask *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  uint64_t v88;
  char v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  char v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  char v128;
  NSObject *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  const char *v142;
  void *v144;
  void *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  id v170;
  TRIMakeDefaultTask *v171;
  void *v172;
  void *v173;
  void *v174;
  NSObject *log;
  id v176;
  SEL v177;
  void *v178;
  void *v179;
  NSObject *v180;
  unsigned int v181;
  void *v182;
  TRIClientTreatmentStorage *v183;
  NSObject *v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD v190[5];
  id v191;
  id v192;
  char v193;
  char v194;
  uint8_t v195[128];
  uint8_t buf[4];
  void *v197;
  __int16 v198;
  void *v199;
  __int16 v200;
  _BYTE v201[14];
  __int16 v202;
  int v203;
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "namespaceDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dynamicNamespaceRecordWithNamespaceName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "appContainer");
    v184 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "cloudKitContainer");
    objc_msgSend(v11, "paths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathsForContainer:asClientProcess:", v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v18;
    if (!v18)
    {
      TRILogCategory_Server();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "appContainer");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "identifier");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v197 = v145;
        _os_log_error_impl(&dword_1D207F000, p_super, OS_LOG_TYPE_ERROR, "Unable to MakeDefault into missing app container: %{public}@", buf, 0xCu);

        v19 = 0;
      }
      v42 = 3;
      v40 = v184;
      goto LABEL_87;
    }
    v181 = v15;
    v20 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v18);
    v194 = 0;
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v20;
    -[TRIClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](v20, "loadTreatmentWithTreatmentId:isFilePresent:", v21, &v194);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      v176 = v9;
      v23 = a2;
      v24 = v10;
      v25 = v19;
      v26 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v19);
      v193 = 0;
      v27 = self;
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v28 = v22;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFBClientTreatmentStorage loadTreatmentWithTreatmentId:isFilePresent:](v26, "loadTreatmentWithTreatmentId:isFilePresent:", v29, &v193);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v28;
      if ((objc_msgSend(v28, "isEqual:", v30) & 1) == 0)
      {
        TRILogCategory_Server();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v197 = v30;
          v198 = 2112;
          v199 = v28;
          _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "TRIMakeDefaultTask: Treatment from flatbuffers: %@ does not match treatment from protobufs: %@", buf, 0x16u);
        }

        v22 = v28;
      }
      if (_os_feature_enabled_impl())
      {
        v32 = v30;
        v33 = v22;
        v22 = v32;

        v194 = v193;
      }
      self = v27;

      v19 = v25;
      v10 = v24;
      a2 = v23;
      v9 = v176;
    }
    v182 = v22;
    if (!v22)
    {
      if (v194)
      {
        v42 = 0;
        p_super = &v183->super;
        v40 = v184;
LABEL_86:

LABEL_87:
        goto LABEL_88;
      }
      v64 = self;
      TRILogCategory_Server();
      v65 = objc_claimAutoreleasedReturnValue();
      p_super = &v183->super;
      v40 = v184;
      v180 = v65;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        -[TRITreatmentBaseTask treatmentId](v64, "treatmentId");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v197 = v153;
        _os_log_error_impl(&dword_1D207F000, v65, OS_LOG_TYPE_ERROR, "TRIClientTreatment not present for treatmentId %@", buf, 0xCu);

      }
      v42 = 0;
LABEL_85:

      goto LABEL_86;
    }
    if (!objc_msgSend(v22, "factorLevelArray_Count"))
    {
      v44 = self;
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      p_super = &v183->super;
      v40 = v184;
      v180 = v45;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        -[TRITreatmentBaseTask treatmentId](v44, "treatmentId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](v44, "experiment");
        v47 = v19;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v197 = v46;
        v198 = 2114;
        v199 = v48;
        _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "treatment %@ of rollout %{public}@ has no factors defined", buf, 0x16u);

        v19 = v47;
      }
      v42 = 2;
      goto LABEL_85;
    }
    v177 = a2;
    v185 = v11;
    v34 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(v9, "name");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v19;
    v37 = (void *)v35;
    v179 = v36;
    objc_msgSend(v36, "namespaceDescriptorsExperimentDir");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "loadWithNamespaceName:fromDirectory:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v171 = self;
    if (v39)
    {
      v180 = 0;
      log = v39;
    }
    else
    {
      objc_msgSend(v11, "experimentDatabase");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "experimentDeployment");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "treatmentURLsForExperimentDeployment:usingTransaction:", v50, 0);
      v51 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "name");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v51, "objectForKeyedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v180 = v51;
      if (!v53)
      {
        TRILogCategory_Server();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](self, "experiment");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          TRILoggedNamespaceName(v156);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v197 = v154;
          v198 = 2114;
          v199 = v155;
          v200 = 2114;
          *(_QWORD *)v201 = v157;
          _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "cannot set default to treatment %@ of experiment %{public}@: missing experiment namespace descriptor for namespace %{public}@", buf, 0x20u);

        }
        v42 = 0;
        v40 = v184;
        v19 = v179;
        p_super = &v183->super;
        goto LABEL_84;
      }
      v54 = (void *)objc_opt_new();
      objc_msgSend(v54, "setFactorsURL:", v53);
      objc_msgSend(v54, "setAppContainer:", v184);
      objc_msgSend(v54, "setCloudKitContainerId:", v181);
      v55 = objc_alloc(MEMORY[0x1E0DC0AD8]);
      objc_msgSend(v9, "name");
      v56 = v14;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      log = objc_msgSend(v55, "initWithNamespaceName:downloadNCV:optionalParams:", v57, objc_msgSend(v9, "compatibilityVersion"), v54);

      v14 = v56;
    }
    v58 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(v9, "name");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "namespaceDescriptorsRolloutDir");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "loadWithNamespaceName:fromDirectory:", v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = v61;
    v169 = v39;
    if (v61)
    {
      v63 = objc_msgSend(v61, "downloadNCV");
      if (v63 == objc_msgSend(v9, "compatibilityVersion"))
      {
        v40 = v184;
        goto LABEL_53;
      }
      TRILogCategory_Server();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](v171, "experiment");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v9, "compatibilityVersion");
        objc_msgSend(v9, "name");
        v82 = v14;
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        TRILoggedNamespaceName(v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v61, "downloadNCV");
        *(_DWORD *)buf = 138413314;
        v197 = v79;
        v198 = 2114;
        v199 = v80;
        v200 = 1024;
        *(_DWORD *)v201 = v81;
        *(_WORD *)&v201[4] = 2114;
        *(_QWORD *)&v201[6] = v84;
        v202 = 1024;
        v203 = v85;
        _os_log_impl(&dword_1D207F000, v78, OS_LOG_TYPE_DEFAULT, "cannot set default to treatment %@ of experiment %{public}@: incompatible version %u for namespace %{public}@ (current is %u)", buf, 0x2Cu);

        v14 = v82;
        v62 = v61;

      }
      v19 = v179;
      objc_msgSend(v179, "namespaceDescriptorsRolloutDir");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "removeFromDirectory:", v86);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "factorsAbsolutePathAsOwner:", 0);
      v88 = objc_claimAutoreleasedReturnValue();
      v40 = v184;
      v174 = (void *)v88;
      if (v88)
      {
        v192 = 0;
        v89 = objc_msgSend(v87, "triRemoveDirectoryForPath:isDirectory:error:", v88, 0, &v192);
        v170 = v192;
        if ((v89 & 1) == 0)
        {
          v172 = v62;
          v173 = v87;
          TRILogCategory_Server();
          v138 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          {
            -[TRITreatmentBaseTask treatmentId](v171, "treatmentId");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIExperimentBaseTask experiment](v171, "experiment");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            TRILoggedNamespaceName(v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v197 = v160;
            v198 = 2114;
            v199 = v161;
            v200 = 2114;
            *(_QWORD *)v201 = v163;
            _os_log_error_impl(&dword_1D207F000, v138, OS_LOG_TYPE_ERROR, "cannot set default to treatment %@ of experiment %{public}@: failed to clean up treatment with previous compatibility version for namespace %{public}@", buf, 0x20u);

            v19 = v179;
            v40 = v184;
          }
          v42 = 0;
          v11 = v185;
LABEL_99:
          v102 = v170;
          goto LABEL_82;
        }
        v90 = v87;
      }
      else
      {
        v90 = v87;
        v170 = 0;
      }
      objc_msgSend(v62, "factorsURL");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v62;
      v97 = (void *)objc_opt_new();
      objc_msgSend(v97, "setFactorsURL:", v95);
      objc_msgSend(v97, "setAppContainer:", v184);
      objc_msgSend(v97, "setCloudKitContainerId:", v181);
      v98 = objc_alloc(MEMORY[0x1E0DC0AD8]);
      objc_msgSend(v9, "name");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v98, "initWithNamespaceName:downloadNCV:optionalParams:", v99, objc_msgSend(v9, "compatibilityVersion"), v97);

      v67 = v90;
      v91 = v170;
      v93 = v174;
LABEL_52:

      v62 = (void *)v94;
LABEL_53:
      v19 = v179;
      objc_msgSend(MEMORY[0x1E0DC0AE0], "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", v62, v179, 0, 1);
      v100 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC0AE0], "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", log, v179, 0, 1);
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = (void *)v101;
      if (v100)
      {
        v11 = v185;
        if (v101)
        {
          objc_msgSend(v100, "overlayLevelsFromFactorProvider:", v101);
          v103 = v102;
          v104 = objc_claimAutoreleasedReturnValue();

          v100 = (id)v104;
          v102 = v103;
        }
        if (v100)
        {
LABEL_58:
          objc_msgSend(v62, "factorsAbsolutePathAsOwner:", 0);
          v105 = objc_claimAutoreleasedReturnValue();
          v172 = v62;
          v173 = v100;
          v174 = (void *)v105;
          if (v105)
          {
            if ((objc_msgSend(v100, "saveToPath:copyAssets:", v105, 1) & 1) != 0)
            {
              v170 = v102;
              objc_msgSend(v179, "namespaceDescriptorsRolloutDir");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = objc_msgSend(v62, "saveToDirectory:", v106);

              if ((v107 & 1) == 0)
              {
                TRILogCategory_Server();
                v138 = objc_claimAutoreleasedReturnValue();
                v102 = v170;
                if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v9, "name");
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  TRILoggedNamespaceName(v158);
                  v159 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v197 = v159;
                  _os_log_error_impl(&dword_1D207F000, v138, OS_LOG_TYPE_ERROR, "failed to save rollout descriptor for namespace %{public}@", buf, 0xCu);

                  v102 = v170;
                }
                v42 = 3;
                v19 = v179;
                goto LABEL_82;
              }
              v167 = v14;
              v168 = v10;
              v178 = v9;
              objc_msgSend(v11, "experimentDatabase");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRIExperimentBaseTask experiment](v171, "experiment");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setStatus:forExperimentDeployment:usingTransaction:", 1, v109, 0);

              -[TRIExperimentBaseTask experiment](v171, "experiment");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v110);
              v111 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "contentTracker");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "addRefWithContentIdentifier:", v111);

              v113 = (void *)objc_opt_new();
              objc_msgSend(v11, "experimentDatabase");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRIExperimentBaseTask experiment](v171, "experiment");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "experimentId");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v190[0] = MEMORY[0x1E0C809B0];
              v190[1] = 3221225472;
              v190[2] = __65__TRIMakeDefaultTask_makeDefaultForNamespace_experiment_context___block_invoke;
              v190[3] = &unk_1E9330B50;
              v190[4] = v171;
              v117 = v113;
              v191 = v117;
              objc_msgSend(v114, "enumerateExperimentRecordsMatchingExperimentId:block:", v116, v190);

              v188 = 0u;
              v189 = 0u;
              v186 = 0u;
              v187 = 0u;
              v118 = v117;
              v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v186, v195, 16);
              if (v119)
              {
                v120 = v119;
                v121 = *(_QWORD *)v187;
                do
                {
                  for (i = 0; i != v120; ++i)
                  {
                    if (*(_QWORD *)v187 != v121)
                      objc_enumerationMutation(v118);
                    v123 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * i);
                    v124 = (void *)MEMORY[0x1D8232A5C]();
                    objc_msgSend(v123, "experimentDeployment");
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v125);
                    v126 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v11, "contentTracker");
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    v128 = objc_msgSend(v127, "dropRefWithContentIdentifier:", v126);

                    if ((v128 & 1) == 0)
                    {
                      TRILogCategory_Server();
                      v129 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v123, "experimentDeployment");
                        v134 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v134, "shortDesc");
                        v135 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v197 = v135;
                        _os_log_error_impl(&dword_1D207F000, v129, OS_LOG_TYPE_ERROR, "Failed to drop ref on experiment artifact for old rollout deployment %{public}@", buf, 0xCu);

                        v11 = v185;
                      }

                    }
                    objc_msgSend(v11, "experimentDatabase");
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "experimentDeployment");
                    v131 = (void *)objc_claimAutoreleasedReturnValue();
                    v132 = objc_msgSend(v130, "removeExperimentRecordWithExperimentDeployment:", v131);

                    if (!v132)
                    {
                      TRILogCategory_Server();
                      v133 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v123, "experimentDeployment");
                        v136 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v136, "shortDesc");
                        v137 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v197 = v137;
                        _os_log_error_impl(&dword_1D207F000, v133, OS_LOG_TYPE_ERROR, "Failed to drop record for old rollout deployment %{public}@", buf, 0xCu);

                      }
                    }

                    objc_autoreleasePoolPop(v124);
                    v11 = v185;
                  }
                  v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v186, v195, 16);
                }
                while (v120);
              }

              v40 = v184;
              if (v169)
              {
                v42 = 2;
                v9 = v178;
                v19 = v179;
                v14 = v167;
                v10 = v168;
                p_super = &v183->super;
                v102 = v170;
LABEL_83:

LABEL_84:
                goto LABEL_85;
              }
              TRILogCategory_Server();
              v146 = objc_claimAutoreleasedReturnValue();
              v9 = v178;
              v14 = v167;
              v10 = v168;
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v178, "name");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                TRILoggedNamespaceName(v147);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRITreatmentBaseTask treatmentId](v171, "treatmentId");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRIExperimentBaseTask experiment](v171, "experiment");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v150, "shortDesc");
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v197 = v148;
                v198 = 2112;
                v199 = v149;
                v200 = 2114;
                *(_QWORD *)v201 = v151;
                _os_log_impl(&dword_1D207F000, v146, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@ from treatment %@ for rollout %{public}@", buf, 0x20u);

              }
              v152 = (void *)MEMORY[0x1E0DC0B20];
              objc_msgSend(v178, "name");
              v138 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v152, "notifyUpdateForNamespaceName:", v138);
              v42 = 2;
              v11 = v185;
              v19 = v179;
              goto LABEL_99;
            }
            TRILogCategory_Server();
            v138 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
            {
LABEL_81:
              v42 = 3;
LABEL_82:

              p_super = &v183->super;
              goto LABEL_83;
            }
            objc_msgSend(v9, "name");
            v139 = v102;
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            TRILoggedNamespaceName(v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v197 = v141;
            v142 = "failed to save rollout treatment for namespace %{public}@";
          }
          else
          {
            TRILogCategory_Server();
            v138 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              goto LABEL_81;
            objc_msgSend(v9, "name");
            v139 = v102;
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            TRILoggedNamespaceName(v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v197 = v141;
            v142 = "can't save rollout treatment for namespace %{public}@: factors path is nil";
          }
          _os_log_error_impl(&dword_1D207F000, v138, OS_LOG_TYPE_ERROR, v142, buf, 0xCu);

          v102 = v139;
          v19 = v179;
          goto LABEL_81;
        }
      }
      else
      {
        v11 = v185;
      }
      v100 = v102;
      goto LABEL_58;
    }
    objc_msgSend(v9, "name");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIClientTreatmentStorage urlForDefaultFactorsWithNamespaceName:](v183, "urlForDefaultFactorsWithNamespaceName:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "handleFailureInMethod:object:file:lineNumber:description:", v177, self, CFSTR("TRIMakeDefaultTask.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentURL"));

    }
    if (!v184)
    {
      v75 = 0;
      goto LABEL_49;
    }
    objc_msgSend(v179, "containerDir");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "triPathAsOwner:", 0);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v69;
    v71 = v67;
    if (v68)
    {
      if (v69)
      {
LABEL_39:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "triPath:relativeToParentPath:", v70, v68);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = (void *)MEMORY[0x1E0C99E98];
        v75 = v184;
        -[NSObject identifier](v184, "identifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "triContainerURLWithPath:containerId:containerType:", v73, v76, -[NSObject type](v184, "type"));
        v77 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)v77;
LABEL_49:
        v91 = (void *)objc_opt_new();
        objc_msgSend(v91, "setFactorsURL:", v67);
        objc_msgSend(v91, "setAppContainer:", v75);
        objc_msgSend(v91, "setCloudKitContainerId:", v181);
        v92 = objc_alloc(MEMORY[0x1E0DC0AD8]);
        objc_msgSend(v9, "name");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v92, "initWithNamespaceName:downloadNCV:optionalParams:", v93, objc_msgSend(v9, "compatibilityVersion"), v91);
        v40 = v75;
        goto LABEL_52;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "handleFailureInMethod:object:file:lineNumber:description:", v177, self, CFSTR("TRIMakeDefaultTask.m"), 206, CFSTR("container dir is nil"));

      if (v70)
        goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "handleFailureInMethod:object:file:lineNumber:description:", v177, self, CFSTR("TRIMakeDefaultTask.m"), 207, CFSTR("treatment path is nil"));

    goto LABEL_39;
  }
  TRILogCategory_Server();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "experimentDeployment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v197 = v41;
    _os_log_impl(&dword_1D207F000, v40, OS_LOG_TYPE_DEFAULT, "1P v1 rollout %{public}@ is not supported in this release", buf, 0xCu);

  }
  v42 = 2;
LABEL_88:

  return v42;
}

void __65__TRIMakeDefaultTask_makeDefaultForNamespace_experiment_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "experimentDeployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v9, "experimentDeployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deploymentId");
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == objc_msgSend(v6, "deploymentId") || objc_msgSend(v9, "type") != 3)
  {

LABEL_7:
    goto LABEL_8;
  }
  v7 = objc_msgSend(v9, "status");

  v8 = v9;
  if (v7 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
LABEL_8:
    v8 = v9;
  }

}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "namespaces", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
  {

LABEL_16:
    v11 = 3;
    goto LABEL_17;
  }
  v10 = v9;
  LODWORD(v11) = 0;
  v12 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v8);
      v14 = -[TRIMakeDefaultTask makeDefaultForNamespace:experiment:context:](self, "makeDefaultForNamespace:experiment:context:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), v7, v6);
      if (v14)
        v11 = v14;
      else
        v11 = v11;
      if ((v11 & 0xFFFFFFFD) != 0)
      {

        goto LABEL_17;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
      continue;
    break;
  }

  if (!(_DWORD)v11)
    goto LABEL_16;
LABEL_17:
  -[TRIMakeDefaultTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v11, 1, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  notify_post("com.apple.trial.MakeDefaultTaskComplete");
  return v16;
}

- (id)metrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRIMakeDefaultTask;
  -[TRITreatmentBaseTask metrics](&v10, sel_metrics);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  if (self->_treatmentMetric)
  {
    objc_msgSend(v6, "arrayByAddingObject:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v5);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTreatmentId:", v7);

  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asPersistedTaskAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v9);

  objc_msgSend(v3, "setRetryCount:", -[TRIMakeDefaultTask retryCount](self, "retryCount"));
  -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCapabilityModifier:", v10);

  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIMakeDefaultTask _asPersistedTask](self, "_asPersistedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMakeDefaultTask.m"), 399, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  TRITaskCapabilityModifier *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  TRITaskCapabilityModifier *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  objc_class *v26;
  NSObject *v27;
  objc_class *v28;
  objc_class *v29;
  objc_class *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  +[TRIPBMessage parseFromData:error:](TRIMakeDefaultPersistedTask, "parseFromData:error:", a3, &v41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v41;
  if (!v3)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      v34 = 0;
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138543362;
    v43 = v4;
    v19 = "Unable to parse buffer as TRIMakeDefaultPersistedTask: %{public}@";
    v20 = v10;
    v21 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v32;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_31;
  }
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_31:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "hasTreatmentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v37;
      _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: treatmentId";
    goto LABEL_31;
  }
  objc_msgSend(v3, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: treatmentId";
    goto LABEL_31;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_31;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_31;
  }
  if (objc_msgSend(v3, "deploymentId") == -1)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v19 = "TRIMakeDefaultPersistedTask encodes unspecified deploymentId.";
    v20 = v10;
    v21 = 2;
    goto LABEL_14;
  }
  objc_msgSend(v3, "taskAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC0A30]);
    objc_msgSend(v3, "experimentId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithExperimentId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

    if ((objc_msgSend(v3, "hasCapabilityModifier") & 1) != 0)
    {
      v14 = [TRITaskCapabilityModifier alloc];
      objc_msgSend(v3, "capabilityModifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "add");
      objc_msgSend(v3, "capabilityModifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, objc_msgSend(v17, "remove"));

    }
    else
    {
      v18 = (TRITaskCapabilityModifier *)objc_opt_new();
    }
    v38 = (void *)objc_opt_class();
    objc_msgSend(v3, "treatmentId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v13, v39, v10, v18);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "hasRetryCount"))
      v40 = objc_msgSend(v3, "retryCount");
    else
      v40 = 0;
    objc_msgSend(v34, "setRetryCount:", v40);

  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v34 = 0;
  }

LABEL_33:
  return v34;
}

- (unint64_t)requiredCapabilities
{
  return 4 * (-[TRIMakeDefaultTask retryCount](self, "retryCount") > 0);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,%@,%@,r:%d>"), v4, v6, v7, v9, -[TRIMakeDefaultTask retryCount](self, "retryCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMakeDefaultTask)initWithCoder:(id)a3
{
  id v4;
  TRIMakeDefaultTask *v5;
  void *v6;
  TRIMakeDefaultTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIMakeDefaultTask;
  v5 = -[TRIMakeDefaultTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIMakeDefaultTask *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMakeDefaultTask.m"), 453, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIMakeDefaultTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (BOOL)testingIgnoreDependencies
{
  return self->_testingIgnoreDependencies;
}

- (void)setTestingIgnoreDependencies:(BOOL)a3
{
  self->_testingIgnoreDependencies = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentMetric, 0);
}

@end
