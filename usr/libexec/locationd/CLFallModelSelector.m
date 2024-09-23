@implementation CLFallModelSelector

- (CLFallModelSelector)init
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLFallModelSelector;
  -[CLFallModelSelector init](&v4, "init");
  if (self)
    self->fSelectionFeatures = objc_opt_new(NSMutableDictionary);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFallModelSelector;
  -[CLFallModelSelector dealloc](&v3, "dealloc");
}

- (BOOL)setSelectionFeatureValue:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->fSelectionFeatures, "setObject:forKey:", a4, a3);
  return 1;
}

- (BOOL)selectModels
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
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
  __int128 v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  unsigned int v84;
  int v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  NSObject *v89;
  NSObject *v90;
  LikelihoodRatioInfo *v91;
  float v92;
  uint64_t v93;
  float v94;
  int v95;
  NSObject *v96;
  double firstBinEdge;
  float binSize;
  int v99;
  double v100;
  double v101;
  float fImpactMaxAccelNormAlertThreshold;
  float fImpactMaxAccelNormLoggingStatsThreshold;
  float fImpactMaxAccelNormLoggingHeartRateThreshold;
  int fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low;
  int v106;
  int v107;
  uint64_t v108;
  uint32_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  double v113;
  unsigned int v114;
  uint64_t v115;
  float v116;
  float v117;
  float v120;
  int v121;
  int v122;
  float v123;
  double v124;
  uint64_t v125;
  int32x2_t v126;
  double v127;
  float v128;
  int v129;
  double v130;
  double v131;
  float v132;
  float v133;
  float v134;
  int v135;
  int v136;
  int v137;
  const char *v138;
  NSObject *v139;
  uint32_t v140;
  float v141;
  uint64_t v142;
  double v143;
  float v144;
  int v145;
  double v146;
  double v147;
  float v148;
  float v149;
  float v150;
  int v151;
  int v152;
  int v153;
  float32x2_t v154;
  uint64_t v156;
  float v157;
  float v158;
  NSObject *v161;
  double v162;
  float v163;
  int v164;
  double v165;
  double v166;
  float v167;
  float v168;
  float v169;
  int v170;
  int v171;
  int v172;
  NSObject *v173;
  double v174;
  float v175;
  int v176;
  double v177;
  double v178;
  float v179;
  float v180;
  float v181;
  int v182;
  int v183;
  int v184;
  id v185;
  id v186;
  int v187;
  int v188;
  id v189;
  id v190;
  unint64_t v191;
  double v192;
  float v193;
  float v194;
  float v195;
  float v196;
  unsigned int v197;
  float v198;
  uint8_t buf[8];
  _BYTE v200[10];
  __int16 v201;
  double v202;
  __int16 v203;
  _BYTE v204[64];
  _BYTE v205[10];
  _BYTE v206[14];
  __int16 v207;
  float v208;
  __int16 v209;
  float v210;
  __int16 v211;
  int v212;
  __int16 v213;
  int v214;
  __int16 v215;
  int v216;

  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX = xmmword_1022FE7F0;
  LODWORD(self->fTripFallModel.fRatioMaxAbsX[16]) = dword_1022FE830;
  v3 = xmmword_1022FE820;
  v4 = xmmword_1022FE800;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8] = unk_1022FE810;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12] = v3;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4] = v4;
  LODWORD(self->fTripFallModel.fRatioMaxAbsY[16]) = dword_1022FE874;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12] = unk_1022FE864;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8] = unk_1022FE854;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4] = unk_1022FE844;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY = *(_OWORD *)algn_1022FE834;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ = unk_1022FE878;
  v5 = unk_1022FE888;
  v6 = unk_1022FE898;
  v7 = unk_1022FE8A8;
  LODWORD(self->fTripFallModel.fRatioMaxAbsZ[16]) = dword_1022FE8B8;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12] = v7;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8] = v6;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4] = v5;
  memcpy(self->fTripFallModel.fRatioMaxJerkVM, &unk_1022FE8BC, sizeof(self->fTripFallModel.fRatioMaxJerkVM));
  v8 = unk_1022FE9D8;
  *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ = xmmword_1022FE9C8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4] = v8;
  LODWORD(self->fTripFallModel.fRatioMinInertialZ[20]) = dword_1022FEA18;
  v9 = xmmword_1022FEA08;
  v10 = xmmword_1022FE9E8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12] = unk_1022FE9F8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16] = v9;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8] = v10;
  v11 = qword_1022FEA3C;
  v12 = unk_1022FEA2C;
  *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength = xmmword_1022FEA1C;
  *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4] = v12;
  *(_QWORD *)&self->fTripFallModel.fRatioAccelPathLength[8] = v11;
  v13 = xmmword_1022FEA44;
  v14 = *(_OWORD *)algn_1022FEA54;
  v15 = unk_1022FEA74;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8] = xmmword_1022FEA64;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12] = v15;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact = v13;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4] = v14;
  v16 = xmmword_1022FEA84;
  v17 = *(_OWORD *)algn_1022FEA94;
  v18 = unk_1022FEAB4;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8] = xmmword_1022FEAA4;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12] = v18;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact = v16;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4] = v17;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].firstBinEdge = xmmword_1022FEAC4;
  v19 = xmmword_1022FEAD4;
  v20 = unk_1022FEAE4;
  v21 = xmmword_1022FEAF4;
  *(_QWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[5].binSize = qword_1022FEB04;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum = v20;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].firstBinEdge = v21;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].binSize = v19;
  v22 = xmmword_1022FEB0C;
  v23 = unk_1022FEB1C;
  v24 = xmmword_1022FEB2C;
  v25 = unk_1022FEB3C;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsX[10]) = dword_1022FEB4C;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2] = v24;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6] = v25;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].firstBinEdge = v22;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].binSize = v23;
  v26 = unk_1022FEB50;
  v27 = unk_1022FEB60;
  v28 = unk_1022FEB70;
  v29 = unk_1022FEB80;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsY[10]) = dword_1022FEB90;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2] = v28;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6] = v29;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11] = v26;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15] = v27;
  v30 = *(_OWORD *)algn_1022FEB94;
  v31 = unk_1022FEBA4;
  v32 = unk_1022FEBB4;
  v33 = unk_1022FEBC4;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsZ[10]) = dword_1022FEBD4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2] = v32;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6] = v33;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11] = v30;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15] = v31;
  memcpy(&self->fSlipFallModel.fRatioMaxAbsZ[11], &unk_1022FEBD8, 0x10CuLL);
  v34 = unk_1022FED14;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2] = xmmword_1022FED04;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6] = v34;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10] = xmmword_1022FED24;
  LODWORD(self->fSlipFallModel.fRatioMinInertialZ[14]) = dword_1022FED34;
  v35 = unk_1022FECF4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61] = xmmword_1022FECE4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65] = v35;
  v36 = unk_1022FED48;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15] = xmmword_1022FED38;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19] = v36;
  *(_QWORD *)&self->fSlipFallModel.fRatioAccelPathLength[2] = qword_1022FED58;
  v37 = xmmword_1022FED80;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6] = unk_1022FED90;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2] = v37;
  v38 = xmmword_1022FED60;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8] = *(_OWORD *)algn_1022FED70;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4] = v38;
  v39 = xmmword_1022FEDC0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6] = unk_1022FEDD0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2] = v39;
  v40 = xmmword_1022FEDA0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14] = *(_OWORD *)algn_1022FEDB0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10] = v40;
  v41 = unk_1022FEDF0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10] = xmmword_1022FEDE0;
  v42 = xmmword_1022FEE00;
  v43 = unk_1022FEE10;
  *(_QWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].binSize = qword_1022FEE20;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].firstBinEdge = v43;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum = v42;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14] = v41;
  v44 = xmmword_1022FEE28;
  v45 = unk_1022FEE38;
  v46 = xmmword_1022FEE48;
  v47 = unk_1022FEE58;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsX[4]) = dword_1022FEE68;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum = v46;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX = v47;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].firstBinEdge = v44;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].binSize = v45;
  v48 = unk_1022FEE6C;
  v49 = unk_1022FEE7C;
  v50 = unk_1022FEE8C;
  v51 = unk_1022FEE9C;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsY[4]) = dword_1022FEEAC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13] = v50;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY = v51;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5] = v48;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9] = v49;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5] = unk_1022FEEB0;
  v52 = unk_1022FEEC0;
  v53 = unk_1022FEED0;
  v54 = unk_1022FEEE0;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsZ[4]) = dword_1022FEEF0;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ = v54;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13] = v53;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9] = v52;
  memcpy(&self->fOtherFallModel.fRatioMaxAbsZ[5], &unk_1022FEEF4, 0x10CuLL);
  v55 = unk_1022FF030;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63] = xmmword_1022FF020;
  *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ = v55;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4] = xmmword_1022FF040;
  LODWORD(self->fOtherFallModel.fRatioMinInertialZ[8]) = dword_1022FF050;
  v56 = unk_1022FF010;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55] = xmmword_1022FF000;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59] = v56;
  v57 = unk_1022FF064;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9] = xmmword_1022FF054;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13] = v57;
  *(_QWORD *)&self->fOtherFallModel.fRatioMinInertialZ[17] = qword_1022FF074;
  v58 = unk_1022FF0AC;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6] = xmmword_1022FF09C;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact = v58;
  v59 = *(_OWORD *)algn_1022FF08C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19] = xmmword_1022FF07C;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2] = v59;
  v60 = unk_1022FF0EC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12] = xmmword_1022FF0DC;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact = v60;
  v61 = *(_OWORD *)algn_1022FF0CC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4] = xmmword_1022FF0BC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8] = v61;
  v62 = xmmword_1022FF0FC;
  v63 = unk_1022FF10C;
  v64 = xmmword_1022FF11C;
  v65 = unk_1022FF12C;
  *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].binSize = qword_1022FF13C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12] = v64;
  *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].firstBinEdge = v65;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4] = v62;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8] = v63;
  v66 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Age"));
  v67 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Gender"));
  v68 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Height"));
  v69 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Weight"));
  v70 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Pal"));
  v71 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Vo2max"));
  v72 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("MetMinPercentile"));
  v185 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("MetMinCount"));
  v73 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("Workout"));
  v74 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("HKWorkout"));
  v186 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", CFSTR("BackgroundAWDLoggingEnabled"));
  if (v66)
    objc_msgSend(v66, "floatValue");
  else
    *(float *)&v75 = NAN;
  v198 = *(float *)&v75;
  v197 = objc_msgSend(v67, "intValue");
  if (v68)
    objc_msgSend(v68, "floatValue");
  else
    *(float *)&v76 = NAN;
  v196 = *(float *)&v76;
  if (v69)
    objc_msgSend(v69, "floatValue");
  else
    *(float *)&v77 = NAN;
  v195 = *(float *)&v77;
  if (v70)
    objc_msgSend(v70, "floatValue");
  else
    *(float *)&v78 = NAN;
  v194 = *(float *)&v78;
  if (v71)
    objc_msgSend(v71, "floatValue");
  else
    *(float *)&v79 = NAN;
  v193 = *(float *)&v79;
  if (v72)
    objc_msgSend(v72, "doubleValue");
  else
    *(double *)&v80 = NAN;
  v192 = *(double *)&v80;
  if (v185)
    v81 = objc_msgSend(v72, "integerValue");
  else
    v81 = 0;
  v191 = (unint64_t)v81;
  if (v73)
    v82 = objc_msgSend(v73, "integerValue");
  else
    v82 = 0;
  v190 = v82;
  if (v74)
    v83 = objc_msgSend(v74, "integerValue");
  else
    v83 = 0;
  v189 = v83;
  if (v186)
    v84 = objc_msgSend(v186, "BOOLValue");
  else
    v84 = 0;
  sub_10053E0DC("BehaviorOverrideAge", &v198);
  sub_10053E25C("BehaviorOverrideGender", (int *)&v197);
  sub_10053E0DC("BehaviorOverrideHeight", &v196);
  sub_10053E0DC("BehaviorOverrideWeight", &v195);
  sub_10053E0DC("BehaviorOverridePal", &v194);
  sub_10053E0DC("BehaviorOverrideVO2Max", &v193);
  sub_1001E4804(buf);
  v85 = sub_1001FD98C(*(uint64_t *)buf, "BehaviorOverrideMetMinPercentile", &v192);
  v86 = *(std::__shared_weak_count **)v200;
  if (*(_QWORD *)v200)
  {
    v87 = (unint64_t *)(*(_QWORD *)v200 + 8);
    do
      v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }
  if (v85)
  {
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102142710);
    v89 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(_QWORD *)&v200[2] = "";
      v201 = 2082;
      v202 = COERCE_DOUBLE("BehaviorOverrideMetMinPercentile");
      v203 = 1026;
      *(_DWORD *)v204 = (int)v192;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Overriding behavior feature\", \"key\":%{public, location:escape_only}s, \"value\":%{public}d}", buf, 0x22u);
    }
  }
  sub_10053E3D8("BehaviorOverrideMetMinCount", (uint64_t *)&v191);
  sub_10053E3D8("BehaviorOverrideWorkout", (uint64_t *)&v190);
  sub_10053E3D8("BehaviorOverrideHKWorkout", (uint64_t *)&v189);
  if (qword_10229FD90 != -1)
    dispatch_once(&qword_10229FD90, &stru_102142710);
  v90 = qword_10229FD98;
  if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68291587;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v200 = 2082;
    *(_QWORD *)&v200[2] = "";
    v201 = 2049;
    v202 = v198;
    v203 = 1025;
    *(_DWORD *)v204 = v197;
    *(_WORD *)&v204[4] = 2049;
    *(double *)&v204[6] = v196;
    *(_WORD *)&v204[14] = 2049;
    *(double *)&v204[16] = v195;
    *(_WORD *)&v204[24] = 2049;
    *(double *)&v204[26] = v194;
    *(_WORD *)&v204[34] = 2049;
    *(double *)&v204[36] = v193;
    *(_WORD *)&v204[44] = 2049;
    *(double *)&v204[46] = v192;
    *(_WORD *)&v204[54] = 2049;
    *(_QWORD *)&v204[56] = v191;
    *(_WORD *)v205 = 2049;
    *(_QWORD *)&v205[2] = v190;
    *(_WORD *)v206 = 2049;
    *(_QWORD *)&v206[2] = v189;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Selecting models\", \"age\":\"%{private}f\", \"gender\":%{private}d, \"height\":\"%{private}f\", \"weight\":\"%{private}f\", \"pal\":\"%{private}f\", \"vo2max\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"metminCount\":%{private}ld, \"workout\":%{private}ld, \"hkWorkout\":%{private}ld}", buf, 0x72u);
  }
  v91 = &self->fOtherFallModel.fLikelihoodRatioInfo[2];
  *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[4].binSize = 0x41A0000041033333;
  self->fOtherFallModel.fLikelihoodRatioInfo[5].firstBinEdge = 8.0;
  v92 = v198;
  if ((LODWORD(v198) & 0x7FFFFFFFu) > 0x7F7FFFFF || v198 < 65.0)
  {
    *(_OWORD *)&v91->firstBinEdge = xmmword_101BB5C20;
    *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].binSize = 0x420A666640900000;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].firstBinEdge = 4.3;
    *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize = 0xA00000023;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge = 7.0;
    *(_QWORD *)&self->fThresholds.fImpactMaxAccelNormAlertThreshold = 0x1400000014;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 30;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 257;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 1;
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102142710);
    v96 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
    {
      firstBinEdge = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      binSize = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      v99 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      v100 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      v101 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      fImpactMaxAccelNormAlertThreshold = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      fImpactMaxAccelNormLoggingStatsThreshold = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      fImpactMaxAccelNormLoggingHeartRateThreshold = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v106 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v107 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(_QWORD *)&v200[2] = "";
      v201 = 2050;
      v202 = firstBinEdge;
      v203 = 2049;
      *(double *)v204 = v198;
      *(_WORD *)&v204[8] = 1025;
      *(float *)&v204[10] = binSize;
      *(_WORD *)&v204[14] = 1025;
      *(_DWORD *)&v204[16] = v99;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v100;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v101;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = fImpactMaxAccelNormAlertThreshold;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = fImpactMaxAccelNormLoggingStatsThreshold;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = fImpactMaxAccelNormLoggingHeartRateThreshold;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v106;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v107;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on features\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"age\":\"%{private}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
    }
    if (v84)
    {
      *(_DWORD *)buf = -1;
      v108 = sub_1001FD94C();
      sub_1001C1194(v108, (uint64_t)CFSTR("FallRandomBucket"), buf);
      v109 = *(_DWORD *)buf;
      if (*(_DWORD *)buf >= 6u)
      {
        v109 = arc4random_uniform(6u);
        *(_DWORD *)buf = v109;
        v110 = sub_1001FD94C();
        sub_10011B5B8(v110, CFSTR("FallRandomBucket"), buf);
        v111 = sub_1001FD94C();
        (*(void (**)(uint64_t))(*(_QWORD *)v111 + 944))(v111);
      }
      LODWORD(v91->firstBinEdge) = dword_101C312BC[v109];
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102142710);
      v112 = qword_10229FD98;
      if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEBUG))
      {
        v113 = v91->firstBinEdge;
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(_QWORD *)&v200[2] = "";
        v201 = 2050;
        v202 = v113;
        v203 = 2049;
        *(double *)v204 = v198;
        *(_WORD *)&v204[8] = 2049;
        *(double *)&v204[10] = v192;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Model Selector - Revised thresholds based on background analytics requirements\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\"}", buf, 0x30u);
      }
    }
  }
  else
  {
    *(_OWORD *)&v91->firstBinEdge = xmmword_101BB5C30;
    *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].binSize = 0x420A666640900000;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].firstBinEdge = 4.3;
    *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize = 0xA00000018;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge = 10.0;
    v93 = 0x600000006;
    if ((((_DWORD)v189 - 3) > 0x3E || ((1 << (v189 - 3)) & 0x402931C2835080BFLL) == 0)
      && (_DWORD)v189 != 1)
    {
      v93 = 0x300000002;
    }
    *(_QWORD *)&self->fThresholds.fImpactMaxAccelNormAlertThreshold = v93;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 10;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    if ((*(_QWORD *)&v192 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    {
      v95 = -1;
    }
    else
    {
      v94 = v192;
      if (v94 >= 2.4)
      {
        if (v94 <= 5.1)
        {
          v156 = 0;
          v95 = -1;
          v157 = NAN;
          do
          {
            v158 = vabds_f32(v94, dword_101C309FC[v156]);
            if (v158 < v157 || (LODWORD(v157) & 0x7FFFFFFFu) > 0x7F7FFFFF)
            {
              v95 = v156;
              v157 = v158;
            }
            ++v156;
          }
          while (v156 != 28);
        }
        else
        {
          v95 = 27;
        }
      }
      else
      {
        v95 = 0;
      }
    }
    if (v92 < 68.0)
    {
      v114 = 0;
      goto LABEL_81;
    }
    if (v92 > 86.0)
    {
      v114 = 18;
      goto LABEL_81;
    }
    v115 = 0;
    v114 = -1;
    v116 = NAN;
    do
    {
      v117 = vabds_f32(v92, dword_101C309B0[v115]);
      if (v117 < v116 || (LODWORD(v116) & 0x7FFFFFFFu) > 0x7F7FFFFF)
      {
        v114 = v115;
        v116 = v117;
      }
      ++v115;
    }
    while (v115 != 19);
    if ((v114 & 0x80000000) == 0)
    {
LABEL_81:
      v120 = *((float *)&unk_101C30A6C + v114 + 266);
      if (v95 < 0)
      {
        v91->firstBinEdge = v120;
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_102142710);
        v125 = qword_10229FD98;
        if (!os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEFAULT))
          goto LABEL_96;
        v127 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        v128 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        v129 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        v130 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        v131 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        v132 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        v133 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        v134 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        v135 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        v136 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        v137 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68292355;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(_QWORD *)&v200[2] = "";
        v201 = 2050;
        v202 = v127;
        v203 = 1025;
        *(float *)v204 = v128;
        *(_WORD *)&v204[4] = 1025;
        *(_DWORD *)&v204[6] = v129;
        *(_WORD *)&v204[10] = 2049;
        *(double *)&v204[12] = v198;
        *(_WORD *)&v204[20] = 2049;
        *(double *)&v204[22] = v192;
        *(_WORD *)&v204[30] = 2049;
        *(double *)&v204[32] = v130;
        *(_WORD *)&v204[40] = 2049;
        *(double *)&v204[42] = v131;
        *(_WORD *)&v204[50] = 1025;
        *(float *)&v204[52] = v132;
        *(_WORD *)&v204[56] = 1025;
        *(float *)&v204[58] = v133;
        *(_WORD *)&v204[62] = 1025;
        *(float *)v205 = v134;
        *(_WORD *)&v205[4] = 1025;
        *(_DWORD *)&v205[6] = v135;
        *(_WORD *)v206 = 1025;
        *(_DWORD *)&v206[2] = v136;
        *(_WORD *)&v206[6] = 1025;
        *(_DWORD *)&v206[8] = v137;
        v138 = "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on age only\", \"impactMaxAccelNormAlertT"
               "hreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{priva"
               "te}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{p"
               "rivate}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{p"
               "rivate}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\"
               ":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancel"
               "AlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}";
        v139 = v125;
        v140 = 116;
      }
      else
      {
        v187 = 14;
        v188 = 7;
        sub_10053E25C("BehaviorOverrideThresholdConvergenceMinimumDayCount", &v188);
        sub_10053E25C("BehaviorOverrideThresholdConvergenceMaximumDayCount", &v187);
        v121 = 48 * v188;
        v122 = 48 * v187;
        v123 = (float)(uint64_t)(v191 - 48 * v188) / (float)(48 * v187 - 48 * v188);
        if (v123 >= 0.0)
        {
          v141 = *((float *)&unk_101C30A6C + 19 * v95 + v114);
          if (v123 >= 1.0)
          {
            v91->firstBinEdge = v141;
            v124 = 1.0;
          }
          else
          {
            v91->firstBinEdge = (float)(v120 * (float)(1.0 - v123)) + (float)(v123 * v141);
            v124 = v123;
          }
        }
        else
        {
          v91->firstBinEdge = v120;
          v124 = 0.0;
        }
        if (qword_10229FD90 != -1)
          dispatch_once(&qword_10229FD90, &stru_102142710);
        v142 = qword_10229FD98;
        if (!os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_DEFAULT))
          goto LABEL_96;
        v143 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        v144 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        v145 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        v146 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        v147 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        v148 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        v149 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        v150 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        v151 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        v152 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        v153 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68293379;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(_QWORD *)&v200[2] = "";
        v201 = 2050;
        v202 = v143;
        v203 = 1025;
        *(float *)v204 = v144;
        *(_WORD *)&v204[4] = 1025;
        *(_DWORD *)&v204[6] = v145;
        *(_WORD *)&v204[10] = 1026;
        *(_DWORD *)&v204[12] = v121;
        *(_WORD *)&v204[16] = 1026;
        *(_DWORD *)&v204[18] = v122;
        *(_WORD *)&v204[22] = 2050;
        *(_QWORD *)&v204[24] = v191;
        *(_WORD *)&v204[32] = 2050;
        *(double *)&v204[34] = v124;
        *(_WORD *)&v204[42] = 2049;
        *(double *)&v204[44] = v198;
        *(_WORD *)&v204[52] = 2049;
        *(double *)&v204[54] = v192;
        *(_WORD *)&v204[62] = 2049;
        *(double *)v205 = v146;
        *(_WORD *)&v205[8] = 2049;
        *(double *)v206 = v147;
        *(_WORD *)&v206[8] = 1025;
        *(float *)&v206[10] = v148;
        v207 = 1025;
        v208 = v149;
        v209 = 1025;
        v210 = v150;
        v211 = 1025;
        v212 = v151;
        v213 = 1025;
        v214 = v152;
        v215 = 1025;
        v216 = v153;
        v138 = "{\"msg%{public}.0s\":\"Model Selector - Picked thresholds based on features\", \"impactMaxAccelNormAlertT"
               "hreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{priva"
               "te}d, \"minMetminCount\":%{public}d, \"maxMetminCount\":%{public}d, \"metminCount\":%{public}ld, \"alpha\"
               ":\"%{public}f\", \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThresh"
               "old\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresho"
               "ldLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLi"
               "eThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkout"
               "ShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}";
        v139 = v142;
        v140 = 148;
      }
      _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, v138, buf, v140);
LABEL_96:
      v126.i32[0] = LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge);
      v154 = (float32x2_t)vdup_lane_s32(v126, 0);
      *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize = vbsl_s8((int8x8_t)vcgt_f32(v154, *(float32x2_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize), *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize, (int8x8_t)v154);
      if (self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge < *(float *)v126.i32)
        v126.i32[0] = LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge);
      LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge) = v126.i32[0];
      return 1;
    }
    if (qword_10229FD90 != -1)
      dispatch_once(&qword_10229FD90, &stru_102142710);
    v161 = qword_10229FD98;
    if (os_log_type_enabled((os_log_t)qword_10229FD98, OS_LOG_TYPE_FAULT))
    {
      v162 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      v163 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      v164 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      v165 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      v166 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      v167 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      v168 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      v169 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      v170 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v171 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v172 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(_QWORD *)&v200[2] = "";
      v201 = 2050;
      v202 = v162;
      v203 = 1025;
      *(float *)v204 = v163;
      *(_WORD *)&v204[4] = 1025;
      *(_DWORD *)&v204[6] = v164;
      *(_WORD *)&v204[10] = 2049;
      *(double *)&v204[12] = v198;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v165;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v166;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = v167;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = v168;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = v169;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = v170;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v171;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v172;
      _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Model Selector - Could not pick thresholds based on available features - Falling back to defaults\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
      if (qword_10229FD90 != -1)
        dispatch_once(&qword_10229FD90, &stru_102142710);
    }
    v173 = qword_10229FD98;
    if (os_signpost_enabled((os_log_t)qword_10229FD98))
    {
      v174 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      v175 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      v176 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      v177 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      v178 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      v179 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      v180 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      v181 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      v182 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v183 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      v184 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(_QWORD *)&v200[2] = "";
      v201 = 2050;
      v202 = v174;
      v203 = 1025;
      *(float *)v204 = v175;
      *(_WORD *)&v204[4] = 1025;
      *(_DWORD *)&v204[6] = v176;
      *(_WORD *)&v204[10] = 2049;
      *(double *)&v204[12] = v198;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v177;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v178;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = v179;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = v180;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = v181;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = v182;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v183;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v184;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v173, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Model Selector - Could not pick thresholds based on available features - Falling back to defaults", "{\"msg%{public}.0s\":\"Model Selector - Could not pick thresholds based on available features - Falling back to defaults\", \"impactMaxAccelNormAlertThreshold\":\"%{public}f\", \"totalLongLieThreshold\":%{private}d, \"consecutiveLongLieThreshold\":%{private}d, \"age\":\"%{private}f\", \"metminpercentile\":\"%{private}f\", \"alertGatingMotionThreshold\":\"%{private}f\", \"cyclingImpactMaxAbsYThreshold\":\"%{private}f\", \"otherWorkoutQuiescenceThresholdLow\":%{private}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\":%{private}d, \"otherWorkoutShouldCancelAlertOnStepsThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnStandThreshold\":%{private}hhd, \"otherWorkoutShouldCancelAlertOnActiveThreshold\":%{private}hhd}", buf, 0x74u);
    }
  }
  return 1;
}

- (BOOL)fillTripFallModel:(FallModel *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float v10;
  __int128 v11;
  __int128 v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX;
    v5 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4];
    v6 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8];
    v7 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12];
    a3->fRatioMaxAbsX[16] = self->fTripFallModel.fRatioMaxAbsX[16];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    v8 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8];
    v9 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12];
    v10 = self->fTripFallModel.fRatioMaxAbsY[16];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v9;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v8;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY;
    v11 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8];
    v12 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12];
    v13 = self->fTripFallModel.fRatioMaxAbsZ[16];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ;
    memcpy(a3->fRatioMaxJerkVM, self->fTripFallModel.fRatioMaxJerkVM, sizeof(a3->fRatioMaxJerkVM));
    v14 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ;
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    v16 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12];
    v15 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16];
    v17 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8];
    a3->fRatioMinInertialZ[20] = self->fTripFallModel.fRatioMinInertialZ[20];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    v18 = *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength;
    v19 = *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4];
    *(_QWORD *)&a3->fRatioAccelPathLength[8] = *(_QWORD *)&self->fTripFallModel.fRatioAccelPathLength[8];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    v20 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4];
    v21 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8];
    v22 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    v24 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8];
    v23 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12];
    v25 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].firstBinEdge = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    v27 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum;
    v26 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    v28 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].binSize;
    *(_QWORD *)&a3->fLikelihoodRatioInfo[5].binSize = *(_QWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[5].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillSlipFallModel:(FallModel *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float v10;
  __int128 v11;
  __int128 v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
    v5 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].binSize;
    v6 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2];
    v7 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6];
    a3->fRatioMaxAbsX[16] = self->fSlipFallModel.fRatioMaxAbsX[10];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    v9 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2];
    v8 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6];
    v10 = self->fSlipFallModel.fRatioMaxAbsY[10];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11];
    v12 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2];
    v11 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6];
    v13 = self->fSlipFallModel.fRatioMaxAbsZ[10];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v11;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v12;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11];
    memcpy(a3->fRatioMaxJerkVM, &self->fSlipFallModel.fRatioMaxAbsZ[11], sizeof(a3->fRatioMaxJerkVM));
    v14 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    v16 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6];
    v15 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10];
    v17 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2];
    a3->fRatioMinInertialZ[20] = self->fSlipFallModel.fRatioMinInertialZ[14];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    v18 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15];
    v19 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19];
    *(_QWORD *)&a3->fRatioAccelPathLength[8] = *(_QWORD *)&self->fSlipFallModel.fRatioAccelPathLength[2];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    v20 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2];
    v21 = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8];
    v22 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    v23 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6];
    v24 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2];
    v25 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].firstBinEdge = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10];
    v26 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum;
    v27 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
    v28 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14];
    *(_QWORD *)&a3->fLikelihoodRatioInfo[5].binSize = *(_QWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].firstBinEdge = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillOtherFallModel:(FallModel *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float v10;
  __int128 v11;
  __int128 v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    v5 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].binSize;
    v6 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum;
    v7 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX;
    a3->fRatioMaxAbsX[16] = self->fOtherFallModel.fRatioMaxAbsX[4];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    v9 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13];
    v8 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY;
    v10 = self->fOtherFallModel.fRatioMaxAbsY[4];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5];
    v11 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13];
    v12 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ;
    v13 = self->fOtherFallModel.fRatioMaxAbsZ[4];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5];
    memcpy(a3->fRatioMaxJerkVM, &self->fOtherFallModel.fRatioMaxAbsZ[5], sizeof(a3->fRatioMaxJerkVM));
    v14 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    v15 = *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ;
    v16 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4];
    v17 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63];
    a3->fRatioMinInertialZ[20] = self->fOtherFallModel.fRatioMinInertialZ[8];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    v18 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9];
    v19 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13];
    *(_QWORD *)&a3->fRatioAccelPathLength[8] = *(_QWORD *)&self->fOtherFallModel.fRatioMinInertialZ[17];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    v20 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2];
    v21 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6];
    v22 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    v24 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12];
    v23 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact;
    v25 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].firstBinEdge = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4];
    v27 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12];
    v26 = *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    v28 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8];
    *(_QWORD *)&a3->fLikelihoodRatioInfo[5].binSize = *(_QWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].binSize = v28;
  }
  return a3 != 0;
}

- (BOOL)fillFallThresholds:(FallThresholds *)a3
{
  if (a3)
    sub_10053E964((uint64_t)a3, (uint64_t)&self->fOtherFallModel.fLikelihoodRatioInfo[2]);
  return a3 != 0;
}

- (id).cxx_construct
{
  sub_10053EA04((uint64_t)&self->fOtherFallModel.fLikelihoodRatioInfo[2]);
  return self;
}

@end
