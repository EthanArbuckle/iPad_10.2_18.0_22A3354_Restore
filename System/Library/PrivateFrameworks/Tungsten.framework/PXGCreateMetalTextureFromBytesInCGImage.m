@implementation PXGCreateMetalTextureFromBytesInCGImage

void __PXGCreateMetalTextureFromBytesInCGImage_block_invoke(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[6];
  _QWORD v43[5];
  __int128 v44;

  v12 = (void *)MEMORY[0x2495B0A48]();
  v13 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _createMetal2DTextureDescriptorWithPixelFormat(v13, 0, (double)a2, (double)a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:", v15, 0);

    if (objc_msgSend(v17, "size") != a6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXGTextureUtilities.m"), 700, CFSTR("Bad texture layout size for pre-twiddled data"));

    }
    if (((objc_msgSend(v17, "alignment") - 1) & a5) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXGTextureUtilities.m"), 701, CFSTR("Bad data pointer alignment for pre-twiddled data"));

    }
    v41 = objc_msgSend(v17, "watermark");
    v44 = *(_OWORD *)(a5 + a6 - 16);
    if (v41 != (_QWORD)v44 || v18 != *((_QWORD *)&v44 + 1))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXGTextureUtilities.m"), 704, CFSTR("Bad pre-twiddled watermark (not pre-twiddled data?)"));

    }
    objc_msgSend(*(id *)(a1 + 32), "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __PXGCreateMetalTextureFromBytesInCGImage_block_invoke_2;
    v43[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v43[4] = *(_QWORD *)(a1 + 64);
    v21 = objc_msgSend(v20, "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a5, a6, v15, v43);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      v24 = ((a3 + 3) >> 2) * a4;
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v24);
      memset(v42, 0, 24);
      v42[3] = a2;
      v42[4] = a3;
      v42[5] = 1;
      v25 = v12;
      v26 = a4;
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v17, "copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:", a5, 0, 0, v42, objc_msgSend(v27, "mutableBytes"), 0, v26, v24);
      v28 = objc_retainAutorelease(v27);
      a5 = objc_msgSend(v28, "bytes");

      v12 = v25;
    }

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v29 = objc_msgSend(*(id *)(a1 + 32), "newTextureWithDescriptor:", v15);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "device");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PXGTextureUtilities.m"), 732, CFSTR("Device:%@ failed to create texture:%@"), v37, v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", a5);
  }

  objc_autoreleasePoolPop(v12);
}

uint64_t __PXGCreateMetalTextureFromBytesInCGImage_block_invoke_2()
{
  return CGImageTextureDataRelease();
}

@end
