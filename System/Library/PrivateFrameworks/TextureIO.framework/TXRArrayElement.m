@implementation TXRArrayElement

- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6
{
  _BOOL4 v6;
  id v10;
  TXRArrayElement *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *faces;
  uint64_t i;
  NSMutableArray *v16;
  id v17;
  objc_super v19;

  v6 = a5;
  v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TXRArrayElement;
  v11 = -[TXRArrayElement init](&v19, sel_init);
  if (v11)
  {
    if (v6)
      v12 = 6;
    else
      v12 = 1;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
    faces = v11->_faces;
    v11->_faces = (NSMutableArray *)v13;

    for (i = 0; i != v12; ++i)
    {
      v16 = v11->_faces;
      v17 = -[TXRImage initAsLevel:element:face:dataSourceProvider:]([TXRImage alloc], "initAsLevel:element:face:dataSourceProvider:", a3, a4, i, v10);
      -[NSMutableArray addObject:](v16, "addObject:", v17);

    }
  }

  return v11;
}

- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 dimensions:(unint64_t)a5 pixelFormat:(unint64_t)a6 alphaInfo:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  double v8;
  _BOOL4 v9;
  id v13;
  TXRArrayElement *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *faces;
  NSMutableArray *v18;
  TXRImageIndependent *v19;
  double v21;
  objc_super v22;

  v9 = a7;
  v21 = v8;
  v13 = a8;
  v22.receiver = self;
  v22.super_class = (Class)TXRArrayElement;
  v14 = -[TXRArrayElement init](&v22, sel_init);
  if (v14)
  {
    if (v9)
      v15 = 6;
    else
      v15 = 1;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    faces = v14->_faces;
    v14->_faces = (NSMutableArray *)v16;

    do
    {
      v18 = v14->_faces;
      v19 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bufferAllocator:]([TXRImageIndependent alloc], "initWithDimensions:pixelFormat:alphaInfo:bufferAllocator:", a5, a6, v13, v21);
      -[NSMutableArray addObject:](v18, "addObject:", v19);

      --v15;
    }
    while (v15);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TXRArrayElement *v5;
  uint64_t v6;
  NSMutableArray *faces;
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
  v5 = -[TXRArrayElement init](+[TXRArrayElement allocWithZone:](TXRArrayElement, "allocWithZone:"), "init");
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_faces, "count"));
  faces = v5->_faces;
  v5->_faces = (NSMutableArray *)v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_faces;
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
        v13 = v5->_faces;
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

- (void)setImage:(id)a3 atFace:(unint64_t)a4
{
  -[NSMutableArray setObject:atIndexedSubscript:](self->_faces, "setObject:atIndexedSubscript:", a3, a4);
}

- (NSArray)faces
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
}

@end
