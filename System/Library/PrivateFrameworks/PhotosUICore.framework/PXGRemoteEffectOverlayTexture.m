@implementation PXGRemoteEffectOverlayTexture

- (PXGRemoteEffectOverlayTexture)initWithMetalSpriteTexture:(id)a3
{
  id v5;
  PXGRemoteEffectOverlayTexture *v6;
  PXGRemoteEffectOverlayTexture *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGRemoteEffectOverlayTexture;
  v6 = -[PXGRemoteEffectOverlayTexture init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metalSpriteTexture, a3);

  return v7;
}

- (PXGSpriteTexture)texture
{
  return self->_metalSpriteTexture;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  -[PXGMetalSpriteTexture getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:](self->_metalSpriteTexture, "getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:", a3, a4, a5, a6, a7, *(_QWORD *)&a9, a8);
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSpriteIndexes:maxSpriteCount:", a3, v4);

}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateSpriteIndexes:", v4);

}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "containsSpriteIndex:", v3);

  return v3;
}

- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "hasPendingTextureRequestID:deliveryOrder:", v5, v4);

  return v4;
}

- (unsigned)spriteCount
{
  void *v2;
  unsigned int v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "spriteCount");

  return v3;
}

- (int64_t)estimatedByteSize
{
  void *v2;
  int64_t v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "estimatedByteSize");

  return v3;
}

- (unsigned)presentationType
{
  return 1;
}

- (CGImage)imageRepresentation
{
  void *v2;
  CGImage *v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImage *)objc_msgSend(v2, "imageRepresentation");

  return v3;
}

- (CGSize)pixelSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pixelSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isOpaque
{
  return 0;
}

- (NSIndexSet)spriteIndexes
{
  void *v2;
  void *v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spriteIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (BOOL)hasSprites
{
  void *v2;
  char v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSprites");

  return v3;
}

- (BOOL)isDegraded
{
  void *v2;
  char v3;

  -[PXGRemoteEffectOverlayTexture texture](self, "texture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDegraded");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalSpriteTexture, 0);
}

@end
