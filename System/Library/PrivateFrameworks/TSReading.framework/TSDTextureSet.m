@implementation TSDTextureSet

- (TSDTextureSet)init
{
  TSDTextureSet *v2;
  TSDTextureSet *v3;
  CGSize v4;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDTextureSet;
  v2 = -[TSDTextureSet init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mMaxStageIndex = 0;
    v2->mChunkCount = 0;
    v2->mActiveChunkIndices.location = 0;
    v2->mActiveChunkIndices.length = 0;
    v2->mTextures = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->mAllTextures = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->mStageIndexForTexture = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    v3->mFinalTextureForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->mReverseFinalTextureForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->mBoundingRectForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->mContentRectForStage = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->mFinalTexturesToStageMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    v3->mReverseFinalTexturesToStageMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    v3->mLayer = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v3->mBounds.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v3->mBounds.size = v4;
    x = v3->mBounds.origin.x;
    v4.width = v3->mBounds.origin.y;
    width = v3->mBounds.size.width;
    height = v3->mBounds.size.height;
    MidX = CGRectGetMidX(*(CGRect *)((char *)&v4 - 8));
    MidY = CGRectGetMidY(v3->mBounds);
    v3->mCenter.x = MidX;
    v3->mCenter.y = MidY;
    -[CALayer setFrame:](v3->mLayer, "setFrame:", v3->mBounds.origin.x, v3->mBounds.origin.y, v3->mBounds.size.width, v3->mBounds.size.height);
    v3->mTextureContentRect.origin = (CGPoint)TSDRectUnit;
    v3->mTextureContentRect.size = *(CGSize *)&qword_217C29078;
    v3->mTextureOpacity = 1.0;
    v3->mTextureZOrder = -1;
  }
  return v3;
}

- (void)teardown
{
  NSMutableArray *mAllTextures;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  mAllTextures = self->mAllTextures;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mAllTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "teardown");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)releaseSingleTextures
{
  NSMutableArray *mAllTextures;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  mAllTextures = self->mAllTextures;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mAllTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "releaseSingleTexture");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTextureSet;
  -[TSDTextureSet dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  TSUNoCopyDictionary **p_mReverseFinalTexturesToStageMap;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSMutableArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->mAllTextures;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->mTextures, "containsObject:", v9))
        {
          objc_msgSend(v4, "addRenderable:forStage:", (id)objc_msgSend(v9, "copy"), -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", v9));
        }
        else
        {
          v10 = objc_msgSend((id)-[TSUNoCopyDictionary allKeys](self->mReverseFinalTexturesToStageMap, "allKeys"), "containsObject:", v9);
          if ((_DWORD)v10)
            p_mReverseFinalTexturesToStageMap = &self->mReverseFinalTexturesToStageMap;
          else
            p_mReverseFinalTexturesToStageMap = &self->mFinalTexturesToStageMap;
          v12 = (void *)-[TSUNoCopyDictionary objectForKey:](*p_mReverseFinalTexturesToStageMap, "objectForKey:", v9);
          if (v12)
            objc_msgSend(v4, "addFinalTexture:forStage:reverse:", (id)objc_msgSend(v9, "copy"), (int)objc_msgSend(v12, "intValue"), v10);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "setAlternateLayer:", self->mAlternateLayer);
  objc_msgSend(v4, "setBoundingRectForStage:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->mBoundingRectForStage));
  objc_msgSend(v4, "setContentRectForStage:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->mContentRectForStage));
  -[CALayer frame](self->mLayer, "frame");
  objc_msgSend((id)objc_msgSend(v4, "layer"), "setFrame:", v13, v14, v15, v16);
  objc_msgSend(v4, "setOriginalPosition:", self->mOriginalPosition.x, self->mOriginalPosition.y);
  objc_msgSend(v4, "setCenter:", self->mCenter.x, self->mCenter.y);
  return v4;
}

- (CALayer)layer
{
  CALayer *result;

  result = self->mAlternateLayer;
  if (!result)
    return self->mLayer;
  return result;
}

- (CGRect)boundingRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;
  CGRect v37;

  v4 = a4;
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:"));
  if (v7
    || (v7 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", &unk_24D8FAC50)) != 0)
  {
    objc_msgSend(v7, "CGRectValue");
  }
  else
  {
    -[TSDTextureSet boundingRect](self, "boundingRect");
  }
  x = v8;
  y = v9;
  width = v10;
  height = v11;
  if (a3 || !v4)
  {
    if (v4)
      goto LABEL_11;
    if (self->mMaxStageIndex != a3)
      goto LABEL_17;
  }
  v16 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", &unk_24D8FAC50);
  if (v16)
  {
    objc_msgSend(v16, "CGRectValue");
    v36.origin.x = v17;
    v36.origin.y = v18;
    v36.size.width = v19;
    v36.size.height = v20;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v32 = CGRectUnion(v31, v36);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  if (!v4)
  {
LABEL_17:
    if (a3 || v4)
      goto LABEL_20;
    goto LABEL_18;
  }
LABEL_11:
  v21 = !v4;
  if (a3)
    v21 = 0;
  if (v21 || self->mMaxStageIndex == a3)
  {
LABEL_18:
    v22 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", &unk_24D8FAC68);
    if (v22)
    {
      objc_msgSend(v22, "CGRectValue");
      v37.origin.x = v23;
      v37.origin.y = v24;
      v37.size.width = v25;
      v37.size.height = v26;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = CGRectUnion(v33, v37);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
    }
  }
LABEL_20:
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)contentRectForStage:(int64_t)a3 isBuildIn:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;
  CGRect v37;

  v4 = a4;
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:"));
  if (v7
    || (v7 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", &unk_24D8FAC50)) != 0)
  {
    objc_msgSend(v7, "CGRectValue");
  }
  else
  {
    -[TSDTextureSet boundingRect](self, "boundingRect");
  }
  x = v8;
  y = v9;
  width = v10;
  height = v11;
  if (a3 || !v4)
  {
    if (v4)
      goto LABEL_11;
    if (self->mMaxStageIndex != a3)
      goto LABEL_17;
  }
  v16 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", &unk_24D8FAC50);
  if (v16)
  {
    objc_msgSend(v16, "CGRectValue");
    v36.origin.x = v17;
    v36.origin.y = v18;
    v36.size.width = v19;
    v36.size.height = v20;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v32 = CGRectUnion(v31, v36);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
  }
  if (!v4)
  {
LABEL_17:
    if (a3 || v4)
      goto LABEL_20;
    goto LABEL_18;
  }
LABEL_11:
  v21 = !v4;
  if (a3)
    v21 = 0;
  if (v21 || self->mMaxStageIndex == a3)
  {
LABEL_18:
    v22 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", &unk_24D8FAC68);
    if (v22)
    {
      objc_msgSend(v22, "CGRectValue");
      v37.origin.x = v23;
      v37.origin.y = v24;
      v37.size.width = v25;
      v37.size.height = v26;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v34 = CGRectUnion(v33, v37);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
    }
  }
LABEL_20:
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)addRenderable:(id)a3
{
  -[TSDTextureSet addRenderable:forStage:](self, "addRenderable:forStage:", a3, -1);
}

- (void)addRenderable:(id)a3 forStage:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat r1;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  if (!objc_msgSend(a3, "textureType"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextureSet addRenderable:forStage:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextureSet.m"), 277, CFSTR("Unknown texture type! Probably because it wasn't set! Go do that!"));
  }
  -[NSMutableArray addObject:](self->mTextures, "addObject:", a3);
  -[NSMutableArray addObject:](self->mAllTextures, "addObject:", a3);
  objc_msgSend(a3, "setParent:", self);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mStageIndexForTexture, "setObject:forUncopiedKey:", v9, a3);
  objc_msgSend(a3, "frame");
  v59.origin.x = v10;
  v59.origin.y = v11;
  v59.size.width = v12;
  v59.size.height = v13;
  self->mBounds = CGRectUnion(self->mBounds, v59);
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  v14 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", v9);
  v15 = *MEMORY[0x24BDBF070];
  v16 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v17 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v18 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = *MEMORY[0x24BDBF070];
  if (v14)
  {
    objc_msgSend(v14, "CGRectValue");
    v22 = v23;
    v21 = v24;
    v20 = v25;
    v19 = v26;
  }
  objc_msgSend(a3, "frame");
  v60.origin.x = v27;
  v60.origin.y = v28;
  v60.size.width = v29;
  v60.size.height = v30;
  v54.origin.x = v22;
  v54.origin.y = v21;
  v54.size.width = v20;
  v54.size.height = v19;
  v55 = CGRectUnion(v54, v60);
  -[NSMutableDictionary setObject:forKey:](self->mBoundingRectForStage, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height), v9);
  v31 = (void *)-[NSMutableDictionary objectForKey:](self->mContentRectForStage, "objectForKey:", v9);
  if (v31)
  {
    objc_msgSend(v31, "CGRectValue");
    v15 = v32;
    v16 = v33;
    v17 = v34;
    v18 = v35;
  }
  r1 = v18;
  objc_msgSend(a3, "contentRect");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  objc_msgSend(a3, "offset");
  v44 = v17;
  v45 = v16;
  v46 = v15;
  v48 = v47;
  objc_msgSend(a3, "offset");
  v50 = v49;
  v56.origin.x = v37;
  v56.origin.y = v39;
  v56.size.width = v41;
  v56.size.height = v43;
  v61 = CGRectOffset(v56, v48, v50);
  v57.origin.x = v46;
  v57.origin.y = v45;
  v57.size.width = v44;
  v57.size.height = r1;
  v58 = CGRectUnion(v57, v61);
  -[NSMutableDictionary setObject:forKey:](self->mContentRectForStage, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height), v9);
  -[CALayer addSublayer:](self->mLayer, "addSublayer:", objc_msgSend(a3, "layer"));
  MidX = CGRectGetMidX(self->mBounds);
  MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.x = MidX;
  self->mCenter.y = MidY;
  if (self->mMaxStageIndex < a4)
    self->mMaxStageIndex = a4;
  ++self->mChunkCount;
  -[CALayer setSublayers:](self->mLayer, "setSublayers:", -[NSArray sortedArrayUsingComparator:](-[CALayer sublayers](self->mLayer, "sublayers"), "sortedArrayUsingComparator:", &__block_literal_global_39));
}

uint64_t __40__TSDTextureSet_addRenderable_forStage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "valueForKey:", CFSTR("kTSDTextureLayerKeyTexturedRectangle")), "nonretainedObjectValue");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("kTSDTextureLayerKeyTexturedRectangle")), "nonretainedObjectValue");
  v6 = objc_msgSend(v4, "textureType");
  v7 = objc_msgSend(v5, "textureType");
  if (v6 < v7)
    return -1;
  else
    return v6 > v7;
}

- (void)addFinalTexture:(id)a3 forStage:(int64_t)a4 reverse:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  NSMutableDictionary *mReverseFinalTextureForStage;
  NSMutableDictionary **p_mReverseFinalTextureForStage;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v19;

  v5 = a5;
  -[NSMutableArray addObject:](self->mAllTextures, "addObject:");
  objc_msgSend(a3, "setParent:", self);
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  if (v5)
  {
    -[TSUNoCopyDictionary setObject:forKey:](self->mReverseFinalTexturesToStageMap, "setObject:forKey:", a3, v9);
    p_mReverseFinalTextureForStage = &self->mReverseFinalTextureForStage;
    mReverseFinalTextureForStage = self->mReverseFinalTextureForStage;
  }
  else
  {
    -[TSUNoCopyDictionary setObject:forKey:](self->mFinalTexturesToStageMap, "setObject:forKey:", v9, a3);
    p_mReverseFinalTextureForStage = &self->mFinalTextureForStage;
    mReverseFinalTextureForStage = self->mFinalTextureForStage;
  }
  v12 = (void *)-[NSMutableDictionary objectForKey:](mReverseFinalTextureForStage, "objectForKey:", v9);
  if (!v12)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKey:](*p_mReverseFinalTextureForStage, "setObject:forKey:", v12, v9);
  }
  objc_msgSend(v12, "addObject:", a3);
  objc_msgSend(a3, "frame");
  v19.origin.x = v13;
  v19.origin.y = v14;
  v19.size.width = v15;
  v19.size.height = v16;
  self->mBounds = CGRectUnion(self->mBounds, v19);
  -[CALayer setFrame:](self->mLayer, "setFrame:");
  -[CALayer addSublayer:](self->mLayer, "addSublayer:", objc_msgSend(a3, "layer"));
  MidX = CGRectGetMidX(self->mBounds);
  MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.x = MidX;
  self->mCenter.y = MidY;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "setHidden:", 1);
}

- (void)renderLayerContentsIfNeeded
{
  NSMutableArray *mAllTextures;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double mTextureOpacity;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mAllTextures = self->mAllTextures;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mAllTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "renderLayerContentsIfNeeded");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  mTextureOpacity = self->mTextureOpacity;
  *(float *)&mTextureOpacity = mTextureOpacity;
  -[CALayer setOpacity:](self->mLayer, "setOpacity:", mTextureOpacity);
}

- (NSArray)visibleTextures
{
  uint64_t v2;

  v2 = 96;
  if (!self->mShouldIncludeFinalTexturesInVisibleSet)
    v2 = 88;
  return *(NSArray **)((char *)&self->super.isa + v2);
}

- (id)visibleTexturesForStage:(int64_t)a3 isBuildIn:(BOOL)a4 shouldFlatten:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  BOOL v17;
  double x;
  double y;
  double width;
  double height;
  uint64_t v22;
  void *v23;
  BOOL v25;
  _BOOL4 v27;
  unsigned int v28;
  void *v29;
  int64_t v30;
  int64_t v31;
  BOOL v32;
  BOOL v33;
  _BOOL4 v34;
  int v37;
  int v38;
  BOOL v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v50;
  char v51;
  _BOOL4 v52;
  BOOL v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  LODWORD(v50) = a5;
  v5 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->mTextures, "count"));
  v9 = (double *)MEMORY[0x24BDBF070];
  v10 = -[NSMutableArray count](self->mTextures, "count");
  if (-[NSMutableArray count](self->mTextures, "count"))
  {
    v11 = 0;
    v12 = -1;
    v13 = 1;
    do
    {
      v14 = -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", -[NSMutableArray objectAtIndex:](self->mTextures, "objectAtIndex:", v11, v50));
      if (v10 >= v14)
        v15 = v14;
      else
        v15 = v10;
      if (v12 <= v14)
        v16 = v14;
      else
        v16 = v12;
      if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
      {
        v12 = v16;
        v10 = v15;
      }
      v11 = v13;
      v17 = -[NSMutableArray count](self->mTextures, "count") > (unint64_t)v13++;
    }
    while (v17);
  }
  else
  {
    v12 = -1;
  }
  x = *v9;
  y = v9[1];
  width = v9[2];
  height = v9[3];
  if (-[NSMutableArray count](self->mTextures, "count", v50))
  {
    v22 = 0;
    v23 = 0;
    v25 = v12 == a3 && v12 != -1;
    v27 = v10 == a3 && v10 != -1;
    v52 = v27;
    v53 = v25;
    v28 = 1;
    while (1)
    {
      v29 = (void *)-[NSMutableArray objectAtIndex:](self->mTextures, "objectAtIndex:", v22);
      v30 = -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", v29);
      if (v30 == a3
        || ((v31 = v30, v30 == -1) ? (v32 = !v5) : (v32 = 1),
            !v32 ? (v33 = v10 == a3) : (v33 = 0),
            v33 && -[NSMutableArray count](self->mTextures, "count") != a3))
      {
LABEL_58:
        v38 = objc_msgSend(v29, "textureType");
        if (v23)
          v39 = v38 == 5;
        else
          v39 = 1;
        if (v39)
          v23 = v29;
        objc_msgSend(v8, "addObject:", v29);
        objc_msgSend(v29, "frame");
        v62.origin.x = v40;
        v62.origin.y = v41;
        v62.size.width = v42;
        v62.size.height = v43;
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        v61 = CGRectUnion(v60, v62);
        x = v61.origin.x;
        y = v61.origin.y;
        width = v61.size.width;
        height = v61.size.height;
        goto LABEL_64;
      }
      if (v31 == -1 && !v5)
        break;
      if (v31 == -1)
        goto LABEL_57;
      v34 = v31 == -2;
      if (v31 == -2 && v5 && v12 == a3)
      {
        if (-[NSMutableArray count](self->mTextures, "count") != a3)
          goto LABEL_58;
        v34 = 1;
      }
      v37 = !v5;
      if (v31 != -2)
        v37 = 0;
      if ((v37 & v52 & 1) != 0)
        goto LABEL_58;
      if (v34)
        goto LABEL_57;
LABEL_64:
      v22 = v28;
      v17 = -[NSMutableArray count](self->mTextures, "count") > (unint64_t)v28++;
      if (!v17)
        goto LABEL_67;
    }
    if (v53)
      goto LABEL_58;
LABEL_57:
    if (-[NSMutableArray count](self->mTextures, "count") == 1)
      goto LABEL_58;
    goto LABEL_64;
  }
  v23 = 0;
LABEL_67:
  if ((v51 & 1) != 0 && (unint64_t)objc_msgSend(v8, "count") >= 2 && v23)
  {
    v44 = -[TSDTextureSet newFlattenedTextureFromTextures:newRect:](self, "newFlattenedTextureFromTextures:newRect:", v8, x, y, width, height);
    objc_msgSend(v44, "setOffset:", x, y);
    objc_msgSend(v44, "setParent:", self);
    objc_msgSend(v44, "setIsFlattened:", 1);
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mStageIndexForTexture, "setObject:forUncopiedKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), v44);
    objc_msgSend(v44, "renderLayerContentsIfNeeded");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v45 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(v8);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "layer"), "setHidden:", 1);
        }
        v46 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v46);
    }
    -[CALayer insertSublayer:above:](self->mLayer, "insertSublayer:above:", objc_msgSend(v44, "layer"), objc_msgSend(v23, "layer"));
    -[NSMutableArray insertObject:atIndex:](self->mAllTextures, "insertObject:atIndex:", v44, -[NSMutableArray indexOfObject:](self->mAllTextures, "indexOfObject:", v23) + 1);
    -[NSMutableArray insertObject:atIndex:](self->mTextures, "insertObject:atIndex:", v44, -[NSMutableArray indexOfObject:](self->mTextures, "indexOfObject:", v23) + 1);
    objc_msgSend(v8, "removeAllObjects");
    objc_msgSend(v8, "addObject:", v44);

  }
  return v8;
}

- (void)removeRenderable:(id)a3
{
  -[NSMutableArray removeObject:](self->mAllTextures, "removeObject:");
  -[NSMutableArray removeObject:](self->mTextures, "removeObject:", a3);
  objc_msgSend((id)objc_msgSend(a3, "layer"), "removeFromSuperlayer");
}

- (id)firstVisibleTextureForTextureType:(int)a3
{
  NSMutableArray *mTextures;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mTextures = self->mTextures;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mTextures);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "textureType") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mTextures, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)newFlattenedTextureFromTextures:(id)a3 newRect:(CGRect)a4
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  TSDTexturedRectangle *v11;
  _QWORD v13[9];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = (void *)objc_msgSend(a3, "copy");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__TSDTextureSet_newFlattenedTextureFromTextures_newRect___block_invoke;
  v13[3] = &unk_24D82C178;
  *(double *)&v13[5] = x;
  *(double *)&v13[6] = y;
  *(double *)&v13[7] = width;
  *(CGFloat *)&v13[8] = height;
  v13[4] = v8;
  v9 = TSDCeilSize(width);
  v11 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v13, v9, v10, x, y);

  return v11;
}

uint64_t __57__TSDTextureSet_newFlattenedTextureFromTextures_newRect___block_invoke(uint64_t a1, CGContextRef c)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGImage *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x24BDAC8D0];
  CGContextTranslateCTM(c, 0.0, *(CGFloat *)(a1 + 64));
  CGContextScaleCTM(c, 1.0, -1.0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(void **)(a1 + 32);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_msgSend(v9, "frame");
        v11 = v10 - *(double *)(a1 + 40);
        v14 = *(double *)(a1 + 48) + *(double *)(a1 + 64) - (v12 + v13);
        objc_msgSend(v9, "frame");
        v16 = v15;
        objc_msgSend(v9, "frame");
        v18 = v17;
        objc_msgSend(v9, "textureOpacity");
        CGContextSetAlpha(c, v19);
        v20 = (CGImage *)objc_msgSend(v9, "image");
        v27.origin.x = v11;
        v27.origin.y = v14;
        v27.size.width = v16;
        v27.size.height = v18;
        CGContextDrawImage(c, v27, v20);
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 1);
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (id)newFlattenedTexture
{
  double x;
  double y;
  CGFloat height;
  double width;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  _QWORD v19[9];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = -[TSDTextureSet visibleTextures](self, "visibleTextures");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "layer"), "frame");
        v28.origin.x = v12;
        v28.origin.y = v13;
        v28.size.width = v14;
        v28.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v28);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __36__TSDTextureSet_newFlattenedTexture__block_invoke;
  v19[3] = &unk_24D82C178;
  *(double *)&v19[5] = x;
  *(double *)&v19[6] = y;
  *(double *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v19[4] = self;
  v16 = TSDCeilSize(width);
  return -[TSDTexturedRectangle initWithSize:offset:renderBlock:]([TSDTexturedRectangle alloc], "initWithSize:offset:renderBlock:", v19, v16, v17, x, y);
}

void __36__TSDTextureSet_newFlattenedTexture__block_invoke(uint64_t a1, CGContextRef c)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "visibleTextures", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 0);
        objc_msgSend(v9, "renderIntoContext:", c);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setHidden:", 1);
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  CGContextRestoreGState(c);
}

- (int64_t)stageIndexForTexture:(id)a3
{
  void *v3;

  v3 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mStageIndexForTexture, "objectForKey:", a3);
  if (v3)
    return objc_msgSend(v3, "integerValue");
  else
    return -1;
}

- (id)finalTextureForStage:(int64_t)a3 reverse:(BOOL)a4
{
  uint64_t v4;

  v4 = 112;
  if (a4)
    v4 = 136;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "objectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3));
}

- (void)hideLayersOfFinalTextures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = (void *)-[NSMutableDictionary objectEnumerator](self->mFinalTextureForStage, "objectEnumerator");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v36;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v7);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v32;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12++), "layer"), "setHidden:", 1);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          }
          while (v10);
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v5);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = (void *)-[NSMutableDictionary objectEnumerator](self->mReverseFinalTextureForStage, "objectEnumerator");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v24;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v24 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "layer"), "setHidden:", 1);
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
          }
          while (v20);
        }
        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v15);
  }
}

- (void)setLayerGeometryFromRep:(id)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CALayer *mLayer;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double x;
  double v36;
  CGFloat y;
  double v38;
  CGFloat width;
  double v40;
  CGFloat height;
  void *v42;
  float v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  float64x2_t v64;
  float64x2_t v65;
  float64x2_t v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  _OWORD v70[8];
  CGRect v71;
  CGRect v72;

  objc_msgSend((id)objc_msgSend(a3, "canvas"), "viewScale");
  v6 = v5;
  if (self->mIsMagicMove)
  {
    objc_msgSend(a3, "naturalBounds");
    objc_msgSend(a3, "convertNaturalRectToUnscaledCanvas:");
    v11 = TSDMultiplyRectScalar(v7, v8, v9, v10, v6);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(a3, "naturalBounds");
    -[CALayer setBounds:](self->mLayer, "setBounds:", TSDMultiplyRectScalar(v18, v19, v20, v21, v6));
    -[CALayer setPosition:](self->mLayer, "setPosition:", TSDCenterOfRect(v11, v13, v15, v17));
    if (!self->mShouldTransformUsingTextureCenter)
    {
      objc_msgSend(a3, "centerForRotation");
      v24 = TSDMultiplyPointScalar(v22, v23, v6);
LABEL_12:
      self->mCenter.x = v24;
      self->mCenter.y = v25;
    }
  }
  else
  {
    mLayer = self->mLayer;
    v27 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v70[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v70[5] = v27;
    v28 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v70[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v70[7] = v28;
    v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v70[0] = *MEMORY[0x24BDE5598];
    v70[1] = v29;
    v30 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v70[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v70[3] = v30;
    -[CALayer setTransform:](mLayer, "setTransform:", v70);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layout"), "geometry"), "frame");
    x = TSDMultiplyRectScalar(v31, v32, v33, v34, v6);
    y = v36;
    width = v38;
    height = v40;
    if (objc_msgSend(a3, "textureActionAttributes"))
    {
      v42 = (void *)objc_msgSend((id)objc_msgSend(a3, "textureActionAttributes"), "valueForKey:", CFSTR("sfx-action-rotation-angle"));
      if (v42)
      {
        objc_msgSend(v42, "floatValue");
        v44 = v43 * 0.0174532925;
        v45 = TSDCenterOfRect(x, y, width, height);
        v47 = v46;
        memset(&v69, 0, sizeof(v69));
        CGAffineTransformMakeTranslation(&v69, v45, v46);
        v67 = v69;
        CGAffineTransformRotate(&v68, &v67, v44);
        v69 = v68;
        v67 = v68;
        CGAffineTransformTranslate(&v68, &v67, -v45, -v47);
        v69 = v68;
        v71.origin.x = x;
        v71.origin.y = y;
        v71.size.width = width;
        v71.size.height = height;
        v72 = CGRectApplyAffineTransform(v71, &v68);
        x = v72.origin.x;
        y = v72.origin.y;
        width = v72.size.width;
        height = v72.size.height;
      }
    }
    -[CALayer setFrame:](self->mLayer, "setFrame:", x, y, width, height);
    if (!self->mShouldTransformUsingTextureCenter)
    {
      objc_msgSend(a3, "centerForRotation");
      v62 = v49;
      v63 = v48;
      v50 = (void *)objc_msgSend(a3, "layout");
      if (v50)
      {
        objc_msgSend(v50, "transformInRoot");
        v51 = v64;
        v52 = v65;
        v53 = v66;
      }
      else
      {
        v53 = 0uLL;
        v51 = 0uLL;
        v52 = 0uLL;
      }
      v54 = vaddq_f64(v53, vmlaq_n_f64(vmulq_n_f64(v52, v62), v51, v63));
      v55 = TSDMultiplyPointScalar(v54.f64[0], v54.f64[1], v6);
      v24 = TSDSubtractPoints(v55, v56, x);
      goto LABEL_12;
    }
  }
  -[CALayer frame](self->mLayer, "frame");
  self->mOriginalPosition.x = TSDCenterOfRect(v57, v58, v59, v60);
  self->mOriginalPosition.y = v61;
}

- (void)adjustAnchorPointRelativeToCenterOfRotation
{
  NSMutableArray *mAllTextures;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mAllTextures = self->mAllTextures;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mAllTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "adjustAnchorRelativeToParentsCenterOfRotation:isMagicMove:", 0, self->mCenter.x, self->mCenter.y);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)resetAnchorPoint
{
  NSMutableArray *mAllTextures;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  mAllTextures = self->mAllTextures;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mAllTextures);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "resetAnchorPoint");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)p_resetAttributesWithViewScale:(double)a3
{
  double v4;
  CALayer *mAlternateLayer;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  NSMutableArray *mAllTextures;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double x;
  double v17;
  CGFloat v18;
  double y;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[8];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[CALayer setPosition:](self->mLayer, "setPosition:", self->mOriginalPosition.x, self->mOriginalPosition.y);
  if (self->mAlternateLayer)
  {
    -[CALayer position](self->mLayer, "position");
    -[CALayer setPosition:](self->mAlternateLayer, "setPosition:");
    LODWORD(v4) = 1.0;
    -[CALayer setOpacity:](self->mAlternateLayer, "setOpacity:", v4);
    mAlternateLayer = self->mAlternateLayer;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v41[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v41[5] = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v41[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v41[7] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v41[0] = *MEMORY[0x24BDE5598];
    v41[1] = v8;
    v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v41[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v41[3] = v9;
    -[CALayer setTransform:](mAlternateLayer, "setTransform:", v41);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  mAllTextures = self->mAllTextures;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v31 = *MEMORY[0x24BDBD8B8];
    v29 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(mAllTextures);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        *(_OWORD *)&v36.a = v31;
        *(_OWORD *)&v36.c = v30;
        *(_OWORD *)&v36.tx = v29;
        if (self->mIsMagicMove
          && self->mTextureAngle != 0.0
          && objc_msgSend(v15, "textureType") != 9
          && objc_msgSend(v15, "textureType") != 3)
        {
          x = self->mCenter.x;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          v18 = x - v17;
          y = self->mCenter.y;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          *(_OWORD *)&v35.a = v31;
          *(_OWORD *)&v35.c = v30;
          *(_OWORD *)&v35.tx = v29;
          CGAffineTransformTranslate(&v36, &v35, v18, y - v20);
          v21 = -self->mTextureAngle;
          v34 = v36;
          CGAffineTransformRotate(&v35, &v34, v21);
          v36 = v35;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          v23 = v22 - self->mCenter.x;
          objc_msgSend((id)objc_msgSend(v15, "layer"), "position");
          v25 = v24 - self->mCenter.y;
          v34 = v36;
          CGAffineTransformTranslate(&v35, &v34, v23, v25);
          v36 = v35;
        }
        v33 = v36;
        v26 = (void *)objc_msgSend(v15, "layer", v29, v30, v31);
        v32 = v33;
        objc_msgSend(v26, "setAffineTransform:", &v32);
        objc_msgSend(v15, "originalPosition");
        objc_msgSend((id)objc_msgSend(v15, "layer"), "setPosition:", v27, v28);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v12);
  }
}

- (void)p_applyPositionFromAttributes:(id)a3 viewScale:(double)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;

  v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("New Position Delta"));
  if (v6)
  {
    objc_msgSend(v6, "CGPointValue");
    v9 = TSDMultiplyPointScalar(v7, v8, a4);
    -[CALayer setPosition:](self->mLayer, "setPosition:", TSDAddPoints(self->mOriginalPosition.x, self->mOriginalPosition.y, v9));
    if (self->mAlternateLayer)
    {
      -[CALayer position](self->mLayer, "position");
      -[CALayer setPosition:](self->mAlternateLayer, "setPosition:");
    }
  }
}

- (void)applyActionEffect:(id)a3 viewScale:(double)a4 isMagicMove:(BOOL)a5 shouldBake:(BOOL)a6 applyScaleOnly:(BOOL)a7 ignoreScale:(BOOL)a8 shouldCheckActionKeys:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v12;
  _BOOL4 v13;
  unint64_t v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  double v28;
  uint64_t v29;
  double v30;
  float v31;
  CALayer *mAlternateLayer;
  char v33;
  NSMutableArray *mAllTextures;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  uint64_t j;
  void *v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  __int128 v60;
  double x;
  double y;
  id v63;
  void *v64;
  _BOOL4 v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[2];
  uint64_t (*v78)(uint64_t, void *, void *);
  void *v79;
  void *v80;
  void *v81;
  TSDTextureSet *v82;
  double v83;
  double v84;
  BOOL v85;
  BOOL v86;
  BOOL v87;
  BOOL v88;
  BOOL v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;
  CGRect v93;
  CGRect v94;

  v9 = a9;
  v12 = a6;
  v13 = a5;
  v92 = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    if (self->mIsBaked && self->mBakedAttributes && objc_msgSend(a3, "isEqualToDictionary:"))
    {
      -[TSDTextureSet p_applyPositionFromAttributes:viewScale:](self, "p_applyPositionFromAttributes:viewScale:", a3, a4);
      return;
    }

    self->mBakedAttributes = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  v17 = 0x24BDE5000uLL;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if (a3 || self->mIsMagicMove)
  {
    v18 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("sfx-action-color-alpha"));
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v21 = (float)(v20 / 100.0);
    }
    else
    {
      v21 = 1.0;
    }
    v22 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("sfx-action-rotation-angle"));
    v23 = objc_msgSend(a3, "valueForKey:", CFSTR("sfx-action-rotation-direction"));
    v63 = a3;
    if (v22)
    {
      v24 = (void *)v23;
      objc_msgSend(v22, "floatValue");
      v26 = v25 * 0.0174532925;
      if (v24 && objc_msgSend(v24, "intValue") == 32)
        v26 = -v26;
      v27 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("sfx-action-scale-size"));
      if (!v27)
      {
        v28 = 1.0;
        goto LABEL_26;
      }
    }
    else
    {
      v29 = objc_msgSend(a3, "valueForKey:", CFSTR("sfx-action-scale-size"));
      if (!v29)
      {
        v28 = 1.0;
        v26 = 0.0;
        if (!self->mIsMagicMove)
        {
          v43 = 1;
          v17 = 0x24BDE5000;
          if (!v19)
            goto LABEL_52;
          goto LABEL_51;
        }
        v27 = 0;
LABEL_26:
        v77[0] = MEMORY[0x24BDAC760];
        v77[1] = 3221225472;
        v78 = __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke;
        v79 = &unk_24D82C1A0;
        v85 = a7;
        v86 = v13;
        v87 = v9;
        v83 = v28;
        v84 = v26;
        v88 = a8;
        v80 = v22;
        v81 = v27;
        v89 = v12;
        v82 = self;
        mAlternateLayer = self->mAlternateLayer;
        v65 = v12;
        v64 = v19;
        if (mAlternateLayer)
        {
          __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke((uint64_t)v77, 0, mAlternateLayer);
          v33 = 1;
          goto LABEL_50;
        }
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        mAllTextures = self->mAllTextures;
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v74;
          if (v22)
            v38 = v13;
          else
            v38 = 0;
          v33 = 1;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v74 != v37)
                objc_enumerationMutation(mAllTextures);
              v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              v41 = objc_msgSend(v40, "layer");
              v78((uint64_t)v77, v40, (void *)v41);
              if (v9 && objc_msgSend((id)objc_msgSend(v40, "layer"), "valueForKey:", CFSTR("apple:action-motion-path")))
                v33 = 0;
              if (v38)
              {
                if (!objc_msgSend(v40, "attributes"))
                  objc_msgSend(v40, "setAttributes:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1));
                v42 = (void *)objc_msgSend(v40, "attributes");
                objc_msgSend(v42, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26 * -57.2957795), CFSTR("kSFXAngle"));
              }
            }
            v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
          }
          while (v36);
          if (!v38)
          {
LABEL_50:
            v12 = v65;
            self->mIsBaked = v65;
            v43 = v33 & 1;
            v17 = 0x24BDE5000uLL;
            if (!v64)
            {
LABEL_52:
              if (v43)
                -[TSDTextureSet p_applyPositionFromAttributes:viewScale:](self, "p_applyPositionFromAttributes:viewScale:", v63, a4);
              if (v12)
              {
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v44 = (void *)-[NSMutableDictionary allKeys](self->mBoundingRectForStage, "allKeys");
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
                if (v45)
                {
                  v46 = v45;
                  v47 = *(_QWORD *)v70;
                  v48 = (_OWORD *)MEMORY[0x24BDBD8B8];
                  do
                  {
                    for (j = 0; j != v46; ++j)
                    {
                      if (*(_QWORD *)v70 != v47)
                        objc_enumerationMutation(v44);
                      v50 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                      v51 = (void *)-[NSMutableDictionary objectForKey:](self->mBoundingRectForStage, "objectForKey:", v50);
                      if (v51)
                      {
                        objc_msgSend(v51, "CGRectValue");
                        v53 = v52;
                        v55 = v54;
                        v57 = v56;
                        v59 = v58;
                        v60 = v48[1];
                        *(_OWORD *)&v68.a = *v48;
                        *(_OWORD *)&v68.c = v60;
                        *(_OWORD *)&v68.tx = v48[2];
                        x = self->mCenter.x;
                        y = self->mCenter.y;
                        *(_OWORD *)&v67.a = *(_OWORD *)&v68.a;
                        *(_OWORD *)&v67.c = v60;
                        *(_OWORD *)&v67.tx = *(_OWORD *)&v68.tx;
                        CGAffineTransformTranslate(&v68, &v67, x, y);
                        v66 = v68;
                        CGAffineTransformScale(&v67, &v66, v28, v28);
                        v68 = v67;
                        v66 = v67;
                        CGAffineTransformRotate(&v67, &v66, v26);
                        v68 = v67;
                        v66 = v67;
                        CGAffineTransformTranslate(&v67, &v66, -x, -y);
                        v68 = v67;
                        v93.origin.x = v53;
                        v93.origin.y = v55;
                        v93.size.width = v57;
                        v93.size.height = v59;
                        v94 = CGRectApplyAffineTransform(v93, &v67);
                        -[TSDTextureSet setBoundingRect:forStage:](self, "setBoundingRect:forStage:", (int)objc_msgSend(v50, "intValue"), v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
                      }
                    }
                    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
                  }
                  while (v46);
                }
              }
              goto LABEL_64;
            }
LABEL_51:
            self->mTextureOpacity = v21;
            *(float *)&v30 = v21;
            -[CALayer setOpacity:](self->mLayer, "setOpacity:", v30);
            goto LABEL_52;
          }
        }
        else
        {
          v33 = 1;
          if (!v22 || !v13)
            goto LABEL_50;
        }
        -[TSDTextureSet setTextureAngle:](self, "setTextureAngle:", -v26);
        goto LABEL_50;
      }
      v27 = (void *)v29;
      v26 = 0.0;
    }
    objc_msgSend(v27, "floatValue");
    if (v31 == 0.0)
      v28 = 0.00001;
    else
      v28 = v31;
    goto LABEL_26;
  }
  -[TSDTextureSet p_resetAttributesWithViewScale:](self, "p_resetAttributesWithViewScale:", a4);
LABEL_64:
  objc_msgSend(*(id *)(v17 + 2008), "commit");
}

uint64_t __117__TSDTextureSet_applyActionEffect_viewScale_isMagicMove_shouldBake_applyScaleOnly_ignoreScale_shouldCheckActionKeys___block_invoke(uint64_t result, void *a2, void *a3)
{
  uint64_t v5;
  _BOOL4 v6;
  double v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;

  v5 = result;
  if (*(_BYTE *)(result + 72))
    v6 = *(double *)(result + 56) != 1.0;
  else
    v6 = 0;
  if (!*(_BYTE *)(result + 73) && !v6)
  {
    if (*(_QWORD *)(result + 32))
    {
      if (!*(_BYTE *)(result + 74) || (result = objc_msgSend(a3, "valueForKey:", CFSTR("apple:action-rotation"))) == 0)
        result = objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v5 + 64)), CFSTR("transform.rotation.z"));
    }
  }
  v7 = *(double *)(v5 + 56);
  if (!*(_BYTE *)(v5 + 75))
  {
    if (*(_QWORD *)(v5 + 40))
    {
      if (!*(_BYTE *)(v5 + 74) || (result = objc_msgSend(a3, "valueForKey:", CFSTR("apple:action-scale"))) == 0)
      {
        objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("kTSDTextureLayerKeyBakedScale")), "doubleValue");
        if (v11 != 0.0 && !*(_BYTE *)(v5 + 76) && !*(_BYTE *)(v5 + 72))
          v7 = *(double *)(v5 + 56) / v11;
        result = objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7), CFSTR("transform.scale.xy"));
      }
    }
  }
  if (a2)
  {
    v8 = *(_QWORD *)(v5 + 48);
    if (*(void **)(v8 + 264) != a3)
    {
      result = objc_msgSend(a2, "adjustAnchorRelativeToParentsCenterOfRotation:isMagicMove:", *(unsigned __int8 *)(v5 + 73), *(double *)(v8 + 8), *(double *)(v8 + 16));
      v9 = *(_BYTE *)(v5 + 76) || v6;
      if (v9 == 1)
      {
        v10 = 0.0;
        if (*(_BYTE *)(v5 + 76) && !*(_BYTE *)(v5 + 73))
          v10 = *(double *)(v5 + 64);
        result = objc_msgSend(a2, "bakeLayerWithAngle:scale:", v10, v7);
        if (v6 && !*(_BYTE *)(v5 + 73) && !*(_BYTE *)(v5 + 76) && *(double *)(v5 + 64) != 0.0)
          return objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:"), CFSTR("transform.rotation.z"));
      }
    }
  }
  return result;
}

- (BOOL)isBackgroundTexture:(id)a3
{
  return -[TSDTextureSet stageIndexForTexture:](self, "stageIndexForTexture:", a3) == -1;
}

- (void)setBoundingRect:(CGRect)a3
{
  CGFloat MidX;
  CGFloat MidY;

  self->mBounds = a3;
  MidX = CGRectGetMidX(a3);
  MidY = CGRectGetMidY(self->mBounds);
  self->mCenter.x = MidX;
  self->mCenter.y = MidY;
}

- (void)setBoundingRect:(CGRect)a3 forStage:(int64_t)a4
{
  NSMutableDictionary *mBoundingRectForStage;
  uint64_t v6;

  mBoundingRectForStage = self->mBoundingRectForStage;
  v6 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NSMutableDictionary setObject:forKey:](mBoundingRectForStage, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4));
}

- (void)setContentRect:(CGRect)a3 forStage:(int64_t)a4
{
  NSMutableDictionary *mContentRectForStage;
  uint64_t v6;

  mContentRectForStage = self->mContentRectForStage;
  v6 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[NSMutableDictionary setObject:forKey:](mContentRectForStage, "setObject:forKey:", v6, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4));
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayer frame](self->mLayer, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setIsBaked:(BOOL)a3
{
  if (self->mIsBaked && !a3)
  {

    self->mBakedAttributes = 0;
  }
  self->mIsBaked = a3;
}

- (void)renderIntoContext:(CGContext *)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double mTextureOpacity;
  NSMutableArray *mAllTextures;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!-[CALayer isHidden](self->mLayer, "isHidden"))
  {
    -[CALayer frame](self->mLayer, "frame");
    v6 = v5;
    v8 = v7;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, v6, v8);
    mTextureOpacity = self->mTextureOpacity;
    if (mTextureOpacity != 1.0)
    {
      CGContextSetAlpha(a3, mTextureOpacity);
      CGContextBeginTransparencyLayer(a3, 0);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    mAllTextures = self->mAllTextures;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(mAllTextures);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "renderIntoContext:", a3);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }
    if (self->mTextureOpacity != 1.0)
      CGContextEndTransparencyLayer(a3);
    CGContextRestoreGState(a3);
  }
}

- (BOOL)isRenderable
{
  NSMutableArray *mAllTextures;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->mAllTextures, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    mAllTextures = self->mAllTextures;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      v7 = 1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(mAllTextures);
          v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isRenderable");
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mAllTextures, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)addPerspectiveLayerToTexture:(id)a3 withShowSize:(CGSize)a4
{
  double height;
  double width;
  CALayer *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  height = a4.height;
  width = a4.width;
  v8 = (CALayer *)objc_msgSend((id)objc_msgSend(a3, "layer"), "superlayer");
  if (v8 == -[TSDTextureSet layer](self, "layer"))
  {
    v9 = (id)objc_msgSend(a3, "layer");
    v17 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[CALayer frame](-[TSDTextureSet layer](self, "layer"), "frame");
    v11 = TSDSubtractPoints(width * 0.5, height * 0.5, v10);
    v13 = v12;
    -[CALayer bounds](-[TSDTextureSet layer](self, "layer"), "bounds");
    v15 = v11 / v14;
    -[CALayer bounds](-[TSDTextureSet layer](self, "layer"), "bounds");
    objc_msgSend(v17, "setAnchorPoint:", v15, v13 / v16);
    objc_msgSend(v17, "setPosition:", v11, v13);
    -[CALayer bounds](-[TSDTextureSet layer](self, "layer"), "bounds");
    objc_msgSend(v17, "setBounds:");
    objc_msgSend(v17, "setName:", CFSTR("Perspective layer"));
    -[CALayer replaceSublayer:with:](-[TSDTextureSet layer](self, "layer"), "replaceSublayer:with:", v9, v17);
    objc_msgSend(v17, "addSublayer:", v9);
    objc_msgSend(v17, "addPerspectiveSublayerProjectionUsingScreenSize:", width, height);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDTextureSet frame](self, "frame");
  v7 = v6;
  -[TSDTextureSet frame](self, "frame");
  v9 = v8;
  -[TSDTextureSet frame](self, "frame");
  v11 = v10;
  -[TSDTextureSet frame](self, "frame");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p frame(%.1f,%.1f,%.1f,%.1f) count(%ld) textures:%@>"), v5, self, v7, v9, v11, v12, -[NSMutableArray count](self->mAllTextures, "count"), self->mAllTextures);
}

- (NSArray)allTextures
{
  return &self->mAllTextures->super;
}

- (CALayer)alternateLayer
{
  return self->mAlternateLayer;
}

- (void)setAlternateLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)boundingRectForStage
{
  return &self->mBoundingRectForStage->super;
}

- (void)setBoundingRectForStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->mCenter.x;
  y = self->mCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->mCenter = a3;
}

- (unint64_t)chunkCount
{
  return self->mChunkCount;
}

- (CGColorSpace)colorSpace
{
  return self->mColorSpace;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  self->mColorSpace = a3;
}

- (NSDictionary)contentRectForStage
{
  return &self->mContentRectForStage->super;
}

- (void)setContentRectForStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (BOOL)isBackground
{
  return self->mIsBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->mIsBackground = a3;
}

- (BOOL)isBaked
{
  return self->mIsBaked;
}

- (BOOL)isMagicMove
{
  return self->mIsMagicMove;
}

- (void)setIsMagicMove:(BOOL)a3
{
  self->mIsMagicMove = a3;
}

- (int64_t)maxStageIndex
{
  return self->mMaxStageIndex;
}

- (CGPoint)originalPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mOriginalPosition.x;
  y = self->mOriginalPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalPosition:(CGPoint)a3
{
  self->mOriginalPosition = a3;
}

- (BOOL)shouldIncludeFinalTexturesInVisibleSet
{
  return self->mShouldIncludeFinalTexturesInVisibleSet;
}

- (void)setShouldIncludeFinalTexturesInVisibleSet:(BOOL)a3
{
  self->mShouldIncludeFinalTexturesInVisibleSet = a3;
}

- (BOOL)shouldTransformUsingTextureCenter
{
  return self->mShouldTransformUsingTextureCenter;
}

- (void)setShouldTransformUsingTextureCenter:(BOOL)a3
{
  self->mShouldTransformUsingTextureCenter = a3;
}

- (CGRect)textureContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mTextureContentRect.origin.x;
  y = self->mTextureContentRect.origin.y;
  width = self->mTextureContentRect.size.width;
  height = self->mTextureContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextureContentRect:(CGRect)a3
{
  self->mTextureContentRect = a3;
}

- (double)textureAngle
{
  return self->mTextureAngle;
}

- (void)setTextureAngle:(double)a3
{
  self->mTextureAngle = a3;
}

- (double)textureOpacity
{
  return self->mTextureOpacity;
}

- (void)setTextureOpacity:(double)a3
{
  self->mTextureOpacity = a3;
}

- (int64_t)textureZOrder
{
  return self->mTextureZOrder;
}

- (void)setTextureZOrder:(int64_t)a3
{
  self->mTextureZOrder = a3;
}

- (TSDRep)rep
{
  return self->mRep;
}

- (void)setRep:(id)a3
{
  self->mRep = (TSDRep *)a3;
}

- (int64_t)stageIndex
{
  return self->_stageIndex;
}

@end
