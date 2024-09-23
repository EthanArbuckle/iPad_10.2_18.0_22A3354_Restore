@implementation TXRTexture

- (TXRTexture)initWithDataSourceProvider:(id)a3
{
  id v4;
  TXRTexture *v5;
  uint64_t v6;
  NSMutableArray *mipmapLevels;
  void *v8;
  __int128 v9;
  uint64_t v10;
  NSMutableArray *v11;
  unint64_t v12;
  NSMutableArray *v13;
  id v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TXRTexture;
  v5 = -[TXRTexture init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    mipmapLevels = v5->_mipmapLevels;
    v5->_mipmapLevels = (NSMutableArray *)v6;

    objc_msgSend(v4, "provideTextureInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cubemap = objc_msgSend(v8, "cubemap");
    v5->_pixelFormat = objc_msgSend(v8, "pixelFormat");
    v5->_alphaInfo = objc_msgSend(v8, "alphaInfo");
    objc_msgSend(v8, "dimensions");
    *(_OWORD *)v5->_dimensions = v9;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "mipmapLevelCount"));
    v11 = v5->_mipmapLevels;
    v5->_mipmapLevels = (NSMutableArray *)v10;

    if (objc_msgSend(v8, "mipmapLevelCount"))
    {
      v12 = 0;
      do
      {
        v13 = v5->_mipmapLevels;
        v14 = -[TXRMipmapLevel initAsLevel:arrayLength:cubemap:dataSourceProvider:]([TXRMipmapLevel alloc], "initAsLevel:arrayLength:cubemap:dataSourceProvider:", v12, objc_msgSend(v8, "arrayLength"), objc_msgSend(v8, "cubemap"), v4);
        -[NSMutableArray addObject:](v13, "addObject:", v14);

        ++v12;
      }
      while (v12 < objc_msgSend(v8, "mipmapLevelCount"));
    }

  }
  return v5;
}

- (TXRTexture)initWithContentsOfURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  TXRDefaultBufferAllocator *v11;
  id v12;
  TXRBufferAllocator *bufferAllocator;
  TXRDefaultBufferAllocator *v14;
  TXRFileDataSourceProvider *v15;
  TXRTexture *v16;

  v10 = a3;
  v11 = (TXRDefaultBufferAllocator *)a4;
  v12 = a5;
  if (!v11)
    v11 = objc_alloc_init(TXRDefaultBufferAllocator);
  bufferAllocator = self->_bufferAllocator;
  self->_bufferAllocator = (TXRBufferAllocator *)v11;
  v14 = v11;

  v15 = -[TXRFileDataSourceProvider initWithURL:bufferAllocator:options:error:]([TXRFileDataSourceProvider alloc], "initWithURL:bufferAllocator:options:error:", v10, v14, v12, a6);
  v16 = -[TXRTexture initWithDataSourceProvider:](self, "initWithDataSourceProvider:", v15);

  return v16;
}

- (TXRTexture)initWithDimensions:(unint64_t)a3 pixelFormat:(unint64_t)a4 alphaInfo:(unint64_t)a5 mipmapLevelCount:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  __int128 v8;
  _BOOL8 v9;
  TXRDefaultBufferAllocator *v15;
  TXRTexture *v16;
  uint64_t v17;
  NSMutableArray *mipmapLevels;
  uint64_t v19;
  __int128 v20;
  NSMutableArray *v21;
  id v22;
  int v23;
  __int128 v25;
  __int128 v26;
  objc_super v27;

  v9 = a7;
  v25 = v8;
  v15 = (TXRDefaultBufferAllocator *)a8;
  v27.receiver = self;
  v27.super_class = (Class)TXRTexture;
  v16 = -[TXRTexture init](&v27, sel_init);
  if (v16)
  {
    if (!v15)
      v15 = objc_alloc_init(TXRDefaultBufferAllocator);
    objc_storeStrong((id *)&v16->_bufferAllocator, v15);
    v16->_pixelFormat = a3;
    *(_OWORD *)v16->_dimensions = v25;
    v16->_cubemap = v9;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
    mipmapLevels = v16->_mipmapLevels;
    v16->_mipmapLevels = (NSMutableArray *)v17;

    if (a5)
    {
      v19 = 0;
      v20 = v25;
      do
      {
        v26 = v20;
        v21 = v16->_mipmapLevels;
        v22 = -[TXRMipmapLevel initAsLevel:dimensions:pixelFormat:alphaInfo:arrayLength:cubemap:bufferAllocator:]([TXRMipmapLevel alloc], "initAsLevel:dimensions:pixelFormat:alphaInfo:arrayLength:cubemap:bufferAllocator:", v19, a3, a4, a6, v9, v15, *(double *)&v20);
        -[NSMutableArray addObject:](v21, "addObject:", v22);

        *(uint32x2_t *)&v20 = vmax_u32(vshr_n_u32(*(uint32x2_t *)&v26, 1uLL), (uint32x2_t)0x100000001);
        v23 = DWORD2(v26) >> 1;
        if (DWORD2(v26) >> 1 <= 1)
          v23 = 1;
        *((_QWORD *)&v20 + 1) = __PAIR64__(HIDWORD(v26), v23);
        ++v19;
      }
      while (a5 != v19);
    }
  }

  return v16;
}

- (TXRTexture)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  objc_super v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TXRTexture;
  -[TXRTexture init](&v12, sel_init);
  __assert_rtn("-[TXRTexture initWithData:bufferAllocator:options:error:]", "TXRTexture.m", 410, "!\"TODO: Must Implement\");
}

- (id)exportToAssetCatalogWithName:(id)a3 location:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  TXRAssetCatalogSet *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = -[TXRAssetCatalogSet initWithName:]([TXRAssetCatalogSet alloc], "initWithName:", v8);

  -[TXRAssetCatalogSet exportAtLocation:error:](v9, "exportAtLocation:error:", v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)exportToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("ktx"));

  if (v8)
  {
    if (a4)
    {
      _newTXRErrorWithCodeAndErrorString(11, (uint64_t)CFSTR("TXRTexture can only export to the KTX texture fil format"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = +[TXRParserKTX exportTexture:url:error:](TXRParserKTX, "exportTexture:url:error:", self, v6, a4);
  }

  return v9;
}

- (void)reformat:(unint64_t)a3 gammaDegamma:(BOOL)a4 bufferAllocator:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  TXRBufferAllocator *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  TXRBufferAllocator *v24;
  _BOOL8 v25;
  id *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  __int128 v33;
  int v34;
  NSMutableArray *obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  TXRTexture *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v7 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = (TXRBufferAllocator *)a5;
  if (!v10)
  {
    v10 = self->_bufferAllocator;
    if (!v10)
      v10 = objc_alloc_init(TXRDefaultBufferAllocator);
  }
  v44 = *(_OWORD *)self->_dimensions;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v43 = self;
  obj = self->_mipmapLevels;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v51;
    v11 = 0x1E977F000uLL;
    v12 = 0x1E977F000uLL;
    do
    {
      v13 = 0;
      v14 = v44;
      do
      {
        v45 = v14;
        if (*(_QWORD *)v51 != v36)
        {
          objc_enumerationMutation(obj);
          *(_QWORD *)&v14 = v45;
        }
        v38 = v13;
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
        +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:](TXRPixelFormatInfo, "packedMemoryLayoutForFormat:dimensions:", a3, *(double *)&v14);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v15, "elements");
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v41)
        {
          v40 = *(_QWORD *)v47;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v47 != v40)
                objc_enumerationMutation(v39);
              v42 = v16;
              v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v16);
              objc_msgSend(v17, "faces");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

              if (v19)
              {
                v20 = 0;
                do
                {
                  v21 = objc_alloc(*(Class *)(v11 + 536));
                  objc_msgSend(v17, "faces");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
                  v23 = v12;
                  v24 = v10;
                  v25 = v7;
                  v26 = a6;
                  v27 = a3;
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = (void *)objc_msgSend(v21, "initWithImage:dimensions:pixelFormat:alphaInfo:", v28, v43->_pixelFormat, v43->_alphaInfo, *(double *)&v45);

                  a3 = v27;
                  a6 = v26;
                  v7 = v25;
                  v10 = v24;
                  v12 = v23;

                  v30 = (void *)objc_msgSend(*(id *)(v23 + 504), "newImageFromSourceImage:newPixelFormat:bufferAllocator:gammaDegamma:error:", v29, a3, v10, v7, a6);
                  objc_msgSend(v17, "setImage:atFace:", v30, v20);

                  ++v20;
                  objc_msgSend(v17, "faces");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "count");

                  v11 = 0x1E977F000;
                }
                while (v20 < v32);
              }
              v16 = v42 + 1;
            }
            while (v42 + 1 != v41);
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v41);
        }

        *(uint32x2_t *)&v33 = vcgt_u32(*(uint32x2_t *)&v45, (uint32x2_t)0x100000001);
        *(int32x2_t *)&v33 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vshr_n_u32(*(uint32x2_t *)&v45, 1uLL), *(int8x8_t *)&v33), (int32x2_t)vmvn_s8(*(int8x8_t *)&v33));
        if (DWORD2(v45) <= 1)
          v34 = 1;
        else
          v34 = DWORD2(v45) >> 1;
        *((_QWORD *)&v33 + 1) = __PAIR64__(HIDWORD(v45), v34);
        v13 = v38 + 1;
        v14 = v33;
      }
      while (v38 + 1 != v37);
      v44 = v33;
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16, *(double *)&v33);
    }
    while (v37);
  }

  v43->_pixelFormat = a3;
}

- (void)generateMipmapsForRange:(_NSRange)a3 filter:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  TXRImageIndependent *v35;
  id v36;
  void *v37;
  void *v38;
  int8x8_t v39;
  __int128 v40;
  int v41;
  unint64_t v42;
  __int128 v43;
  NSUInteger v44;
  unint64_t v45;
  TXRBufferAllocator *v46;

  length = a3.length;
  location = a3.location;
  if (a3.location >= -[NSMutableArray count](self->_mipmapLevels, "count"))
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(9, (uint64_t)CFSTR("Range Location must be an index of an existing mipmap level"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v46 = self->_bufferAllocator;
    if (!v46)
      v46 = objc_alloc_init(TXRDefaultBufferAllocator);
    v10 = location + length;
    v11 = *(_DWORD *)&self->_dimensions[4];
    if (v11 <= *(_DWORD *)&self->_dimensions[8])
      v11 = *(_DWORD *)&self->_dimensions[8];
    if (*(_DWORD *)self->_dimensions > v11)
      v11 = *(_DWORD *)self->_dimensions;
    if (v11)
    {
      v12 = -1;
      do
      {
        ++v12;
        v13 = v11 > 1;
        v11 >>= 1;
      }
      while (v13);
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
    }
    if (v10 >= v12)
      v10 = v12;
    v45 = location + 1;
    if (location + 1 < v10)
    {
      v43 = *(_OWORD *)self->_dimensions;
      v14 = 0x1E977F000uLL;
      v42 = v10;
      while (1)
      {
        v44 = location;
        if (-[NSMutableArray count](self->_mipmapLevels, "count") <= v45)
        {
          v15 = objc_alloc(*(Class *)(v14 + 552));
          -[NSMutableArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "elements");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v15, "initAsLevel:arrayLength:cubemap:dataSourceProvider:", v45, objc_msgSend(v17, "count"), self->_cubemap, 0);

          -[NSMutableArray addObject:](self->_mipmapLevels, "addObject:", v18);
        }
        v19 = a4;
        v20 = 0;
LABEL_23:
        -[NSMutableArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "elements");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v20 < v23)
          break;
        v39 = (int8x8_t)vcgt_u32(*(uint32x2_t *)&v43, (uint32x2_t)0x100000001);
        *(int32x2_t *)&v40 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vshr_n_u32(*(uint32x2_t *)&v43, 1uLL), v39), (int32x2_t)vmvn_s8(v39));
        if (DWORD2(v43) <= 1)
          v41 = 1;
        else
          v41 = DWORD2(v43) >> 1;
        *((_QWORD *)&v40 + 1) = __PAIR64__(HIDWORD(v43), v41);
        location = v44 + 1;
        v43 = v40;
        ++v45;
        a4 = v19;
        v14 = 0x1E977F000;
        if (v45 == v42)
          goto LABEL_36;
      }
      for (i = 0; ; ++i)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "elements");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "faces");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (i >= v29)
        {
          ++v20;
          goto LABEL_23;
        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", v44);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "elements");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "faces");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", i);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = -[TXRImageIndependent initWithImage:dimensions:pixelFormat:alphaInfo:]([TXRImageIndependent alloc], "initWithImage:dimensions:pixelFormat:alphaInfo:", v34, self->_pixelFormat, self->_alphaInfo, *(double *)&v43);
        v36 = +[TXRDataScaler newImageFromSourceImage:bufferAllocattor:filter:error:](TXRDataScaler, "newImageFromSourceImage:bufferAllocattor:filter:error:", v35, v46, v19, a5);
        v37 = v36;
        if (*a5 || !v36)
          break;
        -[NSMutableArray objectAtIndexedSubscript:](self->_mipmapLevels, "objectAtIndexedSubscript:", v45);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setImage:atElement:atFace:", v37, v20, i);

      }
    }
LABEL_36:

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  TXRTexture *v5;
  uint64_t v6;
  NSMutableArray *mipmapLevels;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[TXRTexture init](+[TXRTexture allocWithZone:](TXRTexture, "allocWithZone:"), "init");
  objc_storeStrong((id *)&v5->_bufferAllocator, self->_bufferAllocator);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_mipmapLevels, "count"));
  mipmapLevels = v5->_mipmapLevels;
  v5->_mipmapLevels = (NSMutableArray *)v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_mipmapLevels;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = v5->_mipmapLevels;
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v16);
        -[NSMutableArray addObject:](v13, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)copyWithPixelFormat:(unint64_t)a3 options:(id)a4 bufferAllocator:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a5;
  __assert_rtn("-[TXRTexture copyWithPixelFormat:options:bufferAllocator:]", "TXRTexture.m", 574, "!\"TODO: Must Implement\");
}

- (NSArray)mipmapLevels
{
  return &self->_mipmapLevels->super;
}

- (__n128)dimensions
{
  return a1[2];
}

- (BOOL)cubemap
{
  return self->_cubemap;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mipmapLevels, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
}

@end
