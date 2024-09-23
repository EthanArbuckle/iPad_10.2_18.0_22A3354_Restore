@implementation PXLayoutGeometryArray

- (PXLayoutGeometryArray)init
{
  return -[PXLayoutGeometryArray initWithGeometries:count:](self, "initWithGeometries:count:", 0, 0);
}

- (PXLayoutGeometryArray)initWithGeometries:(_PXLayoutGeometry *)a3 count:(unint64_t)a4
{
  PXLayoutGeometryArray *v7;
  uint64_t v8;
  unint64_t v9;
  _PXLayoutGeometry *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v20;
  objc_super v21;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLayoutGeometryArray.m"), 23, CFSTR("geometries is NULL"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PXLayoutGeometryArray;
  v7 = -[PXLayoutGeometryArray init](&v21, sel_init);
  if (v7)
  {
    v7->_geometries = (_PXLayoutGeometry *)malloc_type_malloc(152 * a4, 0x100004050011849uLL);
    if (a4)
    {
      v8 = 0;
      v9 = a4;
      do
      {
        v10 = &v7->_geometries[v8];
        v11 = *(_OWORD *)&a3[v8].var1.y;
        *(_OWORD *)&v10->var0 = *(_OWORD *)&a3[v8].var0;
        *(_OWORD *)&v10->var1.y = v11;
        v12 = *(_OWORD *)&a3[v8].var2.height;
        v13 = *(_OWORD *)&a3[v8].var3.b;
        v14 = *(_OWORD *)&a3[v8].var3.ty;
        *(_OWORD *)&v10->var3.d = *(_OWORD *)&a3[v8].var3.d;
        *(_OWORD *)&v10->var3.ty = v14;
        *(_OWORD *)&v10->var2.height = v12;
        *(_OWORD *)&v10->var3.b = v13;
        v15 = *(_OWORD *)&a3[v8].var5;
        v16 = *(_OWORD *)&a3[v8].var6.origin.y;
        v17 = *(_OWORD *)&a3[v8].var6.size.height;
        v10->var7.height = a3[v8].var7.height;
        *(_OWORD *)&v10->var6.origin.y = v16;
        *(_OWORD *)&v10->var6.size.height = v17;
        *(_OWORD *)&v10->var5 = v15;
        ++v8;
        --v9;
      }
      while (v9);
    }
    v7->_count = a4;
  }
  return v7;
}

- (void)dealloc
{
  _PXLayoutGeometry *geometries;
  objc_super v4;

  geometries = self->_geometries;
  if (geometries)
  {
    free(geometries);
    self->_geometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXLayoutGeometryArray;
  -[PXLayoutGeometryArray dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometries:count:", self->_geometries, self->_count);
}

- (_PXLayoutGeometry)geometryAtIndex:(SEL)a3
{
  _PXLayoutGeometry *v5;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v13;

  v5 = self;
  if (*(_QWORD *)&self->var1.y <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, v5, CFSTR("PXLayoutGeometryArray.m"), 48, CFSTR("index %ld out of bounds"), a4);

  }
  v7 = *(_QWORD *)&v5->var1.x + 152 * a4;
  v8 = *(_OWORD *)(v7 + 112);
  *(_OWORD *)&retstr->var5 = *(_OWORD *)(v7 + 96);
  *(_OWORD *)&retstr->var6.origin.y = v8;
  *(_OWORD *)&retstr->var6.size.height = *(_OWORD *)(v7 + 128);
  retstr->var7.height = *(CGFloat *)(v7 + 144);
  v9 = *(_OWORD *)(v7 + 48);
  *(_OWORD *)&retstr->var2.height = *(_OWORD *)(v7 + 32);
  *(_OWORD *)&retstr->var3.b = v9;
  v10 = *(_OWORD *)(v7 + 80);
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)(v7 + 64);
  *(_OWORD *)&retstr->var3.ty = v10;
  v11 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v7;
  *(_OWORD *)&retstr->var1.y = v11;
  return self;
}

- (unint64_t)count
{
  return self->_count;
}

@end
