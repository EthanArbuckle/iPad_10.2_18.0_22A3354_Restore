@implementation UniHighlightRecovery

- (UniHighlightRecovery)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UniHighlightRecovery;
  return -[UniKernel init](&v3, sel_init);
}

- (UniHighlightRecovery)initWithDevice:(id)a3
{
  id v4;
  UniHighlightRecovery *v5;
  const char *v6;
  UniHighlightRecovery *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UniHighlightRecovery;
  v5 = -[UniKernel init](&v9, sel_init);
  v7 = v5;
  if (v5)
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);

  return v7;
}

- (UniHighlightRecovery)initWithDevice:(id)a3 library:(id)a4 constants:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  UniHighlightRecovery *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v12 = (UniHighlightRecovery *)objc_msgSend_initWithDevice_(self, v10, (uint64_t)a3);
  if (v12)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("SparseRenderer::kXhlrbTileSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_intValue(v13, v14, v15);
    objc_msgSend_setHlrTileSize_(v12, v17, v16);

    v48 = CFSTR("SparseRenderer::kXhlrbTileSize");
    objc_msgSend_objectForKeyedSubscript_(v9, v18, (uint64_t)CFSTR("SparseRenderer::kXhlrbTileSize"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)v49, &v48, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v22, (uint64_t)CFSTR("sparserendering_xhlrb_scan"), v8, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mk(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrScanKernel_(v12, v27, (uint64_t)v26);

    objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v28, (uint64_t)CFSTR("sparserendering_xhlrb_diffuse"), v8, v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mk(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrDiffuseKernel_(v12, v33, (uint64_t)v32);

    objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v34, (uint64_t)CFSTR("sparserendering_xhlrb_copy_back"), v8, v21);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mk(v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrCopyBackKernel_(v12, v39, (uint64_t)v38);

    objc_msgSend_findComputeKernel_library_constants_(UniDeviceCache, v40, (uint64_t)CFSTR("plain_or_sRGB_copy"), v8, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mk(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrCopyKernel_(v12, v45, (uint64_t)v44);

    objc_msgSend_setHlrConstants_(v12, v46, (uint64_t)v9);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)UniHighlightRecovery;
  v6 = -[UniKernel copyWithZone:](&v30, sel_copyWithZone_, a3);
  if (v6)
  {
    objc_msgSend_hlrScanKernel(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrScanKernel_(v6, v8, (uint64_t)v7);

    objc_msgSend_hlrDiffuseKernel(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrDiffuseKernel_(v6, v12, (uint64_t)v11);

    objc_msgSend_hlrCopyKernel(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrCopyKernel_(v6, v16, (uint64_t)v15);

    objc_msgSend_hlrCopyBackKernel(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrCopyBackKernel_(v6, v20, (uint64_t)v19);

    v23 = objc_msgSend_hlrTileSize(self, v21, v22);
    objc_msgSend_setHlrTileSize_(v6, v24, v23);
    objc_msgSend_hlrConstants(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHlrConstants_(v6, v28, (uint64_t)v27);

  }
  return v6;
}

+ (id)processList:(id)a3 tileSize:(int)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;

  v5 = a3;
  v8 = objc_msgSend_width(v5, v6, v7);
  v11 = 2 * (v8 + a4 - 1) / (unint64_t)a4 * ((objc_msgSend_height(v5, v9, v10) + a4 - 1) / (unint64_t)a4)
      + 4;
  v12 = 4 * v11;
  v13 = malloc_type_calloc(v11, 4uLL, 0x100004052888210uLL);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v14, (uint64_t)v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  free(v13);
  objc_msgSend_device(v5, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_bufferFromData_device_(UniDeviceCache, v19, (uint64_t)v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v20, v21, (uint64_t)CFSTR("XHLRB ProcList"));
  return v20;
}

- (id)inputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF960];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)outputNameArray
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDBF9C8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)runHighlightRecoveryWithInputTexture:(id)a3 outputTexture:(id)a4 temporaryTexture:(id)a5 dynamicParams:(id)a6 iterations:(int)a7 tileSize:(int)a8 scanKernel:(id)a9 diffuseKernel:(id)a10 copyBackKernel:(id)a11 copyKernel:(id)a12 commandBuffer:(id)a13 constants:(id)a14 forCoreImage:(BOOL)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  float v73;
  const char *v74;
  uint64_t v75;
  float v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  float v80;
  const char *v81;
  uint64_t v82;
  unsigned int v83;
  unint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  void *v128;
  unint64_t v129;
  const char *v130;
  uint64_t v131;
  unint64_t v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  unint64_t v144;
  const char *v145;
  uint64_t v146;
  unint64_t v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  void *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  unint64_t v162;
  const char *v163;
  uint64_t v164;
  unint64_t v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  void *v172;
  void *v173;
  void *v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  int v180;
  id v181;
  id v182;
  id v183;
  id v184;
  _QWORD v185[3];
  _QWORD v186[3];
  _QWORD v187[3];
  _QWORD v188[3];
  _QWORD v189[3];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[3];
  _QWORD v193[3];
  unint64_t v194;
  unint64_t v195;
  uint64_t v196;
  _BYTE v197[22];
  char v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  char v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  _QWORD v208[3];
  _QWORD v209[3];
  _QWORD v210[5];

  v178 = a3;
  v19 = a4;
  v20 = a5;
  v181 = a6;
  v183 = a9;
  v184 = a10;
  v21 = a11;
  v22 = a12;
  v182 = a13;
  v23 = a14;
  v24 = v178;
  v25 = v19;
  v26 = v24;
  v27 = v25;
  objc_msgSend_device(v26, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend_supportsNonUniformThreadgroupSize(v30, v31, v32);

  v35 = v26;
  if (a15)
  {
    objc_msgSend_blitCommandEncoder(v182, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLabel_(v182, v37, (uint64_t)CFSTR("XHLRBComputeBlit"));
    if (!v20)
      sub_24B6F1704();
    v40 = objc_msgSend_width(v26, v38, v39);
    if (v40 > objc_msgSend_width(v20, v41, v42))
      sub_24B6F172C();
    v45 = objc_msgSend_height(v26, v43, v44);
    if (v45 > objc_msgSend_height(v20, v46, v47))
      sub_24B6F1754();
    v50 = objc_msgSend_pixelFormat(v26, v48, v49);
    if (v50 != objc_msgSend_pixelFormat(v20, v51, v52))
      sub_24B6F17F4();
    memset(v210, 0, 24);
    v209[0] = objc_msgSend_width(v26, v53, v54);
    v209[1] = objc_msgSend_height(v26, v55, v56);
    v209[2] = 1;
    memset(v208, 0, sizeof(v208));
    objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v36, v57, (uint64_t)v26, 0, 0, v210, v209, v20, 0, 0, v208);
    objc_msgSend_endEncoding(v36, v58, v59);
    v60 = v20;

    v35 = v60;
  }
  v177 = v20;
  v207 = 0;
  v206 = 0u;
  v205 = 0u;
  v204 = 0u;
  objc_msgSend_device(v35, v33, v34);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelFormat(v35, v62, v63);
  MTLPixelFormatGetInfoForDevice();

  v203 = 0;
  v202 = 0;
  v201 = 0u;
  v200 = 0u;
  v199 = 0u;
  objc_msgSend_device(v27, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelFormat(v27, v67, v68);
  MTLPixelFormatGetInfoForDevice();

  v173 = v23;
  v179 = v22;
  v198 = 0;
  objc_msgSend_processList_tileSize_(UniHighlightRecovery, v69, (uint64_t)v26, a8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (float)(unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(v183, v71, v72);
  v76 = (float)(unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(v184, v74, v75);
  v172 = v21;
  v79 = objc_msgSend_maxTotalThreadsPerThreadgroup(v21, v77, v78);
  v80 = log2f(fminf(v73, fminf(v76, (float)(unint64_t)v79)));
  v83 = exp2f(floorf(v80)) / a8;
  if (v83 >= a8 >> 1)
    v84 = a8 >> 1;
  else
    v84 = v83;
  v85 = objc_msgSend_width(v26, v81, v82);
  v176 = v26;
  v88 = objc_msgSend_height(v26, v86, v87);
  memset(v197, 0, sizeof(v197));
  if (objc_msgSend_length(v181, v89, v90) != 22)
    sub_24B6F177C();
  v92 = a8;
  v93 = a8 - 1;
  v94 = (v93 + v88) / (unint64_t)a8;
  v95 = (v93 + v85) / (unint64_t)a8;
  objc_msgSend_getBytes_length_(v181, v91, (uint64_t)v197, 22);
  objc_msgSend_blitCommandEncoder(v182, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v98, v99, (uint64_t)CFSTR("SR XHLRB Init"));
  v102 = objc_msgSend_length(v70, v100, v101);
  objc_msgSend_fillBuffer_range_value_(v98, v103, (uint64_t)v70, 0, v102, 0);
  v175 = v98;
  objc_msgSend_endEncoding(v98, v104, v105);
  objc_msgSend_computeCommandEncoder(v182, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v108, v109, (uint64_t)CFSTR("SS XHLRB Compute"));
  objc_msgSend_setComputePipelineState_(v108, v110, (uint64_t)v183);
  objc_msgSend_setBytes_length_atIndex_(v108, v111, (uint64_t)v197, 22, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v108, v112, (uint64_t)v70, 0, 1);
  objc_msgSend_setTexture_atIndex_(v108, v113, (uint64_t)v35, 0);
  v194 = v95;
  v195 = v94;
  v196 = 1;
  v193[0] = v84;
  v193[1] = v92;
  v193[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v114, (uint64_t)&v194, v193);
  LOBYTE(v193[0]) = 0;
  objc_msgSend_setBytes_length_atIndex_(v108, v115, (uint64_t)v193, 1, 30);
  if (a7 >= 1)
  {
    do
    {
      objc_msgSend_setComputePipelineState_(v108, v116, (uint64_t)v184);
      objc_msgSend_setBytes_length_atIndex_(v108, v118, (uint64_t)v197, 22, 0);
      objc_msgSend_setBuffer_offset_atIndex_(v108, v119, (uint64_t)v70, 0, 1);
      objc_msgSend_setTexture_atIndex_(v108, v120, (uint64_t)v35, 0);
      objc_msgSend_setTexture_atIndex_(v108, v121, (uint64_t)v27, 1);
      v194 = v84;
      v195 = v92;
      v196 = 1;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v108, v122, (uint64_t)v70, 0, &v194);
      objc_msgSend_setComputePipelineState_(v108, v123, (uint64_t)v172);
      objc_msgSend_setBuffer_offset_atIndex_(v108, v124, (uint64_t)v70, 0, 0);
      objc_msgSend_setTexture_atIndex_(v108, v125, (uint64_t)v27, 0);
      objc_msgSend_setTexture_atIndex_(v108, v126, (uint64_t)v35, 1);
      v194 = v84;
      v195 = v92;
      v196 = 1;
      objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v108, v127, (uint64_t)v70, 0, &v194);
      --a7;
    }
    while (a7);
  }
  v128 = v179;
  v129 = objc_msgSend_threadExecutionWidth(v179, v116, v117);
  v132 = objc_msgSend_maxTotalThreadsPerThreadgroup(v179, v130, v131) / v129;
  objc_msgSend_setComputePipelineState_(v108, v133, (uint64_t)v179);
  objc_msgSend_setTexture_atIndex_(v108, v134, (uint64_t)v35, 0);
  objc_msgSend_setTexture_atIndex_(v108, v135, (uint64_t)v27, 1);
  objc_msgSend_setBytes_length_atIndex_(v108, v136, (uint64_t)&v198, 1, 0);
  if ((v180 & 1) != 0)
  {
    v192[0] = objc_msgSend_width(v35, v137, v138);
    v192[1] = objc_msgSend_height(v35, v139, v140);
    v192[2] = 1;
    v191[0] = v129;
    v191[1] = v132;
    v191[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v108, v141, (uint64_t)v192, v191);
  }
  else
  {
    v144 = objc_msgSend_threadExecutionWidth(v179, v137, v138);
    v147 = objc_msgSend_maxTotalThreadsPerThreadgroup(v179, v145, v146) / v144;
    v190[0] = (v144 + objc_msgSend_width(v35, v148, v149) - 1) / v144;
    v190[1] = (v147 + objc_msgSend_height(v35, v150, v151) - 1) / v147;
    v128 = v179;
    v190[2] = 1;
    v189[0] = v144;
    v189[1] = v147;
    v189[2] = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v152, (uint64_t)v190, v189);
  }
  v154 = v176;
  v153 = v177;
  if (!a15)
  {
    objc_msgSend_setTexture_atIndex_(v108, v142, (uint64_t)v27, 0);
    objc_msgSend_setTexture_atIndex_(v108, v155, (uint64_t)v35, 1);
    LOBYTE(v193[0]) = 0;
    objc_msgSend_setBytes_length_atIndex_(v108, v156, (uint64_t)v193, 1, 0);
    if (v180)
    {
      v188[0] = objc_msgSend_width(v35, v157, v158);
      v188[1] = objc_msgSend_height(v35, v159, v160);
      v154 = v176;
      v188[2] = 1;
      v187[0] = v129;
      v187[1] = v132;
      v187[2] = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v108, v161, (uint64_t)v188, v187);
    }
    else
    {
      v162 = objc_msgSend_threadExecutionWidth(v128, v157, v158);
      v165 = objc_msgSend_maxTotalThreadsPerThreadgroup(v128, v163, v164) / v162;
      v186[0] = (v162 + objc_msgSend_width(v35, v166, v167) - 1) / v162;
      v186[1] = (v165 + objc_msgSend_height(v35, v168, v169) - 1) / v165;
      v153 = v177;
      v186[2] = 1;
      v185[0] = v162;
      v185[1] = v165;
      v185[2] = 1;
      objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v108, v170, (uint64_t)v186, v185);
    }
  }
  objc_msgSend_endEncoding(v108, v142, v143);

  return 1;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  void *v57;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[3];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v65 = v4;
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    objc_msgSend_device(self, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend_newCommandQueue(v10, v11, v12);

  }
  v63 = v9;
  objc_msgSend_inputs(self, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x24BDBF960]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v16, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v20, v21, *MEMORY[0x24BDBF9C8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_commandBuffer(v9, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v27, v28, (uint64_t)CFSTR("SR XHLRB"));
  objc_msgSend_inputs(self, v29, v30);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v64, v31, (uint64_t)CFSTR("dynamic_params"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(self, v32, v33);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v62, v34, (uint64_t)CFSTR("inputIterations"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_intValue(v61, v35, v36);
  v39 = objc_msgSend_hlrTileSize(self, v37, v38);
  objc_msgSend_hlrScanKernel(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hlrDiffuseKernel(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hlrCopyBackKernel(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hlrCopyKernel(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hlrConstants(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_runHighlightRecoveryWithInputTexture_outputTexture_temporaryTexture_dynamicParams_iterations_tileSize_scanKernel_diffuseKernel_copyBackKernel_copyKernel_commandBuffer_constants_forCoreImage_(UniHighlightRecovery, v55, (uint64_t)v17, v24, 0, v60, v59, v39, v42, v45, v48, v51, v27, v54, 0);

  v66[0] = v27;
  v66[1] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v56, (uint64_t)v66, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

+ (id)generateCIImage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[9];
  _QWORD v71[11];

  v71[9] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_inputs(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x24BDBF960]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v3, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_extent(v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend_imageByClampingToExtent(v10, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v70[0] = CFSTR("inputScale");
    objc_msgSend_inputs(v3, v24, v25);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v69, v26, *MEMORY[0x24BDBF988]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v68;
    v70[1] = CFSTR("inputIterations");
    objc_msgSend_inputs(v3, v27, v28);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v67, v29, (uint64_t)CFSTR("inputIterations"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v66;
    v70[2] = CFSTR("inputDynamicParams");
    objc_msgSend_inputs(v3, v30, v31);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v65, v32, (uint64_t)CFSTR("dynamic_params"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v64;
    v70[3] = CFSTR("inputTileSize");
    v33 = (void *)MEMORY[0x24BDD16E0];
    v36 = objc_msgSend_hlrTileSize(v3, v34, v35);
    objc_msgSend_numberWithInt_(v33, v37, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v38;
    v70[4] = CFSTR("inputScanKernel");
    objc_msgSend_hlrScanKernel(v3, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71[4] = v41;
    v70[5] = CFSTR("inputDiffuseKernel");
    objc_msgSend_hlrDiffuseKernel(v3, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v71[5] = v44;
    v70[6] = CFSTR("inputCopyBackKernel");
    objc_msgSend_hlrCopyBackKernel(v3, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v71[6] = v47;
    v70[7] = CFSTR("inputCopyKernel");
    objc_msgSend_hlrCopyKernel(v3, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71[7] = v50;
    v70[8] = CFSTR("inputConstants");
    objc_msgSend_hlrConstants(v3, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v71[8] = v53;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v54, (uint64_t)v71, v70, 9);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v23;
    objc_msgSend_imageByApplyingFilter_withInputParameters_(v23, v56, (uint64_t)CFSTR("SDOFHighlightRecovery"), v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByCroppingToRect_(v57, v58, v59, v14, v16, v18, v20);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
      sub_24B6F181C();
    objc_msgSend_imageWithCIImage_(UniImage, v61, (uint64_t)v60);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)outputImage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  UniImage *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  v8 = (void *)objc_opt_class();
  objc_msgSend_generateCIImage_(v8, v9, (uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = v10;
    objc_msgSend_setKernel_(v10, v11, (uint64_t)v7);
  }
  else
  {
    v15 = [UniImage alloc];
    v12 = (void *)objc_msgSend_initWithKernel_(v15, v16, (uint64_t)v7);
  }
  objc_msgSend_inputs(v7, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, *MEMORY[0x24BDBF9C8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v12, v20, (uint64_t)v19);

  objc_msgSend_texture(v12, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
    sub_24B6F1844();

  return v12;
}

- (id)_identifyGPU:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __CFString *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;

  v3 = a3;
  objc_msgSend_name(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_containsString_(v6, v7, (uint64_t)CFSTR("Apple")))
  {
    v15 = &stru_251C92910;
LABEL_14:

    goto LABEL_15;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend_architecture(v3, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, (uint64_t)CFSTR("applegpu_"), &stru_251C92910);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revision(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsString_(v18, v19, (uint64_t)CFSTR("A")) & 1) != 0)
    {
      v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, (uint64_t)CFSTR("g16p")))
    {
      objc_msgSend_revision(v6, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_containsString_(v24, v25, (uint64_t)CFSTR("B0")) ^ 1;

    }
    else
    {
      v21 = 1;
    }

    v27 = objc_msgSend_containsString_(v15, v26, (uint64_t)CFSTR("g17p"));
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_revision(v6, v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v30, v35, (uint64_t)CFSTR("%@_%@"), v15, v34);
      v36 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v36;
    }

    goto LABEL_14;
  }
  v15 = &stru_251C92910;
LABEL_15:

  return v15;
}

- (MTLComputePipelineState)hlrScanKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHlrScanKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MTLComputePipelineState)hlrDiffuseKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHlrDiffuseKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MTLComputePipelineState)hlrCopyBackKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHlrCopyBackKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (MTLComputePipelineState)hlrCopyKernel
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHlrCopyKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (int)hlrTileSize
{
  return self->hlrTileSize;
}

- (void)setHlrTileSize:(int)a3
{
  self->hlrTileSize = a3;
}

- (NSDictionary)hlrConstants
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHlrConstants:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hlrConstants, 0);
  objc_storeStrong((id *)&self->hlrCopyKernel, 0);
  objc_storeStrong((id *)&self->hlrCopyBackKernel, 0);
  objc_storeStrong((id *)&self->hlrDiffuseKernel, 0);
  objc_storeStrong((id *)&self->hlrScanKernel, 0);
}

@end
