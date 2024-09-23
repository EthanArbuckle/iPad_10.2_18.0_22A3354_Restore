@implementation PXIdentityLayoutPerformer

+ (CGSize)performLayoutWithLayoutInput:(id *)a3 layoutOutput:(id)a4 usingBlock:(id)a5
{
  __int128 v5;
  CGSize size;
  double v7;
  double v8;
  _OWORD v9[4];
  int64_t var3;
  objc_super v11;
  CGSize result;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PXIdentityLayoutPerformer;
  v5 = *(_OWORD *)&a3->var2.var1;
  v9[2] = *(_OWORD *)&a3->var1;
  v9[3] = v5;
  var3 = a3->var2.var3;
  size = a3->var0.size;
  v9[0] = a3->var0.origin;
  v9[1] = size;
  objc_msgSendSuper2(&v11, sel_performLayoutWithLayoutInput_layoutOutput_usingBlock_, v9, a4, a5);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)performLayout
{
  void *v3;
  void *v4;
  unsigned __int128 v5;
  double v6;
  double v7;
  _OWORD v8[4];
  uint64_t v9;
  __int128 v10;
  unsigned __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CGSize result;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXIdentityLayoutPerformer children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v12;
  v8[3] = v13;
  v9 = v14;
  v8[0] = v10;
  v8[1] = v11;
  PXPerformChildrenLayout(v4, (uint64_t)v8, v3, *(double *)&v10, *((double *)&v10 + 1), *(double *)&v11, *((double *)&v11 + 1));
  v5 = v11;

  *(_QWORD *)&v7 = v5 >> 64;
  *(_QWORD *)&v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSArray)children
{
  return self->children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->children, 0);
}

@end
