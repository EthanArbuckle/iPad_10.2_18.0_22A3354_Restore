@implementation TRIActivateTreatmentTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIActivateTreatmentTask)initWithCoder:(id)a3
{
  id v4;
  TRIActivateTreatmentTask *v5;
  void *v6;
  TRIActivateTreatmentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTreatmentTask;
  v5 = -[TRIActivateTreatmentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIActivateTreatmentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentTask.m"), 82, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIActivateTreatmentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 factorPackSetId:(id)a5 taskAttributing:(id)a6 requiresTreatmentInstallation:(BOOL)a7 capabilityModifier:(id)a8 startTime:(id)a9 taskOptions:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[16];

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIActivateTreatmentTask.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

  }
  +[TRIActivateTreatmentTask taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:](TRIActivateTreatmentTask, "taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v16, v17, v19, v11, v20, v21, v22);
  v23 = (id *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    objc_storeStrong(v23 + 14, a5);
  }
  else
  {
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D207F000, v24, OS_LOG_TYPE_FAULT, "TRIActivateTreatment is instantiated with a factor pack set id when FPE write is disabled.", buf, 2u);
    }

  }
  return v23;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6 capabilityModifier:(id)a7 startTime:(id)a8 taskOptions:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  TRITaskCapabilityModifier *v19;
  id v20;
  TRITaskOptions *v21;
  TRIActivateTreatmentTask *v22;
  TRITaskCapabilityModifier *capabilityModifier;
  TRITaskCapabilityModifier *v24;
  TRITaskOptions *taskOptions;
  void *v27;
  void *v28;

  v11 = a6;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = (TRITaskCapabilityModifier *)a7;
  v20 = a8;
  v21 = (TRITaskOptions *)a9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIActivateTreatmentTask.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

  }
  if ((objc_msgSend(v16, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIActivateTreatmentTask.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment.hasDeploymentId"));

  }
  v22 = -[TRIActivateTreatmentBaseTask initWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:]([TRIActivateTreatmentTask alloc], "initWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:", v16, v17, v18, v11);
  -[TRIActivateTreatmentBaseTask setStartTime:](v22, "setStartTime:", v20);
  -[TRIActivateTreatmentTask setRetryCount:](v22, "setRetryCount:", 0);
  capabilityModifier = v22->_capabilityModifier;
  v22->_capabilityModifier = v19;
  v24 = v19;

  taskOptions = v22->_taskOptions;
  v22->_taskOptions = v21;

  return v22;
}

- (unint64_t)requiredCapabilities
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTreatmentTask;
  return -[TRIBaseTask requiredCapabilities](&v3, sel_requiredCapabilities);
}

- (int)taskType
{
  return 1;
}

- (NSArray)dependencies
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[TRIActivateTreatmentTask testingIgnoreDependencies](self, "testingIgnoreDependencies"))
    return (NSArray *)0;
  if (-[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](self, "requiresTreatmentInstallation"))
  {
    v4 = (void *)objc_opt_new();
    -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:treatmentId:taskAttribution:experimentDeployment:](TRIFetchFactorPackSetTask, "taskWithFactorPackSetId:treatmentId:taskAttribution:experimentDeployment:", v6, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    if (!_os_feature_enabled_impl()
      || (-[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIFetchTreatmentTask taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:](TRIFetchTreatmentTask, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v12, v13, v14, self->_capabilityModifier);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

    }
    if (objc_msgSend(v4, "count"))
      return (NSArray *)v4;
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "experimentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_fault_impl(&dword_1D207F000, v16, OS_LOG_TYPE_FAULT, "Activate treatment task isn't queueing a fetch FPS or fetch treatmentV1. (ExperimentId: %@, TreatmentId: %@, FPSId:%@)", buf, 0x20u);

    }
  }
  else
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v16 = objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchExperimentTask taskWithExperimentDeployment:taskAttributing:](TRIFetchExperimentTask, "taskWithExperimentDeployment:taskAttributing:", v16, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TRISystemCovariates *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  SEL v121;
  id v122;
  __CFString *v123;
  __CFString *v124;
  __CFString *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  __CFString *v131;
  void *v132;
  id v133;
  void *v134;
  TRIActivateTreatmentTask *v135;
  TRISystemCovariates *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  id v142;
  id v143;
  TRIActivateTreatmentTask *v144;
  id v145;
  id v146;
  __CFString *v147;
  __CFString *v148;
  __CFString *v149;
  __CFString *v150;
  id v151;
  uint64_t *v152;
  _BYTE *v153;
  BOOL v154;
  BOOL v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  int v159;
  uint8_t v160[128];
  uint8_t v161[4];
  void *v162;
  __int16 v163;
  void *v164;
  _BYTE buf[24];
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  __CFString *v168;
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v133 = a4;
  v134 = v7;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v7))
  {
    v121 = a2;
    v135 = self;
    objc_msgSend(v7, "paths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "namespaceDescriptorsExperimentDir");
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v127)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentTask.m"), 203, CFSTR("no namespace descriptor directory"));

    }
    objc_msgSend(v133, "experimentDeployment");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0;
    v157 = &v156;
    v158 = 0x2020000000;
    v159 = 3;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v166 = __Block_byref_object_copy__13;
    v167 = __Block_byref_object_dispose__13;
    v168 = CFSTR("reason-not-set");
    v14 = [TRISystemCovariates alloc];
    objc_msgSend(v7, "paths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = -[TRISystemCovariates initWithPaths:](v14, "initWithPaths:", v15);

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKey:", CFSTR("OSBuild"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("UserSettingsLanguageCode"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueForKey:", CFSTR("UserSettingsRegionCode"));
    v131 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForKey:", CFSTR("BCP47DeviceLocale"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      objc_msgSend(v128, "componentsSeparatedByString:", CFSTR("-"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v128, "componentsSeparatedByString:", CFSTR("-"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v24 = v23;
      else
        v24 = &stru_1E9336E60;
      v131 = v24;

      v132 = (void *)v21;
    }
    -[TRISystemCovariates dictionary](v136, "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKey:", CFSTR("CarrierBundleIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (__CFString *)v26;
    else
      v28 = &stru_1E9336E60;
    v125 = v28;

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "valueForKey:", CFSTR("CarrierCountryIsoCode"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (__CFString *)v30;
    else
      v32 = &stru_1E9336E60;
    v124 = v32;

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "valueForKey:", CFSTR("DiagnosticsUsageEnabled"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 != 0;

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "valueForKey:", CFSTR("HasANE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37 != 0;

    -[TRISystemCovariates dictionary](v136, "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "valueForKey:", CFSTR("ANEVersion"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    if (v40)
      v42 = (__CFString *)v40;
    else
      v42 = &stru_1E9336E60;
    v123 = v42;

    if (!v129)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", v121, v135, CFSTR("TRIActivateTreatmentTask.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("osBuild"));

    }
    if (!v132)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "handleFailureInMethod:object:file:lineNumber:description:", v121, v135, CFSTR("TRIActivateTreatmentTask.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode"));

    }
    if (!v131)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "handleFailureInMethod:object:file:lineNumber:description:", v121, v135, CFSTR("TRIActivateTreatmentTask.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCode"));

    }
    objc_msgSend(v7, "experimentDatabase");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "experimentRecordWithExperimentDeployment:", v130);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44 && objc_msgSend(v44, "status") == 1)
    {
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIExperimentBaseTask experiment](v135, "experiment");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "experimentId");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v161 = 138543362;
        v162 = v47;
        _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@ is already activated, nothing to do.", v161, 0xCu);

      }
      notify_post("com.apple.trial.ActivateTreatmentTaskComplete");
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_73:

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v156, 8);

      goto LABEL_74;
    }

    objc_msgSend(v7, "experimentDatabase");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_111;
    v141[3] = &unk_1E93316A8;
    v122 = v7;
    v142 = v122;
    v143 = v130;
    v144 = v135;
    v152 = &v156;
    v153 = buf;
    v145 = v129;
    v146 = v132;
    v147 = v131;
    v148 = v125;
    v149 = v124;
    v154 = v35;
    v155 = v38;
    v150 = v123;
    v126 = v133;
    v151 = v126;
    objc_msgSend(v48, "writeTransactionWithFailableBlock:", v141);

    -[TRIActivateTreatmentBaseTask endTime](v135, "endTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (v50)
    {
      objc_msgSend(v126, "endDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIActivateTreatmentBaseTask setEndTime:](v135, "setEndTime:", v51);

    }
    if (-[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](v135, "requiresTreatmentInstallation"))
    {
      if (objc_msgSend(v126, "isShadow"))
      {
        -[TRIActivateTreatmentTask _notifyUpdatedShadowEvaluationWithExperimentRecord:context:](v135, "_notifyUpdatedShadowEvaluationWithExperimentRecord:context:", v126, v122);
      }
      else
      {
        TRILogCategory_Server();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](v135, "experiment");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "shortDesc");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v161 = 138412546;
          v162 = v53;
          v163 = 2114;
          v164 = v55;
          _os_log_impl(&dword_1D207F000, v52, OS_LOG_TYPE_DEFAULT, "notify about updates to namespaces in treatment %@ for experiment %{public}@", v161, 0x16u);

        }
        v139 = 0u;
        v140 = 0u;
        v137 = 0u;
        v138 = 0u;
        objc_msgSend(v126, "namespaces");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
        if (v57)
        {
          v58 = *(_QWORD *)v138;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v138 != v58)
                objc_enumerationMutation(v56);
              v60 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
              TRILogCategory_Server();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v60, "name");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v161 = 138543362;
                v162 = v62;
                _os_log_impl(&dword_1D207F000, v61, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", v161, 0xCu);

              }
              v63 = (void *)MEMORY[0x1E0DC0B20];
              objc_msgSend(v60, "name");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "notifyUpdateForNamespaceName:", v64);

            }
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
          }
          while (v57);
        }

      }
    }
    if (*((_DWORD *)v157 + 6) == 2)
    {
      -[TRIExperimentBaseTask experiment](v135, "experiment");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v122, "contentTracker");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addRefWithContentIdentifier:", v66);

      -[TRIExperimentBaseTask experiment](v135, "experiment");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "experimentId");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](v135, "experiment");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 2, v69, v70, objc_msgSend(v71, "deploymentId"), v126, 0, v122);

      if (!v72)
      {
        TRILogCategory_Server();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](v135, "experiment");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v161 = 138412546;
          v162 = v114;
          v163 = 2114;
          v164 = v115;
          _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Treatment is active but we failed to update experiment history database for treatment %@ for experiment %{public}@:. We will retry running the task.", v161, 0x16u);

        }
        *((_DWORD *)v157 + 6) = 1;
      }
      if (-[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](v135, "requiresTreatmentInstallation"))
      {
        -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](v135, "containerForFirstNamespaceInExperimentWithContext:", v122);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v75, v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v122, "contentTracker");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addRefWithContentIdentifier:", v76);

      }
    }
    if (*((_DWORD *)v157 + 6) != 1)
    {
      objc_msgSend(v126, "artifact");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "experiment");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "hasShadowEvaluation");

      if (v80)
      {
        v81 = *((_DWORD *)v157 + 6);
        objc_msgSend(v126, "artifact");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "experiment");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "shadowEvaluation");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v84, "hasClientBackgroundMlTask") & 1) != 0)
        {
          objc_msgSend(v126, "artifact");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "experiment");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "shadowEvaluation");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "clientBackgroundMlTask");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v88, "hasTaskId");

          if (v89)
          {
            objc_msgSend(v126, "artifact");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "experiment");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "shadowEvaluation");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "clientBackgroundMlTask");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "taskId");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIExperimentBaseTask experiment](v135, "experiment");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v94, objc_msgSend(v95, "deploymentId"), 1, v81 == 2);

LABEL_64:
            goto LABEL_65;
          }
        }
        else
        {

        }
        objc_msgSend(v126, "artifact");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "experiment");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "shadowEvaluation");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "mlRuntime");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "hasEvaluationId");

        if (v100)
        {
          objc_msgSend(v126, "artifact");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "experiment");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "experimentId");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](v135, "experiment");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v93, "deploymentId");
          -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v92, v101, v94, 1, v81 == 2);
          goto LABEL_64;
        }
      }
    }
LABEL_65:
    v102 = *((unsigned int *)v157 + 6);
    if ((_DWORD)v102 == 3)
    {
      -[TRIExperimentBaseTask experiment](v135, "experiment");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "experimentId");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](v135, "experiment");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v105, "deploymentId");
      -[TRITreatmentBaseTask treatmentId](v135, "treatmentId");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v104, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      +[TRIExperimentPostLaunchEvent failureEventWithEventType:treatmentTriple:failureReason:](TRIExperimentPostLaunchEvent, "failureEventWithEventType:treatmentTriple:failureReason:", 8, v108, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v109)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "handleFailureInMethod:object:file:lineNumber:description:", v121, v135, CFSTR("TRIActivateTreatmentTask.m"), 497, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentActivationFailure treatmentTriple:triple failureReason:failureReason]"));

      }
      +[TRIExperimentPostLaunchRecorder recorderFromContext:](TRIExperimentPostLaunchRecorder, "recorderFromContext:", v122);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "recordEvent:", v109);

      v102 = *((unsigned int *)v157 + 6);
    }
    -[TRIActivateTreatmentTask _nextTasksForRunStatus:](v135, "_nextTasksForRunStatus:", v102);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
      v112 = v111;
    else
      v112 = (void *)MEMORY[0x1E0C9AA60];
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v102, 1, v112, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    notify_post("com.apple.trial.ActivateTreatmentTaskComplete");
    v44 = v142;
    goto LABEL_73;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v133, "experimentDeployment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "experimentDeployment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = objc_msgSend(v11, "deploymentId");
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping activation of treatment for experiment: %{public}@ (deployment: %{public}d) due to user opt-out of experiments", buf, 0x12u);

  }
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 4, 1, MEMORY[0x1E0C9AA60], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_74:

  return v12;
}

uint64_t __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  TRIUserCovariates *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  TRINamespaceResolverStorage *v30;
  void *v31;
  TRINamespaceResolverStorage *v32;
  _QWORD *v33;
  TRIFactorPackSetStorage *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  unsigned __int8 *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  int v50;
  void *v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[5];
  uint8_t v74[4];
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE buf[24];
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setStatus:forExperimentDeployment:usingTransaction:", 1, *(_QWORD *)(a1 + 40), v3);

  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "treatmentId");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "experiment");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v57;
      _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "failed to activate treatment %@ for experiment %{public}@: failed to update database", buf, 0x16u);

    }
    goto LABEL_26;
  }
  v6 = *(void **)(*(_QWORD *)(a1 + 48) + 96);
  if (v6)
  {
    if (objc_msgSend(v6, "hasIsManuallyTargeted"))
    {
      objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "setManuallyTargeted:forExperimentDeployment:usingTransaction:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "isManuallyTargeted"), *(_QWORD *)(a1 + 40), v3);

      if ((v8 & 1) == 0)
      {
        TRILogCategory_Server();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 48), "treatmentId");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "experiment");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v66;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v67;
          _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, "failed to activate treatment %@ for experiment %{public}@: failed to update database", buf, 0x16u);

        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 3;
        v45 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v46 = *(void **)(v45 + 40);
        *(_QWORD *)(v45 + 40) = CFSTR("database-failure");

        goto LABEL_27;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "activationEventDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "experimentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "treatmentId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "deploymentId");
  if (*(_QWORD *)(a1 + 72))
    v13 = *(const __CFString **)(a1 + 72);
  else
    v13 = &stru_1E9336E60;
  LOWORD(v72) = *(_WORD *)(a1 + 128);
  v14 = objc_msgSend(v9, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v10, v11, v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v13, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v72, *(_QWORD *)(a1 + 96), v3);

  if (!v14)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "treatmentId");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "experiment");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v62;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "error during activation of treatment %@ for experiment %{public}@: failed to update activation event database", buf, 0x16u);

    }
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "requiresTreatmentInstallation"))
    goto LABEL_60;
  objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "treatmentURLsForExperimentDeployment:usingTransaction:", *(_QWORD *)(a1 + 40), v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "treatmentId");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "experiment");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v65;
      _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: failed to read treatment paths", buf, 0x16u);

    }
LABEL_26:

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
LABEL_27:
    v43 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_61:
    v36 = *v43;
    goto LABEL_62;
  }
  v18 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v79 = __Block_byref_object_copy__13;
  v80 = __Block_byref_object_dispose__13;
  v81 = 0;
  objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "experiment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_113;
  v73[3] = &unk_1E9331680;
  v73[4] = buf;
  objc_msgSend(v19, "enumerateNamespaceRecordsForExperimentDeployment:usingTransaction:block:", v20, v3, v73);

  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "namespaceDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dynamicNamespaceRecordWithNamespaceName:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 48), "taskAttributing");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applicationBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_bundle_id"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addDimension:", v25);
        -[TRIUserCovariates tri_shortVersionStringForBundleId:](v18, "tri_shortVersionStringForBundleId:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_version"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addDimension:", v27);

      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 104), "isShadow") & 1) != 0
    || (v28 = *(void **)(a1 + 48),
        objc_msgSend(*(id *)(a1 + 32), "paths"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v28) = objc_msgSend(v28, "_writeNamespaceDescriptorsWithPaths:toTreatmentLayer:forExperiment:treatmentURLs:context:", v29, 4, *(_QWORD *)(a1 + 104), v17, *(_QWORD *)(a1 + 32)), v29, (v28 & 1) != 0))
  {
    v30 = [TRINamespaceResolverStorage alloc];
    objc_msgSend(*(id *)(a1 + 32), "paths");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[TRINamespaceResolverStorage initWithPaths:](v30, "initWithPaths:", v31);

    v33 = *(_QWORD **)(a1 + 48);
    if (v33[14])
    {
      v34 = [TRIFactorPackSetStorage alloc];
      objc_msgSend(*(id *)(a1 + 32), "paths");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[TRIFactorPackSetStorage initWithPaths:](v34, "initWithPaths:", v35);

      v37 = objc_msgSend((id)v36, "hasFactorPackSetWithId:path:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112), 0);
      v38 = *(void **)(a1 + 48);
      if (v37)
      {
        objc_msgSend(v38, "experiment");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[TRINamespaceResolverStorage rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:](v32, "rewriteExperimentDeployment:targetedTreatmentId:factorPackSetId:", v39, v40, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112));

        if (v41)
          goto LABEL_47;
LABEL_42:
        if (objc_msgSend(*(id *)(a1 + 104), "isShadow"))
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 3;
          v54 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
          v55 = *(void **)(v54 + 40);
          *(_QWORD *)(v54 + 40) = CFSTR("storage-rewrite-failure");

LABEL_53:
          v36 = *MEMORY[0x1E0D81680];
          v50 = 1;
LABEL_58:

          goto LABEL_59;
        }
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v74 = 0;
          _os_log_impl(&dword_1D207F000, (os_log_t)v36, OS_LOG_TYPE_DEFAULT, "Unable to update on-disk experiment deployment directory, but continuing because the experiment is non-shadow.", v74, 2u);
        }

LABEL_47:
        if (_os_feature_enabled_impl()
          && !-[TRINamespaceResolverStorage overwriteActiveFactorProvidersUsingTransaction:fromContext:](v32, "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 32)))
        {
          if (_os_feature_enabled_impl())
          {
            TRILogCategory_Server();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v74 = 0;
              _os_log_error_impl(&dword_1D207F000, v58, OS_LOG_TYPE_ERROR, "Unable to update the factor providers after experiment activation.", v74, 2u);
            }

            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 3;
            v59 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
            v60 = *(void **)(v59 + 40);
            *(_QWORD *)(v59 + 40) = CFSTR("storage-overwrite-failure");

            goto LABEL_53;
          }
          TRILogCategory_Server();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v74 = 0;
            _os_log_fault_impl(&dword_1D207F000, (os_log_t)v36, OS_LOG_TYPE_FAULT, "Unable to update the factor providers after experiment activation.", v74, 2u);
          }

        }
        v50 = 0;
        goto LABEL_58;
      }
      objc_msgSend(v38, "experiment");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "treatmentId");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[TRINamespaceResolverStorage rewriteExperimentDeployment:targetedTreatmentId:](v32, "rewriteExperimentDeployment:targetedTreatmentId:", v51, v52);

      TRILogCategory_Server();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = *(void **)(*(_QWORD *)(a1 + 48) + 112);
        *(_DWORD *)v74 = 138412546;
        v75 = v70;
        v76 = 2112;
        v77 = v71;
        _os_log_error_impl(&dword_1D207F000, v53, OS_LOG_TYPE_ERROR, "Activating treatment (%@) without FPS (%@): The fetch seems to have failed.", v74, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v33, "experiment");
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "treatmentId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[TRINamespaceResolverStorage rewriteExperimentDeployment:targetedTreatmentId:](v32, "rewriteExperimentDeployment:targetedTreatmentId:", v36, v47);

    }
    if (v48)
      goto LABEL_47;
    goto LABEL_42;
  }
  TRILogCategory_Server();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 48), "treatmentId");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "experiment");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v74 = 138412546;
    v75 = v68;
    v76 = 2114;
    v77 = v69;
    _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: failed to save namespace descriptors", v74, 0x16u);

  }
  v50 = 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
  v36 = *MEMORY[0x1E0D81680];
LABEL_59:
  _Block_object_dispose(buf, 8);

  if (!v50)
  {
LABEL_60:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 2;
    v43 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    goto LABEL_61;
  }
LABEL_62:

  return v36;
}

void __59__TRIActivateTreatmentTask_runTaskUsingContext_experiment___block_invoke_113(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      TRILogCategory_Server();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "experimentId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v24;
        v29 = 2114;
        v30 = v26;
        _os_log_debug_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEBUG, "not scheduling deactivation of treatment %@ for experiment %{public}@ since end time is nil", (uint8_t *)&v27, 0x16u);

      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_9;
    }
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "deploymentId");
    -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v14, v16, v17, 1, 2, v18);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(int)(60 * arc4random_uniform(0x1Eu)));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "experimentId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISubscribeChannelTask taskWithExperimentId:startTime:](TRISubscribeChannelTask, "taskWithExperimentId:startTime:", v20, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v5;
    v31[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 != 3)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
      return v11;
    }
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v23;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "failed to activate treatment id %@", (uint8_t *)&v27, 0xCu);

    }
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject experimentId](v5, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deploymentId");
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v6, v8, 1, 10, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v11;
}

- (BOOL)_notifyUpdatedShadowEvaluationWithExperimentRecord:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v5, "artifact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "experiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "hasShadowEvaluation"))
    goto LABEL_11;
  objc_msgSend(v9, "shadowEvaluation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasClientBackgroundMlTask");

  if ((v11 & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v9, "shadowEvaluation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "typeOneOfCase");

  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 != 1)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "experimentDeployment");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "shortDesc");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v36;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on experiment deployment %{public}@ with unspecified type.", (uint8_t *)&v37, 0xCu);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "experimentDeployment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDesc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543362;
    v38 = v17;
    _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of activated shadow evaluation for experiment deployment %{public}@.", (uint8_t *)&v37, 0xCu);

  }
  v18 = objc_alloc(MEMORY[0x1E0DC0A38]);
  objc_msgSend(v5, "experimentDeployment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "treatmentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithDeployment:treatmentId:", v19, v20);

  v22 = objc_alloc(MEMORY[0x1E0DC0A20]);
  objc_msgSend(v9, "shadowEvaluation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mlRuntime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "evaluationId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_new();
  v27 = (void *)objc_msgSend(v22, "initWithType:evaluationId:date:evalState:", 1, v25, v26, v21);

  v28 = objc_alloc(MEMORY[0x1E0DC0AC8]);
  objc_msgSend(v9, "shadowEvaluation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mlRuntime");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithEvaluation:status:", v30, v27);

  objc_msgSend(v6, "evaluationHistoryDatabase");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v32, "addRecord:usingTransaction:", v31, 0);

  if ((v30 & 1) != 0)
  {
LABEL_11:
    v33 = 1;
    goto LABEL_12;
  }
  v33 = 0;
LABEL_12:

  objc_autoreleasePoolPop(v7);
  return v33;
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
  v10.super_class = (Class)TRIActivateTreatmentTask;
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
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

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

  -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFactorPackSetId:", v9);

  }
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asPersistedTaskAttribution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v11);

  -[TRIActivateTreatmentBaseTask startTime](self, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC0F50]);
    -[TRIActivateTreatmentBaseTask startTime](self, "startTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithDate:", v14);
    objc_msgSend(v3, "setStartTimestamp:", v15);

  }
  -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0DC0F50]);
    -[TRIActivateTreatmentBaseTask endTime](self, "endTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithDate:", v18);
    objc_msgSend(v3, "setEndTimestamp:", v19);

  }
  objc_msgSend(v3, "setRequiresTreatmentInstallation:", -[TRIActivateTreatmentBaseTask requiresTreatmentInstallation](self, "requiresTreatmentInstallation"));
  -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCapabilityModifier:", v20);

  if (self->_taskOptions)
    objc_msgSend(v3, "setTaskOptions:");
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIActivateTreatmentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTreatmentTask.m"), 614, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  TRITaskCapabilityModifier *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  const char *v27;
  objc_class *v28;
  NSObject *v29;
  objc_class *v30;
  objc_class *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  +[TRIPBMessage parseFromData:error:](TRIActivateTreatmentPersistedTask, "parseFromData:error:", a3, &v58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v58;
  if (v4)
  {
    if ((objc_msgSend(v4, "hasExperimentId") & 1) != 0)
    {
      objc_msgSend(v4, "experimentId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        if ((objc_msgSend(v4, "hasTreatmentId") & 1) != 0)
        {
          objc_msgSend(v4, "treatmentId");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "length");

          if (v9)
          {
            if ((objc_msgSend(v4, "hasDeploymentId") & 1) != 0)
            {
              if ((objc_msgSend(v4, "hasTaskAttribution") & 1) != 0)
              {
                if (objc_msgSend(v4, "deploymentId") != -1)
                {
                  objc_msgSend(v4, "taskAttribution");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v10);
                  v11 = objc_claimAutoreleasedReturnValue();

                  if (!v11)
                  {
                    TRILogCategory_Server();
                    v14 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
                    }
                    v36 = 0;
                    goto LABEL_72;
                  }
                  v12 = objc_alloc(MEMORY[0x1E0DC0A30]);
                  objc_msgSend(v4, "experimentId");
                  v13 = objc_claimAutoreleasedReturnValue();
                  v14 = objc_msgSend(v12, "initWithExperimentId:deploymentId:", v13, objc_msgSend(v4, "deploymentId"));

                  if ((objc_msgSend(v4, "hasCapabilityModifier") & 1) != 0)
                  {
                    v15 = [TRITaskCapabilityModifier alloc];
                    objc_msgSend(v4, "capabilityModifier");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "add");
                    objc_msgSend(v4, "capabilityModifier");
                    v3 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v15, "initWithAdd:remove:", v17, objc_msgSend(v3, "remove"));
                    v13 = v14;
                    v19 = (void *)v18;

                    v20 = v19;
                    v14 = v13;
                  }
                  else
                  {
                    v20 = (void *)objc_opt_new();
                  }
                  if (_os_feature_enabled_impl() && objc_msgSend(v4, "hasFactorPackSetId"))
                  {
                    v54 = (void *)objc_opt_class();
                    objc_msgSend(v4, "treatmentId");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "factorPackSetId");
                    v3 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v4, "hasRequiresTreatmentInstallation"))
                      v41 = objc_msgSend(v4, "requiresTreatmentInstallation");
                    else
                      v41 = 1;
                    v48 = objc_msgSend(v4, "hasStartTimestamp");
                    if (v48)
                    {
                      objc_msgSend(v4, "startTimestamp");
                      v13 = objc_claimAutoreleasedReturnValue();
                      -[NSObject date](v13, "date");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v57 = 0;
                    }
                    if ((objc_msgSend(v4, "hasTaskOptions") & 1) != 0)
                    {
                      objc_msgSend(v4, "taskOptions");
                      v53 = v13;
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "taskWithExperiment:treatmentId:factorPackSetId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v14, v40, v3, v11, v41, v20, v57, v49);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      v13 = v53;
                    }
                    else
                    {
                      objc_msgSend(v54, "taskWithExperiment:treatmentId:factorPackSetId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v14, v40, v3, v11, v41, v20, v57, 0);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    if (!v48)
                      goto LABEL_65;

                  }
                  else
                  {
                    v56 = (void *)objc_opt_class();
                    objc_msgSend(v4, "treatmentId");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v4, "hasRequiresTreatmentInstallation"))
                      v42 = objc_msgSend(v4, "requiresTreatmentInstallation");
                    else
                      v42 = 1;
                    v43 = objc_msgSend(v4, "hasStartTimestamp");
                    if (v43)
                    {
                      objc_msgSend(v4, "startTimestamp");
                      v3 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "date");
                      v13 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v13 = 0;
                    }
                    if ((objc_msgSend(v4, "hasTaskOptions") & 1) != 0)
                    {
                      objc_msgSend(v4, "taskOptions");
                      v55 = v3;
                      v44 = v40;
                      v45 = v14;
                      v46 = v20;
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v45, v44, v11, v42, v46, v13, v47);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      v20 = v46;
                      v14 = v45;
                      v40 = v44;
                      v3 = v55;
                    }
                    else
                    {
                      objc_msgSend(v56, "taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v14, v40, v11, v42, v20, v13, 0);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    if (!v43)
                      goto LABEL_66;
                  }

LABEL_65:
LABEL_66:

                  if (objc_msgSend(v4, "hasEndTimestamp"))
                  {
                    objc_msgSend(v4, "endTimestamp");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "date");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setEndTime:", v51);

                  }
                  if (objc_msgSend(v4, "hasRetryCount"))
                    v52 = objc_msgSend(v4, "retryCount");
                  else
                    v52 = 0;
                  objc_msgSend(v36, "setRetryCount:", v52);

LABEL_72:
                  goto LABEL_33;
                }
                TRILogCategory_Server();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v21 = "TRIActivateTreatmentPersistedTask encodes unspecified deploymentId.";
                  v22 = v11;
                  v23 = 2;
                  goto LABEL_14;
                }
                goto LABEL_32;
              }
              TRILogCategory_Server();
              v11 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                goto LABEL_32;
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v26;
              v27 = "Cannot decode message of type %@ with missing field: taskAttribution";
            }
            else
            {
              TRILogCategory_Server();
              v11 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                goto LABEL_32;
              v32 = (objc_class *)objc_opt_class();
              NSStringFromClass(v32);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v26;
              v27 = "Cannot decode message of type %@ with missing field: deploymentId";
            }
          }
          else
          {
            TRILogCategory_Server();
            v11 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v60 = v26;
            v27 = "Cannot decode message of type %@ with field of length 0: treatmentId";
          }
        }
        else
        {
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v60 = v39;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);

          }
          TRILogCategory_Server();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_32;
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v60 = v26;
          v27 = "Cannot decode message of type %@ with missing field: treatmentId";
        }
      }
      else
      {
        TRILogCategory_Server();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v26;
        v27 = "Cannot decode message of type %@ with field of length 0: experimentId";
      }
    }
    else
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v34;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

      }
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v26;
      v27 = "Cannot decode message of type %@ with missing field: experimentId";
    }
    _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);

    goto LABEL_32;
  }
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v5;
    v21 = "Unable to parse buffer as TRIActivateTreatmentPersistedTask: %{public}@";
    v22 = v11;
    v23 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
  }
LABEL_32:
  v36 = 0;
LABEL_33:

  return v36;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,%@,%@,r:%d>"), v4, v6, v7, v9, -[TRIActivateTreatmentTask retryCount](self, "retryCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIActivateTreatmentTask;
  v3 = -[TRIActivateTreatmentBaseTask hash](&v8, sel_hash);
  -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }

  return v6 + 37 * v3;
}

- (BOOL)isEqual:(id)a3
{
  TRIActivateTreatmentTask *v4;
  unsigned int v5;
  void *v6;
  TRIActivateTreatmentTask *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v13;

  v4 = (TRIActivateTreatmentTask *)a3;
  if (self == v4)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIActivateTreatmentTask;
    v5 = -[TRIActivateTreatmentBaseTask isEqual:](&v13, sel_isEqual_, v4);
    LOBYTE(v6) = 0;
    if (v4 && v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v4;
        -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[TRIActivateTreatmentTask factorPackSetId](v7, "factorPackSetId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (!v6)
          {
LABEL_13:

            goto LABEL_14;
          }
          -[TRIActivateTreatmentTask factorPackSetId](self, "factorPackSetId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIActivateTreatmentTask factorPackSetId](v7, "factorPackSetId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqualToString:", v10);

          if (v11)
          {
LABEL_8:
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        else if (!v6)
        {
          goto LABEL_8;
        }
        LOBYTE(v6) = 0;
        goto LABEL_13;
      }
      LOBYTE(v6) = 0;
    }
  }
LABEL_14:

  return (char)v6;
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

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
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
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_taskOptions, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_treatmentMetric, 0);
}

@end
