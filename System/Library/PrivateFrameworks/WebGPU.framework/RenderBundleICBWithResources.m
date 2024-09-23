@implementation RenderBundleICBWithResources

- (RenderBundleICBWithResources)initWithICB:(id)a3 containerBuffer:(id)a4 pipelineState:(id)a5 depthStencilState:(id)a6 cullMode:(unint64_t)a7 frontFace:(unint64_t)a8 depthClipMode:(unint64_t)a9 depthBias:(float)a10 depthBiasSlopeScale:(float)a11 depthBiasClamp:(float)a12 fragmentDynamicOffsetsBuffer:(id)a13 pipeline:(const void *)a14 minVertexCounts:(void *)a15
{
  id v24;
  id v25;
  id v26;
  RenderBundleICBWithResources *v27;
  RenderBundleICBWithResources *v28;
  void *v29;
  void *v30;
  _QWORD *m_table;
  uint64_t v32;
  uint64_t i;
  char *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  RenderBundleICBWithResources *v38;
  id v41;
  id v42;
  objc_super v43;

  v24 = a3;
  v25 = a4;
  v26 = a5;
  v42 = a6;
  v41 = a13;
  v43.receiver = self;
  v43.super_class = (Class)RenderBundleICBWithResources;
  v27 = -[RenderBundleICBWithResources init](&v43, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_indirectCommandBuffer, a3);
    objc_storeStrong((id *)&v28->_indirectCommandBufferContainer, a4);
    objc_storeStrong((id *)&v28->_currentPipelineState, a5);
    objc_storeStrong((id *)&v28->_depthStencilState, a6);
    v28->_cullMode = a7;
    v28->_frontFace = a8;
    v28->_depthClipMode = a9;
    v28->_depthBias = a10;
    v28->_depthBiasSlopeScale = a11;
    v28->_depthBiasClamp = a12;
    objc_storeStrong((id *)&v28->_fragmentDynamicOffsetsBuffer, a13);
    v28->_pipeline = a14;
    v30 = *(void **)a15;
    *(_QWORD *)a15 = 0;
    m_table = v28->_minVertexCountForDrawCommand.m_impl.var0.m_table;
    v28->_minVertexCountForDrawCommand.m_impl.var0.m_table = v30;
    if (m_table)
    {
      v32 = *((unsigned int *)m_table - 1);
      if ((_DWORD)v32)
      {
        for (i = 0; i != v32; ++i)
        {
          if (m_table[11 * i] != -2)
          {
            v34 = (char *)&m_table[11 * i];
            v35 = (unsigned int *)*((_QWORD *)v34 + 1);
            *((_QWORD *)v34 + 1) = 0;
            if (v35)
            {
              do
              {
                v36 = __ldaxr(v35);
                v37 = v36 - 1;
              }
              while (__stlxr(v37, v35));
              if (!v37)
              {
                atomic_store(1u, v35);
                WTF::fastFree((WTF *)v35, v29);
              }
            }
          }
        }
      }
      WTF::fastFree((WTF *)(m_table - 2), v29);
    }
    v38 = v28;
  }

  return v28;
}

- (void)resources
{
  return &self->_resources;
}

- (void)minVertexCountForDrawCommand
{
  return &self->_minVertexCountForDrawCommand;
}

- (MTLIndirectCommandBuffer)indirectCommandBuffer
{
  return self->_indirectCommandBuffer;
}

- (MTLBuffer)indirectCommandBufferContainer
{
  return self->_indirectCommandBufferContainer;
}

- (MTLRenderPipelineState)currentPipelineState
{
  return self->_currentPipelineState;
}

- (MTLDepthStencilState)depthStencilState
{
  return self->_depthStencilState;
}

- (unint64_t)cullMode
{
  return self->_cullMode;
}

- (unint64_t)frontFace
{
  return self->_frontFace;
}

- (unint64_t)depthClipMode
{
  return self->_depthClipMode;
}

- (float)depthBias
{
  return self->_depthBias;
}

- (float)depthBiasSlopeScale
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBiasClamp
{
  return self->_depthBiasClamp;
}

- (MTLBuffer)fragmentDynamicOffsetsBuffer
{
  return self->_fragmentDynamicOffsetsBuffer;
}

- (const)pipeline
{
  return self->_pipeline;
}

- (void).cxx_destruct
{
  void *v3;
  _QWORD *m_table;
  uint64_t v5;
  uint64_t i;
  char *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int m_size;
  BindableResources *m_buffer;

  objc_storeStrong((id *)&self->_fragmentDynamicOffsetsBuffer, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_currentPipelineState, 0);
  objc_storeStrong((id *)&self->_indirectCommandBufferContainer, 0);
  objc_storeStrong((id *)&self->_indirectCommandBuffer, 0);
  m_table = self->_minVertexCountForDrawCommand.m_impl.var0.m_table;
  if (m_table)
  {
    v5 = *((unsigned int *)m_table - 1);
    if ((_DWORD)v5)
    {
      for (i = 0; i != v5; ++i)
      {
        if (m_table[11 * i] != -2)
        {
          v7 = (char *)&m_table[11 * i];
          v8 = (unsigned int *)*((_QWORD *)v7 + 1);
          *((_QWORD *)v7 + 1) = 0;
          if (v8)
          {
            do
            {
              v9 = __ldaxr(v8);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, v8));
            if (!v10)
            {
              atomic_store(1u, v8);
              WTF::fastFree((WTF *)v8, v3);
            }
          }
        }
      }
    }
    WTF::fastFree((WTF *)(m_table - 2), v3);
  }
  m_size = self->_resources.m_size;
  if (m_size)
    WTF::VectorDestructor<true,WebGPU::BindableResources>::destruct((WTF *)self->_resources.m_buffer, (WTF *)((char *)self->_resources.m_buffer + 48 * m_size));
  m_buffer = self->_resources.m_buffer;
  if (m_buffer)
  {
    self->_resources.m_buffer = 0;
    self->_resources.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, v3);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
