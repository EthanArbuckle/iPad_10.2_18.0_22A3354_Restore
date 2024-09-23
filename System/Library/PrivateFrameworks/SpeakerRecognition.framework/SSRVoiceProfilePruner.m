@implementation SSRVoiceProfilePruner

- (void)pruneVoiceProfile:(id)a3 forSpIdType:(unint64_t)a4 withAsset:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  SSRLoggingAggregator *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  SSRSpeakerRecognitionContext *v42;
  id *v43;
  uint64_t v44;
  SSRSpeakerRecognitionController *v45;
  id *v46;
  SSRTriggerPhraseDetector *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  void *v53;
  id v54;
  double v55;
  NSObject *v56;
  float v57;
  float v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  NSObject *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  NSObject *v78;
  float v79;
  float v80;
  NSObject *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  NSObject *v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  NSObject *v96;
  unint64_t v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  unint64_t v110;
  uint64_t i;
  void *v112;
  uint64_t v113;
  __int128 v114;
  id v115;
  NSObject *log;
  int loga;
  void *v118;
  char v119;
  int v120;
  id v121;
  int v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  SSRTriggerPhraseDetector *v131;
  SSRSpeakerRecognitionContext *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  SSRSpeakerRecognitionController *v136;
  unint64_t v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  SSRLoggingAggregator *v142;
  _QWORD v143[9];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _QWORD v148[9];
  uint64_t v149;
  float *v150;
  uint64_t v151;
  int v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  int v156;
  uint64_t v157;
  float *v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  float *v162;
  uint64_t v163;
  int v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  id obj;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  void *v177;
  uint8_t v178[128];
  uint8_t buf[4];
  const char *v180;
  __int16 v181;
  _BYTE v182[44];
  __int16 v183;
  double v184;
  __int16 v185;
  double v186;
  __int16 v187;
  double v188;
  __int16 v189;
  double v190;
  _BYTE v191[128];
  id v192;
  _QWORD v193[3];
  _QWORD v194[6];

  v194[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if ((CSIsIOS() & 1) != 0)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v10 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        v181 = 1026;
        *(_DWORD *)v182 = a4;
        v11 = "%s Called with explicit spId type %{public}d - Bailing out";
        v12 = v10;
        v13 = 18;
LABEL_7:
        _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    v15 = [SSRLoggingAggregator alloc];
    objc_msgSend(v8, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = -[SSRLoggingAggregator initWithEvent:locale:configVersion:](v15, "initWithEvent:locale:configVersion:", CFSTR("pruning"), v16, v17);

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 28);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getExplicitEnrollmentUtterancesForType:", 1);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getImplicitEnrollmentUtterancesForType:", 1);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v9, "pruningNumRetentionUtterance");
    objc_msgSend(v8, "pruningCookie");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voiceProfilePruningCookie");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pruningThresholdPSR");
    v21 = v20;
    objc_msgSend(v9, "pruningThresholdSAT");
    v23 = v22;
    objc_msgSend(v9, "pruningExplicitUttThresholdPSR");
    v25 = v24;
    objc_msgSend(v9, "pruningExplicitUttThresholdSAT");
    v27 = v26;
    objc_msgSend(v9, "satVTImplicitThreshold");
    v29 = v28;
    v30 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
      v181 = 2114;
      *(_QWORD *)v182 = v19;
      *(_WORD *)&v182[8] = 2114;
      *(_QWORD *)&v182[10] = v18;
      _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s Voice Profile pruning cookie from Asset %{public}@ lastCookie %{public}@", buf, 0x20u);
    }
    if (v19)
    {
      if (!v18 || !objc_msgSend(v18, "isEqualToString:", v19))
      {
        v33 = objc_msgSend(v8, "updatePruningCookie:", v19);
        v34 = *MEMORY[0x24BE284B8];
        if ((v33 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
            v181 = 2114;
            *(_QWORD *)v182 = v141;
            *(_WORD *)&v182[8] = 2114;
            *(_QWORD *)&v182[10] = v140;
            _os_log_impl(&dword_2117D4000, v34, OS_LOG_TYPE_DEFAULT, "%s Explicit utterances: %{public}@, Implicit utterances: %{public}@", buf, 0x20u);
          }
          if (v141)
          {
            if ((unint64_t)objc_msgSend(v141, "count") > 3)
            {
              if (v140 && objc_msgSend(v140, "count"))
              {
                v37 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                  _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s Pruning(1)::----------------------------- Retrain profile to create explicit model ---------------------------------------", buf, 0xCu);
                }
                -[SSRVoiceProfilePruner _retrainVoiceProfile:withAsset:](self, "_retrainVoiceProfile:withAsset:", v8, v9);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (v38)
                {
                  v39 = *MEMORY[0x24BE284B8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                    v181 = 2114;
                    *(_QWORD *)v182 = v38;
                    _os_log_error_impl(&dword_2117D4000, v39, OS_LOG_TYPE_ERROR, "%s ERR: creating pruning voice profile failed with %{public}@", buf, 0x16u);
                  }
                  -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 5);
                  -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");

                }
                else
                {
                  v194[0] = &unk_24CC9A0B8;
                  v193[0] = CFSTR("SSRSpeakerRecognitionStyle");
                  v193[1] = CFSTR("SSRSpeakerRecognitionProfileArray");
                  v192 = v8;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v192, 1);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v194[1] = v41;
                  v193[2] = CFSTR("SSRSpeakerRecognitionAsset");
                  v194[2] = v9;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v194, v193, 3);
                  v118 = (void *)objc_claimAutoreleasedReturnValue();

                  v171 = 0;
                  v172 = &v171;
                  v173 = 0x3032000000;
                  v174 = __Block_byref_object_copy__4627;
                  v175 = __Block_byref_object_dispose__4628;
                  v176 = 0;
                  v42 = [SSRSpeakerRecognitionContext alloc];
                  v43 = (id *)(v172 + 5);
                  obj = (id)v172[5];
                  v132 = -[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:](v42, "initWithVoiceRecognitionContext:error:", v118, &obj);
                  objc_storeStrong(v43, obj);
                  v44 = v172[5];
                  if (v44 || !v132)
                  {
                    v72 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      v181 = 2114;
                      *(_QWORD *)v182 = v44;
                      _os_log_error_impl(&dword_2117D4000, v72, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create SSR context with error %{public}@ - Bailing out", buf, 0x16u);
                    }
                    v138 = 0;
                    v134 = 0;
                  }
                  else
                  {
                    v45 = [SSRSpeakerRecognitionController alloc];
                    v46 = (id *)(v172 + 5);
                    v169 = (id)v172[5];
                    v136 = -[SSRSpeakerRecognitionController initWithContext:withDelegate:error:](v45, "initWithContext:withDelegate:error:", v132, self, &v169);
                    objc_storeStrong(v46, v169);
                    v47 = [SSRTriggerPhraseDetector alloc];
                    objc_msgSend(v8, "locale");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v131 = -[SSRTriggerPhraseDetector initWithLocale:asset:](v47, "initWithLocale:asset:", v48, v9);

                    v49 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_2117D4000, v49, OS_LOG_TYPE_DEFAULT, "%s Pruning(2)::----------------------------- Check Explicit Utterance scores ---------------------------------------", buf, 0xCu);
                    }
                    v167 = 0u;
                    v168 = 0u;
                    v165 = 0u;
                    v166 = 0u;
                    v121 = v141;
                    v50 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
                    if (v50)
                    {
                      v119 = 0;
                      v122 = 0;
                      v128 = *(_QWORD *)v166;
                      *(_QWORD *)&v51 = 136315138;
                      v114 = v51;
                      while (2)
                      {
                        v52 = 0;
                        v125 = v50;
                        do
                        {
                          if (*(_QWORD *)v166 != v128)
                            objc_enumerationMutation(v121);
                          v53 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v52);
                          v161 = 0;
                          v162 = (float *)&v161;
                          v163 = 0x2020000000;
                          v164 = -8388608;
                          v157 = 0;
                          v158 = (float *)&v157;
                          v159 = 0x2020000000;
                          v160 = -8388608;
                          v153 = 0;
                          v154 = &v153;
                          v155 = 0x2020000000;
                          v156 = -8388608;
                          v149 = 0;
                          v150 = (float *)&v149;
                          v151 = 0x2020000000;
                          v152 = -8388608;
                          v54 = -[SSRSpeakerRecognitionController resetWithContext:](v136, "resetWithContext:", v132, v114);
                          v148[0] = MEMORY[0x24BDAC760];
                          v148[1] = 3221225472;
                          v148[2] = __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke;
                          v148[3] = &unk_24CC85720;
                          v148[4] = &v171;
                          v148[5] = &v161;
                          v148[6] = &v157;
                          v148[7] = &v153;
                          v148[8] = &v149;
                          -[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:](self, "_getScoresForAudio:withController:withDetector:forProfile:withCompletion:", v53, v136, v131, v8, v148);
                          v133 = v172[5];
                          if (v133)
                          {
                            v56 = *MEMORY[0x24BE284B8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = v114;
                              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                              _os_log_error_impl(&dword_2117D4000, v56, OS_LOG_TYPE_ERROR, "%s ERR: ScoreCard is nil in voice profile pruning - Bailing out", buf, 0xCu);
                            }
                            -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 6);
                            -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
                          }
                          else
                          {
                            v57 = v162[6];
                            if (v57 <= 0.0 || v57 <= v27 || (v58 = v158[6], v58 <= 0.0) || v58 <= v25)
                            {
                              LODWORD(v55) = *((_DWORD *)v154 + 6);
                              -[SSRLoggingAggregator appendVoiceProfileFailedExplicitUtteranceScoreWith:](v142, "appendVoiceProfileFailedExplicitUtteranceScoreWith:", v55);
                              v65 = (id)*MEMORY[0x24BE284B8];
                              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                              {
                                objc_msgSend(v53, "lastPathComponent");
                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                v67 = v150[6];
                                v68 = v162[6];
                                v69 = v158[6];
                                v70 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                v181 = 1026;
                                *(_DWORD *)v182 = v122;
                                *(_WORD *)&v182[4] = 2114;
                                *(_QWORD *)&v182[6] = v66;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v67;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v68;
                                v183 = 2050;
                                v184 = v27;
                                v185 = 2050;
                                v186 = v69;
                                v187 = 2050;
                                v188 = v25;
                                v189 = 2050;
                                v190 = v70;
                                _os_log_error_impl(&dword_2117D4000, v65, OS_LOG_TYPE_ERROR, "%s Low Score Explicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);

                              }
                              v119 = 1;
                            }
                            else
                            {
                              log = (id)*MEMORY[0x24BE284B8];
                              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend(v53, "lastPathComponent");
                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                v60 = v150[6];
                                v61 = v162[6];
                                v62 = v158[6];
                                v63 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                v181 = 1026;
                                *(_DWORD *)v182 = v122;
                                *(_WORD *)&v182[4] = 2114;
                                *(_QWORD *)&v182[6] = v59;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v60;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v61;
                                v183 = 2050;
                                v184 = v27;
                                v185 = 2050;
                                v186 = v62;
                                v187 = 2050;
                                v188 = v25;
                                v189 = 2050;
                                v190 = v63;
                                _os_log_impl(&dword_2117D4000, log, OS_LOG_TYPE_DEFAULT, "%s Explicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f(%{public}.3f) C:%{public}.3f", buf, 0x62u);

                              }
                              LODWORD(v64) = *((_DWORD *)v154 + 6);
                              -[SSRLoggingAggregator appendVoiceProfileExplicitUtteranceScoreWith:](v142, "appendVoiceProfileExplicitUtteranceScoreWith:", v64);
                            }
                            ++v122;
                          }
                          _Block_object_dispose(&v149, 8);
                          _Block_object_dispose(&v153, 8);
                          _Block_object_dispose(&v157, 8);
                          _Block_object_dispose(&v161, 8);
                          if (v133)
                          {
LABEL_107:

LABEL_108:
                            v138 = 0;
                            v134 = 0;
                            goto LABEL_109;
                          }
                          ++v52;
                        }
                        while (v125 != v52);
                        v50 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v165, v191, 16);
                        if (v50)
                          continue;
                        break;
                      }

                      if ((v119 & 1) != 0)
                      {
                        v71 = *MEMORY[0x24BE284B8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = v114;
                          v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                          _os_log_error_impl(&dword_2117D4000, v71, OS_LOG_TYPE_ERROR, "%s ERR: Detected explicit utterances with lower scores, Bailing out", buf, 0xCu);
                        }
                        -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 4);
                        -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
                        goto LABEL_108;
                      }
                    }
                    else
                    {

                    }
                    v73 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_2117D4000, v73, OS_LOG_TYPE_DEFAULT, "%s Pruning(3)::----------------------------- Implicit selection ---------------------------------------", buf, 0xCu);
                    }
                    v146 = 0u;
                    v147 = 0u;
                    v144 = 0u;
                    v145 = 0u;
                    v115 = v140;
                    v74 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
                    if (v74)
                    {
                      v120 = 0;
                      loga = 0;
                      v126 = *(_QWORD *)v145;
                      while (2)
                      {
                        v75 = 0;
                        v123 = v74;
                        do
                        {
                          if (*(_QWORD *)v145 != v126)
                            objc_enumerationMutation(v115);
                          v76 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v75);
                          v161 = 0;
                          v162 = (float *)&v161;
                          v163 = 0x2020000000;
                          v164 = -8388608;
                          v157 = 0;
                          v158 = (float *)&v157;
                          v159 = 0x2020000000;
                          v160 = -8388608;
                          v153 = 0;
                          v154 = &v153;
                          v155 = 0x2020000000;
                          v156 = -8388608;
                          v149 = 0;
                          v150 = (float *)&v149;
                          v151 = 0x2020000000;
                          v152 = -8388608;
                          v77 = -[SSRSpeakerRecognitionController resetWithContext:](v136, "resetWithContext:", v132);
                          v143[0] = MEMORY[0x24BDAC760];
                          v143[1] = 3221225472;
                          v143[2] = __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke_9;
                          v143[3] = &unk_24CC85720;
                          v143[4] = &v171;
                          v143[5] = &v161;
                          v143[6] = &v157;
                          v143[7] = &v153;
                          v143[8] = &v149;
                          -[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:](self, "_getScoresForAudio:withController:withDetector:forProfile:withCompletion:", v76, v136, v131, v8, v143);
                          v129 = v76;
                          v135 = v172[5];
                          if (v135)
                          {
                            v78 = *MEMORY[0x24BE284B8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 136315138;
                              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                              _os_log_error_impl(&dword_2117D4000, v78, OS_LOG_TYPE_ERROR, "%s ERR: ScoreCard is nil in voice profile pruning - Bailing out", buf, 0xCu);
                            }
                            -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 6);
                            -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
                          }
                          else
                          {
                            if (v150[6] <= v29
                              || (v79 = v162[6], v79 <= 0.0)
                              || v79 <= v23
                              || (v80 = v158[6], v80 <= 0.0)
                              || v80 <= v21)
                            {
                              v88 = (id)*MEMORY[0x24BE284B8];
                              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                              {
                                objc_msgSend(v129, "lastPathComponent");
                                v91 = (void *)objc_claimAutoreleasedReturnValue();
                                v92 = v150[6];
                                v93 = v162[6];
                                v94 = v158[6];
                                v95 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                v181 = 1026;
                                *(_DWORD *)v182 = v120;
                                *(_WORD *)&v182[4] = 2114;
                                *(_QWORD *)&v182[6] = v91;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v92;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v93;
                                v183 = 2050;
                                v184 = v23;
                                v185 = 2050;
                                v186 = v94;
                                v187 = 2050;
                                v188 = v21;
                                v189 = 2050;
                                v190 = v95;
                                _os_log_error_impl(&dword_2117D4000, v88, OS_LOG_TYPE_ERROR, "%s Deleting low Score Implicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);

                              }
                              LODWORD(v89) = *((_DWORD *)v154 + 6);
                              -[SSRLoggingAggregator appendVoiceProfileDiscardedImplicitUtteranceScoreWith:](v142, "appendVoiceProfileDiscardedImplicitUtteranceScoreWith:", v89);
                              v177 = v129;
                              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v177, 1);
                              v90 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SSRVoiceProfilePruner _deleteUtterances:](self, "_deleteUtterances:", v90);

                              ++loga;
                            }
                            else
                            {
                              v81 = (id)*MEMORY[0x24BE284B8];
                              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend(v129, "lastPathComponent");
                                v82 = (void *)objc_claimAutoreleasedReturnValue();
                                v83 = v150[6];
                                v84 = v162[6];
                                v85 = v158[6];
                                v86 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                v181 = 1026;
                                *(_DWORD *)v182 = v120;
                                *(_WORD *)&v182[4] = 2114;
                                *(_QWORD *)&v182[6] = v82;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v83;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v84;
                                v183 = 2050;
                                v184 = v23;
                                v185 = 2050;
                                v186 = v85;
                                v187 = 2050;
                                v188 = v21;
                                v189 = 2050;
                                v190 = v86;
                                _os_log_impl(&dword_2117D4000, v81, OS_LOG_TYPE_DEFAULT, "%s Implicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);

                              }
                              LODWORD(v87) = *((_DWORD *)v154 + 6);
                              -[SSRLoggingAggregator appendVoiceProfileImplicitUtteranceScoreWith:](v142, "appendVoiceProfileImplicitUtteranceScoreWith:", v87);
                            }
                            ++v120;
                          }
                          _Block_object_dispose(&v149, 8);
                          _Block_object_dispose(&v153, 8);
                          _Block_object_dispose(&v157, 8);
                          _Block_object_dispose(&v161, 8);
                          if (v135)
                          {
                            v121 = v115;
                            goto LABEL_107;
                          }
                          ++v75;
                        }
                        while (v123 != v75);
                        v74 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
                        if (v74)
                          continue;
                        break;
                      }
                    }
                    else
                    {
                      loga = 0;
                    }

                    -[SSRLoggingAggregator setVoiceProfileDiscardedUtteranceCount:](v142, "setVoiceProfileDiscardedUtteranceCount:", loga);
                    v96 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_2117D4000, v96, OS_LOG_TYPE_DEFAULT, "%s Pruning(4)::----------------------------- Implicit sampling ---------------------------------------", buf, 0xCu);
                    }
                    objc_msgSend(v8, "getImplicitEnrollmentUtterancesForType:", a4);
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = v137 + objc_msgSend(v134, "count") - 1;
                    v127 = v97 / v137;
                    if (v137 <= v97)
                    {
                      v130 = objc_msgSend(v121, "count");
                      v110 = 0;
                      v124 = v137 + 5;
                      for (i = -1; v110 < objc_msgSend(v134, "count"); --i)
                      {
                        if (v110 % v127)
                        {
                          objc_msgSend(v134, "objectAtIndexedSubscript:", v110);
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v139, "addObject:", v112);

                        }
                        else
                        {
                          ++v130;
                        }
                        v113 = objc_msgSend(v134, "count");
                        if (v124 > v130 && i + v113 <= v124 - v130)
                          break;
                        ++v110;
                      }
                    }
                    v98 = (id)*MEMORY[0x24BE284B8];
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      v99 = objc_msgSend(v134, "count");
                      v100 = objc_msgSend(v139, "count");
                      *(_DWORD *)buf = 136316162;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      v181 = 2050;
                      *(_QWORD *)v182 = v99;
                      *(_WORD *)&v182[8] = 2050;
                      *(_QWORD *)&v182[10] = v127;
                      *(_WORD *)&v182[18] = 2050;
                      *(_QWORD *)&v182[20] = v137;
                      *(_WORD *)&v182[28] = 2050;
                      *(_QWORD *)&v182[30] = v100;
                      _os_log_impl(&dword_2117D4000, v98, OS_LOG_TYPE_DEFAULT, "%s Utterance selection totalImplicit: %{public}lu selectionIndex: %{public}lu retentionCount: %{public}lu deleteCount: %{public}lu ", buf, 0x34u);
                    }

                    if (v139 && objc_msgSend(v139, "count"))
                    {
                      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v134);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v139);
                      v102 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "minusSet:", v102);
                      objc_msgSend(v101, "allObjects");
                      v138 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v138 = v134;
                    }
                    v103 = (id)*MEMORY[0x24BE284B8];
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    {
                      v104 = objc_msgSend(v139, "count");
                      *(_DWORD *)buf = 136315650;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      v181 = 2048;
                      *(_QWORD *)v182 = v104;
                      *(_WORD *)&v182[8] = 2114;
                      *(_QWORD *)&v182[10] = v139;
                      _os_log_impl(&dword_2117D4000, v103, OS_LOG_TYPE_DEFAULT, "%s Deleting implicit utterances(%lu) - %{public}@", buf, 0x20u);
                    }

                    -[SSRVoiceProfilePruner _deleteUtterances:](self, "_deleteUtterances:", v139);
                    -[SSRLoggingAggregator setVoiceProfilePrunedUtteranceCount:](v142, "setVoiceProfilePrunedUtteranceCount:", objc_msgSend(v139, "count"));
                    -[SSRLoggingAggregator setVoiceProfileRetainedUtteranceCount:](v142, "setVoiceProfileRetainedUtteranceCount:", objc_msgSend(v138, "count"));
                    v105 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_2117D4000, v105, OS_LOG_TYPE_DEFAULT, "%s Pruning(5)::----------------------------- Retrain the voice profile ---------------------------------------", buf, 0xCu);
                    }
                    -[SSRVoiceProfilePruner _retrainVoiceProfile:withAsset:](self, "_retrainVoiceProfile:withAsset:", v8, v9);
                    v106 = objc_claimAutoreleasedReturnValue();
                    v107 = (void *)v172[5];
                    v172[5] = v106;

                    v108 = v172[5];
                    if (v108)
                    {
                      v109 = *MEMORY[0x24BE284B8];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                        v181 = 2114;
                        *(_QWORD *)v182 = v108;
                        _os_log_error_impl(&dword_2117D4000, v109, OS_LOG_TYPE_ERROR, "%s ERR: creating pruning voice profile failed with %{public}@", buf, 0x16u);
                      }
                      -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 7);
                    }
                    -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
LABEL_109:

                  }
                  _Block_object_dispose(&v171, 8);

                }
              }
              else
              {
                v40 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                  _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Zero implicit utterances - Bailing out", buf, 0xCu);
                }
                -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 3);
                -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
              }
            }
            else
            {
              v35 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s ERR: Low explicit utterances - Bailing out", buf, 0xCu);
              }
              -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 2);
              -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
            }
          }
          else
          {
            v36 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
              _os_log_error_impl(&dword_2117D4000, v36, OS_LOG_TYPE_ERROR, "%s ERR: No explicit utterances!!! - Bailing out", buf, 0xCu);
            }
            -[SSRLoggingAggregator setVoiceProfilePruningFailureReasonCode:](v142, "setVoiceProfilePruningFailureReasonCode:", 1);
            -[SSRLoggingAggregator pushAnalytics](v142, "pushAnalytics");
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
          _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Failed updating pruning cookie", buf, 0xCu);
        }
        goto LABEL_42;
      }
      v31 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        v32 = "%s Already pruned voice profile - Bailing out";
LABEL_25:
        _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
      }
    }
    else
    {
      v31 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        v32 = "%s Pruning cookie unavailable from asset - Bailing out";
        goto LABEL_25;
      }
    }
LABEL_42:

    goto LABEL_43;
  }
  v14 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
    v11 = "%s ";
    v12 = v14;
    v13 = 12;
    goto LABEL_7;
  }
LABEL_43:

}

- (void)_getScoresForAudio:(id)a3 withController:(id)a4 withDetector:(id)a5 forProfile:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, float, float, float, float);
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  _QWORD v40[6];
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  _BYTE v44[40];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  _BYTE buf[24];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v39 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, float, float, float, float))a7;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__4627;
  v49 = __Block_byref_object_dispose__4628;
  v50 = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke;
  v41[3] = &unk_24CC85748;
  v43 = &v45;
  v15 = v12;
  v42 = v15;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v11, v44, 640, v41);
  if (!v46[5])
  {
    objc_msgSend(v15, "getLatestSpeakerInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get scoreCard - Bailing out"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x24BDD1540];
      v57 = CFSTR("reason");
      v58 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1, v39);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 111, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v46[5];
      v46[5] = v22;

      if (v14)
        v14[2](v14, v46[5], -INFINITY, -INFINITY, -INFINITY, -INFINITY);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LODWORD(v60) = -8388608;
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"), v39);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v13, "profileID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRExpScores"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v13, "profileID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "floatValue");

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spIdKnownUserSATExpScores"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v13, "profileID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");

    }
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke_22;
    v40[3] = &unk_24CC85778;
    v40[4] = &v45;
    v40[5] = buf;
    objc_msgSend(v39, "computeTriggerConfidenceForAudio:withCompletion:", v11, v40);
    if (v46[5])
    {
      v33 = (id)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "lastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v46[5];
        *(_DWORD *)v51 = 136315650;
        v52 = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
        v53 = 2114;
        v54 = v37;
        v55 = 2114;
        v56 = v38;
        _os_log_error_impl(&dword_2117D4000, v33, OS_LOG_TYPE_ERROR, "%s ERR: Failed in trigger processing %{public}@ with %{public}@", v51, 0x20u);

      }
      if (!v14)
        goto LABEL_26;
      v34 = v46[5];
    }
    else
    {
      if (!v14)
      {
LABEL_26:

        _Block_object_dispose(buf, 8);
        goto LABEL_27;
      }
      v34 = 0;
    }
    ((void (*)(void (**)(id, _QWORD, float, float, float, float), uint64_t))v14[2])(v14, v34);
    goto LABEL_26;
  }
  v16 = (id)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v11, "lastPathComponent", v39);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v46[5];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2114;
    v60 = v36;
    _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s ERR: Failed in processing %{public}@ with %{public}@", buf, 0x20u);

  }
  if (v14)
    v14[2](v14, v46[5], -INFINITY, -INFINITY, -INFINITY, -INFINITY);
LABEL_27:

  _Block_object_dispose(&v45, 8);
}

- (id)_retrainVoiceProfile:(id)a3 withAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SSRVoiceProfileRetrainingContext *v8;
  id *v9;
  SSRVoiceProfileRetrainingContext *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  intptr_t v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  id obj;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26 = a4;
  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4627;
  v35 = __Block_byref_object_dispose__4628;
  v36 = 0;
  v43[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
  v43[1] = CFSTR("SSRVoiceRetrainingPayloadProfile");
  v44[0] = v5;
  v44[1] = MEMORY[0x24BDBD1C0];
  v43[2] = CFSTR("SSRVoiceRetrainingAsset");
  v44[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SSRVoiceProfileRetrainingContext alloc];
  v9 = (id *)(v32 + 5);
  obj = (id)v32[5];
  v10 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:](v8, "initWithVoiceRetrainingContext:error:", v7, &obj);
  objc_storeStrong(v9, obj);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __56__SSRVoiceProfilePruner__retrainVoiceProfile_withAsset___block_invoke;
  v27[3] = &unk_24CC857A0;
  v29 = &v31;
  v13 = v11;
  v28 = v13;
  objc_msgSend(v6, "triggerRetrainingVoiceProfile:withContext:withCompletion:", v5, v10, v27);
  v14 = dispatch_time(0, 12000000000);
  v15 = dispatch_group_wait(v13, v14);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v12);
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Pruner: Timeout (%fms) waiting for retraining - Bailing out"), v17 * 1000.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SSRVoiceProfilePruner _retrainVoiceProfile:withAsset:]";
      v41 = 2114;
      v42 = v18;
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v20 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("reason");
    v38 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 707, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v32[5];
    v32[5] = v22;

  }
  v24 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v24;
}

- (unint64_t)_deleteUtterances:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    v8 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      v17 = v6;
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByDeletingPathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("json"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[SSRVoiceProfilePruner _deleteUtterances:]";
          v24 = 2114;
          v25 = v10;
          _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Deleting %{public}@", buf, 0x16u);
        }
        v14 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v10);
        v15 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v12);

      }
      v6 = v17 + v5;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __56__SSRVoiceProfilePruner__retrainVoiceProfile_withAsset___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  void *v8;
  id v9;

  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  else if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endAudio");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "processAudio:withNumberOfSamples:", v8, (unint64_t)objc_msgSend(v8, "length") >> 1);

  }
}

void __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke_22(uint64_t a1, void *a2, float a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

void __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke(_QWORD *a1, void *a2, float a3, float a4, float a5, float a6)
{
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  v12 = a2;
  *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
  *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = a5;
  *(float *)(*(_QWORD *)(a1[7] + 8) + 24) = a6;
  *(float *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;

}

void __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke_9(_QWORD *a1, void *a2, float a3, float a4, float a5, float a6)
{
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  v12 = a2;
  *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = a4;
  *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = a5;
  *(float *)(*(_QWORD *)(a1[7] + 8) + 24) = a6;
  *(float *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;

}

@end
