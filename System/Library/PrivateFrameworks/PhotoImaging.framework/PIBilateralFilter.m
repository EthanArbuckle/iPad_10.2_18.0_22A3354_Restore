@implementation PIBilateralFilter

+ (id)customAttributes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = *MEMORY[0x1E0C9DE50];
  v4 = *MEMORY[0x1E0C9DE60];
  v5 = *MEMORY[0x1E0C9DE58];
  v6 = *MEMORY[0x1E0C9DE10];
  v7 = *MEMORY[0x1E0C9DE68];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0C9DE50], &unk_1E5051C08, *MEMORY[0x1E0C9DE60], &unk_1E5051C18, *MEMORY[0x1E0C9DE58], &unk_1E5051C28, *MEMORY[0x1E0C9DE10], *MEMORY[0x1E0C9DE90], *MEMORY[0x1E0C9DE68], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9E258];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, &unk_1E5051C38, v4, &unk_1E5051C48, v5, &unk_1E5051C58, v6, *MEMORY[0x1E0C9DED0], v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v8, v9, v10, CFSTR("inputEdgeDetail"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)outputImage
{
  float v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  double *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  GUBilateralConvolution *v30;
  uint64_t v31;
  CIImage *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
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
  double v86;
  double v87;
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
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  GUBWBilateralConvolution *v131;
  uint64_t v132;
  NSObject *v134;
  void *v135;
  const void **v136;
  void *specific;
  NSObject *v138;
  _BOOL4 v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  const void **v149;
  void *v150;
  NSObject *v151;
  _BOOL4 v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  PIBilateralFilter *v163;
  double v164;
  uint64_t v165;
  double v166;
  uint64_t v167;
  double v168;
  uint64_t v169;
  double v170;
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  void *v174;
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->_inputRadius, "floatValue");
  if (v3 == 0.0)
    goto LABEL_120;
  v4 = v3;
  v5 = v4 + v4;
  v6 = vcvtpd_s64_f64(v4 + v4);
  if (v6 >= 101)
  {
    NUAssertLogger_6085();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ridiculously large radius for bilateral filter"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v172 = v135;
      _os_log_error_impl(&dword_1A6382000, v134, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v136 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6085();
    v138 = objc_claimAutoreleasedReturnValue();
    v139 = os_log_type_enabled(v138, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v139)
      {
        v142 = dispatch_get_specific(*v136);
        v143 = (void *)MEMORY[0x1E0CB3978];
        v144 = v142;
        objc_msgSend(v143, "callStackSymbols");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "componentsJoinedByString:", CFSTR("\n"));
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v172 = v142;
        v173 = 2114;
        v174 = v146;
        _os_log_error_impl(&dword_1A6382000, v138, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v139)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "componentsJoinedByString:", CFSTR("\n"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v172 = v141;
      _os_log_error_impl(&dword_1A6382000, v138, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_130:
    NUAssertLogger_6085();
    v147 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to allocate convolution table in bilateral filter"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v172 = v148;
      _os_log_error_impl(&dword_1A6382000, v147, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v149 = (const void **)MEMORY[0x1E0D51D48];
    v150 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6085();
    v151 = objc_claimAutoreleasedReturnValue();
    v152 = os_log_type_enabled(v151, OS_LOG_TYPE_ERROR);
    if (v150)
    {
      if (v152)
      {
        v155 = dispatch_get_specific(*v149);
        v156 = (void *)MEMORY[0x1E0CB3978];
        v157 = v155;
        objc_msgSend(v156, "callStackSymbols");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "componentsJoinedByString:", CFSTR("\n"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v172 = v155;
        v173 = 2114;
        v174 = v159;
        _os_log_error_impl(&dword_1A6382000, v151, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v152)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "componentsJoinedByString:", CFSTR("\n"));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v172 = v154;
      _os_log_error_impl(&dword_1A6382000, v151, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  if (v3 <= 0.5)
  {
LABEL_120:
    v32 = self->_inputImage;
    return v32;
  }
  if (v4 <= 1.05)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0.0;
    v36 = hypot(1.0, 0.0) / v5;
    v37 = 0.0;
    if (v36 >= 0.0)
    {
      v37 = 1.0;
      if (v36 <= 1.0)
        v37 = (v36 * -2.0 + 3.0) * (v36 * v36);
    }
    v38 = 1.0 - v37;
    v39 = hypot(1.0, 1.0) / v5;
    if (v39 >= 0.0)
    {
      v35 = 1.0;
      if (v39 <= 1.0)
        v35 = (v39 * -2.0 + 3.0) * (v39 * v39);
    }
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v40);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 1.0, 1.0, -1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v41);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v42);

    v43 = (void *)MEMORY[0x1E0CB37E8];
    v44 = 1.0 - v35;
    goto LABEL_118;
  }
  if (v3 <= 1.5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = hypot(1.0, 0.0) / v5;
    v46 = (v45 * -2.0 + 3.0) * (v45 * v45);
    if (v45 > 1.0)
      v46 = 1.0;
    if (v45 >= 0.0)
      v47 = v46;
    else
      v47 = 0.0;
    v48 = 1.0 - v47;
    v49 = hypot(1.0, 1.0) / v5;
    v50 = (v49 * -2.0 + 3.0) * (v49 * v49);
    if (v49 > 1.0)
      v50 = 1.0;
    if (v49 >= 0.0)
      v51 = v50;
    else
      v51 = 0.0;
    v52 = 1.0 - v51;
    v53 = hypot(2.0, 0.0) / v5;
    v54 = (v53 * -2.0 + 3.0) * (v53 * v53);
    if (v53 > 1.0)
      v54 = 1.0;
    if (v53 >= 0.0)
      v55 = v54;
    else
      v55 = 0.0;
    v56 = 1.0 - v55;
    v57 = hypot(2.0, 1.0) / v5;
    v58 = (v57 * -2.0 + 3.0) * (v57 * v57);
    v59 = 1.0 - v58;
    if (v57 > 1.0)
    {
      v59 = 0.0;
      v58 = 1.0;
    }
    if (v57 >= 0.0)
      v60 = v59;
    else
      v60 = 1.0;
    if (v57 >= 0.0)
      v61 = v58;
    else
      v61 = 0.0;
    v62 = 1.0 - v61;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, -1.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v63);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 1.0, 1.0, -1.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v64);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 0.0, 0.0, -2.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v65);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 1.0, 2.0, -1.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v66);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 2.0, 1.0, -2.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v67);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v68);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v69);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v70);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v71);

    v43 = (void *)MEMORY[0x1E0CB37E8];
    v44 = v62;
    goto LABEL_118;
  }
  if (v4 <= 2.1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = hypot(1.0, 0.0) / v5;
    v73 = (v72 * -2.0 + 3.0) * (v72 * v72);
    if (v72 > 1.0)
      v73 = 1.0;
    if (v72 >= 0.0)
      v74 = v73;
    else
      v74 = 0.0;
    v75 = 1.0 - v74;
    v76 = hypot(1.0, 1.0) / v5;
    v77 = (v76 * -2.0 + 3.0) * (v76 * v76);
    if (v76 > 1.0)
      v77 = 1.0;
    if (v76 >= 0.0)
      v78 = v77;
    else
      v78 = 0.0;
    v170 = 1.0 - v78;
    v79 = hypot(2.0, 0.0) / v5;
    v80 = (v79 * -2.0 + 3.0) * (v79 * v79);
    if (v79 > 1.0)
      v80 = 1.0;
    if (v79 >= 0.0)
      v81 = v80;
    else
      v81 = 0.0;
    v168 = 1.0 - v81;
    v82 = hypot(2.0, 1.0) / v5;
    v83 = (v82 * -2.0 + 3.0) * (v82 * v82);
    if (v82 > 1.0)
      v83 = 1.0;
    if (v82 >= 0.0)
      v84 = v83;
    else
      v84 = 0.0;
    v166 = 1.0 - v84;
    v85 = hypot(1.0, 2.0) / v5;
    v86 = (v85 * -2.0 + 3.0) * (v85 * v85);
    if (v85 > 1.0)
      v86 = 1.0;
    if (v85 >= 0.0)
      v87 = v86;
    else
      v87 = 0.0;
    v164 = 1.0 - v87;
    v88 = hypot(2.0, 2.0) / v5;
    v89 = (v88 * -2.0 + 3.0) * (v88 * v88);
    if (v88 > 1.0)
      v89 = 1.0;
    if (v88 >= 0.0)
      v90 = v89;
    else
      v90 = 0.0;
    v162 = 1.0 - v90;
    v91 = hypot(3.0, 0.0) / v5;
    v92 = (v91 * -2.0 + 3.0) * (v91 * v91);
    if (v91 > 1.0)
      v92 = 1.0;
    if (v91 >= 0.0)
      v93 = v92;
    else
      v93 = 0.0;
    v161 = 1.0 - v93;
    v94 = hypot(3.0, 1.0) / v5;
    v95 = (v94 * -2.0 + 3.0) * (v94 * v94);
    if (v94 > 1.0)
      v95 = 1.0;
    if (v94 >= 0.0)
      v96 = v95;
    else
      v96 = 0.0;
    v160 = 1.0 - v96;
    v97 = hypot(1.0, 3.0) / v5;
    v98 = (v97 * -2.0 + 3.0) * (v97 * v97);
    if (v97 > 1.0)
      v98 = 1.0;
    if (v97 >= 0.0)
      v99 = v98;
    else
      v99 = 0.0;
    v100 = 1.0 - v99;
    v101 = hypot(3.0, 2.0) / v5;
    v102 = (v101 * -2.0 + 3.0) * (v101 * v101);
    if (v101 > 1.0)
      v102 = 1.0;
    if (v101 >= 0.0)
      v103 = v102;
    else
      v103 = 0.0;
    v104 = 1.0 - v103;
    v105 = hypot(2.0, 3.0) / v5;
    v106 = (v105 * -2.0 + 3.0) * (v105 * v105);
    if (v105 > 1.0)
      v106 = 1.0;
    if (v105 >= 0.0)
      v107 = v106;
    else
      v107 = 0.0;
    v108 = 1.0 - v107;
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, -1.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v109);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 1.0, 1.0, -1.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v110);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 0.0, 0.0, -2.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v111);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 1.0, 2.0, -1.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v112);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 2.0, 1.0, -2.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v113);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 2.0, 2.0, -2.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v114);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 3.0, 0.0, 0.0, -3.0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v115);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 3.0, 1.0, 3.0, -1.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v116);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 3.0, 1.0, -3.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v117);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 3.0, 2.0, 3.0, -2.0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v118);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 2.0, 3.0, 2.0, -3.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v119);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v75);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v120);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v170);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v121);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v168);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v122);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v166);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v123);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v164);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v124);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v162);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v125);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v161);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v126);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v160);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v127);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v100);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v128);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v104);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v129);

    v43 = (void *)MEMORY[0x1E0CB37E8];
    v44 = v108;
LABEL_118:
    objc_msgSend(v43, "numberWithDouble:", v44);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v130);

    v131 = objc_alloc_init(GUBWBilateralConvolution);
    v132 = *MEMORY[0x1E0C9E1F8];
    -[GUBWBilateralConvolution setValue:forKey:](v131, "setValue:forKey:", self->_inputImage, *MEMORY[0x1E0C9E1F8]);
    -[GUBWBilateralConvolution setValue:forKey:](v131, "setValue:forKey:", v33, CFSTR("inputPoints"));
    -[GUBWBilateralConvolution setValue:forKey:](v131, "setValue:forKey:", v34, CFSTR("inputWeights"));
    -[GUBWBilateralConvolution setValue:forKey:](v131, "setValue:forKey:", self->_inputEdgeDetail, CFSTR("inputEdgeDetail"));
    -[GUBWBilateralConvolution valueForKey:](v131, "valueForKey:", *MEMORY[0x1E0C9E298]);
    v32 = (CIImage *)objc_claimAutoreleasedReturnValue();
    -[GUBWBilateralConvolution setValue:forKey:](v131, "setValue:forKey:", 0, v132);

    return v32;
  }
  v7 = 2 * v6 - 1;
  v8 = (double *)malloc_type_calloc(8uLL, v7 * v7, 0xF572C6DCuLL);
  if (!v8)
    goto LABEL_130;
  v9 = v8;
  v10 = 0.0;
  if (1 - v6 < v6)
  {
    v11 = 0;
    v12 = 1 - v6;
    do
    {
      v13 = 2 * v6 - 1;
      v14 = 1 - v6;
      do
      {
        v15 = sqrt((double)v12 / v5 * ((double)v12 / v5) + (double)v14 / v5 * ((double)v14 / v5));
        v16 = 0.0;
        if (v15 < 1.0)
        {
          v16 = -((v15 * -2.0 + 3.0) * v15) * v15 + 1.0;
          v10 = v10 + v16;
        }
        v8[v11] = v16;
        ++v14;
        ++v11;
        --v13;
      }
      while (v13);
      ++v12;
    }
    while (v12 != v6);
  }
  v17 = 0;
  v18 = 0;
  if ((unint64_t)(v7 * v7) <= 1)
    v19 = 1;
  else
    v19 = v7 * v7;
  v20 = 1.0 / v10;
  do
  {
    v21 = v8[v17];
    if (v21 != 0.0)
    {
      ++v18;
      v8[v17] = v20 * v21;
    }
    ++v17;
  }
  while (v19 != v17);
  if (!v18)
  {
    free(v8);
    goto LABEL_120;
  }
  v163 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = 1 - v6;
  if (1 - v6 < v6)
  {
    v24 = 0;
    v25 = 1 - v6;
    v165 = 2 * v6 - 1;
    v167 = v6;
    do
    {
      v26 = v169;
      do
      {
        if (v9[v24] != 0.0)
        {
          objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", (double)v26, (double)v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v27);

          v28 = v9[v24];
          *(float *)&v28 = v28;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        ++v26;
        ++v24;
        --v7;
      }
      while (v7);
      ++v25;
      v7 = v165;
    }
    while (v25 != v167);
  }
  free(v9);
  v30 = objc_alloc_init(GUBilateralConvolution);
  v31 = *MEMORY[0x1E0C9E1F8];
  -[GUBilateralConvolution setValue:forKey:](v30, "setValue:forKey:", v163->_inputImage, *MEMORY[0x1E0C9E1F8]);
  -[GUBilateralConvolution setValue:forKey:](v30, "setValue:forKey:", v22, CFSTR("inputPoints"));
  -[GUBilateralConvolution setValue:forKey:](v30, "setValue:forKey:", v23, CFSTR("inputWeights"));
  -[GUBilateralConvolution setValue:forKey:](v30, "setValue:forKey:", v163->_inputEdgeDetail, CFSTR("inputEdgeDetail"));
  -[GUBilateralConvolution valueForKey:](v30, "valueForKey:", *MEMORY[0x1E0C9E298]);
  v32 = (CIImage *)objc_claimAutoreleasedReturnValue();
  -[GUBilateralConvolution setValue:forKey:](v30, "setValue:forKey:", 0, v31);

  return v32;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputEdgeDetail:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputRadius, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
