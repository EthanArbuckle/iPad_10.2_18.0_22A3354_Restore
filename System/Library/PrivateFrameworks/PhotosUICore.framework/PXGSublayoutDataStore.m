@implementation PXGSublayoutDataStore

- (void)enumerateSublayoutsUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PXGSublayoutDataStore enumerateSublayoutsInRange:options:usingBlock:](self, "enumerateSublayoutsInRange:options:usingBlock:", 0, -[PXGSublayoutDataStore count](self, "count"), 0, v4);

}

- (void)enumerateSublayoutsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5;
  NSUInteger length;
  NSUInteger location;
  void (**v10)(id, uint64_t, void *, _BYTE *);
  uint64_t v11;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *v12;
  uint64_t v13;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *v14;
  void *v15;
  char v16;

  v5 = a4;
  length = a3.length;
  location = a3.location;
  v10 = (void (**)(id, uint64_t, void *, _BYTE *))a5;
  if (location + length > -[PXGSublayoutDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(range) <= self.count"));

  }
  if ((v5 & 2) != 0)
    v11 = -1;
  else
    v11 = 1;
  v12 = -[PXGSublayoutDataStore infos](objc_retainAutorelease(self), "infos");
  v16 = 0;
  if (length)
  {
    if ((v5 & 2) != 0)
      v13 = location + length - 1;
    else
      v13 = location;
    v14 = &v12[v13];
    do
    {
      if (v14->var0)
      {
        v10[2](v10, v13, v14->var0, &v16);
        if (v16)
          break;
      }
      v13 += v11;
      v14 += v11;
      --length;
    }
    while (length);
  }

}

- (int64_t)count
{
  return self->_count;
}

- (id)sublayoutAtIndex:(int64_t)a3
{
  void *v7;

  if (a3 < 0 || -[PXGSublayoutDataStore count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < self.count"));

  }
  return (id)-[PXGSublayoutDataStore infos](objc_retainAutorelease(self), "infos")[16 * a3];
}

- ($70F8FB89805F9D8BAB6060F0E8A4CB7F)infos
{
  return self->_infos;
}

- ($06332BE312745A7AB8CCAAA06CB8ACFF)geometryForSublayout:(SEL)a3
{
  uint64_t v7;
  PXGSublayoutDataStore *v8;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  $06332BE312745A7AB8CCAAA06CB8ACFF *result;
  id v18;

  v18 = a4;
  v7 = -[PXGSublayoutDataStore count](self, "count");
  v8 = objc_retainAutorelease(self);
  v9 = -[PXGSublayoutDataStore infos](v8, "infos");
  if (v7 < 1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a3, v8, CFSTR("PXGSublayoutDataStore.m"), 194, CFSTR("couldn't find sublayout %@"), v18);

    abort();
  }
  v10 = 0;
  while (v9->var0 != v18)
  {
    ++v10;
    ++v9;
    if (v7 == v10)
      goto LABEL_5;
  }
  v12 = (uint64_t)(-[PXGSublayoutDataStore geometries](objc_retainAutorelease(v8), "geometries") + 136 * v10);
  v13 = *(_OWORD *)(v12 + 112);
  *(_OWORD *)&retstr->var5.var0.d = *(_OWORD *)(v12 + 96);
  *(_OWORD *)&retstr->var5.var0.ty = v13;
  retstr->var6 = *(double *)(v12 + 128);
  v14 = *(_OWORD *)(v12 + 48);
  retstr->var3 = *(CGSize *)(v12 + 32);
  *(_OWORD *)&retstr->var4.var0 = v14;
  v15 = *(_OWORD *)(v12 + 80);
  *(_OWORD *)&retstr->var4.var2 = *(_OWORD *)(v12 + 64);
  *(_OWORD *)&retstr->var5.var0.b = v15;
  v16 = *(_OWORD *)(v12 + 16);
  retstr->var0 = *(CGSize *)v12;
  *(_OWORD *)&retstr->var1 = v16;

  return result;
}

- ($06332BE312745A7AB8CCAAA06CB8ACFF)geometries
{
  return self->_geometries;
}

uint64_t __55__PXGSublayoutDataStore_spriteIndexOriginForSublayout___block_invoke(uint64_t result, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v4;

  if (*(void **)(result + 32) == a3)
  {
    *a4 = 1;
  }
  else
  {
    v4 = result;
    result = objc_msgSend(a3, "numberOfSprites");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) += result;
  }
  return result;
}

- (unsigned)spriteIndexOriginForSublayout:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PXGSublayoutDataStore_spriteIndexOriginForSublayout___block_invoke;
  v7[3] = &unk_1E512B2C0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[PXGSublayoutDataStore enumerateSublayoutsUsingBlock:](self, "enumerateSublayoutsUsingBlock:", v7);
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  PXGSublayoutDataStore *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;

  v6 = a3;
  -[PXGSublayoutDataStore _insertRange:](self, "_insertRange:", a4, 1);
  v7 = objc_retainAutorelease(self);
  v8 = (uint64_t)(-[PXGSublayoutDataStore geometries](v7, "geometries") + 136 * a4);
  objc_msgSend(v6, "contentSize");
  *(_QWORD *)(v8 + 32) = v9;
  *(_QWORD *)(v8 + 40) = v10;
  v11 = (id *)(-[PXGSublayoutDataStore infos](objc_retainAutorelease(v7), "infos") + 16 * a4);
  v12 = v6;
  if (*v11 != v12)
  {

    *v11 = v12;
  }

}

- (void)enumerateSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PXGSublayoutDataStore_enumerateSublayoutsInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E5127E60;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v12 = v9;
  v10 = v9;
  -[PXGSublayoutDataStore enumerateSublayoutGeometriesUsingBlock:](self, "enumerateSublayoutGeometriesUsingBlock:", v11);

}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  PXGSublayoutDataStore *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _OWORD *v11;
  __int128 v12;
  id v13;

  length = a4.length;
  location = a4.location;
  v13 = a3;
  -[PXGSublayoutDataStore _insertRange:](self, "_insertRange:", location, length);
  v7 = objc_retainAutorelease(self);
  v8 = -[PXGSublayoutDataStore geometries](v7, "geometries");
  v9 = -[PXGSublayoutDataStore infos](objc_retainAutorelease(v7), "infos");
  if (length)
  {
    v10 = (_QWORD *)(v9 + 16 * location + 8);
    v11 = (_OWORD *)(v8 + 136 * location + 32);
    v12 = *(_OWORD *)off_1E50B8810;
    do
    {
      *v11 = v12;
      v11 = (_OWORD *)((char *)v11 + 136);
      *v10 = v13;
      v10 += 2;
      --length;
    }
    while (length);
  }

}

- (void)_insertRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  PXGSublayoutDataStore *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;

  length = a3.length;
  location = a3.location;
  if (a3.location > -[PXGSublayoutDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location <= self.count"));

  }
  -[PXGSublayoutDataStore setCount:](self, "setCount:", -[PXGSublayoutDataStore count](self, "count") + length);
  -[PXGSublayoutDataStore count](self, "count");
  _PXGArrayInsertRange();
  -[PXGSublayoutDataStore count](self, "count");
  _PXGArrayInsertRange();
  v7 = objc_retainAutorelease(self);
  v8 = -[PXGSublayoutDataStore geometries](v7, "geometries");
  v9 = -[PXGSublayoutDataStore infos](objc_retainAutorelease(v7), "infos");
  if (length)
  {
    v10 = (_QWORD *)(v9 + 16 * location);
    v11 = v8 + 136 * location + 72;
    v12 = *(_OWORD *)off_1E50B8308;
    v13 = *((_QWORD *)off_1E50B8308 + 2);
    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(_OWORD *)off_1E50B8368;
    v16 = *((_OWORD *)off_1E50B8368 + 1);
    v17 = *((_OWORD *)off_1E50B8368 + 2);
    v18 = *((_QWORD *)off_1E50B8368 + 6);
    do
    {
      *(_WORD *)(v11 - 48) = 0;
      *(_QWORD *)(v11 - 56) = 0x3FF0000000000000;
      *(_OWORD *)(v11 - 24) = v12;
      *(_QWORD *)(v11 - 8) = v13;
      *(_OWORD *)(v11 - 40) = v14;
      *(_OWORD *)v11 = v15;
      *(_OWORD *)(v11 + 16) = v16;
      *(_OWORD *)(v11 + 32) = v17;
      *(_QWORD *)(v11 + 48) = v18;
      *(_QWORD *)(v11 + 56) = 0;
      *v10 = 0;
      v10[1] = 0;
      v10 += 2;
      v11 += 136;
      --length;
    }
    while (length);
  }
}

- (void)setCount:(int64_t)a3
{
  int64_t capacity;

  if (self->_count != a3)
  {
    self->_count = a3;
    capacity = self->_capacity;
    if (capacity < a3)
    {
      if (capacity)
      {
        do
          capacity *= 2;
        while (capacity < a3);
      }
      else
      {
        capacity = a3;
      }
      self->_capacity = capacity;
      _PXGArrayResize();
      _PXGArrayResize();
    }
    -[PXGSublayoutDataStore _invalidateVersion](self, "_invalidateVersion");
  }
}

- (void)_invalidateVersion
{
  signed int v2;

  do
    v2 = __ldaxr((unsigned int *)&VersionMakeUnique_lastVersion);
  while (__stlxr(v2 + 1, (unsigned int *)&VersionMakeUnique_lastVersion));
  self->_version = v2;
}

- (void)enumerateSublayoutGeometriesUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PXGSublayoutDataStore enumerateSublayoutGeometriesInRange:options:usingBlock:](self, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, -[PXGSublayoutDataStore count](self, "count"), 0, v4);

}

- (void)enumerateSublayoutGeometriesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5;
  NSUInteger length;
  NSUInteger location;
  void (**v10)(id, uint64_t, uint64_t, uint64_t, _BYTE *);
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  PXGSublayoutDataStore *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  NSRange v20;

  v5 = a4;
  length = a3.length;
  location = a3.location;
  v10 = (void (**)(id, uint64_t, uint64_t, uint64_t, _BYTE *))a5;
  if (location + length > -[PXGSublayoutDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20.location = location;
    v20.length = length;
    NSStringFromRange(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 264, CFSTR("range out of bounds %@ 0..%li"), v18, -[PXGSublayoutDataStore count](self, "count"));

    if (!length)
      goto LABEL_12;
  }
  else if (!length)
  {
    goto LABEL_12;
  }
  v11 = (v5 & 2) == 0;
  if ((v5 & 2) != 0)
    v12 = location + length - 1;
  else
    v12 = location;
  if (v11)
    v13 = 1;
  else
    v13 = -1;
  v14 = objc_retainAutorelease(self);
  v15 = (uint64_t)(-[PXGSublayoutDataStore geometries](v14, "geometries") + 136 * v12);
  v16 = (uint64_t)(-[PXGSublayoutDataStore infos](objc_retainAutorelease(v14), "infos") + 16 * v12);
  v19 = 0;
  do
  {
    v10[2](v10, v12, v15, v16, &v19);
    if (v19)
      break;
    v12 += v13;
    v16 += 16 * v13;
    v15 += 136 * v13;
    --length;
  }
  while (length);
LABEL_12:

}

uint64_t __62__PXGSublayoutDataStore_enumerateSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, double *a3, _QWORD *a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t result;
  CGRect v11;

  v6 = a3[6];
  v7 = a3[7];
  v8 = a3[4];
  v9 = a3[5];
  v11.origin.x = v6;
  v11.origin.y = v7;
  v11.size.width = v8;
  v11.size.height = v9;
  result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v11);
  if ((_DWORD)result)
  {
    if (*a4)
      return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v6, v7, v8, v9);
  }
  return result;
}

- (int64_t)version
{
  return self->_version;
}

- (void)dealloc
{
  int64_t count;
  int64_t v4;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *infos;
  objc_super v6;

  count = self->_count;
  if (count >= 1)
  {
    v4 = 0;
    infos = self->_infos;
    do
    {
      if (infos->var0)
      {

        infos->var0 = 0;
        count = self->_count;
      }
      ++v4;
      ++infos;
    }
    while (v4 < count);
  }
  free(self->_geometries);
  free(self->_infos);
  v6.receiver = self;
  v6.super_class = (Class)PXGSublayoutDataStore;
  -[PXGSublayoutDataStore dealloc](&v6, sel_dealloc);
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *v7;
  NSUInteger v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length > -[PXGSublayoutDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(range) <= self.count"));

    if (!length)
      goto LABEL_7;
  }
  else if (!length)
  {
    goto LABEL_7;
  }
  v7 = &self->_infos[location];
  v8 = length;
  do
  {
    if (v7->var0)
    {

      v7->var0 = 0;
    }
    ++v7;
    --v8;
  }
  while (v8);
LABEL_7:
  -[PXGSublayoutDataStore count](self, "count");
  _PXGArrayRemoveRange();
  -[PXGSublayoutDataStore count](self, "count");
  _PXGArrayRemoveRange();
  -[PXGSublayoutDataStore setCount:](self, "setCount:", -[PXGSublayoutDataStore count](self, "count") - length);
}

- (void)moveSublayoutsFromIndexes:(__CFArray *)a3 toIndexes:(id)a4
{
  id v7;
  CFIndex Count;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  CFIndex i;
  const void *ValueAtIndex;
  int64_t v14;
  $06332BE312745A7AB8CCAAA06CB8ACFF *geometries;
  $06332BE312745A7AB8CCAAA06CB8ACFF *v16;
  $06332BE312745A7AB8CCAAA06CB8ACFF *v17;
  __int128 v18;
  CGSize var3;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a4;
  Count = CFArrayGetCount(a3);
  v9 = objc_msgSend(v7, "count");
  v10 = v9;
  if (Count < 1 || v9 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexesCount > 0 && toIndexesCount > 0"));

  }
  if (Count != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexesCount == toIndexesCount"));

  }
  if (!-[PXGSublayoutDataStore count](self, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.count != 0"));

  }
  v11 = -[PXGSublayoutDataStore count](self, "count");
  -[PXGSublayoutDataStore setCount:](self, "setCount:", -[PXGSublayoutDataStore count](self, "count") + v10);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (Count < 1)
  {
    v24 = &v29;
  }
  else
  {
    for (i = 0; i < Count; v30[3] = i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      v14 = v30[3] + v11;
      geometries = self->_geometries;
      v16 = &geometries[v14];
      v17 = &geometries[(_QWORD)ValueAtIndex];
      v18 = *(_OWORD *)&v17->var4.var2;
      v20 = *(_OWORD *)&v17->var1;
      var3 = v17->var3;
      *(_OWORD *)&v16->var4.var0 = *(_OWORD *)&v17->var4.var0;
      *(_OWORD *)&v16->var4.var2 = v18;
      *(_OWORD *)&v16->var1 = v20;
      v16->var3 = var3;
      v22 = *(_OWORD *)&v17->var5.var0.d;
      v21 = *(_OWORD *)&v17->var5.var0.ty;
      v23 = *(_OWORD *)&v17->var5.var0.b;
      v16->var6 = v17->var6;
      *(_OWORD *)&v16->var5.var0.d = v22;
      *(_OWORD *)&v16->var5.var0.ty = v21;
      *(_OWORD *)&v16->var5.var0.b = v23;
      v16->var0 = v17->var0;
      self->_infos[v14] = self->_infos[(_QWORD)ValueAtIndex];
      v24 = v30;
      i = v30[3] + 1;
    }
  }
  v24[3] = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PXGSublayoutDataStore_moveSublayoutsFromIndexes_toIndexes___block_invoke;
  v28[3] = &unk_1E5127E10;
  v28[6] = v11;
  v28[7] = v10;
  v28[4] = self;
  v28[5] = &v29;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v28);
  -[PXGSublayoutDataStore setCount:](self, "setCount:", -[PXGSublayoutDataStore count](self, "count") - v10);
  _Block_object_dispose(&v29, 8);

}

- (id)sublayoutProviderAtIndex:(int64_t)a3
{
  void *v7;

  if (a3 < 0 || -[PXGSublayoutDataStore count](self, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGSublayoutDataStore.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0 && index < self.count"));

  }
  return objc_retainAutoreleaseReturnValue((id)(-[PXGSublayoutDataStore infos](objc_retainAutorelease(self), "infos")
                                              + 16 * a3)[8]);
}

- (unsigned)spriteIndexOriginForSublayoutIndex:(int64_t)a3
{
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PXGSublayoutDataStore_spriteIndexOriginForSublayoutIndex___block_invoke;
  v5[3] = &unk_1E5127E38;
  v5[4] = &v6;
  v5[5] = a3;
  -[PXGSublayoutDataStore enumerateSublayoutsUsingBlock:](self, "enumerateSublayoutsUsingBlock:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateSublayoutsAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CGFloat v11;
  CGFloat v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PXGSublayoutDataStore_enumerateSublayoutsAtPoint_usingBlock___block_invoke;
  v9[3] = &unk_1E5127E88;
  v11 = x;
  v12 = y;
  v10 = v7;
  v8 = v7;
  -[PXGSublayoutDataStore enumerateSublayoutGeometriesUsingBlock:](self, "enumerateSublayoutGeometriesUsingBlock:", v9);

}

- (int64_t)indexOfSublayout:(id)a3
{
  id v4;
  uint64_t v5;
  $70F8FB89805F9D8BAB6060F0E8A4CB7F *v6;
  int64_t v7;

  v4 = a3;
  v5 = -[PXGSublayoutDataStore count](self, "count");
  v6 = -[PXGSublayoutDataStore infos](objc_retainAutorelease(self), "infos");
  if (v5 < 1)
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
    while (v6->var0 != v4)
    {
      ++v7;
      ++v6;
      if (v5 == v7)
        goto LABEL_5;
    }
  }

  return v7;
}

- (NSString)diagnosticDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXGSublayoutDataStore *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXGSublayoutDataStore count](self, "count");
  v8 = objc_retainAutorelease(self);
  v9 = -[PXGSublayoutDataStore geometries](v8, "geometries");
  v10 = -[PXGSublayoutDataStore infos](objc_retainAutorelease(v8), "infos");
  if (v7 >= 1)
  {
    v11 = (uint64_t *)v10;
    v12 = 0;
    v13 = v9 + 64;
    do
    {
      PXGPositionDescription();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGSize(*(CGSize *)(v13 - 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *v11;
      v17 = v11[1];
      v11 += 2;
      objc_msgSend(v6, "appendFormat:", CFSTR("\t%li:\tframe={%@, %@}\tspac=%0.1f\tsubl=%p\tprov=%p}\n"), v12, v14, v15, *(_QWORD *)(v13 + 64), v16, v17);

      ++v12;
      v13 += 136;
    }
    while (v7 != v12);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

uint64_t __63__PXGSublayoutDataStore_enumerateSublayoutsAtPoint_usingBlock___block_invoke(uint64_t a1, uint64_t a2, double *a3, _QWORD *a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t result;
  CGRect v11;

  v6 = a3[6];
  v7 = a3[7];
  v8 = a3[4];
  v9 = a3[5];
  v11.origin.x = v6;
  v11.origin.y = v7;
  v11.size.width = v8;
  v11.size.height = v9;
  result = CGRectContainsPoint(v11, *(CGPoint *)(a1 + 40));
  if ((_DWORD)result)
  {
    if (*a4)
      return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(v6, v7, v8, v9);
  }
  return result;
}

uint64_t __60__PXGSublayoutDataStore_spriteIndexOriginForSublayoutIndex___block_invoke(uint64_t result, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v4;

  if (*(_QWORD *)(result + 40) == a2)
  {
    *a4 = 1;
  }
  else
  {
    v4 = result;
    result = objc_msgSend(a3, "numberOfSprites");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) += result;
  }
  return result;
}

__n128 __61__PXGSublayoutDataStore_moveSublayoutsFromIndexes_toIndexes___block_invoke(_QWORD *a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __n128 result;

  v3 = a2 + a3;
  if (v3 > a2)
  {
    v4 = v3 - a2;
    v5 = 16 * a2;
    v6 = 136 * a2;
    do
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6];
      v8 = *(_QWORD *)(a1[4] + 24);
      v9 = v8 + v6;
      v10 = v8 + 136 * v7;
      v11 = *(_OWORD *)(v10 + 64);
      v13 = *(_OWORD *)(v10 + 16);
      v12 = *(_OWORD *)(v10 + 32);
      *(_OWORD *)(v9 + 48) = *(_OWORD *)(v10 + 48);
      *(_OWORD *)(v9 + 64) = v11;
      *(_OWORD *)(v9 + 16) = v13;
      *(_OWORD *)(v9 + 32) = v12;
      v15 = *(_OWORD *)(v10 + 96);
      v14 = *(_OWORD *)(v10 + 112);
      v16 = *(_OWORD *)(v10 + 80);
      *(_QWORD *)(v9 + 128) = *(_QWORD *)(v10 + 128);
      *(_OWORD *)(v9 + 96) = v15;
      *(_OWORD *)(v9 + 112) = v14;
      *(_OWORD *)(v9 + 80) = v16;
      *(_OWORD *)v9 = *(_OWORD *)v10;
      v17 = *(_QWORD *)(a1[4] + 32);
      result = *(__n128 *)(v17 + 16 * v7);
      *(__n128 *)(v17 + v5) = result;
      ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v5 += 16;
      v6 += 136;
      --v4;
    }
    while (v4);
  }
  return result;
}

@end
