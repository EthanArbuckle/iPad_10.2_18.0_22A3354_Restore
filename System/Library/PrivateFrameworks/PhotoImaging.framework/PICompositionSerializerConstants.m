@implementation PICompositionSerializerConstants

+ (id)conversionMap
{
  if (conversionMap_onceToken != -1)
    dispatch_once(&conversionMap_onceToken, &__block_literal_global_10612);
  return (id)conversionMap__s_conversionMap;
}

+ (id)mapForSerialization
{
  if (mapForSerialization_onceToken != -1)
    dispatch_once(&mapForSerialization_onceToken, &__block_literal_global_768);
  return (id)mapForSerialization__s_inverseMap;
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[8];
  _QWORD v46[8];
  _QWORD v47[8];
  _QWORD v48[8];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[7];
  _QWORD v52[7];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[4];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[4];
  _QWORD v70[4];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[18];
  _QWORD v82[18];
  _QWORD v83[8];
  _QWORD v84[8];
  _QWORD v85[6];
  _QWORD v86[6];
  _QWORD v87[14];
  _QWORD v88[14];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[4];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[8];
  _QWORD v106[8];
  _QWORD v107[7];
  _QWORD v108[7];
  _QWORD v109[8];
  _QWORD v110[8];
  _QWORD v111[36];
  _QWORD v112[38];

  v112[36] = *MEMORY[0x1E0C80C00];
  v111[0] = CFSTR("smartTone");
  v109[0] = CFSTR("identifierName");
  v109[1] = CFSTR("compositionName");
  v110[0] = CFSTR("SmartTone");
  v110[1] = CFSTR("smartTone");
  v109[2] = CFSTR("inputLight");
  v109[3] = CFSTR("statistics");
  v110[2] = CFSTR("inputLight");
  v110[3] = CFSTR("statistics");
  v109[4] = CFSTR("auto");
  v109[5] = CFSTR("inputImage");
  v110[4] = CFSTR("auto");
  v110[5] = CFSTR("inputImage");
  v109[6] = CFSTR("customSerialization");
  v109[7] = CFSTR("autoValue");
  v110[6] = &__block_literal_global_770;
  v110[7] = &__block_literal_global_771;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v38;
  v111[1] = CFSTR("smartColor");
  v107[0] = CFSTR("identifierName");
  v107[1] = CFSTR("compositionName");
  v108[0] = CFSTR("SmartColor");
  v108[1] = CFSTR("smartColor");
  v107[2] = CFSTR("inputColor");
  v107[3] = CFSTR("statistics");
  v108[2] = CFSTR("inputColor");
  v108[3] = CFSTR("statistics");
  v107[4] = CFSTR("auto");
  v107[5] = CFSTR("customSerialization");
  v108[4] = CFSTR("auto");
  v108[5] = &__block_literal_global_774;
  v107[6] = CFSTR("autoValue");
  v108[6] = &__block_literal_global_775;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v37;
  v111[2] = CFSTR("smartBlackAndWhite");
  v106[0] = CFSTR("SmartBlackAndWhite");
  v106[1] = CFSTR("smartBlackAndWhite");
  v106[2] = &__block_literal_global_776;
  v106[3] = CFSTR("offsetGrain");
  v105[0] = CFSTR("identifierName");
  v105[1] = CFSTR("compositionName");
  v105[4] = CFSTR("tone");
  v105[5] = CFSTR("hue");
  v106[4] = CFSTR("offsetTone");
  v106[5] = CFSTR("inputBlackAndWhite");
  v105[2] = CFSTR("customSerialization");
  v105[3] = CFSTR("grain");
  v105[6] = CFSTR("neutral");
  v105[7] = CFSTR("auto");
  v106[6] = CFSTR("offsetNeutralGamma");
  v106[7] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v112[2] = v36;
  v111[3] = CFSTR("grain");
  v103[0] = CFSTR("identifierName");
  v103[1] = CFSTR("compositionName");
  v104[0] = CFSTR("Grain");
  v104[1] = CFSTR("grain");
  v103[2] = CFSTR("iso");
  v103[3] = CFSTR("amount");
  v104[2] = CFSTR("iso");
  v104[3] = CFSTR("amount");
  v103[4] = CFSTR("seed");
  v104[4] = CFSTR("seed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v112[3] = v35;
  v111[4] = CFSTR("vignette");
  v102[0] = CFSTR("DGVignetteEffectOperation");
  v102[1] = CFSTR("vignette");
  v101[0] = CFSTR("identifierName");
  v101[1] = CFSTR("compositionName");
  v101[2] = CFSTR("inputKeys");
  v101[3] = CFSTR("auto");
  v102[2] = &unk_1E5059110;
  v102[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v112[4] = v34;
  v111[5] = CFSTR("definition");
  v99[0] = CFSTR("identifierName");
  v99[1] = CFSTR("compositionName");
  v100[0] = CFSTR("DGDefinition2Operation");
  v100[1] = CFSTR("definition");
  v99[2] = CFSTR("inputKeys");
  v99[3] = CFSTR("auto");
  v100[2] = &unk_1E5059138;
  v100[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v112[5] = v33;
  v111[6] = CFSTR("noiseReduction");
  v97[0] = CFSTR("identifierName");
  v97[1] = CFSTR("compositionName");
  v98[0] = CFSTR("RKNoiseReductionOperation");
  v98[1] = CFSTR("noiseReduction");
  v97[2] = CFSTR("inputKeys");
  v97[3] = CFSTR("auto");
  v98[2] = &unk_1E5059160;
  v98[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v112[6] = v32;
  v111[7] = CFSTR("sharpen");
  v95[0] = CFSTR("identifierName");
  v95[1] = CFSTR("compositionName");
  v96[0] = CFSTR("RKProSharpenOperation");
  v96[1] = CFSTR("sharpen");
  v95[2] = CFSTR("inputKeys");
  v95[3] = CFSTR("auto");
  v96[2] = &unk_1E5059188;
  v96[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v112[7] = v31;
  v111[8] = CFSTR("effect");
  v93[0] = CFSTR("identifierName");
  v93[1] = CFSTR("customSerialization");
  v94[0] = CFSTR("Effect");
  v94[1] = &__block_literal_global_788;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v112[8] = v30;
  v111[9] = CFSTR("effect3D");
  v91[0] = CFSTR("identifierName");
  v91[1] = CFSTR("customSerialization");
  v92[0] = CFSTR("Effect");
  v92[1] = &__block_literal_global_789;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v112[9] = v29;
  v111[10] = CFSTR("orientation");
  v89[0] = CFSTR("identifierName");
  v89[1] = CFSTR("compositionName");
  v90[0] = CFSTR("Orientation");
  v90[1] = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v112[10] = v28;
  v111[11] = CFSTR("cropStraighten");
  v87[0] = CFSTR("identifierName");
  v87[1] = CFSTR("compositionName");
  v88[0] = CFSTR("Crop");
  v88[1] = CFSTR("cropStraighten");
  v87[2] = CFSTR("xOrigin");
  v87[3] = CFSTR("yOrigin");
  v88[2] = CFSTR("xOrigin");
  v88[3] = CFSTR("yOrigin");
  v87[4] = CFSTR("width");
  v87[5] = CFSTR("height");
  v88[4] = CFSTR("width");
  v88[5] = CFSTR("height");
  v87[6] = CFSTR("angle");
  v87[7] = CFSTR("pitch");
  v88[6] = CFSTR("straightenAngle");
  v88[7] = CFSTR("pitch");
  v87[8] = CFSTR("yaw");
  v87[9] = CFSTR("constraintHeight");
  v88[8] = CFSTR("yaw");
  v88[9] = CFSTR("constraintHeight");
  v87[10] = CFSTR("constraintWidth");
  v87[11] = CFSTR("customSerialization");
  v88[10] = CFSTR("constraintWidth");
  v88[11] = &__block_literal_global_790;
  v87[12] = CFSTR("auto");
  v87[13] = CFSTR("autoValue");
  v88[12] = CFSTR("auto");
  v88[13] = &__block_literal_global_791;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v112[11] = v27;
  v111[12] = CFSTR("rawNoiseReduction");
  v85[0] = CFSTR("identifierName");
  v85[1] = CFSTR("compositionName");
  v86[0] = CFSTR("DGRAWReduceNoiseOperation");
  v86[1] = CFSTR("rawNoiseReduction");
  v86[2] = CFSTR("inputDetailAmount");
  v86[3] = CFSTR("inputCNRAmount");
  v85[2] = CFSTR("detail");
  v85[3] = CFSTR("color");
  v85[4] = CFSTR("luminance");
  v85[5] = CFSTR("auto");
  v86[4] = CFSTR("inputLNRAmount");
  v86[5] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v112[12] = v26;
  v111[13] = CFSTR("raw");
  v84[0] = CFSTR("RKRawDecodeOperation");
  v84[1] = CFSTR("raw");
  v83[0] = CFSTR("identifierName");
  v83[1] = CFSTR("compositionName");
  v83[2] = CFSTR("inputDecoderVersion");
  v83[3] = CFSTR("boostVersion");
  v84[2] = CFSTR("inputMethodVersion");
  v84[3] = CFSTR("boostVersion");
  v83[4] = CFSTR("boostParams");
  v83[5] = CFSTR("gainMapVersion");
  v84[4] = CFSTR("boostParams");
  v84[5] = CFSTR("gainMapVersion");
  v83[6] = CFSTR("gainMapParameters");
  v83[7] = CFSTR("requiresEnabled");
  v0 = MEMORY[0x1E0C9AAB0];
  v84[6] = CFSTR("gainMapParameters");
  v84[7] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v112[13] = v25;
  v111[14] = CFSTR("whiteBalance");
  v81[0] = CFSTR("identifierName");
  v81[1] = CFSTR("compositionName");
  v82[0] = CFSTR("WhiteBalance");
  v82[1] = CFSTR("whiteBalance");
  v81[2] = CFSTR("faceStrength");
  v81[3] = CFSTR("faceWarmth");
  v82[2] = CFSTR("faceStrength");
  v82[3] = CFSTR("faceWarmth");
  v81[4] = CFSTR("faceI");
  v81[5] = CFSTR("faceQ");
  v82[4] = CFSTR("faceI");
  v82[5] = CFSTR("faceQ");
  v81[6] = CFSTR("grayWarmth");
  v81[7] = CFSTR("grayY");
  v82[6] = CFSTR("grayWarmth");
  v82[7] = CFSTR("grayY");
  v81[8] = CFSTR("grayI");
  v81[9] = CFSTR("grayQ");
  v82[8] = CFSTR("grayI");
  v82[9] = CFSTR("grayQ");
  v81[10] = CFSTR("customSerialization");
  v81[11] = CFSTR("autoValue");
  v82[10] = &__block_literal_global_792;
  v82[11] = &__block_literal_global_793;
  v81[12] = CFSTR("temperature");
  v81[13] = CFSTR("tint");
  v82[12] = CFSTR("temperature");
  v82[13] = CFSTR("tint");
  v81[14] = CFSTR("warmTemp");
  v81[15] = CFSTR("warmTint");
  v82[14] = CFSTR("warmTemp");
  v82[15] = CFSTR("warmTint");
  v81[16] = CFSTR("warmFace");
  v81[17] = CFSTR("auto");
  v82[16] = CFSTR("warmFace");
  v82[17] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v112[14] = v24;
  v111[15] = CFSTR("levels");
  v79[0] = CFSTR("identifierName");
  v79[1] = CFSTR("compositionName");
  v80[0] = CFSTR("RKLevelsOperation");
  v80[1] = CFSTR("levels");
  v79[2] = CFSTR("colorSpace");
  v79[3] = CFSTR("inputKeys");
  v80[2] = CFSTR("inputColorSpace");
  v80[3] = &unk_1E50591B0;
  v79[4] = CFSTR("auto");
  v80[4] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v112[15] = v23;
  v111[16] = CFSTR("curves");
  v77[0] = CFSTR("identifierName");
  v77[1] = CFSTR("compositionName");
  v78[0] = CFSTR("RKCurvesOperation");
  v78[1] = CFSTR("curves");
  v77[2] = CFSTR("inputKeys");
  v77[3] = CFSTR("auto");
  v78[2] = &unk_1E50591D8;
  v78[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v112[16] = v22;
  v111[17] = CFSTR("selectiveColor");
  v75[0] = CFSTR("identifierName");
  v75[1] = CFSTR("compositionName");
  v76[0] = CFSTR("RKSelectiveColorOperation");
  v76[1] = CFSTR("selectiveColor");
  v75[2] = CFSTR("customSerialization");
  v76[2] = &__block_literal_global_806;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v112[17] = v21;
  v111[18] = CFSTR("retouch");
  v73[0] = CFSTR("identifierName");
  v73[1] = CFSTR("compositionName");
  v74[0] = CFSTR("RKRetouchOperation");
  v74[1] = CFSTR("retouch");
  v73[2] = CFSTR("customSerialization");
  v74[2] = &__block_literal_global_807;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v112[18] = v20;
  v111[19] = CFSTR("apertureRedEye");
  v71[0] = CFSTR("identifierName");
  v71[1] = CFSTR("compositionName");
  v72[0] = CFSTR("RKRedEyeOperation");
  v72[1] = CFSTR("apertureRedEye");
  v71[2] = CFSTR("customSerialization");
  v72[2] = &__block_literal_global_812;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v112[19] = v19;
  v111[20] = CFSTR("redEye");
  v70[0] = CFSTR("RedEyeBB");
  v70[1] = CFSTR("redEye");
  v69[0] = CFSTR("identifierName");
  v69[1] = CFSTR("compositionName");
  v69[2] = CFSTR("inputCorrectionInfo");
  v69[3] = CFSTR("auto");
  v70[2] = CFSTR("redEyeCorrections");
  v70[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v112[20] = v18;
  v111[21] = CFSTR("mute");
  v67[0] = CFSTR("identifierName");
  v67[1] = CFSTR("compositionName");
  v68[0] = CFSTR("Mute");
  v68[1] = CFSTR("mute");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v112[21] = v17;
  v111[22] = CFSTR("trim");
  v65[0] = CFSTR("identifierName");
  v65[1] = CFSTR("compositionName");
  v66[0] = CFSTR("Trim");
  v66[1] = CFSTR("trim");
  v65[2] = CFSTR("customSerialization");
  v66[2] = &__block_literal_global_814;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v112[22] = v16;
  v111[23] = CFSTR("slomo");
  v63[0] = CFSTR("identifierName");
  v63[1] = CFSTR("compositionName");
  v64[0] = CFSTR("SlowMotion");
  v64[1] = CFSTR("slomo");
  v63[2] = CFSTR("customSerialization");
  v64[2] = &__block_literal_global_816;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v112[23] = v15;
  v111[24] = CFSTR("livePhotoKeyFrame");
  v61[0] = CFSTR("identifierName");
  v61[1] = CFSTR("compositionName");
  v62[0] = CFSTR("LivePhotoKeyFrame");
  v62[1] = CFSTR("livePhotoKeyFrame");
  v61[2] = CFSTR("customSerialization");
  v62[2] = &__block_literal_global_818;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v112[24] = v14;
  v111[25] = CFSTR("videoPosterFrame");
  v59[0] = CFSTR("identifierName");
  v59[1] = CFSTR("compositionName");
  v60[0] = CFSTR("VideoPosterFrame");
  v60[1] = CFSTR("videoPosterFrame");
  v59[2] = CFSTR("customSerialization");
  v60[2] = &__block_literal_global_824;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v112[25] = v13;
  v111[26] = CFSTR("autoLoop");
  v58[0] = CFSTR("AutoLoop");
  v58[1] = CFSTR("autoLoop");
  v57[0] = CFSTR("identifierName");
  v57[1] = CFSTR("compositionName");
  v57[2] = CFSTR("recipe");
  v57[3] = CFSTR("flavor");
  v58[2] = CFSTR("recipe");
  v58[3] = CFSTR("flavor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v112[26] = v12;
  v111[27] = CFSTR("highResFusion");
  v56[0] = CFSTR("HighResolutionFusion");
  v56[1] = CFSTR("highResFusion");
  v55[0] = CFSTR("identifierName");
  v55[1] = CFSTR("compositionName");
  v55[2] = CFSTR("alignment");
  v55[3] = CFSTR("omitIfDisabled");
  v56[2] = CFSTR("alignment");
  v56[3] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v112[27] = v11;
  v111[28] = CFSTR("depthEffect");
  v54[0] = CFSTR("DepthEffect");
  v54[1] = CFSTR("depthEffect");
  v53[2] = CFSTR("depthInfo");
  v53[3] = CFSTR("aperture");
  v54[2] = CFSTR("depthInfo");
  v54[3] = CFSTR("aperture");
  v53[0] = CFSTR("identifierName");
  v53[1] = CFSTR("compositionName");
  v53[4] = CFSTR("focusRect");
  v53[5] = CFSTR("glassesMatteAllowed");
  v54[4] = CFSTR("focusRect");
  v54[5] = CFSTR("glassesMatteAllowed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v111[29] = CFSTR("portraitEffect");
  v52[0] = CFSTR("PortraitEffect");
  v52[1] = CFSTR("portraitEffect");
  v51[2] = CFSTR("portraitInfo");
  v51[3] = CFSTR("strength");
  v52[2] = CFSTR("portraitInfo");
  v52[3] = CFSTR("strength");
  v112[28] = v10;
  v51[4] = CFSTR("spillMatteAllowed");
  v51[5] = CFSTR("kind");
  v51[0] = CFSTR("identifierName");
  v51[1] = CFSTR("compositionName");
  v52[4] = CFSTR("spillMatteAllowed");
  v52[5] = CFSTR("portraitEffectFilterName");
  v51[6] = CFSTR("omitIfDisabled");
  v52[6] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v112[29] = v1;
  v111[30] = CFSTR("videoStabilize");
  v49[0] = CFSTR("identifierName");
  v49[1] = CFSTR("compositionName");
  v50[0] = CFSTR("VideoStabilize");
  v50[1] = CFSTR("videoStabilize");
  v49[2] = CFSTR("enabled");
  v49[3] = CFSTR("customSerialization");
  v50[2] = CFSTR("enabled");
  v50[3] = &__block_literal_global_826;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v112[30] = v2;
  v111[31] = CFSTR("semanticEnhance");
  v47[0] = CFSTR("identifierName");
  v47[1] = CFSTR("compositionName");
  v48[0] = CFSTR("SemanticEnhance");
  v48[1] = CFSTR("semanticEnhance");
  v47[2] = CFSTR("enabled");
  v47[3] = CFSTR("intensity");
  v47[4] = CFSTR("sceneLabel");
  v47[5] = CFSTR("sceneConfidence");
  v48[4] = CFSTR("sceneLabel");
  v48[5] = CFSTR("sceneConfidence");
  v48[2] = CFSTR("enabled");
  v48[3] = CFSTR("intensity");
  v47[6] = CFSTR("boundingBoxes");
  v47[7] = CFSTR("faceBoundingBoxes");
  v48[6] = CFSTR("boundingBoxes");
  v48[7] = CFSTR("faceBoundingBoxes");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v112[31] = v3;
  v111[32] = CFSTR("semanticStyle");
  v45[0] = CFSTR("identifierName");
  v45[1] = CFSTR("compositionName");
  v46[0] = CFSTR("SemanticStyle");
  v46[1] = CFSTR("semanticStyle");
  v45[2] = CFSTR("enabled");
  v45[3] = CFSTR("tone");
  v46[2] = CFSTR("enabled");
  v46[3] = CFSTR("tone");
  v45[4] = CFSTR("cast");
  v45[5] = CFSTR("color");
  v46[4] = CFSTR("cast");
  v46[5] = CFSTR("color");
  v45[6] = CFSTR("intensity");
  v45[7] = CFSTR("debugMode");
  v46[6] = CFSTR("intensity");
  v46[7] = CFSTR("debugMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v112[32] = v4;
  v111[33] = CFSTR("videoCrossfadeLoop");
  v43[0] = CFSTR("identifierName");
  v43[1] = CFSTR("compositionName");
  v44[0] = CFSTR("VideoCrossfadeLoop");
  v44[1] = CFSTR("videoCrossfadeLoop");
  v43[2] = CFSTR("customSerialization");
  v44[2] = &__block_literal_global_828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v112[33] = v5;
  v111[34] = CFSTR("portraitVideo");
  v41[0] = CFSTR("identifierName");
  v41[1] = CFSTR("compositionName");
  v42[0] = CFSTR("PortraitVideo");
  v42[1] = CFSTR("portraitVideo");
  v41[2] = CFSTR("enabled");
  v41[3] = CFSTR("customSerialization");
  v42[2] = CFSTR("enabled");
  v42[3] = &__block_literal_global_830;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v112[34] = v6;
  v111[35] = CFSTR("cinematicAudio");
  v39[0] = CFSTR("identifierName");
  v39[1] = CFSTR("compositionName");
  v40[0] = CFSTR("CinematicAudio");
  v40[1] = CFSTR("cinematicAudio");
  v39[2] = CFSTR("enabled");
  v39[3] = CFSTR("dialogMixBias");
  v40[2] = CFSTR("enabled");
  v40[3] = CFSTR("dialogMixBias");
  v39[4] = CFSTR("renderingStyle");
  v40[4] = CFSTR("renderingStyle");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v112[35] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 36);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)mapForSerialization__s_inverseMap;
  mapForSerialization__s_inverseMap = v8;

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_8_829(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disparityKeyframes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("disparityKeyframes"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apertureKeyframes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("apertureKeyframes"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cinematographyState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("cinematographyState"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("debugMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("debugMode"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("renderingVersionAtCapture"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("renderingVersionAtCapture"));
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_7_827(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  const __CFAllocator *v9;
  CFDictionaryRef v10;
  void *v11;
  int64_t v12;
  void *v13;
  CFDictionaryRef v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  CFDictionaryRef v21;
  CMTimeRange v22;
  CMTime duration;
  CMTimeRange time;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;

  memset(&v28, 0, sizeof(v28));
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossfadeDurationValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("crossfadeDurationTimescale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v28, v7, objc_msgSend(v8, "intValue"));

  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time.start = v28;
  v10 = CMTimeCopyAsDictionary(&time.start, v9);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("crossfadeDuration"));

  memset(&v27, 0, sizeof(v27));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTimeTimescale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v27, v12, objc_msgSend(v13, "intValue"));

  time.start = v27;
  v14 = CMTimeCopyAsDictionary(&time.start, v9);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("startTime"));

  memset(&v26, 0, sizeof(v26));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeRangeStartValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeRangeStartTimescale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v26, v16, objc_msgSend(v17, "intValue"));

  memset(&v25, 0, sizeof(v25));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeRangeDurationValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeRangeDurationTimescale"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CMTimeMake(&v25, v19, objc_msgSend(v20, "intValue"));
  memset(&time, 0, sizeof(time));
  v22.start = v26;
  duration = v25;
  CMTimeRangeMake(&time, &v22.start, &duration);
  v22 = time;
  v21 = CMTimeRangeCopyAsDictionary(&v22, v9);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("timeRange"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_6_825(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyframes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("keyframes"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("stabCropRect"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cropFraction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("cropFraction"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analysisType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("analysisType"));
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_5_823(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("flags");
  v9[1] = CFSTR("epoch");
  v10[0] = &unk_1E5051448;
  v10[1] = &unk_1E5051418;
  v9[2] = CFSTR("value");
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v9[3] = CFSTR("timescale");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("time"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_4_817(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("flags");
  v9[1] = CFSTR("epoch");
  v10[0] = &unk_1E5051448;
  v10[1] = &unk_1E5051418;
  v9[2] = CFSTR("value");
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  v9[3] = CFSTR("timescale");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("time"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_3_815(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  void *v14;
  void *v15;
  CMTimeRange v16;
  CMTime end;
  CMTimeRange v18;
  CMTime v19;
  CMTime v20;
  const __CFString *v21;
  CFDictionaryRef v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  memset(&v20, 0, sizeof(v20));
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startScale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v20, v7, objc_msgSend(v8, "intValue"));

  memset(&v19, 0, sizeof(v19));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endScale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v19, v10, objc_msgSend(v11, "intValue"));

  memset(&v18, 0, sizeof(v18));
  v16.start = v20;
  end = v19;
  CMTimeRangeFromTimeToTime(&v18, &v16.start, &end);
  v16 = v18;
  v12 = CMTimeRangeCopyAsDictionary(&v16, 0);
  v21 = CFSTR("timeRange");
  v22 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("regions"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("rate"));
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_2_813(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  const __CFAllocator *v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;

  memset(&v17, 0, sizeof(v17));
  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startScale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v17, v7, objc_msgSend(v8, "intValue"));

  memset(&v16, 0, sizeof(v16));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endScale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CMTimeMake(&v16, v10, objc_msgSend(v11, "intValue"));
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = v17;
  v13 = CMTimeCopyAsDictionary(&v15, v12);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("startTime"));

  v15 = v16;
  v14 = CMTimeCopyAsDictionary(&v15, v12);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("endTime"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_811(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  const __CFString *v21;
  id v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = CFSTR("x");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pointX"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = CFSTR("y");
      v26[0] = v11;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pointY"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = v13;
      v23[0] = CFSTR("center");
      v23[1] = CFSTR("radius");
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      v23[2] = CFSTR("sensitivity");
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v16 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v17);
      v6 = v16;

    }
  }
  v21 = CFSTR("inputSpots");
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("inputKeys"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];
  _QWORD v62[3];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v4 = a3;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputStrokes"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v56;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v56 != v45)
          objc_enumerationMutation(obj);
        v50 = v5;
        v6 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v5);
        v7 = (void *)objc_opt_new();
        v8 = (void *)objc_opt_new();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("brushStroke"));

        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E5051430, CFSTR("version"));
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mode"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithInt:", PIRetouchModeFromString(v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("mode"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("radius"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("radius"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("softness"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("softness"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("opacity"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("opacity"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E5051448, CFSTR("version"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("repairEdges"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("repairEdges"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("sourceOffset"));

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasSource"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v7;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("hasSource"));

        v48 = v6;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("points"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_opt_new();
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v52 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              v61[0] = CFSTR("xLocation");
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("x"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = v30;
              v61[1] = CFSTR("yLocation");
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("y"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v62[1] = v31;
              v61[2] = CFSTR("pressure");
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("p"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v62[2] = v32;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "addObject:", v33);
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          }
          while (v26);
        }

        objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v23, CFSTR("data"));

        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("clipRect"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("clipRect"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v36, CFSTR("clipRect"));

        }
        objc_msgSend(v46, "addObject:", v49);

        v5 = v50 + 1;
      }
      while (v50 + 1 != v47);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v47);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = v37;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v39;

  v59[0] = CFSTR("inputStrokes");
  v59[1] = CFSTR("inputDetectedFaces");
  v60[0] = v46;
  v60[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, CFSTR("inputKeys"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("corrections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("corrections"));

  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("colorType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("faceBalance"));

    if (v9)
    {
      v24[0] = CFSTR("auto");
      v22[0] = CFSTR("faceI");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v22[1] = CFSTR("faceQ");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v11;
      v22[2] = CFSTR("faceStrength");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v12;
      v22[3] = CFSTR("faceWarmth");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("current");
      v25[0] = v14;
      v25[1] = CFSTR("face");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("auto"));

LABEL_6:
      goto LABEL_7;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("colorType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("warmTint"));

    if (v17)
    {
      v20[0] = CFSTR("auto");
      v18[0] = CFSTR("warmFace");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v18[1] = CFSTR("warmTemp");
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v11;
      v18[2] = CFSTR("warmTint");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("warmTint"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("current");
      v21[0] = v13;
      v21[1] = CFSTR("warm");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("auto"));
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("colorType"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", +[PIWhiteBalanceAdjustmentController colorTypeForString:](PIWhiteBalanceAdjustmentController, "colorTypeForString:", v7));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("colorType"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  const __CFString *v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("angle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9 * 3.14159265;

    v28 = CFSTR("auto");
    v26[0] = CFSTR("straightenAngle");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 / -180.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v25;
    v26[1] = CFSTR("xOrigin");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v11, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v23;
    v26[2] = CFSTR("yOrigin");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v13;
    v26[3] = CFSTR("width");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v16;
    v26[4] = CFSTR("height");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("auto"));

  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("angle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6 * 3.14159265;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 / -180.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("straightenAngle"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("effectName"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("effectVersion"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intensity"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("effectIntensity"));
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("effectName"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("effectVersion"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intensity"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("effectIntensity"));
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("strength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6 + -0.5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("offsetStrength"));

}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v13[0] = CFSTR("auto");
    v11 = CFSTR("inputColor");
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("current");
    v14[0] = v9;
    v14[1] = CFSTR("auto");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("auto"));

  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetSaturation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetSaturation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("offsetSaturation"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetCast"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetCast"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("offsetCast"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("offsetContrast"));

  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("auto"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v13[0] = CFSTR("auto");
    v11 = CFSTR("inputLight");
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("current");
    v14[0] = v9;
    v14[1] = CFSTR("auto");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("auto"));

  }
}

void __55__PICompositionSerializerConstants_mapForSerialization__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputLight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputLight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v6, CFSTR("inputLight"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetBlack"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetBlack"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v8, CFSTR("offsetBlackPoint"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetExposure"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetExposure"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, CFSTR("offsetExposure"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v12, CFSTR("offsetContrast"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetBrightness"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetBrightness"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v14, CFSTR("offsetBrightness"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetHighlights"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetHighlights"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, CFSTR("offsetHighlights"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetShadows"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetShadows"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, CFSTR("offsetShadows"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetLocalLight"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offsetLocalLight"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("offsetLocalLight"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statistics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("lightMap"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("lightMap"));

    }
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("lightMapAvg"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("lightMapAvg"));

    }
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("statistics"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[6];
  _QWORD v39[6];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[9];
  _QWORD v43[9];
  _QWORD v44[8];
  _QWORD v45[8];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[8];
  _QWORD v51[8];
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[7];
  _QWORD v77[7];
  _QWORD v78[45];
  _QWORD v79[45];
  _QWORD v80[17];
  _QWORD v81[17];
  _QWORD v82[7];
  _QWORD v83[7];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[13];
  _QWORD v87[13];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD v92[6];
  _QWORD v93[6];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[4];
  _QWORD v97[4];
  _QWORD v98[6];
  _QWORD v99[6];
  _QWORD v100[5];
  _QWORD v101[5];
  _QWORD v102[8];
  _QWORD v103[8];
  _QWORD v104[9];
  _QWORD v105[9];
  _QWORD v106[15];
  _QWORD v107[15];
  _QWORD v108[35];
  _QWORD v109[37];

  v109[35] = *MEMORY[0x1E0C80C00];
  v108[0] = CFSTR("SmartTone");
  v106[0] = CFSTR("identifierName");
  v106[1] = CFSTR("compositionName");
  v107[0] = CFSTR("SmartTone");
  v107[1] = CFSTR("smartTone");
  v106[2] = CFSTR("inputLight");
  v106[3] = CFSTR("offsetBlackPoint");
  v107[2] = CFSTR("inputLight");
  v107[3] = CFSTR("offsetBlack");
  v106[4] = CFSTR("offsetBrightness");
  v106[5] = CFSTR("offsetContrast");
  v107[4] = CFSTR("offsetBrightness");
  v107[5] = CFSTR("offsetContrast");
  v106[6] = CFSTR("offsetExposure");
  v106[7] = CFSTR("offsetHighlights");
  v107[6] = CFSTR("offsetExposure");
  v107[7] = CFSTR("offsetHighlights");
  v106[8] = CFSTR("offsetLocalLight");
  v106[9] = CFSTR("offsetShadows");
  v107[8] = CFSTR("offsetLocalLight");
  v107[9] = CFSTR("offsetShadows");
  v106[10] = CFSTR("statistics");
  v106[11] = CFSTR("inputRawHighlights");
  v107[10] = CFSTR("statistics");
  v107[11] = CFSTR("inputRawHighlights");
  v106[12] = CFSTR("inputImage");
  v106[13] = CFSTR("auto");
  v107[12] = CFSTR("inputImage");
  v107[13] = CFSTR("auto");
  v106[14] = CFSTR("custom");
  v107[14] = &__block_literal_global_101_10614;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v37;
  v108[1] = CFSTR("SmartColor");
  v104[0] = CFSTR("identifierName");
  v104[1] = CFSTR("compositionName");
  v105[0] = CFSTR("SmartColor");
  v105[1] = CFSTR("smartColor");
  v104[2] = CFSTR("inputColor");
  v104[3] = CFSTR("offsetSaturation");
  v105[2] = CFSTR("inputColor");
  v105[3] = CFSTR("offsetSaturation");
  v104[4] = CFSTR("offsetContrast");
  v104[5] = CFSTR("offsetCast");
  v105[4] = CFSTR("offsetContrast");
  v105[5] = CFSTR("offsetCast");
  v104[6] = CFSTR("statistics");
  v104[7] = CFSTR("auto");
  v105[6] = CFSTR("statistics");
  v105[7] = CFSTR("auto");
  v104[8] = CFSTR("custom");
  v105[8] = &__block_literal_global_115_10615;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v36;
  v108[2] = CFSTR("SmartBlackAndWhite");
  v103[0] = CFSTR("SmartBlackAndWhite");
  v103[1] = CFSTR("smartBlackAndWhite");
  v102[2] = CFSTR("custom");
  v102[3] = CFSTR("offsetGrain");
  v102[0] = CFSTR("identifierName");
  v102[1] = CFSTR("compositionName");
  v102[4] = CFSTR("offsetTone");
  v102[5] = CFSTR("inputBlackAndWhite");
  v103[4] = CFSTR("tone");
  v103[5] = CFSTR("hue");
  v103[2] = &__block_literal_global_119;
  v103[3] = CFSTR("grain");
  v102[6] = CFSTR("offsetNeutralGamma");
  v102[7] = CFSTR("auto");
  v103[6] = CFSTR("neutral");
  v103[7] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v35;
  v108[3] = CFSTR("Grain");
  v100[0] = CFSTR("identifierName");
  v100[1] = CFSTR("compositionName");
  v101[0] = CFSTR("Grain");
  v101[1] = CFSTR("grain");
  v100[2] = CFSTR("iso");
  v100[3] = CFSTR("amount");
  v101[2] = CFSTR("iso");
  v101[3] = CFSTR("amount");
  v100[4] = CFSTR("seed");
  v101[4] = CFSTR("seed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v34;
  v108[4] = CFSTR("DGVignetteEffectOperation");
  v98[0] = CFSTR("identifierName");
  v98[1] = CFSTR("compositionName");
  v99[0] = CFSTR("Vignette");
  v99[1] = CFSTR("vignette");
  v98[2] = CFSTR("inputIntensity");
  v98[3] = CFSTR("inputRadius");
  v99[2] = CFSTR("intensity");
  v99[3] = CFSTR("radius");
  v98[4] = CFSTR("inputFalloff");
  v98[5] = CFSTR("auto");
  v99[4] = CFSTR("falloff");
  v99[5] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v33;
  v108[5] = CFSTR("DGDefinition2Operation");
  v96[0] = CFSTR("identifierName");
  v96[1] = CFSTR("compositionName");
  v97[0] = CFSTR("Definition");
  v97[1] = CFSTR("definition");
  v96[2] = CFSTR("inputIntensity");
  v96[3] = CFSTR("auto");
  v97[2] = CFSTR("intensity");
  v97[3] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v109[5] = v32;
  v108[6] = CFSTR("RKNoiseReductionOperation");
  v94[0] = CFSTR("identifierName");
  v94[1] = CFSTR("compositionName");
  v95[0] = CFSTR("NoiseReduction");
  v95[1] = CFSTR("noiseReduction");
  v94[2] = CFSTR("inputEdgeDetail");
  v94[3] = CFSTR("inputRadius");
  v95[2] = CFSTR("edgeDetail");
  v95[3] = CFSTR("radius");
  v94[4] = CFSTR("auto");
  v95[4] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v109[6] = v31;
  v108[7] = CFSTR("RKProSharpenOperation");
  v92[0] = CFSTR("identifierName");
  v92[1] = CFSTR("compositionName");
  v93[0] = CFSTR("Sharpen");
  v93[1] = CFSTR("sharpen");
  v92[2] = CFSTR("inputFalloff");
  v92[3] = CFSTR("inputEdgeScale");
  v93[2] = CFSTR("falloff");
  v93[3] = CFSTR("edges");
  v92[4] = CFSTR("inputSharpness");
  v92[5] = CFSTR("auto");
  v93[4] = CFSTR("intensity");
  v93[5] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v108[8] = CFSTR("Effect");
  v90[0] = CFSTR("customIdentifierName");
  v90[1] = CFSTR("customCompositionName");
  v91[0] = &__block_literal_global_196;
  v91[1] = &__block_literal_global_201;
  v109[7] = v30;
  v90[2] = CFSTR("effectVersion");
  v90[3] = CFSTR("effectIntensity");
  v91[2] = CFSTR("version");
  v91[3] = CFSTR("intensity");
  v90[4] = CFSTR("custom");
  v91[4] = &__block_literal_global_212_10619;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v109[8] = v29;
  v108[9] = CFSTR("Orientation");
  v88[0] = CFSTR("identifierName");
  v88[1] = CFSTR("compositionName");
  v89[0] = CFSTR("Orientation");
  v89[1] = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v109[9] = v28;
  v108[10] = CFSTR("Crop");
  v87[0] = CFSTR("CropStraighten");
  v87[1] = CFSTR("cropStraighten");
  v86[2] = CFSTR("xOrigin");
  v86[3] = CFSTR("yOrigin");
  v87[2] = CFSTR("xOrigin");
  v87[3] = CFSTR("yOrigin");
  v86[4] = CFSTR("width");
  v86[5] = CFSTR("height");
  v87[4] = CFSTR("width");
  v87[5] = CFSTR("height");
  v86[0] = CFSTR("identifierName");
  v86[1] = CFSTR("compositionName");
  v86[6] = CFSTR("straightenAngle");
  v86[7] = CFSTR("pitch");
  v87[6] = CFSTR("angle");
  v87[7] = CFSTR("pitch");
  v86[8] = CFSTR("yaw");
  v86[9] = CFSTR("auto");
  v87[8] = CFSTR("yaw");
  v87[9] = CFSTR("auto");
  v86[10] = CFSTR("constraintHeight");
  v86[11] = CFSTR("constraintWidth");
  v87[10] = CFSTR("constraintHeight");
  v87[11] = CFSTR("constraintWidth");
  v86[12] = CFSTR("custom");
  v87[12] = &__block_literal_global_243;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v109[10] = v27;
  v108[11] = CFSTR("DGRAWReduceNoiseOperation");
  v84[0] = CFSTR("identifierName");
  v84[1] = CFSTR("compositionName");
  v85[0] = CFSTR("RawNoiseReduction");
  v85[1] = CFSTR("rawNoiseReduction");
  v84[2] = CFSTR("inputDetailAmount");
  v84[3] = CFSTR("inputCNRAmount");
  v85[2] = CFSTR("detail");
  v85[3] = CFSTR("color");
  v84[4] = CFSTR("inputLNRAmount");
  v85[4] = CFSTR("luminance");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v109[11] = v26;
  v108[12] = CFSTR("RKRawDecodeOperation");
  v83[0] = CFSTR("RAW");
  v83[1] = CFSTR("raw");
  v82[0] = CFSTR("identifierName");
  v82[1] = CFSTR("compositionName");
  v82[2] = CFSTR("inputMethodVersion");
  v82[3] = CFSTR("boostVersion");
  v83[2] = CFSTR("inputDecoderVersion");
  v83[3] = CFSTR("boostVersion");
  v82[4] = CFSTR("boostParams");
  v82[5] = CFSTR("gainMapVersion");
  v83[4] = CFSTR("boostParams");
  v83[5] = CFSTR("gainMapVersion");
  v82[6] = CFSTR("gainMapParameters");
  v83[6] = CFSTR("gainMapParameters");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v109[12] = v25;
  v108[13] = CFSTR("WhiteBalance");
  v80[0] = CFSTR("identifierName");
  v80[1] = CFSTR("compositionName");
  v81[0] = CFSTR("WhiteBalance");
  v81[1] = CFSTR("whiteBalance");
  v80[2] = CFSTR("faceStrength");
  v80[3] = CFSTR("faceWarmth");
  v81[2] = CFSTR("faceStrength");
  v81[3] = CFSTR("faceWarmth");
  v80[4] = CFSTR("faceI");
  v80[5] = CFSTR("faceQ");
  v81[4] = CFSTR("faceI");
  v81[5] = CFSTR("faceQ");
  v80[6] = CFSTR("grayWarmth");
  v80[7] = CFSTR("grayY");
  v81[6] = CFSTR("grayWarmth");
  v81[7] = CFSTR("grayY");
  v80[8] = CFSTR("grayI");
  v80[9] = CFSTR("grayQ");
  v81[8] = CFSTR("grayI");
  v81[9] = CFSTR("grayQ");
  v80[10] = CFSTR("auto");
  v80[11] = CFSTR("custom");
  v81[10] = CFSTR("auto");
  v81[11] = &__block_literal_global_298;
  v80[12] = CFSTR("temperature");
  v80[13] = CFSTR("tint");
  v81[12] = CFSTR("temperature");
  v81[13] = CFSTR("tint");
  v80[14] = CFSTR("warmTemp");
  v80[15] = CFSTR("warmTint");
  v81[14] = CFSTR("warmTemp");
  v81[15] = CFSTR("warmTint");
  v80[16] = CFSTR("warmFace");
  v81[16] = CFSTR("warmFace");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v109[13] = v24;
  v108[14] = CFSTR("RKLevelsOperation");
  v78[0] = CFSTR("identifierName");
  v78[1] = CFSTR("compositionName");
  v79[0] = CFSTR("Levels");
  v79[1] = CFSTR("levels");
  v78[2] = CFSTR("colorSpace");
  v78[3] = CFSTR("inputBlackSrcRGB");
  v79[2] = CFSTR("inputColorSpace");
  v79[3] = CFSTR("blackSrcRGB");
  v78[4] = CFSTR("inputBlackDstRGB");
  v78[5] = CFSTR("inputShadowSrcRGB");
  v79[4] = CFSTR("blackDstRGB");
  v79[5] = CFSTR("shadowSrcRGB");
  v78[6] = CFSTR("inputShadowDstRGB");
  v78[7] = CFSTR("inputMidSrcRGB");
  v79[6] = CFSTR("shadowDstRGB");
  v79[7] = CFSTR("midSrcRGB");
  v78[8] = CFSTR("inputMidDstRGB");
  v78[9] = CFSTR("inputHilightSrcRGB");
  v79[8] = CFSTR("midDstRGB");
  v79[9] = CFSTR("hilightSrcRGB");
  v78[10] = CFSTR("inputHilightDstRGB");
  v78[11] = CFSTR("inputWhiteSrcRGB");
  v79[10] = CFSTR("hilightDstRGB");
  v79[11] = CFSTR("whiteSrcRGB");
  v78[12] = CFSTR("inputWhiteDstRGB");
  v78[13] = CFSTR("inputBlackSrcRed");
  v79[12] = CFSTR("whiteDstRGB");
  v79[13] = CFSTR("blackSrcRed");
  v78[14] = CFSTR("inputBlackDstRed");
  v78[15] = CFSTR("inputShadowSrcRed");
  v79[14] = CFSTR("blackDstRed");
  v79[15] = CFSTR("shadowSrcRed");
  v78[16] = CFSTR("inputShadowDstRed");
  v78[17] = CFSTR("inputMidSrcRed");
  v79[16] = CFSTR("shadowDstRed");
  v79[17] = CFSTR("midSrcRed");
  v78[18] = CFSTR("inputMidDstRed");
  v78[19] = CFSTR("inputHilightSrcRed");
  v79[18] = CFSTR("midDstRed");
  v79[19] = CFSTR("hilightSrcRed");
  v78[20] = CFSTR("inputHilightDstRed");
  v78[21] = CFSTR("inputWhiteSrcRed");
  v79[20] = CFSTR("hilightDstRed");
  v79[21] = CFSTR("whiteSrcRed");
  v78[22] = CFSTR("inputWhiteDstRed");
  v78[23] = CFSTR("inputBlackSrcGreen");
  v79[22] = CFSTR("whiteDstRed");
  v79[23] = CFSTR("blackSrcGreen");
  v78[24] = CFSTR("inputBlackDstGreen");
  v78[25] = CFSTR("inputShadowSrcGreen");
  v79[24] = CFSTR("blackDstGreen");
  v79[25] = CFSTR("shadowSrcGreen");
  v78[26] = CFSTR("inputShadowDstGreen");
  v78[27] = CFSTR("inputMidSrcGreen");
  v79[26] = CFSTR("shadowDstGreen");
  v79[27] = CFSTR("midSrcGreen");
  v78[28] = CFSTR("inputMidDstGreen");
  v78[29] = CFSTR("inputHilightSrcGreen");
  v79[28] = CFSTR("midDstGreen");
  v79[29] = CFSTR("hilightSrcGreen");
  v78[30] = CFSTR("inputHilightDstGreen");
  v78[31] = CFSTR("inputWhiteSrcGreen");
  v79[30] = CFSTR("hilightDstGreen");
  v79[31] = CFSTR("whiteSrcGreen");
  v78[32] = CFSTR("inputWhiteDstGreen");
  v78[33] = CFSTR("inputBlackSrcBlue");
  v79[32] = CFSTR("whiteDstGreen");
  v79[33] = CFSTR("blackSrcBlue");
  v78[34] = CFSTR("inputBlackDstBlue");
  v78[35] = CFSTR("inputShadowSrcBlue");
  v79[34] = CFSTR("blackDstBlue");
  v79[35] = CFSTR("shadowSrcBlue");
  v78[36] = CFSTR("inputShadowDstBlue");
  v78[37] = CFSTR("inputMidSrcBlue");
  v79[36] = CFSTR("shadowDstBlue");
  v79[37] = CFSTR("midSrcBlue");
  v78[38] = CFSTR("inputMidDstBlue");
  v78[39] = CFSTR("inputHilightSrcBlue");
  v79[38] = CFSTR("midDstBlue");
  v79[39] = CFSTR("hilightSrcBlue");
  v78[40] = CFSTR("inputHilightDstBlue");
  v78[41] = CFSTR("inputWhiteSrcBlue");
  v79[40] = CFSTR("hilightDstBlue");
  v79[41] = CFSTR("whiteSrcBlue");
  v78[42] = CFSTR("inputWhiteDstBlue");
  v78[43] = CFSTR("auto");
  v79[42] = CFSTR("whiteDstBlue");
  v79[43] = CFSTR("auto");
  v78[44] = CFSTR("custom");
  v79[44] = &__block_literal_global_493;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v109[14] = v23;
  v108[15] = CFSTR("RKCurvesOperation");
  v77[0] = CFSTR("Curves");
  v77[1] = CFSTR("curves");
  v76[2] = CFSTR("RGBCurvePoints");
  v76[3] = CFSTR("redCurvePoints");
  v77[2] = CFSTR("pointsL");
  v77[3] = CFSTR("pointsR");
  v76[4] = CFSTR("greenCurvePoints");
  v76[5] = CFSTR("blueCurvePoints");
  v76[0] = CFSTR("identifierName");
  v76[1] = CFSTR("compositionName");
  v77[4] = CFSTR("pointsG");
  v77[5] = CFSTR("pointsB");
  v76[6] = CFSTR("auto");
  v77[6] = CFSTR("auto");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v109[15] = v22;
  v108[16] = CFSTR("RKSelectiveColorOperation");
  v74[0] = CFSTR("identifierName");
  v74[1] = CFSTR("compositionName");
  v75[0] = CFSTR("SelectiveColor");
  v75[1] = CFSTR("selectiveColor");
  v74[2] = CFSTR("custom");
  v75[2] = &__block_literal_global_530;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v109[16] = v21;
  v108[17] = CFSTR("RKRetouchOperation");
  v72[0] = CFSTR("identifierName");
  v72[1] = CFSTR("compositionName");
  v73[0] = CFSTR("Retouch");
  v73[1] = CFSTR("retouch");
  v72[2] = CFSTR("supported");
  v72[3] = CFSTR("custom");
  v73[2] = &__block_literal_global_541;
  v73[3] = &__block_literal_global_542;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v109[17] = v20;
  v108[18] = CFSTR("RKRedEyeOperation");
  v70[0] = CFSTR("identifierName");
  v70[1] = CFSTR("compositionName");
  v71[0] = CFSTR("ApertureRedEye");
  v71[1] = CFSTR("apertureRedEye");
  v70[2] = CFSTR("custom");
  v71[2] = &__block_literal_global_589;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v109[18] = v19;
  v108[19] = CFSTR("RedEyeBB");
  v68[0] = CFSTR("identifierName");
  v68[1] = CFSTR("compositionName");
  v69[0] = CFSTR("RedEye");
  v69[1] = CFSTR("redEye");
  v68[2] = CFSTR("allCorrections");
  v68[3] = CFSTR("auto");
  v69[2] = CFSTR("inputCorrectionInfo");
  v69[3] = CFSTR("auto");
  v68[4] = CFSTR("custom");
  v69[4] = &__block_literal_global_609;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v109[19] = v18;
  v108[20] = CFSTR("Mute");
  v66[0] = CFSTR("identifierName");
  v66[1] = CFSTR("compositionName");
  v67[0] = CFSTR("Mute");
  v67[1] = CFSTR("mute");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109[20] = v17;
  v108[21] = CFSTR("Trim");
  v64[0] = CFSTR("identifierName");
  v64[1] = CFSTR("compositionName");
  v65[0] = CFSTR("Trim");
  v65[1] = CFSTR("trim");
  v64[2] = CFSTR("custom");
  v65[2] = &__block_literal_global_619;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v109[21] = v16;
  v108[22] = CFSTR("SlowMotion");
  v62[0] = CFSTR("identifierName");
  v62[1] = CFSTR("compositionName");
  v63[0] = CFSTR("SlowMotion");
  v63[1] = CFSTR("slomo");
  v62[2] = CFSTR("custom");
  v63[2] = &__block_literal_global_635;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v109[22] = v15;
  v108[23] = CFSTR("LivePhotoKeyFrame");
  v60[0] = CFSTR("identifierName");
  v60[1] = CFSTR("compositionName");
  v61[0] = CFSTR("LivePhotoKeyFrame");
  v61[1] = CFSTR("livePhotoKeyFrame");
  v60[2] = CFSTR("custom");
  v61[2] = &__block_literal_global_645;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v109[23] = v14;
  v108[24] = CFSTR("VideoPosterFrame");
  v58[0] = CFSTR("identifierName");
  v58[1] = CFSTR("compositionName");
  v59[0] = CFSTR("VideoPosterFrame");
  v59[1] = CFSTR("videoPosterFrame");
  v58[2] = CFSTR("custom");
  v59[2] = &__block_literal_global_657;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v109[24] = v13;
  v108[25] = CFSTR("AutoLoop");
  v57[0] = CFSTR("AutoLoop");
  v57[1] = CFSTR("autoLoop");
  v56[0] = CFSTR("identifierName");
  v56[1] = CFSTR("compositionName");
  v56[2] = CFSTR("recipe");
  v56[3] = CFSTR("flavor");
  v57[2] = CFSTR("recipe");
  v57[3] = CFSTR("flavor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v109[25] = v12;
  v108[26] = CFSTR("HighResolutionFusion");
  v54[0] = CFSTR("identifierName");
  v54[1] = CFSTR("compositionName");
  v55[0] = CFSTR("HighResolutionFusion");
  v55[1] = CFSTR("highResFusion");
  v54[2] = CFSTR("alignment");
  v54[3] = CFSTR("omitIfDisabled");
  v0 = MEMORY[0x1E0C9AAB0];
  v55[2] = CFSTR("alignment");
  v55[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v109[26] = v11;
  v108[27] = CFSTR("DepthEffect");
  v53[0] = CFSTR("DepthEffect");
  v53[1] = CFSTR("depthEffect");
  v52[2] = CFSTR("depthInfo");
  v52[3] = CFSTR("aperture");
  v53[2] = CFSTR("depthInfo");
  v53[3] = CFSTR("aperture");
  v52[0] = CFSTR("identifierName");
  v52[1] = CFSTR("compositionName");
  v52[4] = CFSTR("focusRect");
  v52[5] = CFSTR("glassesMatteAllowed");
  v53[4] = CFSTR("focusRect");
  v53[5] = CFSTR("glassesMatteAllowed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v109[27] = v10;
  v108[28] = CFSTR("PortraitEffect");
  v50[0] = CFSTR("identifierName");
  v50[1] = CFSTR("compositionName");
  v51[0] = CFSTR("PortraitEffect");
  v51[1] = CFSTR("portraitEffect");
  v50[2] = CFSTR("portraitInfo");
  v50[3] = CFSTR("strength");
  v51[2] = CFSTR("portraitInfo");
  v51[3] = CFSTR("strength");
  v50[4] = CFSTR("spillMatteAllowed");
  v50[5] = CFSTR("portraitEffectFilterName");
  v51[4] = CFSTR("spillMatteAllowed");
  v51[5] = CFSTR("kind");
  v50[6] = CFSTR("omitIfDisabled");
  v50[7] = CFSTR("custom");
  v51[6] = v0;
  v51[7] = &__block_literal_global_689;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v109[28] = v9;
  v108[29] = CFSTR("VideoStabilize");
  v48[0] = CFSTR("identifierName");
  v48[1] = CFSTR("compositionName");
  v49[0] = CFSTR("VideoStabilize");
  v49[1] = CFSTR("videoStabilize");
  v48[2] = CFSTR("enabled");
  v48[3] = CFSTR("custom");
  v49[2] = CFSTR("enabled");
  v49[3] = &__block_literal_global_697;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v109[29] = v1;
  v108[30] = CFSTR("VideoCrossfadeLoop");
  v46[0] = CFSTR("identifierName");
  v46[1] = CFSTR("compositionName");
  v47[0] = CFSTR("VideoCrossfadeLoop");
  v47[1] = CFSTR("videoCrossfadeLoop");
  v46[2] = CFSTR("enabled");
  v46[3] = CFSTR("custom");
  v47[2] = CFSTR("enabled");
  v47[3] = &__block_literal_global_709;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v109[30] = v2;
  v108[31] = CFSTR("SemanticEnhance");
  v44[0] = CFSTR("identifierName");
  v44[1] = CFSTR("compositionName");
  v45[0] = CFSTR("SemanticEnhance");
  v45[1] = CFSTR("semanticEnhance");
  v44[2] = CFSTR("enabled");
  v44[3] = CFSTR("intensity");
  v44[4] = CFSTR("sceneLabel");
  v44[5] = CFSTR("sceneConfidence");
  v45[4] = CFSTR("sceneLabel");
  v45[5] = CFSTR("sceneConfidence");
  v45[2] = CFSTR("enabled");
  v45[3] = CFSTR("intensity");
  v44[6] = CFSTR("boundingBoxes");
  v44[7] = CFSTR("faceBoundingBoxes");
  v45[6] = CFSTR("boundingBoxes");
  v45[7] = CFSTR("faceBoundingBoxes");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v109[31] = v3;
  v108[32] = CFSTR("SemanticStyle");
  v42[0] = CFSTR("identifierName");
  v42[1] = CFSTR("compositionName");
  v43[0] = CFSTR("SemanticStyle");
  v43[1] = CFSTR("semanticStyle");
  v42[2] = CFSTR("enabled");
  v42[3] = CFSTR("tone");
  v43[2] = CFSTR("enabled");
  v43[3] = CFSTR("tone");
  v42[4] = CFSTR("cast");
  v42[5] = CFSTR("color");
  v43[4] = CFSTR("cast");
  v43[5] = CFSTR("color");
  v42[6] = CFSTR("intensity");
  v42[7] = CFSTR("debugMode");
  v43[6] = CFSTR("intensity");
  v43[7] = CFSTR("debugMode");
  v42[8] = CFSTR("supported");
  v43[8] = &__block_literal_global_747;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v109[32] = v4;
  v108[33] = CFSTR("PortraitVideo");
  v40[0] = CFSTR("identifierName");
  v40[1] = CFSTR("compositionName");
  v41[0] = CFSTR("PortraitVideo");
  v41[1] = CFSTR("portraitVideo");
  v40[2] = CFSTR("enabled");
  v40[3] = CFSTR("custom");
  v41[2] = CFSTR("enabled");
  v41[3] = &__block_literal_global_751;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v109[33] = v5;
  v108[34] = CFSTR("CinematicAudio");
  v38[0] = CFSTR("identifierName");
  v38[1] = CFSTR("compositionName");
  v39[0] = CFSTR("CinematicAudio");
  v39[1] = CFSTR("cinematicAudio");
  v38[2] = CFSTR("enabled");
  v38[3] = CFSTR("dialogMixBias");
  v39[2] = CFSTR("enabled");
  v39[3] = CFSTR("dialogMixBias");
  v38[4] = CFSTR("renderingStyle");
  v38[5] = CFSTR("supported");
  v39[4] = CFSTR("renderingStyle");
  v39[5] = &__block_literal_global_767;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v109[34] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 35);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)conversionMap__s_conversionMap;
  conversionMap__s_conversionMap = v7;

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_11_750(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disparityKeyframes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("disparityKeyframes"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("apertureKeyframes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("apertureKeyframes"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cinematographyState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("cinematographyState"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("debugMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("debugMode"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("renderingVersionAtCapture"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("renderingVersionAtCapture"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_9_708(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CMTimeRange v17;
  CMTime v18;
  CMTime v19;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19, 0, sizeof(v19));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("crossfadeDuration"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v19, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19.value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("crossfadeDurationValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19.timescale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("crossfadeDurationTimescale"));

  memset(&v18, 0, sizeof(v18));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTime"));
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v18, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18.value);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("startTimeValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18.timescale);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("startTimeTimescale"));

  memset(&v17, 0, sizeof(v17));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopTimeRange"));
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeRangeMakeFromDictionary(&v17, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17.start.value);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("timeRangeStartValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17.start.timescale);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("timeRangeStartTimescale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17.duration.value);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("timeRangeDurationValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17.duration.timescale);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("timeRangeDurationTimescale"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_8_696(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyframes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("keyframes"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("stabCropRect"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cropFraction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("cropFraction"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("analysisType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("analysisType"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_7_688(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Light"), CFSTR("kind"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_6_656(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("time"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("time"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timescale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("scale"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_5_644(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("time"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("time"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timescale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("scale"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_4_634(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  CMTimeValue value;
  uint64_t timescale;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMTimeRange v16;
  CMTime v17;
  CMTimeRange v18;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("regions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timeRange"));
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  memset(&v18, 0, sizeof(v18));
  CMTimeRangeMakeFromDictionary(&v18, v8);
  value = v18.start.value;
  timescale = v18.start.timescale;
  memset(&v17, 0, sizeof(v17));
  v16 = v18;
  CMTimeRangeGetEnd(&v17, &v16);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("rate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", value);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("start"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", timescale);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("startScale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17.value);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("end"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17.timescale);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("endScale"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_3_618(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v12;
  CMTime v13;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v13, 0, sizeof(v13));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTime"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v13, v6);

  memset(&v12, 0, sizeof(v12));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endTime"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v12, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13.value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("start"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12.value);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("end"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13.timescale);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("startScale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12.timescale);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("endScale"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2_608(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(&unk_1E5058D88, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(&unk_1E5058D88);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "count"))
          objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(&unk_1E5058D88, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  if (objc_msgSend(v6, "count"))
  {
    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("inputCorrectionInfo"));

  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_588(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inputSpots"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = 0;
    v21 = v8;
    v22 = v7;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = CFSTR("pointX");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("center"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("x"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v12;
      v23[1] = CFSTR("pointY");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("center"));
      v13 = v5;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("y"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      v23[2] = CFSTR("radius");
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v16;
      v23[3] = CFSTR("sensitivity");
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v13;
      objc_msgSend(v13, "addObject:", v18);

      v7 = v22;
      ++v9;
    }
    while (v21 != v9);
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v5, CFSTR("inputCorrectionInfo"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  id v17;
  void *v18;
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id obj;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inputStrokes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasSource"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasSource"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "BOOLValue");

          if (!v12)
            continue;
        }
        v52 = i;
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E5051430, CFSTR("version"));
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mode"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");
        v16 = &kRepairModeClone;
        if (v15 != 1)
          v16 = (uint64_t *)&kRepairModeRepairML;
        if (!v15)
          v16 = &kRepairModeRepair;
        v17 = (id)*v16;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("mode"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("radius"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("radius"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("softness"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("softness"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("opacity"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("opacity"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("repairEdges"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("repairEdges"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sourceOffset"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("sourceOffset"));

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasSource"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v13;
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("hasSource"));

        v51 = v8;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("brushStroke"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("data"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)objc_opt_new();
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v30 = v28;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v54 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              v61[0] = CFSTR("x");
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("xLocation"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = v36;
              v61[1] = CFSTR("y");
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("yLocation"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v62[1] = v37;
              v61[2] = CFSTR("p");
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("pressure"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v62[2] = v38;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "addObject:", v39);
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v32);
        }

        objc_msgSend(v50, "setObject:forKeyedSubscript:", v29, CFSTR("points"));
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("clipRect"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("clipRect"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v41, CFSTR("clipRect"));

        }
        objc_msgSend(v47, "addObject:", v50);

        i = v52;
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v49);
  }

  objc_msgSend(v45, "setObject:forKeyedSubscript:", v47, CFSTR("inputStrokes"));
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("inputKeys"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("detectedFaces"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v43, CFSTR("detectedFaces"));

}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_12()
{
  return 0;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("corrections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("corrections"));

  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("colorSpace"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Generic P3")) & 1) != 0)
    {
      v7 = CFSTR("Display P3");
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Adobe RGB")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("sRGB")) & 1) != 0
        || (objc_msgSend(v6, "isEqualToString:", CFSTR("Display P3")) & 1) != 0)
      {
        goto LABEL_8;
      }
      v7 = CFSTR("sRGB");
    }

    v6 = (void *)v7;
LABEL_8:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("colorSpace"));

  }
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
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
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56[4];

  v56[3] = *(double *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("colorType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIWhiteBalanceAdjustmentController stringForColorType:](PIWhiteBalanceAdjustmentController, "stringForColorType:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("colorType"));

  objc_msgSend(v4, "valueForKey:", CFSTR("temperature"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  +[PICompositionController settingForAdjustmentKey:settingKey:](PICompositionController, "settingForAdjustmentKey:settingKey:", CFSTR("whiteBalance"), CFSTR("temperature"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimumValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v11, "maximumValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  if (v8)
  {
    if (v10 < v14 || v10 > v17)
    {
      objc_msgSend(v11, "defaultValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("temperature"));

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("grayColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("colorComponents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v56[0] = v24;

    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v56[1] = v26;

    objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v56[2] = v28;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EV"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("slope"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bias"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    v54 = 0.0;
    v55 = 0.0;
    v53 = 0.0;
    YIQFromRGB(v56, &v55, &v54, &v53, v31, v34, v37);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("grayY"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("grayI"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("grayQ"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceStrength"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("faceStrength"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceWarmth"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("faceWarmth"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceI"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("faceI"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQ"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("faceQ"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceWarmth"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("faceWarmth"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayWarmth"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("grayWarmth"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayY"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("grayY"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayI"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("grayI"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("grayQ"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("grayQ"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmFace"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("warmFace"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTemp"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("warmTemp"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("warmTint"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("warmTint"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("straightenAngle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7 * 180.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 / -3.14159265);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("angle"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auto"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("auto"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("effectName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIPhotoEditHelper effectNameForFilterName:](PIPhotoEditHelper, "effectNameForFilterName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kind"));

}

const __CFString *__49__PICompositionSerializerConstants_conversionMap__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("effectName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PIPhotoEditHelper is3DEffect:](PIPhotoEditHelper, "is3DEffect:", v2))
    v3 = CFSTR("effect3D");
  else
    v3 = CFSTR("effect");

  return v3;
}

const __CFString *__49__PICompositionSerializerConstants_conversionMap__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("effectName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PIPhotoEditHelper is3DEffect:](PIPhotoEditHelper, "is3DEffect:", v2))
    v3 = CFSTR("Effect3D");
  else
    v3 = CFSTR("Effect");

  return v3;
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("settings"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("offsetStrength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v6, "numberWithDouble:", v7 + 0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("strength"));

}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2_114(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PISmartColorAdjustmentController *v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetSaturation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetSaturation"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetCast"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetCast"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetContrast"));
  v9 = -[PISmartColorAdjustmentController initWithAdjustment:]([PISmartColorAdjustmentController alloc], "initWithAdjustment:", v3);
  -[PISmartColorAdjustmentController computedSettings](v9, "computedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PICompositionSerializerConstants_conversionMap__block_invoke_3;
  v10[3] = &unk_1E5017628;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __49__PICompositionSerializerConstants_conversionMap__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
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
  void *v16;
  void *v17;
  void *v18;
  id v19;
  PISmartToneAdjustmentController *v20;
  _QWORD v21[4];
  id v22;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetBlack"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetBlack"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetExposure"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetExposure"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetContrast"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetBrightness"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetBrightness"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetHighlights"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetHighlights"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetShadows"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetShadows"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offsetLocalLight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5051418, CFSTR("offsetLocalLight"));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("statistics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lightMap"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 1);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("lightMap"));

    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("lightMapAvg"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 1);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("lightMapAvg"));

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("statistics"));

  v20 = -[PISmartToneAdjustmentController initWithAdjustment:]([PISmartToneAdjustmentController alloc], "initWithAdjustment:", v3);
  -[PISmartToneAdjustmentController computedSettings](v20, "computedSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__PICompositionSerializerConstants_conversionMap__block_invoke_103;
  v21[3] = &unk_1E5017628;
  v22 = v3;
  v19 = v3;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v21);

}

uint64_t __49__PICompositionSerializerConstants_conversionMap__block_invoke_103(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

@end
