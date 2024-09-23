@implementation TXRDeferredElementInfo

- (id)initAsCubemap:(BOOL)a3
{
  _BOOL4 v3;
  TXRDeferredElementInfo *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *faces;
  TXRDeferredImageInfo *v9;
  int v10;
  TXRDeferredImageInfo *v11;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TXRDeferredElementInfo;
  v4 = -[TXRDeferredElementInfo init](&v13, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (v3)
      v6 = 6;
    else
      v6 = 1;
    v7 = objc_msgSend(v5, "initWithCapacity:", v6);
    faces = v4->_faces;
    v4->_faces = (NSMutableArray *)v7;

    if (v3)
    {
      v9 = 0;
      v10 = 6;
      do
      {
        v11 = objc_alloc_init(TXRDeferredImageInfo);

        -[NSMutableArray addObject:](v4->_faces, "addObject:", v11);
        v9 = v11;
        --v10;
      }
      while (v10);
    }
    else
    {
      v11 = objc_alloc_init(TXRDeferredImageInfo);
      -[NSMutableArray addObject:](v4->_faces, "addObject:", v11);
    }

  }
  return v4;
}

- (NSMutableArray)faces
{
  return self->_faces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
}

@end
