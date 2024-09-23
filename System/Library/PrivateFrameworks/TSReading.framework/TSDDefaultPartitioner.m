@implementation TSDDefaultPartitioner

- (TSDDefaultPartitioner)initWithInfo:(id)a3
{
  TSDDefaultPartitioner *v4;
  TSDDefaultPartitioner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDDefaultPartitioner;
  v4 = -[TSDDefaultPartitioner init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mInfo = (TSDInfo *)a3;
    -[TSDDefaultPartitioner p_generateLayouts](v4, "p_generateLayouts");
    v5->mMainRepsByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    v5->mCachedImagesByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    v5->mPartialRepsByCanvas = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDDefaultPartitioner p_teardownLayouts](self, "p_teardownLayouts");

  v3.receiver = self;
  v3.super_class = (Class)TSDDefaultPartitioner;
  -[TSDDefaultPartitioner dealloc](&v3, sel_dealloc);
}

- (id)hintForLayout:(id)a3
{
  id result;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_opt_class();
  result = (id)TSUDynamicCast();
  if (result)
  {
    objc_msgSend(result, "bounds");
    return -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:"), v5, v6, v7, v8);
  }
  return result;
}

- (BOOL)didHint:(id)a3 syncWithNextHint:(id)a4 horizontally:(BOOL)a5 delta:(int)a6
{
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double MaxX;
  double MinX;
  CGRect v34;
  CGRect v35;

  if (a6)
    return 0;
  v7 = a5;
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  v9 = TSUDynamicCast();
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
    return 0;
  v11 = (void *)v9;
  objc_msgSend(v8, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = v13;
  v29 = v15;
  v30 = v17;
  v31 = v19;
  if (v7)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v28);
    v34.origin.x = v21;
    v34.origin.y = v23;
    v34.size.width = v25;
    v34.size.height = v27;
    MinX = CGRectGetMinX(v34);
  }
  else
  {
    MaxX = CGRectGetMaxY(*(CGRect *)&v28);
    v35.origin.x = v21;
    v35.origin.y = v23;
    v35.size.width = v25;
    v35.size.height = v27;
    MinX = CGRectGetMinY(v35);
  }
  return vabdd_f64(MaxX, MinX) < 0.00999999978;
}

- (id)layoutForHint:(id)a3 parentLayout:(id)a4
{
  uint64_t v5;
  void *v6;
  TSDPartitionedPartialLayout *v7;
  TSDInfo *mInfo;
  TSDPartitionedPartialLayout *v9;

  objc_opt_class();
  v5 = TSUDynamicCast();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [TSDPartitionedPartialLayout alloc];
    mInfo = self->mInfo;
    objc_msgSend(v6, "bounds");
    v9 = -[TSDPartitionedPartialLayout initWithInfo:bounds:partitioner:](v7, "initWithInfo:bounds:partitioner:", mInfo, self);
    -[TSDLayout validate](v9, "validate");
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)nextHintForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  _BOOL8 v8;
  id v9;
  void *v10;
  char v11;

  v8 = a6;
  if (a5)
    v9 = -[TSDDefaultPartitioner p_nextHintForSize:previousHint:horizontally:](self, "p_nextHintForSize:previousHint:horizontally:", a5, a6, a3.width, a3.height);
  else
    v9 = -[TSDDefaultPartitioner p_firstHintForSize:](self, "p_firstHintForSize:", a4, a3.width, a3.height);
  v10 = v9;
  if (a7)
  {
    if (v9)
      v11 = objc_msgSend(v9, "isLastPartitionHorizontally:", v8);
    else
      v11 = 1;
    *a7 = v11;
  }
  return v10;
}

- (id)nextLayoutForSize:(CGSize)a3 parentLayout:(id)a4 previousHint:(id)a5 horizontally:(BOOL)a6 outFinished:(BOOL *)a7
{
  return -[TSDDefaultPartitioner layoutForHint:parentLayout:](self, "layoutForHint:parentLayout:", -[TSDDefaultPartitioner nextHintForSize:parentLayout:previousHint:horizontally:outFinished:](self, "nextHintForSize:parentLayout:previousHint:horizontally:outFinished:", a4, a5, a6, a7, a3.width, a3.height), a4);
}

- (id)documentRoot
{
  return 0;
}

- (id)i_layout
{
  id result;

  result = self->mLayout;
  if (!result)
  {
    -[TSDDefaultPartitioner p_generateLayouts](self, "p_generateLayouts");
    return self->mLayout;
  }
  return result;
}

- (id)i_repForCanvas:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[TSUPointerKeyDictionary objectForKey:](self->mMainRepsByCanvas, "objectForKey:");
  if (!v5)
  {
    v6 = -[TSDDefaultPartitioner i_layout](self, "i_layout");
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "repClassOverride")), "initWithLayout:canvas:", v6, a3);
    objc_msgSend(v5, "updateChildrenFromLayout");
    objc_msgSend(v5, "recursivelyPerformSelector:", sel_updateFromLayout);
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mMainRepsByCanvas, "setObject:forUncopiedKey:", v5, a3);

  }
  return v5;
}

- (CGImage)i_cachedImageForCanvas:(id)a3
{
  return (CGImage *)-[TSUPointerKeyDictionary objectForKey:](self->mCachedImagesByCanvas, "objectForKey:", a3);
}

- (void)i_setCachedImage:(CGImage *)a3 forCanvas:(id)a4
{
  -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mCachedImagesByCanvas, "setObject:forUncopiedKey:", a3, a4);
}

- (void)i_removeCachedImageForCanvas:(id)a3
{
  -[TSUPointerKeyDictionary removeObjectForKey:](self->mCachedImagesByCanvas, "removeObjectForKey:", a3);
}

- (void)i_registerPartialRep:(id)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "canvas");
  v6 = (id)-[TSUPointerKeyDictionary objectForKey:](self->mPartialRepsByCanvas, "objectForKey:", v5);
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mPartialRepsByCanvas, "setObject:forUncopiedKey:", v6, v5);

  }
  objc_msgSend(v6, "addObject:", a3);
}

- (void)i_unregisterPartialRep:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "canvas");
  v6 = (void *)-[TSUPointerKeyDictionary objectForKey:](self->mPartialRepsByCanvas, "objectForKey:", v5);
  if ((objc_msgSend(v6, "containsObject:", a3) & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDefaultPartitioner i_unregisterPartialRep:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 223, CFSTR("Unregistering unregistered rep %@"), a3);
  }
  objc_msgSend(v6, "removeObject:", a3);
  if (!objc_msgSend(v6, "count"))
  {
    -[TSUPointerKeyDictionary removeObjectForKey:](self->mPartialRepsByCanvas, "removeObjectForKey:", v5);
    objc_msgSend((id)-[TSUPointerKeyDictionary objectForKey:](self->mMainRepsByCanvas, "objectForKey:", v5), "recursivelyPerformSelector:", sel_i_willBeRemoved);
    -[TSUPointerKeyDictionary removeObjectForKey:](self->mMainRepsByCanvas, "removeObjectForKey:", v5);
    -[TSUPointerKeyDictionary removeObjectForKey:](self->mCachedImagesByCanvas, "removeObjectForKey:", v5);
    if (!-[TSUPointerKeyDictionary count](self->mMainRepsByCanvas, "count"))
      -[TSDDefaultPartitioner p_teardownLayouts](self, "p_teardownLayouts");
  }
}

- (void)p_generateLayouts
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  TSDInfo *mInfo;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->mLayout)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDefaultPartitioner p_generateLayouts]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 244, CFSTR("Can not generate layouts when they’re already present."));
  }
  self->mCanvas = objc_alloc_init(TSDCanvas);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  mInfo = self->mInfo;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self->mInfo);
    if (-[TSDInfo connectedFrom](mInfo, "connectedFrom"))
      objc_msgSend(v7, "addObject:", -[TSDInfo connectedFrom](mInfo, "connectedFrom"));
    if (-[TSDInfo connectedTo](mInfo, "connectedTo"))
      objc_msgSend(v7, "addObject:", -[TSDInfo connectedTo](mInfo, "connectedTo"));
  }
  else
  {
    v8[0] = self->mInfo;
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  }
  -[TSDLayoutController setInfos:](-[TSDCanvas layoutController](self->mCanvas, "layoutController"), "setInfos:", v7);
  -[TSDLayoutController validateLayouts](-[TSDCanvas layoutController](self->mCanvas, "layoutController"), "validateLayouts");
  self->mLayout = (TSDLayout *)-[TSDLayoutController validatedLayoutForInfo:](-[TSDCanvas layoutController](self->mCanvas, "layoutController"), "validatedLayoutForInfo:", self->mInfo);
}

- (void)p_teardownLayouts
{

  self->mLayout = 0;
  -[TSDCanvas teardown](self->mCanvas, "teardown");

  self->mCanvas = 0;
}

- (id)p_firstHintForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  v4 = TSDRectWithSize();
  return -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:"), v4, v5, v6, v7);
}

- (id)p_nextHintForSize:(CGSize)a3 previousHint:(id)a4 horizontally:(BOOL)a5
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  TSDDefaultHint *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double MaxX;
  double MinY;
  double v37;
  double v38;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  objc_opt_class();
  v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDDefaultPartitioner p_nextHintForSize:previousHint:horizontally:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultPartitioner.m"), 296, CFSTR("invalid nil value for '%s'"), "previousDefaultHint");
  }
  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if ((objc_msgSend(v9, "isLastPartitionHorizontally:", v5) & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v40 = width;
    v41 = height;
    objc_msgSend(v9, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = v13;
    v30 = v15;
    v31 = v17;
    v32 = v19;
    if (v5)
    {
      v33 = CGRectGetWidth(*(CGRect *)&v29);
      v42.origin.x = v22;
      v42.origin.y = v24;
      v42.size.width = v26;
      v42.size.height = v28;
      v34 = fmin(v33 - CGRectGetMaxX(v42), v40);
      v43.origin.x = v22;
      v43.origin.y = v24;
      v43.size.width = v26;
      v43.size.height = v28;
      MaxX = CGRectGetMaxX(v43);
      v44.origin.x = v22;
      v44.origin.y = v24;
      v44.size.width = v26;
      v44.size.height = v28;
      MinY = CGRectGetMinY(v44);
      v45.origin.x = v22;
      v45.origin.y = v24;
      v45.size.width = v26;
      v45.size.height = v28;
      v37 = CGRectGetHeight(v45);
    }
    else
    {
      v38 = CGRectGetHeight(*(CGRect *)&v29);
      v46.origin.x = v22;
      v46.origin.y = v24;
      v46.size.width = v26;
      v46.size.height = v28;
      v37 = fmin(v38 - CGRectGetMaxY(v46), v41);
      v47.origin.x = v22;
      v47.origin.y = v24;
      v47.size.width = v26;
      v47.size.height = v28;
      MaxX = CGRectGetMinX(v47);
      v48.origin.x = v22;
      v48.origin.y = v24;
      v48.size.width = v26;
      v48.size.height = v28;
      MinY = CGRectGetMaxY(v48);
      v49.origin.x = v22;
      v49.origin.y = v24;
      v49.size.width = v26;
      v49.size.height = v28;
      v34 = CGRectGetWidth(v49);
    }
    v20 = -[TSDDefaultHint initWithBounds:edges:]([TSDDefaultHint alloc], "initWithBounds:edges:", -[TSDDefaultPartitioner p_edgesForHintBounds:](self, "p_edgesForHintBounds:", MaxX, MinY, v34, v37), MaxX, MinY, v34, v37);
  }
  return v20;
}

- (unint64_t)p_edgesForHintBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double MaxX;
  uint64_t v15;
  unint64_t v16;
  double MaxY;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_msgSend(-[TSDDefaultPartitioner i_layout](self, "i_layout"), "geometry"), "frame");
  v8 = v7;
  v21 = v9;
  v22 = v7;
  v10 = v9;
  v19 = v12;
  v20 = v11;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v13 = fabs(CGRectGetMinX(v23)) < 0.00999999978;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v20;
  v25.size.height = v19;
  if (vabdd_f64(MaxX, CGRectGetWidth(v25)) >= 0.00999999978)
    v15 = 2 * v13;
  else
    v15 = (2 * v13) | 8;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v16 = v15 | (fabs(CGRectGetMinY(v26)) < 0.00999999978);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v28.origin.y = v21;
  v28.origin.x = v22;
  v28.size.width = v20;
  v28.size.height = v19;
  if (vabdd_f64(MaxY, CGRectGetHeight(v28)) >= 0.00999999978)
    return v16;
  else
    return v16 | 4;
}

@end
