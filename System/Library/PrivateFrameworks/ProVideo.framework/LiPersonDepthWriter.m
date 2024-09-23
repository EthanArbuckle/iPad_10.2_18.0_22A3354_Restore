@implementation LiPersonDepthWriter

- (LiPersonDepthWriter)initWithDevice:(id)a3 sampleCount:(int64_t)a4
{
  LiPersonDepthWriter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LiPersonDepthWriter;
  v6 = -[LiPersonDepthWriter init](&v8, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_sampleCount = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LiPersonDepthWriter;
  -[LiPersonDepthWriter dealloc](&v3, sel_dealloc);
}

- (void)writeWithDepthMap:(id)a3 matte:(id)a4 depthTexture:(id)a5 colorTexture:(id)a6 uniforms:(PersonDepthUniforms)a7 windowSize:(CGSize)a8 commandBuffer:(id)a9
{
  double height;
  double width;
  uint64_t v11;
  uint64_t v12;
  void *v16;

  height = a8.height;
  width = a8.width;
  v11 = *(_QWORD *)&a7.var2;
  v12 = *(_QWORD *)&a7.var0;
  v16 = (void *)objc_msgSend(a9, "renderCommandEncoderWithDescriptor:", -[LiPersonDepthWriter renderPassDescriptorWithColorTexture:depthTexture:](self, "renderPassDescriptorWithColorTexture:depthTexture:", a6, a5));
  -[LiPersonDepthWriter drawWithDepthMap:matte:uniforms:windowSize:renderCommandEncoder:](self, "drawWithDepthMap:matte:uniforms:windowSize:renderCommandEncoder:", a3, a4, v12, v11, v16, width, height);
  objc_msgSend(v16, "endEncoding");
}

- (void)drawWithDepthMap:(id)a3 matte:(id)a4 uniforms:(PersonDepthUniforms)a5 windowSize:(CGSize)a6 renderCommandEncoder:(id)a7
{
  uint64_t v11;

  -[LiPersonDepthWriter computeMatteTexCoordsWithMatteSize:projectSize:videoOrientation:](self, "computeMatteTexCoordsWithMatteSize:projectSize:videoOrientation:", a5.var3, (double)(unint64_t)objc_msgSend(a4, "width", *(_QWORD *)&a5.var0, *(_QWORD *)&a5.var2), (double)(unint64_t)objc_msgSend(a4, "height"), a6.width, a6.height);
  objc_msgSend(a7, "setRenderPipelineState:", objc_msgSend((id)objc_opt_class(), "sharedRenderPipelineStateWithDevice:sampleCount:", self->_device, self->_sampleCount));
  objc_msgSend(a7, "setDepthStencilState:", objc_msgSend((id)objc_opt_class(), "sharedDepthStencilStateWithDevice:", self->_device));
  objc_msgSend(a7, "setVertexBytes:length:atIndex:", &vertices, 48, 0);
  objc_msgSend(a7, "setVertexBytes:length:atIndex:", self->_matteTexCoords, 48, 1);
  objc_msgSend(a7, "setFragmentTexture:atIndex:", a3, 0);
  objc_msgSend(a7, "setFragmentTexture:atIndex:", a4, 1);
  objc_msgSend(a7, "setFragmentBytes:length:atIndex:", &v11, 16, 0);
  objc_msgSend(a7, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 6);
}

- (void)computeMatteTexCoordsWithMatteSize:(CGSize)a3 projectSize:(CGSize)a4 videoOrientation:(int)a5
{
  unsigned int v5;
  double height;
  double width;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;

  v5 = a5 & 0xFFFFFFFE;
  if ((a5 & 0xFFFFFFFE) == 2)
    height = a3.height;
  else
    height = a3.width;
  if (v5 == 2)
    width = a3.width;
  else
    width = a3.height;
  if (a4.width / a4.height >= width / height)
    v8 = width / a4.width;
  else
    v8 = height / a4.height;
  v9 = a4.width * v8;
  v10 = a4.height * v8;
  v11 = (width - v9) * 0.5;
  v12 = (height - v10) * 0.5;
  v13 = v10 + v12;
  v14 = v9 + v11;
  if (v5 == 2)
    v15 = v13;
  else
    v15 = v14;
  if (v5 == 2)
    v16 = v11;
  else
    v16 = v12;
  if (v5 != 2)
  {
    v12 = v11;
    v14 = v13;
  }
  v17 = v14 / a3.width;
  v18 = v12 / a3.height;
  v19 = v16 / a3.width;
  v20 = v15 / a3.height;
  v21 = a5 & 0xFFFFFFFD;
  if ((a5 & 0xFFFFFFFD) == 1)
    v22 = v20;
  else
    v22 = v18;
  if (v21 == 1)
    v23 = v17;
  else
    v23 = v19;
  if (v21 == 1)
    v20 = v18;
  *(float *)&v24 = v23;
  v25 = v22;
  if (v21 != 1)
    v19 = v17;
  *(float *)&v30 = v19;
  v26 = COERCE_DOUBLE(__PAIR64__(LODWORD(v25), v30));
  v27 = v20;
  v28 = COERCE_DOUBLE(__PAIR64__(LODWORD(v27), v30));
  *(float *)&v29 = v23;
  *((float *)&v29 + 1) = v27;
  *((float *)&v24 + 1) = v25;
  *((float *)&v30 + 1) = v27;
  if (v5 == 2)
    v31 = COERCE_DOUBLE(__PAIR64__(LODWORD(v25), LODWORD(v24)));
  else
    v31 = COERCE_DOUBLE(__PAIR64__(LODWORD(v27), LODWORD(v24)));
  if (v5 == 2)
  {
    v32 = v28;
  }
  else
  {
    v26 = v24;
    v32 = COERCE_DOUBLE(__PAIR64__(LODWORD(v25), v30));
  }
  *(double *)self->_matteTexCoords = v31;
  *(double *)&self->_matteTexCoords[8] = v26;
  *(double *)&self->_matteTexCoords[16] = v32;
  *(double *)&self->_matteTexCoords[24] = v31;
  if (v5 == 2)
    v30 = v29;
  *(double *)&self->_matteTexCoords[32] = v32;
  *(_QWORD *)&self->_matteTexCoords[40] = v30;
}

+ (id)sharedRenderPipelineStateWithDevice:(id)a3 sampleCount:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__LiPersonDepthWriter_sharedRenderPipelineStateWithDevice_sampleCount___block_invoke;
  v5[3] = &unk_1E657D6A8;
  v5[4] = a3;
  v5[5] = a4;
  if (+[LiPersonDepthWriter sharedRenderPipelineStateWithDevice:sampleCount:]::onceToken != -1)
    dispatch_once(&+[LiPersonDepthWriter sharedRenderPipelineStateWithDevice:sampleCount:]::onceToken, v5);
  return (id)+[LiPersonDepthWriter sharedRenderPipelineStateWithDevice:sampleCount:]::pipelineState;
}

void __71__LiPersonDepthWriter_sharedRenderPipelineStateWithDevice_sampleCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "newLibraryWithSource:options:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "\n    #include <metal_stdlib>\n    using namespace metal;\n"
                   "\n"
                   "    struct DepthVertexIn\n"
                   "    {\n"
                   "        float2 position [[attribute(0)]];\n"
                   "        float2 texCoord [[attribute(1)]];\n"
                   "    };\n"
                   "\n"
                   "    struct DepthVertexOut\n"
                   "    {\n"
                   "        float4 position [[position]];\n"
                   "        float2 texCoord;\n"
                   "    };\n"
                   "\n"
                   "    struct FragmentOut {\n"
                   "        float4 color [[color(0)]];\n"
                   "        float depth [[depth(any)]];\n"
                   "    };\n"
                   "\n"
                   "    struct PersonDepthUniforms\n"
                   "    {\n"
                   "        float arScale;\n"
                   "        float near;\n"
                   "        float far;\n"
                   "        int videoOrientation;\n"
                   "    };\n"
                   "\n"
                   "    float reverseZDepth(const float zEye, const float near, const float far)\n"
                   "    {\n"
                   "        const float zNDC = (far + near) / (far - near) - 2.0 * near * far / (zEye * (far - near));\n"
                   "        const float reverseZ = 0.5 - 0.5 * zNDC;\n"
                   "        return reverseZ;\n"
                   "    }\n"
                   "\n"
                   "    // reversed-z is in the range [0,1], where 0 is at the far plane and 1 is at near plane\n"
                   "    static float linearDepth(const float reversedZ, const float near, const float far)\n"
                   "    {\n"
                   "        const float zNDC = -2.0 * reversedZ + 1.0;
                   "        const float zEye = 2.0 * near * far / (far + near - zNDC * (far - near));\n"
                   "        return zEye;\n"
                   "    }\n"
                   "\n"
                   "    vertex DepthVertexOut depthVertexShader(DepthVertexIn in [[stage_in]])\n"
                   "    {\n"
                   "        DepthVertexOut out;\n"
                   "        out.position = float4(in.position.xy, 0.0, 1.0);\n"
                   "        out.texCoord = in.texCoord;\n"
                   "        return out;\n"
                   "    }\n"
                   "\n"
                   "    fragment FragmentOut depthFragmentShader(DepthVertexOut in [[stage_in]],\n"
                   "                                             constant PersonDepthUniforms &uniforms [[buffer(0)]],\n"
                   "                                             texture2d<float> depthMap [[texture(0)]],\n"
                   "                                             texture2d<float> matte [[texture(1)]])\n"
                   "    {\n"
                   "        // We return the color we just set which will be written to our color attachment.\n"
                   "        constexpr sampler textureSampler(mip_filter::linear,\n"
                   "                                         mag_filter::linear,\n"
                   "                                         min_filter::linear);\n"
                   "\n"
                   "        const float2 matteTexCoord = in.texCoord;\n"
                   "\n"
                   "        const float4 depthSample = depthMap.sample(textureSampler, matteTexCoord);\n"
                   "        const float4 matteSample = matte.sample(textureSampler, matteTexCoord);\n"
                   "        const float depthInMeters = depthSample.r;\n"
                   "        const float depthInMotion = depthInMeters * uniforms.arScale;\n"
                   "        const float depthReverseZ = reverseZDepth(depthInMotion, uniforms.near, uniforms.far);
                   "ion space\n"
                   "\n"
                   "        FragmentOut out;\n"
                   "        \n"
                   "        if ((depthInMeters > 0) && (matteSample.r > 0))\n"
                   "        {\n"
                   "            out.depth = depthReverseZ;\n"
                   "        }\n"
                   "        else\n"
                   "        {\n"
                   "            out.depth = 0.0;\n"
                   "        }\n"
                   "        out.color = float4(0);\n"
                   "\n"
                   "        return out;\n"
                   "    }\n"),
                 0,
                 &v11);
  v3 = v11;
  if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v3, "localizedDescription");
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to create Metal library. Error info: %@", buf, 0xCu);
  }
  v5 = (void *)objc_msgSend(v2, "newFunctionWithName:", CFSTR("depthVertexShader"));
  v6 = (void *)objc_msgSend(v2, "newFunctionWithName:", CFSTR("depthFragmentShader"));
  v7 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
  objc_msgSend(v7, "setLabel:", CFSTR("RenderPipeline"));
  objc_msgSend(v7, "setVertexFunction:", v5);
  objc_msgSend(v7, "setFragmentFunction:", v6);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setPixelFormat:", 115);
  objc_msgSend(v7, "setRasterSampleCount:", *(_QWORD *)(a1 + 40));
  v8 = objc_alloc_init(MEMORY[0x1E0CC6BD8]);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 0), "setFormat:", 29);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 0), "setOffset:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 0), "setBufferIndex:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 1), "setFormat:", 29);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 1), "setOffset:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "attributes"), "objectAtIndexedSubscript:", 1), "setBufferIndex:", 1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 0), "setStride:", 8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 0), "setStepRate:", 1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 0), "setStepFunction:", 1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 1), "setStride:", 8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 1), "setStepRate:", 1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "layouts"), "objectAtIndexedSubscript:", 1), "setStepFunction:", 1);
  objc_msgSend(v7, "setVertexDescriptor:", v8);
  objc_msgSend(v7, "setDepthAttachmentPixelFormat:", 252);
  +[LiPersonDepthWriter sharedRenderPipelineStateWithDevice:sampleCount:]::pipelineState = objc_msgSend(*(id *)(a1 + 32), "newRenderPipelineStateWithDescriptor:error:", v7, &v11);
  v9 = v11;
  if (v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v9, "localizedDescription");
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1B2737000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to create render pipeline state. Error info: %@", buf, 0xCu);
  }

}

+ (id)sharedDepthStencilStateWithDevice:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__LiPersonDepthWriter_sharedDepthStencilStateWithDevice___block_invoke;
  block[3] = &unk_1E64DFA00;
  block[4] = a3;
  if (+[LiPersonDepthWriter sharedDepthStencilStateWithDevice:]::onceToken != -1)
    dispatch_once(&+[LiPersonDepthWriter sharedDepthStencilStateWithDevice:]::onceToken, block);
  return (id)+[LiPersonDepthWriter sharedDepthStencilStateWithDevice:]::depthState;
}

uint64_t __57__LiPersonDepthWriter_sharedDepthStencilStateWithDevice___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
  objc_msgSend(v2, "setDepthCompareFunction:", 3);
  objc_msgSend(v2, "setDepthWriteEnabled:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "newDepthStencilStateWithDescriptor:", v2);
  +[LiPersonDepthWriter sharedDepthStencilStateWithDevice:]::depthState = result;
  return result;
}

- (id)renderPassDescriptorWithColorTexture:(id)a3 depthTexture:(id)a4
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", a3);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 1);
  objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "setTexture:", a4);
  objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "setLoadAction:", 2);
  objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "setClearDepth:", 1.0);
  objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "setStoreAction:", 1);
  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_sampleCount = a3;
}

@end
