@implementation _PXGViewSetupParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

- (void)setNeedsParenting:(BOOL)a3
{
  self->_needsParenting = a3;
}

- (PXGSpriteTexture)texture
{
  return self->_texture;
}

- ($3BA783FF50B239963188BE194EBFFEBA)textureInfo
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[1]._texture;
  *v2 = *(_OWORD *)&self[1].super.isa;
  v2[1] = v3;
  v4 = *(_OWORD *)&self[2].super.isa;
  v5 = *(_OWORD *)&self[2]._texture;
  v2[2] = v4;
  v2[3] = v5;
  return ($3BA783FF50B239963188BE194EBFFEBA)v4;
}

- (unsigned)spriteIndex
{
  return self->_spriteIndex;
}

- (void)setTextureInfo:(id)a3
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *v3;
  v5 = v3[1];
  v6 = v3[3];
  *(_OWORD *)&self[2].super.isa = v3[2];
  *(_OWORD *)&self[2]._texture = v6;
  *(_OWORD *)&self[1].super.isa = v4;
  *(_OWORD *)&self[1]._texture = v5;
}

- (void)setTexture:(id)a3
{
  objc_storeStrong((id *)&self->_texture, a3);
}

- (void)setSpriteIndex:(unsigned int)a3
{
  self->_spriteIndex = a3;
}

- (void)setSeparateLayers:(BOOL)a3
{
  self->_separateLayers = a3;
}

- (BOOL)separateLayers
{
  return self->_separateLayers;
}

- (BOOL)needsParenting
{
  return self->_needsParenting;
}

@end
