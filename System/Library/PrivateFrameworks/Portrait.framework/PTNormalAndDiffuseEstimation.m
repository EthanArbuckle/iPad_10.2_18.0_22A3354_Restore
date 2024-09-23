@implementation PTNormalAndDiffuseEstimation

- (PTNormalAndDiffuseEstimation)initWithMetalContext:(id)a3
{
  double v3;
  double v4;

  LODWORD(v3) = 1108344832;
  LODWORD(v4) = 1106866340;
  return -[PTNormalAndDiffuseEstimation initWithMetalContext:sensorWidth:focalLength:](self, "initWithMetalContext:sensorWidth:focalLength:", a3, v3, v4);
}

- (PTNormalAndDiffuseEstimation)initWithMetalContext:(id)a3 sensorWidth:(float)a4 focalLength:(float)a5
{
  id v9;
  PTNormalAndDiffuseEstimation *v10;
  PTNormalAndDiffuseEstimation *v11;
  uint64_t v12;
  MTLComputePipelineState *estimateNormalsFromDisparity;
  uint64_t v14;
  MTLComputePipelineState *estimateDiffuseFromDisparity;
  PTNormalAndDiffuseEstimation *v16;
  NSObject *v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PTNormalAndDiffuseEstimation;
  v10 = -[PTNormalAndDiffuseEstimation init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_10;
  objc_storeStrong((id *)&v10->_metalContext, a3);
  objc_msgSend(v9, "computePipelineStateFor:withConstants:", CFSTR("estimateNormalsFromDisparity"), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  estimateNormalsFromDisparity = v11->_estimateNormalsFromDisparity;
  v11->_estimateNormalsFromDisparity = (MTLComputePipelineState *)v12;

  if (!v11->_estimateNormalsFromDisparity)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTNormalAndDiffuseEstimation initWithMetalContext:sensorWidth:focalLength:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_9;
  }
  objc_msgSend(v9, "computePipelineStateFor:withConstants:", CFSTR("estimateDiffuseFromDisparity"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  estimateDiffuseFromDisparity = v11->_estimateDiffuseFromDisparity;
  v11->_estimateDiffuseFromDisparity = (MTLComputePipelineState *)v14;

  if (!v11->_estimateDiffuseFromDisparity)
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTNormalAndDiffuseEstimation initWithMetalContext:sensorWidth:focalLength:].cold.2(v17, v25, v26, v27, v28, v29, v30, v31);
LABEL_9:

LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v11->_sensorWidth = a4;
  v11->_focalLength = a5;
  v16 = v11;
LABEL_11:

  return v16;
}

- (void)estimateNormalsFromDisparity:(id)a3 outNormal:(id)a4
{
  PTMetalContext *metalContext;
  id v7;
  id v8;
  void *v9;
  void *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  int v17;
  float v18[2];

  metalContext = self->_metalContext;
  v7 = a4;
  v8 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setComputePipelineState:", self->_estimateNormalsFromDisparity);
  v18[0] = (float)(self->_sensorWidth * 0.5) / self->_focalLength;
  v11 = v18[0] * (float)(unint64_t)objc_msgSend(v7, "height");
  v18[1] = v11 / (float)(unint64_t)objc_msgSend(v7, "width");
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v7, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", v18, 8, 0);
  v17 = 1092616192;
  objc_msgSend(v10, "setBytes:length:atIndex:", &v17, 4, 1);
  v12 = objc_msgSend(v7, "width");
  v13 = objc_msgSend(v7, "height");

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  v14 = xmmword_1C9322A40;
  v15 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v10, "endEncoding");

}

- (void)estimateDiffuseFromDisparity:(id)a3 outDiffuse:(id)a4
{
  PTMetalContext *metalContext;
  id v7;
  id v8;
  void *v9;
  void *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  int v17;
  float v18[2];

  metalContext = self->_metalContext;
  v7 = a4;
  v8 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setComputePipelineState:", self->_estimateDiffuseFromDisparity);
  v18[0] = (float)(self->_sensorWidth * 0.5) / self->_focalLength;
  v11 = v18[0] * (float)(unint64_t)objc_msgSend(v7, "height");
  v18[1] = v11 / (float)(unint64_t)objc_msgSend(v7, "width");
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v7, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", v18, 8, 0);
  v17 = 1092616192;
  objc_msgSend(v10, "setBytes:length:atIndex:", &v17, 4, 1);
  v12 = objc_msgSend(v7, "width");
  v13 = objc_msgSend(v7, "height");

  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 1;
  v14 = xmmword_1C9322A40;
  v15 = 1;
  objc_msgSend(v10, "dispatchThreads:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v10, "endEncoding");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimateDiffuseFromDisparity, 0);
  objc_storeStrong((id *)&self->_estimateNormalsFromDisparity, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 sensorWidth:(uint64_t)a4 focalLength:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 sensorWidth:(uint64_t)a4 focalLength:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

@end
