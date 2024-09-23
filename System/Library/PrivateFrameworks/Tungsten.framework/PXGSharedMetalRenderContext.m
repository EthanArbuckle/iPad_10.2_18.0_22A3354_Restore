@implementation PXGSharedMetalRenderContext

- (id)newTextureWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "setStorageMode:", 2);
  -[PXGMetalRenderContext device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSharedTextureWithDescriptor:", v4);

  return v6;
}

- (void)copyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v14 = a4;
  if (objc_msgSend(v14, "isShareable"))
  {
    -[PXGMetalRenderContext device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newBufferWithBytes:length:options:", a3, a6, 0);

    v17 = *(_OWORD *)&a5->var0.var2;
    v19 = *(_OWORD *)&a5->var0.var0;
    v20 = v17;
    v21 = *(_OWORD *)&a5->var1.var1;
    -[PXGMetalRenderContext _blitFromBuffer:toTexture:inRegion:bytesPerRow:offset:bytesPerImage:](self, "_blitFromBuffer:toTexture:inRegion:bytesPerRow:offset:bytesPerImage:", v16, v14, &v19, a7, 0, a8);

  }
  else
  {
    v18 = *(_OWORD *)&a5->var0.var2;
    v19 = *(_OWORD *)&a5->var0.var0;
    v20 = v18;
    v21 = *(_OWORD *)&a5->var1.var1;
    if (a8)
      objc_msgSend(v14, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v19, 0, 0, a3, a7, a8);
    else
      objc_msgSend(v14, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", &v19, 0, a3, a7);
  }

}

- (void)fastCopyBytes:(const void *)a3 toTexture:(id)a4 inRegion:(id *)a5 length:(unint64_t)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  id v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v14 = a4;
  if (objc_msgSend(v14, "isShareable"))
  {
    v15 = -*MEMORY[0x24BDB03C8];
    v16 = v15 & (unint64_t)a3;
    v17 = (char *)a3 - (v15 & (unint64_t)a3);
    v18 = (((unint64_t)a3 + a6 + *MEMORY[0x24BDB03C8] - 1) & v15) - (v15 & (unint64_t)a3);
    -[PXGMetalRenderContext device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "newBufferWithBytesNoCopy:length:options:deallocator:", v16, v18, 0, 0);

    v21 = *(_OWORD *)&a5->var0.var2;
    v23 = *(_OWORD *)&a5->var0.var0;
    v24 = v21;
    v25 = *(_OWORD *)&a5->var1.var1;
    -[PXGMetalRenderContext _blitFromBuffer:toTexture:inRegion:bytesPerRow:offset:bytesPerImage:](self, "_blitFromBuffer:toTexture:inRegion:bytesPerRow:offset:bytesPerImage:", v20, v14, &v23, a7, v17, a8);

  }
  else
  {
    v22 = *(_OWORD *)&a5->var0.var2;
    v23 = *(_OWORD *)&a5->var0.var0;
    v24 = v22;
    v25 = *(_OWORD *)&a5->var1.var1;
    -[PXGSharedMetalRenderContext copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:](self, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", a3, v14, &v23, a6, a7, a8);
  }

}

- (BOOL)supportsSharedTextures
{
  return 1;
}

- (BOOL)wantsMutableSharedTextures
{
  return 0;
}

@end
