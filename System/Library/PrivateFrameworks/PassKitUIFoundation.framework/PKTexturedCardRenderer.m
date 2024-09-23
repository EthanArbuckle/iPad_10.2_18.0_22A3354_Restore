@implementation PKTexturedCardRenderer

- (__n128)setRotation:(__n128 *)result
{
  if (result)
    result[11] = a2;
  return result;
}

- (void)renderAtTime:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  size_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64x2_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float64x2_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  NSObject *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  _BYTE __src[32];
  __int128 v51;
  __int128 v52;
  float32x4_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    if (!objc_msgSend(*(id *)(a1 + 24), "isDrawableAvailable"))
    {
      v2 = 0;
LABEL_41:

      return;
    }
    objc_msgSend(*(id *)(a1 + 24), "currentDrawable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2 || !-[PKTexturedCardRenderer updateRenderPassDescriptorWithDrawable:]((_QWORD *)a1, v2))
      goto LABEL_41;
    objc_msgSend(*(id *)(a1 + 24), "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!*(_QWORD *)(a1 + 96))
    {
      v5 = objc_msgSend(v3, "newBufferWithBytes:length:options:", &renderAtTime__vertices, 64, 32);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      if (!*(_QWORD *)(a1 + 96))
        goto LABEL_40;
    }
    if (!*(_QWORD *)(a1 + 104))
    {
      v25 = *(_QWORD *)(a1 + 16);
      if (v25 > 4
        || (v26 = objc_msgSend(v4, "newBufferWithLength:options:", qword_213A5DCE0[v25], 0),
            v27 = *(void **)(a1 + 104),
            *(_QWORD *)(a1 + 104) = v26,
            v27,
            !*(_QWORD *)(a1 + 104)))
      {
LABEL_40:

        goto LABEL_41;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_QWORD *)(a1 + 72) || *(_QWORD *)(a1 + 80) || *(_QWORD *)(a1 + 88))
    {
      objc_msgSend(v7, "blitCommandEncoder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 72);
      v11 = MEMORY[0x24BDAC760];
      if (v10)
      {
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke;
        v47[3] = &unk_24D0A0E38;
        v47[4] = a1;
        v48 = v4;
        v49 = v9;
        objc_msgSend(v10, "read:", v47);
        v12 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;

      }
      v13 = *(void **)(a1 + 80);
      if (v13)
      {
        v44[0] = v11;
        v44[1] = 3221225472;
        v44[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke_49;
        v44[3] = &unk_24D0A0E38;
        v44[4] = a1;
        v45 = v4;
        v46 = v9;
        objc_msgSend(v13, "read:", v44);
        v14 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = 0;

      }
      v15 = *(void **)(a1 + 88);
      if (v15)
      {
        v41[0] = v11;
        v41[1] = 3221225472;
        v41[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke_50;
        v41[3] = &unk_24D0A0E38;
        v41[4] = a1;
        v42 = v4;
        v43 = v9;
        objc_msgSend(v15, "read:", v41);
        v16 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = 0;

      }
      objc_msgSend(v9, "endEncoding");

    }
    v17 = *(_QWORD *)(a1 + 16);
    if (v17 < 5)
    {
      v18 = *(void **)(a1 + 112);
      if (!v18)
        goto LABEL_43;
      if (v17 < 3)
      {
        if (*(_QWORD *)(a1 + 152) && *(_QWORD *)(a1 + 160))
        {
          if (v17 != 1)
          {
            *(double *)&v19 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
            *(_OWORD *)__src = v19;
            *(_OWORD *)&__src[16] = v20;
            v51 = v21;
            v52 = v22;
            v23 = (void *)objc_msgSend(*(id *)(a1 + 104), "contents");
            if ((unint64_t)objc_msgSend(*(id *)(a1 + 104), "length") > 0x3F)
            {
              v24 = 64;
LABEL_38:
              memcpy(v23, __src, v24);
              objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", *(_QWORD *)(a1 + 64));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setRenderPipelineState:", *(_QWORD *)(a1 + 40));
              objc_msgSend(v39, "setVertexBuffer:offset:atIndex:", *(_QWORD *)(a1 + 96), 0, 0);
              objc_msgSend(v39, "setFragmentBuffer:offset:atIndex:", *(_QWORD *)(a1 + 104), 0, 0);
              objc_msgSend(v39, "setFragmentTexture:atIndex:", *(_QWORD *)(a1 + 112), 0);
              objc_msgSend(v39, "setFragmentTexture:atIndex:", *(_QWORD *)(a1 + 152), 1);
              objc_msgSend(v39, "setFragmentTexture:atIndex:", *(_QWORD *)(a1 + 160), 2);
              objc_msgSend(v39, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
              objc_msgSend(v39, "endEncoding");

              objc_msgSend(v8, "presentDrawable:", v2);
              objc_msgSend(v8, "commit");
LABEL_39:

              goto LABEL_40;
            }
LABEL_36:
            v24 = objc_msgSend(*(id *)(a1 + 104), "length");
            goto LABEL_38;
          }
          v53 = 0uLL;
          *(double *)&v35 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
          *(_OWORD *)__src = v35;
          *(_OWORD *)&__src[16] = v36;
          v51 = v37;
          v52 = v38;
          v53.i32[0] = *(_DWORD *)(a1 + 168);
LABEL_35:
          v23 = (void *)objc_msgSend(*(id *)(a1 + 104), "contents");
          if ((unint64_t)objc_msgSend(*(id *)(a1 + 104), "length") > 0x4F)
          {
            v24 = 80;
            goto LABEL_38;
          }
          goto LABEL_36;
        }
LABEL_43:
        PKLogFacilityTypeGetObject();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__src = 134218240;
          *(_QWORD *)&__src[4] = a1;
          *(_WORD *)&__src[12] = 2048;
          *(_QWORD *)&__src[14] = v17;
          _os_log_impl(&dword_213A36000, v40, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): required textures missing - invalidating.", __src, 0x16u);
        }

        -[PKTexturedCardRenderer invalidate](a1);
        goto LABEL_39;
      }
      if (v17 - 3 < 2)
      {
        v28 = objc_msgSend(v18, "width");
        v29 = objc_msgSend(*(id *)(a1 + 112), "height");
        *(double *)v30.i64 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
        *(uint64x2_t *)__src = v30;
        *(_OWORD *)&__src[16] = v31;
        v51 = v32;
        v52 = v33;
        v30.i64[0] = v29;
        v30.i64[1] = v28;
        v34 = vcvtq_f64_u64(v30);
        v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(*(float64x2_t *)(a1 + 120), v34)), vdivq_f64(*(float64x2_t *)(a1 + 136), v34));
        goto LABEL_35;
      }
    }
    __break(1u);
  }
}

- (unint64_t)updateRenderPassDescriptorWithDrawable:(_QWORD *)a1
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (unint64_t)a1;
  if (a1)
  {
    objc_msgSend(a2, "texture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "width");
    v5 = objc_msgSend(v3, "height");
    if (*(_QWORD *)(v2 + 48) != v4 || *(_QWORD *)(v2 + 56) != v5)
    {
      *(_QWORD *)(v2 + 48) = v4;
      *(_QWORD *)(v2 + 56) = v5;
      v6 = *(void **)(v2 + 64);
      *(_QWORD *)(v2 + 64) = 0;

      v4 = *(_QWORD *)(v2 + 48);
    }
    if (v4 && *(_QWORD *)(v2 + 56))
    {
      v7 = *(void **)(v2 + 64);
      v8 = v7;
      if (!v7)
      {
        v9 = objc_alloc_init(MEMORY[0x24BDDD690]);
        v10 = *(void **)(v2 + 64);
        *(_QWORD *)(v2 + 64) = v9;

        v8 = *(void **)(v2 + 64);
      }
      objc_msgSend(v8, "colorAttachments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v7)
      {
        objc_msgSend(v12, "setLoadAction:", 0);
        objc_msgSend(v13, "setStoreAction:", 1);
      }
      objc_msgSend(v13, "setTexture:", v3);
      v2 = *(_QWORD *)(v2 + 64) != 0;

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (double)rotation
{
  __int128 v1;

  if (a1)
    v1 = *(_OWORD *)(a1 + 176);
  else
    *(_QWORD *)&v1 = 0;
  return *(double *)&v1;
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = DefaultPrivate2DTexture;

  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 112))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v6 + 16);
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load diffuse texture.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(uint64_t)a5 metalness:(uint64_t)a6 normal:
{
  id *result;
  id *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  result = a3;
  v12 = result;
  if (!a1)
  {
    v13 = 0;
LABEL_8:

    return v13;
  }
  if (a2 <= 2)
  {
    v13 = 0;
    if (result && a4 && a5)
    {
      if (a6)
      {
        objc_msgSend(result, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKTextureLoadDescriptor initForDevice:]([PKTextureLoadDescriptor alloc], "initForDevice:", v14);
        v16 = (void *)objc_msgSend(v15, "createLoaderForCGImage:", a4);
        v17 = (void *)objc_msgSend(v15, "createLoaderForCGImage:", a5);
        v18 = (void *)objc_msgSend(v15, "createLoaderForCGImage:", a6);
        a1 = -[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:](a1, a2, v12, v16, v17, v18);

        v13 = a1;
      }
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

- (id)_initWithStyle:(void *)a3 renderLoop:(void *)a4 diffuseLoader:(void *)a5 metalnessLoader:(void *)a6 normalLoader:
{
  void *v6;
  void *v10;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id *v41;
  id v42;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id obj;
  void *v55;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  id *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v10 = a3;
  v65 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v55 = v16;
  if (!a1)
  {
    v41 = 0;
    goto LABEL_33;
  }
  if (!v13 || a2 >= 5 || !v14)
    goto LABEL_14;
  if (a2 >= 3)
  {
    if (a2 - 3 < 2)
      goto LABEL_8;
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!v15 || !v16)
    goto LABEL_14;
LABEL_8:
  obj = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_31:
    v41 = 0;
    goto LABEL_32;
  }
  v58.receiver = a1;
  v58.super_class = (Class)PKTexturedCardRenderer;
  v17 = (id *)objc_msgSendSuper2(&v58, sel_init);
  a1 = v17;
  if (v17)
  {
    v47 = a6;
    v53 = v15;
    v17[2] = (id)a2;
    objc_storeStrong(v17 + 3, v10);
    objc_msgSend(v13, "device");
    a5 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v18 = objc_msgSend(a5, "newDefaultLibraryWithBundle:error:", v6, &v57);
    v19 = v57;
    v10 = v19;
    v51 = (void *)v18;
    if (v18)
    {
      v52 = a5;
      v48 = v14;
      v49 = v13;

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
      objc_msgSend(v6, "pathForResource:ofType:", off_24D0A16E8[a2], CFSTR("pipelinelib"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v28 = (void *)objc_msgSend(v52, "newPipelineLibraryWithFilePath:error:", v27, 0);
      else
        v28 = 0;
      objc_msgSend(v26, "setPipelineLibrary:", v28);

      objc_msgSend(v26, "setVertexDescriptor:", v20);
      v10 = v51;
      v31 = (void *)objc_msgSend(v51, "newFunctionWithName:", CFSTR("texturedCard_vertex"));
      v50 = v26;
      objc_msgSend(v26, "setVertexFunction:", v31);

      v13 = v49;
      v32 = objc_msgSend(v51, "newFunctionWithName:", off_24D0A1710[a2]);
      if (v32)
      {
        v33 = v32;
        objc_msgSend(v50, "setFragmentFunction:", v32);
        objc_msgSend(v50, "colorAttachments");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setPixelFormat:", objc_msgSend(v49, "pixelFormat"));

        v56 = 0;
        v36 = objc_msgSend(v52, "newRenderPipelineStateWithDescriptor:error:", v50, &v56);
        v37 = v56;
        v38 = a1[5];
        a1[5] = (id)v36;

        if (a1[5])
        {

          v39 = objc_msgSend(v52, "newCommandQueue");
          v40 = a1[4];
          a1[4] = (id)v39;

          objc_storeStrong(a1 + 9, a4);
          objc_storeStrong(a1 + 10, obj);
          objc_storeStrong(a1 + 11, v47);
          *((_OWORD *)a1 + 11) = xmmword_213A5D820;
          *((_DWORD *)a1 + 42) = 1065353216;

          v14 = v48;
          goto LABEL_24;
        }
        PKLogFacilityTypeGetObject();
        v44 = objc_claimAutoreleasedReturnValue();
        v14 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = a1[2];
          *(_DWORD *)buf = 134218498;
          v60 = a1;
          v61 = 2048;
          v62 = v45;
          v63 = 2114;
          v64 = v37;
          _os_log_impl(&dword_213A36000, v44, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load pipeline - %{public}@.", buf, 0x20u);
        }

        a5 = v52;
        v15 = v53;
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          -[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:].cold.1((uint64_t)a1, (uint64_t *)a1 + 2, v33);

        v14 = v48;
        a5 = v52;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v42 = a1[2];
          *(_DWORD *)buf = 134218240;
          v60 = a1;
          v61 = 2048;
          v62 = v42;
          _os_log_impl(&dword_213A36000, v33, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load fragment function.", buf, 0x16u);
        }
      }

      goto LABEL_30;
    }
LABEL_15:
    PKLogFacilityTypeGetObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      v46 = a1[2];
      *(_DWORD *)buf = 134218498;
      v60 = a1;
      v61 = 2048;
      v62 = v46;
      v63 = 2114;
      v64 = v10;
      _os_log_fault_impl(&dword_213A36000, v29, OS_LOG_TYPE_FAULT, "PKTexturedCardRenderer (%p:%ld): could not load metal library - %{public}@.", buf, 0x20u);
    }

    v15 = v53;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = a1[2];
      *(_DWORD *)buf = 134218498;
      v60 = a1;
      v61 = 2048;
      v62 = v30;
      v63 = 2114;
      v64 = v10;
      _os_log_impl(&dword_213A36000, v29, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load metal library - %{public}@.", buf, 0x20u);
    }

LABEL_30:
    goto LABEL_31;
  }
LABEL_24:
  a1 = a1;
  v41 = a1;
LABEL_32:

LABEL_33:
  return v41;
}

- (PKTexturedCardRenderer)init
{

  return 0;
}

- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(double)a5 insets:(double)a6
{
  id v15;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  double *v21;

  v15 = a3;
  v16 = v15;
  if (!a1)
    goto LABEL_11;
  if (a2 >= 5 || a2 - 3 >= 2)
  {
    __break(1u);
LABEL_11:
    v17 = 0;
    goto LABEL_9;
  }
  v17 = 0;
  if (v15 && a4)
  {
    objc_msgSend(v15, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKTextureLoadDescriptor initForDevice:]([PKTextureLoadDescriptor alloc], "initForDevice:", v18);
    v20 = (void *)objc_msgSend(v19, "createLoaderForCGImage:", a4);
    v21 = (double *)-[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:](a1, a2, v16, v20, 0, 0);
    if (v21)
    {
      v21[15] = a5;
      v21[16] = a6;
      v21[17] = a7;
      v21[18] = a8;
    }
    a1 = v21;

    v17 = a1;
  }
LABEL_9:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[PKTexturedCardRenderer invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKTexturedCardRenderer;
  -[PKTexturedCardRenderer dealloc](&v3, sel_dealloc);
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

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 8))
    {
      *(_BYTE *)(a1 + 8) = 1;
      v2 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      v3 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v4 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v5 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = 0;

      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = 0;

      v7 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v8 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      v9 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

      v10 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = 0;

      v11 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = 0;

      v12 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = 0;

      v13 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

    }
  }
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke_49(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  *(_QWORD *)(v4 + 152) = DefaultPrivate2DTexture;

  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 152))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v6 + 16);
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load metalness texture.", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke_50(uint64_t a1, uint64_t a2)
{
  void *DefaultPrivate2DTexture;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 160);
  *(_QWORD *)(v4 + 160) = DefaultPrivate2DTexture;

  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 160))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v6 + 16);
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_213A36000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load normal texture.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (uint64_t)setLightIntensity:(uint64_t)result
{
  if (result)
    *(float *)(result + 168) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normal, 0);
  objc_storeStrong((id *)&self->_metalness, 0);
  objc_storeStrong((id *)&self->_diffuse, 0);
  objc_storeStrong((id *)&self->_uniform, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_normalLoader, 0);
  objc_storeStrong((id *)&self->_metalnessLoader, 0);
  objc_storeStrong((id *)&self->_diffuseLoader, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_loop, 0);
}

- (void)_initWithStyle:(os_log_t)log renderLoop:diffuseLoader:metalnessLoader:normalLoader:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_fault_impl(&dword_213A36000, log, OS_LOG_TYPE_FAULT, "PKTexturedCardRenderer (%p:%ld): could not load fragment function.", (uint8_t *)&v4, 0x16u);
}

@end
