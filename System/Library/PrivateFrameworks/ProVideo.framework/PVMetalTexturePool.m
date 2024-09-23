@implementation PVMetalTexturePool

- (PVMetalTexturePool)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PVMetalTexturePool;
  return -[PVMetalTexturePool init](&v3, sel_init);
}

- (id)getTexture:(id)a3
{
  id v4;
  HGMetalTexturePool *v5;
  __int128 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = -[PVMetalTexturePool texturePool](self, "texturePool");
  if (v5)
  {
    *((_QWORD *)&v7 + 1) = objc_msgSend(v4, "height", objc_msgSend(v4, "width"));
    v8 = objc_msgSend(v4, "pixelFormat");
    v9 = objc_msgSend(v4, "usage");
    v10 = objc_msgSend(v4, "storageMode");
    v11 = 0x100000002;
    v5 = (HGMetalTexturePool *)objc_retainAutorelease((id)HGMetalTexturePool::newTexture((uint64_t *)v5, &v7, 0));
  }

  return v5;
}

- (void)releaseTexture:(id)a3
{
  id v4;
  HGMetalTexturePool *v5;
  id v6;

  v4 = a3;
  v5 = -[PVMetalTexturePool texturePool](self, "texturePool");
  v6 = v4;
  HGMetalTexturePool::releaseTexture((uint64_t *)v5, (uint64_t)v6);

}

- (HGMetalTexturePool)texturePool
{
  HGMetalTexturePool *result;
  const HGMetalDeviceInfo *v3;

  result = (HGMetalTexturePool *)HGMetalDeviceInfo::getMainDevice((HGMetalDeviceInfo *)self);
  if (result)
    return (HGMetalTexturePool *)*((_QWORD *)HGGPUResources::getDeviceResources((HGGPUResources *)result, v3) + 5);
  return result;
}

@end
