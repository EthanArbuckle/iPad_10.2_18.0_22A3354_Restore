@implementation SRLv2Plist

- (int)readPlist:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  float v55;
  float v56;
  void *v57;
  float v58;
  float v59;
  void *v60;
  float v61;
  float v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  float v67;
  float v68;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaskThreshold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  self->maskThreshold = v7;
  objc_msgSend(v4, "valueForKey:", CFSTR("MinFaceSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  self->minFaceSize = v10;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxCurveBoost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  self->maxCurveBoost = v13;
  objc_msgSend(v4, "valueForKey:", CFSTR("MinCurveBoost"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  self->minCurveBoost = v16;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxTargetRatioDarkening"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  self->maxTargetRatioDarkening = v19;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxTargetRatioLimit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  self->maxTargetRatioLimit = v22;
  objc_msgSend(v4, "valueForKey:", CFSTR("BiasFactorSRLv2"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;

  self->biasFactorSRLv2 = v25;
  objc_msgSend(v4, "valueForKey:", CFSTR("ToneSimilaritySigma"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27;

  self->toneSimilaritySigma = v28;
  objc_msgSend(v4, "valueForKey:", CFSTR("FaceExpDifThreshold"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v31 = v30;

  self->faceExpDifThreshold = v31;
  objc_msgSend(v4, "valueForKey:", CFSTR("FaceExpDifThreshold"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend(v32, "intValue") != 0;

  self->relightOnlyPersonMask = (char)v29;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_I"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");
  v35 = v34;

  self->targetMedian_I = v35;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_II"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v38 = v37;

  self->targetMedian_II = v38;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_III"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  v41 = v40;

  self->targetMedian_III = v41;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_IV"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  v44 = v43;

  self->targetMedian_IV = v44;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_V"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  v47 = v46;

  self->targetMedian_V = v47;
  objc_msgSend(v4, "valueForKey:", CFSTR("TargetMedian_VI"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v50 = v49;

  self->targetMedian_VI = v50;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_I"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "floatValue");
  v53 = v52;

  self->maxBoost_I = v53;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_II"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v56 = v55;

  self->maxBoost_II = v56;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_III"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "floatValue");
  v59 = v58;

  self->maxBoost_III = v59;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_IV"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "floatValue");
  v62 = v61;

  self->maxBoost_IV = v62;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_V"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "floatValue");
  v65 = v64;

  self->maxBoost_V = v65;
  objc_msgSend(v4, "valueForKey:", CFSTR("MaxBoost_VI"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "floatValue");
  v68 = v67;

  self->maxBoost_VI = v68;
  return 0;
}

@end
