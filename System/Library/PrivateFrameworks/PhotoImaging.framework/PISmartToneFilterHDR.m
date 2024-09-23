@implementation PISmartToneFilterHDR

+ (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[7];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[6];
  uint64_t v41;
  _QWORD v42[4];
  _QWORD v43[8];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v43[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF40];
  v42[0] = *MEMORY[0x1E0C9DF38];
  v42[1] = v2;
  v3 = *MEMORY[0x1E0C9DEF8];
  v42[2] = *MEMORY[0x1E0C9DF30];
  v42[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v21;
  v43[1] = CFSTR("inputExposure");
  v5 = *MEMORY[0x1E0C9DE60];
  v34[0] = *MEMORY[0x1E0C9DE50];
  v4 = v34[0];
  v34[1] = v5;
  v40[0] = &unk_1E5051F68;
  v40[1] = &unk_1E5051F78;
  v7 = *MEMORY[0x1E0C9DE48];
  v35 = *MEMORY[0x1E0C9DE58];
  v6 = v35;
  v36 = v7;
  v40[2] = &unk_1E5051F88;
  v40[3] = &unk_1E5051F98;
  v9 = *MEMORY[0x1E0C9DE40];
  v37 = *MEMORY[0x1E0C9DE10];
  v8 = v37;
  v38 = v9;
  v40[4] = &unk_1E5051FA8;
  v40[5] = &unk_1E5051FA8;
  v39 = *MEMORY[0x1E0C9DE68];
  v10 = v39;
  v41 = *MEMORY[0x1E0C9DED0];
  v11 = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v34, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v20;
  v43[2] = CFSTR("inputContrast");
  v32[0] = v4;
  v32[1] = v5;
  v33[0] = &unk_1E5051F68;
  v33[1] = &unk_1E5051F78;
  v32[2] = v6;
  v32[3] = v7;
  v33[2] = &unk_1E5051F88;
  v33[3] = &unk_1E5051F98;
  v32[4] = v8;
  v32[5] = v9;
  v33[4] = &unk_1E5051FA8;
  v33[5] = &unk_1E5051FA8;
  v32[6] = v10;
  v33[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v19;
  v43[3] = CFSTR("inputBrightness");
  v30[0] = v4;
  v30[1] = v5;
  v31[0] = &unk_1E5051F68;
  v31[1] = &unk_1E5051F78;
  v30[2] = v6;
  v30[3] = v7;
  v31[2] = &unk_1E5051F88;
  v31[3] = &unk_1E5051F98;
  v30[4] = v8;
  v30[5] = v9;
  v31[4] = &unk_1E5051FA8;
  v31[5] = &unk_1E5051FA8;
  v30[6] = v10;
  v31[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v18;
  v43[4] = CFSTR("inputShadows");
  v28[0] = v4;
  v28[1] = v5;
  v29[0] = &unk_1E5051F68;
  v29[1] = &unk_1E5051F78;
  v28[2] = v6;
  v28[3] = v7;
  v29[2] = &unk_1E5051F88;
  v29[3] = &unk_1E5051F98;
  v28[4] = v8;
  v28[5] = v9;
  v29[4] = &unk_1E5051FA8;
  v29[5] = &unk_1E5051FA8;
  v28[6] = v10;
  v29[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v17;
  v43[5] = CFSTR("inputHighlights");
  v26[0] = v4;
  v26[1] = v5;
  v27[0] = &unk_1E5051F68;
  v27[1] = &unk_1E5051F78;
  v26[2] = v6;
  v26[3] = v7;
  v27[2] = &unk_1E5051F88;
  v27[3] = &unk_1E5051F98;
  v26[4] = v8;
  v26[5] = v9;
  v27[4] = &unk_1E5051FA8;
  v27[5] = &unk_1E5051FA8;
  v26[6] = v10;
  v27[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v16;
  v43[6] = CFSTR("inputBlack");
  v24[0] = v4;
  v24[1] = v5;
  v25[0] = &unk_1E5051F68;
  v25[1] = &unk_1E5051F78;
  v24[2] = v6;
  v24[3] = v7;
  v25[2] = &unk_1E5051F88;
  v25[3] = &unk_1E5051F98;
  v24[4] = v8;
  v24[5] = v9;
  v25[4] = &unk_1E5051FA8;
  v25[5] = &unk_1E5051FA8;
  v24[6] = v10;
  v25[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v12;
  v43[7] = CFSTR("inputRawHighlights");
  v22[0] = v4;
  v22[1] = v5;
  v23[0] = &unk_1E5051FA8;
  v23[1] = &unk_1E5051FA8;
  v22[2] = v6;
  v22[3] = v7;
  v23[2] = &unk_1E5051F88;
  v23[3] = &unk_1E5051F88;
  v22[4] = v8;
  v22[5] = v9;
  v23[4] = &unk_1E5051FA8;
  v23[5] = &unk_1E5051FA8;
  v22[6] = v10;
  v23[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL result;

  -[NSNumber doubleValue](self->inputExposure, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputContrast, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputBrightness, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->inputShadows, "doubleValue");
  v10 = v9;
  -[NSNumber doubleValue](self->inputHighlights, "doubleValue");
  v12 = v11;
  -[NSNumber doubleValue](self->inputBlack, "doubleValue");
  v14 = v13;
  -[NSNumber doubleValue](self->inputRawHighlights, "doubleValue");
  result = 0;
  if (fabs(v4) < 1.0e-10
    && fabs(v6) < 1.0e-10
    && fabs(v8) < 1.0e-10
    && fabs(v10) < 1.0e-10
    && fabs(v12) < 1.0e-10
    && fabs(v14) < 1.0e-10)
  {
    return fabs(v15) < 1.0e-10;
  }
  return result;
}

- (id)_kernelBneg
{
  if (_kernelBneg_once != -1)
    dispatch_once(&_kernelBneg_once, &__block_literal_global_15972);
  return (id)_kernelBneg_singleton;
}

- (id)_kernelBpos
{
  if (_kernelBpos_once != -1)
    dispatch_once(&_kernelBpos_once, &__block_literal_global_47_15969);
  return (id)_kernelBpos_singleton;
}

- (id)_kernelC
{
  if (_kernelC_once != -1)
    dispatch_once(&_kernelC_once, &__block_literal_global_50_15966);
  return (id)_kernelC_singleton;
}

- (id)_kernelC_hdr
{
  if (_kernelC_hdr_once != -1)
    dispatch_once(&_kernelC_hdr_once, &__block_literal_global_53);
  return (id)_kernelC_hdr_singleton;
}

- (id)_kernelH
{
  if (_kernelH_once != -1)
    dispatch_once(&_kernelH_once, &__block_literal_global_56);
  return (id)_kernelH_singleton;
}

- (id)_kernelRH
{
  if (_kernelRH_once != -1)
    dispatch_once(&_kernelRH_once, &__block_literal_global_59_15958);
  return (id)_kernelRH_singleton;
}

- (id)outputImage
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIImage *v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  long double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  int v44;
  unint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  _QWORD *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  double v68;
  double v69;
  long double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  double v76;
  void *v77;
  uint64_t v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  float v117;
  float v118;
  float v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
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
  _QWORD v139[5];
  _QWORD v140[5];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[2];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[5];
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[7];

  v151[5] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[PISmartToneFilterHDR _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputExposure, "doubleValue");
  v5 = fmin(fmax(v4, -2.0), 2.0);
  -[NSNumber doubleValue](self->inputContrast, "doubleValue");
  v132 = v6;
  -[NSNumber doubleValue](self->inputBrightness, "doubleValue");
  v134 = fmax(v7, -2.0);
  -[NSNumber doubleValue](self->inputShadows, "doubleValue");
  v9 = v8;
  -[NSNumber doubleValue](self->inputHighlights, "doubleValue");
  v11 = v10;
  -[NSNumber doubleValue](self->inputBlack, "doubleValue");
  v13 = fmax(v12, -2.0);
  -[NSNumber doubleValue](self->inputRawHighlights, "doubleValue");
  v15 = fmax(v14, 0.0);
  v16 = self->inputImage;
  v131 = fmin(v15, 2.0);
  v137 = v15;
  v138 = fabs(v131);
  if (v138 >= 1.0e-10)
  {
    v17 = fmin(v15, 0.8);
    v18 = 1.0 - v17;
    v19 = (float)(1.0 - v18) * 0.33333;
    v150[0] = CFSTR("inputRVector");
    v20 = (float)(v18 + v19);
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v20, v21, v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v151[0] = v22;
    v150[1] = CFSTR("inputGVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v21, v20, v21, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v151[1] = v23;
    v150[2] = CFSTR("inputBVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v21, v21, v20, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v151[2] = v24;
    v150[3] = CFSTR("inputAVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v151[3] = v25;
    v150[4] = CFSTR("inputBiasVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v151[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v16 = (CIImage *)v28;
  }
  v29 = fmax(v9, -2.0);
  v30 = fmax(v11, -2.0);
  v31 = fmin(v13, 2.0);
  v32 = fmin(v134, 2.0);
  if (fabs(v5) >= 1.0e-10 || fabs(v31) >= 1.0e-10)
  {
    v33 = 1.0 / (1.0 / exp2(v5 + v5) - v31 / 20.0);
    v148[0] = CFSTR("inputRVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", (double)v33, 0.0, 0.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = v34;
    v148[1] = CFSTR("inputGVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, (double)v33, 0.0, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v149[1] = v35;
    v148[2] = CFSTR("inputBVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, (double)v33, 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v149[2] = v36;
    v148[3] = CFSTR("inputAVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v149[3] = v37;
    v148[4] = CFSTR("inputBiasVector");
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", (double)-(v31 / 20.0 * v33), (double)-(v31 / 20.0 * v33), (double)-(v31 / 20.0 * v33), 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v149[4] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v39);
    v40 = objc_claimAutoreleasedReturnValue();

    v16 = (CIImage *)v40;
  }
  v41 = fmax(v132, -2.0);
  v42 = fmin(v29, 2.0);
  v43 = fmin(v30, 2.0);
  if (fabs(v32) >= 1.0e-10)
  {
    v135 = v41;
    -[CIImage imageByUnpremultiplyingAlpha](v16, "imageByUnpremultiplyingAlpha");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32 >= 0.0)
    {
      -[PISmartToneFilterHDR _kernelBpos](self, "_kernelBpos");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "extent");
      v49 = v59;
      v51 = v60;
      v53 = v61;
      v55 = v62;
      v146[0] = v46;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32 * 2.0 + 1.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v146[1] = v56;
      v57 = (void *)MEMORY[0x1E0C99D20];
      v58 = v146;
    }
    else
    {
      -[PISmartToneFilterHDR _kernelBneg](self, "_kernelBneg");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "extent");
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v147[0] = v46;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32 * -1.5 + 1.0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v147[1] = v56;
      v57 = (void *)MEMORY[0x1E0C99D20];
      v58 = v147;
    }
    objc_msgSend(v57, "arrayWithObjects:count:", v58, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "applyWithExtent:arguments:", v63, v49, v51, v53, v55);
    v16 = (CIImage *)objc_claimAutoreleasedReturnValue();
    v45 = 0x1E0C9D000uLL;

    v41 = v135;
    if (fabs(v42) < 1.0e-10)
    {
      v44 = 0;
      goto LABEL_21;
    }
    -[CIImage imageByPremultiplyingAlpha](v16, "imageByPremultiplyingAlpha");
    v64 = objc_claimAutoreleasedReturnValue();

    v16 = (CIImage *)v64;
  }
  else
  {
    if (fabs(v42) < 1.0e-10)
    {
      v44 = 1;
      v45 = 0x1E0C9D000;
      goto LABEL_21;
    }
    v45 = 0x1E0C9D000;
  }
  v144[0] = CFSTR("inputShadowAmount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v65;
  v145[1] = &unk_1E5051F88;
  v144[1] = CFSTR("inputHighlightAmount");
  v144[2] = CFSTR("inputRadius");
  v145[2] = &unk_1E5051FA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIHighlightShadowAdjust"), v66);
  v67 = objc_claimAutoreleasedReturnValue();

  v44 = 1;
  v16 = (CIImage *)v67;
LABEL_21:
  v68 = fmin(v41, 2.0);
  v69 = fabs(v43);
  if (v69 >= 1.0e-10)
  {
    v70 = exp(v43 * v43 / -0.75);
    v71 = v70 * -0.45 + 1.45;
    v72 = v70 * 0.45 + 0.55;
    if (v43 <= 0.0)
      v73 = v72;
    else
      v73 = v71;
    v74 = (v69 + -0.6) * 2.0 + 0.2;
    if (v69 < 0.6)
      v74 = 0.2;
    v133 = v74;
    if (v44)
    {
      -[CIImage imageByUnpremultiplyingAlpha](v16, "imageByUnpremultiplyingAlpha");
      v75 = objc_claimAutoreleasedReturnValue();

      v16 = (CIImage *)v75;
    }
    v136 = v68;
    v76 = v138;
    if (v138 >= 1.0e-10)
    {
      if (v73 < v131)
        v73 = v131;
      -[PISmartToneFilterHDR _kernelRH](self, "_kernelRH", 0xBFDCCCCCCCCCCCCDLL, 0x3FF7333333333333);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[CIImage extent](v16, "extent");
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v87 = v86;
      v143[0] = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v143[1] = v88;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "applyWithExtent:arguments:", v89, v81, v83, v85, v87);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43 <= 0.0)
      {
        v76 = exp(v43 * (v43 * -0.4245) / 0.75);
        v73 = v76 * 0.45 + 0.55;
      }
      else
      {
        v76 = exp(v43 * (v43 * -0.4225) / 0.75);
        v73 = v130 + v76 * v129;
      }
    }
    else
    {
      v77 = v16;
    }
    -[PISmartToneFilterHDR _kernelH](self, "_kernelH", v76);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "extent");
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    v142[0] = v77;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v99;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v133);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v142[2] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "applyWithExtent:arguments:", v101, v92, v94, v96, v98);
    v16 = (CIImage *)objc_claimAutoreleasedReturnValue();

    v68 = v136;
    if (fabs(v136) < 1.0e-10)
      goto LABEL_43;
  }
  else
  {
    if (fabs(v68) < 1.0e-10)
    {
      if ((v44 & 1) != 0)
        goto LABEL_44;
      goto LABEL_43;
    }
    if (v44)
    {
      -[CIImage imageByUnpremultiplyingAlpha](v16, "imageByUnpremultiplyingAlpha");
      v78 = objc_claimAutoreleasedReturnValue();

      v16 = (CIImage *)v78;
    }
  }
  -[PISmartToneFilterHDR _kernelC_hdr](self, "_kernelC_hdr");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[CIImage extent](v16, "extent");
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v110 = v109;
  v141[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68 * 3.4);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v141[1] = v111;
  v112 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D52108], "HLGOpticalScale");
  objc_msgSend(v112, "numberWithDouble:");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v141[2] = v113;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "applyWithExtent:arguments:", v114, v104, v106, v108, v110);
  v115 = objc_claimAutoreleasedReturnValue();

  v16 = (CIImage *)v115;
LABEL_43:
  -[CIImage imageByPremultiplyingAlpha](v16, "imageByPremultiplyingAlpha");
  v116 = objc_claimAutoreleasedReturnValue();

  v16 = (CIImage *)v116;
LABEL_44:
  if (v138 >= 1.0e-10)
  {
    v117 = fmin(v137, 0.8);
    v118 = 1.0 / (float)(1.0 - v117);
    v119 = (float)(1.0 - v118) * 0.33333;
    v139[0] = CFSTR("inputRVector");
    v120 = (float)(v118 + v119);
    v121 = v119;
    objc_msgSend(*(id *)(v45 + 3576), "vectorWithX:Y:Z:W:", v120, v121, v121, 0.0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = v122;
    v139[1] = CFSTR("inputGVector");
    objc_msgSend(*(id *)(v45 + 3576), "vectorWithX:Y:Z:W:", v121, v120, v121, 0.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v140[1] = v123;
    v139[2] = CFSTR("inputBVector");
    objc_msgSend(*(id *)(v45 + 3576), "vectorWithX:Y:Z:W:", v121, v121, v120, 0.0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v140[2] = v124;
    v139[3] = CFSTR("inputAVector");
    objc_msgSend(*(id *)(v45 + 3576), "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v140[3] = v125;
    v139[4] = CFSTR("inputBiasVector");
    objc_msgSend(*(id *)(v45 + 3576), "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v140[4] = v126;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 5);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), v127);
    v128 = objc_claimAutoreleasedReturnValue();

    v16 = (CIImage *)v128;
  }
  return v16;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->inputImage, a3);
}

- (NSNumber)inputExposure
{
  return self->inputExposure;
}

- (void)setInputExposure:(id)a3
{
  objc_storeStrong((id *)&self->inputExposure, a3);
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_storeStrong((id *)&self->inputContrast, a3);
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
  objc_storeStrong((id *)&self->inputBrightness, a3);
}

- (NSNumber)inputShadows
{
  return self->inputShadows;
}

- (void)setInputShadows:(id)a3
{
  objc_storeStrong((id *)&self->inputShadows, a3);
}

- (NSNumber)inputHighlights
{
  return self->inputHighlights;
}

- (void)setInputHighlights:(id)a3
{
  objc_storeStrong((id *)&self->inputHighlights, a3);
}

- (NSNumber)inputBlack
{
  return self->inputBlack;
}

- (void)setInputBlack:(id)a3
{
  objc_storeStrong((id *)&self->inputBlack, a3);
}

- (NSNumber)inputRawHighlights
{
  return self->inputRawHighlights;
}

- (void)setInputRawHighlights:(id)a3
{
  objc_storeStrong((id *)&self->inputRawHighlights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputRawHighlights, 0);
  objc_storeStrong((id *)&self->inputBlack, 0);
  objc_storeStrong((id *)&self->inputHighlights, 0);
  objc_storeStrong((id *)&self->inputShadows, 0);
  objc_storeStrong((id *)&self->inputBrightness, 0);
  objc_storeStrong((id *)&self->inputContrast, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

void __33__PISmartToneFilterHDR__kernelRH__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _rawHighlightsHDR(__sample pix, float gain) \n { \n vec3 high = gain*pix.rgb; \n float lum = clamp(dot(pix.rgb, vec3(.3333)), 0.0, 1.0); \n vec3 neg = min(high, 0.0); \n high.rgb = mix(max(pix.rgb, 0.0), high.rgb, lum*lum) + neg; \n return vec4(high, pix.a); \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelRH_singleton;
  _kernelRH_singleton = v0;

}

void __32__PISmartToneFilterHDR__kernelH__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smarttone_highlightcontrast_HDR (__sample pix, float highAmt, float sat) \n { \n float maxVal = 1.0; vec3 neg = min(pix.rgb, 0.0); \n vec3 pos = max(pix.rgb, maxVal) - maxVal; \n pix.rgb = clamp(pix.rgb, 0.0, maxVal); \n float lum = clamp(dot(pix.rgb, vec3(.3333)),0.0,1.0); \n vec3 high = pow(pix.rgb, vec3(3.0 - 2.0*highAmt)); \n float pivot = 0.8; \n vec3 pix1 = (high - pivot)*(4.0 - 3.0*highAmt) + pivot; \n float h = highAmt*highAmt*highAmt*highAmt; \n float a = (4.0 - 3.0*h); \n vec3 pix2 = (lum-pivot)*a+pivot + high.rgb -lum; \n high = mix(pix2, pix1, sat); \n pix.rgb = mix(pix.rgb, high, lum*lum); \n pix.rgb = pix.rgb + neg + pos; \n return pix; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelH_singleton;
  _kernelH_singleton = v0;

}

void __36__PISmartToneFilterHDR__kernelC_hdr__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smarttone_contrast_HDR (__sample im, float midAmt, float maxVal) \n { \n midAmt = midAmt / maxVal; \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, maxVal) - maxVal; \n im.rgb = clamp(im.rgb, 0.0, maxVal); \n float y = dot(im.rgb, vec3(0.3333)); \n y = sqrt(y); \n im.rgb = sqrt(im.rgb); \n float sat = dot(im.rgb - vec3(y), im.rgb - vec3(y)) / sqrt(maxVal); \n y = y*(sqrt(maxVal)-y); \n float a = midAmt*y; \n float b = -0.5*a; \n vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(0.5), -a); \n im.rgb = mix(im.rgb, pix, clamp(0.8+sat, 0.0, 1.0)); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = im.rgb + neg + pos; \n return im; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelC_hdr_singleton;
  _kernelC_hdr_singleton = v0;

}

void __32__PISmartToneFilterHDR__kernelC__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smarttone_contrast_HDR (__sample im, float midAmt) \n { \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n float y = dot(im.rgb, vec3(0.3333)); \n y = sqrt(y); \n float sat = (im.r-y)*(im.r-y)+(im.g-y)*(im.g-y)+(im.b-y)*(im.b-y); \n y = y*(1.0-y); \n im.rgb = sqrt(im.rgb); \n float a = midAmt*y; \n float b = -0.5*a; \n vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(0.5), -y*midAmt); \n im.rgb = mix(im.rgb, pix, 0.8+sat); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = im.rgb + neg + pos; \n return im; \n }"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelC_singleton;
  _kernelC_singleton = v0;

}

void __35__PISmartToneFilterHDR__kernelBpos__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smarttone_brightness_pos_HDR (__sample c, float gamma) \n { \n vec3 neg = min(c.rgb, 0.0); \n vec3 pos = max(c.rgb, 1.0)-1.0; \n c.rgb = clamp(c.rgb, 0.0, 1.0); \n vec3 m = 1.0-c.rgb; \n float a = 0.6; \n vec4 result = c; \n result.rgb = 1.0 - (pow(m, vec3(gamma))+a*( ((gamma-1.0)*m*(1.0-m*m))/(gamma*gamma))); \n c.rgb = pow(c.rgb, vec3(1.0-((min(gamma, 2.95)-1.0)/2.6))); \n result.rgb = mix(c.rgb, result.rgb, .85); \n result.rgb = result.rgb+neg+pos; \n return result; \n } \n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelBpos_singleton;
  _kernelBpos_singleton = v0;

}

void __35__PISmartToneFilterHDR__kernelBneg__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _smarttone_brightness_neg_HDR (__sample c, float gamma) \n { \n vec3 neg = min(c.rgb, 0.0); \n c.rgb = max(c.rgb, 0.0); \n vec3 pix = pow(c.rgb, vec3(gamma)); \n float lum = dot(c.rgb, vec3(0.39, .5, .11)); \n vec3 pix2 = lum>0.0 ? c.rgb*pow(lum, gamma)/lum : vec3(0.0); \n pix = mix(pix, pix2, 0.8) + neg; \n return vec4(pix, c.a); \n } \n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_kernelBneg_singleton;
  _kernelBneg_singleton = v0;

}

@end
