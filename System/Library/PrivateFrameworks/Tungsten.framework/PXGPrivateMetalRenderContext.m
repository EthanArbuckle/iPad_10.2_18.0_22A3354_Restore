@implementation PXGPrivateMetalRenderContext

- (PXGPrivateMetalRenderContext)initWithDevice:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGPrivateMetalRenderContext;
  return -[PXGMetalRenderContext initWithDevice:commandQueue:](&v4, sel_initWithDevice_commandQueue_, a3, 0);
}

- (id)newTextureWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGMetalRenderContext device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v4);

  return v6;
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  __int128 v8;
  _OWORD v9[3];

  v8 = *(_OWORD *)&a5->var0.var2;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  if (a8)
    objc_msgSend(a4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 0, a3, a7);
  else
    objc_msgSend(a4, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v9, 0, a3, a7);
}

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  __int128 v8;
  _OWORD v9[3];

  v8 = *(_OWORD *)&a5->var0.var2;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  -[PXGPrivateMetalRenderContext copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:](self, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", a3, a4, v9, a6, a7, a8);
}

- (BOOL)supportsSharedTextures
{
  return 0;
}

- (BOOL)wantsMutableSharedTextures
{
  return 0;
}

@end
