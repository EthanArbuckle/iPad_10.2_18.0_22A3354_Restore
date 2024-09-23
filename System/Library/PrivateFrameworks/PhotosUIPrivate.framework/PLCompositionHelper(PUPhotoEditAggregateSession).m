@implementation PLCompositionHelper(PUPhotoEditAggregateSession)

+ (id)pl_aggregateNameForEffectFilterForCompositionController:()PUPhotoEditAggregateSession
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "activeEffectAdjustmentForCompositionController:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (const)_classificationForIntensityValue:()PUPhotoEditAggregateSession min:default:max:
{
  double v4;

  if (a2 >= a1)
    a1 = a2;
  if (a1 > a4)
    a1 = a4;
  v4 = (a4 - a2) * 0.01;
  if (v4 + a2 >= a1)
    return CFSTR("min");
  if (a4 - v4 <= a1)
    return CFSTR("max");
  if (a3 - v4 > a1)
    return CFSTR("low");
  if (v4 + a3 >= a1)
    return CFSTR("default");
  return CFSTR("high");
}

+ (id)pl_aggregateFilterIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "activeEffectAdjustmentForCompositionController:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intensity");
  objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pl_aggregatePortraitIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "portraitAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strength");
  objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pl_aggregateDepthIntensityForCompositionController:()PUPhotoEditAggregateSession
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "depthAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aperture");
  objc_msgSend(a1, "_classificationForIntensityValue:min:default:max:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pl_aggregateNameForPortraitFilterWithCompositionController:()PUPhotoEditAggregateSession
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "portraitAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:](PUPhotoEditEffectsSupport, "lightingEffectTypeForIdentifier:", v5);

  if (!v6)
  {
    objc_msgSend(v4, "portraitInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  objc_msgSend(MEMORY[0x1E0D0D078], "aggdNameForLightingType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)compositionController:()PUPhotoEditAggregateSession aggregateKeysForPreviousComposition:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  _BOOL4 v32;
  int v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  int v40;
  double v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  _BOOL4 v70;
  _QWORD *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  BOOL v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v121;
  void *v122;
  void *v123;
  unsigned int v124;
  void *v125;
  unsigned int v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _QWORD v142[3];
  CGRect v143;
  CGRect v144;

  v142[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v8, "mediaType");

  objc_msgSend(a1, "adjustmentConstants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(MEMORY[0x1E0D71660], "compositionControllerHasAnyAutoEnhancement:", v6);
  v11 = objc_msgSend(MEMORY[0x1E0D71660], "compositionControllerHasAnyAutoEnhancement:", v7);
  v132 = v11 ^ 1;
  v134 = (int)a4;
  v12 = v11 & (a4 ^ 1);
  objc_msgSend(v6, "smartToneAdjustmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smartToneAdjustmentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v6;
  objc_msgSend(v6, "smartColorAdjustmentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v7;
  objc_msgSend(v7, "smartColorAdjustmentController");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PISmartToneAdjustmentKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inputLightKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultValueForAdjustmentKey:settingKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  v138 = v9;
  objc_msgSend(v9, "PISmartColorAdjustmentKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "inputColorKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = a1;
  objc_msgSend(a1, "defaultValueForAdjustmentKey:settingKey:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v13, "inputLight");
  v27 = v26;
  objc_msgSend(v14, "inputLight");
  v29 = v28;
  v30 = objc_msgSend(v13, "isAuto");
  if (v12 == 1)
  {
    objc_msgSend(v13, "inputLight");
    v32 = v31 == v20;
  }
  else
  {
    v32 = 0;
  }
  v126 = v134 & v132;
  v33 = (v30 | v32) ^ 1;
  if (v27 == v29)
    v34 = 0;
  else
    v34 = v33;
  v124 = v34;
  objc_msgSend(v10, "pu_valuesChanged:forKey:");
  objc_msgSend(v15, "inputColor");
  v36 = v35;
  objc_msgSend(v136, "inputColor");
  v38 = v37;
  v39 = objc_msgSend(v15, "isAuto") ^ 1;
  if (v36 == v38)
    v40 = 0;
  else
    v40 = v39;
  v133 = v13;
  v130 = v15;
  if (v12)
  {
    objc_msgSend(v15, "inputColor");
    v42 = v41 != v25;
  }
  else
  {
    v42 = 1;
  }
  v43 = v40 & v42;
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v43, *MEMORY[0x1E0D728C0]);
  objc_msgSend(v131, "composition");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PISmartToneAdjustmentKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v122, "isEqual:forKeys:visualChangesOnly:", v44, v46, 1) ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v47, *MEMORY[0x1E0D728D8]);
  objc_msgSend(v131, "composition");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "PISmartColorAdjustmentKey");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v122, "isEqual:forKeys:visualChangesOnly:", v48, v50, 1) ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v51, *MEMORY[0x1E0D728C8]);
  if (v134)
  {
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v124, *MEMORY[0x1E0D72810]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v47, *MEMORY[0x1E0D72818]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v43, *MEMORY[0x1E0D72800]);
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v51, *MEMORY[0x1E0D72808]);
  }
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v126, *MEMORY[0x1E0D727D8]);
  objc_msgSend(v131, "composition");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "PIRedEyeAdjustmentKey");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v122, "isEqual:forKeys:visualChangesOnly:", v52, v54, 1) ^ 1;

  objc_msgSend(v10, "pu_valuesChanged:forKey:", v55, *MEMORY[0x1E0D72888]);
  objc_msgSend(v122, "cropAdjustmentController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "cropAdjustmentController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "cropRect");
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v135 = v57;
  objc_msgSend(v57, "cropRect");
  v144.origin.x = v66;
  v144.origin.y = v67;
  v144.size.width = v68;
  v144.size.height = v69;
  v143.origin.x = v59;
  v143.origin.y = v61;
  v143.size.width = v63;
  v143.size.height = v65;
  v70 = CGRectEqualToRect(v143, v144);
  v71 = (_QWORD *)MEMORY[0x1E0D72830];
  if (v128 != 2)
    v71 = (_QWORD *)MEMORY[0x1E0D72828];
  objc_msgSend(v10, "pu_valuesChanged:forKey:", !v70, *v71);
  objc_msgSend(v122, "orientationAdjustmentController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "orientationAdjustmentController");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
    objc_msgSend(v72, "orientation");
  v125 = v73;
  v127 = v72;
  if (v73)
    objc_msgSend(v73, "orientation");
  v74 = PLOrientationBetweenOrientations();
  v75 = (_QWORD *)MEMORY[0x1E0D728A0];
  if (v128 == 2)
  {
    v75 = (_QWORD *)MEMORY[0x1E0D72898];
    v76 = (_QWORD *)MEMORY[0x1E0D72850];
  }
  else
  {
    v76 = (_QWORD *)MEMORY[0x1E0D72848];
  }
  if (v128 == 2)
    v77 = (_QWORD *)MEMORY[0x1E0D728F0];
  else
    v77 = (_QWORD *)MEMORY[0x1E0D728E8];
  if (v128 == 2)
    v78 = (_QWORD *)MEMORY[0x1E0D72870];
  else
    v78 = (_QWORD *)MEMORY[0x1E0D72868];
  if (v128 == 2)
    v79 = (_QWORD *)MEMORY[0x1E0D72908];
  else
    v79 = (_QWORD *)MEMORY[0x1E0D72900];
  if (v128 == 2)
    v80 = (_QWORD *)MEMORY[0x1E0D72860];
  else
    v80 = (_QWORD *)MEMORY[0x1E0D72858];
  objc_msgSend(v10, "pu_valuesChanged:forKey:", (v74 < 9) & (0x1E8u >> v74), *v75);
  objc_msgSend(v10, "pu_valuesChanged:forKey:", (v74 < 8) & (0xB4u >> v74), *v76);
  objc_msgSend(v56, "angle");
  v82 = v81;
  objc_msgSend(v135, "angle");
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v82 != v83, *v77);
  objc_msgSend(v56, "pitchRadians");
  v85 = v84;
  objc_msgSend(v135, "pitchRadians");
  LODWORD(v74) = v85 != v86;
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v85 != v86, *v78);
  objc_msgSend(v56, "yawRadians");
  v88 = v87;
  objc_msgSend(v135, "yawRadians");
  if (v88 == v89)
    v74 = v74;
  else
    v74 = 1;
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v88 != v89, *v79);
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v74, *v80);
  v90 = v137;
  v91 = objc_msgSend(v137, "compositionController:isCropConstraintEqualToCompositionController:", v122, v131);
  objc_msgSend(v10, "pu_valuesChanged:forKey:", v91 ^ 1u, *MEMORY[0x1E0D727D0]);
  objc_msgSend(v122, "smartBWAdjustmentController");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "smartBWAdjustmentController");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v92, "enabled"))
  {
    objc_msgSend(v92, "hue");
    v95 = v94;
    objc_msgSend(v93, "hue");
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v95 != v96, *MEMORY[0x1E0D728B0]);
    objc_msgSend(v131, "composition");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "PISmartBWAdjustmentKey");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v98;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v122, "isEqual:forKeys:visualChangesOnly:", v97, v99, 1) ^ 1;

    v101 = v100;
    v90 = v137;
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v101, *MEMORY[0x1E0D728B8]);
  }
  v123 = v93;
  v129 = v92;
  objc_msgSend(v90, "pl_aggregateNameForEffectFilterForCompositionController:", v122);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v133;
  if (v102)
  {
    objc_msgSend(v10, "pu_valuesChanged:forKey:", objc_msgSend(v90, "compositionController:isEffectFilterEqualToCompositionController:", v122, v131) ^ 1, PLSAggregateDictionaryKeyForEditPhotoWithFilterName());
    v104 = objc_msgSend(v90, "compositionController:isEffectFilterIntensityEqualToCompositionController:", v122, v131) ^ 1;
    objc_msgSend(v90, "pl_aggregateFilterIntensityForCompositionController:", v122);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v104, PLSAggregateDictionaryKeyForEditPhotoWithFilterIntensity());

  }
  objc_msgSend(v90, "pl_aggregateNameForPortraitFilterWithCompositionController:", v122);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "activeEffectAdjustmentForCompositionController:", v122);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v107)
  {
    objc_msgSend(v107, "kind");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v109 != 0;

    if (!v106)
      goto LABEL_53;
  }
  else
  {
    v110 = 0;
    if (!v106)
      goto LABEL_53;
  }
  if (!v110)
  {
    v121 = v56;
    objc_msgSend(v90, "activeEffectAdjustmentForCompositionController:", v131);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v111;
    if (v111
      && (objc_msgSend(v111, "kind"), v113 = (void *)objc_claimAutoreleasedReturnValue(), v113, v113))
    {
      v114 = 1;
      v90 = v137;
    }
    else
    {
      v90 = v137;
      v114 = objc_msgSend(v137, "compositionController:isPortraitEqualToCompositionController:", v122, v131) ^ 1;
    }
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v114, PLSAggregateDictionaryKeyForEditPhotoWithPortraitName());
    v115 = objc_msgSend(v90, "compositionController:isPortraitIntensityEqualToCompositionController:", v122, v131) ^ 1;
    objc_msgSend(v90, "pl_aggregatePortraitIntensityForCompositionController:", v122);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v115, PLSAggregateDictionaryKeyForEditPhotoWithPortraitIntensity());

    v103 = v133;
    v56 = v121;
  }
LABEL_53:
  objc_msgSend(v122, "depthAdjustmentController");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    v118 = objc_msgSend(v90, "compositionController:isDepthIntensityEqualToCompositionController:", v122, v131) ^ 1;
    objc_msgSend(v90, "pl_aggregateDepthIntensityForCompositionController:", v122);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_valuesChanged:forKey:", v118, PLSAggregateDictionaryKeyForEditPhotoWithApertureIntensity());

  }
  return v10;
}

@end
