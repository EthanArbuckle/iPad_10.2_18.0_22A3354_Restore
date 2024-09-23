@implementation PKPayLaterCardRenderer

- (BOOL)isInvalidated
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (PKPayLaterCardRenderer)init
{

  return 0;
}

- (id)_initWithRenderLoop:(void *)a3 overlayLoader:
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  float v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  objc_super v65;
  _OWORD v66[4];
  uint8_t buf[16];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && v6 && v7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v65.receiver = a1;
      v65.super_class = (Class)PKPayLaterCardRenderer;
      v11 = (id *)objc_msgSendSuper2(&v65, sel_init);
      a1 = v11;
      if (!v11)
      {
LABEL_19:
        a1 = a1;
        v9 = a1;
        goto LABEL_20;
      }
      objc_storeStrong(v11 + 4, a2);
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v13 = a1[3];
      a1[3] = v12;

      *((_OWORD *)a1 + 11) = xmmword_213A5D9E0;
      a1[25] = 0;
      a1[26] = 0;
      a1[24] = 0;
      objc_msgSend(v6, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      v15 = (void *)objc_msgSend(v14, "newDefaultLibraryWithBundle:error:", v10, &v64);
      v16 = v64;
      v17 = v16;
      if (v15)
      {

        objc_msgSend(v10, "pathForResource:ofType:", CFSTR("PayLater-CardView"), CFSTR("pipelinelib"));
        v18 = objc_claimAutoreleasedReturnValue();
        v62 = v14;
        v63 = (void *)v18;
        v61 = v10;
        if (v18)
          v60 = (void *)objc_msgSend(v14, "newPipelineLibraryWithFilePath:error:", v18, 0);
        else
          v60 = 0;
        v20 = objc_alloc_init(MEMORY[0x24BDDD770]);
        objc_msgSend(v20, "attributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFormat:", 29);
        objc_msgSend(v22, "setOffset:", 0);
        objc_msgSend(v22, "setBufferIndex:", 0);
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setFormat:", 29);
        objc_msgSend(v23, "setOffset:", 8);
        objc_msgSend(v23, "setBufferIndex:", 0);
        objc_msgSend(v20, "layouts");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "setStride:", 16);
        objc_msgSend(v25, "setStepRate:", 1);
        objc_msgSend(v25, "setStepFunction:", 1);

        v26 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
        objc_msgSend(v26, "setPipelineLibrary:", v60);
        objc_msgSend(v26, "setVertexDescriptor:", v20);
        v27 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_vertex"));
        objc_msgSend(v26, "setVertexFunction:", v27);

        objc_msgSend(v26, "colorAttachments");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));

        v30 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_fragment_background"));
        objc_msgSend(v26, "setFragmentFunction:", v30);
        v31 = objc_msgSend(v62, "newRenderPipelineStateWithDescriptor:error:", v26, 0);
        v32 = a1[6];
        a1[6] = (id)v31;

        v33 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
        objc_msgSend(v33, "setPipelineLibrary:", v60);
        v34 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_instanceVertex"));
        objc_msgSend(v33, "setVertexFunction:", v34);

        objc_msgSend(v33, "colorAttachments");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
        objc_msgSend(v36, "setBlendingEnabled:", 1);
        objc_msgSend(v36, "setRgbBlendOperation:", 0);
        objc_msgSend(v36, "setSourceRGBBlendFactor:", 4);
        objc_msgSend(v36, "setDestinationRGBBlendFactor:", 5);
        objc_msgSend(v36, "setAlphaBlendOperation:", 0);
        objc_msgSend(v36, "setDestinationAlphaBlendFactor:", 5);

        v37 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_fragment_instances"));
        objc_msgSend(v33, "setFragmentFunction:", v37);
        v38 = objc_msgSend(v62, "newRenderPipelineStateWithDescriptor:error:", v33, 0);
        v39 = a1[8];
        a1[8] = (id)v38;

        v40 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
        objc_msgSend(v40, "setPipelineLibrary:", v60);
        objc_msgSend(v40, "setVertexDescriptor:", v20);
        v41 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_vertex"));
        objc_msgSend(v40, "setVertexFunction:", v41);

        objc_msgSend(v40, "colorAttachments");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
        objc_msgSend(v43, "setBlendingEnabled:", 1);
        objc_msgSend(v43, "setRgbBlendOperation:", 0);
        objc_msgSend(v43, "setSourceRGBBlendFactor:", 4);
        objc_msgSend(v43, "setDestinationRGBBlendFactor:", 5);
        objc_msgSend(v43, "setAlphaBlendOperation:", 0);
        objc_msgSend(v43, "setSourceAlphaBlendFactor:", 1);
        objc_msgSend(v43, "setDestinationAlphaBlendFactor:", 1);

        v44 = (void *)objc_msgSend(v15, "newFunctionWithName:", CFSTR("payLaterCard_fragment_overlay"));
        objc_msgSend(v40, "setFragmentFunction:", v44);
        v45 = objc_msgSend(v62, "newRenderPipelineStateWithDescriptor:error:", v40, 0);
        v46 = a1[7];
        a1[7] = (id)v45;

        v47 = objc_msgSend(v62, "newCommandQueue");
        v48 = a1[5];
        a1[5] = (id)v47;

        objc_storeStrong(a1 + 12, a3);
        PKPassFrontFaceContentSize();
        v49 = 0;
        v52 = v51 / v50 * 32.0;
        a1[18] = (id)0x4042AAAAAAAAAAABLL;
        *((double *)a1 + 19) = v52 * 1.16666667;
        v53 = 600.0 / (v52 + v52);
        LODWORD(v54) = 0;
        *((float *)&v54 + 1) = v53;
        *(float *)&v52 = (v52 - v52) / (v52 + v52);
        LODWORD(v55) = 0;
        DWORD1(v55) = LODWORD(v52);
        *((_QWORD *)&v55 + 1) = __PAIR64__(-1.0, -7.0);
        *((_OWORD *)a1 + 10) = xmmword_213A5D9F0;
        v66[0] = xmmword_213A5DA00;
        v66[1] = v54;
        v66[2] = v55;
        v66[3] = xmmword_213A5DA10;
        *(_OWORD *)buf = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        do
        {
          *(float32x4_t *)&buf[v49 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_213A5D810, COERCE_FLOAT(v66[v49])), (float32x4_t)xmmword_213A5DA20, *(float32x2_t *)&v66[v49], 1), (float32x4_t)xmmword_213A5DA30, (float32x4_t)v66[v49], 2), (float32x4_t)xmmword_213A5DA40, (float32x4_t)v66[v49], 3);
          ++v49;
        }
        while (v49 != 4);
        v56 = v68;
        v57 = v69;
        v58 = v70;
        *((_OWORD *)a1 + 18) = *(_OWORD *)buf;
        *((_OWORD *)a1 + 19) = v56;
        *((_OWORD *)a1 + 20) = v57;
        *((_OWORD *)a1 + 21) = v58;
        *((_OWORD *)a1 + 23) = xmmword_213A5D820;
        *((_OWORD *)a1 + 24) = xmmword_213A5D820;

        v10 = v61;
        goto LABEL_19;
      }
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[PKPayLaterCardRenderer _initWithRenderLoop:overlayLoader:].cold.1((uint64_t)v17, v19);

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_213A36000, v19, OS_LOG_TYPE_DEFAULT, "PKPayLaterCardRenderer: could not load metal library - %@.", buf, 0xCu);
      }

    }
    v9 = 0;
LABEL_20:

  }
  return v9;
}

- (id)initWithRenderLoop:(uint64_t)a3 overlay:
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = v5;
  v7 = 0;
  if (a1 && v5 && a3)
  {
    objc_msgSend(v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKTextureLoadDescriptor initForDevice:]([PKTextureLoadDescriptor alloc], "initForDevice:", v8);
    v10 = (void *)objc_msgSend(v9, "createLoaderForCGImage:", a3);
    a1 = -[PKPayLaterCardRenderer _initWithRenderLoop:overlayLoader:](a1, v6, v10);

    v7 = a1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPayLaterCardRenderer invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCardRenderer;
  -[PKPayLaterCardRenderer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      *(_BYTE *)(a1 + 8) = 1;
      v2 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

      v3 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      v4 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v5 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      v7 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      v8 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      v9 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

      v10 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      v11 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = 0;

      v12 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      v13 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      v14 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = 0;

      v15 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

    }
  }
}

- (void)setMagnitudes:(uint64_t)a1
{
  id v3;
  double Current;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;

  v3 = a2;
  if (a1 && *(id *)(a1 + 16) != v3)
  {
    v31 = v3;
    Current = CFAbsoluteTimeGetCurrent();
    for (i = 0; ; ++i)
    {
      switch(i)
      {
        case 0:
          v6 = objc_msgSend(v31, "unknownCount", Current);
          v7 = objc_msgSend(*(id *)(a1 + 16), "unknownCount");
          v8 = v6 - v7;
          if (v6 - v7 >= 1)
          {
            v9 = a1;
            v10 = 0;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v7 - v6;
          v24 = a1;
          v25 = 0;
          break;
        case 1:
          v11 = objc_msgSend(v31, "foodAndDrinksCount", Current);
          v12 = objc_msgSend(*(id *)(a1 + 16), "foodAndDrinksCount");
          v8 = v11 - v12;
          if (v11 - v12 >= 1)
          {
            v9 = a1;
            v10 = 1;
LABEL_19:
            -[PKPayLaterCardRenderer _addInstances:category:time:](v9, v8, v10);
            continue;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v12 - v11;
          v24 = a1;
          v25 = 1;
          break;
        case 2:
          v13 = objc_msgSend(v31, "shoppingCount", Current);
          v14 = objc_msgSend(*(id *)(a1 + 16), "shoppingCount");
          v8 = v13 - v14;
          if (v13 - v14 >= 1)
          {
            v9 = a1;
            v10 = 2;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v14 - v13;
          v24 = a1;
          v25 = 2;
          break;
        case 3:
          v15 = objc_msgSend(v31, "travelCount", Current);
          v16 = objc_msgSend(*(id *)(a1 + 16), "travelCount");
          v8 = v15 - v16;
          if (v15 - v16 >= 1)
          {
            v9 = a1;
            v10 = 3;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v16 - v15;
          v24 = a1;
          v25 = 3;
          break;
        case 4:
          v17 = objc_msgSend(v31, "servicesCount", Current);
          v18 = objc_msgSend(*(id *)(a1 + 16), "servicesCount");
          v8 = v17 - v18;
          if (v17 - v18 >= 1)
          {
            v9 = a1;
            v10 = 4;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v18 - v17;
          v24 = a1;
          v25 = 4;
          break;
        case 5:
          v19 = objc_msgSend(v31, "funCount", Current);
          v20 = objc_msgSend(*(id *)(a1 + 16), "funCount");
          v8 = v19 - v20;
          if (v19 - v20 >= 1)
          {
            v9 = a1;
            v10 = 5;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v20 - v19;
          v24 = a1;
          v25 = 5;
          break;
        case 6:
          v21 = objc_msgSend(v31, "healthCount", Current);
          v22 = objc_msgSend(*(id *)(a1 + 16), "healthCount");
          v8 = v21 - v22;
          if (v21 - v22 >= 1)
          {
            v9 = a1;
            v10 = 6;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0)
            continue;
          v23 = v22 - v21;
          v24 = a1;
          v25 = 6;
          break;
        case 7:
          v26 = objc_msgSend(v31, "transportcount", Current);
          v27 = objc_msgSend(*(id *)(a1 + 16), "transportcount");
          v28 = v26 - v27;
          if (v26 - v27 < 1)
          {
            if ((v28 & 0x8000000000000000) != 0)
              -[PKPayLaterCardRenderer _removeInstances:category:time:](a1, v27 - v26, 7);
          }
          else
          {
            -[PKPayLaterCardRenderer _addInstances:category:time:](a1, v28, 7);
          }
          v29 = objc_msgSend(v31, "copy");
          v30 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v29;

          v3 = v31;
          goto LABEL_41;
        default:
          continue;
      }
      -[PKPayLaterCardRenderer _removeInstances:category:time:](v24, v23, v25);
    }
  }
LABEL_41:

}

- (uint64_t)_addInstances:(uint64_t)result category:(unint64_t)a2 time:(uint64_t)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint32_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  PKPayLaterCardRendererInstance *v17;
  float64x2_t v18;

  if (result)
  {
    v5 = result;
    result = -[PKPayLaterCardRenderer _countOfNonExplodingInstances](result);
    if (result + a2 <= 0x64)
    {
      v6 = *(double *)(v5 + 160);
      v7 = *(double *)(v5 + 144);
      v8 = *(double *)(v5 + 176);
      v9 = *(double *)(v5 + 184);
      v10 = arc4random_uniform(2u);
      if (a2)
      {
        v11 = 0;
        v12 = v6 * v9;
        v13 = v7 / v8;
        if (v10)
          v13 = -(v7 / v8);
        v14 = v13 * 0.3;
        if (a2 >= 4)
          v15 = 0.0;
        else
          v15 = v14;
        do
        {
          v16.f64[0] = v15 + v12 * ((double)v11 - (double)(a2 - 1) * 0.5);
          v16.f64[1] = *(float64_t *)(v5 + 152);
          v18 = v16;
          arc4random();
          v17 = -[PKPayLaterCardRendererInstance initWithPosition:scale:category:]([PKPayLaterCardRendererInstance alloc], "initWithPosition:scale:category:", a3, COERCE_DOUBLE(vcvt_f32_f64(v18)), *(double *)(v5 + 168));
          objc_msgSend(*(id *)(v5 + 24), "addObject:", v17);

          ++v11;
        }
        while (a2 != v11);
      }
      return objc_msgSend(*(id *)(v5 + 24), "sortUsingComparator:", &__block_literal_global_122);
    }
  }
  return result;
}

- (void)_removeInstances:(uint64_t)a1 category:(uint64_t)a2 time:(uint64_t)a3
{
  CFAbsoluteTime Current;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD v12[6];
  _QWORD v13[7];
  _QWORD v14[4];

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      v7 = *(void **)(a1 + 24);
      v8 = MEMORY[0x24BDAC760];
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke;
      v13[3] = &unk_24D0A0DA8;
      v13[4] = v14;
      v13[5] = a3;
      v13[6] = a2;
      objc_msgSend(v7, "pk_objectsPassingTest:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_2;
      v12[3] = &unk_24D0A0DD0;
      *(CFAbsoluteTime *)&v12[5] = Current;
      v12[4] = v14;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      objc_msgSend(*(id *)(a1 + 24), "sortUsingComparator:", &__block_literal_global_121);
      v10 = dispatch_time(0, 1400000000);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_3;
      v11[3] = &unk_24D0A0BA8;
      v11[4] = a1;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);

      _Block_object_dispose(v14, 8);
    }
  }
}

- (uint64_t)_countOfNonExplodingInstances
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(*(id *)(result + 24), "pk_objectsPassingTest:", &__block_literal_global_123);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "count");

    return v2;
  }
  return result;
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2;
  if (objc_msgSend(v6, "category") == a1[5] && (objc_msgSend(v6, "explodeTime"), v7 < 0.0))
  {
    v8 = ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v9 = a1[6];
    v10 = 1;
    if (v8 == v9)
      *a4 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  return objc_msgSend(a2, "explodeAtTime:", *(double *)(a1 + 40)+ (double)a3 / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pk_removeObjectsPassingTest:", &__block_literal_global_1);
}

BOOL __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_4(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "explodeTime");
  return v2 >= 0.0;
}

- (uint64_t)renderAtTime:(uint64_t)a1
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  _OWORD v22[4];
  uint64_t v23;

  v1 = a1;
  v23 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      return 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "device");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(v1 + 32), "isDrawableAvailable"))
      {
        objc_msgSend(*(id *)(v1 + 32), "currentDrawable");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3 && -[PKPayLaterCardRenderer _updateRenderPassDescriptorWithDrawable:]((_QWORD *)v1, v3))
        {
          v22[0] = xmmword_213A5DA98;
          v22[1] = unk_213A5DAA8;
          v22[2] = xmmword_213A5DAB8;
          v22[3] = unk_213A5DAC8;
          v4 = objc_msgSend(v2, "newBufferWithBytes:length:options:", v22, 64, 0);
          v5 = *(void **)(v1 + 104);
          *(_QWORD *)(v1 + 104) = v4;

          v21[0] = 0x3F0000003FC00000;
          v21[1] = 0xBF0000003FC00000;
          v21[2] = 0x3F000000BFC00000;
          v21[3] = 0xBF000000BFC00000;
          v6 = objc_msgSend(v2, "newBufferWithBytes:length:options:", v21, 32, 0);
          v7 = *(void **)(v1 + 112);
          *(_QWORD *)(v1 + 112) = v6;

          -[PKPayLaterCardRenderer _updateUniformsForDevice:](v1, v2);
          objc_msgSend(*(id *)(v1 + 40), "commandBuffer");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (*(_QWORD *)(v1 + 96))
          {
            objc_msgSend(v8, "blitCommandEncoder");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = *(void **)(v1 + 96);
            v18[0] = MEMORY[0x24BDAC760];
            v18[1] = 3221225472;
            v18[2] = __39__PKPayLaterCardRenderer_renderAtTime___block_invoke;
            v18[3] = &unk_24D0A0E38;
            v18[4] = v1;
            v19 = v2;
            v20 = v10;
            v12 = v10;
            objc_msgSend(v11, "read:", v18);
            v13 = *(void **)(v1 + 96);
            *(_QWORD *)(v1 + 96) = 0;

            objc_msgSend(v12, "endEncoding");
          }
          if (*(_QWORD *)(v1 + 136))
          {
            objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", *(_QWORD *)(v1 + 88));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setRenderPipelineState:", *(_QWORD *)(v1 + 48));
            objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v1 + 104), 0, 0);
            objc_msgSend(v14, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(v1 + 120), 0, 0);
            objc_msgSend(v14, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
            v15 = objc_msgSend(*(id *)(v1 + 24), "count");
            if (v15)
            {
              v16 = v15;
              objc_msgSend(v14, "setRenderPipelineState:", *(_QWORD *)(v1 + 64));
              objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v1 + 112), 0, 0);
              objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v1 + 120), 0, 1);
              objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v1 + 128), 0, 2);
              objc_msgSend(v14, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 4, 0, 4, v16);
            }
            objc_msgSend(v14, "setRenderPipelineState:", *(_QWORD *)(v1 + 56));
            objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(v1 + 104), 0, 0);
            objc_msgSend(v14, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(v1 + 120), 0, 0);
            objc_msgSend(v14, "setFragmentTexture:atIndex:", *(_QWORD *)(v1 + 136), 3);
            objc_msgSend(v14, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
            objc_msgSend(v14, "endEncoding");

            objc_msgSend(v9, "presentDrawable:", v3);
            objc_msgSend(v9, "commit");
          }
          else
          {
            -[PKPayLaterCardRenderer invalidate](v1);
          }

          v1 = 1;
        }
        else
        {
          v1 = 0;
        }
      }
      else
      {
        v1 = 0;
        v3 = 0;
      }

    }
  }
  return v1;
}

- (unint64_t)_updateRenderPassDescriptorWithDrawable:(_QWORD *)a1
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (unint64_t)a1;
  if (a1)
  {
    objc_msgSend(a2, "texture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "width");
    v5 = objc_msgSend(v3, "height");
    if (*(_QWORD *)(v2 + 72) != v4 || *(_QWORD *)(v2 + 80) != v5)
    {
      *(_QWORD *)(v2 + 72) = v4;
      *(_QWORD *)(v2 + 80) = v5;
      v6 = *(void **)(v2 + 88);
      *(_QWORD *)(v2 + 88) = 0;

      v4 = *(_QWORD *)(v2 + 72);
    }
    if (v4 && *(_QWORD *)(v2 + 80))
    {
      v7 = *(void **)(v2 + 88);
      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x24BDDD690]);
        v9 = *(void **)(v2 + 88);
        *(_QWORD *)(v2 + 88) = v8;

        v7 = *(void **)(v2 + 88);
      }
      objc_msgSend(v7, "colorAttachments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTexture:", v3);
      v2 = *(_QWORD *)(v2 + 88) != 0;

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)_updateUniformsForDevice:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  double Current;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float v15;
  __int128 v16;
  __int128 v17;
  float v18;
  unint64_t v19;
  __int128 v20;
  long double v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  float v30;
  unint64_t v31;
  __int128 v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int32x4_t v41;
  float32x2_t v42;
  float32x2_t v43;
  int32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  int32x4_t v50;
  float32x2_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  float v58;
  __int128 v59;
  __int128 v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  __int128 v67;
  float64x2_t v68;
  id v69;
  __int128 v70;
  id v71;
  __int128 v72;
  unsigned int v73;
  void *v74;
  size_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  float32x4_t v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  __int32 v96;
  double v97;
  unsigned int v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t j;
  void *v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  double v109;
  double v110;
  double v111;
  long double v112;
  float32x2_t v113;
  float32x2_t v114;
  float32x4_t v115;
  float32x4_t v116;
  uint64_t v117;
  __n128 v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  float32x2_t v125;
  uint64_t v126;
  double v127;
  uint64_t v128;
  _OWORD *v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  id v140;
  double v141;
  double v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  double v147;
  __int128 v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  float32x4_t v152;
  float32x4_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  float32x4_t v177;
  float32x4_t v178;
  __int128 v179;
  __int128 v180;
  float64x2_t v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _QWORD v187[18];

  v187[16] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 120))
    {
      v5 = objc_msgSend(v3, "newBufferWithLength:options:", 192, 0);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

    }
    Current = CFAbsoluteTimeGetCurrent();
    v8 = -[PKPayLaterCardRenderer _countOfActiveInstancesAtTime:](a1, Current);
    v9 = *(float *)(a1 + 368);
    v10 = *(float *)(a1 + 372);
    *(float *)&v149 = -v10;
    v11 = *(float *)(a1 + 376);
    v12 = *(float *)(a1 + 380);
    v13 = -(float)((float)(v10 * v12) - (float)(v9 * v11));
    *(float *)&v14 = (float)((float)((float)(v9 * v9) - (float)(v10 * v10)) - (float)(v11 * v11)) + (float)(v12 * v12);
    *((float *)&v14 + 1) = (float)((float)(v11 * v12) + (float)(v9 * v10))
                         + (float)((float)(v11 * v12) + (float)(v9 * v10));
    v153 = (float32x4_t)v14;
    v15 = (float)(v9 * v12) + (float)(v10 * v11);
    *(float *)&v14 = (float)-(float)((float)(v11 * v12) - (float)(v9 * v10))
                   - (float)((float)(v11 * v12) - (float)(v9 * v10));
    *((float *)&v14 + 1) = (float)((float)((float)(v10 * v10) - (float)(v11 * v11)) + (float)(v12 * v12))
                         - (float)(v9 * v9);
    *(float *)&v16 = (float)((float)(v10 * v12) + (float)(v11 * v9)) + (float)((float)(v10 * v12) + (float)(v11 * v9));
    *(float *)&v17 = (float)-(float)((float)(v9 * v12) - (float)(v10 * v11))
                   - (float)((float)(v9 * v12) - (float)(v10 * v11));
    v18 = (float)((float)(v12 * v12) + (float)(v11 * v11)) - (float)(v9 * v9);
    v138 = v17;
    v139 = v16;
    *(float *)&v19 = *(float *)&v16;
    HIDWORD(v19) = v17;
    v151 = v19;
    v152 = (float32x4_t)v14;
    *(double *)&v20 = (1.0 - pow(1.0 - fmin(fmax((double)(unint64_t)v8 / 30.0, 0.0), 1.0), 3.0)) * -1.2 + 2.2;
    v150 = v20;
    v21 = log((double)(unint64_t)v8);
    v22 = 0;
    v23.f64[0] = fmin(fmax(v21 * -0.9 + 5.0, 1.1), 2.42);
    *(_QWORD *)&v23.f64[1] = v150;
    v24 = vmlaq_f64(vmulq_f64(v23, (float64x2_t)vdupq_n_s64(0x3FA999999999999AuLL)), (float64x2_t)vdupq_n_s64(0x3FEE666666666666uLL), *(float64x2_t *)(a1 + 176));
    *(float64x2_t *)(a1 + 176) = v24;
    *(_QWORD *)&v150 = v8;
    if ((unint64_t)(v8 - 3) >= 0x12)
      v25 = 0.0;
    else
      v25 = 1.0;
    v26 = 0.05;
    v27 = *(double *)(a1 + 200);
    v28 = v25 * 0.05 + *(double *)(a1 + 192) * 0.95;
    if (!*(_BYTE *)(a1 + 352))
      v26 = 0.0;
    *(double *)(a1 + 192) = v28;
    *(double *)(a1 + 200) = v26 + v27 * 0.95;
    *(float *)&v29 = v24.f64[0];
    v30 = *(float *)&v29;
    LODWORD(v31) = 0;
    HIDWORD(v31) = v29;
    *(_QWORD *)&v32 = 0;
    *((_QWORD *)&v32 + 1) = v29;
    v33 = vrsqrte_f32((float32x2_t)1206862336);
    v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)1206862336, vmul_f32(v33, v33)));
    v35 = vmulq_n_f32((float32x4_t)xmmword_213A5DA50, vmul_f32(v34, vrsqrts_f32((float32x2_t)1206862336, vmul_f32(v34, v34))).f32[0]);
    v36 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL);
    v37 = vmlaq_f32(vmulq_f32(v36, (float32x4_t)xmmword_213A5DA60), (float32x4_t)xmmword_213A5D9D0, v35);
    v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
    v39 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38), (int8x16_t)v38, 0xCuLL), vnegq_f32(v35)), v38, v36);
    v40 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v39, (int32x4_t)v39), (int8x16_t)v39, 0xCuLL);
    v41 = (int32x4_t)vmulq_f32(v37, v37);
    v41.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), *(float32x2_t *)v41.i8)).u32[0];
    v42 = vrsqrte_f32((float32x2_t)v41.u32[0]);
    v43 = vmul_f32(v42, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v42, v42)));
    v47 = vmulq_n_f32(v38, vmul_f32(v43, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v43, v43))).f32[0]);
    v44 = (int32x4_t)vmulq_f32(v39, v39);
    v44.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), *(float32x2_t *)v44.i8)).u32[0];
    *(float32x2_t *)v39.f32 = vrsqrte_f32((float32x2_t)v44.u32[0]);
    *(float32x2_t *)v39.f32 = vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32)));
    v45 = vmulq_n_f32(v40, vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32))).f32[0]);
    v48.i64[0] = __PAIR64__(v45.u32[1], v47.u32[1]);
    v49.i64[0] = __PAIR64__(v45.u32[2], v47.u32[2]);
    v46 = (int32x4_t)vmulq_f32(v47, (float32x4_t)xmmword_213A5DA50);
    v47.i32[1] = v45.i32[0];
    v47.i64[1] = v35.u32[0];
    v48.i64[1] = v35.u32[1];
    v49.i64[1] = v35.u32[2];
    v50 = (int32x4_t)vmulq_f32(v45, (float32x4_t)xmmword_213A5DA50);
    v51 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v46.i8, *(int32x2_t *)v50.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v46.i8, *(int32x2_t *)v50.i8));
    v52 = (float32x4_t)vzip2q_s32(v46, v50);
    v53 = vmulq_f32(v35, (float32x4_t)xmmword_213A5DA50);
    *(float32x2_t *)v52.f32 = vadd_f32(*(float32x2_t *)v52.f32, v51);
    v35.f32[0] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).f32[0];
    v54.i64[0] = vnegq_f32(v52).u64[0];
    v54.i64[1] = __PAIR64__(1.0, v35.u32[0]);
    v154 = LODWORD(v30);
    v155 = v31;
    v156 = v32;
    v157 = xmmword_213A5D820;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    do
    {
      *(__int128 *)((char *)&v173 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(__int128 *)((char *)&v154 + v22))), v48, *(float32x2_t *)((char *)&v154 + v22), 1), v49, *(float32x4_t *)((char *)&v154 + v22), 2), v54, *(float32x4_t *)((char *)&v154 + v22), 3);
      v22 += 16;
    }
    while (v22 != 64);
    v140 = v4;
    v55 = 0;
    v56 = v173;
    v57 = v174;
    v58 = v18 + (float)(*(float *)&v149 * v10);
    v59 = v175;
    v60 = v176;
    *(_OWORD *)(a1 + 224) = v173;
    *(_OWORD *)(a1 + 240) = v57;
    *(_OWORD *)(a1 + 256) = v59;
    *(_OWORD *)(a1 + 272) = v60;
    v61 = *(float32x4_t *)(a1 + 288);
    v62 = *(float32x4_t *)(a1 + 304);
    v63 = *(float32x4_t *)(a1 + 320);
    v64 = *(float32x4_t *)(a1 + 336);
    v154 = v56;
    v155 = v57;
    v156 = v59;
    v157 = v60;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    do
    {
      *(__int128 *)((char *)&v173 + v55) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(__int128 *)((char *)&v154 + v55))), v62, *(float32x2_t *)((char *)&v154 + v55), 1), v63, *(float32x4_t *)((char *)&v154 + v55), 2), v64, *(float32x4_t *)((char *)&v154 + v55), 3);
      v55 += 16;
    }
    while (v55 != 64);
    v66 = v152;
    v65 = v153;
    v65.f32[2] = v13 + v13;
    v66.f32[2] = v15 + v15;
    v67 = v151;
    *((float *)&v67 + 2) = v58;
    v177 = v65;
    v178 = v66;
    v179 = v67;
    v180 = xmmword_213A5D820;
    v68 = vcvtq_f64_u64(*(uint64x2_t *)(a1 + 72));
    *(float32x2_t *)&v68.f64[0] = vcvt_f32_f64(v68);
    v181 = v68;
    objc_msgSend(MEMORY[0x24BE6EA88], "colorWithR:G:B:A:", 0.09, 0.09, 0.09, 1.0);
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(double *)&v70 = PKMakeFloat4FromCGColor((CGColor *)objc_msgSend(v69, "CGColor"));
    v182 = v70;
    objc_msgSend(MEMORY[0x24BE6EA88], "colorWithR:G:B:A:", 0.0, 0.0, 0.0, 1.0);
    v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(double *)&v72 = PKMakeFloat4FromCGColor((CGColor *)objc_msgSend(v71, "CGColor"));
    *(float *)&v73 = *(double *)(a1 + 208);
    v183 = v72;
    v184 = v73;

    v74 = (void *)objc_msgSend(*(id *)(a1 + 120), "contents");
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 120), "length") > 0xBF)
      v75 = 192;
    else
      v75 = objc_msgSend(*(id *)(a1 + 120), "length");
    memcpy(v74, &v173, v75);
    v77 = *(double *)(a1 + 176);
    v76 = *(double *)(a1 + 184);
    v78 = *(double *)(a1 + 144);
    v79 = *(double *)(a1 + 160);
    v80 = *(double *)(a1 + 152) / v77;
    v141 = *(double *)(a1 + 192);
    v142 = v76;
    if (*(double *)(a1 + 208) <= 0.0)
      v81 = v80 * 0.1;
    else
      v81 = 0.0;
    v147 = v81;
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    *(_QWORD *)&v151 = *(id *)(a1 + 24);
    v82 = objc_msgSend((id)v151, "countByEnumeratingWithState:objects:count:", &v169, v187, 16);
    if (v82)
    {
      v84 = v82;
      v85 = v79 * v142;
      *(double *)v83.i64 = v79 * 0.125;
      v86 = v79 * 0.125 - v78 / v77;
      v87 = v78 / v77 - *(double *)v83.i64;
      v88 = -(v80 - *(double *)v83.i64 * (v141 + 1.0));
      *(double *)v83.i64 = -(*(double *)v83.i64 * (v141 + 4.0));
      v89 = *(double *)v83.i64 + v80 * 0.52;
      v90 = *(_QWORD *)v170;
      v83.f32[0] = v87;
      v144 = v83;
      v83.f32[0] = v86;
      v146 = v83;
      v83.f32[0] = v89;
      v143 = v83;
      v83.f32[0] = v88;
      v145 = v83;
      v148 = xmmword_213A5DA70;
      v149 = v90;
      do
      {
        for (i = 0; i != v84; ++i)
        {
          if (*(_QWORD *)v170 != v90)
            objc_enumerationMutation((id)v151);
          v92 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
          if ((objc_msgSend(v92, "isIgnoredAtTime:", Current, (_QWORD)v138, *((_QWORD *)&v138 + 1)) & 1) == 0)
          {
            objc_msgSend(v92, "position");
            v153 = v93;
            objc_msgSend(v92, "velocity");
            if (v86 > v153.f32[0])
            {
              v94 = v146;
              goto LABEL_29;
            }
            if (v87 >= v153.f32[0])
            {
              v94 = v153;
            }
            else
            {
              v94 = v144;
LABEL_29:
              *(uint64_t *)((char *)v94.i64 + 4) = *(uint64_t *)((char *)v153.i64 + 4);
            }
            if (v88 > v94.f32[1])
            {
              v95 = v94;
              v96 = v145.i32[0];
              goto LABEL_35;
            }
            if (v89 < v94.f32[1])
            {
              v95 = v94;
              v96 = v143.i32[0];
LABEL_35:
              v95.i32[1] = v96;
              v95.i32[2] = v94.i32[2];
              v94 = v95;
            }
            v153 = v94;
            objc_msgSend(v92, "setPosition:andVelocity:");
            v97 = *(double *)&v148;
            if ((unint64_t)v150 <= 0x1B)
            {
              *(float *)&v98 = v147 + v153.f32[1];
              *(_QWORD *)&v97 = vmulq_f32((float32x4_t)__PAIR64__(v98, v153.u32[0]), (float32x4_t)xmmword_213A5DA80).u64[0];
            }
            objc_msgSend(v92, "addForces:", v97);
            v167 = 0u;
            v168 = 0u;
            v165 = 0u;
            v166 = 0u;
            v99 = a1;
            v100 = *(id *)(a1 + 24);
            v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v165, v186, 16);
            if (v101)
            {
              v102 = v101;
              v103 = *(_QWORD *)v166;
              do
              {
                for (j = 0; j != v102; ++j)
                {
                  if (*(_QWORD *)v166 != v103)
                    objc_enumerationMutation(v100);
                  v105 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * j);
                  if (v105 != v92
                    && (objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * j), "isIgnoredAtTime:", Current) & 1) == 0)
                  {
                    objc_msgSend(v92, "position");
                    v153 = v106;
                    objc_msgSend(v105, "position");
                    v153 = vsubq_f32(v153, v107);
                    v108 = vmulq_f32(v153, v153);
                    v108.f32[0] = vaddv_f32(*(float32x2_t *)v108.f32);
                    v152 = v108;
                    v109 = sqrtf(v108.f32[0]);
                    objc_msgSend(v92, "size");
                    v111 = v85 * v110;
                    if (v111 > v109)
                    {
                      v112 = pow(v109 / v111, 8.0);
                      v113 = vrsqrte_f32((float32x2_t)v152.u32[0]);
                      v114 = vmul_f32(v113, vrsqrts_f32((float32x2_t)v152.u32[0], vmul_f32(v113, v113)));
                      *(float32x2_t *)v115.f32 = vmul_n_f32(*(float32x2_t *)v153.f32, vmul_f32(v114, vrsqrts_f32((float32x2_t)v152.u32[0], vmul_f32(v114, v114))).f32[0]);
                      v115.i32[2] = 0;
                      *(float *)&v112 = 1.0 - v112;
                      v116 = vmulq_n_f32(v115, *(float *)&v112);
                      v115.i64[0] = 0x3F0000003F000000;
                      v115.i64[1] = 0x3F0000003F000000;
                      v153 = vmulq_f32(v116, v115);
                      objc_msgSend(v92, "addForces:");
                      objc_msgSend(v105, "addForces:", *(double *)vnegq_f32(v153).i64);
                    }
                  }
                }
                v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v165, v186, 16);
              }
              while (v102);
            }

            objc_msgSend(v92, "applyForces");
            a1 = v99;
            v90 = v149;
            continue;
          }
        }
        v84 = objc_msgSend((id)v151, "countByEnumeratingWithState:objects:count:", &v169, v187, 16);
      }
      while (v84);
    }

    v117 = objc_msgSend(*(id *)(a1 + 24), "count");
    if (v117)
    {
      v152.i64[0] = (uint64_t)&v138;
      v119 = 112 * v117;
      MEMORY[0x24BDAC7A8](v118);
      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      v153.i64[0] = a1;
      v120 = *(id *)(a1 + 24);
      v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v161, v185, 16);
      if (v121)
      {
        v122 = v121;
        v123 = 0;
        v124 = v142 * v141;
        v125.i32[0] = v139;
        v125.f32[1] = -*(float *)&v138;
        v126 = *(_QWORD *)v162;
        v127 = COERCE_DOUBLE(vmul_f32(v125, (float32x2_t)vdup_n_s32(0x40066666u)));
        do
        {
          v128 = 0;
          v129 = (__int128 *)((char *)&v138 + 112 * v123 - v119);
          do
          {
            if (*(_QWORD *)v162 != v126)
              objc_enumerationMutation(v120);
            v130 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v128);
            v159 = 0u;
            v160 = 0u;
            v157 = 0u;
            v158 = 0u;
            v155 = 0u;
            v156 = 0u;
            v154 = 0u;
            if (v130)
              objc_msgSend(v130, "uniformWithSkew:now:waveAmplitude:", v127, Current, v124);
            v131 = v159;
            v129[4] = v158;
            v129[5] = v131;
            v129[6] = v160;
            v132 = v155;
            *v129 = v154;
            v129[1] = v132;
            v133 = v157;
            ++v128;
            v129[2] = v156;
            v129[3] = v133;
            v129 += 7;
          }
          while (v122 != v128);
          v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v161, v185, 16);
          v123 += v128;
        }
        while (v122);
      }

      v4 = v140;
      v134 = objc_msgSend(v140, "newBufferWithBytes:length:options:", (char *)&v138 - v119, v119, 0);
      v135 = *(void **)(v153.i64[0] + 128);
      *(_QWORD *)(v153.i64[0] + 128) = v134;

    }
    else
    {
      v4 = v140;
      v136 = objc_msgSend(v140, "newBufferWithLength:options:", 0, 0);
      v137 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v136;

    }
  }

}

void __39__PKPayLaterCardRenderer_renderAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = DefaultPrivate2DTexture;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213A36000, v6, OS_LOG_TYPE_DEFAULT, "PKPayLaterCardRenderer: could not load overlay texture.", v7, 2u);
    }

  }
}

- (uint64_t)_countOfActiveInstancesAtTime:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (result)
  {
    v2 = *(void **)(result + 24);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__PKPayLaterCardRenderer__countOfActiveInstancesAtTime___block_invoke;
    v5[3] = &__block_descriptor_40_e47_B32__0__PKPayLaterCardRendererInstance_8Q16_B24l;
    *(double *)&v5[4] = a2;
    objc_msgSend(v2, "pk_objectsPassingTest:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  return result;
}

uint64_t __53__PKPayLaterCardRenderer__sortInstancesByExplodeTime__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "explodeTime");
  v6 = v5;
  objc_msgSend(v4, "explodeTime");
  v8 = v7;

  v9 = -1;
  if (v6 <= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

uint64_t __48__PKPayLaterCardRenderer__sortInstancesByZOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  float v10;

  v4 = a3;
  objc_msgSend(a2, "position");
  v6 = v5;
  objc_msgSend(v4, "position");
  v10 = v7;

  v8 = -1;
  if (v6 <= v10)
    v8 = 1;
  if (v6 == v10)
    return 0;
  else
    return v8;
}

BOOL __55__PKPayLaterCardRenderer__countOfNonExplodingInstances__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "explodeTime");
  return v2 < 0.0;
}

uint64_t __56__PKPayLaterCardRenderer__countOfActiveInstancesAtTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isIgnoredAtTime:", *(double *)(a1 + 32)) ^ 1;
}

- (double)rotation
{
  __int128 v1;

  if (a1)
    v1 = *(_OWORD *)(a1 + 368);
  else
    *(_QWORD *)&v1 = 0;
  return *(double *)&v1;
}

- (__n128)setRotation:(__n128 *)result
{
  if (result)
    result[23] = a2;
  return result;
}

- (__n128)setGravity:(__n128 *)result
{
  if (result)
    result[24] = a2;
  return result;
}

- (BOOL)isPresented
{
  if (result)
    return *(_BYTE *)(result + 352) != 0;
  return result;
}

- (uint64_t)setPresented:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 352) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_instanceUniforms, 0);
  objc_storeStrong((id *)&self->_uniform, 0);
  objc_storeStrong((id *)&self->_instanceVertexCoords, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_overlayLoader, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_instancePipelineState, 0);
  objc_storeStrong((id *)&self->_overlayPipelineState, 0);
  objc_storeStrong((id *)&self->_backgroundPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_loop, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_magnitudes, 0);
}

- (void)_initWithRenderLoop:(uint64_t)a1 overlayLoader:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_213A36000, a2, OS_LOG_TYPE_FAULT, "PKPayLaterCardRenderer: could not load metal library - %@.", (uint8_t *)&v2, 0xCu);
}

@end
