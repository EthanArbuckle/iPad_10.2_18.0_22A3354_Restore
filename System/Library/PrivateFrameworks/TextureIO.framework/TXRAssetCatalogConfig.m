@implementation TXRAssetCatalogConfig

- (TXRAssetCatalogConfig)initWithTexture:(id)a3
{
  id v5;
  TXRAssetCatalogConfig *v6;
  TXRAssetCatalogConfig *v7;
  NSMutableSet *v8;
  NSMutableSet *fileAttributesList;
  TXRAssetCatalogFileAttributes *v10;
  TXRAssetCatalogFileAttributes *baseFileAttributes;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TXRAssetCatalogConfig;
  v6 = -[TXRAssetCatalogConfig init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    fileAttributesList = v7->_fileAttributesList;
    v7->_fileAttributesList = v8;

    v10 = objc_alloc_init(TXRAssetCatalogFileAttributes);
    baseFileAttributes = v7->_baseFileAttributes;
    v7->_baseFileAttributes = v10;

  }
  return v7;
}

- (void)addFileAttributesForLevel:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TXRAssetCatalogMipFileAttributes *v9;

  v9 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  -[TXRAssetCatalogMipFileAttributes setLevel:](v9, "setLevel:", a3);
  -[NSMutableSet objectEnumerator](self->_fileAttributesList, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      if (objc_msgSend(v7, "level") == a3)
        -[NSMutableSet removeObject:](self->_fileAttributesList, "removeObject:", v7);
      objc_msgSend(v5, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);
  }
  -[NSMutableSet addObject:](self->_fileAttributesList, "addObject:", v9);

}

- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  TXRAssetCatalogMipFileAttributes *v11;

  v11 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  -[TXRAssetCatalogMipFileAttributes setLevel:](v11, "setLevel:", a3);
  -[TXRAssetCatalogMipFileAttributes setFace:](v11, "setFace:", a4);
  -[NSMutableSet objectEnumerator](self->_fileAttributesList, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      if (objc_msgSend(v9, "level") == a3
        && (objc_msgSend(v9, "face") == a4 || objc_msgSend(v9, "doesSpecifyAllFaces")))
      {
        -[NSMutableSet removeObject:](self->_fileAttributesList, "removeObject:", v9);
      }
      objc_msgSend(v7, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    while (v10);
  }
  -[NSMutableSet addObject:](self->_fileAttributesList, "addObject:", v11);

}

- (void)addFileAttributesForLevel:(unint64_t)a3 fileFormat:(unint64_t)a4 colorSpace:(CGColorSpace *)a5 exifOrientation:(unsigned __int8)a6
{
  uint64_t v6;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  TXRAssetCatalogMipFileAttributes *v15;

  v6 = a6;
  v15 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  -[TXRAssetCatalogMipFileAttributes setLevel:](v15, "setLevel:", a3);
  -[TXRAssetCatalogFileAttributes setExifOrientation:](v15, "setExifOrientation:", v6);
  -[TXRAssetCatalogFileAttributes setFileFormat:](v15, "setFileFormat:", a4);
  -[TXRAssetCatalogFileAttributes setColorSpace:](v15, "setColorSpace:", a5);
  -[NSMutableSet objectEnumerator](self->_fileAttributesList, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      if (objc_msgSend(v13, "level") == a3)
        -[NSMutableSet removeObject:](self->_fileAttributesList, "removeObject:", v13);
      objc_msgSend(v11, "nextObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    while (v14);
  }
  -[NSMutableSet addObject:](self->_fileAttributesList, "addObject:", v15);

}

- (void)addFileAttributesForLevel:(unint64_t)a3 face:(unint64_t)a4 fileFormat:(unint64_t)a5 colorSpace:(CGColorSpace *)a6 exifOrientation:(unsigned __int8)a7
{
  uint64_t v7;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  TXRAssetCatalogMipFileAttributes *v17;

  v7 = a7;
  v17 = objc_alloc_init(TXRAssetCatalogMipFileAttributes);
  -[TXRAssetCatalogMipFileAttributes setLevel:](v17, "setLevel:", a3);
  -[TXRAssetCatalogMipFileAttributes setFace:](v17, "setFace:", a4);
  -[TXRAssetCatalogFileAttributes setExifOrientation:](v17, "setExifOrientation:", v7);
  -[TXRAssetCatalogFileAttributes setFileFormat:](v17, "setFileFormat:", a5);
  -[TXRAssetCatalogFileAttributes setColorSpace:](v17, "setColorSpace:", a6);
  -[NSMutableSet objectEnumerator](self->_fileAttributesList, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      if (objc_msgSend(v15, "level") == a3
        && (objc_msgSend(v15, "face") == a4 || objc_msgSend(v15, "doesSpecifyAllFaces")))
      {
        -[NSMutableSet removeObject:](self->_fileAttributesList, "removeObject:", v15);
      }
      objc_msgSend(v13, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    while (v16);
  }
  -[NSMutableSet addObject:](self->_fileAttributesList, "addObject:", v17);

}

- (TXRAssetCatalogFileAttributes)baseFileAttributes
{
  return self->_baseFileAttributes;
}

- (void)setBaseFileAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_baseFileAttributes, a3);
}

- (NSSet)fileAttributesList
{
  return &self->_fileAttributesList->super;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)mipmapOption
{
  return self->_mipmapOption;
}

- (void)setMipmapOption:(unint64_t)a3
{
  self->_mipmapOption = a3;
}

- (TXRTexture)texture
{
  return self->_texture;
}

- (unint64_t)memory
{
  return self->_memory;
}

- (void)setMemory:(unint64_t)a3
{
  self->_memory = a3;
}

- (unint64_t)graphicsFeatureSet
{
  return self->_graphicsFeatureSet;
}

- (void)setGraphicsFeatureSet:(unint64_t)a3
{
  self->_graphicsFeatureSet = a3;
}

- (unint64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(unint64_t)a3
{
  self->_idiom = a3;
}

- (unint64_t)displayColorSpace
{
  return self->_displayColorSpace;
}

- (void)setDisplayColorSpace:(unint64_t)a3
{
  self->_displayColorSpace = a3;
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAttributesList, 0);
  objc_storeStrong((id *)&self->_baseFileAttributes, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
