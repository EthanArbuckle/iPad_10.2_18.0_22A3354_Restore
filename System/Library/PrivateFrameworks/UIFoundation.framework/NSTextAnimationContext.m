@implementation NSTextAnimationContext

- (NSTextRange)enclosingTextRange
{
  NSTextAnimationContext *v2;
  NSTextRange *enclosingTextRange;
  NSTextRange *v4;
  NSTextRange *v5;

  v2 = self;
  objc_sync_enter(v2);
  enclosingTextRange = v2->_enclosingTextRange;
  if (enclosingTextRange)
    v4 = enclosingTextRange;
  else
    v4 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v2->_enclosingLocation, v2->_enclosingEndLocation);
  v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

- (NSTextRange)_unionTextRange
{
  NSTextAnimationContext *v2;
  NSTextRange *v3;
  void *unionTextRange;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSTextRange *v9;
  uint64_t v10;
  NSTextRange *v11;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_unionTextRange)
  {
    if (-[NSArray count](v2->_textRanges, "count") < 2)
    {
      -[NSArray firstObject](v2->_textRanges, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      unionTextRange = v2->_unionTextRange;
      v2->_unionTextRange = (NSTextRange *)v10;
    }
    else
    {
      v3 = [NSTextRange alloc];
      -[NSArray firstObject](v2->_textRanges, "firstObject");
      unionTextRange = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(unionTextRange, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](v2->_textRanges, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSTextRange initWithLocation:endLocation:](v3, "initWithLocation:endLocation:", v5, v7);
      v9 = v2->_unionTextRange;
      v2->_unionTextRange = (NSTextRange *)v8;

    }
  }
  v11 = v2->_unionTextRange;
  objc_sync_exit(v2);

  return v11;
}

- (BOOL)_hasRenderableComponentsForRange:(id)a3
{
  id v4;
  NSTextAnimationContext *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  int v12;
  NSArray *textRanges;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v25;
  int v26;
  void *v27;
  char v28;
  NSArray *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = 40;
  if (!v5->_inSnapshot)
    v6 = 80;
  v7 = *(uint64_t *)((char *)&v5->super.isa + v6);
  v8 = 48;
  if (!v5->_inSnapshot)
    v8 = 88;
  v9 = *(uint64_t *)((char *)&v5->super.isa + v8);
  v10 = v9 != 0;
  if (v7 | v9
    && (-[NSTextAnimationContext enclosingTextRange](v5, "enclosingTextRange"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "intersectsWithTextRange:", v4),
        v11,
        v12))
  {
    textRanges = v5->_textRanges;
    v14 = 1;
    if (textRanges && (v7 != 0) != (v9 != 0))
    {
      if (-[NSArray count](textRanges, "count") < 2)
      {
        -[NSArray firstObject](v5->_textRanges, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "intersectsWithTextRange:", v4);

        v14 = v9 != 0;
        if (v26)
        {
          -[NSArray firstObject](v5->_textRanges, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "containsRange:", v4);

LABEL_27:
          if (v7)
            v14 = 1;
          else
            v14 = v28 ^ 1;
        }
      }
      else
      {
        -[NSTextAnimationContext _unionTextRange](v5, "_unionTextRange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "intersectsWithTextRange:", v4);

        if (v16)
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          obj = v5->_textRanges;
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v31;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v31 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                if (objc_msgSend(v20, "intersectsWithTextRange:", v4))
                {
                  v28 = objc_msgSend(v20, "containsRange:", v4);

                  goto LABEL_27;
                }
                objc_msgSend(v4, "endLocation");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "location");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "compare:", v22) == -1;

                if (!v23)
                  goto LABEL_20;
              }
              v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_20:

        }
        v14 = v10;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  objc_sync_exit(v5);

  return v14;
}

- (void)_contentsReplaced
{
  NSArray *textRanges;
  NSTextRange *unionTextRange;
  NSTextAnimationContext *obj;

  obj = self;
  objc_sync_enter(obj);
  textRanges = obj->_textRanges;
  obj->_textRanges = 0;

  unionTextRange = obj->_unionTextRange;
  obj->_unionTextRange = 0;

  objc_sync_exit(obj);
}

- (NSTextAnimationContext)initWithTextLayoutManager:(id)a3 textRanges:(id)a4
{
  id v6;
  id v7;
  NSTextAnimationContext *v8;
  NSTextAnimationContext *v9;
  uint64_t v10;
  NSTextRange *enclosingTextRange;
  id WeakRetained;
  int v13;
  NSTextAnimationContext *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NSTextAnimationContext;
  v8 = -[NSTextAnimationContext init](&v16, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_3;
  objc_storeWeak((id *)&v8->_textLayoutManager, v6);
  objc_storeStrong((id *)&v9->_textRanges, a4);
  -[NSTextAnimationContext _unionTextRange](v9, "_unionTextRange");
  v10 = objc_claimAutoreleasedReturnValue();
  enclosingTextRange = v9->_enclosingTextRange;
  v9->_enclosingTextRange = (NSTextRange *)v10;

  *(_OWORD *)&v9->_components = xmmword_18D6CC190;
  WeakRetained = objc_loadWeakRetained((id *)&v9->_textLayoutManager);
  v13 = objc_msgSend(WeakRetained, "_addTextAnimationContext:", v9);

  if (!v13)
    v14 = 0;
  else
LABEL_3:
    v14 = v9;

  return v14;
}

- (BOOL)_updateEnclosingLocation:(id)a3 endLocation:(id)a4
{
  id v7;
  id v8;
  NSTextAnimationContext *v9;
  NSTextRange *v10;
  NSTextRange *enclosingTextRange;
  NSTextRange *v12;
  BOOL v13;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_enclosingTextRange;
  if (v7 && (objc_msgSend(v7, "isEqual:", v9->_enclosingLocation) & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_enclosingLocation, a3);
    enclosingTextRange = v9->_enclosingTextRange;
    v9->_enclosingTextRange = 0;

  }
  if (v8 && (objc_msgSend(v8, "isEqual:", v9->_enclosingEndLocation) & 1) == 0)
  {
    objc_storeStrong((id *)&v9->_enclosingEndLocation, a4);
    v12 = v9->_enclosingTextRange;
    v9->_enclosingTextRange = 0;

  }
  v13 = v9->_enclosingTextRange != v10;

  objc_sync_exit(v9);
  return v13;
}

- (void)_endAnimationContext:(int64_t)a3
{
  id WeakRetained;
  NSArray *textRanges;
  void (**v7)(id, NSTextAnimationContext *, BOOL);

  -[NSTextAnimationContext completionHandler](self, "completionHandler");
  v7 = (void (**)(id, NSTextAnimationContext *, BOOL))objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, self, a3 == 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  objc_msgSend(WeakRetained, "_removeTextAnimationContext:", self);

  textRanges = self->_textRanges;
  self->_textRanges = 0;

  objc_storeWeak((id *)&self->_textLayoutManager, 0);
}

- (void)finalizeAnimation
{
  -[NSTextAnimationContext _endAnimationContext:](self, "_endAnimationContext:", 0);
}

- (void)_overridden
{
  -[NSTextAnimationContext _endAnimationContext:](self, "_endAnimationContext:", 1);
}

- (void)_invalidated
{
  -[NSTextAnimationContext _endAnimationContext:](self, "_endAnimationContext:", 2);
}

- (CGRect)presentationLayoutFragmentFrameForTextLayoutFragment:(id)a3 proposedOrigin:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double (**presentationSizeProvider)(id, NSTextAnimationContext *, id, __n128, __n128);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  y = a4.y;
  x = a4.x;
  presentationSizeProvider = (double (**)(id, NSTextAnimationContext *, id, __n128, __n128))self->_presentationSizeProvider;
  if (presentationSizeProvider)
  {
    x = presentationSizeProvider[2](presentationSizeProvider, self, a3, (__n128)a4, *(__n128 *)&a4.y);
    y = v10;
  }
  else
  {
    objc_msgSend(a3, "layoutFragmentFrame");
  }
  v11 = x;
  v12 = y;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)_effectiveComponents
{
  uint64_t v2;

  v2 = 40;
  if (!self->_inSnapshot)
    v2 = 80;
  return *(unint64_t *)((char *)&self->super.isa + v2);
}

- (unint64_t)_effectiveExclusiveComponents
{
  uint64_t v2;

  v2 = 48;
  if (!self->_inSnapshot)
    v2 = 88;
  return *(unint64_t *)((char *)&self->super.isa + v2);
}

- (void)snapshotWithComponents:(unint64_t)a3 exclusiveComponents:(unint64_t)a4 usingBlock:(id)a5
{
  NSTextAnimationContext *v8;
  unint64_t snapshotExclusiveComponents;
  unint64_t snapshotComponents;
  BOOL inSnapshot;
  id WeakRetained;
  void (**v13)(id, NSTextAnimationContext *);

  v13 = (void (**)(id, NSTextAnimationContext *))a5;
  v8 = self;
  objc_sync_enter(v8);
  snapshotComponents = v8->_snapshotComponents;
  snapshotExclusiveComponents = v8->_snapshotExclusiveComponents;
  inSnapshot = v8->_inSnapshot;
  v8->_snapshotComponents = a3;
  v8->_snapshotExclusiveComponents = a4;
  v8->_inSnapshot = 1;
  WeakRetained = objc_loadWeakRetained((id *)&v8->_textLayoutManager);
  objc_msgSend(WeakRetained, "ensureLayoutForRange:", v8->_enclosingTextRange);

  v13[2](v13, v8);
  v8->_snapshotComponents = snapshotComponents;
  v8->_snapshotExclusiveComponents = snapshotExclusiveComponents;
  v8->_inSnapshot = inSnapshot;
  objc_sync_exit(v8);

}

uint64_t __80__NSTextAnimationContext_snapshotWithComponents_exclusiveComponents_usingBlock___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exception in snapshot handler"));
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeakRetained((id *)&self->_textLayoutManager);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (unint64_t)components
{
  return self->_components;
}

- (void)setComponents:(unint64_t)a3
{
  self->_components = a3;
}

- (unint64_t)componentsForExclusiveRange
{
  return self->_componentsForExclusiveRange;
}

- (void)setComponentsForExclusiveRange:(unint64_t)a3
{
  self->_componentsForExclusiveRange = a3;
}

- (NSArray)textRanges
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (id)presentationSizeProvider
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setPresentationSizeProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (id)snapshotAttributeOverrides
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setSnapshotAttributeOverrides:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_snapshotAttributeOverrides, 0);
  objc_storeStrong(&self->_presentationSizeProvider, 0);
  objc_storeStrong((id *)&self->_textRanges, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_textLayoutManager);
  objc_storeStrong((id *)&self->_unionTextRange, 0);
  objc_storeStrong((id *)&self->_enclosingTextRange, 0);
  objc_storeStrong((id *)&self->_enclosingEndLocation, 0);
  objc_storeStrong((id *)&self->_enclosingLocation, 0);
}

@end
