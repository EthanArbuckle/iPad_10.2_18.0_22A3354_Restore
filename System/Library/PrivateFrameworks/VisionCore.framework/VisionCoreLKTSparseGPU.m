@implementation VisionCoreLKTSparseGPU

- (VisionCoreLKTSparseGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v11;
  VisionCoreLKTSparseGPU *v12;
  VisionCoreLKTSparseGPU *v13;
  uint64_t v14;
  MTLCommandQueue *commandQueue;
  id v17;
  objc_super v18;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VisionCoreLKTSparseGPU;
  v12 = -[VisionCoreLKTSparseGPU init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    if (((v7 | v8) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Invalid parameter"), CFSTR("Odd image dimensions are not supported"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    objc_storeStrong((id *)&v12->_mtlContext, a3);
    objc_msgSend(v11, "commandQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v14;

    -[VisionCoreLKTSparseGPU _setDefaultParameters](v13, "_setDefaultParameters");
    -[VisionCoreLKTSparseGPU _initMemory:height:nscales:](v13, "_initMemory:height:nscales:", v8, v7, v6);
    -[VisionCoreLKTSparseGPU _setupPipelines](v13, "_setupPipelines");
    -[VisionCoreLKTSparseGPU _setupBuffer](v13, "_setupBuffer");
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_F0_pxbuf);
  CVPixelBufferRelease(self->_F1_pxbuf);
  CVPixelBufferRelease(self->_F0_dxdy_pxbuf);
  CVPixelBufferRelease(self->_F1_dxdy_pxbuf);
  *(_OWORD *)&self->_F0_pxbuf = 0u;
  *(_OWORD *)&self->_F0_dxdy_pxbuf = 0u;
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreLKTSparseGPU;
  -[VisionCoreLKTSparseGPU dealloc](&v3, sel_dealloc);
}

- (void)waitUntilCompleted
{
  id v2;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLabel:", CFSTR("LKT:waitUntilCompleted"));
  objc_msgSend(v2, "commit");
  objc_msgSend(v2, "waitUntilCompleted");

}

- (MTLBuffer)keypointsTarget
{
  return self->_kptd_buf;
}

- (MTLBuffer)keypointsStatus
{
  return self->_status_buf;
}

- (int)computeMatchingFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 numKeypoints:(unsigned __int16)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  unint64_t nscales;
  MTLTexture **F0_tex;
  MTLTexture **F1_tex;
  MTLTexture **F0_dxdy_tex;
  void *v17;
  int v18;
  MTLTexture *v19;
  MTLTexture *v20;
  MTLCommandQueue *commandQueue;
  void *v22;
  void *v23;
  float v24;
  id v25;
  double v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  MTLBuffer *status_buf;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  __int16 v36;
  MTLBuffer *v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];

  v6 = a6;
  v41[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v39 = a5;
  v41[0] = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 65, v6, 0);
  v41[1] = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 65, v6, 0);
  v36 = v6;
  v37 = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 1, v6, 0);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", CFSTR("LKTSparse::Pyramid"));
  v35 = v10;
  -[VisionCoreLKTSparseGPU _enqueueImagePyramidWithCommandBuffer:inputTexture:index:](self, "_enqueueImagePyramidWithCommandBuffer:inputTexture:index:", v12, v10, 0);
  v34 = v11;
  -[VisionCoreLKTSparseGPU _enqueueImagePyramidWithCommandBuffer:inputTexture:index:](self, "_enqueueImagePyramidWithCommandBuffer:inputTexture:index:", v12, v11, 1);
  objc_msgSend(v12, "commit");
  nscales = self->_nscales;
  if ((int)nscales < 1)
  {
    v29 = 0;
  }
  else
  {
    v40 = 0;
    F0_tex = self->_F0_tex;
    F1_tex = self->_F1_tex;
    F0_dxdy_tex = self->_F0_dxdy_tex;
    v17 = v12;
    do
    {
      v18 = nscales - 1;
      v19 = self->_I_tex[0][(nscales - 1)];
      v20 = self->_I_tex[1][(nscales - 1)];
      commandQueue = self->_commandQueue;
      v38 = (id)v41[v40 ^ 1];
      -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LKT::Matching level %d"), nscales - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setLabel:", v22);

      -[VisionCoreLKTSparseGPU _enqueueFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesWithCommandBuffer:in_tex:out_tex:", v12, v19, F0_tex[(nscales - 1)]);
      -[VisionCoreLKTSparseGPU _enqueueFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesWithCommandBuffer:in_tex:out_tex:", v12, v20, F1_tex[(nscales - 1)]);
      -[VisionCoreLKTSparseGPU _enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v12, F0_tex[v18], F0_dxdy_tex[v18]);
      v23 = v39;
      v24 = 1.0 / (float)(1 << (nscales - 1));
      if (nscales != self->_nscales)
      {
        v23 = (void *)v41[v40];
        v24 = 2.0;
      }
      v25 = v23;
      F1_tex = self->_F1_tex;
      LOWORD(v33) = v36;
      *(float *)&v26 = 1.0 / (float)(1 << v18);
      *(float *)&v27 = v24;
      -[VisionCoreLKTSparseGPU _enqueueMatchingWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:num_keypoints:scale_kpts:scale_kptd:](self, "_enqueueMatchingWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:num_keypoints:scale_kpts:scale_kptd:", v12, F0_tex[(nscales - 1)], self->_F1_tex[(nscales - 1)], F0_dxdy_tex[(nscales - 1)], v39, v25, v26, v27, v38, v37, v33);

      objc_msgSend(v12, "commit");
      v28 = nscales--;
      v17 = v12;
      v29 = v40 ^ 1;
      v40 ^= 1uLL;
    }
    while (v28 > 1);
  }

  objc_storeStrong((id *)&self->_kptd_buf, (id)v41[v29]);
  status_buf = self->_status_buf;
  self->_status_buf = v37;

  for (i = 1; i != -1; --i)
  return 0;
}

- (int)computeMatchingBidirectionalFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 bidirectionalError:(float)a6 numKeypoints:(unsigned __int16)a7
{
  uint64_t v7;
  id v12;
  id v13;
  void *v14;
  uint64_t nscales;
  uint64_t v16;
  MTLTexture **F0_dxdy_tex;
  void *v18;
  uint64_t v19;
  MTLTexture *v20;
  id v21;
  void *v22;
  float v23;
  uint64_t v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  MTLBuffer *status_buf;
  uint64_t i;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  MTLTexture **F1_dxdy_tex;
  MTLTexture **F1_tex;
  MTLTexture **F0_tex;
  __int16 v43;
  MTLBuffer *v44;
  uint64_t v45;
  id v46;
  MTLTexture *v47;
  _QWORD v48[4];

  v7 = a7;
  v48[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v46 = a5;
  v48[0] = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 65, v7, 0);
  v48[1] = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 65, v7, 0);
  v43 = v7;
  v44 = -[VisionCoreMetalContext newBufferWithPixelFormat:width:data:](self->_mtlContext, "newBufferWithPixelFormat:width:data:", 1, v7, 0);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("LKTSparse::Pyramid"));
  v39 = v12;
  -[VisionCoreLKTSparseGPU _enqueueImagePyramidWithCommandBuffer:inputTexture:index:](self, "_enqueueImagePyramidWithCommandBuffer:inputTexture:index:", v14, v12, 0);
  v38 = v13;
  -[VisionCoreLKTSparseGPU _enqueueImagePyramidWithCommandBuffer:inputTexture:index:](self, "_enqueueImagePyramidWithCommandBuffer:inputTexture:index:", v14, v13, 1);
  objc_msgSend(v14, "commit");
  nscales = self->_nscales;
  if ((int)nscales < 1)
  {
    v32 = 0;
  }
  else
  {
    v16 = 0;
    F0_dxdy_tex = self->_F0_dxdy_tex;
    F1_dxdy_tex = self->_F1_dxdy_tex;
    v18 = v14;
    F1_tex = self->_F1_tex;
    F0_tex = self->_F0_tex;
    do
    {
      v19 = nscales - 1;
      v20 = self->_I_tex[0][(nscales - 1)];
      v47 = self->_I_tex[1][(nscales - 1)];
      v45 = v16 ^ 1;
      v21 = (id)v48[v16 ^ 1];
      v22 = v46;
      v23 = 1.0 / (float)(1 << (nscales - 1));
      if (nscales != self->_nscales)
      {
        v22 = (void *)v48[v16];
        v23 = 2.0;
      }
      v24 = (nscales - 1);
      v25 = v22;
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("LKT::Matching level %d"), nscales - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLabel:", v26);

      -[VisionCoreLKTSparseGPU _enqueueFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesWithCommandBuffer:in_tex:out_tex:", v14, v20, F0_tex[v24]);
      -[VisionCoreLKTSparseGPU _enqueueFeaturesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesWithCommandBuffer:in_tex:out_tex:", v14, v47, F1_tex[v24]);
      -[VisionCoreLKTSparseGPU _enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v14, F0_tex[v24], F0_dxdy_tex[v24]);
      if ((_DWORD)nscales == 1)
      {
        -[VisionCoreLKTSparseGPU _enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:](self, "_enqueueFeaturesDerivativesWithCommandBuffer:in_tex:out_tex:", v14, F1_tex[v24], F1_dxdy_tex[v24]);
        LOWORD(v37) = v43;
        *(float *)&v29 = a6;
        *(float *)&v30 = 1.0 / (float)(1 << v19);
        *(float *)&v31 = v23;
        -[VisionCoreLKTSparseGPU _enqueueMatchingBidirectionalWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_f1_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:bidirectional_error:num_keypoints:scale_kpts:scale_kptd:](self, "_enqueueMatchingBidirectionalWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_f1_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:bidirectional_error:num_keypoints:scale_kpts:scale_kptd:", v14, F0_tex[v24], F1_tex[v24], F0_dxdy_tex[v24], F1_dxdy_tex[v24], v46, v29, v30, v31, v25, v21, v44, v37);
      }
      else
      {
        LOWORD(v36) = v43;
        *(float *)&v27 = 1.0 / (float)(1 << v19);
        *(float *)&v28 = v23;
        -[VisionCoreLKTSparseGPU _enqueueMatchingWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:num_keypoints:scale_kpts:scale_kptd:](self, "_enqueueMatchingWithCommandBuffer:in_f0_tex:in_f1_tex:in_f0_dxdy_tex:in_kpts_buf:in_kptd_buf:out_kptd_buf:out_status_buf:num_keypoints:scale_kpts:scale_kptd:", v14, F0_tex[v24], F1_tex[v24], F0_dxdy_tex[v24], v46, v25, v27, v28, v21, v44, v36);
      }
      objc_msgSend(v14, "commit");

      --nscales;
      v18 = v14;
      v32 = v45;
      v16 = v45;
    }
    while ((unint64_t)(v19 + 1) > 1);
  }

  objc_storeStrong((id *)&self->_kptd_buf, (id)v48[v32]);
  status_buf = self->_status_buf;
  self->_status_buf = v44;

  for (i = 1; i != -1; --i)
  return 0;
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v21;
  id v22;

  v5 = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    v5 = 0;
    v6 = a4;
    v7 = a3;
    do
    {
      v8 = (v7 & 1) + v7;
      if (v8 >= 0)
        v9 = v8;
      else
        v9 = v8 + 1;
      v10 = v9 >> 1;
      v11 = v8 + 1;
      if (v10 >= 0)
        v12 = v10 & 1;
      else
        v12 = -(v10 & 1);
      v13 = (v6 & 1) + v6;
      if (v13 >= 0)
        v14 = v13;
      else
        v14 = v13 + 1;
      v15 = v14 >> 1;
      v16 = v13 + 1;
      if (v15 >= 0)
        v17 = v15 & 1;
      else
        v17 = -(v15 & 1);
      v18 = v11 + 2 * v12;
      v7 = v18 >> 1;
      v19 = v16 + 2 * v17;
      v6 = v19 >> 1;
      ++v5;
    }
    while (v18 >= 16 && v19 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_tgt_size.width = (double)a3;
  self->_tgt_size.height = (double)a4;
  if (a5 >= 0)
    v21 = a5;
  else
    v21 = v5;
  self->_nscales = v21;
  self->_maxThreadExecutionWidth = 0;
  if (v21 > v5 || v21 >= 10)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Invalid parameter"), CFSTR("The number of scales specified is too large"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
}

- (void)_setupPipelines
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t maxThreadExecutionWidth;
  id v12;

  v3 = 0;
  v4 = 0;
  do
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", kKernelNames[v3]);
    -[VisionCoreMetalContext library](self->_mtlContext, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v7, "newFunctionWithName:", v6);

    -[VisionCoreMetalContext device](self->_mtlContext, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "newComputePipelineStateWithFunction:error:", v12, 0);

    objc_storeStrong((id *)&self->_computePipelines[v3], v9);
    v10 = objc_msgSend(v9, "threadExecutionWidth");
    maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v10 > maxThreadExecutionWidth)
      maxThreadExecutionWidth = objc_msgSend(v9, "threadExecutionWidth");
    self->_maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
    v4 = v12;
  }
  while (v3 != 6);

}

- (int)_setupBuffer
{
  int width;
  int height;
  double v5;
  double v6;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  MTLTexture **v14;
  CGFloat *i;
  int v16;
  double v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  double v23;
  uint64_t v24;
  MTLTexture *v25;
  uint64_t v26;
  MTLTexture *v27;
  uint64_t v28;
  MTLTexture *v29;
  uint64_t v30;
  MTLTexture *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int32x2_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  MTLTexture *v55;
  __int128 v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  __int128 v73;
  int32x2_t v74;

  width = (int)self->_ref_size.width;
  height = (int)self->_ref_size.height;
  v5 = self->_tgt_size.width;
  v6 = self->_tgt_size.height;
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer(width, height, 0x32433068u);
  self->_F0_pxbuf = PixelBuffer;
  if (PixelBuffer)
  {
    v8 = (__CVBuffer *)CreatePixelBuffer((int)v5, (int)v6, 0x32433068u);
    self->_F1_pxbuf = v8;
    if (v8)
    {
      v9 = (__CVBuffer *)CreatePixelBuffer(width, height, 0x52476841u);
      self->_F0_dxdy_pxbuf = v9;
      if (v9)
      {
        v10 = (__CVBuffer *)CreatePixelBuffer((int)v5, (int)v6, 0x52476841u);
        self->_F1_dxdy_pxbuf = v10;
        if (v10)
        {
          if (self->_nscales < 1)
            return 0;
          v11 = 0;
          v12 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_tgt_size));
          v13 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
          v14 = self->_I_tex[1];
          for (i = &self->_tgt_pyr_size[0].height; ; i += 2)
          {
            v16 = v13.i32[0];
            v17 = (double)v13.i32[0];
            v18 = v13.i32[1];
            v19 = (double)v13.i32[1];
            v20 = v12.i32[0];
            v21 = (double)v12.i32[0];
            v22 = v12.i32[1];
            v23 = (double)v12.i32[1];
            *(i - 21) = (double)v13.i32[0];
            *(i - 20) = (double)v13.i32[1];
            *(i - 1) = (double)v12.i32[0];
            *i = (double)v12.i32[1];
            -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F0_pxbuf, 65, 0, (double)v13.i32[0], (double)v13.i32[1], v73);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v14[12];
            v14[12] = (MTLTexture *)v24;

            if (!v14[12])
              break;
            -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F1_pxbuf, 65, 0, v21, v23);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v14[22];
            v14[22] = (MTLTexture *)v26;

            if (!v14[22])
              break;
            -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F0_dxdy_pxbuf, 115, 0, v17, v19);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v14[34];
            v14[34] = (MTLTexture *)v28;

            if (!v14[34])
              break;
            -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F1_dxdy_pxbuf, 115, 0, v21, v23);
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = v14[44];
            v14[44] = (MTLTexture *)v30;

            if (!v14[44])
              break;
            objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v16, v18, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setUsage:", 19);
            -[VisionCoreMetalContext device](self->_mtlContext, "device");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "newTextureWithDescriptor:", v32);
            v35 = *(v14 - 10);
            *(v14 - 10) = (MTLTexture *)v34;

            v36 = v16 & 1;
            if (v16 < 0)
              v36 = -v36;
            v37 = v18 & 1;
            if (v18 < 0)
              v37 = -v37;
            v38 = v36 + v16;
            if (v38 >= 0)
              v39 = v38;
            else
              v39 = v38 + 1;
            v40 = v39 >> 1;
            if (v40 >= 0)
              v41 = v40 & 1;
            else
              v41 = -(v40 & 1);
            v42 = v37 + v18;
            if (v42 >= 0)
              v43 = v42;
            else
              v43 = v42 + 1;
            v44 = v43 >> 1;
            if (v44 >= 0)
              v45 = v44 & 1;
            else
              v45 = -(v44 & 1);
            v46 = v38 + 2 * v41;
            if (v46 + 1 >= 0)
              v47 = v46 + 1;
            else
              v47 = v46 + 2;
            v48 = v47 >> 1;
            v49 = v42 + 2 * v45;
            if (v49 + 1 >= 0)
              v50 = v49 + 1;
            else
              v50 = v49 + 2;
            v51.i32[0] = v48;
            v51.i32[1] = v50 >> 1;
            v74 = v51;

            objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v20, v22, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setUsage:", 19);
            -[VisionCoreMetalContext device](self->_mtlContext, "device");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "newTextureWithDescriptor:", v52);
            v55 = *v14;
            *v14++ = (MTLTexture *)v54;

            v57 = v20 & 1;
            if (v20 < 0)
              v57 = -v57;
            v58 = v22 & 1;
            if (v22 < 0)
              v58 = -v58;
            v59 = v57 + v20;
            if (v59 >= 0)
              v60 = v59;
            else
              v60 = v59 + 1;
            v61 = v60 >> 1;
            if (v61 >= 0)
              v62 = v61 & 1;
            else
              v62 = -(v61 & 1);
            v63 = v58 + v22;
            if (v63 >= 0)
              v64 = v63;
            else
              v64 = v63 + 1;
            v65 = v64 >> 1;
            if (v65 >= 0)
              v66 = v65 & 1;
            else
              v66 = -(v65 & 1);
            v67 = v59 + 2 * v62;
            if (v67 + 1 >= 0)
              v68 = v67 + 1;
            else
              v68 = v67 + 2;
            v69 = v68 >> 1;
            v70 = v63 + 2 * v66;
            if (v70 + 1 >= 0)
              v71 = v70 + 1;
            else
              v71 = v70 + 2;
            LODWORD(v56) = v69;
            DWORD1(v56) = v71 >> 1;
            v73 = v56;

            v12 = (int32x2_t)v73;
            v13 = v74;
            if (++v11 >= self->_nscales)
              return 0;
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_enqueueImagePyramidWithCommandBuffer:(id)a3 inputTexture:(id)a4 index:(int)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  char *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "pixelFormat") == 10)
  {
    objc_msgSend(v8, "blitCommandEncoder", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "copyFromTexture:toTexture:", v9, self->_I_tex[a5][0]);
  }
  else
  {
    objc_msgSend(v8, "computeCommandEncoder", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[0]);
    objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
    objc_msgSend(v10, "setTexture:atIndex:", self->_I_tex[a5][0], 1);
    v11 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[0], "threadExecutionWidth");
    v12 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[0], "maxTotalThreadsPerThreadgroup")/ v11;
    v32[0] = (int)(v11 + objc_msgSend(v9, "width") - 1) / v11;
    v32[1] = (int)(v12 + objc_msgSend(v9, "height") - 1) / v12;
    v32[2] = 1;
    v31[0] = v11;
    v31[1] = v12;
    v31[2] = 1;
    objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v32, v31);
  }
  objc_msgSend(v10, "endEncoding");

  if (self->_nscales >= 2)
  {
    v13 = 0;
    v28 = (char *)self + 80 * a5;
    do
    {
      v14 = &v28[8 * v13];
      v15 = (void *)*((_QWORD *)v14 + 50);
      v16 = *((id *)v14 + 51);
      v17 = v15;
      objc_msgSend(v8, "computeCommandEncoder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setComputePipelineState:", self->_computePipelines[1]);
      objc_msgSend(v18, "setTexture:atIndex:", v17, 0);
      objc_msgSend(v18, "setTexture:atIndex:", v16, 1);
      v19 = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[1], "threadExecutionWidth");
      v20 = v8;
      v21 = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[1], "maxTotalThreadsPerThreadgroup")/ v19;
      v22 = (int)(v19 + objc_msgSend(v16, "width") - 1) / v19;
      v23 = objc_msgSend(v16, "height");

      v30[0] = v22;
      v30[1] = (v21 + v23 - 1) / v21;
      v30[2] = 1;
      v24 = v21;
      v8 = v20;
      v29[0] = v19;
      v29[1] = v24;
      v29[2] = 1;
      objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v30, v29);
      objc_msgSend(v18, "endEncoding");

      v25 = v13 + 2;
      ++v13;
    }
    while (v25 < self->_nscales);
  }

  return 0;
}

- (int)_enqueueFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[2]);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  LODWORD(a3) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[2], "threadExecutionWidth");
  LODWORD(v8) = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[2], "maxTotalThreadsPerThreadgroup")/ (int)a3;
  v11 = (int)((_DWORD)a3 + objc_msgSend(v9, "width") - 1) / (int)a3;
  LODWORD(self) = objc_msgSend(v9, "height");

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_enqueueFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_computePipelines[3]);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);

  LODWORD(a3) = -[MTLComputePipelineState threadExecutionWidth](self->_computePipelines[3], "threadExecutionWidth");
  LODWORD(v8) = (int)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelines[3], "maxTotalThreadsPerThreadgroup")/ (int)a3;
  v11 = (int)((_DWORD)a3 + objc_msgSend(v9, "width") - 1) / (int)a3;
  LODWORD(self) = objc_msgSend(v9, "height");

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);
  objc_msgSend(v10, "endEncoding");

  return 0;
}

- (int)_enqueueMatchingWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_kpts_buf:(id)a7 in_kptd_buf:(id)a8 out_kptd_buf:(id)a9 out_status_buf:(id)a10 num_keypoints:(unsigned __int16)a11 scale_kpts:(float)a12 scale_kptd:(float)a13
{
  MTLComputePipelineState *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  int64x2_t v33;
  unint64_t v34;
  int64x2_t v35;
  uint64_t v36;
  float v37;
  float v38;

  v36 = a11;
  v37 = a12;
  v38 = a13;
  v20 = self->_computePipelines[4];
  v31 = a10;
  v30 = a9;
  v29 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v20, "maxTotalThreadsPerThreadgroup");
  objc_msgSend(v25, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setComputePipelineState:", self->_computePipelines[4]);
  objc_msgSend(v27, "setTexture:atIndex:", v24, 0);

  objc_msgSend(v27, "setTexture:atIndex:", v23, 1);
  objc_msgSend(v27, "setTexture:atIndex:", v22, 2);

  objc_msgSend(v27, "setBuffer:offset:atIndex:", v21, 0, 0);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v29, 0, 1);

  objc_msgSend(v27, "setBuffer:offset:atIndex:", v30, 0, 2);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v31, 0, 3);

  objc_msgSend(v27, "setBytes:length:atIndex:", &v36, 16, 4);
  v34 = (v26 + a11 - 1) / v26;
  v35 = vdupq_n_s64(1uLL);
  v32 = v26;
  v33 = v35;
  objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, &v32);
  objc_msgSend(v27, "endEncoding");

  return 0;
}

- (int)_enqueueMatchingBidirectionalWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_f1_dxdy_tex:(id)a7 in_kpts_buf:(id)a8 in_kptd_buf:(id)a9 out_kptd_buf:(id)a10 out_status_buf:(id)a11 bidirectional_error:(float)a12 num_keypoints:(unsigned __int16)a13 scale_kpts:(float)a14 scale_kptd:(float)a15
{
  MTLComputePipelineState *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  int64x2_t v36;
  unint64_t v37;
  int64x2_t v38;
  _DWORD v39[4];

  v39[0] = a13;
  *(float *)&v39[1] = a12;
  *(float *)&v39[2] = a14;
  *(float *)&v39[3] = a15;
  v21 = self->_computePipelines[5];
  v34 = a11;
  v33 = a10;
  v32 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v21, "maxTotalThreadsPerThreadgroup");
  objc_msgSend(v27, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setComputePipelineState:", self->_computePipelines[5]);
  objc_msgSend(v29, "setTexture:atIndex:", v26, 0);

  objc_msgSend(v29, "setTexture:atIndex:", v25, 1);
  objc_msgSend(v29, "setTexture:atIndex:", v24, 2);

  objc_msgSend(v29, "setTexture:atIndex:", v23, 3);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", v22, 0, 0);

  objc_msgSend(v29, "setBuffer:offset:atIndex:", v32, 0, 1);
  objc_msgSend(v29, "setBuffer:offset:atIndex:", v33, 0, 2);

  objc_msgSend(v29, "setBuffer:offset:atIndex:", v34, 0, 3);
  objc_msgSend(v29, "setBytes:length:atIndex:", v39, 16, 4);
  v37 = (v28 + a13 - 1) / v28;
  v38 = vdupq_n_s64(1uLL);
  v35 = v28;
  v36 = v38;
  objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", &v37, &v35);
  objc_msgSend(v29, "endEncoding");

  return 0;
}

- (CGSize)ref_size
{
  double width;
  double height;
  CGSize result;

  width = self->_ref_size.width;
  height = self->_ref_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)tgt_size
{
  double width;
  double height;
  CGSize result;

  width = self->_tgt_size.width;
  height = self->_tgt_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;

  objc_storeStrong((id *)&self->_status_buf, 0);
  objc_storeStrong((id *)&self->_kptd_buf, 0);
  for (i = 0; i != -10; --i)
    objc_storeStrong((id *)&self->_F1_dxdy_tex[i + 9], 0);
  for (j = 0; j != -10; --j)
    objc_storeStrong((id *)&self->_F0_dxdy_tex[j + 9], 0);
  for (k = 0; k != -10; --k)
    objc_storeStrong((id *)&self->_F1_tex[k + 9], 0);
  for (m = 0; m != -10; --m)
    objc_storeStrong((id *)&self->_F0_tex[m + 9], 0);
  for (n = 0; n != -20; --n)
    objc_storeStrong((id *)&self->_I_tex[1][n + 9], 0);
  for (ii = 64; ii != 16; ii -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + ii), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end
