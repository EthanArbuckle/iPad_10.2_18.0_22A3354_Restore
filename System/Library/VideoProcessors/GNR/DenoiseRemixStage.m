@implementation DenoiseRemixStage

- (DenoiseRemixStage)initWithContext:(id)a3 onlySingleImageDenoising:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MTLBuffer *v16;
  char *v17;
  MTLBuffer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  DenoiseRemixStage *v23;
  DenoiseRemixStage *v24;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_metal, a3);
  v8 = 0;
  if (v4)
    v9 = 1;
  else
    v9 = 2;
LABEL_4:
  v10 = 0;
LABEL_5:
  v11 = 0;
  while (1)
  {
    +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", v7, v8 != 0, v10 != 0, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      break;

    v11 = (v11 + 1);
    if (v9 == (_DWORD)v11)
    {
      if (++v10 != v9)
        goto LABEL_5;
      if (++v8 == v9)
      {
        v14 = 0;
        while (1)
        {
          -[FigMetalContext device](self->_metal, "device");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (MTLBuffer *)objc_msgSend(v15, "newBufferWithLength:options:", 272, 0);
          v17 = (char *)self + v14 * 8;
          v18 = self->_uniformsAlpha[v14];
          self->_uniformsAlpha[v14] = v16;

          if (!self->_uniformsAlpha[v14])
            goto LABEL_15;
          -[FigMetalContext device](self->_metal, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "newBufferWithLength:options:", 272, 0);
          v21 = (void *)*((_QWORD *)v17 + 3);
          *((_QWORD *)v17 + 3) = v20;

          if (!*((_QWORD *)v17 + 3))
            goto LABEL_15;
          if (++v14 == 20)
          {
            -[FigMetalContext prewarmInternalMetalShadersForFormatsList:](self->_metal, "prewarmInternalMetalShadersForFormatsList:", &unk_24D6706A0);
            goto LABEL_16;
          }
        }
      }
      goto LABEL_4;
    }
  }
LABEL_15:
  fig_log_get_emitter();
  FigDebugAssert3();
  v22 = FigSignalErrorAt();
  v23 = 0;
  if (!v22)
LABEL_16:
    v23 = self;
  v24 = v23;

  return v24;
}

- (int)run:(id)a3 gainPixelBuffer:(__CVBuffer *)a4 ltmBuffers:(id)a5
{
  _QWORD *v8;
  int levels;
  void *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  unint64_t v14;
  _BOOL8 v15;
  id *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  MTLTexture *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  int v58;
  void *v59;
  id *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  MTLTexture *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  _QWORD *v75;
  id v76;
  MTLBuffer **v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  id obj;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87[4];
  __int128 v88;
  __int128 v89;
  id v90[4];

  v90[2] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = a3;
  v90[0] = 0;
  v88 = 0u;
  v89 = 0u;
  memset(v87, 0, sizeof(v87));
  v76 = a5;
  levels = self->_pyr->levels;
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 10, 23, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!obj)
    goto LABEL_22;
  if (v76)
  {
    +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", self->_metal, 0, 0, v76 != 0);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v12 = -[DenoiseRemixStage computeLtmGainMap:ltmBuffers:luma:chroma:shader:](self, "computeLtmGainMap:ltmBuffers:luma:chroma:shader:", obj, v76, v8[42], v8[62], v11[6]);
    if (v12)
    {
      v73 = v12;
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_28;
    }

  }
  if (*((_DWORD *)v8 + 2) != self->_pyr->levels)
  {
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
    v73 = FigSignalErrorAt();
LABEL_28:
    v25 = 0;
    goto LABEL_20;
  }
  +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = levels - 1;
  v15 = self->_pyr->isFP16[v14];
  objc_msgSend(v13, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", self->_metal, v15, v15, v76 != 0);
  v16 = (id *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v73 = FigSignalErrorAt();

    goto LABEL_28;
  }
  v18 = v17;
  v80 = (levels - 1);
  v19 = v14;
  v20 = self->_pyr->textureUV[v14];
  objc_msgSend(v17, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTexture:", v20);

  objc_msgSend(v18, "colorAttachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLoadAction:", 0);

  v87[0] = (id)v8[v19 + 42];
  *(_OWORD *)&v87[1] = 0u;
  v87[3] = (id)v8[v19 + 62];
  v88 = 0u;
  *(_QWORD *)&v89 = 0;
  v90[0] = obj;
  v25 = v16[1];
  -[DenoiseRemixStage runShader:shader:desc:uniforms:uniforms2:](self, "runShader:shader:desc:uniforms:uniforms2:", v87, v25, v18, self->_uniforms[v19], 0);

  v26 = levels - 2;
  if (levels < 2)
  {
    v58 = levels - 1;
LABEL_16:
    +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", self->_metal, self->_pyr->isFP16[v58], self->_pyr->isFP16[v26], v76 != 0);
    v60 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v62 = v61;
      v82 = v26;
      v63 = v58;
      v64 = self->_pyr->textureY[v63];
      objc_msgSend(v61, "colorAttachments");
      v86 = v25;
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setTexture:", v64);

      objc_msgSend(v62, "colorAttachments");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectAtIndexedSubscript:", 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setLoadAction:", 0);

      objc_storeStrong(v87, (id)v8[v63 + 42]);
      objc_storeStrong(&v87[1], self->_pyr->textureY[v63 + 1]);
      objc_storeStrong(&v87[2], (id)v8[v63 + 43]);
      objc_storeStrong((id *)&v89 + 1, self->_lapPyr->textureY[v63 + 1]);
      v69 = v87[3];
      v87[3] = 0;

      v70 = (void *)v88;
      *(_QWORD *)&v88 = 0;

      v71 = (void *)*((_QWORD *)&v88 + 1);
      *((_QWORD *)&v88 + 1) = 0;

      v72 = (void *)v89;
      *(_QWORD *)&v89 = 0;

      objc_storeStrong(v90, obj);
      v25 = v60[4];

      -[DenoiseRemixStage runShader:shader:desc:uniforms:uniforms2:](self, "runShader:shader:desc:uniforms:uniforms2:", v87, v25, v62, self->_uniforms[v63], 0);
      if (v58)
        -[DenoiseRemixStage run:gainPixelBuffer:ltmBuffers:].cold.2();
      if (v82 != -1)
        -[DenoiseRemixStage run:gainPixelBuffer:ltmBuffers:].cold.1();
      v73 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v73 = FigSignalErrorAt();

    }
  }
  else
  {
    v27 = 0;
    v81 = (levels - 2);
    v84 = v81;
    v79 = (char *)&v8[v81];
    v28 = (levels - 1);
    v29 = v28;
    v75 = v8;
    v78 = (char *)&v8[v28];
    v77 = &self->_uniforms[v28];
    while (1)
    {
      v34 = v28 + v27;
      +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", self->_metal, self->_pyr->isFP16[v34], self->_pyr->isFP16[v81 + v27], v76 != 0);
      v36 = (char *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
        break;
      v38 = v37;
      v85 = v25;
      v39 = 8 * v27;
      v40 = *((_QWORD *)&self->_pyr->textureY[v29] + v27);
      objc_msgSend(v37, "colorAttachments");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTexture:", v40);

      objc_msgSend(v38, "colorAttachments");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setLoadAction:", 0);

      v45 = *((_QWORD *)&self->_pyr->textureUV[v84] + v27);
      objc_msgSend(v38, "colorAttachments");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTexture:", v45);

      objc_msgSend(v38, "colorAttachments");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setLoadAction:", 0);

      v50 = *((_QWORD *)&self->_lapPyr->textureY[v29] + v27);
      objc_msgSend(v38, "colorAttachments");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setTexture:", v50);

      objc_msgSend(v38, "colorAttachments");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectAtIndexedSubscript:", 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setLoadAction:", 0);

      v55 = (self->_pyr->levels - 1);
      objc_storeStrong(v87, *(id *)&v78[8 * v27 + 336]);
      if (v34 == v55)
      {
        v56 = v87[1];
        v87[1] = 0;

        v57 = v87[2];
        v87[2] = 0;

        v30 = 0;
        v31 = 16;
      }
      else
      {
        objc_storeStrong(&v87[1], *(id *)((char *)&self->_pyr->textureY[v29 + 1] + v39));
        objc_storeStrong(&v87[2], *(id *)&v78[v39 + 344]);
        v30 = *(MTLTexture **)((char *)&self->_lapPyr->textureY[v29 + 1] + v39);
        v31 = 24;
      }
      v28 = v80;
      objc_storeStrong((id *)&v89 + 1, v30);
      objc_storeStrong(&v87[3], *(id *)&v79[8 * v27 + 496]);
      objc_storeStrong((id *)&v88, *(id *)((char *)&self->_pyr->textureUV[v84 + 1] + v39));
      objc_storeStrong((id *)&v88 + 1, *(id *)&v79[v39 + 504]);
      v32 = (void *)v89;
      *(_QWORD *)&v89 = 0;

      objc_storeStrong(v90, obj);
      v33 = *(id *)&v36[v31];

      -[DenoiseRemixStage runShader:shader:desc:uniforms:uniforms2:](self, "runShader:shader:desc:uniforms:uniforms2:", v87, v33, v38, v77[v27], *((_QWORD *)&self->_uniforms[v81] + v27));
      --v27;
      v25 = v33;
      v29 = v80;
      if (v80 + v27 + 1 <= 1)
      {
        v58 = 0;
        v25 = v33;
        v26 = v81 + v27;
        v8 = v75;
        goto LABEL_16;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v73 = FigSignalErrorAt();

    v8 = v75;
  }
LABEL_20:

  return v73;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformsAlpha[19], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[18], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[17], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[16], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[15], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[14], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[13], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[12], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[11], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[10], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[9], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[8], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[7], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[6], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[5], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[4], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[3], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[2], 0);
  objc_storeStrong((id *)&self->_uniformsAlpha[1], 0);
  objc_storeStrong((id *)self->_uniformsAlpha, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_uniforms[19], 0);
  objc_storeStrong((id *)&self->_uniforms[18], 0);
  objc_storeStrong((id *)&self->_uniforms[17], 0);
  objc_storeStrong((id *)&self->_uniforms[16], 0);
  objc_storeStrong((id *)&self->_uniforms[15], 0);
  objc_storeStrong((id *)&self->_uniforms[14], 0);
  objc_storeStrong((id *)&self->_uniforms[13], 0);
  objc_storeStrong((id *)&self->_uniforms[12], 0);
  objc_storeStrong((id *)&self->_uniforms[11], 0);
  objc_storeStrong((id *)&self->_uniforms[10], 0);
  objc_storeStrong((id *)&self->_uniforms[9], 0);
  objc_storeStrong((id *)&self->_uniforms[8], 0);
  objc_storeStrong((id *)&self->_uniforms[7], 0);
  objc_storeStrong((id *)&self->_uniforms[6], 0);
  objc_storeStrong((id *)&self->_uniforms[5], 0);
  objc_storeStrong((id *)&self->_uniforms[4], 0);
  objc_storeStrong((id *)&self->_uniforms[3], 0);
  objc_storeStrong((id *)&self->_uniforms[2], 0);
  objc_storeStrong((id *)&self->_uniforms[1], 0);
  objc_storeStrong((id *)self->_uniforms, 0);
  objc_storeStrong((id *)&self->_lapPyr, 0);
  objc_storeStrong((id *)&self->_pyr, 0);
}

- (int)computeLtmGainMap:(id)a3 ltmBuffers:(id)a4 luma:(id)a5 chroma:(id)a6 shader:(id)a7
{
  id v12;
  _QWORD *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    goto LABEL_6;
  objc_msgSend(v17, "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTexture:", v12);

  objc_msgSend(v18, "colorAttachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLoadAction:", 0);

  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commandBuffer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "renderCommandEncoderWithDescriptor:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setVertexBuffer:offset:atIndex:", v27, 0, 0);

      objc_msgSend(v26, "setFragmentTexture:atIndex:", v14, 0);
      objc_msgSend(v26, "setFragmentTexture:atIndex:", v15, 3);
      objc_msgSend(v26, "setFragmentTexture:atIndex:", v13[1], 10);
      objc_msgSend(v26, "setFragmentTexture:atIndex:", v13[2], 11);
      objc_msgSend(v26, "setFragmentTexture:atIndex:", v13[3], 12);
      objc_msgSend(v26, "setRenderPipelineState:", v16[1]);
      objc_msgSend(v26, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
      objc_msgSend(v26, "endEncoding");
      objc_msgSend(v24, "commit");

      v28 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v28 = FigSignalErrorAt();

    }
  }
  else
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
  }

  return v28;
}

- (int)runShader:(const void *)a3 shader:(id)a4 desc:(id)a5 uniforms:(id)a6 uniforms2:(id)a7
{
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "texture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "width");

  objc_msgSend(v13, "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "texture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "height");

  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23
    && (objc_msgSend(v23, "renderCommandEncoderWithDescriptor:", v13), (v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v25 = (void *)v24;
    -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setVertexBuffer:offset:atIndex:", v26, 0, 0);

    objc_msgSend(v25, "setFragmentTextures:withRange:", a3, 0, 9);
    objc_msgSend(v25, "setFragmentBuffer:offset:atIndex:", v14, 0, 0);
    if (v15)
      objc_msgSend(v25, "setFragmentBuffer:offset:atIndex:", v15, 0, 1);
    objc_msgSend(v25, "setRenderPipelineState:", v12[1]);
    objc_msgSend(v25, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v25, "endEncoding");
    objc_msgSend(v23, "commit");

    v27 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
  }

  return v27;
}

- (int)setResourcesWithPyramid:(id)a3 laplacianPyramid:(id)a4
{
  PyramidStorage *v6;
  PyramidStorage *v7;
  PyramidStorage *pyr;
  PyramidStorage *v9;
  PyramidStorage *lapPyr;

  v6 = (PyramidStorage *)a3;
  v7 = (PyramidStorage *)a4;
  pyr = self->_pyr;
  self->_pyr = v6;
  v9 = v6;

  lapPyr = self->_lapPyr;
  self->_lapPyr = v7;

  return 0;
}

- (int)setUniforms:(AmbnrConfiguration *)a3
{
  PyramidStorage *pyr;
  uint64_t v6;
  MTLBuffer **uniforms;

  pyr = self->_pyr;
  if (pyr)
  {
    if (pyr->levels >= 1)
    {
      v6 = 0;
      uniforms = self->_uniforms;
      do
      {
        memcpy((void *)-[MTLBuffer contents](objc_retainAutorelease(uniforms[v6++]), "contents"), a3, 0x110uLL);
        a3 = (AmbnrConfiguration *)((char *)a3 + 272);
      }
      while (v6 < self->_pyr->levels);
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)runLumaAlpha:(id)a3 alpha:(id)a4 output:(id)a5 level:(int)a6 config:(AmbnrConfiguration *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = 0u;
  +[DenoiseRemixStageShared sharedInstance](DenoiseRemixStageShared, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getShaders:lumaFP16:chromaFP16:lGAAlgorithm:", self->_metal, objc_msgSend(v14, "pixelFormat") == 25, 0, 0);
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  memcpy((void *)-[MTLBuffer contents](objc_retainAutorelease(self->_uniformsAlpha[a6]), "contents"), a7, 0x110uLL);
  v17 = v12;
  v28 = v17;
  v29 = 0u;
  v30 = 0u;
  v31 = 0;
  v18 = v13;
  v32 = v18;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = a6;
    objc_msgSend(v19, "colorAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTexture:", v14);

    objc_msgSend(v20, "colorAttachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLoadAction:", 0);

    -[DenoiseRemixStage runShader:shader:desc:uniforms:uniforms2:](self, "runShader:shader:desc:uniforms:uniforms2:", &v28, v16[5], v20, self->_uniformsAlpha[v21], 0);
    v26 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }

  return v26;
}

- (void)run:gainPixelBuffer:ltmBuffers:.cold.1()
{
  __assert_rtn("-[DenoiseRemixStage run:gainPixelBuffer:ltmBuffers:]", "DenoiseRemixStage.m", 668, "chroma_level == -1");
}

- (void)run:gainPixelBuffer:ltmBuffers:.cold.2()
{
  __assert_rtn("-[DenoiseRemixStage run:gainPixelBuffer:ltmBuffers:]", "DenoiseRemixStage.m", 667, "luma_level == -1");
}

- (BOOL)dumpIntermediateData:(id)a3 counter:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  id v21;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (self->_pyr->levels < 1)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("denoiseremix_%d_pyr_%d.420f"), v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("denoiseremix_%d_lapPyr_%d.420f"), v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v8);
    objc_msgSend(v11, "UTF8String");
    v12 = WritePixelBufferToFile();

    if (self->_pyr->levels >= 2)
    {
      v13 = 1;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("denoiseremix_%d_pyr_%d.420f"), v4, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("denoiseremix_%d_lapPyr_%d.420f"), v4, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingPathComponent:", v16);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        v17 = objc_retainAutorelease(v15);
        objc_msgSend(v17, "UTF8String");
        v18 = v12 & WritePixelBufferToFile();
        v19 = objc_retainAutorelease(v21);
        objc_msgSend(v19, "UTF8String");
        v12 = v18 & WritePixelBufferToFile();

        ++v13;
      }
      while (v13 < self->_pyr->levels);
    }
  }

  return v12;
}

- (BOOL)dumpParamsToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  double v13;
  int v14;
  double v15;
  int v16;
  double v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  double v23;
  int v24;
  double v25;
  int v26;
  double v27;
  int v28;
  double v29;
  int v30;
  double v31;
  int v32;
  double v33;
  int v34;
  double v35;
  int v36;
  double v37;
  int v38;
  double v39;
  int v40;
  double v41;
  int v42;
  double v43;
  int v44;
  double v45;
  int v46;
  double v47;
  int v48;
  double v49;
  int v50;
  double v51;
  int v52;
  double v53;
  int v54;
  double v55;
  int v56;
  double v57;
  int v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  id v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;

  v90 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pyr->levels);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("number_bands"));

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("bands"));

  if (self->_pyr->levels >= 1)
  {
    for (i = 0; i < self->_pyr->levels; ++i)
    {
      v9 = -[MTLBuffer contents](objc_retainAutorelease(self->_uniforms[i]), "contents");
      v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("band"));

      v12 = *(_DWORD *)(v9 + 232);
      if (__isnanf())
      {
        v14 = *(_DWORD *)(v9 + 236);
        if (__isnanf())
          goto LABEL_6;
      }
      else
      {
        LODWORD(v13) = v12;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v60, CFSTR("lumaLensShadingFactor"));

        v14 = *(_DWORD *)(v9 + 236);
        if (__isnanf())
        {
LABEL_6:
          v16 = *(_DWORD *)(v9 + 240);
          if (__isnanf())
            goto LABEL_7;
          goto LABEL_34;
        }
      }
      LODWORD(v15) = v14;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v61, CFSTR("chromaLensShadingFactor"));

      v16 = *(_DWORD *)(v9 + 240);
      if (__isnanf())
      {
LABEL_7:
        v91 = *(double *)(v9 + 256);
        if (__isnanf())
          goto LABEL_8;
        goto LABEL_35;
      }
LABEL_34:
      LODWORD(v17) = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v62, CFSTR("chromaDemoireStrength"));

      v91 = *(double *)(v9 + 256);
      if (__isnanf())
      {
LABEL_8:
        v18 = *(_DWORD *)(v9 + 260);
        if (__isnanf())
          goto LABEL_9;
        goto LABEL_36;
      }
LABEL_35:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v91);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v63, CFSTR("lumaUpsamplingCoordOffset[0]"));

      v18 = *(_DWORD *)(v9 + 260);
      if (__isnanf())
      {
LABEL_9:
        v92 = *(double *)(v9 + 264);
        if (__isnanf())
          goto LABEL_10;
        goto LABEL_37;
      }
LABEL_36:
      LODWORD(v19) = v18;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v64, CFSTR("lumaUpsamplingCoordOffset[1]"));

      v92 = *(double *)(v9 + 264);
      if (__isnanf())
      {
LABEL_10:
        v20 = *(_DWORD *)(v9 + 268);
        if (__isnanf())
          goto LABEL_11;
        goto LABEL_38;
      }
LABEL_37:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v92);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v65, CFSTR("chromaUpsamplingCoordOffset[0]"));

      v20 = *(_DWORD *)(v9 + 268);
      if (__isnanf())
      {
LABEL_11:
        v22 = *(_DWORD *)v9;
        if (__isnanf())
          goto LABEL_12;
        goto LABEL_39;
      }
LABEL_38:
      LODWORD(v21) = v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v66, CFSTR("chromaUpsamplingCoordOffset[1]"));

      v22 = *(_DWORD *)v9;
      if (__isnanf())
      {
LABEL_12:
        v24 = *(_DWORD *)(v9 + 4);
        if (__isnanf())
          goto LABEL_13;
        goto LABEL_40;
      }
LABEL_39:
      LODWORD(v23) = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v67, CFSTR("nm.lumaSigmaIntercept"));

      v24 = *(_DWORD *)(v9 + 4);
      if (__isnanf())
      {
LABEL_13:
        v26 = *(_DWORD *)(v9 + 8);
        if (__isnanf())
          goto LABEL_14;
        goto LABEL_41;
      }
LABEL_40:
      LODWORD(v25) = v24;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v68, CFSTR("nm.lumaSigmaSlope"));

      v26 = *(_DWORD *)(v9 + 8);
      if (__isnanf())
      {
LABEL_14:
        v93 = *(double *)(v9 + 16);
        if (__isnanf())
          goto LABEL_15;
        goto LABEL_42;
      }
LABEL_41:
      LODWORD(v27) = v26;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v69, CFSTR("nm.lumaSigmaMax"));

      v93 = *(double *)(v9 + 16);
      if (__isnanf())
      {
LABEL_15:
        v28 = *(_DWORD *)(v9 + 20);
        if (__isnanf())
          goto LABEL_16;
        goto LABEL_43;
      }
LABEL_42:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v93);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v70, CFSTR("nm.chromaSigma[0]"));

      v28 = *(_DWORD *)(v9 + 20);
      if (__isnanf())
      {
LABEL_16:
        v30 = *(_DWORD *)(v9 + 24);
        if (__isnanf())
          goto LABEL_17;
        goto LABEL_44;
      }
LABEL_43:
      LODWORD(v29) = v28;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v71, CFSTR("nm.chromaSigma[1]"));

      v30 = *(_DWORD *)(v9 + 24);
      if (__isnanf())
      {
LABEL_17:
        v32 = *(_DWORD *)(v9 + 28);
        if (__isnanf())
          goto LABEL_18;
        goto LABEL_45;
      }
LABEL_44:
      LODWORD(v31) = v30;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v72, CFSTR("nm.lumaRemixWeight"));

      v32 = *(_DWORD *)(v9 + 28);
      if (__isnanf())
      {
LABEL_18:
        v34 = *(_DWORD *)(v9 + 32);
        if (__isnanf())
          goto LABEL_19;
        goto LABEL_46;
      }
LABEL_45:
      LODWORD(v33) = v32;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v73, CFSTR("nm.chromaRemixWeight"));

      v34 = *(_DWORD *)(v9 + 32);
      if (__isnanf())
      {
LABEL_19:
        v36 = *(_DWORD *)(v9 + 36);
        if (__isnanf())
          goto LABEL_20;
        goto LABEL_47;
      }
LABEL_46:
      LODWORD(v35) = v34;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v74, CFSTR("nm.blueBoost"));

      v36 = *(_DWORD *)(v9 + 36);
      if (__isnanf())
      {
LABEL_20:
        v38 = *(_DWORD *)(v9 + 40);
        if (__isnanf())
          goto LABEL_21;
        goto LABEL_48;
      }
LABEL_47:
      LODWORD(v37) = v36;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v75, CFSTR("nm.flatnessBoost"));

      v38 = *(_DWORD *)(v9 + 40);
      if (__isnanf())
      {
LABEL_21:
        v40 = *(_DWORD *)(v9 + 44);
        if (__isnanf())
          goto LABEL_22;
        goto LABEL_49;
      }
LABEL_48:
      LODWORD(v39) = v38;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v76, CFSTR("nm.flatnessThreshold"));

      v40 = *(_DWORD *)(v9 + 44);
      if (__isnanf())
      {
LABEL_22:
        v42 = *(_DWORD *)(v9 + 48);
        if (__isnanf())
          goto LABEL_23;
        goto LABEL_50;
      }
LABEL_49:
      LODWORD(v41) = v40;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v77, CFSTR("nm.blurKernelSize"));

      v42 = *(_DWORD *)(v9 + 48);
      if (__isnanf())
      {
LABEL_23:
        v44 = *(_DWORD *)(v9 + 60);
        if (__isnanf())
          goto LABEL_24;
        goto LABEL_51;
      }
LABEL_50:
      LODWORD(v43) = v42;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v78, CFSTR("nm.haloSuppression"));

      v44 = *(_DWORD *)(v9 + 60);
      if (__isnanf())
      {
LABEL_24:
        v46 = *(_DWORD *)(v9 + 64);
        if (__isnanf())
          goto LABEL_25;
        goto LABEL_52;
      }
LABEL_51:
      LODWORD(v45) = v44;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v79, CFSTR("nm.radialSharpnessBoost"));

      v46 = *(_DWORD *)(v9 + 64);
      if (__isnanf())
      {
LABEL_25:
        v48 = *(_DWORD *)(v9 + 68);
        if (__isnanf())
          goto LABEL_26;
        goto LABEL_53;
      }
LABEL_52:
      LODWORD(v47) = v46;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v80, CFSTR("nm.radialFlatnessBoost"));

      v48 = *(_DWORD *)(v9 + 68);
      if (__isnanf())
      {
LABEL_26:
        v50 = *(_DWORD *)(v9 + 72);
        if (__isnanf())
          goto LABEL_27;
        goto LABEL_54;
      }
LABEL_53:
      LODWORD(v49) = v48;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v49);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v81, CFSTR("nm.bluenessCb.start"));

      v50 = *(_DWORD *)(v9 + 72);
      if (__isnanf())
      {
LABEL_27:
        v52 = *(_DWORD *)(v9 + 76);
        if (__isnanf())
          goto LABEL_28;
        goto LABEL_55;
      }
LABEL_54:
      LODWORD(v51) = v50;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v82, CFSTR("nm.bluenessCb.end"));

      v52 = *(_DWORD *)(v9 + 76);
      if (__isnanf())
      {
LABEL_28:
        v54 = *(_DWORD *)(v9 + 80);
        if (__isnanf())
          goto LABEL_29;
        goto LABEL_56;
      }
LABEL_55:
      LODWORD(v53) = v52;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v53);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v83, CFSTR("nm.bluenessCb.margin"));

      v54 = *(_DWORD *)(v9 + 80);
      if (__isnanf())
      {
LABEL_29:
        v56 = *(_DWORD *)(v9 + 84);
        if (__isnanf())
          goto LABEL_30;
        goto LABEL_57;
      }
LABEL_56:
      LODWORD(v55) = v54;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v55);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v84, CFSTR("nm.bluenessCr.start"));

      v56 = *(_DWORD *)(v9 + 84);
      if (__isnanf())
      {
LABEL_30:
        v58 = *(_DWORD *)(v9 + 88);
        if (!__isnanf())
          goto LABEL_58;
        goto LABEL_3;
      }
LABEL_57:
      LODWORD(v57) = v56;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v85, CFSTR("nm.bluenessCr.end"));

      v58 = *(_DWORD *)(v9 + 88);
      if (!__isnanf())
      {
LABEL_58:
        LODWORD(v59) = v58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v59);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v86, CFSTR("nm.bluenessCr.margin"));

      }
LABEL_3:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bands"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
  }
  v94 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 1, &v94);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "writeToFile:atomically:", v90, 1);

  return v88;
}

- (BOOL)loadParamsFromFile:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  BOOL v65;
  id v67;
  void *v68;
  id v69;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v68 = v4;
    v69 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v69);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v69;
    if (self->_pyr->levels >= 1)
    {
      v6 = 0;
      do
      {
        v7 = -[MTLBuffer contents](objc_retainAutorelease(self->_uniforms[v6]), "contents");
        *(_QWORD *)&v8 = -1;
        *((_QWORD *)&v8 + 1) = -1;
        *(_OWORD *)v7 = v8;
        *(_OWORD *)(v7 + 16) = v8;
        *(_OWORD *)(v7 + 32) = v8;
        *(_OWORD *)(v7 + 48) = v8;
        *(_OWORD *)(v7 + 64) = v8;
        *(_OWORD *)(v7 + 80) = v8;
        *(_OWORD *)(v7 + 96) = v8;
        *(_OWORD *)(v7 + 112) = v8;
        *(_OWORD *)(v7 + 128) = v8;
        *(_OWORD *)(v7 + 144) = v8;
        *(_OWORD *)(v7 + 160) = v8;
        *(_OWORD *)(v7 + 176) = v8;
        *(_OWORD *)(v7 + 192) = v8;
        *(_OWORD *)(v7 + 208) = v8;
        *(_OWORD *)(v7 + 224) = v8;
        *(_OWORD *)(v7 + 240) = v8;
        *(_OWORD *)(v7 + 256) = v8;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bands"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lumaLensShadingFactor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        *(_DWORD *)(v7 + 232) = v12;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chromaLensShadingFactor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        *(_DWORD *)(v7 + 236) = v14;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chromaDemoireStrength"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        *(_DWORD *)(v7 + 240) = v16;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lumaUpsamplingCoordOffset[0]"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        *(_DWORD *)(v7 + 256) = v18;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lumaUpsamplingCoordOffset[1]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        *(_DWORD *)(v7 + 260) = v20;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chromaUpsamplingCoordOffset[0]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        *(_DWORD *)(v7 + 264) = v22;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chromaUpsamplingCoordOffset[1]"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        *(_DWORD *)(v7 + 268) = v24;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.lumaSigmaIntercept"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        *(_DWORD *)v7 = v26;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.lumaSigmaSlope"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        *(_DWORD *)(v7 + 4) = v28;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.lumaSigmaMax"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        *(_DWORD *)(v7 + 8) = v30;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.chromaSigma[0]"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        *(_DWORD *)(v7 + 16) = v32;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.chromaSigma[1]"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        *(_DWORD *)(v7 + 20) = v34;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.lumaRemixWeight"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        *(_DWORD *)(v7 + 24) = v36;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.chromaRemixWeight"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        *(_DWORD *)(v7 + 28) = v38;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.blueBoost"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        *(_DWORD *)(v7 + 32) = v40;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.flatnessBoost"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        *(_DWORD *)(v7 + 36) = v42;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.flatnessThreshold"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "floatValue");
        *(_DWORD *)(v7 + 40) = v44;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.blurKernelSize"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "floatValue");
        *(_DWORD *)(v7 + 44) = v46;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.haloSuppression"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "floatValue");
        *(_DWORD *)(v7 + 48) = v48;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.radialSharpnessBoost"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        *(_DWORD *)(v7 + 60) = v50;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.radialFlatnessBoost"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "floatValue");
        *(_DWORD *)(v7 + 64) = v52;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCb.start"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "floatValue");
        *(_DWORD *)(v7 + 68) = v54;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCb.end"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "floatValue");
        *(_DWORD *)(v7 + 72) = v56;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCb.margin"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "floatValue");
        *(_DWORD *)(v7 + 76) = v58;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCr.start"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "floatValue");
        *(_DWORD *)(v7 + 80) = v60;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCr.end"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "floatValue");
        *(_DWORD *)(v7 + 84) = v62;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("nm.bluenessCr.margin"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "floatValue");
        *(_DWORD *)(v7 + 88) = v64;

        ++v6;
      }
      while (v6 < self->_pyr->levels);
    }

    v4 = v68;
  }
  v65 = v4 != 0;

  return v65;
}

@end
