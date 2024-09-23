@implementation PXGMetalRenderSnapshot

- (PXGMetalRenderSnapshot)initWithTexture:(id)a3
{
  id v5;
  PXGMetalRenderSnapshot *v6;
  PXGMetalRenderSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGMetalRenderSnapshot;
  v6 = -[PXGMetalRenderSnapshot init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_texture, a3);

  return v7;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
