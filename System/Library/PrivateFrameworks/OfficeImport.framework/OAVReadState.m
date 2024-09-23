@implementation OAVReadState

- (OAVReadState)initWithClient:(Class)a3 packagePart:(id)a4
{
  id v7;
  OAVReadState *v8;
  OAVReadState *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mShapeTypes;
  NSMutableDictionary *v12;
  NSMutableDictionary *mShapeIdMap;
  NSMutableSet *v14;
  NSMutableSet *mDualDrawables;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)OAVReadState;
  v8 = -[OCXState init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mClient = a3;
    objc_storeStrong((id *)&v8->mPackagePart, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mShapeTypes = v9->mShapeTypes;
    v9->mShapeTypes = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mShapeIdMap = v9->mShapeIdMap;
    v9->mShapeIdMap = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mDualDrawables = v9->mDualDrawables;
    v9->mDualDrawables = v14;

  }
  return v9;
}

- (void)resetForNewDrawing
{
  -[NSMutableDictionary removeAllObjects](self->mShapeTypes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mShapeIdMap, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mDualDrawables, "removeAllObjects");
  -[OAVReadState setPackagePart:](self, "setPackagePart:", 0);
}

- (Class)client
{
  return self->mClient;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setPackagePart:(id)a3
{
  objc_storeStrong((id *)&self->mPackagePart, a3);
}

- (unsigned)shapeTypeForId:(id)a3
{
  void *v3;
  unsigned __int16 v4;

  -[NSMutableDictionary objectForKey:](self->mShapeTypes, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedShortValue");

  return v4;
}

- (void)setShapeType:(unsigned __int16)a3 forId:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *mShapeTypes;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  mShapeTypes = self->mShapeTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](mShapeTypes, "setObject:forKey:", v7, v8);

}

- (id)drawableForVmlShapeId:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->mShapeIdMap, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  objc_msgSend(WeakRetained, "drawableForShapeId:", objc_msgSend(v4, "unsignedLongValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDrawable:(id)a3 forVmlShapeId:(id)a4
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[NSMutableDictionary count](self->mShapeIdMap, "count") ^ 0x80000000;
  WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  objc_msgSend(WeakRetained, "setDrawable:forShapeId:", v12, v7);

  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mShapeIdMap, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = objc_msgSend(v12, "id");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mShapeIdMap, "setObject:forKeyedSubscript:", v11, v6);

    }
  }

}

- (void)addDualDrawable:(id)a3
{
  -[NSMutableSet addObject:](self->mDualDrawables, "addObject:", a3);
}

- (BOOL)isDualDrawable:(id)a3
{
  return -[NSMutableSet containsObject:](self->mDualDrawables, "containsObject:", a3);
}

- (unsigned)officeArtShapeIdWithVmlShapeId:(id)a3
{
  void *v3;
  unsigned int v4;

  -[NSMutableDictionary objectForKey:](self->mShapeIdMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongValue");

  return v4;
}

- (id)blipRefForURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mOAXState);
  objc_msgSend(WeakRetained, "blipRefForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OAXDrawingState)oaxState
{
  return (OAXDrawingState *)objc_loadWeakRetained((id *)&self->mOAXState);
}

- (void)setOaxState:(id)a3
{
  objc_storeWeak((id *)&self->mOAXState, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mOAXState);
  objc_storeStrong((id *)&self->mDualDrawables, 0);
  objc_storeStrong((id *)&self->mShapeIdMap, 0);
  objc_storeStrong((id *)&self->mShapeTypes, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
}

@end
