@implementation PXStoryConcreteAutoEditClipCatalog

- (PXStoryConcreteAutoEditClipCatalog)init
{
  return -[PXStoryConcreteAutoEditClipCatalog initWithCapacity:](self, "initWithCapacity:", 0);
}

- (PXStoryConcreteAutoEditClipCatalog)initWithCapacity:(int64_t)a3
{
  PXStoryConcreteAutoEditClipCatalog *v5;
  uint64_t v6;
  NSMutableArray *orderedClips;
  uint64_t v8;
  NSMutableDictionary *clipIndicesByAssetUUID;
  void *v12;
  objc_super v13;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteAutoEditClipCatalog.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity >= 0"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXStoryConcreteAutoEditClipCatalog;
  v5 = -[PXStoryConcreteAutoEditClipCatalog init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    orderedClips = v5->_orderedClips;
    v5->_orderedClips = (NSMutableArray *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
    clipIndicesByAssetUUID = v5->_clipIndicesByAssetUUID;
    v5->_clipIndicesByAssetUUID = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %lu clips: %@>"), objc_opt_class(), self, -[PXStoryConcreteAutoEditClipCatalog numberOfClips](self, "numberOfClips"), self->_orderedClips);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXStoryConcreteAutoEditClipCatalog *v5;
  uint64_t v6;
  NSMutableArray *orderedClips;
  uint64_t v8;
  NSMutableDictionary *clipIndicesByAssetUUID;

  v5 = +[PXStoryConcreteAutoEditClipCatalog allocWithZone:](PXStoryConcreteAutoEditClipCatalog, "allocWithZone:");
  v6 = -[NSMutableArray copyWithZone:](self->_orderedClips, "copyWithZone:", a3);
  orderedClips = v5->_orderedClips;
  v5->_orderedClips = (NSMutableArray *)v6;

  v8 = -[NSMutableDictionary copyWithZone:](self->_clipIndicesByAssetUUID, "copyWithZone:", a3);
  clipIndicesByAssetUUID = v5->_clipIndicesByAssetUUID;
  v5->_clipIndicesByAssetUUID = (NSMutableDictionary *)v8;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXStoryConcreteMutableAutoEditClipCatalog *v5;
  uint64_t v6;
  NSMutableArray *orderedClips;
  uint64_t v8;
  NSMutableDictionary *clipIndicesByAssetUUID;

  v5 = +[PXStoryConcreteMutableAutoEditClipCatalog allocWithZone:](PXStoryConcreteMutableAutoEditClipCatalog, "allocWithZone:");
  v6 = -[NSMutableArray mutableCopyWithZone:](self->_orderedClips, "mutableCopyWithZone:", a3);
  orderedClips = v5->super._orderedClips;
  v5->super._orderedClips = (NSMutableArray *)v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_clipIndicesByAssetUUID, "mutableCopyWithZone:", a3);
  clipIndicesByAssetUUID = v5->super._clipIndicesByAssetUUID;
  v5->super._clipIndicesByAssetUUID = (NSMutableDictionary *)v8;

  return v5;
}

- (int64_t)numberOfClips
{
  return -[NSMutableArray count](self->_orderedClips, "count");
}

- (id)clipForDisplayAsset:(id)a3
{
  NSMutableDictionary *clipIndicesByAssetUUID;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  clipIndicesByAssetUUID = self->_clipIndicesByAssetUUID;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alternateUUID");
  else
    objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](clipIndicesByAssetUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedClips, "objectAtIndexedSubscript:", objc_msgSend(v7, "unsignedIntegerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)enumerateClipsUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *orderedClips;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  orderedClips = self->_orderedClips;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PXStoryConcreteAutoEditClipCatalog_enumerateClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E51370C8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](orderedClips, "enumerateObjectsUsingBlock:", v7);

}

- (id)clipAtIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_orderedClips, "objectAtIndexedSubscript:", a3);
}

- (int64_t)indexOfClipForDisplayAsset:(id)a3
{
  NSMutableDictionary *clipIndicesByAssetUUID;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  clipIndicesByAssetUUID = self->_clipIndicesByAssetUUID;
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "alternateUUID");
  else
    objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](clipIndicesByAssetUUID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClips, 0);
  objc_storeStrong((id *)&self->_clipIndicesByAssetUUID, 0);
}

uint64_t __63__PXStoryConcreteAutoEditClipCatalog_enumerateClipsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
