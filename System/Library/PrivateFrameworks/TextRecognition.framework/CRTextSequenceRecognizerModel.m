@implementation CRTextSequenceRecognizerModel

- (NSDictionary)outputShape
{
  NSDictionary *outputShape;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  id v13;

  outputShape = self->_outputShape;
  if (!outputShape)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    -[CRTextSequenceRecognizerModel modelURL](self, "modelURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v6, "pathForResource:ofType:", CFSTR("model.output"), CFSTR("shape"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No model.output.shape in model"), 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v13);
    }
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, 0);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_outputShape;
    self->_outputShape = v10;

    outputShape = self->_outputShape;
  }
  return outputShape;
}

- (NSNumber)outputWidthDownscale
{
  CRTextSequenceRecognizerModel *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSNumber *outputWidthDownscale;
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputWidthDownscale)
  {
    -[CRTextSequenceRecognizerModel outputShape](v2, "outputShape");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("w_output_shape"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("down_scale"));
    v5 = objc_claimAutoreleasedReturnValue();
    outputWidthDownscale = v2->_outputWidthDownscale;
    v2->_outputWidthDownscale = (NSNumber *)v5;

    if (!v2->_outputWidthDownscale)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No w_output_shape down_scale in model.output.shape"), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }
  }
  objc_sync_exit(v2);

  return v2->_outputWidthDownscale;
}

- (NSNumber)outputWidthOffset
{
  CRTextSequenceRecognizerModel *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSNumber *outputWidthOffset;
  id v8;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputWidthOffset)
  {
    -[CRTextSequenceRecognizerModel outputShape](v2, "outputShape");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("w_output_shape"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset"));
    v5 = objc_claimAutoreleasedReturnValue();
    outputWidthOffset = v2->_outputWidthOffset;
    v2->_outputWidthOffset = (NSNumber *)v5;

    if (!v2->_outputWidthOffset)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No w_output_shape offset in model.output.shape"), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }
  }
  objc_sync_exit(v2);

  return v2->_outputWidthOffset;
}

- (NSNumber)outputFormatVersion
{
  CRTextSequenceRecognizerModel *v2;
  void *v3;
  uint64_t v4;
  NSNumber *outputFormatVersion;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_outputFormatVersion)
  {
    -[CRTextSequenceRecognizerModel outputShape](v2, "outputShape");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("output_format_version"));
    v4 = objc_claimAutoreleasedReturnValue();
    outputFormatVersion = v2->_outputFormatVersion;
    v2->_outputFormatVersion = (NSNumber *)v4;

    if (!v2->_outputFormatVersion)
      v2->_outputFormatVersion = (NSNumber *)&unk_1E9926BB0;
  }
  objc_sync_exit(v2);

  return v2->_outputFormatVersion;
}

- (int)codemapArray
{
  CRTextSequenceRecognizerModel *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_codemapArray)
  {
LABEL_8:
    objc_sync_exit(v2);

    return v2->_codemapArray;
  }
  v3 = (void *)MEMORY[0x1E0CB34D0];
  -[CRTextSequenceRecognizerModel modelURL](v2, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("codemap"), CFSTR("bin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 65534);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_ctcBlankLabelIndex = objc_msgSend(v9, "indexOfObject:", v10);

    if (v2->_ctcBlankLabelIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No blank label in codemap"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v2->_codemapArray = (int *)malloc_type_calloc(objc_msgSend(v9, "count"), 4uLL, 0x100004052888210uLL);
    v11 = 0;
    v2->_codemapSize = objc_msgSend(v9, "count");
    while (objc_msgSend(v9, "count") > v11)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_codemapArray[v11] = objc_msgSend(v12, "intValue");

      ++v11;
    }

    goto LABEL_8;
  }
  CROSLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[CRTextSequenceRecognizerModel modelURL](v2, "modelURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_ERROR, "No codemap in model: %@", buf, 0xCu);

  }
  CROSLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_FAULT, "Could not read codemap!", buf, 2u);
  }

  objc_sync_exit(v2);
  return 0;
}

- (unint64_t)codemapSize
{
  unint64_t result;

  result = -[CRTextSequenceRecognizerModel codemapArray](self, "codemapArray");
  if (result)
    return self->_codemapSize;
  return result;
}

- (void)dealloc
{
  int *codemapArray;
  objc_super v4;

  codemapArray = self->_codemapArray;
  if (codemapArray)
  {
    free(codemapArray);
    self->_codemapArray = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRTextSequenceRecognizerModel;
  -[CRTextSequenceRecognizerModel dealloc](&v4, sel_dealloc);
}

- (id)populateInputBatchData:(float *)a3 lineRegions:(id)a4 image:(id)a5 batchSize:(int64_t)a6 width:(double)a7 configuration:(id)a8 rectifier:(id)a9
{
  id v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void (**v57)(_QWORD);
  id v58;
  id v59;
  void (**v60)(_QWORD, _QWORD, _QWORD, double, double, double, double, double, double);
  void *v61;
  void *v62;
  unint64_t v63;
  int v64;
  void *v65;
  double v66;
  unint64_t v67;
  void (*v68)(_QWORD);
  double v69;
  double v70;
  CRNormalizedPolyline *v71;
  CRNormalizedPolyline *v72;
  double v73;
  unint64_t v74;
  void *v75;
  __int128 v76;
  float v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  uint64_t v87;
  int v88;
  double v89;
  float *v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  NSObject *group;
  id v98;
  id v99;
  unint64_t v100;
  int64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *context;
  void *v106;
  id v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  id v112;
  void (**v113)(_QWORD, _QWORD, _QWORD, double, double, double, double, double, double);
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  uint64_t v119;
  _QWORD v120[4];
  id v121;
  id v122;
  void (**v123)(_QWORD, _QWORD, _QWORD, double, double, double, double, double, double);
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  uint64_t v129;
  _QWORD v130[4];
  NSObject *v131;
  id v132;
  id v133;
  id v134;
  _QWORD *v135;
  uint64_t *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  _QWORD v142[4];
  NSObject *v143;
  _QWORD v144[4];
  int v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  float *v149;
  _QWORD v150[6];
  CGRect v151;

  v150[4] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v107 = a5;
  v98 = a8;
  v99 = a9;
  v102 = v15;
  v16 = objc_msgSend(v15, "count");
  v100 = a6;
  if (v16 >= a6)
    v17 = a6;
  else
    v17 = v16;
  v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v17);
  v146 = 0;
  v147 = &v146;
  v148 = 0x2020000000;
  v91 = a3;
  v149 = a3;
  v144[0] = 0;
  v144[1] = v144;
  v144[2] = 0x2810000000;
  v144[3] = &unk_1D5168E96;
  v145 = 0;
  group = dispatch_group_create();
  v101 = v17;
  if (v17 >= 1)
  {
    v104 = 0;
    v18 = 0;
    v95 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v96 = *MEMORY[0x1E0C9D648];
    v93 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v94 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    while (1)
    {
      context = (void *)MEMORY[0x1D826E7B0]();
      objc_msgSend(v102, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "boundingQuad");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "baselineAngle");
      v22 = v21;

      objc_msgSend(v19, "boundingQuad");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "denormalizedQuad");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "boundingBox");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v33 = objc_msgSend(v107, "width");
      v34 = objc_msgSend(v107, "width");
      v35 = objc_msgSend(v107, "height");
      v36 = objc_msgSend(v107, "height");
      v37 = round(v26);
      v38 = round(v28);
      v39 = round(v28 + v32);
      v40 = fmin(fmax(v37, 0.0), (double)(unint64_t)(v33 - 1));
      v41 = fmin(fmax(round(v26 + v30) - v37 + v40, 0.0), (double)(unint64_t)(v34 - 1)) - v40;
      v42 = fmin(fmax(v38, 0.0), (double)(unint64_t)(v35 - 1));
      v43 = fmin(fmax(v39 - v38 + v42, 0.0), (double)(unint64_t)(v36 - 1)) - v42;
      v151.origin.x = v40;
      v151.origin.y = v42;
      v151.size.width = v41;
      v151.size.height = v43;
      if (!CGRectIsEmpty(v151))
        break;
LABEL_19:

      objc_autoreleasePoolPop(context);
      if (v101 == ++v18)
        goto LABEL_22;
    }
    v44 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v19, "boundingQuad");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topLeft");
    objc_msgSend(v44, "valueWithPoint:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = v46;
    v47 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v19, "boundingQuad");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topRight");
    objc_msgSend(v47, "valueWithPoint:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v150[1] = v49;
    v50 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v19, "boundingQuad");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomRight");
    objc_msgSend(v50, "valueWithPoint:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v150[2] = v52;
    v53 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v19, "boundingQuad");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomLeft");
    objc_msgSend(v53, "valueWithPoint:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v150[3] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 4);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    v142[0] = MEMORY[0x1E0C809B0];
    v142[1] = 3221225472;
    v142[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke;
    v142[3] = &unk_1E98DB9B8;
    v56 = group;
    v143 = v56;
    v57 = (void (**)(_QWORD))MEMORY[0x1D826E9A8](v142);
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_2;
    v130[3] = &unk_1E98DB9E0;
    v131 = v56;
    v137 = a7;
    v58 = v98;
    v132 = v58;
    v59 = v19;
    v138 = v40;
    v139 = v42;
    v140 = v41;
    v141 = v43;
    v133 = v59;
    v135 = v144;
    v134 = v106;
    v136 = &v146;
    v60 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double, double, double))MEMORY[0x1D826E9A8](v130);
    objc_msgSend(v59, "polygon");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v59, "polygon");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "pointCount");
      if (v99 && v63 > 3)
      {
        v64 = objc_msgSend(v58, "rectifyPolygons");

        if (v64)
        {
          v57[2](v57);
          objc_msgSend(v59, "polygon");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "inputHeight");
          v67 = (unint64_t)v66;
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_3;
          v120[3] = &unk_1E98DBA08;
          v121 = v107;
          v124 = v40;
          v125 = v42;
          v126 = v41;
          v127 = v43;
          v122 = v103;
          v128 = v22;
          v123 = v60;
          v129 = v104;
          objc_msgSend(v99, "rectifyPolygonAsync:imageHeight:completionHandler:", v65, v67, v120);

LABEL_18:
          ++v104;
          goto LABEL_19;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v58, "angleThresholdForRotatedCrops", v91);
    v68 = v57[2];
    if (fabs(v22) <= v69)
    {
      v68(v57);
      objc_msgSend(v107, "imageByCroppingRectangle:", v40, v42, v41, v43);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, uint64_t, double, double, double, double, double, double))v60)[2](v60, v75, v104, v41, v43, v96, v95, v94, v93);

    }
    else
    {
      v68(v57);
      if (v99)
      {
        v71 = [CRNormalizedPolyline alloc];
        objc_msgSend(v107, "size");
        v72 = -[CRNormalizedPolyline initWithNormalizedPointValues:size:](v71, "initWithNormalizedPointValues:size:", v103);
        objc_msgSend(v58, "inputHeight");
        v74 = (unint64_t)v73;
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_4;
        v110[3] = &unk_1E98DBA08;
        v111 = v107;
        v114 = v40;
        v115 = v42;
        v116 = v41;
        v117 = v43;
        v112 = v103;
        v118 = v22;
        v113 = v60;
        v119 = v104;
        objc_msgSend(v99, "rectifyPolygonAsync:imageHeight:completionHandler:", v72, v74, v110);

      }
      else
      {
        v76 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
        v108 = *MEMORY[0x1E0C9D648];
        v109 = v76;
        v77 = v22;
        *(float *)&v70 = -v77;
        objc_msgSend(v107, "imageByCroppingRectangle:textFeaturePoints:radians:rotatedRoi:", v103, &v108, v40, v42, v41, v43, v70);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, uint64_t, double, double, double, double, double, double))v60)[2](v60, v78, v104, *(double *)&v109, *((double *)&v109 + 1), *(double *)&v108, *((double *)&v108 + 1), *(double *)&v109, *((double *)&v109 + 1));

      }
    }
    goto LABEL_18;
  }
  v104 = 0;
LABEL_22:
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v101);
  if ((v104 & 0x8000000000000000) == 0)
  {
    v80 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v80, v91);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "objectForKeyedSubscript:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v80);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "objectForKeyedSubscript:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v84);

      }
      ++v80;
    }
    while (v104 + 1 != v80);
  }
  if (objc_msgSend(v79, "count", v91) < v100)
  {
    objc_msgSend(v98, "inputHeight");
    v86 = v85;
    v87 = objc_msgSend(v79, "count");
    v88 = 0;
    v147[3] = v92 + 4 * v87 * (unint64_t)(v86 * a7);
    while (1)
    {
      objc_msgSend(v98, "inputHeight");
      if (v89 * a7 * (double)(v100 - objc_msgSend(v79, "count")) <= (double)v88)
        break;
      *(_DWORD *)v147[3] = 0;
      v147[3] += 4;
      ++v88;
    }
  }

  _Block_object_dispose(v144, 8);
  _Block_object_dispose(&v146, 8);

  return v79;
}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v17;
  unint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  float v28;
  SEL v29;
  SEL v30;
  SEL v31;
  unint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 src;
  __int128 v41;

  v17 = a2;
  if (objc_msgSend(v17, "width") && objc_msgSend(v17, "height"))
  {
    v38 = a7;
    *(double *)&v39 = a8;
    *((double *)&v39 + 1) = a9;
    v37 = *(double *)(a1 + 80);
    v18 = objc_msgSend(v17, "width");
    objc_msgSend(*(id *)(a1 + 40), "inputHeight");
    v20 = v19;
    v21 = objc_msgSend(v17, "height");
    v22 = *(_QWORD *)(a1 + 88);
    v23 = *(_QWORD *)(a1 + 96);
    v24 = *(_QWORD *)(a1 + 104);
    v25 = *(_QWORD *)(a1 + 112);
    v26 = *(id *)(a1 + 48);
    objc_opt_self();
    v27 = objc_opt_new();
    objc_msgSend((id)v27, "setLineRegion:", v26);

    if (v27)
    {
      v28 = fmin(v37 / (double)v18, v20 / (double)v21);
      *(float *)(v27 + 8) = v28;
      *(_QWORD *)&src = v22;
      *((_QWORD *)&src + 1) = v23;
      *(_QWORD *)&v41 = v24;
      *((_QWORD *)&v41 + 1) = v25;
      objc_copyStruct((void *)(v27 + 104), &src, 32, 1, 0);
      *(double *)&src = a4;
      *((double *)&src + 1) = a5;
      objc_copyStruct((void *)(v27 + 88), &src, 16, 1, 0);
      *(double *)&src = a6;
      *((double *)&src + 1) = v38;
      v41 = v39;
      objc_copyStruct((void *)(v27 + 136), &src, 32, 1, 0);
      *(_QWORD *)(v27 + 24) = 0;
      objc_setProperty_atomic((id)v27, v29, 0, 40);
      objc_setProperty_atomic((id)v27, v30, 0, 48);
      objc_setProperty_atomic((id)v27, v31, 0, 56);
      *(_QWORD *)(v27 + 72) = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    v32 = (unint64_t)*(double *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 40), "inputHeight");
    objc_msgSend(v17, "imageByPaddingToRatioAndScalingToWidth:height:paddingMode:alignCenter:", v32, (unint64_t)v33, objc_msgSend(*(id *)(a1 + 40), "paddingMode"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    src = 0u;
    v41 = 0u;
    if (v34)
      objc_msgSend(v34, "createFloatBuffer");
    v35 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v27, v36);

    memcpy((void *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 4 * *((_QWORD *)&src + 1) * v41 * a3), (const void *)src, 4 * *((_QWORD *)&src + 1) * v41);
    free((void *)src);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

    v17 = v34;
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_3(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  objc_msgSend(v12, "size");
  v4 = v3;
  v6 = v5;
  *(float *)&v3 = *(double *)(a1 + 88);
  *(float *)&v7 = -*(float *)&v3;
  objc_msgSend(*(id *)(a1 + 32), "rotatedRoiByCroppingRectangle:textFeaturePoints:radians:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), v7);
  (*(void (**)(double, double, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v4, v6, v8, v9, v10, v11);

}

void __114__CRTextSequenceRecognizerModel_populateInputBatchData_lineRegions_image_batchSize_width_configuration_rectifier___block_invoke_4(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  objc_msgSend(v12, "size");
  v4 = v3;
  v6 = v5;
  *(float *)&v3 = *(double *)(a1 + 88);
  *(float *)&v7 = -*(float *)&v3;
  objc_msgSend(*(id *)(a1 + 32), "rotatedRoiByCroppingRectangle:textFeaturePoints:radians:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), v7);
  (*(void (**)(double, double, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(v4, v6, v8, v9, v10, v11);

}

+ (id)defaultURLOfModelInThisBundle
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  CROSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D4FB8000, v2, OS_LOG_TYPE_FAULT, "CRTextSequenceRecognizerModel unexpectedly called directly", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("cr_tr_model_latin_v2.mlmodelc"), CFSTR("bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)modelURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRTextSequenceRecognizerModel configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customModelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRTextSequenceRecognizerModel configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customModelURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultURLOfModelInThisBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v6;
}

- (BOOL)supportCharacterBoxes
{
  return 0;
}

- (TextBoxesOffsets)characterBoxesOffsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  TextBoxesOffsets result;

  v2 = 0.0;
  v3 = 4.0;
  v4 = 0.0;
  v5 = 0.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (TextBoxesOffsets)wordBoxesOffsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  TextBoxesOffsets result;

  v2 = 0.0;
  v3 = 4.0;
  v4 = 2.0;
  v5 = -2.0;
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (CRTextSequenceRecognizerModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRTextSequenceRecognizerModel;
  return -[CRTextSequenceRecognizerModel init](&v5, sel_init, a3, a4);
}

- (id)predictFromInputs:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inputBatchFromLineRegions:(id)a3 image:(id)a4 regionWidth:(double)a5 configuration:(id)a6 rectifier:(id)a7
{
  return 0;
}

- (BOOL)preheatWithError:(id *)a3
{
  return 0;
}

- (void)setCodemapArray:(int *)a3
{
  self->_codemapArray = a3;
}

- (void)setCodemapSize:(unint64_t)a3
{
  self->_codemapSize = a3;
}

- (int64_t)ctcBlankLabelIndex
{
  return self->_ctcBlankLabelIndex;
}

- (void)setCtcBlankLabelIndex:(int64_t)a3
{
  self->_ctcBlankLabelIndex = a3;
}

- (void)setOutputShape:(id)a3
{
  objc_storeStrong((id *)&self->_outputShape, a3);
}

- (void)setOutputWidthDownscale:(id)a3
{
  objc_storeStrong((id *)&self->_outputWidthDownscale, a3);
}

- (void)setOutputWidthOffset:(id)a3
{
  objc_storeStrong((id *)&self->_outputWidthOffset, a3);
}

- (void)setOutputFormatVersion:(id)a3
{
  objc_storeStrong((id *)&self->_outputFormatVersion, a3);
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_outputFormatVersion, 0);
  objc_storeStrong((id *)&self->_outputWidthOffset, 0);
  objc_storeStrong((id *)&self->_outputWidthDownscale, 0);
  objc_storeStrong((id *)&self->_outputShape, 0);
}

@end
