@implementation TXRAssetCatalogMipFileAttributes

- (TXRAssetCatalogMipFileAttributes)init
{
  TXRAssetCatalogMipFileAttributes *v2;
  TXRAssetCatalogMipFileAttributes *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TXRAssetCatalogMipFileAttributes;
  v2 = -[TXRAssetCatalogFileAttributes init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TXRAssetCatalogMipFileAttributes specifyAllFaces](v2, "specifyAllFaces");
  return v3;
}

- (void)setFace:(unint64_t)a3
{
  unint64_t face;

  if (a3 <= 5)
    face = self->_face;
  else
    face = 5;
  self->_face = face;
}

- (unint64_t)face
{
  return self->_face;
}

- (void)specifyAllFaces
{
  self->_face = 0xFFFFFFFFLL;
}

- (BOOL)doesSpecifyAllFaces
{
  return self->_face > 5;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

@end
