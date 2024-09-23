@implementation VFXTextureOffscreenRenderingSource

- (float32x2_t)textureSize
{
  return vcvt_f32_f64(a1[2]);
}

- (void)_buildMipmaps:(__CFXEngineContext *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1B1813BC4((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

@end
