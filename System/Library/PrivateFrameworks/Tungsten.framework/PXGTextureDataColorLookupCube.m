@implementation PXGTextureDataColorLookupCube

- (PXGTextureDataColorLookupCube)initWithData:(id)a3 edgeSize:(int64_t)a4 pixelFormat:(unint64_t)a5
{
  id v9;
  PXGTextureDataColorLookupCube *v10;
  PXGTextureDataColorLookupCube *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGTextureDataColorLookupCube;
  v10 = -[PXGTextureDataColorLookupCube init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PXGColorLookupCube setEdgeSize:](v10, "setEdgeSize:", a4);
    v11->_pixelFormat = a5;
    objc_storeStrong((id *)&v11->_data, a3);
  }

  return v11;
}

- (PXGTextureDataColorLookupCube)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorLookupCube.m"), 446, CFSTR("%s is not available as initializer"), "-[PXGTextureDataColorLookupCube init]");

  abort();
}

- (BOOL)shouldCache
{
  return 0;
}

- (id)createTextureWithContext:(id)a3
{
  id v4;
  MTLDevice *v5;
  MTLDevice *device;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MTLTexture *v12;
  id v13;
  MTLDevice *v14;
  MTLDevice *v15;
  _QWORD v17[6];

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;

  if (v5 == device)
  {
    v12 = self->_texture;
  }
  else
  {
    -[PXGTextureDataColorLookupCube data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGColorLookupCube edgeSize](self, "edgeSize");
    v9 = -[PXGTextureDataColorLookupCube pixelFormat](self, "pixelFormat");
    v10 = PXGBytesPerPixelForMetalPixelFormat(v9) * v8;
    v11 = objc_alloc_init(MEMORY[0x24BDDD740]);
    objc_msgSend(v11, "setTextureType:", 7);
    objc_msgSend(v11, "setWidth:", v8);
    objc_msgSend(v11, "setHeight:", v8);
    objc_msgSend(v11, "setDepth:", v8);
    objc_msgSend(v11, "setPixelFormat:", v9);
    objc_msgSend(v11, "setUsage:", 1);
    objc_msgSend(v11, "setResourceOptions:", 0);
    v12 = (MTLTexture *)objc_msgSend(v4, "newTextureWithDescriptor:", v11);
    memset(v17, 0, 24);
    v13 = objc_retainAutorelease(v7);
    v17[3] = v8;
    v17[4] = v8;
    v17[5] = v8;
    objc_msgSend(v4, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", objc_msgSend(v13, "bytes", 0, 0, 0), v12, v17, objc_msgSend(v13, "length"), v10, v10 * v8);
    objc_msgSend(v4, "device");
    v14 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
    v15 = self->_device;
    self->_device = v14;

    objc_storeStrong((id *)&self->_texture, v12);
  }

  return v12;
}

- (id)textureData
{
  return self->_data;
}

- (double)center
{
  int v2;
  uint64_t v3;
  float32x4_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float32x4_t v10;
  float32x4_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  float32x4_t v22;
  double result;

  v2 = objc_msgSend(a1, "edgeSize");
  v3 = objc_msgSend(a1[6], "bytes");
  v5 = 0;
  if (v2 >= 1)
    v6 = v2 - 1;
  else
    v6 = v2;
  v7 = (uint64_t)v6 >> 1;
  v8 = 0uLL;
  v9 = (int8x16_t)vdupq_n_s32(0x4B400000u);
  v10 = (float32x4_t)vdupq_n_s32(0xCB400000);
  v11 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  v12 = 1;
  do
  {
    v13 = 0;
    v14 = v12;
    v15 = v3 + 4 * (v2 * v2) * (v5 + v7);
    v16 = 1;
    do
    {
      v17 = 0;
      v18 = v16;
      v19 = v15 + 4 * (v13 + v7) * v2;
      v20 = 1;
      do
      {
        v21 = v20;
        v4.i32[0] = *(_DWORD *)(v19 + 4 * (v17 + v7));
        v4 = vdivq_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v4.f32)), v9), v10), v11);
        v8 = vaddq_f32(v8, v4);
        v17 = 1;
        v20 = 0;
      }
      while ((v21 & 1) != 0);
      v16 = 0;
      v13 = 1;
    }
    while ((v18 & 1) != 0);
    v12 = 0;
    v5 = 1;
  }
  while ((v14 & 1) != 0);
  v22.i64[0] = 0x3E0000003E000000;
  v22.i64[1] = 0x3E0000003E000000;
  *(_QWORD *)&result = vmulq_f32(v8, v22).u64[0];
  return result;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
