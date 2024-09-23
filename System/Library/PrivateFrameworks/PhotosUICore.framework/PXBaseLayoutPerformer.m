@implementation PXBaseLayoutPerformer

+ (CGSize)performLayoutWithLayoutInput:(id *)a3 layoutOutput:(id)a4 usingBlock:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  PXLayoutPerformerCacheEntry *v11;
  id v12;
  void *v13;
  __int128 v14;
  CGSize size;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _OWORD v23[4];
  int64_t var3;
  CGSize result;

  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (performLayoutWithLayoutInput_layoutOutput_usingBlock__onceToken != -1)
    dispatch_once(&performLayoutWithLayoutInput_layoutOutput_usingBlock__onceToken, &__block_literal_global_33170);
  objc_msgSend((id)performLayoutWithLayoutInput_layoutOutput_usingBlock__performerCache, "objectForKey:", a1);
  v11 = (PXLayoutPerformerCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(PXLayoutPerformerCacheEntry);
    v12 = objc_alloc_init((Class)a1);
    -[PXLayoutPerformerCacheEntry setPerformer:](v11, "setPerformer:", v12);

    -[PXLayoutPerformerCacheEntry setReentryCount:](v11, "setReentryCount:", 0);
    objc_msgSend((id)performLayoutWithLayoutInput_layoutOutput_usingBlock__performerCache, "setObject:forKey:", v11, a1);
  }
  if (-[PXLayoutPerformerCacheEntry reentryCount](v11, "reentryCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXBaseLayoutPerformer.m"), 49, CFSTR("PXLayoutPerformer does not currently support reentering"));

  }
  -[PXLayoutPerformerCacheEntry setReentryCount:](v11, "setReentryCount:", -[PXLayoutPerformerCacheEntry reentryCount](v11, "reentryCount") + 1);
  -[PXLayoutPerformerCacheEntry performer](v11, "performer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prepareForReuse");
  v14 = *(_OWORD *)&a3->var2.var1;
  v23[2] = *(_OWORD *)&a3->var1;
  v23[3] = v14;
  var3 = a3->var2.var3;
  size = a3->var0.size;
  v23[0] = a3->var0.origin;
  v23[1] = size;
  objc_msgSend(v13, "setLayoutInput:", v23);
  objc_msgSend(v13, "setLayoutOutput:", v9);
  v10[2](v10, v13);
  objc_msgSend(v13, "performLayout");
  v17 = v16;
  v19 = v18;
  -[PXLayoutPerformerCacheEntry setReentryCount:](v11, "setReentryCount:", -[PXLayoutPerformerCacheEntry reentryCount](v11, "reentryCount") - 1);

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

void __78__PXBaseLayoutPerformer_performLayoutWithLayoutInput_layoutOutput_usingBlock___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)performLayoutWithLayoutInput_layoutOutput_usingBlock__performerCache;
  performLayoutWithLayoutInput_layoutOutput_usingBlock__performerCache = (uint64_t)v0;

}

- (CGSize)performLayout
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBaseLayoutPerformer.m"), 64, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXBaseLayoutPerformer performLayout]", v6);

  abort();
}

- (NSArray)children
{
  return self->children;
}

- (PXLayoutPerformerOutput)layoutOutput
{
  return self->layoutOutput;
}

- (void)setLayoutOutput:(id)a3
{
  objc_storeStrong((id *)&self->layoutOutput, a3);
}

- ($FCB1BE82783D26D31A14EDA92AE53F2D)layoutInput
{
  CGSize v3;
  CGPoint origin;

  v3 = *(CGSize *)&self->var2.var0;
  origin = self[1].var0.origin;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&self->var2.var2;
  *(CGPoint *)&retstr->var2.var1 = origin;
  retstr->var2.var3 = *(_QWORD *)&self[1].var0.size.width;
  retstr->var0.origin = *(CGPoint *)&self->var0.size.height;
  retstr->var0.size = v3;
  return self;
}

- (void)setLayoutInput:(id *)a3
{
  CGSize size;
  __int128 v4;
  __int128 v5;

  self->layoutInput.layoutRect.origin = a3->var0.origin;
  size = a3->var0.size;
  v4 = *(_OWORD *)&a3->var1;
  v5 = *(_OWORD *)&a3->var2.var1;
  self->layoutInput.layoutAttributes.layoutOrientation = a3->var2.var3;
  *(_OWORD *)&self->layoutInput.layoutAttributes.layoutDirection = v5;
  *(_OWORD *)&self->layoutInput.onlyCalculateSize = v4;
  self->layoutInput.layoutRect.size = size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->layoutOutput, 0);
  objc_storeStrong((id *)&self->children, 0);
}

@end
