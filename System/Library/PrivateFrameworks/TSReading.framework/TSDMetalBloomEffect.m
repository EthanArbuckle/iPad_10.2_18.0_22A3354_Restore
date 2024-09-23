@implementation TSDMetalBloomEffect

- (TSDMetalBloomEffect)initWithEffectSize:(CGSize)a3 blurScale:(double)a4 metalContext:(id)a5
{
  id v6;
  TSDMetalBloomEffect *v7;
  TSDMetalBloomEffect *v8;
  float64_t v9;
  uint64_t v10;
  float64x2_t v11;
  void *v12;
  void *v13;
  void *v14;
  float32x2_t v15;
  __int128 v22;
  __int128 v24;
  objc_super v25;

  v24 = *(_OWORD *)&a4;
  v22 = *(__int128 *)&a3.height;
  v6 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TSDMetalBloomEffect;
  v7 = -[TSDMetalBloomEffect init](&v25, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = *(double *)&v22;
    v7->_effectSize.width = a3.width;
    *(_QWORD *)&v7->_effectSize.height = v22;
    v10 = v24;
    v11.f64[0] = a3.width;
    if (*(double *)&v24 < 1.0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", *(double *)&v24, a3.width);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalBloomEffect initWithEffectSize:blurScale:metalContext:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalBloomEffect.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 47, CFSTR("blurScale must be >= 1.0!"));

      v9 = *(double *)&v22;
      v11.f64[0] = a3.width;
      v10 = v24;
    }
    v11.f64[1] = v9;
    v15 = vrndp_f32(vcvt_f32_f64(vdivq_f64(v11, (float64x2_t)vdupq_lane_s64(v10, 0))));
    __asm { FMOV            V1.2S, #16.0 }
    v8->_blurBufferSize = (CGSize)vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcge_f32(_D1, v15), (int8x8_t)_D1, (int8x8_t)v15));
    -[TSDMetalBloomEffect p_setupShadersWithMetalContext:](v8, "p_setupShadersWithMetalContext:", v6, v22, a3, v24);
    -[TSDMetalBloomEffect p_setupBuffersWithMetalContext:](v8, "p_setupBuffersWithMetalContext:", v6);
  }

  return v8;
}

- (void)teardown
{
  TSDMTLDataBuffer *dataBuffer;
  TSDMTLDataBuffer *blurDataBuffer;
  TSDMetalShader *blurShader;
  TSDMetalShader *bloomShader;
  TSDMetalShader *fboTransferShader;
  TSDMetalRenderTarget *downSampleRenderTarget;
  TSDMetalRenderTarget *horizontalBlurRenderTarget;
  TSDMetalRenderTarget *verticalBlurRenderTarget;

  dataBuffer = self->_dataBuffer;
  self->_dataBuffer = 0;

  blurDataBuffer = self->_blurDataBuffer;
  self->_blurDataBuffer = 0;

  blurShader = self->_blurShader;
  self->_blurShader = 0;

  bloomShader = self->_bloomShader;
  self->_bloomShader = 0;

  fboTransferShader = self->_fboTransferShader;
  self->_fboTransferShader = 0;

  downSampleRenderTarget = self->_downSampleRenderTarget;
  self->_downSampleRenderTarget = 0;

  horizontalBlurRenderTarget = self->_horizontalBlurRenderTarget;
  self->_horizontalBlurRenderTarget = 0;

  verticalBlurRenderTarget = self->_verticalBlurRenderTarget;
  self->_verticalBlurRenderTarget = 0;

}

- (void)p_setupShadersWithMetalContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  TSDMetalShader *v7;
  void *v8;
  TSDMetalShader *v9;
  TSDMetalShader *fboTransferShader;
  TSDMetalShader *v11;
  void *v12;
  TSDMetalShader *v13;
  TSDMetalShader *blurShader;
  TSDMetalShader *v15;
  void *v16;
  TSDMetalShader *v17;
  TSDMetalShader *bloomShader;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;

  v4 = (objc_class *)MEMORY[0x24BDDD6A8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
  v7 = [TSDMetalShader alloc];
  objc_msgSend(v5, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TSDMetalShader initDefaultTextureShaderWithDevice:colorAttachment:](v7, "initDefaultTextureShaderWithDevice:colorAttachment:", v8, v6);
  fboTransferShader = self->_fboTransferShader;
  self->_fboTransferShader = v9;

  v11 = [TSDMetalShader alloc];
  objc_msgSend(v5, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TSDMetalShader initDefaultGaussianBlurShaderWithDevice:colorAttachment:halfSizedRadius:](v11, "initDefaultGaussianBlurShaderWithDevice:colorAttachment:halfSizedRadius:", v12, v6, 0);
  blurShader = self->_blurShader;
  self->_blurShader = v13;

  objc_msgSend(v6, "setBlendingEnabled:", 1);
  objc_msgSend(v6, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v6, "setDestinationAlphaBlendFactor:", 5);
  v15 = [TSDMetalShader alloc];
  objc_msgSend(v5, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TSDMetalShader initDefaultBloomShaderWithDevice:colorAttachment:](v15, "initDefaultBloomShaderWithDevice:colorAttachment:", v16, v6);
  bloomShader = self->_bloomShader;
  self->_bloomShader = v17;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v27, 0.0, self->_blurBufferSize.width, 0.0, self->_blurBufferSize.height, -1.0, 1.0);
  v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v30);
  v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v32);
  v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
  *(float32x4_t *)self->_anon_70 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27), v28);
  *(float32x4_t *)&self->_anon_70[16] = v19;
  *(float32x4_t *)&self->_anon_70[32] = v20;
  *(float32x4_t *)&self->_anon_70[48] = v21;
  __asm { FMOV            V1.2D, #1.0 }
  self[1].super.isa = (Class)vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_blurBufferSize));

}

- (void)p_setupBuffersWithMetalContext:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  TSDMTLDataBuffer *v14;
  TSDMTLDataBuffer *dataBuffer;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  TSDMTLDataBuffer *v24;
  TSDMTLDataBuffer *blurDataBuffer;
  TSDMetalRenderTarget *v26;
  TSDMetalRenderTarget *downSampleRenderTarget;
  TSDMetalRenderTarget *v28;
  TSDMetalRenderTarget *horizontalBlurRenderTarget;
  TSDMetalRenderTarget *v30;
  TSDMetalRenderTarget *verticalBlurRenderTarget;

  v5 = TSDRectWithSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = a3;
  objc_msgSend(v12, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13, v5, v7, v9, v11, 0.0, 0.0, 1.0, 1.0);
  dataBuffer = self->_dataBuffer;
  self->_dataBuffer = v14;

  v16 = TSDRectWithSize();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v12, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v23, v16, v18, v20, v22, 0.0, 0.0, 1.0, 1.0);
  blurDataBuffer = self->_blurDataBuffer;
  self->_blurDataBuffer = v24;

  v26 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  downSampleRenderTarget = self->_downSampleRenderTarget;
  self->_downSampleRenderTarget = v26;

  v28 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  horizontalBlurRenderTarget = self->_horizontalBlurRenderTarget;
  self->_horizontalBlurRenderTarget = v28;

  v30 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  verticalBlurRenderTarget = self->_verticalBlurRenderTarget;
  self->_verticalBlurRenderTarget = v30;

}

- (id)p_blurTextureWithTexture:(id)a3 metalContext:(id)a4 MVPMatrix:(CATransform3D *)a5
{
  id v8;
  void *v9;
  void *v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float32x4_t v24;

  v8 = a3;
  objc_msgSend(a4, "commandQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commandBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m21), *(float64x2_t *)&a5->m23);
  v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m31), *(float64x2_t *)&a5->m33);
  v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m41), *(float64x2_t *)&a5->m43);
  v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m11), *(float64x2_t *)&a5->m13);
  -[TSDMetalRenderTarget passDescriptor](self->_downSampleRenderTarget, "passDescriptor", *(_OWORD *)&v24, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_fboTransferShader, "setPipelineStateWithEncoder:vertexBytes:", v15, &v24);
  objc_msgSend(v15, "setFragmentTexture:atIndex:", v8, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_dataBuffer, "drawWithEncoder:atIndex:", v15, -[TSDMetalShader bufferIndex](self->_fboTransferShader, "bufferIndex"));
  objc_msgSend(v15, "endEncoding");
  -[TSDMetalRenderTarget passDescriptor](self->_horizontalBlurRenderTarget, "passDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self[1]._effectSize.width) = 1;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_blurShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v17, self->_anon_70, &self[1]);
  -[TSDMetalRenderTarget texture](self->_downSampleRenderTarget, "texture");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFragmentTexture:atIndex:", v18, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_blurDataBuffer, "drawWithEncoder:atIndex:", v17, -[TSDMetalShader bufferIndex](self->_blurShader, "bufferIndex"));
  objc_msgSend(v17, "endEncoding");
  -[TSDMetalRenderTarget passDescriptor](self->_verticalBlurRenderTarget, "passDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderCommandEncoderWithDescriptor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self[1]._effectSize.width) = 0;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_blurShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v20, self->_anon_70, &self[1]);
  -[TSDMetalRenderTarget texture](self->_horizontalBlurRenderTarget, "texture");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFragmentTexture:atIndex:", v21, 0);

  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_blurDataBuffer, "drawWithEncoder:atIndex:", v20, -[TSDMetalShader bufferIndex](self->_blurShader, "bufferIndex"));
  objc_msgSend(v20, "endEncoding");
  objc_msgSend(v10, "commit");
  -[TSDMetalRenderTarget texture](self->_verticalBlurRenderTarget, "texture");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)drawBloomEffectWithTexture:(id)a3 metalContext:(id)a4 encoder:(id)a5 MVPMatrix:(CATransform3D *)a6 bloomAmount:(double)a7
{
  __int128 v12;
  __int128 v13;
  float32x4_t v14;
  float32x4_t v15;
  id v16;
  id v17;
  void *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float v22;
  float v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v12 = *(_OWORD *)&a6->m33;
  v28 = *(_OWORD *)&a6->m31;
  v29 = v12;
  v13 = *(_OWORD *)&a6->m43;
  v30 = *(_OWORD *)&a6->m41;
  v31 = v13;
  v14 = *(float32x4_t *)&a6->m13;
  v24 = *(float32x4_t *)&a6->m11;
  v25 = v14;
  v15 = *(float32x4_t *)&a6->m23;
  v26 = *(float32x4_t *)&a6->m21;
  v27 = v15;
  v16 = a5;
  v17 = a3;
  -[TSDMetalBloomEffect p_blurTextureWithTexture:metalContext:MVPMatrix:](self, "p_blurTextureWithTexture:metalContext:MVPMatrix:", v17, a4, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m21), *(float64x2_t *)&a6->m23);
  v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m31), *(float64x2_t *)&a6->m33);
  v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m41), *(float64x2_t *)&a6->m43);
  v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m11), *(float64x2_t *)&a6->m13);
  v25 = v19;
  v26 = v20;
  v27 = v21;
  v22 = a7;
  v23 = v22;
  -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_bloomShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v16, &v24, &v23);
  objc_msgSend(v16, "setFragmentTexture:atIndex:", v17, 0);

  objc_msgSend(v16, "setFragmentTexture:atIndex:", v18, 1);
  -[TSDMTLDataBuffer drawWithEncoder:atIndex:](self->_dataBuffer, "drawWithEncoder:atIndex:", v16, -[TSDMetalShader bufferIndex](self->_bloomShader, "bufferIndex"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fboTransferShader, 0);
  objc_storeStrong((id *)&self->_bloomShader, 0);
  objc_storeStrong((id *)&self->_blurShader, 0);
  objc_storeStrong((id *)&self->_verticalBlurRenderTarget, 0);
  objc_storeStrong((id *)&self->_horizontalBlurRenderTarget, 0);
  objc_storeStrong((id *)&self->_downSampleRenderTarget, 0);
  objc_storeStrong((id *)&self->_blurDataBuffer, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
}

@end
