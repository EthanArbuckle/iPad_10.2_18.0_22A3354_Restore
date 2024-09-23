@implementation PISmartBlackAndWhiteAutoCalculator

- (id)_calculateBlackAndWhiteSettingsFromBufferImage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__14495;
  v12 = __Block_byref_object_dispose__14496;
  v13 = 0;
  objc_msgSend(v3, "validRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke;
  v7[3] = &unk_1E5018688;
  v7[4] = &v8;
  objc_msgSend(v3, "readBufferRegion:withBlock:", v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v20;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52020]), "initWithRequest:", self);
  objc_msgSend(v5, "setName:", CFSTR("PISmartBlackAndWhiteAutoCalculator-renderInputImage"));
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAh");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPixelFormat:", v6);

  objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColorSpace:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D520D0]), "initWithTargetPixelSize:", 100, 100);
  objc_msgSend(v5, "setScalePolicy:", v8);

  objc_msgSend(v5, "setSampleMode:", 1);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__PISmartBlackAndWhiteAutoCalculator_submit___block_invoke;
  v21[3] = &unk_1E5019E90;
  v21[4] = self;
  v9 = v4;
  v22 = v9;
  objc_msgSend(v5, "submit:", v21);

}

void __45__PISmartBlackAndWhiteAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_calculateBlackAndWhiteSettingsFromBufferImage:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v4);
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  float *v20;
  float v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  float *v54;
  uint64_t v55;
  __n128 (*v56)(uint64_t, uint64_t);
  uint64_t (*v57)();
  const char *v58;
  int v59;
  __int128 v60;
  int32x2_t v61;
  int v62;
  _QWORD v63[4];
  _QWORD v64[7];

  v64[4] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v53 = 0;
  v54 = (float *)&v53;
  v55 = 0x5012000000;
  v56 = __Block_byref_object_copy__38;
  v57 = __Block_byref_object_dispose__39;
  v58 = "";
  v60 = xmmword_1A64DDEC0;
  v61 = vdup_n_s32(0x3EAAAAABu);
  v59 = 0;
  v62 = 1051372203;
  v52 = *MEMORY[0x1E0D51ED0];
  objc_msgSend(v2, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "size");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bufferFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "size");
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "newStorageWithSize:format:", v10, v12, v13);

  v49 = v52;
  v50 = v4;
  v51 = v6;
  objc_msgSend(MEMORY[0x1E0D52240], "regionWithRect:", &v49);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke_44;
  v43[3] = &unk_1E5018660;
  v16 = v2;
  v46 = v52;
  v47 = v4;
  v48 = v6;
  v44 = v16;
  v45 = &v53;
  objc_msgSend(v14, "writeBufferInRegion:block:", v15, v43);

  objc_msgSend(MEMORY[0x1E0D520B0], "sharedFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bufferFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "returnStorage:", v14);

  v20 = v54;
  if (*((_BYTE *)v54 + 48))
  {
    *(float *)&v19 = v54[13];
    goto LABEL_14;
  }
  *((_BYTE *)v54 + 48) = 1;
  v21 = v20[13];
  v19 = v21;
  if (v21 <= 0.35)
  {
    v22 = 0.35 - v19;
    v23 = -2.0;
  }
  else
  {
    if (v21 >= 0.85)
    {
      *(float *)&v19 = (float)((float)(v21 + -0.85) * 2.0) + -1.0;
      goto LABEL_9;
    }
    v22 = v19 + -0.35;
    v23 = 2.0;
  }
  v19 = v22 * v23 + 0.0;
  *(float *)&v19 = v19;
LABEL_9:
  v24 = v20[14];
  v25 = v20[15];
  v26 = v24 * 1.25;
  v27 = v24 > 0.4;
  v28 = (float)((float)(v24 + -0.4) * 0.83333) + 0.5;
  if (!v27)
    v28 = v26;
  v20[13] = *(float *)&v19;
  v20[14] = v28;
  v29 = v25 + -1.0;
  v30 = v20[16];
  if (v30 > 0.0)
    v30 = v30 * 0.5;
  v20[15] = v29;
  v20[16] = v30;
LABEL_14:
  v63[0] = CFSTR("inputHue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v31;
  v63[1] = CFSTR("inputStrength");
  *(float *)&v32 = v54[14];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v33;
  v63[2] = CFSTR("inputNeutralGamma");
  *(float *)&v34 = v54[15];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v35;
  v63[3] = CFSTR("inputTone");
  *(float *)&v36 = v54[16];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v38);
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v41 = *(void **)(v40 + 40);
  *(_QWORD *)(v40 + 40) = v39;

  _Block_object_dispose(&v53, 8);
}

void __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke_44(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  vImagePixelCount v5;
  uint64_t v6;
  void *v7;
  void *v8;
  vImagePixelCount v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  PIMsgImageBuffer *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  PIMsgImageBuffer *v24;
  PIMsgImageBuffer *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t i;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  _BOOL4 v50;
  double v51;
  unsigned int v52;
  double *v53;
  double v54;
  unint64_t v55;
  char *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  double *v63;
  double *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  double v76;
  unint64_t v77;
  double v78;
  double v79;
  double v80;
  uint64_t j;
  uint64_t v82;
  float v83;
  float v84;
  float v85;
  float *v86;
  float v87;
  float v88;
  uint64_t v89;
  float v90;
  float v91;
  uint64_t v92;
  double *v93;
  float *v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  double v102;
  double v103;
  double v104;
  float v105;
  double v106;
  double v107;
  float v108;
  float v109;
  double v110;
  double v111;
  float v112;
  float v113;
  float v114;
  float v115;
  BOOL v117;
  _QWORD *v118;
  id *v119;
  NSObject *v120;
  void *v121;
  const void **v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  BOOL v127;
  BOOL v128;
  BOOL v129;
  void *v130;
  void *v131;
  double *v132;
  void *v133;
  PIMsgImageBuffer *v134;
  id v135;
  id v136;
  char *v137;
  int64x2_t v138;
  uint64_t v139;
  float v140;
  unint64_t v141;
  float v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  vImage_Buffer dest;
  vImage_Buffer src;
  unsigned int v149;
  unsigned int v150;
  void *__p[3];
  void *v152[3];
  void *v153;
  _BYTE *v154;
  unsigned int v155;
  __int128 v156;
  uint64_t v157;
  int v158;
  _QWORD v159[4];
  char v160;
  int v161;
  int v162;
  uint64_t v163;
  char *v164;
  void *v165;
  void *v166;
  _BYTE buf[24];
  double v168;
  double *v169;
  char *v170;
  char *v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  v135 = a2;
  memset(&src, 0, sizeof(src));
  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "bytes");
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  src.data = v4;
  src.height = v5;
  src.width = 4 * v6;
  objc_msgSend(*(id *)(a1 + 32), "buffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  src.rowBytes = objc_msgSend(v7, "rowBytes");

  memset(&dest, 0, sizeof(dest));
  v8 = (void *)objc_msgSend(v135, "bytes");
  v10 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  dest.data = v8;
  dest.height = v9;
  dest.width = 4 * v10;
  dest.rowBytes = objc_msgSend(v135, "rowBytes");
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBLinearColorSpace");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v133, "CGColorSpace");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = v135;
  *(_DWORD *)(v12 + 48) = 0;
  *(_OWORD *)(v12 + 52) = xmmword_1A64DDEC0;
  *(int32x2_t *)(v12 + 68) = vdup_n_s32(0x3EAAAAABu);
  *(_DWORD *)(v12 + 76) = 1051372203;
  v136 = v13;
  if (!v13)
    goto LABEL_122;
  v14 = [PIMsgImageBuffer alloc];
  v15 = objc_msgSend(v136, "bytes");
  v16 = objc_msgSend(v136, "size");
  objc_msgSend(v136, "size");
  v18 = v17;
  v19 = objc_msgSend(v136, "rowBytes");
  objc_msgSend(v136, "format");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "bytesPerPixel");
  if (v21 >= 0)
    v22 = v21;
  else
    v22 = v21 + 3;
  objc_msgSend(v136, "format");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PIMsgImageBuffer initWithBytes:width:height:bytesPerRow:bytesPerComponent:format:colorspace:](v14, "initWithBytes:width:height:bytesPerRow:bytesPerComponent:format:colorspace:", v15, v16, v18, v19, v22 >> 2, objc_msgSend(v23, "CIFormat"), v11);

  v134 = v24;
  v25 = v134;
  if (v134)
  {
    v145 = -[PIMsgImageBuffer bytes](v134, "bytes");
    v144 = -[PIMsgImageBuffer rowElements](v134, "rowElements");
    v26 = -[PIMsgImageBuffer width](v134, "width");
    v146 = -[PIMsgImageBuffer height](v134, "height");
    v25 = v134;
  }
  else
  {
    v144 = 0;
    v145 = 0;
    v26 = 0;
    v146 = 0;
  }

  v138 = vdupq_n_s64(0x3FD5555555555555uLL);
  v27 = v146 * v26;
  v28 = 1;
  do
  {
    v29 = v28;
    LODWORD(v159[0]) = 3;
    memset((char *)v159 + 4, 0, 28);
    v155 = 3;
    v157 = 0;
    v156 = 0uLL;
    v158 = 0;
    std::vector<double>::vector(&v153, v27);
    std::vector<double>::vector(v152, v27);
    v143 = v29;
    if (v146)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0.0;
      do
      {
        if (v26)
        {
          for (i = 0; i != v26; ++i)
          {
            v34 = 0;
            v35 = v145 + 4 * v144 * v31 + 16 * i;
            v37 = *(float *)(v35 + 4);
            LODWORD(v164) = *(_DWORD *)v35;
            v36 = *(float *)&v164;
            *((float *)&v164 + 1) = v37;
            v165 = *(void **)(v35 + 8);
            *((double *)v152[0] + v30) = sqrtf(vmlas_n_f32((float)(v37 * (float)(v37 * *(float *)(v12 + 72)))+ (float)((float)(*(float *)&v164 * *(float *)(v12 + 68)) * *(float *)&v164), *(float *)(v12 + 76) * *(float *)&v165, *(float *)&v165));
            v38 = v36;
            v39 = v38;
            do
            {
              v40 = *(float *)((char *)&v164 + v34);
              if (v39 > v40)
                v39 = *(float *)((char *)&v164 + v34);
              if (v38 < v40)
                v38 = *(float *)((char *)&v164 + v34);
              v34 += 4;
            }
            while (v34 != 12);
            v41 = 0;
            v42 = v38 - v39;
            *((double *)v153 + v30) = v38 - v39;
            do
            {
              *(double *)&buf[8 * v41] = *((float *)&v164 + v41);
              ++v41;
            }
            while (v41 != 3);
            MsgMatrix<double>::AppendRow<double>((uint64_t)v159, (uint64_t)buf);
            v32 = v32 + v42;
            ++v30;
          }
        }
        ++v31;
      }
      while (v31 != v146);
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = v32 / (double)(unint64_t)((v154 - (_BYTE *)v153) >> 3);
      do
      {
        if (v26)
        {
          v44 += v26;
          v47 = v43;
          v48 = v26;
          do
          {
            v49 = *(double *)((char *)v153 + v47);
            v50 = v49 > v46;
            v51 = v49 * 0.5;
            *(_QWORD *)buf = *(_QWORD *)((char *)v152[0] + v47);
            *(double *)&buf[8] = v51 + *(double *)buf;
            *(_QWORD *)&buf[16] = 0;
            v168 = v51 + 1.0;
            v164 = *(char **)&buf[16 * v50 + 8 * (*(double *)buf > 0.217)];
            v165 = v164;
            v166 = v164;
            MsgMatrix<double>::AppendRow<double>((uint64_t)&v155, (uint64_t)&v164);
            v47 += 8;
            --v48;
          }
          while (v48);
        }
        ++v45;
        v43 += 8 * v26;
      }
      while (v45 != v146);
    }
    MsgMatrix<double>::T((unsigned int *)buf, (unsigned int *)v159);
    MsgMatrix<double>::T((unsigned int *)&v164, &v155);
    v52 = v159[0];
    v163 = v159[0];
    v161 = 0;
    v160 = 78;
    std::vector<double>::vector(&v169, 0x100uLL);
    v53 = v169;
    v162 = -1;
    *v169 = 0.0;
    dgels_NEWLAPACK();
    v54 = *v53;
    if (*v53 <= 256.0)
    {
      v162 = 256;
      goto LABEL_51;
    }
    v162 = (int)v54;
    v55 = (int)v54;
    v56 = v170;
    v57 = (v170 - (char *)v169) >> 3;
    if (v55 > v57)
    {
      v58 = v55 - v57;
      if (v55 - v57 > (v171 - v170) >> 3)
      {
        if ((v55 & 0x80000000) != 0)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v141 = v55 - v57;
        v59 = v171 - (char *)v169;
        if ((v171 - (char *)v169) >> 2 > v55)
          v55 = v59 >> 2;
        if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8)
          v60 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v60 = v55;
        v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v60);
        v139 = v62;
        v64 = v169;
        v63 = (double *)v170;
        v137 = v61;
        v65 = &v61[8 * v57];
        bzero(v65, 8 * v141);
        v66 = v65;
        if (v63 == v64)
        {
          v67 = v139;
        }
        else
        {
          v67 = v139;
          do
          {
            v68 = *((_QWORD *)v63-- - 1);
            *((_QWORD *)v66 - 1) = v68;
            v66 -= 8;
          }
          while (v63 != v64);
        }
        v169 = (double *)v66;
        v170 = &v65[8 * v141];
        v171 = &v137[8 * v67];
        if (v64)
          operator delete(v64);
        goto LABEL_50;
      }
      bzero(v170, 8 * v58);
      v69 = &v56[8 * v58];
      goto LABEL_46;
    }
    if (v55 < v57)
    {
      v69 = (char *)&v169[v55];
LABEL_46:
      v170 = v69;
    }
LABEL_50:
    v53 = v169;
LABEL_51:
    v132 = v53;
    dgels_NEWLAPACK();
    if (v169)
    {
      v170 = (char *)v169;
      operator delete(v169);
    }
    v169 = 0;
    v149 = v52;
    v150 = v52;
    std::vector<double>::vector(__p, v52 * v52, &v169);
    v70 = v150;
    if (v150)
    {
      v71 = 0;
      do
      {
        v72 = v149;
        if (v149)
        {
          v73 = 0;
          do
          {
            v74 = *(_QWORD *)MsgMatrix<double>::operator()((unsigned int *)&v164, v73, v71);
            *(_QWORD *)MsgMatrix<double>::operator()(&v149, v73++, v71) = v74;
          }
          while (v72 != v73);
        }
        ++v71;
      }
      while (v71 != v70);
    }
    if (v165)
    {
      v166 = v165;
      operator delete(v165);
    }
    if (*(_QWORD *)&buf[8])
    {
      *(_QWORD *)&buf[16] = *(_QWORD *)&buf[8];
      operator delete(*(void **)&buf[8]);
    }
    v75 = 0;
    v76 = fabs(*(double *)MsgMatrix<double>::operator()(&v149, 0, 0));
    do
      v76 = fmax(v76, fabs(*(double *)MsgMatrix<double>::operator()(&v149, v75++, 0)));
    while (v75 != 3);
    v77 = 0;
    v78 = 0.0;
    do
    {
      v79 = *(double *)MsgMatrix<double>::operator()(&v149, v77, 0) / v76;
      *(double *)&buf[8 * v77] = v79;
      v78 = v78 + v79;
      ++v77;
    }
    while (v77 != 3);
    v80 = fabs(v78);
    if (v80 < 0.000001 || v80 > 1000000000.0)
    {
      *(_QWORD *)&buf[16] = 0x3FD5555555555555;
      *(int64x2_t *)buf = v138;
      v78 = 1.0;
    }
    for (j = 0; j != 24; j += 8)
      *(double *)&buf[j] = *(double *)&buf[j] / v78;
    v82 = 0;
    v83 = *(double *)buf;
    v84 = *(double *)&buf[8];
    v85 = *(double *)&buf[16];
    v86 = (float *)&dword_1A64D6F64;
    do
    {
      v87 = (float)(*(v86 - 1) * v84) + (float)(*(v86 - 2) * v83);
      v88 = *v86;
      v86 += 3;
      *(float *)((char *)&v164 + v82) = v87 + (float)(v88 * v85);
      v82 += 4;
    }
    while (v82 != 12);
    v89 = 0;
    v169 = (double *)v164;
    LODWORD(v170) = (_DWORD)v165;
    do
    {
      v90 = *(float *)((char *)&v169 + v89);
      v91 = powf(fabsf(v90), 0.43);
      if (v90 < 0.0)
        v91 = -v91;
      *(float *)((char *)&v169 + v89) = v91;
      v89 += 4;
    }
    while (v89 != 12);
    v92 = 0;
    v93 = v169;
    v94 = (float *)&dword_1A64D6F88;
    v95 = *(float *)&v170;
    do
    {
      v96 = (float)(*((float *)&v93 + 1) * *(v94 - 1)) + (float)(*(v94 - 2) * *(float *)&v93);
      v97 = *v94;
      v94 += 3;
      *(float *)((char *)&v164 + v92) = v96 + (float)(v97 * v95);
      v92 += 4;
    }
    while (v92 != 12);
    LODWORD(v170) = (_DWORD)v165;
    v169 = (double *)v164;
    v98 = *((float *)&v164 + 1);
    v99 = *(float *)&v165;
    v27 = v146 * v26;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v152[0])
    {
      v152[1] = v152[0];
      operator delete(v152[0]);
    }
    if (v153)
    {
      v154 = v153;
      operator delete(v153);
    }
    if (*(_QWORD *)((char *)&v156 + 4))
      operator delete(*(void **)((char *)&v156 + 4));
    if (v159[1])
      operator delete((void *)v159[1]);
    v100 = atan2f(v99, v98) / 6.28318531;
    v101 = v100 + 0.5;
    *(float *)(v12 + 52) = v100 + 0.5;
    v140 = *(float *)(v12 + 56);
    v102 = v140;
    v103 = v140 * cos((float)(0.60167 - (float)(v100 + 0.5)) * 6.28318531) + 1.0;
    if (v103 <= 1.0)
      v104 = v103 * -2.0 + 3.0;
    else
      v104 = (v103 + -1.0) * -0.55 + 1.0;
    v105 = v104;
    v142 = powf(0.3, v105);
    v106 = v102 * cos((float)(0.8663 - v101) * 6.28318531) + 1.0;
    if (v106 <= 1.0)
      v107 = v106 * -2.0 + 3.0;
    else
      v107 = (v106 + -1.0) * -0.55 + 1.0;
    v108 = v107;
    v109 = powf(0.6, v108);
    v110 = v102 * cos((float)(0.22284 - v101) * 6.28318531) + 1.0;
    if (v110 <= 1.0)
      v111 = v110 * -2.0 + 3.0;
    else
      v111 = (v110 + -1.0) * -0.55 + 1.0;
    v112 = v111;
    v113 = powf(0.1, v112);
    v28 = 0;
    v114 = v113 + (float)(v142 + v109);
    v115 = v113 / v114;
    *(float *)(v12 + 68) = v142 / v114;
    *(float *)(v12 + 72) = v109 / v114;
    *(float *)(v12 + 76) = v115;
  }
  while ((v143 & 1) != 0);
  v117 = COERCE_UNSIGNED_INT(fabs(v142 / v114)) <= 0x7F7FFFFF
      && COERCE_UNSIGNED_INT(fabs(v109 / v114)) <= 0x7F7FFFFF
      && (LODWORD(v115) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
  if (!v117
    || (((LODWORD(v101) & 0x7FFFFFFFu) - 0x800000) >> 24 > 0x7E
      ? (v127 = (LODWORD(v101) & 0x7FFFFFFFu) - 1 > 0x7FFFFE)
      : (v127 = 0),
        v127 ? (v128 = LODWORD(v101) == 0) : (v128 = 1),
        v128 ? (v129 = (LODWORD(v140) & 0x7FFFFFFFu) <= 0x7F7FFFFF) : (v129 = 0),
        !v129
     || (*(_DWORD *)(v12 + 60) & 0x7FFFFFFFu) > 0x7F7FFFFF
     || (*(_DWORD *)(v12 + 64) & 0x7FFFFFFFu) >= 0x7F800000))
  {
    v118 = (_QWORD *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14493);
    v119 = (id *)MEMORY[0x1E0D52380];
    v120 = (id)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Produced invalid BlackAndWhite settings, using defaults"), v132, &v162, &v161);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v121;
      _os_log_impl(&dword_1A6382000, v120, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    }
    v122 = (const void **)MEMORY[0x1E0D51D48];
    if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      if (*v118 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14493);
      v123 = *v119;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        v124 = dispatch_get_specific(*v122);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "componentsJoinedByString:", CFSTR("\n"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v124;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v126;
        _os_log_error_impl(&dword_1A6382000, v123, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (*v118 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14493);
      v123 = *v119;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "componentsJoinedByString:", CFSTR("\n"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v131;
        _os_log_error_impl(&dword_1A6382000, v123, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
    }

    _NUAssertContinueHandler();
    *(_DWORD *)(v12 + 48) = 0;
    *(_OWORD *)(v12 + 52) = xmmword_1A64DDEC0;
    *(int32x2_t *)(v12 + 68) = vdup_n_s32(0x3EAAAAABu);
    *(_DWORD *)(v12 + 76) = 1051372203;
  }

LABEL_122:
}

@end
