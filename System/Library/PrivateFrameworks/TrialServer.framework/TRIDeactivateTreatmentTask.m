@implementation TRIDeactivateTreatmentTask

- (int)taskType
{
  return 2;
}

+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 startTime:(id)a5 failOnUnrecognizedExperiment:(BOOL)a6 triggerEvent:(unint64_t)a7 taskAttribution:(id)a8
{
  _BOOL8 v9;
  uint64_t v11;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  TRIDeactivateTreatmentTask *v18;

  v9 = a6;
  v11 = *(_QWORD *)&a4;
  v13 = (objc_class *)MEMORY[0x1E0DC0A30];
  v14 = a8;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_msgSend([v13 alloc], "initWithExperimentId:deploymentId:", v16, v11);

  v18 = -[TRIExperimentBaseTask initWithExperiment:]([TRIDeactivateTreatmentTask alloc], "initWithExperiment:", v17);
  -[TRIDeactivateTreatmentTask setStartTime:](v18, "setStartTime:", v15);

  -[TRIDeactivateTreatmentTask setFailOnUnrecognizedExperiment:](v18, "setFailOnUnrecognizedExperiment:", v9);
  -[TRIDeactivateTreatmentTask setRetryCount:](v18, "setRetryCount:", 0);
  -[TRIDeactivateTreatmentTask setTriggerEvent:](v18, "setTriggerEvent:", a7);
  -[TRIDeactivateTreatmentTask setTaskAttribution:](v18, "setTaskAttribution:", v14);

  return v18;
}

+ (id)taskWithExperimentId:(id)a3 deploymentId:(int)a4 failOnUnrecognizedExperiment:(BOOL)a5 triggerEvent:(unint64_t)a6 taskAttribution:(id)a7
{
  return (id)objc_msgSend(a1, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", a3, *(_QWORD *)&a4, 0, a5, a6, a7);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
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
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  NSObject *v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  BOOL v100;
  void *v101;
  NSObject *v102;
  int v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  NSObject *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  _BOOL4 v162;
  NSObject *v163;
  NSObject *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  NSObject *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id v195;
  id v196;
  int v197;
  void *v198;
  void *v199;
  unsigned int v200;
  void *v201;
  void *v202;
  void *v203;
  id obj;
  void *v205;
  void *v206;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  unsigned int v211;
  _QWORD v212[5];
  uint8_t v213[16];
  _QWORD v214[4];
  id v215;
  _BYTE *v216;
  _QWORD v217[4];
  id v218;
  _BYTE *v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _QWORD v224[5];
  id v225;
  _BYTE v226[24];
  char v227;
  _BYTE buf[24];
  void *v229;
  _BYTE v230[128];
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v195 = a4;
  v6 = objc_opt_new();
  v210 = v5;
  +[TRIExperimentPostLaunchRecorder recorderFromContext:](TRIExperimentPostLaunchRecorder, "recorderFromContext:", v5);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "experimentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = MEMORY[0x1E0C809B0];
  v224[1] = 3221225472;
  v224[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_2;
  v224[3] = &unk_1E9330B50;
  v224[4] = self;
  v196 = (id)v6;
  v225 = v196;
  LOBYTE(v6) = objc_msgSend(v7, "enumerateExperimentRecordsMatchingExperimentId:block:", v9, v224);

  if ((v6 & 1) == 0)
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "experimentId");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v157, objc_msgSend(v158, "deploymentId"), CFSTR("unspecified-or-default-treatment"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    +[TRIExperimentPostLaunchEvent failureEventWithEventType:treatmentTriple:failureReason:](TRIExperimentPostLaunchEvent, "failureEventWithEventType:treatmentTriple:failureReason:", 9, v159, CFSTR("database-failure"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v160)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 138, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentDeactivationFailure treatmentTriple:triple failureReason:kDeactivateFailureReasonDatabaseFailure]"));

    }
    objc_msgSend(v199, "recordEvent:", v160);
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_157;
  }

  if (!objc_msgSend(v196, "count"))
  {
    v162 = -[TRIDeactivateTreatmentTask failOnUnrecognizedExperiment](self, "failOnUnrecognizedExperiment");
    TRILogCategory_Server();
    v163 = objc_claimAutoreleasedReturnValue();
    v164 = v163;
    if (v162)
    {
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "experimentId");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v191;
        _os_log_error_impl(&dword_1D207F000, v164, OS_LOG_TYPE_ERROR, "cannot deactivate experiment %{public}@: experiment not found in database", buf, 0xCu);

      }
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "experimentId");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v166, objc_msgSend(v167, "deploymentId"), CFSTR("unspecified-or-default-treatment"));
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      +[TRIExperimentPostLaunchEvent failureEventWithEventType:treatmentTriple:failureReason:](TRIExperimentPostLaunchEvent, "failureEventWithEventType:treatmentTriple:failureReason:", 9, v168, CFSTR("experiment-not-found"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v169)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v193, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 153, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeTreatmentDeactivationFailure treatmentTriple:triple failureReason:kDeactivateFailureReasonExperimentNotFound]"));

      }
      objc_msgSend(v199, "recordEvent:", v169);
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
      v161 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "experimentId");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v172;
        _os_log_impl(&dword_1D207F000, v164, OS_LOG_TYPE_DEFAULT, "Unable to find experiment %{public}@ in database. Completing", buf, 0xCu);

      }
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_157;
  }
  v198 = (void *)objc_opt_new();
  v220 = 0u;
  v221 = 0u;
  v222 = 0u;
  v223 = 0u;
  obj = v196;
  v209 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v230, 16);
  if (!v209)
  {

    v149 = 0;
    v201 = 0;
    v203 = 0;
    v10 = 0;
    v170 = 2;
    goto LABEL_153;
  }
  v201 = 0;
  v203 = 0;
  v10 = 0;
  v211 = 2;
  v208 = *(_QWORD *)v221;
  v200 = -1;
  do
  {
    for (i = 0; i != v209; ++i)
    {
      if (*(_QWORD *)v221 != v208)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1D8232A5C]();
      if (objc_msgSend(v12, "type") == 3)
        -[TRIExperimentBaseTask logAsRollout:](self, "logAsRollout:", 1);
      if (objc_msgSend(v12, "status") == 1 || objc_msgSend(v12, "status") == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "type"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(&unk_1E93637F8, "containsObject:", v14);

        if ((v15 & 1) == 0)
        {
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "treatmentId");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "experimentDeployment");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "shortDesc");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v12, "type");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v77;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v79;
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v229) = v80;
            _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of experiment %{public}@ because the type is %d.", buf, 0x1Cu);

          }
          goto LABEL_21;
        }
        if (objc_msgSend(v12, "type") == 3)
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "treatmentId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "experimentDeployment");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "shortDesc");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Attempting to deactivate treatment %@ of ROLLOUT experiment %{public}@.", buf, 0x16u);

          }
          objc_msgSend(v12, "namespaces");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v210, "namespaceDatabase");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dynamicNamespaceRecordWithNamespaceName:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v24, "appContainer");
              v205 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_28;
            }
            TRILogCategory_Server();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v12, "treatmentId");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "experimentDeployment");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "shortDesc");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "name");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v88;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v90;
              *(_WORD *)&buf[22] = 2112;
              v229 = v91;
              _os_log_error_impl(&dword_1D207F000, v75, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of ROLLOUT experiment %{public}@ because associated namespace %@ is not dynamic.", buf, 0x20u);

            }
            v76 = v211;
            if (v211 == 2)
              v76 = 3;
            v211 = v76;

LABEL_117:
            v10 = 1;
            goto LABEL_118;
          }
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "treatmentId");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "experimentDeployment");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "shortDesc");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v83;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v85;
            _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Cannot deactivate treatment %@ of ROLLOUT experiment %{public}@ because the experiment has no namespaces.", buf, 0x16u);

          }
LABEL_21:

          v26 = v211;
          if (v211 == 2)
            v26 = 3;
          v211 = v26;
          goto LABEL_117;
        }
        v205 = 0;
LABEL_28:
        if (v203)
        {
          TRILogCategory_Server();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "experimentDeployment");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "shortDesc");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "treatmentId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v203;
            *(_WORD *)&buf[22] = 2112;
            v229 = v31;
            _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Same experiment %{public}@ has multiple treatments that can be deactivated.(%@, %@)", buf, 0x20u);

          }
        }
        else
        {
          objc_msgSend(v12, "treatmentId");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "experimentDeployment");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v200 = objc_msgSend(v32, "deploymentId");

          TRIDeploymentEnvironment_EnumDescriptor();
          v28 = objc_claimAutoreleasedReturnValue();
          -[NSObject textFormatNameForValue:](v28, "textFormatNameForValue:", objc_msgSend(v12, "deploymentEnvironment"));
          v33 = objc_claimAutoreleasedReturnValue();

          v201 = (void *)v33;
        }

        TRILogCategory_Server();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "treatmentId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "experimentDeployment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "shortDesc");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v37;
          _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "Deactivating treatment %@ of experiment %{public}@.", buf, 0x16u);

        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v229) = 1;
        if (objc_msgSend(v12, "type") == 3)
        {
          objc_msgSend(v210, "paths");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "namespaceDescriptorsRolloutDir");
        }
        else
        {
          objc_msgSend(v210, "paths");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "namespaceDescriptorsExperimentDir");
        }
        v206 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "namespaces");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          objc_msgSend(v12, "namespaces");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v217[0] = MEMORY[0x1E0C809B0];
          v217[1] = 3221225472;
          v217[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_39;
          v217[3] = &unk_1E9332CC0;
          v219 = buf;
          v218 = v206;
          objc_msgSend(v40, "enumerateObjectsUsingBlock:", v217);

        }
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          goto LABEL_61;
        objc_msgSend(v12, "artifact");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "experiment");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "projectId");

        objc_msgSend(v210, "paths");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRILogTreatmentProvider providerWithProjectId:paths:](TRILogTreatmentProvider, "providerWithProjectId:paths:", v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend(v12, "treatmentId");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend(v12, "treatmentId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "removeTreatment:", v47);

          }
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
        }

        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "type"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(&unk_1E9363810, "containsObject:", v48);

          if ((v49 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "treatmentId");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "experimentDeployment");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "shortDesc");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 271, CFSTR("Cannot deactivate treatment %@ of experiment %@ because the type is %d."), v142, v144, objc_msgSend(v12, "type"));

          }
          objc_msgSend(v12, "artifact");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "experiment");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "projectId");

          objc_msgSend(v210, "paths");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRILogTreatmentProvider providerWithProjectId:paths:](TRILogTreatmentProvider, "providerWithProjectId:paths:", v52, v53);
          v202 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "treatmentId");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            objc_msgSend(v12, "treatmentId");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "removeTreatment:", v55);

          }
          objc_msgSend(v210, "experimentDatabase");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "experimentDeployment");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setStatus:forExperimentDeployment:usingTransaction:", 3, v57, 0);

          -[TRIDeactivateTreatmentTask _notifyUpdatedShadowEvaluationWithExperimentRecord:context:](self, "_notifyUpdatedShadowEvaluationWithExperimentRecord:context:", v12, v210);
          if (objc_msgSend(v12, "status") == 1)
          {
            objc_msgSend(v12, "treatmentId");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
              objc_msgSend(v210, "activationEventDatabase");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRIDeactivateTreatmentTask prevTelemetryFieldsFromActivationEventDatabase:deactivatedRecord:](TRIDeactivateTreatmentTask, "prevTelemetryFieldsFromActivationEventDatabase:deactivatedRecord:", v59, v12);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              +[TRIExperimentPostLaunchEvent deactivationEventWithTriggerEvent:experimentRecord:additionalTelemetry:](TRIExperimentPostLaunchEvent, "deactivationEventWithTriggerEvent:experimentRecord:additionalTelemetry:", -[TRIDeactivateTreatmentTask triggerEvent](self, "triggerEvent"), v12, v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v199, "recordEvent:", v61);

            }
            if (objc_msgSend(v12, "type") == 1
              && !objc_msgSend(v12, "deploymentEnvironment"))
            {
              objc_msgSend(v12, "treatmentId");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
              {
                objc_msgSend(v12, "namespaces");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "firstObject");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "name");
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                if (v65)
                {
                  objc_msgSend(v210, "namespaceDatabase");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "dynamicNamespaceRecordWithNamespaceName:", v65);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v67)
                  {
                    objc_msgSend(v67, "appContainer");
                    v68 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v68 = 0;
                  }

                }
                else
                {
                  v68 = 0;
                }
                +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v62, v68);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v210, "contentTracker");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v93, "dropRefWithContentIdentifier:", v92);

                if ((v94 & 1) == 0)
                {
                  TRILogCategory_Server();
                  v95 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "treatmentId");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v226 = 138412290;
                    *(_QWORD *)&v226[4] = v140;
                    _os_log_error_impl(&dword_1D207F000, v95, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", v226, 0xCu);

                  }
                }

              }
              else
              {
                TRILogCategory_Server();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v12, "experimentDeployment");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "shortDesc");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v226 = 138543362;
                  *(_QWORD *)&v226[4] = v87;
                  _os_log_error_impl(&dword_1D207F000, v68, OS_LOG_TYPE_ERROR, "Can't drop reference when deactivating experiment %{public}@; no treatmentId available.",
                    v226,
                    0xCu);

                }
              }

            }
            objc_msgSend(v12, "experimentDeployment");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v96);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v210, "contentTracker");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = objc_msgSend(v97, "dropRefWithContentIdentifier:", v71);

            if ((v98 & 1) == 0)
            {
              TRILogCategory_Server();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v12, "experimentDeployment");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v138, "shortDesc");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v226 = 138543362;
                *(_QWORD *)&v226[4] = v139;
                _os_log_error_impl(&dword_1D207F000, v74, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@.", v226, 0xCu);

              }
LABEL_84:

            }
          }
          else if (objc_msgSend(v12, "status") == 2)
          {
            objc_msgSend(v12, "treatmentId");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              objc_msgSend(v210, "activationEventDatabase");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRIDeactivateTreatmentTask prevTelemetryFieldsFromActivationEventDatabase:deactivatedRecord:](TRIDeactivateTreatmentTask, "prevTelemetryFieldsFromActivationEventDatabase:deactivatedRecord:", v70, v12);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              v72 = -[TRIDeactivateTreatmentTask triggerEvent](self, "triggerEvent");
              objc_msgSend(v210, "experimentHistoryDatabase");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRIExperimentPostLaunchEvent obsoletionOrDeactivationEventWithTriggerEvent:previousStateProvider:experimentRecord:additionalTelemetry:](TRIExperimentPostLaunchEvent, "obsoletionOrDeactivationEventWithTriggerEvent:previousStateProvider:experimentRecord:additionalTelemetry:", v72, v73, v12, v71);
              v74 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v199, "recordEvent:", v74);
              goto LABEL_84;
            }
          }
          objc_msgSend(v210, "paths");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = -[TRIDeactivateTreatmentTask _purgeRolloutLayerIfNecessaryWithRecord:fromAppContainer:paths:](self, "_purgeRolloutLayerIfNecessaryWithRecord:fromAppContainer:paths:", v12, v205, v99);

          if (v100)
          {
            if (_os_feature_enabled_impl())
            {
              *(_QWORD *)v226 = 0;
              *(_QWORD *)&v226[8] = v226;
              *(_QWORD *)&v226[16] = 0x2020000000;
              v227 = 0;
              objc_msgSend(v210, "experimentDatabase");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v214[0] = MEMORY[0x1E0C809B0];
              v214[1] = 3221225472;
              v214[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_50;
              v214[3] = &unk_1E9332CE8;
              v215 = v210;
              v216 = v226;
              objc_msgSend(v101, "writeTransactionWithFailableBlock:", v214);

              if (!*(_BYTE *)(*(_QWORD *)&v226[8] + 24))
              {
                if (_os_feature_enabled_impl())
                {
                  TRILogCategory_Server();
                  v102 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v213 = 0;
                    _os_log_error_impl(&dword_1D207F000, v102, OS_LOG_TYPE_ERROR, "Unable to update the factor providers for experiment deactivation.", v213, 2u);
                  }
                  v211 = 3;
                }
                else
                {
                  TRILogCategory_Server();
                  v102 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)v213 = 0;
                    _os_log_fault_impl(&dword_1D207F000, v102, OS_LOG_TYPE_FAULT, "Unable to update the factor providers for experiment deactivation.", v213, 2u);
                  }
                }

              }
              _Block_object_dispose(v226, 8);
            }
            TRILogCategory_Server();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v12, "experimentDeployment");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "shortDesc");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "treatmentId");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v226 = 138543618;
              *(_QWORD *)&v226[4] = v136;
              *(_WORD *)&v226[12] = 2112;
              *(_QWORD *)&v226[14] = v137;
              _os_log_debug_impl(&dword_1D207F000, v104, OS_LOG_TYPE_DEBUG, "Experiment %{public}@ with treatment %@ deactivated.", v226, 0x16u);

            }
            if (!objc_msgSend(v12, "deploymentEnvironment"))
            {
              TRILogCategory_Server();
              v105 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v12, "treatmentId");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "experimentDeployment");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "shortDesc");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v226 = 138412546;
                *(_QWORD *)&v226[4] = v106;
                *(_WORD *)&v226[12] = 2114;
                *(_QWORD *)&v226[14] = v108;
                _os_log_impl(&dword_1D207F000, v105, OS_LOG_TYPE_DEFAULT, "Notify about updates to namespaces in treatment %@ of experiment %{public}@ (deactivated treatment).", v226, 0x16u);

              }
              objc_msgSend(v12, "namespaces");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v212[0] = MEMORY[0x1E0C809B0];
              v212[1] = 3221225472;
              v212[2] = __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_54;
              v212[3] = &unk_1E9332D10;
              v212[4] = v12;
              objc_msgSend(v109, "enumerateObjectsUsingBlock:", v212);

            }
            objc_msgSend(v12, "artifact");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "experiment");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v111, "hasShadowEvaluation");

            if (v112)
            {
              objc_msgSend(v12, "artifact");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "experiment");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "shadowEvaluation");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v115, "hasClientBackgroundMlTask") & 1) != 0)
              {
                objc_msgSend(v12, "artifact");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "experiment");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "shadowEvaluation");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "clientBackgroundMlTask");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v197 = objc_msgSend(v119, "hasTaskId");

                if (v197)
                {
                  objc_msgSend(v12, "artifact");
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v120, "experiment");
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v121, "shadowEvaluation");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "clientBackgroundMlTask");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "taskId");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIExperimentBaseTask experiment](self, "experiment");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v124, objc_msgSend(v125, "deploymentId"), 2, v211 == 2);

                  goto LABEL_113;
                }
              }
              else
              {

              }
              objc_msgSend(v12, "artifact");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "experiment");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "shadowEvaluation");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "mlRuntime");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = objc_msgSend(v129, "hasEvaluationId");

              if (v130)
              {
                objc_msgSend(v12, "artifact");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "experiment");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "experimentId");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRIExperimentBaseTask experiment](self, "experiment");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v122, objc_msgSend(v123, "deploymentId"), v203, 2, v211 == 2);
LABEL_113:

              }
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(int)(60 * arc4random_uniform(0x1Eu)));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIExperimentBaseTask experiment](self, "experiment");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "experimentId");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            +[TRIUnsubscribeChannelTask taskWithExperimentId:startTime:](TRIUnsubscribeChannelTask, "taskWithExperimentId:startTime:", v133, v131);
            v134 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v198, "addObject:", v134);
          }
          else
          {
            v103 = v211;
            if (v211 == 2)
              v103 = 3;
            v211 = v103;
          }

        }
        else
        {
LABEL_61:
          v211 = 1;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_117;
      }
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "experimentId");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v82;
        _os_log_debug_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEBUG, "Experiment %{public}@ is already deactivated, nothing to do.", buf, 0xCu);

      }
LABEL_118:
      objc_autoreleasePoolPop(v13);
    }
    v209 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v230, 16);
  }
  while (v209);

  if (v203)
  {
    objc_msgSend(v210, "activationEventDatabase");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "experimentId");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v147, v203, v200);
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    if (v148)
    {
      v149 = (void *)objc_opt_new();
      objc_msgSend(v148, "osBuild");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "setPrevOsBuild:", v150);

      v151 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v148, "languageCode");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "regionCode");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      if (v153)
      {
        objc_msgSend(v148, "regionCode");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "stringWithFormat:", CFSTR("%@-%@"), v152, v154);
        v155 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v151, "stringWithFormat:", CFSTR("%@-%@"), v152, &stru_1E9336E60);
        v155 = objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v149, "setPrevBcp47DeviceLocale:", v155);
      objc_msgSend(v148, "carrierBundleIdentifier");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "setPrevCarrierBundleIdentifier:", v175);

      objc_msgSend(v148, "carrierCountryIsoCode");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "setPrevCarrierCountryIsoCode:", v176);

      objc_msgSend(v149, "ensureExperimentFields");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "setClientTreatmentId:", v203);

      if (v201)
        objc_msgSend(v149, "setClientDeploymentEnv:", v201);
      objc_msgSend(v210, "activationEventDatabase");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "experimentId");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend(v178, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v180, v203, v200);

      if (!v181)
      {
        TRILogCategory_Server();
        v182 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v203;
          _os_log_error_impl(&dword_1D207F000, v182, OS_LOG_TYPE_ERROR, "Unable to delete row from treatments db for treatment %@.", buf, 0xCu);
        }

      }
    }
    else
    {
      TRILogCategory_Server();
      v155 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "experimentId");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v174;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v203;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v229) = v200;
        _os_log_impl(&dword_1D207F000, v155, OS_LOG_TYPE_DEFAULT, "Unable to retrieve activation event for experiment id %{public}@, treatment id %@, deployment id %ul", buf, 0x1Cu);

      }
      v149 = 0;
    }

    if (v200 != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "stringValue");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "setClientDeploymentId:", v184);

    }
    v185 = (void *)MEMORY[0x1E0DC0F08];
    +[TRIDeactivationTriggerEventString categoricalValueForTriggerEvent:](TRIDeactivationTriggerEventString, "categoricalValueForTriggerEvent:", self->_triggerEvent);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "metricWithName:categoricalValue:", CFSTR("trigger_event"), v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask addMetric:](self, "addMetric:", v187);

    if (v149)
      -[TRIExperimentBaseTask mergeTelemetry:](self, "mergeTelemetry:", v149);
  }
  else
  {
    v149 = 0;
    v203 = 0;
  }
  v170 = v211;
LABEL_153:
  if (v198)
    v188 = v198;
  else
    v188 = (void *)MEMORY[0x1E0C9AA60];
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v170, v10 & 1, v188, 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_157:
  return v161;
}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deploymentId") == -1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "experiment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "deploymentId");
    objc_msgSend(v8, "experimentDeployment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deploymentId");

    if (v5 != v7)
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
LABEL_6:

}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_39(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(a2, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "removeDescriptorWithNamespaceName:fromDirectory:", v7, *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
    v6 = v4;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 24) = v6;

}

uint64_t __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  TRINamespaceResolverStorage *v4;
  void *v5;
  TRINamespaceResolverStorage *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;

  v3 = a2;
  v4 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(*(id *)(a1 + 32), "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRINamespaceResolverStorage initWithPaths:](v4, "initWithPaths:", v5);

  LOBYTE(v5) = -[TRINamespaceResolverStorage overwriteActiveFactorProvidersUsingTransaction:fromContext:](v6, "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
  LODWORD(a1) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];

  if ((_DWORD)a1)
    v9 = v8;
  else
    v9 = v7;
  return *v9;
}

void __60__TRIDeactivateTreatmentTask_runUsingContext_withTaskQueue___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDesc");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Notify about updates to namespace %{public}@ (deactivate treatment %@ of experiment %{public}@.", (uint8_t *)&v11, 0x20u);

  }
  v9 = (void *)MEMORY[0x1E0DC0B20];
  objc_msgSend(v3, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyUpdateForNamespaceName:", v10);

}

+ (id)prevTelemetryFieldsFromActivationEventDatabase:(id)a3 deactivatedRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
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
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "treatmentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "experimentDeployment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "treatmentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentDeployment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v10, v11, objc_msgSend(v12, "deploymentId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "osBuild");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPrevOsBuild:", v14);

      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "languageCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "regionCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v13, "regionCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v16, &stru_1E9336E60);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v7, "setPrevBcp47DeviceLocale:", v19);
      objc_msgSend(v13, "carrierBundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPrevCarrierBundleIdentifier:", v22);

      objc_msgSend(v13, "carrierCountryIsoCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPrevCarrierCountryIsoCode:", v23);

      v24 = v7;
    }
    else
    {
      v21 = v7;
    }

  }
  else
  {
    v20 = v7;
  }

  return v7;
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
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "shortDesc");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v32;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on experiment deployment %{public}@ with unspecified type.", (uint8_t *)&v33, 0xCu);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "experimentDeployment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shortDesc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of deactivated shadow evaluation for experiment deployment %{public}@.", (uint8_t *)&v33, 0xCu);

  }
  v18 = objc_alloc(MEMORY[0x1E0DC0A20]);
  objc_msgSend(v9, "shadowEvaluation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mlRuntime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "evaluationId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_msgSend(v18, "initWithType:evaluationId:date:evalState:", 2, v21, v22, 0);

  v24 = objc_alloc(MEMORY[0x1E0DC0AC8]);
  objc_msgSend(v9, "shadowEvaluation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mlRuntime");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithEvaluation:status:", v26, v23);

  objc_msgSend(v6, "evaluationHistoryDatabase");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = objc_msgSend(v28, "addRecord:usingTransaction:", v27, 0);

  if ((v26 & 1) != 0)
  {
LABEL_11:
    v29 = 1;
    goto LABEL_12;
  }
  v29 = 0;
LABEL_12:

  objc_autoreleasePoolPop(v7);
  return v29;
}

- (BOOL)_purgeRolloutLayerIfNecessaryWithRecord:(id)a3 fromAppContainer:(id)a4 paths:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  TRIClientTreatmentStorage *v22;
  NSObject *v23;
  TRIFBClientTreatmentStorage *v24;
  BOOL v25;
  _BOOL4 v26;
  char v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *log;
  os_log_t loga;
  uint8_t buf[4];
  os_log_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "type") == 3 && !objc_msgSend(v9, "deploymentEnvironment"))
  {
    if (!v10)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "experimentDeployment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDesc");
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "treatmentId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v29;
        v41 = 2112;
        v42 = v30;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unexpected nil app container for deactivation of ROLLOUT experiment %{public}@ treatment %@", buf, 0x16u);

      }
      v12 = 0;
      goto LABEL_37;
    }
    objc_msgSend(v11, "pathsForContainer:asClientProcess:", v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v14 == 0;
    if (!v14)
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "identifier");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v21;
        _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Not purging dynamic namespace for missing app container: %{public}@", buf, 0xCu);

      }
      goto LABEL_37;
    }
    objc_msgSend(v9, "namespaces");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 547, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstNamespaceName"));

    }
    v18 = _os_feature_enabled_impl();
    if ((v18 & 1) != 0)
    {
      if ((_os_feature_enabled_impl() & 1) == 0)
      {

LABEL_36:
        v12 = 1;
LABEL_37:

        goto LABEL_4;
      }
      LOBYTE(v19) = 1;
    }
    else
    {
      v22 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v14);
      v19 = -[TRIClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v22, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v17, 0);
      if (!v19)
      {
        TRILogCategory_Server();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "experimentDeployment");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "shortDesc");
          loga = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "treatmentId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = loga;
          v41 = 2112;
          v42 = v33;
          v43 = 2114;
          v44 = v17;
          _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "While deactivating ROLLOUT experiment %{public}@ treatment %@, failed to remove rollout layer for namespace %{public}@.", buf, 0x20u);

        }
      }

      if ((_os_feature_enabled_impl() & 1) == 0)
      {

        if (!v19)
          goto LABEL_37;
        goto LABEL_36;
      }
    }
    v24 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v14);
    v25 = -[TRIFBClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v24, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v17, 0);
    if (v25)
    {
LABEL_32:
      if (v18)
        v27 = v25;
      else
        v27 = v19;

      if ((v27 & 1) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
    TRILogCategory_Server();
    log = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v26)
        goto LABEL_38;
    }
    else if (v26)
    {
LABEL_38:
      objc_msgSend(v9, "experimentDeployment");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "shortDesc");
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "treatmentId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v36;
      v41 = 2112;
      v42 = v32;
      v43 = 2114;
      v44 = v17;
      _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "From flatbuffers, while deactivating ROLLOUT experiment %{public}@ treatment %@, failed to remove rollout layer for namespace %{public}@", buf, 0x20u);

    }
    goto LABEL_32;
  }
  v12 = 1;
LABEL_4:

  return v12;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  TRITaskAttributing *taskAttribution;
  void *v12;
  unint64_t triggerEvent;

  v3 = (void *)objc_opt_new();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v5);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  objc_msgSend(v3, "setFailOnUnrecognizedExperiment:", -[TRIDeactivateTreatmentTask failOnUnrecognizedExperiment](self, "failOnUnrecognizedExperiment"));
  objc_msgSend(v3, "setRetryCount:", -[TRIDeactivateTreatmentTask retryCount](self, "retryCount"));
  -[TRIDeactivateTreatmentTask startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC0F50]);
    -[TRIDeactivateTreatmentTask startTime](self, "startTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithDate:", v9);
    objc_msgSend(v3, "setStartTimestamp:", v10);

  }
  taskAttribution = self->_taskAttribution;
  if (taskAttribution)
  {
    -[TRITaskAttributing asPersistedTaskAttribution](taskAttribution, "asPersistedTaskAttribution");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTaskAttribution:", v12);

  }
  triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 0x19 && ((0x3FFDFFFu >> triggerEvent) & 1) != 0)
    objc_msgSend(v3, "setTriggerEvent:", dword_1D21DA150[triggerEvent]);
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIDeactivateTreatmentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 697, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  objc_class *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  +[TRIPBMessage parseFromData:error:](TRIDeactivateTreatmentPersistedTask, "parseFromData:error:", a3, &v30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v30;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_27:
      v21 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138543362;
    v32 = v4;
    v9 = "Unable to parse buffer as TRIDeactivateTreatmentPersistedTask: %{public}@";
    v10 = v8;
    v11 = 12;
LABEL_8:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v29;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    v15 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_15;
  }
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_15:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_27;
  }
  if (objc_msgSend(v3, "hasFailOnUnrecognizedExperiment"))
    v7 = objc_msgSend(v3, "failOnUnrecognizedExperiment");
  else
    v7 = 0;
  if (objc_msgSend(v3, "hasDeploymentId"))
    v17 = objc_msgSend(v3, "deploymentId");
  else
    v17 = 0xFFFFFFFFLL;
  if (objc_msgSend(v3, "hasTriggerEvent") && (v18 = objc_msgSend(v3, "triggerEvent") - 2, v18 <= 0x17))
    v19 = qword_1D21DA1B8[v18];
  else
    v19 = 0;
  if (objc_msgSend(v3, "hasTaskAttribution"))
  {
    objc_msgSend(v3, "taskAttribution");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v20);
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v9 = "invalid de-serialized TRITaskAttribution pb message";
      v10 = v8;
      v11 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
  }
  v23 = (void *)objc_opt_class();
  objc_msgSend(v3, "experimentId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasStartTimestamp") & 1) != 0)
  {
    objc_msgSend(v3, "startTimestamp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v24, v17, v26, v7, v19, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v24, v17, 0, v7, v19, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v3, "hasRetryCount"))
    v27 = objc_msgSend(v3, "retryCount");
  else
    v27 = 0;
  objc_msgSend(v21, "setRetryCount:", v27);
LABEL_28:

  return v21;
}

- (unint64_t)requiredCapabilities
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIDeactivateTreatmentTask;
  return -[TRIBaseTask requiredCapabilities](&v3, sel_requiredCapabilities);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,r:%d>"), v4, v6, -[TRIDeactivateTreatmentTask retryCount](self, "retryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)trialSystemTelemetry
{
  void *v3;
  TRITaskAttributing *taskAttribution;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIDeactivateTreatmentTask;
  -[TRIExperimentBaseTask trialSystemTelemetry](&v8, sel_trialSystemTelemetry);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  taskAttribution = self->_taskAttribution;
  if (taskAttribution)
  {
    -[TRITaskAttributing teamIdentifier](taskAttribution, "teamIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClientTeamId:", v5);

    if ((objc_msgSend(v3, "hasContainerOriginFields") & 1) == 0)
    {
      +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", self->_taskAttribution);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mergeFrom:", v6);

    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDeactivateTreatmentTask)initWithCoder:(id)a3
{
  id v4;
  TRIDeactivateTreatmentTask *v5;
  void *v6;
  TRIDeactivateTreatmentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeactivateTreatmentTask;
  v5 = -[TRIDeactivateTreatmentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIDeactivateTreatmentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDeactivateTreatmentTask.m"), 851, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIDeactivateTreatmentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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

- (BOOL)failOnUnrecognizedExperiment
{
  return self->_failOnUnrecognizedExperiment;
}

- (void)setFailOnUnrecognizedExperiment:(BOOL)a3
{
  self->_failOnUnrecognizedExperiment = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (TRITaskAttributing)taskAttribution
{
  return self->_taskAttribution;
}

- (void)setTaskAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_taskAttribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
