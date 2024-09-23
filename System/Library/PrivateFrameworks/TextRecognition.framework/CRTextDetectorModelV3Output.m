@implementation CRTextDetectorModelV3Output

+ (id)shapeExcludingBatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shape", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(v3, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)stridesExcludingBatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "strides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strides", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(v3, "strides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CRTextDetectorModelV3Output)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRTextDetectorModelV3Output;
  return -[CRTextDetectorModelV3Output init](&v3, sel_init);
}

- (CRTextDetectorModelV3Output)initWithRegion_score:(id)a3 script_feature:(id)a4 link_score_horizontal:(id)a5 link_score_vertical:(id)a6 orientation_score:(id)a7 text_type_score:(id)a8 table_score:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CRTextDetectorModelV3Output *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  MLMultiArray *region_score;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  MLMultiArray *script_feature;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  MLMultiArray *link_score_horizontal;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  MLMultiArray *link_score_vertical;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  MLMultiArray *orientation_score;
  id v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  MLMultiArray *table_score;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  MLMultiArray *text_type_score;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  NSObject *v97;
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[8];
  objc_super v105;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v105.receiver = self;
  v105.super_class = (Class)CRTextDetectorModelV3Output;
  v22 = -[CRTextDetectorModelV3Output init](&v105, sel_init);
  if (v22)
  {
    v96 = v20;
    objc_msgSend(v15, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24 == 4)
    {
      v25 = objc_alloc(MEMORY[0x1E0C9E970]);
      v91 = v15;
      v26 = objc_retainAutorelease(v15);
      v27 = objc_msgSend(v26, "dataPointer");
      +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v26);
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v18;
      v30 = objc_msgSend(v26, "dataType");
      +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0;
      v32 = objc_msgSend(v25, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v27, v29, v30, v31, 0, &v103);
      v33 = v103;
      region_score = v22->_region_score;
      v22->_region_score = (MLMultiArray *)v32;

      v35 = objc_alloc(MEMORY[0x1E0C9E970]);
      v93 = v16;
      v36 = objc_retainAutorelease(v16);
      v37 = objc_msgSend(v36, "dataPointer");
      +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v19;
      v39 = objc_msgSend(v36, "dataType");
      v90 = v36;
      +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v33;
      v41 = objc_msgSend(v35, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v37, v38, v39, v40, 0, &v102);
      v42 = v102;

      script_feature = v22->_script_feature;
      v22->_script_feature = (MLMultiArray *)v41;

      v44 = objc_alloc(MEMORY[0x1E0C9E970]);
      v92 = v28;
      v45 = objc_retainAutorelease(v28);
      v46 = objc_msgSend(v45, "dataPointer");
      +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v45, "dataType");
      +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v42;
      v50 = objc_msgSend(v44, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v46, v47, v48, v49, 0, &v101);
      v51 = v101;

      link_score_horizontal = v22->_link_score_horizontal;
      v22->_link_score_horizontal = (MLMultiArray *)v50;

      v53 = objc_alloc(MEMORY[0x1E0C9E970]);
      v54 = objc_retainAutorelease(v95);
      v55 = objc_msgSend(v54, "dataPointer");
      +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v54, "dataType");
      +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v54);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v51;
      v59 = objc_msgSend(v53, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v55, v56, v57, v58, 0, &v100);
      v60 = v100;

      link_score_vertical = v22->_link_score_vertical;
      v22->_link_score_vertical = (MLMultiArray *)v59;

      v62 = objc_alloc(MEMORY[0x1E0C9E970]);
      v63 = objc_retainAutorelease(v94);
      v64 = objc_msgSend(v63, "dataPointer");
      +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v63, "dataType");
      +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v63);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v60;
      v68 = objc_msgSend(v62, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v64, v65, v66, v67, 0, &v99);
      v69 = v99;

      orientation_score = v22->_orientation_score;
      v22->_orientation_score = (MLMultiArray *)v68;

      if (v21)
      {
        v71 = objc_alloc(MEMORY[0x1E0C9E970]);
        v72 = objc_retainAutorelease(v21);
        v73 = objc_msgSend(v72, "dataPointer");
        +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v72, "dataType");
        +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v72);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v69;
        v77 = objc_msgSend(v71, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v73, v74, v75, v76, 0, &v98);
        v78 = v98;

        table_score = v22->_table_score;
        v22->_table_score = (MLMultiArray *)v77;

        v69 = v78;
      }
      v20 = v96;
      v15 = v91;
      if (v96)
      {
        v80 = objc_alloc(MEMORY[0x1E0C9E970]);
        v81 = objc_retainAutorelease(v96);
        v82 = objc_msgSend(v81, "dataPointer");
        +[CRTextDetectorModelV3Output shapeExcludingBatch:](CRTextDetectorModelV3Output, "shapeExcludingBatch:", v81);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v81, "dataType");
        +[CRTextDetectorModelV3Output stridesExcludingBatch:](CRTextDetectorModelV3Output, "stridesExcludingBatch:", v90);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v69;
        v86 = objc_msgSend(v80, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v82, v83, v84, v85, 0, &v97);
        v87 = v97;

        text_type_score = v22->_text_type_score;
        v22->_text_type_score = (MLMultiArray *)v86;

        v69 = v87;
      }
      v17 = v92;
      v16 = v93;
      v19 = v94;
      v18 = v95;
    }
    else
    {

      CROSLogForCategory(0);
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v69, OS_LOG_TYPE_FAULT, "Please check the detector model you are using! It should return a 4D tensor", buf, 2u);
      }
      v22 = 0;
      v20 = v96;
    }

  }
  return v22;
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, id);
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "outputNamed:error:", v9, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "strides");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "dataType");
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__12;
    v36 = __Block_byref_object_dispose__12;
    v37 = 0;
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke;
    v27 = &unk_1E98DAF38;
    v31 = v16;
    v17 = v14;
    v28 = v17;
    v18 = v15;
    v29 = v18;
    v30 = &v32;
    v19 = (void *)MEMORY[0x1D826E9A8](&v24);
    objc_msgSend(v13, "name", v24, v25, v26, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "accessReadOnlyDataForName:usingBlock:error:", v20, v19, a6);

    if ((v21 & 1) != 0)
      v22 = (id)v33[5];
    else
      v22 = 0;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke(uint64_t a1, id a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  unint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = (void *)objc_msgSend(v3, "bytes");
  v5 = *(_QWORD *)(a1 + 56);
  v6 = objc_msgSend(v3, "length");
  if (v5 == 65552)
  {
    v7 = malloc_type_calloc(2 * v6, 1uLL, 0x92EE5215uLL);
    v8 = objc_msgSend(v3, "length");

    CRConvertFloat16BufferToFloat32Buffer(v4, v7, v8 >> 1, 0);
  }
  else
  {
    v7 = malloc_type_calloc(v6, 1uLL, 0x43346662uLL);
    v9 = objc_msgSend(v3, "length");

    memcpy(v4, v7, v9);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 8) / 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 16) / 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 24) / 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", v7, v13, 65568, v17, &__block_literal_global_19, 0);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  return 1;
}

void __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke_2(int a1, void *a2)
{
  free(a2);
}

- (CRTextDetectorModelV3Output)initWithVisionCoreNamedObjects:(id)a3 fromFunctionDescriptor:(id)a4
{
  id v6;
  id v7;
  CRTextDetectorModelV3Output *v8;
  uint64_t v9;
  id v10;
  MLMultiArray *region_score;
  uint64_t v12;
  id v13;
  MLMultiArray *script_feature;
  uint64_t v15;
  id v16;
  MLMultiArray *link_score_horizontal;
  uint64_t v18;
  id v19;
  MLMultiArray *link_score_vertical;
  uint64_t v21;
  id v22;
  MLMultiArray *orientation_score;
  uint64_t v24;
  id v25;
  MLMultiArray *table_score;
  uint64_t v27;
  id v28;
  MLMultiArray *text_type_score;
  CRTextDetectorModelV3Output *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CRTextDetectorModelV3Output;
  v8 = -[CRTextDetectorModelV3Output init](&v39, sel_init);
  if (!v8)
    goto LABEL_3;
  v38 = 0;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("region_score"), v6, v7, &v38);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v38;
  region_score = v8->_region_score;
  v8->_region_score = (MLMultiArray *)v9;

  v37 = v10;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("script_feature"), v6, v7, &v37);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v37;

  script_feature = v8->_script_feature;
  v8->_script_feature = (MLMultiArray *)v12;

  v36 = v13;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("link_score_horizontal"), v6, v7, &v36);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v36;

  link_score_horizontal = v8->_link_score_horizontal;
  v8->_link_score_horizontal = (MLMultiArray *)v15;

  v35 = v16;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("link_score_vertical"), v6, v7, &v35);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v35;

  link_score_vertical = v8->_link_score_vertical;
  v8->_link_score_vertical = (MLMultiArray *)v18;

  v34 = v19;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("orientation_score"), v6, v7, &v34);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v34;

  orientation_score = v8->_orientation_score;
  v8->_orientation_score = (MLMultiArray *)v21;

  v33 = v22;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("table_score"), v6, v7, &v33);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v33;

  table_score = v8->_table_score;
  v8->_table_score = (MLMultiArray *)v24;

  v32 = v25;
  +[CRTextDetectorModelV3Output multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](CRTextDetectorModelV3Output, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("text_type_score"), v6, v7, &v32);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v32;

  text_type_score = v8->_text_type_score;
  v8->_text_type_score = (MLMultiArray *)v27;

  v30 = 0;
  if (!v28)
LABEL_3:
    v30 = v8;

  return v30;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F7A0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("region_score")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("script_feature")) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("orientation_score")) & 1) != 0)
  {
    v5 = 48;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("text_type_score")) & 1) != 0)
  {
    v5 = 56;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("link_score_horizontal")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("link_score_vertical")) & 1) != 0)
  {
    v5 = 32;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("table_score")))
    {
      v6 = 0;
      goto LABEL_16;
    }
    v5 = 40;
  }
  objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", *(Class *)((char *)&self->super.isa + v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v6;
}

- (BOOL)isLazy
{
  return 0;
}

- (MLMultiArray)region_score
{
  return self->_region_score;
}

- (void)setRegion_score:(id)a3
{
  objc_storeStrong((id *)&self->_region_score, a3);
}

- (MLMultiArray)script_feature
{
  return self->_script_feature;
}

- (void)setScript_feature:(id)a3
{
  objc_storeStrong((id *)&self->_script_feature, a3);
}

- (MLMultiArray)script_score
{
  return self->_script_score;
}

- (void)setScript_score:(id)a3
{
  objc_storeStrong((id *)&self->_script_score, a3);
}

- (MLMultiArray)link_score_horizontal
{
  return self->_link_score_horizontal;
}

- (void)setLink_score_horizontal:(id)a3
{
  objc_storeStrong((id *)&self->_link_score_horizontal, a3);
}

- (MLMultiArray)link_score_vertical
{
  return self->_link_score_vertical;
}

- (void)setLink_score_vertical:(id)a3
{
  objc_storeStrong((id *)&self->_link_score_vertical, a3);
}

- (MLMultiArray)table_score
{
  return self->_table_score;
}

- (void)setTable_score:(id)a3
{
  objc_storeStrong((id *)&self->_table_score, a3);
}

- (MLMultiArray)orientation_score
{
  return self->_orientation_score;
}

- (void)setOrientation_score:(id)a3
{
  objc_storeStrong((id *)&self->_orientation_score, a3);
}

- (MLMultiArray)text_type_score
{
  return self->_text_type_score;
}

- (void)setText_type_score:(id)a3
{
  objc_storeStrong((id *)&self->_text_type_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_script_score, 0);
  objc_storeStrong((id *)&self->_text_type_score, 0);
  objc_storeStrong((id *)&self->_orientation_score, 0);
  objc_storeStrong((id *)&self->_table_score, 0);
  objc_storeStrong((id *)&self->_link_score_vertical, 0);
  objc_storeStrong((id *)&self->_link_score_horizontal, 0);
  objc_storeStrong((id *)&self->_script_feature, 0);
  objc_storeStrong((id *)&self->_region_score, 0);
}

@end
