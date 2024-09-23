@implementation PTGlobalReduction

- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4 pixelFormat:(unint64_t)a5
{
  double height;
  double width;
  id v10;
  PTGlobalReduction *v11;
  PTGlobalReduction *v12;
  id *p_metalContext;
  void *v14;
  uint64_t v15;
  MTLComputePipelineState *parallelReductionTextureSimd;
  uint64_t v17;
  MTLComputePipelineState *parallelReductionTextureMinMaxSimd;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  signed int v30;
  int v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  MTLTexture *texPing;
  void *v40;
  uint64_t v41;
  MTLTexture *texPong;
  uint64_t v43;
  MTLComputePipelineState *parallelReductionAverage;
  uint64_t v45;
  MTLComputePipelineState *parallelReductionMax;
  uint64_t v47;
  MTLComputePipelineState *parallelReductionMin;
  NSObject *v49;
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
  NSObject *v64;
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
  uint64_t v80;
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
  NSArray *simdTextures;
  void *i;
  unint64_t v96;
  unint64_t v97;
  void *v98;
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
  PTGlobalReduction *v120;
  uint64_t v122;
  NSArray *simdMinMaxTextures;
  id v124;
  objc_super v125;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v125.receiver = self;
  v125.super_class = (Class)PTGlobalReduction;
  v11 = -[PTGlobalReduction init](&v125, sel_init);
  v12 = v11;
  if (v11)
  {
    p_metalContext = (id *)&v11->_metalContext;
    objc_storeStrong((id *)&v11->_metalContext, a3);
    -[PTMetalContext device](v12->_metalContext, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_supportGpuSIMD = objc_msgSend(v14, "supportsFamily:", 1007);

    if (v12->_supportGpuSIMD)
    {
      objc_msgSend(v10, "computePipelineStateFor:withConstants:", CFSTR("parallelReductionTextureSimd"), 0);
      v15 = objc_claimAutoreleasedReturnValue();
      parallelReductionTextureSimd = v12->_parallelReductionTextureSimd;
      v12->_parallelReductionTextureSimd = (MTLComputePipelineState *)v15;

      if (v12->_parallelReductionTextureSimd)
      {
        objc_msgSend(v10, "computePipelineStateFor:withConstants:", CFSTR("parallelReductionTextureMinMaxSimd"), 0);
        v17 = objc_claimAutoreleasedReturnValue();
        parallelReductionTextureMinMaxSimd = v12->_parallelReductionTextureMinMaxSimd;
        v12->_parallelReductionTextureMinMaxSimd = (MTLComputePipelineState *)v17;

        if (v12->_parallelReductionTextureMinMaxSimd)
        {
          v19 = -[MTLComputePipelineState threadExecutionWidth](v12->_parallelReductionTextureSimd, "threadExecutionWidth");
          v12->simdReductionThreadsPerGroup.width = 4;
          v12->simdReductionThreadsPerGroup.height = v19 >> 2;
          v12->simdReductionThreadsPerGroup.depth = 1;
          if (-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v12->_parallelReductionTextureSimd, "maxTotalThreadsPerThreadgroup") < v12->simdReductionThreadsPerGroup.height* v12->simdReductionThreadsPerGroup.width)
          {
            _PTLogSystem();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.10(v20, v21, v22, v23, v24, v25, v26, v27);

          }
          v124 = v10;
          v28 = (void *)objc_opt_new();
          v29 = (int)width;
          v30 = (int)height;
          v31 = (int)height;
          v32 = (int)width;
          while (1)
          {
            v33 = 2 * v12->simdReductionThreadsPerGroup.width;
            v34 = 2 * v12->simdReductionThreadsPerGroup.height;
            if (v33 >= v32 && v34 >= v31)
              break;
            v32 = vcvtps_s32_f32((float)v32 / (float)v33);
            v31 = vcvtps_s32_f32((float)v31 / (float)v34);
            objc_msgSend(*p_metalContext, "textureUtil");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "createWithWidth:height:pixelFormat:", v32, v31, a5);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              _PTLogSystem();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.8(v64, v65, v66, v67, v68, v69, v70, v71);
              goto LABEL_41;
            }
            objc_msgSend(v28, "addObject:", v36);

          }
          v93 = objc_msgSend(v28, "copy");
          simdTextures = v12->_simdTextures;
          v12->_simdTextures = (NSArray *)v93;

          for (i = (void *)objc_opt_new(); ; objc_msgSend(i, "addObject:", v28))
          {

            v96 = 2 * v12->simdReductionThreadsPerGroup.width;
            v97 = 2 * v12->simdReductionThreadsPerGroup.height;
            if (v96 >= v29 && v97 >= v30)
            {
              v122 = objc_msgSend(i, "copy");
              simdMinMaxTextures = v12->_simdMinMaxTextures;
              v12->_simdMinMaxTextures = (NSArray *)v122;

              v10 = v124;
              goto LABEL_48;
            }
            v29 = vcvtps_s32_f32((float)v29 / (float)v96);
            v30 = 2 * vcvtps_s32_f32((float)v30 / (float)v97);
            objc_msgSend(*p_metalContext, "textureUtil");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "createWithWidth:height:pixelFormat:", v29, v30, a5);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
              break;
          }
          _PTLogSystem();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.8(v64, v106, v107, v108, v109, v110, v111, v112);
          v28 = i;
LABEL_41:
          v10 = v124;

          goto LABEL_45;
        }
        _PTLogSystem();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.7(v49, v72, v73, v74, v75, v76, v77, v78);
      }
      else
      {
        _PTLogSystem();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.6(v49, v57, v58, v59, v60, v61, v62, v63);
      }
    }
    else
    {
      -[PTMetalContext textureUtil](v12->_metalContext, "textureUtil");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "createWithWidth:height:pixelFormat:", (unint64_t)((width + 1.0) * 0.5), (unint64_t)((height + 1.0) * 0.5), a5);
      v38 = objc_claimAutoreleasedReturnValue();
      texPing = v12->_texPing;
      v12->_texPing = (MTLTexture *)v38;

      if (v12->_texPing)
      {
        -[PTMetalContext textureUtil](v12->_metalContext, "textureUtil");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "createWithWidth:height:pixelFormat:", (unint64_t)(-[MTLTexture width](v12->_texPing, "width") + 1) >> 1, (unint64_t)(-[MTLTexture height](v12->_texPing, "height") + 1) >> 1, a5);
        v41 = objc_claimAutoreleasedReturnValue();
        texPong = v12->_texPong;
        v12->_texPong = (MTLTexture *)v41;

        if (v12->_texPong)
        {
          objc_msgSend(v10, "computePipelineStateFor:withConstants:", CFSTR("parallelReductionAverage"), 0);
          v43 = objc_claimAutoreleasedReturnValue();
          parallelReductionAverage = v12->_parallelReductionAverage;
          v12->_parallelReductionAverage = (MTLComputePipelineState *)v43;

          if (v12->_parallelReductionAverage)
          {
            objc_msgSend(v10, "computePipelineStateFor:withConstants:", CFSTR("parallelReductionMax"), 0);
            v45 = objc_claimAutoreleasedReturnValue();
            parallelReductionMax = v12->_parallelReductionMax;
            v12->_parallelReductionMax = (MTLComputePipelineState *)v45;

            if (v12->_parallelReductionMax)
            {
              objc_msgSend(v10, "computePipelineStateFor:withConstants:", CFSTR("parallelReductionMin"), 0);
              v47 = objc_claimAutoreleasedReturnValue();
              parallelReductionMin = v12->_parallelReductionMin;
              v12->_parallelReductionMin = (MTLComputePipelineState *)v47;

              if (v12->_parallelReductionMin)
              {
LABEL_48:
                v120 = v12;
                goto LABEL_46;
              }
              _PTLogSystem();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.5(v49, v50, v51, v52, v53, v54, v55, v56);
            }
            else
            {
              _PTLogSystem();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.4(v49, v113, v114, v115, v116, v117, v118, v119);
            }
          }
          else
          {
            _PTLogSystem();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.3(v49, v99, v100, v101, v102, v103, v104, v105);
          }
        }
        else
        {
          _PTLogSystem();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.2(v49, v86, v87, v88, v89, v90, v91, v92);
        }
      }
      else
      {
        _PTLogSystem();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:].cold.1(v49, v79, v80, v81, v82, v83, v84, v85);
      }
    }

  }
LABEL_45:
  v120 = 0;
LABEL_46:

  return v120;
}

- (PTGlobalReduction)initWithMetalContext:(id)a3 textureSize:(CGSize)a4
{
  return -[PTGlobalReduction initWithMetalContext:textureSize:pixelFormat:](self, "initWithMetalContext:textureSize:pixelFormat:", a3, 25, a4.width, a4.height);
}

- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5
{
  MTLComputePipelineState *parallelReductionAverage;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  id v13;

  parallelReductionAverage = self->_parallelReductionAverage;
  v9 = a5;
  v10 = a4;
  v13 = a3;
  v11 = objc_msgSend(v10, "width");
  v12 = 1.0 / (double)(unint64_t)(objc_msgSend(v10, "height") * v11);
  *(float *)&v12 = v12;
  -[PTGlobalReduction parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:](self, "parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:", v13, v10, v9, 0, parallelReductionAverage, 2, v12);

}

- (void)parallelReductionMax:(id)a3 inTexture:(id)a4 globalMaxBuffer:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v10, "length") <= 3)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTGlobalReduction parallelReductionMax:inTexture:globalMaxBuffer:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  LODWORD(v11) = 1.0;
  -[PTGlobalReduction parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:](self, "parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:", v8, v9, v10, 0, self->_parallelReductionMax, 1, v11);

}

- (void)parallelReductionMin:(id)a3 inTexture:(id)a4 globalMinBuffer:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v10, "length") <= 3)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTGlobalReduction parallelReductionMax:inTexture:globalMaxBuffer:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  LODWORD(v11) = 1.0;
  -[PTGlobalReduction parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:](self, "parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:", v8, v9, v10, 0, self->_parallelReductionMin, 0, v11);

}

- (void)parallelReductionMinMax:(id)a3 inTexture:(id)a4 globalMinMaxBuffer:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v10, "length") <= 7)
  {
    _PTLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PTGlobalReduction parallelReductionMinMax:inTexture:globalMinMaxBuffer:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  if (self->_supportGpuSIMD)
  {
    -[PTGlobalReduction parallelReductionTextureMinMaxSimd:inTexture:globalBuffer:](self, "parallelReductionTextureMinMaxSimd:inTexture:globalBuffer:", v8, v9, v10);
  }
  else
  {
    LODWORD(v11) = 1.0;
    -[PTGlobalReduction parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:](self, "parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:", v8, v9, v10, 0, self->_parallelReductionMin, 0, v11);
    LODWORD(v20) = 1.0;
    -[PTGlobalReduction parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:](self, "parallelReduction:inTexture:globalBuffer:offset:pipelineState:reductionType:factor:", v8, v9, v10, 4, self->_parallelReductionMax, 1, v20);
  }

}

- (void)parallelReduction:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 pipelineState:(id)a7 reductionType:(int)a8 factor:(float)a9
{
  uint64_t v10;
  uint64_t v12;
  id v16;
  id v17;
  double v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  int v36;
  int v37;
  MTLTexture **v38;
  MTLTexture *v39;
  id *v40;
  id v41;
  MTLTexture *v42;
  MTLTexture *v43;
  int v44;
  BOOL v45;
  uint64_t v46;
  MTLTexture **p_texPing;
  MTLTexture **p_texPong;
  PTGlobalReduction *v49;
  id v50;
  MTLComputePipelineState *v51;
  int64x2_t v52;
  uint64_t v53;
  _QWORD v54[3];
  float v55;
  uint64_t v56;

  v10 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a6;
  v16 = a4;
  v17 = a5;
  v51 = (MTLComputePipelineState *)a7;
  if (self->_supportGpuSIMD)
  {
    *(float *)&v18 = a9;
    -[PTGlobalReduction parallelReductionTextureSimd:inTexture:globalBuffer:offset:reductionType:factor:](self, "parallelReductionTextureSimd:inTexture:globalBuffer:offset:reductionType:factor:", a3, v16, v17, v12, v10, v18);
  }
  else
  {
    v49 = self;
    objc_msgSend(a3, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    }
    v50 = v17;
    v28 = objc_msgSend(v16, "width");
    v29 = objc_msgSend(v16, "height");
    v30 = v29;
    if (v28 > 1 || v29 >= 2)
    {
      v31 = 0;
      p_texPing = &self->_texPing;
      p_texPong = &self->_texPong;
      v46 = (int)v12;
      while (1)
      {
        v32 = v30;
        *(float *)&v33 = (double)v28 + -0.5;
        v34 = (double)v30 + -0.5;
        *((float *)&v33 + 1) = v34;
        v56 = v33;
        v55 = 0.0;
        v35 = objc_msgSend(v16, "width", v46);
        v55 = (float)(unint64_t)(objc_msgSend(v16, "height") * v35);
        if (v28 >= -1)
          v36 = v28 + 1;
        else
          v36 = v28 + 2;
        if (v30 >= -1)
          v37 = v30 + 1;
        else
          v37 = v30 + 2;
        if ((v31 & 1) != 0)
          v38 = p_texPing;
        else
          v38 = p_texPong;
        v39 = *v38;
        if ((v31 & 1) != 0)
          v40 = (id *)p_texPong;
        else
          v40 = (id *)p_texPing;
        v41 = *v40;
        if (v31)
          v42 = v39;
        else
          v42 = (MTLTexture *)v16;
        v43 = v42;
        if ((v28 - 1) <= 1 && (v32 - 1) <= 1)
        {

          v41 = 0;
        }
        objc_msgSend(v19, "setComputePipelineState:", v51);
        objc_msgSend(v19, "setTexture:atIndex:", v43, 0);
        objc_msgSend(v19, "setTexture:atIndex:", v41, 1);
        objc_msgSend(v19, "setBuffer:offset:atIndex:", v50, v46, 0);
        if (v49->_parallelReductionAverage == v51)
        {
          objc_msgSend(v19, "setBytes:length:atIndex:", &v56, 8, 1);
          objc_msgSend(v19, "setBytes:length:atIndex:", &v55, 4, 2);
        }
        v44 = v36 >> 1;
        v30 = v37 >> 1;
        v54[0] = v44;
        v54[1] = v30;
        v54[2] = 1;
        v52 = vdupq_n_s64(8uLL);
        v53 = 1;
        objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v54, &v52);

        ++v31;
        v45 = v28 <= 2;
        v28 = v44;
        if (v45)
        {
          v28 = v44;
          if (v32 <= 2)
            break;
        }
      }
    }
    objc_msgSend(v19, "endEncoding");

    v17 = v50;
  }

}

- (void)parallelReductionTextureSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5 offset:(int)a6 reductionType:(int)a7 factor:(float)a8
{
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  id v31;
  __int128 v32;
  unint64_t depth;
  _QWORD v34[3];
  float v35;
  int v36;

  v31 = a4;
  v14 = a5;
  v36 = a7;
  v35 = a8;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
  -[NSArray count](self->_simdTextures, "count");
  v24 = 0;
  do
  {
    if (v24)
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdTextures, "objectAtIndexedSubscript:", v24 - 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = v31;
    }
    v26 = v25;
    if (v24 == -[NSArray count](self->_simdTextures, "count"))
    {
      v27 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdTextures, "objectAtIndexedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = (unint64_t)(objc_msgSend(v26, "width") + 1) >> 1;
    v29 = (unint64_t)(objc_msgSend(v26, "height") + 1) >> 1;
    objc_msgSend(v15, "setComputePipelineState:", self->_parallelReductionTextureSimd);
    objc_msgSend(v15, "setTexture:atIndex:", v26, 0);
    objc_msgSend(v15, "setTexture:atIndex:", v27, 1);
    objc_msgSend(v15, "setBytes:length:atIndex:", &v35, 4, 0);
    objc_msgSend(v15, "setBuffer:offset:atIndex:", v14, a6, 1);
    objc_msgSend(v15, "setBytes:length:atIndex:", &v36, 4, 2);
    v34[0] = v28;
    v34[1] = v29;
    v34[2] = 1;
    v32 = *(_OWORD *)&self->simdReductionThreadsPerGroup.width;
    depth = self->simdReductionThreadsPerGroup.depth;
    objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v34, &v32);

  }
  while (-[NSArray count](self->_simdTextures, "count") > v24++);
  objc_msgSend(v15, "endEncoding");

}

- (void)parallelReductionTextureMinMaxSimd:(id)a3 inTexture:(id)a4 globalBuffer:(id)a5
{
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v18;
  id v19;
  __int128 v20;
  unint64_t depth;
  _QWORD v22[3];
  uint8_t buf[4];
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v18 = a4;
  v8 = a5;
  -[NSArray count](self->_simdMinMaxTextures, "count");
  v9 = 0;
  do
  {
    if (v9)
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdMinMaxTextures, "objectAtIndexedSubscript:", v9 - 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v18;
    }
    v11 = v10;
    if (v9 == -[NSArray count](self->_simdMinMaxTextures, "count"))
    {
      v12 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_simdMinMaxTextures, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v11, "width");
    v14 = objc_msgSend(v11, "height");
    objc_msgSend(v19, "computeCommandEncoder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PTGlobalReduction parallelReductionTextureMinMaxSimd:inTexture:globalBuffer:].cold.1(buf, v24, v16);

    }
    objc_msgSend(v15, "setComputePipelineState:", self->_parallelReductionTextureMinMaxSimd);
    objc_msgSend(v15, "setTexture:atIndex:", v11, 0);
    objc_msgSend(v15, "setTexture:atIndex:", v12, 1);
    objc_msgSend(v15, "setBuffer:offset:atIndex:", v8, 0, 0);
    v22[0] = (unint64_t)(v13 + 1) >> 1;
    v22[1] = (unint64_t)(v14 + 1) >> 1;
    v22[2] = 1;
    v20 = *(_OWORD *)&self->simdReductionThreadsPerGroup.width;
    depth = self->simdReductionThreadsPerGroup.depth;
    objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v22, &v20);
    objc_msgSend(v15, "endEncoding");

  }
  while (-[NSArray count](self->_simdMinMaxTextures, "count") > v9++);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallelReductionMin, 0);
  objc_storeStrong((id *)&self->_parallelReductionMax, 0);
  objc_storeStrong((id *)&self->_parallelReductionAverage, 0);
  objc_storeStrong((id *)&self->_parallelReductionTextureMinMaxSimd, 0);
  objc_storeStrong((id *)&self->_parallelReductionTextureSimd, 0);
  objc_storeStrong((id *)&self->_simdMinMaxTextures, 0);
  objc_storeStrong((id *)&self->_simdTextures, 0);
  objc_storeStrong((id *)&self->_texPong, 0);
  objc_storeStrong((id *)&self->_texPing, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 textureSize:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parallelReductionMax:(uint64_t)a3 inTexture:(uint64_t)a4 globalMaxBuffer:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Length must be sizeof(float)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)parallelReductionMinMax:(uint64_t)a3 inTexture:(uint64_t)a4 globalMinMaxBuffer:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Length must be sizeof(float) * 2", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)parallelReductionTextureMinMaxSimd:(uint8_t *)buf inTexture:(_QWORD *)a2 globalBuffer:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "computeEncoder";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

@end
