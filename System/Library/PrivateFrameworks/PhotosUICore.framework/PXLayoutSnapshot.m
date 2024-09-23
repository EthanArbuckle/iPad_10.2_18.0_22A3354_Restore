@implementation PXLayoutSnapshot

- (PXLayoutSnapshot)init
{

  return 0;
}

- (PXLayoutSnapshot)initWithContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PXLayoutSnapshot *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PXLayoutSnapshot;
  result = -[PXLayoutSnapshot init](&v8, sel_init);
  if (result)
  {
    result->_contentRect.origin.x = x;
    result->_contentRect.origin.y = y;
    result->_contentRect.size.width = width;
    result->_contentRect.size.height = height;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)PXLayoutSnapshot;
  -[PXLayoutSnapshot description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLayoutSnapshot contentRect](self, "contentRect");
  NSStringFromCGRect(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("contentRect:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_PXLayoutGeometry)geometryForItem:(SEL)a3
{
  void *v7;
  _PXLayoutGeometry *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXLayoutSnapshot.m"), 36, CFSTR("-geometryForItem: must be overidden"));

  v9 = *((_OWORD *)off_1E50B8498 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E50B8498 + 6);
  *(_OWORD *)&retstr->var6.origin.y = v9;
  *(_OWORD *)&retstr->var6.size.height = *((_OWORD *)off_1E50B8498 + 8);
  retstr->var7.height = *((CGFloat *)off_1E50B8498 + 18);
  v10 = *((_OWORD *)off_1E50B8498 + 3);
  *(_OWORD *)&retstr->var2.height = *((_OWORD *)off_1E50B8498 + 2);
  *(_OWORD *)&retstr->var3.b = v10;
  v11 = *((_OWORD *)off_1E50B8498 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E50B8498 + 4);
  *(_OWORD *)&retstr->var3.ty = v11;
  v12 = *((_OWORD *)off_1E50B8498 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E50B8498;
  *(_OWORD *)&retstr->var1.y = v12;
  return result;
}

- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutSnapshot.m"), 41, CFSTR("-enumerateGeometriesForItemsInRect:usingBlock: must be overidden"));

}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXLayoutEngineDataSourceSnapshot)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (void)setDataSourceSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
}

@end
