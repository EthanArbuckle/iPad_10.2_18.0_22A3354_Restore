@implementation PXGMetalTextureCacheEntry

- (PXGMetalTextureCacheEntry)initWithTexture:(id)a3
{
  id v5;
  PXGMetalTextureCacheEntry *v6;
  PXGMetalTextureCacheEntry *v7;
  uint64_t v8;
  NSDate *time;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGMetalTextureCacheEntry;
  v6 = -[PXGMetalTextureCacheEntry init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    time = v7->_time;
    v7->_time = (NSDate *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  MTLTexture *texture;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  texture = self->_texture;
  v5 = -[MTLTexture width](texture, "width");
  v6 = -[MTLTexture height](self->_texture, "height");
  v7 = -[MTLTexture pixelFormat](self->_texture, "pixelFormat");
  v8 = (double)(unint64_t)-[MTLTexture allocatedSize](self->_texture, "allocatedSize")
     * 0.0009765625
     * 0.0009765625;
  -[NSDate timeIntervalSinceNow](self->_time, "timeIntervalSinceNow");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<texture:%p dim:%lux%lu fmt:%lu size:%0.1fMB age:%0.3fs>"), texture, v5, v6, v7, *(_QWORD *)&v8, v9);
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (NSDate)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
