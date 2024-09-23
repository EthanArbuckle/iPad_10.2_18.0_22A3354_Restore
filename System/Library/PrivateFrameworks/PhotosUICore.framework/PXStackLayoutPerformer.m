@implementation PXStackLayoutPerformer

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
  v11.super_class = (Class)&OBJC_METACLASS___PXStackLayoutPerformer;
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
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput", 0, 0, 0, 0);
  -[PXStackLayoutPerformer _calculateSizeForLayout](self, "_calculateSizeForLayout");
  v4 = v3;
  v6 = v5;
  -[PXStackLayoutPerformer _performLayoutPass](self, "_performLayoutPass");
  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)prepareForReuse
{
  double v3;
  double v4;

  -[PXStackLayoutPerformer setLayoutAxis:](self, "setLayoutAxis:", 0);
  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PXStackLayoutPerformer setInterItemSpacing:](self, "setInterItemSpacing:", *MEMORY[0x1E0C9D820], v4);
  -[PXStackLayoutPerformer setItemSize:](self, "setItemSize:", v3, v4);
}

- (CGSize)_calculateSizeForLayout
{
  void *v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  CGSize result;

  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput", 0, 0);
  -[PXStackLayoutPerformer children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  v6 = 0.0;
  v7 = -[PXStackLayoutPerformer layoutAxis](self, "layoutAxis");
  -[PXStackLayoutPerformer itemSize](self, "itemSize");
  v9 = v8;
  v11 = v10;
  -[PXStackLayoutPerformer interItemSpacing](self, "interItemSpacing");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v4, "count");
  if (v16 <= 1)
    v17 = 1;
  else
    v17 = v16;
  v18 = v17 - 1;
  switch(v7)
  {
    case 1:
      v5 = v15 * (double)v18 + v11 * (double)v16;
      break;
    case 2:
      v6 = v13 * (double)v18 + v9 * (double)v16;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStackLayoutPerformer.m"), 66, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v6 = *MEMORY[0x1E0C9D820];
      v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }

  v19 = v6;
  v20 = v5;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_performLayoutPass
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  -[PXBaseLayoutPerformer layoutInput](self, "layoutInput");
  -[PXBaseLayoutPerformer layoutOutput](self, "layoutOutput");
  objc_claimAutoreleasedReturnValue();
  -[PXStackLayoutPerformer children](self, "children");
  objc_claimAutoreleasedReturnValue();
  -[PXStackLayoutPerformer layoutAxis](self, "layoutAxis");
  -[PXStackLayoutPerformer interItemSpacing](self, "interItemSpacing");
  -[PXStackLayoutPerformer itemSize](self, "itemSize");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStackLayoutPerformer.m"), 99, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (NSArray)children
{
  return self->children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->children, a3);
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(int64_t)a3
{
  self->_layoutAxis = a3;
}

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->children, 0);
}

@end
