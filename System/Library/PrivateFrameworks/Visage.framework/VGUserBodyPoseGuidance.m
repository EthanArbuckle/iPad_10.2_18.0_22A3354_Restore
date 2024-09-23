@implementation VGUserBodyPoseGuidance

- (VGUserBodyPoseGuidance)initWithOptions:(id)a3
{
  id v5;
  VGUserBodyPoseGuidance *v6;
  VGUserBodyPoseGuidance *v7;
  id *p_options;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  uint64_t v93;
  NSArray *poseTargets;
  VGUserBodyPoseGuidance *v95;
  objc_super v97;
  _QWORD v98[8];

  v98[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v97.receiver = self;
  v97.super_class = (Class)VGUserBodyPoseGuidance;
  v6 = -[VGUserBodyPoseGuidance init](&v97, sel_init);
  v7 = v6;
  if (v6)
  {
    p_options = (id *)&v6->_options;
    objc_storeStrong((id *)&v6->_options, a3);
    objc_msgSend(*p_options, "torsoHeadTargetMin");
    v10 = v9;
    objc_msgSend(*p_options, "torsoHeadTargetMax");
    v12 = v11;
    objc_msgSend(*p_options, "torsoHeadMarginMin");
    v14 = v13;
    objc_msgSend(*p_options, "torsoHeadMarginMax");
    LODWORD(v16) = v15;
    LODWORD(v17) = v10;
    LODWORD(v18) = v12;
    LODWORD(v19) = v14;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 2, CFSTR("torso - up aligned with head"), 1, 1, 30, 30, v17, v18, v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v20;
    objc_msgSend(*p_options, "shouldersTwistTargetMin");
    v22 = v21;
    objc_msgSend(*p_options, "shouldersTwistTargetMax");
    v24 = v23;
    objc_msgSend(*p_options, "shouldersTwistMarginMin");
    v26 = v25;
    objc_msgSend(*p_options, "shouldersTwistMarginMax");
    LODWORD(v28) = v27;
    LODWORD(v29) = v22;
    LODWORD(v30) = v24;
    LODWORD(v31) = v26;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 3, CFSTR("shoulders - twist relative to head"), 2, 2, 31, 31, v29, v30, v31, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v32;
    objc_msgSend(*p_options, "leftElbowTargetMin");
    v34 = v33;
    objc_msgSend(*p_options, "leftElbowTargetMax");
    v36 = v35;
    objc_msgSend(*p_options, "leftElbowMarginMin");
    v38 = v37;
    objc_msgSend(*p_options, "leftElbowMarginMax");
    LODWORD(v40) = v39;
    LODWORD(v41) = v34;
    LODWORD(v42) = v36;
    LODWORD(v43) = v38;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 0, CFSTR("elbows - left arm"), 3, 4, 33, 32, v41, v42, v43, v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v44;
    objc_msgSend(*p_options, "rightElbowTargetMin");
    v46 = v45;
    objc_msgSend(*p_options, "rightElbowTargetMax");
    v48 = v47;
    objc_msgSend(*p_options, "rightElbowMarginMin");
    v50 = v49;
    objc_msgSend(*p_options, "rightElbowMarginMax");
    LODWORD(v52) = v51;
    LODWORD(v53) = v46;
    LODWORD(v54) = v48;
    LODWORD(v55) = v50;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 1, CFSTR("elbows - right arm"), 4, 3, 34, 35, v53, v54, v55, v52);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v56;
    objc_msgSend(*p_options, "shouldersHeightAsymmetryTargetMin");
    v58 = v57;
    objc_msgSend(*p_options, "shouldersHeightAsymmetryTargetMax");
    v60 = v59;
    objc_msgSend(*p_options, "shouldersHeightAsymmetryMarginMin");
    v62 = v61;
    objc_msgSend(*p_options, "shouldersHeightAsymmetryMarginMax");
    LODWORD(v64) = v63;
    LODWORD(v65) = v58;
    LODWORD(v66) = v60;
    LODWORD(v67) = v62;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 4, CFSTR("shoulders - height asymmetry (degree)"), 5, 5, 36, 36, v65, v66, v67, v64);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v98[4] = v68;
    objc_msgSend(*p_options, "leftShoulderForwardTargetMin");
    v70 = v69;
    objc_msgSend(*p_options, "leftShoulderForwardTargetMax");
    v72 = v71;
    objc_msgSend(*p_options, "leftShoulderForwardMarginMin");
    v74 = v73;
    objc_msgSend(*p_options, "leftShoulderForwardMarginMax");
    LODWORD(v76) = v75;
    LODWORD(v77) = v70;
    LODWORD(v78) = v72;
    LODWORD(v79) = v74;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 5, CFSTR("shoulders - left_shoulder_pos_atlas_space z"), 6, 7, 37, 38, v77, v78, v79, v76);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v98[5] = v80;
    objc_msgSend(*p_options, "rightShoulderForwardTargetMin");
    v82 = v81;
    objc_msgSend(*p_options, "rightShoulderForwardTargetMax");
    v84 = v83;
    objc_msgSend(*p_options, "rightShoulderForwardMarginMin");
    v86 = v85;
    objc_msgSend(*p_options, "rightShoulderForwardMarginMax");
    LODWORD(v88) = v87;
    LODWORD(v89) = v82;
    LODWORD(v90) = v84;
    LODWORD(v91) = v86;
    +[VGUserBodyPoseTarget targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:](VGUserBodyPoseTarget, "targetWithIdentifier:targetDescription:targetMin:targetMax:marginMin:marginMax:feedbackTooSmall:feedbackTooLarge:rejectionReasonTooSmall:rejectionReasonTooLarge:", 6, CFSTR("shoulders - right_shoulder_pos_atlas_space z"), 6, 7, 39, 40, v89, v90, v91, v88);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v98[6] = v92;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 7);
    v93 = objc_claimAutoreleasedReturnValue();
    poseTargets = v7->_poseTargets;
    v7->_poseTargets = (NSArray *)v93;

    v95 = v7;
  }

  return v7;
}

- (float)calculateAggregatedScoreFromScores:(id)a3
{
  id v3;
  unint64_t v4;
  float v5;
  _QWORD v7[5];
  uint64_t v8;
  float *v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v8 = 0;
  v9 = (float *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__VGUserBodyPoseGuidance_calculateAggregatedScoreFromScores___block_invoke;
  v7[3] = &unk_251B22F60;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = objc_msgSend(v3, "count");
  v5 = v9[6] / (float)v4;
  v9[6] = v5;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __61__VGUserBodyPoseGuidance_calculateAggregatedScoreFromScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "value");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

- (id)evaluatePoseValues:(id)a3 atTimestamp:(double)a4
{
  uint64_t v6;
  int v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  NSString *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  NSString *v52;
  float v53;
  float v54;
  NSString *v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  std::string *p_p;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  NSDictionary *v71;
  VGUserBodyPoseGuidance *v73;
  id v74;
  NSArray *obj;
  vg::shared::VisualLogger *v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t i;
  vg::shared::VisualLogger *v87;
  int v88;
  id v89;
  uint64_t v90;
  id v91;
  std::string __p;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[10];
  _QWORD v102[10];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v79 = a3;
  v74 = (id)objc_opt_new();
  v77 = (void *)objc_opt_new();
  v76 = (vg::shared::VisualLogger *)objc_opt_new();
  v87 = (vg::shared::VisualLogger *)vg::shared::VisualLogger::sharedLogger(v76);
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = self->_poseTargets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  v73 = self;
  if (v6)
  {
    v80 = v6;
    v7 = 0;
    v78 = *(_QWORD *)v94;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v94 != v78)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "targetMin");
        objc_msgSend(v10, "setRawValueTargetMin:");
        objc_msgSend(v9, "targetMax");
        objc_msgSend(v10, "setRawValueTargetMax:");
        objc_msgSend(v9, "marginMin");
        objc_msgSend(v10, "setRawValueMarginMin:");
        objc_msgSend(v9, "marginMax");
        objc_msgSend(v10, "setRawValueMarginMax:");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "objectForKeyedSubscript:", v11);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          objc_msgSend(v85, "floatValue");
          v13 = v12;
          objc_msgSend(v10, "setRawValue:");
          objc_msgSend(v9, "targetMax");
          if (v13 <= v14)
          {
            objc_msgSend(v9, "targetMin");
            if (v13 >= *(float *)&v19)
            {
              LODWORD(v19) = 1.0;
              objc_msgSend(v10, "setValue:", v19);
            }
            else
            {
              objc_msgSend(v10, "setFeedback:", objc_msgSend(v9, "feedbackTooSmall"));
              if (!v7)
                v7 = objc_msgSend(v9, "rejectionReasonTooSmall");
              objc_msgSend(v9, "targetMin");
              v21 = v20;
              objc_msgSend(v9, "marginMin");
              *(float *)&v23 = fmaxf(1.0 - (float)((float)(v21 - v13) / v22), 0.0);
              objc_msgSend(v10, "setValue:", v23);
            }
          }
          else
          {
            objc_msgSend(v10, "setFeedback:", objc_msgSend(v9, "feedbackTooLarge"));
            if (!v7)
              v7 = objc_msgSend(v9, "rejectionReasonTooLarge");
            objc_msgSend(v9, "targetMax");
            v16 = v15;
            objc_msgSend(v9, "marginMax");
            *(float *)&v18 = fmaxf(1.0 - (float)((float)(v13 - v16) / v17), 0.0);
            objc_msgSend(v10, "setValue:", v18);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKey:", v10, v24);

          v101[0] = CFSTR("id");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v102[0] = v83;
          v101[1] = CFSTR("description");
          objc_msgSend(v9, "targetDescription");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v102[1] = v84;
          v101[2] = CFSTR("rawValueTargetMin");
          v25 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "targetMin");
          objc_msgSend(v25, "numberWithFloat:");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v102[2] = v82;
          v101[3] = CFSTR("rawValueTargetMax");
          v26 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "targetMax");
          objc_msgSend(v26, "numberWithFloat:");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v102[3] = v81;
          v101[4] = CFSTR("rawValueMarginMin");
          v27 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "marginMin");
          objc_msgSend(v27, "numberWithFloat:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v102[4] = v28;
          v101[5] = CFSTR("rawValueMarginMax");
          v29 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "marginMax");
          objc_msgSend(v29, "numberWithFloat:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v102[5] = v30;
          v101[6] = CFSTR("rawValue");
          *(float *)&v31 = v13;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v102[6] = v32;
          v101[7] = CFSTR("value");
          v33 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v10, "value");
          objc_msgSend(v33, "numberWithFloat:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v102[7] = v34;
          v101[8] = CFSTR("feedback");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "feedback"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v102[8] = v35;
          v101[9] = CFSTR("feedbackStr");
          +[VGBodyPoseFeedbackHelper feedbackToString:](VGBodyPoseFeedbackHelper, "feedbackToString:", objc_msgSend(v10, "feedback"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v102[9] = v36;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 10);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[vg::shared::VisualLogger addObject:](v76, "addObject:", v37);

          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v9, "targetDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("visage.userbodyposeguidance.rawValues.%@"), v39);
          v40 = (NSString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "targetDescription");
          v41 = (NSString *)objc_claimAutoreleasedReturnValue();
          vg::shared::VisualLogger::logFloat(v87, v13, a4, v40, v41);

          objc_msgSend(v9, "targetMin");
          vg::shared::VisualLogger::logFloat(v87, v42, a4, v40, CFSTR("Min"));
          objc_msgSend(v9, "targetMax");
          vg::shared::VisualLogger::logFloat(v87, v43, a4, v40, CFSTR("Max"));
          objc_msgSend(v9, "targetMin");
          v45 = v44;
          objc_msgSend(v9, "marginMin");
          vg::shared::VisualLogger::logFloat(v87, v45 - v46, a4, v40, CFSTR("-MinMargin"));
          objc_msgSend(v9, "targetMax");
          v48 = v47;
          objc_msgSend(v9, "marginMax");
          vg::shared::VisualLogger::logFloat(v87, v48 + v49, a4, v40, CFSTR("+MaxMargin"));
          objc_msgSend(v10, "value");
          v51 = v50;
          objc_msgSend(v9, "targetDescription");
          v52 = (NSString *)objc_claimAutoreleasedReturnValue();
          vg::shared::VisualLogger::logFloat(v87, v51, a4, CFSTR("visage.userbodyposeguidance.scores"), v52);

          objc_msgSend(v10, "value");
          v54 = v53;
          objc_msgSend(v9, "targetDescription");
          v55 = (NSString *)objc_claimAutoreleasedReturnValue();
          vg::shared::VisualLogger::logFloat(v87, v8 + v54, a4, CFSTR("visage.userbodyposeguidance.scoresStacked"), v55);

          v8 = v8 + 1.0;
        }

      }
      v80 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v80);
  }
  else
  {
    v7 = 0;
  }

  v56 = (void *)objc_opt_new();
  objc_msgSend(v56, "setScores:", v77);
  -[VGUserBodyPoseGuidance calculateAggregatedScoreFromScores:](v73, "calculateAggregatedScoreFromScores:", v77);
  objc_msgSend(v56, "setAggregatedScore:");
  objc_msgSend(v56, "aggregatedScore");
  vg::shared::VisualLogger::logFloat(v87, v57, a4, CFSTR("visage.userbodyposeguidance.scores"), CFSTR("aggregatedScore"));
  v99[0] = CFSTR("aggregatedScore");
  v58 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v56, "aggregatedScore");
  objc_msgSend(v58, "numberWithFloat:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = CFSTR("poseValues");
  v100[0] = v59;
  v60 = (void *)-[vg::shared::VisualLogger copy](v76, "copy");
  v100[1] = v60;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v62 = (void *)MEMORY[0x24BDD17C8];
    vg::frame_selection::frameRejectionReasonToString(v7, &__p);
    v63 = 0x24BDD1000;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v62, "stringWithFormat:", CFSTR("Body Pose Guidance filter failed with rejection: %s"), p_p);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v65 = 0;
    v63 = 0x24BDD1000uLL;
  }
  v88 = v7;
  v66 = v65;
  v89 = v66;
  v90 = 0;
  v67 = v61;
  v91 = v67;
  if (v74)
  {
    objc_msgSend(v74, "setRejection:", &v88);
  }
  else
  {

  }
  objc_msgSend(v74, "setFrameState:", v56);
  if (vg::shared::VisualLogger::isLoggerEnabled(v87, CFSTR("visage.userbodyposeguidance.result")))
  {
    v97[0] = CFSTR("aggregatedScore");
    v68 = *(void **)(v63 + 1760);
    objc_msgSend(v56, "aggregatedScore");
    objc_msgSend(v68, "numberWithFloat:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = CFSTR("poseValues");
    v98[0] = v69;
    v70 = (void *)-[vg::shared::VisualLogger copy](v76, "copy");
    v98[1] = v70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
    v71 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    vg::shared::VisualLogger::logDictionary(v87, v71, a4, CFSTR("visage.userbodyposeguidance.result"), 0);
  }

  return v74;
}

- (id)calculatePoseGuidanceFromSkeleton:(float32x4_t)a3 andAtlasToDeviceTransform:(float32x4_t)a4 atTimestamp:(simd_float4)a5
{
  id v10;
  void *v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  float32x4_t v47;
  void *v48;
  float32x4_t v49;
  void *v50;
  void *v51;
  vg::shared::VisualLogger *v52;
  uint64_t *v53;
  id v54;
  void *v55;
  float32x4_t v57;
  float32x4_t v58;
  float v59;
  float v60;
  int32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v70;
  float32x4_t v72;
  float32x4_t v75;
  void *v76;
  _BYTE v77[8];
  void *v78;
  id v79;
  float32x4_t v80;
  _BYTE v81[8];
  void *v82;
  id v83;
  float32x4_t v84;
  _BYTE v85[8];
  void *v86;
  id v87;
  float32x4_t v88;
  _BYTE v89[8];
  void *v90;
  id v91;
  float32x4_t v92;
  _BYTE v93[8];
  void *v94;
  id v95;
  float32x4_t v96;
  _BYTE v97[8];
  void *v98;
  id v99;
  float32x4_t v100;
  _QWORD v101[7];
  _QWORD v102[9];
  simd_float4x4 v103;
  simd_float4x4 v104;

  v102[7] = *MEMORY[0x24BDAC8D0];
  v10 = a8;
  v11 = (void *)objc_opt_new();
  v103.columns[1] = (simd_float4)a3;
  v103.columns[0] = (simd_float4)a2;
  v103.columns[3] = a5;
  v103.columns[2] = (simd_float4)a4;
  v104 = __invert_f4(v103);
  v66 = (float32x4_t)v104.columns[0];
  v67 = (float32x4_t)v104.columns[1];
  v68 = (float32x4_t)v104.columns[3];
  v70 = (float32x4_t)v104.columns[2];
  v100.i32[2] = 0;
  v100.i64[0] = 0;
  if (!device_space_joint_pos(&v100, v10, 19))
  {
    missing_joint(CFSTR("LeftShoulder"), (uint64_t)v97);
    if (!v11)
    {

      v55 = v98;
      goto LABEL_31;
    }
    objc_msgSend(v11, "setRejection:", v97);
LABEL_32:
    v54 = v11;
    goto LABEL_33;
  }
  v96.i32[2] = 0;
  v96.i64[0] = 0;
  if (!device_space_joint_pos(&v96, v10, 15))
  {
    missing_joint(CFSTR("RightShoulder"), (uint64_t)v93);
    if (!v11)
    {

      v55 = v94;
      goto LABEL_31;
    }
    objc_msgSend(v11, "setRejection:", v93);
    goto LABEL_32;
  }
  v92.i32[2] = 0;
  v92.i64[0] = 0;
  if (!device_space_joint_pos(&v92, v10, 20))
  {
    missing_joint(CFSTR("LeftElbow"), (uint64_t)v89);
    if (!v11)
    {

      v55 = v90;
      goto LABEL_31;
    }
    objc_msgSend(v11, "setRejection:", v89);
    goto LABEL_32;
  }
  v88.i32[2] = 0;
  v88.i64[0] = 0;
  if (!device_space_joint_pos(&v88, v10, 16))
  {
    missing_joint(CFSTR("RightElbow"), (uint64_t)v85);
    if (!v11)
    {

      v55 = v86;
      goto LABEL_31;
    }
    objc_msgSend(v11, "setRejection:", v85);
    goto LABEL_32;
  }
  v84.i32[2] = 0;
  v84.i64[0] = 0;
  if (!device_space_joint_pos(&v84, v10, 0))
  {
    missing_joint(CFSTR("MidShoulder"), (uint64_t)v81);
    if (!v11)
    {

      v55 = v82;
      goto LABEL_31;
    }
    objc_msgSend(v11, "setRejection:", v81);
    goto LABEL_32;
  }
  v80.i32[2] = 0;
  v80.i64[0] = 0;
  if (!device_space_joint_pos(&v80, v10, 1))
  {
    missing_joint(CFSTR("Spine3"), (uint64_t)v77);
    if (v11)
    {
      objc_msgSend(v11, "setRejection:", v77);
      goto LABEL_32;
    }

    v55 = v78;
LABEL_31:

    goto LABEL_32;
  }
  v12 = vsubq_f32(v92, v100);
  v13 = vmulq_f32(v12, v12);
  v13.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u64[0];
  v13.f32[0] = sqrtf(v13.f32[0]) + 1.0e-16;
  v14 = vsubq_f32(v88, v96);
  v15 = vmulq_f32(v14, v14);
  v15.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).u64[0];
  v15.f32[0] = sqrtf(v15.f32[0]) + 1.0e-16;
  v63 = vdivq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 0));
  v64 = vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0));
  v57 = v96;
  v58 = v100;
  v16 = vsubq_f32(v96, v100);
  v17 = vmulq_f32(v16, v16);
  v17.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
  v17.f32[0] = sqrtf(v17.f32[0]) + 1.0e-16;
  v18 = vdivq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 0));
  v19 = vsubq_f32(v80, v84);
  v20 = vmulq_f32(v19, v19);
  v20.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
  v20.f32[0] = sqrtf(v20.f32[0]) + 1.0e-16;
  v65 = vdivq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 0));
  v61 = (int32x4_t)v18;
  v62 = vnegq_f32(v18);
  v60 = angle_deg_in_2d_plane(v62, a2, a4);
  v59 = angle_deg_in_2d_plane(v62, a2, a3);
  v21 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v65, (int32x4_t)v65), (int8x16_t)v65, 0xCuLL), v62), v65, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v61, v61), (int8x16_t)v61, 0xCuLL));
  v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  v23 = vmulq_f32(v21, v21);
  v23.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), v23)).u64[0];
  v23.f32[0] = sqrtf(v23.f32[0]) + 1.0e-16;
  v75 = vdivq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0));
  v24 = (int32x4_t)vnegq_f32(v65);
  v25 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v75, (int32x4_t)v75), (int8x16_t)v75, 0xCuLL), v65), v75, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v24, v24), (int8x16_t)v24, 0xCuLL));
  v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL);
  v27 = vmulq_f32(v25, v25);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), v27)).u64[0];
  v27.f32[0] = sqrtf(v27.f32[0]) + 1.0e-16;
  v72 = vdivq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0));
  v28 = angle_deg_in_2d_plane(v63, v65, v72);
  v29 = angle_deg_in_2d_plane(v64, v65, v72);
  v30 = deg_angle_between(v75, v63);
  v31 = deg_angle_between(v75, v64);
  v32 = v28;
  if (v30 < 25.0)
  {
    v33 = fminf(fmaxf((float)(25.0 - v30) / 10.0, 0.0), 1.0);
    v32 = (float)(v33 * 90.0) + (float)((float)(1.0 - v33) * v28);
  }
  v34 = fminf(fmaxf((float)(25.0 - v31) / 10.0, 0.0), 1.0);
  v35 = (float)(v34 * -90.0) + (float)((float)(1.0 - v34) * v29);
  if (v31 < 25.0)
    v36 = v35;
  else
    v36 = v29;
  v37 = deg_angle_between(v65, vnegq_f32(a3));
  v101[0] = &unk_251B34B08;
  *(float *)&v38 = v32;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  v102[0] = objc_claimAutoreleasedReturnValue();
  v101[1] = &unk_251B34B20;
  *(float *)&v39 = v36;
  v76 = (void *)v102[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v102[1] = v40;
  v101[2] = &unk_251B34B38;
  *(float *)&v41 = v37;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v102[2] = v42;
  v101[3] = &unk_251B34B50;
  *(float *)&v43 = v60;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v102[3] = v44;
  v101[4] = &unk_251B34B68;
  *(float *)&v45 = v59;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = vaddq_f32(v68, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, v58.f32[0]), v67, *(float32x2_t *)v58.f32, 1), v70, v58, 2));
  v102[4] = v46;
  v101[5] = &unk_251B34B80;
  v47.i32[0] = v47.i32[2];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)v47.i64);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = vaddq_f32(v68, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, v57.f32[0]), v67, *(float32x2_t *)v57.f32, 1), v70, v57, 2));
  v102[5] = v48;
  v101[6] = &unk_251B34B98;
  v49.i32[0] = v49.i32[2];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)v49.i64);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v102[6] = v50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = vg::shared::VisualLogger::sharedLogger(v52);
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v28, a6, CFSTR("visage.userbodyposeguidance.loggedFloats"), CFSTR("LeftElbowRaw"));
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v29, a6, CFSTR("visage.userbodyposeguidance.loggedFloats"), CFSTR("RightElbowRaw"));
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v30, a6, CFSTR("visage.userbodyposeguidance.loggedFloats"), CFSTR("LeftElbowForward"));
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v31, a6, CFSTR("visage.userbodyposeguidance.loggedFloats"), CFSTR("RightElbowForward"));
  objc_msgSend(a1, "evaluatePoseValues:atTimestamp:", v51, a6);
  v54 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_poseTargets, 0);
}

@end
