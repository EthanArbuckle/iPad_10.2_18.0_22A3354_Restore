@implementation PTRaytracingUtilsV1

- (PTRaytracingUtilsV1)initWithMetalContext:(id)a3
{
  id v5;
  PTRaytracingUtilsV1 *v6;
  PTRaytracingUtilsV1 *v7;
  id *p_metalContext;
  void *v9;
  void *v10;
  uint64_t v11;
  MTLSamplerState *sNLE;
  void *v13;
  uint64_t v14;
  MTLSamplerState *sNBE;
  uint64_t v16;
  MTLComputePipelineState *centerDisparityOnFocus;
  uint64_t v18;
  MTLComputePipelineState *sobelEdgeDetector;
  uint64_t v20;
  MTLComputePipelineState *edgeDilation;
  uint64_t v22;
  MTLComputePipelineState *focusEdgeMask;
  NSObject *v24;
  uint64_t v25;
  MTLComputePipelineState **interpolateRGBRadiusToDestYUV;
  MTLComputePipelineState **interpolateRGBRadiusToDestYUVFromSource;
  MTLComputePipelineState **interpolateRGBRadiusToDestRGBA;
  MTLComputePipelineState **interpolateRGBRadiusToDestRGBAFromSource;
  uint64_t v30;
  MTLComputePipelineState *v31;
  uint64_t v32;
  MTLComputePipelineState *v33;
  uint64_t v34;
  MTLComputePipelineState *v35;
  uint64_t v36;
  MTLComputePipelineState *v37;
  uint64_t v38;
  MTLComputePipelineState *v39;
  uint64_t v40;
  MTLComputePipelineState *v41;
  PTRandom *v42;
  PTRandom *random;
  PTRaytracingUtilsV1 *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v124;
  MTLComputePipelineState **convertRGBPyramidFromYUV;
  MTLComputePipelineState **convertRGBPyramid;
  unsigned int v127;
  objc_super v128;

  v5 = a3;
  v128.receiver = self;
  v128.super_class = (Class)PTRaytracingUtilsV1;
  v6 = -[PTRaytracingUtilsV1 init](&v128, sel_init);
  v7 = v6;
  if (v6)
  {
    p_metalContext = (id *)&v6->_metalContext;
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setNormalizedCoordinates:", 1);
    objc_msgSend(v9, "setMinFilter:", 1);
    objc_msgSend(v9, "setMagFilter:", 1);
    objc_msgSend(v5, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "newSamplerStateWithDescriptor:", v9);
    sNLE = v7->_sNLE;
    v7->_sNLE = (MTLSamplerState *)v11;

    if (v7->_sNLE)
    {
      objc_msgSend(v9, "setMinFilter:", 2);
      objc_msgSend(v9, "setMagFilter:", 2);
      objc_msgSend(v5, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "newSamplerStateWithDescriptor:", v9);
      sNBE = v7->_sNBE;
      v7->_sNBE = (MTLSamplerState *)v14;

      -[PTMetalContext computePipelineStateFor:withConstants:](v7->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("centerDisparityOnFocus_V1"), 0);
      v16 = objc_claimAutoreleasedReturnValue();
      centerDisparityOnFocus = v7->_centerDisparityOnFocus;
      v7->_centerDisparityOnFocus = (MTLComputePipelineState *)v16;

      if (v7->_centerDisparityOnFocus)
      {
        -[PTMetalContext computePipelineStateFor:withConstants:](v7->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("sobelEdgeDetector_V1"), 0);
        v18 = objc_claimAutoreleasedReturnValue();
        sobelEdgeDetector = v7->_sobelEdgeDetector;
        v7->_sobelEdgeDetector = (MTLComputePipelineState *)v18;

        if (v7->_sobelEdgeDetector)
        {
          -[PTMetalContext computePipelineStateFor:withConstants:](v7->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("edgeDilation_V1"), 0);
          v20 = objc_claimAutoreleasedReturnValue();
          edgeDilation = v7->_edgeDilation;
          v7->_edgeDilation = (MTLComputePipelineState *)v20;

          if (v7->_edgeDilation)
          {
            -[PTMetalContext computePipelineStateFor:withConstants:](v7->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("focusEdgeMask_V1"), 0);
            v22 = objc_claimAutoreleasedReturnValue();
            focusEdgeMask = v7->_focusEdgeMask;
            v7->_focusEdgeMask = (MTLComputePipelineState *)v22;

            if (v7->_focusEdgeMask)
            {
              v124 = v5;
              v24 = objc_opt_new();
              v25 = 0;
              interpolateRGBRadiusToDestYUV = v7->_interpolateRGBRadiusToDestYUV;
              interpolateRGBRadiusToDestYUVFromSource = v7->_interpolateRGBRadiusToDestYUVFromSource;
              interpolateRGBRadiusToDestRGBA = v7->_interpolateRGBRadiusToDestRGBA;
              interpolateRGBRadiusToDestRGBAFromSource = v7->_interpolateRGBRadiusToDestRGBAFromSource;
              convertRGBPyramidFromYUV = v7->_convertRGBPyramidFromYUV;
              convertRGBPyramid = v7->_convertRGBPyramid;
              while (1)
              {
                v127 = supportedColorTransferFunctions[v25];
                -[NSObject reset](v24, "reset", v124);
                -[NSObject setConstantValue:type:withName:](v24, "setConstantValue:type:withName:", &v127, 29, CFSTR("kColorTransferFunctionToLinear"));
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBRadiusToDestYUV_V1"), v24);
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = interpolateRGBRadiusToDestYUV[v127];
                interpolateRGBRadiusToDestYUV[v127] = (MTLComputePipelineState *)v30;

                if (!interpolateRGBRadiusToDestYUV[v127])
                  break;
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBRadiusToDestYUVFromSource_V1"), v24);
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = interpolateRGBRadiusToDestYUVFromSource[v127];
                interpolateRGBRadiusToDestYUVFromSource[v127] = (MTLComputePipelineState *)v32;

                if (!interpolateRGBRadiusToDestYUVFromSource[v127])
                {
                  _PTLogSystem();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.7(v80, v88, v89, v90, v91, v92, v93, v94);
                  goto LABEL_39;
                }
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBRadiusToDestRGB_V1"), v24);
                v34 = objc_claimAutoreleasedReturnValue();
                v35 = interpolateRGBRadiusToDestRGBA[v127];
                interpolateRGBRadiusToDestRGBA[v127] = (MTLComputePipelineState *)v34;

                if (!interpolateRGBRadiusToDestRGBA[v127])
                {
                  _PTLogSystem();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.8(v80, v95, v96, v97, v98, v99, v100, v101);
                  goto LABEL_39;
                }
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("interpolateRGBRadiusToDestRGBFromSource_V1"), v24);
                v36 = objc_claimAutoreleasedReturnValue();
                v37 = interpolateRGBRadiusToDestRGBAFromSource[v127];
                interpolateRGBRadiusToDestRGBAFromSource[v127] = (MTLComputePipelineState *)v36;

                if (!interpolateRGBRadiusToDestRGBAFromSource[v127])
                {
                  _PTLogSystem();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.9(v80, v102, v103, v104, v105, v106, v107, v108);
                  goto LABEL_39;
                }
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("convertRGBPyramid_V1"), v24);
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = convertRGBPyramid[v127];
                convertRGBPyramid[v127] = (MTLComputePipelineState *)v38;

                if (!convertRGBPyramid[v127])
                {
                  _PTLogSystem();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.10(v80, v109, v110, v111, v112, v113, v114, v115);
                  goto LABEL_39;
                }
                objc_msgSend(*p_metalContext, "computePipelineStateFor:withConstants:", CFSTR("convertRGBPyramidFromYUV_V1"), v24);
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = convertRGBPyramidFromYUV[v127];
                convertRGBPyramidFromYUV[v127] = (MTLComputePipelineState *)v40;

                if (!convertRGBPyramidFromYUV[v127])
                {
                  _PTLogSystem();
                  v80 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtilsV1 initWithMetalContext:].cold.11(v80, v116, v117, v118, v119, v120, v121, v122);
                  goto LABEL_39;
                }
                if (++v25 == 5)
                {
                  v42 = -[PTRandom initWithSeed:]([PTRandom alloc], "initWithSeed:", 0x7FFFFFFFLL);
                  random = v7->_random;
                  v7->_random = v42;

                  v44 = v7;
                  v5 = v124;
                  goto LABEL_41;
                }
              }
              _PTLogSystem();
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                -[PTRaytracingUtilsV1 initWithMetalContext:].cold.6(v80, v81, v82, v83, v84, v85, v86, v87);
LABEL_39:
              v5 = v124;

            }
            else
            {
              _PTLogSystem();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                -[PTRaytracingUtils initWithMetalContext:].cold.6(v24, v73, v74, v75, v76, v77, v78, v79);
            }
          }
          else
          {
            _PTLogSystem();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              -[PTRaytracingUtils initWithMetalContext:].cold.5(v24, v66, v67, v68, v69, v70, v71, v72);
          }
        }
        else
        {
          _PTLogSystem();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[PTRaytracingUtils initWithMetalContext:].cold.4(v24, v59, v60, v61, v62, v63, v64, v65);
        }
      }
      else
      {
        _PTLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[PTRaytracingUtilsV2 initWithMetalContext:].cold.1(v24, v52, v53, v54, v55, v56, v57, v58);
      }
    }
    else
    {
      _PTLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtilsV1 initWithMetalContext:].cold.1(v24, v45, v46, v47, v48, v49, v50, v51);
    }
    v44 = 0;
LABEL_41:

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)sNBE
{
  return self->_sNBE;
}

- (id)sNLE
{
  return self->_sNLE;
}

- (void)interpolateRGBRadiusUsingSourceToDest:(id)a3 renderRequest:(id)a4 inRGBRadius:(id)a5 inRandomGauss:(id)a6 bicubicSampling:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  int32x2_t v16;
  uint64_t v17;
  id v18;
  __int16 v19;
  __int16 v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  _DWORD v48[2];
  int v49;
  _WORD v50[2];
  int64x2_t v51;
  __int128 v52;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16.i16[0] = 0;
  v16.i16[2] = 0;
  v51 = 0u;
  v52 = 0u;
  if (v13)
  {
    objc_msgSend(v13, "scissorRect");
    v16 = vmovn_s64(v51);
  }
  v50[1] = v16.i16[2];
  v50[0] = v16.i16[0];
  v17 = 488;
  if (v7)
    v17 = 480;
  v18 = *(id *)((char *)&self->super.isa + v17);
  v49 = 0;
  if (v15)
  {
    -[PTRandom nextUshort2:](self->_random, "nextUshort2:", objc_msgSend(v15, "width") - 1);
    HIWORD(v49) = v19;
    LOWORD(v49) = v20;
  }
  +[PTRaytracingUtilsV1 calculateVarReadNoise:](PTRaytracingUtilsV1, "calculateVarReadNoise:", v13, v52);
  v48[0] = v21;
  v48[1] = v22;
  objc_msgSend(v13, "destinationColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transferFunction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v24, 1);

  objc_msgSend(v13, "destinationColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v26, "isRGB");

  if ((_DWORD)v24)
  {
    objc_msgSend(v12, "setComputePipelineState:", self->_interpolateRGBRadiusToDestRGBAFromSource[v25]);
    objc_msgSend(v13, "sourceColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "texRGBA");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v28, 0);

    objc_msgSend(v12, "setTexture:atIndex:", v14, 1);
    objc_msgSend(v12, "setTexture:atIndex:", v15, 2);
    objc_msgSend(v13, "destinationColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "texRGBA");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v30, 3);

    objc_msgSend(v12, "setBytes:length:atIndex:", v48, 8, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", v50, 4, 1);
    v31 = v12;
    v32 = 2;
  }
  else
  {
    v46 = 0uLL;
    v47 = 0;
    objc_msgSend(v13, "destinationColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v33, 0);

    v44 = 0uLL;
    v45 = 0;
    objc_msgSend(v13, "destinationColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v34, 1);

    objc_msgSend(v12, "setComputePipelineState:", self->_interpolateRGBRadiusToDestYUVFromSource[v25]);
    objc_msgSend(v13, "sourceColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "texLuma");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v36, 0);

    objc_msgSend(v13, "sourceColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "texChroma");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v38, 1);

    objc_msgSend(v12, "setTexture:atIndex:", v14, 2);
    objc_msgSend(v12, "setTexture:atIndex:", v15, 3);
    objc_msgSend(v13, "destinationColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "texLuma");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v40, 4);

    objc_msgSend(v13, "destinationColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "texChroma");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTexture:atIndex:", v42, 5);

    objc_msgSend(v12, "setBytes:length:atIndex:", v48, 8, 0);
    objc_msgSend(v12, "setBytes:length:atIndex:", &v46, 24, 1);
    objc_msgSend(v12, "setBytes:length:atIndex:", &v44, 24, 2);
    objc_msgSend(v12, "setBytes:length:atIndex:", v50, 4, 3);
    v31 = v12;
    v32 = 4;
  }
  objc_msgSend(v31, "setBytes:length:atIndex:", &v49, 4, v32);
  objc_msgSend(v12, "setSamplerState:atIndex:", v18, 0);
  v46 = v43;
  v47 = 1;
  v44 = xmmword_1C9322A30;
  v45 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", &v46, &v44);

}

- (void)interpolateRGBRadiusToDest:(id)a3 renderRequest:(id)a4 inRGBA:(id)a5 inRGBRadius:(id)a6 inRandomGauss:(id)a7 bicubicSampling:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  int32x2_t v20;
  uint64_t v21;
  id v22;
  __int16 v23;
  __int16 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  _WORD v43[2];
  int64x2_t v44;
  __int128 v45;
  _DWORD v46[2];

  v8 = a8;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a3;
  +[PTRaytracingUtilsV1 calculateVarReadNoise:](PTRaytracingUtilsV1, "calculateVarReadNoise:", v14);
  v46[0] = v20.i32[0];
  v46[1] = v19;
  v20.i16[0] = 0;
  v20.i16[2] = 0;
  v44 = 0u;
  v45 = 0u;
  if (v14)
  {
    objc_msgSend(v14, "scissorRect");
    v20 = vmovn_s64(v44);
  }
  v43[1] = v20.i16[2];
  v43[0] = v20.i16[0];
  v21 = 488;
  if (v8)
    v21 = 480;
  v22 = *(id *)((char *)&self->super.isa + v21);
  v42 = 0;
  if (v17)
  {
    -[PTRandom nextUshort2:](self->_random, "nextUshort2:", objc_msgSend(v17, "width") - 1);
    HIWORD(v42) = v23;
    LOWORD(v42) = v24;
  }
  objc_msgSend(v14, "destinationColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "transferFunction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v26, 1);

  objc_msgSend(v14, "destinationColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v28, "isRGB");

  if ((_DWORD)v26)
  {
    objc_msgSend(v18, "setComputePipelineState:", self->_interpolateRGBRadiusToDestRGBA[v27]);
    objc_msgSend(v18, "setTexture:atIndex:", v15, 0);
    objc_msgSend(v18, "setTexture:atIndex:", v16, 1);
    objc_msgSend(v18, "setTexture:atIndex:", v17, 2);
    objc_msgSend(v14, "destinationColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "texRGBA");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTexture:atIndex:", v30, 3);

    objc_msgSend(v18, "setBytes:length:atIndex:", v46, 8, 0);
    objc_msgSend(v18, "setBytes:length:atIndex:", v43, 4, 1);
    v31 = v18;
    v32 = 2;
  }
  else
  {
    v40 = 0uLL;
    v41 = 0;
    objc_msgSend(v14, "destinationColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v33, 0);

    objc_msgSend(v18, "setComputePipelineState:", self->_interpolateRGBRadiusToDestYUV[v27]);
    objc_msgSend(v18, "setTexture:atIndex:", v15, 0);
    objc_msgSend(v18, "setTexture:atIndex:", v16, 1);
    objc_msgSend(v18, "setTexture:atIndex:", v17, 2);
    objc_msgSend(v14, "destinationColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "texLuma");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTexture:atIndex:", v35, 3);

    objc_msgSend(v14, "destinationColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "texChroma");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTexture:atIndex:", v37, 4);

    objc_msgSend(v18, "setBytes:length:atIndex:", v46, 8, 0);
    objc_msgSend(v18, "setBytes:length:atIndex:", &v40, 24, 1);
    objc_msgSend(v18, "setBytes:length:atIndex:", v43, 4, 2);
    v31 = v18;
    v32 = 3;
  }
  objc_msgSend(v31, "setBytes:length:atIndex:", &v42, 4, v32);
  objc_msgSend(v18, "setSamplerState:atIndex:", v22, 0);
  v38 = v45;
  v39 = 1;
  v40 = xmmword_1C9322A30;
  v41 = 1;
  objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", &v38, &v40);

}

- (int)convertRGBPyramidFromSource:(id)a3 renderRequest:(id)a4 rgbaPyramidArray:(id)a5 skipLevel0:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  _QWORD v42[3];
  __int128 v43;
  uint64_t v44;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "sourceColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transferFunction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v14, 1);

  objc_msgSend(v12, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  }
  objc_msgSend(v10, "sourceColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isRGB");

  if (v26)
  {
    objc_msgSend(v16, "setComputePipelineState:", self->_convertRGBPyramid[v15]);
    objc_msgSend(v10, "sourceColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "texRGBA");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v28, 0);

    if (v6)
    {
      objc_msgSend(v16, "setTexture:atIndex:", 0, 1);
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTexture:atIndex:", v34, 1);

    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v35, 2);

  }
  else
  {
    v43 = 0uLL;
    v44 = 0;
    objc_msgSend(v10, "sourceColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v29, 1);

    objc_msgSend(v16, "setComputePipelineState:", self->_convertRGBPyramidFromYUV[v15]);
    objc_msgSend(v10, "sourceColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "texLuma");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v31, 0);

    objc_msgSend(v10, "sourceColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "texChroma");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v33, 1);

    if (v6)
    {
      objc_msgSend(v16, "setTexture:atIndex:", 0, 2);
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTexture:atIndex:", v36, 2);

    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTexture:atIndex:", v37, 3);

    objc_msgSend(v16, "setBytes:length:atIndex:", &v43, 24, 0);
  }
  objc_msgSend(v10, "sourceColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (unint64_t)objc_msgSend(v38, "width") >> 1;
  objc_msgSend(v10, "sourceColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v39;
  v42[1] = (unint64_t)objc_msgSend(v40, "height") >> 1;
  v42[2] = 1;
  v43 = xmmword_1C9322A40;
  v44 = 1;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v42, &v43);

  objc_msgSend(v16, "endEncoding");
  return 0;
}

- (void)focusEdgeMask:(id)a3 inDisparityDiff:(id)a4 focusObject:(PTFocus *)a5 focusEdge:(PTFocusEdge)a6 outFocusEdgeMask:(id)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  PTFocusEdge v19;

  v19 = a6;
  v11 = a7;
  v12 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComputePipelineState:", self->_focusEdgeMask);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 0);

  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", a5, 40, 0);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v19, 16, 1);
  v14 = objc_msgSend(v11, "width");
  v15 = objc_msgSend(v11, "height");

  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 1;
  v16 = xmmword_1C9322A30;
  v17 = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v13, "endEncoding");

}

- (void)centerDisparityOnFocus:(id)a3 inDisparity:(id)a4 outDisparity:(id)a5 focusObject:(PTFocus *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  float v26;

  v26 = *(float *)&dword_1C9322B98[(float)(a6->var2 * 1000.0) > 70.0] / a6->var0;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _PTLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  objc_msgSend(v12, "setComputePipelineState:", self->_centerDisparityOnFocus);
  objc_msgSend(v12, "setTexture:atIndex:", v11, 0);

  objc_msgSend(v12, "setTexture:atIndex:", v10, 1);
  objc_msgSend(v12, "setBytes:length:atIndex:", &a6->var1, 4, 0);
  objc_msgSend(v12, "setBytes:length:atIndex:", &v26, 4, 1);
  v21 = objc_msgSend(v10, "width");
  v22 = objc_msgSend(v10, "height");

  v25[0] = v21;
  v25[1] = v22;
  v25[2] = 1;
  v23 = xmmword_1C9322A40;
  v24 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v12, "endEncoding");

}

- (int)detectDilatedEdges:(id)a3 inDisparity:(id)a4 tempEdges:(id)a5 outEdges:(id)a6 focusObject:(PTFocus *)a7 disparityDiffMinMax:(id)a8 edgeTolerance:(float)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float var2;
  float v29;
  float v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[3];
  _QWORD v36[3];
  char v37;
  float v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[3];
  float v42;

  v42 = a9;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _PTLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  objc_msgSend(v19, "setComputePipelineState:", self->_sobelEdgeDetector);
  objc_msgSend(v19, "setTexture:atIndex:", v18, 0);
  objc_msgSend(v19, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v42, 4, 0);
  v41[0] = objc_msgSend(v16, "width");
  v41[1] = objc_msgSend(v16, "height");
  v41[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v41, &v39);
  var2 = a7->var2;
  +[PTRaytracingUtilsV1 frameWidth](PTRaytracingUtilsV1, "frameWidth");
  v30 = (float)(var2 / v29) * a7->var0;
  v31 = objc_msgSend(v18, "width");

  v38 = v30 * (float)v31;
  v37 = 1;
  objc_msgSend(v19, "setComputePipelineState:", self->_edgeDilation);
  objc_msgSend(v19, "setTexture:atIndex:", v16, 0);
  objc_msgSend(v19, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v37, 1, 0);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v38, 4, 1);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v15, 0, 2);
  v36[0] = objc_msgSend(v16, "width");
  v36[1] = objc_msgSend(v16, "height");
  v36[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v36, &v39);
  v37 = 0;
  objc_msgSend(v19, "setComputePipelineState:", self->_edgeDilation);
  objc_msgSend(v19, "setTexture:atIndex:", v17, 0);

  objc_msgSend(v19, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v37, 1, 0);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v38, 4, 1);
  objc_msgSend(v19, "setBuffer:offset:atIndex:", v15, 0, 2);

  v32 = objc_msgSend(v16, "width");
  v33 = objc_msgSend(v16, "height");

  v35[0] = v32;
  v35[1] = v33;
  v35[2] = 1;
  v39 = xmmword_1C9322A40;
  v40 = 1;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v35, &v39);
  objc_msgSend(v19, "endEncoding");

  return 0;
}

+ (PTFocus)createFocusObject:(SEL)a3 pyramidSamplingFraction:(id)a4 anamorphicFactor:(float)a5 raytracingRadiusLocal:(float)a6 rayCount:(float)a7 colorSize:(int)a8 doMacroApertureLimit:(BOOL)a9
{
  float32x2_t v9;
  _BOOL4 v10;
  id v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  double v33;
  float v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  double v40;
  float32x2_t v41;
  int32x2_t v42;
  float v43;
  float32x2_t v44;
  float v45;
  PTFocus *result;
  uint64_t v47;
  float v48;
  float32x2_t v50;
  uint8_t buf[4];
  double v52;
  uint64_t v53;

  v10 = a9;
  v50 = v9;
  v53 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  objc_msgSend(v15, "focusDisparity");
  v17 = v16;
  objc_msgSend(v15, "fNumber");
  v19 = v18;
  objc_msgSend(v15, "alphaLowLight");
  v21 = v20;
  objc_msgSend(v15, "focalLenIn35mmFilm");
  v23 = v22;
  objc_msgSend(v15, "visCropFactor");
  v48 = v24;
  objc_msgSend(v15, "visCropFactor");
  v47 = v25;
  v26 = v17;
  if (v17 > 10.0 || v26 < 0.025)
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v52 = v17;
      _os_log_impl(&dword_1C9281000, v27, OS_LOG_TYPE_INFO, "FocusDistance will be clipped during rendering. Was %f", buf, 0xCu);
    }

  }
  *(_QWORD *)&retstr[1].var2 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  v28 = 0.025;
  if (v26 >= 0.025)
    v28 = v17;
  v29 = fmin(v28, 10.0);
  retstr->var1 = v29;
  if (v10)
  {
    if (objc_msgSend(v15, "sensorID") == 19)
    {
      v30 = 6.6;
      v31 = 0.4;
    }
    else
    {
      v30 = 2.8;
      v31 = 1.3333;
    }
    objc_msgSend(v15, "networkBias", v47);
    v33 = (float)((float)((float)(v30 * (float)(v29 - v32)) / v31) * 0.33333) + v19 * 0.666666657;
    if (v33 >= v19)
    {
      v34 = v33;
      v19 = v34;
    }
  }
  v35 = v48;
  if (v48 < *((float *)&v47 + 1))
    v35 = *((float *)&v47 + 1);
  if (v19 >= 1.0)
    v36 = v19;
  else
    v36 = 1.0;
  v37 = (float)(1.0 - v21) * 22.0 + v36 * v21;
  v38 = v23 / 1000.0 * v35;
  *(float *)&v38 = v38;
  retstr->var2 = *(float *)&v38;
  v40 = *(float *)&v38;
  v39 = *(float *)&v38 / (v37 + v37);
  retstr->var0 = v39;
  LODWORD(v40) = 1024685244;
  if (v50.f32[1] <= v50.f32[0])
  {
    v41.i32[0] = vdup_lane_s32(*(int32x2_t *)&v40, 0).u32[0];
    v41.f32[1] = vmuls_lane_f32(0.036, v50, 1) / v50.f32[0];
  }
  else
  {
    v41 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v40, 0);
    v41.f32[0] = (float)(v50.f32[0] * 0.036) / v50.f32[1];
  }
  *(float *)v42.i32 = 1.0 / a6;
  *(float *)&v42.i32[1] = a6;
  v43 = v39 / (a7 + 1.0);
  v44 = vdiv_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0), v41);
  *(float32x2_t *)&retstr[1].var0 = vmul_n_f32(vmul_f32((float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32((float32x2_t)(v50.u32[1] | 0x408F400000000000), v50), 0), (int8x8_t)vrev64_s32(v42), (int8x8_t)v42), v44), v43);
  v45 = 1.0 / sqrt((double)a8 / 3.14159265) * a5;
  retstr->var3 = (float)(v50.f32[0] * (float)(v43 * v44.f32[0])) * v45;
  retstr->var4 = v45;
  retstr[1].var2 = 0.02 / v45;

  return result;
}

+ (PTFocusEdge)createFocusEdge
{
  float v2;
  float v3;
  float v4;
  float v5;
  PTFocusEdge result;

  v2 = 0.0015;
  v3 = 0.1;
  v4 = 0.5;
  v5 = 1.5;
  result.minMaxThreshold = v3;
  result.gradientWeight = v5;
  result.gradientThreshold = v4;
  result.width = v2;
  return result;
}

+ (float)focalLength
{
  return 0.032;
}

+ (float)frameWidth
{
  return 0.036;
}

+ (id)precomputeNoise:(id)a3 sideLength:(int)a4
{
  id v5;
  void *v6;
  PTRandom *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  _WORD *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[6];

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (4 * a4 * a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PTRandom initWithSeed:]([PTRandom alloc], "initWithSeed:", 0x7FFFFFFFLL);
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = v9;
  if (a4)
  {
    v11 = 2 * a4 * a4;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    v13 = (_WORD *)v9;
    do
    {
      -[PTRandom nextFloat](v7, "nextFloat");
      *v13++ = (int)v14;
      --v12;
    }
    while (v12);
  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 60, a4, a4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUsage:", 3);
  v16 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v15);
  memset(v18, 0, 24);
  v18[3] = a4;
  v18[4] = a4;
  v18[5] = 1;
  objc_msgSend(v16, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v18, 0, v10, 4 * a4);

  return v16;
}

+ (PTNoiseValues)calculateVarReadNoise:(id)a3
{
  id v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  PTNoiseValues result;

  v3 = a3;
  v4 = objc_msgSend(v3, "AGC");
  v5 = objc_msgSend(v3, "conversionGain");
  v6 = objc_msgSend(v3, "readNoise_1x");
  v7 = objc_msgSend(v3, "readNoise_8x");
  v8 = objc_msgSend(v3, "sensorID");
  if (v8 == 1811 || v8 == 1300)
    v10 = 2.0;
  else
    v10 = 1.0;
  objc_msgSend(v3, "renderState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sourceColorBitDepth");

  objc_msgSend(v3, "totalSensorCropRectSize");
  v14 = v13;
  objc_msgSend(v3, "sourceColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 / (double)(unint64_t)objc_msgSend(v15, "width");
  objc_msgSend(v3, "totalSensorCropRectSize");
  v18 = v16 * v17;
  objc_msgSend(v3, "sourceColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v10 / (v18 / (double)(unint64_t)objc_msgSend(v19, "height"));
  v21 = v20 / 1023.0;
  if (v12 == 10)
    v21 = (float)(v20 / 1023.0) * 12.0;
  v22 = (float)v4 / 255.0;
  v23 = (float)((float)v5 / 65535.0) * v21;
  v24 = (float)((float)v6 / 65535.0) * (float)((float)v6 / 65535.0);
  v25 = (float)(v24 - (float)((float)((float)v7 / 65535.0) * (float)((float)v7 / 65535.0))) / 0.98438;
  v26 = v23 * (float)((float)(v25 + (float)((float)(v22 * (float)(v24 - v25)) * v22)) * v23);
  v27 = v22 * v23;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;

  objc_storeStrong((id *)&self->_random, 0);
  objc_storeStrong((id *)&self->_sNLE, 0);
  objc_storeStrong((id *)&self->_sNBE, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_edgeDilation, 0);
  objc_storeStrong((id *)&self->_sobelEdgeDetector, 0);
  objc_storeStrong((id *)&self->_centerDisparityOnFocus, 0);
  for (i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_convertRGBPyramidFromYUV[i + 8], 0);
  for (j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_convertRGBPyramid[j + 8], 0);
  for (k = 0; k != -9; --k)
    objc_storeStrong((id *)&self->_interpolateRGBRadiusToDestRGBAFromSource[k + 8], 0);
  for (m = 0; m != -9; --m)
    objc_storeStrong((id *)&self->_interpolateRGBRadiusToDestYUVFromSource[m + 8], 0);
  for (n = 152; n != 80; n -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + n), 0);
    n -= 8;
  }
  while (n != 8);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
