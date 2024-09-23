@implementation InverseLTMBuffers

- (int)setToneCurves:(ltmCurves *)a3
{
  double v3;
  float v4;
  int v6;
  MTLTexture *inverseLtmTex;
  MTLTexture *inverseGlobalLtmTex;
  MTLTexture *inverseGtcTex;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v16[1536];
  uint64_t v17;
  uint64_t v18;

  memset(v16, 0, 512);
  v6 = invertLTMCurves(a3, (uint64_t)v16, 0.0, v3, v4);
  if (v6)
  {
    FigDebugAssert3();
  }
  else
  {
    inverseLtmTex = self->inverseLtmTex;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = xmmword_216F961E0;
    v15 = 6;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](inverseLtmTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v11, 0, 0, v16, 512, 4096);
    inverseGlobalLtmTex = self->inverseGlobalLtmTex;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = xmmword_216F961F0;
    v15 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](inverseGlobalLtmTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v11, 0, 0, &v17, 0, 0);
    inverseGtcTex = self->inverseGtcTex;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = xmmword_216F961F0;
    v15 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](inverseGtcTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v11, 0, 0, &v18, 0, 0);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inverseGtcTex, 0);
  objc_storeStrong((id *)&self->inverseGlobalLtmTex, 0);
  objc_storeStrong((id *)&self->inverseLtmTex, 0);
}

- (InverseLTMBuffers)initWithMetal:(id)a3
{
  id v4;
  InverseLTMBuffers *v5;
  id v6;
  void *v7;
  uint64_t v8;
  MTLTexture *inverseLtmTex;
  void *v10;
  uint64_t v11;
  MTLTexture *inverseGlobalLtmTex;
  void *v13;
  uint64_t v14;
  MTLTexture *inverseGtcTex;
  InverseLTMBuffers *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)InverseLTMBuffers;
  v5 = -[InverseLTMBuffers init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD740]);
    objc_msgSend(v6, "setTextureType:", 7);
    objc_msgSend(v6, "setWidth:", 256);
    objc_msgSend(v6, "setHeight:", 8);
    objc_msgSend(v6, "setDepth:", 6);
    objc_msgSend(v6, "setPixelFormat:", 20);
    objc_msgSend(v6, "setUsage:", 1);
    objc_msgSend(v4, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "newTextureWithDescriptor:", v6);
    inverseLtmTex = v5->inverseLtmTex;
    v5->inverseLtmTex = (MTLTexture *)v8;

    objc_msgSend(v6, "setTextureType:", 0);
    objc_msgSend(v6, "setWidth:", 256);
    objc_msgSend(v6, "setHeight:", 1);
    objc_msgSend(v6, "setDepth:", 1);
    objc_msgSend(v6, "setPixelFormat:", 20);
    objc_msgSend(v6, "setUsage:", 1);
    objc_msgSend(v4, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "newTextureWithDescriptor:", v6);
    inverseGlobalLtmTex = v5->inverseGlobalLtmTex;
    v5->inverseGlobalLtmTex = (MTLTexture *)v11;

    objc_msgSend(v6, "setTextureType:", 0);
    objc_msgSend(v6, "setWidth:", 256);
    objc_msgSend(v6, "setHeight:", 1);
    objc_msgSend(v6, "setDepth:", 1);
    objc_msgSend(v6, "setPixelFormat:", 20);
    objc_msgSend(v6, "setUsage:", 1);
    objc_msgSend(v4, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "newTextureWithDescriptor:", v6);
    inverseGtcTex = v5->inverseGtcTex;
    v5->inverseGtcTex = (MTLTexture *)v14;

    v16 = v5;
  }

  return v5;
}

@end
