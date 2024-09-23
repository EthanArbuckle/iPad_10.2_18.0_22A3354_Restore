@implementation UniGuidedFilter

- (UniGuidedFilter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UniGuidedFilter;
  return -[UniKernel init](&v3, sel_init);
}

- (UniGuidedFilter)initWithDevice:(id)a3
{
  id v4;
  UniGuidedFilter *v5;
  const char *v6;
  uint64_t *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  UniGuidedFilter *v13;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)UniGuidedFilter;
  v5 = -[UniKernel init](&v53, sel_init);
  v7 = (uint64_t *)v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend_setDevice_(v5, v6, (uint64_t)v4);
  if (qword_2544D9D00 != -1)
    dispatch_once(&qword_2544D9D00, &unk_251C8FA20);
  v8 = (void *)v7[9];
  v7[9] = 0;

  v9 = (id)qword_2544D9CD8;
  objc_sync_enter(v9);
  objc_msgSend_objectForKey_((void *)qword_2544D9CD8, v10, (uint64_t)v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v7[9];
  v7[9] = v11;

  objc_sync_exit(v9);
  if (v7[9])
    goto LABEL_5;
  v15 = (void *)MEMORY[0x24BDD1488];
  v16 = objc_opt_class();
  objc_msgSend_bundleForClass_(v15, v17, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    uni_logger_api();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_24B6F11EC((uint64_t)v7, v43);

    goto LABEL_21;
  }
  v20 = (void *)v18;
  v52 = 0;
  v21 = (void *)objc_msgSend_newDefaultLibraryWithBundle_error_(v4, v19, v18, &v52);
  v22 = v52;
  objc_msgSend_resourcePath(v20, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__identifyGPU_(v7, v26, (uint64_t)v4);
  v48 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, (uint64_t)CFSTR("%@/%@"), v25, v48);
  v51 = v22;
  v47 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend_newPipelineLibraryWithFilePath_error_(v4, v28, v47, &v51);
  v29 = v51;

  if (v21)
  {
    v46 = v25;
    v31 = objc_msgSend_newFunctionWithName_(v21, v30, (uint64_t)CFSTR("_combineRGBAndAlpha"));
    if (!v31)
      sub_24B6F139C();
    v32 = v31;
    v33 = (void *)objc_opt_new();
    objc_msgSend_setPipelineLibrary_(v33, v34, (uint64_t)v49);
    objc_msgSend_setComputeFunction_(v33, v35, (uint64_t)v32);
    v50 = v29;
    v37 = objc_msgSend_newComputePipelineStateWithDescriptor_error_(v4, v36, (uint64_t)v33, &v50);
    v45 = v50;

    v38 = (void *)v7[9];
    v7[9] = v37;

    v39 = (id)qword_2544D9CD8;
    objc_sync_enter(v39);
    objc_msgSend_setObject_forKey_((void *)qword_2544D9CD8, v40, v7[9], v4);
    objc_sync_exit(v39);

    v29 = v45;
    v25 = v46;
    v42 = (void *)v47;
    v41 = (void *)v48;
  }
  else
  {
    uni_logger_api();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_24B6F1308((uint64_t)v7, v44);

    uni_logger_api();
    v32 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v47;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_24B6F1294();
    v41 = (void *)v48;
  }

  if (!v21 || !v7[9])
  {
LABEL_21:
    v13 = 0;
    goto LABEL_6;
  }
LABEL_5:
  v13 = v7;
LABEL_6:

  return v13;
}

- (id)_combineRGB:(id)a3 weights:(id)a4 tmpRGBA:(id)a5 rgbWeight:(float)a6 buffer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  float v51;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v51 = a6;
  v15 = a7;
  if (!v12)
    sub_24B6F13C4();
  if (!v13)
    sub_24B6F13EC();
  v16 = v15;
  v17 = v14;
  v20 = v17;
  if (!v17 || (v21 = v17, (objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_2579B9140) & 1) == 0))
  {
    v22 = objc_msgSend_pixelFormat(v12, v18, v19);
    createSimilarTexture(v13, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      sub_24B6F1414();
  }
  objc_msgSend_computeCommandEncoder(v16, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v23, v24, (uint64_t)self->combineRGBA);
  objc_msgSend_setTexture_atIndex_(v23, v25, (uint64_t)v12, 0);
  objc_msgSend_setTexture_atIndex_(v23, v26, (uint64_t)v13, 1);
  objc_msgSend_setTexture_atIndex_(v23, v27, (uint64_t)v21, 2);
  objc_msgSend_setBytes_length_atIndex_(v23, v28, (uint64_t)&v51, 4, 0);
  v48 = v12;
  v31 = objc_msgSend_width(v13, v29, v30);
  v34 = objc_msgSend_height(v13, v32, v33);
  v37 = objc_msgSend_threadExecutionWidth(self->combineRGBA, v35, v36);
  v40 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->combineRGBA, v38, v39);
  v43 = objc_msgSend_threadExecutionWidth(self->combineRGBA, v41, v42);
  v50[0] = v31;
  v50[1] = v34;
  v50[2] = 1;
  v49[0] = v37;
  v49[1] = v40 / v43;
  v49[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v23, v44, (uint64_t)v50, v49);
  objc_msgSend_endEncoding(v23, v45, v46);

  return v21;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  float v51;
  float v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  const char *v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  void *v138;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _QWORD v151[2];
  void *v152;
  void *v153;
  _QWORD v154[5];
  _QWORD v155[7];

  v155[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_inputs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("guidance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("weights"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v24, (uint64_t)v23);
  v25 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("destinationCoefficients"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v31, (uint64_t)v30);
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)CFSTR("tmpRGBA"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v38, (uint64_t)v37);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)CFSTR("rgbWeight"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend_inputs(self, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)CFSTR("rgbWeight"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v48, v49, v50);
    v52 = v51;

  }
  else
  {
    v52 = 1.0;
  }

  if (!v11)
    sub_24B6F143C();
  if (!v18)
    sub_24B6F1464();
  if (!v25)
    sub_24B6F148C();
  if (!v32)
    sub_24B6F14B4();
  objc_msgSend_device(self, v53, v54);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
    objc_msgSend_device(self, v55, v56);
  else
    objc_msgSend_device(v11, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = v58;
  if (v4)
    v61 = v4;
  else
    v61 = (id)objc_msgSend_newCommandQueue(v58, v59, v60);
  v147 = (void *)v32;
  v142 = v61;
  objc_msgSend_commandBuffer(v61, v62, v63);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v150, v64, (uint64_t)CFSTR("MPSImageSpatioTemporalGuidedFilter"));
  objc_msgSend_inputs(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v67, v68, (uint64_t)CFSTR("subsampleFactor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_msgSend_inputs(self, v69, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)CFSTR("subsampleFactor"));
    v74 = v25;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend_unsignedIntegerValue(v75, v76, v77);

    v25 = v74;
  }
  else
  {
    v144 = 8;
  }

  *(float *)&v78 = v52;
  objc_msgSend__combineRGB_weights_tmpRGBA_rgbWeight_buffer_(self, v79, (uint64_t)v18, v25, v149, v150, v78);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v146)
    sub_24B6F14DC();
  v141 = v18;
  v82 = (void *)MEMORY[0x24BDBCED8];
  v155[0] = CFSTR("MPSImageSpatioTemporalGuidedFilter");
  v154[0] = CFSTR("name");
  v154[1] = CFSTR("spatialDiameter");
  objc_msgSend_inputs(self, v80, v81);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v83, v84, (uint64_t)CFSTR("spatialDiameter"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v4;
  v140 = (void *)v25;
  if (v87)
  {
    objc_msgSend_inputs(self, v85, v86);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v88, (uint64_t)CFSTR("spatialDiameter"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v89 = &unk_251C9CC90;
  }
  v155[1] = v89;
  v154[2] = CFSTR("width");
  v90 = (void *)MEMORY[0x24BDD16E0];
  v91 = objc_msgSend_width(v11, v85, v86);
  objc_msgSend_numberWithUnsignedInteger_(v90, v92, v91);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v93;
  v154[3] = CFSTR("height");
  v94 = (void *)MEMORY[0x24BDD16E0];
  v145 = v11;
  v97 = objc_msgSend_height(v11, v95, v96);
  objc_msgSend_numberWithUnsignedInteger_(v94, v98, v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v99;
  v154[4] = CFSTR("subsampleFactor");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v100, v144);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v155[4] = v101;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v102, (uint64_t)v155, v154, 5);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v82, v104, (uint64_t)v103);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {

  }
  objc_msgSend_inputs(self, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v108, v109, (uint64_t)CFSTR("epsilon"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    objc_msgSend_inputs(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v113, v114, (uint64_t)CFSTR("epsilon"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v105, v116, (uint64_t)v115, CFSTR("epsilon"));

  }
  objc_msgSend_device(v148, v111, v112);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_findKernel_device_(UniDeviceCache, v118, (uint64_t)v105, v117);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v119, v120, (uint64_t)CFSTR("MPSImageSpatioTemporalGuidedFilter"));
  if (!v119)
    sub_24B6F1504();
  v122 = v105;
  v153 = v145;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v121, (uint64_t)&v153, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(self, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v126, v127, (uint64_t)CFSTR("iterations"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (v130)
  {
    objc_msgSend_inputs(self, v128, v129);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v105, v131, (uint64_t)CFSTR("iterations"));
    self = (UniGuidedFilter *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend_unsignedIntegerValue(self, v132, v133);
  }
  else
  {
    v134 = 50;
  }
  v152 = v147;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v128, (uint64_t)&v152, 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(v119, v136, (uint64_t)v150, v123, v146, 0, v134, v135);

  if (v130)
  {

  }
  v151[0] = v150;
  v151[1] = v147;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v137, (uint64_t)v151, 2);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  return v138;
}

- (id)_disparityRefinementRGBAGuideKernel
{
  return (id)objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, a2, (uint64_t)CFSTR("_disparityRefinementRGBAGuideKernel"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UniGuidedFilter;
  return -[UniKernel copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (id)outputImage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  const char *v39;
  uint64_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  const char *v45;
  uint64_t v46;
  double v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  CGFloat v52;
  const char *v53;
  uint64_t v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  const char *v82;
  void *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  void *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  double v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  double v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  void *v153;
  void *v154;
  const char *v155;
  void *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  const char *v168;
  void *v169;
  const char *v170;
  void *v171;
  id v172;
  const char *v173;
  char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
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
  id v203;
  CGAffineTransform v204;
  _QWORD v205[2];
  _QWORD v206[8];
  _QWORD v207[8];
  _QWORD v208[2];
  uint64_t v209;
  void *v210;
  _QWORD v211[5];
  CGRect v212;
  CGRect v213;

  v211[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  objc_msgSend_inputs(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("source"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(v7, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("guidance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(v7, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)CFSTR("weights"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__ciImageForInput_(v7, v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    sub_24B6F152C();
  if (!v21)
    sub_24B6F1554();
  if (!v28)
    sub_24B6F157C();
  objc_msgSend_extent(v21, v29, v30);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  objc_msgSend_extent(v28, v39, v40);
  v213.origin.x = v41;
  v213.origin.y = v42;
  v213.size.width = v43;
  v213.size.height = v44;
  v212.origin.x = v32;
  v212.origin.y = v34;
  v212.size.width = v36;
  v212.size.height = v38;
  if (!CGRectEqualToRect(v212, v213))
  {
    objc_msgSend_extent(v28, v45, v46);
    v48 = v47;
    objc_msgSend_extent(v21, v49, v50);
    v52 = v48 / v51;
    objc_msgSend_extent(v28, v53, v54);
    v56 = v55;
    objc_msgSend_extent(v21, v57, v58);
    CGAffineTransformMakeScale(&v204, v52, v56 / v59);
    objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v21, v60, (uint64_t)&v204, 0);
    v61 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v61;
  }
  objc_msgSend__disparityRefinementRGBAGuideKernel(self, v45, v46);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v202)
    sub_24B6F15A4();
  objc_msgSend_inputs(v7, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)CFSTR("rgbWeight"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_msgSend_inputs(v7, v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v69, v70, (uint64_t)CFSTR("rgbWeight"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = &unk_251C9CCA8;
  }

  objc_msgSend_extent(v21, v72, v73);
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v211[0] = v21;
  v211[1] = v28;
  v198 = v71;
  v199 = v28;
  v211[2] = v71;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v82, (uint64_t)v211, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = *MEMORY[0x24BDBF9C0];
  v84 = (void *)0x24BDD1000;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v85, *MEMORY[0x24BDBF8B0]);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = v86;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v87, (uint64_t)&v210, &v209, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v202, v89, (uint64_t)v83, v88, v75, v77, v79, v81);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v90)
    sub_24B6F15CC();
  v93 = (void *)MEMORY[0x24BDBF690];
  objc_msgSend_extent(v14, v91, v92);
  objc_msgSend_vectorWithCGRect_(v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v208[0] = v96;
  v97 = (void *)MEMORY[0x24BDBF690];
  v200 = v90;
  objc_msgSend_extent(v90, v98, v99);
  objc_msgSend_vectorWithCGRect_(v97, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v208[1] = v102;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v103, (uint64_t)v208, 2);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputs(v7, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v106, v107, (uint64_t)CFSTR("subsampleFactor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    objc_msgSend_inputs(v7, v108, v109);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v111, v112, (uint64_t)CFSTR("subsampleFactor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend_unsignedIntegerValue(v113, v114, v115);

  }
  else
  {
    v116 = 8;
  }

  v191 = (void *)MEMORY[0x24BDBCED8];
  v207[0] = CFSTR("MPSImageSpatioTemporalGuidedFilter");
  v206[0] = CFSTR("name");
  v206[1] = CFSTR("spatialDiameter");
  objc_msgSend_inputs(v7, v117, v118);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v195, v119, (uint64_t)CFSTR("spatialDiameter"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  if (v194)
  {
    objc_msgSend_inputs(v7, v120, v121);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v188, v122, (uint64_t)CFSTR("spatialDiameter"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v123 = &unk_251C9CC90;
  }
  v190 = v123;
  v207[1] = v123;
  v207[2] = v201;
  v206[2] = CFSTR("imageExtents");
  v206[3] = CFSTR("epsilon");
  objc_msgSend_inputs(v7, v120, v121);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v192, v124, (uint64_t)CFSTR("epsilon"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = v4;
  if (v127)
  {
    objc_msgSend_inputs(v7, v125, v126);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v187, v128, (uint64_t)CFSTR("epsilon"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v129 = &unk_251C9D6D0;
  }
  v189 = v129;
  v207[3] = v129;
  v206[4] = CFSTR("subsampleFactor");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v125, v116);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v207[4] = v130;
  v206[5] = CFSTR("width");
  v131 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_extent(v14, v132, v133);
  objc_msgSend_numberWithDouble_(v131, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v207[5] = v137;
  v206[6] = CFSTR("height");
  v138 = (void *)MEMORY[0x24BDD16E0];
  v196 = v14;
  objc_msgSend_extent(v14, v139, v140);
  objc_msgSend_numberWithDouble_(v138, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v207[6] = v144;
  v206[7] = CFSTR("iterations");
  objc_msgSend_inputs(v7, v145, v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v147, v148, (uint64_t)CFSTR("iterations"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v7;
  if (v151)
  {
    objc_msgSend_inputs(v7, v149, v150);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v84, v152, (uint64_t)CFSTR("iterations"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v153 = &unk_251C9CCC0;
  }
  v207[7] = v153;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v149, (uint64_t)v207, v206, 8);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v191, v155, (uint64_t)v154);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (v151)
  {

  }
  if (v127)
  {

  }
  v157 = v200;
  if (v194)
  {

  }
  objc_msgSend_extent(v200, v158, v159);
  v161 = v160;
  v163 = v162;
  v165 = v164;
  v167 = v166;
  v205[0] = v196;
  v205[1] = v200;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v168, (uint64_t)v205, 2);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = 0;
  objc_msgSend_applyWithExtent_inputs_arguments_error_(GuidedFilterProcessor, v170, (uint64_t)v169, v156, &v203, v161, v163, v165, v167);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v203;

  if (v172)
  {
    uni_logger_api();
    v174 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v174, OS_LOG_TYPE_ERROR))
      sub_24B6F1644((uint64_t)v172, v174);

    v175 = 0;
  }
  else
  {
    if (!v171)
      sub_24B6F15F4();
    objc_msgSend_imageWithCIImage_(UniImage, v173, (uint64_t)v171);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputs(v193, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v178, v179, (uint64_t)CFSTR("destinationCoefficients"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTexture_(v175, v181, (uint64_t)v180);

    objc_msgSend_texture(v175, v182, v183);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v184)
      sub_24B6F161C();

    objc_msgSend_setKernel_(v175, v185, (uint64_t)v193);
    v157 = v200;
  }

  return v175;
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

- (id)inputNameArray
{
  return &unk_251C9D748;
}

- (id)outputNameArray
{
  return &unk_251C9D760;
}

- (MTLComputePipelineState)combineRGBA
{
  return self->combineRGBA;
}

- (void)setCombineRGBA:(id)a3
{
  objc_storeStrong((id *)&self->combineRGBA, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->combineRGBA, 0);
}

@end
