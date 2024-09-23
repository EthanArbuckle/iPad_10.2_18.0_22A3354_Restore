@implementation CRWrappingEvaluationResult

- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6
{
  return -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:skipTextComputation:](self, "initWithTextFeature:context:imageSize:parameters:skipTextComputation:", a3, a4, a6, 0, a5.width, a5.height);
}

- (CRWrappingEvaluationResult)initWithTextFeature:(id)a3 context:(id)a4 imageSize:(CGSize)a5 parameters:(id)a6 skipTextComputation:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  CRWrappingEvaluationResult *v17;
  CRWrappingEvaluationResult *v18;
  CRWrappingEvaluationResult *v19;
  id *p_featureInTest;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CRWrappingEvaluationResult;
  v17 = -[CRWrappingEvaluationResult init](&v28, sel_init);
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    p_featureInTest = (id *)&v17->_featureInTest;
    objc_storeStrong((id *)&v17->_featureInTest, a3);
    objc_storeWeak((id *)&v18->_context, v15);
    objc_storeStrong((id *)&v18->_parameters, a6);
    objc_msgSend(v15, "locale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_featureInTest, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "languageIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_matchingLocales = objc_msgSend(v21, "isEqualToString:", v23);

    *(_WORD *)&v19->_isHyphenatedPrefixOfWord = 256;
    if (v19->_matchingLocales)
    {
      objc_msgSend(v14, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_shouldAllowWhitespaceDelimiter = objc_msgSend(v15, "shouldAllowWhitespaceDelimiterForString:", v24);

    }
    -[CRWrappingEvaluationResult _computeGeometricProperties](v19, "_computeGeometricProperties");
    if (objc_msgSend(v15, "lineCount") && v19->_matchingLocales && !a7)
    {
      -[CRWrappingEvaluationResult _computeDDPropertiesWithContext:](v19, "_computeDDPropertiesWithContext:", v15);
      -[CRWrappingEvaluationResult _computeNoTextWithContext:](v19, "_computeNoTextWithContext:", v15);
      -[CRWrappingEvaluationResult _computeIsHyphenatedPrefixOfWord:](v19, "_computeIsHyphenatedPrefixOfWord:", v15);
      objc_msgSend(*p_featureInTest, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_f2StartOfSentence = objc_msgSend(v25, "_crIsStartOfSentence");

    }
    v19->_imageSize.width = width;
    v19->_imageSize.height = height;
    if (!a7)
    {
      objc_msgSend(v14, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRWrappingEvaluationResult _setParagraphTextWithString:context:](v19, "_setParagraphTextWithString:context:", v26, v15);

    }
  }

  return v19;
}

- (id)resultByMerging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRWrappingEvaluationResult *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CRWrappingEvaluationResult *v15;
  NSObject *v16;
  uint8_t v18[16];

  v4 = a3;
  if ((objc_msgSend(v4, "isOversegmented") & 1) != 0)
  {
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureInTest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergeWithLine:", v6);

    v7 = [CRWrappingEvaluationResult alloc];
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRWrappingEvaluationResult context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRWrappingEvaluationResult imageSize](self, "imageSize");
    v11 = v10;
    v13 = v12;
    -[CRWrappingEvaluationResult parameters](self, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:skipTextComputation:](v7, "initWithTextFeature:context:imageSize:parameters:skipTextComputation:", v8, v9, v14, 1, v11, v13);

  }
  else
  {
    CROSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_ERROR, "Unable to merge results that are not due to oversegmentation", v18, 2u);
    }

    v15 = self;
  }

  return v15;
}

- (void)_setParagraphTextWithString:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 isHyphenatedPrefixOfWord;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *paragraphText;
  id v14;

  v14 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "lineCount"))
  {
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_crEndsWithHyphen"))
      isHyphenatedPrefixOfWord = self->_isHyphenatedPrefixOfWord;
    else
      isHyphenatedPrefixOfWord = 0;

    objc_msgSend(v6, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_crStringByAppendingString:locale:mergeHyphenatedWord:allowWhitespaceDelimiter:", v14, v11, isHyphenatedPrefixOfWord, self->_shouldAllowWhitespaceDelimiter);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    paragraphText = self->_paragraphText;
    self->_paragraphText = v12;

  }
  else
  {
    v9 = (NSString *)v14;
    v10 = self->_paragraphText;
    self->_paragraphText = v9;
  }

}

- (void)_computeNoTextWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_contextNoText = objc_msgSend(v4, "_crContainsText") ^ 1;

  -[CRLineWrappable text](self->_featureInTest, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_featureInTestNoText = objc_msgSend(v5, "_crContainsText") ^ 1;

}

- (void)_computeIsHyphenatedPrefixOfWord:(id)a3
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
  id v14;

  v4 = a3;
  self->_isHyphenatedPrefixOfWord = 0;
  v14 = v4;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult _spaceSeparatedTokens:](self, "_spaceSeparatedTokens:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (unint64_t)objc_msgSend(v7, "length") >= 3 && objc_msgSend(v7, "_crEndsWithHyphen"))
  {
    -[CRLineWrappable text](self->_featureInTest, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRWrappingEvaluationResult _spaceSeparatedTokens:](self, "_spaceSeparatedTokens:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "length"))
    {
      v11 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "appendString:", v10);
      self->_isHyphenatedPrefixOfWord = objc_msgSend(v14, "isValidWordString:", v13);

    }
  }

}

- (void)_computeGeometricProperties
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  BOOL v65;
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
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  void *v152;
  float v153;
  double v154;
  void *v155;
  uint64_t v156;
  float v157;
  float v158;
  void *v159;
  float v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  int v165;
  double v166;
  void *v167;
  float v168;
  float v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  _BOOL4 v174;
  double v175;
  double v176;
  double v177;
  double v178;
  void *v179;
  void *v180;
  float v181;
  double v182;
  void *v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  void *v194;
  int v195;
  float v196;
  void *v197;
  void *v198;
  void *v199;
  unint64_t v200;
  BOOL v201;
  char v202;
  void *v203;
  void *v204;
  unint64_t v205;
  float v206;
  float v207;
  float v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  id v214;
  id v215;
  uint8_t buf[16];

  -[CRWrappingEvaluationResult context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v213 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "boundingQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denormalizedQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    -[CRWrappingEvaluationResult setFeatureInTestSize:](self, "setFeatureInTestSize:");

    -[CRWrappingEvaluationResult context](self, "context");
    v214 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v214, "lineCount");

    if (v6)
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastFeature");
      v215 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v215, "boundingQuad");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "denormalizedQuad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "size");
      -[CRWrappingEvaluationResult setLastFeatureSize:](self, "setLastFeatureSize:");
      objc_msgSend(v9, "size");
      v11 = v10;
      v13 = v12;
      -[CRWrappingEvaluationResult featureInTestSize](self, "featureInTestSize");
      v15 = v14;
      v17 = v16;
      if (v16 <= 0.0)
      {
        v19 = 0.0;
      }
      else
      {
        -[CRWrappingEvaluationResult context](self, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "averageLineHeight");
        v19 = v18 / v17;
      }
      *(float *)&v19 = v19;
      -[CRWrappingEvaluationResult setTextHeightRatio:](self, "setTextHeightRatio:", v19);
      if (v17 > 0.0)

      v21 = v15 / v11;
      if (v11 <= 0.0)
        v21 = 0.0;
      *(float *)&v21 = v21;
      -[CRWrappingEvaluationResult setTextWidthRatio:](self, "setTextWidthRatio:", v21);
      -[CRWrappingEvaluationResult context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastFeature");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "boundingQuad");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "baselineAngle");
      v26 = v25;
      if (v25 <= 3.14159265)
      {
        if (v25 > -3.14159265)
          goto LABEL_19;
        v27 = 6.28318531;
      }
      else
      {
        v27 = -6.28318531;
      }
      v26 = v26 + v27;
LABEL_19:
      -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "boundingQuad");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "baselineAngle");
      if (v30 <= 3.14159265)
      {
        if (v30 > -3.14159265)
          goto LABEL_24;
        v31 = 6.28318531;
      }
      else
      {
        v31 = -6.28318531;
      }
      v30 = v30 + v31;
LABEL_24:
      v32 = v26 - v30;
      if (v32 <= 3.14159265)
      {
        if (v32 > -3.14159265)
        {
LABEL_29:
          *(float *)&v32 = v32;
          -[CRWrappingEvaluationResult setAngleDiff:](self, "setAngleDiff:", v32);

          objc_msgSend(v215, "boundingQuad");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "boundingQuad");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRWrappingEvaluationResult context](self, "context");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lastFeature");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "boundingQuad");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "baselineAngle");
          v41 = v40;
          -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "boundingQuad");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "baselineAngle");
          v45 = (1.0 - v11 / (v11 + v15)) * v44 + v41 * (v11 / (v11 + v15));

          *(float *)&v45 = v45;
          LODWORD(v46) = LODWORD(v45);
          objc_msgSend(v34, "rotatedAroundNormalizedPoint:angle:", 0.5, 0.5, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "denormalizedQuad");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v49) = LODWORD(v45);
          objc_msgSend(v36, "rotatedAroundNormalizedPoint:angle:", 0.5, 0.5, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "denormalizedQuad");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "topLeft");
          v53 = v52;
          objc_msgSend(v48, "bottomLeft");
          -[CRWrappingEvaluationResult setVerticalSpacing:](self, "setVerticalSpacing:", v53 - v54);
          objc_msgSend(v34, "topLeft");
          v56 = v55;
          v58 = v57;
          objc_msgSend(v36, "topLeft");
          v60 = v59;
          v62 = v61;
          objc_msgSend(v34, "normalizationSize");
          if (v63 > 0.0)
          {
            v65 = v64 <= 0.0;
            v66 = v56 * v63;
            v67 = v58 * v64;
            v68 = v60 * v63;
            v69 = v62 * v64;
            if (!v65)
            {
              v60 = v68;
              v62 = v69;
              v56 = v66;
              v58 = v67;
            }
          }
          v70 = sqrt((v58 - v62) * (v58 - v62) + (v56 - v60) * (v56 - v60));
          *(float *)&v70 = v70;
          -[CRWrappingEvaluationResult setTopDistanceLeft:](self, "setTopDistanceLeft:", v70);
          objc_msgSend(v34, "topRight");
          v72 = v71;
          v74 = v73;
          objc_msgSend(v36, "topLeft");
          v76 = v75;
          v78 = v77;
          objc_msgSend(v34, "normalizationSize");
          if (v79 > 0.0 && v80 > 0.0)
          {
            v72 = v72 * v79;
            v74 = v74 * v80;
            v76 = v76 * v79;
            v78 = v78 * v80;
          }
          v81 = sqrt((v74 - v78) * (v74 - v78) + (v72 - v76) * (v72 - v76));
          *(float *)&v81 = v81;
          -[CRWrappingEvaluationResult setTopDistanceRight:](self, "setTopDistanceRight:", v81);
          objc_msgSend(v34, "topRight");
          v83 = v82;
          v85 = v84;
          -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "boundingQuad");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "bottomLeft");
          v89 = v88;
          v91 = v90;
          objc_msgSend(v34, "normalizationSize");
          if (v92 > 0.0 && v93 > 0.0)
          {
            v83 = v83 * v92;
            v85 = v85 * v93;
            v89 = v89 * v92;
            v91 = v91 * v93;
          }
          v94 = sqrt((v85 - v91) * (v85 - v91) + (v83 - v89) * (v83 - v89));
          *(float *)&v94 = v94;
          -[CRWrappingEvaluationResult setTopDistanceRightToBottomLeft:](self, "setTopDistanceRightToBottomLeft:", v94);

          objc_msgSend(v34, "bottomLeft");
          v96 = v95;
          v98 = v97;
          objc_msgSend(v36, "topLeft");
          v100 = v99;
          v102 = v101;
          objc_msgSend(v34, "normalizationSize");
          if (v103 > 0.0 && v104 > 0.0)
          {
            v96 = v96 * v103;
            v98 = v98 * v104;
            v100 = v100 * v103;
            v102 = v102 * v104;
          }
          v105 = sqrt((v98 - v102) * (v98 - v102) + (v96 - v100) * (v96 - v100));
          *(float *)&v105 = v105;
          -[CRWrappingEvaluationResult setLeftDistance:](self, "setLeftDistance:", v105);
          objc_msgSend(v34, "bottomRight");
          v107 = v106;
          v109 = v108;
          objc_msgSend(v36, "topRight");
          v111 = v110;
          v113 = v112;
          objc_msgSend(v34, "normalizationSize");
          if (v114 > 0.0 && v115 > 0.0)
          {
            v107 = v107 * v114;
            v109 = v109 * v115;
            v111 = v111 * v114;
            v113 = v113 * v115;
          }
          v116 = sqrt((v109 - v113) * (v109 - v113) + (v107 - v111) * (v107 - v111));
          *(float *)&v116 = v116;
          -[CRWrappingEvaluationResult setRightDistance:](self, "setRightDistance:", v116);
          objc_msgSend(v34, "midPoint");
          v118 = v117;
          v120 = v119;
          objc_msgSend(v36, "midPoint");
          v122 = v121;
          v124 = v123;
          objc_msgSend(v34, "normalizationSize");
          if (v125 > 0.0 && v126 > 0.0)
          {
            v118 = v118 * v125;
            v120 = v120 * v126;
            v122 = v122 * v125;
            v124 = v124 * v126;
          }
          v127 = sqrt((v120 - v124) * (v120 - v124) + (v118 - v122) * (v118 - v122));
          *(float *)&v127 = v127;
          -[CRWrappingEvaluationResult setMidDistance:](self, "setMidDistance:", v127);
          objc_msgSend(v51, "topRight");
          v129 = v128;
          objc_msgSend(v48, "topLeft");
          v131 = v129 - v130;
          *(float *)&v131 = v131;
          -[CRWrappingEvaluationResult setHorizontalOverlap:](self, "setHorizontalOverlap:", v131);
          objc_msgSend(v51, "bottomLeft");
          v133 = v132;
          objc_msgSend(v48, "topLeft");
          v135 = v133 - v134;
          *(float *)&v135 = v133 - v134;
          -[CRWrappingEvaluationResult setVerticalOverlap:](self, "setVerticalOverlap:", v135);
          objc_msgSend(v51, "topLeft");
          v137 = v136;
          objc_msgSend(v48, "topRight");
          v139 = v137 - v138;
          *(float *)&v139 = v139;
          -[CRWrappingEvaluationResult setXSpace:](self, "setXSpace:", v139);
          objc_msgSend(v48, "topRight");
          v141 = v140;
          objc_msgSend(v51, "bottomLeft");
          v143 = v141 - v142;
          *(float *)&v143 = v141 - v142;
          -[CRWrappingEvaluationResult setYSpace:](self, "setYSpace:", v143);
          if (!-[CRWrappingEvaluationResult similarHeights](self, "similarHeights")
            || !-[CRWrappingEvaluationResult similarAngles](self, "similarAngles"))
          {
            goto LABEL_93;
          }
          -[CRWrappingEvaluationResult topDistanceLeft](self, "topDistanceLeft");
          v145 = v144;
          -[CRWrappingEvaluationResult topDistanceRight](self, "topDistanceRight");
          if (v145 > v146)
          {
            -[CRWrappingEvaluationResult topDistanceRight](self, "topDistanceRight");
            v148 = v147;
            -[CRWrappingEvaluationResult topDistanceRightToBottomLeft](self, "topDistanceRightToBottomLeft");
            if (v148 < v149)
            {
              -[CRWrappingEvaluationResult topDistanceRight](self, "topDistanceRight");
              v151 = v150;
              -[CRWrappingEvaluationResult parameters](self, "parameters");
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v152, "oversegmentedDistanceHeightRatioTolerance");
              v154 = (v13 + v17) * v153 * 0.5;

              if (v154 > v151)
                -[CRWrappingEvaluationResult setIsOversegmented:](self, "setIsOversegmented:", 1);
              -[CRWrappingEvaluationResult context](self, "context");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              v156 = objc_msgSend(v155, "lineCount");

              if (v156 == 1)
              {
                if (-[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented")
                  || (-[CRWrappingEvaluationResult topDistanceRight](self, "topDistanceRight"),
                      v158 = v157,
                      -[CRWrappingEvaluationResult parameters](self, "parameters"),
                      v159 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v159, "oversegmentedDistanceHeightRatioListItemTolerance"),
                      v161 = (v13 + v17) * v160 * 0.5,
                      v159,
                      v161 > v158))
                {
                  -[CRWrappingEvaluationResult context](self, "context");
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v162, "text");
                  v163 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v163, "_crIsListItemMarker") & 1) != 0)
                  {
                    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
                    v211 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v211, "text");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    v165 = objc_msgSend(v164, "_crContainsText");

                    if (v165)
                    {
                      -[CRWrappingEvaluationResult setOversegmentedListItem:](self, "setOversegmentedListItem:", 1);
                      -[CRWrappingEvaluationResult setIsOversegmented:](self, "setIsOversegmented:", 1);
                    }
                  }
                  else
                  {

                  }
                }
              }
            }
          }
          if (-[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented"))
            goto LABEL_93;
          -[CRWrappingEvaluationResult verticalSpacing](self, "verticalSpacing");
          if (v166 < v13)
          {
            -[CRWrappingEvaluationResult context](self, "context");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v167, "isRTL"))
              -[CRWrappingEvaluationResult rightDistance](self, "rightDistance");
            else
              -[CRWrappingEvaluationResult leftDistance](self, "leftDistance");
            v169 = v168;

            -[CRWrappingEvaluationResult context](self, "context");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v170, "isRTL"))
            {
              objc_msgSend(v48, "topRight");
              v172 = v171;
              objc_msgSend(v51, "topLeft");
              v174 = v172 > v173;
            }
            else
            {
              objc_msgSend(v48, "topLeft");
              v176 = v175;
              objc_msgSend(v51, "topRight");
              v174 = v176 < v177;
            }
            v178 = v169;

            if (v13 > v178)
              goto LABEL_80;
            -[CRWrappingEvaluationResult context](self, "context");
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v179, "lineCount") != 1)
              v174 = 0;

            if (!v174)
              goto LABEL_81;
            -[CRWrappingEvaluationResult parameters](self, "parameters");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v180, "newParagraphIndentDistanceRatioTolerance");
            v182 = v13 * v181;

            if (fabs(v178) >= v182)
              goto LABEL_81;
            -[CRWrappingEvaluationResult context](self, "context");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v183, "isRTL"))
            {
              objc_msgSend(v48, "topLeft");
              v185 = v184;
              objc_msgSend(v51, "topLeft");
              v187 = v186;

              if (v185 > v187)
                goto LABEL_80;
            }
            else
            {
              objc_msgSend(v48, "topRight");
              v189 = v188;
              objc_msgSend(v51, "topRight");
              v191 = v190;

              if (v189 < v191)
              {
LABEL_80:
                -[CRWrappingEvaluationResult setLeadingAligned:](self, "setLeadingAligned:", 1);
                goto LABEL_81;
              }
            }
            -[CRWrappingEvaluationResult context](self, "context");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "lastFeature");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v210, "text");
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v192, "_crStartsWithListItemIndicator"))
            {

              goto LABEL_80;
            }
            -[CRWrappingEvaluationResult context](self, "context");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "lastFeature");
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "text");
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            v195 = objc_msgSend(v194, "_crStartsWithDigit");

            if (v195)
              goto LABEL_80;
          }
LABEL_81:
          -[CRWrappingEvaluationResult midDistance](self, "midDistance");
          if (v13 + v17 > v196)
            -[CRWrappingEvaluationResult setCenterAligned:](self, "setCenterAligned:", 1);
          -[CRWrappingEvaluationResult context](self, "context");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "lastFeature");
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "text");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v200 = -[CRWrappingEvaluationResult _tokenCountForString:](self, "_tokenCountForString:", v199);

          if (!-[CRWrappingEvaluationResult centerAligned](self, "centerAligned"))
          {
            v201 = -[CRWrappingEvaluationResult leadingAligned](self, "leadingAligned");
            v202 = v200 < 3 || v201;
            if ((v202 & 1) == 0)
            {
              -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v203, "text");
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              v205 = objc_msgSend(v204, "length");

              if (v205 >= 3)
              {
                -[CRWrappingEvaluationResult ySpace](self, "ySpace");
                if (v17 < v206)
                {
                  -[CRWrappingEvaluationResult xSpace](self, "xSpace");
                  if (v207 > 0.0)
                  {
                    -[CRWrappingEvaluationResult xSpace](self, "xSpace");
                    if (v11 * 0.25 > v208)
                      -[CRWrappingEvaluationResult setContinuesToNewColumn:](self, "setContinuesToNewColumn:", 1);
                  }
                }
              }
            }
          }
LABEL_93:

          return;
        }
        v33 = 6.28318531;
      }
      else
      {
        v33 = -6.28318531;
      }
      v32 = v32 + v33;
      goto LABEL_29;
    }
  }
  else
  {
    CROSLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
    }

  }
}

- (void)_computeDDPropertiesWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  NSUInteger v29;
  NSRange v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id obj;
  NSUInteger range1;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  NSRange v50;
  NSRange v51;

  v49 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(v35, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_crDDFriendlyTextWithIndexMapping:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRLineWrappable text](self->_featureInTest, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_crDDFriendlyTextWithIndexMapping:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v6;
  objc_msgSend(v38, "stringByAppendingFormat:", CFSTR("\n%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v7;
  v39 = objc_msgSend(v38, "length");
  range1 = objc_msgSend(v6, "length");
  if (-[CRWrappingEvaluationResult matchingLocales](self, "matchingLocales"))
  {
    objc_msgSend(v35, "locale");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v33 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0D1CE78], "_crConfigForLocale:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:range:configuration:", v7, 0, objc_msgSend(v7, "length"), v37);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult setSentencePuncStringToCheck:](self, "setSentencePuncStringToCheck:", v38);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v34;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v9)
  {
    v10 = v39 + 1;
    v43 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v43)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v12, "category"))
        {
          v13 = objc_msgSend(v12, "urlificationRange");
          v15 = v14;
          -[CRWrappingEvaluationResult sentencePuncStringToCheck](self, "sentencePuncStringToCheck");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v13 < (unint64_t)objc_msgSend(v16, "length");

          if (v17)
          {
            if (v13 <= 2)
              v13 = 2;
            -[CRWrappingEvaluationResult sentencePuncStringToCheck](self, "sentencePuncStringToCheck");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v13 - 2;
            v20 = v15 + 2;
            if (objc_msgSend(v18, "length") - v19 < (unint64_t)(v15 + 2))
            {
              -[CRWrappingEvaluationResult sentencePuncStringToCheck](self, "sentencePuncStringToCheck");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "length");

              v20 = v22 - v19;
            }

            objc_msgSend(v40, "substringWithRange:", v19, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "_crContainsCharactersInSet:", v24);

            if (v25)
            {
              -[CRWrappingEvaluationResult sentencePuncStringToCheck](self, "sentencePuncStringToCheck");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(&stru_1E98DC948, "stringByPaddingToLength:withString:startingAtIndex:", v20, CFSTR("-"), 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", v19, v20, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[CRWrappingEvaluationResult setSentencePuncStringToCheck:](self, "setSentencePuncStringToCheck:", v28);

            }
          }
          v51.location = objc_msgSend(v12, "urlificationRange");
          v51.length = v29;
          v50.location = v39 + 1;
          v50.length = range1;
          v30 = NSIntersectionRange(v50, v51);
          if (v30.length)
          {
            if (objc_msgSend(v12, "urlificationRange") < v10)
              -[CRWrappingEvaluationResult setMultilineDD:](self, "setMultilineDD:", 1);
            if (v30.location == v10)
            {
              -[CRWrappingEvaluationResult setF2BeginsWithDD:](self, "setF2BeginsWithDD:", 1);
              if (v30.length >= range1 - 1)
                -[CRWrappingEvaluationResult setF2FullyDD:](self, "setF2FullyDD:", 1);
            }
          }
          else
          {
            v31 = objc_msgSend(v12, "urlificationRange");
            objc_msgSend(v12, "urlificationRange");
            if (v32 + v31 == v39)
              -[CRWrappingEvaluationResult setF1EndsWithDD:](self, "setF1EndsWithDD:", 1);
          }
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

}

- (id)description
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_matchingLocales);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult context](self, "context");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "locale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CRWrappingEvaluationResult textContentWrappingScore](self, "textContentWrappingScore");
  v21 = -[CRWrappingEvaluationResult caseWrappingScoreUsingCustomConfiguration:](self, "caseWrappingScoreUsingCustomConfiguration:", 1);
  v19 = -[CRWrappingEvaluationResult wordCountWrappingScore](self, "wordCountWrappingScore");
  v18 = -[CRWrappingEvaluationResult punctuationWrappingScoreUsingCustomConfiguration:](self, "punctuationWrappingScoreUsingCustomConfiguration:", 1);
  -[CRWrappingEvaluationResult textHeightRatio](self, "textHeightRatio");
  v4 = v3;
  -[CRWrappingEvaluationResult textWidthRatio](self, "textWidthRatio");
  v6 = v5;
  -[CRWrappingEvaluationResult angleDiff](self, "angleDiff");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult leadingAligned](self, "leadingAligned"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult centerAligned](self, "centerAligned"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult continuesToNewColumn](self, "continuesToNewColumn"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult paragraphText](self, "paragraphText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult lmScoreSet](self, "lmScoreSet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult cachedLMScore](self, "cachedLMScore");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRWrappingEvaluationResult eosLMScoreSet](self, "eosLMScoreSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult cachedEOSLMScore](self, "cachedEOSLMScore");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("{\nmatchingLocales:\t%@ -(%@/%@)\ntextContentWrappingScore/caseScore/wcScore/puncScore:\t%ld/%ld/%ld/%ld\ntextHeightRatio/textWidthRatio/angleDiff:\t%f/%f/%f\noverSegmented/leadingAligned/centerAligned/newColumn:\t%@/%@/%@/%@\ntext:%@\nlmScoreSet/lmScore/eosScoreSet/eosLMScore:%@/%.4f/%@/%.4f\n}"), v30, v29, v27, v22, v21, v19, v18, v4, v6, v8, v25, v23, v20, v17, v16, v15,
    v10,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)textContentWrappingScore
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  if (-[CRWrappingEvaluationResult multilineDD](self, "multilineDD"))
    return -10;
  if (-[CRWrappingEvaluationResult oversegmentedListItem](self, "oversegmentedListItem")
    || -[CRWrappingEvaluationResult isHyphenatedPrefixOfWord](self, "isHyphenatedPrefixOfWord"))
  {
    return 10;
  }
  if (!-[CRWrappingEvaluationResult contextNoText](self, "contextNoText")
    && !-[CRWrappingEvaluationResult featureInTestNoText](self, "featureInTestNoText"))
  {
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_crIsProgrammingStatement"))
    {

    }
    else
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastFeature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_crIsProgrammingStatement");

      if ((v10 & 1) == 0 && !-[CRWrappingEvaluationResult f2StartOfSentence](self, "f2StartOfSentence"))
      {
        if (!-[CRWrappingEvaluationResult f1EndsWithDD](self, "f1EndsWithDD")
          || !-[CRWrappingEvaluationResult f2BeginsWithDD](self, "f2BeginsWithDD"))
        {
          if (-[CRWrappingEvaluationResult f2FullyDD](self, "f2FullyDD"))
            return -2;
          -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v12, "length") <= 1)
          {

          }
          else
          {
            -[CRWrappingEvaluationResult context](self, "context");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lastFeature");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "text");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");

            if (v16 > 1)
              return 0;
          }
        }
        return -6;
      }
    }
    return -10;
  }
  v3 = -2;
  if (-[CRWrappingEvaluationResult contextNoText](self, "contextNoText")
    && -[CRWrappingEvaluationResult featureInTestNoText](self, "featureInTestNoText"))
  {
    return -10;
  }
  return v3;
}

- (int64_t)caseWrappingScoreUsingCustomConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
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
  int v19;
  void *v20;
  int64_t v21;
  NSObject *v22;
  int v24;
  void *v25;
  void *v26;
  char v27;
  uint8_t v28[16];

  v3 = a3;
  -[CRWrappingEvaluationResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[CRWrappingEvaluationResult multilineDD](self, "multilineDD"))
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "shouldConsiderLetterCase");

      if ((v7 & 1) != 0)
      {
        -[CRWrappingEvaluationResult context](self, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastFeature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRWrappingEvaluationResult _spaceSeparatedTokens:](self, "_spaceSeparatedTokens:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRWrappingEvaluationResult _spaceSeparatedTokens:](self, "_spaceSeparatedTokens:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[CRWrappingEvaluationResult f1EndsWithDD](self, "f1EndsWithDD")
          || -[CRWrappingEvaluationResult f2BeginsWithDD](self, "f2BeginsWithDD")
          || (-[CRWrappingEvaluationResult featureInTest](self, "featureInTest"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v17, "text"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "_crStartsWithLowercase"),
              v18,
              v17,
              !v19))
        {
          if (objc_msgSend(v12, "_crIsAllCaps")
            && objc_msgSend(v16, "_crIsAllCaps")
            && !-[CRWrappingEvaluationResult f1EndsWithDD](self, "f1EndsWithDD")
            && !-[CRWrappingEvaluationResult f2BeginsWithDD](self, "f2BeginsWithDD"))
          {
            v21 = 6;
          }
          else
          {
            v24 = objc_msgSend(v12, "_crIsAllCaps");
            if (v24 != objc_msgSend(v16, "_crIsAllCaps")
              && objc_msgSend(v12, "_crContainsText")
              && objc_msgSend(v16, "_crContainsText")
              && (unint64_t)objc_msgSend(v12, "length") >= 2
              && (unint64_t)objc_msgSend(v16, "length") > 1)
            {
              v21 = -6;
            }
            else
            {
              if (!-[CRWrappingEvaluationResult contextNoText](self, "contextNoText")
                && !-[CRWrappingEvaluationResult featureInTestNoText](self, "featureInTestNoText"))
              {
                -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "text");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v26, "_crStartsWithUppercase") & 1) != 0)
                {
                  v27 = objc_msgSend(v16, "isEqualToString:", CFSTR("I"));

                  if ((v27 & 1) == 0 && (objc_msgSend(v12, "_crStartsWithUppercase") & 1) == 0)
                  {
                    if (-[CRWrappingEvaluationResult f2BeginsWithDD](self, "f2BeginsWithDD"))
                      v21 = 0;
                    else
                      v21 = -2;
                    goto LABEL_34;
                  }
                }
                else
                {

                }
              }
              v21 = 0;
            }
          }
        }
        else if (v3)
        {
          -[CRWrappingEvaluationResult parameters](self, "parameters");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "caseWrappingScoreWithNoCapitalization");

        }
        else
        {
          v21 = 10;
        }
LABEL_34:

        return v21;
      }
    }
  }
  else
  {
    CROSLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1D4FB8000, v22, OS_LOG_TYPE_FAULT, "Unexpected nil context", v28, 2u);
    }

  }
  return 0;
}

- (int64_t)wordCountWrappingScore
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint8_t v20[16];

  -[CRWrappingEvaluationResult context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    CROSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_FAULT, "Unexpected nil context", v20, 2u);
    }

    return 0;
  }
  -[CRWrappingEvaluationResult context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesWordTokens");

  if (!v5)
    return 0;
  -[CRWrappingEvaluationResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRWrappingEvaluationResult _tokenCountForString:](self, "_tokenCountForString:", v8);

  -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRWrappingEvaluationResult _tokenCountForString:](self, "_tokenCountForString:", v11);

  if (v9 != 1 || v12 < 3)
  {
    if (v12 == 1)
    {
      -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "text");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "_crEndsWithEOS"))
      {

        return 6;
      }
      -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "_crEndsWithClosingPunctuation");

      if (v19)
        return 6;
    }
    return 0;
  }
  if (-[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented"))
    return 0;
  else
    return -2;
}

- (int64_t)punctuationWrappingScoreUsingCustomConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[16];

  v3 = a3;
  -[CRWrappingEvaluationResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    CROSLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v12, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
    }

    return 0;
  }
  -[CRWrappingEvaluationResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "_crEndsWithEOS"))
  {

LABEL_10:
    -[CRWrappingEvaluationResult context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastFeature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_crEndsWithMOS");

    if (v17)
    {
      if (!v3)
        return 10;
      -[CRWrappingEvaluationResult parameters](self, "parameters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "punctuationWrappingScoreWithEndingMOS");
      goto LABEL_13;
    }
    -[CRWrappingEvaluationResult context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastFeature");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "text");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v53, "_crStartsWithDigit");
    v22 = v21;
    if (v21)
    {
      -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "text");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v51, "_crStartsWithDigit") & 1) != 0)
      {

        return -6;
      }
    }
    -[CRWrappingEvaluationResult context](self, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastFeature");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "_crEndsWithDigit"))
    {
      -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "text");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "_crEndsWithDigit");

      if ((v22 & 1) != 0)
      {

      }
      if ((v28 & 1) != 0)
        return -6;
    }
    else
    {

      if ((v22 & 1) != 0)
      {

      }
    }
    if (-[CRWrappingEvaluationResult textContentWrappingScore](self, "textContentWrappingScore") < 0
      || (-[CRWrappingEvaluationResult sentencePuncStringToCheck](self, "sentencePuncStringToCheck"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          -[CRWrappingEvaluationResult context](self, "context"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v29, "_crIsSentencePunctuatedIncludingWhitespace:", objc_msgSend(v30, "usesWordTokens")),
          v30,
          v29,
          !v31))
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastFeature");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "text");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "_crEndsWithClosingPunctuation");

      if (v39)
        return -2;
      else
        return 0;
    }
    -[CRWrappingEvaluationResult context](self, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastFeature");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "text");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "_crEndsWithClosingPunctuation");

    if ((v35 & 1) != 0)
      return 2;
    if (!v3)
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastFeature");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "locale");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "languageIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v45))
      {
        v13 = 2;
      }
      else
      {
        -[CRWrappingEvaluationResult context](self, "context");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastFeature");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "locale");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "languageIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v49);

        if (v50)
          v13 = 2;
        else
          v13 = 10;
      }

      goto LABEL_14;
    }
    -[CRWrappingEvaluationResult parameters](self, "parameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "punctuationWrappingScoreWithNoClosingPunctuation");
LABEL_13:
    v13 = v19;
LABEL_14:

    return v13;
  }
  v9 = -[CRWrappingEvaluationResult oversegmentedListItem](self, "oversegmentedListItem");

  if (v9)
    goto LABEL_10;
  -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "_crStartsWithUppercase"))
  {

    return -10;
  }
  -[CRWrappingEvaluationResult context](self, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "shouldConsiderLetterCase");

  if ((v41 & 1) == 0)
    return -10;
  return -2;
}

- (BOOL)similarHeights
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  float v11;

  -[CRWrappingEvaluationResult parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightSimilarityRatio");
  v5 = v4;

  -[CRWrappingEvaluationResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") <= 2)
  {

  }
  else
  {
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 > 2)
      goto LABEL_6;
  }
  v5 = v5 * 1.5;
LABEL_6:
  -[CRWrappingEvaluationResult textHeightRatio](self, "textHeightRatio");
  return fabsf(v11 + -1.0) < v5;
}

- (BOOL)similarAngles
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  float v11;

  -[CRWrappingEvaluationResult parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "angleSimilarityThreshold");
  v5 = v4;

  -[CRWrappingEvaluationResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") <= 2)
  {

  }
  else
  {
    -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 > 2)
      goto LABEL_6;
  }
  v5 = v5 * 3.0;
LABEL_6:
  -[CRWrappingEvaluationResult angleDiff](self, "angleDiff");
  return fabsf(v11) < v5;
}

- (double)widthGrowth
{
  float v2;

  -[CRWrappingEvaluationResult textWidthRatio](self, "textWidthRatio");
  return (float)(v2 + -1.0);
}

- (BOOL)excessiveVerticalDistance
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  double v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  double v12;
  BOOL v13;
  double v15;
  void *v16;
  float v17;
  uint8_t v18[16];

  -[CRWrappingEvaluationResult context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    CROSLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D4FB8000, v4, OS_LOG_TYPE_FAULT, "Unexpected nil context", v18, 2u);
    }
    goto LABEL_8;
  }
  -[CRWrappingEvaluationResult context](self, "context");
  v4 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSObject lineCount](v4, "lineCount") < 2)
  {
LABEL_8:

    return 0;
  }
  v5 = -[CRWrappingEvaluationResult contributesToVerticalSpacing](self, "contributesToVerticalSpacing");

  if (!v5)
    return 0;
  -[CRWrappingEvaluationResult verticalSpacingToHeightRatio](self, "verticalSpacingToHeightRatio");
  v7 = v6;
  -[CRWrappingEvaluationResult parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "smallestVerticalDistanceHeightRatio");
  if (v7 > v9)
  {
    -[CRWrappingEvaluationResult verticalSpacingToHeightRatio](self, "verticalSpacingToHeightRatio");
    v12 = v15;
  }
  else
  {
    -[CRWrappingEvaluationResult parameters](self, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "smallestVerticalDistanceHeightRatio");
    v12 = v11;

  }
  -[CRWrappingEvaluationResult parameters](self, "parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maximumVerticalDistanceGrowthRatio");
  v13 = v12 > v17;

  return v13;
}

- (BOOL)contributesToVerticalSpacing
{
  if (-[CRWrappingEvaluationResult continuesToNewColumn](self, "continuesToNewColumn"))
    return 0;
  else
    return !-[CRWrappingEvaluationResult isOversegmented](self, "isOversegmented");
}

- (double)verticalSpacingToHeightRatio
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  float v19;
  double v20;

  -[CRWrappingEvaluationResult context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lineCount");

  -[CRWrappingEvaluationResult featureInTestSize](self, "featureInTestSize");
  v6 = v5;
  -[CRWrappingEvaluationResult context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageLineHeight");
  v9 = v8;

  -[CRWrappingEvaluationResult context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "averageVerticalSpacing");
  v12 = v11;
  -[CRWrappingEvaluationResult parameters](self, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "smallestVerticalDistanceHeightRatio");
  v14 = (1.0 - 1.0 / (double)(unint64_t)(v4 + 1)) * v9 + v6 * (1.0 / (double)(unint64_t)(v4 + 1));
  if (v12 <= v14 * v15)
  {
    -[CRWrappingEvaluationResult parameters](self, "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "smallestVerticalDistanceHeightRatio");
    v18 = v14 * v19;
  }
  else
  {
    -[CRWrappingEvaluationResult context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "averageVerticalSpacing");
    v18 = v17;
  }

  -[CRWrappingEvaluationResult verticalSpacing](self, "verticalSpacing");
  return v20 / v18;
}

- (int64_t)tokenCountDiff
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRWrappingEvaluationResult _tokenCountForString:](self, "_tokenCountForString:", v4);
  -[CRWrappingEvaluationResult context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 - -[CRWrappingEvaluationResult _tokenCountForString:](self, "_tokenCountForString:", v8);

  return v9;
}

- (int64_t)textBasedEvaluation
{
  uint64_t v3;
  uint64_t v4;

  v3 = consolidateWrapScores(-[CRWrappingEvaluationResult textContentWrappingScore](self, "textContentWrappingScore"), -[CRWrappingEvaluationResult caseWrappingScoreUsingCustomConfiguration:](self, "caseWrappingScoreUsingCustomConfiguration:", 1));
  v4 = consolidateWrapScores(v3, -[CRWrappingEvaluationResult wordCountWrappingScore](self, "wordCountWrappingScore"));
  return consolidateWrapScores(v4, -[CRWrappingEvaluationResult punctuationWrappingScoreUsingCustomConfiguration:](self, "punctuationWrappingScoreUsingCustomConfiguration:", 1));
}

- (double)lmScore
{
  double result;

  if (!-[CRWrappingEvaluationResult lmScoreSet](self, "lmScoreSet"))
    -[CRWrappingEvaluationResult _computeLMScoreComputingEOS:](self, "_computeLMScoreComputingEOS:", 0);
  -[CRWrappingEvaluationResult cachedLMScore](self, "cachedLMScore");
  return result;
}

- (double)eosLMScore
{
  double result;

  if (!-[CRWrappingEvaluationResult eosLMScoreSet](self, "eosLMScoreSet"))
    -[CRWrappingEvaluationResult _computeLMScoreComputingEOS:](self, "_computeLMScoreComputingEOS:", 1);
  -[CRWrappingEvaluationResult cachedEOSLMScore](self, "cachedEOSLMScore");
  return result;
}

- (void)_computeLMScoreComputingEOS:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *__p[4];

  v3 = a3;
  -[CRWrappingEvaluationResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      if (-[CRWrappingEvaluationResult eosLMScoreSet](self, "eosLMScoreSet"))
        return;
    }
    else if (-[CRWrappingEvaluationResult lmScoreSet](self, "lmScoreSet"))
    {
      return;
    }
    -[CRWrappingEvaluationResult context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "usesWordTokens");

    if (v8)
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v3)
      {
        objc_msgSend(v9, "wordLMScoreByAddingToken:", 2);
        self->_cachedEOSLMScore = v11;

        -[CRWrappingEvaluationResult setEosLMScoreSet:](self, "setEosLMScoreSet:", 1);
      }
      else
      {
        -[CRWrappingEvaluationResult featureTokens](self, "featureTokens");
        objc_msgSend(v10, "wordLMScoreByAddingTokens:", __p);
        self->_cachedLMScore = v12;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        -[CRWrappingEvaluationResult setLmScoreSet:](self, "setLmScoreSet:", 1);
      }
    }
    else
    {
      -[CRWrappingEvaluationResult _computeCharLMScores](self, "_computeCharLMScores");
    }
  }
  else
  {
    CROSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_1D4FB8000, v6, OS_LOG_TYPE_FAULT, "Unexpected nil context", (uint8_t *)__p, 2u);
    }

  }
}

- (void)_computeCharLMScores
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v7 = 0.0;
  -[CRWrappingEvaluationResult context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "charLMScoreByAddingString:eosScore:", v5, &v7);
  self->_cachedLMScore = v6;

  self->_cachedEOSLMScore = v7;
  -[CRWrappingEvaluationResult setLmScoreSet:](self, "setLmScoreSet:", 1);
  -[CRWrappingEvaluationResult setEosLMScoreSet:](self, "setEosLMScoreSet:", 1);
}

- (vector<unsigned)featureTokens
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *__p;
  void *v13;
  uint64_t v14;
  uint8_t buf[16];

  -[CRWrappingEvaluationResult context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!-[CRWrappingEvaluationResult featureTokensSet](self, "featureTokensSet"))
    {
      -[CRWrappingEvaluationResult context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "usesWordTokens");

      if (v6)
      {
        -[CRWrappingEvaluationResult context](self, "context");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRWrappingEvaluationResult featureInTest](self, "featureInTest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "text");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v7, "tokenizeStringIntoWords:", v9);
        }
        else
        {
          __p = 0;
          v13 = 0;
          v14 = 0;
        }
        -[CRWrappingEvaluationResult setCachedFeatureTokens:](self, "setCachedFeatureTokens:", &__p);
        if (__p)
        {
          v13 = __p;
          operator delete(__p);
        }

        -[CRWrappingEvaluationResult setFeatureTokensSet:](self, "setFeatureTokensSet:", 1);
      }
    }
  }
  else
  {
    CROSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unexpected nil context", buf, 2u);
    }

  }
  return -[CRWrappingEvaluationResult cachedFeatureTokens](self, "cachedFeatureTokens");
}

- (int64_t)_tokenCountForString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  -[CRWrappingEvaluationResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesWordTokens");

  if (v6)
  {
    -[CRWrappingEvaluationResult _spaceSeparatedTokens:](self, "_spaceSeparatedTokens:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = objc_msgSend(v4, "length");
  }

  return v8;
}

- (id)_spaceSeparatedTokens:(id)a3
{
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)matchingLocales
{
  return self->_matchingLocales;
}

- (void)setMatchingLocales:(BOOL)a3
{
  self->_matchingLocales = a3;
}

- (CRLineWrappable)featureInTest
{
  return (CRLineWrappable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFeatureInTest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)paragraphText
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setParagraphText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

- (void)setVerticalSpacing:(double)a3
{
  self->_verticalSpacing = a3;
}

- (float)textHeightRatio
{
  return self->_textHeightRatio;
}

- (void)setTextHeightRatio:(float)a3
{
  self->_textHeightRatio = a3;
}

- (float)textWidthRatio
{
  return self->_textWidthRatio;
}

- (void)setTextWidthRatio:(float)a3
{
  self->_textWidthRatio = a3;
}

- (float)angleDiff
{
  return self->_angleDiff;
}

- (void)setAngleDiff:(float)a3
{
  self->_angleDiff = a3;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isOversegmented
{
  return self->_isOversegmented;
}

- (void)setIsOversegmented:(BOOL)a3
{
  self->_isOversegmented = a3;
}

- (BOOL)leadingAligned
{
  return self->_leadingAligned;
}

- (void)setLeadingAligned:(BOOL)a3
{
  self->_leadingAligned = a3;
}

- (BOOL)centerAligned
{
  return self->_centerAligned;
}

- (void)setCenterAligned:(BOOL)a3
{
  self->_centerAligned = a3;
}

- (BOOL)continuesToNewColumn
{
  return self->_continuesToNewColumn;
}

- (void)setContinuesToNewColumn:(BOOL)a3
{
  self->_continuesToNewColumn = a3;
}

- (CGSize)lastFeatureSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_lastFeatureSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLastFeatureSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_lastFeatureSize, &v3, 16, 1, 0);
}

- (CGSize)featureInTestSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_featureInTestSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFeatureInTestSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_featureInTestSize, &v3, 16, 1, 0);
}

- (float)topDistanceLeft
{
  return self->_topDistanceLeft;
}

- (void)setTopDistanceLeft:(float)a3
{
  self->_topDistanceLeft = a3;
}

- (float)topDistanceRight
{
  return self->_topDistanceRight;
}

- (void)setTopDistanceRight:(float)a3
{
  self->_topDistanceRight = a3;
}

- (float)topDistanceRightToBottomLeft
{
  return self->_topDistanceRightToBottomLeft;
}

- (void)setTopDistanceRightToBottomLeft:(float)a3
{
  self->_topDistanceRightToBottomLeft = a3;
}

- (float)leftDistance
{
  return self->_leftDistance;
}

- (void)setLeftDistance:(float)a3
{
  self->_leftDistance = a3;
}

- (float)rightDistance
{
  return self->_rightDistance;
}

- (void)setRightDistance:(float)a3
{
  self->_rightDistance = a3;
}

- (float)midDistance
{
  return self->_midDistance;
}

- (void)setMidDistance:(float)a3
{
  self->_midDistance = a3;
}

- (float)newParagraphIndentDistanceRatio
{
  return self->_newParagraphIndentDistanceRatio;
}

- (void)setNewParagraphIndentDistanceRatio:(float)a3
{
  self->_newParagraphIndentDistanceRatio = a3;
}

- (float)horizontalOverlap
{
  return self->_horizontalOverlap;
}

- (void)setHorizontalOverlap:(float)a3
{
  self->_horizontalOverlap = a3;
}

- (float)verticalOverlap
{
  return self->_verticalOverlap;
}

- (void)setVerticalOverlap:(float)a3
{
  self->_verticalOverlap = a3;
}

- (float)xSpace
{
  return self->_xSpace;
}

- (void)setXSpace:(float)a3
{
  self->_xSpace = a3;
}

- (float)ySpace
{
  return self->_ySpace;
}

- (void)setYSpace:(float)a3
{
  self->_ySpace = a3;
}

- (BOOL)midSentencePunctuated
{
  return self->_midSentencePunctuated;
}

- (void)setMidSentencePunctuated:(BOOL)a3
{
  self->_midSentencePunctuated = a3;
}

- (BOOL)bothBeginWithDigits
{
  return self->_bothBeginWithDigits;
}

- (void)setBothBeginWithDigits:(BOOL)a3
{
  self->_bothBeginWithDigits = a3;
}

- (BOOL)f2StartOfSentence
{
  return self->_f2StartOfSentence;
}

- (void)setF2StartOfSentence:(BOOL)a3
{
  self->_f2StartOfSentence = a3;
}

- (BOOL)oversegmentedListItem
{
  return self->_oversegmentedListItem;
}

- (void)setOversegmentedListItem:(BOOL)a3
{
  self->_oversegmentedListItem = a3;
}

- (BOOL)isHyphenatedPrefixOfWord
{
  return self->_isHyphenatedPrefixOfWord;
}

- (BOOL)shouldAllowWhitespaceDelimiter
{
  return self->_shouldAllowWhitespaceDelimiter;
}

- (BOOL)f2BeginsWithDD
{
  return self->_f2BeginsWithDD;
}

- (void)setF2BeginsWithDD:(BOOL)a3
{
  self->_f2BeginsWithDD = a3;
}

- (BOOL)f1EndsWithDD
{
  return self->_f1EndsWithDD;
}

- (void)setF1EndsWithDD:(BOOL)a3
{
  self->_f1EndsWithDD = a3;
}

- (BOOL)f2FullyDD
{
  return self->_f2FullyDD;
}

- (void)setF2FullyDD:(BOOL)a3
{
  self->_f2FullyDD = a3;
}

- (BOOL)multilineDD
{
  return self->_multilineDD;
}

- (void)setMultilineDD:(BOOL)a3
{
  self->_multilineDD = a3;
}

- (CRLineWrappingParameters)parameters
{
  return (CRLineWrappingParameters *)objc_getProperty(self, a2, 112, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CRLineWrappingContext)context
{
  return (CRLineWrappingContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (NSString)sentencePuncStringToCheck
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSentencePuncStringToCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)lmScoreSet
{
  return self->_lmScoreSet;
}

- (void)setLmScoreSet:(BOOL)a3
{
  self->_lmScoreSet = a3;
}

- (BOOL)eosLMScoreSet
{
  return self->_eosLMScoreSet;
}

- (void)setEosLMScoreSet:(BOOL)a3
{
  self->_eosLMScoreSet = a3;
}

- (double)cachedLMScore
{
  return self->_cachedLMScore;
}

- (void)setCachedLMScore:(double)a3
{
  self->_cachedLMScore = a3;
}

- (double)cachedEOSLMScore
{
  return self->_cachedEOSLMScore;
}

- (void)setCachedEOSLMScore:(double)a3
{
  self->_cachedEOSLMScore = a3;
}

- (BOOL)featureTokensSet
{
  return self->_featureTokensSet;
}

- (void)setFeatureTokensSet:(BOOL)a3
{
  self->_featureTokensSet = a3;
}

- (vector<unsigned)cachedFeatureTokens
{
  vector<unsigned int, std::allocator<unsigned int>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_cachedFeatureTokens, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__0);
  return result;
}

- (void)setCachedFeatureTokens:(vector<unsigned)int
{
  objc_copyCppObjectAtomic(&self->_cachedFeatureTokens, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__0);
}

- (BOOL)contextNoText
{
  return self->_contextNoText;
}

- (void)setContextNoText:(BOOL)a3
{
  self->_contextNoText = a3;
}

- (BOOL)featureInTestNoText
{
  return self->_featureInTestNoText;
}

- (void)setFeatureInTestNoText:(BOOL)a3
{
  self->_featureInTestNoText = a3;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  begin = self->_cachedFeatureTokens.__begin_;
  if (begin)
  {
    self->_cachedFeatureTokens.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sentencePuncStringToCheck, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_featureInTest, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  return self;
}

@end
