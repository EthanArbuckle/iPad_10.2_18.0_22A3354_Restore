@implementation PXInsetLayoutPerformer

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
  v11.super_class = (Class)&OBJC_METACLASS___PXInsetLayoutPerformer;
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
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _OWORD v13[4];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  CGSize result;

  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInsetLayoutPerformer children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInsetLayoutPerformer layoutInsets](self, "layoutInsets");
  PXEdgeInsetsInsetRect();
  v6 = v5;
  v8 = v7;
  v13[2] = v17;
  v13[3] = v18;
  v14 = v19;
  v13[0] = v15;
  v13[1] = v16;
  PXPerformChildrenLayout(v4, (uint64_t)v13, v3, v9, v10, v5, v7);

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)prepareForReuse
{
  -[PXInsetLayoutPerformer setLayoutInsets:](self, "setLayoutInsets:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (NSArray)children
{
  return self->children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->children, a3);
}

- (UIEdgeInsets)layoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutInsets.top;
  left = self->_layoutInsets.left;
  bottom = self->_layoutInsets.bottom;
  right = self->_layoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutInsets:(UIEdgeInsets)a3
{
  self->_layoutInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->children, 0);
}

@end
