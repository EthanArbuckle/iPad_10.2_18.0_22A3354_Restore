@implementation CRFuthark

+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend((id)objc_opt_class(), "runFutharkOnImage:recognizeFeatures:options:", v5, v8 ^ 1u, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)detectAndRecognizeTextInImage:(id)a3 options:(id)a4 withProgressHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend((id)objc_opt_class(), "runFutharkOnImage:recognizeFeatures:withMaxNumScales:withThresholdingAlgorithm:options:withProgressHandler:", v7, v11 ^ 1u, 0, 4, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)detectAndRecognizeTextInImage:(id)a3 withMaxNumScales:(unint64_t)a4 options:(id)a5 withProgressHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDetectionOnly"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend((id)objc_opt_class(), "runFutharkOnImage:recognizeFeatures:withMaxNumScales:withThresholdingAlgorithm:options:withProgressHandler:", v9, v13 ^ 1u, a4, 4, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 options:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "runFutharkOnImage:recognizeFeatures:withMaxNumScales:withThresholdingAlgorithm:options:withProgressHandler:", v7, v6, 0, 4, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)runFutharkOnImage:(id)a3 recognizeFeatures:(BOOL)a4 withMaxNumScales:(unint64_t)a5 withThresholdingAlgorithm:(int64_t)a6 options:(id)a7 withProgressHandler:(id)a8
{
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  char v18;
  __CFString *v19;
  void *v20;
  char isKindOfClass;
  const __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  size_t v34;
  size_t v35;
  void *v36;
  size_t v37;
  uint64_t v38;
  void *v39;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CRTextFeature *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id obj;
  void (**v117)(double);
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  uint64_t k;
  CRTextFeature *v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  _BOOL4 v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t m;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  CVPixelBufferRef texture;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v130 = a4;
  v166 = *MEMORY[0x1E0C80C00];
  v121 = a3;
  v126 = a7;
  v117 = (void (**)(double))a8;
  v123 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23358]), "initWithDimensions:", 128.0, 128.0);
  objc_msgSend(v123, "setReturnSubFeatures:", 1);
  objc_msgSend(v123, "setMinimizeFalseDetections:", 1);
  v12 = objc_msgSend(v121, "height");
  v13 = objc_msgSend(v121, "width");
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  v15 = (int)((double)v14 * 0.005);
  if (v15 <= 5)
    v16 = 5;
  else
    v16 = v15;
  objc_msgSend(v123, "setMinimumCharacterHeight:", v16);
  objc_msgSend(v123, "setDetectDiacritics:", 1);
  objc_msgSend(v123, "setThresholdingAlgorithm:", a6);
  if (v130)
  {
    objc_msgSend(v126, "objectForKey:", CFSTR("CRImageReaderDisableLanguageCorrection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if ((v18 & 1) == 0)
    {
      v19 = (__CFString *)objc_opt_new();
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      +[CRImageReader languageSetFromOptionsDictionary:](CRImageReader, "languageSetFromOptionsDictionary:", v126);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v158;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v158 != v29)
              objc_enumerationMutation(v27);
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * i));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "languageCode");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            -[__CFString addObject:](v19, "addObject:", v32);
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v157, v165, 16);
        }
        while (v28);
      }

      -[__CFString array](v19, "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "setRecognitionLanguages:", v20);
      goto LABEL_33;
    }
    objc_msgSend(v126, "objectForKey:", CFSTR("CRImageReaderLanguageKey"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v22 = v19;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unrecognized language argument type when calling Futhark"), 0);
              v111 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v111);
            }
          }
        }
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        v23 = v19;
        v24 = -[__CFString countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v153, v164, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v154;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v154 != v25)
                objc_enumerationMutation(v23);
              objc_msgSend(v20, "addObject:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j));
            }
            v24 = -[__CFString countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v153, v164, 16);
          }
          while (v24);
        }

        goto LABEL_32;
      }
    }
    else
    {
      v22 = CFSTR("en");
    }
    objc_msgSend(v20, "addObject:", v22);
LABEL_32:
    objc_msgSend(v123, "setRecognitionLanguages:", v20);
LABEL_33:

  }
  if (a5)
    objc_msgSend(v123, "setMergeSettings:", a5 << 32);
  objc_msgSend(v121, "imageByConvertingToColorSpace:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  texture = 0;
  v122 = v33;
  v34 = objc_msgSend(v33, "width");
  v35 = objc_msgSend(v33, "height");
  if (v33)
  {
    objc_msgSend(v33, "vImage");
    v36 = (void *)v150;
    objc_msgSend(v33, "vImage");
    v37 = *((_QWORD *)&v149 + 1);
  }
  else
  {
    v37 = 0;
    v36 = 0;
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
  }
  v38 = CVPixelBufferCreateWithBytes(0, v34, v35, 0x4C303038u, v36, v37, 0, 0, 0, &texture);
  if ((_DWORD)v38)
  {
    NSLog(CFSTR("Unable to create pixel buffer for CRImage. Error: %d"), v38);
    v39 = 0;
  }
  else
  {
    if (v117)
      v117[2](0.200000003);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = 0;
    objc_msgSend(v123, "detectFeaturesInBuffer:error:", texture, &v147);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v147;
    if (v114)
    {
      CVPixelBufferRelease(texture);
      NSLog(CFSTR("Error running Futhark: %@"), v114);
      v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferRelease(texture);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v115, "count"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      obj = v115;
      v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
      if (v119)
      {
        v118 = *(_QWORD *)v144;
        do
        {
          for (k = 0; k != v119; ++k)
          {
            if (*(_QWORD *)v144 != v118)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
            v125 = objc_alloc_init(CRTextFeature);
            objc_msgSend(v41, "boundingBox");
            -[CRTextFeature setBounds:](v125, "setBounds:");
            -[CRTextFeature bounds](v125, "bounds");
            -[CRTextFeature setTopLeft:](v125, "setTopLeft:");
            -[CRTextFeature bounds](v125, "bounds");
            v43 = v42;
            -[CRTextFeature bounds](v125, "bounds");
            v45 = v44;
            -[CRTextFeature bounds](v125, "bounds");
            -[CRTextFeature setBottomLeft:](v125, "setBottomLeft:", v43, v45 + v46);
            -[CRTextFeature bounds](v125, "bounds");
            v48 = v47;
            -[CRTextFeature bounds](v125, "bounds");
            v50 = v49;
            -[CRTextFeature bounds](v125, "bounds");
            -[CRTextFeature setTopRight:](v125, "setTopRight:", v48 + v50);
            -[CRTextFeature bounds](v125, "bounds");
            v52 = v51;
            -[CRTextFeature bounds](v125, "bounds");
            v54 = v53;
            -[CRTextFeature bounds](v125, "bounds");
            v56 = v55;
            -[CRTextFeature bounds](v125, "bounds");
            -[CRTextFeature setBottomRight:](v125, "setBottomRight:", v52 + v54, v56 + v57);
            if (v130)
            {
              objc_msgSend(v41, "text");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRTextFeature setStringValue:](v125, "setStringValue:", v58);

            }
            v59 = (void *)MEMORY[0x1E0C99DE8];
            -[CRTextFeature subFeatures](v125, "subFeatures");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "arrayWithCapacity:", objc_msgSend(v60, "count"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();

            v141 = 0u;
            v142 = 0u;
            v139 = 0u;
            v140 = 0u;
            objc_msgSend(v41, "subFeatures");
            v127 = (id)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v139, v162, 16);
            if (v132)
            {
              v129 = *(_QWORD *)v140;
              do
              {
                for (m = 0; m != v132; ++m)
                {
                  if (*(_QWORD *)v140 != v129)
                    objc_enumerationMutation(v127);
                  v61 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * m);
                  v62 = objc_alloc_init(CRTextFeature);
                  objc_msgSend(v61, "boundingBox");
                  -[CRTextFeature setBounds:](v62, "setBounds:");
                  -[CRTextFeature bounds](v62, "bounds");
                  -[CRTextFeature setTopLeft:](v62, "setTopLeft:");
                  -[CRTextFeature bounds](v62, "bounds");
                  v64 = v63;
                  -[CRTextFeature bounds](v62, "bounds");
                  v66 = v65;
                  -[CRTextFeature bounds](v62, "bounds");
                  -[CRTextFeature setBottomLeft:](v62, "setBottomLeft:", v64, v66 + v67);
                  -[CRTextFeature bounds](v62, "bounds");
                  v69 = v68;
                  -[CRTextFeature bounds](v62, "bounds");
                  v71 = v70;
                  -[CRTextFeature bounds](v62, "bounds");
                  -[CRTextFeature setTopRight:](v62, "setTopRight:", v69 + v71);
                  -[CRTextFeature bounds](v62, "bounds");
                  v73 = v72;
                  -[CRTextFeature bounds](v62, "bounds");
                  v75 = v74;
                  -[CRTextFeature bounds](v62, "bounds");
                  v77 = v76;
                  -[CRTextFeature bounds](v62, "bounds");
                  -[CRTextFeature setBottomRight:](v62, "setBottomRight:", v73 + v75, v77 + v78);
                  if (v130)
                  {
                    objc_msgSend(v61, "text");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CRTextFeature setStringValue:](v62, "setStringValue:", v79);

                    objc_msgSend(v126, "objectForKey:", CFSTR("CRTextRecognizerNumberResultsNeeded"));
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v133)
                    {
                      objc_msgSend(v61, "candidates");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v81 = objc_msgSend(v80, "count") == 0;

                      if (!v81)
                      {
                        v82 = objc_msgSend(v133, "integerValue");
                        v83 = (void *)MEMORY[0x1E0C99DE8];
                        objc_msgSend(v61, "candidates");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v83, "arrayWithCapacity:", objc_msgSend(v84, "count"));
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v128 = v82;

                        v86 = (void *)MEMORY[0x1E0C99DE8];
                        objc_msgSend(v61, "candidates");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v86, "arrayWithCapacity:", objc_msgSend(v87, "count"));
                        v88 = (void *)objc_claimAutoreleasedReturnValue();

                        v137 = 0u;
                        v138 = 0u;
                        v135 = 0u;
                        v136 = 0u;
                        objc_msgSend(v61, "candidates");
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
                        if (v90)
                        {
                          v91 = *(_QWORD *)v136;
LABEL_64:
                          v92 = 0;
                          v93 = v128 - 1;
                          v128 -= v90;
                          while (1)
                          {
                            if (*(_QWORD *)v136 != v91)
                              objc_enumerationMutation(v89);
                            v94 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v92);
                            v95 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v94, "confidence");
                            objc_msgSend(v95, "numberWithFloat:");
                            v96 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v85, "addObject:", v96);

                            objc_msgSend(v94, "text");
                            v97 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v88, "addObject:", v97);

                            if (v93 == v92)
                              break;
                            if (v90 == ++v92)
                            {
                              v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v135, v161, 16);
                              if (v90)
                                goto LABEL_64;
                              break;
                            }
                          }
                        }

                        -[CRTextFeature setCandidateProbs:](v62, "setCandidateProbs:", v85);
                        -[CRTextFeature setStringValueCandidates:](v62, "setStringValueCandidates:", v88);

                      }
                    }

                  }
                  objc_msgSend(v131, "addObject:", v62);

                }
                v132 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v139, v162, 16);
              }
              while (v132);
            }

            -[CRTextFeature setSubFeatures:](v125, "setSubFeatures:", v131);
            objc_msgSend(v120, "addObject:", v125);

          }
          v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
        }
        while (v119);
      }

      v39 = (void *)objc_opt_new();
      v98 = (void *)objc_opt_new();
      objc_msgSend(v39, "setDetectorResults:", v98);

      objc_msgSend(v39, "detectorResults");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "setStartTime:", v113);

      objc_msgSend(v39, "detectorResults");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setEndTime:", v112);

      objc_msgSend(v39, "detectorResults");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setInputOptions:", v126);

      objc_msgSend(v39, "detectorResults");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setTextFeatures:", v120);

      if (v130)
      {
        v103 = (void *)objc_opt_new();
        objc_msgSend(v39, "setRecognizerResults:", v103);

        objc_msgSend(v39, "recognizerResults");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setStartTime:", v113);

        objc_msgSend(v39, "recognizerResults");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "setEndTime:", v112);

        objc_msgSend(v39, "recognizerResults");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "setCodeMaps:", MEMORY[0x1E0C9AA60]);

        objc_msgSend(v39, "recognizerResults");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setTextFeatures:", v120);

        objc_msgSend(v39, "recognizerResults");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "setInputOptions:", v126);

        objc_msgSend(v39, "recognizerResults");
      }
      else
      {
        objc_msgSend(v39, "detectorResults");
      }
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "textFeatures");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setTextFeatures:", v110);

      if (v117)
        ((void (*)(void (**)(double), _QWORD, double))v117[2])(v117, 0, 0.700000003);

    }
  }

  return v39;
}

@end
