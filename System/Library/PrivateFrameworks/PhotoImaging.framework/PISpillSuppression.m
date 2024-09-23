@implementation PISpillSuppression

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  uint64_t v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  double v78;
  void *v79;
  uint64_t v80;
  const void **v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  int v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  NSObject *v123;
  const void **v124;
  void *specific;
  NSObject *v126;
  _BOOL4 v127;
  void *v128;
  NSObject *v129;
  const void **v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  int v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  void *v152;
  float v153;
  CGAffineTransform v154;
  CGAffineTransform v155;
  id v156;
  CGAffineTransform v157;
  CGAffineTransform v158;
  _QWORD v159[6];
  const __CFString *v160;
  void *v161;
  _QWORD v162[5];
  _QWORD v163[5];
  _QWORD v164[2];
  _QWORD v165[4];
  uint64_t v166;
  void *v167;
  uint8_t buf[4];
  const void **v169;
  __int16 v170;
  void *v171;
  uint64_t v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;

  v172 = *MEMORY[0x1E0C80C00];
  -[PISpillSuppression inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PISpillSuppression inputMatteImage](self, "inputMatteImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PISpillSuppression inputImage](self, "inputImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PISpillSuppression inputMatteImage](self, "inputMatteImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PISpillSuppression inputTargetBackgroundImage](self, "inputTargetBackgroundImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9DDC8];
        objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageWithColor:", v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[PISpillSuppression inputExtent](self, "inputExtent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "CGRectValue");
        objc_msgSend(v5, "imageByCroppingToRect:");
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "CGRectValue");
        objc_msgSend(v9, "imageByCroppingToRect:");
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v15;
        v5 = (void *)v14;
      }
      objc_msgSend(v6, "extent");
      if (CGRectIsEmpty(v173) || (objc_msgSend(v6, "extent"), CGRectIsInfinite(v174)))
      {
        NUAssertLogger_4407();
        v123 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid input matte"));
          v124 = (const void **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v169 = v124;
          _os_log_error_impl(&dword_1A6382000, v123, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v81 = (const void **)MEMORY[0x1E0D51D48];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        NUAssertLogger_4407();
        v126 = objc_claimAutoreleasedReturnValue();
        v127 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v127)
          {
            v134 = dispatch_get_specific(*v81);
            v135 = (void *)MEMORY[0x1E0CB3978];
            v136 = v134;
            objc_msgSend(v135, "callStackSymbols");
            v81 = (const void **)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "componentsJoinedByString:", CFSTR("\n"));
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v169 = (const void **)v134;
            v170 = 2114;
            v171 = v137;
            _os_log_error_impl(&dword_1A6382000, v126, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

          }
        }
        else if (v127)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "componentsJoinedByString:", CFSTR("\n"));
          v81 = (const void **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v169 = v81;
          _os_log_error_impl(&dword_1A6382000, v126, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        v132 = _NUAssertFailHandler();
      }
      else
      {
        objc_msgSend(v5, "extent");
        if (!CGRectIsEmpty(v175))
        {
          objc_msgSend(v5, "extent");
          if (!CGRectIsInfinite(v176))
          {
            objc_msgSend(v5, "extent");
            v17 = v16;
            objc_msgSend(v6, "extent");
            v19 = v17 / v18;
            objc_msgSend(v5, "extent");
            v21 = v20;
            objc_msgSend(v6, "extent");
            if (v19 <= v21 / v22)
              v23 = v21 / v22;
            else
              v23 = v19;
            v24 = 1.0 / v23;
            CGAffineTransformMakeScale(&v158, 1.0 / v23, 1.0 / v23);
            objc_msgSend(v5, "imageByApplyingTransform:", &v158);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "extent");
            objc_msgSend(v25, "imageByCroppingToRect:");
            v26 = objc_claimAutoreleasedReturnValue();

            CGAffineTransformMakeScale(&v157, 1.0 / v23, 1.0 / v23);
            v151 = v9;
            objc_msgSend(v9, "imageByApplyingTransform:", &v157);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "extent");
            objc_msgSend(v27, "imageByCroppingToRect:");
            v28 = objc_claimAutoreleasedReturnValue();

            -[PISpillSuppression inputAlphaThresholdLog10](self, "inputAlphaThresholdLog10");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (!v29)
              v29 = &unk_1E5051AE8;
            objc_msgSend(v29, "floatValue");
            v153 = __exp10f(v31);

            -[PISpillSuppression inputEpsilonLog10](self, "inputEpsilonLog10");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (!v32)
              v32 = &unk_1E5051AF8;
            objc_msgSend(v32, "floatValue");
            v35 = __exp10f(v34);

            -[PISpillSuppression inputAlphaEdge](self, "inputAlphaEdge");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (!v36)
              v36 = &unk_1E5051B18;
            objc_msgSend(v36, "floatValue");
            v142 = v38;

            -[PISpillSuppression inputEdgeRadius](self, "inputEdgeRadius");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = v5;
            v149 = v13;
            if (v39)
            {
              -[PISpillSuppression inputEdgeRadius](self, "inputEdgeRadius");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "floatValue");
              v143 = v41;

            }
            else
            {
              v143 = 5.0;
            }

            -[PISpillSuppression inputErosionRadius](self, "inputErosionRadius");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (!v42)
              v42 = &unk_1E5051A98;
            objc_msgSend(v42, "floatValue");
            v45 = v44;

            -[PISpillSuppression inputRadius](self, "inputRadius");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (!v46)
              v46 = &unk_1E5051B28;
            objc_msgSend(v46, "floatValue");
            v49 = v48;

            v166 = *MEMORY[0x1E0C9E258];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 * v45);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v167 = v50;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), v51);
            v52 = objc_claimAutoreleasedReturnValue();

            +[PISpillSuppression prepareSpillMatteKernel](PISpillSuppression, "prepareSpillMatteKernel");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "extent");
            v55 = v54;
            v57 = v56;
            v59 = v58;
            v61 = v60;
            v165[0] = v26;
            v165[1] = v28;
            v144 = (void *)v28;
            v148 = (void *)v52;
            v165[2] = v52;
            *(float *)&v54 = v153;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v165[3] = v62;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 4);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = v53;
            objc_msgSend(v53, "applyWithExtent:arguments:", v63, v55, v57, v59, v61);
            v64 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "extent");
            v66 = v65;
            v68 = v67;
            v70 = v69;
            v72 = v71;
            v145 = (void *)v26;
            v146 = (void *)v64;
            v164[0] = v64;
            v164[1] = v26;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 2);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v162[0] = CFSTR("channels");
            -[PISpillSuppression inputDebugChannels](self, "inputDebugChannels");
            v74 = objc_claimAutoreleasedReturnValue();
            v75 = (void *)v74;
            v76 = CFSTR("RGB");
            if (v74)
              v76 = (const __CFString *)v74;
            v163[0] = v76;
            v162[1] = CFSTR("radius");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 * v49);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v163[1] = v77;
            v162[2] = CFSTR("epsilon");
            *(float *)&v78 = v35;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v163[2] = v79;
            v162[3] = CFSTR("iterations");
            -[PISpillSuppression inputIterations](self, "inputIterations");
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = (const void **)v6;
            v82 = (void *)v80;
            v83 = &unk_1E50511A8;
            if (v80)
              v83 = (void *)v80;
            v163[3] = v83;
            v162[4] = CFSTR("constrainToAlpha");
            -[PISpillSuppression inputConstrainToAlpha](self, "inputConstrainToAlpha");
            v84 = objc_claimAutoreleasedReturnValue();
            v85 = (void *)v84;
            v86 = MEMORY[0x1E0C9AAB0];
            if (v84)
              v86 = v84;
            v163[4] = v86;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 5);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = 0;
            +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISpatioTemporalGuidedFilterProcessor, "applyWithExtent:inputs:arguments:error:", v73, v87, &v156, v66, v68, v70, v72);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = v156;

            if (v88)
            {
              objc_msgSend(v81, "imageByClampingToExtent");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "imageByApplyingGaussianBlurWithSigma:", v143);
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v81, "extent");
              objc_msgSend(v90, "imageByCroppingToRect:");
              v91 = (void *)objc_claimAutoreleasedReturnValue();

              v160 = CFSTR("inputBackgroundImage");
              v161 = v91;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMultiplyBlendMode"), v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23 > 1.0)
              {
                CGAffineTransformMakeScale(&v155, v23, v23);
                objc_msgSend(v93, "imageByApplyingTransform:", &v155);
                v94 = objc_claimAutoreleasedReturnValue();

                CGAffineTransformMakeScale(&v154, v23, v23);
                objc_msgSend(v88, "imageByApplyingTransform:", &v154);
                v95 = objc_claimAutoreleasedReturnValue();

                v88 = (void *)v95;
                v93 = (void *)v94;
              }
              +[PISpillSuppression applySpillMatteKernel](PISpillSuppression, "applySpillMatteKernel");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v152, "extent");
              v98 = v97;
              v100 = v99;
              v102 = v101;
              v104 = v103;
              v159[0] = v88;
              v159[1] = v152;
              v159[2] = v151;
              v159[3] = v93;
              *(float *)&v97 = v153;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v159[4] = v105;
              LODWORD(v106) = v142;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v159[5] = v107;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 6);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "applyWithExtent:arguments:", v108, v98, v100, v102, v104);
              v109 = (id)objc_claimAutoreleasedReturnValue();

              -[PISpillSuppression inputDebugSpillOnly](self, "inputDebugSpillOnly");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = objc_msgSend(v110, "BOOLValue");

              if (v111)
              {
                v112 = v88;

                v109 = v112;
              }
              v114 = v144;
              v113 = v145;

              v116 = v151;
              v115 = v152;
              v118 = v148;
              v117 = v149;
              v120 = v146;
              v119 = v147;
LABEL_45:

              v5 = v109;
              return v5;
            }
            if (*MEMORY[0x1E0D52390] == -1)
            {
LABEL_42:
              v116 = v151;
              v115 = v152;
              v118 = v148;
              v117 = v149;
              v114 = v144;
              v113 = v145;
              v120 = v146;
              v119 = v147;
              v121 = *MEMORY[0x1E0D52398];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v169 = (const void **)v150;
                _os_log_error_impl(&dword_1A6382000, v121, OS_LOG_TYPE_ERROR, "Failed to generate spill image: %{public}@", buf, 0xCu);
              }
              v109 = v152;
              goto LABEL_45;
            }
LABEL_63:
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223);
            goto LABEL_42;
          }
        }
        NUAssertLogger_4407();
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid input image"));
          v130 = (const void **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v169 = v130;
          _os_log_error_impl(&dword_1A6382000, v129, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

        }
        v81 = (const void **)MEMORY[0x1E0D51D48];
        v131 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        NUAssertLogger_4407();
        v126 = objc_claimAutoreleasedReturnValue();
        v132 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
        if (!v131)
        {
          if (v132)
          {
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "componentsJoinedByString:", CFSTR("\n"));
            v81 = (const void **)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v169 = v81;
            _os_log_error_impl(&dword_1A6382000, v126, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
LABEL_62:

          _NUAssertFailHandler();
          goto LABEL_63;
        }
      }
      if (v132)
      {
        v138 = dispatch_get_specific(*v81);
        v139 = (void *)MEMORY[0x1E0CB3978];
        v140 = v138;
        objc_msgSend(v139, "callStackSymbols");
        v81 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "componentsJoinedByString:", CFSTR("\n"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v169 = (const void **)v138;
        v170 = 2114;
        v171 = v141;
        _os_log_error_impl(&dword_1A6382000, v126, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
      goto LABEL_62;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatteImage, a3);
}

- (CIImage)inputTargetBackgroundImage
{
  return self->_inputTargetBackgroundImage;
}

- (void)setInputTargetBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputTargetBackgroundImage, a3);
}

- (CIVector)inputExtent
{
  return self->_inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_storeStrong((id *)&self->_inputExtent, a3);
}

- (NSNumber)inputRadius
{
  return self->_inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_storeStrong((id *)&self->_inputRadius, a3);
}

- (NSNumber)inputIterations
{
  return self->_inputIterations;
}

- (void)setInputIterations:(id)a3
{
  objc_storeStrong((id *)&self->_inputIterations, a3);
}

- (NSNumber)inputConstrainToAlpha
{
  return self->_inputConstrainToAlpha;
}

- (void)setInputConstrainToAlpha:(id)a3
{
  objc_storeStrong((id *)&self->_inputConstrainToAlpha, a3);
}

- (NSNumber)inputAlphaThresholdLog10
{
  return self->_inputAlphaThresholdLog10;
}

- (void)setInputAlphaThresholdLog10:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlphaThresholdLog10, a3);
}

- (NSNumber)inputEpsilonLog10
{
  return self->_inputEpsilonLog10;
}

- (void)setInputEpsilonLog10:(id)a3
{
  objc_storeStrong((id *)&self->_inputEpsilonLog10, a3);
}

- (NSNumber)inputErosionRadius
{
  return self->_inputErosionRadius;
}

- (void)setInputErosionRadius:(id)a3
{
  objc_storeStrong((id *)&self->_inputErosionRadius, a3);
}

- (NSNumber)inputAlphaEdge
{
  return self->_inputAlphaEdge;
}

- (void)setInputAlphaEdge:(id)a3
{
  objc_storeStrong((id *)&self->_inputAlphaEdge, a3);
}

- (NSNumber)inputEdgeRadius
{
  return self->_inputEdgeRadius;
}

- (void)setInputEdgeRadius:(id)a3
{
  objc_storeStrong((id *)&self->_inputEdgeRadius, a3);
}

- (NSString)inputDebugChannels
{
  return self->_inputDebugChannels;
}

- (void)setInputDebugChannels:(id)a3
{
  objc_storeStrong((id *)&self->_inputDebugChannels, a3);
}

- (NSNumber)inputDebugSpillOnly
{
  return self->_inputDebugSpillOnly;
}

- (void)setInputDebugSpillOnly:(id)a3
{
  objc_storeStrong((id *)&self->_inputDebugSpillOnly, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDebugSpillOnly, 0);
  objc_storeStrong((id *)&self->_inputDebugChannels, 0);
  objc_storeStrong((id *)&self->_inputEdgeRadius, 0);
  objc_storeStrong((id *)&self->_inputAlphaEdge, 0);
  objc_storeStrong((id *)&self->_inputErosionRadius, 0);
  objc_storeStrong((id *)&self->_inputEpsilonLog10, 0);
  objc_storeStrong((id *)&self->_inputAlphaThresholdLog10, 0);
  objc_storeStrong((id *)&self->_inputConstrainToAlpha, 0);
  objc_storeStrong((id *)&self->_inputIterations, 0);
  objc_storeStrong((id *)&self->_inputRadius, 0);
  objc_storeStrong((id *)&self->_inputExtent, 0);
  objc_storeStrong((id *)&self->_inputTargetBackgroundImage, 0);
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

+ (id)spillSuppressionKernels
{
  if (spillSuppressionKernels_onceToken != -1)
    dispatch_once(&spillSuppressionKernels_onceToken, &__block_literal_global_4544);
  return (id)spillSuppressionKernels_kernels;
}

+ (id)prepareSpillMatteKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "spillSuppressionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("prepareSpillMatte"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)applySpillMatteKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "spillSuppressionKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("applySpillMatte"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[11];
  _QWORD v48[13];

  v48[11] = *MEMORY[0x1E0C80C00];
  v47[0] = *MEMORY[0x1E0C9E1F0];
  v45 = *MEMORY[0x1E0C9DE68];
  v2 = v45;
  v46 = *MEMORY[0x1E0C9DEC8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v22;
  v47[1] = *MEMORY[0x1E0C9E258];
  v4 = *MEMORY[0x1E0C9DE48];
  v41[0] = *MEMORY[0x1E0C9DE50];
  v3 = v41[0];
  v41[1] = v4;
  v44[0] = &unk_1E5051A78;
  v44[1] = &unk_1E5051A88;
  v42 = *MEMORY[0x1E0C9DE10];
  v5 = v42;
  v43 = v2;
  v16 = *MEMORY[0x1E0C9DE90];
  v44[2] = &unk_1E5051A98;
  v44[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v41, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v21;
  v47[2] = CFSTR("inputIterations");
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1E5051AA8;
  v40[1] = &unk_1E5051AB8;
  v39[2] = v5;
  v39[3] = v2;
  v6 = *MEMORY[0x1E0C9DE88];
  v40[2] = &unk_1E5051A98;
  v40[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v20;
  v47[3] = CFSTR("inputConstrainToAlpha");
  v37[0] = v5;
  v37[1] = v2;
  v17 = *MEMORY[0x1E0C9DE78];
  v38[0] = MEMORY[0x1E0C9AAB0];
  v38[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v19;
  v47[4] = CFSTR("inputAlphaThresholdLog10");
  v35[0] = v3;
  v35[1] = v4;
  v36[0] = &unk_1E5051AC8;
  v36[1] = &unk_1E5051AD8;
  v35[2] = v5;
  v35[3] = v2;
  v7 = *MEMORY[0x1E0C9DED0];
  v36[2] = &unk_1E5051AE8;
  v36[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v18;
  v47[5] = CFSTR("inputEpsilonLog10");
  v33[0] = v3;
  v33[1] = v4;
  v34[0] = &unk_1E5051AC8;
  v34[1] = &unk_1E5051AD8;
  v33[2] = v5;
  v33[3] = v2;
  v34[2] = &unk_1E5051AF8;
  v34[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = CFSTR("inputDebugChannels");
  v48[5] = v15;
  v31[0] = CFSTR("PIAttributeAvailableModes");
  v31[1] = v5;
  v32[0] = &unk_1E5058D58;
  v32[1] = CFSTR("RGB");
  v31[2] = v2;
  v32[2] = CFSTR("PIAttributeTypeMode");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v14;
  v47[7] = CFSTR("inputErosionRadius");
  v29[0] = v3;
  v29[1] = v4;
  v30[0] = &unk_1E5051A78;
  v30[1] = &unk_1E5051A88;
  v29[2] = v5;
  v29[3] = v2;
  v30[2] = &unk_1E5051A98;
  v30[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = CFSTR("inputAlphaEdge");
  v48[7] = v8;
  v28[0] = &unk_1E5051A78;
  v28[1] = &unk_1E5051B08;
  v27[0] = v3;
  v27[1] = v4;
  v27[2] = v5;
  v27[3] = v2;
  v28[2] = &unk_1E5051B18;
  v28[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v9;
  v47[9] = CFSTR("inputEdgeRadius");
  v25[0] = v3;
  v25[1] = v4;
  v26[0] = &unk_1E5051A78;
  v26[1] = &unk_1E5051A88;
  v25[2] = v5;
  v25[3] = v2;
  v26[2] = &unk_1E5051A98;
  v26[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v10;
  v47[10] = CFSTR("inputDebugSpillOnly");
  v23[0] = v5;
  v23[1] = v2;
  v24[0] = MEMORY[0x1E0C9AAA0];
  v24[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __45__PISpillSuppression_spillSuppressionKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 prepareSpillMatte(__sample fg, __sample bg, __sample matte, float threshold)\n{\nfloat a = step(threshold, matte.r);\nvec4 pix = mix(bg, fg, a);\npix.a = max(1.0 - step(threshold, matte.r), step(1.0 - threshold, matte.r));\nreturn pix;\n}\nkernel vec4 applySpillMatte(__sample sp, __sample fg, __sample bg, __sample matte, float threshold, float edge)\n{\nfloat m0 = matte.r;\nfloat ba = smoothstep(threshold, threshold + edge, m0);\nsp = mix(bg, sp, ba);\nfloat m1 = 1.0 - m0;\nfloat fa = 1.0 - smoothstep(threshold, threshold + edge, m1);\nsp = mix(sp, fg, fa);\nfloat m2 = m1 * m0;\nsp = mix(sp, bg, m2);\nreturn sp;\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spillSuppressionKernels_kernels;
  spillSuppressionKernels_kernels = v0;

}

@end
