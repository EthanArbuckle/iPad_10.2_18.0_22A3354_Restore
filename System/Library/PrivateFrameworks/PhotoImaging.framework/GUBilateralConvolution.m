@implementation GUBilateralConvolution

+ (id)bilateralKernels
{
  if (bilateralKernels_onceToken != -1)
    dispatch_once(&bilateralKernels_onceToken, &__block_literal_global_6034);
  return (id)bilateralKernels_bilateralKernels;
}

+ (id)RGBToLabKernels
{
  if (RGBToLabKernels_onceToken != -1)
    dispatch_once(&RGBToLabKernels_onceToken, &__block_literal_global_6);
  return (id)RGBToLabKernels_RGBToLabKernels;
}

+ (id)bilateralAdd1Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd2Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd3Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd4Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_4"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd5Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_5"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd6Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_6"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd7Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_7"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd8Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_8"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralAdd9Kernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralAdd_9"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bilateralFinalizeKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "bilateralKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bilateralFinalize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)RGBToLabKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "RGBToLabKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("convertFromRGBToLab"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)LabToRGBKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "RGBToLabKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("convertFromLabToRGB"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __41__GUBilateralConvolution_RGBToLabKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", CFSTR("kernel vec4 convertFromRGBToLab(sampler src)\n{\nvec3 f;\nvec4 pix, color;\npix = unpremultiply(sample(src, samplerCoord(src)));\ncolor.xyz = pix.r * vec3(0.449695,  0.316251, 0.18452 )\n+ pix.g * vec3(0.244634,  0.672034, 0.0833318)\n+ pix.b * vec3(0.0251829, 0.141184, 0.922602);\ncolor.xyz *= vec3(1.052111, 1.0, 0.918417);\nf = compare(color.xyz - 0.00885645, 7.787037 * color.xyz + 0.137931, pow(color.xyz, vec3(0.333333)));\ncolor.r = 116.0 * f.y - 16.0;\ncolor.g = 500.0 * (f.x - f.y);\ncolor.b = 200.0 * (f.y - f.z);\ncolor.rgb *= 0.005;\ncolor.a = 1.0;\nreturn color;\n}\nkernel vec4 convertFromLabToRGB(sampler src, sampler original)\n{\nvec3 f, cie;\nvec4 color, pix, opix;\npix = sample(src, samplerCoord(src));\nopix = sample(original, samplerCoord(original));\npix.rgb *= 200.0;\nf.y = (pix.r + 16.0) / 116.0;\nf.x = f.y + pix.g * 0.002;\nf.z = f.y - pix.b * 0.005;\ncolor.xyz = f * f * f;\ncie = compare(color.xyz - 0.00885645, (f.xyz - 0.137931) / 7.787037, color.xyz);\ncie *= vec3(0.95047, 1.0, 1.08883);\ncolor.rgb = cie.x * vec3(2.95176,   -1.28951, -0.47388 )\n+ cie.y * vec3(-1.0851,    1.99084,  0.0372023)\n+ cie.z * vec3(0.0854804, -0.269456, 1.09113 );\ncolor.a = opix.a;\nreturn premultiply(color);\n}\n\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RGBToLabKernels_RGBToLabKernels;
  RGBToLabKernels_RGBToLabKernels = v0;

}

void __42__GUBilateralConvolution_bilateralKernels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DDD0], "kernelsDictionaryWithString:", &cfstr_FloatLuminance);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bilateralKernels_bilateralKernels;
  bilateralKernels_bilateralKernels = v0;

}

- (unint64_t)samplesPerPass
{
  return 6;
}

- (CGRect)boundsForPointArray:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  const void **v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  CGRect result;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    NUAssertLogger_6085();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "points.count > 0");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v25 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6085();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific(*v25);
        v32 = (void *)MEMORY[0x1E0CB3978];
        v33 = v31;
        objc_msgSend(v32, "callStackSymbols");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v31;
        v38 = 2114;
        v39 = v35;
        _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v30;
      _os_log_error_impl(&dword_1A6382000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "X");
  v7 = v6;
  objc_msgSend(v5, "Y");
  v9 = v8;
  if (v4 >= 2)
  {
    v10 = 1;
    v11 = v8;
    v12 = v7;
    while (1)
    {
      v13 = v5;
      objc_msgSend(v3, "objectAtIndex:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "X");
      v15 = v14;
      objc_msgSend(v5, "Y");
      v17 = v16;
      v18 = v15 > v7 ? v15 : v7;
      if (v15 >= v12)
        v7 = v18;
      else
        v12 = v15;
      if (v17 < v11)
        break;
      if (v17 <= v9)
        goto LABEL_13;
LABEL_14:
      ++v10;
      v9 = v17;
      if (v4 == v10)
        goto LABEL_17;
    }
    v11 = v17;
LABEL_13:
    v17 = v9;
    goto LABEL_14;
  }
  v12 = v7;
  v11 = v8;
  v17 = v8;
LABEL_17:

  v19 = v7 - v12;
  v20 = v17 - v11;
  v21 = v12;
  v22 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)enlargedBounds:(CGRect)a3 withPoints:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[GUBilateralConvolution boundsForPointArray:](self, "boundsForPointArray:", a4);
  v9 = x + v8;
  v11 = y + v10;
  v13 = width + v12;
  v15 = height + v14;
  result.size.height = v15;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (CGRect)bilateralAddROI:(int64_t)a3 destRect:(CGRect)result userInfo:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  if (!a3)
    -[GUBilateralConvolution enlargedBounds:withPoints:](self, "enlargedBounds:withPoints:", a5, result.origin.x, result.origin.y, result.size.width, result.size.height, v5, v6);
  return result;
}

- (id)doBilateralPass:(id)a3 points:(id)a4 weights:(id)a5 sums:(id)a6 slope:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  double v35;
  id v36;
  void *v37;
  float v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  float v46;
  double v47;
  void *v48;
  float v49;
  double v50;
  void *v51;
  float v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  double v58;
  void *v59;
  float v60;
  double v61;
  void *v62;
  float v63;
  double v64;
  void *v65;
  float v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  float v72;
  double v73;
  void *v74;
  float v75;
  double v76;
  void *v77;
  float v78;
  double v79;
  void *v80;
  float v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  float v86;
  double v87;
  float v88;
  double v89;
  float v90;
  double v91;
  void *v92;
  float v93;
  void *v94;
  void *v95;
  void *v96;
  float v97;
  double v98;
  void *v99;
  float v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  float v105;
  double v106;
  float v107;
  double v108;
  float v109;
  double v110;
  float v111;
  void *v112;
  void *v113;
  void *v114;
  float v115;
  double v116;
  id v117;
  void *v118;
  float v119;
  double v120;
  void *v121;
  float v122;
  void *v123;
  void *v124;
  void *v125;
  float v126;
  double v127;
  float v128;
  double v129;
  float v130;
  double v131;
  float v132;
  void *v133;
  void *v134;
  void *v135;
  float v136;
  double v137;
  void *v138;
  float v139;
  double v140;
  void *v141;
  float v142;
  double v143;
  void *v144;
  float v145;
  void *v146;
  void *v147;
  void *v148;
  float v149;
  double v150;
  float v151;
  double v152;
  float v153;
  double v154;
  float v155;
  void *v156;
  float v157;
  double v158;
  void *v159;
  float v160;
  double v161;
  void *v162;
  float v163;
  double v164;
  id v165;
  void *v166;
  float v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  id v226;
  id v227;
  id v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  id v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  void *v250;
  id v251;
  void *v252;
  _QWORD v253[5];
  id v254;
  _QWORD v255[16];
  _QWORD v256[14];
  _QWORD v257[13];
  _QWORD v258[12];
  _QWORD v259[11];
  _QWORD v260[9];
  _QWORD v261[8];
  _QWORD v262[7];
  _QWORD v263[8];

  v263[6] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1E0C9DDC0];
  objc_msgSend(v12, "extent");
  -[GUBilateralConvolution enlargedBounds:withPoints:](self, "enlargedBounds:withPoints:", v13);
  objc_msgSend(v17, "shapeWithRect:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v13, "count");
  if (v15)
  {
    v20 = v15;
    objc_msgSend(v20, "definition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unionWith:", v21);
    v251 = (id)objc_claimAutoreleasedReturnValue();

    v22 = 1.0;
  }
  else
  {
    v20 = v12;
    v251 = v18;
    v22 = 0.0;
  }
  v253[0] = MEMORY[0x1E0C809B0];
  v253[1] = 3221225472;
  v253[2] = __68__GUBilateralConvolution_doBilateralPass_points_weights_sums_slope___block_invoke;
  v253[3] = &unk_1E5016678;
  v253[4] = self;
  v23 = v13;
  v254 = v23;
  v252 = (void *)MEMORY[0x1A85C0174](v253);
  v249 = v20;
  v250 = v18;
  switch(v19)
  {
    case 1:
      v263[0] = v12;
      v263[1] = v20;
      v263[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v263[3] = v24;
      objc_msgSend(v14, "objectAtIndex:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v263[4] = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v263[5] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v263, 6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "bilateralAdd1Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      v262[0] = v12;
      v262[1] = v20;
      v262[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v262[3] = v233;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v262[4] = v31;
      v32 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v241 = v12;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      v35 = v34;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v36 = v15;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      objc_msgSend(v32, "vectorWithX:Y:", v35, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v262[5] = v39;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v40 = v16;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v262[6] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v262, 7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v40;
      v15 = v36;

      v12 = v241;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd2Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      v261[0] = v12;
      v261[1] = v20;
      v261[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v261[3] = v219;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v261[4] = v42;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v242 = v12;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v261[5] = v43;
      v44 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v226 = v15;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "floatValue");
      v47 = v46;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v234 = v16;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "floatValue");
      v50 = v49;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      objc_msgSend(v44, "vectorWithX:Y:Z:", v47, v50, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v261[6] = v53;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v261[7] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v261, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v234;
      v15 = v226;

      v12 = v242;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd3Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4:
      v260[0] = v12;
      v260[1] = v20;
      v260[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      v260[3] = v235;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v260[4] = v220;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v260[5] = v213;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v260[6] = v207;
      v55 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v243 = v12;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "floatValue");
      v58 = v57;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      v61 = v60;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v227 = v15;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "floatValue");
      v64 = v63;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "floatValue");
      objc_msgSend(v55, "vectorWithX:Y:Z:W:", v58, v61, v64, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v260[7] = v67;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v68 = v16;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v260[8] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v260, 9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v68;
      v15 = v227;

      v12 = v243;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd4Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 5:
      v259[0] = v12;
      v259[1] = v20;
      v259[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v259[3] = v221;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v259[4] = v214;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v259[5] = v208;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      v259[6] = v202;
      objc_msgSend(v23, "objectAtIndex:", 4);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v259[7] = v197;
      v70 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v244 = v12;
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "floatValue");
      v73 = v72;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v228 = v15;
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "floatValue");
      v76 = v75;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v236 = v16;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "floatValue");
      v79 = v78;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "floatValue");
      objc_msgSend(v70, "vectorWithX:Y:Z:W:", v73, v76, v79, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v259[8] = v82;
      objc_msgSend(v14, "objectAtIndex:", 4);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v259[9] = v83;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v259[10] = v84;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v259, 11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v236;
      v15 = v228;

      v12 = v244;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd5Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 6:
      v258[0] = v12;
      v258[1] = v20;
      v258[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      v258[3] = v229;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      v258[4] = v222;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v258[5] = v215;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v258[6] = v209;
      objc_msgSend(v23, "objectAtIndex:", 4);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v258[7] = v203;
      objc_msgSend(v23, "objectAtIndex:", 5);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v258[8] = v198;
      v85 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "floatValue");
      v87 = v86;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "floatValue");
      v89 = v88;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "floatValue");
      v91 = v90;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v245 = v12;
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "floatValue");
      objc_msgSend(v85, "vectorWithX:Y:Z:W:", v87, v89, v91, v93);
      v237 = v16;
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v258[9] = v94;
      v95 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 4);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "floatValue");
      v98 = v97;
      objc_msgSend(v14, "objectAtIndex:", 5);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "floatValue");
      objc_msgSend(v95, "vectorWithX:Y:", v98, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v258[10] = v101;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v102 = v15;
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v258[11] = v103;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v258, 12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v102;
      v16 = v237;

      v12 = v245;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd6Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 7:
      v257[0] = v12;
      v257[1] = v20;
      v257[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      v257[3] = v230;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v257[4] = v223;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v257[5] = v216;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v257[6] = v210;
      objc_msgSend(v23, "objectAtIndex:", 4);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v257[7] = v204;
      objc_msgSend(v23, "objectAtIndex:", 5);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v257[8] = v199;
      objc_msgSend(v23, "objectAtIndex:", 6);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v257[9] = v194;
      v104 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "floatValue");
      v106 = v105;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "floatValue");
      v108 = v107;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "floatValue");
      v110 = v109;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "floatValue");
      objc_msgSend(v104, "vectorWithX:Y:Z:W:", v106, v108, v110, v111);
      v246 = v12;
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v257[10] = v112;
      v113 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 4);
      v238 = v16;
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "floatValue");
      v116 = v115;
      objc_msgSend(v14, "objectAtIndex:", 5);
      v117 = v15;
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "floatValue");
      v120 = v119;
      objc_msgSend(v14, "objectAtIndex:", 6);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "floatValue");
      objc_msgSend(v113, "vectorWithX:Y:Z:", v116, v120, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v257[11] = v123;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v257[12] = v124;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v257, 13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v117;
      v16 = v238;

      v12 = v246;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd7Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 8:
      v256[0] = v12;
      v256[1] = v20;
      v256[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v256[3] = v224;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      v256[4] = v217;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v256[5] = v211;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v256[6] = v205;
      objc_msgSend(v23, "objectAtIndex:", 4);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v256[7] = v200;
      objc_msgSend(v23, "objectAtIndex:", 5);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v256[8] = v195;
      objc_msgSend(v23, "objectAtIndex:", 6);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v256[9] = v191;
      objc_msgSend(v23, "objectAtIndex:", 7);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v256[10] = v187;
      v125 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "floatValue");
      v127 = v126;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "floatValue");
      v129 = v128;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "floatValue");
      v131 = v130;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "floatValue");
      objc_msgSend(v125, "vectorWithX:Y:Z:W:", v127, v129, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v256[11] = v133;
      v134 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 4);
      v247 = v12;
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "floatValue");
      v137 = v136;
      objc_msgSend(v14, "objectAtIndex:", 5);
      v239 = v16;
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "floatValue");
      v140 = v139;
      objc_msgSend(v14, "objectAtIndex:", 6);
      v231 = v15;
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "floatValue");
      v143 = v142;
      objc_msgSend(v14, "objectAtIndex:", 7);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "floatValue");
      objc_msgSend(v134, "vectorWithX:Y:Z:W:", v137, v140, v143, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v256[12] = v146;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v256[13] = v147;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v256, 14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v231;
      v16 = v239;

      v12 = v247;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd8Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 9:
      v255[0] = v12;
      v255[1] = v20;
      v255[2] = v16;
      objc_msgSend(v23, "objectAtIndex:", 0);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v255[3] = v232;
      objc_msgSend(v23, "objectAtIndex:", 1);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v255[4] = v225;
      objc_msgSend(v23, "objectAtIndex:", 2);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      v255[5] = v218;
      objc_msgSend(v23, "objectAtIndex:", 3);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v255[6] = v212;
      objc_msgSend(v23, "objectAtIndex:", 4);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v255[7] = v206;
      objc_msgSend(v23, "objectAtIndex:", 5);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v255[8] = v201;
      objc_msgSend(v23, "objectAtIndex:", 6);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v255[9] = v196;
      objc_msgSend(v23, "objectAtIndex:", 7);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v255[10] = v192;
      objc_msgSend(v23, "objectAtIndex:", 8);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v255[11] = v188;
      v148 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 0);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "floatValue");
      v150 = v149;
      objc_msgSend(v14, "objectAtIndex:", 1);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "floatValue");
      v152 = v151;
      objc_msgSend(v14, "objectAtIndex:", 2);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "floatValue");
      v154 = v153;
      objc_msgSend(v14, "objectAtIndex:", 3);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "floatValue");
      objc_msgSend(v148, "vectorWithX:Y:Z:W:", v150, v152, v154, v155);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v255[12] = v174;
      v156 = (void *)MEMORY[0x1E0C9DDF8];
      objc_msgSend(v14, "objectAtIndex:", 4);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "floatValue");
      v158 = v157;
      objc_msgSend(v14, "objectAtIndex:", 5);
      v248 = v12;
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "floatValue");
      v161 = v160;
      objc_msgSend(v14, "objectAtIndex:", 6);
      v240 = v16;
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "floatValue");
      v164 = v163;
      objc_msgSend(v14, "objectAtIndex:", 7);
      v165 = v15;
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "floatValue");
      objc_msgSend(v156, "vectorWithX:Y:Z:W:", v158, v161, v164, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v255[13] = v168;
      objc_msgSend(v14, "objectAtIndex:", 9);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v255[14] = v169;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v255[15] = v170;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v255, 16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v165;
      v16 = v240;

      v12 = v248;
      objc_msgSend((id)objc_opt_class(), "bilateralAdd9Kernel");
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v171 = (void *)v28;
      v30 = v251;
      objc_msgSend(v251, "extent");
      objc_msgSend(v171, "applyWithExtent:roiCallback:arguments:", v252, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v249;
      v18 = v250;
      break;
    default:
      v27 = 0;
      v29 = 0;
      v30 = v251;
      break;
  }

  return v29;
}

- (id)outputImage
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  BOOL v6;
  id v7;
  float v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  NSUInteger v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];
  void *v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v3 = -[GUBilateralConvolution samplesPerPass](self, "samplesPerPass");
  v4 = -[NSArray count](self->_inputPoints, "count");
  v5 = -[NSArray count](self->_inputWeights, "count");
  if (v4)
    v6 = v5 == v4;
  else
    v6 = 0;
  if (v6)
  {
    -[NSNumber floatValue](self->_inputEdgeDetail, "floatValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", __exp10(v8 + -3.0) * -200.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:options:", self->_inputImage, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "RGBToLabKernel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CIImage extent](self->_inputImage, "extent");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v56 = (void *)v9;
    v61[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applyWithExtent:arguments:", v19, v12, v14, v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:options:", v20, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v23 = v4;
    v24 = v4;
    do
    {
      v25 = v24 - v3;
      if (v24 >= v3)
        v26 = v3;
      else
        v26 = v24;
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:options:", v20, 0);
        v27 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v27;
      }
      -[NSArray subarrayWithRange:](self->_inputPoints, "subarrayWithRange:", v21, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray subarrayWithRange:](self->_inputWeights, "subarrayWithRange:", v21, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[GUBilateralConvolution doBilateralPass:points:weights:sums:slope:](self, "doBilateralPass:points:weights:sums:slope:", v57, v28, v29, v22, v58);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v21 += v3;
      v24 = v25;
      v20 = v30;
    }
    while (v21 < v23);
    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:options:", v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "bilateralFinalizeKernel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "extent");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v60 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "applyWithExtent:arguments:", v41, v34, v36, v38, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DDF0], "samplerWithImage:options:", v42, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "LabToRGBKernel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "extent");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v59[0] = v43;
    v59[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "applyWithExtent:arguments:", v53, v46, v48, v50, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v54;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)inputPoints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)inputWeights
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputEdgeDetail:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_inputPoints, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

uint64_t __68__GUBilateralConvolution_doBilateralPass_points_weights_sums_slope___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bilateralAddROI:destRect:userInfo:", a2, *(_QWORD *)(a1 + 40));
}

@end
