@implementation TXRMipmapLevel

- (NSArray)elements
{
  return (NSArray *)self->_elements;
}

- (id)initAsLevel:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6
{
  _BOOL8 v6;
  id v10;
  TXRMipmapLevel *v11;
  TXRMipmapLevel *v12;
  uint64_t v13;
  NSMutableArray *elements;
  uint64_t v15;
  NSMutableArray *v16;
  id v17;
  objc_super v19;

  v6 = a5;
  v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TXRMipmapLevel;
  v11 = -[TXRMipmapLevel init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_level = a3;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    elements = v12->_elements;
    v12->_elements = (NSMutableArray *)v13;

    if (a4)
    {
      v15 = 0;
      do
      {
        v16 = v12->_elements;
        v17 = -[TXRArrayElement initAsLevel:element:cubemap:dataSourceProvider:]([TXRArrayElement alloc], "initAsLevel:element:cubemap:dataSourceProvider:", a3, v15, v6, v10);
        -[NSMutableArray addObject:](v16, "addObject:", v17);

        ++v15;
      }
      while (a4 != v15);
    }
  }

  return v12;
}

- (id)initAsLevel:(unint64_t)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  double v8;
  _BOOL8 v9;
  id v15;
  TXRMipmapLevel *v16;
  TXRMipmapLevel *v17;
  uint64_t v18;
  NSMutableArray *elements;
  uint64_t v20;
  NSMutableArray *v21;
  id v22;
  double v24;
  objc_super v25;

  v9 = a7;
  v24 = v8;
  v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TXRMipmapLevel;
  v16 = -[TXRMipmapLevel init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_level = a3;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a6);
    elements = v17->_elements;
    v17->_elements = (NSMutableArray *)v18;

    if (a6)
    {
      v20 = 0;
      do
      {
        v21 = v17->_elements;
        v22 = -[TXRArrayElement initAsLevel:element:dimensions:pixelFormat:alphaInfo:cubemap:bufferAllocator:]([TXRArrayElement alloc], "initAsLevel:element:dimensions:pixelFormat:alphaInfo:cubemap:bufferAllocator:", a3, v20, a4, a5, v9, v15, v24);
        -[NSMutableArray addObject:](v21, "addObject:", v22);

        ++v20;
      }
      while (a6 != v20);
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TXRMipmapLevel *v5;
  uint64_t v6;
  NSMutableArray *elements;
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
  v5 = -[TXRMipmapLevel init](+[TXRMipmapLevel allocWithZone:](TXRMipmapLevel, "allocWithZone:"), "init");
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  elements = v5->_elements;
  v5->_elements = (NSMutableArray *)v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_elements;
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
        v13 = v5->_elements;
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

- (void)setImage:(id)a3 atElement:(unint64_t)a4 atFace:(unint64_t)a5
{
  NSMutableArray *elements;
  id v8;
  id v9;

  elements = self->_elements;
  v8 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](elements, "objectAtIndexedSubscript:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:atFace:", v8, a5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
