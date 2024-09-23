@implementation ResourceUsageAndRenderStage

- (ResourceUsageAndRenderStage)initWithUsage:(unint64_t)a3 renderStages:(unint64_t)a4 entryUsage:(OptionSet<WebGPU:(unsigned int)a6 :()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a7 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer> BindGroupEntryUsage>)a5 binding:resource:
{
  Buffer *m_ptr;
  ResourceUsageAndRenderStage *v12;
  ResourceUsageAndRenderStage *v13;
  uint64_t index;
  uint64_t v15;
  ResourceUsageAndRenderStage *v16;
  objc_super v18;
  variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *p_resource;

  m_ptr = a7.__impl_.__data.__head.__value.m_ptr;
  v18.receiver = self;
  v18.super_class = (Class)ResourceUsageAndRenderStage;
  v12 = -[ResourceUsageAndRenderStage init](&v18, sel_init, a3, a4, *(_QWORD *)&a5.m_storage, *(_QWORD *)&a6, a7.__impl_.__data.__head.__value.m_ptr, *(_QWORD *)&a7.__impl_.__index);
  v13 = v12;
  if (v12)
  {
    v12->_usage = a3;
    v12->_renderStages = a4;
    v12->_entryUsage = a5;
    v12->_binding = a6;
    index = v12->_resource.__impl_.__index;
    v15 = *((unsigned int *)m_ptr + 2);
    if ((_DWORD)index == -1)
    {
      if ((_DWORD)v15 == -1)
        goto LABEL_7;
    }
    else if ((_DWORD)v15 == -1)
    {
      ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1E0FD1EA0[index])(&p_resource, &v12->_resource);
      v13->_resource.__impl_.__index = -1;
LABEL_7:
      v16 = v13;
      goto LABEL_8;
    }
    p_resource = &v12->_resource;
    ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **))off_1E0FD1EB8[v15])(&p_resource);
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (unint64_t)renderStages
{
  return self->_renderStages;
}

- (void)setRenderStages:(unint64_t)a3
{
  self->_renderStages = a3;
}

- (OptionSet<WebGPU::BindGroupEntryUsage>)entryUsage
{
  return self->_entryUsage;
}

- (void)setEntryUsage:(OptionSet<WebGPU::BindGroupEntryUsage>)a3
{
  self->_entryUsage = a3;
}

- (unsigned)binding
{
  return self->_binding;
}

- (void)setBinding:(unsigned int)a3
{
  self->_binding = a3;
}

- (variant<WTF::RefPtr<WebGPU::Buffer>,)resource
{
  uint64_t v2;
  uint64_t v3;
  uint64_t index;
  _BYTE v5[2];
  variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> result;

  v3 = v2;
  *(_BYTE *)v2 = 0;
  *(_DWORD *)(v2 + 8) = -1;
  index = self->_resource.__impl_.__index;
  if ((_DWORD)index != -1)
  {
    self = (ResourceUsageAndRenderStage *)((uint64_t (*)(_BYTE *, uint64_t, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1E0FD1ED0[index])(v5, v2, &self->_resource);
    *(_DWORD *)(v3 + 8) = index;
  }
  *(_QWORD *)&result.__impl_.__index = a2;
  result.__impl_.__data.__head.__value.m_ptr = (Buffer *)self;
  return result;
}

- (void)setResource:()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a3 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer>
{
  uint64_t index;
  uint64_t v4;
  variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *p_resource;
  char v7;

  index = self->_resource.__impl_.__index;
  v4 = *((unsigned int *)a3.__impl_.__data.__head.__value.m_ptr + 2);
  if ((_DWORD)index != -1)
  {
    if ((_DWORD)v4 == -1)
    {
      ((void (*)(char *, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1E0FD1EA0[index])(&v7, &self->_resource);
      self->_resource.__impl_.__index = -1;
      return;
    }
LABEL_6:
    p_resource = &self->_resource;
    ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **))off_1E0FD1EB8[v4])(&p_resource);
    return;
  }
  if ((_DWORD)v4 != -1)
    goto LABEL_6;
}

- (void).cxx_destruct
{
  uint64_t index;
  char v4;

  index = self->_resource.__impl_.__index;
  if ((_DWORD)index != -1)
    ((void (*)(char *, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1E0FD1EA0[index])(&v4, &self->_resource);
  self->_resource.__impl_.__index = -1;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end
